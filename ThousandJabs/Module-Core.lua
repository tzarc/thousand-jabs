local devMode = false

------------------------------------------------------------------------------------------------------------------------
-- Addon definition
------------------------------------------------------------------------------------------------------------------------

local TJ = LibStub('AceAddon-3.0'):NewAddon('ThousandJabs', 'AceConsole-3.0', 'AceEvent-3.0')

------------------------------------------------------------------------------------------------------------------------
-- Module definitions
------------------------------------------------------------------------------------------------------------------------

local Core = TJ:NewModule('Core')
local Config = TJ:NewModule('Config')
local Profiling = TJ:NewModule('Profiling')
local TableCache = TJ:NewModule('TableCache')
local UnitCache = TJ:NewModule('UnitCache', 'AceEvent-3.0')
local UI = TJ:NewModule('UI')

------------------------------------------------------------------------------------------------------------------------
-- Initialisation
------------------------------------------------------------------------------------------------------------------------

Core.devMode = devMode
Core.Stats = {}
Core.Environment = {}
if Core.devMode then _G['tj'] = TJ end

------------------------------------------------------------------------------------------------------------------------
-- Locals
------------------------------------------------------------------------------------------------------------------------

local LibStub = LibStub
local LSD = LibStub("LibSerpentDump")
local LSM = LibStub('LibSharedMedia-3.0')

local _G = _G
local assert = assert
local CreateFrame = CreateFrame
local debugprofilestop = debugprofilestop
local debugstack = debugstack
local GetAddOnCPUUsage = GetAddOnCPUUsage
local GetAddOnMemoryUsage = GetAddOnMemoryUsage
local GetAddOnMetadata = GetAddOnMetadata
local GetBuildInfo = GetBuildInfo
local GetInventoryItemLink = GetInventoryItemLink
local GetInventorySlotInfo = GetInventorySlotInfo
local GetLocale = GetLocale
local GetSpecialization = GetSpecialization
local GetSpecializationInfo = GetSpecializationInfo
local GetTalentInfoBySpecialization = GetTalentInfoBySpecialization
local GetTime = GetTime
local InCombatLockdown = InCombatLockdown
local LoadAddOn = LoadAddOn
local loadstring = loadstring
local pairs = pairs
local pcall = pcall
local print = print
local select = select
local setmetatable = setmetatable
local strgmatch = string.gmatch
local strmatch = string.match
local strsub = string.sub
local tconcat = table.concat
local tContains = tContains
local tinsert = table.insert
local tonumber = tonumber
local tostring = tostring
local tsort = table.sort
local type = type
local UnitClass = UnitClass
local UnitEffectiveLevel = UnitEffectiveLevel
local UnitLevel = UnitLevel
local UpdateAddOnCPUUsage = UpdateAddOnCPUUsage
local UpdateAddOnMemoryUsage = UpdateAddOnMemoryUsage
local wipe = wipe

local debugLines = {}
local otherErrors = {}
local globalReads = {}
local globalWrites = {}
local globalExcludes = { 'UIParent', 'ThousandJabsDB' }
local localCopies = {}
local printedOnce = {}
local tableNames = {}

------------------------------------------------------------------------------------------------------------------------
-- Global read/write logging
------------------------------------------------------------------------------------------------------------------------

local function split(str, delim)
    local result, pattern, lastPos = {}, "(.-)" .. delim .. "()", 1
    for part, pos in strgmatch(str, pattern) do
        tinsert(result, part)
        lastPos = pos
    end
    tinsert(result, strsub(str, lastPos))
    return result
end
local function where(tbl, pattern)
    local result = {}
    for k,v in pairs(tbl) do
        if strmatch(v, pattern) then
            tinsert(result, v)
        end
    end
    return result
end

