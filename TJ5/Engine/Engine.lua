local addonName = ...

local GetSpecialization = GetSpecialization
local GetSpecializationInfo = GetSpecializationInfo
local UnitClass = UnitClass
local select = select

LibStub('LibSandbox-5.0'):UseSandbox(addonName)

function Engine:CurrentProfile()
    local classID = select(3, UnitClass('player'))
    local specID = GetSpecialization()
    return self.allProfiles and self.allProfiles[classID] and self.allProfiles[classID][specID]
end

function Engine:ActivateProfile()
    self:DeactivateProfile()

    local profile = self:CurrentProfile()
    if profile then
        self.activeProfile = profile
        profile:Activate()
        TJ:Notify('ProfileActivated', profile.classID, profile.specID)
    end
end

function Engine:DeactivateProfile()
    local profile = self.activeProfile
    if profile then
        profile:Deactivate()
        self.activeProfile = nil
        TJ:Notify('ProfileDeactivated', profile.classID, profile.specID)
    end
end
