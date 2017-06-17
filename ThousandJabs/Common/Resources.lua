local LibStub = LibStub
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Config = TJ:GetModule('Config')
local UnitCache = TJ:GetModule('UnitCache')

local getmetatable = getmetatable
local GetPowerRegen = GetPowerRegen
local SPELL_POWER_CHI = SPELL_POWER_CHI
local SPELL_POWER_ENERGY = SPELL_POWER_ENERGY
local SPELL_POWER_FURY = SPELL_POWER_FURY
local SPELL_POWER_MAELSTROM = SPELL_POWER_MAELSTROM
local SPELL_POWER_MANA = SPELL_POWER_MANA
local SPELL_POWER_PAIN = SPELL_POWER_PAIN
local SPELL_POWER_RAGE = SPELL_POWER_RAGE
local SPELL_POWER_SOUL_SHARDS = SPELL_POWER_SOUL_SHARDS
local tinsert = table.insert
local tremove = table.remove
local UnitPower = UnitPower
local UnitPowerMax = UnitPowerMax

Core:Safety()

Core.BuildResourceHandler = function(self, name, powerType, ...)
    return Core:BuildFallbackTable(name, { __powerType = powerType }, ...)
end

local function generic_can_spend(power, env, action, costType, costAmount)
    local profile = getmetatable(power).__profile
    local hooks = profile.config.hooks

    -- If the profile has a hook present for the action cost, execute that first
    if hooks then
        local cb = hooks.can_spend
        if cb then
            local newCostType, newCostAmount = cb(power, env, action, costType, costAmount)
            if newCostType then
                if newCostType == 'none' then return true end
                return (env[newCostType].curr >= newCostAmount) and true or false
            end
        end
    end

    -- No hook, or hook returned nil - act as per normal
    return (power.curr >= costAmount) and true or false
end

local function generic_perform_spend(power, env, action, costType, costAmount)
    local profile = getmetatable(power).__profile
    local hooks = profile.config.hooks

    -- If the profile has a hook present for the action cost, execute that first
    if hooks then
        local cb = hooks.perform_spend
        if cb then
            local newCostType, newCostAmount = cb(power, env, action, costType, costAmount)
            if newCostType then
                if newCostType == 'none' then return end
                env[newCostType].spent = env[newCostType].spent + newCostAmount
                return
            end
        end
    end

    -- No hook, or hook returned nil - act as per normal
    if costAmount then
        power.spent = power.spent + costAmount
    end
end

-- Base support for power variables
Core:RegisterFallbackTable('base_power', {
    sampled = 0,
    max = 0,
    gained = 0,
    spent = 0,
    curr = function(power, env) return power.sampled - power.spent + power.gained end,
    deficit = function(power, env) return power.max - power.curr end,
    can_spend = generic_can_spend,
    perform_spend = generic_perform_spend,
})

-- Base support for power variables
Core:RegisterFallbackTable('powertype_power', {
    sampled = function(power, env) return (UnitPower('player', power.__powerType) or 0) end,
    max = function(power, env) return (UnitPowerMax('player', power.__powerType) or 0) end,
})

-- Adds support for time-based regenerating power
Core:RegisterFallbackTable('regen_power', {
    regen = function(power, env) return GetPowerRegen() end,
    curr = function(power, env) return power.sampled + power.gained - power.spent + (power.regen * env.predictionOffset) end,
    time_to_max = function(power, env) return (power.max - power.curr) / power.regen end,
})

-- Adds support for aura-stack-based power
Core:RegisterFallbackTable('aura_stacks_power', {
    AuraUnit = 'player',
    AuraMine = true,
    curr = function(power, env) return power.aura_stack - power.spent + power.gained end,
})

-- Adds support for autoattac-triggered power generation
Core:RegisterFallbackTable('autoattack_power', {
    can_gain_from_autoattacks = false, -- Spec needs to override this
    curr = function(power, env) return power.sampled + power.gained + power.gained_from_autoattacks - power.spent end,
    gained_from_autoattacks = function(power, env)
        if not power.can_gain_from_autoattacks then return 0 end
        local now = GetTime()
        local mh_speed, oh_speed = UnitAttackSpeed('player')
        oh_speed = oh_speed or 99999999
        if TJ.lastMainhandAttack < now - mh_speed then TJ.lastMainhandAttack = now end
        if TJ.lastOffhandAttack < now - oh_speed then TJ.lastOffhandAttack = now end
        local mh_swings = mfloor((env.currentTime - TJ.lastMainhandAttack) / mh_speed)
        local oh_swings = mfloor((env.currentTime - TJ.lastOffhandAttack) / oh_speed)
        return (mh_swings + oh_swings) * power.gained_per_swing
    end,
})

