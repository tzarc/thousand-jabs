--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Alpha only.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(4, GetBuildInfo()) < 80000 then
    return
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Addon definition.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local _, TJM = ...
local LibStub = LibStub
local Stats = {}
_G['TJM'] = TJM

local LSM = LibStub('LibSharedMedia-3.0')

local DBG = function(...) TJM:AddDebugLog(...) end

-- Command
local SLASH_TJM1 = '/tjm'
_G['SLASH_TJM1'] = SLASH_TJM1

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Quick script reload
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SLASH_TJM_RLN1, SLASH_TJM_RLN2, SLASH_TJM_RLN3 = '/rl', '/rln', '//'
SLASH_TJM_RLC1, SLASH_TJM_RLC2 = '/rlc', '///'
function SlashCmdList.TJM_RLN(msg, editbox)
    SetCVar('scriptProfile', '0')
    ReloadUI()
end
function SlashCmdList.TJM_RLC(msg, editbox)
    SetCVar('scriptProfile', '1')
    ReloadUI()
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function TJM:Format(f, ...)
    return ((select('#', ...) > 0) and f:format(...) or (type(f) == 'string' and f) or tostring(f) or '')
end

local active = false
function SlashCmdList.TJM(msg, editbox)
    active = not active
end

local printPrefix = '|cFFFFFF00T|cFFFFEF00h|cFFFFDF00o|cFFFFCF00u|cFFFFBF00s|cFFFFAF00a|cFFFF9F00n|cFFFF8F00d|cFFFF7F00J|cFFFF6F00a|cFFFF5F00b|cFFFF4F00s|r'
local debugPrefix = function() return ('%.3f:'):format(debugprofilestop()) end
function TJM:Print(...)
    print(printPrefix, self:Format(...))
end

-- Time slice execution
local nextUpdate = 0
local timeSlice = C_Timer.NewTicker(0.1, function()
    local now = GetTime()
    if nextUpdate <= now then
        nextUpdate = now + 5
        TJM:ClearDebugLog()
        TJM:UpdateUsageStatistics()
        TJM:UpdateDebugLog()
    end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Debugging
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local logFont = LSM:Fetch('font', 'Iosevka Tzarc')
local logFrame = CreateFrame('Frame', 'ThousandJabsLog', UIParent)
logFrame:ClearAllPoints()
logFrame:SetPoint('TOPLEFT', UIParent, 'TOPLEFT', 10, -10)
logFrame:SetPoint('BOTTOMRIGHT', UIParent, 'BOTTOMRIGHT', -10, 10)

local logFrameText = logFrame:CreateFontString('ThousandJabsLogText', 'OVERLAY', 'GameFontHighlightSmall')
logFrameText:SetJustifyH('LEFT')
logFrameText:SetJustifyV('BOTTOM')
logFrameText:SetPoint('TOPLEFT', 8, -8)
logFrameText:SetPoint('BOTTOMRIGHT', -8, 8)
logFrameText:SetTextColor(0.7, 0.7, 0.7, 1.0)
logFrameText:SetFont(logFont, 9, 'OUTLINE')

logFrame:Show()

local logData = {}

function TJM:AddDebugLog(...)
    if #logData == 0 then logData[1] = printPrefix .. ' Monitor log|r:' end
    logData[1+#logData] = self:Format(...)
end

function TJM:ClearDebugLog()
    wipe(logData)
end

function TJM:UpdateDebugLog()
    logFrameText:SetText(table.concat(logData, '\n'))
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Statistics
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local function TimedUpdateUsageStats()
    local start = debugprofilestop()
    UpdateAddOnMemoryUsage()
    UpdateAddOnCPUUsage()
    local finish = debugprofilestop()
    return finish - start
end

function TJM:UpdateUsageStatistics()
    if not Stats.updateTime then
        if not InCombatLockdown() then
            Stats.updateTime = TimedUpdateUsageStats()
        end
    else
        Stats.lastCheck = Stats.lastCheck or 0
        local statUpdateSpeed = 5 -- in seconds
        if (InCombatLockdown() and Stats.updateTime < 40) or (Stats.updateTime < 125) then -- calc in-combat if <40ms, or out-of-combat if <125ms
            local now = GetTime()
            Stats.updateTime = TimedUpdateUsageStats()
            Stats.lastCheckDelta = now - Stats.lastCheck
            Stats.lastMemAmount = Stats.currMemAmount
            Stats.currMemAmount = GetAddOnMemoryUsage('ThousandJabs')
            Stats.lastCpuAmount = Stats.currCpuAmount
            Stats.currCpuAmount = GetAddOnCPUUsage('ThousandJabs')
            Stats.lastCheck = now

            DBG('Usage stats update time: %12.3f ms', Stats.updateTime)
            if Stats.lastCheckDelta then
                local dt = Stats.lastCheckDelta
                local outText = ''

                if Stats.lastMemAmount and Stats.lastMemAmount > 0 then
                    local curr = Stats.currMemAmount
                    local prev = Stats.lastMemAmount
                    local delta = curr - prev
                    DBG('           Memory usage: %12.3f kB', curr)
                    DBG('           Memory delta: %12.3f kB', delta)
                    DBG('           Memory delta: %12.3f kB/sec (over last %d secs)', delta/dt, statUpdateSpeed)
                end

                if Stats.lastCpuAmount and Stats.lastCpuAmount > 0 then
                    local curr = Stats.currCpuAmount
                    local prev = Stats.lastCpuAmount
                    local delta = curr - prev
                    DBG('              CPU usage: %12.3f ms', curr)
                    DBG('              CPU delta: %12.3f ms', delta)
                    DBG('              CPU delta: %12.3f ms/sec (over last %d secs)', delta/dt, statUpdateSpeed)
                    DBG('              CPU usage: %10.1f   %%', 100*(delta/dt)/1000.0)
                end
            else
                DBG('Thousand Jabs: Statistics disabled, too much time used (%d ms)', mceil(Stats.updateTime))
            end
        end
    end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Table dumper, using Blizzard's implementation
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
do
    function TJM:Dump(value, startKey)
        if not IsAddOnLoaded('Blizzard_DebugTools') then
            LoadAddOn('Blizzard_DebugTools')
        end

        local context = {
            depth = 0,
            key = startKey,
        };

        context.GetTableName = function() return nil end
        context.GetFunctionName = function() return nil end
        context.GetUserdataName = function() return nil end

        local f = {}
        context.Write = function(_, msg) tinsert(f, msg) end

        local oldDEVTOOLS_MAX_ENTRY_CUTOFF = DEVTOOLS_MAX_ENTRY_CUTOFF
        local oldDEVTOOLS_LONG_STRING_CUTOFF = DEVTOOLS_LONG_STRING_CUTOFF
        local oldDEVTOOLS_DEPTH_CUTOFF = DEVTOOLS_DEPTH_CUTOFF
        DEVTOOLS_MAX_ENTRY_CUTOFF = 9999999
        DEVTOOLS_LONG_STRING_CUTOFF = 9999999
        DEVTOOLS_DEPTH_CUTOFF = 9999999
        DevTools_RunDump(value, context);
        DEVTOOLS_MAX_ENTRY_CUTOFF = oldDEVTOOLS_MAX_ENTRY_CUTOFF
        DEVTOOLS_LONG_STRING_CUTOFF = oldDEVTOOLS_LONG_STRING_CUTOFF
        DEVTOOLS_DEPTH_CUTOFF = oldDEVTOOLS_DEPTH_CUTOFF
        return tconcat(f, '\n')
    end
end
