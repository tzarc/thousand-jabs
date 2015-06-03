local _, private = ...;
local TJ = private.TJ
local DBG = private.DBG
local tcache = private.tcache
local db = private.db

------------------------------------------------------------------------------------------------------------------------
-- Locals
------------------------------------------------------------------------------------------------------------------------

-- How quickly we allow updates - throttles multiple update triggers for events
local timeDelayAfterEvent = 0.2 -- seconds

-- Time to keep information pertaining to auras for each unit
local purgeTime = 10 -- seconds

-- Flags to check if we need to force an update of player/target cache
local playerGUID, targetGUID = nil, nil
local forceUpdatePlayer, forceUpdateTarget = nil, nil

------------------------------------------------------------------------------------------------------------------------
-- Shared private variables
------------------------------------------------------------------------------------------------------------------------

-- The active profile
private.currentProfile = nil

-- Event timer for throttling updates
private.eventTimer = nil

-- Time combat was last entered
private.combatStart = 0

-- Time when last incoming damage was encountered
private.lastIncomingDamage = 0

-- Store buff/debuff information for player and other previously-targeted units
private.unitCache = {}

-- Store incoming damage, for tanking purposes
private.damageTable = {}

------------------------------------------------------------------------------------------------------------------------
-- Addon initialisation
------------------------------------------------------------------------------------------------------------------------

function TJ:OnInitialize()
    -- Sort out the SavedVariables
    ThousandJabsDB = ThousandJabsDB or {}
    private.db = ThousandJabsDB
    db = private.db

    -- Pre-create the results table
    private.results = {
        single_target = {
            { actionName = "wait",  icon = "Interface\\Icons\\spell_holy_borrowedtime" },
            { actionName = "wait",  icon = "Interface\\Icons\\spell_holy_borrowedtime" },
            { actionName = "wait",  icon = "Interface\\Icons\\spell_holy_borrowedtime" },
            { actionName = "wait",  icon = "Interface\\Icons\\spell_holy_borrowedtime" },
        },
        cleave = {
            { actionName = "wait",  icon = "Interface\\Icons\\spell_holy_borrowedtime" },
            { actionName = "wait",  icon = "Interface\\Icons\\spell_holy_borrowedtime" },
        },
        aoe = {
            { actionName = "wait",  icon = "Interface\\Icons\\spell_holy_borrowedtime" },
            { actionName = "wait",  icon = "Interface\\Icons\\spell_holy_borrowedtime" },
        }
    }
end

------------------------------------------------------------------------------------------------------------------------
-- Addon enable/disable handlers
------------------------------------------------------------------------------------------------------------------------

function TJ:OnEnable()
    -- If we've reloaded UI during combat, reset the combatStart flag
    private.combatStart = InCombatLockdown() and GetTime() or 0
    -- Record the current HP of the player
    private.lastHP = UnitHealth('player')
    -- Add event listeners
    TJ:RegisterEvent('PLAYER_SPECIALIZATION_CHANGED')

    -- Create the frames
    if not private.actionsFrame then
        private.actionsFrame = private:CreateFrames()
    end

    -- Activate the profile
    private:ActivateProfile()
end

function TJ:OnDisable()
    -- Deactivate the profile
    private:DeactivateProfile()
    -- Remove event listeners
    TJ:UnregisterEvent('PLAYER_SPECIALIZATION_CHANGED')
end

------------------------------------------------------------------------------------------------------------------------
-- Profile activation/deactivation
------------------------------------------------------------------------------------------------------------------------

