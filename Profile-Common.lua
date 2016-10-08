local _, internal = ...;
internal.WrapGlobalAccess()
local Z = internal.Z
local DBG = internal.DBG
local LUC = LibStub('LibUnitCache-1.0')
local floor = math.floor

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
        return (Z.combatStart > 0) and (env.currentTime - Z.combatStart) or 0
    end,
    time_since_incoming_damage = function(env, _)
        return (Z.lastIncomingDamage > 0) and (env.currentTime - Z.lastIncomingDamage) or 0
    end,
}

internal.commonData = {
    -- Waiting for abilities...
    wait = {
        AbilityID = 61304, -- GCD
        Icon = "Interface\\Icons\\spell_holy_borrowedtime",
        spell_cast_time = 1,
        perform_cast = function(spell,env) end,
    },
    auto_attack = { SpellIDs = { 6603 }, },
    arcane_torrent = { SpellIDs = { 202719 }, },
    movement = {
        remains = 0,
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
        is_casting = function(self,state) return false end,
        time_to_die = function(self,state) return LUC:UnitTimeToDie('target') or 99999 end
    },
    player = {
        is_casting = function(self,state) return false end,
    },
    variable = {
    },
    adds = {
        raid_event_exists = function(self,state) return (state.active_enemies > 1) and true or false end,
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

internal.resources = {
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
            local swingspeed = UnitAttackSpeed('player')
            if Z.lastAutoAttack < GetTime() - swingspeed then Z.lastAutoAttack = GetTime() end
            local predicted = floor((env.currentTime - Z.lastAutoAttack) / swingspeed)
            DBG("Current time: %.3f, last auto-attack: %.3f, time difference: %.3f", env.currentTime, Z.lastAutoAttack, (env.currentTime - Z.lastAutoAttack))
            predicted = (predicted > 0) and predicted or 0
            return predicted * 25
        end,
        curr = function(power, env) return power.sampled + power.gained + power.gained_from_autoattacks - power.spent + power.gained end,
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
        gained = 0,
        spent = 0,
        curr = function(power,env) return power.sampled - power.spent + power.gained end,
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
