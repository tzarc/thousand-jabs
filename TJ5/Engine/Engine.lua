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


LibStub('LibSandbox-5.0'):UseSandbox('TJ5')

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
function Engine:RegisterPlayerMySpell(name, AuraID, ...)
    local args = {...}
    args[1+#args] = 'player_aura_mine'
    return Engine:RegisterFallbackTable(name, { AuraID = AuraID }, unpack(args))
end

Engine:RegisterFallbackTable('player_aura_any', { AuraUnit = 'player', AuraMine = false }, 'aura')
function Engine:RegisterPlayerAnySpell(name, AuraID, ...)
    local args = {...}
    args[1+#args] = 'player_aura_any'
    return Engine:RegisterFallbackTable(name, { AuraID = AuraID }, unpack(args))
end

Engine:RegisterFallbackTable('target_aura_mine', { AuraUnit = 'target', AuraMine = true }, 'aura')
function Engine:RegisterTargetMySpell(name, AuraID, ...)
    local args = {...}
    args[1+#args] = 'target_aura_mine'
    return Engine:RegisterFallbackTable(name, { AuraID = AuraID }, unpack(args))
end

Engine:RegisterFallbackTable('target_aura_any', { AuraUnit = 'target', AuraMine = false }, 'aura')
function Engine:RegisterTargetAnySpell(name, AuraID, ...)
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
    Sampled = function(power, env) return (UnitPower('player', power.PowerType) or 0) end,

    max = function(power, env) return (UnitPowerMax('player', power.PowerType) or 0) end,
}, 'base_power')

-- Support for time-based regenerating power
Engine:RegisterFallbackTable('regen_power', {
    Regen = function(power, env) return GetPowerRegen() end,

    curr = function(power, env) return power.Sampled + power.Gained - power.Spent + (power.Regen * env.PredictionOffset) end,
    time_to_max = function(power, env) return (power.max - power.curr) / power.Regen end,
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
        local mh_speed, oh_speed = UnitAttackSpeed('player')
        oh_speed = oh_speed or 99999999
        if TJ.lastMainhandAttack < now - mh_speed then TJ.lastMainhandAttack = now end
        if TJ.lastOffhandAttack < now - oh_speed then TJ.lastOffhandAttack = now end
        local mh_swings = mfloor((env.currentTime - TJ.lastMainhandAttack) / mh_speed)
        local oh_swings = mfloor((env.currentTime - TJ.lastOffhandAttack) / oh_speed)
        return (mh_swings + oh_swings) * power.GainedPerSwing
    end,

    GainedPerSwing = 0,
    curr = function(power, env) return power.Sampled + power.Gained + power.GainedFromAutoattacks - power.Spent end,
}, 'powertype_power')

local function resourcePrototype__CanSpend(power, amount)
end

local function resourcePrototype__PerformSpend(power, amount)
end

function Engine:RegisterResourceHandler(name, powerType, ...)
    local tbl = self:CreateStateEnvTable(name, {PowerType=powerType}, ...)
    self.Data = self.Data or {}
    self.Data.CommonActions = self.Data.CommonActions or {}
    self.Data.CommonActions[name] = tbl

    tbl:SetFunction('CanSpend', resourcePrototype__CanSpend)
    tbl:SetFunction('PerformSpend', resourcePrototype__PerformSpend)
end

Engine:RegisterResourceHandler('mana', SPELL_POWER_MANA, 'regen_power')
Engine:RegisterResourceHandler('energy', SPELL_POWER_ENERGY, 'regen_power')
Engine:RegisterResourceHandler('soul_shards', SPELL_POWER_SOUL_SHARDS, 'powertype_power')
Engine:RegisterResourceHandler('chi', SPELL_POWER_CHI, 'powertype_power')
Engine:RegisterResourceHandler('rage', SPELL_POWER_RAGE, 'autoattack_power')
Engine:RegisterResourceHandler('pain', SPELL_POWER_PAIN, 'powertype_power')
Engine:RegisterResourceHandler('fury', SPELL_POWER_FURY, 'autoattack_power')
Engine:RegisterResourceHandler('maelstrom', SPELL_POWER_MAELSTROM, 'powertype_power')
Engine:RegisterResourceHandler('soul_fragments', SPELL_POWER_MAELSTROM, { AuraID = 203981 }, 'aura_stacks_power')
