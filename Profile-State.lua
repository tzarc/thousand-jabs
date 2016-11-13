local addonName, internal = ...;
local TJ = internal.TJ
local Debug = internal.Debug
local fmt = internal.fmt
local Profiling = TJ:GetModule('Profiling')
local UnitCache = TJ:GetModule('UnitCache')

local getmetatable = getmetatable
local pairs = pairs
local pcall = pcall
local rawget = rawget
local setfenv = setfenv
local setmetatable = setmetatable
local tconcat = table.concat
local tcontains = tContains
local tostring = tostring
local type = type
local wipe = wipe
local GetSpellCharges = GetSpellCharges
local GetSpellCooldown = GetSpellCooldown
local GetTime = GetTime
local UnitCastingInfo = UnitCastingInfo
local UnitChannelInfo = UnitChannelInfo
local UnitLevel = UnitLevel
local UnitSpellHaste = UnitSpellHaste

internal.Safety()

local safeTableEntries = { 'type', 'tostring', 'hooks', 'can_spend', 'perform_spend', 'OnStateInit', 'OnPredictActionAtOffset' }
local safeFunctions = {
    type = type,
    tostring = tostring,
}

local function convertToNumber(n)
    if type(n) == 'number' then
        return n
    elseif type(n) == 'boolean' then
        return n and 1 or 0
    end
    return tonumber(n)
end

local function convertToBoolean(n)
    if type(n) == 'boolean' then
        return n
    elseif type(n) == 'number' then
        return n ~= 0 and true or false
    elseif type(n) == 'string' then
        return n == 'true' and true or false
    end
end

local function CreateStateEnvTable(state, profile)
    -- Set up an environment table for calling the condition functions
    local env_base = {}
    for k,v in pairs(internal.baseEnvironment) do
        env_base[k] = v
    end
    env_base = TJ:MissingFieldTable(getmetatable(state).__name..".env", env_base)

    -- Set up a proxy table which correctly calls functions to retrieve data instead
    local env = setmetatable({}, {
        __env_base = env_base,
        __index = function(tbl, idx)
            local env_base = getmetatable(tbl).__env_base
            -- Handle conversions to number
            local asnumbersuffix = "_as_number"
            if idx:match(asnumbersuffix) then
                idx = idx:gsub(asnumbersuffix,"")
                local v = tbl[idx]
                return type(v) == 'number' and v or (v and 1 or 0)
            end
            -- Handle incoming damage queries
            local dmgprefix = "incoming_damage_over_"
            if idx:match(dmgprefix) then
                local val = 0
                local length = tonumber(idx:sub(dmgprefix:len()+1))
                if length >= tbl.time_since_incoming_damage then
                    val = TJ:GetIncomingDamage(GetTime(), length/1000) -- use GetTime() here, as future prediction will change the accumulation window
                end
                return val
            end
            -- Forward to the base table
            local e = env_base[idx]
            if type(e) == 'function' then
                local res = e(tbl, tbl)
                return res
            else
                return e
            end
            return rawget(tbl,idx)
        end
    })

    -- Set up fallback tables for each of the abilities
    for k, v in pairs(profile.actions) do
        if type(v) == 'table' then
            env[k] = setmetatable({}, {
                __env = env,
                __action = v,
                __index = function(tbl, idx)
                    local env = getmetatable(tbl).__env
                    local action = getmetatable(tbl).__action
                    -- Allow raw access to the safe entries, without throwing faults
                    if tcontains(safeTableEntries, idx) then
                        return rawget(action, idx)
                    end
                    -- Handle conversions to number
                    local asnumbersuffix = "_as_number"
                    if idx:match(asnumbersuffix) then
                        idx = idx:gsub(asnumbersuffix,"")
                        local v = tbl[idx]
                        return type(v) == 'number' and v or (v and 1 or 0)
                    end
                    -- Forward to the profile table
                    local e = action[idx]
                    if type(e) == 'function' then
                        local res = e(tbl, env)
                        return res
                    else
                        return e
                    end
                    return rawget(tbl,idx)
                end
            })
        end
    end

    return env
end

