local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Config = TJ:GetModule('Config')

------------------------------------------------------------------------------------------------------------------------
-- Vengeance profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local vengeance_abilities_exported = {
    abyssal_strike = { TalentIDs = { 1, 1 }, },
    agonizing_flames = { TalentIDs = { 1, 2 }, },
    blade_turning = { TalentIDs = { 6, 2 }, },
    burning_alive = { TalentIDs = { 2, 3 }, },
    concentrated_sigils = { TalentIDs = { 5, 1 }, },
    consume_magic = { SpellIDs = { 183752 }, },
    demon_spikes = { SpellIDs = { 203720 }, },
    empower_wards = { SpellIDs = { 218256 }, },
    fallout = { TalentIDs = { 2, 2 }, },
    feast_of_souls = { TalentIDs = { 2, 1 }, },
    feed_the_demon = { TalentIDs = { 4, 1 }, },
    fel_devastation = { SpellIDs = { 212084 }, TalentIDs = { 6, 1 }, },
    fel_eruption = { SpellIDs = { 211881 }, TalentIDs = { 3, 3 }, },
    felblade = { SpellIDs = { 213241 }, TalentIDs = { 3, 1 }, },
    fiery_brand = { SpellIDs = { 204021 }, },
    flame_crash = { TalentIDs = { 3, 2 }, },
    fracture = { SpellIDs = { 209795 }, TalentIDs = { 4, 2 }, },
    glide = { SpellIDs = { 131347 }, },
    immolation_aura = { SpellIDs = { 178740 }, },
    imprison = { SpellIDs = { 217832 }, },
    infernal_strike = { SpellIDs = { 189110 }, },
    last_resort = { TalentIDs = { 7, 1 }, },
    metamorphosis = { SpellIDs = { 187827 }, },
    nether_bond = { SpellIDs = { 207810 }, TalentIDs = { 7, 2 }, },
    quickened_sigils = { TalentIDs = { 5, 3 }, },
    razor_spikes = { TalentIDs = { 1, 3 }, },
    shear = { SpellIDs = { 203782 }, },
    sigil_of_chains = { SpellIDs = { 202138, 207665 }, TalentIDs = { 5, 2 }, },
    sigil_of_flame = { SpellIDs = { 204513, 204596 }, },
    sigil_of_misery = { SpellIDs = { 202140, 207684 }, },
    sigil_of_silence = { SpellIDs = { 202137, 207682 }, },
    soul_barrier = { SpellIDs = { 227225 }, TalentIDs = { 7, 3 }, },
    soul_carver = { SpellIDs = { 207407 }, },
    soul_cleave = { SpellIDs = { 228477 }, },
    soul_rending = { TalentIDs = { 4, 3 }, },
    spectral_sight = { SpellIDs = { 188501 }, },
    spirit_bomb = { SpellIDs = { 218679 }, TalentIDs = { 6, 3 }, },
    throw_glaive = { SpellIDs = { 204157 }, },
    torment = { SpellIDs = { 185245 }, },
}

