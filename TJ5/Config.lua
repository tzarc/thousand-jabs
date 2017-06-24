local addonName = ...

LibStub('LibSandbox-5.0'):UseSandbox(addonName)

local defaultConf = {
    allowBetaProfiles = false,
    displayMode = "separate",
    showCleave = true,
    showAoE = true,
    predictST = 4,
    predictCleave = 2,
    predictAoE = 2,
    inCombatAlpha = 1,
    outOfCombatAlpha = 1,
    backgroundOpacity = 0.3,
    showSpellFlash = true,
    fastUpdateSpeed = 0.2,
    slowUpdateSpeed = 0.75,
    geometry = {
        singleTargetSize = 80,
        cleaveSize = 40,
        aoeSize = 35,
        sizeDecrease = 0.7,
        padding = 4,
        scale = 1,
    },
    position = {
        offsetX = 0,
        offsetY = -180,
        tgtPoint = "CENTER",
    },
    do_debug = false,
}

function Config:OpenDialog()
    LoadAddOn("ThousandJabs_Config")
    local ACD = LibStub('AceConfigDialog-3.0')
    ACD:Open('Thousand Jabs')
    ACD:SelectGroup('Thousand Jabs', "general")
end

function Config:Upgrade()
    -- Added Geometry:
    if type(Config:Get("scale")) ~= "nil" then
        Config:Set(Config:Get("scale"), "geometry", "scale")
        Config:Set(nil, "scale")
        Config:Set(Config:Get("padding"), "geometry", "padding")
        Config:Set(nil, "padding")
    end
end

local function getconf(tbl, key, ...)
    if select('#', ...) == 0 then return tbl[key] end
    local e = tbl[key]
    if type(e) == "nil" then return nil end
    return getconf(e, ...)
end

local function setconf(value, tbl, ...)
    local keys = {...}
    local p = tbl
    for i=1,#keys-1 do
        if not p[keys[i]] then p[keys[i]] = {} end
        p = p[keys[i]]
    end
    p[keys[#keys]] = value
end

function Config:Get(...)
    TJ5DB = TJ5DB or {}
    local res = getconf(TJ5DB, ...)
    if type(res) == "nil" then res = getconf(defaultConf, ...) end
    return res
end

function Config:Set(value, ...)
    TJ5DB = TJ5DB or {}
    setconf(value, TJ5DB, ...)
end

function Config:GetSpecGeneric(...)
    local classID, specID = select(3, UnitClass('player')), GetSpecialization()
    return Config:Get("class", classID, "spec", specID, ...)
end

function Config:GetSpec(...)
    return Config:GetSpecGeneric("config", ...)
end

function Config:GetSpecBlacklist(...)
    return Config:GetSpecGeneric("blacklist", ...)
end

function Config:GetSpecOverlay(...)
    return Config:GetSpecGeneric("overlay", ...)
end

function Config:SetSpecGeneric(value, ...)
    local classID, specID = select(3, UnitClass('player')), GetSpecialization()
    Config:Set(value, "class", classID, "spec", specID, ...)
    TJ:QueueProfileReload()
end

function Config:SetSpec(value, ...)
    Config:SetSpecGeneric(value, "config", ...)
end

function Config:SetSpecBlacklist(value, ...)
    Config:SetSpecGeneric(value, "blacklist", ...)
end

function Config:SetSpecOverlay(value, ...)
    Config:SetSpecGeneric(value, "overlay", ...)
end
