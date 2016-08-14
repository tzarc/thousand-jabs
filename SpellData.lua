local addonName, internal = ...;
local Z = internal.Z
local formatHelper = internal.formatHelper
local GUI = LibStub("AceGUI-3.0")

------------------------------------------------------------------------------------------------------------------------
-- Miscellaneous functions
------------------------------------------------------------------------------------------------------------------------

local function orderedpairs(t, f)
    local a = {}
    for n in pairs(t) do table.insert(a, n) end
    table.sort(a, f)
    local i = 0
    local iter = function ()
        i = i + 1
        local k = a[i]
        if k == nil then
            return nil
        else
            return k, t[k]
        end
    end
    return iter
end

------------------------------------------------------------------------------------------------------------------------
-- Spellbook iteration
------------------------------------------------------------------------------------------------------------------------

local IteratePlayerSpells
do
    -- Forward declarations
    local iterateFlyout, iterateSlots, iterateTabs

    iterateFlyout = function(state)
        while state.flyoutSlotIdx <= state.numFlyoutSlots do
            local spellId, _, spellKnown, spellName = GetFlyoutSlotInfo(state.flyoutId, state.flyoutSlotIdx)
            state.flyoutSlotIdx = state.flyoutSlotIdx + 1
            if spellKnown then
                return spellId, spellName
            end
        end
        state.slotIdx = state.slotIdx + 1
        state.currentIterator = iterateSlots
        return state:currentIterator()
    end

    iterateSlots = function (state)
        while state.slotIdx <= state.numSlots do
            local spellBookItem = state.slotOffset + state.slotIdx
            local spellName, _, icon, castTime, minRange, maxRange, spellId = GetSpellInfo(spellBookItem, BOOKTYPE_SPELL)
            local _, spellSubtext = GetSpellBookItemName(spellBookItem, BOOKTYPE_SPELL)
            local spellType, spellBookSpellId = GetSpellBookItemInfo(spellBookItem, BOOKTYPE_SPELL)
            local isTalent = IsTalentSpell(spellBookItem, BOOKTYPE_SPELL)
            if spellType == "SPELL" and not IsPassiveSpell(spellId) then
                state.slotIdx = state.slotIdx + 1
                return spellId, spellName, spellSubtext, spellBookItem, isTalent, icon
            elseif spellType == "FLYOUT" then
                local _, _, numFlyoutSlots, flyoutKnown = GetFlyoutInfo(spellBookSpellId)
                if flyoutKnown then
                    state.flyoutId = spellBookSpellId
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
    local function slug(name) return name:lower():gsub(' ','_'):gsub('[^a-z_]','') end

    -- Iterate over the spellbook, collecting all the abilities
    for spellID, spellName, spellSubText, spellBookItem, spellIsTalent, spellIcon in IteratePlayerSpells() do
        abilities[slug(spellName)] = {
            Name = spellName,
            AbilityID = spellID,
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
            local talentID, name, texture, selected, available, spellID = GetTalentInfo(tier, column, GetActiveSpecGroup())
            abilities[slug(name)] = abilities[slug(name)] or {}
            abilities[slug(name)].TalentIDs = { tier, column }
            abilities[slug(name)].IsTalent = true
        end
    end

    -- Merge the abilities with the full list, so that we can export later on
    for k,v in pairs(abilities) do
        for k2,v2 in pairs(v) do
            definedAbilities[k] = definedAbilities[k] or {}
            definedAbilities[k][k2] = v2
        end
    end

    return abilities
end

function Z:ExportAbilitiesFromSpellBook()
    -- Build the string
    local export = ''
    local addline = function(...)
        export = formatHelper("%s\n%s", export, formatHelper(...))
    end

    -- Ability IDs
    addline("-- exported with /tj _esd")
    addline("local %s_abilities_exported = {", select(2, GetSpecializationInfo(GetSpecialization())):lower())
    for k,v in orderedpairs(definedAbilities) do
        local line = formatHelper('    %s = { ', k)
        if v.AbilityID then line = line .. formatHelper('AbilityID = %d, ', v.AbilityID) end
        if v.TalentIDs then line = line .. formatHelper('TalentIDs = { %d, %d }, ', v.TalentIDs[1], v.TalentIDs[2]) end
        line = line .. '},'
        addline(line)
    end
    addline("}")
    addline("")

    DevTools_Dump{abilities=definedAbilities}

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

    -- Reset the table, so we can change spec
    definedAbilities = {}
end


------------------------------------------------------------------------------------------------------------------------
-- Spell info from tooltip
------------------------------------------------------------------------------------------------------------------------

local tts = CreateFrame('GameTooltip', formatHelper('%sTooltipScanner', addonName))
local ttsl1 = tts:CreateFontString('$parentTextLeft1', nil, "GameTooltipText")
local ttsr1 = tts:CreateFontString('$parentTextRight1', nil, "GameTooltipText")
tts:AddFontStrings(ttsl1, ttsr1)
tts:SetOwner(UIParent, "ANCHOR_NONE")

function Z:GetSpellInfoFromTooltip(spellID)
    tts:SetSpellByID(spellID)
    local tooltipName = tts:GetName()
    local lines = {}

    for i = 1, tts:NumLines() do
        l = _G[tooltipName..'TextLeft'..i]
        r = _G[tooltipName..'TextRight'..i]
        lines[i] = {
            l = { t = l:GetText() or "", c = {l:GetTextColor()} },
            r = { t = r:GetText() or "", c = {r:GetTextColor()} }
        }
    end

    tts:ClearLines()
    return lines
end

local PowerTypes = { 'mana', 'energy', 'chi', 'pain', 'fury', 'rune', 'runic_power', 'rage' }
local PowerSuffixes = { '_COST', '_COST_PER_TIME', '_COST_PER_TIME_NO_BASE', '_COST_PCT' }
local PowerPatterns = {}
for _,v in pairs(PowerTypes) do
    for _,s in pairs(PowerSuffixes) do
        local b = v:upper() .. s
        if _G[b] then
            local function apply_substitutions(str, search, replace)
            end
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

function Z:GetSpellCost(spellID)
    local lines = self:GetSpellInfoFromTooltip(spellID)
    for k,v in pairs(PowerPatterns) do
        local a, b, c = lines and lines[2] and lines[2].l and lines[2].l.t and strmatch(lines[2].l.t, v[2])
        -- strip non-digit and convert to number
        if a then a = gsub(a, '%D', '') + 0 end
        if b then b = gsub(b, '%D', '') + 0 end
        if c then c = gsub(c, '%D', '') + 0 end
        if a then
            return v[1], a, b, c
        end
    end
end

local function IsGreen(colour) -- work out if it's increased by haste
    return math.floor(colour[1]*256) == 0 and math.floor(colour[2]*256) == 255 and math.floor(colour[3]*256) == 0 and true
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

function Z:GetSpellCooldown(spellID)
    local lines = self:GetSpellInfoFromTooltip(spellID)
    for k,v in pairs(CooldownPatterns) do
        for l=2,3 do
            local r = lines and lines[l] and lines[l].r and lines[l].r.t and strmatch(lines[l].r.t, v[2])
            if r then
                r = gsub(r, '[^.%d]', '') + 0
                return tonumber(r) * DurationMultiplier[v[1]], IsGreen(lines[l].r.c)
            end
        end
    end
    return 0
end

function Z:GetSpellRechargeTime(spellID)
    local lines = self:GetSpellInfoFromTooltip(spellID)
    for k,v in pairs(RechargePatterns) do
        for l=2,3 do
            local r = lines and lines[l] and lines[l].r and lines[l].r.t and strmatch(lines[l].r.t, v[2])
            if r then
                r = gsub(r, '[^.%d]', '') + 0
                return tonumber(r) * DurationMultiplier[v[1]], IsGreen(lines[l].r.c)
            end
        end
    end
    return 0
end
