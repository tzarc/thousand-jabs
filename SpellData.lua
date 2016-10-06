local addonName, internal = ...;
local Z = internal.Z
local fmt = internal.fmt
local GUI = LibStub("AceGUI-3.0")

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
function Z:DetectAbilitiesFromSpellBook()
    local abilities = {}

    -- Helper to work out the 'simulationcraft-ified' name for the spell
    local function slug(name) return name:lower():gsub(' ','_'):gsub('[^%a%d_]','') end

    -- Iterate over the spellbook, collecting all the abilities
    for spellID, spellName, spellSubText, spellBookItem, spellIsTalent, spellIcon in IteratePlayerSpells() do
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

    -- Detect talents, update values accordingly
    for tier=1,7 do
        for column=1,3 do
            local talentID, name = GetTalentInfo(tier, column, GetSpecialization())
            abilities[slug(name)] = abilities[slug(name)] or {}
            abilities[slug(name)].TalentIDs = { tier, column }
            abilities[slug(name)].IsTalent = true
        end
    end

    -- Merge the abilities with the full list, so that we can export later on
    definedAbilities = self:MergeTables(abilities, definedAbilities)

    return abilities
end

function Z:ExportAbilitiesFromSpellBook()
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

    -- Show the export window
    local f = GUI:Create("Frame")
    f:SetCallback("OnClose",function(widget) GUI:Release(widget) end)
    f:SetTitle(addonName .. ' Actions Data Export')
    f:SetLayout("Fill")

    local edit = GUI:Create("MultiLineEditBox")
    edit:SetLabel("")
    edit:SetText(export)
    edit:DisableButton(true)
    f:AddChild(edit)

    --DevTools_Dump({definedAbilities=definedAbilities})

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

function Z:GetTooltipEntries(link)
    tts:ClearLines()
    tts:SetHyperlink(link)
    local tooltipName = tts:GetName()
    local entries = {}

    local function checkadd(x)
        if x then
            local xt = x:GetText()
            if xt ~= "" then
                local e = { t = xt or "", c = {x:GetTextColor()} }
                e.cb = { math.floor(e.c[1]*256), math.floor(e.c[2]*256), math.floor(e.c[3]*256) }
                entries[1+#entries] = e
            end
        end
    end

    for i = 1, tts:NumLines() do
        checkadd(_G[tooltipName..'TextLeft'..i])
        checkadd(_G[tooltipName..'TextRight'..i])
    end

    return entries
end

local function IsGreen(colour) -- work out if it's increased by haste
    return colour[1] == 0 and colour[2] == 255 and colour[3] == 0 and true
end

local PowerTypes = { 'mana', 'energy', 'chi', 'pain', 'fury', 'rune', 'runic_power', 'rage' }
local PowerSuffixes = { '_COST', '_COST_PER_TIME', '_COST_PER_TIME_NO_BASE', '_COST_PCT' }
local PowerPatterns = {}
for _,v in pairs(PowerTypes) do
    for _,s in pairs(PowerSuffixes) do
        local b = v:upper() .. s
        if _G[b] then
            local t = _G[b]
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
    if _G[b] then
        CooldownPatterns[1+#CooldownPatterns] = { v, '^' .. gsub(_G[b], '%%.3g', '([.,%%d]+)') .. '$' }
    end
    b = 'SPELL_RECAST_TIME_CHARGES_' .. v:upper()
    if _G[b] then
        RechargePatterns[1+#RechargePatterns] = { v, '^' .. gsub(_G[b], '%%.3g', '([.,%%d]+)') .. '$' }
    end
end

function Z:GetSpellCost(spellID)
    local entries = self:GetTooltipEntries(fmt('spell:%d', spellID))
    for _,e in pairs(entries) do
        for k,v in pairs(PowerPatterns) do
            local a, b, c = strmatch(e.t, v[2])
            -- strip non-digit and convert to number
            if a then a = gsub(a, '%D', '') + 0 end
            if b then b = gsub(b, '%D', '') + 0 end
            if c then c = gsub(c, '%D', '') + 0 end
            if a then
                return v[1], a, b, c
            end
        end
    end
end

function Z:GetSpellCooldown(spellID)
    local entries = self:GetTooltipEntries(fmt('spell:%d', spellID))
    for _,e in pairs(entries) do
        for k,v in pairs(CooldownPatterns) do
            local r = strmatch(e.t, v[2])
            if r then
                r = gsub(r, '[^.%d]', '') + 0
                return tonumber(r) * DurationMultiplier[v[1]], IsGreen(e.cb)
            end
        end
    end
    return 0
end

function Z:GetSpellRechargeTime(spellID)
    local entries = self:GetTooltipEntries(fmt('spell:%d', spellID))
    for _,e in pairs(entries) do
        for k,v in pairs(RechargePatterns) do
            local r = strmatch(e.t, v[2])
            if r then
                r = gsub(r, '[^.%d]', '') + 0
                return tonumber(r) * DurationMultiplier[v[1]], IsGreen(e.cb)
            end
        end
    end
    return 0
end

-- /dump tj:ScanTooltip('spell:188501', function(t) print(t) end, nil, { 255, 210, 0 })
function Z:ScanTooltip(link, callback, pattern, colour)
    local entries = self:GetTooltipEntries(link)
    local function patternmatch(str, pattern)
        return pattern and type(pattern) == 'string' and strmatch(str, pattern) and true or false
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
