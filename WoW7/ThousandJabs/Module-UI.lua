local LibStub = LibStub
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Config = TJ:GetModule('Config')
local UI = TJ:GetModule('UI')

local LDB = LibStub("LibDataBroker-1.1")

local CreateFrame = CreateFrame
local InCombatLockdown = InCombatLockdown
local IsRightAltKeyDown = IsRightAltKeyDown
local IsRightControlKeyDown = IsRightControlKeyDown
local IsRightShiftKeyDown = IsRightShiftKeyDown
local mceil = math.ceil
local mpow = math.pow
local real_G = _G

Core:Safety()

Core.Broker = {}

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
    icon:SetAllPoints(button)
    button.icon = icon

    button.overlayText:ClearAllPoints()
    button.overlayText:SetAllPoints(button)
    button.overlayText:SetJustifyV("BOTTOM")
    button.overlayText:SetJustifyH("CENTER")

    local floatingBG = real_G[button:GetName()..'FloatingBG']
    if floatingBG then floatingBG:Hide() end
    local border = real_G[button:GetName()..'Border']
    if border then border:Hide() end
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

    button.overlayText = button:CreateFontString(name..'Name', "OVERLAY", "GameFontHighlightSmall")
    button.overlayText:SetParent(button)
    button.overlayText:SetText('')

    ApplyDefaultTheming(button)
    button:EnableMouse(false)
    button:Show()

    local MSQ = LibStub('Masque', true)
    if MSQ then
        local group = MSQ:Group('ThousandJabs', 'Actions')
        group:AddButton(button, {Icon = button.icon, Name=button.overlayText})
        if group.db.disabled then
            ApplyDefaultTheming(button)
        end
    end

    return button
end

