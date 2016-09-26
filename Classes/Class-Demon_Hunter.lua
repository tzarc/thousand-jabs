local _, internal = ...;
local Z = internal.Z
local LUC = LibStub('LibUnitCache-1.0')

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
    fiery_brand = {
        AuraID = 204021,
        AuraMine = true,
        AuraUnit = 'player',
        AuraApplied = 'fiery_brand',
        AuraApplyLength = 10,
    },
    infernal_strike = {
        in_flight = false,
        spell_duration = function(spell,env) return env.flame_crash.talent_selected and env.sigil_of_flame.spell_duration or 0 end,
        spell_delay = function(spell,env) return env.flame_crash.talent_selected and env.sigil_of_flame.spell_delay or 0 end,
        spell_remains = function(spell,env) return env.flame_crash.talent_selected and spell.spell_duration - spell.actual_time_since_last_cast or 0 end,

        -- Why do these use a different spellID?!
        actual_cast_spellid = 189111,
        actual_last_cast = function(spell, env)
            return env.last_cast_times[spell.actual_cast_spellid] or 0
        end,
        actual_time_since_last_cast = function(spell, env)
            return env.currentTime - spell.actual_last_cast
        end,
        PerformCast = function(spell, env)
            env.last_cast_times[spell.actual_cast_spellid] = env.currentTime
        end,
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
        AuraApplied = 'demon_spikes',
        AuraApplyLength = 6,
    },
    metamorphosis = {
        AuraID = 187827,
        AuraMine = true,
        AuraUnit = 'player',
        AuraApplied = 'demon_spikes',
        AuraApplyLength = 15,
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
    fiery_demise = {
        artifact_selected = function(spell,env) return internal.GetSpecConf("fiery_demise_selected") end,
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
        spell_delay = function(spell, env) return env.quickened_sigils.talent_selected and 1 or 2 end,
        spell_duration = function(spell, env) return 8 + spell.spell_delay end,
        placed = function(spell, env) return spell.time_since_last_cast < spell.spell_duration end,
        spell_remains = function(spell, env) return spell.spell_duration - spell.time_since_last_cast end, -- TODO: Is this how long the DoT has to go?
    }
end

local vengeance_sigil_overrides = {
    any_sigil = {
        placed = function(spell, env)
            return env.sigil_of_flame.placed
                or env.sigil_of_misery.placed
                or env.sigil_of_silence.placed
                or (env.sigil_of_chains.talent_selected and env.sigil_of_chains.placed)
                or (env.flame_crash.talent_selected and env.infernal_strike.actual_time_since_last_cast < env.infernal_strike.spell_duration)
        end,
    },
    sigil_of_flame = sigilInitialiser(),
    sigil_of_misery = sigilInitialiser(),
    sigil_of_silence = sigilInitialiser(),
    sigil_of_chains = sigilInitialiser(),
}

local vengeance_hooks = {
    hooks = {
        OnPredictActionAtOffset = function(env)
        --[[
        internal.DBG({
        any_sigil_placed = env.any_sigil.placed,
        infernal_strike_last_cast = env.infernal_strike.actual_last_cast,
        infernal_strike_time_since_last_cast = env.infernal_strike.actual_time_since_last_cast,
        })
        -- ]]
        end
    }
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
        vengeance_hooks,
    },
    blacklisted = {},
    config_checkboxes = {
        'fiery_demise_selected',
    },
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
        CanCast = function(spell,env)
            return env.melee.in_range
        end,
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
        PerformCast = function(spell,env)
            env.melee.in_range = true
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
            env.melee.in_range = false
        end,
    },
    movement = {
        distance = function(spell,env)
            -- this is for fel rush - there's no way to check against the actual distance to the target, so assume that if demon's bite is out of range, then we're needing to fel rush
            return env.melee.in_range and 0 or 100
        end,
    },
    metamorphosis = {
        AuraID = 162264,
        AuraUnit = 'player',
        AuraMine = true,
        PerformCast = function(spell,env)
            env.melee.in_range = true
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
    blade_dance = {
        worth_using = function(spell,env) return env.demons_bite.blade_dance_vs_chaos_strike end,
        dmg = get_this_spell_damage, -- /dump tj.st_state.env.blade_dance.dmg
    },
    death_sweep = {
        worth_using = function(spell,env) return not env.demons_bite.blade_dance_vs_chaos_strike end,
    },
    chaos_strike = {
        dmg = get_this_spell_damage, -- /dump tj.st_state.env.chaos_strike.dmg
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
        artifact_selected = function(spell,env) return internal.GetSpecConf("demon_speed_selected") end,
    },
    anguish_of_the_deceiver = {
        artifact_selected = function(spell,env) return internal.GetSpecConf("anguish_of_the_deceiver_selected") end,
    },
}

local havoc_hooks = {
    hooks = {
        OnStateInit = function(env)
            env.melee.in_range = env.melee.in_range_unlatched
        end,
        OnPredictActionAtOffset = function(env)
        --[[
        internal.DBG({
        melee_in_range = env.melee.in_range,
        demons_bite_in_range = env.demons_bite.in_range,
        chaos_strike_in_range = env.chaos_strike.in_range,
        annihilation_in_range = env.annihilation.in_range,
        prev_gcd_fel_rush = env.prev_gcd.fel_rush,
        prev_gcd_vengeful_retreat = env.prev_gcd.vengeful_retreat,
        demon_blades_talent_selected = env.demon_blades.talent_selected,
        vengeful_retreat_spell_can_cast = env.vengeful_retreat.spell_can_cast,
        })
        -- ]]
        end,
    },
    melee = {
        in_range_unlatched = function(spell,env)
            if env.demon_blades.talent_selected then
                -- Meta screws things up here. Need to check against either chaos strike or annihilation, but they won't both be available so the addon will
                -- error out. Need to refer to the applicable ability for whether meta is active on the player in-game, rather than in-sim.
                local meta = LUC:GetAura('player', env.metamorphosis.AuraID, true)
                if meta then
                    return env.annihilation.in_range
                else
                    return env.chaos_strike.in_range
                end
            else
                return env.demons_bite.in_range
            end
        end,
    },
    out_of_range = {
        aura_up = function(spell,env)
            return not env.melee.in_range
        end,
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
        havoc_hooks,
    },
    blacklisted = {
        'consume_magic',
        'pick_up_fragment',
    },
    config_checkboxes = {
        'demon_speed_selected',
        'anguish_of_the_deceiver_selected',
    },
    conditional_substitutions = {
        { " death_sweep_worth_using ", " death_sweep.worth_using " },
        { " blade_dance_worth_using ", " blade_dance.worth_using " },
    },
})
