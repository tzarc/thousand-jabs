--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Legion only.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if GetBuildInfo and select(4, GetBuildInfo()) >= 80000 then
    return
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local LibStub = LibStub
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Config = TJ:GetModule('Config')

local GetSpecialization = GetSpecialization
local LoadAddOn = LoadAddOn
local select = select
local type = type
local UnitClass = UnitClass

Core:Safety()

local defaultConf = {
    allowBetaProfiles = false,
    displayMode = "separate",
    predictMain = 4,
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

    if type(Config:Get("showAoE")) ~= "nil" then
        local origCleave = Config:Get("showCleave")
        local origAoE = Config:Get("showAoE")
        Config:Set(nil, "showCleave")
        Config:Set(nil, "showAoE")

        Config:Set(4, "predictMain")
        Config:Set(origCleave and 2 or 0, "predictCleave")
        Config:Set(origAoE and 2 or 0, "predictAoE")
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
    ThousandJabsDB = ThousandJabsDB or {}
    local res = getconf(ThousandJabsDB, ...)
    if type(res) == "nil" then res = getconf(defaultConf, ...) end
    return res
end

function Config:Set(value, ...)
    ThousandJabsDB = ThousandJabsDB or {}
    setconf(value, ThousandJabsDB, ...)
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