Core.Environment.resources = {

        mana = Core:BuildResourceHandler('mana', SPELL_POWER_MANA, 'regen_power', 'powertype_power', 'base_power'),

        energy = Core:BuildResourceHandler('energy', SPELL_POWER_ENERGY, 'regen_power', 'powertype_power', 'base_power'),

        soul_shards = Core:BuildResourceHandler('soul_shards', SPELL_POWER_SOUL_SHARDS, 'powertype_power', 'base_power'),

        chi = Core:BuildResourceHandler('chi', SPELL_POWER_CHI, 'powertype_power', 'base_power'),

        rage = Core:BuildResourceHandler('rage', SPELL_POWER_RAGE, 'autoattack_power', 'powertype_power', 'base_power'),

        pain = Core:BuildResourceHandler('pain', SPELL_POWER_PAIN, 'powertype_power', 'base_power'),

        fury = Core:BuildResourceHandler('fury', SPELL_POWER_FURY, 'autoattack_power', 'powertype_power', 'base_power'),

        maelstrom = Core:BuildResourceHandler('maelstrom', SPELL_POWER_MAELSTROM, 'powertype_power', 'base_power'),

        soul_fragments = Core:BuildFallbackTable('soul_fragments', { AuraID = 203981 }, 'aura_stacks_power', 'aura', 'base_power'),

        rune = Core:BuildFallbackTable('rune', {
            skipped = 0,

            curr = function(power, env)
                local all_remains = power.sample

                -- Count the ready runes
                local count = 0
                for i = 1, 6 do
                    if all_remains[i] == 0 then
                        count = count + 1
                    end
                end

                return count
            end,

            all_remains = {},
            sample = function(power, env)
                power.all_remains = power.all_remains or {}
                local all_remains = power.all_remains
                for i = 1, 6 do
                    local s, d = GetRuneCooldown(i)
                    s, d = (s or 0), (d or 0)
                    local remaining = mmax(0, s + d - env.currentTime)
                    all_remains[i] = remaining
                end
                tsort(all_remains)

                -- Insert '0' at the front to allow for gained runes
                for i = 1, power.gained do
                    tinsert(all_remains, 1, 0)
                end
                while #all_remains > 6 do tremove(all_remains, 7) end

                -- Replace the end of the array for any spent runes
                for i = 1, mmin(6, power.spent) do
                    all_remains[7 - i] = mmax(15, all_remains[7 - i])
                end

                tsort(all_remains)
                return all_remains
            end,

            time_to_1 = function(power, env) return power.sample[1] end,
            time_to_2 = function(power, env) return power.sample[2] end,
            time_to_3 = function(power, env) return power.sample[3] end,
            time_to_4 = function(power, env) return power.sample[4] end,
            time_to_5 = function(power, env) return power.sample[5] end,
            time_to_6 = function(power, env) return power.sample[6] end,
        }, 'base_power'),

        runic_power = Core:BuildFallbackTable('runic_power', {
            curr = function(power, env) return power.sampled - power.spent + power.gained + ((env.rune.spent - env.rune.skipped) * 10) end,
        }, 'powertype_power', 'base_power'),
}

-- Set up the per-time resources to match the base resources
Core.Environment.resources.mana_per_time = Core.Environment.resources.mana
Core.Environment.resources.mana_per_time_no_base = Core.Environment.resources.mana
Core.Environment.resources.energy_per_time = Core.Environment.resources.energy
Core.Environment.resources.energy_per_time_no_base = Core.Environment.resources.energy
Core.Environment.resources.runic_power_per_time = Core.Environment.resources.runic_power
Core.Environment.resources.runic_power_per_time_no_base = Core.Environment.resources.runic_power
Core.Environment.resources.rage_per_time = Core.Environment.resources.rage
Core.Environment.resources.rage_per_time_no_base = Core.Environment.resources.rage
Core.Environment.resources.fury_per_time = Core.Environment.resources.fury
Core.Environment.resources.fury_per_time_no_base = Core.Environment.resources.fury
Core.Environment.resources.pain_per_time = Core.Environment.resources.pain
Core.Environment.resources.pain_per_time_no_base = Core.Environment.resources.pain
Core.Environment.resources.maelstrom_per_time = Core.Environment.resources.maelstrom
Core.Environment.resources.maelstrom_per_time_no_base = Core.Environment.resources.maelstrom
