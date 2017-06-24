local addonName = ...

local MAJOR, MINOR = addonName, 1
local TJ = LibStub:NewLibrary(MAJOR, MINOR)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Locals
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local debugprofilestop = debugprofilestop
local debugstack = debugstack
local LoadAddOn = LoadAddOn
local pairs = pairs
local print = print
local select = select
local select = select
local tconcat = table.concat
local tinsert = table.insert
local tonumber = tonumber
local tostring = tostring
local tremove = table.remove
local tsort = table.sort
local type = type
local unpack = unpack
local wipe = wipe

local LibStub = LibStub
local LibSandbox = LibStub('LibSandbox-5.0')
local LSD = LibStub("LibSerpentDump")
local LSM = LibStub('LibSharedMedia-3.0', true)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Locals
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local TableCache = {}
local Config = {}
local UI = {}
local devMode = false
local disableDebugOutput = false
local slashCmd = '/tj5'

local otherErrors = {}
local globalReadNames = {}
local globalReads = {}
local globalWrites = {}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TJ sandboxing
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

LibSandbox:UseSandbox(LibSandbox:NewSandbox(addonName))
LibSandbox:AllowPassthrough(addonName, 'TJ5DB', 'UIParent', 'SLASH_TJ1', 'SlashCmdList')

-- Intentionally write to the sandbox before we attach observers - these should be available no matter what
_G['TJ'] = TJ
_G['TableCache'] = TableCache
_G['Config'] = Config
_G['UI'] = UI
_G['devMode'] = devMode
-- Table cache helpers
_G['CT'] = function() return TableCache:Acquire() end
_G['RT'] = function(tbl) TableCache:Release(tbl) end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Unknown field sandbox getter/setter observers
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
do
    local function trim(s) return s:match'^()%s*$' and '' or s:match'^%s*(.*%S)' end

    local function globalReadObserver(key)
        local stack = trim(debugstack(3))
        local file, line = stack:match('(.-):(.-):')
        local tableKey = ('%s:%s:%d'):format(key, file, line)

        -- Keep track of the stacks of every global read we haven't made a local copy for
        if not globalReads[tableKey] then
            globalReads[tableKey] = { stack = stack, line = tonumber(line), key = tostring(key), keyType = type(key) }
        end

        -- Keep track of just the names, so we can export them and copy/paste into the specific file
        globalReadNames[file] = globalReadNames[file] or {}
        globalReadNames[file][key] = true
    end

    local function globalWriteObserver(key, val)
        local stack = trim(debugstack(3))
        local file, line = stack:match('(.-):(.-):')
        local tableKey = ('%s:%s:%d'):format(key, file, line)

        -- Keep track of the stacks of every global write we haven't made a local copy for
        if not globalWrites[tableKey] then
            globalWrites[tableKey] = { stack = stack, line = tonumber(line), key = tostring(key), keyType = type(key), value = tostring(val), valueType = type(val) }
        end
    end

    LibSandbox:AttachObservers(addonName, globalReadObserver, globalWriteObserver)

    TJ.otherErrors, TJ.globalReadNames, TJ.globalReads, TJ.globalWrites = otherErrors, globalReadNames, globalReads, globalWrites
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function TJ:Format(f, ...)
    return ((select('#', ...) > 0) and f:format(...) or (type(f) == 'string' and f) or tostring(f) or '')
end

do
    local orderedPairsDispatch = function(state)
        state._idx = state._idx + 1
        local k = state[state._idx]
        if k == nil then
            state._tbl = nil
            return nil
        else
            return k, state._tbl[k]
        end
    end

    function TJ:OrderedPairs(tbl, f, tmpTbl)
        local state = tmpTbl and wipe(tmpTbl) or {}
        for n in pairs(tbl) do tinsert(state, n) end
        tsort(state, f)
        state._idx = 0
        state._tbl = tbl
        return orderedPairsDispatch, state
    end
end

