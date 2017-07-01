local addonName, addonTable = ...

local GetAddOnMetadata = GetAddOnMetadata
local GetBuildInfo = GetBuildInfo
local GetInventoryItemLink = GetInventoryItemLink
local GetInventorySlotInfo = GetInventorySlotInfo
local GetLocale = GetLocale
local GetSpecialization = GetSpecialization
local GetSpecializationInfo = GetSpecializationInfo
local GetTalentInfoBySpecialization = GetTalentInfoBySpecialization
local InCombatLockdown = InCombatLockdown
local otherErrors = otherErrors
local pairs = pairs
local pcall = pcall
local select = select
local tconcat = table.concat
local tinsert = table.insert
local tsort = table.sort
local UnitClass = UnitClass
local UnitEffectiveLevel = UnitEffectiveLevel
local UnitLevel = UnitLevel

local LSD = LibStub("LibSerpentDump-5.0")

local BugGrabber = BugGrabber

LibStub('LibSandbox-5.0'):UseSandbox('TJ5')

------------------------------------------------------------------------------------------------------------------------
-- Ticket information
------------------------------------------------------------------------------------------------------------------------

do
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
            local ok, inventoryID = pcall(GetInventorySlotInfo, slot)
            if ok and inventoryID then slotlinks[slot] = (GetInventoryItemLink("player", inventoryID) or ''):gsub('|','||') end
        end
        return slotlinks
    end

    local function bindings()
        local binds = {}
        for i=1,120 do
            local _, spellID
            local actionType, actionID = GetActionInfo(i)
            if actionType == "macro" then
                _, _, spellID = GetMacroSpell(actionID)
            elseif actionType == "spell" then
                spellID = actionID
            end
            binds[tostring(i)] = spellID and { spellID, spellID and GetSpellInfo(spellID) or '' } or nil
        end
        return binds
    end

    local function copiesExport()
        if not devMode then return nil end
        local s = ''
        for filename,list in TJ:OrderedPairs(TJ.globalReadNames) do
            if list then
                s = s .. TJ:Format('\n-- %s\n', filename)
                for k,v in TJ:OrderedPairs(list) do
                    s = s .. TJ:Format("local %s = %s\n", k, k)
                end
            end
        end
        return s:len() > 0 and (s..'\n') or s
    end

    function TJ:GenerateDebuggingInformation()
        local totalAllocated, totalAcquired, totalReleased = TableCache:GetMetrics()
        local export = {
            ['!tj_version'] = GetAddOnMetadata(addonName, "Version"),
            ['!wow_build'] = tconcat({ GetBuildInfo() }, ' | '),
            ['!wow_locale'] = GetLocale(),
            bugGrabber = devMode and BugGrabber and BugGrabber:GetDB() or nil,
            base = {
                playerLevel = UnitLevel('player'),
                playerEffectiveLevel = UnitEffectiveLevel('player'),
                classInfo = tconcat({ UnitClass('player') }, ' | '),
                specInfo = tconcat({ GetSpecializationInfo(GetSpecialization()) }, ' | '),
                talentInfo = tierSelections(),
            },
            frame = {
            --position = { UI:GetPoint() },
            --scale = UI:GetScale(),
            },
            errors = {
                global = {
                    reads = TJ.globalReads,
                    writes = TJ.globalWrites,
                },
                other = TJ.otherErrors,
            },
            equippedItems = equippedItems(),
            internals = {
                devMode = devMode,
                savedVariables = TJ5DB,
                tableCache = {
                    allocated = totalAllocated,
                    acquired = totalAcquired,
                    released = totalReleased,
                    used = totalAcquired - totalReleased
                },
                globalReadNames = copiesExport(),
            },
        }
        if export.frame.position and type(export.frame.position[2]) == 'table' and export.frame.position[2].GetName then
            export.frame.position[2] = export.frame.position[2]:GetName()
        end
        return export
    end

    function TJ:ExportDebuggingInformation()
        if InCombatLockdown() then
            TJ:Print("In combat, cannot open debug information window.")
        else
            local export = TJ:GenerateDebuggingInformation()
            TJ:OpenDebugWindow(TJ:Format('%s Diagnostic Information', addonName), TJ:Format("%s Diagnostic Information:\n%s", addonName, LSD(export)))
        end
    end
end

TJ:RegisterCommandHandler('ticket', 'Opens a window containing information required for lodging tickets.', function()
    TJ:ExportDebuggingInformation()
end)
