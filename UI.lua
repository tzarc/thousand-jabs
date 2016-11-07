local addonName, internal = ...;

local Z = internal.Z
local LibStub = LibStub
local UI = LibStub('AceAddon-3.0'):GetAddon(addonName):NewModule('UI')
local LDB = LibStub("LibDataBroker-1.1")

internal.WrapGlobalAccess()

-- Geometry
local stFrameSizes = { 80, 60, 40, 30 }
local cleaveFrameSizes = { 40, 25 }
local aoeFrameSizes = { 35, 20 }
local padding = 4
local totalWidth = padding * 7 + aoeFrameSizes[1] + cleaveFrameSizes[1] + stFrameSizes[1] + stFrameSizes[2] + stFrameSizes[3] + stFrameSizes[4]

function UI:OnInitialize()
    -- LDB object
    if LDB then
        internal.dataobj = LDB:NewDataObject(addonName, {
            icon  = "Interface\\Icons\\ability_monk_jab",
            label = "Thousand Jabs",
            text  = "Thousand Jabs",
            type  = "data source",
            OnClick = function(_, button)
                if button == "LeftButton" then
                    Z:OpenConfigDialog()
                elseif button == "RightButton" then
                    if IsRightShiftKeyDown() and IsRightControlKeyDown() and IsRightAltKeyDown() then
                        if internal.updateBrokerText then
                            internal.updateBrokerText = false
                            internal.dataobj.text = "Thousand Jabs"
                            internal.statUpdateTime = nil
                        else
                            internal.updateBrokerText = true
                            internal.dataobj.text = "Thousand Jabs: Collecting usage statistics..."
                            internal.statUpdateTime = nil
                        end
                    else
                        Z:OpenConfigDialog()
                    end
                end
            end,
        })
    end

    -- Masque theming
    local MSQ = LibStub('Masque', true)
    if MSQ then
        MSQ:Register(addonName, function(_, group, skinID, gloss, backdrop, colours, isDisabled)
            if isDisabled then
                for btn in pairs(MSQ:Group(addonName, group).Buttons) do
                    UI:ApplyDefaultTheming(btn)
                end
            end
        end)
    else
        return true
    end
end

function UI:ApplyDefaultTheming(button)
    button:SetParent(button.parent)
    button:SetWidth(button.originalSize)
    button:SetHeight(button.originalSize)
    button:ClearAllPoints()
    button:SetPoint(button.bindPoint, button:GetParent(), button.bindPoint, button.xOffset, button.yOffset)

    -- Create the texture
    local icon = button and button.icon or button:CreateTexture(button:GetName()..'Overlay', 'OVERLAY')
    if not icon:GetTexture() then
        icon:SetTexture('Interface\\Icons\\spell_holy_borrowedtime')
    end
    icon:ClearAllPoints()
    icon:SetAllPoints()
    button.icon = icon

    local floatingBG = _G[button:GetName()..'FloatingBG']
    if floatingBG then
        floatingBG:Hide()
    end
end

function UI:CreateFrames()
    -- Create the base frame
    local baseFrame = CreateFrame('Frame', 'ThousandJabs', UIParent)
    baseFrame:ClearAllPoints()
    baseFrame:SetBackdrop({
        bgFile = 'Interface\\Tooltips\\UI-Tooltip-Background',
        edgeFile = nil,
        tile = true,
        tileSize = 4,
        edgeSize = 0,
    })
    baseFrame:SetBackdropColor(0, 0, 0, internal.GetConf("backgroundOpacity"))
    baseFrame:SetPoint('CENTER', UIParent)
    baseFrame:Show()

    -- Create the icon frames
    baseFrame.iconFrames = self:CreateIconFrames(baseFrame)

    -- Set the geometry of the base frame
    baseFrame:SetWidth(totalWidth)
    baseFrame:SetHeight(padding + stFrameSizes[1] + padding)
    baseFrame:ClearAllPoints()
    baseFrame:SetPoint(internal.GetConf("position", "tgtPoint"), internal.GetConf("position", "offsetX"), internal.GetConf("position", "offsetY"))
    baseFrame:SetScale(internal.GetConf("scale"))
    baseFrame:Hide()

    return baseFrame
end

function UI:CreateIconFrames(parent)
    local frames = { singleTarget = {}, cleave = {}, aoe = {} }
    frames.cooldown = CreateFrame('Cooldown', addonName..'_ST1Cooldown', parent, 'CooldownFrameTemplate')
    -- Create the icon frames
    local aoeHeight = aoeFrameSizes[1] + padding + aoeFrameSizes[2]
    local cleaveHeight = cleaveFrameSizes[1] + padding + cleaveFrameSizes[2]
    local xPos = padding
    local yPos = (-0.5*stFrameSizes[1])-padding + aoeHeight*0.5
    frames.aoe[1] = self:CreateSingleIconFrame(addonName..'_AoE1', parent, aoeFrameSizes[1], xPos + 0.5*aoeFrameSizes[1] - 0.5*aoeFrameSizes[1], yPos)
    frames.aoe[2] = self:CreateSingleIconFrame(addonName..'_AoE2', parent, aoeFrameSizes[2], xPos + 0.5*aoeFrameSizes[1] - 0.5*aoeFrameSizes[2], yPos - padding - aoeFrameSizes[1])
    xPos = xPos + aoeFrameSizes[1] + padding
    yPos = (-0.5*stFrameSizes[1])-padding + cleaveHeight*0.5
    frames.cleave[1] = self:CreateSingleIconFrame(addonName..'_Cleave1', parent, cleaveFrameSizes[1], xPos + 0.5*cleaveFrameSizes[1] - 0.5*cleaveFrameSizes[1], yPos)
    frames.cleave[2] = self:CreateSingleIconFrame(addonName..'_Cleave2', parent, cleaveFrameSizes[2], xPos + 0.5*cleaveFrameSizes[1] - 0.5*cleaveFrameSizes[2], yPos - padding - cleaveFrameSizes[1])
    xPos = xPos + cleaveFrameSizes[1] + padding
    for i=1,4 do
        frames.singleTarget[#frames.singleTarget+1] = self:CreateSingleIconFrame(addonName..'_ST'..i, parent, stFrameSizes[i], xPos, (0.5*stFrameSizes[i]) - (0.5*stFrameSizes[1]) - padding)
        xPos = xPos + stFrameSizes[i] + padding
    end

    -- Create the cooldown frame
    frames.cooldown:SetAllPoints(frames.singleTarget[1])
    return frames
end

function UI:CreateSingleIconFrame(name, parent, size, xOffset, yOffset, bindPoint)
    bindPoint = bindPoint or 'TOPLEFT'
    -- Create the background frame for this icon
    local btn = CreateFrame('Button', name, parent)
    btn.parent = parent
    btn.originalSize = size
    btn.bindPoint = bindPoint
    btn.xOffset = xOffset
    btn.yOffset = yOffset
    UI:ApplyDefaultTheming(btn)
    btn:EnableMouse(false)
    btn:Show()

    local MSQ = LibStub('Masque', true)
    if MSQ then
        local group = MSQ:Group(addonName, 'Actions')
        group:AddButton(btn, {Icon = btn.icon})
        if group.db.disabled then
            self:ApplyDefaultTheming(btn)
        end
    end

    return btn
end
