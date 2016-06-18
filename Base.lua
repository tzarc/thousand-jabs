local _, private = ...;
local TJ = LibStub('AceAddon-3.0'):NewAddon('ThousandJabs', 'AceConsole-3.0', 'AceEvent-3.0', 'AceTimer-3.0')
private.TJ = TJ

local error = error
local type = type
local pairs = pairs
local setmetatable = setmetatable
local format = string.format
local tconcat = table.concat

------------------------------------------------------------------------------------------------------------------------
-- Local definitions
------------------------------------------------------------------------------------------------------------------------
local tableNames = {} -- table name mapping, for the logged tables
local printedOnce = {}

------------------------------------------------------------------------------------------------------------------------
-- Private variables
------------------------------------------------------------------------------------------------------------------------
private.dbglist = {}

------------------------------------------------------------------------------------------------------------------------
-- Printing and debug functions
------------------------------------------------------------------------------------------------------------------------
local formatHelper = function(fmt,...) return ((select('#',...)>0) and fmt:format(...) or fmt or '') end

function private:Print(...)
    TJ:Print(formatHelper(...))
end

function private:PrintOnce(...)
    local text = formatHelper(...)
    if not printedOnce[text] then
        printedOnce[text] = true
        private:Print(text)
    end
end

function private:SetDebug(s)
    private.db.do_debug = (s and true or false)
end

function private:Debug(...)
    if private.db.do_debug then private:Print(formatHelper(...)) end
end

