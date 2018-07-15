--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BfA only.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if GetBuildInfo and select(4, GetBuildInfo()) < 80000 then
    return
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local addonName = ...
local LibStub = LibStub
local lib, oldminor = LibStub:NewLibrary("LibSpellData", 1)

local _G = _G
local BOOKTYPE_PET = BOOKTYPE_PET
local BOOKTYPE_SPELL = BOOKTYPE_SPELL
local CreateFrame = CreateFrame
local debugprofilestop = debugprofilestop
local FindSpellBookSlotBySpellID = FindSpellBookSlotBySpellID
local GetAddOnMemoryUsage = GetAddOnMemoryUsage
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
local mfloor = math.floor
local pairs = pairs
local pcall = pcall
local PetHasSpellbook = PetHasSpellbook
local print = print
local setmetatable = setmetatable
local tinsert = table.insert
local tonumber = tonumber
local type = type
local UpdateAddOnMemoryUsage = UpdateAddOnMemoryUsage
local wipe = wipe

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Common
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local DurationMultiplier = { days = 86400, hours = 3600, min = 60, sec = 1 }
local RegexPatterns = setmetatable({ ['.'] = '%.', [' '] = '%s' }, { __index = function(tbl, idx) return idx end })
local PowerPatterns = {}
local CooldownPatterns = {}
local RechargePatterns = {}

local removeLNS, extractNumber
do
    removeLNS = function(txt)
        return type(txt) == "string" and LARGE_NUMBER_SEPERATOR:len() > 0 and txt:gsub(RegexPatterns[LARGE_NUMBER_SEPERATOR], '') or txt
    end

    local function splitString(str, delim, outputTable)
        local pos = 0
        while true do
            local idx = str:find(delim, pos, true)
            if idx ~= nil then
                tinsert(outputTable, str:sub(pos, idx - 1))
                pos = idx + delim:len()
            else
                tinsert(outputTable, str:sub(pos))
                break
            end
        end
    end

    local tmp = {}
    extractNumber = function(str)
        wipe(tmp)
        local str = str:gsub('[^,%.%d]', '')
        splitString(str, RegexPatterns[DECIMAL_SEPERATOR], tmp)
        tmp[1] = removeLNS(tmp[1])
        tmp[2] = '0.' .. (tmp[2] or '0')
        return (tonumber(tmp[1]) + tonumber(tmp[2]))
    end
end

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
                    local spellBookSlotID = FindSpellBookSlotBySpellID(spellID)
                    return collectReturnInfoForSpell(spellID, spellBookSlotID, BOOKTYPE_SPELL, state.TabIsOffSpec)
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

    local tmpState = {}
    IterateSpellBook = function(bookType, tstate) -- use tstate if you need to call iterations in parallel - supply a temporary/disposable table
        local st = tstate or tmpState
        wipe(st)
        st.Tab = 1
        st.Index = 0
        st.BookType = bookType
        st.Mode = "SPELL"
        return spellIteratorDispatch, st
    end

    lib.IterateSpellBook = IterateSpellBook
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tooltip Scanning
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

do
    local tts = CreateFrame('GameTooltip', 'LibSpellDataTooltipScanner')
    tts:AddFontStrings(tts:CreateFontString('$parentTextLeft1', nil, "GameTooltipText"), tts:CreateFontString('$parentTextRight1', nil, "GameTooltipText"))
    tts:SetOwner(UIParent, "ANCHOR_NONE")

    local function tooltipIteratorDispatch(state)
        if state.Side == "Right" then
            state.Line = state.Line + 1
            state.Side = "Left"
        else
            state.Side = "Right"
        end

        -- If we've gone past the maximum number of lines, drop out
        if state.Line > tts:NumLines() then return nil end

        -- Work out the frame name and get the frame
        local fn = ('%sText%s%d'):format(tts:GetName(), state.Side, state.Line)
        local fr = _G[fn]

        -- If there's no frame, then advance to the next one
        if type(fr) == "nil" then return tooltipIteratorDispatch(state) end

        -- If there's no text, then advance to the next one
        local txt = fr:GetText()
        if type(txt) == "nil" then return tooltipIteratorDispatch(state) end

        -- We have a frame, we have text... get the colour and return it all to the iterator invoker
        local rf, gf, bf = fr:GetTextColor()
        local rb, gb, bb = mfloor(rf * 256), mfloor(gf * 256), mfloor(bf * 256)
        local hexColour = ('%02X%02X%02X'):format(rb, gb, bb)
        return txt, state.Line, state.Side:lower(), hexColour, rb, gb, bb, rf, gf, bf
    end

    local tmpState = {}
    IterateLinkTooltip = function(link, tstate) -- use tstate if you need to call iterations in parallel - supply a temporary/disposable table
        tts:SetOwner(UIParent, "ANCHOR_NONE")
        tts:ClearLines()
        tts:SetHyperlink(link)
        local st = tstate or tmpState
        wipe(st)
        st.Line = 0
        st.Side = "Right"
        return tooltipIteratorDispatch, st
    end

    lib.IterateLinkTooltip = IterateLinkTooltip
    lib.IterateSpellTooltip = function(spellID, tstate) return IterateLinkTooltip(('spell:%d'):format(spellID), tstate) end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Search Patterns
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

