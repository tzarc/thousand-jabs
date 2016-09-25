local addonName, internal = ...;
local Z = LibStub('AceAddon-3.0'):NewAddon(addonName, 'AceConsole-3.0', 'AceEvent-3.0', 'AceTimer-3.0', 'LibProfiling-1.0')
internal.Z = Z
local consoleCommand = 'tj'

local error = error
local type = type
local pairs = pairs
local setmetatable = setmetatable
local format = string.format
local tconcat = table.concat

local LTC = LibStub('LibTableCache-1.0')
local LUC = LibStub('LibUnitCache-1.0')
local LSM = LibStub('LibSharedMedia-3.0')

------------------------------------------------------------------------------------------------------------------------
-- Addon initialistion
------------------------------------------------------------------------------------------------------------------------

local devMode = false
internal.devMode = devMode
Z:EnableProfiling(devMode)
Z:ProfileFunction(LUC, 'UpdateUnitCache', 'unitcache:UpdateUnitCache')
if devMode then _G['tj'] = Z end

------------------------------------------------------------------------------------------------------------------------
-- Local definitions
------------------------------------------------------------------------------------------------------------------------

local printedOnce = {}
local dbglist = {}

------------------------------------------------------------------------------------------------------------------------
-- Printing and debug functions
------------------------------------------------------------------------------------------------------------------------

function internal.fmt(fmt, ...)
    return ((select('#', ...) > 0) and format(fmt, ...) or fmt or '')
end
local fmt = internal.fmt

local oldprint = Z.Print
function Z:Print(...)
    oldprint(self, fmt(...))
end

function Z:PrintOnce(...)
    local text = fmt(...)
    if not printedOnce[text] then
        printedOnce[text] = true
        self:Print(text)
    end
end

function Z:Debug(...)
    if internal.GetConf("do_debug") then self:Print(fmt(...)) end
end

------------------------------------------------------------------------------------------------------------------------
-- Helpers
------------------------------------------------------------------------------------------------------------------------

function Z:LoadFunctionString(funcStr, name)
    local loader, errStr = loadstring(funcStr, name)
    if errStr then
        Z:PrintOnce('Error loading function for %s:\n%s', name, errStr)
    else
        local success, retval = pcall(assert(loader))
        if success then
            return retval
        else
            Z:PrintOnce('Error creating function for %s:\n%s', name, tostring(retval))
        end
    end
end

function internal.orderedpairs(t, f)
    local a = {}
    for n in pairs(t) do table.insert(a, n) end
    table.sort(a, f)
    local i = 0
    local iter = function ()
        i = i + 1
        local k = a[i]
        if k == nil then
            return nil
        else
            return k, t[k]
        end
    end
    return iter
end
local orderedpairs = internal.orderedpairs

------------------------------------------------------------------------------------------------------------------------
-- Debug log
------------------------------------------------------------------------------------------------------------------------

function internal.DBG(...)
    if internal.GetConf("do_debug") then
        local x = {...}
        if #x == 1 and type(x[1]) == 'table' then
            for k,v in orderedpairs(x[1]) do
                dbglist[1+#dbglist] = fmt(" - %s = %s", tostring(k), tostring(v))
            end
        else
            if #dbglist == 0 then dbglist[1] = addonName .. ' Debug log (|cFF00FFFFhide with /'..consoleCommand..' _dbg|r):' end
            dbglist[1+#dbglist] = fmt(...)
        end
    end
end

function internal.DBGR()
    wipe(dbglist)
end

function internal.DBGSTR()
    return tconcat(dbglist, '\n  ')
end

------------------------------------------------------------------------------------------------------------------------
-- Logging frame
------------------------------------------------------------------------------------------------------------------------

function Z:ShowLoggingFrame()
    if not self.log_frame then
        self.log_frame = CreateFrame("Frame", format("%sLog", addonName), UIParent)
        self.log_frame:ClearAllPoints()
        self.log_frame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 550, -20)
        self.log_frame:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -20, 20)
        self.log_frame.text = self.log_frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        self.log_frame.text:SetJustifyH("LEFT")
        self.log_frame.text:SetJustifyV("TOP")
        self.log_frame.text:SetPoint("TOPLEFT", 8, -8)
        self.log_frame.text:SetPoint("BOTTOMRIGHT", -8, 8)
        local f = LSM:Fetch("font", "mplus-1m-bold")
        if f then self.log_frame.text:SetFont(f, 10, "OUTLINE") end
    end

    self.log_frame:Show()
    self.log_frame.text:Show()
end

function Z:HideLoggingFrame()
    if self.log_frame then
        self.log_frame:Hide()
    end
end

function Z:UpdateLog()
    if internal.GetConf("do_debug") and self.log_frame then
        if self:ProfilingEnabled() then
            self.log_frame.text:SetText(self:GetProfilingString() .. '\n\n' .. internal.DBGSTR())
        else
            self.log_frame.text:SetText(internal.DBGSTR())
        end
    end
end

------------------------------------------------------------------------------------------------------------------------
-- Logged table, prints when accessing fields which don't exist
------------------------------------------------------------------------------------------------------------------------

local function targetFieldName(tableName, key)
    return type(key) == 'number' and format('%s[%d]', tableName, tostring(key)) or format('%s.%s', tableName, tostring(key))
end

