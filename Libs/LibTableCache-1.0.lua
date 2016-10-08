local MAJOR, MINOR = "LibTableCache-1.0", 30
local LibTableCache, oldminor = LibStub:NewLibrary(MAJOR, MINOR)

------------------------------------------------------------------------------------------------------------------------
-- Table cache
------------------------------------------------------------------------------------------------------------------------

local function ensureTableCacheExists(lib)
    lib.TableCache = lib.TableCache or {
        TotalAllocated = 0,
        TotalAcquired = 0,
        TotalReleased = 0,
        FreeTables = {},
        InUseTables = {},
        TablesToRelease = {}
    }
    return lib.TableCache
end

function LibTableCache:Acquire()
    local tc = ensureTableCacheExists(self)
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

function LibTableCache:Release(tbl)
    local tc = ensureTableCacheExists(self)
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