function TJ:LoadFunctionString(funcStr, name)
    local loader, errStr = loadstring('return (' .. funcStr .. ')', name)
    if errStr then
        self:PrintOnce('Error loading function for %s:\n%s', name, errStr)
    else
        local success, retval = pcall(assert(loader))
        if success then
            return retval
        else
            self:PrintOnce('Error creating function for %s:\n%s', name, tostring(retval))
        end
    end
end

function TJ:MatchesBuild(tripletFrom, tripletTo)
    tripletTo = tripletTo or tripletFrom
    local f1,f2,f3 = tripletFrom:match("(%d+)%.(%d+)%.(%d+)")
    local f = tonumber(f1)*10000000000 + tonumber(f2)*100000000 + tonumber(f3)*1000000
    local t1,t2,t3 = tripletTo:match("(%d+)%.(%d+)%.(%d+)")
    local t = tonumber(t1)*10000000000 + tonumber(t2)*100000000 + tonumber(t3)*1000000
    local c1,c2,c3 = GetBuildInfo():match("(%d+)%.(%d+)%.(%d+)")
    local c = tonumber(c1)*10000000000 + tonumber(c2)*100000000 + tonumber(c3)*1000000
    return (f <= c and c <= t) and true or false
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Command handler
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
do
    local slashHandlers = {}
    local slashHelpText = {}
    local slashCmdArgs = {}
    SLASH_TJ1 = slashCmd
    function SlashCmdList.TJ(msg, editbox)
        local args = {}
        for w in msg:gmatch("%S+") do args[1+#args] = w end
        local first = args[1] or ''
        tremove(args, 1)
        local handler = slashHandlers[first]
        if handler then
            handler(unpack(args))
        end
    end

    function TJ:RegisterCommandHandler(command, helptxt, handler, args)
        if type(command) ~= 'string' then
            self:Error(self:Format('Command "%s" is not a string type', tostring(command)))
        end
        if type(helptxt) ~= 'string' then
            self:Error(self:Format('Help text for command "%s" is not a string type', tostring(command)))
        end
        if type(handler) ~= 'function' then
            self:Error(self:Format('Handler for command "%s" is not a function type', tostring(command)))
        end
        slashHelpText[command] = helptxt
        slashHandlers[command] = handler
        slashCmdArgs[command] = args or ''
    end

    function TJ:ShowHelp()
        self:Print('%s chat commands:', addonName)
        for cmd,help in pairs(slashHelpText) do
            if cmd ~= '' and cmd:sub(1,1) ~= '_' then
                self:Print("     |cFFFF6600%s %s %s|r - %s", slashCmd, cmd, slashCmdArgs[cmd], help)
            end
        end
        self:Print('%s debugging commands:', addonName)
        for cmd,help in pairs(slashHelpText) do
            if cmd:sub(1,1) == '_' then
                self:Print("     |cFFFF6600%s %s %s|r - %s", slashCmd, cmd, slashCmdArgs[cmd], help)
            end
        end
    end

    TJ:RegisterCommandHandler('', 'Shows command help.', function() TJ:ShowHelp() end)
    TJ:RegisterCommandHandler('help', 'Shows command help.', function() TJ:ShowHelp() end)
end

------------------------------------------------------------------------------------------------------------------------
-- Printing functions
------------------------------------------------------------------------------------------------------------------------

local printPrefix
function TJ:Print(...)
    printPrefix = printPrefix or self:Format('|cFF0099CC%s|r:', addonName)
    print(printPrefix, self:Format(...))
end

function TJ:PrintOnce(...)
    local text = self:Format(...)
    if not printedOnce[text] then
        printedOnce[text] = true
        self:Print(text)
    end
end

function TJ:DevPrint(...)
    if devMode then self:Print("%.3f: %s", debugprofilestop(), self:Format(...)) end
end

function TJ:DevPrintOnce(...)
    if devMode then
        local text = self:Format(...)
        if not printedOnce[text] then
            printedOnce[text] = true
            self:Print("%.3f: %s", debugprofilestop(), text)
        end
    end
end

------------------------------------------------------------------------------------------------------------------------
-- Error handling
------------------------------------------------------------------------------------------------------------------------

function TJ:Error(fulltxt)
    if not tContains(otherErrors, fulltxt) then
        otherErrors[1+#otherErrors] = fulltxt
        if not TJ.errorThrown then
            self:Print('|cFFFF0000Well, this is problematic. It seems %s has encountered an error.|r', addonName)
            self:Print('|cFFFF9900Please raise a ticket on the project page on curseforge, and paste the output from the command: |cFFFFFF00%s ticket|r', slashCmd)
        end
    end
    TJ.errorThrown = true
end

------------------------------------------------------------------------------------------------------------------------
-- Debugging
------------------------------------------------------------------------------------------------------------------------

function TJ:Debug(...)
    if disableDebugOutput then return end
    if Config:Get("do_debug") then
        if #debugLines == 0 then debugLines[1] = self:Format("|cFFFFFFFF%s Debug log|r (|cFF00FFFFhide with %s _dbg|r):", addonName, slashCmd) end
        local a = ...
        if type(a) == 'table' and select('#', ...) == 1 then
            debugLines[1+#debugLines] = self:Format('|cFFFFFF99%s|r', LSD(a))
        else
            debugLines[1+#debugLines] = self:Format(...)
        end
    end
end

function TJ:DebugReset()
    wipe(debugLines)
end

function TJ:DebugString()
    if disableDebugOutput then return '' end
    if Config:Get("do_debug") then
        return tconcat(debugLines, '\n')
    end
end

function TJ:OpenDebugWindow(title, data)
    LoadAddOn("ThousandJabs_Config") -- Ensure AceGUI has been loaded
    local GUI = LibStub("AceGUI-3.0")
    local f = GUI:Create("Frame")
    f:SetCallback("OnClose",function(widget) GUI:Release(widget) end)
    f:SetTitle(title)
    f:SetLayout("Fill")

    local edit = GUI:Create("MultiLineEditBox")
    edit:SetLabel("")
    edit:SetText(data)
    edit:DisableButton(true)
    f:AddChild(edit)
end

------------------------------------------------------------------------------------------------------------------------
-- Logging frame
------------------------------------------------------------------------------------------------------------------------

function TJ:ShowLoggingFrame()
    if not self.log_frame then
        self.log_frame = CreateFrame("Frame", self:Format("%sLog", addonName), UIParent)
        self.log_frame:ClearAllPoints()
        self.log_frame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 550, -20)
        self.log_frame:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -20, 20)
        self.log_frame.text = self.log_frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        self.log_frame.text:SetJustifyH("LEFT")
        self.log_frame.text:SetJustifyV("TOP")
        self.log_frame.text:SetPoint("TOPLEFT", 8, -8)
        self.log_frame.text:SetPoint("BOTTOMRIGHT", -8, 8)
        self.log_frame.text:SetTextColor(0.7, 0.7, 0.7, 1.0)
    end

    self.log_frame:Show()
    self.log_frame.text:Show()
    local f = (LSM and LSM:Fetch("font", "mplus-1m-bold")) or (LSM and LSM:Fetch("font", "Anonymous Pro Bold (U)"))
    if f then self.log_frame.text:SetFont(f, 7, "OUTLINE") end
end

function TJ:HideLoggingFrame()
    if self.log_frame then
        self.log_frame:Hide()
    end
end

function TJ:UpdateLog()
    if Config:Get("do_debug") and self.log_frame and self.log_frame:IsVisible() then
        self.log_frame.text:SetText(TJ:DebugString())
    end
end

TJ:RegisterCommandHandler('_dbg', 'Shows the debug log', function()
    if Config:Get("do_debug") then
        Config:Set(false, "do_debug")
        TJ:HideLoggingFrame()
        TJ:Print('Debugging info disabled. Enable with "|cFFFF6600%s _dbg|r".', slashCmd)
    else
        Config:Set(true, "do_debug")
        TJ:ShowLoggingFrame()
        TJ:Print('Debugging info enabled. Disable with "|cFFFF6600%s _dbg|r".', slashCmd)
    end
end)

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
    local Broker = TJ.Broker
    local Stats = TJ.Stats
    if not Broker or Broker.updateText then return end
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
