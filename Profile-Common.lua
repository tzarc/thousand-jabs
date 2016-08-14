local addonName, internal = ...;
local Z = internal.Z
local DBG = internal.DBG
local LTC = LibStub('LibTableCache-1.0')
local LUC = LibStub('LibUnitCache-1.0')
local tcontains = tContains

internal.global_blacklisted_abilities = {
    auto_attack = true,
    potion = true,
    blood_fury = true,
    berserking = true,
    bloodlust = true,
    arcane_torrent = true,
}

internal.baseEnvironment = {
    predictionOffset = 0,
    gcd = 0,
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
        Icon = "Interface\\Icons\\spell_holy_borrowedtime",
        spell_cast_time = 1,
        perform_cast = function(spell,env) end,
    },
    movement = {
        remains = 0,
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
    },
    player = {
        is_casting = function(self,state) return false end,
    },
}

internal.resources = {
    energy = {
        sampled = function(power, env) return (UnitPower('player', SPELL_POWER_ENERGY) or 0) end,
        regen = function(power, env) return GetPowerRegen() end,
        spent = 0,
        gained = 0,
        curr = function(power, env) return power.sampled + power.gained - power.spent + power.regen * env.predictionOffset end,
        max = function(power, env) return (UnitPowerMax('player', SPELL_POWER_ENERGY) or 0) end,
        time_to_max = function(power, env) return (power.max - power.curr) /power.regen end,
        deficit = function(power,env) return power.max - power.sampled end,
    },
    chi = {
        sampled = function(power, env) return (UnitPower('player', SPELL_POWER_CHI) or 0) end,
        spent = 0,
        gained = 0,
        curr = function(power, env) return power.sampled - power.spent + power.gained end,
        max = function(power, env) return (UnitPowerMax('player', SPELL_POWER_CHI) or 0) end,
        deficit = function(power,env) return power.max - power.sampled end,
    },
    pain = {
        sampled = function(power,env) return (UnitPower('player', SPELL_POWER_PAIN) or 0) end,
        gained = 0,
        spent = 0,
        curr = function(power,env) return power.sampled - power.spent + power.gained end,
        max = function(power,env) return (UnitPowerMax('player', SPELL_POWER_PAIN) or 0) end,
        deficit = function(power,env) return power.max - power.sampled end,
    },
    fury = {
        sampled = function(power,env) return (UnitPower('player', SPELL_POWER_FURY) or 0) end,
        gained = 0,
        spent = 0,
        curr = function(power,env) return power.sampled - power.spent + power.gained end,
        max = function(power,env) return (UnitPowerMax('player', SPELL_POWER_FURY) or 0) end,
        deficit = function(power,env) return power.max - power.sampled end,
    },
    soul_fragments = {
        AuraID = 203981,
        AuraUnit = 'player',
        AuraMine = true,
        spent = 0,
        curr = function(power, env) return power.aura_stack - power.spent end,
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
    },
    runic_power = {
        sampled = function(power,env) return (UnitPower('player', SPELL_POWER_RUNIC_POWER) or 0) end,
        gained = 0,
        spent = 0,
        curr = function(power,env) return power.sampled - power.spent + power.gained + ((env.rune.spent-env.rune.skipped) * 10) end,
        max = function(power,env) return (UnitPowerMax('player', SPELL_POWER_RUNIC_POWER) or 0) end,
    },
}