function private:ActivateProfile()
    -- Find a profile based on current class/spec
    private.currentProfile = private:GetActiveProfile()

    -- If we actually have a profile to show, activate it
    if private.currentProfile then

        -- Instruct the current profile to create its frames
        if private.currentProfile then
            --LoadAddOn("Blizzard_DebugTools")
            --DevTools_Dump({actions=private.currentProfile.actions})

            local cf = private.currentProfile.CreateFrames
            if cf then
                cf(private.currentProfile, private.actionsFrame)
            end

            -- Retrieve the current state
            if not private.st_state then
                private.st_state = private:CreateState(private.currentProfile, 1)
            end
            if not private.cleave_state then
                private.cleave_state = private:CreateState(private.currentProfile, 2)
            end
            if not private.aoe_state then
                private.aoe_state = private:CreateState(private.currentProfile, 3)
            end
        end

        -- Activate the new profile
        private.currentProfile:Activate()

        -- Show the frame
        private.actionsFrame:Show()

        -- Register event listeners
        TJ:RegisterEvent('PLAYER_REGEN_ENABLED')
        TJ:RegisterEvent('PLAYER_REGEN_DISABLED')
        TJ:RegisterEvent('PLAYER_TARGET_CHANGED')
        TJ:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')
        TJ:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED')
        TJ:RegisterEvent('PLAYER_ENTERING_WORLD', 'GENERIC_EVENT_UPDATE_HANDLER')
        TJ:RegisterEvent('PLAYER_TALENT_UPDATE', 'GENERIC_EVENT_UPDATE_HANDLER')
        TJ:RegisterEvent('ACTIONBAR_UPDATE_COOLDOWN', 'GENERIC_EVENT_UPDATE_HANDLER')
        TJ:RegisterEvent('UNIT_POWER')
        TJ:RegisterEvent('UNIT_POWER_FREQUENT', 'UNIT_POWER')
        TJ:RegisterEvent('UNIT_HEALTH')
        TJ:RegisterEvent('UNIT_HEALTH_FREQUENT', 'UNIT_HEALTH')

        -- Schedule a new update if we don't already have a timer for it
        private:QueueUpdate()
    end
end

function private:DeactivateProfile()
    -- Kill timers
    if private.eventTimer then TJ:CancelTimer(private.eventTimer) end
    private.eventTimer = nil

    -- Destroy states
    if private.st_state then private.st_state = nil end
    if private.cleave_state then private.cleave_state = nil end
    if private.aoe_state then private.aoe_state = nil end

    -- Remove event listeners
    TJ:UnregisterEvent('UNIT_HEALTH_FREQUENT')
    TJ:UnregisterEvent('UNIT_HEALTH')
    TJ:UnregisterEvent('UNIT_POWER_FREQUENT')
    TJ:UnregisterEvent('UNIT_POWER')
    TJ:UnregisterEvent('ACTIONBAR_UPDATE_COOLDOWN')
    TJ:UnregisterEvent('PLAYER_TALENT_UPDATE')
    TJ:UnregisterEvent('UNIT_SPELLCAST_SUCCEEDED')
    TJ:UnregisterEvent('PLAYER_ENTERING_WORLD')
    TJ:UnregisterEvent('COMBAT_LOG_EVENT_UNFILTERED')
    TJ:UnregisterEvent('PLAYER_TARGET_CHANGED')
    TJ:UnregisterEvent('PLAYER_REGEN_DISABLED')
    TJ:UnregisterEvent('PLAYER_REGEN_ENABLED')

    -- Deactivate the current profile
    if private.currentProfile then private.currentProfile:Deactivate() end

    -- Hide the frame
    private.actionsFrame:Hide()
end

------------------------------------------------------------------------------------------------------------------------
-- Data Caching
------------------------------------------------------------------------------------------------------------------------

