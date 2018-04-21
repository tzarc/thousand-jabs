--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Alpha only.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(4, GetBuildInfo()) < 80000 then
    return
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Module init.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local addonName, tj, _ = ...
local LibStub = LibStub
local TJ = tj.TJ
local Callbacks = tj.Callbacks
local Config = tj.Config


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Locals
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local select = select
local type = type
local tostring = tostring

local variablesAvailable = false

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sandbox
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
LibStub('LibTJSandbox-8.0'):Use(addonName)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Defaults
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local defaultConf = {
    allowBetaProfiles = false,
    displayMode = 'separate',
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
        tgtPoint = 'CENTER',
    },
    doDebug = false,
}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Functions
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Config:OpenDialog()
    LoadAddOn('ThousandJabs_Config')
    local ACD = LibStub('AceConfigDialog-3.0')
    ACD:Open('Thousand Jabs')
    ACD:SelectGroup('Thousand Jabs', 'general')
end

function Config:Upgrade()
    -- Added Geometry:
    if type(Config:Get('scale')) ~= 'nil' then
        Config:Set(Config:Get('scale'), 'geometry', 'scale')
        Config:Set(nil, 'scale')
        Config:Set(Config:Get('padding'), 'geometry', 'padding')
        Config:Set(nil, 'padding')
    end

    if type(Config:Get('showAoE')) ~= 'nil' then
        local origCleave = Config:Get('showCleave')
        local origAoE = Config:Get('showAoE')
        Config:Set(nil, 'showCleave')
        Config:Set(nil, 'showAoE')

        Config:Set(4, 'predictMain')
        Config:Set(origCleave and 2 or 0, 'predictCleave')
        Config:Set(origAoE and 2 or 0, 'predictAoE')
    end

    if type(Config:Get('do_debug')) ~= 'nil' then
        Config:Set(Config:Get('do_debug'), 'doDebug')
        Config:Set(nil, 'do_debug')
    end
end

Callbacks.Register(Config, 'VARIABLES_LOADED', function()
    ThousandJabsDB = ThousandJabsDB or {}
    variablesAvailable = true
    Config:Upgrade()
    Callbacks:Invoke('CONFIG_CHANGED')
end)

local function getconf(tbl, key, ...)
    if select('#', ...) == 0 then return tbl[key] end
    local e = tbl[key]
    if type(e) == 'nil' then return nil end
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
    if not variablesAvailable then error('Attempted to read config before login sequence complete.') end
    if not ThousandJabsDB then return nil end
    local res = getconf(ThousandJabsDB, ...)
    if type(res) == 'nil' then res = getconf(defaultConf, ...) end
    return res
end

function Config:Set(value, ...)
    if not variablesAvailable then error('Attempted to write config before login sequence complete.') end
    if not ThousandJabsDB then return nil end
    setconf(value, ThousandJabsDB, ...)
    Callbacks:Invoke('CONFIG_CHANGED')
end

function Config:GetSpecGeneric(...)
    local classID, specID = select(3, UnitClass('player')), GetSpecialization()
    return Config:Get('class', classID, 'spec', specID, ...)
end

function Config:GetSpec(...)
    return Config:GetSpecGeneric('config', ...)
end

function Config:GetSpecBlacklist(...)
    return Config:GetSpecGeneric('blacklist', ...)
end

function Config:GetSpecOverlay(...)
    return Config:GetSpecGeneric('overlay', ...)
end

function Config:SetSpecGeneric(value, ...)
    local classID, specID = select(3, UnitClass('player')), GetSpecialization()
    Config:Set(value, 'class', classID, 'spec', specID, ...)
end

function Config:SetSpec(value, ...)
    Config:SetSpecGeneric(value, 'config', ...)
end

function Config:SetSpecBlacklist(value, ...)
    Config:SetSpecGeneric(value, 'blacklist', ...)
end

function Config:SetSpecOverlay(value, ...)
    Config:SetSpecGeneric(value, 'overlay', ...)
end
