local addonName, internal = ...;
local Z = internal.Z
local fmt = internal.fmt

local GUI = LibStub("AceGUI-3.0")
local LAD = LibStub("LibArtifactData-1.0")

------------------------------------------------------------------------------------------------------------------------
-- Artifact queries
------------------------------------------------------------------------------------------------------------------------

function Z:ARTIFACT_ADDED(message, artifactID)
    self.artifactData = self.artifactData or {}
    self.artifactData[artifactID] = select(2, LAD:GetArtifactInfo(artifactID))
    self.currentArtifact = LAD:GetActiveArtifactID()
end
LAD.RegisterCallback(Z, "ARTIFACT_ADDED")

function Z:HasArtifactTrait(traitID)
    local artifactID = self.currentArtifact
    if not artifactID then return false end
    local data = self.artifactData[artifactID]
    for k,v in pairs(data.traits) do
        if v.traitID == traitID then
            return (v.currentRank and v.currentRank > 0) and true or false
        end
    end
    return false
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
            local spellName, _, icon, castTime, _, _, spellId = GetSpellInfo(spellBookItem, BOOKTYPE_SPELL)
            local _, spellSubtext = GetSpellBookItemName(spellBookItem, BOOKTYPE_SPELL)
            local spellType, spellBookSpellId = GetSpellBookItemInfo(spellBookItem, BOOKTYPE_SPELL)
            local isTalent = IsTalentSpell(spellBookItem, BOOKTYPE_SPELL)
            if spellType == "SPELL" and not IsPassiveSpell(spellId) then
                state.slotIdx = state.slotIdx + 1
                return spellId, spellName, spellSubtext, spellBookItem, isTalent, icon, castTime
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

-- Helper to work out the 'simulationcraft-ified' name for the spell
local function slug(name)
    return name:lower():gsub(' ','_'):gsub('[^%a%d_]','')
end

local definedAbilities = {}
function Z:DetectAbilitiesFromSpellBook()
    local abilities = {}

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
            local talentID, name = GetTalentInfo(tier, column, GetActiveSpecGroup())
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

    addline("local artifactTraitsExported = {")
    for traitId=1,2000 do
        local spellId, _, _, maxRank, _, x, y, _, isStart, isGoldMedal, isFinal = C_ArtifactUI.GetPowerInfo(traitId);
        if (spellId ~= nil) then
            local name = GetSpellInfo(spellId)
            if name then
                local line = fmt('    %s = { ', slug(name))
                line = line .. fmt('ArtifactTraitID = %d, ', traitId)
                line = line .. fmt('ArtifactTraitName = "%s", ', name)
                line = line .. '},'
                addline(line)
            end
        end
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

------------------------------------------------------------------------------------------------------------------------
-- Exported artifact data
------------------------------------------------------------------------------------------------------------------------

