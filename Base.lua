local addonName, internal = ...;
local TJ = internal.TJ
local Debug = internal.Debug
local fmt = internal.fmt
local Config = TJ:GetModule('Config')
local Profiling = TJ:GetModule('Profiling')
local UnitCache = TJ:GetModule('UnitCache')
local UI = TJ:GetModule('UI')

local LSD = LibStub('LibSerpentDump')

local assert = assert
local debugprofilestop = debugprofilestop
local loadstring = loadstring
local pairs = pairs
local pcall = pcall
local setmetatable = setmetatable
local tinsert = table.insert
local tostring = tostring
local tsort = table.sort
local type = type

internal.Safety()

------------------------------------------------------------------------------------------------------------------------
-- Addon initialisation
------------------------------------------------------------------------------------------------------------------------

Profiling:EnableProfiling(internal.devMode)
Profiling:ProfileFunction(UnitCache, 'UpdateUnitCache', 'unitcache:UpdateUnitCache')

------------------------------------------------------------------------------------------------------------------------
-- Local definitions
------------------------------------------------------------------------------------------------------------------------

local printedOnce = {}
local tableNames = {}

------------------------------------------------------------------------------------------------------------------------
-- Printing and debug functions
------------------------------------------------------------------------------------------------------------------------

local oldprint = TJ.Print
function TJ:Print(...)
    oldprint(self, fmt(...))
end

function TJ:PrintOnce(...)
    local text = fmt(...)
    if not printedOnce[text] then
        printedOnce[text] = true
        self:Print(text)
    end
end

function TJ:DevPrint(...)
    if internal.devMode then self:Print("%.3f: %s", debugprofilestop(), fmt(...)) end
end

------------------------------------------------------------------------------------------------------------------------
-- Helpers
------------------------------------------------------------------------------------------------------------------------

function TJ:LoadFunctionString(funcStr, name)
    local loader, errStr = loadstring('return (' .. funcStr .. ')', name)
    if errStr then
        self:PrintOnce('Error loading function for %s:\n%s', name, errStr)
    else
        local success, retval = pcall(assert(loader))
        if success then
            return retval
        else
            self:PrintOnce('Error creating function for %s:\n%s', name, tostring(retval))
        end
    end
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
            internal.error(errtxt)
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
    local t = {...}
    local target = {}
    for i=1,#t do
        local idx = #t-i+1
        if t[idx] then
            for k,v in pairs(t[idx]) do
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
            self:Print('Error, action "|cFFFF6600%s|r" not found.', argv[2])
        else
            local classID, specID = select(3, UnitClass('player')), GetSpecialization()
            local current = Config:Get("class", classID, "spec", specID, "blacklist", argv[2]) and true or false
            local newvalue = not current
            Config:Set(newvalue and true or false, "class", classID, "spec", specID, "blacklist", argv[2])
            self:Print('Blacklist |cFFFF6600%s|r=|cFFFFCC00%s|r', argv[2], tostring(newvalue))
            self:QueueUpdate()
        end
    elseif argv[1] == "_dbg" then
        if Config:Get("do_debug") then
            Config:Set(false, "do_debug")
            self:HideLoggingFrame()
            self:Print('Debugging info disabled. Enable with "|cFFFF6600/%s _dbg|r".', internal.consoleCommand)
        else
            Config:Set(true, "do_debug")
            self:ShowLoggingFrame()
            self:Print('Debugging info enabled. Disable with "|cFFFF6600/%s _dbg|r".', internal.consoleCommand)
        end
    elseif argv[1] == '_dtc' then
        self:Print('Dumping table cache metrics:')
        self:Print(' - Total allocated: %d, total acquired: %d, total released: %d, total in-use: %d',
            TableCache.TableCache.TotalAllocated, TableCache.TableCache.TotalAcquired, TableCache.TableCache.TotalReleased, TableCache.TableCache.TotalAcquired - TableCache.TableCache.TotalReleased)
    elseif argv[1] == '_dbe' then
        self:OpenDebugWindow(addonName .. ' SavedVariables Export', LSD(ThousandJabsDB))
    elseif argv[1] == '_duc' then
        self:Print('Dumping unit cache table:')
        if not IsAddOnLoaded('Blizzard_DebugTools') then LoadAddOn('Blizzard_DebugTools') end
        DevTools_Dump{unitCache=UnitCache.unitCache}
    elseif argv[1] == '_mem' then
        UpdateAddOnMemoryUsage()
        self:Print('Memory usage: %d kB', GetAddOnMemoryUsage(addonName))
    elseif argv[1] == '_esd' then
        self:ExportAbilitiesFromSpellBook()
    else
        self:Print('%s chat commands:', addonName)
        self:Print("     |cFFFF6600/tj cfg|r - Opens the configuration dialog.")
        self:Print("     |cFFFF6600/tj move|r - Toggles frame moving.")
        self:Print("     |cFFFF6600/tj resetpos|r - Resets frame positioning to default.")
        self:Print("     |cFFFF6600/tj ticket|r - Shows a window that can be used to copy/paste debugging information for raising tickets.")
        self:Print("     |cFFFF6600/tj blacklist <action>|r - Enables blacklisting of actions using slash commands / macros.")
        self:Print('%s debugging:', addonName)
        self:Print('     |cFFFF6600/%s _dbg|r - Toggles debug information visibility.', internal.consoleCommand)
        self:Print('     |cFFFF6600/%s _dtc|r - Dumps table cache information.', internal.consoleCommand)
        self:Print('     |cFFFF6600/%s _dbe|r - Export SavedVariables table.', internal.consoleCommand)
        self:Print('     |cFFFF6600/%s _duc|r - Dumps unit cache table.', internal.consoleCommand)
        self:Print('     |cFFFF6600/%s _mem|r - Dumps addon memory usage.', internal.consoleCommand)
    end
end

TJ:RegisterChatCommand(internal.consoleCommand, 'ConsoleCommand')