do
    local PowerTypes = { 'mana', 'energy', 'chi', 'pain', 'fury', 'rune', 'runic_power', 'rage', 'soul_shards', 'maelstrom', 'holy_power' }
    local PowerSuffixes = { '_COST', '_COST_PER_TIME', '_COST_PER_TIME_NO_BASE', '_COST_PCT' }
    local DurationChecks = { 'days', 'hours', 'min', 'sec' }
    local placeholder = '____PLACEHOLDER____'

    for _, v in pairs(PowerTypes) do
        for _, s in pairs(PowerSuffixes) do
            local b = v:upper() .. s
            if _G[b] then
                local t = _G[b]
                t = t:gsub('%%s', '([.,%%d]+)')
                t = removeLNS(t)

                local A, B
                t = t:gsub('|4([^:]+):([^;]+);', function(a, b) -- (a or b - "|4aaa:bbb;")
                    A, B = a, b
                    return placeholder
                end)
                if A then
                    PowerPatterns[1 + #PowerPatterns] = { name = b:gsub('_COST', ''):lower(), regex = '^' .. t:gsub(placeholder, A) .. '$'}
                    PowerPatterns[1 + #PowerPatterns] = { name = b:gsub('_COST', ''):lower(), regex = '^' .. t:gsub(placeholder, B) .. '$'}
                else
                    PowerPatterns[1 + #PowerPatterns] = { name = b:gsub('_COST', ''):lower(), regex = '^' .. t .. '$'}
                end
            end
        end
    end

    for _, v in pairs(DurationChecks) do
        local b = 'SPELL_RECAST_TIME_' .. v:upper()
        if _G[b] then
            local t = _G[b]
            t = t:gsub('%%.3g', '([.,%%d]+)')
            t = removeLNS(t)

            local A, B
            t = t:gsub('|4([^:]+):([^;]+);', function(a, b) -- (a or b - "|4aaa:bbb;")
                A, B = a, b
                return placeholder
            end)
            if A then
                CooldownPatterns[1 + #CooldownPatterns] = { duration = v, regex = '^' .. t:gsub(placeholder, A) .. '$'}
                CooldownPatterns[1 + #CooldownPatterns] = { duration = v, regex = '^' .. t:gsub(placeholder, B) .. '$'}
            else
                CooldownPatterns[1 + #CooldownPatterns] = { duration = v, regex = '^' .. t .. '$'}
            end
        end
        b = 'SPELL_RECAST_TIME_CHARGES_' .. v:upper()
        if _G[b] then
            local t = _G[b]
            t = t:gsub('%%.3g', '([.,%%d]+)')
            t = removeLNS(t)

            local placeholder = '____PLACEHOLDER____'
            local A, B
            t = t:gsub('|4([^:]+):([^;]+);', function(a, b) -- (a or b - "|4aaa:bbb;")
                A, B = a, b
                return placeholder
            end)
            if A then
                RechargePatterns[1 + #RechargePatterns] = { duration = v, regex = '^' .. t:gsub(placeholder, A) .. '$'}
                RechargePatterns[1 + #RechargePatterns] = { duration = v, regex = '^' .. t:gsub(placeholder, B) .. '$'}
            else
                RechargePatterns[1 + #RechargePatterns] = { duration = v, regex = '^' .. t .. '$'}
            end
        end
    end

    lib.Patterns = {}
    lib.Patterns.Regex = RegexPatterns
    lib.Patterns.Power = PowerPatterns
    lib.Patterns.Cooldown = CooldownPatterns
    lib.Patterns.Recharge = RechargePatterns
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Spell Cooldown/Recharge/Cost
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
do
    local function getCooldownOrRecharge(spellID, patterns)
        for text, _, _, hexColour in lib.IterateSpellTooltip(spellID) do
            -- Strip out the large number separators
            text = removeLNS(text)

            -- Loop through each of the patterns in an attempt to match
            for _, pattern in pairs(patterns) do
                local value = text:match(pattern.regex)
                if value then
                    -- Convert the number "2 days" into seconds ""
                    local numSeconds = extractNumber(value) * DurationMultiplier[pattern.duration]
                    -- check if it's green, i.e. Haste applies
                    local isAffectedByHaste = (hexColour == "00FF00") and true or false
                    -- Return the detected values
                    return numSeconds, isAffectedByHaste
                end
            end
        end
    end

    local GetSpellCooldown = function(spellID)
        return getCooldownOrRecharge(spellID, CooldownPatterns)
    end

    local GetSpellRechargeTime = function(spellID)
        return getCooldownOrRecharge(spellID, RechargePatterns)
    end

    local GetSpellCost = function(spellID)
        for text in lib.IterateSpellTooltip(spellID) do
            -- Strip out the large number separators
            text = removeLNS(text)

            -- Loop through each of the patterns in an attempt to match
            for _, pattern in pairs(PowerPatterns) do
                -- Perform the regex match and extract the numbers
                local a, b, c = text:match(pattern.regex)
                if a then a = extractNumber(a) end
                if b then b = extractNumber(b) end
                if c then c = extractNumber(c) end

                -- if we had at least one value, then return the appropriate data
                if a then
                    return pattern.name, a, b, c
                end
            end
        end
    end

    lib.GetSpellCooldown = GetSpellCooldown
    lib.GetSpellRechargeTime = GetSpellRechargeTime
    lib.GetSpellCost = GetSpellCost
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Memory Test
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

do
    local InternalMemoryTest = function()
        local LSD = LibStub("LibSpellData")
        local iterations = 100
        UpdateAddOnMemoryUsage()
        local beforeMem = GetAddOnMemoryUsage(addonName)
        local beforeTime = debugprofilestop()
        for i = 1, iterations do
            for spellID, spellName, spellSubText, spellBookSlotID, spellIsTalent, spellIcon, castTime, isPassive, isOffSpec, isPlayerSpell in LSD.IterateSpellBook(BOOKTYPE_SPELL) do
                if spellBookSlotID ~= nil and not isOffSpec then
                    local t, a, b, c = LSD.GetSpellCost(spellID)
                    local cd, cdh = LSD.GetSpellCooldown(spellID)
                    local rc, rch = LSD.GetSpellRechargeTime(spellID)
                end
            end

            if HasPetSpells() and PetHasSpellbook() then
                for spellID, spellName, spellSubText, spellBookSlotID, spellIsTalent, spellIcon, castTime, isPassive, isOffSpec, isPlayerSpell in LSD.IterateSpellBook(BOOKTYPE_PET) do
                    if spellBookSlotID ~= nil and not isOffSpec then
                        local t, a, b, c = LSD.GetSpellCost(spellID)
                        local cd, cdh = LSD.GetSpellCooldown(spellID)
                        local rc, rch = LSD.GetSpellRechargeTime(spellID)
                    end
                end
            end
        end
        local afterTime = debugprofilestop()
        UpdateAddOnMemoryUsage()
        local afterMem = GetAddOnMemoryUsage(addonName)
        print(('Time taken each run: %.3f msecs, Memory usage delta: %d bytes'):format((afterTime - beforeTime) / iterations, (afterMem - beforeMem) * 1024))
    end

    lib.InternalMemoryTest = InternalMemoryTest
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Example Usage
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local function LibSpellDataExample()
    local LSD = LibStub("LibSpellData")
    print('###########################')

    print("Player:")
    for spellID, spellName, spellSubText, spellBookSlotID, spellIsTalent, spellIcon, castTime, isPassive, isOffSpec, isPlayerSpell in LSD.IterateSpellBook(BOOKTYPE_SPELL) do
        if spellBookSlotID ~= nil and not isOffSpec then
            local t, a, b, c = LSD.GetSpellCost(spellID)
            local cd, cdh = LSD.GetSpellCooldown(spellID)
            local rc, rch = LSD.GetSpellRechargeTime(spellID)
            print(('%7d -- |T%d:0|t %-40s -- slotID: %3d -- cost: %s %s %s %s -- cooldown: %s %s -- recharge: %s %s'):format(spellID, spellIcon, spellName, spellBookSlotID, tostring(t), tostring(a), tostring(b), tostring(c), tostring(cd), tostring(cdh), tostring(rc), tostring(rch)))
        end
    end

    if HasPetSpells() and PetHasSpellbook() then
        print("Pet:")
        for spellID, spellName, spellSubText, spellBookSlotID, spellIsTalent, spellIcon, castTime, isPassive, isOffSpec, isPlayerSpell in LSD.IterateSpellBook(BOOKTYPE_PET) do
            if spellBookSlotID ~= nil and not isOffSpec then
                local t, a, b, c = LSD.GetSpellCost(spellID)
                local cd, cdh = LSD.GetSpellCooldown(spellID)
                local rc, rch = LSD.GetSpellRechargeTime(spellID)
                print(('%7d -- |T%d:0|t %-40s -- slotID: %3d -- cost: %s %s %s %s -- cooldown: %s %s -- recharge: %s %s'):format(spellID, spellIcon, spellName, spellBookSlotID, tostring(t), tostring(a), tostring(b), tostring(c), tostring(cd), tostring(cdh), tostring(rc), tostring(rch)))
            end
        end
    end

    print(GetTime())
    --LSD.InternalMemoryTest()
end
