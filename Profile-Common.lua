local addonName, internal = ...;
local TJ = internal.TJ
local Debug = internal.Debug
local fmt = internal.fmt
local UnitCache = TJ:GetModule('UnitCache')

local SPELL_POWER_CHI = SPELL_POWER_CHI
local SPELL_POWER_ENERGY = SPELL_POWER_ENERGY
local SPELL_POWER_FURY = SPELL_POWER_FURY
local SPELL_POWER_MANA = SPELL_POWER_MANA
local SPELL_POWER_PAIN = SPELL_POWER_PAIN
local SPELL_POWER_RAGE = SPELL_POWER_RAGE
local SPELL_POWER_RUNIC_POWER = SPELL_POWER_RUNIC_POWER
local SPELL_POWER_SOUL_SHARDS = SPELL_POWER_SOUL_SHARDS
local mfloor = math.floor
local pairs = pairs
local select = select
local CheckInteractDistance = CheckInteractDistance
local GetPowerRegen = GetPowerRegen
local GetRuneCooldown = GetRuneCooldown
local GetSpecialization = GetSpecialization
local GetTime = GetTime
local IsItemInRange = IsItemInRange
local UnitAttackSpeed = UnitAttackSpeed
local UnitClass = UnitClass
local UnitExists = UnitExists
local UnitHealth = UnitHealth
local UnitHealthMax = UnitHealthMax
local UnitLevel = UnitLevel
local UnitPower = UnitPower
local UnitPowerMax = UnitPowerMax

internal.Safety()

internal.global_blacklisted_abilities = {
    'auto_attack',
    'potion',
    'blood_fury',
    'berserking',
    'bloodlust',
    'use_item',
}

internal.baseEnvironment = {
    predictionOffset = 0,
    gcd = 0,
    gcd_remains = 0,
    currentTime = function(env, _)
        return env.sampleTime + env.predictionOffset
    end,
    time_since_combat_start = function(env, _)
        return (env.combatStart > 0) and (env.currentTime - env.combatStart) or 0
    end,
    time_since_incoming_damage = function(env, _)
        return (TJ.lastIncomingDamage > 0) and (env.currentTime - TJ.lastIncomingDamage) or 0
    end,
}

internal.commonData = {
    -- Waiting for abilities...
    wait = {
        AbilityID = 61304, -- GCD
        Name = '',
        Icon = "Interface\\Icons\\spell_holy_borrowedtime",
        spell_cast_time = 1,
        perform_cast = function(spell,env) end,
    },
    auto_attack = { SpellIDs = { 6603 }, },
    arcane_torrent = { SpellIDs = { 202719 }, },
    movement = {
        remains = 0,
        distance = 9999,
        raid_event_in = 180,
    },
    raid_movement = {
        remains = 0,
        raid_event_in = 180,
        aura_up = false,
    },
    level = {
        curr = function(self,state) return UnitLevel('player') or 0 end,
    },
    health = {
        curr = function(self,state) return UnitHealth('player') or 0 end,
        max = function(self,state) return UnitHealthMax('player') or 0 end,
        percent = function(self,state) return UnitExists('player') and (100 * UnitHealth('player') / UnitHealthMax('player')) or 0, true end,
        target_percent = function(self,state) return UnitExists('target') and (100 * UnitHealth('target') / UnitHealthMax('target')) or 0, true end,
    },
    target = {
        exists = function(self,state) return UnitExists('target'), true end,
        time_to_die = function(self,state) return UnitCache:UnitTimeToDie('target') or 99999 end,
        is_casting = false,
        is_interruptible = false,
    },
    player = {
        is_casting = false,
        is_interruptible = false,
    },
    pet = {
        is_casting = false,
        is_interruptible = false,
    },
    variable = {
    },
    adds = {
        raid_event_exists = function(self,state) return (state.active_enemies > 1) and true or false end,
        raid_event_up = function(self,state) return self.raid_event_exists end,
        raid_event_in = 180,
    },

    bloodlust = {
        AuraID = {
            2825, -- Bloodlust
            32182, -- Heroism
            80353, -- Time Warp
            90355, -- Ancient Hysteria
            160452, -- Netherwinds
            178207, -- Drums of Fury
        },
        AuraUnit = 'player',
        AuraMine = false,
    },
    melee = {
        in_range = function(spell, env)
            return (env.movement.distance <= 5) and true or false
        end,
    },
    out_of_range = {
        aura_up = function(spell,env)
            return (env.movement.distance > 5) and true or false
        end,
    },

}

