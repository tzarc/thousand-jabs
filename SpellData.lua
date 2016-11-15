local addonName, internal = ...;
local TJ = internal.TJ
local Debug = internal.Debug
local fmt = internal.fmt

local BOOKTYPE_SPELL = BOOKTYPE_SPELL
local DECIMAL_SEPERATOR = DECIMAL_SEPERATOR
local LARGE_NUMBER_SEPERATOR = LARGE_NUMBER_SEPERATOR
local real_G = _G
local mfloor = math.floor
local pairs = pairs
local tinsert = table.insert
local tonumber = tonumber
local CreateFrame = CreateFrame
local GetActiveSpecGroup = GetActiveSpecGroup
local GetFlyoutInfo = GetFlyoutInfo
local GetFlyoutSlotInfo = GetFlyoutSlotInfo
local GetNumSpellTabs = GetNumSpellTabs
local GetSpellBookItemInfo = GetSpellBookItemInfo
local GetSpellBookItemName = GetSpellBookItemName
local GetSpellInfo = GetSpellInfo
local GetSpellTabInfo = GetSpellTabInfo
local GetTalentInfo = GetTalentInfo
local IsPassiveSpell = IsPassiveSpell
local IsTalentSpell = IsTalentSpell

internal.Safety()

------------------------------------------------------------------------------------------------------------------------
-- Spellbook iteration
------------------------------------------------------------------------------------------------------------------------

local IteratePlayerSpells
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
            local spellName, _, icon, castTime, _, _, spellID = GetSpellInfo(spellBookItem, BOOKTYPE_SPELL)
            local _, spellSubtext = GetSpellBookItemName(spellBookItem, BOOKTYPE_SPELL)
            local spellType, spellBookSpellId = GetSpellBookItemInfo(spellBookItem, BOOKTYPE_SPELL)
            local isTalent = IsTalentSpell(spellBookItem, BOOKTYPE_SPELL)
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
        state.numOfTabs = GetNumSpellTabs()
        state.currentIterator = iterateTabs
        return dispatch, state
    end
end

------------------------------------------------------------------------------------------------------------------------
-- Retrieve all abilities from the spellbook
------------------------------------------------------------------------------------------------------------------------

local definedAbilities = {}
local function slug(name) return name:lower():gsub(' ','_'):gsub('[^%a%d_]','') end

function TJ:DetectAbilitiesFromSpellBook()
    local abilities = {}

    -- Helper to work out the 'simulationcraft-ified' name for the spell
    -- Iterate over the spellbook, collecting all the abilities
    for spellID, spellName, spellSubText, spellBookItem, spellIsTalent, spellIcon in IteratePlayerSpells() do
        if spellID and spellName then
            abilities[slug(spellName)] = {
                Name = spellName,
                SpellIDs = { spellID },
                SpellBookSubtext = spellSubText,
                SpellBookItem = spellBookItem,
                IsTalent = spellIsTalent,
                SpellBookSpellID = spellID,
                Icon = spellIcon
            }
        end
    end

    -- Detect talents, update values accordingly
    for tier=1,7 do
        for column=1,3 do
            local talentID, name = GetTalentInfo(tier, column, GetActiveSpecGroup())
            if talentID and name then
                abilities[slug(name)] = abilities[slug(name)] or {}
                abilities[slug(name)].TalentIDs = { tier, column }
                abilities[slug(name)].IsTalent = true
            end
        end
    end

    -- Merge the abilities with the full list, so that we can export later on
    definedAbilities = self:MergeTables(abilities, definedAbilities)

    return abilities
end

