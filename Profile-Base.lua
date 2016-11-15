local addonName, internal = ...;
local TJ = internal.TJ
local Debug = internal.Debug
local fmt = internal.fmt
local Config = TJ:GetModule('Config')

local LSD = LibStub('LibSerpentDump')

local mfloor = math.floor
local pairs = pairs
local rawget = rawget
local select = select
local setmetatable = setmetatable
local tonumber = tonumber
local type = type
local unpack = unpack
local wipe = wipe
local GetActiveSpecGroup = GetActiveSpecGroup
local GetSpellInfo = GetSpellInfo
local GetSpellLevelLearned = GetSpellLevelLearned
local GetTalentInfo = GetTalentInfo
local UnitSpellHaste = UnitSpellHaste

internal.Safety()

local function expressionPrimaryModifier(keyword, profileSubstitutions)
    if keyword:match('^([%d%.]+)$') then return keyword end

    local before = keyword

    -- Casting checks
    if keyword == "debuff.casting.up" then keyword = "target.is_casting" end
    if keyword == "debuff.casting.down" then keyword = "(not target.is_casting)" end
    if keyword == "target.debuff.casting.up" then keyword = "target.is_casting" end
    if keyword == "target.debuff.casting.down" then keyword = "(not target.is_casting)" end
    if keyword == "buff.casting.up" then keyword = "player.is_casting" end
    if keyword == "buff.casting.down" then keyword = "(not player.is_casting)" end

    -- Single-word conversions
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
    if keyword == "gcd.max" then keyword = "gcd_max" end
    if keyword == "gcd.remains" then keyword = "gcd_remains" end
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
    keyword = keyword:gsub('^incoming_damage_([%d]+)s', function(a) return fmt('incoming_damage_over_%d', tonumber(a)*1000) end)
    keyword = keyword:gsub('^incoming_damage_([%d]+)ms', function(a) return fmt('incoming_damage_over_%d', tonumber(a)) end)

    -- Convert XXXXX.YYYYY.ZZZZZ -> YYYYY.XXXXX_ZZZZZ (talent.blah.enabled -> blah.talent_enabled)
    keyword = keyword:gsub('([%a_]+)%.([%a_]+)%.([%a_%.]+)', function(a,b,c) return fmt("%s.%s_%s", b, a, c:gsub("%.","_")) end)

    -- Percentage consolidation
    keyword = keyword:gsub("_pct$", "_percent")
    keyword = keyword:gsub("%.pct$", ".percent")

    -- Handle any profile-specific substitutions
    if profileSubstitutions then
        for _,e in pairs(profileSubstitutions) do
            keyword = keyword:gsub(e[1], e[2])
        end
    end

    return keyword
end

