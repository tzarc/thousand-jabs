local addonName = ...

local GetPowerRegen = GetPowerRegen
local GetTalentInfoByID = GetTalentInfoByID
local GetTime = GetTime
local mfloor = math.floor
local mmax = math.max
local mmin = math.min
local select = select
local SPELL_POWER_CHI = SPELL_POWER_CHI
local SPELL_POWER_ENERGY = SPELL_POWER_ENERGY
local SPELL_POWER_FURY = SPELL_POWER_FURY
local SPELL_POWER_MAELSTROM = SPELL_POWER_MAELSTROM
local SPELL_POWER_MANA = SPELL_POWER_MANA
local SPELL_POWER_PAIN = SPELL_POWER_PAIN
local SPELL_POWER_RAGE = SPELL_POWER_RAGE
local SPELL_POWER_SOUL_SHARDS = SPELL_POWER_SOUL_SHARDS
local UnitAttackSpeed = UnitAttackSpeed
local UnitPower = UnitPower
local UnitPowerMax = UnitPowerMax
local unpack = unpack

local CBH = LibStub('CallbackHandler-1.0')
LibStub('LibSandbox-5.0'):UseSandbox('TJ5')

------------------------------------------------------------------------------------------------------------------------
-- Message notifications
------------------------------------------------------------------------------------------------------------------------
do
    local callbackSystem = {}
    local callbacks = CBH:New(callbackSystem, "RegisterCallback", "UnregisterCallback", "UnregisterAllCallbacks")

    Engine.RegisterCallback = callbackSystem.RegisterCallback
    Engine.UnregisterCallback = callbackSystem.UnregisterCallback
    Engine.UnregisterAllCallbacks = callbackSystem.UnregisterAllCallbacks
    Engine.Notify = callbacks.Fire
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function Engine:MatchesBuild(tripletFrom, tripletTo)
    tripletTo = tripletTo or tripletFrom
    local f1,f2,f3 = tripletFrom:match("(%d+)%.(%d+)%.(%d+)")
    local f = tonumber(f1)*10000000000 + tonumber(f2)*100000000 + tonumber(f3)*1000000
    local t1,t2,t3 = tripletTo:match("(%d+)%.(%d+)%.(%d+)")
    local t = tonumber(t1)*10000000000 + tonumber(t2)*100000000 + tonumber(t3)*1000000
    local c1,c2,c3 = GetBuildInfo():match("(%d+)%.(%d+)%.(%d+)")
    local c = tonumber(c1)*10000000000 + tonumber(c2)*100000000 + tonumber(c3)*1000000
    return (f <= c and c <= t) and true or false
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Base Tables
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Support for talent checks
Engine:RegisterFallbackTable('talent', {
    talent_enabled = function(spell, env)
        return select(10, GetTalentInfoByID(spell.TalentID)) and true or false
    end,
})

-- Support for auras
Engine:RegisterFallbackTable('aura', {
    aura_remains = function(spell, env) return mmax(0, spell.ExpirationTime - env.CurrentTime) end,
    aura_up = function(spell, env) return (spell.aura_remains > 0) and true or false end,
    aura_down = function(spell, env) return (not spell.aura_up) and true or false end,
    aura_ticking = function(spell, env) return spell.aura_up and true or false end,
    aura_react = function(spell, env) return spell.aura_up and true or false end,
    aura_stack = function(spell, env) return spell.AuraCount or 0 end,
})

