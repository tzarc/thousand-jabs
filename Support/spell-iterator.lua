local SpellBookIterator
do
    local function collectReturnInfoForSpell(spellID, spellBookSlotID, bookType, isOffSpec)
        if not spellBookSlotID then
            local ok, spellBookSlotID = pcall(FindSpellBookSlotBySpellID, spellID)
        end

        local ok, spellName, _, icon, castTime, _, _, spellID = pcall(GetSpellInfo, spellID)
        if not ok then return nil end

        local spellSubtext, isTalent = '', nil
        if spellBookSlotID then
            local ok, _, spellSubtext = pcall(GetSpellBookItemName, spellBookSlotID, bookType)
            if not ok then return nil end

            local ok, isTalent = pcall(IsTalentSpell, spellBookSlotID, bookType)
            if not ok then return nil end
        end
        isTalent = isTalent and true or false

        local ok, isPassive = pcall(IsPassiveSpell, spellID)
        if not ok then return nil end
        isPassive = isPassive and true or false

        local ok, isPlayerSpell = pcall(IsPlayerSpell, spellID)
        if not ok then return nil end
        isPlayerSpell = isPlayerSpell and true or false

        return bookType, spellID, spellName, spellSubtext, spellBookSlotID, isTalent, icon, castTime, isPassive, isOffSpec, isPlayerSpell
    end

    local function spellIteratorDispatch(state)
        if state.BookType == BOOKTYPE_SPELL then
            -- Get the overall tab information
            local _, _, offset, numSpells, _, offSpecID = GetSpellTabInfo(state.Tab)
            state.TabLastIndex = offset + numSpells
            state.TabIsOffSpec = (offSpecID ~= 0)

            if state.Mode == "SPELL" then -- In "SPELL" mode, iterate over the slots
                state.Index = state.Index + 1
                state.SpellBookIndex = offset + state.Index

                -- Check if we've exceeded the number of slots in this tab...
                if state.SpellBookIndex > state.TabLastIndex then
                    state.Tab = state.Tab + 1
                    state.Index = 0
                    -- ...check if we've exceeded the total number of tabs...
                    if state.Tab > GetNumSpellTabs() then return nil end
                    -- ...otherwise advance to next tab's first slot
                    return spellIteratorDispatch(state)
                end

                -- Work out what to do with the current slot
                local skillType, spellBookID = GetSpellBookItemInfo(state.SpellBookIndex, BOOKTYPE_SPELL)
                if skillType == "SPELL" then -- If it's a spell, then we retrieve the information
                    local link = GetSpellLink(state.SpellBookIndex, BOOKTYPE_SPELL)
                    -- If there's no link, then advance to the next slot
                    if not link then return spellIteratorDispatch(state) end
                    -- Get the spellID for the current slot, and return the data associated with it
                    local spellID = tonumber(link:match('Hspell:(%d+)')) or - 1
                    if spellID and spellID > 0 then
                        return collectReturnInfoForSpell(spellID, state.SpellBookIndex, BOOKTYPE_SPELL, state.TabIsOffSpec)
                    end
                elseif skillType == "FLYOUT" then -- Current slot is a flyout, need to swap to flyout mode and iterate over its slots instead
                    state.Mode = "FLYOUT"
                    state.FlyoutIndex = 0
                    -- Advance to first flyout slot
                    return spellIteratorDispatch(state)
                end

            elseif state.Mode == "FLYOUT" then -- In "FLYOUT" mode, keep the same spellbook slot, iterate over the flyout slots
                local _, spellBookID = GetSpellBookItemInfo(state.SpellBookIndex, BOOKTYPE_SPELL)
                local _, _, numSlots = GetFlyoutInfo(spellBookID)
                state.FlyoutNumSlots = numSlots
                state.FlyoutIndex = state.FlyoutIndex + 1

                -- Check if we've exceeded this flyout
                if state.FlyoutIndex > numSlots then
                    -- Drop back to "SPELL" mode so that we iterate over the spellbook IDs again
                    state.Mode = "SPELL"
                    -- Clear out the flyout fields
                    state.FlyoutIndex = nil
                    state.FlyoutNumSlots = nil
                    -- Advance to next spell slot
                    return spellIteratorDispatch(state)
                end

                -- Get the spellID for this current flyout slot, and return the data associated with it
                local spellID = GetFlyoutSlotInfo(spellBookID, state.FlyoutIndex)
                if spellID and spellID > 0 then
                    return collectReturnInfoForSpell(spellID, nil, BOOKTYPE_SPELL, state.TabIsOffSpec)
                end
            end

            -- Anything else, just advance to the next slot
            return spellIteratorDispatch(state)

        elseif state.BookType == BOOKTYPE_PET then
            if not HasPetSpells() or not PetHasSpellbook() then
                return nil
            end

            -- Work out what type of slot we're dealing with
            state.Index = state.Index + 1
            local skillType, spellBookID = GetSpellBookItemInfo(state.Index, BOOKTYPE_PET)
            if not skillType then
                return nil
            end

            -- We're only interested in pet actions
            if skillType == "PETACTION" then
                local link = GetSpellLink(state.Index, BOOKTYPE_PET)
                -- If there's no link, then advance to the next slot
                if not link then return spellIteratorDispatch(state) end
                -- Get the spellID for the current slot, and return the data associated with it
                local spellID = tonumber(link:match('Hspell:(%d+)')) or - 1
                if spellID and spellID > 0 then
                    return collectReturnInfoForSpell(spellID, state.Index, BOOKTYPE_PET, false)
                end
            end

            -- Anything else, just advance to the next slot
            return spellIteratorDispatch(state)
        else
            return nil
        end
    end

    SpellBookIterator = function(bookType, state)
        local st = state or {}
        st.Tab = 1
        st.Index = 0
        st.BookType = bookType
        st.Mode = "SPELL"
        return spellIteratorDispatch, st
    end
end

print('###########################')
local st = {}
for bookType, spellID, spellName, spellSubtext, spellBookSlotID, isTalent, icon, castTime, isPassive, isOffSpec, isPlayerSpell in SpellBookIterator(BOOKTYPE_SPELL, st) do
    if spellBookSlotID ~= nil and not isOffSpec then
        print(('%7d -- |T%d:0|t %-40s -- slotID: %3d -- %s'):format(spellID, icon, spellName, spellBookSlotID, bookType))
    end
end
for bookType, spellID, spellName, spellSubtext, spellBookSlotID, isTalent, icon, castTime, isPassive, isOffSpec, isPlayerSpell in SpellBookIterator(BOOKTYPE_PET, st) do
    if spellBookSlotID ~= nil and not isOffSpec then
        print(('%7d -- |T%d:0|t %-40s -- slotID: %3d -- %s'):format(spellID, icon, spellName, spellBookSlotID, bookType))
    end
end

print(GetTime())
