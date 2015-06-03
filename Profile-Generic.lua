local _, private = ...;
local TJ = private.TJ
local DBG = private.DBG
local tcache = private.tcache
local db = private.db

local tcontains = tContains

------------------------------------------------------------------------------------------------------------------------
-- Common data for all profiles
------------------------------------------------------------------------------------------------------------------------

local commonData = {
    -- Waiting for abilities...
    wait = {
        icon = "Interface\\Icons\\spell_holy_borrowedtime",

        PerformCast = function(spell,state) end,

        spell_cast_time = 1,
    },
    movement = {
        remains = 0,
    },
    level = {
        curr = function(self,state) return UnitLevel('player') or 0 end,
    },
    health = {
        curr = function(self,state) return UnitHealth('player') or 0 end,
        max = function(self,state) return UnitHealthMax('player') or 0 end,
        percent = function(self,state) return UnitExists('player') and (100 * UnitHealth('player') / UnitHealthMax('player')) or 0, true end,
        target_percent = function(self,state) return UnitExists('target') and (100 * UnitHealth('target') / UnitHealthMax('target')) or 0, true end,
    },
    target = {
        exists = function(self,state) return UnitExists('target'), true end,
        time_to_die = function(self,state) return (TJ:UnitTimeToDie('target') - state.predictionOffset) end,
    },
    -- Raid-wide or racial buffs we care about
    bloodlust = {
        abilityIDs = {},
        auraIDs = {},
        auraUnit = 'player',
    },
    blood_fury = {
        abilityIDs = {},

        PerformCast = function(spell,state) end,

        spell_cast_time = 1,
        spell_selected = function(self,state) return false end,
        spell_can_cast = false,
    },
    berserking = {
        abilityIDs = {},

        PerformCast = function(spell,state) end,

        spell_cast_time = 1,
        spell_selected = function(self,state) return false end,
        spell_can_cast = false,
    },
    arcane_torrent = {
        abilityIDs = {},

        PerformCast = function(spell,state) end,

        spell_cast_time = 1,
        spell_selected = function(self,state) return false end,
        spell_can_cast = false,
    },
}

------------------------------------------------------------------------------------------------------------------------
-- APL parsing
------------------------------------------------------------------------------------------------------------------------

function splitnewlines(str)
    local t = {}
    local function helper(line) table.insert(t, line) return "" end
    helper(str:gsub("(.-)\r?\n", helper))
    return t
end

