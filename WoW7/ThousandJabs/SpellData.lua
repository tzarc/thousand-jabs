local LibStub = LibStub
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local TableCache = TJ:GetModule('TableCache')

local LSD = LibStub("LibSerpentDump")
local SpellData = LibStub("LibSpellData")

local ct = function() return TableCache:Acquire() end
local rt = function(tbl) TableCache:Release(tbl) end

local BOOKTYPE_PET = BOOKTYPE_PET
local BOOKTYPE_SPELL = BOOKTYPE_SPELL
local co_yield = coroutine.yield
local GetActiveSpecGroup = GetActiveSpecGroup
local GetLocale = GetLocale
local GetMaxTalentTier = GetMaxTalentTier
local GetSpecialization = GetSpecialization
local GetSpecializationInfo = GetSpecializationInfo
local GetTalentInfo = GetTalentInfo
local GetTalentInfoBySpecialization = GetTalentInfoBySpecialization
local IsRightAltKeyDown = IsRightAltKeyDown
local IsRightControlKeyDown = IsRightControlKeyDown
local IsRightShiftKeyDown = IsRightShiftKeyDown
local LearnTalent = LearnTalent
local mfloor = math.floor
local pairs = pairs
local GetBuildInfo = GetBuildInfo
local real_G = _G
local select = select
local tconcat = table.concat
local tContains = tContains
local tinsert = table.insert

Core:Safety()

------------------------------------------------------------------------------------------------------------------------
-- Retrieve all abilities from the spellbook
------------------------------------------------------------------------------------------------------------------------

local lastExportedSpecialisation = nil
local definedAbilities = {}
local function slug(name)
    if GetLocale() ~= "enUS" then return name end -- Slug names are only relevant for en-US, other locales are internally matched by spellID anyway
    return name:lower():gsub(' ','_'):gsub('[^%w_]','')
end
local blacklistedExportedAbilities = {
    'apprentice_riding',
    'arcane_acuity',
    'arcane_affinity',
    'arcane_resistance',
    'arcane_torrent',
    'archaeology',
    'armor_skills',
    'auto_attack',
    'avoidance',
    'beast_slaying',
    'best_deals_anywhere',
    'better_living_through_chemistry',
    'blacksmithing',
    'bouncy',
    'broken_isles_pathfinder',
    'celestial_fortune',
    'cold_weather_flying',
    'combat_ally',
    'command_demon',
    'cooking_fire',
    'cooking',
    'da_voodoo_shuffle',
    'disenchant',
    'double_jump',
    'draenor_pathfinder',
    'enchanting',
    'engineering',
    'epicurean',
    'first_aid',
    'fishing',
    'flight_masters_license',
    'garrison_ability',
    'gnomish_engineer',
    'goblin_engineer',
    'gourmand',
    'guild_mail',
    'hasty_hearth',
    'herb_gathering',
    'herbalism_skills',
    'honorable_medallion',
    'inner_peace',
    'jewelcrafting',
    'languages',
    'master_riding',
    'mastery_chaotic_energies',
    'mining_skills',
    'mobile_banking',
    'mount_up',
    'pack_hobgoblin',
    'path_of_the_black_ox',
    'path_of_the_jade_serpent',
    'path_of_the_mogu_king',
    'path_of_the_necromancer',
    'path_of_the_scarlet_blade',
    'path_of_the_scarlet_mitre',
    'path_of_the_setting_sun',
    'path_of_the_shadopan',
    'path_of_the_stout_brew',
    'portal_dalaran__northrend',
    'portal_orgrimmar',
    'portal_shattrath',
    'portal_silvermoon',
    'portal_stonard',
    'portal_thunder_bluff',
    'portal_undercity',
    'prospecting',
    'quaking_palm',
    'regeneration',
    'revive_battle_pets',
    'rocket_barrage',
    'rocket_jump',
    'shoot',
    'survey',
    'teleport_dalaran__northrend',
    'teleport_hall_of_the_guardian',
    'teleport_orgrimmar',
    'teleport_shattrath',
    'teleport_silvermoon',
    'teleport_stonard',
    'teleport_thunder_bluff',
    'teleport_undercity',
    'the_codex_of_xerrath',
    'the_quick_and_the_dead',
    'time_is_money',
    'weapon_skills',
    'windwalking',
    'wisdom_of_the_four_winds',
    'zen_pilgrimage_return',
    'zen_pilgrimage',
}

