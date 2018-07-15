--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BfA only.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if GetBuildInfo and select(4, GetBuildInfo()) < 80000 then
    return
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Module init.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local addonName, TJ, _ = ...
local LibStub, DBG, CT, RT, Config, UI, UnitCache, SpellBook = LibStub, TJ.DBG, TJ.CT, TJ.RT, TJ.Config, TJ.UI, TJ.UnitCache, TJ.SpellBook

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Locals
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local BOOKTYPE_PET = BOOKTYPE_PET
local BOOKTYPE_SPELL = BOOKTYPE_SPELL
local FindSpellBookSlotBySpellID = FindSpellBookSlotBySpellID
local GetFlyoutInfo = GetFlyoutInfo
local GetFlyoutSlotInfo = GetFlyoutSlotInfo
local GetNumSpellTabs = GetNumSpellTabs
local GetSpellBookItemInfo = GetSpellBookItemInfo
local GetSpellBookItemName = GetSpellBookItemName
local GetSpellInfo = GetSpellInfo
local GetSpellLink = GetSpellLink
local GetSpellTabInfo = GetSpellTabInfo
local HasPetSpells = HasPetSpells
local IsPassiveSpell = IsPassiveSpell
local IsPlayerSpell = IsPlayerSpell
local IsTalentSpell = IsTalentSpell
local PetHasSpellbook = PetHasSpellbook
local pcall = pcall
local tonumber = tonumber

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sandbox
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
LibStub('LibTJSandbox-8.0'):Use(addonName)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SpellBook Iteration
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
do
    local function collectReturnInfoForSpell(spellID, spellBookSlotID, bookType, isOffSpec)
        local ok, spellName, _, spellIcon, castTime, _, _, spellID = pcall(GetSpellInfo, spellID)
        if not ok then return nil end

        local spellSubText, spellIsTalent = '', nil
        if spellBookSlotID then
            local ok, _, spellSubText = pcall(GetSpellBookItemName, spellBookSlotID, bookType)
            if not ok then return nil end

            local ok, spellIsTalent = pcall(IsTalentSpell, spellBookSlotID, bookType)
            if not ok then return nil end
        end
        spellIsTalent = spellIsTalent and true or false

        local ok, isPassive = pcall(IsPassiveSpell, spellID)
        if not ok then return nil end
        isPassive = isPassive and true or false

        local ok, isPlayerSpell = pcall(IsPlayerSpell, spellID)
        if not ok then return nil end
        isPlayerSpell = isPlayerSpell and true or false

        -- The return values returned by the iterator function:
        return spellID, spellName, spellSubText, spellBookSlotID, spellIsTalent, spellIcon, castTime, isPassive, isOffSpec, isPlayerSpell
    end

    local function playerSpellbookDispatch(state)
        local _, _, offset, numSpells, _, offSpecID = GetSpellTabInfo(state.tab)
        local tabLastIndex = offset + numSpells
        local isOffSpec = (offSpecID ~= 0)

        if state.mode == "SPELL" then -- Normal spellbook mode
            state.index = state.index + 1
            state.spellBookIndex = offset + state.index

            -- Check if we've reached the end of the current tab
            if state.spellBookIndex > tabLastIndex then
                state.tab = state.tab + 1
                state.index = 0
                if state.tab > GetNumSpellTabs() then return nil end
                return playerSpellbookDispatch(state)
            end

            -- Work out what to do with the current slot
            local skillType, spellBookID = GetSpellBookItemInfo(state.spellBookIndex, BOOKTYPE_SPELL)

            -- If it's a flyout swap modes and proceed
            if skillType == "FLYOUT" then
                state.mode = "FLYOUT"
                state.flyoutIndex = 0
                return playerSpellbookDispatch(state)
            end

            -- Get the link for this entry
            local link = GetSpellLink(state.spellBookIndex, BOOKTYPE_SPELL)

            -- If there's no link, skip this one
            if not link then return playerSpellbookDispatch(state) end

            -- Get the spellID for the current slot, and return the data associated with it
            local spellID = tonumber(link:match('Hspell:(%d+)')) or -1

            -- If we had a bad spellID, skip this one
            if not spellID or spellID < 0 then
                return playerSpellbookDispatch(state)
            end

            -- Return the spell info
            return collectReturnInfoForSpell(spellID, state.spellBookIndex, BOOKTYPE_SPELL, isOffSpec)
        elseif state.mode == "FLYOUT" then -- Flyout mode
            local _, spellBookID = GetSpellBookItemInfo(state.spellBookIndex, BOOKTYPE_SPELL)
            local _, _, numSlots = GetFlyoutInfo(spellBookID)
            state.flyoutNumSlots = numSlots
            state.flyoutIndex = state.flyoutIndex + 1

            -- Check if we've exceeded this flyout
            if state.flyoutIndex > numSlots then
                -- Drop back to "SPELL" mode so that we iterate over the spellbook IDs again
                state.mode = "SPELL"
                -- Advance to next spell slot
                return playerSpellbookDispatch(state)
            end

            -- Get the spellID for this current flyout slot, and return the data associated with it
            local spellID = GetFlyoutSlotInfo(spellBookID, state.flyoutIndex)
            if spellID and spellID > 0 then
                local spellBookSlotID = FindSpellBookSlotBySpellID(spellID)
                return collectReturnInfoForSpell(spellID, spellBookSlotID, BOOKTYPE_SPELL, isOffSpec)
            end
        end
    end

    local function petSpellbookDispatcher(state)
        -- No pet spells, drop out
        if not HasPetSpells() or not PetHasSpellbook() then
            return nil
        end

        -- Get the info for this spell slot
        state.index = state.index + 1
        local skillType, spellBookId = GetSpellBookItemInfo(state.index, BOOKTYPE_PET)

        -- Nothiing found, drop out
        if not skillType then return nil end

        -- Not a pet action, skip this one
        if skillType ~= "PETACTION" then return petSpellbookDispatcher(state) end

        -- Get the link for this entry
        local link = GetSpellLink(state.index, BOOKTYPE_PET)

        -- If there's no link, skip this one
        if not link then return petSpellbookDispatcher(state) end

        -- Get the spellID for the current slot, and return the data associated with it
        local spellID = tonumber(link:match('Hspell:(%d+)')) or -1
        if spellID and spellID > 0 then
            return collectReturnInfoForSpell(spellID, state.index, BOOKTYPE_PET, false)
        end
    end

    function SpellBook:Iterate(bookType, tmpTable, tableFactory, tableDestroyer)
        tableFactory = tableFactory or CT or function() return {} end
        tableDestroyer = tableDestroyer or RT or function() end
        local state = tmpTable or tableFactory()
        state.tableFactory = tableFactory
        state.tableDestroyer = tableDestroyer
        state.index = 0
        state.tab = 1
        state.mode = "SPELL"
        local dispatcher = (bookType == BOOKTYPE_PET) and petSpellbookDispatcher or playerSpellbookDispatch
        return dispatcher, state
    end
end
