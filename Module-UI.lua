local addonName, internal = ...;
local TJ = internal.TJ
local Debug = internal.Debug
local fmt = internal.fmt
local Config = TJ:GetModule('Config')
local UI = TJ:GetModule('UI')
local LDB = LibStub("LibDataBroker-1.1")

local real_G = _G
local mceil = math.ceil
local mpow = math.pow
local CreateFrame = CreateFrame
local InCombatLockdown = InCombatLockdown

local LibStub = LibStub

internal.Safety()

UI.SINGLE_TARGET = 1
UI.CLEAVE = 2
UI.AOE = 3

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
        local padding = Config:Get("geometry", "padding")
        frame:ClearAllPoints()
        local totalWidth = 0
        local totalHeight = 0
        local first = nil
        local last = nil
        for i=1,#childElements do
            local e = childElements[i]
            e:ClearAllPoints()
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

local function ApplyDefaultTheming(button)
    -- Set the button size
    button:Resize()

    -- Create the texture
    local icon = button.icon or button:CreateTexture(button:GetName()..'Overlay', 'OVERLAY')
    if not icon:GetTexture() then
        icon:SetTexture('Interface\\Icons\\spell_holy_borrowedtime')
    end
    icon:ClearAllPoints()
    icon:SetAllPoints()
    button.icon = icon

    local floatingBG = real_G[button:GetName()..'FloatingBG']
    if floatingBG then floatingBG:Hide() end
end

local function CreateSingleIconFrame(name, parent, sizeType, sizeIndex)
    -- Create the background frame for this icon
    local button = CreateFrame('Button', name, parent)
    button.sizeType = sizeType
    button.sizeIndex = sizeIndex
    function button:Resize()
        local size = mceil(-0.001 + Config:Get("geometry", self.sizeType) * mpow(Config:Get("geometry", "sizeDecrease"), self.sizeIndex - 1))
        self:SetSize(size, size)
    end

    ApplyDefaultTheming(button)
    button:EnableMouse(false)
    button:Show()

    local MSQ = LibStub('Masque', true)
    if MSQ then
        local group = MSQ:Group(addonName, 'Actions')
        group:AddButton(button, {Icon = button.icon})
        if group.db.disabled then
            ApplyDefaultTheming(button)
        end
    end

    return button
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
                    Config:OpenDialog()
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
                        Config:OpenDialog()
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
                    ApplyDefaultTheming(btn)
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
    actionFrames.backdrop:SetAlpha(inCombat and Config:Get("inCombatAlpha") or Config:Get("outOfCombatAlpha"))
end

function UI:ToggleMovement()
    if self.movable then
        self.movable = false
        TJ:Print('Frame movement disabled.')
    else
        self.movable = true
        TJ:Print('Frame movement enabled.')
    end
    self:SetMovable(self.movable)
    self:EnableMouse(self.movable)
end

function UI:ResetPosition()
    TJ:Print('Resetting position.')
    Config:Set(nil, "position")
    self:ReapplyLayout()
    self:SetMovable(self.movable)
    self:EnableMouse(self.movable)
end