local tableNames = {}
local missing = {}
local missingFieldMetatable = {
    __index = function(tbl, key)
        local tableName = (type(tableNames[tbl]) == 'string' and tableNames[tbl] or "UNKNOWN_TABLE")
        if not key then error(format('Attempted to index table "%s" with nil key.', tableName)) end
        if type(key) == 'table' then error(format('Attempted to index table "%s" with key of type table.\n%s', tableName, debugstack(1))) end
        if internal.GetConf("do_debug") then
            local errTxt = format('Missing field: "%s":\n%s', targetFieldName(tableName, key), debugstack(2))
            if not missing[errTxt] then
                missing[errTxt] = true
                Z:Print(errTxt)
                if not IsAddOnLoaded('Blizzard_DebugTools') then LoadAddOn('Blizzard_DebugTools') end
                DevTools_Dump{[tableName]=tbl}
            end
        end
    end
}

function Z:MissingFieldTable(tableName, tbl)
    tableNames[tbl] = tableName
    setmetatable(tbl, missingFieldMetatable)
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

function Z:MergeTables(...)
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
-- Console command handlers
------------------------------------------------------------------------------------------------------------------------

function Z:OpenConfigDialog()
    local ACD = LibStub("AceConfigDialog-3.0")
    ACD:Open("ThousandJabs")
    ACD:SelectGroup("ThousandJabs", "general")
end

function Z:ToggleMovement()
    if self.movable then
        self.movable = false
        self:Print('Frame movement disabled.')
    else
        self.movable = true
        self:Print('Frame movement enabled.')
    end
    self.actionsFrame:SetMovable(self.movable)
    self.actionsFrame:EnableMouse(self.movable)
end

function Z:ResetPosition()
    self:Print('Resetting position.')
    internal.SetConf(nil, "x")
    internal.SetConf(nil, "y")
    internal.SetConf(nil, "anchor")
    self.actionsFrame:ClearAllPoints()
    self.actionsFrame:SetPoint('CENTER', UIParent, internal.GetConf("anchor"), internal.GetConf("x"), internal.GetConf("y"))
    self.actionsFrame:SetMovable(self.movable)
    self.actionsFrame:EnableMouse(self.movable)
end

------------------------------------------------------------------------------------------------------------------------
-- Console command
------------------------------------------------------------------------------------------------------------------------

function Z:ConsoleCommand(args)
    if args == "cfg" then
        self:OpenConfigDialog()
    elseif args == "move" then
        self:ToggleMovement()
    elseif args == "resetpos" then
        self:ResetPosition()
    elseif args == "_dbg" then
        if internal.GetConf("do_debug") then
            internal.SetConf(false, "do_debug")
            self:HideLoggingFrame()
            self:Print('Debugging info disabled. Enable with "|cFFFF6600/%s _dbg|r".', consoleCommand)
        else
            internal.SetConf(true, "do_debug")
            self:ShowLoggingFrame()
            self:Print('Debugging info enabled. Disable with "|cFFFF6600/%s _dbg|r".', consoleCommand)
        end
    elseif args == '_dtc' then
        self:Print('Dumping table cache metrics:')
        self:Print(' - Total allocated: %d, total acquired: %d, total released: %d, total in-use: %d',
            LTC.TableCache.TotalAllocated, LTC.TableCache.TotalAcquired, LTC.TableCache.TotalReleased, LTC.TableCache.TotalAcquired - LTC.TableCache.TotalReleased)
    elseif args == '_db' then
        self:Print('Dumping SavedVariables table:')
        if not IsAddOnLoaded('Blizzard_DebugTools') then LoadAddOn('Blizzard_DebugTools') end
        DevTools_Dump{db=ThousandJabsDB}
    elseif args == '_dbe' then
        self:ExportSavedVariables()
    elseif args == '_duc' then
        self:Print('Dumping unit cache table:')
        if not IsAddOnLoaded('Blizzard_DebugTools') then LoadAddOn('Blizzard_DebugTools') end
        DevTools_Dump{unitCache=LUC.unitCache}
    elseif args == '_mem' then
        UpdateAddOnMemoryUsage()
        self:Print('Memory usage: %d kB', GetAddOnMemoryUsage(addonName))
    elseif args == '_esd' then
        Z:ExportAbilitiesFromSpellBook()
    else
        self:Print('%s chat commands:', addonName)
        self:Print("     |cFFFF6600/tj cfg|r - Opens the configuration dialog.")
        self:Print("     |cFFFF6600/tj move|r - Toggles frame moving.")
        self:Print("     |cFFFF6600/tj resetpos|r - Resets frame positioning to default.")
        self:Print('%s debugging:', addonName)
        self:Print('     |cFFFF6600/%s _dbg|r - Toggles debug information visibility.', consoleCommand)
        self:Print('     |cFFFF6600/%s _dtc|r - Dumps table cache information.', consoleCommand)
        self:Print('     |cFFFF6600/%s _db|r - Dumps SavedVariables table.', consoleCommand)
        self:Print('     |cFFFF6600/%s _dbe|r - Export SavedVariables table.', consoleCommand)
        self:Print('     |cFFFF6600/%s _duc|r - Dumps unit cache table.', consoleCommand)
        self:Print('     |cFFFF6600/%s _mem|r - Dumps addon memory usage.', consoleCommand)
    end
end
Z:RegisterChatCommand(consoleCommand, 'ConsoleCommand')
