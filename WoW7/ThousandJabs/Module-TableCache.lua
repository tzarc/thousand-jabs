--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Legion only.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(4, GetBuildInfo()) >= 80000 then
    return
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local LibStub = LibStub
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local TableCache = TJ:GetModule('TableCache')

local pairs = pairs
local setmetatable = setmetatable
local type = type
local wipe = wipe
local noCaching = false

Core:Safety()

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
        if tc.InUseTables[k] then tc.InUseTables[k] = nil end
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
