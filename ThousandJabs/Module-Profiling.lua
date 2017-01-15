local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Profiling = TJ:GetModule('Profiling')
local TableCache = TJ:GetModule('TableCache')

local debugprofilestop = debugprofilestop
local format = string.format
local GetAddOnMemoryUsage = GetAddOnMemoryUsage
local GetNumAddOns = GetNumAddOns
local IsAddOnLoaded = IsAddOnLoaded
local pairs = pairs
local tconcat = table.concat
local tinsert = table.insert
local tsort = table.sort
local type = type
local unpack = unpack
local UpdateAddOnMemoryUsage = UpdateAddOnMemoryUsage

Core:Safety()

local addon_count = 0
for i=1,GetNumAddOns() do
    addon_count = addon_count + (IsAddOnLoaded(i) and 1 or 0)
end
local do_mem = (addon_count < 10) and true or false
--do_mem = false

------------------------------------------------------------------------------------------------------------------------
-- Miscellaneous functions
------------------------------------------------------------------------------------------------------------------------

local function orderedpairs(t, f)
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

------------------------------------------------------------------------------------------------------------------------
-- Profiling functions
------------------------------------------------------------------------------------------------------------------------

function Profiling:ProfilingProlog(...)
    if not self.profiling.enabled then return end
    local e = TableCache:Acquire()
    e.innerTime = 0
    e.innerMem = 0
    e.func = Core:Format(...)
    self.profiling.stack[1+#self.profiling.stack] = e
    if do_mem then UpdateAddOnMemoryUsage() end
    e.mem = do_mem and GetAddOnMemoryUsage('ThousandJabs') or 0
    e.start = debugprofilestop()
end

function Profiling:ProfilingEpilog()
    local now = debugprofilestop()
    if not self.profiling.enabled or #self.profiling.stack == 0 then return end
    if do_mem then UpdateAddOnMemoryUsage() end
    local mem = do_mem and GetAddOnMemoryUsage('ThousandJabs') or 0
    local e = self.profiling.stack[#self.profiling.stack]
    self.profiling.stack[#self.profiling.stack] = nil
    self.profiling.data[e.func] = self.profiling.data[e.func] or { count = 0, timeSpent = 0, memGain = 0 }
    local d = self.profiling.data[e.func]
    d.count = d.count + 1
    d.timeSpent = d.timeSpent + (now - e.start) - e.innerTime
    d.memGain = d.memGain + (mem - e.mem) - e.innerMem
    if #self.profiling.stack > 1 then
        local p = self.profiling.stack[#self.profiling.stack-1]
        p.innerTime = (now - e.start) + e.innerTime
        p.innerMem = (mem - e.mem) + e.innerMem
    end
    TableCache:Release(e)
end

function Profiling:EnableProfiling(v)
    self.profiling = self.profiling or {}
    self.profiling.enabled = v and true or false
    self.profiling.stack = self.profiling.stack or {}
    self.profiling.data = self.profiling.data or {}
    self.profiling.unembeds = self.profiling.unembeds or {}
end

Profiling:EnableProfiling(Core.devMode)

function Profiling:ProfilingEnabled()
    return self.profiling and self.profiling.enabled and true or false
end

function Profiling:GetProfilingString()
    if not self.profiling.enabled then return 'Profiling disabled.' end
    local l = TableCache:Acquire()
    l[1+#l] = 'Profiling data:'
    for k,v in orderedpairs(self.profiling.data) do
        if type(v) == 'table' then
            l[1+#l] = do_mem
                and Core:Format('%5dx %9.3fms/ea, %13.3fms/tot: %-40s | mem=%9.3fkB/ea, %12.3fkB/tot', v.count, v.timeSpent/v.count, v.timeSpent, k, v.memGain/v.count, v.memGain)
                or  Core:Format('%5dx %6.3fms/ea, %10.3fms/tot: %s', v.count, v.timeSpent/v.count, v.timeSpent, k)
        end
    end
    local s = tconcat(l, '\n  ')
    TableCache:Release(l)
    return s
end

function Profiling:ProfileFunction(a, b, c)
    local this = self
    self:EnableProfiling(self.profiling and self.profiling.enabled or false)
    local unembeds = self.profiling.unembeds

    if type(a) == 'string' and (b == nil or type(b) == 'string') then
        -- MyAddon:ProfileFunction('MyFunction') / MyAddon:ProfileFunction('MyFunction', 'MyFunctionLoggedName')
        if not self.profiling.enabled then return end
        local oldfunc = self[a]
        local newfunc = function(...)
            this:ProfilingProlog(b or a)
            local ret = {oldfunc(...)}
            this:ProfilingEpilog()
            return unpack(ret)
        end
        unembeds[1+#unembeds] = function()
            self[a] = oldfunc
        end
        self[a] = newfunc
    elseif type(a) == 'table' and type(b) == 'string' then
        -- MyAddon:ProfileFunction(AnotherTable, 'AnotherTableFunction') / MyAddon:ProfileFunction(AnotherTable, 'AnotherTableFunction', 'MyFunctionLoggedName')
        c = type(c) == 'string' and c or b
        if not self.profiling.enabled then return end
        local oldfunc = a[b]
        local newfunc = function(...)
            this:ProfilingProlog(c)
            local ret = {oldfunc(...)}
            this:ProfilingEpilog()
            return unpack(ret)
        end
        unembeds[1+#unembeds] = function()
            a[b] = oldfunc
        end
        a[b] = newfunc
    elseif type(a) == 'string' and type(b) == 'function' then
        -- myNewFunc = MyAddon:ProfileFunction('myFunc', myOriginalFunc) / MyAddon:ProfileFunction('myFunc', myOriginalFunc, 'MyFunctionLoggedName')
        c = type(c) == 'string' and c or a
        if not self.profiling.enabled then return b end
        local oldfunc = b
        local newfunc = function(...)
            this:ProfilingProlog(c)
            local ret = {oldfunc(...)}
            this:ProfilingEpilog()
            return unpack(ret)
        end
        unembeds[1+#unembeds] = function()
        -- can't do anything here.
        end
        return newfunc
    end
end
