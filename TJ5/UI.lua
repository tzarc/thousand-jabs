local addonName = ...

LibStub('LibSandbox-5.0'):UseSandbox(addonName)

function UI:OnLogin()
    Engine.RegisterCallback(self, 'ProfileActivated')
    Engine.RegisterCallback(self, 'ProfileDeactivated')
end

function UI:ProfileActivated(callback, classID, specID)
    -- Show UI
    TJ:DevPrint('UI activated')
end

function UI:ProfileDeactivated(callback, classID, specID)
    -- Hide UI
    TJ:DevPrint('UI deactivated')
end
