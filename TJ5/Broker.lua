local addonName = ...

local LDB = LibStub("LibDataBroker-1.1", true)
if not LDB then return end

LibStub('LibSandbox-5.0'):UseSandbox('TJ5')

local broker_OnClick = function(_, button)
    if button == "LeftButton" then
        Config:OpenDialog()
    elseif button == "RightButton" then
        if IsRightShiftKeyDown() and IsRightControlKeyDown() and IsRightAltKeyDown() then
            if Broker.updateText then
                Broker.updateText = false
                Broker.dataObj.text = addonName
                Broker.updateTime = nil
            else
                Broker.updateText = true
                Broker.dataObj.text = addonName..": Collecting usage statistics..."
                Broker.updateTime = nil
            end
        else
            Config:OpenDialog()
        end
    end
end

function Broker:OnLogin()
    local broker = self
    self.dataObj = LDB:NewDataObject(addonName, {
        icon  = "Interface\\Icons\\ability_monk_jab",
        label = addonName,
        text  = addonName,
        type  = "data source",
        OnClick = broker_OnClick,
    })
end
TJ.RegisterCallback(Broker, 'OnLogin')
