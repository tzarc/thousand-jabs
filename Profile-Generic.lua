local _, internal = ...;
local Z = internal.Z
local DBG = internal.DBG

local tcontains = tContains

local LTC = LibStub('LibTableCache-1.0')
local LUC = LibStub('LibUnitCache-1.0')

local commonData = Z:MissingFieldTable('commonData', {
    -- Waiting for abilities...
    wait = {
        icon = "Interface\\Icons\\spell_holy_borrowedtime",
        spell_cast_time = 1,
        perform_cast = function(spell,env) end,
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
    },
})

internal.resources = Z:MissingFieldTable('internal.resources', {
    energy = {
        sampled = function(power, env) return (UnitPower('player', SPELL_POWER_ENERGY) or 0) end,
        regen = function(power, env) return GetPowerRegen() end,
        spent = 0,
        gained = 0,
        curr = function(power, env) return power.sampled + power.gained - power.spent + power.regen * env.predictionOffset end,
        max = function(power, env) return (UnitPowerMax('player', SPELL_POWER_ENERGY) or 0) end,
        time_to_max = function(power, env) return (power.max - power.curr) /power.regen end,
    },
    chi = {
        sampled = function(power, env) return (UnitPower('player', SPELL_POWER_CHI) or 0) end,
        spent = 0,
        gained = 0,
        curr = function(power, env) return power.sampled - power.spent + power.gained end,
        max = function(power, env) return (UnitPowerMax('player', SPELL_POWER_CHI) or 0) end,
    },
})

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

function Z:GuessSpells()
    local ret = {}
    local function slug(name) return name:lower():gsub(' ','_'):gsub('[^a-z_]','') end
    for spellID, spellName, spellSubText, spellBookItem, isTalent, icon in IteratePlayerSpells() do
        ret[slug(spellName)] = {
            Name = spellName,
            AbilityID = spellID,
            SpellBookSubtext = spellSubText,
            SpellBookItem = spellBookItem,
            IsTalent = isTalent,
            SpellBookSpellID = spellID,
            icon = icon
        }
    end

    -- Detect talents
    for tier=1,7 do
        for column=1,3 do
            local talentID, name, texture, selected, available, spellID = GetTalentInfo(tier, column, GetActiveSpecGroup())
            ret[slug(name)] = ret[slug(name)] or {}
            ret[slug(name)].TalentIDs = { tier, column }
            ret[slug(name)].IsTalent = true
        end
    end
    return ret
end

local global_blacklisted_abilities = {
    auto_attack = true,
    potion = true,
    blood_fury = true,
    berserking = true,
    bloodlust = true,
    arcane_torrent = true,
}