local vengeance_base_overrides = {
    consume_magic = {
        CanCast = function(spell, env)
            return env.target.is_interruptible and true or false
        end,
        PerformCast = function(spell, env)
            env.pain.gained = env.pain.gained + 50
            if env.target.is_interruptible then
                env.target.is_casting = false
                env.target.is_interruptible = false
            end
        end
    },
    demon_spikes = {
        AuraID = 203819,
        AuraMine = true,
        AuraUnit = 'player',
        AuraApplied = 'demon_spikes',
        AuraApplyLength = 6,
        spell_cast_time = 0.01, -- off GCD!
    },
    fiery_brand = {
        AuraID = { 204021, 204022, 207744, 207771 },
        AuraMine = true,
        AuraUnit = 'target',
        AuraApplied = 'fiery_brand',
        AuraApplyLength = 10,
    },
    immolation_aura = {
        AuraID = 178740,
        AuraMine = true,
        AuraUnit = 'player',
        AuraApplied = 'immolation_aura',
        AuraApplyLength = 6,
    },
    infernal_strike = {
        in_flight = false,
        travel_time = 1,
        aura_duration = function(spell,env) return env.flame_crash.talent_selected and env.sigil_of_flame.aura_duration or 0 end,
        spell_delay = function(spell,env) return env.flame_crash.talent_selected and env.sigil_of_flame.spell_delay or 0 end,
        aura_remains = function(spell,env) return env.flame_crash.talent_selected and spell.aura_duration - spell.actual_time_since_last_cast or 0 end,
        spell_cast_time = 0.01, -- off GCD!

        -- Why do these use a different spellID?!
        actual_cast_spellid = 189111,
        actual_last_cast = function(spell, env)
            return env.lastCastTimes[spell.actual_cast_spellid] or 0
        end,
        actual_time_since_last_cast = function(spell, env)
            return env.currentTime - spell.actual_last_cast
        end,
        PerformCast = function(spell, env)
            env.lastCastTimes[spell.actual_cast_spellid] = env.currentTime
        end,
    },
    metamorphosis = {
        AuraID = 187827,
        AuraMine = true,
        AuraUnit = 'player',
        AuraApplied = 'metamorphosis',
        AuraApplyLength = 15,
    },
    shear = {
        PerformCast = function(spell, env)
            env.pain.gained = env.pain.gained + 10
        end
    },
    soul_cleave = {
        cost_type = 'pain',
        pain_cost = function(spell, env)
            local cost = env.pain.curr
            if cost < 30 then cost = 30 end
            if cost > 60 then cost = 60 end
            return cost
        end,
        CanCast = function(spell, env)
            return env.pain.curr > 30
        end,
        PerformCast = function(spell, env)
            env.soul_fragments.spent = env.soul_fragments.spent + env.soul_fragments.curr
        end,
    },
}

local vengeance_talent_overrides = {
    felblade = {
        PerformCast = function(spell, env)
            env.pain.gained = env.pain.gained + 20
        end,
    },
    fracture = {
        CanCast = function(spell, env)
            return env.soul_fragments.curr >= 2
        end,
        PerformCast = function(spell, env)
            env.soul_fragments.spent = env.soul_fragments.spent + 2
        end,
    },
    spirit_bomb = {
        AuraApplied = 'frailty',
        AuraApplyLength = 15,

        CanCast = function(spell, env)
            return env.soul_fragments.curr >= 1
        end,
        PerformCast = function(spell, env)
            env.soul_fragments.spent = env.soul_fragments.spent + 1
        end,
    },
    frailty = { -- Spirit bomb debuff
        AuraID = 224509,
        AuraUnit = 'target',
        AuraMine = true,
    }
}

local vengeance_artifact_overrides = {
    fiery_demise = {
        artifact_enabled = function(spell,env)
            return Config:GetSpec("fiery_demise_selected") and true or false
        end,
    },
}

local function sigilInitialiser(duration)
    return {
        spell_delay = function(spell, env) return env.quickened_sigils.talent_selected and 1 or 2 end,
        aura_duration = function(spell, env) return 8 + spell.spell_delay end,
        placed = function(spell, env) return spell.time_since_last_cast < spell.aura_duration end,
        aura_remains = function(spell, env) return spell.aura_duration - spell.time_since_last_cast end, -- TODO: Is this how long the DoT has to go?
    }
end

local vengeance_sigil_overrides = {
    any_sigil = {
        placed = function(spell, env)
            return env.sigil_of_flame.placed
                or env.sigil_of_misery.placed
                or env.sigil_of_silence.placed
                or (env.sigil_of_chains.talent_selected and env.sigil_of_chains.placed)
                or (env.flame_crash.talent_selected and env.infernal_strike.actual_time_since_last_cast < env.infernal_strike.aura_duration)
        end,
    },
    any_flame_sigil = {
        placed = function(spell, env)
            return env.sigil_of_flame.placed
                or (env.flame_crash.talent_selected and env.infernal_strike.actual_time_since_last_cast < env.infernal_strike.aura_duration)
        end,
    },
    sigil_of_flame = sigilInitialiser(),
    sigil_of_misery = sigilInitialiser(),
    sigil_of_silence = sigilInitialiser(),
    sigil_of_chains = sigilInitialiser(),
}

