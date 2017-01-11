local addonName, internal = ...;
local TJ = internal.TJ
local Debug = internal.Debug
local fmt = internal.fmt

local LSD = LibStub("LibSerpentDump")

local BOOKTYPE_PET = BOOKTYPE_PET
local BOOKTYPE_SPELL = BOOKTYPE_SPELL
local DECIMAL_SEPERATOR = DECIMAL_SEPERATOR
local LARGE_NUMBER_SEPERATOR = LARGE_NUMBER_SEPERATOR
local co_yield = coroutine.yield
local real_G = _G
local mfloor = math.floor
local pairs = pairs
local select = select
local tconcat = table.concat
local tcontains = tContains
local tinsert = table.insert
local tonumber = tonumber
local type = type
local CreateFrame = CreateFrame
local GetActiveSpecGroup = GetActiveSpecGroup
local GetBuildInfo = GetBuildInfo
local GetFlyoutInfo = GetFlyoutInfo
local GetFlyoutSlotInfo = GetFlyoutSlotInfo
local GetLocale = GetLocale
local GetMaxTalentTier = GetMaxTalentTier
local GetNumSpellTabs = GetNumSpellTabs
local GetSpecialization = GetSpecialization
local GetSpecializationInfo = GetSpecializationInfo
local GetSpellBaseCooldown = GetSpellBaseCooldown
local GetSpellBookItemInfo = GetSpellBookItemInfo
local GetSpellBookItemName = GetSpellBookItemName
local GetSpellInfo = GetSpellInfo
local GetSpellTabInfo = GetSpellTabInfo
local GetTalentInfo = GetTalentInfo
local GetTalentInfoBySpecialization = GetTalentInfoBySpecialization
local IsPassiveSpell = IsPassiveSpell
local IsRightAltKeyDown = IsRightAltKeyDown
local IsRightControlKeyDown = IsRightControlKeyDown
local IsRightShiftKeyDown = IsRightShiftKeyDown
local IsTalentSpell = IsTalentSpell
local LearnTalent = LearnTalent
local C_ArtifactUI = C_ArtifactUI

internal.Safety()

------------------------------------------------------------------------------------------------------------------------
-- Spellbook iteration
------------------------------------------------------------------------------------------------------------------------

local IteratePlayerSpells, IteratePetSpells
do
    -- Forward declarations
    local iterateFlyout, iterateSlots, iterateTabs

    iterateFlyout = function(state)
        while state.flyoutSlotIdx <= state.numFlyoutSlots do
            local spellID, _, spellKnown, spellName = GetFlyoutSlotInfo(state.flyoutID, state.flyoutSlotIdx)
            state.flyoutSlotIdx = state.flyoutSlotIdx + 1
            if spellKnown then
                return spellID, spellName
            end
        end
        state.slotIdx = state.slotIdx + 1
        state.currentIterator = iterateSlots
        return state:currentIterator()
    end

    iterateSlots = function (state)
        while state.slotIdx <= state.numSlots do
            local spellBookItem = state.slotOffset + state.slotIdx
            local spellName, _, icon, castTime, _, _, spellID = GetSpellInfo(spellBookItem, state.booktype)
            local _, spellSubtext = GetSpellBookItemName(spellBookItem, state.booktype)
            local spellType, spellBookSpellId = GetSpellBookItemInfo(spellBookItem, state.booktype)
            local isTalent = IsTalentSpell(spellBookItem, state.booktype)
            if spellType == "SPELL" and not IsPassiveSpell(spellID) then
                state.slotIdx = state.slotIdx + 1
                return spellID, spellName, spellSubtext, spellBookItem, isTalent, icon, castTime
            elseif spellType == "FLYOUT" then
                local _, _, numFlyoutSlots, flyoutKnown = GetFlyoutInfo(spellBookSpellId)
                if flyoutKnown then
                    state.flyoutID = spellBookSpellId
                    state.flyoutSlotIdx = 1
                    state.numFlyoutSlots = numFlyoutSlots
                    state.currentIterator = iterateFlyout
                    return state:currentIterator()
                end
            end
            state.slotIdx = state.slotIdx + 1
        end
        state.tabIdx = state.tabIdx + 1
        state.currentIterator = iterateTabs
        return state:currentIterator()
    end

    iterateTabs = function (state)
        while state.tabIdx <= state.numOfTabs do
            local _, _, slotOffset, numSlots, _, offSpecID = GetSpellTabInfo(state.tabIdx)
            if offSpecID ~= 0 then
                state.tabIdx = state.tabIdx + 1
            else
                state.slotOffset = slotOffset
                state.numSlots = numSlots
                state.slotIdx = 1
                state.currentIterator = iterateSlots
                return state:currentIterator()
            end
        end
        return nil
    end

    local function dispatch(state)
        return state:currentIterator()
    end

    IteratePlayerSpells = function()
        local state = {}
        state.tabIdx = 1
        state.booktype = BOOKTYPE_SPELL
        state.numOfTabs = GetNumSpellTabs()
        state.currentIterator = iterateTabs
        return dispatch, state
    end

    IteratePetSpells = function()
        local state = {}
        state.tabIdx = 1
        state.booktype = BOOKTYPE_PET
        state.numOfTabs = GetNumSpellTabs()
        state.currentIterator = iterateTabs
        return dispatch, state
    end
