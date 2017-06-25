local addonName = ...

local GetSpecialization = GetSpecialization
local GetSpecializationInfo = GetSpecializationInfo
local UnitClass = UnitClass
local select = select

LibStub('LibSandbox-5.0'):UseSandbox(addonName)

Engine.callbacks = TJ:AttachCallbackSystem(Engine)

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

        local className = select(1, GetClassInfo(profile.classID))
        local specName = select(2, GetSpecializationInfo(profile.specID))
        self:InvokeCallback('ProfileActivated', profile.classID, profile.specID)
    end
end

function Engine:DeactivateProfile()
    local profile = self.activeProfile
    if profile then
        profile:Deactivate()
        self.activeProfile = nil

        local className = select(1, GetClassInfo(profile.classID))
        local specName = select(2, GetSpecializationInfo(profile.specID))
        self:InvokeCallback('ProfileDeactivated', profile.classID, profile.specID)
    end
end
