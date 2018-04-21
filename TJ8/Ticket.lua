--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Alpha only.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(4, GetBuildInfo()) < 80000 then
    return
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Module init.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local addonName, tj, _ = ...
local LibStub = LibStub
local TJ = tj.TJ
local Config = tj.Config

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Locals
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local GetAddOnMetadata = GetAddOnMetadata
local GetBuildInfo = GetBuildInfo
local GetInventoryItemLink = GetInventoryItemLink
local GetInventorySlotInfo = GetInventorySlotInfo
local GetLocale = GetLocale
local GetSpecialization = GetSpecialization
local GetSpecializationInfo = GetSpecializationInfo
local GetTalentInfoBySpecialization = GetTalentInfoBySpecialization
local InCombatLockdown = InCombatLockdown
local pairs = pairs
local pcall = pcall
local select = select
local tconcat = table.concat
local UnitClass = UnitClass
local UnitEffectiveLevel = UnitEffectiveLevel
local UnitLevel = UnitLevel

local LSD = LibStub('LibTJSerpentDump-8.0')
local TableCache = LibStub('LibTJTableCache-8.0')

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sandbox
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
LibStub('LibTJSandbox-8.0'):Use(addonName)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Ticket information
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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

    local function copiesExport()
        if not devMode then return nil end
        local s = ''
        local t1 = CT()
        for filename,list in TJ:OrderedPairsTC(TJ.errors.globalReadNames, t1) do
            if list then
                s = s .. TJ:Format('\n-- %s\n', filename)
                local t2 = CT()
                for k,v in TJ:OrderedPairsTC(list, t2) do
                    s = s .. TJ:Format("local %s = %s\n", k, k)
                end
            end
        end
        return s:len() > 0 and (s..'\n') or s
    end

    function TJ:GenerateDebuggingInformation()
        local export = {
            ['!tj_version'] = GetAddOnMetadata(addonName, "Version"),
            ['!wow_build'] = tconcat({ GetBuildInfo() }, ' | '),
            ['!wow_locale'] = GetLocale(),
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
                    reads = TJ.errors.globalReads,
                    writes = TJ.errors.globalWrites,
                },
                other = TJ.errors.otherErrors,
            },
            equippedItems = equippedItems(),
            internals = {
                devMode = devMode,
                savedVariables = ThousandJabsDB,
                tableCache = TableCache:GetMetrics(),
                globalReadNames = copiesExport(),
            },
        }
        --if export.frame.position and type(export.frame.position[2]) == 'table' and export.frame.position[2].GetName then
        --export.frame.position[2] = export.frame.position[2]:GetName()
        --end
        return export
    end

    function TJ:ExportDebuggingInformation()
        if InCombatLockdown() then
            TJ:Print("In combat, cannot open debug information window.")
        else
            local export = TJ:GenerateDebuggingInformation()
            TJ:ShowInfoDialog(TJ:Format('%s Diagnostic Information', addonName), TJ:Format("%s Diagnostic Information:\n%s", addonName, LSD(export)))
        end
    end
end

TJ:RegisterCommandHandler('ticket', 'Opens a window containing information required for lodging tickets.', function()
    TJ:ExportDebuggingInformation()
end)