end

------------------------------------------------------------------------------------------------------------------------
-- Retrieve all abilities from the spellbook
------------------------------------------------------------------------------------------------------------------------

local lastExportedSpecialisation = nil
local definedAbilities = {}
local function slug(name)
    if GetLocale() ~= "enUS" then return name end -- Slug names are only relevant for en-US, other locales are internally matched by spellID anyway
    return name:lower():gsub(' ','_'):gsub('[^%a%d_]','')
end
local blacklistedExportedAbilities = {
    'arcane_torrent',
    'auto_attack',
    'honorable_medallion',
    'mobile_banking',
    'path_of_the_black_ox',
    'path_of_the_jade_serpent',
    'path_of_the_mogu_king',
    'path_of_the_necromancer',
    'path_of_the_scarlet_blade',
    'path_of_the_scarlet_mitre',
    'path_of_the_setting_sun',
    'path_of_the_shadopan',
    'path_of_the_stout_brew',
    'quaking_palm',
    'revive_battle_pets',
    'zen_pilgrimage',
    'zen_pilgrimage_return',
}

function TJ:DetectAbilitiesFromSpellBook()
    local abilities = {}

    -- Helper to work out the 'simulationcraft-ified' name for the spell
    -- Iterate over the spellbook, collecting all the abilities
    for spellID, spellName, spellSubText, spellBookItem, spellIsTalent, spellIcon in IteratePlayerSpells() do
        if spellID and spellName then
            abilities[slug(spellName)] = {
                Name = spellName,
                SpellIDs = { spellID },
                KeyedSpellIDs = { [spellID] = true },
                SpellBookSubtext = spellSubText,
                SpellBookItem = spellBookItem,
                IsTalent = spellIsTalent,
                SpellBookSpellID = spellID,
                Icon = spellIcon,
                SpellBookCaster = 'player'
            }
        end
    end

    for spellID, spellName, spellSubText, spellBookItem, spellIsTalent, spellIcon in IteratePetSpells() do
        if spellID and spellName then
            abilities[slug(spellName)] = {
                Name = spellName,
                SpellIDs = { spellID },
                KeyedSpellIDs = { [spellID] = true },
                SpellBookSubtext = spellSubText,
                SpellBookItem = spellBookItem,
                IsTalent = spellIsTalent,
                SpellBookSpellID = spellID,
                Icon = spellIcon,
                SpellBookCaster = 'pet'
            }
        end
    end

    -- Detect talents, update values accordingly
    for tier=1,7 do
        for column=1,3 do
            local talentID, name = GetTalentInfo(tier, column, GetActiveSpecGroup())
            if talentID and name then
                abilities[slug(name)] = abilities[slug(name)] or {}
                abilities[slug(name)].TalentID = talentID
                abilities[slug(name)].IsTalent = true
            end
        end
    end

    -- Merge the abilities with the full list, so that we can export later on
    definedAbilities = self:MergeTables(abilities, definedAbilities)

    return abilities
end

