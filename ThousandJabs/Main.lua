local LibStub = LibStub
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Config = TJ:GetModule('Config')
local Profiling = TJ:GetModule('Profiling')
local TableCache = TJ:GetModule('TableCache')
local UnitCache = TJ:GetModule('UnitCache')
local UI = TJ:GetModule('UI')

local LSD = LibStub('LibSerpentDump')

local ct = function() return TableCache:Acquire() end
local rt = function(tbl) TableCache:Release(tbl) end

local co_create = coroutine.create
local co_resume = coroutine.resume
local co_status = coroutine.status
local GetSpecialization = GetSpecialization
local GetSpellBaseCooldown = GetSpellBaseCooldown
local GetSpellCooldown = GetSpellCooldown
local GetTime = GetTime
local LoadAddOn = LoadAddOn
local mmax = math.max
local NewTicker = C_Timer.NewTicker
local pairs = pairs
local pcall = pcall
local select = select
local tconcat = table.concat
local tremove = table.remove
local UnitCastingInfo = UnitCastingInfo
local UnitChannelInfo = UnitChannelInfo
local UnitClass = UnitClass
local UnitSpellHaste = UnitSpellHaste
local wipe = wipe

Core:Safety()

------------------------------------------------------------------------------------------------------------------------
-- Locals
------------------------------------------------------------------------------------------------------------------------

-- Timer update
local screenUpdateTimer = nil
local queuedScreenUpdateTime = 0.2
local watchdogScreenUpdateTime = 0.75
local nextScreenUpdateExpiry = GetTime()
local watchdogScreenUpdateExpiry = GetTime()

-- Profile reload frequency
local lastProfileReload = 0
local profileReloadThrottle = 2 -- Seconds

-- Casting constants
local castQueuePurgeTime = 30

------------------------------------------------------------------------------------------------------------------------
-- Shared private variables
------------------------------------------------------------------------------------------------------------------------

-- Profile data
TJ.currentProfile = nil
TJ.profileDefinitions = {}
TJ.availableProfiles = {}

-- Time combat was last entered
TJ.combatStart = 0
TJ.inCombat = false

-- Cast tracking
TJ.abilitiesUsed = {}
TJ.lastCastTimes = {}
TJ.castsOffGCD = {}
TJ.lastMainhandAttack = 0
TJ.lastOffhandAttack = 0
TJ.castQueue = {}

-- Incoming damage tracking
TJ.lastIncomingDamage = 0
TJ.damageTable = {}

-- Target tracking
TJ.seenTargets = {}

------------------------------------------------------------------------------------------------------------------------
-- Addon initialisation
------------------------------------------------------------------------------------------------------------------------
function TJ:OnInitialize()
    -- Upgrade any config entries that need to be updated
    Config:Upgrade()
end

------------------------------------------------------------------------------------------------------------------------
-- Command queue
------------------------------------------------------------------------------------------------------------------------

local commandQueue = {}

function TJ:ExecuteFuncAsCoroutine(funcToExec)
    local th = co_create(funcToExec)
    commandQueue[th] = true
    TJ:QueueUpdate()
end

local coroutineSkipped = true -- Run a screen update in between every exec
function TJ:RunFuncCoroutines()
    if coroutineSkipped then
        for th in pairs(commandQueue) do
            coroutineSkipped = false
            if co_status(th) == "dead" then
                commandQueue[th] = nil
            else
                local ok, errstr = co_resume(th)
                if not ok then
                    Core:Error(errstr)
                    commandQueue[th] = nil
                end
            end
        end
    else
        coroutineSkipped = true
    end
    local exists = false
    for _,_ in pairs(commandQueue) do exists = true end
    if exists then TJ:QueueUpdate() end
end

local periodicCallbacks = {}

function TJ:SetupPeriodicCallback(interval, callback)
    periodicCallbacks[callback] = { nextRun = 0, interval = interval }
end

function TJ:RunPeriodicCallbacks()
    local now = GetTime()

    for callback, callbackData in pairs(periodicCallbacks) do
        if callbackData.nextRun < now then
            callbackData.nextRun = now + callbackData.interval
            pcall(callback)
        end
    end
end

------------------------------------------------------------------------------------------------------------------------
-- Screen update
------------------------------------------------------------------------------------------------------------------------

