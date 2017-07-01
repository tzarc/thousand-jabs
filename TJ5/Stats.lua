local addonName = ...

LibStub('LibSandbox-5.0'):UseSandbox('TJ5')

------------------------------------------------------------------------------------------------------------------------
-- Statistics
------------------------------------------------------------------------------------------------------------------------

local function TimedUpdateUsageStats()
    local start = debugprofilestop()
    UpdateAddOnMemoryUsage()
    UpdateAddOnCPUUsage()
    local finish = debugprofilestop()
    return finish - start
end

function TJ:UpdateUsageStatistics()
    if not Broker.updateText then return end
    if not Broker.updateTime then
        if not InCombatLockdown() then
            Broker.updateTime = TimedUpdateUsageStats()
        end
    else
        Stats.lastCheck = Stats.lastCheck or 0
        local statUpdateSpeed = 5 -- in seconds
        if (InCombatLockdown() and Broker.updateTime < 30) or (Broker.updateTime < 100) then -- calc in-combat if <30ms, or out-of-combat if <100ms
            local now = GetTime()
            if Stats.lastCheck + statUpdateSpeed < now then
                Broker.updateTime = TimedUpdateUsageStats()
                Stats.lastCheckDelta = now - Stats.lastCheck
                Stats.lastMemAmount = Stats.currMemAmount
                Stats.currMemAmount = GetAddOnMemoryUsage(addonName)
                Stats.lastCpuAmount = Stats.currCpuAmount
                Stats.currCpuAmount = GetAddOnCPUUsage(addonName)
                Stats.lastCheck = now
            end
            self:Debug("Usage stats update time: %12.3f ms", Broker.updateTime)
            if Stats.lastCheckDelta then
                local dt = Stats.lastCheckDelta
                if Stats.lastMemAmount and Stats.lastMemAmount > 0 then
                    local curr = Stats.currMemAmount
                    local prev = Stats.lastMemAmount
                    local delta = curr - prev
                    self:Debug("           Memory usage: %12.3f kB", curr)
                    self:Debug("           Memory delta: %12.3f kB", delta)
                    self:Debug("           Memory delta: %12.3f kB/sec (over last %d secs)", delta/dt, statUpdateSpeed)
                    Broker.dataObj.text = self:Format("%s: Memory: %d bytes/sec", addonName, 1024*delta/dt)
                end
                if Stats.lastCpuAmount and Stats.lastCpuAmount > 0 then
                    local curr = Stats.currCpuAmount
                    local prev = Stats.lastCpuAmount
                    local delta = curr - prev
                    self:Debug("              CPU usage: %12.3f ms", curr)
                    self:Debug("              CPU delta: %12.3f ms", delta)
                    self:Debug("              CPU delta: %12.3f ms/sec (over last %d secs)", delta/dt, statUpdateSpeed)
                    self:Debug("              CPU usage: %10.1f%%", 100*(delta/dt)/1000.0)
                    Broker.dataObj.text = Broker.dataObj.text .. self:Format(", CPU: %.1f%% (%.3fms)", 100*(delta/dt)/1000.0, delta/dt)
                end
            end
        else
            Broker.dataObj.text = self:Format("%s: Statistics disabled, too much time used (%d ms)", addonName, Broker.updateTime)
        end
    end
end
