--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BfA only.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if GetBuildInfo and select(4, GetBuildInfo()) < 80000 then
    return
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local LibStub = LibStub
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs8')
local Core = TJ:GetModule('Core')
local Config = TJ:GetModule('Config')
local UnitCache = TJ:GetModule('UnitCache')

local GetPowerRegen = GetPowerRegen
local GetRuneCooldown = GetRuneCooldown
local GetSpecialization = GetSpecialization
local GetTime = GetTime
local mfloor = math.floor
local mmax = math.max
local mmin = math.min
local select = select
local tinsert = table.insert
local tremove = table.remove
local tsort = table.sort
local UnitAttackSpeed = UnitAttackSpeed
local UnitClass = UnitClass
local UnitExists = UnitExists
local UnitHealth = UnitHealth
local UnitHealthMax = UnitHealthMax
local UnitLevel = UnitLevel
local UnitPower = UnitPower
local UnitPowerMax = UnitPowerMax
local UnitRace = UnitRace
local wipe = wipe

local Enum_PowerType_Mana = Enum.PowerType.Mana
local Enum_PowerType_Mana = Enum.PowerType.Mana
local Enum_PowerType_Rage = Enum.PowerType.Rage
local Enum_PowerType_Focus = Enum.PowerType.Focus
local Enum_PowerType_Energy = Enum.PowerType.Energy
local Enum_PowerType_ComboPoints = Enum.PowerType.ComboPoints
local Enum_PowerType_Runes = Enum.PowerType.Runes
local Enum_PowerType_RunicPower = Enum.PowerType.RunicPower
local Enum_PowerType_SoulShards = Enum.PowerType.SoulShards
local Enum_PowerType_LunarPower = Enum.PowerType.LunarPower
local Enum_PowerType_HolyPower = Enum.PowerType.HolyPower
local Enum_PowerType_Alternate = Enum.PowerType.Alternate
local Enum_PowerType_Maelstrom = Enum.PowerType.Maelstrom
local Enum_PowerType_Chi = Enum.PowerType.Chi
local Enum_PowerType_ArcaneCharges = Enum.PowerType.ArcaneCharges
local Enum_PowerType_Fury = Enum.PowerType.Fury
local Enum_PowerType_Pain = Enum.PowerType.Pain
local Enum_PowerType_Insanity = Enum.PowerType.Insanity


Core:Safety()

Core.Environment.globalBlacklist = {
    'auto_attack',
    'potion',
    'blood_fury',
    'berserking',
    'bloodlust',
    'use_item',
    'use_items',
    'food',
    'flask',
    'augmentation',
    'snapshot_stats',
    'strict_sequence', -- TODO...maybe.
}

