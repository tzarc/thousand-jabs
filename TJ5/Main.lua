local addonName = ...

local co_create = coroutine.create
local co_resume = coroutine.resume
local co_status = coroutine.status
local GetSpecialization = GetSpecialization
local GetTime = GetTime
local NewTicker = C_Timer.NewTicker
local pairs = pairs
local select = select
local UnitClass = UnitClass

local LSD = LibStub("LibSerpentDump-5.0")

LibStub('LibSandbox-5.0'):UseSandbox(addonName)

function TJ:OnLogin()
    self:Notify('OnLogin')
    self:RegisterCallback('ProfileActivated')
    self:RegisterCallback('ProfileDeactivated')
    Engine:ActivateProfile()
end

function TJ:ProfileActivated(_, classID, specID)
    self:QueueProfileReload()
end

function TJ:ProfileDeactivated(_, classID, specID)
    self:QueueProfileReload()
end

------------------------------------------------------------------------------------------------------------------------
-- Timers
------------------------------------------------------------------------------------------------------------------------

-- Timer update
local screenUpdateTimer = nil
local queuedScreenUpdateTime = 0.2
local watchdogScreenUpdateTime = 0.75
local nextScreenUpdateExpiry = GetTime()
local watchdogScreenUpdateExpiry = GetTime()

function TJ:QueueUpdate()
    local now = GetTime()

    if not screenUpdateTimer then
        watchdogScreenUpdateExpiry = now + watchdogScreenUpdateTime
        screenUpdateTimer = NewTicker(0.05, function() self:PerformUpdateTimerCheck() end)
    end

    nextScreenUpdateExpiry = nextScreenUpdateExpiry or now + queuedScreenUpdateTime
end

function TJ:QueueProfileReload(forceNow)
    self.needsProfileReload = true
    if forceNow then
        lastProfileReload = 0
        nextScreenUpdateExpiry = 0
        queuedScreenUpdateTime = Config:Get("fastUpdateSpeed")
        watchdogScreenUpdateTime = Config:Get("slowUpdateSpeed")
    end
    self:QueueUpdate()
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
    self:PerformUpdate()
end

function TJ:PerformUpdate()
    local now = GetTime()
    -- Reset the debugging display
    self:DebugReset()
    -- Update the usage statistics
    self:UpdateUsageStatistics()

    -- Do stuff here!

    -- Update the the log
    self:UpdateLog()
    -- Run any queued commands
    self:RunFuncCoroutines()
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
                    TJ:Error(errstr)
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