function private.DBG(...)
    if private.db.do_debug then
        private.dbglist[1+#private.dbglist] = formatHelper(...)
    end
end

function TJ:ALLDBG()
    return tconcat(private.dbglist, '\n')
end

------------------------------------------------------------------------------------------------------------------------
-- Merge multiple tables together
------------------------------------------------------------------------------------------------------------------------
function private:MergeTables(...)
    local t = {...}
    local target = {}
    for i=1,#t do
        local idx = #t-i+1
        if t[idx] then
            for k,v in pairs(t[idx]) do
                if not target[k] then target[k] = v end
            end
        end
    end
    return target
end

------------------------------------------------------------------------------------------------------------------------
-- Table cache
------------------------------------------------------------------------------------------------------------------------
local tcacheTotalAllocated = 0
local tcacheTotalAcquired = 0
local tcacheTotalReleased = 0
local tcacheFreeTables = {}
local tcacheInUseTables = {}
local tcacheTablesToRelease = {}
local tcache = {}
function tcache:acquire()
    local k,v
    for k,v in pairs(tcacheFreeTables) do
        tcacheFreeTables[v] = nil
        tcacheInUseTables[v] = v
        tcacheTotalAcquired = tcacheTotalAcquired + 1
        return v
    end
    v = {}
    tcacheInUseTables[v] = v
    tcacheTotalAcquired = tcacheTotalAcquired + 1
    tcacheTotalAllocated = tcacheTotalAllocated + 1
    return v
end
function tcache:release(tbl)
    local k,v
    if type(tbl) ~= 'table' then return end
    if tcacheFreeTables[tbl] then return end
    local function recursiveFindChildTables(t)
        for k,v in pairs(t) do
            if not tcacheTablesToRelease[k] and type(k) == 'table' then
                tcacheTablesToRelease[k] = k
                recursiveFindChildTables(k)
            end
            if not tcacheTablesToRelease[v] and type(v) == 'table' then
                tcacheTablesToRelease[v] = v
                recursiveFindChildTables(v)
            end
        end
    end
    tcacheTablesToRelease[tbl] = tbl
    recursiveFindChildTables(tbl)
    for k,v in pairs(tcacheTablesToRelease) do
        if tcacheInUseTables[v] then tcacheInUseTables[v] = nil end
        wipe(v)
        setmetatable(v,nil)
        tcacheFreeTables[v] = v
        tcacheTotalReleased = tcacheTotalReleased + 1
    end
    wipe(tcacheTablesToRelease)
end
private.tcache = tcache

------------------------------------------------------------------------------------------------------------------------
-- Miscellaneous functions
------------------------------------------------------------------------------------------------------------------------
function orderedpairs(t, f)
    local a = tcache:acquire()
    for n in pairs(t) do table.insert(a, n) end
    table.sort(a, f)
    local i = 0                -- iterator variable
    local iter = function ()   -- iterator function
        i = i + 1
        local k = a[i]
        if k == nil then
            tcache:release(a)
            return nil
        else
            return k, t[k]
        end
    end
    return iter
end

------------------------------------------------------------------------------------------------------------------------
-- Profiling functions
------------------------------------------------------------------------------------------------------------------------
private.profiling = {
    stack = {},
    data = {}
}
local profilingStack = private.profiling.stack
local profilingData = private.profiling.data

function private:Prolog(...)
    if (not private.db.do_debug) then return end
    local e = tcache:acquire()
    e.func = formatHelper(...)
    e.start = debugprofilestop()
    profilingStack[1+#profilingStack] = e
end

function private:Epilog()
    if (not private.db.do_debug) or (#profilingStack == 0) then return end
    local now = debugprofilestop()
    local e = profilingStack[#profilingStack]
    profilingStack[#profilingStack] = nil
    profilingData[e.func] = profilingData[e.func] or { count = 0, timeSpent = 0 }
    local d = profilingData[e.func]
    d.count = d.count + 1
    d.timeSpent = d.timeSpent + (now - e.start)
    tcache:release(e)
end

function private:GetProfiling()
    local l = tcache:acquire()
    l[1+#l] = '\nProfiling data:'
    for k,v in orderedpairs(profilingData) do
        if type(v) == 'table' then
            l[1+#l] = format('%dx %.3fms/ea, %.3fms/tot: %s', v.count, v.timeSpent/v.count, v.timeSpent, k)
        end
    end
    local s = tconcat(l, '\n')
    tcache:release(l)
    return s
end

function TJ:ConsoleCommand(args)
    if args == "move" then
        if private.movable then
            private.movable = false
            self:Print('Frame movement disabled.')
        else
            private.movable = true
            self:Print('Frame movement enabled.')
        end
        private.actionsFrame:SetMovable(private.movable)
        private.actionsFrame:EnableMouse(private.movable)
    elseif args == "resetpos" then
        self:Print('Resetting position.')
        private.actionsFrame:ClearAllPoints()
        private.actionsFrame:SetPoint('CENTER', UIParent, 'CENTER', 0, -180)
        private.actionsFrame:SetMovable(private.movable)
        private.actionsFrame:EnableMouse(private.movable)
        private.db.x, private.db.y = private.actionsFrame:GetLeft(), private.actionsFrame:GetBottom()
    elseif args == "_dbg" then
        if private.db.do_debug then
            private.db.do_debug = false
            self:Print('Debugging info disabled. Enable with "|cFFFF6600/tj _dbg|r".')
        else
            private.db.do_debug = true
            self:Print('Debugging info enabled. Disable with "|cFFFF6600/tj _dbg|r".')
        end
    elseif args == "_prof" then
        if private.db.do_debug then
            self:Print('Dumping profiling information.')
            self:Print(private:GetProfiling())
        else
            self:Print('Profiling disabled. Enable with "|cFFFF6600/tj _dbg|r".')
        end
    elseif args == "_dtc" then
        if not IsAddOnLoaded("Blizzard_DebugTools") then LoadAddOn("Blizzard_DebugTools") end
        -- Print("Dumping tables acquired from cache:")
        -- for k,v in pairs(tcacheInUseTables) do DevTools_Dump({tbl=v}) end
        self:Print("Dumping table cache metrics:")
        private:Print(" - Total allocated: %d, total acquired: %d, total released: %d, total in-use: %d", tcacheTotalAllocated, tcacheTotalAcquired, tcacheTotalReleased, tcacheTotalAcquired-tcacheTotalReleased)
    elseif args == "_duc" then
        self:Print("Dumping unit cache table:")
        if not IsAddOnLoaded("Blizzard_DebugTools") then LoadAddOn("Blizzard_DebugTools") end
        DevTools_Dump({unitCache=unitCache})
    elseif args == "_db" then
        self:Print("Dumping SavedVariables table:")
        if not IsAddOnLoaded("Blizzard_DebugTools") then LoadAddOn("Blizzard_DebugTools") end
        DevTools_Dump({db=private.db})
    elseif args == "_mem" then
        UpdateAddOnMemoryUsage()
        private:Print("Memory usage: %dkB", GetAddOnMemoryUsage("ThousandJabs"))
    else
      self:Print("ThousandJabs chat commands:")
      self:Print("     |cFFFF6600/tj move|r - Toggles frame moving.")
      self:Print("     |cFFFF6600/tj resetpos|r - Resets frame positioning to default.")
      self:Print("ThousandJabs debugging:")
      self:Print("     |cFFFF6600/tj _dbg|r - Toggles debug information gathering.")
      self:Print("     |cFFFF6600/tj _prof|r - Dumps timing information.")
      self:Print("     |cFFFF6600/tj _dtc|r - Dumps table cache information.")
      self:Print("     |cFFFF6600/tj _duc|r - Dumps unit cache information.")
      self:Print("     |cFFFF6600/tj _db|r - Dumps SavedVariables table.")
      self:Print("     |cFFFF6600/tj _mem|r - Dumps addon memory usage.")
    end
end
TJ:RegisterChatCommand('tj', 'ConsoleCommand')

------------------------------------------------------------------------------------------------------------------------
-- Logged table, prints when accessing fields which don't exist
------------------------------------------------------------------------------------------------------------------------
local missingFields = {}
local missingFieldMetatable = {
    __index = function(tbl,key)
        local TN = (type(tableNames[tbl]) == 'string' and tableNames[tbl] or "UNKNOWN_TABLE")
        if not key then error(format('Attempted to index table "%s" with nil key.', TN)) end
        if type(key) == 'table' then error(format('Attempted to index table "%s" with key of type table.\n%s', TN, debugstack(1))) end
        local testKey = type(key)=='number' and format('%s[%d]',TN,key) or format('%s.%s',TN,key)
        if private.db and private.db.do_debug then private:PrintOnce('Missing field: "%s":\n%s', testKey, debugstack(2)) end
    end
}
function private:LogMissingAccess(tableName,tbl)
    local k,v
    tableNames[tbl] = tableName
    setmetatable(tbl, missingFieldMetatable)
    for k,v in pairs(tbl) do
        if type(v) == 'table' then
            tbl[k] = private:LogMissingAccess(type(k)=='number' and format('%s[%d]',tableName,k) or format('%s.%s',tableName,k),v)
        end
    end
    return tbl
end