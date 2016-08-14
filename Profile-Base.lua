local addonName, internal = ...;
local Z = internal.Z
local DBG = internal.DBG
local LTC = LibStub('LibTableCache-1.0')
local LUC = LibStub('LibUnitCache-1.0')
local tcontains = tContains

function Z:RegisterPlayerClass(config)

    local k,v,k1,v1,k2,v2

    local config = config
    local blacklisted = {}

    -- Copy out the resources requested for this class
    local resources = {}
    for k,v in pairs(config.resources) do resources[v] = internal.resources[v] end

    -- Set up the profile table
    local profile = {
        name = config.name,
        config = config,
        blacklisted = blacklisted,
    }

    -- Add it to the list of profiles so we can get access to it when swapping specs
    self.profiles = self.profiles or {}
    self.profiles[config.class_id] = self.profiles[config.class_id] or {}
    self.profiles[config.class_id][config.spec_id] = profile

    function profile:Activate()

        -- Construct the total actions table, including resources and base actions
        profile.actions = Z:MergeTables(internal.commonData, resources, unpack(config.actions))
        local actions = profile.actions

        -- Parse the APL for this class
        profile.parsedActions = profile.parsedActions or Z:ParseActionProfileList(internal.apls[config.action_profile], config.conditional_substitutions)

        -- Merge the detected abilities from spellbook and the supplied ones from the class configuration
        profile.guessed = Z:DetectAbilitiesFromSpellBook()
        local guessed = profile.guessed

        -- Loop through each of the guessed abilities, and attempt to match up the AbilityID or the TalentIDs
        for k1,v1 in pairs(guessed) do
            for k2,v2 in pairs(actions) do
                local match = false
                -- Match against ability
                local a1, a2 = rawget(v1, 'AbilityID'), rawget(v2, 'AbilityID')
                if a1 and a2 and a1 == a2 then
                    match = true
                end
                -- Match against talents
                a1, a2 = rawget(v1, 'TalentIDs'), rawget(v2, 'TalentIDs')
                if a1 and a2 and a1[1] == a2[1] and a1[2] == a2[2] then
                    match = true
                end
                -- We got a match, merge the tables
                if match then
                    actions[k2] = Z:MergeTables(v2, v1)
                end
            end
        end

        -- Show errors if we're missing anything...
        actions = Z:MissingFieldTable(profile.name, actions)

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
            end

            -- If there's no ability ID, then we can't cast it.
            if type(v) == 'table' and not rawget(v, 'AbilityID') then
                v.spell_can_cast = function(spell, env) return false end
            end

            -- Determine the ability-specific information, if we can cast the current action
            if type(v) == 'table' and rawget(v, 'AbilityID') then

                -- Start constructing the spell_can_cast() and perform_cast() functions
                local spell_can_cast_funcsrc = '(env.player_level >= '..GetSpellLevelLearned(v.AbilityID)..')'
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
                            local gcd = Z.currentGCD * env.playerHasteMultiplier
                            return (gcd > 1) and gcd or 1
                        end
                    end
                end

                -- Get the resource cost
                local costType, costBase, costPerTime = Z:GetSpellCost(v.AbilityID)

                -- If this action has an associated cost, add the correct value to the table and update the functions accordingly
                costType = costType or rawget(v, 'cost_type')
                if costType then
                    if not rawget(v, costType..'_cost') then
                        v[costType..'_cost'] = costBase
                    end
                    spell_can_cast_funcsrc = spell_can_cast_funcsrc .. ' and (env.'..costType..'.curr >= spell.'..costType..'_cost)'
                    perform_cast_funcsrc = perform_cast_funcsrc .. '; env.'..costType..'.spent = env.'..costType..'.spent + spell.'..costType..'_cost'
                end

                -- Get the cooldown
                local cooldownSecs, isCooldownAffectedByHaste = Z:GetSpellCooldown(v.AbilityID)
                local fullCooldownSecs = (isCooldownAffectedByHaste or false) and cooldownSecs/playerHasteMultiplier or cooldownSecs or 0

                -- If this action has an associated cooldown, then insert the value to the table and update the functions accordingly
                if fullCooldownSecs and fullCooldownSecs > 0 then
                    if not rawget(v, 'CooldownTime') then
                        v.CooldownTime = isCooldownAffectedByHaste and (function(spell,env) return env.playerHasteMultiplier * fullCooldownSecs end) or fullCooldownSecs
                    end
                    spell_can_cast_funcsrc = spell_can_cast_funcsrc .. ' and (spell.cooldown_remains == 0)'
                    perform_cast_funcsrc = perform_cast_funcsrc .. '; spell.cooldownStart = env.currentTime; spell.cooldownDuration = spell.CooldownTime'

                    -- Add cooldown-specific functions
                    v.cooldown_remains = function(spell, env)
                        local remains = spell.cooldownStart + spell.cooldownDuration - env.currentTime
                        return (remains > 0) and remains or 0
                    end
                end

                -- Get the recharge time
                local rechargeSecs, isRechargeAffectedByHaste = Z:GetSpellRechargeTime(v.AbilityID)
                local fullRechargeSecs = (isRechargeAffectedByHaste or false) and rechargeSecs/playerHasteMultiplier or rechargeSecs or 0

                -- If this action has an associated recharge time, then insert the value to the table and update the functions accordingly
                if fullRechargeSecs and fullRechargeSecs > 0 then
                    if not rawget(v, 'RechargeTime') then
                        v.RechargeTime = isRechargeAffectedByHaste and (function(spell,env) return env.playerHasteMultiplier * fullRechargeSecs end) or fullRechargeSecs
                    end
                    spell_can_cast_funcsrc = spell_can_cast_funcsrc .. ' and (spell.spell_charges > 0)'
                    perform_cast_funcsrc = perform_cast_funcsrc .. '; spell.rechargeSpent = spell.rechargeSpent + 1'

                    -- Add recharge-specific functions
                    v.spell_charges = function(spell, env)
                        return spell.rechargeSampled - spell.rechargeSpent
                    end
                    v.spell_recharge_time = function(spell, env)
                        local remains = spell.rechargeStartTime + spell.rechargeDuration - env.currentTime
                        return (spell.spell_charges == spell.rechargeMax) and 0 or remains
                    end
                    v.cooldown_remains = v.spell_recharge_time
                end

                -- Update the spell_can_cast function if talents are specified
                if rawget(v, 'TalentIDs') then
                    spell_can_cast_funcsrc = spell_can_cast_funcsrc .. ' and (spell.talent_selected and true or false)'
                end

                -- Update the spell_can_cast function if there's a spell-specific function in the supplied table
                if rawget(v, 'CanCast') then
                    spell_can_cast_funcsrc = spell_can_cast_funcsrc .. ' and (spell.CanCast and true or false)'
                end

                -- Update the perform_cast function if an aura is supposed to be applied
                if rawget(v, 'AuraApplied') then
                    perform_cast_funcsrc = perform_cast_funcsrc .. '; env.'..v.AuraApplied..'.expirationTime = env.currentTime + '..v.AuraApplyLength
                end

                -- Update the perform_cast function if there's a spell-specific function in the supplied table
                if rawget(v, 'PerformCast') then
                    perform_cast_funcsrc = perform_cast_funcsrc .. '; r = spell.PerformCast'
                end

                -- Load the spell_can_cast function
                spell_can_cast_funcsrc = 'return function(spell, env) return ((' .. spell_can_cast_funcsrc:gsub('^ and ', '') .. ') and true or false) end'
                v.spell_can_cast = Z:LoadFunctionString(spell_can_cast_funcsrc, k..':spell_can_cast')
                -- v.spell_can_cast_funcsrc = spell_can_cast_funcsrc

                -- Load the perform_cast function
                perform_cast_funcsrc = 'return function(spell, env) ' .. perform_cast_funcsrc:gsub('^; ', '') .. ' end'
                v.perform_cast = Z:LoadFunctionString(perform_cast_funcsrc, k..':perform_cast')
                -- v.perform_cast_funcsrc = perform_cast_funcsrc

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

    self:Print("Activated profile %s", profile.name)
end