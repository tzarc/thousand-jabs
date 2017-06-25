local addonName = ...

LibStub('LibSandbox-5.0'):UseSandbox(addonName)

function TJ:OnLogin()
    self:DevPrint("Player has logged in.")
end
