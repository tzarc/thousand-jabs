local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Config = TJ:GetModule('Config')
local Profiling = TJ:GetModule('Profiling')
local TableCache = TJ:GetModule('TableCache')
local UnitCache = TJ:GetModule('UnitCache')
local UI = TJ:GetModule('UI')

local assert = assert
local debugprofilestop = debugprofilestop
local GetBuildInfo = GetBuildInfo
local loadstring = loadstring
local pcall = pcall
local tonumber = tonumber

local LSD = LibStub('LibSerpentDump')

Core:Safety()

------------------------------------------------------------------------------------------------------------------------
-- Addon initialisation
------------------------------------------------------------------------------------------------------------------------

Profiling:EnableProfiling(Core.devMode)
Profiling:ProfileFunction(UnitCache, 'UpdateUnitCache', 'unitcache:UpdateUnitCache')

------------------------------------------------------------------------------------------------------------------------
-- Local definitions
------------------------------------------------------------------------------------------------------------------------

local printedOnce = {}
local tableNames = {}

------------------------------------------------------------------------------------------------------------------------
-- Printing and debug functions
------------------------------------------------------------------------------------------------------------------------

function Core:Print(...)
    TJ:Print(Core:Format(...))
end

function Core:PrintOnce(...)
    local text = Core:Format(...)
    if not printedOnce[text] then
        printedOnce[text] = true
        Core:Print(text)
    end
end

function Core:DevPrint(...)
    if Core.devMode then Core:Print("%.3f: %s", debugprofilestop(), Core:Format(...)) end
end

------------------------------------------------------------------------------------------------------------------------
-- Helpers
------------------------------------------------------------------------------------------------------------------------

function Core:LoadFunctionString(funcStr, name)
    local loader, errStr = loadstring('return (' .. funcStr .. ')', name)
    if errStr then
        Core:Error(Core:Format('Error loading function for %s:\n%s', name, errStr))
    else
        local success, retval = pcall(assert(loader))
        if success then
            return retval
        else
            Core:Error(Core:Format('Error creating function for %s:\n%s', name, tostring(retval)))
        end
    end
end

function Core:MatchesBuild(tripletFrom, tripletTo)
    tripletTo = tripletTo or tripletFrom
    local f1,f2,f3 = tripletFrom:match("(%d+)%.(%d+)%.(%d+)")
    local f = tonumber(f1)*10000000000 + tonumber(f2)*100000000 + tonumber(f3)*1000000
    local t1,t2,t3 = tripletTo:match("(%d+)%.(%d+)%.(%d+)")
    local t = tonumber(t1)*10000000000 + tonumber(t2)*100000000 + tonumber(t3)*1000000
    local c1,c2,c3 = GetBuildInfo():match("(%d+)%.(%d+)%.(%d+)")
    local c = tonumber(c1)*10000000000 + tonumber(c2)*100000000 + tonumber(c3)*1000000
    return (f <= c and c <= t) and true or false
end

------------------------------------------------------------------------------------------------------------------------
-- Logged table, prints when accessing fields which don't exist
------------------------------------------------------------------------------------------------------------------------

local function targetFieldName(tableName, key)
    return type(key) == 'number' and ('%s[%d]'):format(tableName, tostring(key)) or ('%s.%s'):format(tableName, tostring(key))
end

local missingFieldMetatable = {
    __index = function(tbl, key)
        local tableName = (type(tableNames[tbl]) == 'string' and tableNames[tbl] or "UNKNOWN_TABLE")
        local header
        local stack = debugstack()
        if type(key) == 'nil' then
            header = fmt('Attempted to index table "%s" with nil key.', tableName)
        elseif type(key) == 'table' then
            header = fmt('Attempted to index table "%s" with key of type table.', tableName)
        else
            header = fmt('Missing field: "%s"', targetFieldName(tableName, key))
        end
        if header then
            local errtxt = fmt('%s\n%s', header, stack)
            Core:Error(errtxt)
            error(errtxt)
        end
    end
}

function TJ:MissingFieldTable(tableName, tbl)
    tableNames[tbl] = tableName
    setmetatable(tbl, { __index = missingFieldMetatable.__index, __name = tableName })
    for k,v in pairs(tbl) do
        if type(v) == 'table' then
            tbl[k] = self:MissingFieldTable(targetFieldName(tableName, k), v)
        end
    end
    return tbl
end

------------------------------------------------------------------------------------------------------------------------
-- Merge multiple tables together
------------------------------------------------------------------------------------------------------------------------

function TJ:MergeTables(...)
    local target = {}
    for i=1,select('#', ...) do
        local t = select(i, ...)
        if t then
            for k,v in pairs(t) do
                if type(target[k]) == 'table' and type(v) == 'table' then
                    target[k] = self:MergeTables(target[k], v)
                elseif not target[k] then
                    target[k] = v
                end
            end
        end
    end
    return target
end

------------------------------------------------------------------------------------------------------------------------
-- Console command
------------------------------------------------------------------------------------------------------------------------

local function splitargv(str,sep)
    local sep, fields = sep or ":", {}
    local pattern = ("([^%s]+)"):format(sep)
    str:gsub(pattern, function(c) fields[#fields+1] = c end)
    return fields
end
