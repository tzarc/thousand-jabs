local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Config = TJ:GetModule('Config')

local mmax = math.max
local mfloor = math.floor

------------------------------------------------------------------------------------------------------------------------
-- Vengeance profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local vengeance_abilities_exported = {}
if TJ:MatchesBuild('7.1.0', '7.1.4') then
    vengeance_abilities_exported = {
        abyssal_strike = { TalentID = 22502, },
        agonizing_flames = { TalentID = 22503, },
        blade_turning = { TalentID = 22513, },
        burning_alive = { TalentID = 22507, },
        concentrated_sigils = { TalentID = 22546, },
        consume_magic = { SpellIDs = { 183752 }, },
        demon_spikes = { SpellIDs = { 203720 }, },
        empower_wards = { SpellIDs = { 218256 }, },
        fallout = { TalentID = 22766, },
        feast_of_souls = { TalentID = 22505, },
        feed_the_demon = { TalentID = 22508, },
        fel_devastation = { SpellIDs = { 212084 }, TalentID = 22512, },
        fel_eruption = { SpellIDs = { 211881 }, TalentID = 22540, },
        felblade = { SpellIDs = { 232893 }, TalentID = 22324, },
        fiery_brand = { SpellIDs = { 204021 }, },
        flame_crash = { TalentID = 22541, },
        fracture = { SpellIDs = { 209795 }, TalentID = 22509, },
        glide = { SpellIDs = { 131347 }, },
        immolation_aura = { SpellIDs = { 178740 }, },
        imprison = { SpellIDs = { 217832 }, },
        infernal_strike = { SpellIDs = { 189110 }, },
        last_resort = { TalentID = 22543, },
        metamorphosis = { SpellIDs = { 187827 }, },
        nether_bond = { SpellIDs = { 207810 }, TalentID = 22548, },
        quickened_sigils = { TalentID = 22511, },
        razor_spikes = { TalentID = 22504, },
        shear = { SpellIDs = { 203782 }, },
        sigil_of_chains = { SpellIDs = { 202138, 207665 }, TalentID = 22510, },
        sigil_of_flame = { SpellIDs = { 204513, 204596 }, },
        sigil_of_misery = { SpellIDs = { 202140, 207684 }, },
        sigil_of_silence = { SpellIDs = { 202137, 207682 }, },
        soul_barrier = { SpellIDs = { 227225 }, TalentID = 21902, },
        soul_carver = { SpellIDs = { 207407 }, },
        soul_cleave = { SpellIDs = { 228477 }, },
        soul_rending = { TalentID = 22770, },
        spectral_sight = { SpellIDs = { 188501 }, },
        spirit_bomb = { SpellIDs = { 218679 }, TalentID = 22768, },
        throw_glaive = { SpellIDs = { 204157 }, },
        torment = { SpellIDs = { 185245 }, },
    }
end

-- exported with /tj _esd
if TJ:MatchesBuild('7.1.5', '7.1.5') then
    vengeance_abilities_exported = {
        abyssal_strike = { TalentID = 22502, },
        agonizing_flames = { TalentID = 22503, },
        blade_turning = { TalentID = 22513, },
        burning_alive = { TalentID = 22507, },
        concentrated_sigils = { TalentID = 22546, },
        consume_magic = { SpellIDs = { 183752 }, },
        demon_spikes = { SpellIDs = { 203720 }, },
        demonic_infusion = { SpellIDs = { 236189 }, TalentID = 22548, },
        empower_wards = { SpellIDs = { 218256 }, },
        fallout = { TalentID = 22766, },
        feast_of_souls = { TalentID = 22505, },
        feed_the_demon = { TalentID = 22508, },
        fel_devastation = { SpellIDs = { 212084 }, TalentID = 22512, },
        fel_eruption = { SpellIDs = { 211881 }, TalentID = 22540, },
        felblade = { SpellIDs = { 232893 }, TalentID = 22324, },
        fiery_brand = { SpellIDs = { 204021 }, },
        flame_crash = { TalentID = 22541, },
        fracture = { SpellIDs = { 209795 }, TalentID = 22509, },
        glide = { SpellIDs = { 131347 }, },
        immolation_aura = { SpellIDs = { 178740 }, },
        imprison = { SpellIDs = { 217832 }, },
        infernal_strike = { SpellIDs = { 189110 }, },
        last_resort = { TalentID = 22543, },
        metamorphosis = { SpellIDs = { 187827 }, },
        quickened_sigils = { TalentID = 22511, },
        razor_spikes = { TalentID = 22504, },
        shear = { SpellIDs = { 203782 }, },
        sigil_of_chains = { SpellIDs = { 202138, 207665 }, TalentID = 22510, },
        sigil_of_flame = { SpellIDs = { 204513, 204596 }, },
        sigil_of_misery = { SpellIDs = { 202140, 207684 }, },
        sigil_of_silence = { SpellIDs = { 202137, 207682 }, },
        soul_barrier = { SpellIDs = { 227225 }, TalentID = 21902, },
        soul_carver = { SpellIDs = { 207407 }, },
        soul_cleave = { SpellIDs = { 228477 }, },
        soul_rending = { TalentID = 22770, },
        spectral_sight = { SpellIDs = { 188501 }, },
        spirit_bomb = { SpellIDs = { 218679 }, TalentID = 22768, },
        throw_glaive = { SpellIDs = { 204157 }, },
        torment = { SpellIDs = { 185245 }, },
    }
