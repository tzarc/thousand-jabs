local addonName, internal = ...;

local devMode = false
local consoleCommand = 'tj'

------------------------------------------------------------------------------------------------------------------------
-- Addon definition
------------------------------------------------------------------------------------------------------------------------

local TJ = LibStub('AceAddon-3.0'):NewAddon(addonName, 'AceConsole-3.0', 'AceEvent-3.0')
internal.TJ = TJ

------------------------------------------------------------------------------------------------------------------------
-- Module definitions
------------------------------------------------------------------------------------------------------------------------

local Config = TJ:NewModule('Config')
local Profiling = TJ:NewModule('Profiling')
local TableCache = TJ:NewModule('TableCache')
local UnitCache = TJ:NewModule('UnitCache', 'AceEvent-3.0')
local UI = TJ:NewModule('UI')

------------------------------------------------------------------------------------------------------------------------
-- Initialisation
------------------------------------------------------------------------------------------------------------------------

internal.devMode = devMode
internal.consoleCommand = consoleCommand
if internal.devMode then _G['tj'] = TJ end

------------------------------------------------------------------------------------------------------------------------
-- Locals
------------------------------------------------------------------------------------------------------------------------

local LSD = LibStub("LibSerpentDump")
local LSM = LibStub('LibSharedMedia-3.0')
local GUI = LibStub("AceGUI-3.0")

local _G = _G
local debugstack = debugstack
local format = string.format
local getfenv = getfenv
local pairs = pairs
local pcall = pcall
local print = print
local select = select
local setfenv = setfenv
local setmetatable = setmetatable
local strgmatch = string.gmatch
local strmatch = string.match
local strsub = string.sub
local tconcat = table.concat
local tcontains = tContains
local tinsert = table.insert
local tostring = tostring
local tsort = table.sort
local type = type
local wipe = wipe
local CreateFrame = CreateFrame
local GetAddOnMetadata = GetAddOnMetadata
local GetBuildInfo = GetBuildInfo
local GetInventoryItemLink = GetInventoryItemLink
local GetInventorySlotInfo = GetInventorySlotInfo
local GetSpecialization = GetSpecialization
local GetSpecializationInfo = GetSpecializationInfo
local GetTalentInfoBySpecialization = GetTalentInfoBySpecialization
local InCombatLockdown = InCombatLockdown
local UnitClass = UnitClass
local UnitLevel = UnitLevel

local debugLines = {}
local otherErrors = {}
local globalReads = {}
local globalWrites = {}
local globalExcludes = { 'UIParent', addonName..'DB' }

------------------------------------------------------------------------------------------------------------------------
-- Global read/write logging
------------------------------------------------------------------------------------------------------------------------

local function split(str, delim)
    local result, pattern, lastPos = {}, "(.-)" .. delim .. "()", 1
    for part, pos in strgmatch(str, pattern) do
        tinsert(result, part)
        lastPos = pos
    end
    tinsert(result, strsub(str, lastPos))
    return result
end
local function where(tbl, pattern)
    local result = {}
    for k,v in pairs(tbl) do
        if strmatch(v, pattern) then
            tinsert(result, v)
        end
    end
    return result
end

