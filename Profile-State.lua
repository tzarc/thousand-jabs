local _, internal = ...;
internal.WrapGlobalAccess()
local Z = internal.Z
local DBG = internal.DBG
local LUC = LibStub('LibUnitCache-1.0')
local tcontains = tContains

local safe_table_entries = { 'type', 'hooks', 'can_spend', 'perform_spend', 'OnStateInit', 'OnPredictActionAtOffset' }

function Z:CreateNewState(numTargets)

    local profile = Z:GetActiveProfile()
    if not profile then return end

    -- Set up the state and associate a profile with it
    local state = Z:MissingFieldTable("state{"..profile.name.."}", {})

    -- Keep track of the last cast times
    local last_cast_times = {}
    state.last_cast_times = last_cast_times

    -- Set up an environment table for calling the condition functions
    local env_base = {}
    for k,v in pairs(internal.baseEnvironment) do
        env_base[k] = v
    end
    state.env_base = Z:MissingFieldTable("state{"..profile.name.."}.env", env_base)

    -- Set up a proxy table which correctly calls functions to retrieve data instead
    state.env = setmetatable({}, {
        __index = function(env, idx)
            -- Handle conversions to number
            local asnumbersuffix = "_as_number"
            if idx:match(asnumbersuffix) then
                idx = idx:gsub(asnumbersuffix,"")
                local v = env[idx]
                return type(v) == 'number' and v or (v and 1 or 0)
            end

            -- Handle incoming damage queries
            local dmgprefix = "incoming_damage_over_"
            if idx:match(dmgprefix) then
                local val = 0
                local length = tonumber(strsub(idx,strlen(dmgprefix)+1))
                if length >= state.env.time_since_incoming_damage then
                    val = Z:GetIncomingDamage(GetTime(), length/1000) -- use GetTime() here, as future prediction will change the accumulation window
                end
                return val
            end

            -- Forward to the base table
            local e = state.env_base[idx]
            if type(e) == 'function' then
                local res = e(state.env, state.env)
                return res
            else
                return e
            end
            return rawget(env,idx)
        end
    })

    -- Set up fallback tables for each of the abilities
    for k, v in pairs(profile.actions) do
        if type(v) == 'table' then
            state.env[k] = setmetatable({}, {
                __index = function(entry, idx)

                    if tcontains(safe_table_entries, idx) then
                        return rawget(v, idx) -- allow function calls to the base table ONLY for these keys
                    end

                    -- Handle conversions to number
                    local asnumbersuffix = "_as_number"
                    if idx:match(asnumbersuffix) then
                        idx = idx:gsub(asnumbersuffix,"")
                        local v = entry[idx]
                        return type(v) == 'number' and v or (v and 1 or 0)
                    end

                    -- Forward to the profile table
                    local e = v[idx]
                    if type(e) == 'function' then
                        local res = e(entry, state.env)
                        return res
                    else
                        return e
                    end
                    return rawget(entry,idx)
                end
            })
        end
    end

    local prev_gcd = setmetatable({}, {
        __index = function(tbl,idx)
            -- find the last cast ability
            local lastTime, lastAbility = 0, nil
            for k,v in pairs(last_cast_times) do
                if v > lastTime then
                    lastAbility = k
                    lastTime = v
                end
            end

            if lastTime + ((self.currentGCD or 1)*1.5) < state.env.currentTime then return false end -- if we've gone through at least 1.5 gcd's with no ability spent, reset everything

            -- find the matching ability
            local matchingAbility = nil
            for k,v in pairs(profile.actions) do
                local abilityID = rawget(v, 'AbilityID')
                if abilityID and abilityID == lastAbility then
                    matchingAbility = k
                    break
                end
            end

            -- Signal if it was the last cast ability
            return idx == matchingAbility and true or false
        end
    })

    local equipped = setmetatable({}, {
        __index = function(tbl,idx)
            return false -- TODO
        end,
    })

    -- Helper for cleaning a state
    function state:Reset()

        state.env.prev_gcd = nil
        state.env.equipped = nil
        state.env.last_cast_times = nil

        -- Copy over the last cast times for the state so that we're not writing to the global state instead
        wipe(last_cast_times)
        for k,v in pairs(Z.lastCastTime) do
            last_cast_times[k] = v
        end

        -- Clear out the environment and reset to initial values
        for k,v in pairs(state.env) do

            if type(v) == 'table' then
                -- Wipe the environment table
                wipe(v)

                -- Get the equivalent profile entry for this table
                local entry = profile.actions[k]

                -- Add data if we're checking auras for this entry
                if rawget(entry, 'AuraID') then
                    local aura = LUC:GetAura(entry.AuraUnit, entry.AuraID, entry.AuraMine)
                    v.expirationTime = aura and aura.expires or 0
                    v.aura_stack = aura and aura.count or 0
                end

                -- Add data if we're checking cooldowns for this entry
                if rawget(entry, 'CooldownTime') then
                    v.cooldownStart, v.cooldownDuration = GetSpellCooldown(entry.AbilityID)
                    local remaining = v.cooldownStart + v.cooldownDuration - GetTime()
                    remaining = remaining > 0 and remaining or 0
                end

                -- Add data if we're checking charges for this entry
                if rawget(entry, 'RechargeTime') then
                    local charges, maxCharges, start, duration = GetSpellCharges(entry.AbilityID)
                    v.rechargeSampled = charges or 0
                    v.rechargeMax = maxCharges or 0
                    v.rechargeStartTime = start or 0
                    v.rechargeDuration = duration or 0
                    v.rechargeSpent = 0
                    v.spell_max_charges = maxCharges or 0
                    v.rechargeNext = (charges == maxCharges) and 99999999999999 or (start + duration)
                end

            else
                state.env[k] = nil
            end
        end

        -- Set the initial parameters
        state.env.ptr = false
        state.env.sampleTime = GetTime()
        state.env.active_enemies = numTargets
        state.env.spell_targets = numTargets
        state.env.desired_targets = numTargets - 1
        state.env.playerHasteMultiplier = ( 100 / ( 100 + UnitSpellHaste('player') ) )
        state.env.player_level = UnitLevel('player')
        state.env.movement.distance = internal.range_to_unit('target')
        state.env.gcd = Z.currentGCD * state.env.playerHasteMultiplier

        -- Reset the prev_gcd/equipped tables
        state.env.prev_gcd = prev_gcd
        state.env.equipped = equipped
        state.env.last_cast_times = last_cast_times

        -- Call the current profile's state initialisation function
        local initFunc = state.env.hooks.OnStateInit
        if initFunc then initFunc(state.env) end
    end

    Z:ProfileFunction(state, 'Reset', 'state:Reset')

    -- Base action prediction for the current time, or just after the current cast finishes
    function state:PredictNextAction()

        -- Attempt to work out when we can next cast something, based off the gcd
        local start, duration = GetSpellCooldown(61304)

        -- Set the combat start time
        state.env.combatStart = (Z.combatStart ~= 0) and Z.combatStart or GetTime()

        -- ....unless we're currently casting/channeling something (i.e. fists of fury), in which case use it instead
        local cname, _, _, _, cstart, cend, _, _, _, spellCastID = UnitCastingInfo('player')
        local performPostCastAction = false
        if cname then
            performPostCastAction = true
            DBG("Currently casting: %s", tostring(spellCastID))
        else
            cname, _, _, _, cstart, cend = UnitChannelInfo('player')
        end
        if cname then
            start = cstart * 0.001
            duration = (cend - cstart) * 0.001
        end
        -- Find the sampling offset
        local predictionOffset = (start and duration) and (start + duration - GetTime()) or 0
        if predictionOffset < 0 then
            predictionOffset = 0
        end

        -- Predict at the specific offset
        return state:PredictActionAtOffset(predictionOffset, performPostCastAction and spellCastID or nil)

    end

    Z:ProfileFunction(state, 'PredictNextAction', 'state:PredictNextAction')

    -- Prediction of the action following the one specified, mocing the prediction time accordingly
    function state:PredictActionFollowing(action)

        local act = state.env[action]
        if act then
            -- Pretend we just casted the supplied action, update the last cast time for this ability
            last_cast_times[act.AbilityID] = state.env.currentTime
            -- Perform the cast of the supplied action
            profile.actions[action].perform_cast(act, state.env)
            -- Work out the new prediction offset given its cast time
            local newOffset = state.env.predictionOffset + act.spell_cast_time
            -- Predict the next action
            return state:PredictActionAtOffset(newOffset)
        end

        return nil

    end

    Z:ProfileFunction(state, 'PredictActionFollowing', 'state:PredictActionFollowing')

    -- Prediction at the supplied time offset
    function state:PredictActionAtOffset(predictionOffset, performPostCastSpellID)

        state.env.predictionOffset = predictionOffset

        if performPostCastSpellID ~= nil then
            DBG("Handling cast of %s", tostring(performPostCastSpellID))
            local action = profile:FindActionForSpellID(performPostCastSpellID)
            if action then
                DBG("Handling cast of %s", action)
                local act = profile.actions[action]
                -- Pretend we just casted the supplied action, update the last cast time for this ability
                last_cast_times[act.AbilityID] = state.env.currentTime
                -- Perform the cast of the supplied action
                profile.actions[action].perform_cast(act, state.env)
            end
        end

        DBG("")
        DBG("Offset: %.3f", predictionOffset)
        DBG("Range: <= %d yd", state.env.movement.distance)

        -- Call the current profile's state initialisation function
        local func = state.env.hooks.OnPredictActionAtOffset
        if func then func(state.env) end

        return state:ExecuteActionProfileList("default")

    end

    Z:ProfileFunction(state, 'PredictActionAtOffset', 'state:PredictActionAtOffset')

    -- Execute an action profile list and get the resulting action
    function state:ExecuteActionProfileList(listname)

        -- Get the requested action list to execute
        local actionList = profile.parsedActions[listname] or {}
        if #actionList == 0 then
            DBG("|cFFFF0000%s (ERROR EXECUTING): Invalid list (zero actions): '%s'|r", tostring(listname))
            internal.error(internal.fmt("|cFFFF0000%s (ERROR EXECUTING): Invalid list (zero actions): '%s'|r", tostring(listname)))
            return nil
        end

        -- Loop through all the actions in the list
        for i=1,#actionList do

            -- Get the action under consideration
            local action = actionList[i]

            if action.action == "variable" then

                -- Execute the variable value function with the current state
                setfenv(action.value, state.env)
                local status, ret = pcall(action.value)

                -- If we got a failure, then print out in the debugging and console
                if not status then

                    DBG("|cFFFF0000%s (ERROR EXECUTING): %s|r", action.key, action.fullvaluefuncsrc)
                    internal.error(internal.fmt("Error executing variable function: %s", action.key),
                        internal.fmt("Error executing variable function:\n------\n%s\n------\n%s\n------", ret, action.fullvaluefuncsrc))

                else

                    -- Update the value
                    state.env.variable[action.name] = ret

                    DBG("|cFFFF99FF%s ==> '|cFFDD00FF%s|cFFFF99FF': %s|r", action.key, action.name, tostring(ret))

                end

                -- Validate that it isn't blacklisted, and there's a valid check function
            elseif tcontains(profile.blacklisted, action.action) then

            -- DBG("|cFFCC9999%s (blacklisted): %s|r", action.key, action.condition)

            elseif action.condition_func then -- We have a valid check function

                -- Execute the check function with the current state
                setfenv(action.condition_func, state.env)
                local status, ret = pcall(action.condition_func)

                -- If we got a failure, then print out in the debugging and console
                if not status then

                    DBG("|cFFFF0000%s (ERROR EXECUTING): %s|r", action.key, action.fullconditionfuncsrc)
                    internal.error(internal.fmt("Error executing condition function: %s", action.key),
                        internal.fmt("Error executing condition function:\n------\n%s\n------\n%s\n------", ret, action.fullconditionfuncsrc))

                elseif ret == false then

                    -- Ran correctly, but the condition failed...
                    DBG("|cFFCCCCCC%s: %s|r", action.key, action.fullconditionfuncsrc)

                elseif ret == true then

                    -- If the condition succeeded....
                    if action.action == 'call_action_list' or action.action == 'run_action_list' then

                        -- ...we're running another action list, so run that recursively
                        DBG("|cFF99FFFF%s ==> '|cFF00DDFF%s|cFF99FFFF': %s|r", action.key, action.name, action.fullconditionfuncsrc)
                        local action = state:ExecuteActionProfileList(action.name)
                        if action then
                            return action
                        end

                    else

                        -- We have an ability, so send it back
                        DBG("|cFF99FF99%s ==> '|cFF00FF00%s|cFF99FF99': %s|r", action.key, action.action, action.fullconditionfuncsrc)
                        return action.action

                    end

                end
            end
        end

    end

    Z:ProfileFunction(state, 'ExecuteActionProfileList', 'state:ExecuteActionProfileList')

    -- Reset the state by default, populating with initial data
    state:Reset()
    return state
end
