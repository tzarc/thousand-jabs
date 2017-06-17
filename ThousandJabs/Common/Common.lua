local LibStub = LibStub
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Config = TJ:GetModule('Config')
local UnitCache = TJ:GetModule('UnitCache')

local UnitExists = UnitExists
local UnitHealth = UnitHealth
local UnitHealthMax = UnitHealthMax
local UnitLevel = UnitLevel

Core:Safety()

-- Simplify aura definitions
Core:RegisterFallbackTable('player_aura_mine', {
    AuraUnit = 'player',
    AuraMine = true,
})
Core:RegisterFallbackTable('player_aura_any', {
    AuraUnit = 'player',
    AuraMine = false,
})
Core:RegisterFallbackTable('target_aura_mine', {
    AuraUnit = 'target',
    AuraMine = true,
})
Core:RegisterFallbackTable('target_aura_any', {
    AuraUnit = 'target',
    AuraMine = false,
})

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
}

Core.Environment.base = {
    predictionOffset = 0,
    gcd = 0,
    gcd_remains = 0,
    currentTime = function(env, _)
        return env.sampleTime + env.predictionOffset
    end,
    time_since_combat_start = function(env)
        return (env.combatStart > 0) and (env.currentTime - env.combatStart) or 0
    end,
    time_since_incoming_damage = function(env)
        return (TJ.lastIncomingDamage > 0) and (env.currentTime - TJ.lastIncomingDamage) or 0
    end,
}

Core.Environment.common = {
    wait = Core:BuildFallbackTable('wait', {
        AbilityID = 61304, -- GCD
        Name = '',
        Icon = "Interface\\Icons\\spell_holy_borrowedtime",
        spell_cast_time = 1,
        perform_cast = function(spell, env) end,
    }),

    auto_attack = Core:BuildFallbackTable('auto_attack', { SpellIDs = { 6603 }, }),

    arcane_torrent = Core:BuildFallbackTable('arcane_torrent', { SpellIDs = { 202719 }, }),

    movement = Core:BuildFallbackTable('movement', {
        remains = 0,
        distance = 9999,
        raid_event_in = 180,
    }),

    raid_movement = Core:BuildFallbackTable('raid_movement', {
        remains = 0,
        raid_event_in = 180,
        aura_up = false,
    }),

    level = Core:BuildFallbackTable('level', {
        curr = function(self, state) return UnitLevel('player') or 0 end,
    }),

    health = Core:BuildFallbackTable('health', {
        curr = function(self, state) return UnitHealth('player') or 0 end,
        max = function(self, state) return UnitHealthMax('player') or 0 end,
        percent = function(self, state) return UnitExists('player') and (100 * UnitHealth('player') / UnitHealthMax('player')) or 0, true end,
        target_percent = function(self, state) return UnitExists('target') and (100 * UnitHealth('target') / UnitHealthMax('target')) or 0, true end,
    }),

    target = Core:BuildFallbackTable('target', {
        exists = function(self, state) return UnitExists('target'), true end,
        time_to_die = function(self, state) return UnitCache:UnitTimeToDie('target') or 99999 end,
        is_casting = false,
        is_interruptible = false,
    }),

    player = Core:BuildFallbackTable('player', {
        is_casting = false,
        is_interruptible = false,
    }),

    pet = Core:BuildFallbackTable('pet', {
        is_casting = false,
        is_interruptible = false,
    }),

    variable = Core:BuildFallbackTable('variable', {}),

    adds = Core:BuildFallbackTable('adds', {
        raid_event_exists = function(self, state) return (state.active_enemies > 1) and true or false end,
        raid_event_up = function(self, state) return self.raid_event_exists end,
        raid_event_in = 180,
        raid_event_count = 0,
    }),

    potion = Core:BuildFallbackTable('potion', {
        AuraID = {}, -- TODO (do we actually care?)
        AuraUnit = 'player',
        AuraMine = true,
        Icon = 'Interface\\Icons\\inv_potion_108',
        ConfigName = 'Potion'
    }),

    proc = Core:BuildFallbackTable('proc', {
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
    }),

    stacking_proc = Core:BuildFallbackTable('stacking_proc', {
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
    }),

    bloodlust = Core:BuildFallbackTable('bloodlust', {
        AuraID = {
            2825, -- Bloodlust
            32182, -- Heroism
            80353, -- Time Warp
            90355, -- Ancient Hysteria
            160452, -- Netherwinds
            178207, -- Drums of Fury
        },
    }, 'player_aura_any' , 'aura'),

    sated = Core:BuildFallbackTable('sated', {
        AuraID = {
            57724, -- Bloodlust/Sated
            57723, -- Heroism/Exhaustion
            80354, -- Time Warp/Temporal Displacement
            95809, -- Ancient Hysteria/Insanity
            160455, -- Netherwinds/Fatigued
        -- ?????, -- Drums of Fury/TBD
        },
    }, 'player_aura_any', 'aura'),

    melee = Core:BuildFallbackTable('melee', {
        in_range = function(spell, env)
            return (env.movement.distance <= 5) and true or false
        end,
    }),

    out_of_range = Core:BuildFallbackTable('out_of_range', {
        aura_up = function(spell, env)
            return (env.movement.distance > 5) and true or false
        end,
    }),

    concordance_of_the_legionfall = Core:BuildFallbackTable('concordance_of_the_legionfall', { AuraID = { 242583, 242584, 242586, 243096 } }, 'player_aura_mine'),
}
Core.Environment.common.exhaustion = Core.Environment.common.sated
