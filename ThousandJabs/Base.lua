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
        Core:PrintOnce('Error loading function for %s:\n%s', name, errStr)
    else
        local success, retval = pcall(assert(loader))
        if success then
            return retval
        else
            Core:PrintOnce('Error creating function for %s:\n%s', name, tostring(retval))
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

function TJ:ConsoleCommand(args)
    local argv = splitargv(args, '%s+')
    if argv[1] == "cfg" then
        Config:OpenDialog()
    elseif argv[1] == "move" then
        UI:ToggleMovement()
    elseif argv[1] == "resetpos" then
        UI:ResetPosition()
    elseif argv[1] == 'ticket' then
        self:ExportDebuggingInformation()
    elseif argv[1] == 'blacklist' then
        local action = rawget(self.currentProfile.actions, argv[2])
        if not action then
            Core:Print('Error, action "|cFFFF6600%s|r" not found.', argv[2])
        else
            local classID, specID = select(3, UnitClass('player')), GetSpecialization()
            local current = Config:Get("class", classID, "spec", specID, "blacklist", argv[2]) and true or false
            local newvalue = not current
            Config:Set(newvalue and true or false, "class", classID, "spec", specID, "blacklist", argv[2])
            Core:Print('Blacklist |cFFFF6600%s|r=|cFFFFCC00%s|r', argv[2], tostring(newvalue))
            self:QueueUpdate()
        end
    elseif argv[1] == '_rp' then
        self:QueueProfileReload()
    elseif argv[1] == "_dbg" then
        if Config:Get("do_debug") then
            Config:Set(false, "do_debug")
            Core:HideLoggingFrame()
            Core:Print('Debugging info disabled. Enable with "|cFFFF6600/tj _dbg|r".')
        else
            Config:Set(true, "do_debug")
            Core:ShowLoggingFrame()
            Core:Print('Debugging info enabled. Disable with "|cFFFF6600/tj _dbg|r".')
        end
    elseif argv[1] == '_dtc' then
        Core:Print('Dumping table cache metrics:')
        Core:Print(' - Total allocated: %d, total acquired: %d, total released: %d, total in-use: %d',
            TableCache.TableCache.TotalAllocated, TableCache.TableCache.TotalAcquired, TableCache.TableCache.TotalReleased, TableCache.TableCache.TotalAcquired - TableCache.TableCache.TotalReleased)
    elseif argv[1] == '_dbe' then
        Core:Debug(addonName .. ' SavedVariables Export', LSD(ThousandJabsDB))
    elseif argv[1] == '_duc' then
        Core:Print('Dumping unit cache table:')
        if not IsAddOnLoaded('Blizzard_DebugTools') then LoadAddOn('Blizzard_DebugTools') end
        DevTools_Dump{unitCache=UnitCache.unitCache}
    elseif argv[1] == '_mem' then
        UpdateAddOnMemoryUsage()
        Core:Print('Memory usage: %d kB', GetAddOnMemoryUsage(addonName))
    elseif argv[1] == '_esd' then
        self:ExportAbilitiesFromSpellBook()
    elseif argv[1] == '_dcp' then
        if self.currentProfile then
            self.needExportCurrentProfile = true
        end
    else
        Core:Print('%s chat commands:', addonName)
        Core:Print("     |cFFFF6600/tj cfg|r - Opens the configuration dialog.")
        Core:Print("     |cFFFF6600/tj move|r - Toggles frame moving.")
        Core:Print("     |cFFFF6600/tj resetpos|r - Resets frame positioning to default.")
        Core:Print("     |cFFFF6600/tj ticket|r - Shows a window that can be used to copy/paste debugging information for raising tickets.")
        Core:Print("     |cFFFF6600/tj blacklist <action>|r - Enables blacklisting of actions using slash commands / macros.")
        Core:Print('%s debugging:', addonName)
        Core:Print('     |cFFFF6600/tj _dbg|r - Toggles debug information visibility.')
    end
end

TJ:RegisterChatCommand('tj', 'ConsoleCommand')