-- Simplify aura definitions
Engine:RegisterFallbackTable('player_aura_mine', { AuraUnit = 'player', AuraMine = true }, 'aura')
function Engine:CreateAuraMySpellOnPlayer(name, AuraID, ...)
    local args = {...}
    args[1+#args] = 'player_aura_mine'
    return Engine:RegisterFallbackTable(name, { AuraID = AuraID }, unpack(args))
end

Engine:RegisterFallbackTable('player_aura_any', { AuraUnit = 'player', AuraMine = false }, 'aura')
function Engine:CreateAuraAnybodySpellOnPlayer(name, AuraID, ...)
    local args = {...}
    args[1+#args] = 'player_aura_any'
    return Engine:RegisterFallbackTable(name, { AuraID = AuraID }, unpack(args))
end

Engine:RegisterFallbackTable('target_aura_mine', { AuraUnit = 'target', AuraMine = true }, 'aura')
function Engine:CreateAuraMySpellOnTarget(name, AuraID, ...)
    local args = {...}
    args[1+#args] = 'target_aura_mine'
    return Engine:RegisterFallbackTable(name, { AuraID = AuraID }, unpack(args))
end

Engine:RegisterFallbackTable('target_aura_any', { AuraUnit = 'target', AuraMine = false }, 'aura')
function Engine:CreateAuraAnybodySpellOnTarget(name, AuraID, ...)
    local args = {...}
    args[1+#args] = 'target_aura_any'
    return Engine:RegisterFallbackTable(name, { AuraID = AuraID }, unpack(args))
end

-- Base support for resources
Engine:RegisterFallbackTable('base_power', {
    Sampled = 0,
    Gained = 0,
    Spent = 0,

    max = 0,
    curr = function(power, env) return power.Sampled - power.Spent + power.Gained end,
    deficit = function(power, env) return power.max - power.curr end,
})

-- Support for SPELL_POWER_???????? types
Engine:RegisterFallbackTable('powertype_power', {
    Sampled = function(power, env) return (UnitPower(power.PowerUnitID, power.PowerType) or 0) end,

    max = function(power, env) return (UnitPowerMax(power.PowerUnitID, power.PowerType) or 0) end,
}, 'base_power')

-- Support for time-based regenerating power
Engine:RegisterFallbackTable('regen_power', {
    curr = function(power, env) return power.Sampled + power.Gained - power.Spent + (power.regen * env.PredictionOffset) end,
    regen = function(power, env) return GetPowerRegen() end,
    time_to_max = function(power, env) return (power.max - power.curr) / power.regen end,
}, 'powertype_power')

-- Support for aura-stack-based power
Engine:RegisterFallbackTable('aura_stacks_power', {
    curr = function(power, env) return power.aura_stack - power.Spent + power.Gained end,
}, 'player_aura_mine', 'base_power')

-- Adds support for autoattac-triggered power generation
Engine:RegisterFallbackTable('autoattack_power', {
    CanGainFromAutoattacks = false, -- Spec needs to override this
    GainedFromAutoattacks = function(power, env)
        if not power.CanGainFromAutoattacks then return 0 end
        local now = GetTime()
        local mh_speed, oh_speed = UnitAttackSpeed(power.PowerUnitID)
        oh_speed = oh_speed or 99999999
        if Engine.lastMainhandAttack < now - mh_speed then Engine.lastMainhandAttack = now end
        if Engine.lastOffhandAttack < now - oh_speed then Engine.lastOffhandAttack = now end
        local mh_swings = mfloor((env.CurrentTime - Engine.lastMainhandAttack) / mh_speed)
        local oh_swings = mfloor((env.CurrentTime - Engine.lastOffhandAttack) / oh_speed)
        return (mh_swings + oh_swings) * power.GainedPerSwing
    end,

    GainedPerSwing = 0,
    curr = function(power, env) return power.Sampled + power.Gained + power.GainedFromAutoattacks - power.Spent end,
}, 'powertype_power')

local function resourcePrototype__CanSpend(power, amount)
end

local function resourcePrototype__PerformSpend(power, amount)
end

function Engine:CreateResourceHandler(name, unitID, powerType, ...)
    local tbl = self:CreateStateEnvTable(name, { PowerUnitID = unitID, PowerType = powerType }, ...)
    tbl:SetFunction('CanSpend', resourcePrototype__CanSpend)
    tbl:SetFunction('PerformSpend', resourcePrototype__PerformSpend)
    return tbl
end

--[[
Engine:RegisterResourceHandler('mana', 'player', SPELL_POWER_MANA, 'regen_power')
Engine:RegisterResourceHandler('energy', 'player', SPELL_POWER_ENERGY, 'regen_power')
Engine:RegisterResourceHandler('soul_shards', 'player', SPELL_POWER_SOUL_SHARDS, 'powertype_power')
Engine:RegisterResourceHandler('chi', 'player', SPELL_POWER_CHI, 'powertype_power')
Engine:RegisterResourceHandler('rage', 'player', SPELL_POWER_RAGE, 'autoattack_power')
Engine:RegisterResourceHandler('pain', 'player', SPELL_POWER_PAIN, 'powertype_power')
Engine:RegisterResourceHandler('fury', 'player', SPELL_POWER_FURY, 'autoattack_power')
Engine:RegisterResourceHandler('maelstrom', 'player', SPELL_POWER_MAELSTROM, 'powertype_power')
Engine:RegisterResourceHandler('soul_fragments', 'player', SPELL_POWER_MAELSTROM, { AuraID = 203981 }, 'aura_stacks_power')
]]