function TJ:QueueUpdate()
    local now = GetTime()

    if not screenUpdateTimer then
        watchdogScreenUpdateExpiry = now + watchdogScreenUpdateTime
        screenUpdateTimer = NewTicker(0.01, function()
            TJ:RunPeriodicCallbacks()
            TJ:PerformUpdateTimerCheck()
        end)
    end

    nextScreenUpdateExpiry = nextScreenUpdateExpiry or now + queuedScreenUpdateTime
end

function TJ:QueueProfileReload(forceNow)
    TJ.needsProfileReload = true
    if forceNow then
        lastProfileReload = 0
        nextScreenUpdateExpiry = 0
        queuedScreenUpdateTime = Config:Get("fastUpdateSpeed")
        watchdogScreenUpdateTime = Config:Get("slowUpdateSpeed")
    end
    TJ:QueueUpdate()
end

function TJ:PerformUpdateTimerCheck()
    -- Drop out early if we're not needed yet
    local now = GetTime()
    if watchdogScreenUpdateExpiry > now then
        if not nextScreenUpdateExpiry or nextScreenUpdateExpiry > now then
            return
        end
    end
    -- Reset the expiry times
    nextScreenUpdateExpiry = nil
    watchdogScreenUpdateExpiry = now + watchdogScreenUpdateTime
    -- Actually perform the update
    TJ:PerformUpdate()
end

function TJ:PerformUpdate()
    local now = GetTime()

    -- Clear out any errors for the last screen update
    Core:DebugReset()

    -- Update stats
    Core:UpdateUsageStatistics()

    -- Purge any old cast times
    local expiryTime = 10 * (TJ.currentGCD or 1)
    for k,v in pairs(TJ.abilitiesUsed) do
        if k + expiryTime < now then
            TJ.abilitiesUsed[k] = nil
        end
    end
    for k,v in pairs(TJ.lastCastTimes) do
        if v + expiryTime < now then
            TJ.lastCastTimes[k] = nil
        end
    end
    for k,v in pairs(TJ.seenTargets) do
        if v + expiryTime < now then
            TJ.seenTargets[k] = nil
        end
    end
    while #TJ.castQueue > 0 and TJ.castQueue[1].time < now - castQueuePurgeTime do
        local e = TJ.castQueue[1]
        tremove(TJ.castQueue, 1)
        rt(e)
    end

    if TJ.needsProfileReload and lastProfileReload + profileReloadThrottle < now then
        TJ.needsProfileReload = nil
        lastProfileReload = now

        -- Deactivate the current profile
        TJ:DeactivateProfile()
        -- Activate the new profile if present
        TJ:ActivateProfile()
    end

    if TJ.currentProfile then
        -- Set up frame fading
        UI:UpdateAlpha()

        -- Cache current player/target information if requested
        UnitCache:UpdateUnitCache('player', true)
        UnitCache:UpdateUnitCache('target', true)

        -- Perform the prediction...
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
            UI:SetCooldown(start, duration)
        end
    end

    -- Perform a debugging screen update as well
    Core:UpdateLog()

    -- Run any commands in the queue
    self:RunFuncCoroutines()
end
--Profiling:ProfileFunction(TJ, 'PerformUpdate')

------------------------------------------------------------------------------------------------------------------------
-- Profile activation/deactivation
------------------------------------------------------------------------------------------------------------------------

function TJ:GetActiveProfile()
    local classID, specID = select(3, UnitClass('player')), GetSpecialization()
    local isDisabled = Config:GetSpecGeneric("disabled") and true or false
    local profile = (not isDisabled) and (self.profiles and self.profiles[classID] and self.profiles[classID][specID]) or nil
    return profile
end