TJ:RegisterPlayerClass({
    name = 'Vengeance',
    class_id = 12,
    spec_id = 2,
    action_profile = 'legion-dev::demonhunter::vengeance',
    resources = { 'pain', 'soul_fragments' },
    actions = {
        vengeance_abilities_exported,
        vengeance_base_overrides,
        vengeance_talent_overrides,
        vengeance_artifact_overrides,
        vengeance_sigil_overrides,
    },
    blacklisted = {},
    config_checkboxes = {
        fiery_demise_selected = true,
    },
    conditional_substitutions = {
        { "in_flight", "infernal_strike.in_flight" },
        { "travel_time", "infernal_strike.travel_time" },
        { "sigil_placed", "any_flame_sigil.placed" },
    },
})

------------------------------------------------------------------------------------------------------------------------
-- Havoc profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local havoc_abilities_exported = {
    annihilation = { SpellIDs = { 201427 }, },
    blade_dance = { SpellIDs = { 188499 }, },
    blind_fury = { TalentIDs = { 1, 3 }, },
    bloodlet = { TalentIDs = { 3, 3 }, },
    blur = { SpellIDs = { 198589 }, },
    chaos_blades = { SpellIDs = { 211048 }, TalentIDs = { 7, 1 }, },
    chaos_cleave = { TalentIDs = { 1, 2 }, },
    chaos_nova = { SpellIDs = { 179057 }, },
    chaos_strike = { SpellIDs = { 162794 }, },
    consume_magic = { SpellIDs = { 183752 }, },
    darkness = { SpellIDs = { 196718 }, },
    death_sweep = { SpellIDs = { 210152 }, },
    demon_blades = { TalentIDs = { 2, 2 }, },
    demon_reborn = { TalentIDs = { 6, 3 }, },
    demonic = { TalentIDs = { 7, 3 }, },
    demonic_appetite = { TalentIDs = { 2, 3 }, },
    demons_bite = { SpellIDs = { 162243 }, },
    desperate_instincts = { TalentIDs = { 4, 2 }, },
    eye_beam = { SpellIDs = { 198013 }, },
    fel_barrage = { SpellIDs = { 211053 }, TalentIDs = { 7, 2 }, },
    fel_eruption = { SpellIDs = { 211881 }, TalentIDs = { 5, 2 }, },
    fel_mastery = { TalentIDs = { 1, 1 }, },
    fel_rush = { SpellIDs = { 195072 }, },
    felblade = { SpellIDs = { 213241 }, TalentIDs = { 3, 1 }, },
    first_blood = { TalentIDs = { 3, 2 }, },
    fury_of_the_illidari = { SpellIDs = { 201467 }, },
    glide = { SpellIDs = { 131347 }, },
    imprison = { SpellIDs = { 217832 }, },
    master_of_the_glaive = { TalentIDs = { 6, 1 }, },
    metamorphosis = { SpellIDs = { 191427 }, },
    momentum = { TalentIDs = { 5, 1 }, },
    nemesis = { SpellIDs = { 206491 }, TalentIDs = { 5, 3 }, },
    netherwalk = { SpellIDs = { 196555 }, TalentIDs = { 4, 1 }, },
    prepared = { TalentIDs = { 2, 1 }, },
    soul_rending = { TalentIDs = { 4, 3 }, },
    spectral_sight = { SpellIDs = { 188501 }, },
    throw_glaive = { SpellIDs = { 185123 }, },
    unleashed_power = { TalentIDs = { 6, 2 }, },
    vengeful_retreat = { SpellIDs = { 198793 }, },
}

