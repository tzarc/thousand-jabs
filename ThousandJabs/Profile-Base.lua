local LibStub = LibStub
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Config = TJ:GetModule('Config')

local LSD = LibStub('LibSerpentDump')
local SpellData = LibStub('LibSpellData')

local ct = function() return TableCache:Acquire() end
local rt = function(tbl) TableCache:Release(tbl) end

local BOOKTYPE_PET = BOOKTYPE_PET
local BOOKTYPE_SPELL = BOOKTYPE_SPELL
local GetSpecialization = GetSpecialization
local GetSpellInfo = GetSpellInfo
local GetSpellLevelLearned = GetSpellLevelLearned
local GetTalentInfoByID = GetTalentInfoByID
local IsSpellInRange = IsSpellInRange
local mfloor = math.floor
local mmax = math.max
local mmin = math.min
local pairs = pairs
local getmetatable = getmetatable
local rawget = rawget
local select = select
local tonumber = tonumber
local tsort = table.sort
local type = type
local UnitClass = UnitClass
local UnitSpellHaste = UnitSpellHaste
local unpack = unpack
local wipe = wipe

Core:Safety()

local function expressionPrimaryModifier(keyword, profileSubstitutions)
    if keyword:match('^([%d%.]+)$') then return keyword end

    local before = keyword

    -- Selectors starting with a digit...
    keyword = keyword:gsub('([^%d])%.([%d]+)$', '%1[%2]') -- any trailing digit selectors with no following field (i.e.  something.1) we change to array indexing
    keyword = keyword:gsub('([^%d])%.([%d]+)%.', '%1[%2].') -- any trailing digit selectors with following field (i.e.  something.1.field) we change to array indexing
    keyword = keyword:gsub('([^%d])%.(%d.+)', '%1[\"%2\"]') -- any digit selectors starting with a digit but having trailing text (i.e.  something.111name) we change to string indexing

    -- Min/max modifiers (ignored)
    keyword = keyword:gsub("^min:", "")
    keyword = keyword:gsub("^max:", "")

    -- Casting checks
    if keyword == "debuff.casting.up" then keyword = "target.is_casting" end
    if keyword == "debuff.casting.down" then keyword = "(not target.is_casting)" end
    if keyword == "target.debuff.casting.up" then keyword = "target.is_casting" end
    if keyword == "target.debuff.casting.react" then keyword = "target.is_casting" end
    if keyword == "target.debuff.casting.down" then keyword = "(not target.is_casting)" end
    if keyword == "buff.casting.up" then keyword = "player.is_casting" end
    if keyword == "buff.casting.down" then keyword = "(not player.is_casting)" end

    -- GCD values
    if keyword == "gcd.max" then keyword = "gcd_max" end
    if keyword == "gcd.remains" then keyword = "gcd_remains" end

    -- Single-word conversions
    if keyword == "refreshable" then keyword = "spell.THIS_SPELL.refreshable" end
    if keyword == "time" then keyword = "time_since_combat_start" end
    if keyword == "cooldown" then keyword = "cooldown.THIS_SPELL.remains" end
    if keyword == "cooldown_react" then keyword = "cooldown.THIS_SPELL.react" end
    if keyword == "duration" then keyword = "aura.THIS_SPELL.duration" end
    if keyword == "ticking" then keyword = "aura.THIS_SPELL.ticking" end
    if keyword == "delay" then keyword = "spell.THIS_SPELL.delay" end
    if keyword == "remains" then keyword = "aura.THIS_SPELL.remains" end
    if keyword == "cast_time" then keyword = "spell.THIS_SPELL.cast_time" end
    if keyword == "tick_time" then keyword = "spell.THIS_SPELL.tick_time" end
    if keyword == "charges" then keyword = "spell.THIS_SPELL.charges" end
    if keyword == "charges_fractional" then keyword = "spell.THIS_SPELL.charges_fractional" end
    if keyword == "max_charges" then keyword = "spell.THIS_SPELL.max_charges" end
    if keyword == "recharge_time" then keyword = "spell.THIS_SPELL.recharge_time" end
    if keyword == "execute_time" then keyword = "spell.THIS_SPELL.execute_time" end
    if keyword == "level" then keyword = "level.curr" end
    if keyword == "mana" then keyword = "mana.curr" end
    if keyword == "energy" then keyword = "energy.curr" end
    if keyword == "rage" then keyword = "rage.curr" end
    if keyword == "chi" then keyword = "chi.curr" end
    if keyword == "pain" then keyword = "pain.curr" end
    if keyword == "fury" then keyword = "fury.curr" end
    if keyword == "rune" then keyword = "rune.curr" end
    if keyword == "runic_power" then keyword = "runic_power.curr" end
    if keyword == "soul_fragments" then keyword = "soul_fragments.curr" end
    keyword = keyword:gsub("^soul_shard", "soul_shards")
    keyword = keyword:gsub("^soul_shardss", "soul_shards")
    if keyword == "soul_shards" then keyword = "soul_shards.curr" end
    if keyword == "maelstrom" then keyword = "maelstrom.curr" end

    -- Aura consolidation
    keyword = keyword:gsub("^target%.dot%.", "aura.")
    keyword = keyword:gsub("^target%.buff%.", "aura.")
    keyword = keyword:gsub("^target%.debuff%.", "aura.")
    keyword = keyword:gsub("^dot%.", "aura.")
    keyword = keyword:gsub("^debuff%.", "aura.")
    keyword = keyword:gsub("^buff%.", "aura." )

    -- Convert spell_targets.????? to just spell_targets
    keyword = keyword:gsub('^spell_targets%..*', 'spell_targets')

    -- Convert (action.blah.zzz) => (spell.blah.zzz)
    keyword = keyword:gsub('^action%.(.*)', 'spell.%1')

    -- Equipped items
    keyword = keyword:gsub('^equipped%.(%d+)', 'equipped[%1]')
    keyword = keyword:gsub('^equipped%.([%a_]+)', 'equipped["%1"]')

    -- Incoming damage
    keyword = keyword:gsub('^incoming_damage_([%d]+)s', function(a) return Core:Format('incoming_damage_over_%d', tonumber(a) * 1000) end)
    keyword = keyword:gsub('^incoming_damage_([%d]+)ms', function(a) return Core:Format('incoming_damage_over_%d', tonumber(a)) end)

    -- Convert XXXXX.YYYYY.ZZZZZ -> YYYYY.XXXXX_ZZZZZ (talent.blah.enabled -> blah.talent_enabled)
    keyword = keyword:gsub('([%a_]+)%.([%a_]+)%.([%a_%.]+)', function(a, b, c) return Core:Format("%s.%s_%s", b, a, c:gsub("%.", "_")) end)

    -- Percentage consolidation
    keyword = keyword:gsub("_pct$", "_percent")
    keyword = keyword:gsub("%.pct$", ".percent")

    -- Fixup time_to_die
    keyword = keyword:gsub("time_to_die.target_remains", "target.time_to_die")

    -- Pet stuff
    keyword = keyword:gsub('^([%a_]+)%.pet_([%a_]+)$', 'pet.%1_%2')

    -- Handle any profile-specific substitutions
    if profileSubstitutions then
        for _, e in pairs(profileSubstitutions) do
            keyword = keyword:gsub(e[1], e[2])
        end
    end

    return keyword