Core.Environment.base = {
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

Core.Environment.common = {
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
        raid_event_distance = 9999,
        raid_event_exists = false,
    },
    race = {
        blood_elf = function(self,state) return select(2, UnitRace('player')) == "BloodElf" and true or false end,
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
        raid_event_count = 0,
    },
    potion = {
        AuraID = {}, -- TODO (do we actually care?)
        AuraUnit = 'player',
        AuraMine = true,
        Icon = 'Interface\\Icons\\inv_potion_108',
        ConfigName = 'Potion'
    },
    cooldown = {
        trinket_remains = false, -- TODO (do we actually care?)
    },
    proc = {
        trinket_any_react = false, -- TODO (do we actually care?)
        trinket_any_remains = 0, -- TODO (do we actually care?)
        trinket_agility_react = false, -- TODO (do we actually care?)
        trinket_agility_remains = 0, -- TODO (do we actually care?)
        trinket_intellect_react = false, -- TODO (do we actually care?)
        trinket_intellect_remains = 0, -- TODO (do we actually care?)
        trinket_strength_react = false, -- TODO (do we actually care?)
        trinket_strength_remains = 0, -- TODO (do we actually care?)
        trinket_spell_power_react = false, -- TODO (do we actually care?)
        trinket_spell_power_remains = 0, -- TODO (do we actually care?)
        trinket_haste_react = false, -- TODO (do we actually care?)
        trinket_haste_remains = 0, -- TODO (do we actually care?)
        trinket_crit_react = false, -- TODO (do we actually care?)
        trinket_crit_remains = 0, -- TODO (do we actually care?)
        trinket_mastery_react = false, -- TODO (do we actually care?)
        trinket_mastery_remains = 0, -- TODO (do we actually care?)
        trinket_versatility_react = false, -- TODO (do we actually care?)
        trinket_versatility_remains = 0, -- TODO (do we actually care?)
    },
    stacking_proc = {
        trinket_any_react = false, -- TODO (do we actually care?)
        trinket_any_remains = 0, -- TODO (do we actually care?)
        trinket_agility_react = false, -- TODO (do we actually care?)
        trinket_agility_remains = 0, -- TODO (do we actually care?)
        trinket_intellect_react = false, -- TODO (do we actually care?)
        trinket_intellect_remains = 0, -- TODO (do we actually care?)
        trinket_strength_react = false, -- TODO (do we actually care?)
        trinket_strength_remains = 0, -- TODO (do we actually care?)
        trinket_spell_power_react = false, -- TODO (do we actually care?)
        trinket_spell_power_remains = 0, -- TODO (do we actually care?)
        trinket_haste_react = false, -- TODO (do we actually care?)
        trinket_haste_remains = 0, -- TODO (do we actually care?)
        trinket_crit_react = false, -- TODO (do we actually care?)
        trinket_crit_remains = 0, -- TODO (do we actually care?)
        trinket_mastery_react = false, -- TODO (do we actually care?)
        trinket_mastery_remains = 0, -- TODO (do we actually care?)
        trinket_versatility_react = false, -- TODO (do we actually care?)
        trinket_versatility_remains = 0, -- TODO (do we actually care?)
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
    sated = {
        AuraID = {
            57724, -- Bloodlust/Sated
            57723, -- Heroism/Exhaustion
            80354, -- Time Warp/Temporal Displacement
            95809, -- Ancient Hysteria/Insanity
            160455, -- Netherwinds/Fatigued
        -- ?????, -- Drums of Fury/TBD
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
    concordance_of_the_legionfall = {
        AuraID = { 242583, 242584, 242586, 243096 },
        AuraUnit = 'player',
        AuraMine = true,
    },
    stoneform = {
        AuraID = { 20594 },
        AuraUnit = 'player',
        AuraMine = true,
    },
}
Core.Environment.common.exhaustion = Core.Environment.common.sated

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

local function rune_calc(currentTime, rune_tbl, gained, spent)
    wipe(rune_tbl)
    for i=1,6 do
        local s, d = GetRuneCooldown(i)
        s, d = (s or 0), (d or 0)
        local remaining = mmax(0, s + d - currentTime)
        rune_tbl[i] = remaining
    end
    tsort(rune_tbl)
    for i=1,gained do rune_tbl[i] = 0 end -- Change to zero at the front to cater for gained runes
    for i=1,spent do rune_tbl[i] = 15 end -- Change to 15 at the front to cater for spent runes
    tsort(rune_tbl)
    return rune_tbl
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

Core.Environment.resources = {
    mana = {
        sampled = function(power, env) return (UnitPower('player', Enum_PowerType_Mana) or 0) end,
        regen = function(power, env) return GetPowerRegen() end,
        spent = 0,
        gained = 0,
        curr = function(power, env) return power.sampled + power.gained - power.spent + power.regen * env.predictionOffset end,
        max = function(power, env) return (UnitPowerMax('player', Enum_PowerType_Mana) or 0) end,
        time_to_max = function(power, env) return (power.max - power.curr) / power.regen end,
        deficit = function(power,env) return power.max - power.curr end,
        can_spend = generic_can_spend,
        perform_spend = generic_perform_spend,
    },
    soul_shards = {
        sampled = function(power, env) return (UnitPower('player', Enum_PowerType_SoulShards) or 0) end,
        spent = 0,
        gained = 0,
        curr = function(power, env) return power.sampled - power.spent + power.gained end,
        max = function(power, env) return (UnitPowerMax('player', Enum_PowerType_SoulShards) or 0) end,
        deficit = function(power,env) return power.max - power.curr end,
        can_spend = generic_can_spend,
        perform_spend = generic_perform_spend,
    },
    energy = {
        sampled = function(power, env) return (UnitPower('player', Enum_PowerType_Energy) or 0) end,
        regen = function(power, env) return GetPowerRegen() end,
        spent = 0,
        gained = 0,
        curr = function(power, env) return power.sampled + power.gained - power.spent + power.regen * env.predictionOffset end,
        max = function(power, env) return (UnitPowerMax('player', Enum_PowerType_Energy) or 0) end,
        time_to_max = function(power, env) return (power.max - power.curr) / power.regen end,
        deficit = function(power,env) return power.max - power.curr end,
        can_spend = generic_can_spend,
        perform_spend = generic_perform_spend,
    },
    chi = {
        sampled = function(power, env) return (UnitPower('player', Enum_PowerType_Chi) or 0) end,
        spent = 0,
        gained = 0,
        curr = function(power, env) return power.sampled - power.spent + power.gained end,
        max = function(power, env) return (UnitPowerMax('player', Enum_PowerType_Chi) or 0) end,
        deficit = function(power,env) return power.max - power.curr end,
        can_spend = generic_can_spend,
        perform_spend = generic_perform_spend,
    },
    rage = {
        sampled = function(power, env) return (UnitPower('player', Enum_PowerType_Rage) or 0) end,
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
        max = function(power, env) return (UnitPowerMax('player', Enum_PowerType_Rage) or 0) end,
        deficit = function(power,env) return power.max - power.curr end,
        can_spend = generic_can_spend,
        perform_spend = generic_perform_spend,
    },
    pain = {
        sampled = function(power,env) return (UnitPower('player', Enum_PowerType_Pain) or 0) end,
        gained = 0,
        spent = 0,
        curr = function(power,env) return power.sampled - power.spent + power.gained end,
        max = function(power,env) return (UnitPowerMax('player', Enum_PowerType_Pain) or 0) end,
        deficit = function(power,env) return power.max - power.curr end,
        can_spend = generic_can_spend,
        perform_spend = generic_perform_spend,
    },
    fury = {
        sampled = function(power,env) return (UnitPower('player', Enum_PowerType_Fury) or 0) end,
        spent = 0,
        gained = 0,
        gained_from_autoattacks = function(spell,env)
            if IsHavoc() and env.demon_blades.talent_enabled and not Config:GetSpec('ignore_demon_blades_gains') then
                local now = GetTime()
                local mh_speed, oh_speed = UnitAttackSpeed('player')
                oh_speed = oh_speed or 99999
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
        max = function(power,env) return (UnitPowerMax('player', Enum_PowerType_Fury) or 0) end,
        deficit = function(power,env) return power.max - power.curr end,
        can_spend = generic_can_spend,
        perform_spend = generic_perform_spend,
    },
    soul_fragments = {
        AuraID = 203981,
        AuraUnit = 'player',
        AuraMine = true,
        spent = 0,
        gained = 0,
        curr = function(power, env) return power.aura_stack - power.spent + power.gained end,
        can_spend = generic_can_spend,
        perform_spend = generic_perform_spend,
    },
    rune = {
        gained = 0,
        spent = 0,
        skipped = 0,

        curr = function(power,env)
            local all_remains = power.sample

            -- Count the ready runes
            local count = 0
            for i=1,6 do
                if all_remains[i] == 0 then
                    count = count + 1
                end
            end

            return count
        end,

        all_remains = {},
        sample = function(power,env)
            power.all_remains = power.all_remains or {}
            return rune_calc(env.currentTime, power.all_remains, power.gained, power.spent)
        end,

        time_to_1 = function(power,env) return power.sample[1] end,
        time_to_2 = function(power,env) return power.sample[2] end,
        time_to_3 = function(power,env) return power.sample[3] end,
        time_to_4 = function(power,env) return power.sample[4] end,
        time_to_5 = function(power,env) return power.sample[5] end,
        time_to_6 = function(power,env) return power.sample[6] end,

        can_spend = generic_can_spend,
        perform_spend = generic_perform_spend,
    },
    runic_power = {
        sampled = function(power,env) return (UnitPower('player', Enum_PowerType_RunicPower) or 0) end,
        gained = 0,
        spent = 0,
        curr = function(power,env) return power.sampled - power.spent + power.gained + ((env.rune.spent-env.rune.skipped) * 10) end,
        max = function(power,env) return (UnitPowerMax('player', Enum_PowerType_RunicPower) or 0) end,
        deficit = function(power,env) return power.max - power.curr end,
        can_spend = generic_can_spend,
        perform_spend = generic_perform_spend,
    },
    maelstrom = {
        sampled = function(power,env) return (UnitPower('player', Enum_PowerType_Maelstrom) or 0) end,
        gained = 0,
        spent = 0,
        curr = function(power,env) return power.sampled - power.spent + power.gained end,
        max = function(power,env) return (UnitPowerMax('player', Enum_PowerType_Maelstrom) or 0) end,
        deficit = function(power,env) return power.max - power.curr end,
        can_spend = generic_can_spend,
        perform_spend = generic_perform_spend,
    },
    holy_power = {
        sampled = function(power,env) return (UnitPower('player', Enum_PowerType_HolyPower) or 0) end,
        gained = 0,
        spent = 0,
        curr = function(power,env) return power.sampled - power.spent + power.gained end,
        max = function(power,env) return (UnitPowerMax('player', Enum_PowerType_HolyPower) or 0) end,
        deficit = function(power,env) return power.max - power.curr end,
        can_spend = generic_can_spend,
        perform_spend = generic_perform_spend,
    },
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
Core.Environment.resources.holy_power_per_time = Core.Environment.resources.holy_power
Core.Environment.resources.holy_power_per_time_no_base = Core.Environment.resources.holy_power