local real_G = _G
local fake_G = setmetatable({}, {
    __index = function(tbl,key)
        local val = real_G[key]
        if tContains(globalExcludes, key) then return val end
        if not Core.devMode and val ~= nil then return val end
        globalReads[key] = globalReads[key] or {}
        local entry = globalReads[key]
        entry.stacks = entry.stacks or {}
        local firstLine = strgmatch(debugstack(2), '(.-)\n()')()
        local filename = strmatch(firstLine, '(.-):')
        local thisstack = ('Global read of "%s": %s'):format(tostring(key), firstLine);
        local found = false
        for k,v in pairs(entry.stacks) do
            if v == thisstack then
                found = true
                break
            end
        end
        if not found then
            entry.stacks[1+#entry.stacks] = thisstack
            tsort(entry.stacks)
            Core:Error(thisstack)
            localCopies[filename] = localCopies[filename] or {}
            localCopies[filename][key] = true
        end
        if Core.devMode and val ~= nil then return val end
        return nil
    end,
    __newindex = function(tbl,key,val)
        real_G[key] = val
        if tContains(globalExcludes, key) then return val end
        globalWrites[key] = globalWrites[key] or {}
        local entry = globalWrites[key]
        entry.stacks = entry.stacks or {}
        local firstLine = strgmatch(debugstack(2), '(.-)\n()')()
        local thisstack = ('Global write of "%s": %s'):format(tostring(key), firstLine);
        local found = false
        for k,v in pairs(entry.stacks) do
            if v == thisstack then
                found = true
                break
            end
        end
        if not found then
            entry.stacks[1+#entry.stacks] = thisstack
            tsort(entry.stacks)
            Core:Error(thisstack)
        end
        return val
    end,
})

TJ.fake_G = fake_G

function Core:Safety()
    local prev_G = getfenv(2)
    if prev_G == real_G then
        setfenv(2, fake_G)
    end
end

Core:Safety()

------------------------------------------------------------------------------------------------------------------------
-- Printing functions
------------------------------------------------------------------------------------------------------------------------

function Core:Print(...)
    TJ:Print(Core:Format(...))
end

function Core:PrintOnce(...)
    local text = Core:Format(...)
    if not printedOnce[text] then
        printedOnce[text] = true
        Core:Print(text)
    end
end

function Core:DevPrint(...)
    if Core.devMode then Core:Print("%.3f: %s", debugprofilestop(), Core:Format(...)) end
end

------------------------------------------------------------------------------------------------------------------------
-- Error handling
------------------------------------------------------------------------------------------------------------------------

function Core:Error(fulltxt)
    if not tContains(otherErrors, fulltxt) then
        otherErrors[1+#otherErrors] = fulltxt
        if not Core.errorThrown then
            print('|cFFFF0000Well, this is problematic. It seems Thousand Jabs has encountered an error:|r')
            print('|cFFFF9900Please raise a ticket on the project page on curseforge, and paste the output from the command: |cFFFFFF00/tj ticket|r')
        end
    end
    Core.errorThrown = true
end

------------------------------------------------------------------------------------------------------------------------
-- Merge multiple tables together
------------------------------------------------------------------------------------------------------------------------

function Core:MergeTables(...)
    local target = {}
    for i=1,select('#', ...) do
        local t = select(i, ...)
        if t then
            for k,v in pairs(t) do
                if type(target[k]) == 'table' and type(v) == 'table' then
                    target[k] = Core:MergeTables(target[k], v)
                elseif not target[k] then
                    target[k] = v
                end
            end
        end
    end
    return target
end

------------------------------------------------------------------------------------------------------------------------
-- Helpers
------------------------------------------------------------------------------------------------------------------------

function Core:Format(f, ...)
    return ((select('#', ...) > 0) and f:format(...) or (type(f) == 'string' and f) or tostring(f) or '')
end

function Core:OrderedPairs(t, f)
    local a = TableCache:Acquire()
    for n in pairs(t) do tinsert(a, n) end
    tsort(a, f)
    local i = 0
    local iter = function ()
        i = i + 1
        local k = a[i]
        if k == nil then
            TableCache:Release(a)
            return nil
        else
            return k, t[k]
        end
    end
    return iter
end

function Core:IntersectionCount(tbl1, tbl2)
    local a = (#tbl1 < #tbl2) and tbl1 or tbl2 -- Make 'a' the smallest of the two arrays
    local b = (#tbl1 < #tbl2) and tbl2 or tbl1
    local cnt = 0
    local i = TableCache:Acquire()
    for n=1,#a do
        i[a[n]] = true
    end
    for n=1,#b do
        if i[b[n]] then cnt = cnt + 1 end
    end
    TableCache:Release(i)
    return cnt
end

local function scope_exit(self, f)
    local e = TableCache:Acquire()
    e.type = "exit"
    e.func = f
    self[1+#self] = e
end

local function scope_success(self, f)
    local e = TableCache:Acquire()
    e.type = "success"
    e.func = f
    self[1+#self] = e
end

local function scope_fail(self, f)
    local e = TableCache:Acquire()
    e.type = "fail"
    e.func = f
    self[1+#self] = e
end

local function scope_finalise(scope, success, ...)
    for i = #scope,1,-1 do
        if (scope[i].type == "exit") or (scope[i].type == "success" and success) or (scope[i].type == "fail" and not success) then
            pcall(scope[i].func)
        end
    end
    TableCache:Release(scope)
    if not success then error(...) end
    return ...
end

function Core:Scope(f, ...)
    local scope = TableCache:Acquire()
    scope.exit = scope_exit
    scope.success = scope_success
    scope.fail = scope_fail
    return scope_finalise(scope, pcall(f, scope, ...))
end

function Core:LoadFunctionString(funcStr, name)
    local loader, errStr = loadstring('return (' .. funcStr .. ')', name)
    if errStr then
        Core:PrintOnce('Error loading function for %s:\n%s', name, errStr)
    else
        local success, retval = pcall(assert(loader))
        if success then
            return retval
        else
            Core:PrintOnce('Error creating function for %s:\n%s', name, tostring(retval))
        end
    end
end

function Core:MatchesBuild(tripletFrom, tripletTo)
    tripletTo = tripletTo or tripletFrom
    local f1,f2,f3 = tripletFrom:match("(%d+)%.(%d+)%.(%d+)")
    local f = tonumber(f1)*10000000000 + tonumber(f2)*100000000 + tonumber(f3)*1000000
    local t1,t2,t3 = tripletTo:match("(%d+)%.(%d+)%.(%d+)")
    local t = tonumber(t1)*10000000000 + tonumber(t2)*100000000 + tonumber(t3)*1000000
    local c1,c2,c3 = GetBuildInfo():match("(%d+)%.(%d+)%.(%d+)")
    local c = tonumber(c1)*10000000000 + tonumber(c2)*100000000 + tonumber(c3)*1000000
    return (f <= c and c <= t) and true or false
end

------------------------------------------------------------------------------------------------------------------------
-- Logged table, prints when accessing fields which don't exist
------------------------------------------------------------------------------------------------------------------------

local function targetFieldName(tableName, key)
    return type(key) == 'number' and ('%s[%d]'):format(tableName, tostring(key)) or ('%s.%s'):format(tableName, tostring(key))
end

local missingFieldMetatable = {
    __index = function(tbl, key)
        local tableName = (type(tableNames[tbl]) == 'string' and tableNames[tbl] or "UNKNOWN_TABLE")
        local header
        local stack = debugstack()
        if type(key) == 'nil' then
            header = Core:Format('Attempted to index table "%s" with nil key.', tableName)
        elseif type(key) == 'table' then
            header = Core:Format('Attempted to index table "%s" with key of type table.', tableName)
        else
            header = Core:Format('Missing field: "%s"', targetFieldName(tableName, key))
        end
        if header then
            local errtxt = Core:Format('%s\n%s', header, stack)
            Core:Error(errtxt)
        end
    end
}

function Core:MissingFieldTable(tableName, tbl)
    tableNames[tbl] = tableName
    setmetatable(tbl, { __index = missingFieldMetatable.__index, __name = tableName })
    for k,v in pairs(tbl) do
        if type(v) == 'table' then
            tbl[k] = Core:MissingFieldTable(targetFieldName(tableName, k), v)
        end
    end
    return tbl
end

------------------------------------------------------------------------------------------------------------------------
-- Debugging
------------------------------------------------------------------------------------------------------------------------

function Core:Debug(...)
    if Config:Get("do_debug") then
        if #debugLines == 0 then debugLines[1] = Core:Format("|cFFFFFFFFThousandJabs Debug log|r (|cFF00FFFFhide with /tj _dbg|r):") end
        local a = ...
        if type(a) == 'table' and select('#', ...) == 1 then
            debugLines[1+#debugLines] = Core:Format('|cFFFFFF99%s|r', LSD(a))
        else
            debugLines[1+#debugLines] = Core:Format(...)
        end
    end
end

function Core:DebugReset()
    wipe(debugLines)
end

function Core:DebugString()
    return tconcat(debugLines, '\n')
end

function Core:OpenDebugWindow(title, data)
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

function Core:ShowLoggingFrame()
    if not self.log_frame then
        self.log_frame = CreateFrame("Frame", "ThousandJabsLog", UIParent)
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
    local f = LSM:Fetch("font", "mplus-1m-bold") or LSM:Fetch("font", "Anonymous Pro Bold (U)")
    if f then self.log_frame.text:SetFont(f, 7, "OUTLINE") end
end

function Core:HideLoggingFrame()
    if self.log_frame then
        self.log_frame:Hide()
    end
end

function Core:UpdateLog()
    if Config:Get("do_debug") and self.log_frame then
        if Profiling:ProfilingEnabled() then
            self.log_frame.text:SetText(Profiling:GetProfilingString() .. '\n\n' .. Core:DebugString())
        else
            self.log_frame.text:SetText(Core:DebugString())
        end
    end
end

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

function Core:UpdateUsageStatistics()
    local Broker = Core.Broker
    local Stats = Core.Stats
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
                Stats.currMemAmount = GetAddOnMemoryUsage('ThousandJabs')
                Stats.lastCpuAmount = Stats.currCpuAmount
                Stats.currCpuAmount = GetAddOnCPUUsage('ThousandJabs')
                Stats.lastCheck = now
            end
            Core:Debug("Usage stats update time: %12.3f ms", Broker.updateTime)
            if Stats.lastCheckDelta then
                local dt = Stats.lastCheckDelta
                if Stats.lastMemAmount and Stats.lastMemAmount > 0 then
                    local curr = Stats.currMemAmount
                    local prev = Stats.lastMemAmount
                    local delta = curr - prev
                    Core:Debug("           Memory usage: %12.3f kB", curr)
                    Core:Debug("           Memory delta: %12.3f kB", delta)
                    Core:Debug("           Memory delta: %12.3f kB/sec (over last %d secs)", delta/dt, statUpdateSpeed)
                    Broker.dataObj.text = Core:Format("Thousand Jabs: Memory: %dkB/sec", delta/dt)
                end
                if Stats.lastCpuAmount and Stats.lastCpuAmount > 0 then
                    local curr = Stats.currCpuAmount
                    local prev = Stats.lastCpuAmount
                    local delta = curr - prev
                    Core:Debug("              CPU usage: %12.3f ms", curr)
                    Core:Debug("              CPU delta: %12.3f ms", delta)
                    Core:Debug("              CPU delta: %12.3f ms/sec (over last %d secs)", delta/dt, statUpdateSpeed)
                    Core:Debug("              CPU usage: %10.1f%%", 100*(delta/dt)/1000.0)
                    Broker.dataObj.text = Broker.dataObj.text .. Core:Format(", CPU: %.1f%% (%.3fms)", 100*(delta/dt)/1000.0, delta/dt)
                end
            end
        else
            Broker.dataObj.text = Core:Format("Thousand Jabs: Statistics disabled, too much time used (%d ms)", Broker.updateTime)
        end
    end
end

------------------------------------------------------------------------------------------------------------------------
-- Ticket information
------------------------------------------------------------------------------------------------------------------------

local function tierSelections()
    local specID = GetSpecialization()
    local talents = {}
    for k=1,7 do
        talents[k] = select(10, GetTalentInfoBySpecialization(specID, k, 1)) and 1
            or select(10, GetTalentInfoBySpecialization(specID, k, 2)) and 2
            or select(10, GetTalentInfoBySpecialization(specID, k, 3)) and 3
            or 999
    end
    return tconcat(talents, ', ')
end

local inventorySlots = { "AmmoSlot", "BackSlot", "ChestSlot", "FeetSlot", "Finger0Slot", "Finger1Slot", "HandsSlot", "HeadSlot", "LegsSlot", "MainHandSlot", "NeckSlot", "RangedSlot", "SecondaryHandSlot", "ShirtSlot", "ShoulderSlot", "TabardSlot", "Trinket0Slot", "Trinket1Slot", "WaistSlot", "WristSlot" }
local function equippedItems()
    local slotlinks = {}
    for _,slot in pairs(inventorySlots) do
        local ok, inventoryID = pcall(GetInventorySlotInfo, slot)
        if ok and inventoryID then slotlinks[slot] = (GetInventoryItemLink("player", inventoryID) or ''):gsub('|','||') end
    end
    return slotlinks
end

local function bindings()
    local binds = {}
    for i=1,120 do
        local _, spellID
        local actionType, actionID = GetActionInfo(i)
        if actionType == "macro" then
            _, _, spellID = GetMacroSpell(actionID)
        elseif actionType == "spell" then
            spellID = actionID
        end
        binds[tostring(i)] = spellID and { spellID, spellID and GetSpellInfo(spellID) or '' } or nil
    end
    return binds
end

local function copiesExport()
    if not Core.devMode then return nil end
    local s = ''
    for filename,list in Core:OrderedPairs(localCopies) do
        s = s .. Core:Format('\n-- %s\n', filename)
        for k,v in Core:OrderedPairs(list) do
            s = s .. Core:Format("local %s = %s\n", k, k)
        end
    end
    return s..'\n'
end

function Core:GenerateDebuggingInformation()
    local totalAllocated, totalAcquired, totalReleased = TableCache:GetMetrics()
    local export = {
        ['!tj_version'] = GetAddOnMetadata('ThousandJabs', "Version"),
        ['!wow_build'] = tconcat({ GetBuildInfo() }, ' | '),
        ['!wow_locale'] = GetLocale(),
        base = {
            playerLevel = UnitLevel('player'),
            playerEffectiveLevel = UnitEffectiveLevel('player'),
            classInfo = tconcat({ UnitClass('player') }, ' | '),
            specInfo = tconcat({ GetSpecializationInfo(GetSpecialization()) }, ' | '),
            talentInfo = tierSelections(),
        },
        --bindings = bindings(),
        frame = {
            position = { UI:GetPoint() },
            scale = UI:GetScale(),
        },
        errors = {
            global = {
                reads = globalReads,
                writes = globalWrites,
            },
            other = otherErrors,
        },
        equippedItems = equippedItems(),
        internals = {
            devMode = devMode,
            savedVariables = ThousandJabsDB,
            tableCache = {
                allocated = totalAllocated,
                acquired = totalAcquired,
                released = totalReleased,
                used = totalAcquired - totalReleased
            },
            --            patterns = {
            --                power = Core.PowerPatterns,
            --                cooldown = Core.CooldownPatterns,
            --                recharge = Core.RechargePatterns,
            --            },
            localCopies = copiesExport(),
        },
    }
    if type(export.frame.position[2]) == 'table' and export.frame.position[2].GetName then
        export.frame.position[2] = export.frame.position[2]:GetName()
    end
    return export
end

function Core:ExportDebuggingInformation()
    if InCombatLockdown() then
        Core:Print("In combat, cannot open debug information window.")
    else
        local export = Core:GenerateDebuggingInformation()
        Core:OpenDebugWindow('ThousandJabs Diagnostic Information', Core:Format("ThousandJabs Diagnostic Information:\n%s", LSD(export)))
    end
end