function TJ:ExportAbilitiesFromSpellBook()
    -- Build the string
    local export = ''
    local addline = function(...)
        export = fmt("%s\n%s", export, fmt(...))
    end

    -- Ability IDs
    addline("-- exported with /tj _esd")
    addline("local %s_abilities_exported = {", select(2, GetSpecializationInfo(GetSpecialization())):lower())
    for k,v in internal.orderedpairs(definedAbilities) do
        local line = fmt('    %s = { ', k)
        if v.SpellIDs then
            local ids = {}
            for _,id in internal.orderedpairs(v.SpellIDs) do
                ids[1+#ids] = id
            end
            line = line .. fmt('SpellIDs = { %s }, ', table.concat(ids, ", "))
        end
        if v.TalentIDs then line = line .. fmt('TalentIDs = { %d, %d }, ', v.TalentIDs[1], v.TalentIDs[2]) end
        line = line .. '},'
        addline(line)
    end
    addline("}")
    addline("")

    -- Artifact traits
    -- /run for p=1,1500 do local spellId,_,_,maxRank,_,x,y,_,isStart,isGoldMedal,isFinal = C_ArtifactUI.GetPowerInfo(p); if (spellId ~= nil) then print(p, GetSpellInfo(spellId), maxRank, x, y, isStart, isGoldMedal, isFinal) end end
    addline("local artifact_traits_list = {")
    for traitId=1,1500 do
        local traitData = { C_ArtifactUI.GetPowerInfo(traitId) }
        local spellId = traitData[1]
        local isAbility = traitData[8]
        if spellId ~= nil and isAbility then
            local name = GetSpellInfo(spellId)
            addline("    { %d, %d, \"%s\" },", traitId, spellId, name or '')
        end
    end
    addline("}")
    addline("")

    -- Display the exported data
    self:OpenDebugWindow(addonName .. ' Actions Data Export', export)

    -- Reset the table, so we can change spec
    definedAbilities = {}
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
    tts:ClearLines()
    tts:SetHyperlink(link)
    local tooltipName = tts:GetName()
    local entries = {}

    local function checkadd(x)
        if x then
            local xt = x:GetText()
            if xt ~= "" then
                local e = { t = xt or "", c = {x:GetTextColor()} }
                e.cb = { mfloor(e.c[1]*256), mfloor(e.c[2]*256), mfloor(e.c[3]*256) }
                entries[1+#entries] = e
            end
        end
    end

    for i = 1, tts:NumLines() do
        checkadd(real_G[tooltipName..'TextLeft'..i])
        checkadd(real_G[tooltipName..'TextRight'..i])
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

function TJ:GetSpellCost(spellID)
    local entries = self:GetTooltipEntries(fmt('spell:%d', spellID))
    for _,e in pairs(entries) do
        for k,v in pairs(PowerPatterns) do
            local a, b, c = e.t:match(v[2])
            -- strip non-digit and convert to number
            if a then a = a:gsub('%D', '') + 0 end
            if b then b = b:gsub('%D', '') + 0 end
            if c then c = c:gsub('%D', '') + 0 end
            if a then
                return v[1], a, b, c
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
    vals[1] = vals[1]:gsub('['..reconv[LARGE_NUMBER_SEPERATOR]..']', '')
    vals[2] = '0.' .. (vals[2] or '0')
    return tonumber(vals[1]) + tonumber(vals[2])
end

function TJ:GetSpellCooldown(spellID)
    local entries = self:GetTooltipEntries(fmt('spell:%d', spellID))
    for _,e in pairs(entries) do
        for k,v in pairs(CooldownPatterns) do
            local r = e.t:match(v[2])
            if r then
                return extract_number(r) * DurationMultiplier[v[1]], IsGreen(e.cb)
            end
        end
    end
    return 0
end

function TJ:GetSpellRechargeTime(spellID)
    local entries = self:GetTooltipEntries(fmt('spell:%d', spellID))
    for _,e in pairs(entries) do
        for k,v in pairs(RechargePatterns) do
            local r = e.t:match(v[2])
            if r then
                return extract_number(r) * DurationMultiplier[v[1]], IsGreen(e.cb)
            end
        end
    end
    return 0
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