local function GeneratePermutations(entries, count)
    if count <= 1 then
        local ret = {}
        for k,v in pairs(entries) do
            ret[1+#ret] = { v }
        end
        return ret
    else
        local ret = {}
        local children = GeneratePermutations(entries, count-1)
        for _,child in pairs(children) do
            for _,entry in pairs(entries) do
                local thisEntry = {}
                for _,e in pairs(child) do
                    thisEntry[1+#thisEntry] = e
                end
                thisEntry[1+#thisEntry] = entry
                ret[1+#ret] = thisEntry
            end
        end
        return ret
    end
end

function TJ:ExportAbilitiesFromSpellBook(runAllPossibleCombinations)
    -- Get the currently-active talents
    local specID = GetSpecialization()
    local talents = {}
    for k=1,GetMaxTalentTier() do
        talents[k] = select(10, GetTalentInfoBySpecialization(specID, k, 1)) and 1
            or select(10, GetTalentInfoBySpecialization(specID, k, 2)) and 2
            or select(10, GetTalentInfoBySpecialization(specID, k, 3)) and 3
    end

    -- Clear out the defined abilities if we're exporting a different specialisation
    if lastExportedSpecialisation ~= specID then
        definedAbilities = {}
        lastExportedSpecialisation = specID
    end

    self:ExecuteFuncAsCoroutine(function()
        local canceled = false
        -- Swap all talents to generate all spell information
        if runAllPossibleCombinations then
            local allPermutations = GeneratePermutations({1,2,3}, GetMaxTalentTier())
            for perm=1,#allPermutations do
                for i=1,GetMaxTalentTier() do
                    LearnTalent(GetTalentInfoBySpecialization(specID, i, allPermutations[perm][i]))
                end
                TJ:DetectAbilitiesFromSpellBook()
                co_yield()
                TJ:DetectAbilitiesFromSpellBook()
                co_yield()

                if IsRightShiftKeyDown() and IsRightControlKeyDown() and IsRightAltKeyDown() then
                    canceled = true
                    break
                end
            end
        else
            for row=1,GetMaxTalentTier() do
                for column=1,3 do
                    if column ~= talents[row] then
                        LearnTalent(GetTalentInfoBySpecialization(specID, row, column))
                        TJ:DetectAbilitiesFromSpellBook()
                        co_yield()
                        TJ:DetectAbilitiesFromSpellBook()
                        co_yield()
                    end
                end

                if IsRightShiftKeyDown() and IsRightControlKeyDown() and IsRightAltKeyDown() then
                    canceled = true
                    break
                end
            end
        end

        -- Restore original talents
        for row=1,GetMaxTalentTier() do
            LearnTalent(GetTalentInfoBySpecialization(specID, row, talents[row]))
            TJ:DetectAbilitiesFromSpellBook()
            co_yield()
            TJ:DetectAbilitiesFromSpellBook()
            co_yield()
        end

        -- Show the spell export window
        if not canceled then
            TJ:ShowSpellExportWindow()
        end
    end)
end

function TJ:ShowSpellExportWindow()
    -- Build the string
    local export = ''
    local addline = function(...)
        export = fmt("%s\n%s", export, fmt(...))
    end

    local gameVersion = GetBuildInfo()

    -- Ability IDs
    addline("-- exported with /tj _esd")
    addline("local %s_abilities_exported = {}", select(2, GetSpecializationInfo(GetSpecialization())):lower())
    addline("if TJ:MatchesBuild('%s', '%s') then", gameVersion, gameVersion)
    addline("    %s_abilities_exported = {", select(2, GetSpecializationInfo(GetSpecialization())):lower())
    for k,v in internal.orderedpairs(definedAbilities) do
        if not tcontains(blacklistedExportedAbilities, k) then
            local line = fmt('        %s = { ', k)
            if v.KeyedSpellIDs then
                local ids = {}
                for id in internal.orderedpairs(v.KeyedSpellIDs) do
                    ids[1+#ids] = id
                end
                line = line .. fmt('SpellIDs = { %s }, ', tconcat(ids, ", "))
            end
            if v.TalentID then line = line .. fmt('TalentID = %d, ', v.TalentID) end
            line = line .. '},'
            addline(line)
        end
    end
    addline("    }")
    addline("end")
    addline("")

    -- Display the exported data
    self:OpenDebugWindow(addonName .. ' Actions Data Export', export)
end

------------------------------------------------------------------------------------------------------------------------
-- Spell info from tooltip
------------------------------------------------------------------------------------------------------------------------

local tts = CreateFrame('GameTooltip', fmt('%sTooltipScanner', addonName))
local ttsl1 = tts:CreateFontString('$parentTextLeft1', nil, "GameTooltipText")
local ttsr1 = tts:CreateFontString('$parentTextRight1', nil, "GameTooltipText")
tts:AddFontStrings(ttsl1, ttsr1)
tts:SetOwner(UIParent, "ANCHOR_NONE")

function TJ:GetTooltipEntries(link)
    tts:SetOwner(UIParent, "ANCHOR_NONE")
    tts:ClearLines()
    tts:SetHyperlink(link)
    local tooltipName = tts:GetName()
    local entries = {}

    local function checkadd(x)
        local frm = real_G[tooltipName..x]
        local errfun = function(e)
            internal.error(fmt('Could not retrieve info from frame "%s", %s', tooltipName..x, e), fmt('Could not retrieve info from frame "%s", %s', tooltipName..x, e))
        end
        if type(frm) == 'nil' then
            errfun('Frame was nil')
        else
            local xt = frm:GetText()
            if xt ~= "" then
                local e = { t = xt or "", c = {frm:GetTextColor()} }
                e.cb = { mfloor(e.c[1]*256), mfloor(e.c[2]*256), mfloor(e.c[3]*256) }
                entries[1+#entries] = e
            end
        end
    end

    for i = 1, tts:NumLines() do
        checkadd('TextLeft'..i)
        checkadd('TextRight'..i)
    end

    return entries
end

local function IsGreen(colour) -- work out if it's increased by haste
    return colour[1] == 0 and colour[2] == 255 and colour[3] == 0 and true
end

local PowerTypes = { 'mana', 'energy', 'chi', 'pain', 'fury', 'rune', 'runic_power', 'rage', 'soul_shards' }
local PowerSuffixes = { '_COST', '_COST_PER_TIME', '_COST_PER_TIME_NO_BASE', '_COST_PCT' }
local PowerPatterns = {}
for _,v in pairs(PowerTypes) do
    for _,s in pairs(PowerSuffixes) do
        local b = v:upper() .. s
        if real_G[b] then
            local t = real_G[b]
            t = t:gsub('%%s', '([.,%%d]+)')

            local placeholder = '____PLACEHOLDER____'
            local A, B
            t = t:gsub('|4([^:]+):([^;]+);', function(a, b) -- (a or b - "|4aaa:bbb;")
                A, B = a, b
                return placeholder
            end)
            if A then
                PowerPatterns[1+#PowerPatterns] = { b:gsub('_COST',''):lower(), '^' .. t:gsub(placeholder,A) .. '$'}
                PowerPatterns[1+#PowerPatterns] = { b:gsub('_COST',''):lower(), '^' .. t:gsub(placeholder,B) .. '$'}
            else
                PowerPatterns[1+#PowerPatterns] = { b:gsub('_COST',''):lower(), '^' .. t .. '$'}
            end
        end
    end
end
internal.PowerPatterns = PowerPatterns

local DurationChecks = { 'days', 'hours', 'min', 'sec' }
local DurationMultiplier = { days = 86400, hours = 3600, min = 60, sec = 1 }
local CooldownPatterns = {}
local RechargePatterns = {}
for _,v in pairs(DurationChecks) do
    local b = 'SPELL_RECAST_TIME_' .. v:upper()
    if real_G[b] then
        local t = real_G[b]
        t = t:gsub('%%.3g', '([.,%%d]+)')

        local placeholder = '____PLACEHOLDER____'
        local A, B
        t = t:gsub('|4([^:]+):([^;]+);', function(a, b) -- (a or b - "|4aaa:bbb;")
            A, B = a, b
            return placeholder
        end)
        if A then
            CooldownPatterns[1+#CooldownPatterns] = { v, '^' .. t:gsub(placeholder,A) .. '$'}
            CooldownPatterns[1+#CooldownPatterns] = { v, '^' .. t:gsub(placeholder,B) .. '$'}
        else
            CooldownPatterns[1+#CooldownPatterns] = { v, '^' .. t .. '$'}
        end
    end
    b = 'SPELL_RECAST_TIME_CHARGES_' .. v:upper()
    if real_G[b] then
        local t = real_G[b]
        t = t:gsub('%%.3g', '([.,%%d]+)')

        local placeholder = '____PLACEHOLDER____'
        local A, B
        t = t:gsub('|4([^:]+):([^;]+);', function(a, b) -- (a or b - "|4aaa:bbb;")
            A, B = a, b
            return placeholder
        end)
        if A then
            RechargePatterns[1+#RechargePatterns] = { v, '^' .. t:gsub(placeholder,A) .. '$'}
            RechargePatterns[1+#RechargePatterns] = { v, '^' .. t:gsub(placeholder,B) .. '$'}
        else
            RechargePatterns[1+#RechargePatterns] = { v, '^' .. t .. '$'}
        end
    end
end
internal.CooldownPatterns = CooldownPatterns
internal.RechargePatterns = RechargePatterns

function TJ:GetSpellCost(spellID)
    local entries = self:GetTooltipEntries(fmt('|cff71d5ff|Hspell:%d|h[spell%d]|h|r', spellID))
    for _,e in pairs(entries) do
        for k,v in pairs(PowerPatterns) do
            local a, b, c = e.t:match(v[2])
            -- strip non-digit and convert to number
            if a then a = a:gsub('%D', '') + 0 end
            if b then b = b:gsub('%D', '') + 0 end
            if c then c = c:gsub('%D', '') + 0 end
            if a then
                return v[1], a, b, c --, { result = { a, b, c }, matchtext = e.t, pattern = v }
            end
        end
    end
end

local function split(str, delim)
    local t = {}
    local function helper(s) tinsert(t, s) return "" end
    helper((str:gsub("(.-)"..delim, helper)))
    return t
end

local function extract_number(str)
    local str = str:gsub('[^,%.%d]', '')
    local reconv = { ['.'] = '%.', [','] = ',', [' '] = '%s' }
    local vals = split(str, '['..reconv[DECIMAL_SEPERATOR]..']')
    vals[1] = LARGE_NUMBER_SEPERATOR and LARGE_NUMBER_SEPERATOR:len() > 0 and vals[1]:gsub('['..reconv[LARGE_NUMBER_SEPERATOR]..']', '') or vals[1]
    vals[2] = '0.' .. (vals[2] or '0')
    return tonumber(vals[1]) + tonumber(vals[2])
end

local function get_spell_cooldown_or_recharge(spellID, patterns)
    local entries = TJ:GetTooltipEntries(fmt('spell:%d', spellID))
    for _,e in pairs(entries) do
        for k,v in pairs(patterns) do
            local r = e.t:match(v[2])
            if r then
                return extract_number(r) * DurationMultiplier[v[1]], IsGreen(e.cb) --, { result = r, matchtext = e.t, pattern = v }
            end
        end
    end
    return 0
end

function TJ:GetSpellCooldown(spellID)
    return get_spell_cooldown_or_recharge(spellID, CooldownPatterns)
end

function TJ:GetSpellRechargeTime(spellID)
    return get_spell_cooldown_or_recharge(spellID, RechargePatterns)
end

-- /dump tj:ScanTooltip('spell:188501', function(t) print(t) end, nil, { 255, 210, 0 })
function TJ:ScanTooltip(link, callback, pattern, colour)
    local entries = self:GetTooltipEntries(link)
    local function patternmatch(str, pattern)
        return pattern and type(pattern) == 'string' and str:match(pattern) and true or false
    end
    local function colourmatch(c1, c2)
        return c2 and type(c2) == 'table' and #c2 == 3 and c1[1] == c2[1] and c1[2] == c2[2] and c1[3] == c2[3] and true or false
    end
    for _,e in pairs(entries) do
        if patternmatch(e.t, pattern) and colourmatch(e.cb, colour) then
            callback(e.t, e.cb)
        elseif patternmatch(e.t, pattern) and colour == nil then
            callback(e.t, e.cb)
        elseif pattern == nil and colourmatch(e.cb, colour) then
            callback(e.t, e.cb)
        end
    end
end
