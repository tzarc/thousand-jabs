local _, internal = ...;
local Z = internal.Z
local DBG = internal.DBG
local LTC = LibStub('LibTableCache-1.0')
local LUC = LibStub('LibUnitCache-1.0')

------------------------------------------------------------------------------------------------------------------------
-- Locals
------------------------------------------------------------------------------------------------------------------------

-- Timer update
local queuedScreenUpdateTime = 0.1   -- seconds
local watchdogScreenUpdateTime = 0.5 -- seconds
local queuedUpdateTimer = nil
local watchdogUpdateTimer = nil

------------------------------------------------------------------------------------------------------------------------
-- Shared private variables
------------------------------------------------------------------------------------------------------------------------

-- The active profile
Z.currentProfile = nil

-- Time combat was last entered
Z.combatStart = 0

-- Screen update timers
Z.queuedUpdateTimer = nil
Z.watchdogUpdateTimer = nil

-- Cast tracking
Z.lastCastTime = {}
Z.lastAutoAttack = 0

-- Incoming damage tracking
Z.lastIncomingDamage = 0
Z.damageTable = {}

------------------------------------------------------------------------------------------------------------------------
-- Addon initialisation
------------------------------------------------------------------------------------------------------------------------
function Z:OnInitialize()
    -- Pre-create the results table
    Z.results = {
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

    -- Show the debug log if we've enabled debugging
    if internal.GetConf("do_debug") then
        self:ShowLoggingFrame()
    end
end

------------------------------------------------------------------------------------------------------------------------
-- Screen update
------------------------------------------------------------------------------------------------------------------------

function Z:UpdateAlpha()
    local inCombat = InCombatLockdown()
    self.actionsFrame:SetAlpha(inCombat and internal.GetConf("inCombatAlpha") or internal.GetConf("outOfCombatAlpha"))
end

function Z:QueueUpdate()
    queuedUpdateTimer = queuedUpdateTimer or self:ScheduleTimer('PerformUpdate', queuedScreenUpdateTime)
end

function Z:PerformUpdate()
    -- Clear the update timer
    if queuedUpdateTimer then self:CancelTimer(queuedUpdateTimer) end
    queuedUpdateTimer = nil
    -- Clear and restart the watchdog timer
    if watchdogUpdateTimer then self:CancelTimer(watchdogUpdateTimer) end
    watchdogUpdateTimer = self:ScheduleTimer('PerformUpdate', watchdogScreenUpdateTime)

    -- Set up frame fading
    self:UpdateAlpha()

    -- Clear out any errors for the last screen update
    internal.DBGR()

    -- Cache current player/target information if requested
    LUC:UpdateUnitCache('player')
    LUC:UpdateUnitCache('target')

    if self.currentProfile then
        if internal.devMode then
            self.currentProfile:ParseAPL()
        end

        self:ExecuteAllActionProfiles()

        -- Attempt to work out the cooldown frame, based off the GCD
        local start, duration = GetSpellCooldown(61304)

        -- ....unless we're currently channeling something (i.e. fists of fury), in which case use the rest of its channel time
        local channelName, _, _, _, channelStart, channelEnd = UnitChannelInfo('player')
        if channelName then
            start = (channelStart * 0.001)
            duration = (channelEnd - channelStart) * 0.001
        end
        -- set the cooldown
        if start and duration then
            self.actionsFrame.iconFrames.cooldown:SetCooldown(start, duration)
        end
    end

    if self.actionsFrame then
        -- Update icon textures
        for i=1,4 do
            self.actionsFrame.iconFrames.singleTarget[i].tex:SetTexture(self.results.single_target[i].icon)
        end
        for i=1,2 do
            self.actionsFrame.iconFrames.cleave[i].tex:SetTexture(self.results.cleave[i].icon)
            self.actionsFrame.iconFrames.aoe[i].tex:SetTexture(self.results.aoe[i].icon)
        end

        -- Let the current profile do its screen updates
        local pu = self.currentProfile and rawget(self.currentProfile, 'PerformUpdate')
        if pu then
            pu(self.currentProfile)
        end
    end

    -- Perform a debugging screen update as well
    self:UpdateLog()
end

Z:ProfileFunction('PerformUpdate')

------------------------------------------------------------------------------------------------------------------------
-- Profile activation/deactivation
------------------------------------------------------------------------------------------------------------------------

function Z:GetActiveProfile()
    local classID, specID = select(3, UnitClass('player')), GetSpecialization()
    local isDisabled = internal.GetConf("class", classID, "spec", specID, "disabled") and true or false
    return (not isDisabled) and self.profiles and self.profiles[classID] and self.profiles[classID][specID] or nil
end

function Z:ActivateProfile()
    -- Set up a base GCD, this will change during combat
    self.currentGCD = 1

    -- Find a profile based on current class/spec
    self.currentProfile = self:GetActiveProfile()

    -- If we actually have a profile to show, activate it
    if self.currentProfile then
        -- Activate the profile
        self.currentProfile:Activate()

        -- Retrieve the current state
        if not self.st_state then
            self.st_state = self:CreateNewState(1)
        end
        if not self.cleave_state then
            self.cleave_state = self:CreateNewState(2)
        end
        if not self.aoe_state then
            self.aoe_state = self:CreateNewState(3)
        end

        -- Show the frame
        self.actionsFrame:Show()

        -- Register event listeners
        Z:RegisterEvent('PLAYER_LEVEL_UP')
        Z:RegisterEvent('PLAYER_REGEN_ENABLED')
        Z:RegisterEvent('PLAYER_REGEN_DISABLED')
        Z:RegisterEvent('PLAYER_TARGET_CHANGED')
        Z:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')
        Z:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED')
        Z:RegisterEvent('PLAYER_TALENT_UPDATE')
        Z:RegisterEvent('ACTIONBAR_UPDATE_COOLDOWN', 'GENERIC_EVENT_UPDATE_HANDLER')
        Z:RegisterEvent('UNIT_POWER')
        Z:RegisterEvent('UNIT_POWER_FREQUENT', 'UNIT_POWER')
    end
end

Z:ProfileFunction('ActivateProfile')

function Z:DeactivateProfile()
    -- Clear the update timer
    if queuedUpdateTimer then self:CancelTimer(queuedUpdateTimer) end
    queuedUpdateTimer = nil
    -- Clear and restart the watchdog timer
    if watchdogUpdateTimer then self:CancelTimer(watchdogUpdateTimer) end
    watchdogUpdateTimer = nil

    -- Hide the frame
    if self.actionsFrame then
        self.actionsFrame:Hide()
    end

    -- Destroy states
    if self.st_state then self.st_state = nil end
    if self.cleave_state then self.cleave_state = nil end
    if self.aoe_state then self.aoe_state = nil end

    -- Remove event listeners
    Z:UnregisterEvent('UNIT_POWER_FREQUENT')
    Z:UnregisterEvent('UNIT_POWER')
    Z:UnregisterEvent('ACTIONBAR_UPDATE_COOLDOWN')
    Z:UnregisterEvent('PLAYER_TALENT_UPDATE')
    Z:UnregisterEvent('UNIT_SPELLCAST_SUCCEEDED')
    Z:UnregisterEvent('PLAYER_ENTERING_WORLD')
    Z:UnregisterEvent('COMBAT_LOG_EVENT_UNFILTERED')
    Z:UnregisterEvent('PLAYER_TARGET_CHANGED')
    Z:UnregisterEvent('PLAYER_REGEN_DISABLED')
    Z:UnregisterEvent('PLAYER_REGEN_ENABLED')
    Z:UnregisterEvent('PLAYER_LEVEL_UP')

    -- Deactivate the current profile
    if self.currentProfile then self.currentProfile:Deactivate() end
end

Z:ProfileFunction('DeactivateProfile')

------------------------------------------------------------------------------------------------------------------------
-- APL Execution
------------------------------------------------------------------------------------------------------------------------

function Z:ExecuteAllActionProfiles()
    DBG("")
    DBG("Single Target")
    -- Calculate the single-target profiles
    self.st_state:Reset()
    local st1action = self.st_state:PredictNextAction() or "wait"
    self.results.single_target[1].actionName = st1action
    self.results.single_target[1].icon = self.st_state.env[st1action].Icon
    --DBG("Time since incoming damage: %.2f", st_state.env_proxy.time_since_incoming_damage)

    local st2action = self.st_state:PredictActionFollowing(st1action) or "wait"
    self.results.single_target[2].actionName = st2action
    self.results.single_target[2].icon = self.st_state.env[st2action].Icon

    local st3action = self.st_state:PredictActionFollowing(st2action) or "wait"
    self.results.single_target[3].actionName = st3action
    self.results.single_target[3].icon = self.st_state.env[st3action].Icon

    local st4action = self.st_state:PredictActionFollowing(st3action) or "wait"
    self.results.single_target[4].actionName = st4action
    self.results.single_target[4].icon = self.st_state.env[st4action].Icon

    DBG("")
    DBG("Cleave")
    -- Calculate the Cleave actions
    self.cleave_state:Reset()
    local cleave1action = self.cleave_state:PredictNextAction() or "wait"
    self.results.cleave[1].actionName = cleave1action
    self.results.cleave[1].icon = self.cleave_state.env[cleave1action].Icon

    local cleave2action = self.cleave_state:PredictActionFollowing(cleave1action) or "wait"
    self.results.cleave[2].actionName = cleave2action
    self.results.cleave[2].icon = self.cleave_state.env[cleave2action].Icon

    DBG("")
    DBG("AoE")
    -- Calculate the AoE actions
    self.aoe_state:Reset()
    local aoe1action = self.aoe_state:PredictNextAction() or "wait"
    self.results.aoe[1].actionName = aoe1action
    self.results.aoe[1].icon = self.aoe_state.env[aoe1action].Icon

    local aoe2action = self.aoe_state:PredictActionFollowing(aoe1action) or "wait"
    self.results.aoe[2].actionName = aoe2action
    self.results.aoe[2].icon = self.aoe_state.env[aoe2action].Icon
end

Z:ProfileFunction('ExecuteAllActionProfiles')

------------------------------------------------------------------------------------------------------------------------
-- Addon enable/disable handlers
------------------------------------------------------------------------------------------------------------------------

function Z:OnEnable()

    -- Add event listeners
    self:RegisterEvent('PLAYER_SPECIALIZATION_CHANGED')
    self:RegisterEvent('PLAYER_ENTERING_WORLD')
    self:RegisterEvent('SPELLS_CHANGED')

    -- Create the UI
    if not self.actionsFrame then
        self.actionsFrame = Z:CreateFrames()

        -- Handle movement if enabled
        self.actionsFrame:SetScript("OnMouseDown", function(self, button)
            if Z.movable and button == "LeftButton" and not self.isMoving then
                self:StartMoving()
                self.isMoving = true
            end
        end)
        self.actionsFrame:SetScript("OnMouseUp", function(self, button)
            if button == "LeftButton" and self.isMoving then
                self:StopMovingOrSizing()
                self.isMoving = false
                local srcPoint, _, tgtPoint, offsetX, offsetY = self:GetPoint()
                internal.SetConf(srcPoint, "position", "srcPoint")
                internal.SetConf(tgtPoint, "position", "tgtPoint")
                internal.SetConf(offsetX, "position", "offsetX")
                internal.SetConf(offsetY, "position", "offsetY")
            end
        end)
        self.actionsFrame:SetScript("OnHide", function(self)
            if self.isMoving then
                self:StopMovingOrSizing()
                self.isMoving = false
                local srcPoint, _, tgtPoint, offsetX, offsetY = self:GetPoint()
                internal.SetConf(srcPoint, "position", "srcPoint")
                internal.SetConf(tgtPoint, "position", "tgtPoint")
                internal.SetConf(offsetX, "position", "offsetX")
                internal.SetConf(offsetY, "position", "offsetY")
            end
        end)
    end
end

function Z:OnDisable()
    -- Deactivate the profile
    self:DeactivateProfile()

    -- Remove event listeners
    self:UnregisterEvent('SPELLS_CHANGED')
    self:UnregisterEvent('PLAYER_ENTERING_WORLD')
    self:UnregisterEvent('PLAYER_SPECIALIZATION_CHANGED')
end

------------------------------------------------------------------------------------------------------------------------
-- GCD detection, incoming damage tracking
------------------------------------------------------------------------------------------------------------------------

function Z:TryDetectUpdateGlobalCooldown(lastCastSpellID)
    -- Work out the current GCD
    local spellCD = GetSpellBaseCooldown(lastCastSpellID or 0)
    if spellCD and spellCD == 0 then
        local _, duration = GetSpellCooldown(61304)
        if duration and duration > 0 then
            local playerHasteMultiplier = ( 100 / ( 100 + UnitSpellHaste('player') ) )
            local gcd = duration / playerHasteMultiplier
            self.currentGCD = (gcd > 1) and gcd or 1
        end
    end
end

function Z:GetIncomingDamage(timestamp, secs)
    local toDelete = LTC:Acquire()
    local now = GetTime()
    local value = 0
    for entrytime, damage in pairs(self.damageTable) do
        -- Delete entries more than 1 min old
        if entrytime < now-60 then toDelete[1+#toDelete] = entrytime end

        -- If this entry fulfils the time criteria, then add it
        if entrytime > timestamp-secs then
            value = value + damage
        end
    end

    -- Perform deletes
    for i=1, #toDelete do self.damageTable[toDelete[i]] = nil end
    LTC:Release(toDelete)
    return value
end