function Z:RegisterProfile(profileName, classID, specID, ...)
    local profileTable = Z:MissingFieldTable(profileName, self:MergeTables(commonData, ...))
    self.profiles = self.profiles or {}
    self.profiles[classID] = self.profiles[classID] or {}
    self.profiles[classID][specID] = profileTable
    profileTable.profileName = profileName

    profileTable.Activate = function()
        local guessedAbilities = Z:GuessSpells()

        if not rawget(profileTable, 'parsedActions') then
            profileTable.parsedActions = Z:ParseActionProfileList(internal.apls[profileTable.actionProfile])
        end

        for k,v in pairs(guessedAbilities) do
            if rawget(profileTable, k) then
                for k2,v2 in pairs(v) do
                    if not rawget(profileTable[k], k2) then
                        profileTable[k][k2] = v2
                    end
                end
            else
                profileTable[k] = v
            end
        end

        profileTable.blacklist = {}
        for k,v in pairs(global_blacklisted_abilities) do
            profileTable.blacklist[1+#profileTable.blacklist] = k
        end
        for k,v in pairs(profileTable.blacklistedActions) do
            profileTable.blacklist[1+#profileTable.blacklist] = k
        end

        for k,v in pairs(profileTable) do
            if type(v) == 'table' and rawget(v, 'TalentIDs') then
                v.talent_selected = function(spell, env) return select(4, GetTalentInfo(spell.TalentIDs[1], spell.TalentIDs[2], GetActiveSpecGroup())) and true or false end
            end

            local playerHasteMultiplier = ( 100 / ( 100 + UnitSpellHaste('player') ) )

            -- Cater for when an ability is disabled through talents or some such nonsense
            if type(v) == 'table' and not rawget(v, 'AbilityID') and k ~= 'mappedActions' and k ~= 'blacklistedActions' then
                v.spell_can_cast = function(spell, env) return false end
            end

            if type(v) == 'table' and rawget(v, 'AbilityID') then
                local name, _, icon = GetSpellInfo(v.AbilityID)
                v.icon = icon
                local cooldownSecs, isCooldownAffectedByHaste = Z:GetSpellCooldown(v.AbilityID)
                local fullCooldownSecs = (isCooldownAffectedByHaste or false) and cooldownSecs/playerHasteMultiplier or cooldownSecs or 0
                local rechargeSecs, isRechargeAffectedByHaste = Z:GetSpellRechargeTime(v.AbilityID)
                local fullRechargeSecs = (isRechargeAffectedByHaste or false) and rechargeSecs/playerHasteMultiplier or rechargeSecs or 0
                local costType, costBase, costPerTime = Z:GetSpellCost(v.AbilityID)
                local canCastFuncStr = '(env.player_level >= '..GetSpellLevelLearned(v.AbilityID)..')'
                local performCastFuncStr = ''

                if not rawget(v, 'spell_cast_time') then
                    v.spell_cast_time = 1 -- select(4, GetSpellInfo(v.AbilityID)) / 1000.0
                end

                -- Conditional if the spell has enough power to spend, as well as performing the spend when casting
                if costType then
                    if not rawget(v, costType..'_cost') then
                        v[costType..'_cost'] = costBase
                    end
                    canCastFuncStr = canCastFuncStr .. ' and (env.'..costType..'.curr >= spell.'..costType..'_cost)'
                    performCastFuncStr = performCastFuncStr .. '; env.'..costType..'.spent = env.'..costType..'.spent + spell.'..costType..'_cost'
                end

                -- Conditional if the spell is currently on cooldown
                if fullCooldownSecs and fullCooldownSecs > 0 then
                    if not rawget(v, 'CooldownTime') then
                        v.CooldownTime = isCooldownAffectedByHaste and (function(spell,env) return env.playerHasteMultiplier * fullCooldownSecs end) or fullCooldownSecs
                    end
                    canCastFuncStr = canCastFuncStr .. ' and (spell.cooldown_remains == 0)'
                    performCastFuncStr = performCastFuncStr .. '; spell.cooldownStart = env.currentTime; spell.cooldownDuration = spell.CooldownTime'
                end

                -- If spell has charges
                if fullRechargeSecs and fullRechargeSecs > 0 then
                    if not rawget(v, 'RechargeTime') then
                        v.RechargeTime = isRechargeAffectedByHaste and (function(spell,env) return env.playerHasteMultiplier * fullRechargeSecs end) or fullRechargeSecs
                    end
                    canCastFuncStr = canCastFuncStr .. ' and (spell.spell_charges > 0)'
                    performCastFuncStr = performCastFuncStr .. '; spell.rechargeSpent = spell.rechargeSpent + 1'
                end

                -- Conditional if talents are specified
                if rawget(v, 'TalentIDs') then
                    canCastFuncStr = canCastFuncStr .. ' and (spell.talent_selected and true or false)'
                end

                -- Conditional if there's a spell-specific function in the supplied table
                if rawget(v, 'CanCast') then
                    canCastFuncStr = canCastFuncStr .. ' and (spell.CanCast and true or false)'
                end

                -- Whether performing a cast should apply an aura
                if rawget(v, 'AuraApplied') then
                    performCastFuncStr = performCastFuncStr .. '; env.'..v.AuraApplied..'.expirationTime = env.currentTime + '..v.AuraApplyLength
                end

                -- Whether there's a spell-specific function in the supplied table
                if rawget(v, 'PerformCast') then
                    performCastFuncStr = performCastFuncStr .. '; r = spell.PerformCast'
                end

                -- Load the can-cast function
                canCastFuncStr = 'return function(spell, env) return ((' .. canCastFuncStr:gsub('^ and ', '') .. ') and true or false) end'
                v.spell_can_cast = Z:LoadFunctionString(canCastFuncStr, k..':spell_can_cast')
                v.spell_can_cast_FuncStr = canCastFuncStr

                -- Load the perform-cast function
                performCastFuncStr = 'return function(spell, env) ' .. performCastFuncStr:gsub('^; ', '') .. ' end'
                v.perform_cast = Z:LoadFunctionString(performCastFuncStr, k..':perform_cast')
                v.perform_cast_FuncStr = performCastFuncStr

                -- Add cooldown-specific functions
                if rawget(v, 'CooldownTime') then
                    v.cooldown_remains = function(spell, env)
                        local remains = spell.cooldownStart + spell.cooldownDuration - env.currentTime
                        return (remains > 0) and remains or 0
                    end
                end

                -- Add recharge-specific functions
                if rawget(v, 'RechargeTime') then
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

        if rawget(profileTable, 'mappedActions') then
            for k,v in pairs(profileTable.mappedActions) do
                profileTable[k] = profileTable[v]
            end
        end
    end

    profileTable.Deactivate = function()
    end

    Z:Print("Activated profile %s", profileTable.profileName)
end

local baseEnvironment = {
    predictionOffset = 0,
    gcd = 0,
    currentTime = function(env, _)
        return env.sampleTime + env.predictionOffset
    end,
    time_since_combat_start = function(env, _)
        return (Z.combatStart > 0) and (env.currentTime - Z.combatStart) or 0
    end,
    time_since_incoming_damage = function(env, _)
        return (Z.lastIncomingDamage > 0) and (env.currentTime - Z.lastIncomingDamage) or 0
    end,
}

function Z:CreateNewState(numTargets)
    local profile = Z:GetActiveProfile()
    if not profile then return end

    -- Set up the state and associate a profile with it
    local state = Z:MissingFieldTable("state{"..profile.profileName.."}", {})

    -- Set up an environment table for calling the condition functions
    state.env_base = Z:MissingFieldTable("state{"..profile.profileName.."}.env", {})
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

    prev_gcd = setmetatable({}, { __index = function(tbl,idx) return false end })

    -- Helper for cleaning a state
    function state:Reset()
        state.env.prev_gcd = nil

        -- Clear out the environment and reset to initial values
        for k,v in pairs(state.env) do
            if type(v) == 'table' then
                -- Wipe the environment table
                wipe(v)

                -- Get the equivalent profile entry for this table
                local entry = profile[k]

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

                --if rawget(entry, 'AuraID') and entry.AuraID == 137639 then DevTools_Dump{[entry.Name]=v, entry=entry, aura=LUC:GetAura(entry.AuraUnit, entry.AuraID, entry.AuraMine)} end

            else
                state.env[k] = nil
            end
        end

        -- Set the initial parameters
        state.env.sampleTime = GetTime()
        state.env.active_enemies = numTargets
        state.env.spell_targets = numTargets
        state.env.playerHasteMultiplier = ( 100 / ( 100 + UnitSpellHaste('player') ) )
        state.env.player_level = UnitLevel('player')

        -- Reset the prev_gcd table
        state.env.prev_gcd = prev_gcd
    end
    Z:ProfileFunction(state, 'Reset')

    -- Base action prediction for the current time, or just after the current cast finishes
    function state:PredictNextAction()
        -- Attempt to work out the cooldown frame
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
            DBG('casting %s (cast time = %.2f)', action, act.spell_cast_time)
            profile[action].perform_cast(act, state.env)
            return state:PredictActionAtOffset(newOffset)
        end
        return nil
    end

    -- Prediction at the supplied time offset
    function state:PredictActionAtOffset(predictionOffset)
        state.env.predictionOffset = predictionOffset
        DBG("")
        DBG("Offset: %.3f", predictionOffset)
        return state:ExecuteActionProfileList("default")
    end

    -- Execute an action profile list and get the resulting action
    function state:ExecuteActionProfileList(listname)
        local actionList = profile.parsedActions[listname]
        for i=1,#actionList do
            local action = actionList[i]
            DBG("%s %s ---- %s", action.key, tcontains(profile.blacklist, action.name) and "(blacklisted)" or "", action.condition)
            if not tcontains(profile.blacklist, action.name) then
                if action.check then
                    setfenv(action.check, state.env)
                    local status, ret = pcall(action.check)
                    if not status then
                        DBG("------------------------------------------------------------------------------------")
                        DBG(ret or "(no return value for condition check)")
                        DBG("--------------")
                        DBG(action.condition)
                        DBG("------------------------------------------------------------------------------------")
                        Z:PrintOnce("Error executing condition function:\n------\n%s\n------\n%s\n------", ret, action.condition)
                    elseif ret == true then
                        if action.name == 'call_action_list' or action.name == 'run_action_list' then
                            local action = state:ExecuteActionProfileList(action.list)
                            if action then
                                return action
                            end
                        else
                            DBG("%s -> %s", action.key, action.condition)
                            return action.name
                        end
                    end
                end
            end
        end
    end
    Z:ProfileFunction(state, 'ExecuteActionProfileList')

    -- Reset the state by default, populating with initial data
    state:Reset()
    return state
end
