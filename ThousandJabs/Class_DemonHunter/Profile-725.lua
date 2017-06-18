if select(2, UnitClass('player')) ~= 'DEMONHUNTER' then return end

local addonName, internal = ...
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Config = TJ:GetModule('Config')

if not Core:MatchesBuild('7.2.5', '7.2.5') then return end

local mmax = math.max
local mmin = math.min
local mfloor = math.floor

------------------------------------------------------------------------------------------------------------------------
-- Vengeance profile definition
------------------------------------------------------------------------------------------------------------------------

-- When exporting Vengeance DH, run '/tj _esd' for both with and without the Meta buff applied. Need to retrieve Shear/Sever.

-- exported with /tj _esd
local vengeance_abilities_exported = {
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
    sever = { SpellIDs = { 235964 }, },
    shear = { SpellIDs = { 203782 }, },
    sigil_of_chains = { SpellIDs = { 202138 }, TalentID = 22510, },
    sigil_of_flame = { SpellIDs = { 204513, 204596 }, },
    sigil_of_misery = { SpellIDs = { 202140, 207684 }, },
    sigil_of_silence = { SpellIDs = { 202137, 207682 }, },
    soul_barrier = { SpellIDs = { 227225 }, TalentID = 21902, },
    soul_carver = { SpellIDs = { 207407 }, },
    soul_cleave = { SpellIDs = { 228477 }, },
    soul_rending = { TalentID = 22770, },
    spectral_sight = { SpellIDs = { 188501 }, },
    spirit_bomb = { SpellIDs = { 247454 }, TalentID = 22768, },
    throw_glaive = { SpellIDs = { 204157 }, },
    torment = { SpellIDs = { 185245 }, },
}

