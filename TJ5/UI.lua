local addonName = ...

LibStub('LibSandbox-5.0'):UseSandbox(addonName)

function UI:OnLogin()
    TJ.RegisterCallback(self, 'ProfileActivated')
    TJ.RegisterCallback(self, 'ProfileDeactivated')
end
TJ.RegisterCallback(UI, 'OnLogin')

function UI:ProfileActivated(_, classID, specID)
    -- Show UI
    TJ:DevPrint('UI activated')
end

function UI:ProfileDeactivated(_, classID, specID)
    -- Hide UI
    TJ:DevPrint('UI deactivated')
end