end

local function fixMathFuncs(expr)
    -- Min/max modifiers (function calls)
    expr = expr:gsub("math%.abs%(", "_mabs(")
    expr = expr:gsub("math%.ceil%(", "_mceil(")
    expr = expr:gsub("math%.floor%(", "_mfloor(")
    expr = expr:gsub("math%.min%(", "_mmin(")
    expr = expr:gsub("math%.max%(", "_mmax(")
    return expr
end

local function profile__ClearActionsPrototype(self)
    if self.parsedActions then rt(self.parsedActions) end
    self.parsedActions = nil
end

local function profile__LoadActionsPrototype(self)
    local config = self.config

    if Core.devMode then self:ClearActions() end

    if not self.parsedActions then
        local converted = ct()
        -- Handler for performing string replacements for all of the detected keywords in each of the APL lines
        local function primaryModifier(str)
            if converted[str] then return converted[str] end
            local res = expressionPrimaryModifier(str, config.conditional_substitutions)
            converted[str] = res
            return res
        end

        -- Update the parsed actions
        local aplID = Config:GetSpecGeneric("aplID") or self.defaultActionProfile
        local aplDef = TJ.profileDefinitions[aplID] or TJ.profileDefinitions[self.defaultActionProfile]
        if aplDef.classID == config.class_id and aplDef.specID == config.spec_id then
            self.parsedActions = Core:ExpressionParser(aplDef.aplData, primaryModifier)
        else
            Core:Error(Core:Format("Mismatching class/spec IDs: APL expects %s/%s, character is %s/%s.", aplDef.classID, aplDef.specID, config.class_id, config.spec_id))
            TJ:DeactivateProfile()
            rt(converted)
            return
        end

        -- Create the condition functions for each action
        local counts = ct()
        for listName, listTable in pairs(self.parsedActions) do
            counts[listName] = counts[listName] or ct()
            -- Loop through each entry in each named action list
            for _, entry in pairs(listTable) do
                -- Update the action count
                counts[listName][entry.action] = (counts[listName][entry.action] or 0) + 1

                -- Work out the key
                entry.key = (entry.action == "run_action_list" or entry.action == "call_action_list")
                    and Core:Format("%s:%s[%s]", listName, entry.action, entry.params.name)
                    or Core:Format("%s:%s[%s]", listName, entry.action, counts[listName][entry.action])

                -- Create a default prcondition, based on whether the spell is castable
                local is_chained_list = (entry.action == "run_action_list" or entry.action == "call_action_list") and true or false
                entry.precondition = is_chained_list and "true" or Core:Format("%s.spell_can_cast", entry.action)

                -- If the 'sync' flag is set, then add appropriate conditions to match
                if type(entry.params.sync) ~= "nil" then
                    entry.precondition = Core:Format("(%s) and (%s.spell_can_cast or %s.cooldown_up or %s.aura_remains > 0)", entry.precondition, entry.params.sync, entry.params.sync, entry.params.sync)
                end

                -- Create the condition function
                if type(entry.condition_func) == "nil" then
                    if type(entry.params.condition_converted) ~= "nil" or type(entry.params.target_if_converted) ~= "nil" then
                        local cond = entry.params.condition_converted or entry.params.target_if_converted
                        entry.fullconditionfuncsrc = Core:Format("((%s) and (%s))", entry.precondition, cond.expression:gsub('THIS_SPELL', entry.action))
                    else
                        entry.fullconditionfuncsrc = entry.precondition
                    end
                    entry.condition_func = Core:LoadFunctionString(Core:Format("function() return ((%s) and true or false) end", fixMathFuncs(entry.fullconditionfuncsrc)), Core:Format("cond:%s", entry.key))
                end

                -- Create the variable result function
                if type(entry.value_func) == "nil" and type(entry.params.value_converted) ~= "nil" then
                    entry.fullvaluefuncsrc = entry.params.value_converted.expression
                    entry.value_func = Core:LoadFunctionString(Core:Format("function() return (%s) end", fixMathFuncs(entry.fullvaluefuncsrc)), Core:Format("var:%s", entry.key))
                end
            end
        end
        rt(counts)
        rt(converted)
    end