local vengeance_base_overrides = {
    consume_magic = {
        spell_cast_time = 0.01, -- off GCD!
        CanCast = function(spell, env)
            return env.target.is_casting and env.target.is_interruptible
        end,
        PerformCast = function(spell, env)
            env.pain.gained = env.pain.gained + 50
            if env.target.is_interruptible then
                env.target.is_casting = false
                env.target.is_interruptible = false
            end
        end,
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
    sever = {
        PerformCast = function(spell, env)
            env.pain.gained = env.pain.gained + 10
        end
    },
    soul_cleave = {
        cost_type = 'pain',
        pain_min = 25,
        pain_max = 50,
        pain_cost = function(spell, env)
            return mmin(spell.pain_max, mmax(spell.pain_min, env.pain.curr))
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
        fragment_delay = 2.1, -- Guessed from recorded video!
        PerformCast = function(spell, env, state)
            local targetTime = env.currentTime + spell.fragment_delay
            state:Defer(targetTime, 'fracture', 'add_fragments', 2)
        end,
        HistoricalCast = function(spell, env, state, originalCastTime)
            local delta = env.currentTime-originalCastTime
            if delta < spell.fragment_delay then state:Defer(originalCastTime + spell.fragment_delay, 'fracture', 'add_fragments', 2) end
        end,
        Deferred = function(spell, env, state, triggerTime, ...)
            local cmd, amount = ...
            if cmd == 'add_fragments' then
                local toAdd = mmin(5 - env.soul_fragments.curr, amount)
                env.soul_fragments.gained = env.soul_fragments.gained + toAdd
            end
        end,
    },
    spirit_bomb = {
        frailty_delay = 2.1, -- TODO: Total guess!
        AuraApplyLength = 20,
        ChargesUseSpellCount = true,

        CanCast = function(spell, env)
            return env.soul_fragments.curr >= 1
        end,
        PerformCast = function(spell, env, state)
            env.soul_fragments.spent = env.soul_fragments.spent + env.soul_fragments.curr
            local targetTime = env.currentTime + spell.frailty_delay
            state:Defer(targetTime, 'spirit_bomb', 'add_aura')
        end,
        HistoricalCast = function(spell, env, state, originalCastTime)
            local targetTime = originalCastTime + spell.frailty_delay
            if env.currentTime < targetTime then
                env.soul_fragments.spent = env.soul_fragments.spent + env.soul_fragments.curr
                state:Defer(targetTime, 'spirit_bomb', 'add_aura')
            end
        end,
        Deferred = function(spell, env, state, triggerTime, ...)
            local cmd = ...
            if cmd == 'add_aura' then
                env.frailty.expirationTime = env.currentTime + spell.AuraApplyLength
            end
        end,
    },
    frailty = { -- Spirit bomb debuff
        AuraID = { 224509, 247456 },
        AuraUnit = 'target',
        AuraMine = true,
    },
    demonic_infusion = {
        PerformCast = function(spell, env)
            env.pain.gained = env.pain.gained + 60
        end,
    }
}

local vengeance_artifact_overrides = {
    fiery_demise = {
        artifact_enabled = function(spell,env)
            return Config:GetSpec("fiery_demise_selected") and true or false
        end,
    },
    soul_carver = {
        PerformCast = function(spell, env, state)
            local targetTime = env.currentTime + 1 -- TODO: Total guess!
            state:Defer(targetTime+0, 'soul_carver', 'add_fragments', 2)
            state:Defer(targetTime+1, 'soul_carver', 'add_fragments', 1)
            state:Defer(targetTime+2, 'soul_carver', 'add_fragments', 1)
        end,
        HistoricalCast = function(spell, env, state, originalCastTime)
            local targetTime = originalCastTime + 1  -- TODO: Total guess!
            if env.currentTime < targetTime+0 then state:Defer(targetTime+0, 'soul_carver', 'add_fragments', 2) end
            if env.currentTime < targetTime+1 then state:Defer(targetTime+1, 'soul_carver', 'add_fragments', 1) end
            if env.currentTime < targetTime+2 then state:Defer(targetTime+2, 'soul_carver', 'add_fragments', 1) end
        end,
        Deferred = function(spell, env, state, triggerTime, ...)
            local cmd, amount = ...
            if cmd == 'add_fragments' then
                env.soul_fragments.gained = env.soul_fragments.gained + mmin(5 - env.soul_fragments.curr, amount)
            end
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

local vengeance_hooks = {
    hooks = {
    --[[
    OnPredictActionAtOffset = function(env)
    local state = getmetatable(env).__state
    for k,v in pairs(state.castQueue) do
    Core:Debug("|cFFFF6600%30s | %12.3f | %8.3f|r", v.ability, v.time, v.time - GetTime())
    end
    end,
    --]]
    }
}

TJ:RegisterPlayerClass({
    name = 'Vengeance',
    class_id = 12,
    spec_id = 2,
    default_action_profile = 'simc::demonhunter::vengeance',
    resources = { 'pain', 'soul_fragments' },
    actions = {
        vengeance_abilities_exported,
        vengeance_base_overrides,
        vengeance_talent_overrides,
        vengeance_artifact_overrides,
        vengeance_sigil_overrides,
        vengeance_hooks,
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

-- When exporting Havoc DH, run '/tj _esd' for both with and without the Meta buff applied. Need to retrieve Annihilation/Chaos Strike/Blade Dance/Death Sweep.

-- exported with /tj _esd
local havoc_abilities_exported = {
    annihilation = { SpellIDs = { 201427 }, },
    blade_dance = { SpellIDs = { 188499 }, },
    blind_fury = { TalentID = 22416, },
    bloodlet = { TalentID = 21862, },
    blur = { SpellIDs = { 198589 }, },
    chaos_blades = { SpellIDs = { 247938 }, TalentID = 21900, },
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

local havoc_base_overrides = {
    consume_magic = {
        spell_cast_time = 0.01, -- off GCD!
        CanCast = function(spell, env)
            return env.target.is_casting and env.target.is_interruptible
        end,
        PerformCast = function(spell, env)
            env.fury.gained = env.fury.gained + 50
            if env.target.is_interruptible then
                env.target.is_casting = false
                env.target.is_interruptible = false
            end
        end,
    },
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
        aothg_max = 14,
        aothg_estimate = function(spell,env)
            if env.equipped[137038] then
                return mfloor(spell.aothg_min + (((spell.aothg_max-spell.aothg_min)/2)))
            end
            return 0
        end,
    },
    demon_blades = {
        -- Base: http://www.wowhead.com/spell=203555/demon-blades
        -- ... 60% chance to trigger fury gain + damage
        chance = 0.60,

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
        -- ... Generates additional 1-14 fury (i.e. actually 1-8, see below)
        -- ... Upper range value modified by Demon Blades by -6 (see simc dump, allspells.txt, id=208827)
        aothg_min = 1,
        aothg_max = 6,
        aothg_estimate = function(spell,env)
            if env.equipped[137038] then
                return mfloor(spell.aothg_min + (((spell.aothg_max-spell.aothg_min)/2)*env.demon_blades.chance))
            end
            return 0
        end,
    },
    blade_dance = {
        Icon = function(spell,env)
            return select(3, GetSpellInfo(188499)) -- For some reason, Death Sweep overrides this and it doesn't get restored after Meta finishes.
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
        PerformCast = function(spell, env)
            if env.blind_fury.talent_enabled then
                env.fury.gained = env.fury.gained + 106
            end
        end,
    },
    fel_rush = {
        AuraApplied = 'momentum',
        AuraApplyLength = 10,
        PerformCast = function(spell,env)
            if env.fel_mastery.talent_enabled then
                -- Assume the player hits something!
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
        cooldown_adjusted_remains = function(spell, env)
            -- Basic estimate... thanks Kojiyama! ;)
            if env.equipped[144279] and env.equipped[140806] then -- Delusions of Grandeur + Convergence of Fates
                return spell.cooldown_remains * 0.56
            elseif env.equipped[144279] then -- Delusions of Grandeur
                return spell.cooldown_remains * 0.67
            elseif env.equipped[140806] then -- Convergence of Fates
                return spell.cooldown_remains * 0.78
            else
                return spell.cooldown_remains
            end
        end,
        aura_extended_by_demonic = false, -- TODO
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
    }
}

TJ:RegisterPlayerClass({
    name = 'Havoc',
    class_id = 12,
    spec_id = 1,
    default_action_profile = 'simc::demonhunter::havoc',
    resources = { 'fury', 'soul_fragments' },
    actions = {
        havoc_abilities_exported,
        havoc_base_overrides,
        havoc_hooks,
    },
    blacklisted = {
        'pick_up_fragment',
    },
    config_checkboxes = {
        demon_speed_selected = false,
        anguish_of_the_deceiver_selected = false,
        ignore_fr_vr_range = false,
        ignore_demon_blades_gains = false,
    },
})
