--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Legion only.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if GetBuildInfo and select(4, GetBuildInfo()) >= 80000 then
    return
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local LibStub = LibStub
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Profiling = TJ:GetModule('Profiling')
local TableCache = TJ:GetModule('TableCache')

local ct = function() return TableCache:Acquire() end
local rt = function(tbl) TableCache:Release(tbl) end

local debugprofilestop = debugprofilestop
local format = string.format
local FormatLargeNumber = FormatLargeNumber
local GetAddOnMemoryUsage = GetAddOnMemoryUsage
local GetNumAddOns = GetNumAddOns
local IsAddOnLoaded = IsAddOnLoaded
local mfloor = math.floor
local mmax = math.max
local pairs = pairs
local tconcat = table.concat
local tinsert = table.insert
local tsort = table.sort
local type = type
local unpack = unpack
local UpdateAddOnMemoryUsage = UpdateAddOnMemoryUsage
local wipe = wipe

Core:Safety()

local do_mem = false

------------------------------------------------------------------------------------------------------------------------
-- Profiling functions
------------------------------------------------------------------------------------------------------------------------

local function p_push(e)
    Profiling.profiling.stack[1+#Profiling.profiling.stack] = e
end

local function p_pop()
    local e = Profiling.profiling.stack[#Profiling.profiling.stack]
    Profiling.profiling.stack[#Profiling.profiling.stack] = nil
    return e
end

local function p_top()
    return Profiling.profiling.stack[#Profiling.profiling.stack]
end

local function p_data(e)
    local d = Profiling.profiling.data[e.func]
    if not d then
        d = ct()
        d.count, d.timeSpent, d.memGain = 0, 0, 0
        Profiling.profiling.data[e.func] = d
    end
    return d
end

function Profiling:ProfilingProlog(...)
    if not self.profiling.enabled then return end
    local e = ct()
    e.innerTime, e.innerMem, e.mem, e.func = 0, 0, 0, Core:Format(...)

    if do_mem then
        UpdateAddOnMemoryUsage()
        e.mem = GetAddOnMemoryUsage('ThousandJabs') or 0
    end

    p_push(e)
    e.start = debugprofilestop()
end

function Profiling:ProfilingEpilog(...)
    local now = debugprofilestop()
    if not self.profiling.enabled or #self.profiling.stack == 0 then return end

    local mem = 0
    if do_mem then
        UpdateAddOnMemoryUsage()
        mem = GetAddOnMemoryUsage('ThousandJabs') or 0
    end

    local e = p_pop()
    local d = p_data(e)
    d.count = d.count + 1
    d.timeSpent = d.timeSpent +  mmax(0, (now - e.start) - e.innerTime) -- filter out negative timing
    d.memGain = d.memGain + mmax(0, (mem - e.mem) - e.innerMem) -- filter out internal gc's

    local t = p_top()
    if t then
        t.innerTime = t.innerTime + mmax(0, (now - e.start) + e.innerTime)
        t.innerMem = t.innerMem + mmax(0, (mem - e.mem) + e.innerMem)
    end

    rt(e)
    return ...
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

function Profiling:ResetMetrics()
    wipe(self.profiling.stack)
    wipe(self.profiling.data)
end

function Profiling:GetProfilingString()
    if not self.profiling.enabled then return 'Profiling disabled.' end
    local l = ct()
    l[1+#l] = 'Profiling data:'
    for k,v in Core:OrderedPairs(self.profiling.data) do
        if type(v) == 'table' then
            l[1+#l] = do_mem
                and Core:Format('%5dx %9.3fms/ea, %13.3fms/tot: %-40s | mem=%11s bytes/ea, %15s bytes/tot', v.count, v.timeSpent/v.count, v.timeSpent, k, FormatLargeNumber(mfloor(1024*v.memGain/v.count)), FormatLargeNumber(mfloor(1024*v.memGain)))
                or  Core:Format('%5dx %6.3fms/ea, %10.3fms/tot: %s', v.count, v.timeSpent/v.count, v.timeSpent, k)
        end
    end
    local s = tconcat(l, '\n  ')
    rt(l)
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
            return this:ProfilingEpilog(oldfunc(...))
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
            return this:ProfilingEpilog(oldfunc(...))
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
            return this:ProfilingEpilog(oldfunc(...))
        end
        unembeds[1+#unembeds] = function()
        -- can't do anything here.
        end
        return newfunc
    end
end