function UI:ReapplyLayout(skipMasque)
    -- Resize buttons
    for i=1,4 do
        local btn = actionFrames.actions[UI.SINGLE_TARGET][i]
        if btn then btn:ClearAllPoints(); btn:Resize(); end
    end
    for i=1,2 do
        local btn = actionFrames.actions[UI.CLEAVE][i]
        if btn then btn:ClearAllPoints(); btn:Resize(); end
        btn = actionFrames.actions[UI.AOE][i]
        if btn then btn:ClearAllPoints(); btn:Resize(); end
    end

    -- Reapply the layout for the ST container
    actionFrames.containers[UI.SINGLE_TARGET]:ReapplyLayout()

    -- Reapply the layout for the cleave container
    if Config:Get('showCleave') then
        actionFrames.containers[UI.CLEAVE]:Show()
        actionFrames.containers[UI.CLEAVE]:ReapplyLayout()
    else
        actionFrames.containers[UI.CLEAVE]:Hide()
    end

    -- Reapply the layout for the AoE container
    if Config:Get('showAoE') then
        actionFrames.containers[UI.AOE]:Show()
        actionFrames.containers[UI.AOE]:ReapplyLayout()
    else
        actionFrames.containers[UI.AOE]:Hide()
    end

    -- Reapply the layout for the base container
    actionFrames.baseFrame:ReapplyLayout()

    -- Reskin any buttons if Masque is present
    if not skipMasque then
        -- Reapply masque skin if appropriate
        local MSQ = LibStub("Masque", true)
        if MSQ then
            MSQ:Group(addonName, "Actions"):ReSkin()
        end
    end

    -- Restore the base frame geometry
    actionFrames.baseFrame:SetPoint("CENTER", actionFrames.backdrop, "CENTER")
    actionFrames.backdrop:SetWidth(actionFrames.baseFrame:GetWidth() + (2 * Config:Get("geometry", "padding")))
    actionFrames.backdrop:SetHeight(actionFrames.baseFrame:GetHeight() + (2 * Config:Get("geometry", "padding")))

    -- Restore the positioning of the base frame
    actionFrames.backdrop:ClearAllPoints()
    actionFrames.backdrop:SetPoint(Config:Get("position", "tgtPoint"), Config:Get("position", "offsetX"), Config:Get("position", "offsetY"))
    actionFrames.backdrop:SetScale(Config:Get("geometry", "scale"))
    actionFrames.backdrop:SetBackdropColor(0, 0, 0, Config:Get("backgroundOpacity"))
end

function UI:CreateFrames()
    if actionFrames.baseFrame then return end

    -- Create the backdrop
    actionFrames.backdrop = CreateFrame('Frame', addonName.."Backdrop", UIParent)
    actionFrames.backdrop:SetBackdropColor(0, 0, 0, Config:Get("backgroundOpacity"))
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

    -- Create the icon frame containers
    actionFrames.containers[UI.SINGLE_TARGET] = CreateContainer(orientation, actionFrames.baseFrame)
    actionFrames.containers[UI.CLEAVE] = CreateContainer(not orientation, actionFrames.baseFrame)
    actionFrames.containers[UI.AOE] = CreateContainer(not orientation, actionFrames.baseFrame)

    -- Add each of the elements to the base container
    actionFrames.baseFrame:AddElement(actionFrames.containers[UI.AOE])
    actionFrames.baseFrame:AddElement(actionFrames.containers[UI.CLEAVE])
    actionFrames.baseFrame:AddElement(actionFrames.containers[UI.SINGLE_TARGET])

    -- Create the cooldown frame beforehand
    actionFrames.cooldown = CreateFrame('Cooldown', ('%s_ST1Cooldown'):format(addonName), actionFrames.containers[UI.SINGLE_TARGET], 'CooldownFrameTemplate')

    -- Create the ST icons
    for i=1,4 do
        local parent = actionFrames.containers[UI.SINGLE_TARGET]
        local button = CreateSingleIconFrame(('%s_ST%d'):format(addonName, i), parent, "singleTargetSize", i)
        actionFrames.containers[UI.SINGLE_TARGET]:AddElement(button)
        actionFrames.actions[UI.SINGLE_TARGET][i] = button
    end

    -- Create the cleave icons
    for i=1,2 do
        local parent = actionFrames.containers[UI.CLEAVE]
        local button = CreateSingleIconFrame(('%s_Cleave%d'):format(addonName, i), parent, "cleaveSize", i)
        actionFrames.containers[UI.CLEAVE]:AddElement(button)
        actionFrames.actions[UI.CLEAVE][i] = button
    end

    -- Create the AoE icons
    for i=1,2 do
        local parent = actionFrames.containers[UI.AOE]
        local button = CreateSingleIconFrame(('%s_AoE%d'):format(addonName, i), parent, "aoeSize", i)
        actionFrames.containers[UI.AOE]:AddElement(button)
        actionFrames.actions[UI.AOE][i] = button
    end

    -- Attach the cooldown frame to the first ST icon
    actionFrames.cooldown:SetAllPoints(actionFrames.actions[UI.SINGLE_TARGET][1])

    self:ReapplyLayout()
    actionFrames.backdrop:Hide()
end
