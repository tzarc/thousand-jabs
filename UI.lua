local _, internal = ...;
local Z = internal.Z

-- Geometry
local stFrameSizes = { 80, 60, 40, 30 }
local cleaveFrameSizes = { 40, 25 }
local aoeFrameSizes = { 35, 20 }
local padding = 4
local totalWidth = padding * 7 + aoeFrameSizes[1] + cleaveFrameSizes[1] + stFrameSizes[1] + stFrameSizes[2] + stFrameSizes[3] + stFrameSizes[4]

function Z:CreateFrames()
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
    baseFrame:SetBackdropColor(0, 0, 0, 0.3)
    baseFrame:SetPoint('CENTER', UIParent)
    baseFrame:Show()

    -- Create the icon frames
    baseFrame.iconFrames = Z:CreateIconFrames(baseFrame)

    -- Set the geometry of the base frame
    baseFrame:SetWidth(totalWidth)
    baseFrame:SetHeight(padding + stFrameSizes[1] + padding)
    baseFrame:ClearAllPoints()
    baseFrame:SetPoint(internal.GetConf("position", "srcPoint"),
        UIParent,
        internal.GetConf("position", "tgtPoint"),
        internal.GetConf("position", "offsetX"),
        internal.GetConf("position", "offsetY"))
    baseFrame:Hide()

    return baseFrame
end

function Z:CreateIconFrames(parent)
    local frames = { singleTarget = {}, cleave = {}, aoe = {} }
    -- Create the icon frames
    local aoeHeight = aoeFrameSizes[1] + padding + aoeFrameSizes[2]
    local cleaveHeight = cleaveFrameSizes[1] + padding + cleaveFrameSizes[2]
    local xPos = padding
    local yPos = (-0.5*stFrameSizes[1])-padding + aoeHeight*0.5
    frames.aoe[1] = Z:CreateSingleIconFrame('ThousandJabs_AoE1', parent, aoeFrameSizes[1], xPos + 0.5*aoeFrameSizes[1] - 0.5*aoeFrameSizes[1], yPos)
    frames.aoe[2] = Z:CreateSingleIconFrame('ThousandJabs_AoE2', parent, aoeFrameSizes[2], xPos + 0.5*aoeFrameSizes[1] - 0.5*aoeFrameSizes[2], yPos - padding - aoeFrameSizes[1])
    xPos = xPos + aoeFrameSizes[1] + padding
    yPos = (-0.5*stFrameSizes[1])-padding + cleaveHeight*0.5
    frames.cleave[1] = Z:CreateSingleIconFrame('ThousandJabs_Cleave1', parent, cleaveFrameSizes[1], xPos + 0.5*cleaveFrameSizes[1] - 0.5*cleaveFrameSizes[1], yPos)
    frames.cleave[2] = Z:CreateSingleIconFrame('ThousandJabs_Cleave2', parent, cleaveFrameSizes[2], xPos + 0.5*cleaveFrameSizes[1] - 0.5*cleaveFrameSizes[2], yPos - padding - cleaveFrameSizes[1])
    xPos = xPos + cleaveFrameSizes[1] + padding
    for i=1,4 do
        frames.singleTarget[#frames.singleTarget+1] = Z:CreateSingleIconFrame('ThousandJabs_ST'..i, parent, stFrameSizes[i], xPos, (0.5*stFrameSizes[i]) - (0.5*stFrameSizes[1]) - padding)
        xPos = xPos + stFrameSizes[i] + padding
    end

    -- Create the cooldown frame
    frames.cooldown = CreateFrame('Cooldown', 'ThousandJabs_Cooldown', frames.singleTarget[1], 'CooldownFrameTemplate')
    frames.cooldown:SetAllPoints()

    return frames
end

function Z:CreateSingleIconFrame(name, parent, size, xOffset, yOffset, bindPoint)
    bindPoint = bindPoint or 'TOPLEFT'
    -- Create the background frame for this icon
    local frame = CreateFrame('Frame', name, parent)
    frame:SetWidth(size)
    frame:SetHeight(size)
    frame:ClearAllPoints()
    frame:SetPoint(bindPoint, parent, bindPoint, xOffset, yOffset)
    -- Create the texture
    local tex = frame:CreateTexture(nil, 'OVERLAY')
    tex:SetTexture('Interface\\Icons\\spell_holy_borrowedtime')
    tex:SetWidth(size)
    tex:SetHeight(size)
    tex:SetAllPoints()
    frame.tex = tex
    frame:Show()
    return frame
end
