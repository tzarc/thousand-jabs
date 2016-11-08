local addonName, internal = ...;

local Z = internal.Z
local LibStub = LibStub
local UI = LibStub('AceAddon-3.0'):GetAddon(addonName):NewModule('UI')
local LDB = LibStub("LibDataBroker-1.1")

internal.WrapGlobalAccess()

local padding = 4

UI.SINGLE_TARGET = 1
UI.CLEAVE = 2
UI.AOE = 3

-- Geometry
local frameSize = {
    [UI.SINGLE_TARGET] = { 80, 60, 40, 30 },
    [UI.CLEAVE] = { 40, 25 },
    [UI.AOE] = { 35, 20 },
}

local actionFrames = {
    actions = {
        [UI.SINGLE_TARGET] = {},
        [UI.CLEAVE] = {},
        [UI.AOE] = {},
    },
    containers = {},
    baseFrame = nil,
}

local function CreateContainer(isVertical, parent, frameName)
    local frame = CreateFrame("Frame", frameName, parent)
    local childElements = {}

    frame.isVertical = isVertical
    frame.childElements = childElements

    frame.AddElement = function(self, e)
        childElements[1+#childElements] = e
    end

    frame.ReapplyLayout = function(self)
        local padding = internal.GetConf("padding")
        frame:ClearAllPoints()
        local totalWidth = 0
        local totalHeight = 0
        local first = nil
        local last = nil
        for i=1,#childElements do
            local e = childElements[i]
            if frame.isVertical and e:IsVisible() then
                if not first then first = e end
                last = e
                if totalWidth < e:GetWidth() then totalWidth = e:GetWidth() end
                totalHeight = totalHeight + e:GetHeight() + (i == #childElements and 0 or padding)
            elseif e:IsVisible() then
                if not first then first = e end
                last = e
                totalWidth = totalWidth + e:GetWidth() + (i == #childElements and 0 or padding)
                if totalHeight < e:GetHeight() then totalHeight = e:GetHeight() end
            end
        end

        frame:SetWidth(totalWidth)
        frame:SetHeight(totalHeight)

        local pointA = frame.isVertical and 'TOP' or 'LEFT'
        local pointB = frame.isVertical and 'BOTTOM' or 'RIGHT'

        local xPad = frame.isVertical and 0 or padding
        local yPad = frame.isVertical and -padding or 0

        local prev = nil
        for i=1,#childElements do
            local e = childElements[i]
            if e:IsVisible() then
                e:ClearAllPoints()
                if e == first then
                    e:SetPoint(pointA, frame, pointA)
                elseif e == last then
                    e:SetPoint(pointA, prev, pointB, xPad, yPad)
                    e:SetPoint(pointB, frame, pointB)
                else
                    e:SetPoint(pointA, prev, pointB, xPad, yPad)
                end
                prev = e
            end
        end
    end

    frame:Show()

    return frame
end

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
            UI:ReapplyLayout(true)
        end)
    else
        return true
    end
end

function UI:SetActionTexture(actionType, actionIndex, texture)
    local actions = actionFrames.actions[actionType]
    if actions then
        local button = actions[actionIndex]
        if button then
            button.icon:SetTexture(texture)
        end
    end
end

function UI:Show()
    actionFrames.backdrop:Show()
end

function UI:Hide()
    actionFrames.backdrop:Hide()
end

function UI:SetMovable(enabled)
    actionFrames.backdrop:SetMovable(enabled)
end

function UI:GetPoint(...)
    return actionFrames.backdrop:GetPoint(...)
end

function UI:GetScale()
    return actionFrames.backdrop:GetScale()
end

function UI:EnableMouse(enabled)
    actionFrames.backdrop:EnableMouse(enabled)
end

function UI:SetScript(event, func)
    actionFrames.backdrop:SetScript(event, func)
end

function UI:SetCooldown(start, duration)
    actionFrames.cooldown:SetCooldown(start, duration)
end

function UI:UpdateAlpha()
    local inCombat = InCombatLockdown()
    actionFrames.backdrop:SetAlpha(inCombat and internal.GetConf("inCombatAlpha") or internal.GetConf("outOfCombatAlpha"))
end

function UI:ReapplyLayout(skipMasque)
    actionFrames.containers[UI.SINGLE_TARGET]:ReapplyLayout()

    if internal.GetConf('showCleave') then
        actionFrames.containers[UI.CLEAVE]:Show()
        actionFrames.containers[UI.CLEAVE]:ReapplyLayout()
    else
        actionFrames.containers[UI.CLEAVE]:Hide()
    end

    if internal.GetConf('showAoE') then
        actionFrames.containers[UI.AOE]:Show()
        actionFrames.containers[UI.AOE]:ReapplyLayout()
    else
        actionFrames.containers[UI.AOE]:Hide()
    end

    actionFrames.baseFrame:ReapplyLayout()

    if not skipMasque then
        -- Reapply masque skin if appropriate
        local MSQ = LibStub("Masque", true)
        if MSQ then
            MSQ:Group(addonName, "Actions"):ReSkin()
        end
    end

    actionFrames.baseFrame:SetPoint("CENTER", actionFrames.backdrop, "CENTER")
    actionFrames.backdrop:SetWidth(actionFrames.baseFrame:GetWidth() + (2 * internal.GetConf("padding")))
    actionFrames.backdrop:SetHeight(actionFrames.baseFrame:GetHeight() + (2 * internal.GetConf("padding")))

    actionFrames.backdrop:SetPoint(internal.GetConf("position", "tgtPoint"), internal.GetConf("position", "offsetX"), internal.GetConf("position", "offsetY"))
    actionFrames.backdrop:SetScale(internal.GetConf("scale"))
    actionFrames.backdrop:SetBackdropColor(0, 0, 0, internal.GetConf("backgroundOpacity"))
end

function UI:CreateFrames()
    if actionFrames.baseFrame then return end

    -- Create the backdrop
    actionFrames.backdrop = CreateFrame('Frame', addonName.."Backdrop", UIParent)
    actionFrames.backdrop:SetBackdropColor(0, 0, 0, internal.GetConf("backgroundOpacity"))
    actionFrames.backdrop:SetPoint('CENTER', UIParent)
    actionFrames.backdrop:Show()
    actionFrames.backdrop:SetBackdrop({
        bgFile = 'Interface\\Tooltips\\UI-Tooltip-Background',
        edgeFile = nil,
        tile = true,
        tileSize = 4,
        edgeSize = 0,
    })

    local orientation = false -- true = vertical -- todo, make this an option?

    -- Create the base frame
    actionFrames.baseFrame = CreateContainer(orientation, actionFrames.backdrop, addonName)

    -- Create the icon frames
    actionFrames.containers[UI.SINGLE_TARGET] = CreateContainer(orientation, actionFrames.baseFrame)
    actionFrames.containers[UI.CLEAVE] = CreateContainer(not orientation, actionFrames.baseFrame)
    actionFrames.containers[UI.AOE] = CreateContainer(not orientation, actionFrames.baseFrame)

    actionFrames.baseFrame:AddElement(actionFrames.containers[UI.AOE])
    actionFrames.baseFrame:AddElement(actionFrames.containers[UI.CLEAVE])
    actionFrames.baseFrame:AddElement(actionFrames.containers[UI.SINGLE_TARGET])

    actionFrames.cooldown = CreateFrame('Cooldown', ('%s_ST1Cooldown'):format(addonName), actionFrames.containers[UI.SINGLE_TARGET], 'CooldownFrameTemplate')

    for i=1,4 do
        local parent = actionFrames.containers[UI.SINGLE_TARGET]
        local button = self:CreateSingleIconFrame(('%s_ST%d'):format(addonName, i), parent, frameSize[UI.SINGLE_TARGET][i])
        actionFrames.containers[UI.SINGLE_TARGET]:AddElement(button)
        actionFrames.actions[UI.SINGLE_TARGET][i] = button
    end

    for i=1,2 do
        local parent = actionFrames.containers[UI.CLEAVE]
        local button = self:CreateSingleIconFrame(('%s_Cleave%d'):format(addonName, i), parent, frameSize[UI.CLEAVE][i])
        actionFrames.containers[UI.CLEAVE]:AddElement(button)
        actionFrames.actions[UI.CLEAVE][i] = button
    end

    for i=1,2 do
        local parent = actionFrames.containers[UI.AOE]
        local button = self:CreateSingleIconFrame(('%s_AoE%d'):format(addonName, i), parent, frameSize[UI.AOE][i])
        actionFrames.containers[UI.AOE]:AddElement(button)
        actionFrames.actions[UI.AOE][i] = button
    end

    actionFrames.cooldown:SetAllPoints(actionFrames.actions[UI.SINGLE_TARGET][1])

    self:ReapplyLayout()

    actionFrames.backdrop:Hide()
end

function UI:CreateSingleIconFrame(name, parent, size)
    -- Create the background frame for this icon
    local btn = CreateFrame('Button', name, parent)
    btn.size = size
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

function UI:ApplyDefaultTheming(button)
    -- Set the button size
    button:SetSize(button.size, button.size)

    -- Create the texture
    local icon = button.icon or button:CreateTexture(button:GetName()..'Overlay', 'OVERLAY')
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
