local MAJOR, MINOR = "LibTableCache-1.0", 12
local LibTableCache, oldminor = LibStub:NewLibrary(MAJOR, MINOR)

local tconcat = table.concat

------------------------------------------------------------------------------------------------------------------------
-- Table cache
------------------------------------------------------------------------------------------------------------------------

LibTableCache.TableCache = LibTableCache.TableCache or {
    TotalAllocated = 0,
    TotalAcquired = 0,
    TotalReleased = 0,
    FreeTables = {},
    InUseTables = {},
    TablesToRelease = {}
}

function LibTableCache:Acquire()
    local k,v
    for k,v in pairs(self.TableCache.FreeTables) do
        self.TableCache.FreeTables[k] = nil
        self.TableCache.InUseTables[k] = true
        self.TableCache.TotalAcquired = self.TableCache.TotalAcquired + 1
        return k
    end

    local t = {}
    self.TableCache.InUseTables[t] = true
    self.TableCache.TotalAcquired = self.TableCache.TotalAcquired + 1
    self.TableCache.TotalAllocated = self.TableCache.TotalAllocated + 1
    return t
end

function LibTableCache:Release(tbl)
    local k,v
    if type(tbl) ~= 'table' then return end
    if self.TableCache.FreeTables[tbl] then return end

    local function recursiveFindChildTables(t)
        local k2,v2
        for k2,v2 in pairs(t) do
            if not self.TableCache.TablesToRelease[k2] and type(k2) == 'table' then
                self.TableCache.TablesToRelease[k2] = true
                recursiveFindChildTables(k2)
            end
            if not self.TableCache.TablesToRelease[v2] and type(v2) == 'table' then
                self.TableCache.TablesToRelease[v2] = true
                recursiveFindChildTables(v2)
            end
        end
    end

    self.TableCache.TablesToRelease[tbl] = true
    recursiveFindChildTables(tbl)

    for k,v in pairs(self.TableCache.TablesToRelease) do
        if self.TableCache.InUseTables[k] then self.TableCache.InUseTables[k] = nil end
        wipe(k)
        setmetatable(k, nil)
        self.TableCache.FreeTables[k] = true
        self.TableCache.TotalReleased = self.TableCache.TotalReleased + 1
    end

    wipe(self.TableCache.TablesToRelease)
end
