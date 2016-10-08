local addonName = ...
local MAJOR, MINOR = "LibProfiling-1.0", 29
local LibProfiling, oldminor = LibStub:NewLibrary(MAJOR, MINOR)

local type = type
local unpack = unpack
local pairs = pairs
local tinsert = table.insert
local tsort = table.sort
local tconcat = table.concat
local format = string.format
local debugprofilestop = debugprofilestop

local LTC = LibStub('LibTableCache-1.0')

local addon_count = 0
for i=1,GetNumAddOns() do
    addon_count = addon_count + (IsAddOnLoaded(i) and 1 or 0)
end
local do_mem = (addon_count < 5) and true or false
do_mem = false

------------------------------------------------------------------------------------------------------------------------
-- Miscellaneous functions
------------------------------------------------------------------------------------------------------------------------

local function formatHelper(fmt, ...)
    return ((select('#', ...) > 0) and format(fmt, ...) or fmt or '')
end

local function orderedpairs(t, f)
    local a = LTC:Acquire()
    for n in pairs(t) do tinsert(a, n) end
    tsort(a, f)
    local i = 0
    local iter = function ()
        i = i + 1
        local k = a[i]
        if k == nil then
            LTC:Release(a)
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

function LibProfiling:ProfilingProlog(...)
    if not self.profiling.enabled then return end
    local e = LTC:Acquire()
    e.func = formatHelper(...)
    e.start = debugprofilestop()
    if do_mem then UpdateAddOnMemoryUsage() end
    e.mem = do_mem and GetAddOnMemoryUsage(addonName) or 0
    self.profiling.stack[1+#self.profiling.stack] = e
end

function LibProfiling:ProfilingEpilog()
    if not self.profiling.enabled or #self.profiling.stack == 0 then return end
    local now = debugprofilestop()
    if do_mem then UpdateAddOnMemoryUsage() end
    local mem = do_mem and GetAddOnMemoryUsage(addonName) or 0
    local e = self.profiling.stack[#self.profiling.stack]
    self.profiling.stack[#self.profiling.stack] = nil
    self.profiling.data[e.func] = self.profiling.data[e.func] or { count = 0, timeSpent = 0, memGain = 0 }
    local d = self.profiling.data[e.func]
    d.count = d.count + 1
    d.timeSpent = d.timeSpent + (now - e.start)
    d.memGain = d.memGain + (mem - e.mem)
    LTC:Release(e)
end

function LibProfiling:EnableProfiling(v)
    self.profiling = self.profiling or {}
    self.profiling.enabled = v and true or false
    self.profiling.stack = self.profiling.stack or {}
    self.profiling.data = self.profiling.data or {}
    self.profiling.unembeds = self.profiling.unembeds or {}
end

function LibProfiling:ProfilingEnabled()
    return self.profiling and self.profiling.enabled and true or false
end

function LibProfiling:GetProfilingString()
    if not self.profiling.enabled then return 'Profiling disabled.' end
    local l = LTC:Acquire()
    l[1+#l] = 'Profiling data:'
    for k,v in orderedpairs(self.profiling.data) do
        if type(v) == 'table' then
            l[1+#l] = do_mem
                and formatHelper('%5dx %6.3fms/ea, %10.3fms/tot: %s (mem=%.3fkB/ea, %.3fkB/tot)', v.count, v.timeSpent/v.count, v.timeSpent, k, v.memGain/v.count, v.memGain)
                or  formatHelper('%5dx %6.3fms/ea, %10.3fms/tot: %s', v.count, v.timeSpent/v.count, v.timeSpent, k)
        end
    end
    local s = tconcat(l, '\n  ')
    LTC:Release(l)
    return s
end

function LibProfiling:ProfileFunction(a, b, c)
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

------------------------------------------------------------------------------------------------------------------------
-- Embed handling
------------------------------------------------------------------------------------------------------------------------

LibProfiling.embeds = LibProfiling.embeds or {}

local mixins = {
    'ProfilingProlog', 'ProfilingEpilog', 'EnableProfiling', 'ProfilingEnabled', 'ProfileFunction', 'GetProfilingString'
}

function LibProfiling:Embed(target)
    LibProfiling.embeds[target] = true
    for _,v in pairs(mixins) do
        target[v] = LibProfiling[v]
    end
    return target
end

function LibProfiling:OnEmbedDisable(target)
    for _,v in pairs(self.profiling.unembeds) do
        v()
    end
    wipe(self.profiling.unembeds)
end

for addon in pairs(LibProfiling.embeds) do
    LibProfiling:Embed(addon)
end
