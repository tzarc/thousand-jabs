--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Alpha only.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(4, GetBuildInfo()) < 80000 then
    return
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Module init.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local addonName, TJ, _ = ...
local LibStub, CT, RT, Config, UI, UnitCache = LibStub, CT, RT, TJ.Config, TJ.UI, TJ.UnitCache
local DBG = function(...) TJ:AddDebugLog(...) end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Locals
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local co_create = coroutine.create
local co_resume = coroutine.resume
local co_status = coroutine.status
local co_yield = coroutine.yield
local co_yield = coroutine.yield
local GetTime = GetTime
local mmin = math.min
local pairs = pairs
local pcall = pcall

local PRF = LibStub('LibTJProfiling-8.0')

local nextUpdateTime = 0

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sandbox
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
LibStub('LibTJSandbox-8.0'):Use(addonName)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Config values
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local slowUpdateSpeed = 0.75
local fastUpdateSpeed = 0.2

TJ.RegisterCallback('ExecutorConfigUpdate', 'CONFIG_CHANGED', function()
    TJ:DevPrint('CONFIG_CHANGED(ExecutorConfigUpdate)')
    slowUpdateSpeed = Config:Get('slowUpdateSpeed')
    fastUpdateSpeed = Config:Get('fastUpdateSpeed')
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Main loop
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function TJ:QueueUpdate()
    local now = GetTime()
    nextUpdateTime = mmin(now + fastUpdateSpeed, nextUpdateTime)
end

function TJ:QueueProfileReload(forceNow)
    if forceNow then nextUpdateTime = 0 end
end

function TJ:PerformUpdate()
end
PRF:ProfileFunction(TJ, 'PerformUpdate')

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Deferred/async execution
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
do
    -- Deferred execution
    local lastUpdate = 0
    local deferredExecution = {}
    local function runDeferredExecution()
        local now = GetTime()
        for execTime, funcs in pairs(deferredExecution) do
            if execTime <= now then
                deferredExecution[execTime] = nil
                for _,func in pairs(funcs) do pcall(func) end
                RT(funcs)
            else
                break
            end
        end
    end

    -- Background coroutines
    local backgroundTasks = {}
    local function runFuncCoroutines()
        for th in pairs(backgroundTasks) do
            if co_status(th) == 'dead' then
                backgroundTasks[th] = nil
            else
                local ok, errstr = co_resume(th, co_yield)
                if not ok then
                    TJ:Error(errstr)
                    backgroundTasks[th] = nil
                end
            end
        end
    end

    -- Defer a piece of code until a specific time (or shortly thereafter)
    local quickestDeferredDelta = 0.05
    function TJ:DeferExecution(execTime, func)
        local now = GetTime()
        if execTime < now then execTime = now + execTime end -- if it's less than now, treat it as a time interval rather than a full timestamp
        if execTime < now + quickestDeferredDelta then execTime = now + quickestDeferredDelta end -- if it's going to come within the current time slice, defer until the next one
        deferredExecution[execTime] = deferredExecution[execTime] or CT()
        local r = deferredExecution[execTime]
        r[1+#r] = func
    end

    -- Execute a task in the background:
    function TJ:ExecuteFuncAsCoroutine(funcToExec) -- usage: function myFunc(yield) <dostuff> yield() <dostuff> end
        local th = co_create(funcToExec)
        backgroundTasks[th] = true
    end

    TJ.RegisterCallback('MainLoop', 'TIME_SLICE', function(eventName, debugEnabled)
        local now = GetTime()
        if nextUpdateTime <= now then
            nextUpdateTime = now + slowUpdateSpeed

            runDeferredExecution()
            runFuncCoroutines()

            TJ:ClearDebugLog()
            if debugEnabled then
                DBG('')
                DBG(PRF:GetProfilingString())
                DBG('')
            end

            TJ:PerformUpdate()
            TJ:UpdateDebugLog()
        end
    end)
end

function TJ:COMBAT_LOG_EVENT_UNFILTERED(...)
    self:QueueUpdate()
end
PRF:ProfileFunction(TJ, 'COMBAT_LOG_EVENT_UNFILTERED')
TJ:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')

local fast = false
TJ:ExecuteFuncAsCoroutine(function(yield)
    local str = 'abcdefghijklmnopqrstuvwxyz'
    local lastTime = GetTime()
    for i=1,str:len() do
        local now = GetTime()
        TJ:DevPrint('%s -- delta: %.3f', str:sub(i,i), now-lastTime)
        lastTime = now
        if fast then TJ:QueueUpdate() end
        yield()
    end
end)