function TJ:ActivateProfile()
    -- Ensure logging has a separate line entry, and doesn't contribute to other metrics
    --Profiling:ProfileFunction(Core, 'UpdateLog', 'Core:UpdateLog')

    -- Set up a base GCD, this will change during combat
    self.currentGCD = 1

    -- Find a profile based on current class/spec
    TJ.currentProfile = self:GetActiveProfile()

    -- If we actually have a profile to show, activate it
    if TJ.currentProfile then
        -- Activate the profile
        TJ.currentProfile:Activate()

        -- Create new state
        self.state = self:CreateNewState()

        -- Show the frame
        UI:Show()
        UI:EnableMouse(self.movable)
        UI:UpdateAlpha()

        -- Register event listeners
        TJ:RegisterEvent('PLAYER_LEVEL_UP', 'GENERIC_RELOAD_PROFILE_HANDLER')
        TJ:RegisterEvent('PLAYER_REGEN_ENABLED')
        TJ:RegisterEvent('PLAYER_REGEN_DISABLED')
        TJ:RegisterEvent('PLAYER_TARGET_CHANGED', 'GENERIC_EVENT_UPDATE_HANDLER')
        TJ:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')
        TJ:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED')
        TJ:RegisterEvent('PLAYER_TALENT_UPDATE', 'GENERIC_RELOAD_PROFILE_HANDLER')
        TJ:RegisterEvent('ACTIONBAR_UPDATE_COOLDOWN', 'GENERIC_EVENT_UPDATE_HANDLER')
        TJ:RegisterEvent('PET_BAR_UPDATE', 'GENERIC_EVENT_UPDATE_HANDLER')
        TJ:RegisterEvent('PET_BAR_UPDATE_COOLDOWN', 'GENERIC_EVENT_UPDATE_HANDLER')
        TJ:RegisterEvent('UNIT_POWER')
        TJ:RegisterEvent('UNIT_POWER_FREQUENT', 'UNIT_POWER')
        TJ:RegisterEvent('UNIT_PET')
        TJ:RegisterEvent('UNIT_AURA')
        TJ:RegisterEvent('SPELL_ACTIVATION_OVERLAY_GLOW_SHOW', 'GENERIC_EVENT_UPDATE_HANDLER')
    else
        UI:Hide()
        UI:EnableMouse(false)
    end

    self:QueueUpdate()
end
--Profiling:ProfileFunction(TJ, 'ActivateProfile')

function TJ:DeactivateProfile()
    -- Clear the update timer
    if screenUpdateTimer then screenUpdateTimer:Cancel() end
    screenUpdateTimer = nil

    -- Hide the frame
    UI:Hide()

    -- Destroy states
    if self.state then self.state = nil end

    -- Remove event listeners
    TJ:UnregisterEvent('SPELL_ACTIVATION_OVERLAY_GLOW_SHOW')
    TJ:UnregisterEvent('UNIT_AURA')
    TJ:UnregisterEvent('UNIT_PET')
    TJ:UnregisterEvent('UNIT_POWER_FREQUENT')
    TJ:UnregisterEvent('UNIT_POWER')
    TJ:UnregisterEvent('PET_BAR_UPDATE_COOLDOWN')
    TJ:UnregisterEvent('PET_BAR_UPDATE')
    TJ:UnregisterEvent('ACTIONBAR_UPDATE_COOLDOWN')
    TJ:UnregisterEvent('PLAYER_TALENT_UPDATE')
    TJ:UnregisterEvent('UNIT_SPELLCAST_SUCCEEDED')
    TJ:UnregisterEvent('COMBAT_LOG_EVENT_UNFILTERED')
    TJ:UnregisterEvent('PLAYER_TARGET_CHANGED')
    TJ:UnregisterEvent('PLAYER_REGEN_DISABLED')
    TJ:UnregisterEvent('PLAYER_REGEN_ENABLED')
    TJ:UnregisterEvent('PLAYER_LEVEL_UP')

    -- Deactivate the current profile
    if TJ.currentProfile then
        TJ.currentProfile:Deactivate()
        TJ.currentProfile = nil
    end

    self:QueueUpdate()
end
--Profiling:ProfileFunction(TJ, 'DeactivateProfile')

------------------------------------------------------------------------------------------------------------------------
-- Queued profile actions
------------------------------------------------------------------------------------------------------------------------

function TJ:ExportCurrentProfile()
    if TJ.currentProfile and self.state then
        local actionsTable = self.state:ExportActionsTable()
        local dbg = Core:GenerateDebuggingInformation()
        Core:OpenDebugWindow('ThousandJabs Current profile', 'zzzz='..LSD({
            ['!dbg'] = dbg,
            ['actions'] = actionsTable,
            ['parsed'] = self.state:ExportParsedTable(),
        }):gsub('|', '||'))
    end
end