function private:RetrieveActiveAuras(unit)
    local function GetAuraValues(unit, idx, filter)
        local v = tcache:acquire()
        v.name, v.rank, v.icon, v.count, v.auraType, v.duration, v.expirationTime, v.unitCaster, v.isStealable, v.shouldConsolidate, v.spellId, v.canApplyAura, v.isBossDebuff, v.value1, v.value2, v.value3 = UnitAura(unit, idx, filter, filter)
        v.unit = unit
        v.unitGUID = UnitGUID(unit)
        v.unitCasterGUID = v.unitCaster and UnitGUID(v.unitCaster) or nil
        v.mine = (v.unitCaster and v.unitCaster == 'player') and true or false
        if v.spellId then return v end
        tcache:release(v)
    end

    if not UnitExists(unit) then
        return
    end

    local auras = tcache:acquire()
    local blankDone, helpDone, harmDone = false, false, false
    for i=1, 40 do
        if blankDone == false then
            local v = GetAuraValues(unit, i)
            if v and v.spellId then
                v.harm = false
                auras[1+#auras] = v
            else
                blankDone = true
            end
        end
        if helpDone == false then
            local v = GetAuraValues(unit, i, 'HELPFUL')
            if v and v.spellId then
                v.harm = false
                auras[1+#auras] = v
            else
                helpDone = true
            end
        end
        if harmDone == false then
            local v = GetAuraValues(unit, i, 'HARMFUL')
            if v and v.spellId then
                v.harm = true
                auras[1+#auras] = v
            else
                harmDone = true
            end
        end
    end
    return auras
end

function private:GetAura(unit, spellId, mine)
    mine = mine or false
    local theGUID = UnitGUID(unit)
    if private.unitCache[theGUID] then
        local auras = private.unitCache[theGUID].auras
        for i=1,#auras do
            local aura = auras[i]
            if aura.spellId == spellId and (not mine or aura.mine) then
                return aura
            end
        end
    end
end

function private:UpdateUnitCache(unit, forceUpdate)
    private:Prolog('private:UpdateUnitCache')

    if UnitExists(unit) then
        local theGUID = UnitGUID(unit)
        if forceUpdate or not private.unitCache[theGUID] then
            private.unitCache[theGUID] = private.unitCache[theGUID] or tcache:acquire()
            if private.unitCache[theGUID].auras then tcache:release(private.unitCache[theGUID].auras) end
            private.unitCache[theGUID].auras = private:RetrieveActiveAuras(unit)
            private.unitCache[theGUID].lastSeen = GetTime()
        end
        private:UpdateTimeToDie(unit)

        private:Epilog()
        return theGUID
    end

    private:Epilog()
    return nil
end

function private:PurgeExpiredUnitCaches()
    for k, v in pairs(private.unitCache) do
        if v.lastSeen and (v.lastSeen + purgeTime) <= GetTime() then
            tcache:release(private.unitCache[k])
            private.unitCache[k] = nil
        end
    end
end

function TJ:UnitTimeToDie(unit)
    local theGUID = UnitGUID(unit)
    if not private.unitCache[theGUID] then return 9999 end
    return private.unitCache[theGUID].ttdData.ttd
end

function private:UpdateTimeToDie(unit)
    local theGUID = UnitGUID(unit)
    if not theGUID then return end
    if not private.unitCache[theGUID] then return end
    private.unitCache[theGUID].ttdData = private.unitCache[theGUID].ttdData or tcache:acquire()
    local currHealth, currTime = UnitHealth(unit), GetTime()
    local ttdData = private.unitCache[theGUID].ttdData

    if not ttdData.initHealth then
        ttdData.initHealth, ttdData.initTime = currHealth, currTime
        ttdData.ttd = 9999
    end
    if not ttdData.midHealth then
        ttdData.midHealth, ttdData.midTime = currHealth, currTime
    else
        ttdData.midHealth, ttdData.midTime = ((ttdData.midHealth + currHealth) * 0.5), ((ttdData.midTime + currTime) * 0.5)
    end

    local deltaHealth = ttdData.midHealth - ttdData.initHealth
    ttdData.ttd = (deltaHealth == 0) and 9999 or abs(currHealth * (ttdData.initTime - ttdData.midTime) / deltaHealth)
end

function private:GetIncomingDamage(timestamp, secs)
    local toDelete = tcache:acquire()
    local now = GetTime()
    local value = 0
    for entrytime, damage in pairs(private.damageTable) do
        -- Delete entries more than 1 min old
        if entrytime < now-60 then toDelete[1 + #toDelete] = entrytime end

        -- If this entry fulfils the time criteria, then add it
        if entrytime > timestamp-secs then
            value = value + damage
        end
    end

    -- Perform deletes
    for i=1, #toDelete do private.damageTable[toDelete[i]] = nil end
    tcache:release(toDelete)
    return value
end

------------------------------------------------------------------------------------------------------------------------
-- Screen update
------------------------------------------------------------------------------------------------------------------------

function private:QueueUpdate()
    -- Schedule a new update if we don't already have a timer for it
    private.eventTimer = private.eventTimer or TJ:ScheduleTimer('PerformUpdate', timeDelayAfterEvent)
end

function TJ:PerformUpdate()
    private:Prolog('TJ:PerformUpdate')

    -- Clear out any errors for the last screen update
    wipe(private.dbglist)
    -- Clear the update timer
    if private.eventTimer then TJ:CancelTimer(private.eventTimer) end
    private.eventTimer = nil

    -- Remove any entries from the unit cache which have expired
    private:PurgeExpiredUnitCaches()

    -- Cache current player/target information if requested
    playerGUID = private:UpdateUnitCache('player', forceUpdatePlayer)
    targetGUID = private:UpdateUnitCache('target', forceUpdateTarget)
    forceUpdatePlayer, forceUpdateTarget = nil, nil

    if private.currentProfile then
        private:ExecuteActionProfile(private.currentProfile)
    end

    -- Attempt to work out the cooldown frame, based off Jab
    local start, duration = GetSpellCooldown(private.currentProfile.gcdAbility)
    -- ....unless we're currently channeling something (i.e. fists of fury), in which case use the rest of its channel time
    local channelName, _, _, channelIcon, channelStart, channelEnd = UnitChannelInfo('player')
    if channelName then
        start = (channelStart * 0.001)
        duration = (channelEnd - channelStart) * 0.001
    end
    -- set the cooldown
    if start and duration then
        private.actionsFrame.iconFrames.cooldown:SetCooldown(start, duration)
    end

    -- Update icon textures
    for i=1,4 do
        private.actionsFrame.iconFrames.singleTarget[i].tex:SetTexture(private.results.single_target[i].icon)
    end
    for i=1,2 do
        private.actionsFrame.iconFrames.cleave[i].tex:SetTexture(private.results.cleave[i].icon)
        private.actionsFrame.iconFrames.aoe[i].tex:SetTexture(private.results.aoe[i].icon)
    end

    -- Let the current profile do its screen updates
    local pu = private.currentProfile and private.currentProfile.PerformUpdate
    if pu then
        pu(private.currentProfile)
    end

    private:Epilog()
end

function private:ExecuteActionProfile(actionProfile)
    DBG("Single Target")
    -- Calculate the single-target profiles
    private.st_state:Reset()
    DBG("\nchi.curr = %d, chi.spent = %d, chi.gained = %d\n", private.st_state.env.chi.curr, private.st_state.env.chi.spent, private.st_state.env.chi.gained)
    local st1action = private.st_state:PredictNextAction() or "wait"
    self.results.single_target[1].actionName = st1action
    self.results.single_target[1].icon = private.st_state.env[st1action].icon
    --DBG("Time since incoming damage: %.2f", st_state.env_proxy.time_since_incoming_damage)

    DBG("\nchi.curr = %d, chi.spent = %d, chi.gained = %d\n", private.st_state.env.chi.curr, private.st_state.env.chi.spent, private.st_state.env.chi.gained)
    local st2action = private.st_state:PredictActionFollowing(st1action) or "wait"
    self.results.single_target[2].actionName = st2action
    self.results.single_target[2].icon = private.st_state.env[st2action].icon

    DBG("\nchi.curr = %d, chi.spent = %d, chi.gained = %d\n", private.st_state.env.chi.curr, private.st_state.env.chi.spent, private.st_state.env.chi.gained)
    local st3action = private.st_state:PredictActionFollowing(st2action) or "wait"
    self.results.single_target[3].actionName = st3action
    self.results.single_target[3].icon = private.st_state.env[st3action].icon

    DBG("\nchi.curr = %d, chi.spent = %d, chi.gained = %d\n", private.st_state.env.chi.curr, private.st_state.env.chi.spent, private.st_state.env.chi.gained)
    local st4action = private.st_state:PredictActionFollowing(st3action) or "wait"
    self.results.single_target[4].actionName = st4action
    self.results.single_target[4].icon = private.st_state.env[st4action].icon

    DBG("Cleave")
    -- Calculate the Cleave actions
    private.cleave_state:Reset()
    local cleave1action = private.cleave_state:PredictNextAction() or "wait"
    self.results.cleave[1].actionName = cleave1action
    self.results.cleave[1].icon = private.cleave_state.env[cleave1action].icon

    local cleave2action = private.cleave_state:PredictActionFollowing(cleave1action) or "wait"
    self.results.cleave[2].actionName = cleave2action
    self.results.cleave[2].icon = private.cleave_state.env[cleave2action].icon

    DBG("AoE")
    -- Calculate the AoE actions
    private.aoe_state:Reset()
    local aoe1action = private.aoe_state:PredictNextAction() or "wait"
    self.results.aoe[1].actionName = aoe1action
    self.results.aoe[1].icon = private.aoe_state.env[aoe1action].icon

    local aoe2action = private.aoe_state:PredictActionFollowing(aoe1action) or "wait"
    self.results.aoe[2].actionName = aoe2action
    self.results.aoe[2].icon = private.aoe_state.env[aoe2action].icon
end

------------------------------------------------------------------------------------------------------------------------
-- Events
------------------------------------------------------------------------------------------------------------------------

function TJ:GENERIC_EVENT_UPDATE_HANDLER(eventName, ...)
    if private.currentProfile then
        local handler = private.currentProfile[eventName]
        if handler then
            handler(private.currentProfile, eventName, ...)
        end
    end
    private:QueueUpdate()
end

function TJ:UNIT_HEALTH(eventName, unitID)
    -- Only check if it's our own health changing
    if unitID == 'player' then
        -- Forward to the profile
        if private.currentProfile then
            local handler = private.currentProfile[eventName]
            if handler then
                handler(private.currentProfile, eventName, unitID)
            end
        end
        -- Only trigger incoming damage if in combat
        local combatStart = private.combatStart
        if combatStart > 0 then
            local lastHP, currHP = (private.lastHP or UnitHealthMax('player')), (UnitHealth('player') or 0)
            if currHP < lastHP then
                private.lastIncomingDamage = GetTime()
                private.lastHP = currHP
            end
        end
        private:QueueUpdate()
    end
end

function TJ:PLAYER_ENTERING_WORLD(eventName)
    if private.currentProfile then
        local handler = private.currentProfile[eventName]
        if handler then
            handler(private.currentProfile, eventName)
        end
    end
end

function TJ:UNIT_POWER(eventName, unitID, powerType)
    -- Only check if it's our own power changing
    if unitID == 'player' then
       -- Forward to the profile
        if private.currentProfile then
            local handler = private.currentProfile[eventName]
            if handler then
                handler(private.currentProfile, eventName, unitID, powerType)
            end
        end
        private:QueueUpdate()
    end
end

function TJ:PLAYER_SPECIALIZATION_CHANGED(eventName, unitID)
    if unitID == 'player' then
        -- Deactivate the current profile
        private:DeactivateProfile()
        -- Activate the new profile if present
        private.currentProfile = private:GetActiveProfile()
        private:ActivateProfile()
        private:QueueUpdate()
        if private.currentProfile then
            local handler = private.currentProfile[eventName]
            if handler then
                handler(private.currentProfile, eventName, unitID)
            end
        end
    end
end

function TJ:UNIT_SPELLCAST_SUCCEEDED(eventName, unitID)
    if unitID == 'player' then
        if private.currentProfile then
            local handler = private.currentProfile[eventName]
            if handler then
                handler(private.currentProfile, eventName, unitID)
            end
        end
        private:QueueUpdate()
    end
end

function TJ:PLAYER_REGEN_ENABLED(eventName)
    if private.currentProfile then
        local handler = private.currentProfile[eventName]
        if handler then
            handler(private.currentProfile, eventName)
        end
    end
    private.combatStart = 0
    private:QueueUpdate()
end

function TJ:PLAYER_REGEN_DISABLED(eventName)
    if private.currentProfile then
        local handler = private.currentProfile[eventName]
        if handler then
            handler(private.currentProfile, eventName)
        end
    end
    private.combatStart = GetTime()
    private:QueueUpdate()
end

function TJ:PLAYER_TARGET_CHANGED(eventName)
    if private.currentProfile then
        local handler = private.currentProfile[eventName]
        if handler then
            handler(private.currentProfile, eventName)
        end
    end

    -- Force a target cache update
    forceUpdateTarget = true
    private:QueueUpdate()
end

function TJ:COMBAT_LOG_EVENT_UNFILTERED(eventName, timeStamp, combatEvent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, arg12, arg13, arg14, arg15)
    -- Check if the player has received any damage, and update the last incoming damage time
    if destGUID == playerGUID then
        if arg15 and type(arg15) == 'number' and arg15 > 0 and combatEvent:find("_DAMAGE") then
            local timestamp = GetTime()
            private.lastIncomingDamage = timestamp
            private.damageTable[timestamp] = (private.damageTable[timestamp] or 0) + arg15
        end
    end

    -- We only want to know if it's a spell, and it concerns either the player or the current target
    if combatEvent:find('SPELL_') == 1 and (destGUID == playerGUID or destGUID == targetGUID) then
        -- Check if we've had an aura applied or removed
        if combatEvent == 'SPELL_AURA_APPLIED' or combatEvent == 'SPELL_AURA_REFRESH' or combatEvent == 'SPELL_AURA_REMOVED' then
            -- Update the cache for the relevant unit
            if destGUID == playerGUID then
                forceUpdatePlayer = true
            elseif destGUID == targetGUID then
                forceUpdateTarget = true
            end
            private:QueueUpdate()
        elseif combatEvent == 'SPELL_CAST_SUCCESS' then
            if sourceGUID == playerGUID then
                --[[
                -- Save the last cast
                lastCastTime = GetTime()
                lastCastSpellID = arg12
                ]]
                private:QueueUpdate()
            end
        end

        -- Send off to the active profile
        if private.currentProfile then
            local handler = private.currentProfile[eventName]
            if handler then
                handler(private.currentProfile, eventName, timeStamp, combatEvent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, arg12, arg13, arg14, arg15)
            end
        end
    end
end