function UI:OnInitialize()
    -- LDB object
    if LDB then
        Core.Broker.dataObj = LDB:NewDataObject('ThousandJabs', {
            icon  = "Interface\\Icons\\ability_monk_jab",
            label = "Thousand Jabs",
            text  = "Thousand Jabs",
            type  = "data source",
            OnClick = function(_, button)
                if button == "LeftButton" then
                    Config:OpenDialog()
                elseif button == "RightButton" then
                    if IsRightShiftKeyDown() and IsRightControlKeyDown() and IsRightAltKeyDown() then
                        if Core.Broker.updateText then
                            Core.Broker.updateText = false
                            Core.Broker.dataObj.text = "Thousand Jabs"
                            Core.Broker.updateTime = nil
                        else
                            Core.Broker.updateText = true
                            Core.Broker.dataObj.text = "Thousand Jabs: Collecting usage statistics..."
                            Core.Broker.updateTime = nil
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
        MSQ:Register('ThousandJabs', function(_, group, skinID, gloss, backdrop, colours, isDisabled)
            if isDisabled then
                for btn in pairs(MSQ:Group('ThousandJabs', group).Buttons) do
                    ApplyDefaultTheming(btn)
                end
            end
            UI:ReapplyLayout(true)
        end)
    else
        return true
    end
end

function UI:SetAction(actionType, actionIndex, texture, overlayText)
    if not actionFrames.backdrop then return end

    local actions = actionFrames.actions[actionType]
    if actions then
        local button = actions[actionIndex]
        if button then
            button.icon:SetTexture(texture)
            button.overlayText:SetText(overlayText or '')
        end
    end
end

function UI:Show()
    if not actionFrames.backdrop then return end

    actionFrames.backdrop:Show()
end

function UI:Hide()
    if not actionFrames.backdrop then return end

    actionFrames.backdrop:Hide()
end

function UI:SetMovable(enabled)
    if not actionFrames.backdrop then return end

    actionFrames.backdrop:SetMovable(enabled)
end

function UI:GetPoint(...)
    if not actionFrames.backdrop then return end

    return actionFrames.backdrop:GetPoint(...)
end

function UI:GetScale()
    if not actionFrames.backdrop then return end

    return actionFrames.backdrop:GetScale()
end

function UI:EnableMouse(enabled)
    if not actionFrames.backdrop then return end

    actionFrames.backdrop:EnableMouse(enabled)
end

function UI:SetScript(event, func)
    if not actionFrames.backdrop then return end

    actionFrames.backdrop:SetScript(event, func)
end

function UI:SetCooldown(start, duration)
    if not actionFrames.backdrop then return end

    actionFrames.cooldown:SetCooldown(start, duration)
end

function UI:UpdateAlpha()
    if not actionFrames.backdrop then return end

    local inCombat = InCombatLockdown()
    local alpha = inCombat and Config:Get("inCombatAlpha") or Config:Get("outOfCombatAlpha")
    if alpha > 0 then
        actionFrames.backdrop:SetAlpha(alpha)
        actionFrames.backdrop:Show()
    else
        actionFrames.backdrop:Hide()
    end
end

function UI:ToggleMovement()
    if not actionFrames.backdrop then return end

    if self.movable then
        self.movable = false
        Core:Print('Frame movement disabled.')
    else
        self.movable = true
        Core:Print('Frame movement enabled.')
    end
    self:SetMovable(self.movable)
    self:EnableMouse(self.movable)
end

function UI:ResetPosition()
    if not actionFrames.backdrop then return end

    Core:Print('Resetting position.')
    Config:Set(nil, "position")
    self:ReapplyLayout()
    self:SetMovable(self.movable)
    self:EnableMouse(self.movable)
end

function UI:ReapplyLayout(skipMasque)
    if not actionFrames.backdrop then return end

    -- Resize buttons
    local main = Config:Get('predictMain')
    for i=1,8 do
        local btn = actionFrames.actions[UI.SINGLE_TARGET][i]
        if btn then
            btn:ClearAllPoints()
            btn:Resize()
            if main >= i then btn:Show() else btn:Hide() end
        end
    end
    local cleave = Config:Get('predictCleave')
    local aoe = Config:Get('predictAoE')
    for i=1,8 do
        local btn = actionFrames.actions[UI.CLEAVE][i]
        if btn then
            btn:ClearAllPoints()
            btn:Resize()
            if cleave >= i then btn:Show() else btn:Hide() end
        end
        btn = actionFrames.actions[UI.AOE][i]
        if btn then
            btn:ClearAllPoints()
            btn:Resize()
            if aoe >= i then btn:Show() else btn:Hide() end
        end
    end

    -- Reapply the layout for the ST container
    actionFrames.containers[UI.SINGLE_TARGET]:ReapplyLayout()

    -- Reapply the layout for the cleave container
    if Config:Get('predictCleave') > 0 and Config:Get('displayMode') ~= 'automatic' then
        actionFrames.containers[UI.CLEAVE]:Show()
        actionFrames.containers[UI.CLEAVE]:ReapplyLayout()
    else
        actionFrames.containers[UI.CLEAVE]:Hide()
    end

    -- Reapply the layout for the AoE container
    if Config:Get('predictAoE') > 0 and Config:Get('displayMode') ~= 'automatic' then
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
            MSQ:Group('ThousandJabs', "Actions"):ReSkin()
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

    -- Enable/disable the spell flash on the cooldown
    actionFrames.cooldown:SetDrawBling(Config:Get("showSpellFlash"))
end

function UI:CreateFrames()
    if actionFrames.baseFrame then return end

    -- Create the backdrop
    actionFrames.backdrop = CreateFrame('Frame', 'ThousandJabsBackdrop', UIParent)
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
    actionFrames.baseFrame = CreateContainer(orientation, actionFrames.backdrop, 'ThousandJabs')

    -- Create the icon frame containers
    actionFrames.containers[UI.SINGLE_TARGET] = CreateContainer(orientation, actionFrames.baseFrame)
    actionFrames.containers[UI.CLEAVE] = CreateContainer(not orientation, actionFrames.baseFrame)
    actionFrames.containers[UI.AOE] = CreateContainer(not orientation, actionFrames.baseFrame)

    -- Add each of the elements to the base container
    actionFrames.baseFrame:AddElement(actionFrames.containers[UI.AOE])
    actionFrames.baseFrame:AddElement(actionFrames.containers[UI.CLEAVE])
    actionFrames.baseFrame:AddElement(actionFrames.containers[UI.SINGLE_TARGET])

    -- Create the cooldown frame beforehand
    actionFrames.cooldown = CreateFrame('Cooldown', 'ThousandJabs_ST1Cooldown', actionFrames.containers[UI.SINGLE_TARGET], 'CooldownFrameTemplate')
    actionFrames.cooldown:SetDrawBling(Config:Get("showSpellFlash"))

    -- Create the ST icons
    for i=1,8 do
        local parent = actionFrames.containers[UI.SINGLE_TARGET]
        local button = CreateSingleIconFrame(('ThousandJabs_ST%d'):format(i), parent, "singleTargetSize", i)
        actionFrames.containers[UI.SINGLE_TARGET]:AddElement(button)
        actionFrames.actions[UI.SINGLE_TARGET][i] = button
    end

    -- Create the cleave icons
    for i=1,8 do
        local parent = actionFrames.containers[UI.CLEAVE]
        local button = CreateSingleIconFrame(('ThousandJabs_Cleave%d'):format(i), parent, "cleaveSize", i)
        actionFrames.containers[UI.CLEAVE]:AddElement(button)
        actionFrames.actions[UI.CLEAVE][i] = button
    end

    -- Create the AoE icons
    for i=1,8 do
        local parent = actionFrames.containers[UI.AOE]
        local button = CreateSingleIconFrame(('ThousandJabs_AoE%d'):format(i), parent, "aoeSize", i)
        actionFrames.containers[UI.AOE]:AddElement(button)
        actionFrames.actions[UI.AOE][i] = button
    end

    -- Attach the cooldown frame to the first ST icon
    actionFrames.cooldown:SetParent(actionFrames.actions[UI.SINGLE_TARGET][1])
    actionFrames.cooldown:SetAllPoints(actionFrames.actions[UI.SINGLE_TARGET][1])

    self:ReapplyLayout()
    actionFrames.backdrop:Hide()
end