------------------------------------------------------------------------------------------------------------------------
-- APL Execution
------------------------------------------------------------------------------------------------------------------------

function TJ:ExecuteAllActionProfiles()
    -- Work out how many targets we're dealing with
    local targetCount = 0
    for k,v in Core:OrderedPairs(self.seenTargets) do
        targetCount = targetCount + 1
    end
    targetCount = mmax(1, targetCount)

    -- Reset the single-target state
    Core:Debug("")
    Core:Debug(Config:Get('displayMode') ~= 'automatic' and "|cFFFFFFFFSingle Target|r" or "|cFFFFFFFFAutomatic Target Counting|r" )
    self.state:Reset(Config:Get('displayMode') == 'automatic' and targetCount or 1, targetCount)

    -- Export the current profile state just after reset, if requested
    if TJ.needExportCurrentProfile then
        TJ.needExportCurrentProfile = nil
        Core:DevPrint("Exporting current profile...")
        self:ExportCurrentProfile()
    end

    -- Calculate the single-target profiles
    local action = self.state:PredictNextAction() or "wait"
    UI:SetAction(UI.SINGLE_TARGET, 1, self.state.env[action].Icon, self.state.env[action].OverlayTitle)
    action = self.state:PredictActionFollowing(action) or "wait"
    UI:SetAction(UI.SINGLE_TARGET, 2, self.state.env[action].Icon, self.state.env[action].OverlayTitle)
    action = self.state:PredictActionFollowing(action) or "wait"
    UI:SetAction(UI.SINGLE_TARGET, 3, self.state.env[action].Icon, self.state.env[action].OverlayTitle)
    action = self.state:PredictActionFollowing(action) or "wait"
    UI:SetAction(UI.SINGLE_TARGET, 4, self.state.env[action].Icon, self.state.env[action].OverlayTitle)

    if Config:Get('displayMode') ~= 'automatic' then
        if Config:Get('showCleave') then
            Core:Debug("")
            Core:Debug("|cFFFFFFFFCleave|r")
            self.state:Reset(2, targetCount)
            action = self.state:PredictNextAction() or "wait"
            UI:SetAction(UI.CLEAVE, 1, self.state.env[action].Icon, self.state.env[action].OverlayTitle)
            action = self.state:PredictActionFollowing(action) or "wait"
            UI:SetAction(UI.CLEAVE, 2, self.state.env[action].Icon, self.state.env[action].OverlayTitle)
        end

        if Config:Get('showAoE') then
            Core:Debug("")
            Core:Debug("|cFFFFFFFFAoE|r")
            self.state:Reset(3, targetCount)
            action = self.state:PredictNextAction() or "wait"
            UI:SetAction(UI.AOE, 1, self.state.env[action].Icon, self.state.env[action].OverlayTitle)
            action = self.state:PredictActionFollowing(action) or "wait"
            UI:SetAction(UI.AOE, 2, self.state.env[action].Icon, self.state.env[action].OverlayTitle)
        end
    end
end
--Profiling:ProfileFunction(TJ, 'ExecuteAllActionProfiles')

------------------------------------------------------------------------------------------------------------------------
-- Addon enable/disable handlers
------------------------------------------------------------------------------------------------------------------------

function TJ:OnEnable()
    -- Add event listeners
    self:RegisterEvent('PLAYER_SPECIALIZATION_CHANGED', 'GENERIC_RELOAD_PROFILE_HANDLER')
    self:RegisterEvent('PLAYER_ALIVE', 'GENERIC_RELOAD_PROFILE_HANDLER')
    self:RegisterEvent('PLAYER_DEAD', 'GENERIC_RELOAD_PROFILE_HANDLER')
    self:RegisterEvent('PLAYER_ENTERING_WORLD', 'GENERIC_RELOAD_PROFILE_HANDLER')
    self:RegisterEvent('SPELLS_CHANGED', 'GENERIC_RELOAD_PROFILE_HANDLER')

    -- Create the UI
    UI:CreateFrames()
    UI:EnableMouse(self.movable)
    UI:UpdateAlpha()

    -- Handle movement if enabled
    UI:SetScript("OnMouseDown", function(self, button)
        if UI.movable and button == "LeftButton" and not self.isMoving then
            self:StartMoving()
            self.isMoving = true
        end
    end)
    UI:SetScript("OnMouseUp", function(self, button)
        if button == "LeftButton" and self.isMoving then
            self:StopMovingOrSizing()
            self.isMoving = false
            local _, _, tgtPoint, offsetX, offsetY = self:GetPoint()
            Config:Set(tgtPoint, "position", "tgtPoint")
            Config:Set(offsetX, "position", "offsetX")
            Config:Set(offsetY, "position", "offsetY")
        end
    end)
    UI:SetScript("OnHide", function(self)
        if self.isMoving then
            self:StopMovingOrSizing()
            self.isMoving = false
            local _, _, tgtPoint, offsetX, offsetY = self:GetPoint()
            Config:Set(tgtPoint, "position", "tgtPoint")
            Config:Set(offsetX, "position", "offsetX")
            Config:Set(offsetY, "position", "offsetY")
        end
    end)

    -- Show the debug log if we've enabled debugging
    if Config:Get("do_debug") then
        Core:ShowLoggingFrame()
    end
