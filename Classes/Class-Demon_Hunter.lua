local _, internal = ...;
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

------------------------------------------------------------------------------------------------------------------------
-- Havoc profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local havoc_abilities_exported = {
    annihilation = { AbilityID = 201427, },
    arcane_torrent = { AbilityID = 202719, },
    auto_attack = { AbilityID = 6603, },
    blade_dance = { AbilityID = 188499, },
    blind_fury = { TalentIDs = { 1, 3 }, },
    bloodlet = { TalentIDs = { 3, 3 }, },
    blur = { AbilityID = 198589, },
    chaos_blades = { AbilityID = 211048, TalentIDs = { 7, 1 }, },
    chaos_cleave = { TalentIDs = { 1, 2 }, },
    chaos_nova = { AbilityID = 179057, },
    chaos_strike = { AbilityID = 162794, },
    consume_magic = { AbilityID = 183752, },
    darkness = { AbilityID = 196718, },
    demon_blades = { TalentIDs = { 2, 2 }, },
    demon_reborn = { TalentIDs = { 6, 3 }, },
    demonic = { TalentIDs = { 7, 3 }, },
    demonic_appetite = { TalentIDs = { 2, 3 }, },
    demons_bite = { AbilityID = 162243, },
    desperate_instincts = { TalentIDs = { 4, 2 }, },
    eye_beam = { AbilityID = 198013, },
    fel_barrage = { AbilityID = 211053, TalentIDs = { 7, 2 }, },
    fel_eruption = { AbilityID = 211881, TalentIDs = { 5, 2 }, },
    fel_mastery = { TalentIDs = { 1, 1 }, },
    fel_rush = { AbilityID = 195072, },
    felblade = { AbilityID = 213241, TalentIDs = { 3, 1 }, },
    first_blood = { TalentIDs = { 3, 2 }, },
    fury_of_the_illidari = { AbilityID = 201467, },
    glide = { AbilityID = 131347, },
    imprison = { AbilityID = 217832, },
    master_of_the_glaive = { TalentIDs = { 6, 1 }, },
    metamorphosis = { AbilityID = 191427, },
    momentum = { TalentIDs = { 5, 1 }, },
    nemesis = { AbilityID = 206491, TalentIDs = { 5, 3 }, },
    netherwalk = { AbilityID = 196555, TalentIDs = { 4, 1 }, },
    prepared = { TalentIDs = { 2, 1 }, },
    soul_rending = { TalentIDs = { 4, 3 }, },
    spectral_sight = { AbilityID = 188501, },
    throw_glaive = { AbilityID = 185123, },
    unleashed_power = { TalentIDs = { 6, 2 }, },
    vengeful_retreat = { AbilityID = 198793, },
}

local cacheTime = 0.1
local damageCacheValues = {}
local damageCacheTimes = {}
local function get_this_spell_damage(spell, env)
    local abilityID = spell.AbilityID
    local now = GetTime()
    if damageCacheValues[abilityID] and (damageCacheTimes[abilityID] + cacheTime >= now) then
        return damageCacheValues[abilityID]
    else
        local str
        Z:ScanTooltip(internal.fmt('spell:%d', spell.AbilityID), function(t) str = t end, nil, { 255, 210, 0 })
        if str then
            local v = strmatch(str, ' (%d+[%.,]%d%d%d) ')
            v = v:gsub('[^%d]', '') + 0
            damageCacheTimes[abilityID] = now
            damageCacheValues[abilityID] = v
            return v
        end
    end
    return 0
end

local havoc_base_overrides = {
    demons_bite = {
        fury_gain = 23, -- 20-30, err on the side of caution
        PerformCast = function(spell, env)
            env.fury.gained = env.fury.gained + spell.fury_gain
        end,
        dmg = get_this_spell_damage, -- /dump tj.st_state.env.demons_bite.dmg

        --[[
            https://github.com/simulationcraft/simc/wiki/Demon-Hunters
                demons_bite_per_dance = blade_dance_cost / demons_bite_fury
                demons_bite_per_chaos_strike = ( chaos_strike_cost - 20 * crit_chance ) / demons_bite_fury

                ( blade_dance_damage + demons_bite_per_dance * demons_bite_damage ) / ( 1 + demons_bite_per_dance )
                      vs.
                ( chaos_strike_damage + demons_bite_per_chaos_strike * demons_bite_damage ) / ( 1 + demons_bite_per_chaos_strike )

            /dump tj.st_state.env.demons_bite.count_per_blade_dance
            /dump tj.st_state.env.demons_bite.count_per_chaos_strike
        ]]
        count_per_blade_dance = function(spell,env) -- or death sweep
            return env.blade_dance.fury_cost / env.demons_bite.fury_gain
        end,
        count_per_chaos_strike = function(spell,env) -- or annihilation
            return (env.chaos_strike.fury_cost - 20.0*(GetCritChance()/100.0)) / env.demons_bite.fury_gain
        end,
        blade_dance_vs_chaos_strike = function(spell, env)
            local lhs = ( env.blade_dance.dmg + spell.count_per_blade_dance * spell.dmg ) / ( 1 + spell.count_per_blade_dance )
            local rhs = ( env.chaos_strike.dmg + spell.count_per_chaos_strike * spell.dmg ) / ( 1 + spell.count_per_chaos_strike )
            local blade_dance_better = (lhs >= rhs) and true or false
            return blade_dance_better
        end,
    },
    fel_rush = {
        AuraApplied = 'momentum',
        AuraApplyLength = 10,
    },
    throw_glaive = {
        AuraApplied = 'bloodlet',
        AuraApplyLength = 10,
    },
    vengeful_retreat = {
        PerformCast = function(spell,env)
            env.momentum.expirationTime = env.currentTime + 3
            env.prepared.expirationTime = env.currentTime + 5
        end,
    },
    metamorphosis = {
        AuraID = 162264,
        AuraUnit = 'player',
        AuraMine = true,
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
    blade_dance = {
        worth_using = function(spell,env) return env.demons_bite.blade_dance_vs_chaos_strike end,
        dmg = get_this_spell_damage, -- /dump tj.st_state.env.blade_dance.dmg
    },
    death_sweep = {
        worth_using = function(spell,env) return not env.demons_bite.blade_dance_vs_chaos_strike end,
    },
    chaos_strike = {
        dmg = get_this_spell_damage, -- /dump tj.st_state.env.chaos_strike.dmg
    },
}

Z:RegisterPlayerClass({
    name = 'Havoc',
    class_id = 12,
    spec_id = 1,
    action_profile = 'legion-dev::Tier19P::Demon_Hunter_Havoc_T19P',
    resources = { 'fury', 'soul_fragments' },
    actions = {
        havoc_abilities_exported,
        havoc_base_overrides,
    },
    blacklisted = {
        'consume_magic',
        'pick_up_fragment',
        --'vengeful_retreat',
        --'fel_rush',
    },
    conditional_substitutions = {
        { " death_sweep_worth_using ", " death_sweep.worth_using " },
        { " blade_dance_worth_using ", " blade_dance.worth_using " },
    },
})
