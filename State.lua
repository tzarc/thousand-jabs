local addonName, internal = ...;
local Z = internal.Z
local DBG = internal.DBG
local LTC = LibStub('LibTableCache-1.0')
local LUC = LibStub('LibUnitCache-1.0')
local tcontains = tContains

function Z:CreateNewState(numTargets)

    local profile = Z:GetActiveProfile()
    if not profile then return end

    -- Set up the state and associate a profile with it
    local state = Z:MissingFieldTable("state{"..profile.name.."}", {
        last_cast_times = {}
    })

    -- Set up an environment table for calling the condition functions
    state.env_base = Z:MissingFieldTable("state{"..profile.name.."}.env", {})
    for k,v in pairs(internal.baseEnvironment) do
        state.env_base[k] = v
    end

    -- Set up a proxy table which correctly calls functions to retrieve data instead
    state.env = setmetatable({}, {
        __index = function(env, idx)
            -- Handle incoming damage queries
            local dmgprefix = "incoming_damage_over_"
            if idx:match(dmgprefix) then
                local val = 0
                local length = tonumber(strsub(idx,strlen(dmgprefix)+1))
                if length >= state.env.time_since_incoming_damage then
                    val = Z:GetIncomingDamage(state.env.currentTime, length/1000)
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

    prev_gcd = setmetatable({}, {
        __index = function(tbl,idx)
            local k,v
            -- find the last cast ability
            local lastTime, lastAbility = 0, nil
            for k,v in pairs(state.last_cast_times) do
                if v > lastTime then
                    lastAbility = k
                    lastTime = v
                end
            end

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

    -- Helper for cleaning a state
    function state:Reset()

        state.env.prev_gcd = nil

        -- Copy over the last cast times for the state so that we're not writing to the global state instead
        wipe(state.last_cast_times)
        for k,v in pairs(Z.lastCastTime) do
            state.last_cast_times[k] = v
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
                end

            else
                state.env[k] = nil
            end

        end

        -- Set the initial parameters
        state.env.sampleTime = GetTime()
        state.env.active_enemies = numTargets
        state.env.spell_targets = numTargets
        state.env.desired_targets = numTargets - 1
        state.env.playerHasteMultiplier = ( 100 / ( 100 + UnitSpellHaste('player') ) )
        state.env.player_level = UnitLevel('player')

        -- Reset the prev_gcd table
        state.env.prev_gcd = prev_gcd

    end

    Z:ProfileFunction(state, 'Reset', 'state:Reset')

    -- Base action prediction for the current time, or just after the current cast finishes
    function state:PredictNextAction()

        -- Attempt to work out when we can next cast something, based off the gcd
        local start, duration = GetSpellCooldown(61304)

        -- ....unless we're currently casting/channeling something (i.e. fists of fury), in which case use it instead
        local cname, _, _, cicon, cstart, cend = UnitCastingInfo('player')
        if not cname then
            cname, _, _, cicon, cstart, cend = UnitChannelInfo('player')
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
        return state:PredictActionAtOffset(predictionOffset)

    end

    Z:ProfileFunction(state, 'PredictNextAction', 'state:PredictNextAction')

    -- Prediction of the action following the one specified, mocing the prediction time accordingly
    function state:PredictActionFollowing(action)

        local act = state.env[action]
        if act then
            -- Pretend we just casted the supplied action, update the last cast time for this ability
            if rawget(act, 'AbilityID') then
                state.last_cast_times[act.AbilityID] = state.env.predictionOffset
            end
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
    function state:PredictActionAtOffset(predictionOffset)

        state.env.predictionOffset = predictionOffset
        DBG("")
        DBG("Offset: %.3f", predictionOffset)
        return state:ExecuteActionProfileList("default")

    end

    Z:ProfileFunction(state, 'PredictActionAtOffset', 'state:PredictActionAtOffset')

    -- Execute an action profile list and get the resulting action
    function state:ExecuteActionProfileList(listname)

        -- Get the requested action list to execute
        local actionList = profile.parsedActions[listname]

        -- Loop through all the actions in the list
        for i=1,#actionList do

            -- Get the action under consideration
            local action = actionList[i]

            -- Validate that it isn't blacklisted, and there's a valid check function
            if tcontains(profile.blacklisted, action.name) then

                DBG("|cFFCC9999%s (blacklisted): %s|r", action.key, action.condition)

            elseif action.check then -- We have a valid check function

                -- Execute the check function with the current state
                setfenv(action.check, state.env)
                local status, ret = pcall(action.check)

                -- If we got a failure, then print out in the debugging and console
                if not status then

                    DBG("|cFFFF0000%s (ERROR EXECUTING): %s|r", action.key, action.condition)
                    Z:PrintOnce("Error executing condition function:\n------\n%s\n------\n%s\n------", ret, action.condition)

                elseif ret == false then

                    -- Ran correctly, but the condition failed...
                    DBG("|cFFCCCCCC%s: %s|r", action.key, action.condition)

                elseif ret == true then

                    -- If the condition succeeded....
                    if action.name == 'call_action_list' or action.name == 'run_action_list' then

                        -- ...we're running another action list, so run that recursively
                        DBG("|cFF99FFFF%s ==> '|cFF00DDFF%s|cFF99FFFF': %s|r", action.key, action.list, action.condition)
                        local action = state:ExecuteActionProfileList(action.list)
                        if action then
                            return action
                        end

                    else

                        -- We have an ability, so send it back
                        DBG("|cFF99FF99%s ==> '|cFF00FF00%s|cFF99FF99': %s|r", action.key, action.name, action.condition)
                        return action.name

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