function TJ:RegisterPlayerClass(config)

    local config = config
    local blacklisted = {}

    -- Copy out the resources requested for this class
    local resources = {}
    for k,v in pairs(config.resources) do resources[v] = internal.resources[v] end

    -- Set up the profile table
    local profile = {
        actionProfile = internal.apls[config.action_profile],
        name = config.name,
        betaProfile = config.betaProfile and true or false,
        config = config,
        blacklisted = blacklisted,
        configCheckboxes = config.config_checkboxes or {}
    }

    -- Add it to the list of profiles so we can get access to it when swapping specs
    self.profiles = self.profiles or {}
    self.profiles[config.class_id] = self.profiles[config.class_id] or {}
    self.profiles[config.class_id][config.spec_id] = profile

    function profile:LoadActions()
        if internal.devMode or not self.parsedActions then
            local converted = {}
            -- Parse the action profile
            local function primaryModifier(str)
                if converted[str] then return converted[str] end
                local res = expressionPrimaryModifier(str, config.conditional_substitutions)
                converted[str] = res
                return res
            end

            self.parsedActions = self.parsedActions or internal.ExpressionParser(self.actionProfile, primaryModifier)

            -- Create the condition functions for each action
            local counts = {}
            for listName,listTable in pairs(self.parsedActions) do
                counts[listName] = counts[listName] or {}
                -- Loop through each entry in each named action list
                for _,entry in pairs(listTable) do
                    counts[listName][entry.action] = (counts[listName][entry.action] or 0) + 1
                    entry.key = (entry.action == "run_action_list" or entry.action == "call_action_list")
                        and fmt("%s:%s[%s]", listName, entry.action, entry.params.name)
                        or fmt("%s:%s[%s]", listName, entry.action, counts[listName][entry.action])

                    -- Create a default prcondition, based on whether the spell is castable
                    entry.precondition = (entry.action == "run_action_list" or entry.action == "call_action_list")
                        and "true"
                        or fmt("%s.spell_can_cast", entry.action)
                    if type(entry.params.sync) ~= "nil" then
                        entry.precondition = fmt("(%s) and (%s.spell_can_cast or %s.cooldown_up or %s.aura_remains > 0)", entry.precondition, entry.params.sync, entry.params.sync, entry.params.sync)
                    end

                    -- Create the condition function
                    if type(entry.condition_func) == "nil" then
                        if type(entry.params.condition_converted) ~= "nil" or type(entry.params.target_if_converted) ~= "nil" then
                            local cond = entry.params.condition_converted or entry.params.target_if_converted
                            entry.fullconditionfuncsrc = fmt("((%s) and (%s))", entry.precondition, cond.expression:gsub('THIS_SPELL', entry.action))
                        else
                            entry.fullconditionfuncsrc = entry.precondition
                        end
                        entry.condition_func = TJ:LoadFunctionString(fmt("function() return ((%s) and true or false) end", entry.fullconditionfuncsrc), fmt("cond:%s", entry.key))
                    end

                    -- Create the variable result function
                    if type(entry.value_func) == "nil" and type(entry.params.value_converted) ~= "nil" then
                        entry.fullvaluefuncsrc = entry.params.value_converted.expression
                        entry.value_func = TJ:LoadFunctionString(fmt("function() return (%s) end", entry.fullvaluefuncsrc), fmt("var:%s", entry.key))
                    end
                end
            end

            if internal.devMode then
                for before,after in internal.orderedpairs(converted) do
                    TJ:PrintOnce("%s => %s", before, after)
                end
            end
        end
    end

    function profile:FindActionForSpellID(spellID)
        for k,v in pairs(profile.actions) do
            local spellIDs = rawget(v, 'SpellIDs')
            if spellIDs then
                for k2,v2 in pairs(spellIDs) do
                    if v2 == spellID then
                        return k
                    end
                end
            end
        end
    end

    function profile:Activate()
        TJ:DevPrint("Activating profile: %s", profile.name)

        -- Construct the total actions table, including resources and base actions
        profile.actions = TJ:MergeTables(internal.commonData, resources, unpack(config.actions))
        local actions = profile.actions

        -- Load the actions table
        self:LoadActions()

        -- Merge the detected abilities from spellbook and the supplied ones from the class configuration
        profile.guessed = TJ:DetectAbilitiesFromSpellBook()
        local guessed = profile.guessed

        -- Loop through each of the guessed abilities, and attempt to match up the AbilityID or the TalentIDs
        for k1,v1 in pairs(guessed) do
            for k2,v2 in pairs(actions) do
                local match = false
                -- Match against ability
                local a1, a2 = v1.SpellIDs, rawget(v2, 'SpellIDs')
                if a1 and a2 then
                    for k3,v3 in pairs(a1) do
                        for k4,v4 in pairs(a2) do
                            if v3 == v4 then
                                match = true
                            end
                        end
                    end
                end
                -- Match against talents
                a1, a2 = v1.TalentIDs, rawget(v2, 'TalentIDs')
                if a1 and a2 and a1[1] == a2[1] and a1[2] == a2[2] then
                    match = true
                end
                -- We got a match, merge the tables
                if match then
                    actions[k2] = TJ:MergeTables(v2, v1)
                    actions[k2].in_spellbook = v1.SpellBookSpellID and true or false
                    actions[k2].AbilityID = v1.SpellBookSpellID or nil
                end
            end
        end

        -- Set up the hooks table so that we don't log errors if they're not present in the profile
        if not actions.hooks then actions.hooks = {} end

        -- Show errors if we're missing anything...
        actions = TJ:MissingFieldTable(profile.name, actions)

        -- Construct the blacklisted
        wipe(blacklisted)
        for k,v in pairs(internal.global_blacklisted_abilities) do
            blacklisted[1+#blacklisted] = v
        end
        if config.blacklisted then
            for k,v in pairs(config.blacklisted) do
                blacklisted[1+#blacklisted] = v
            end
        end

        -- We need to work out the non-hasted cast times, GetSpellBaseCooldown is iffy for some reason. Do it ourselves.
        local playerHasteMultiplier = ( 100 / ( 100 + UnitSpellHaste('player') ) )

        -- Update each of the actions with any detected/generated data
        for k,v in pairs(actions) do

            -- Add the 'talent_selected' entry if there are talent IDs present
            if type(v) == 'table' and rawget(v, 'TalentIDs') then
                v.talent_selected = function(spell, env) return select(4, GetTalentInfo(spell.TalentIDs[1], spell.TalentIDs[2], GetActiveSpecGroup())) and true or false end
                v.talent_enabled = v.talent_selected
            end

            -- If there's no ability ID, then we can't cast it.
            if type(v) == 'table' and not rawget(v, 'AbilityID') then
                v.spell_can_cast = function(spell, env) return false end
                v.in_range = rawget(v, 'in_range') or function(spell, env) return false end
                v.cooldown_remains = 99999
            end

            -- Determine the ability-specific information, if we can cast the current action
            if type(v) == 'table' and rawget(v, 'AbilityID') then

                -- If we have an AbilityID specified, but in_spellbook isn't set, then make sure it's set to false (i.e. it's defined in the profile, but it's not in the current spellbook)
                if not rawget(v, 'in_spellbook') then
                    v.in_spellbook = false
                end

                -- Set up a function to check if the ability is in range
                v.in_range = function(spell,env)
                    if not v.in_spellbook then return false end
                    local r = IsSpellInRange(spell.SpellBookItem, BOOKTYPE_SPELL, 'target')
                    r = (not r or r ~= 1) and true or false
                    return (not r)
                end

                -- Set up function for last cast time
                v.last_cast = function(spell, env)
                    return env.lastCastTimes[v.AbilityID] or 0
                end
                v.time_since_last_cast = function(spell, env)
                    return env.currentTime - spell.last_cast
                end

                -- Set up a function to check to see if an ability is blacklisted
                v.blacklisted = function(spell, env)
                    return Config:Get("class", config.class_id, "spec", config.spec_id, "blacklist", k) and true or false
                end

                -- Start constructing the spell_can_cast() and perform_cast() functions
                local spell_can_cast_funcsrc = fmt('(not spell.blacklisted) and (env.player_level >= %d) and (spell.in_spellbook)', GetSpellLevelLearned(v.AbilityID))
                local perform_cast_funcsrc = ''

                -- Work out the cast time based off the spell info, or the GCD
                if not rawget(v, 'spell_cast_time') then
                    local castTime = select(4, GetSpellInfo(v.AbilityID))
                    if castTime and castTime > 0 then
                        v.spell_cast_time = function(spell, env)
                            return select(4, GetSpellInfo(v.AbilityID)) / 1000.0
                        end
                    else
                        v.spell_cast_time = function(spell, env)
                            local gcd = TJ.currentGCD * env.playerHasteMultiplier
                            return (gcd > 1) and gcd or 1
                        end
                    end
                end

                -- Get the resource cost
                local costType, costBase, costPerTime = TJ:GetSpellCost(v.AbilityID)

                -- If this action has an associated cost, add the correct value to the table and update the functions accordingly
                costType = costType or rawget(v, 'cost_type')
                if costType then
                    if not rawget(v, costType..'_cost') then
                        v[costType..'_cost'] = costBase
                    end
                    spell_can_cast_funcsrc = spell_can_cast_funcsrc .. fmt(' and (env.%s.can_spend(env.%s, env, \'%s\', \'%s\', spell.%s_cost))', costType, costType, k, costType, costType)
                    perform_cast_funcsrc = perform_cast_funcsrc .. fmt('; env.%s.perform_spend(env.%s, env, \'%s\', \'%s\', spell.%s_cost)', costType, costType, k, costType, costType)
                end

                -- Get the cooldown
                local cooldownSecs, isCooldownAffectedByHaste = TJ:GetSpellCooldown(v.AbilityID)
                local fullCooldownSecs = (isCooldownAffectedByHaste or false) and cooldownSecs/playerHasteMultiplier or cooldownSecs or 0

                -- If this action has an associated cooldown, then insert the value to the table and update the functions accordingly
                if fullCooldownSecs and fullCooldownSecs > 0 then
                    if not rawget(v, 'CooldownTime') then
                        v.CooldownTime = isCooldownAffectedByHaste and (function(spell,env) return env.playerHasteMultiplier * fullCooldownSecs end) or fullCooldownSecs
                    end
                    v.spell_recharge_time = function(spell, env)
                        return spell.CooldownTime
                    end
                    spell_can_cast_funcsrc = spell_can_cast_funcsrc .. ' and (spell.cooldown_remains == 0)'
                    perform_cast_funcsrc = perform_cast_funcsrc .. '; spell.cooldownStart = env.currentTime; spell.cooldownDuration = spell.CooldownTime'

                    -- Add cooldown-specific functions
                    v.cooldown_remains = function(spell, env)
                        local remains = spell.cooldownStart + spell.cooldownDuration - env.currentTime
                        return (remains > 0) and remains or 0
                    end
                    v.spell_charges = function(spell, env)
                        return (spell.cooldown_remains > 0) and 0 or 1
                    end
                    v.cooldown_ready = function(spell, env)
                        return (spell.cooldown_remains == 0) and true or false
                    end
                    v.cooldown_up = function(spell, env)
                        return (spell.cooldown_remains == 0) and true or false
                    end
                    v.cooldown_react = function(spell, env)
                        return (spell.cooldown_remains == 0) and true or false
                    end
                end

                -- Get the recharge time
                local rechargeSecs, isRechargeAffectedByHaste = TJ:GetSpellRechargeTime(v.AbilityID)
                local fullRechargeSecs = (isRechargeAffectedByHaste or false) and rechargeSecs/playerHasteMultiplier or rechargeSecs or 0

                -- Check if this has charges that use GetSpellCount()
                local usesSpellCountForCharges = rawget(v, 'ChargesUseSpellCount')
                if usesSpellCountForCharges then
                    rechargeSecs = 999
                    fullRechargeSecs = 999
                end

                -- If this action has an associated recharge time, then insert the value to the table and update the functions accordingly
                if fullRechargeSecs and fullRechargeSecs > 0 then
                    if not rawget(v, 'RechargeTime') then
                        v.RechargeTime = isRechargeAffectedByHaste and (function(spell,env) return env.playerHasteMultiplier * fullRechargeSecs end) or fullRechargeSecs
                    end
                    spell_can_cast_funcsrc = spell_can_cast_funcsrc .. ' and (spell.spell_charges > 0)'
                    perform_cast_funcsrc = perform_cast_funcsrc .. '; spell.rechargeSpent = spell.rechargeSpent + 1'

                    -- Add recharge-specific functions
                    v.spell_recharge_time = function(spell, env)
                        return spell.RechargeTime
                    end
                    v.spell_charges = function(spell, env)
                        return mfloor(spell.spell_charges_fractional+0.001)
                    end
                    if usesSpellCountForCharges then
                        v.spell_charges_fractional = function(spell, env)
                            return spell.rechargeSampled - spell.rechargeSpent
                        end
                    else
                        v.spell_charges_fractional = function(spell, env)
                            local f = (spell.rechargeSampled == spell.rechargeMax)
                                and spell.rechargeMax - spell.rechargeSpent
                                or spell.rechargeSampled + (env.currentTime - spell.rechargeStartTime)/spell.rechargeDuration - spell.rechargeSpent
                            if f >= spell.rechargeMax then f = spell.rechargeMax end
                            return f
                        end
                    end
                    v.cooldown_charges_fractional = function(spell, env)
                        return spell.spell_charges_fractional
                    end
                    v.spell_recharge_time = function(spell, env)
                        local remains = spell.rechargeStartTime + spell.rechargeDuration - env.currentTime
                        return (spell.spell_charges == spell.rechargeMax) and 0 or remains
                    end
                    v.cooldown_remains = function(spell,env)
                        return (spell.spell_charges > 0) and 0 or spell.spell_recharge_time
                    end
                end

                -- Update the spell_can_cast function if talents are specified
                if rawget(v, 'TalentIDs') then
                    spell_can_cast_funcsrc = spell_can_cast_funcsrc .. ' and (spell.talent_selected)'
                end

                -- Update the spell_can_cast function if there's a spell-specific function in the supplied table
                if rawget(v, 'CanCast') then
                    spell_can_cast_funcsrc = spell_can_cast_funcsrc .. ' and (spell.CanCast)'
                end

                -- Update the perform_cast function if an aura is supposed to be applied
                if rawget(v, 'AuraApplied') then
                    perform_cast_funcsrc = perform_cast_funcsrc .. fmt('; env.%s.expirationTime = env.currentTime + %d', v.AuraApplied, v.AuraApplyLength)
                end

                -- Update the perform_cast function if there's a spell-specific function in the supplied table
                if rawget(v, 'PerformCast') then
                    perform_cast_funcsrc = perform_cast_funcsrc .. '; local r = spell.PerformCast'
                end

                -- Load the spell_can_cast function
                spell_can_cast_funcsrc = fmt('function(spell, env) return ((%s) and true or false) end', spell_can_cast_funcsrc:gsub('^ and ', ''))
                v.spell_can_cast = TJ:LoadFunctionString(spell_can_cast_funcsrc, k..':spell_can_cast')
                if internal.devMode then v.spell_can_cast_funcsrc = spell_can_cast_funcsrc end

                -- Load the perform_cast function
                perform_cast_funcsrc = fmt('function(spell, env) %s end', perform_cast_funcsrc:gsub('^; ', ''))
                v.perform_cast = TJ:LoadFunctionString(perform_cast_funcsrc, k..':perform_cast')
                if internal.devMode then v.perform_cast_funcsrc = perform_cast_funcsrc end

            end

            -- Add aura-specific functions
            if type(v) == 'table' and rawget(v, 'AuraID') then
                v.aura_react = function(spell, env)
                    local remains = spell.expirationTime - env.currentTime
                    return (remains > 0) and true or false
                end
                v.aura_remains = function(spell, env)
                    local remains = spell.expirationTime - env.currentTime
                    return (remains > 0) and remains or 0
                end
                v.aura_up = function(spell, env)
                    local remains = spell.expirationTime - env.currentTime
                    return (remains > 0) and true or false -- hmmmmmmm, APLs like to do arithmetic here
                end
                v.aura_down = function(spell, env)
                    local remains = spell.expirationTime - env.currentTime
                    return (remains <= 0) and true or false -- hmmmmmmm, APLs like to do arithmetic here
                end
                v.aura_ticking = v.aura_up
            end

        end

        -- Update the mapping from the detected actions from spellbook to match what simc APLs expect
        if config.simc_mapping then
            for k,v in pairs(config.simc_mapping) do
                actions[k] = actions[v]
            end
        end
    end

    function profile:Deactivate()
    end
end

function TJ:OverrideActionProfile(classID, specID, aplString)
    local profile = self.profiles and self.profiles[classID] and self.profiles[classID][specID]
    if profile then
        local isActive = false
        if self.currentProfile and self.currentProfile == profile then
            isActive = true
            self:DeactivateProfile()
        end

        profile.actionProfile = aplString
        profile.parsedActions = nil

        if isActive then
            self:ActivateProfile()
        end
    end
end
