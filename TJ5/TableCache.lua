local addonName = ...

local error = error
local pairs = pairs
local setmetatable = setmetatable
local type = type
local wipe = wipe

LibStub('LibSandbox-5.0'):UseSandbox(addonName)

local noCaching = false

local function ensureTableCacheExists(m)
    m.TableCache = m.TableCache or {
        TotalAllocated = 0,
        TotalAcquired = 0,
        TotalReleased = 0,
        FreeTables = {},
        InUseTables = {},
        TablesToRelease = {}
    }
    return m.TableCache
end

ensureTableCacheExists(TableCache)

local function recursiveFindChildTables(tc, t)
    for k,v in pairs(t) do
        if not tc.TablesToRelease[k] and type(k) == 'table' then
            tc.TablesToRelease[k] = k
            recursiveFindChildTables(tc, k)
        end
        if not tc.TablesToRelease[v] and type(v) == 'table' then
            tc.TablesToRelease[v] = v
            recursiveFindChildTables(tc, v)
        end
    end
end

function TableCache:Acquire()
    local tc = ensureTableCacheExists(self)
    if noCaching then return {} end
    for k,v in pairs(tc.FreeTables) do
        tc.FreeTables[k] = nil
        tc.InUseTables[k] = k
        tc.TotalAcquired = tc.TotalAcquired + 1
        return k
    end

    local t = {}
    tc.InUseTables[t] = t
    tc.TotalAcquired = tc.TotalAcquired + 1
    tc.TotalAllocated = tc.TotalAllocated + 1
    return t
end

function TableCache:Release(tbl)
    local tc = ensureTableCacheExists(self)
    if noCaching then return end
    if type(tbl) ~= 'table' then return end
    if tc.FreeTables[tbl] then return end

    tc.TablesToRelease[tbl] = true
    recursiveFindChildTables(tc, tbl)

    for k,v in pairs(tc.TablesToRelease) do
        if type(tc.InUseTables[k]) == 'nil' then error("Attempted to release a table that the TableCache doesn't own.") end
        tc.InUseTables[k] = nil
        wipe(k)
        setmetatable(k, nil)
        tc.FreeTables[k] = k
        tc.TotalReleased = tc.TotalReleased + 1
    end

    wipe(tc.TablesToRelease)
end

function TableCache:GetMetrics()
    local tc = ensureTableCacheExists(self)
    return tc.TotalAllocated, tc.TotalAcquired, tc.TotalReleased
end