function TJ:DetectAbilitiesFromSpellBook()
    local abilities = {}

    -- Helper to work out the 'simulationcraft-ified' name for the spell
    -- Iterate over the spellbook, collecting all the abilities
    local function RetrieveSpells(bookType, caster)
        local st = ct()
        for spellID, spellName, spellSubText, spellBookSlotID, spellIsTalent, spellIcon, castTime, isPassive, isOffSpec, isPlayerSpell in SpellData.IterateSpellBook(bookType) do
            if spellID and spellName and spellBookSlotID and not isOffSpec then
                abilities[slug(spellName)] = {
                    Name = spellName,
                    SpellIDs = { spellID },
                    KeyedSpellIDs = { [spellID] = true },
                    SpellBookSubtext = spellSubText,
                    SpellBookItem = spellBookSlotID,
                    IsTalent = spellIsTalent,
                    IsPassive = isPassive,
                    SpellBookSpellID = spellID,
                    Icon = spellIcon,
                    SpellBookCaster = caster
                }
            end
        end
        rt(st)
    end

    RetrieveSpells(BOOKTYPE_SPELL, 'player')
    RetrieveSpells(BOOKTYPE_PET, 'pet')

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
    definedAbilities = Core:MergeTables(abilities, definedAbilities)

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

    local function Detect()
        TJ:DetectAbilitiesFromSpellBook()
        co_yield()
        TJ:DetectAbilitiesFromSpellBook()
        TJ:QueueProfileReload(true)
        co_yield()
    end

    self:ExecuteFuncAsCoroutine(function()
        local canceled = false

        -- Start off by detecting the initial set with current talent loadout
        Detect()

        -- Swap all talents to generate all spell information
        if runAllPossibleCombinations then
            local allPermutations = GeneratePermutations({1,2,3}, GetMaxTalentTier())
            for perm=1,#allPermutations do
                for i=1,GetMaxTalentTier() do
                    LearnTalent(GetTalentInfoBySpecialization(specID, i, allPermutations[perm][i]))
                end
                Detect()

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
                        Detect()
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
            Detect()
        end

        -- Show the spell export window
        if not canceled then
            TJ:ShowSpellExportWindow()
        else
            TJ:Print('Spell data export canceled.')
        end
    end)
end

function TJ:ShowSpellExportWindow()
    -- Build the string
    local export = ''
    local addline = function(...)
        export = Core:Format("%s\n%s", export, Core:Format(...))
    end

    local gameVersion = GetBuildInfo()

    -- Ability IDs
    addline("-- exported with /tj _esd")
    addline("local %s_abilities_exported = {", select(2, GetSpecializationInfo(GetSpecialization())):lower())
    for k,v in Core:OrderedPairs(definedAbilities) do
        if not tContains(blacklistedExportedAbilities, k) then
            local line = Core:Format('    %s = { ', k)
            if v.KeyedSpellIDs then
                local ids = {}
                for id in Core:OrderedPairs(v.KeyedSpellIDs) do
                    ids[1+#ids] = id
                end
                line = line .. Core:Format('SpellIDs = { %s }, ', tconcat(ids, ", "))
            end
            if v.TalentID then line = line .. Core:Format('TalentID = %d, ', v.TalentID) end
            line = line .. '},'
            addline(line)
        end
    end
    addline("}")
    addline("")

    -- Display the exported data
    Core:OpenDebugWindow('Thousand Jabs Actions Data Export', export)
end

function TJ:ExportSpecsTables()
    local allClasses = {}
    local allSpecs = {}
    for classID=1,30 do
        local className, classToken = GetClassInfo(classID)
        if className then
            local noSpaceClassName = className:gsub(' ', '')
            for specID=1,10 do
                local specNumber, specName = GetSpecializationInfoForClassID(classID, specID)
                if specNumber then
                    local simcSpecName = specName:gsub(' ', '_'):lower()
                    allSpecs[noSpaceClassName] = allSpecs[noSpaceClassName] or {
                        classID = classID,
                        className = className,
                        noSpaceClassName = noSpaceClassName,
                        classToken = classToken,
                        specs = {}
                    }

                    allSpecs[noSpaceClassName].specs[simcSpecName] = allSpecs[noSpaceClassName].specs[simcSpecName] or {}
                    allSpecs[noSpaceClassName].specs[simcSpecName] = {
                        specID = specID,
                        specName = specName,
                        simcSpecName = simcSpecName,
                        specNumber = specNumber
                    }
                end
            end
        end
    end

    local output = "# Exported by /tj _est\nmy $exportedSpecData = {"
    local firstClass = true
    for className,classData in Core:OrderedPairs(allSpecs) do
        output = output .. Core:Format("%s\n    %s => {", firstClass and '' or ',', className)
        output = output .. Core:Format("\n        classID => %d,", classData.classID)
        output = output .. Core:Format("\n        name => '%s',", classData.className)
        output = output .. Core:Format("\n        specs => {")
        local firstSpec = true
        for specName,specData in Core:OrderedPairs(classData.specs) do
            output = output .. Core:Format("%s\n            %s => { specID => %d, name => \"%s\" }", firstSpec and '' or ',', specName, specData.specID, specData.specName)
            firstSpec = false
        end
        output = output .. "\n        }"
        output = output .. "\n    }"
        firstClass = false
    end
    output = output .. "\n};"
    output = output .. "\n\nlocal lua_spec_table = " .. LSD(allSpecs)
    Core:OpenDebugWindow('Thousand Jabs Spec Data Export', output)
end
