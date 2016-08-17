local addonName, internal = ...;
local Z = internal.Z

------------------------------------------------------------------------------------------------------------------------
-- Vengeance profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local vengeance_abilities_exported = {
    abyssal_strike = { TalentIDs = { 1, 1 }, },
    agonizing_flames = { TalentIDs = { 1, 2 }, },
    arcane_torrent = { AbilityID = 202719, },
    auto_attack = { AbilityID = 6603, },
    blade_turning = { TalentIDs = { 6, 2 }, },
    burning_alive = { TalentIDs = { 2, 3 }, },
    concentrated_sigils = { TalentIDs = { 5, 1 }, },
    consume_magic = { AbilityID = 183752, },
    demon_spikes = { AbilityID = 203720, },
    empower_wards = { AbilityID = 218256, },
    fallout = { TalentIDs = { 2, 2 }, },
    feast_of_souls = { TalentIDs = { 2, 1 }, },
    feed_the_demon = { TalentIDs = { 4, 1 }, },
    fel_devastation = { AbilityID = 212084, TalentIDs = { 6, 1 }, },
    fel_eruption = { AbilityID = 211881, TalentIDs = { 3, 3 }, },
    felblade = { AbilityID = 213241, TalentIDs = { 3, 1 }, },
    fiery_brand = { AbilityID = 204021, },
    flame_crash = { TalentIDs = { 3, 2 }, },
    fracture = { AbilityID = 209795, TalentIDs = { 4, 2 }, },
    glide = { AbilityID = 131347, },
    immolation_aura = { AbilityID = 178740, },
    imprison = { AbilityID = 217832, },
    infernal_strike = { AbilityID = 189110, },
    last_resort = { TalentIDs = { 7, 1 }, },
    metamorphosis = { AbilityID = 187827, },
    nether_bond = { AbilityID = 207810, TalentIDs = { 7, 2 }, },
    quickened_sigils = { TalentIDs = { 5, 3 }, },
    razor_spikes = { TalentIDs = { 1, 3 }, },
    shear = { AbilityID = 203782, },
    sigil_of_chains = { AbilityID = 202138, TalentIDs = { 5, 2 }, },
    sigil_of_flame = { AbilityID = 204596, },
    sigil_of_misery = { AbilityID = 207684, },
    sigil_of_silence = { AbilityID = 202137, },
    soul_barrier = { AbilityID = 227225, TalentIDs = { 7, 3 }, },
    soul_carver = { AbilityID = 207407, },
    soul_cleave = { AbilityID = 228477, },
    soul_rending = { TalentIDs = { 4, 3 }, },
    spectral_sight = { AbilityID = 188501, },
    spirit_bomb = { AbilityID = 218679, TalentIDs = { 6, 3 }, },
    throw_glaive = { AbilityID = 204157, },
    torment = { AbilityID = 185245, },
}

local vengeance_base_overrides = {
    fiery_brand = {
        AuraID = 204021,
        AuraMine = true,
        AuraUnit = 'player',
        AuraApplied = 'fiery_brand',
        AuraApplyLength = 10,
    },
    shear = {
        PerformCast = function(spell, env)
            env.pain.gained = env.pain.gained + 10
        end
    },
    demon_spikes = {
        AuraID = 203819,
        AuraMine = true,
        AuraUnit = 'player',
    },
    metamorphosis = {
        AuraID = 187827,
        AuraMine = true,
        AuraUnit = 'player',
    },
    soul_cleave = {
        cost_type = 'pain',
        pain_cost = 50, -- cost is 30-60, err on the side of caution

        CanCast = function(spell, env)
            return env.soul_fragments.curr >= 1
        end,
        PerformCast = function(spell, env)
            env.soul_fragments.spent = env.soul_fragments.spent + env.soul_fragments.curr
        end,
    },
    immolation_aura = {
        AuraID = 178740,
        AuraMine = true,
        AuraUnit = 'player',
        AuraApplied = 'immolation_aura',
        AuraApplyLength = 6,
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

local function sigilInitialiser(duration)
    return {
        last_cast = function(spell, env) return Z.lastCastTime[spell.AbilityID] end,
        spell_duration = duration,
        spell_delay = function(spell, env) return env.quickened_sigils.talent_selected and 1 or 2 end,
        spell_start = function(spell, env) return env.currentTime + spell.spell_delay end,
        spell_finish = function(spell, env) return spell.spell_start + spell.spell_duration end,
        placed = function(spell, env) return spell.spell_remains > 0 end,
        spell_remains = function(spell, env)
            local remains = spell.spell_finish - env.currentTime
            return (remains > 0) and remains or 0
        end,
    }
end

local vengeance_sigil_overrides = {
    any_sigil = {
        placed = function(spell, env)
            return env.sigil_of_flame.placed or env.sigil_of_misery.placed or env.sigil_of_silence.placed or env.sigil_of_chains.placed
        end,
    },
    sigil_of_flame = sigilInitialiser(8),
    sigil_of_misery = sigilInitialiser(8),
    sigil_of_silence = sigilInitialiser(8),
    sigil_of_chains = sigilInitialiser(8),
}

Z:RegisterPlayerClass({
    name = 'Vengeance',
    class_id = 12,
    spec_id = 2,
    action_profile = 'legion-dev::Tier19P::Demon_Hunter_Vengeance_T19P',
    gcd_ability = 'shear',
    resources = { 'pain', 'soul_fragments' },
    actions = {
        vengeance_abilities_exported,
        vengeance_base_overrides,
        vengeance_talent_overrides,
        vengeance_sigil_overrides,
    },
    blacklisted = {},
    conditional_substitutions = {
        { " in_flight ", " infernal_strike.in_flight " },
        { " travel_time ", " 1 " }, -- infernal_strike.travel_time
        { " sigil_placed ", " any_sigil.placed " },
    },
})
