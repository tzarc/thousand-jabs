local addonName = ...

local GetSpecialization = GetSpecialization
local UnitClass = UnitClass
local select = select

local LSD = LibStub("LibSerpentDump-5.0")

LibStub('LibSandbox-5.0'):UseSandbox(addonName)

function TJ:OnLogin()
    TJ:DevPrint("Player logged in.")
    TJ:RegisterCallback('ProfileActivated')
    TJ:RegisterCallback('ProfileDeactivated')

    TJ:RegisterCallback('TempCallback')

    TJ:Notify('OnLogin')

    Engine:ActivateProfile()
end

function TJ:ProfileActivated(_, classID, specID)
    -- Set up event listeners
    TJ:DevPrint("Activated profile: %d/%d", classID, specID)
end

function TJ:ProfileDeactivated(_, classID, specID)
    -- Stop event listeners
    TJ:DevPrint("Deactivated profile: %d/%d", classID, specID)
end

function TJ:TempCallback(_, A, B)
    local t = CT()
    t.A = A
    t.B = B
    RT(t)
end
