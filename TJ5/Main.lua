local addonName = ...

local GetSpecialization = GetSpecialization
local UnitClass = UnitClass
local select = select

local LSD = LibStub("LibSerpentDump")

LibStub('LibSandbox-5.0'):UseSandbox(addonName)

function TJ:OnLogin()
    TJ:DevPrint("Player logged in.")
    UI:OnLogin()

    Engine.RegisterCallback(self, 'ProfileActivated')
    Engine.RegisterCallback(self, 'ProfileDeactivated')
    Engine:ActivateProfile()
end

function TJ:ProfileActivated(callback, classID, specID)
    -- Set up event listeners
    TJ:DevPrint("Activated profile: %d/%d", classID, specID)
end

function TJ:ProfileDeactivated(callback, classID, specID)
    -- Stop event listeners
    TJ:DevPrint("Deactivated profile: %d/%d", classID, specID)
end
