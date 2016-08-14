local addonName, internal = ...;
local Z = internal.Z

------------------------------------------------------------------------------------------------------------------------
-- Vengeance profile definition
------------------------------------------------------------------------------------------------------------------------

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

------------------------------------------------------------------------------------------------------------------------
-- Havoc profile definition
------------------------------------------------------------------------------------------------------------------------

--[[
local havoc_base_overrides = {
}

local havoc_talent_overrides = {
}

Z:RegisterPlayerClass({
    name = 'Havoc',
    class_id = 12,
    spec_id = 1,
    action_profile = 'legion-dev::Tier19P::Demon_Hunter_Havoc_T19P',
    gcd_ability = 'shear',
    resources = { 'fury', 'soul_fragments' },
    actions = {
        havoc_base_overrides,
        havoc_talent_overrides,
    },
    blacklisted = {
        pick_up_fragment = true,
    },
})
]]