local real_G = _G
local fake_G = setmetatable({}, {
    __index = function(tbl,key)
        local val = real_G[key]
        if tcontains(globalExcludes, key) then return val end
        if not internal.devMode and val ~= nil then return val end
        globalReads[key] = globalReads[key] or {}
        local entry = globalReads[key]
        entry.stacks = entry.stacks or {}
        local firstLine = strgmatch(debugstack(2), '(.-)\n()')()
        local thisstack = ('Global read of "%s": %s'):format(tostring(key), firstLine);
        local found = false
        for k,v in pairs(entry.stacks) do
            if v == thisstack then
                found = true
                break
            end
        end
        if not found then
            entry.stacks[1+#entry.stacks] = thisstack
            tsort(entry.stacks)
        end
        if internal.devMode and val ~= nil then return val end
        return nil
    end,
    __newindex = function(tbl,key,val)
        real_G[key] = val
        if tcontains(globalExcludes, key) then return val end
        globalWrites[key] = globalWrites[key] or {}
        local entry = globalWrites[key]
        entry.stacks = entry.stacks or {}
        local firstLine = strgmatch(debugstack(2), '(.-)\n()')()
        local thisstack = ('Global write of "%s": %s'):format(tostring(key), firstLine);
        local found = false
        for k,v in pairs(entry.stacks) do
            if v == thisstack then
                found = true
                break
            end
        end
        if not found then
            entry.stacks[1+#entry.stacks] = thisstack
            tsort(entry.stacks)
        end
        return val
    end,
})

TJ.fake_G = fake_G

function internal.Safety()
    local prev_G = getfenv(2)
    if prev_G == real_G then
        setfenv(2, fake_G)
    end
end

internal.Safety()

------------------------------------------------------------------------------------------------------------------------
-- Error handling
------------------------------------------------------------------------------------------------------------------------

function internal.error(fulltxt)
    if not tcontains(otherErrors, fulltxt) then
        otherErrors[1+#otherErrors] = fulltxt
        if not internal.errorThrown then
            print('|cFFFF0000Well, this is problematic. It seems Thousand Jabs has encountered an error:|r')
            print('|cFFFF9900Please raise a ticket on the project page on curseforge, and paste the output from the command: |cFFFFFF00/tj ticket|r')
        end
    end
    internal.errorThrown = true
end

------------------------------------------------------------------------------------------------------------------------
-- Helpers
------------------------------------------------------------------------------------------------------------------------

function internal.fmt(f, ...)
    return ((select('#', ...) > 0) and f:format(...) or (type(f) == 'string' and f) or tostring(f) or '')
end

function internal.orderedpairs(t, f)
    local a = {}
    for n in pairs(t) do tinsert(a, n) end
    tsort(a, f)
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

------------------------------------------------------------------------------------------------------------------------
-- Debugging
------------------------------------------------------------------------------------------------------------------------

function internal.Debug(...)
    if Config:Get("do_debug") then
        if #debugLines == 0 then debugLines[1] = internal.fmt("|cFFFFFFFF%s Debug log|r (|cFF00FFFFhide with /%s _dbg|r):", addonName, internal.consoleCommand) end
        local a = ...
        if type(a) == 'table' and select('#', ...) == 1 then
            for k,v in internal.orderedpairs(a) do
                debugLines[1+#debugLines] = internal.fmt(" - %s = %s", tostring(k), tostring(v))
            end
        else
            debugLines[1+#debugLines] = internal.fmt(...)
        end
    end
end

function internal.DebugReset()
    wipe(debugLines)
end

function internal.DebugString()
    return tconcat(debugLines, '\n')
end

function TJ:OpenDebugWindow(title, data)
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

------------------------------------------------------------------------------------------------------------------------
-- Logging frame
------------------------------------------------------------------------------------------------------------------------

function TJ:ShowLoggingFrame()
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
        self.log_frame.text:SetTextColor(0.7, 0.7, 0.7, 1.0)
    end

    self.log_frame:Show()
    self.log_frame.text:Show()
    local f = LSM:Fetch("font", "mplus-1m-bold") or LSM:Fetch("font", "Anonymous Pro Bold (U)")
    if f then self.log_frame.text:SetFont(f, 9, "OUTLINE") end
end

function TJ:HideLoggingFrame()
    if self.log_frame then
        self.log_frame:Hide()
    end
end

function TJ:UpdateLog()
    if Config:Get("do_debug") and self.log_frame then
        if Profiling:ProfilingEnabled() then
            self.log_frame.text:SetText(Profiling:GetProfilingString() .. '\n\n' .. internal.DebugString())
        else
            self.log_frame.text:SetText(internal.DebugString())
        end
    end
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

function TJ:GenerateDebuggingInformation()
    local totalAllocated, totalAcquired, totalReleased = TableCache:GetMetrics()
    local export = {
        ['!tj_version'] = GetAddOnMetadata(addonName, "Version"),
        ['!wow_build'] = tconcat({ GetBuildInfo() }, ' | '),
        base = {
            playerLevel = UnitLevel('player'),
            classInfo = tconcat({ UnitClass('player') }, ' | '),
            specInfo = tconcat({ GetSpecializationInfo(GetSpecialization()) }, ' | '),
            talentInfo = tierSelections(),
        },
        frame = {
            position = { UI:GetPoint() },
            scale = UI:GetScale(),
        },
        errors = {
            global = {
                reads = globalReads,
                writes = globalWrites,
            },
            other = otherErrors,
        },
        equippedItems = equippedItems(),
        internals = {
            savedVariables = ThousandJabsDB,
            tableCache = {
                allocated = totalAllocated,
                acquired = totalAcquired,
                released = totalReleased,
                used = totalAcquired - totalReleased
            },
        },
    }
    if type(export.frame.position[2]) == 'table' and export.frame.position[2].GetName then
        export.frame.position[2] = export.frame.position[2]:GetName()
    end
    return internal.fmt(addonName .. " Diagnostic Information:\n%s", LSD(export))
end

function TJ:ExportDebuggingInformation()
    if InCombatLockdown() then
        self:Print("In combat, cannot open debug information window.")
    else
        self:OpenDebugWindow(addonName .. ' Diagnostic Information', TJ:GenerateDebuggingInformation())
    end
end