local function CreatePrevGcdTable(state, profile)
    local prev_gcd = setmetatable({}, {
        __env = state.env,
        __profile = profile,
        __index = function(tbl,idx)
            local env = getmetatable(tbl).__env
            local profile = getmetatable(tbl).__profile
            -- find the last cast ability
            local lastTime, lastAbility = 0, nil
            for k,v in pairs(env.lastCastTimes) do
                if v > lastTime then
                    lastAbility = k
                    lastTime = v
                end
            end

            if lastTime + ((TJ.currentGCD or 1)*1.5) < env.currentTime then return false end -- if we've gone through at least 1.5 gcd's with no ability spent, reset everything

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
    return prev_gcd
end

local function CreateEquippedTable(state, profile)
    local equipped = setmetatable({}, {
        __index = function(tbl,idx)
            return false -- TODO
        end,
    })
    return equipped
end


-- Helper for cleaning a state
local function StateResetPrototype(self)
    local env = self.env
    env.prev_gcd = nil
    env.equipped = nil
    env.lastCastTimes = nil

    -- Deep copy over the last cast times for the state so that we're not writing to the global state instead
    wipe(self.lastCastTimes)
    for k,v in pairs(TJ.lastCastTime) do
        self.lastCastTimes[k] = v
    end

    -- Clear out the environment and reset to initial values
    for k,v in pairs(env) do
        if type(v) == 'table' then
            -- Wipe the environment table
            wipe(v)

            -- Get the equivalent profile entry for this table
            local entry = self.profile.actions[k]

            -- Add data if we're checking auras for this entry
            if rawget(entry, 'AuraID') then
                local aura = UnitCache:GetAura(entry.AuraUnit, entry.AuraID, entry.AuraMine)
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
            env[k] = nil
        end
    end

    -- Safe functions
    for k,v in pairs(safeFunctions) do
        env[k] = v
    end

    -- Number conversion function
    env._N = convertToNumber
    env._B = convertToBoolean

    -- Set the initial parameters
    env.ptr = false
    env.sampleTime = GetTime()
    env.active_enemies = self.numTargets
    env.spell_targets = self.numTargets
    env.desired_targets = self.numTargets - 1
    env.playerHasteMultiplier = ( 100 / ( 100 + UnitSpellHaste('player') ) )
    env.player_level = UnitLevel('player')
    env.movement.distance = internal.range_to_unit('target')
    env.gcd = TJ.currentGCD * env.playerHasteMultiplier
    env.gcd_max = TJ.currentGCD * env.playerHasteMultiplier

    -- Reset the prev_gcd/equipped tables
    env.prev_gcd = self.prev_gcd
    env.equipped = self.equipped
    env.lastCastTimes = self.lastCastTimes

    -- Call the current profile's state initialisation function
    local initFunc = env.hooks.OnStateInit
    if initFunc then initFunc(env) end
end

-- Base action prediction for the current time, or just after the current cast finishes
local function StatePredictNextActionPrototype(self)
    local env = self.env

    -- Attempt to work out when we can next cast something, based off the gcd
    local start, duration = GetSpellCooldown(61304)

    -- Set the combat start time
    env.combatStart = (TJ.combatStart ~= 0) and TJ.combatStart or GetTime()

    -- ....unless we're currently casting/channeling something (i.e. fists of fury), in which case use it instead
    local cname, _, _, _, cstart, cend, _, _, _, spellCastID = UnitCastingInfo('player')
    local performPostCastAction = false
    if cname then
        performPostCastAction = true
        Debug("Currently casting: %s", tostring(spellCastID))
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
    return self:PredictActionAtOffset(predictionOffset, performPostCastAction and spellCastID or nil)
end

-- Prediction of the action following the one specified, mocing the prediction time accordingly
local function StatePredictActionFollowingPrototype(self, action)
    local env = self.env
    local act = env[action]
    if act then
        -- Pretend we just casted the supplied action, update the last cast time for this ability
        self.lastCastTimes[act.AbilityID] = env.currentTime
        -- Perform the cast of the supplied action
        self.profile.actions[action].perform_cast(act, env)
        -- Work out the new prediction offset given its cast time
        local newOffset = env.predictionOffset + act.spell_cast_time
        -- Predict the next action
        return self:PredictActionAtOffset(newOffset)
    end
    return nil
end

-- Prediction at the supplied time offset
local function StatePredictActionAtOffsetPrototype(self, predictionOffset, performPostCastSpellID)
    local env = self.env
    env.predictionOffset = predictionOffset

    if performPostCastSpellID ~= nil then
        Debug("Handling cast of %s", tostring(performPostCastSpellID))
        local action = self.profile:FindActionForSpellID(performPostCastSpellID)
        if action then
            Debug("Handling cast of %s", action)
            local act = self.profile.actions[action]
            -- Pretend we just casted the supplied action, update the last cast time for this ability
            self.lastCastTimes[act.AbilityID] = env.currentTime
            -- Perform the cast of the supplied action
            self.profile.actions[action].perform_cast(act, env)
        end
    end

    Debug("")
    Debug("Offset: %.3f", predictionOffset)
    Debug("Range: <= %d yd", env.movement.distance)

    -- Call the current profile's state initialisation function
    local func = env.hooks.OnPredictActionAtOffset
    if func then func(env) end

    return self:ExecuteActionProfileList("default")
end

-- Execute an action profile list and get the resulting action
local function StateExecuteActionProfileListPrototype(self, listname)
    local env = self.env

    -- Get the requested action list to execute
    local actionList = self.profile.parsedActions[listname]
    if not actionList or #actionList == 0 then
        return nil
    end

    -- Loop through all the actions in the list
    for i=1,#actionList do
        -- Get the action under consideration
        local action = actionList[i]
        -- Show debug information if requested
        if action.params.debug then
            if not action.keywords_printer then
                local entries = action.action == "variable"
                    and {}
                    or { fmt("'|cFFFFFF99%s.spell_can_cast=|cFFFF9900' .. tostring(%s.spell_can_cast)", action.action, action.action) }
                local keywords = action.params.condition_converted and action.params.condition_converted.keywords
                    or action.params.value_converted and action.params.value_converted.keywords
                    or {}
                for k,v in pairs(keywords) do
                    entries[1+#entries] = fmt("'|cFFFFFF99%s=|cFFFF9900' .. (type(%s) == 'number' and ('%%.2f'):format(%s) or tostring(%s))", v, v, v, v)
                end
                local funcsrc = fmt("function() return %s end", tconcat(entries, " .. '|r, ' .. "))
                action.keywords_printer = TJ:LoadFunctionString(funcsrc:gsub('THIS_SPELL', action.action), action.key)
            end
            setfenv(action.keywords_printer, env)
            Debug("%s|r", action.keywords_printer())
        end

        if action.action == "variable" then
            -- Execute the variable value function with the current state
            setfenv(action.value_func, env)
            local status, ret = pcall(action.value_func)
            -- If we got a failure, then print out in the debugging and console
            if not status then
                Debug("|cFFFF0000%s (ERROR EXECUTING): %s|r", action.key, action.fullvaluefuncsrc)
                internal.error(internal.fmt("Error executing variable function:\n------\n%s\n------\n%s\n------", ret, action.fullvaluefuncsrc))
            else
                -- Update the value
                env.variable[action.params.name] = ret
                Debug("|cFFFF99FF%s ==> |cFFDD00FF%s = %s|cFFFF99FF: %s|r", action.key, action.params.name, tostring(ret), action.fullvaluefuncsrc)
            end
            -- Validate that it isn't blacklisted, and there's a valid check function
        elseif tcontains(self.profile.blacklisted, action.action) then
        -- Debug("|cFFCC9999%s (blacklisted): %s|r", action.key, action.condition)
        elseif action.condition_func then -- We have a valid check function
            -- Execute the check function with the current state
            setfenv(action.condition_func, env)
            local status, ret = pcall(action.condition_func)
            -- If we got a failure, then print out in the debugging and console
            if not status then
                Debug("|cFFFF0000%s (ERROR EXECUTING): %s|r", action.key, action.fullconditionfuncsrc)
                internal.error(internal.fmt("Error executing condition function:\n------\n%s\n------\n%s\n------", ret, action.fullconditionfuncsrc))
            elseif ret == false then
                -- Ran correctly, but the condition failed...
                Debug("|r%s: %s", action.key, action.fullconditionfuncsrc)
            elseif ret == true then
                -- If the condition succeeded....
                if action.action == 'call_action_list' or action.action == 'run_action_list' then
                    -- ...we're running another action list, so run that recursively
                    Debug("|cFF99FFFF%s ==> '|cFF00DDFF%s|cFF99FFFF': %s|r", action.key, action.params.name, action.fullconditionfuncsrc)
                    local action = self:ExecuteActionProfileList(action.params.name)
                    if action then
                        return action
                    end
                else
                    -- We have an ability, so send it back
                    Debug("|cFF99FF99%s ==> '|cFF00FF00%s|cFF99FF99': %s|r", action.key, action.action, action.fullconditionfuncsrc)
                    return action.action
                end
            end
        end
    end
end

function TJ:CreateNewState(numTargets)

    local profile = TJ:GetActiveProfile()
    if not profile then return end

    -- Set up the state and associate a profile with it
    local state = TJ:MissingFieldTable("state{"..profile.name.."}", {
        numTargets = numTargets,
    })

    -- Keep track of the profile, last cast times
    state.profile = profile
    state.lastCastTimes = {}

    -- Set up proxy tables
    state.env = CreateStateEnvTable(state, profile)
    state.prev_gcd = CreatePrevGcdTable(state, profile)
    state.equipped = CreateEquippedTable(state, profile)

    state.Reset = StateResetPrototype
    Profiling:ProfileFunction(state, 'Reset', 'state:Reset')

    -- Base action prediction for the current time, or just after the current cast finishes
    state.PredictNextAction = StatePredictNextActionPrototype
    Profiling:ProfileFunction(state, 'PredictNextAction', 'state:PredictNextAction')

    -- Prediction of the action following the one specified, mocing the prediction time accordingly
    state.PredictActionFollowing = StatePredictActionFollowingPrototype
    Profiling:ProfileFunction(state, 'PredictActionFollowing', 'state:PredictActionFollowing')

    -- Prediction at the supplied time offset
    state.PredictActionAtOffset = StatePredictActionAtOffsetPrototype
    Profiling:ProfileFunction(state, 'PredictActionAtOffset', 'state:PredictActionAtOffset')

    -- Execute an action profile list and get the resulting action
    state.ExecuteActionProfileList = StateExecuteActionProfileListPrototype
    Profiling:ProfileFunction(state, 'ExecuteActionProfileList', 'state:ExecuteActionProfileList')

    -- Reset the state by default, populating with initial data
    state:Reset()
    return state
end