end

local function addChildActions(inputActions, outputActions)
    for k,v in pairs(inputActions) do
        if type(v) == 'table' then
            local action = outputActions[k] or Core:BuildFallbackTable(k)
            action:Merge(v)
            outputActions[k] = action
        else
            outputActions[k] = v
        end
    end
end

local function profile__ActivatePrototype(self)
    Core:DevPrint("Activating profile: %s", self.name)

    -- Load the actions table
    self:LoadActions()

    -- Scan the spellbook for actions
    self.guessed = TJ:DetectAbilitiesFromSpellBook()

    -- Build the actions tables
    addChildActions(self.definedActions, self.actions)
    addChildActions(self.guessed, self.actions)
    addChildActions(self.resources, self.actions)
    addChildActions(Core.Environment.common, self.actions)

    -- Construct the blacklisted actions table
    local blacklisted = self.blacklisted
    wipe(blacklisted)
    for k,v in pairs(Core.Environment.globalBlacklist) do
        blacklisted[1+#blacklisted] = v
    end
    if self.config.blacklisted then
        for k,v in pairs(self.config.blacklisted) do
            blacklisted[1+#blacklisted] = v
        end
    end

    -- We need to work out the non-hasted cast times, GetSpellBaseCooldown is iffy for some reason. Do it ourselves.
    local playerHasteMultiplier = ( 100 / ( 100 + UnitSpellHaste('player') ) )

    -- Update all the actions with live data
    for k,v in pairs(self.actions) do
        if type(v) == 'table' then
            local defaults = { ActionName = k, AbilityID = (v:HasKey('SpellBookItem') and v.SpellBookSpellID or nil) }
            v:PrependFallback(defaults)

            if (v:HasKey('AbilityID') and v.AbilityID) and (v:HasKey('IsPassive') and not v.IsPassive) then
                -- Add the castable fields
                v:AppendFallback('castable')

                -- Start constructing the spell_can_cast() and perform_cast() functions
                defaults.spell_can_cast_funcsrc = Core:Format('(not spell.blacklisted) and (env.player_level >= %d) and (spell.in_spellbook)', GetSpellLevelLearned(v.AbilityID))
                defaults.perform_cast_funcsrc = ''

                -- Get the resource cost -- TODO: Cost per time
                local costType, costBase, costPerTime, cost3 = SpellData.GetSpellCost(v.AbilityID)

                -- If this action has an associated cost, add the correct value to the table and update the functions accordingly
                costType = costType or (v:HasKey('cost_type') and v.cost_type)
                if costType then
                    if not v:HasKey(costType..'_cost') then
                        defaults[costType..'_cost'] = costBase
                    end
                    defaults.spell_can_cast_funcsrc = defaults.spell_can_cast_funcsrc .. Core:Format(' and (env.%s:can_spend(env, \'%s\', \'%s\', spell.%s_cost))', costType, k, costType, costType)
                    defaults.perform_cast_funcsrc = defaults.perform_cast_funcsrc .. Core:Format('; env.%s:perform_spend(env, \'%s\', \'%s\', spell.%s_cost)', costType, k, costType, costType)
                end

                -- Add any fields required for cooldowns
                local cooldownSecs, isCooldownAffectedByHaste = SpellData.GetSpellCooldown(v.AbilityID)
                defaults.FullCooldownSecs = cooldownSecs and (isCooldownAffectedByHaste or false) and cooldownSecs/playerHasteMultiplier or cooldownSecs or nil
                defaults.IsCooldownAffectedByHaste = isCooldownAffectedByHaste
                if defaults.FullCooldownSecs and defaults.FullCooldownSecs > 0 then
                    defaults.spell_can_cast_funcsrc = defaults.spell_can_cast_funcsrc .. ' and (spell.cooldown_remains == 0)'
                    defaults.perform_cast_funcsrc = defaults.perform_cast_funcsrc .. '; spell.cooldownStart = env.currentTime; spell.cooldownDuration = spell.CooldownTime'
                    v:AppendFallback('action_cooldown')
                end

                -- Get the recharge time
                local rechargeSecs, isRechargeAffectedByHaste = SpellData.GetSpellRechargeTime(v.AbilityID)
                defaults.FullRechargeSecs = rechargeSecs and (isRechargeAffectedByHaste or false) and rechargeSecs/playerHasteMultiplier or rechargeSecs or nil
                defaults.IsRechargeAffectedByHaste = isRechargeAffectedByHaste
                if defaults.FullRechargeSecs and defaults.FullRechargeSecs > 0 then
                    defaults.spell_can_cast_funcsrc = defaults.spell_can_cast_funcsrc .. ' and (spell.spell_charges > 0)'
                    defaults.perform_cast_funcsrc = defaults.perform_cast_funcsrc .. '; spell.rechargeSpent = spell.rechargeSpent + 1'
                    v:AppendFallback('action_charges')
                end

                -- Check if this has charges that use GetSpellCount()
                defaults.UsesSpellCountForCharges = v:HasKey('ChargesUseSpellCount') and v.ChargesUseSpellCount and true or false
                if defaults.UsesSpellCountForCharges then
                    defaults.FullRechargeSecs = 99999
                    defaults.IsRechargeAffectedByHaste = false
                    v:AppendFallback('action_charges')
                end

                -- Update the spell_can_cast function if talents are specified
                if v:HasKey('TalentID') then
                    defaults.spell_can_cast_funcsrc = defaults.spell_can_cast_funcsrc .. ' and (spell.talent_enabled)'
                end

                -- Update the spell_can_cast function if there's a spell-specific function in the supplied table
                if v:HasKey('CanCast') then
                    defaults.spell_can_cast_funcsrc = defaults.spell_can_cast_funcsrc .. ' and (spell.CanCast)'
                end

                -- Update the perform_cast function if an aura is supposed to be applied
                if v:HasKey('AuraApplied') then
                    defaults.perform_cast_funcsrc = defaults.perform_cast_funcsrc .. Core:Format('; env.%s.expirationTime = env.currentTime + %d', v.AuraApplied, v.AuraApplyLength)
                end

                -- Update the perform_cast function if there's a spell-specific function in the supplied table
                if v:HasKey('PerformCast') then
                    defaults.perform_cast_funcsrc = defaults.perform_cast_funcsrc .. '; local r = spell.PerformCast'
                end

                -- Load the spell_can_cast function
                defaults.spell_can_cast_funcsrc = Core:Format('function(spell, env) return ((%s) and true or false) end', defaults.spell_can_cast_funcsrc:gsub('^ and ', ''))
                defaults.spell_can_cast = Core:LoadFunctionString(fixMathFuncs(defaults.spell_can_cast_funcsrc), k..':spell_can_cast')

                -- Load the perform_cast function
                defaults.perform_cast_funcsrc = Core:Format('function(spell, env) %s end', defaults.perform_cast_funcsrc:gsub('^; ', ''))
                defaults.perform_cast = Core:LoadFunctionString(fixMathFuncs(defaults.perform_cast_funcsrc), k..':perform_cast')
            end

            -- Ensure talent-specific fields are available
            if v:HasKey('TalentID') then
                v:AppendFallback('talent')
            end

            -- Add the aura fields
            if v:HasKey('AuraID') and v.AuraID then
                v:AppendFallback('aura')
            end

            -- Set up the final fallback for all actions with default values
            local mt = getmetatable(v)
            if mt and mt.__fallbacks then
                v:AppendFallback('action_final_fallback')
            end
        end
    end

    -- Update the mapping from the detected actions from spellbook to match what simc APLs expect
    if self.config.simc_mapping then
        for k,v in pairs(self.config.simc_mapping) do
            if self.actions[v] then
                self.actions[k] = self.actions[v]
            end
        end
    end
end

local function profile__DeactivatePrototype(self)
    Core:DevPrint("Deactivating profile: %s", self.name)
end

local function profile__FindActionForSpellID(self, spellID)
    if self.spellIDactionMapping[spellID] then return self.spellIDactionMapping[spellID] end
    for k,v in pairs(self.actions) do
        local spellIDs = v:HasKey('SpellIDs') and v.SpellIDs or nil
        if spellIDs then
            for k2,v2 in pairs(spellIDs) do
                if v2 == spellID then
                    self.spellIDactionMapping[spellID] = k
                    return k
                end
            end
        end
    end
end

function TJ:RegisterPlayerClass(config)
    -- Copy out the resources requested for this class
    local resources = {}
    for k, v in pairs(config.resources) do resources[v] = Core.Environment.resources[v] end

    -- Set up the profile table
    local profile = {
        defaultActionProfile = config.default_action_profile,
        name = config.name,
        events = config.events,
        config = config,
        blacklisted = {},
        configCheckboxes = config.config_checkboxes or {},
        actions = {},
        definedActions = Core:MergeTables(unpack(config.actions)),
        resources = resources,
        spellIDactionMapping = {},
    }

    -- Add it to the list of profiles so we can get access to it when swapping specs
    self.profiles = self.profiles or {}
    self.profiles[config.class_id] = self.profiles[config.class_id] or {}
    self.profiles[config.class_id][config.spec_id] = profile

    -- Add the prototype functions
    profile.ClearActions = profile__ClearActionsPrototype
    profile.LoadActions = profile__LoadActionsPrototype
    profile.Activate = profile__ActivatePrototype
    profile.Deactivate = profile__DeactivatePrototype
    profile.FindActionForSpellID = profile__FindActionForSpellID

    -- If someone decides to load-on-demand their class module, then queue up a full profile reload.
    TJ:QueueProfileReload()
end

function TJ:RegisterActionProfileList(aplID, aplName, classID, specID, aplData)
    TJ.profileDefinitions[aplID] = {
        classID = classID,
        specID = specID,
        aplName = aplName,
        aplData = aplData
    }

    TJ.availableProfiles[classID] = TJ.availableProfiles[classID] or {}
    TJ.availableProfiles[classID][specID] = TJ.availableProfiles[classID][specID] or {}
    local t = TJ.availableProfiles[classID][specID]
    t[1 + #t] = aplID
    tsort(t)
end

function TJ:GetAvailableProfilesForSpec(classID, specID)
    local classID = classID or select(3, UnitClass('player'))
    local specID = specID or GetSpecialization()
    local available = TJ.availableProfiles and TJ.availableProfiles[classID] and TJ.availableProfiles[classID][specID] or {}

    local defaultProfile = self.profiles
        and self.profiles[classID]
        and self.profiles[classID][specID]
        and self.profiles[classID][specID].defaultActionProfile

    return available, defaultProfile
end