local function generic_can_spend(power, env, action, costType, costAmount)
    -- If the profile has a hook present for the action cost, execute that first
    local h = env.hooks
    if h then
        local cb = h.can_spend
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
    -- If the profile has a hook present for the action cost, execute that first
    local h = env.hooks
    if h then
        local cb = h.perform_spend
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
    power.spent = power.spent + costAmount
end

local function IsArmsWarrior()
    local classID, specID = select(3, UnitClass('player')), GetSpecialization()
    if classID == 1 and specID == 1 then
        return true
    end
end

local function IsHavoc()
    local classID, specID = select(3, UnitClass('player')), GetSpecialization()
    if classID == 12 and specID == 1 then
        return true
    end
end

internal.resources = {
    mana = {
        sampled = function(power, env) return (UnitPower('player', SPELL_POWER_MANA) or 0) end,
        regen = function(power, env) return GetPowerRegen() end,
        spent = 0,
        gained = 0,
        curr = function(power, env) return power.sampled + power.gained - power.spent + power.regen * env.predictionOffset end,
        max = function(power, env) return (UnitPowerMax('player', SPELL_POWER_MANA) or 0) end,
        time_to_max = function(power, env) return (power.max - power.curr) / power.regen end,
        deficit = function(power,env) return power.max - power.curr end,
        can_spend = generic_can_spend,
        perform_spend = generic_perform_spend,
    },
    soul_shards = {
        sampled = function(power, env) return (UnitPower('player', SPELL_POWER_SOUL_SHARDS) or 0) end,
        spent = 0,
        gained = 0,
        curr = function(power, env) return power.sampled - power.spent + power.gained end,
        max = function(power, env) return (UnitPowerMax('player', SPELL_POWER_SOUL_SHARDS) or 0) end,
        deficit = function(power,env) return power.max - power.curr end,
        can_spend = generic_can_spend,
        perform_spend = generic_perform_spend,
    },
    energy = {
        sampled = function(power, env) return (UnitPower('player', SPELL_POWER_ENERGY) or 0) end,
        regen = function(power, env) return GetPowerRegen() end,
        spent = 0,
        gained = 0,
        curr = function(power, env) return power.sampled + power.gained - power.spent + power.regen * env.predictionOffset end,
        max = function(power, env) return (UnitPowerMax('player', SPELL_POWER_ENERGY) or 0) end,
        time_to_max = function(power, env) return (power.max - power.curr) / power.regen end,
        deficit = function(power,env) return power.max - power.curr end,
        can_spend = generic_can_spend,
        perform_spend = generic_perform_spend,
    },
    chi = {
        sampled = function(power, env) return (UnitPower('player', SPELL_POWER_CHI) or 0) end,
        spent = 0,
        gained = 0,
        curr = function(power, env) return power.sampled - power.spent + power.gained end,
        max = function(power, env) return (UnitPowerMax('player', SPELL_POWER_CHI) or 0) end,
        deficit = function(power,env) return power.max - power.curr end,
        can_spend = generic_can_spend,
        perform_spend = generic_perform_spend,
    },
    rage = {
        sampled = function(power, env) return (UnitPower('player', SPELL_POWER_RAGE) or 0) end,
        spent = 0,
        gained = 0,
        gained_from_autoattacks = function(spell,env)
            if IsArmsWarrior() then
                local now = GetTime()
                local swingspeed = UnitAttackSpeed('player')
                if TJ.lastMainhandAttack < now - swingspeed then TJ.lastMainhandAttack = now end
                local predicted = mfloor((env.currentTime - TJ.lastMainhandAttack) / swingspeed)
                predicted = (predicted > 0) and predicted or 0
                return predicted * 25
            end
            return 0
        end,
        curr = function(power, env) return power.sampled + power.gained + power.gained_from_autoattacks - power.spent end,
        max = function(power, env) return (UnitPowerMax('player', SPELL_POWER_RAGE) or 0) end,
        deficit = function(power,env) return power.max - power.curr end,
        can_spend = generic_can_spend,
        perform_spend = generic_perform_spend,
    },
    pain = {
        sampled = function(power,env) return (UnitPower('player', SPELL_POWER_PAIN) or 0) end,
        gained = 0,
        spent = 0,
        curr = function(power,env) return power.sampled - power.spent + power.gained end,
        max = function(power,env) return (UnitPowerMax('player', SPELL_POWER_PAIN) or 0) end,
        deficit = function(power,env) return power.max - power.curr end,
        can_spend = generic_can_spend,
        perform_spend = generic_perform_spend,
    },
    fury = {
        sampled = function(power,env) return (UnitPower('player', SPELL_POWER_FURY) or 0) end,
        spent = 0,
        gained = 0,
        gained_from_autoattacks = function(spell,env)
            if IsHavoc() and env.demon_blades.talent_enabled then
                local now = GetTime()
                local mh_speed, oh_speed = UnitAttackSpeed('player')
                if TJ.lastMainhandAttack < now - mh_speed then TJ.lastMainhandAttack = now end
                if TJ.lastOffhandAttack < now - oh_speed then TJ.lastOffhandAttack = now end
                local mh_swings = mfloor((env.currentTime - TJ.lastMainhandAttack) / mh_speed)
                local oh_swings = mfloor((env.currentTime - TJ.lastOffhandAttack) / oh_speed)
                local fury_per_swing = env.demon_blades.base_estimate + env.demon_blades.aothg_estimate
                return (mh_swings + oh_swings) * fury_per_swing
            end
            return 0
        end,
        curr = function(power,env) return power.sampled - power.spent + power.gained + power.gained_from_autoattacks end,
        max = function(power,env) return (UnitPowerMax('player', SPELL_POWER_FURY) or 0) end,
        deficit = function(power,env) return power.max - power.curr end,
        can_spend = generic_can_spend,
        perform_spend = generic_perform_spend,
    },
    soul_fragments = {
        AuraID = 203981,
        AuraUnit = 'player',
        AuraMine = true,
        spent = 0,
        curr = function(power, env) return power.aura_stack - power.spent end,
        can_spend = generic_can_spend,
        perform_spend = generic_perform_spend,
    },
    rune = {
        gained = 0,
        spent = 0,
        skipped = 0,
        curr = function(power,env)
            local r = power.sampled + power.gained - power.spent
            --[[
            local tx = { string.format("actual = %.2f, calculated = %.2f", GetTime(), env.currentTime) }
            for i=1,6 do
            local s,d,r = GetRuneCooldown(i)
            local remaining = math.max(0, s + d - env.currentTime)
            table.insert(tx, remaining > 0 and remaining or true)
            end
            table.insert(tx, r)
            DevTools_Dump{tx=tx}
            ]]
            return r
        end,

        sampled = function(power,env)
            local count = 0
            for i=1,6 do
                local s, d = GetRuneCooldown(i)
                if env.currentTime >= (s + d) then count = count + 1 end
            end
            return count
        end,
        can_spend = generic_can_spend,
        perform_spend = generic_perform_spend,
    },
    runic_power = {
        sampled = function(power,env) return (UnitPower('player', SPELL_POWER_RUNIC_POWER) or 0) end,
        gained = 0,
        spent = 0,
        curr = function(power,env) return power.sampled - power.spent + power.gained + ((env.rune.spent-env.rune.skipped) * 10) end,
        max = function(power,env) return (UnitPowerMax('player', SPELL_POWER_RUNIC_POWER) or 0) end,
        deficit = function(power,env) return power.max - power.curr end,
        can_spend = generic_can_spend,
        perform_spend = generic_perform_spend,
    },
}

-- Set up the per-time resources to match the base resources
internal.resources.energy_per_time = internal.resources.energy
internal.resources.mana_per_time_no_base = internal.resources.mana