end

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
        end,
        spell_cast_time = 0.01, -- off GCD!
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
        spell_cast_time = 0.01, -- off GCD!
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
        aura_duration = function(spell,env) return env.flame_crash.talent_enabled and env.sigil_of_flame.aura_duration or 0 end,
        spell_delay = function(spell,env) return env.flame_crash.talent_enabled and env.sigil_of_flame.spell_delay or 0 end,
        aura_remains = function(spell,env) return env.flame_crash.talent_enabled and mmax(0, spell.aura_duration - spell.time_since_last_cast or 0) end,
        spell_cast_time = 0.01, -- off GCD!

        SpellIDs = { 189110, 189111 }, -- Why does this use a different spellID?!
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
        spell_delay = function(spell, env) return env.quickened_sigils.talent_enabled and 1 or 2 end,
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
                or (env.sigil_of_chains.talent_enabled and env.sigil_of_chains.placed)
                or (env.flame_crash.talent_enabled and env.infernal_strike.time_since_last_cast < env.infernal_strike.aura_duration)
        end,
    },
    any_flame_sigil = {
        placed = function(spell, env)
            return env.sigil_of_flame.placed
                or (env.flame_crash.talent_enabled and env.infernal_strike.time_since_last_cast < env.infernal_strike.aura_duration)
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
        fiery_demise_selected = false,
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
local havoc_abilities_exported = {}
if TJ:MatchesBuild('7.1.0', '7.1.4') then
    havoc_abilities_exported = {
        annihilation = { SpellIDs = { 201427 }, },
        blade_dance = { SpellIDs = { 188499 }, },
        blind_fury = { TalentID = 22416, },
        bloodlet = { TalentID = 21862, },
        blur = { SpellIDs = { 198589 }, },
        chaos_blades = { SpellIDs = { 211048 }, TalentID = 21900, },
        chaos_cleave = { TalentID = 22493, },
        chaos_nova = { SpellIDs = { 179057 }, },
        chaos_strike = { SpellIDs = { 162794 }, },
        consume_magic = { SpellIDs = { 183752 }, },
        darkness = { SpellIDs = { 196718 }, },
        death_sweep = { SpellIDs = { 210152 }, },
        demon_blades = { TalentID = 22765, },
        demon_reborn = { TalentID = 22767, },
        demonic = { TalentID = 22547, },
        demonic_appetite = { TalentID = 22799, },
        demons_bite = { SpellIDs = { 162243 }, },
        desperate_instincts = { TalentID = 21864, },
        eye_beam = { SpellIDs = { 198013 }, },
        fel_barrage = { SpellIDs = { 211053 }, TalentID = 21901, },
        fel_eruption = { SpellIDs = { 211881 }, TalentID = 21867, },
        fel_mastery = { TalentID = 21854, },
        fel_rush = { SpellIDs = { 195072 }, },
        felblade = { SpellIDs = { 232893 }, TalentID = 22324, },
        first_blood = { TalentID = 22494, },
        fury_of_the_illidari = { SpellIDs = { 201467 }, },
        glide = { SpellIDs = { 131347 }, },
        imprison = { SpellIDs = { 217832 }, },
        master_of_the_glaive = { TalentID = 21869, },
        metamorphosis = { SpellIDs = { 191427 }, },
        momentum = { TalentID = 21866, },
        nemesis = { SpellIDs = { 206491 }, TalentID = 21868, },
        netherwalk = { SpellIDs = { 196555 }, TalentID = 21863, },
        prepared = { TalentID = 21857, },
        soul_rending = { TalentID = 21865, },
        spectral_sight = { SpellIDs = { 188501 }, },
        throw_glaive = { SpellIDs = { 185123 }, },
        unleashed_power = { TalentID = 21870, },
        vengeful_retreat = { SpellIDs = { 198793 }, },
    }
end

-- exported with /tj _esd
if TJ:MatchesBuild('7.1.5', '7.1.5') then
    havoc_abilities_exported = {
        annihilation = { SpellIDs = { 201427 }, },
        blade_dance = { SpellIDs = { 188499 }, },
        blind_fury = { TalentID = 22416, },
        bloodlet = { TalentID = 21862, },
        blur = { SpellIDs = { 198589 }, },
        chaos_blades = { SpellIDs = { 211048 }, TalentID = 21900, },
        chaos_cleave = { TalentID = 22909, },
        chaos_nova = { SpellIDs = { 179057 }, },
        chaos_strike = { SpellIDs = { 162794 }, },
        consume_magic = { SpellIDs = { 183752 }, },
        darkness = { SpellIDs = { 196718 }, },
        death_sweep = { SpellIDs = { 210152 }, },
        demon_blades = { TalentID = 22765, },
        demon_reborn = { TalentID = 22767, },
        demonic = { TalentID = 22547, },
        demonic_appetite = { TalentID = 22799, },
        demons_bite = { SpellIDs = { 162243 }, },
        desperate_instincts = { TalentID = 21864, },
        eye_beam = { SpellIDs = { 198013 }, },
        fel_barrage = { SpellIDs = { 211053 }, TalentID = 21901, },
        fel_eruption = { SpellIDs = { 211881 }, TalentID = 21867, },
        fel_mastery = { TalentID = 21854, },
        fel_rush = { SpellIDs = { 195072 }, },
        felblade = { SpellIDs = { 232893 }, TalentID = 22493, },
        first_blood = { TalentID = 22494, },
        fury_of_the_illidari = { SpellIDs = { 201467 }, },
        glide = { SpellIDs = { 131347 }, },
        imprison = { SpellIDs = { 217832 }, },
        master_of_the_glaive = { TalentID = 21869, },
        metamorphosis = { SpellIDs = { 191427 }, },
        momentum = { TalentID = 21866, },
        nemesis = { SpellIDs = { 206491 }, TalentID = 21868, },
        netherwalk = { SpellIDs = { 196555 }, TalentID = 21863, },
        prepared = { TalentID = 21857, },
        soul_rending = { TalentID = 21865, },
        spectral_sight = { SpellIDs = { 188501 }, },
        throw_glaive = { SpellIDs = { 185123 }, },
        unleashed_power = { TalentID = 21870, },
        vengeful_retreat = { SpellIDs = { 198793 }, },
    }
end

local havoc_base_overrides = {
    demons_bite = {
        fury_gain = 23, -- 20-30, err on the side of caution, needs to be modified by AotHG (see demon_blades below)
        CanCast = function(spell,env)
            return env.melee.in_range
        end,
        PerformCast = function(spell, env)
            env.fury.gained = env.fury.gained + spell.fury_gain + spell.aothg_estimate
        end,

        -- Handle "Anger of the Half-Giants":
        aothg_min = 1,
        aothg_max = 20,
        aothg_estimate = function(spell,env)
            if env.equipped[137038] then
                return mfloor(spell.aothg_min + (((spell.aothg_max-spell.aothg_min)/2)))
            end
            return 0
        end,
    },
    demon_blades = {
        -- Base: http://www.wowhead.com/spell=203555/demon-blades
        -- ... 75% chance to trigger fury gain + damage
        chance = 0.75,

        -- Effect: http://www.wowhead.com/spell=203796/demon-blades
        -- ... Generates approx 12-20 fury
        base_min = 12,
        base_max = 20,
        base_estimate = function(spell,env)
            if spell.talent_enabled then
                return mfloor(spell.base_min + (((spell.base_max-spell.base_min)/2)*env.demon_blades.chance))
            end
            return 0
        end,

        -- "Anger of the Half-Giants" Modifier: http://www.wowhead.com/item=137038/anger-of-the-half-giants
        -- ... Generates additional 1-20 fury (i.e. actually 1-12, see below)
        -- ... Upper range value modified by Demon Blades by -8 (see simc dump, allspells.txt, id=208827)
        -- ... PTR modifier seems to be -6
        aothg_min = 1,
        aothg_max = function(spell, env) return env.ptr and 14 or 12 end,
        aothg_estimate = function(spell,env)
            if env.equipped[137038] then
                return mfloor(spell.aothg_min + (((spell.aothg_max-spell.aothg_min)/2)*env.demon_blades.chance))
            end
            return 0
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
            if env.fel_mastery.talent_enabled then
                env.fury.gained = env.fury.gained + 25
            end
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
            env.movement.distance = Config:GetSpec("ignore_fr_vr_range") and 5 or 20
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
    felblade = {
        fury_gain = 30,
        CanCast = function(spell,env)
            return env.movement.distance <= 15
        end,
        PerformCast = function(spell,env)
            env.movement.distance = 5 -- melee
            env.fury.gained = env.fury.gained + spell.fury_gain
        end,
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
                env.movement.distance = Config:GetSpec("ignore_fr_vr_range") and 5 or 20
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
        demon_speed_selected = false,
        anguish_of_the_deceiver_selected = false,
        ignore_fr_vr_range = false,
    },
    conditional_substitutions = {
        { " death_sweep_worth_using ", " death_sweep.worth_using " },
        { " blade_dance_worth_using ", " blade_dance.worth_using " },
    },
})
