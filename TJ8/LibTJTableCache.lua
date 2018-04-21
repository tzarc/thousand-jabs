--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Alpha only.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(4, GetBuildInfo()) < 80000 then
    return
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Library definition.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local TableCache = LibStub:NewLibrary('LibTJTableCache-8.0', 1)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Locals
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local error = error
local pairs = pairs
local setmetatable = setmetatable
local type = type
local wipe = wipe

local noCaching = false

local function ensureTableCacheExists(m)
    m.TableCache = m.TableCache or {
        TotalAllocated = 0,
        TotalAcquired = 0,
        TotalReleased = 0,
        OwnedTables = {},
        FreeTables = {},
        InUseTables = {},
        TablesToRelease = {}
    }
    return m.TableCache
end
ensureTableCacheExists(TableCache)

local function recursiveFindChildTables(tc, t)
    -- Intentionally don't recurse into tables the cache don't own.
    for k,v in pairs(t) do
        if type(k) == 'table' and tc.OwnedTables[k] and not tc.TablesToRelease[k] then
            tc.TablesToRelease[k] = k
            recursiveFindChildTables(tc, k)
        end
        if type(v) == 'table' and tc.OwnedTables[v] and not tc.TablesToRelease[v] then
            tc.TablesToRelease[v] = v
            recursiveFindChildTables(tc, v)
        end
    end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Functions
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function TableCache:Acquire()
    local tc = ensureTableCacheExists(self)
    if noCaching then return {} end

    -- Find if we have a table free, and reuse that
    for k,v in pairs(tc.FreeTables) do
        tc.FreeTables[k] = nil
        tc.InUseTables[k] = k
        tc.TotalAcquired = tc.TotalAcquired + 1
        return k
    end

    -- No table available, allocate a new one and bump the counts
    local t = {}
    tc.OwnedTables[t] = true
    tc.InUseTables[t] = t
    tc.TotalAcquired = tc.TotalAcquired + 1
    tc.TotalAllocated = tc.TotalAllocated + 1
    return t
end

function TableCache:Release(tbl)
    local tc = ensureTableCacheExists(self)
    if noCaching then return end

    -- Drop out if it's not a table
    if type(tbl) ~= 'table' then return end
    -- If we don't own it, drop out
    if not tc.OwnedTables[tbl] then return end
    -- If it's already free, drop out early
    if tc.FreeTables[tbl] then return end

    tc.TablesToRelease[tbl] = true
    recursiveFindChildTables(tc, tbl)

    for k,v in pairs(tc.TablesToRelease) do
        tc.InUseTables[k] = nil
        wipe(k)
        setmetatable(k, nil)
        tc.FreeTables[k] = k
        tc.TotalReleased = tc.TotalReleased + 1
    end

    wipe(tc.TablesToRelease)
end

local metrics = {}
function TableCache:GetMetrics()
    local tc = ensureTableCacheExists(self)
    metrics.TotalAllocated = tc.TotalAllocated
    metrics.TotalAcquired = tc.TotalAcquired
    metrics.TotalReleased = tc.TotalReleased
    return metrics
end