local havoc_base_overrides = {
    demons_bite = {
        fury_gain = 23, -- 20-30, err on the side of caution
        CanCast = function(spell,env)
            return env.melee.in_range
        end,
        PerformCast = function(spell, env)
            env.fury.gained = env.fury.gained + spell.fury_gain
        end,
    },
    annihilation = {
        CanCast = function(spell,env)
            return env.melee.in_range
        end,
    },
    eye_beam = {
        CanCast = function(spell,env)
            return env.movement.distance < 20
        end,
    },
    fel_rush = {
        AuraApplied = 'momentum',
        AuraApplyLength = 10,
        PerformCast = function(spell,env)
            env.movement.distance = 5 -- melee
        end,
    },
    throw_glaive = {
        AuraApplied = 'bloodlet',
        AuraApplyLength = 10,
    },
    vengeful_retreat = {
        CanCast = function(spell,env)
            return env.melee.in_range
        end,
        PerformCast = function(spell,env)
            env.fury.gained = env.fury.gained + 8 -- 40fury/5sec
            env.momentum.expirationTime = env.currentTime + 3
            env.prepared.expirationTime = env.currentTime + 5
            env.movement.distance = 20 -- not melee
        end,
    },
    metamorphosis = {
        AuraID = 162264,
        AuraUnit = 'player',
        AuraMine = true,
        PerformCast = function(spell,env)
            env.movement.distance = 5 -- melee
        end,
    },
    bloodlet = {
        AuraID = 207690,
        AuraUnit = 'target',
        AuraMine = true,
    },
    momentum = {
        AuraID = 208628,
        AuraUnit = 'player',
        AuraMine = true,
    },
    prepared = {
        AuraID = 203650,
        AuraUnit = 'player',
        AuraMine = true,
    },
    nemesis = {
        AuraID = 206491,
        AuraUnit = 'target',
        AuraMine = true,
    },
    chaos_strike = {
        CanCast = function(spell,env)
            return env.melee.in_range
        end,
    },
    fury_of_the_illidari = {
        CanCast = function(spell,env)
            return env.melee.in_range
        end,
    },
    demon_speed = {
        artifact_enabled = function(spell,env) return Config:GetSpec("demon_speed_selected") end,
    },
    anguish_of_the_deceiver = {
        artifact_enabled = function(spell,env) return Config:GetSpec("anguish_of_the_deceiver_selected") end,
    },
}

local havoc_hooks = {
    hooks = {
        OnStateInit = function(env)
            -- we need to override the range after resetting the state, otherwise we get 'wait' and other inconsistencies
            if env.prev_gcd.vengeful_retreat then
                env.movement.distance = 20
            end
            if env.prev_gcd.fel_rush then
                env.movement.distance = 5
            end
        end,
        OnPredictActionAtOffset = function(env)
        --[[
        internal.Debug({
        prev_gcd_vengeful_retreat = env.prev_gcd.vengeful_retreat,
        range = env.movement.distance,
        melee_in_range = env.melee.in_range,
        out_of_range_aura_up = env.out_of_range.aura_up,
        fel_rush_cooldown_remains = env.fel_rush.cooldown_remains,
        fel_rush_spell_charges = env.fel_rush.spell_charges,
        fel_rush_spell_charges_fractional = env.fel_rush.spell_charges_fractional,
        })
        internal.Debug({
        throw_glaive_cooldown_remains = env.throw_glaive.cooldown_remains,
        throw_glaive_spell_charges = env.throw_glaive.spell_charges,
        throw_glaive_spell_charges_fractional = env.throw_glaive.spell_charges_fractional,
        })
        -- ]]
        end,
    }
}

TJ:RegisterPlayerClass({
    name = 'Havoc',
    class_id = 12,
    spec_id = 1,
    action_profile = 'legion-dev::demonhunter::havoc',
    resources = { 'fury', 'soul_fragments' },
    actions = {
        havoc_abilities_exported,
        havoc_base_overrides,
        havoc_hooks,
    },
    blacklisted = {
        'consume_magic',
        'pick_up_fragment',
    },
    config_checkboxes = {
        demon_speed_selected = true,
        anguish_of_the_deceiver_selected = true,
    },
    conditional_substitutions = {
        { " death_sweep_worth_using ", " death_sweep.worth_using " },
        { " blade_dance_worth_using ", " blade_dance.worth_using " },
    },
})
