local addonName, internal = ...;
local Z = LibStub('AceAddon-3.0'):NewAddon(addonName, 'AceConsole-3.0', 'AceEvent-3.0', 'LibProfiling-1.0')
internal.Z = Z
local consoleCommand = 'tj'

local error = error
local type = type
local pairs = pairs
local setmetatable = setmetatable
local format = string.format
local tconcat = table.concat
local tcontains = tContains

------------------------------------------------------------------------------------------------------------------------
-- Formatting
------------------------------------------------------------------------------------------------------------------------

function internal.fmt(fmt, ...)
    return ((select('#', ...) > 0) and format(fmt, ...) or fmt or '')
end
local fmt = internal.fmt

------------------------------------------------------------------------------------------------------------------------
-- Variable safety checks
------------------------------------------------------------------------------------------------------------------------

local global_reads = {}
local global_writes = {}
local global_excludes = { 'ThousandJabsDB' }
local real_G = _G
local fake_G = setmetatable({}, {
    __index = function(tbl,key)
        local val = real_G[key]
        if val ~= nil then return val end
        if tcontains(global_excludes, key) then return nil end
        global_reads[key] = global_reads[key] or {}
        local entry = global_reads[key]
        entry.stacks = entry.stacks or {}
        local thisstack = '\n'..debugstack()
        local found = false
        for k,v in pairs(entry.stacks) do
            if v == thisstack then
                found = true
                break
            end
        end
        if not found then
            entry.stacks[1+#entry.stacks] = thisstack
        end
        return nil
    end,
    __newindex = function(tbl,key,val)
        real_G[key] = val
        if tcontains(global_excludes, key) then return val end
        global_writes[key] = global_writes[key] or {}
        local entry = global_writes[key]
        entry.stacks = entry.stacks or {}
        local thisstack = '\n'..debugstack()
        local found = false
        for k,v in pairs(entry.stacks) do
            if v == thisstack then
                found = true
                break
            end
        end
        if not found then
            entry.stacks[1+#entry.stacks] = thisstack
        end
    end,
})

internal.WrapGlobalAccess = function()
    local prev_G = getfenv(2)
    if prev_G == real_G then
        setfenv(2, fake_G)
    end
end
internal.WrapGlobalAccess()

------------------------------------------------------------------------------------------------------------------------
-- Libraries
------------------------------------------------------------------------------------------------------------------------

local LTC = LibStub('LibTableCache-1.0')
local LUC = LibStub('LibUnitCache-1.0')
local LSM = LibStub('LibSharedMedia-3.0')
local GUI = LibStub("AceGUI-3.0")
local LSD = LibStub("LibSerpentDump")

------------------------------------------------------------------------------------------------------------------------
-- Addon initialistion
------------------------------------------------------------------------------------------------------------------------

local devMode = false
internal.devMode = devMode
Z:EnableProfiling(devMode)
Z:ProfileFunction(LUC, 'UpdateUnitCache', 'unitcache:UpdateUnitCache')
if devMode then _G['tj'] = Z end

internal.TJ = {}
_G['TJ'] = internal.TJ

------------------------------------------------------------------------------------------------------------------------
-- Local definitions
------------------------------------------------------------------------------------------------------------------------

local printedOnce = {}
local dbglist = {}
local tableNames = {}
local other_errors = {}

------------------------------------------------------------------------------------------------------------------------
-- Printing and debug functions
------------------------------------------------------------------------------------------------------------------------

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

function Z:DevPrint(...)
    if devMode then self:Print("%.3f: %s", debugprofilestop(), fmt(...)) end
end

function Z:OpenDebugWindow(title, data)
    local f = GUI:Create("Frame")
    f:SetCallback("OnClose",function(widget) GUI:Release(widget) end)
    f:SetTitle(title)
    f:SetLayout("Fill")

    local edit = GUI:Create("MultiLineEditBox")
    edit:SetLabel("")
    edit:SetText(data)
    edit:DisableButton(true)
    f:AddChild(edit)
end

function internal.error(header, fulltxt)
    internal.error_thrown = true
    if not tcontains(other_errors, fulltxt) then
        other_errors[1+#other_errors] = fulltxt
        Z:Print('|cFFFF0000Well, this is problematic. It seems Thousand Jabs has encountered an error:|r')
        Z:Print('|cFFFF9900%s|r', header)
        Z:Print('|cFFFF9900Please raise a ticket on the project page on curseforge, and paste the output from the command: |cFFFFFF00/tj ticket|r')
    end
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
-- Debugging
------------------------------------------------------------------------------------------------------------------------

function internal.DBG(...)
    if internal.GetConf("do_debug") then
        if #dbglist == 0 then dbglist[1] = fmt("%s Debug log (|cFF00FFFFhide with /%s _dbg|r):", addonName, consoleCommand) end
        local a = ...
        if type(a) == 'table' and select('#', ...) == 1 then
            for k,v in orderedpairs(a) do
                dbglist[1+#dbglist] = fmt(" - %s = %s", tostring(k), tostring(v))
            end
        else
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

function TJ:DBG(...)
    internal.DBG(...)
end

------------------------------------------------------------------------------------------------------------------------
-- Ticket information
------------------------------------------------------------------------------------------------------------------------

local function tierSelections()
    local specID = GetSpecialization()
    local talents = {}
    for k=1,7 do
        talents[k] = select(10, GetTalentInfoBySpecialization(specID, k, 1)) and 1
            or select(10, GetTalentInfoBySpecialization(specID, k, 2)) and 2
            or select(10, GetTalentInfoBySpecialization(specID, k, 3)) and 3
            or 999
    end
    return tconcat(talents, ', ')
end

local inventorySlots = { "AmmoSlot", "BackSlot", "ChestSlot", "FeetSlot", "Finger0Slot", "Finger1Slot", "HandsSlot", "HeadSlot", "LegsSlot", "MainHandSlot", "NeckSlot", "RangedSlot", "SecondaryHandSlot", "ShirtSlot", "ShoulderSlot", "TabardSlot", "Trinket0Slot", "Trinket1Slot", "WaistSlot", "WristSlot" }
local function equippedItems()
    local slotlinks = {}
    for _,slot in pairs(inventorySlots) do
        local _,inventoryID = pcall(GetInventorySlotInfo, slot)
        if inventoryID then slotlinks[slot] = (GetInventoryItemLink("player", inventoryID) or ''):gsub('|','||') end
    end
    return slotlinks
end

function Z:GenerateDebuggingInformation()
    local export = {
        ['!tj_version'] = GetAddOnMetadata(addonName, "X-Curse-Packaged-Version"),
        ['!wow_build'] = tconcat({ GetBuildInfo() }, ' | '),
        base = {
            player_level = UnitLevel('player'),
            class_info = tconcat({ UnitClass('player') }, ' | '),
            spec_info = tconcat({ GetSpecializationInfo(GetSpecialization()) }, ' | '),
            talent_info = tierSelections(),
        },
        frame = {
            position = { self.actionsFrame:GetPoint() },
            scale = self.actionsFrame:GetScale(),
        },
        errors = {
            global = {
                reads = global_reads,
                writes = global_writes,
            },
            other = other_errors,
        },
        equipped_items = equippedItems(),
        internals = {
            saved_variables = ThousandJabsDB,
            table_cache = {
                allocated = LTC.TableCache.TotalAllocated,
                acquired = LTC.TableCache.TotalAcquired,
                released = LTC.TableCache.TotalReleased,
                used = LTC.TableCache.TotalAcquired - LTC.TableCache.TotalReleased
            },
        },
    }
    if type(export.frame.position[2]) == 'table' and export.frame.position[2].GetName then
        export.frame.position[2] = export.frame.position[2]:GetName()
    end
    return fmt(addonName .. " Diagnostic Information:\n<<code lua>>\n%s\n<</code>>", LSD(export))
end

function Z:ExportDebuggingInformation()
    if InCombatLockdown() then
        self:Print("In combat, cannot open debug information window.")
    else
        self:OpenDebugWindow(addonName .. ' Diagnostic Information', Z:GenerateDebuggingInformation())
    end
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
    end

    self.log_frame:Show()
    self.log_frame.text:Show()
    local f = LSM:Fetch("font", "mplus-1m-bold") or LSM:Fetch("font", "Anonymous Pro Bold (U)")
    if f then self.log_frame.text:SetFont(f, 9, "OUTLINE") end
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

local missingFieldMetatable = {
    __index = function(tbl, key)
        local tableName = (type(tableNames[tbl]) == 'string' and tableNames[tbl] or "UNKNOWN_TABLE")
        local header, errtxt
        local stack = debugstack()
        if type(key) == 'nil' then
            header = fmt('Attempted to index table "%s" with nil key.', tableName)
            errtxt = fmt('%s\n%s', header, stack)
        elseif type(key) == 'table' then
            header = fmt('Attempted to index table "%s" with key of type table.', tableName)
            errtxt = fmt('%s\n%s', header, stack)
        else
            header = fmt('Missing field: "%s"', targetFieldName(tableName, key))
            errtxt = fmt('%s\n%s', header, stack)
        end
        if errtxt and header then
            internal.error(header, errtxt)
            error(header)
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
    internal.SetConf(nil, "position")
    self.actionsFrame:ClearAllPoints()
    self.actionsFrame:SetPoint(internal.GetConf("position", "tgtPoint"), internal.GetConf("position", "offsetX"), internal.GetConf("position", "offsetY"))
    self.actionsFrame:SetMovable(self.movable)
    self.actionsFrame:EnableMouse(self.movable)
end

------------------------------------------------------------------------------------------------------------------------
-- Console command
------------------------------------------------------------------------------------------------------------------------

local function splitargv(str,sep)
    local sep, fields = sep or ":", {}
    local pattern = string.format("([^%s]+)", sep)
    str:gsub(pattern, function(c) fields[#fields+1] = c end)
    return fields
end

function Z:ConsoleCommand(args)
    local argv = splitargv(args, '%s+')
    if argv[1] == "cfg" then
        self:OpenConfigDialog()
    elseif argv[1] == "move" then
        self:ToggleMovement()
    elseif argv[1] == "resetpos" then
        self:ResetPosition()
    elseif argv[1] == 'ticket' then
        self:ExportDebuggingInformation()
    elseif argv[1] == 'blacklist' then
        local action = rawget(self.currentProfile.actions, argv[2])
        if not action then
            self:Print('Error, action "|cFFFF6600%s|r" not found.', argv[2])
        else
            local classID, specID = select(3, UnitClass('player')), GetSpecialization()
            local current = internal.GetConf("class", classID, "spec", specID, "blacklist", argv[2]) and true or false
            local newvalue = not current
            internal.SetConf(newvalue and true or false, "class", classID, "spec", specID, "blacklist", argv[2])
            self:Print('Blacklist |cFFFF6600%s|r=|cFFFFCC00%s|r', argv[2], tostring(newvalue))
            self:QueueUpdate()
        end
    elseif argv[1] == "_dbg" then
        if internal.GetConf("do_debug") then
            internal.SetConf(false, "do_debug")
            self:HideLoggingFrame()
            self:Print('Debugging info disabled. Enable with "|cFFFF6600/%s _dbg|r".', consoleCommand)
        else
            internal.SetConf(true, "do_debug")
            self:ShowLoggingFrame()
            self:Print('Debugging info enabled. Disable with "|cFFFF6600/%s _dbg|r".', consoleCommand)
        end
    elseif argv[1] == '_dtc' then
        self:Print('Dumping table cache metrics:')
        self:Print(' - Total allocated: %d, total acquired: %d, total released: %d, total in-use: %d',
            LTC.TableCache.TotalAllocated, LTC.TableCache.TotalAcquired, LTC.TableCache.TotalReleased, LTC.TableCache.TotalAcquired - LTC.TableCache.TotalReleased)
    elseif argv[1] == '_dbe' then
        self:OpenDebugWindow(addonName .. ' SavedVariables Export', LSD(ThousandJabsDB))
    elseif argv[1] == '_duc' then
        self:Print('Dumping unit cache table:')
        if not IsAddOnLoaded('Blizzard_DebugTools') then LoadAddOn('Blizzard_DebugTools') end
        DevTools_Dump{unitCache=LUC.unitCache}
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
        self:Print('     |cFFFF6600/%s _dbg|r - Toggles debug information visibility.', consoleCommand)
        self:Print('     |cFFFF6600/%s _dtc|r - Dumps table cache information.', consoleCommand)
        self:Print('     |cFFFF6600/%s _dbe|r - Export SavedVariables table.', consoleCommand)
        self:Print('     |cFFFF6600/%s _duc|r - Dumps unit cache table.', consoleCommand)
        self:Print('     |cFFFF6600/%s _mem|r - Dumps addon memory usage.', consoleCommand)
    end
end
Z:RegisterChatCommand(consoleCommand, 'ConsoleCommand')
