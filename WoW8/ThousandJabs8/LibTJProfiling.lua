--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BfA only.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(4, GetBuildInfo()) < 80000 then
    return
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Module definition.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local addonName, _ = ...
local Profiling = LibStub:NewLibrary('LibTJProfiling-8.0', 1)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Locals
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local tsort = table.sort
local tconcat = table.concat
local mmax = math.max
local mfloor = math.floor

local TableCache = LibStub('LibTJTableCache-8.0')
function CT() return TableCache:Acquire() end
function RT(tbl) TableCache:Release(tbl) end

local gatherMemoryStats = false
local profilingData = {}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Profiling functions
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local function p_push(e)
    profilingData.stack[1+#profilingData.stack] = e
end

local function p_pop()
    local e = profilingData.stack[#profilingData.stack]
    profilingData.stack[#profilingData.stack] = nil
    return e
end

local function p_top()
    return profilingData.stack[#profilingData.stack]
end

local function p_data(e)
    local d = profilingData.data[e.func]
    if not d then
        d = CT()
        d.count, d.timeSpent, d.memGain = 0, 0, 0
        profilingData.data[e.func] = d
    end
    return d
end

function Profiling:ProfilingProlog(funcName)
    if not profilingData.enabled then return end
    local e = CT()
    e.innerTime, e.innerMem, e.mem, e.func = 0, 0, 0, funcName

    if gatherMemoryStats then
        UpdateAddOnMemoryUsage()
        e.mem = GetAddOnMemoryUsage(addonName) or 0
    end

    p_push(e)
    e.start = debugprofilestop()
end

function Profiling:ProfilingEpilog(...)
    local now = debugprofilestop()
    if not profilingData.enabled or #profilingData.stack == 0 then return end

    local mem = 0
    if gatherMemoryStats then
        UpdateAddOnMemoryUsage()
        mem = GetAddOnMemoryUsage(addonName) or 0
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

    RT(e)
    return ...
end

function Profiling:EnableProfiling(v)
    profilingData = profilingData or {}
    profilingData.enabled = v and true or false
    profilingData.stack = profilingData.stack or {}
    profilingData.data = profilingData.data or {}
end

function Profiling:ProfilingEnabled()
    return profilingData and profilingData.enabled and true or false
end

function Profiling:ResetMetrics()
    wipe(profilingData.stack)
    wipe(profilingData.data)
end

do
    local function orderedPairsDispatch(state)
        state.idx = state.idx + 1
        local k = state.keys[state.idx]
        if k == nil then
            state.tbl = nil
            RT(state)
            return nil
        else
            return k, state.tbl[k]
        end
    end

    function orderedpairs(tbl, f)
        local tc = tableCreator or unspecifiedTableCreator
        local state = CT()
        state.idx = 0
        state.tbl = tbl
        state.keys = CT()
        state.td = tableDestroyer or unspecifiedTableDestroyer
        for n in pairs(tbl) do tinsert(state.keys, n) end
        tsort(state.keys, f)
        return orderedPairsDispatch, state
    end

    local function fmt(f, ...)
        return ((select('#', ...) > 0) and f:format(...) or (type(f) == 'string' and f) or tostring(f) or '')
    end

    function Profiling:GetProfilingString()
        if not profilingData.enabled then return 'Profiling disabled.' end
        local l = CT()
        l[1+#l] = 'Profiling data:'
        local found = false
        for k,v in orderedpairs(profilingData.data) do
            if type(v) == 'table' then
                found = true
                l[1+#l] = gatherMemoryStats
                    and fmt('%7dx %9.3fms/ea, %16.3fms/tot: %-40s | mem=%11s bytes/ea, %15s bytes/tot', v.count, v.timeSpent/v.count, v.timeSpent, k, FormatLargeNumber(mfloor(1024*v.memGain/v.count)), FormatLargeNumber(mfloor(1024*v.memGain)))
                    or  fmt('%7dx %9.3fms/ea, %16.3fms/tot: %s', v.count, v.timeSpent/v.count, v.timeSpent, k)
            end
        end
        if not found then RT(l) return '' end
        local s = tconcat(l, '\n  ')
        RT(l)
        return s
    end
end

function Profiling:ProfileFunction(a, b, c)
    if type(a) == 'table' and type(b) == 'function' and (type(c) == 'string' or type(c) == 'nil') then
        -- Profiling:ProfileFunction(MyAddon, MyAddon.Func)
        local found, index
        for k,v in pairs(a) do
            if v == b then
                found = true
                index = k
            end
        end
        if found then
            local oldFunc = a[index]
            a[index] = function(...)
                if not profilingData.enabled then return oldFunc(...) end
                self:ProfilingProlog(c or index)
                return self:ProfilingEpilog(oldFunc(...))
            end
        else
            error('Could not find matching function')
        end
    elseif type(a) == 'table' and type(b) == 'string' and (type(c) == 'string' or type(c) == 'nil') then
        -- Profiling:ProfileFunction(MyAddon, 'Func')
        if a[b] then
            local oldFunc = a[b]
            a[b] = function(...)
                if not profilingData.enabled then return oldFunc(...) end
                self:ProfilingProlog(c or b)
                return self:ProfilingEpilog(oldFunc(...))
            end
        else
            error('Could not find matching function')
        end
    elseif type(a) == 'function' and type(b) == 'string' and type(c) == 'nil' then
        -- myFunc = Profiling:ProfileFunction(myFunc, 'myFunc')
        return function(...)
            if not profilingData.enabled then return a(...) end
            self:ProfilingProlog(b)
            return self:ProfilingEpilog(a(...))
        end
    end
end