local conditionalSubstitutions = {
    { "!([%a%._]+)%.remains([^%a%._])", "%1.remains=0%2" }, -- Handle "!buff.blah.remains" -> "buff.blah.remains==0"
    --{ "([%a%._]+)%.remains([^%a%._<>=])", "%1.remains>0%2" }, -- Handle "buff.blah.remains" -> "buff.blah.remains>0"
    { "!([%a%._]+)%.enabled([^%a%._])", "%1.selected=false%2" }, -- Handle "!talent.blah.enabled" -> "talent.blah.selected==false"
    { "([%a%._]+)%.enabled([^%a%._])", "%1.selected=true%2" }, -- Handle "talent.blah.enabled" -> "talent.blah.selected==true"
    { "!([%a%._]+)%.ticking([^%a%._])", "%1.remains=0%2" }, -- Handle "!dot.blah.ticking" -> "dot.blah.remains==0"
    { "([%a%._]+)%.ticking([^%a%._<>=])", "%1.remains>0%2" }, -- Handle "dot.blah.ticking" -> "dot.blah.remains>0"

    { "!([%a%._]+)%.up([^%a%._])", "%1.remains=0%2" }, -- Handle "!buff.blah.up" -> "buff.blah.remains==0"
    { "!([%a%._]+)%.down([^%a%._])", "%1.remains>0%2" }, -- Handle "!buff.blah.down" -> "buff.blah.remains>0"

    { "([%a%._]+)%.react([<>=]+)", "%1.stack%2" }, -- Handle "buff.blah.react>z" -> "buff.blah.stack>0"

    { "_pct", "_percent" },

    { "!", " not " },
    { "<", " < " },
    { ">", " > " },
    { "=", " = " },
    { "<%s+=", " <= " },
    { ">%s+=", " >= " },
    { " = ", " == " },
    { "+", " + " },
    { "-", " - " },
    { "*", " * " },
    { "&", " ) and ( " },
    { "|", " ) or ( " },
    { "%(", " ( " },
    { "%)", " ) " },
    { " target%.dot%.", " aura." },
    { " target%.buff%.", " aura." },
    { " target%.debuff%.", " aura." },
    { " level ", " level.curr " },
    { " dot%.", " aura." },
    { " buff%.", " aura." },
    { " debuff%.", " aura." },
    { " energy ", " energy.curr " },
    { " chi ", " chi.curr " },
    { " blood ", " blood.curr " },
    { " frost ", " frost.curr " },
    { " unholy ", " unholy.curr " },
    { " death ", " death.curr " },
    { " burning_ember ", " burning_ember.curr " },
    { " cast_time ", " spell.THIS_SPELL.cast_time " },
    { " time ", " time_since_combat_start " },
    { " gcd ", " gcd " },
    { " charges ", " spell.THIS_SPELL.charges " },
    { " recharge_time ", " spell.THIS_SPELL.recharge_time " },
    { " stagger%.(%a+) ", " stagger.%1 == true " },

    -- Static incoming damage checks
    { "%( incoming_damage_([%d]+)s %)",
      function(a)
        return format("( incoming_damage_over_%d > 0 )", tonumber(a)*1000)
      end
    },
    { "%( incoming_damage_([%d]+)ms %)",
      function(a)
        return format("( incoming_damage_over_%d > 0 )", tonumber(a))
      end
    },
    -- Comparison incoming damage checks
    { " incoming_damage_([%d]+)s ",
      function(a)
        return format(" incoming_damage_over_%d ", tonumber(a)*1000)
      end
    },
    { " incoming_damage_([%d]+)ms ",
      function(a)
        return format(" incoming_damage_over_%d ", tonumber(a))
      end
    },

    { " cooldown%.([%a%._]+)%.up ", " cooldown.%1.remains == 0 " },
    { " cooldown%.([%a%._]+)%.down ", " cooldown.%1.remains > 0 " },

    { " aura%.([%a%._]+)%.up ", " aura.%1.remains > 0 " },
    { " aura%.([%a%._]+)%.down ", " aura.%1.remains == 0 " },
    { " aura%.([%a%._]+)%.react ", " aura.%1.react " },

    -- Convert the state.XXXXX.spell.YYYYY -> state.spell.XXXXX_YYYYY
    { " ([%a_]+)%.([%a_]+)%.([%a_%.]+) ",
        function(a,b,c)
            return format(" %s.%s_%s ", b, a, c:gsub("%.","_"))
        end
    },
}

local blacklistedActions = {
    "flask",
    "food",
    "stance",
    "snapshot_stats",
    "potion",
    "use_item",
    "auto_attack",
}