internal.artifactTraitsExported = {
    wake_of_ashes = { ArtifactTraitID = 40, ArtifactTraitName = "Wake of Ashes", },
    highlords_judgment = { ArtifactTraitID = 41, ArtifactTraitName = "Highlord's Judgment", },
    sharpened_edge = { ArtifactTraitID = 42, ArtifactTraitName = "Sharpened Edge", },
    righteous_blade = { ArtifactTraitID = 43, ArtifactTraitName = "Righteous Blade", },
    embrace_the_light = { ArtifactTraitID = 44, ArtifactTraitName = "Embrace the Light", },
    deflection = { ArtifactTraitID = 47, ArtifactTraitName = "Deflection", },
    divine_tempest = { ArtifactTraitID = 49, ArtifactTraitName = "Divine Tempest", },
    deliver_the_justice = { ArtifactTraitID = 50, ArtifactTraitName = "Deliver the Justice", },
    might_of_the_templar = { ArtifactTraitID = 51, ArtifactTraitName = "Might of the Templar", },
    protector_of_the_ashen_blade = { ArtifactTraitID = 52, ArtifactTraitName = "Protector of the Ashen Blade", },
    wrath_of_the_ashbringer = { ArtifactTraitID = 53, ArtifactTraitName = "Wrath of the Ashbringer", },
    echo_of_the_highlord = { ArtifactTraitID = 54, ArtifactTraitName = "Echo of the Highlord", },
    torrential_barrage = { ArtifactTraitID = 72, ArtifactTraitName = "Torrential Barrage", },
    arcane_rebound = { ArtifactTraitID = 73, ArtifactTraitName = "Arcane Rebound", },
    blasting_rod = { ArtifactTraitID = 74, ArtifactTraitName = "Blasting Rod", },
    aegwynns_wrath = { ArtifactTraitID = 75, ArtifactTraitName = "Aegwynn's Wrath", },
    arcane_purification = { ArtifactTraitID = 77, ArtifactTraitName = "Arcane Purification", },
    crackling_energy = { ArtifactTraitID = 78, ArtifactTraitName = "Crackling Energy", },
    aegwynns_fury = { ArtifactTraitID = 79, ArtifactTraitName = "Aegwynn's Fury", },
    rule_of_threes = { ArtifactTraitID = 80, ArtifactTraitName = "Rule of Threes", },
    ethereal_sensitivity = { ArtifactTraitID = 81, ArtifactTraitName = "Ethereal Sensitivity", },
    aegwynns_imperative = { ArtifactTraitID = 82, ArtifactTraitName = "Aegwynn's Imperative", },
    everywhere_at_once = { ArtifactTraitID = 83, ArtifactTraitName = "Everywhere At Once", },
    mana_shield = { ArtifactTraitID = 84, ArtifactTraitName = "Mana Shield", },
    touch_of_the_magi = { ArtifactTraitID = 86, ArtifactTraitName = "Touch of the Magi", },
    aegwynns_ascendance = { ArtifactTraitID = 87, ArtifactTraitName = "Aegwynn's Ascendance", },
    neltharions_fury = { ArtifactTraitID = 91, ArtifactTraitName = "Neltharion's Fury", },
    scales_of_earth = { ArtifactTraitID = 92, ArtifactTraitName = "Scales of Earth", },
    dragon_scales = { ArtifactTraitID = 93, ArtifactTraitName = "Dragon Scales", },
    might_of_the_vrykul = { ArtifactTraitID = 94, ArtifactTraitName = "Might of the Vrykul", },
    vrykul_shield_training = { ArtifactTraitID = 95, ArtifactTraitName = "Vrykul Shield Training", },
    rage_of_the_fallen = { ArtifactTraitID = 96, ArtifactTraitName = "Rage of the Fallen", },
    rumbling_voice = { ArtifactTraitID = 97, ArtifactTraitName = "Rumbling Voice", },
    will_to_survive = { ArtifactTraitID = 98, ArtifactTraitName = "Will to Survive", },
    leaping_giants = { ArtifactTraitID = 99, ArtifactTraitName = "Leaping Giants", },
    dragon_skin = { ArtifactTraitID = 100, ArtifactTraitName = "Dragon Skin", },
    intolerance = { ArtifactTraitID = 101, ArtifactTraitName = "Intolerance", },
    shatter_the_bones = { ArtifactTraitID = 102, ArtifactTraitName = "Shatter the Bones", },
    wall_of_steel = { ArtifactTraitID = 103, ArtifactTraitName = "Wall of Steel", },
    reflective_plating = { ArtifactTraitID = 104, ArtifactTraitName = "Reflective Plating", },
    toughness = { ArtifactTraitID = 105, ArtifactTraitName = "Toughness", },
    thunder_crash = { ArtifactTraitID = 106, ArtifactTraitName = "Thunder Crash", },
    cold_as_ice = { ArtifactTraitID = 108, ArtifactTraitName = "Cold as Ice", },
    blast_radius = { ArtifactTraitID = 109, ArtifactTraitName = "Blast Radius", },
    ambidexterity = { ArtifactTraitID = 110, ArtifactTraitName = "Ambidexterity", },
    overpowered = { ArtifactTraitID = 111, ArtifactTraitName = "Over-Powered", },
    nothing_but_the_boots = { ArtifactTraitID = 113, ArtifactTraitName = "Nothing but the Boots", },
    bad_to_the_bone = { ArtifactTraitID = 114, ArtifactTraitName = "Bad to the Bone", },
    ice_in_your_veins = { ArtifactTraitID = 115, ArtifactTraitName = "Ice in Your Veins", },
    dead_of_winter = { ArtifactTraitID = 117, ArtifactTraitName = "Dead of Winter", },
    frozen_core = { ArtifactTraitID = 119, ArtifactTraitName = "Frozen Core", },
    mirror_ball = { ArtifactTraitID = 120, ArtifactTraitName = "Mirror Ball", },
    crystalline_swords = { ArtifactTraitID = 122, ArtifactTraitName = "Crystalline Swords", },
    hypothermia = { ArtifactTraitID = 123, ArtifactTraitName = "Hypothermia", },
    sindragosas_fury = { ArtifactTraitID = 124, ArtifactTraitName = "Sindragosa's Fury", },
    essence_of_ghanir = { ArtifactTraitID = 125, ArtifactTraitName = "Essence of G'Hanir", },
    dreamwalker = { ArtifactTraitID = 126, ArtifactTraitName = "Dreamwalker", },
    tranquil_mind = { ArtifactTraitID = 127, ArtifactTraitName = "Tranquil Mind", },
    power_of_the_archdruid = { ArtifactTraitID = 128, ArtifactTraitName = "Power of the Archdruid", },
    natures_essence = { ArtifactTraitID = 129, ArtifactTraitName = "Nature's Essence", },
    knowledge_of_the_ancients = { ArtifactTraitID = 130, ArtifactTraitName = "Knowledge of the Ancients", },
    seeds_of_the_world_tree = { ArtifactTraitID = 131, ArtifactTraitName = "Seeds of the World Tree", },
    essence_of_nordrassil = { ArtifactTraitID = 132, ArtifactTraitName = "Essence of Nordrassil", },
    infusion_of_nature = { ArtifactTraitID = 133, ArtifactTraitName = "Infusion of Nature", },
    armor_of_the_ancients = { ArtifactTraitID = 134, ArtifactTraitName = "Armor of the Ancients", },
    natural_mending = { ArtifactTraitID = 135, ArtifactTraitName = "Natural Mending", },
    blessing_of_the_world_tree = { ArtifactTraitID = 136, ArtifactTraitName = "Blessing of the World Tree", },
    persistence = { ArtifactTraitID = 137, ArtifactTraitName = "Persistence", },
    blooms_of_ghanir = { ArtifactTraitID = 138, ArtifactTraitName = "Blooms of G'Hanir", },
    mark_of_shifting = { ArtifactTraitID = 139, ArtifactTraitName = "Mark of Shifting", },
    grovewalker = { ArtifactTraitID = 140, ArtifactTraitName = "Grovewalker", },
    apocalypse = { ArtifactTraitID = 149, ArtifactTraitName = "Apocalypse", },
    the_shambler = { ArtifactTraitID = 150, ArtifactTraitName = "The Shambler", },
    double_doom = { ArtifactTraitID = 151, ArtifactTraitName = "Double Doom", },
    scourge_of_worlds = { ArtifactTraitID = 152, ArtifactTraitName = "Scourge of Worlds", },
    portal_to_the_underworld = { ArtifactTraitID = 153, ArtifactTraitName = "Portal to the Underworld", },
    armies_of_the_damned = { ArtifactTraitID = 154, ArtifactTraitName = "Armies of the Damned", },
    deadliest_coil = { ArtifactTraitID = 156, ArtifactTraitName = "Deadliest Coil", },
    rotten_touch = { ArtifactTraitID = 157, ArtifactTraitName = "Rotten Touch", },
    plaguebearer = { ArtifactTraitID = 158, ArtifactTraitName = "Plaguebearer", },
    deadly_durability = { ArtifactTraitID = 262, ArtifactTraitName = "Deadly Durability", },
    gravitational_pull = { ArtifactTraitID = 263, ArtifactTraitName = "Gravitational Pull", },
    runic_tattoos = { ArtifactTraitID = 264, ArtifactTraitName = "Runic Tattoos", },
    scourge_the_unbeliever = { ArtifactTraitID = 265, ArtifactTraitName = "Scourge the Unbeliever", },
    the_darkest_crusade = { ArtifactTraitID = 266, ArtifactTraitName = "The Darkest Crusade", },
    unholy_endurance = { ArtifactTraitID = 267, ArtifactTraitName = "Unholy Endurance", },
    iron_heart = { ArtifactTraitID = 272, ArtifactTraitName = "Iron Heart", },
    meat_shield = { ArtifactTraitID = 273, ArtifactTraitName = "Meat Shield", },
    grim_perseverance = { ArtifactTraitID = 274, ArtifactTraitName = "Grim Perseverance", },
    veinrender = { ArtifactTraitID = 275, ArtifactTraitName = "Veinrender", },
    coagulopathy = { ArtifactTraitID = 276, ArtifactTraitName = "Coagulopathy", },
    vampiric_fangs = { ArtifactTraitID = 277, ArtifactTraitName = "Vampiric Fangs", },
    allconsuming_rot = { ArtifactTraitID = 278, ArtifactTraitName = "All-Consuming Rot", },
    dance_of_darkness = { ArtifactTraitID = 279, ArtifactTraitName = "Dance of Darkness", },
    bonebreaker = { ArtifactTraitID = 280, ArtifactTraitName = "Bonebreaker", },
    rattling_bones = { ArtifactTraitID = 281, ArtifactTraitName = "Rattling Bones", },
    blood_feast = { ArtifactTraitID = 282, ArtifactTraitName = "Blood Feast", },
    mouth_of_hell = { ArtifactTraitID = 283, ArtifactTraitName = "Mouth of Hell", },
    skeletal_shattering = { ArtifactTraitID = 284, ArtifactTraitName = "Skeletal Shattering", },
    unending_thirst = { ArtifactTraitID = 285, ArtifactTraitName = "Unending Thirst", },
    umbilicus_eternus = { ArtifactTraitID = 286, ArtifactTraitName = "Umbilicus Eternus", },
    consumption = { ArtifactTraitID = 289, ArtifactTraitName = "Consumption", },
    mark_of_aluneth = { ArtifactTraitID = 290, ArtifactTraitName = "Mark of Aluneth", },
    stormkeeper = { ArtifactTraitID = 291, ArtifactTraitName = "Stormkeeper", },
    static_overload = { ArtifactTraitID = 292, ArtifactTraitName = "Static Overload", },
    master_of_the_elements = { ArtifactTraitID = 293, ArtifactTraitName = "Master of the Elements", },
    elementalist = { ArtifactTraitID = 294, ArtifactTraitName = "Elementalist", },
    fury_of_the_storms = { ArtifactTraitID = 295, ArtifactTraitName = "Fury of the Storms", },
    power_of_the_maelstrom = { ArtifactTraitID = 296, ArtifactTraitName = "Power of the Maelstrom", },
    volcanic_inferno = { ArtifactTraitID = 297, ArtifactTraitName = "Volcanic Inferno", },
    call_the_thunder = { ArtifactTraitID = 298, ArtifactTraitName = "Call the Thunder", },
    the_ground_trembles = { ArtifactTraitID = 299, ArtifactTraitName = "The Ground Trembles", },
    lava_imbued = { ArtifactTraitID = 300, ArtifactTraitName = "Lava Imbued", },
    firestorm = { ArtifactTraitID = 301, ArtifactTraitName = "Firestorm", },
    protection_of_the_elements = { ArtifactTraitID = 302, ArtifactTraitName = "Protection of the Elements", },
    molten_blast = { ArtifactTraitID = 303, ArtifactTraitName = "Molten Blast", },
    electric_discharge = { ArtifactTraitID = 304, ArtifactTraitName = "Electric Discharge", },
    shamanistic_healing = { ArtifactTraitID = 305, ArtifactTraitName = "Shamanistic Healing", },
    earthen_attunement = { ArtifactTraitID = 306, ArtifactTraitName = "Earthen Attunement", },
    windburst = { ArtifactTraitID = 307, ArtifactTraitName = "Windburst", },
    mark_of_the_windrunner = { ArtifactTraitID = 308, ArtifactTraitName = "Mark of the Windrunner", },
    critical_focus = { ArtifactTraitID = 309, ArtifactTraitName = "Critical Focus", },
    rapid_killing = { ArtifactTraitID = 310, ArtifactTraitName = "Rapid Killing", },
    call_of_the_hunter = { ArtifactTraitID = 311, ArtifactTraitName = "Call of the Hunter", },
    deadly_aim = { ArtifactTraitID = 312, ArtifactTraitName = "Deadly Aim", },
    windrunners_guidance = { ArtifactTraitID = 313, ArtifactTraitName = "Windrunner's Guidance", },
    quick_shot = { ArtifactTraitID = 314, ArtifactTraitName = "Quick Shot", },
    called_shot = { ArtifactTraitID = 315, ArtifactTraitName = "Called Shot", },
    healing_shell = { ArtifactTraitID = 316, ArtifactTraitName = "Healing Shell", },
    survival_of_the_fittest = { ArtifactTraitID = 317, ArtifactTraitName = "Survival of the Fittest", },
    precision = { ArtifactTraitID = 318, ArtifactTraitName = "Precision", },
    marked_for_death = { ArtifactTraitID = 319, ArtifactTraitName = "Marked for Death", },
    gust_of_wind = { ArtifactTraitID = 320, ArtifactTraitName = "Gust of Wind", },
    legacy_of_the_windrunners = { ArtifactTraitID = 321, ArtifactTraitName = "Legacy of the Windrunners", },
    bullseye = { ArtifactTraitID = 322, ArtifactTraitName = "Bullseye", },
    toxic_blades = { ArtifactTraitID = 323, ArtifactTraitName = "Toxic Blades", },
    serrated_edge = { ArtifactTraitID = 324, ArtifactTraitName = "Serrated Edge", },
    master_alchemist = { ArtifactTraitID = 325, ArtifactTraitName = "Master Alchemist", },
    fade_into_shadows = { ArtifactTraitID = 326, ArtifactTraitName = "Fade into Shadows", },
    balanced_blades = { ArtifactTraitID = 327, ArtifactTraitName = "Balanced Blades", },
    gushing_wound = { ArtifactTraitID = 328, ArtifactTraitName = "Gushing Wound", },
    shadow_walker = { ArtifactTraitID = 329, ArtifactTraitName = "Shadow Walker", },
    master_assassin = { ArtifactTraitID = 330, ArtifactTraitName = "Master Assassin", },
    poison_knives = { ArtifactTraitID = 331, ArtifactTraitName = "Poison Knives", },
    urge_to_kill = { ArtifactTraitID = 332, ArtifactTraitName = "Urge to Kill", },
    shadow_swiftness = { ArtifactTraitID = 333, ArtifactTraitName = "Shadow Swiftness", },
    surge_of_toxins = { ArtifactTraitID = 334, ArtifactTraitName = "Surge of Toxins", },
    from_the_shadows = { ArtifactTraitID = 335, ArtifactTraitName = "From the Shadows", },
    bag_of_tricks = { ArtifactTraitID = 337, ArtifactTraitName = "Bag of Tricks", },
    kingsbane = { ArtifactTraitID = 346, ArtifactTraitName = "Kingsbane", },
    blood_of_the_assassinated = { ArtifactTraitID = 347, ArtifactTraitName = "Blood of the Assassinated", },
    endless_resolve = { ArtifactTraitID = 350, ArtifactTraitName = "Endless Resolve", },
    unbreakable_will = { ArtifactTraitID = 351, ArtifactTraitName = "Unbreakable Will", },
    healing_storm = { ArtifactTraitID = 352, ArtifactTraitName = "Healing Storm", },
    ashes_to_ashes = { ArtifactTraitID = 353, ArtifactTraitName = "Ashes to Ashes", },
    phoenixs_flames = { ArtifactTraitID = 748, ArtifactTraitName = "Phoenix's Flames", },
    fire_at_will = { ArtifactTraitID = 749, ArtifactTraitName = "Fire at Will", },
    reignition_overdrive = { ArtifactTraitID = 750, ArtifactTraitName = "Reignition Overdrive", },
    pyroclasmic_paranoia = { ArtifactTraitID = 751, ArtifactTraitName = "Pyroclasmic Paranoia", },
    burning_gaze = { ArtifactTraitID = 752, ArtifactTraitName = "Burning Gaze", },
    blue_flame_special = { ArtifactTraitID = 753, ArtifactTraitName = "Blue Flame Special", },
    great_balls_of_fire = { ArtifactTraitID = 754, ArtifactTraitName = "Great Balls of Fire", },
    everburning_consumption = { ArtifactTraitID = 755, ArtifactTraitName = "Everburning Consumption", },
    cauterizing_blink = { ArtifactTraitID = 756, ArtifactTraitName = "Cauterizing Blink", },
    molten_skin = { ArtifactTraitID = 757, ArtifactTraitName = "Molten Skin", },
    blast_furnace = { ArtifactTraitID = 758, ArtifactTraitName = "Blast Furnace", },
    big_mouth = { ArtifactTraitID = 759, ArtifactTraitName = "Big Mouth", },
    scorched_earth = { ArtifactTraitID = 760, ArtifactTraitName = "Scorched Earth", },
    aftershocks = { ArtifactTraitID = 761, ArtifactTraitName = "Aftershocks", },
    phoenix_reborn = { ArtifactTraitID = 762, ArtifactTraitName = "Phoenix Reborn", },
    pyretic_incantation = { ArtifactTraitID = 763, ArtifactTraitName = "Pyretic Incantation", },
    void_torrent = { ArtifactTraitID = 764, ArtifactTraitName = "Void Torrent", },
    thrive_in_the_shadows = { ArtifactTraitID = 765, ArtifactTraitName = "Thrive in the Shadows", },
    sinister_thoughts = { ArtifactTraitID = 766, ArtifactTraitName = "Sinister Thoughts", },
    unleash_the_shadows = { ArtifactTraitID = 767, ArtifactTraitName = "Unleash the Shadows", },
    call_to_the_void = { ArtifactTraitID = 768, ArtifactTraitName = "Call to the Void", },
    sphere_of_insanity = { ArtifactTraitID = 769, ArtifactTraitName = "Sphere of Insanity", },
    mass_hysteria = { ArtifactTraitID = 770, ArtifactTraitName = "Mass Hysteria", },
    from_the_shadows = { ArtifactTraitID = 771, ArtifactTraitName = "From the Shadows", },
    mind_shattering = { ArtifactTraitID = 772, ArtifactTraitName = "Mind Shattering", },
    to_the_pain = { ArtifactTraitID = 773, ArtifactTraitName = "To the Pain", },
    deaths_embrace = { ArtifactTraitID = 774, ArtifactTraitName = "Death's Embrace", },
    thoughts_of_insanity = { ArtifactTraitID = 775, ArtifactTraitName = "Thoughts of Insanity", },
    creeping_shadows = { ArtifactTraitID = 776, ArtifactTraitName = "Creeping Shadows", },
    touch_of_darkness = { ArtifactTraitID = 777, ArtifactTraitName = "Touch of Darkness", },
    void_corruption = { ArtifactTraitID = 778, ArtifactTraitName = "Void Corruption", },
    mental_fortitude = { ArtifactTraitID = 779, ArtifactTraitName = "Mental Fortitude", },
    ebonbolt = { ArtifactTraitID = 783, ArtifactTraitName = "Ebonbolt", },
    icy_caress = { ArtifactTraitID = 784, ArtifactTraitName = "Icy Caress", },
    ice_age = { ArtifactTraitID = 785, ArtifactTraitName = "Ice Age", },
    let_it_go = { ArtifactTraitID = 786, ArtifactTraitName = "Let It Go", },
    orbital_strike = { ArtifactTraitID = 787, ArtifactTraitName = "Orbital Strike", },
    frozen_veins = { ArtifactTraitID = 788, ArtifactTraitName = "Frozen Veins", },
    clarity_of_thought = { ArtifactTraitID = 789, ArtifactTraitName = "Clarity of Thought", },
    the_storm_rages = { ArtifactTraitID = 790, ArtifactTraitName = "The Storm Rages", },
    shield_of_alodi = { ArtifactTraitID = 791, ArtifactTraitName = "Shield of Alodi", },
    jouster = { ArtifactTraitID = 792, ArtifactTraitName = "Jouster", },
    chain_reaction = { ArtifactTraitID = 793, ArtifactTraitName = "Chain Reaction", },
    ice_nine = { ArtifactTraitID = 794, ArtifactTraitName = "Ice Nine", },
    icy_hand = { ArtifactTraitID = 795, ArtifactTraitName = "Icy Hand", },
    its_cold_outside = { ArtifactTraitID = 796, ArtifactTraitName = "It's Cold Outside", },
    black_ice = { ArtifactTraitID = 797, ArtifactTraitName = "Black Ice", },
    chilled_to_the_core = { ArtifactTraitID = 798, ArtifactTraitName = "Chilled to the Core", },
    inner_peace = { ArtifactTraitID = 800, ArtifactTraitName = "Inner Peace", },
    light_on_your_feet = { ArtifactTraitID = 801, ArtifactTraitName = "Light on Your Feet", },
    dimensional_rift = { ArtifactTraitID = 803, ArtifactTraitName = "Dimensional Rift", },
    master_of_disaster = { ArtifactTraitID = 804, ArtifactTraitName = "Master of Disaster", },
    chaotic_instability = { ArtifactTraitID = 805, ArtifactTraitName = "Chaotic Instability", },
    fire_and_the_flames = { ArtifactTraitID = 806, ArtifactTraitName = "Fire and the Flames", },
    residual_flames = { ArtifactTraitID = 807, ArtifactTraitName = "Residual Flames", },
    soulsnatcher = { ArtifactTraitID = 808, ArtifactTraitName = "Soulsnatcher", },
    burning_hunger = { ArtifactTraitID = 809, ArtifactTraitName = "Burning Hunger", },
    fire_from_the_sky = { ArtifactTraitID = 810, ArtifactTraitName = "Fire From the Sky", },
    devourer_of_life = { ArtifactTraitID = 811, ArtifactTraitName = "Devourer of Life", },
    eternal_struggle = { ArtifactTraitID = 812, ArtifactTraitName = "Eternal Struggle", },
    planeswalker = { ArtifactTraitID = 813, ArtifactTraitName = "Planeswalker", },
    demonic_durability = { ArtifactTraitID = 814, ArtifactTraitName = "Demonic Durability", },
    impish_incineration = { ArtifactTraitID = 815, ArtifactTraitName = "Impish Incineration", },
    dimension_ripper = { ArtifactTraitID = 816, ArtifactTraitName = "Dimension Ripper", },
    conflagration_of_chaos = { ArtifactTraitID = 817, ArtifactTraitName = "Conflagration of Chaos", },
    lord_of_flames = { ArtifactTraitID = 818, ArtifactTraitName = "Lord of Flames", },
    rising_winds = { ArtifactTraitID = 820, ArtifactTraitName = "Rising Winds", },
    tiger_claws = { ArtifactTraitID = 821, ArtifactTraitName = "Tiger Claws", },
    death_art = { ArtifactTraitID = 822, ArtifactTraitName = "Death Art", },
    power_of_a_thousand_cranes = { ArtifactTraitID = 824, ArtifactTraitName = "Power of a Thousand Cranes", },
    fists_of_the_wind = { ArtifactTraitID = 825, ArtifactTraitName = "Fists of the Wind", },
    good_karma = { ArtifactTraitID = 826, ArtifactTraitName = "Good Karma", },
    spiritual_focus = { ArtifactTraitID = 827, ArtifactTraitName = "Spiritual Focus", },
    transfer_the_power = { ArtifactTraitID = 828, ArtifactTraitName = "Transfer the Power", },
    healing_winds = { ArtifactTraitID = 829, ArtifactTraitName = "Healing Winds", },
    gale_burst = { ArtifactTraitID = 830, ArtifactTraitName = "Gale Burst", },
    strike_of_the_windlord = { ArtifactTraitID = 831, ArtifactTraitName = "Strike of the Windlord", },
    crosswinds = { ArtifactTraitID = 832, ArtifactTraitName = "Crosswinds", },
    tornado_kicks = { ArtifactTraitID = 833, ArtifactTraitName = "Tornado Kicks", },
    invoke_the_naaru = { ArtifactTraitID = 834, ArtifactTraitName = "Invoke the Naaru", },
    renew_the_faith = { ArtifactTraitID = 835, ArtifactTraitName = "Renew the Faith", },
    light_of_tuure = { ArtifactTraitID = 836, ArtifactTraitName = "Light of T'uure", },
    blessing_of_tuure = { ArtifactTraitID = 837, ArtifactTraitName = "Blessing of T'uure", },
    power_of_the_naaru = { ArtifactTraitID = 838, ArtifactTraitName = "Power of the Naaru", },
    guardians_of_the_light = { ArtifactTraitID = 839, ArtifactTraitName = "Guardians of the Light", },
    holy_mending = { ArtifactTraitID = 840, ArtifactTraitName = "Holy Mending", },
    trust_in_the_light = { ArtifactTraitID = 841, ArtifactTraitName = "Trust in the Light", },
    say_your_prayers = { ArtifactTraitID = 842, ArtifactTraitName = "Say Your Prayers", },
    serenity_now = { ArtifactTraitID = 843, ArtifactTraitName = "Serenity Now", },
    reverence = { ArtifactTraitID = 844, ArtifactTraitName = "Reverence", },
    focus_in_the_light = { ArtifactTraitID = 845, ArtifactTraitName = "Focus in the Light", },
    holy_hands = { ArtifactTraitID = 846, ArtifactTraitName = "Holy Hands", },
    hallowed_ground = { ArtifactTraitID = 847, ArtifactTraitName = "Hallowed Ground", },
    words_of_healing = { ArtifactTraitID = 848, ArtifactTraitName = "Words of Healing", },
    holy_guidance = { ArtifactTraitID = 849, ArtifactTraitName = "Holy Guidance", },
    goremaws_bite = { ArtifactTraitID = 851, ArtifactTraitName = "Goremaw's Bite", },
    the_quiet_knife = { ArtifactTraitID = 852, ArtifactTraitName = "The Quiet Knife", },
    demons_kiss = { ArtifactTraitID = 853, ArtifactTraitName = "Demon's Kiss", },
    gutripper = { ArtifactTraitID = 854, ArtifactTraitName = "Gutripper", },
    precision_strike = { ArtifactTraitID = 855, ArtifactTraitName = "Precision Strike", },
    fortunes_bite = { ArtifactTraitID = 856, ArtifactTraitName = "Fortune's Bite", },
    soul_shadows = { ArtifactTraitID = 857, ArtifactTraitName = "Soul Shadows", },
    energetic_stabbing = { ArtifactTraitID = 858, ArtifactTraitName = "Energetic Stabbing", },
    catlike_reflexes = { ArtifactTraitID = 859, ArtifactTraitName = "Catlike Reflexes", },
    ghost_armor = { ArtifactTraitID = 860, ArtifactTraitName = "Ghost Armor", },
    second_shuriken = { ArtifactTraitID = 861, ArtifactTraitName = "Second Shuriken", },
    flickering_shadows = { ArtifactTraitID = 862, ArtifactTraitName = "Flickering Shadows", },
    embrace_of_darkness = { ArtifactTraitID = 863, ArtifactTraitName = "Embrace of Darkness", },
    akaaris_soul = { ArtifactTraitID = 864, ArtifactTraitName = "Akaari's Soul", },
    shadow_nova = { ArtifactTraitID = 865, ArtifactTraitName = "Shadow Nova", },
    finality = { ArtifactTraitID = 866, ArtifactTraitName = "Finality", },
    wilderness_expert = { ArtifactTraitID = 868, ArtifactTraitName = "Wilderness Expert", },
    furious_swipes = { ArtifactTraitID = 869, ArtifactTraitName = "Furious Swipes", },
    pack_leader = { ArtifactTraitID = 870, ArtifactTraitName = "Pack Leader", },
    natural_reflexes = { ArtifactTraitID = 871, ArtifactTraitName = "Natural Reflexes", },
    focus_of_the_titans = { ArtifactTraitID = 872, ArtifactTraitName = "Focus of the Titans", },
    spitting_cobras = { ArtifactTraitID = 873, ArtifactTraitName = "Spitting Cobras", },
    mimirons_shell = { ArtifactTraitID = 874, ArtifactTraitName = "Mimiron's Shell", },
    jaws_of_thunder = { ArtifactTraitID = 875, ArtifactTraitName = "Jaws of Thunder", },
    hunters_advantage = { ArtifactTraitID = 876, ArtifactTraitName = "Hunter's Advantage", },
    spirit_bond = { ArtifactTraitID = 877, ArtifactTraitName = "Spirit Bond", },
    master_of_beasts = { ArtifactTraitID = 878, ArtifactTraitName = "Master of Beasts", },
    titans_thunder = { ArtifactTraitID = 879, ArtifactTraitName = "Titan's Thunder", },
    pathfinder = { ArtifactTraitID = 880, ArtifactTraitName = "Pathfinder", },
    hatis_bond = { ArtifactTraitID = 881, ArtifactTraitName = "Hati's Bond", },
    surge_of_the_stormgod = { ArtifactTraitID = 882, ArtifactTraitName = "Surge of the Stormgod", },
    lights_wrath = { ArtifactTraitID = 883, ArtifactTraitName = "Light's Wrath", },
    taming_the_shadows = { ArtifactTraitID = 884, ArtifactTraitName = "Taming the Shadows", },
    share_in_the_light = { ArtifactTraitID = 885, ArtifactTraitName = "Share in the Light", },
    barrier_for_the_devoted = { ArtifactTraitID = 886, ArtifactTraitName = "Barrier for the Devoted", },
    sins_of_the_many = { ArtifactTraitID = 887, ArtifactTraitName = "Sins of the Many", },
    confession = { ArtifactTraitID = 888, ArtifactTraitName = "Confession", },
    vestments_of_discipline = { ArtifactTraitID = 889, ArtifactTraitName = "Vestments of Discipline", },
    pain_is_in_your_mind = { ArtifactTraitID = 890, ArtifactTraitName = "Pain is in Your Mind", },
    the_edge_of_dark_and_light = { ArtifactTraitID = 891, ArtifactTraitName = "The Edge of Dark and Light", },
    burst_of_light = { ArtifactTraitID = 892, ArtifactTraitName = "Burst of Light", },
    doomsayer = { ArtifactTraitID = 893, ArtifactTraitName = "Doomsayer", },
    shield_of_faith = { ArtifactTraitID = 894, ArtifactTraitName = "Shield of Faith", },
    borrowed_time = { ArtifactTraitID = 895, ArtifactTraitName = "Borrowed Time", },
    darkest_shadows = { ArtifactTraitID = 896, ArtifactTraitName = "Darkest Shadows", },
    power_of_the_dark_side = { ArtifactTraitID = 897, ArtifactTraitName = "Power of the Dark Side", },
    speed_of_the_pious = { ArtifactTraitID = 898, ArtifactTraitName = "Speed of the Pious", },
    doom_winds = { ArtifactTraitID = 899, ArtifactTraitName = "Doom Winds", },
    unleash_doom = { ArtifactTraitID = 900, ArtifactTraitName = "Unleash Doom", },
    doom_wolves = { ArtifactTraitID = 901, ArtifactTraitName = "Doom Wolves", },
    raging_storms = { ArtifactTraitID = 902, ArtifactTraitName = "Raging Storms", },
    stormflurry = { ArtifactTraitID = 903, ArtifactTraitName = "Stormflurry", },
    alpha_wolf = { ArtifactTraitID = 904, ArtifactTraitName = "Alpha Wolf", },
    weapons_of_the_elements = { ArtifactTraitID = 905, ArtifactTraitName = "Weapons of the Elements", },
    forged_in_lava = { ArtifactTraitID = 906, ArtifactTraitName = "Forged in Lava", },
    spirit_of_the_maelstrom = { ArtifactTraitID = 907, ArtifactTraitName = "Spirit of the Maelstrom", },
    wind_surge = { ArtifactTraitID = 908, ArtifactTraitName = "Wind Surge", },
    elemental_healing = { ArtifactTraitID = 909, ArtifactTraitName = "Elemental Healing", },
    wind_strikes = { ArtifactTraitID = 910, ArtifactTraitName = "Wind Strikes", },
    spiritual_healing = { ArtifactTraitID = 911, ArtifactTraitName = "Spiritual Healing", },
    gathering_storms = { ArtifactTraitID = 912, ArtifactTraitName = "Gathering Storms", },
    gathering_of_the_maelstrom = { ArtifactTraitID = 913, ArtifactTraitName = "Gathering of the Maelstrom", },
    inimitable_agony = { ArtifactTraitID = 915, ArtifactTraitName = "Inimitable Agony", },
    hideous_corruption = { ArtifactTraitID = 916, ArtifactTraitName = "Hideous Corruption", },
    drained_to_a_husk = { ArtifactTraitID = 917, ArtifactTraitName = "Drained to a Husk", },
    inherently_unstable = { ArtifactTraitID = 918, ArtifactTraitName = "Inherently Unstable", },
    seeds_of_doom = { ArtifactTraitID = 919, ArtifactTraitName = "Seeds of Doom", },
    perdition = { ArtifactTraitID = 920, ArtifactTraitName = "Perdition", },
    shadowy_incantations = { ArtifactTraitID = 921, ArtifactTraitName = "Shadowy Incantations", },
    shadows_of_the_flesh = { ArtifactTraitID = 922, ArtifactTraitName = "Shadows of the Flesh", },
    long_dark_night_of_the_soul = { ArtifactTraitID = 923, ArtifactTraitName = "Long Dark Night of the Soul", },
    sweet_souls = { ArtifactTraitID = 924, ArtifactTraitName = "Sweet Souls", },
    fatal_echoes = { ArtifactTraitID = 925, ArtifactTraitName = "Fatal Echoes", },
    compounding_horror = { ArtifactTraitID = 926, ArtifactTraitName = "Compounding Horror", },
    soul_flame = { ArtifactTraitID = 927, ArtifactTraitName = "Soul Flame", },
    wrath_of_consumption = { ArtifactTraitID = 928, ArtifactTraitName = "Wrath of Consumption", },
    harvester_of_souls = { ArtifactTraitID = 929, ArtifactTraitName = "Harvester of Souls", },
    doom_vortex = { ArtifactTraitID = 930, ArtifactTraitName = "Doom Vortex", },
    sheiluns_gift = { ArtifactTraitID = 931, ArtifactTraitName = "Sheilun's Gift", },
    the_mists_of_sheilun = { ArtifactTraitID = 932, ArtifactTraitName = "The Mists of Sheilun", },
    blessings_of_yulon = { ArtifactTraitID = 933, ArtifactTraitName = "Blessings of Yu'lon", },
    celestial_breath = { ArtifactTraitID = 934, ArtifactTraitName = "Celestial Breath", },
    light_on_your_feet = { ArtifactTraitID = 935, ArtifactTraitName = "Light on Your Feet", },
    mists_of_life = { ArtifactTraitID = 936, ArtifactTraitName = "Mists of Life", },
    dancing_mists = { ArtifactTraitID = 937, ArtifactTraitName = "Dancing Mists", },
    coalescing_mists = { ArtifactTraitID = 938, ArtifactTraitName = "Coalescing Mists", },
    shroud_of_mist = { ArtifactTraitID = 939, ArtifactTraitName = "Shroud of Mist", },
    way_of_the_mistweaver = { ArtifactTraitID = 940, ArtifactTraitName = "Way of the Mistweaver", },
    protection_of_shaohao = { ArtifactTraitID = 941, ArtifactTraitName = "Protection of Shaohao", },
    extended_healing = { ArtifactTraitID = 942, ArtifactTraitName = "Extended Healing", },
    soothing_remedies = { ArtifactTraitID = 943, ArtifactTraitName = "Soothing Remedies", },
    infusion_of_life = { ArtifactTraitID = 944, ArtifactTraitName = "Infusion of Life", },
    spirit_tether = { ArtifactTraitID = 945, ArtifactTraitName = "Spirit Tether", },
    essence_of_the_mists = { ArtifactTraitID = 946, ArtifactTraitName = "Essence of the Mists", },
    reinforced_fur = { ArtifactTraitID = 948, ArtifactTraitName = "Reinforced Fur", },
    ursocs_endurance = { ArtifactTraitID = 949, ArtifactTraitName = "Ursoc's Endurance", },
    wildflesh = { ArtifactTraitID = 950, ArtifactTraitName = "Wildflesh", },
    perpetual_spring = { ArtifactTraitID = 951, ArtifactTraitName = "Perpetual Spring", },
    jagged_claws = { ArtifactTraitID = 952, ArtifactTraitName = "Jagged Claws", },
    bestial_fortitude = { ArtifactTraitID = 953, ArtifactTraitName = "Bestial Fortitude", },
    sharpened_instincts = { ArtifactTraitID = 954, ArtifactTraitName = "Sharpened Instincts", },
    mauler = { ArtifactTraitID = 955, ArtifactTraitName = "Mauler", },
    vicious_bites = { ArtifactTraitID = 956, ArtifactTraitName = "Vicious Bites", },
    bear_hug = { ArtifactTraitID = 957, ArtifactTraitName = "Bear Hug", },
    bloody_paws = { ArtifactTraitID = 958, ArtifactTraitName = "Bloody Paws", },
    roar_of_the_crowd = { ArtifactTraitID = 959, ArtifactTraitName = "Roar of the Crowd", },
    rage_of_the_sleeper = { ArtifactTraitID = 960, ArtifactTraitName = "Rage of the Sleeper", },
    embrace_of_the_nightmare = { ArtifactTraitID = 961, ArtifactTraitName = "Embrace of the Nightmare", },
    gory_fur = { ArtifactTraitID = 962, ArtifactTraitName = "Gory Fur", },
    power_of_the_silver_hand = { ArtifactTraitID = 963, ArtifactTraitName = "Power of the Silver Hand", },
    protection_of_tyr = { ArtifactTraitID = 964, ArtifactTraitName = "Protection of Tyr", },
    tyrs_deliverance = { ArtifactTraitID = 965, ArtifactTraitName = "Tyr's Deliverance", },
    the_light_saves = { ArtifactTraitID = 966, ArtifactTraitName = "The Light Saves", },
    protection_of_the_light = { ArtifactTraitID = 967, ArtifactTraitName = "Protection of the Light", },
    vindicator = { ArtifactTraitID = 968, ArtifactTraitName = "Vindicator", },
    share_the_burden = { ArtifactTraitID = 969, ArtifactTraitName = "Share the Burden", },
    focused_healing = { ArtifactTraitID = 970, ArtifactTraitName = "Focused Healing", },
    justice_through_sacrifice = { ArtifactTraitID = 971, ArtifactTraitName = "Justice through Sacrifice", },
    shock_treatment = { ArtifactTraitID = 972, ArtifactTraitName = "Shock Treatment", },
    templar_of_the_light = { ArtifactTraitID = 973, ArtifactTraitName = "Templar of the Light", },
    knight_of_the_silver_hand = { ArtifactTraitID = 974, ArtifactTraitName = "Knight of the Silver Hand", },
    blessings_of_the_silver_hand = { ArtifactTraitID = 975, ArtifactTraitName = "Blessings of the Silver Hand", },
    expel_the_darkness = { ArtifactTraitID = 976, ArtifactTraitName = "Expel the Darkness", },
    deliver_the_light = { ArtifactTraitID = 977, ArtifactTraitName = "Deliver the Light", },
    adaptive_fur = { ArtifactTraitID = 979, ArtifactTraitName = "Adaptive Fur", },
    juggernaut = { ArtifactTraitID = 980, ArtifactTraitName = "Juggernaut", },
    rage_of_the_valarjar = { ArtifactTraitID = 981, ArtifactTraitName = "Rage of the Valarjar", },
    odyns_champion = { ArtifactTraitID = 982, ArtifactTraitName = "Odyn's Champion", },
    odyns_fury = { ArtifactTraitID = 984, ArtifactTraitName = "Odyn's Fury", },
    focus_in_chaos = { ArtifactTraitID = 985, ArtifactTraitName = "Focus In Chaos", },
    helyas_wrath = { ArtifactTraitID = 986, ArtifactTraitName = "Helya's Wrath", },
    sense_death = { ArtifactTraitID = 987, ArtifactTraitName = "Sense Death", },
    deathdealer = { ArtifactTraitID = 988, ArtifactTraitName = "Deathdealer", },
    wild_slashes = { ArtifactTraitID = 989, ArtifactTraitName = "Wild Slashes", },
    wrath_and_fury = { ArtifactTraitID = 990, ArtifactTraitName = "Wrath and Fury", },
    unstoppable = { ArtifactTraitID = 991, ArtifactTraitName = "Unstoppable", },
    uncontrolled_rage = { ArtifactTraitID = 992, ArtifactTraitName = "Uncontrolled Rage", },
    battle_scars = { ArtifactTraitID = 993, ArtifactTraitName = "Battle Scars", },
    bloodcraze = { ArtifactTraitID = 994, ArtifactTraitName = "Bloodcraze", },
    unrivaled_strength = { ArtifactTraitID = 995, ArtifactTraitName = "Unrivaled Strength", },
    raging_berserker = { ArtifactTraitID = 996, ArtifactTraitName = "Raging Berserker", },
    rain_of_frogs = { ArtifactTraitID = 997, ArtifactTraitName = "Rain of Frogs", },
    reap_souls = { ArtifactTraitID = 999, ArtifactTraitName = "Reap Souls", },
    contained_fury = { ArtifactTraitID = 1000, ArtifactTraitName = "Contained Fury", },
    critical_chaos = { ArtifactTraitID = 1001, ArtifactTraitName = "Critical Chaos", },
    chaos_vision = { ArtifactTraitID = 1002, ArtifactTraitName = "Chaos Vision", },
    sharpened_glaives = { ArtifactTraitID = 1003, ArtifactTraitName = "Sharpened Glaives", },
    demon_rage = { ArtifactTraitID = 1004, ArtifactTraitName = "Demon Rage", },
    illidari_knowledge = { ArtifactTraitID = 1005, ArtifactTraitName = "Illidari Knowledge", },
    unleashed_demons = { ArtifactTraitID = 1006, ArtifactTraitName = "Unleashed Demons", },
    deceivers_fury = { ArtifactTraitID = 1007, ArtifactTraitName = "Deceiver's Fury", },
    overwhelming_power = { ArtifactTraitID = 1008, ArtifactTraitName = "Overwhelming Power", },
    fury_of_the_illidari = { ArtifactTraitID = 1010, ArtifactTraitName = "Fury of the Illidari", },
    feast_on_the_souls = { ArtifactTraitID = 1011, ArtifactTraitName = "Feast on the Souls", },
    demon_speed = { ArtifactTraitID = 1012, ArtifactTraitName = "Demon Speed", },
    balanced_blades = { ArtifactTraitID = 1013, ArtifactTraitName = "Balanced Blades", },
    inner_demons = { ArtifactTraitID = 1014, ArtifactTraitName = "Inner Demons", },
    rage_of_the_illidari = { ArtifactTraitID = 1015, ArtifactTraitName = "Rage of the Illidari", },
    anguish_of_the_deceiver = { ArtifactTraitID = 1016, ArtifactTraitName = "Anguish of the Deceiver", },
    undercurrent = { ArtifactTraitID = 1021, ArtifactTraitName = "Undercurrent", },
    cursed_queenfish_angling = { ArtifactTraitID = 1022, ArtifactTraitName = "Cursed Queenfish Angling", },
    mossgill_perch_angling = { ArtifactTraitID = 1023, ArtifactTraitName = "Mossgill Perch Angling", },
    highmountain_salmon_angling = { ArtifactTraitID = 1024, ArtifactTraitName = "Highmountain Salmon Angling", },
    stormray_angling = { ArtifactTraitID = 1025, ArtifactTraitName = "Stormray Angling", },
    runescale_koi_angling = { ArtifactTraitID = 1026, ArtifactTraitName = "Runescale Koi Angling", },
    black_barracuda_angling = { ArtifactTraitID = 1027, ArtifactTraitName = "Black Barracuda Angling", },
    better_luck_next_time = { ArtifactTraitID = 1028, ArtifactTraitName = "Better Luck Next Time", },
    surface_tension = { ArtifactTraitID = 1029, ArtifactTraitName = "Surface Tension", },
    bloodfishing = { ArtifactTraitID = 1030, ArtifactTraitName = "Bloodfishing", },
    luremaster = { ArtifactTraitID = 1031, ArtifactTraitName = "Luremaster", },
    underlight_blessing = { ArtifactTraitID = 1032, ArtifactTraitName = "Underlight Blessing", },
    way_of_the_flounder = { ArtifactTraitID = 1033, ArtifactTraitName = "Way of the Flounder", },
    bladed_feathers = { ArtifactTraitID = 1034, ArtifactTraitName = "Bladed Feathers", },
    touch_of_the_moon = { ArtifactTraitID = 1035, ArtifactTraitName = "Touch of the Moon", },
    dark_side_of_the_moon = { ArtifactTraitID = 1036, ArtifactTraitName = "Dark Side of the Moon", },
    twilight_glow = { ArtifactTraitID = 1037, ArtifactTraitName = "Twilight Glow", },
    solar_stabbing = { ArtifactTraitID = 1038, ArtifactTraitName = "Solar Stabbing", },
    scythe_of_the_stars = { ArtifactTraitID = 1039, ArtifactTraitName = "Scythe of the Stars", },
    falling_star = { ArtifactTraitID = 1040, ArtifactTraitName = "Falling Star", },
    sunfire_burns = { ArtifactTraitID = 1041, ArtifactTraitName = "Sunfire Burns", },
    empowerment = { ArtifactTraitID = 1042, ArtifactTraitName = "Empowerment", },
    rapid_innervation = { ArtifactTraitID = 1043, ArtifactTraitName = "Rapid Innervation", },
    light_of_the_sun = { ArtifactTraitID = 1044, ArtifactTraitName = "Light of the Sun", },
    sunblind = { ArtifactTraitID = 1045, ArtifactTraitName = "Sunblind", },
    moon_and_stars = { ArtifactTraitID = 1046, ArtifactTraitName = "Moon and Stars", },
    power_of_goldrinn = { ArtifactTraitID = 1047, ArtifactTraitName = "Power of Goldrinn", },
    echoing_stars = { ArtifactTraitID = 1048, ArtifactTraitName = "Echoing Stars", },
    new_moon = { ArtifactTraitID = 1049, ArtifactTraitName = "New Moon", },
    curse_of_the_dreadblades = { ArtifactTraitID = 1052, ArtifactTraitName = "Curse of the Dreadblades", },
    blunderbuss = { ArtifactTraitID = 1053, ArtifactTraitName = "Blunderbuss", },
    greed = { ArtifactTraitID = 1054, ArtifactTraitName = "Greed", },
    blurred_time = { ArtifactTraitID = 1055, ArtifactTraitName = "Blurred Time", },
    deception = { ArtifactTraitID = 1056, ArtifactTraitName = "Deception", },
    hidden_blade = { ArtifactTraitID = 1057, ArtifactTraitName = "Hidden Blade", },
    blademaster = { ArtifactTraitID = 1058, ArtifactTraitName = "Blademaster", },
    black_powder = { ArtifactTraitID = 1059, ArtifactTraitName = "Black Powder", },
    blade_dancer = { ArtifactTraitID = 1060, ArtifactTraitName = "Blade Dancer", },
    fates_thirst = { ArtifactTraitID = 1061, ArtifactTraitName = "Fate's Thirst", },
    fortunes_strike = { ArtifactTraitID = 1062, ArtifactTraitName = "Fortune's Strike", },
    gunslinger = { ArtifactTraitID = 1063, ArtifactTraitName = "Gunslinger", },
    fatebringer = { ArtifactTraitID = 1064, ArtifactTraitName = "Fatebringer", },
    fortune_strikes = { ArtifactTraitID = 1065, ArtifactTraitName = "Fortune Strikes", },
    ghostly_shell = { ArtifactTraitID = 1066, ArtifactTraitName = "Ghostly Shell", },
    fortunes_boon = { ArtifactTraitID = 1067, ArtifactTraitName = "Fortune's Boon", },
    fury_of_the_eagle = { ArtifactTraitID = 1068, ArtifactTraitName = "Fury of the Eagle", },
    sharpened_fang = { ArtifactTraitID = 1070, ArtifactTraitName = "Sharpened Fang", },
    my_beloved_monster = { ArtifactTraitID = 1071, ArtifactTraitName = "My Beloved Monster", },
    lacerating_talons = { ArtifactTraitID = 1072, ArtifactTraitName = "Lacerating Talons", },
    raptors_cry = { ArtifactTraitID = 1073, ArtifactTraitName = "Raptor's Cry", },
    fluffy_go = { ArtifactTraitID = 1074, ArtifactTraitName = "Fluffy, Go", },
    explosive_force = { ArtifactTraitID = 1075, ArtifactTraitName = "Explosive Force", },
    hellcarver = { ArtifactTraitID = 1076, ArtifactTraitName = "Hellcarver", },
    bird_of_prey = { ArtifactTraitID = 1077, ArtifactTraitName = "Bird of Prey", },
    hunters_bounty = { ArtifactTraitID = 1078, ArtifactTraitName = "Hunter's Bounty", },
    embrace_of_the_aspects = { ArtifactTraitID = 1079, ArtifactTraitName = "Embrace of the Aspects", },
    hunters_guile = { ArtifactTraitID = 1080, ArtifactTraitName = "Hunter's Guile", },
    terms_of_engagement = { ArtifactTraitID = 1081, ArtifactTraitName = "Terms of Engagement", },
    aspect_of_the_skylord = { ArtifactTraitID = 1082, ArtifactTraitName = "Aspect of the Skylord", },
    talon_strike = { ArtifactTraitID = 1083, ArtifactTraitName = "Talon Strike", },
    eagles_bite = { ArtifactTraitID = 1084, ArtifactTraitName = "Eagle's Bite", },
    frozen_skin = { ArtifactTraitID = 1090, ArtifactTraitName = "Frozen Skin", },
    chill_of_the_grave = { ArtifactTraitID = 1091, ArtifactTraitName = "Chill of the Grave", },
    frozen_soul = { ArtifactTraitID = 1092, ArtifactTraitName = "Frozen Soul", },
    strength_of_xuen = { ArtifactTraitID = 1094, ArtifactTraitName = "Strength of Xuen", },
    unleash_the_beast = { ArtifactTraitID = 1095, ArtifactTraitName = "Unleash the Beast", },
    soul_carver = { ArtifactTraitID = 1096, ArtifactTraitName = "Soul Carver", },
    demonic_flames = { ArtifactTraitID = 1097, ArtifactTraitName = "Demonic Flames", },
    painbringer = { ArtifactTraitID = 1098, ArtifactTraitName = "Painbringer", },
    aldrachi_design = { ArtifactTraitID = 1099, ArtifactTraitName = "Aldrachi Design", },
    aura_of_pain = { ArtifactTraitID = 1100, ArtifactTraitName = "Aura of Pain", },
    honed_warblades = { ArtifactTraitID = 1101, ArtifactTraitName = "Honed Warblades", },
    gift_of_the_queen = { ArtifactTraitID = 1102, ArtifactTraitName = "Gift of the Queen", },
    tidal_chains = { ArtifactTraitID = 1103, ArtifactTraitName = "Tidal Chains", },
    buffeting_waves = { ArtifactTraitID = 1104, ArtifactTraitName = "Buffeting Waves", },
    pull_of_the_sea = { ArtifactTraitID = 1105, ArtifactTraitName = "Pull of the Sea", },
    wavecrash = { ArtifactTraitID = 1106, ArtifactTraitName = "Wavecrash", },
    empowered_droplets = { ArtifactTraitID = 1107, ArtifactTraitName = "Empowered Droplets", },
    queen_ascendant = { ArtifactTraitID = 1108, ArtifactTraitName = "Queen Ascendant", },
    floodwaters = { ArtifactTraitID = 1109, ArtifactTraitName = "Floodwaters", },
    ghost_in_the_mist = { ArtifactTraitID = 1110, ArtifactTraitName = "Ghost in the Mist", },
    caress_of_the_tidemother = { ArtifactTraitID = 1111, ArtifactTraitName = "Caress of the Tidemother", },
    sense_of_urgency = { ArtifactTraitID = 1112, ArtifactTraitName = "Sense of Urgency", },
    refreshing_currents = { ArtifactTraitID = 1113, ArtifactTraitName = "Refreshing Currents", },
    servant_of_the_queen = { ArtifactTraitID = 1114, ArtifactTraitName = "Servant of the Queen", },
    tidal_pools = { ArtifactTraitID = 1115, ArtifactTraitName = "Tidal Pools", },
    queens_decree = { ArtifactTraitID = 1116, ArtifactTraitName = "Queen's Decree", },
    cumulative_upkeep = { ArtifactTraitID = 1117, ArtifactTraitName = "Cumulative Upkeep", },
    ashbringers_light = { ArtifactTraitID = 1118, ArtifactTraitName = "Ashbringer's Light", },
    eternal_agony = { ArtifactTraitID = 1119, ArtifactTraitName = "Eternal Agony", },
    eye_of_tyr = { ArtifactTraitID = 1120, ArtifactTraitName = "Eye of Tyr", },
    hammer_time = { ArtifactTraitID = 1121, ArtifactTraitName = "Hammer Time", },
    stern_judgment = { ArtifactTraitID = 1122, ArtifactTraitName = "Stern Judgment", },
    unflinching_defense = { ArtifactTraitID = 1123, ArtifactTraitName = "Unflinching Defense", },
    righteous_crusader = { ArtifactTraitID = 1124, ArtifactTraitName = "Righteous Crusader", },
    scatter_the_shadows = { ArtifactTraitID = 1125, ArtifactTraitName = "Scatter the Shadows", },
    consecration_in_flame = { ArtifactTraitID = 1126, ArtifactTraitName = "Consecration in Flame", },
    bastion_of_truth = { ArtifactTraitID = 1127, ArtifactTraitName = "Bastion of Truth", },
    resolve_of_truth = { ArtifactTraitID = 1128, ArtifactTraitName = "Resolve of Truth", },
    faiths_armor = { ArtifactTraitID = 1129, ArtifactTraitName = "Faith's Armor", },
    painful_truths = { ArtifactTraitID = 1130, ArtifactTraitName = "Painful Truths", },
    sacrifice_of_the_just = { ArtifactTraitID = 1131, ArtifactTraitName = "Sacrifice of the Just", },
    forbearant_faithful = { ArtifactTraitID = 1132, ArtifactTraitName = "Forbearant Faithful", },
    bulwark_of_order = { ArtifactTraitID = 1133, ArtifactTraitName = "Bulwark of Order", },
    light_of_the_titans = { ArtifactTraitID = 1134, ArtifactTraitName = "Light of the Titans", },
    tyrs_enforcer = { ArtifactTraitID = 1135, ArtifactTraitName = "Tyr's Enforcer", },
    warbreaker = { ArtifactTraitID = 1136, ArtifactTraitName = "Warbreaker", },
    shattered_defenses = { ArtifactTraitID = 1137, ArtifactTraitName = "Shattered Defenses", },
    void_cleave = { ArtifactTraitID = 1138, ArtifactTraitName = "Void Cleave", },
    corrupted_blood_of_zakajz = { ArtifactTraitID = 1139, ArtifactTraitName = "Corrupted Blood of Zakajz", },
    defensive_measures = { ArtifactTraitID = 1140, ArtifactTraitName = "Defensive Measures", },
    focus_in_battle = { ArtifactTraitID = 1141, ArtifactTraitName = "Focus in Battle", },
    will_of_the_first_king = { ArtifactTraitID = 1142, ArtifactTraitName = "Will of the First King", },
    unending_rage = { ArtifactTraitID = 1143, ArtifactTraitName = "Unending Rage", },
    one_against_many = { ArtifactTraitID = 1144, ArtifactTraitName = "One Against Many", },
    crushing_blows = { ArtifactTraitID = 1145, ArtifactTraitName = "Crushing Blows", },
    many_will_fall = { ArtifactTraitID = 1146, ArtifactTraitName = "Many Will Fall", },
    deathblow = { ArtifactTraitID = 1147, ArtifactTraitName = "Deathblow", },
    tactical_advance = { ArtifactTraitID = 1148, ArtifactTraitName = "Tactical Advance", },
    precise_strikes = { ArtifactTraitID = 1149, ArtifactTraitName = "Precise Strikes", },
    exploit_the_weakness = { ArtifactTraitID = 1150, ArtifactTraitName = "Exploit the Weakness", },
    touch_of_zakajz = { ArtifactTraitID = 1151, ArtifactTraitName = "Touch of Zakajz", },
    ashamanes_frenzy = { ArtifactTraitID = 1153, ArtifactTraitName = "Ashamane's Frenzy", },
    ashamanes_bite = { ArtifactTraitID = 1154, ArtifactTraitName = "Ashamane's Bite", },
    shadow_thrash = { ArtifactTraitID = 1155, ArtifactTraitName = "Shadow Thrash", },
    open_wounds = { ArtifactTraitID = 1156, ArtifactTraitName = "Open Wounds", },
    scent_of_blood = { ArtifactTraitID = 1157, ArtifactTraitName = "Scent of Blood", },
    protection_of_ashamane = { ArtifactTraitID = 1158, ArtifactTraitName = "Protection of Ashamane", },
    hardened_roots = { ArtifactTraitID = 1159, ArtifactTraitName = "Hardened Roots", },
    honed_instincts = { ArtifactTraitID = 1160, ArtifactTraitName = "Honed Instincts", },
    razor_fangs = { ArtifactTraitID = 1161, ArtifactTraitName = "Razor Fangs", },
    feral_power = { ArtifactTraitID = 1162, ArtifactTraitName = "Feral Power", },
    powerful_bite = { ArtifactTraitID = 1163, ArtifactTraitName = "Powerful Bite", },
    ashamanes_energy = { ArtifactTraitID = 1164, ArtifactTraitName = "Ashamane's Energy", },
    attuned_to_nature = { ArtifactTraitID = 1165, ArtifactTraitName = "Attuned to Nature", },
    tear_the_flesh = { ArtifactTraitID = 1166, ArtifactTraitName = "Tear the Flesh", },
    feral_instinct = { ArtifactTraitID = 1167, ArtifactTraitName = "Feral Instinct", },
    sharpened_claws = { ArtifactTraitID = 1168, ArtifactTraitName = "Sharpened Claws", },
    sloooow_down = { ArtifactTraitID = 1169, ArtifactTraitName = "Sloooow Down", },
    thalkiels_consumption = { ArtifactTraitID = 1170, ArtifactTraitName = "Thal'kiel's Consumption", },
    summoners_prowess = { ArtifactTraitID = 1171, ArtifactTraitName = "Summoner's Prowess", },
    legionwrath = { ArtifactTraitID = 1172, ArtifactTraitName = "Legionwrath", },
    the_doom_of_azeroth = { ArtifactTraitID = 1173, ArtifactTraitName = "The Doom of Azeroth", },
    sharpened_dreadfangs = { ArtifactTraitID = 1174, ArtifactTraitName = "Sharpened Dreadfangs", },
    dirty_hands = { ArtifactTraitID = 1175, ArtifactTraitName = "Dirty Hands", },
    infernal_furnace = { ArtifactTraitID = 1176, ArtifactTraitName = "Infernal Furnace", },
    maw_of_shadows = { ArtifactTraitID = 1177, ArtifactTraitName = "Maw of Shadows", },
    open_link = { ArtifactTraitID = 1178, ArtifactTraitName = "Open Link", },
    firm_resolve = { ArtifactTraitID = 1179, ArtifactTraitName = "Firm Resolve", },
    imperator = { ArtifactTraitID = 1180, ArtifactTraitName = "Imp-erator", },
    soul_skin = { ArtifactTraitID = 1181, ArtifactTraitName = "Soul Skin", },
    doom_doubled = { ArtifactTraitID = 1182, ArtifactTraitName = "Doom, Doubled", },
    the_expendables = { ArtifactTraitID = 1183, ArtifactTraitName = "The Expendables", },
    thalkiels_discord = { ArtifactTraitID = 1184, ArtifactTraitName = "Thal'kiel's Discord", },
    stolen_power = { ArtifactTraitID = 1185, ArtifactTraitName = "Stolen Power", },
    second_sunrise = { ArtifactTraitID = 1186, ArtifactTraitName = "Second Sunrise", },
    artificial_stamina = { ArtifactTraitID = 1187, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1188, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1189, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1190, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1191, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1192, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1193, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1194, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1195, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1196, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1197, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1198, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1199, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1200, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1201, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1202, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1203, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1204, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1205, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1206, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1207, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1208, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1209, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1210, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1211, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1212, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1213, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1214, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1215, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1216, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1217, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1218, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1219, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1220, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1221, ArtifactTraitName = "Artificial Stamina", },
    artificial_stamina = { ArtifactTraitID = 1222, ArtifactTraitName = "Artificial Stamina", },
    defensive_spikes = { ArtifactTraitID = 1228, ArtifactTraitName = "Defensive Spikes", },
    infernal_force = { ArtifactTraitID = 1229, ArtifactTraitName = "Infernal Force", },
    embrace_the_pain = { ArtifactTraitID = 1230, ArtifactTraitName = "Embrace the Pain", },
    fiery_demise = { ArtifactTraitID = 1231, ArtifactTraitName = "Fiery Demise", },
    will_of_the_illidari = { ArtifactTraitID = 1232, ArtifactTraitName = "Will of the Illidari", },
    devour_souls = { ArtifactTraitID = 1233, ArtifactTraitName = "Devour Souls", },
    shatter_the_souls = { ArtifactTraitID = 1234, ArtifactTraitName = "Shatter the Souls", },
    charred_warblades = { ArtifactTraitID = 1235, ArtifactTraitName = "Charred Warblades", },
    fueled_by_pain = { ArtifactTraitID = 1236, ArtifactTraitName = "Fueled by Pain", },
    blades_of_light = { ArtifactTraitID = 1237, ArtifactTraitName = "Blades of Light", },
    healing_storm = { ArtifactTraitID = 1238, ArtifactTraitName = "Healing Storm", },
    unbreakable_will = { ArtifactTraitID = 1239, ArtifactTraitName = "Unbreakable Will", },
    endless_resolve = { ArtifactTraitID = 1240, ArtifactTraitName = "Endless Resolve", },
    echo_of_the_highlord = { ArtifactTraitID = 1241, ArtifactTraitName = "Echo of the Highlord", },
    wrath_of_the_ashbringer = { ArtifactTraitID = 1242, ArtifactTraitName = "Wrath of the Ashbringer", },
    protector_of_the_ashen_blade = { ArtifactTraitID = 1243, ArtifactTraitName = "Protector of the Ashen Blade", },
    might_of_the_templar = { ArtifactTraitID = 1244, ArtifactTraitName = "Might of the Templar", },
    deliver_the_justice = { ArtifactTraitID = 1245, ArtifactTraitName = "Deliver the Justice", },
    divine_tempest = { ArtifactTraitID = 1246, ArtifactTraitName = "Divine Tempest", },
    deflection = { ArtifactTraitID = 1247, ArtifactTraitName = "Deflection", },
    embrace_the_light = { ArtifactTraitID = 1248, ArtifactTraitName = "Embrace the Light", },
    righteous_blade = { ArtifactTraitID = 1249, ArtifactTraitName = "Righteous Blade", },
    sharpened_edge = { ArtifactTraitID = 1250, ArtifactTraitName = "Sharpened Edge", },
    highlords_judgment = { ArtifactTraitID = 1251, ArtifactTraitName = "Highlord's Judgment", },
    wake_of_ashes = { ArtifactTraitID = 1252, ArtifactTraitName = "Wake of Ashes", },
    ashes_to_ashes = { ArtifactTraitID = 1253, ArtifactTraitName = "Ashes to Ashes", },
    artificial_damage = { ArtifactTraitID = 1254, ArtifactTraitName = "Artificial Damage", },
    artificial_damage = { ArtifactTraitID = 1255, ArtifactTraitName = "Artificial Damage", },
    artificial_damage = { ArtifactTraitID = 1256, ArtifactTraitName = "Artificial Damage", },
    artificial_damage = { ArtifactTraitID = 1257, ArtifactTraitName = "Artificial Damage", },
    artificial_damage = { ArtifactTraitID = 1258, ArtifactTraitName = "Artificial Damage", },
    blade_of_light = { ArtifactTraitID = 1275, ArtifactTraitName = "Blade of Light", },
    assassins_blades = { ArtifactTraitID = 1276, ArtifactTraitName = "Assassin's Blades", },
    exploding_keg = { ArtifactTraitID = 1277, ArtifactTraitName = "Exploding Keg", },
    obsidian_fists = { ArtifactTraitID = 1278, ArtifactTraitName = "Obsidian Fists", },
    hot_blooded = { ArtifactTraitID = 1279, ArtifactTraitName = "Hot Blooded", },
    overflow = { ArtifactTraitID = 1280, ArtifactTraitName = "Overflow", },
    dark_side_of_the_moon = { ArtifactTraitID = 1281, ArtifactTraitName = "Dark Side of the Moon", },
    staggering_around = { ArtifactTraitID = 1282, ArtifactTraitName = "Staggering Around", },
    healthy_appetite = { ArtifactTraitID = 1283, ArtifactTraitName = "Healthy Appetite", },
    gifted_student = { ArtifactTraitID = 1284, ArtifactTraitName = "Gifted Student", },
    potent_kick = { ArtifactTraitID = 1285, ArtifactTraitName = "Potent Kick", },
    face_palm = { ArtifactTraitID = 1286, ArtifactTraitName = "Face Palm", },
    swift_as_a_coursing_river = { ArtifactTraitID = 1287, ArtifactTraitName = "Swift as a Coursing River", },
    obstinate_determination = { ArtifactTraitID = 1288, ArtifactTraitName = "Obstinate Determination", },
    smashed = { ArtifactTraitID = 1289, ArtifactTraitName = "Smashed", },
    dragonfire_brew = { ArtifactTraitID = 1290, ArtifactTraitName = "Dragonfire Brew", },
    brewstache = { ArtifactTraitID = 1291, ArtifactTraitName = "Brew-Stache", },
    fortification = { ArtifactTraitID = 1292, ArtifactTraitName = "Fortification", },
    full_keg = { ArtifactTraitID = 1293, ArtifactTraitName = "Full Keg", },
    skywrath = { ArtifactTraitID = 1294, ArtifactTraitName = "Skywrath", },
    mists_of_wisdom = { ArtifactTraitID = 1295, ArtifactTraitName = "Mists of Wisdom", },
    shattering_bolts = { ArtifactTraitID = 1296, ArtifactTraitName = "Shattering Bolts", },
    shredder_fangs = { ArtifactTraitID = 1327, ArtifactTraitName = "Shredder Fangs", },
    tormented_souls = { ArtifactTraitID = 1328, ArtifactTraitName = "Tormented Souls", },
    warglaives_of_chaos = { ArtifactTraitID = 1330, ArtifactTraitName = "Warglaives of Chaos", },
    sanguinary_affinity = { ArtifactTraitID = 1331, ArtifactTraitName = "Sanguinary Affinity", },
    blades_of_frost = { ArtifactTraitID = 1332, ArtifactTraitName = "Blades of Frost", },
    feast_of_souls = { ArtifactTraitID = 1333, ArtifactTraitName = "Feast of Souls", },
    iron_claws = { ArtifactTraitID = 1334, ArtifactTraitName = "Iron Claws", },
    natures_vigor = { ArtifactTraitID = 1335, ArtifactTraitName = "Nature's Vigor", },
    beast_master = { ArtifactTraitID = 1336, ArtifactTraitName = "Beast Master", },
    wind_arrows = { ArtifactTraitID = 1337, ArtifactTraitName = "Wind Arrows", },
    iron_talons = { ArtifactTraitID = 1338, ArtifactTraitName = "Iron Talons", },
    might_of_the_guardians = { ArtifactTraitID = 1339, ArtifactTraitName = "Might of the Guardians", },
    wings_of_flame = { ArtifactTraitID = 1340, ArtifactTraitName = "Wings of Flame", },
    dark_skies = { ArtifactTraitID = 1341, ArtifactTraitName = "Dark Skies", },
    virtues_of_the_light = { ArtifactTraitID = 1342, ArtifactTraitName = "Virtues of the Light", },
    truthguards_light = { ArtifactTraitID = 1343, ArtifactTraitName = "Truthguard's Light", },
    invoke_the_light = { ArtifactTraitID = 1345, ArtifactTraitName = "Invoke the Light", },
    follower_of_the_light = { ArtifactTraitID = 1346, ArtifactTraitName = "Follower of the Light", },
    void_siphon = { ArtifactTraitID = 1347, ArtifactTraitName = "Void Siphon", },
    cursed_edges = { ArtifactTraitID = 1348, ArtifactTraitName = "Cursed Edges", },
    shadow_fangs = { ArtifactTraitID = 1349, ArtifactTraitName = "Shadow Fangs", },
    surge_of_power = { ArtifactTraitID = 1350, ArtifactTraitName = "Surge of Power", },
    hammer_of_storms = { ArtifactTraitID = 1351, ArtifactTraitName = "Hammer of Storms", },
    grace_of_the_sea = { ArtifactTraitID = 1352, ArtifactTraitName = "Grace of the Sea", },
    crystalline_shadows = { ArtifactTraitID = 1353, ArtifactTraitName = "Crystalline Shadows", },
    breath_of_thalkiel = { ArtifactTraitID = 1354, ArtifactTraitName = "Breath of Thal'kiel", },
    flames_of_the_pit = { ArtifactTraitID = 1355, ArtifactTraitName = "Flames of the Pit", },
    thoradins_might = { ArtifactTraitID = 1356, ArtifactTraitName = "Thoradin's Might", },
    thirst_for_battle = { ArtifactTraitID = 1357, ArtifactTraitName = "Thirst for Battle", },
    strength_of_the_earth_aspect = { ArtifactTraitID = 1358, ArtifactTraitName = "Strength of the Earth Aspect", },
    the_hungering_maw = { ArtifactTraitID = 1359, ArtifactTraitName = "The Hungering Maw", },
    soulbiter = { ArtifactTraitID = 1360, ArtifactTraitName = "Soulbiter", },
    fleshsearer = { ArtifactTraitID = 1361, ArtifactTraitName = "Fleshsearer", },
    chaos_burn = { ArtifactTraitID = 1362, ArtifactTraitName = "Chaos Burn", },
    soulgorger = { ArtifactTraitID = 1363, ArtifactTraitName = "Soulgorger", },
    goldrinns_fury = { ArtifactTraitID = 1364, ArtifactTraitName = "Goldrinn's Fury", },
    fangs_of_the_first = { ArtifactTraitID = 1365, ArtifactTraitName = "Fangs of the First", },
    ursocs_bond = { ArtifactTraitID = 1366, ArtifactTraitName = "Ursoc's Bond", },
    ghanirs_bloom = { ArtifactTraitID = 1367, ArtifactTraitName = "G'Hanir's Bloom", },
    spiritbound = { ArtifactTraitID = 1368, ArtifactTraitName = "Spiritbound", },
    windflight_arrows = { ArtifactTraitID = 1369, ArtifactTraitName = "Windflight Arrows", },
    voice_of_the_wild_gods = { ArtifactTraitID = 1370, ArtifactTraitName = "Voice of the Wild Gods", },
    ancient_power = { ArtifactTraitID = 1371, ArtifactTraitName = "Ancient Power", },
    empowered_spellblade = { ArtifactTraitID = 1372, ArtifactTraitName = "Empowered Spellblade", },
    spellborne = { ArtifactTraitID = 1373, ArtifactTraitName = "Spellborne", },
    wanderers_hardiness = { ArtifactTraitID = 1374, ArtifactTraitName = "Wanderer's Hardiness", },
    mistweaving = { ArtifactTraitID = 1375, ArtifactTraitName = "Mistweaving", },
    windborne_blows = { ArtifactTraitID = 1376, ArtifactTraitName = "Windborne Blows", },
    silver_touch = { ArtifactTraitID = 1377, ArtifactTraitName = "Silver Touch", },
    unrelenting_light = { ArtifactTraitID = 1378, ArtifactTraitName = "Unrelenting Light", },
    forbidden_flame = { ArtifactTraitID = 1379, ArtifactTraitName = "Forbidden Flame", },
    beacon_of_light = { ArtifactTraitID = 1380, ArtifactTraitName = "Beacon of Light", },
    darkening_whispers = { ArtifactTraitID = 1381, ArtifactTraitName = "Darkening Whispers", },
    slayers_precision = { ArtifactTraitID = 1384, ArtifactTraitName = "Slayer's Precision", },
    cursed_steel = { ArtifactTraitID = 1385, ArtifactTraitName = "Cursed Steel", },
    legionblade = { ArtifactTraitID = 1386, ArtifactTraitName = "Legionblade", },
    stormkeepers_power = { ArtifactTraitID = 1387, ArtifactTraitName = "Stormkeeper's Power", },
    earthshattering_blows = { ArtifactTraitID = 1388, ArtifactTraitName = "Earthshattering Blows", },
    flow_of_the_tides = { ArtifactTraitID = 1389, ArtifactTraitName = "Flow of the Tides", },
    soulstealer = { ArtifactTraitID = 1390, ArtifactTraitName = "Soulstealer", },
    thalkiels_lingering_power = { ArtifactTraitID = 1391, ArtifactTraitName = "Thal'kiel's Lingering Power", },
    stolen_power = { ArtifactTraitID = 1392, ArtifactTraitName = "Stolen Power", },
    unbreakable_steel = { ArtifactTraitID = 1393, ArtifactTraitName = "Unbreakable Steel", },
    titanic_power = { ArtifactTraitID = 1394, ArtifactTraitName = "Titanic Power", },
    unbreakable_bulwark = { ArtifactTraitID = 1395, ArtifactTraitName = "Unbreakable Bulwark", },
    siphon_power = { ArtifactTraitID = 1434, ArtifactTraitName = "Siphon Power", },
    artificial_damage = { ArtifactTraitID = 1436, ArtifactTraitName = "Artificial Damage", },
    artificial_damage = { ArtifactTraitID = 1451, ArtifactTraitName = "Artificial Damage", },
    artificial_damage = { ArtifactTraitID = 1452, ArtifactTraitName = "Artificial Damage", },
    artificial_damage = { ArtifactTraitID = 1453, ArtifactTraitName = "Artificial Damage", },
    artificial_damage = { ArtifactTraitID = 1454, ArtifactTraitName = "Artificial Damage", },
    artificial_damage = { ArtifactTraitID = 1455, ArtifactTraitName = "Artificial Damage", },
    artificial_damage = { ArtifactTraitID = 1456, ArtifactTraitName = "Artificial Damage", },
}