end

function TJ:OnDisable()
    -- Disable the debug log
    Core:HideLoggingFrame()

    -- Deactivate the profile
    self:DeactivateProfile()

    -- Remove event listeners
    self:UnregisterEvent('SPELLS_CHANGED')
    self:UnregisterEvent('PLAYER_ENTERING_WORLD')
    self:UnregisterEvent('ZONE_CHANGED_NEW_AREA')
    self:UnregisterEvent('ZONE_CHANGED_INDOORS')
    self:UnregisterEvent('ZONE_CHANGED')
    self:UnregisterEvent('PLAYER_SPECIALIZATION_CHANGED')
end

------------------------------------------------------------------------------------------------------------------------
-- GCD detection, incoming damage tracking
------------------------------------------------------------------------------------------------------------------------

local function currentlyInsideGCD()
    return (UnitCastingInfo('player') or UnitChannelInfo('player') or GetSpellCooldown(61304) > 0) and true or false
end

function TJ:SpellCastSuccess(spellID, caster)
    local now = GetTime()
    -- Keep track of successful casts made
    self.lastCastTimes[spellID] = now
    local ability = TJ.currentProfile:FindActionForSpellID(spellID)
    if ability then
        self.abilitiesUsed[now] = ability
        if caster == "pet" then
            self.castsOffGCD[ability] = true
        else
            self:UpdateCastsOffGCD(ability)
        end

        local found = false
        for k,v in pairs(TJ.castQueue) do
            if v.time == now and v.ability == ability and v.caster == caster then
                found = true
                break
            end
        end

        if not found then
            local offGCD = (caster == 'pet' or currentlyInsideGCD()) and true or false
            local t = ct()
            t.time, t.ability, t.caster, t.offGCD = now, ability, caster, offGCD
            TJ.castQueue[1+#TJ.castQueue] = t
        end
    end

    -- Update the GCD amount if possible
    self:TryDetectUpdateGlobalCooldown(spellID)

    -- Queue a screen update
    self:QueueUpdate()
end

function TJ:UpdateCastsOffGCD(action)
    -- If we're still casting, then assume an ability or something has been cast off-GCD
    if currentlyInsideGCD() then
        if action then
            TJ.castsOffGCD[action] = true
        end
    else
        -- Not casting any more, wipe the off-GCD casts table
        wipe(TJ.castsOffGCD)

        -- If our pet is currently channeling, then we need to re-add it
        -- Match by name... for some reason Blizz doesn't want us to know the spellID
        local n = UnitChannelInfo('pet')
        if n then
            for k,v in pairs(TJ.currentProfile.actions) do
                if rawget(v, 'SpellBookCaster') == 'pet' then
                    local n2 = rawget(v, 'Name')
                    if n == n2 then
                        TJ.castsOffGCD[k] = true
                        return
                    end
                end
            end
        end
    end
end

function TJ:TryDetectUpdateGlobalCooldown(lastCastSpellID)
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

function TJ:GetIncomingDamage(timestamp, secs)
    local toDelete = ct()
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
    rt(toDelete)
    return value
end

------------------------------------------------------------------------------------------------------------------------
-- Console command
------------------------------------------------------------------------------------------------------------------------

local function splitargv(str,sep)
    local sep, fields = sep or ":", {}
    local pattern = ("([^%s]+)"):format(sep)
    str:gsub(pattern, function(c) fields[#fields+1] = c end)
    return fields
end

function TJ:ConsoleCommand(args)
    local argv = splitargv(args, '%s+')
    if argv[1] == "cfg" then
        Config:OpenDialog()
    elseif argv[1] == "move" then
        UI:ToggleMovement()
    elseif argv[1] == "resetpos" then
        UI:ResetPosition()
    elseif argv[1] == 'ticket' then
        Core:ExportDebuggingInformation()
    elseif argv[1] == 'blacklist' then
        local action = rawget(TJ.currentProfile.actions, argv[2])
        if not action then
            Core:Print('Error, action "|cFFFF6600%s|r" not found.', argv[2])
        else
            local classID, specID = select(3, UnitClass('player')), GetSpecialization()
            local current = Config:GetSpecBlacklist(argv[2]) and true or false
            local enableFlag = rawget(argv, 3)
            local newState
            if enableFlag then
                newState = (enableFlag and (enableFlag == 'y' or enableFlag == '1') and true or false)
            else
                newState = not current
            end
            Config:SetSpecBlacklist(newState and true or false, argv[2])
            Core:Print('Blacklist |cFFFF6600%s|r=|cFFFFCC00%s|r', argv[2], tostring(newState))
            self:QueueUpdate()
        end
    elseif argv[1] == '_rp' then
        self:QueueProfileReload()
    elseif argv[1] == '_rm' then
        Profiling:ResetMetrics()
    elseif argv[1] == "_dbg" then
        if Config:Get("do_debug") then
            Config:Set(false, "do_debug")
            Core:HideLoggingFrame()
            Core:Print('Debugging info disabled. Enable with "|cFFFF6600/tj _dbg|r".')
        else
            Config:Set(true, "do_debug")
            Core:ShowLoggingFrame()
            Core:Print('Debugging info enabled. Disable with "|cFFFF6600/tj _dbg|r".')
        end
    elseif argv[1] == '_dtc' then
        Core:Print('Dumping table cache metrics:')
        Core:Print(' - Total allocated: %d, total acquired: %d, total released: %d, total in-use: %d',
            TableCache.TableCache.TotalAllocated, TableCache.TableCache.TotalAcquired, TableCache.TableCache.TotalReleased, TableCache.TableCache.TotalAcquired - TableCache.TableCache.TotalReleased)
    elseif argv[1] == '_dbe' then
        Core:OpenDebugWindow('Thousand Jabs SavedVariables Export', LSD(ThousandJabsDB))
    elseif argv[1] == '_prof' then
        Core:Print(Profiling:GetProfilingString())
    elseif argv[1] == '_duc' then
        Core:Print('Dumping unit cache table:')
        if not IsAddOnLoaded('Blizzard_DebugTools') then LoadAddOn('Blizzard_DebugTools') end
        DevTools_Dump{unitCache=UnitCache.unitCache}
    elseif argv[1] == '_mem' then
        UpdateAddOnMemoryUsage()
        Core:Print('Memory usage: %d kB', GetAddOnMemoryUsage('ThousandJabs'))
    elseif argv[1] == '_esd' then
        self:ExportAbilitiesFromSpellBook()
    elseif argv[1] == '_est' then
        self:ExportSpecsTables()
    elseif argv[1] == '_dcp' then
        if TJ.currentProfile then
            TJ.needExportCurrentProfile = true
        end
    else
        Core:Print('Thousand Jabs chat commands:')
        Core:Print("     |cFFFF6600/tj cfg|r - Opens the configuration dialog.")
        Core:Print("     |cFFFF6600/tj move|r - Toggles frame moving.")
        Core:Print("     |cFFFF6600/tj resetpos|r - Resets frame positioning to default.")
        Core:Print("     |cFFFF6600/tj ticket|r - Shows a window that can be used to copy/paste debugging information for raising tickets.")
        Core:Print("     |cFFFF6600/tj blacklist <action>|r - Enables blacklisting of actions using slash commands / macros.")
        Core:Print('Thousand Jabs debugging:')
        Core:Print('     |cFFFF6600/tj _dbg|r - Toggles debug information visibility.')
    end
end

TJ:RegisterChatCommand('tj', 'ConsoleCommand')