local function ParseActionList(profile)
    local emptyEnvironment = setmetatable({}, { __index = function(tbl,key) return nil end })
    local profileLines = splitnewlines(profile.actionList or "")
    local profileErrors = {}
    local actionCounts = {}
    local parsedActions = {}

    for i,line in pairs(profileLines) do
        -- Only continue if the line contains "action" at the start
        if line:find("action") == 1 then
            if line:find("%a%s*%(") then -- ensure we don't have any attempted function calls
                profileErrors[#profileErrors+1] = format("Malformed line: '%s'", line)
            else
                local entry = {}

                -- Work this action, and if it's for a specific action list, use "default" list if not specified
                local actionList, actionName = line:match('^actions%.?([%a_]*)[^%a]+([^,]+)')
                if not actionList or actionList == "" then actionList = "default" end
                entry.name = actionName

                -- Work out if this ability should be skipped
                local blacklisted = false
                if tcontains(blacklistedActions, actionName) or (profile.blacklistedActions and tcontains(profile.blacklistedActions, actionName)) then
                    blacklisted = true
                end

                -- The ability wasn't blacklisted, so parse the conditions and parameters
                if not blacklisted then
                    local key = format("%s:%s", actionList, actionName)
                    -- Determine parameters
                    local paramName = line:match('name=([^,]*),?') or ""
                    local paramType = line:match('type=([^,]*),?') or ""
                    local paramChoose = line:match('choose=([^,]*),?') or ""
                    local paramIf = line:match('if=([^,]*),?') or "true"

                    -- Count how many times we've seen this ability during this action list, for logging purposes
                    actionCounts[key] = (actionCounts[key] or 0) + 1

                    -- Set the key of this action
                    entry.key = format("%s[%d]", key, actionCounts[key])

                    -- Work out the base condition string in the APL, as well as a cast validation check
                    local condition = paramIf
                    if actionName ~= "call_action_list" and actionName ~= "run_action_list" then
                        if profile[actionName] then
                            condition = format("(spell.%s.can_cast=true)&(%s)", actionName, condition)
                        end
                    else
                        entry.list = paramName
                    end
                    condition = format("(%s)", condition)


                    -- Run through the text substitutions to make the conditional lua-friendly
                    if condition ~= "(true)" then
                        for k,s in pairs(conditionalSubstitutions) do
                            -- Run the substitution
                            condition = condition:gsub(s[1], s[2])

                            -- Remove any double-spaces
                            while condition:find("  ") do
                                condition = condition:gsub("  "," ")
                            end
                        end

                        -- Replace 'THIS_SPELL' with the actual action name
                        condition = condition:gsub("THIS_SPELL", actionName)
                    end

                    -- Save the actual condition string
                    entry.condition = condition

                    -- Return the result of the conditional and compile
                    local conditionFunctionSource = "return function() return (" .. condition .. ") end"
                    local conditionFunctionLoader, errStr = loadstring(conditionFunctionSource, entry.key)
                    if errStr then
                        profileErrors[#profileErrors+1] = format("Could not load condition: %s='%s'", entry.key, errStr)
                    else
                        setfenv(conditionFunctionLoader, emptyEnvironment)
                        local success, conditionFunction = pcall(assert(conditionFunctionLoader))
                        -- Log an error during compilation if any
                        if not success or not conditionFunction then
                            profileErrors[#profileErrors+1] = format("Could not compile condition: %s='%s'", entry.key, condition)
                        else
                            -- Save the function/condition string
                            entry.check = conditionFunction

                            -- Save the parsed entry
                            parsedActions[actionList] = parsedActions[actionList] or {}
                            local t = parsedActions[actionList]
                            t[1+#t] = entry
                        end
                    end
                end
            end
        end
    end
    profile.actions = parsedActions
    profile.errors = profileErrors
end

------------------------------------------------------------------------------------------------------------------------
-- Profile registration/retrieval
------------------------------------------------------------------------------------------------------------------------

function private:RegisterProfile(name, classID, specID, profile)
    private.profiles = private.profiles or {}
    private.profiles[classID] = private.profiles[classID] or {}
    private.profiles[classID][specID] = profile

    profile.profileName = name

    local function GetIconForAbility(ability,field)
        local s = ability[field]
        if s then
            if type(s) == 'table' then
                for i=1,#s do
                    local _, _, icon = GetSpellInfo(s[i])
                    if icon then return icon end
                end
            else
                local _, _, icon = GetSpellInfo(s)
                if icon then return icon end
            end
        end
    end

    -- Copy over all common data into the profile
    for k,v in pairs(commonData) do
        profile[k] = v
    end

    -- Parse each ability in the profile, and update icons/functions
    for k,v in pairs(profile) do
        if type(v) == 'table' then
            -- Find icon for the ability if required
            if (not v.icon or v.icon == "") then
                v.icon = GetIconForAbility(v,'abilityID') or GetIconForAbility(v,'auraID') or 'INTERFACE\\ICONS\\INV_MISC_QUESTIONMARK'
            end

            -- Add aura-specific functions
            if rawget(v, 'auraID') then
                v.aura_react = function(spell, env)
                    local remains = spell.expirationTime - env.currentTime
                    return (remains > 0) and true or false
                end
                v.aura_remains = function(spell, env)
                    local remains = spell.expirationTime - env.currentTime
                    return (remains > 0) and remains or 0
                end
            end

            -- Add cooldown-specific functions
            if rawget(v, 'cooldownTime') then
                v.cooldown_remains = function(spell, env)
                    local remains = spell.cooldownStart + spell.cooldownDuration - env.currentTime
                    return (remains > 0) and remains or 0
                end
            end

            -- Add recharge-specific functions
            if rawget(v, 'rechargeTime') then
                v.spell_charges = function(spell, env)
                    return spell.rechargeSampled - spell.rechargeSpent
                end
                v.spell_recharge_time = function(spell, env)
                    local remains = spell.rechargeStartTime + spell.rechargeDuration - env.currentTime
                    return (spell.spell_charges == spell.rechargeMax) and 0 or remains
                end
                v.cooldown_remains = v.spell_recharge_time
            end
        end
    end

    -- Parse the APL
    ParseActionList(profile)
end

function private:GetActiveProfile()
    local classID, specID = select(3, UnitClass('player')), GetSpecialization()
    return private.profiles and private.profiles[classID] and private.profiles[classID][specID] or nil
end

------------------------------------------------------------------------------------------------------------------------
-- State definitions
------------------------------------------------------------------------------------------------------------------------

local baseEnvironment = {
    predictionOffset = 0,
    gcd = 0,
    currentTime = function(env, _)
        return env.sampleTime + env.predictionOffset
    end,
    time_since_combat_start = function(env, _)
        return (private.combatStart > 0) and (env.currentTime - private.combatStart) or 0
    end,
    time_since_incoming_damage = function(env, _)
        return (private.lastIncomingDamage > 0) and (env.currentTime - private.lastIncomingDamage) or 0
    end,
}

-- create a state, with matching fallback tables for each spell/ability
function private:CreateState(profile, number_of_targets)
    private:Prolog('private:CreateState')

    -- Set up the state and associate a profile with it
    local state = private:LogMissingAccess("state", {})

    -- Set up an environment table for calling the condition functions
    state.env_base = private:LogMissingAccess("state.env", {})
    for k,v in pairs(baseEnvironment) do
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
                    val = private:GetIncomingDamage(state.env.currentTime, length/1000)
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
    for k, v in pairs(profile) do
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

    -- Helper for cleaning a state
    function state:Reset()
        private:Prolog("state:Reset")
        -- Clear out the environment and reset to initial values
        for k,v in pairs(state.env) do
            if type(v) == 'table' then
                -- Wipe the environment table
                wipe(v)

                -- Get the equivalent profile entry for this table
                local entry = profile[k]

                -- Add data if we're checking auras for this entry
                if rawget(entry, 'auraID') then
                    local aura = private:GetAura(entry.auraUnit, entry.auraID, entry.auraMine)
                    v.expirationTime = aura and aura.expirationTime or 0
                    v.aura_stack = aura and aura.count or 0
                end

                -- Add data if we're checking cooldowns for this entry
                if rawget(entry, 'cooldownTime') then
                    v.cooldownStart, v.cooldownDuration = GetSpellCooldown(entry.abilityID)
                end

                -- Add data if we're checking charges for this entry
                if rawget(entry, 'rechargeTime') then
                    local charges, maxCharges, start, duration = GetSpellCharges(entry.abilityID)
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
        state.env.active_enemies = number_of_targets
        state.env.playerHasteMultiplier = ( 100 / ( 100 + UnitSpellHaste('player') ) )

        private:Epilog()
    end

    -- Base action prediction for the current time, or just after the current cast finishes
    function state:PredictNextAction()
        -- Attempt to work out the cooldown frame, based off Jab
        local start, duration = GetSpellCooldown(profile.gcdAbility)
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

    -- Prediction of the action following the one specified, mocing the prediction time accordingly
    function state:PredictActionFollowing(action)
        local act = state.env[action]
        if act then
            local newOffset = state.env.predictionOffset + act.spell_cast_time
            if rawget(profile[action], "cooldownTime") then
                act.cooldownStart = state.env.currentTime
                act.cooldownDuration = act.cooldownTime
            end
            local pc = rawget(profile[action], "PerformCast")
            if pc then pc(act, state.env) end
            return state:PredictActionAtOffset(newOffset)
        end
        return nil
    end

    -- Prediction at the supplied time offset
    function state:PredictActionAtOffset(predictionOffset)
        state.env.predictionOffset = predictionOffset
        DBG("Offset: %.3f", predictionOffset)
        return state:ExecuteActionProfileList("default")
    end

    -- Execute an action profile list and get the resulting action
    function state:ExecuteActionProfileList(listname)
        private:Prolog("state:ExecuteActionProfileList(%s)",listname)
        local actionList = profile.actions[listname]
        for i=1,#actionList do
            local action = actionList[i]
            if action.check then
                setfenv(action.check, state.env)
                local status, ret = pcall(action.check)
                if not status then
                    DBG("------------------------------------------------------------------------------------")
                    DBG(ret or "(no return value for condition check)")
                    DBG("--------------")
                    DBG(action.condition)
                    DBG("------------------------------------------------------------------------------------")
                    private:PrintOnce("Error executing condition function:\n------\n%s\n------\n%s\n------", ret, action.condition)
                elseif ret == true then
                    if action.name == 'call_action_list' or action.name == 'run_action_list' then
                        local action = state:ExecuteActionProfileList(action.list)
                        if action then
                            private:Epilog()
                            return action
                        end
                    else
                        DBG("%s -> %s", action.key, action.condition)
                        private:Epilog()
                        return action.name
                    end
                end
            end
        end
        private:Epilog()
    end

    -- Reset the state by default, populating with initial data
    state:Reset()

    private:Epilog()
    return state
end

