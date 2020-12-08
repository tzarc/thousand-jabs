--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Shadowlands only.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if GetBuildInfo and (select(4, GetBuildInfo()) < 90000 or select(4, GetBuildInfo()) >= 100000) then return end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(2, UnitClass('player')) ~= 'DEMONHUNTER' then return end

local addonName, internal = ...
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Config = TJ:GetModule('Config')

if not Core:MatchesBuild('9.0.0', '9.0.9') then return end

local mmax = math.max
local mmin = math.min
local mfloor = math.floor

------------------------------------------------------------------------------------------------------------------------
-- Vengeance profile definition
------------------------------------------------------------------------------------------------------------------------

-- When exporting Vengeance DH, run '/tj _esd' for both with and without the Meta buff applied. Need to make sure we pick up any abilities that exist only in Meta.
-- exported with /tj _esd
local vengeance_abilities_exported = {
    abyssal_strike = { TalentID = 22502, },
    agonizing_flames = { TalentID = 22503, },
    bulk_extraction = { SpellIDs = { 320341 }, TalentID = 21902, },
    burning_alive = { TalentID = 22507, },
    chaos_brand = { SpellIDs = { 281242 }, },
    charred_flesh = { TalentID = 22541, },
    concentrated_sigils = { TalentID = 22546, },
    consume_magic = { SpellIDs = { 278326 }, },
    demon_spikes = { SpellIDs = { 203720 }, },
    demonic = { TalentID = 22513, },
    demonic_wards = { SpellIDs = { 203513 }, },
    disrupt = { SpellIDs = { 183752 }, },
    fallout = { TalentID = 22766, },
    feast_of_souls = { TalentID = 22505, },
    feed_the_demon = { TalentID = 22509, },
    fel_devastation = { SpellIDs = { 212084 }, },
    felblade = { SpellIDs = { 232893 }, TalentID = 22504, },
    fiery_brand = { SpellIDs = { 204021 }, },
    fracture = { SpellIDs = { 263642 }, TalentID = 22770, },
    glide = { SpellIDs = { 131347 }, },
    immolation_aura = { SpellIDs = { 258920 }, },
    imprison = { SpellIDs = { 217832 }, },
    infernal_armor = { TalentID = 22324, },
    infernal_strike = { SpellIDs = { 189110 }, },
    last_resort = { TalentID = 22543, },
    mastery_fel_blood = { SpellIDs = { 203747 }, },
    metamorphosis = { SpellIDs = { 187827 }, },
    quickened_sigils = { TalentID = 22510, },
    ruinous_bulwark = { TalentID = 23464, },
    shattered_souls = { SpellIDs = { 204254 }, },
    shear = { SpellIDs = { 203782 }, },
    sigil_of_chains = { SpellIDs = { 202138 }, TalentID = 22511, },
    sigil_of_flame = { SpellIDs = { 204513, 204596 }, },
    sigil_of_misery = { SpellIDs = { 202140, 207684 }, },
    sigil_of_silence = { SpellIDs = { 202137, 207682 }, },
    soul_barrier = { SpellIDs = { 263648 }, TalentID = 22768, },
    soul_cleave = { SpellIDs = { 228477 }, },
    soul_rending = { TalentID = 22508, },
    spectral_sight = { SpellIDs = { 188501 }, },
    spirit_bomb = { SpellIDs = { 247454 }, TalentID = 22540, },
    thick_skin = { SpellIDs = { 320380 }, },
    throw_glaive = { SpellIDs = { 204157 }, },
    torment = { SpellIDs = { 185245 }, },
    void_reaver = { TalentID = 22512, },
    worldvein_resonance = { SpellIDs = { 295186 }, },
}
local vengeance_base_overrides = {
    disrupt = {
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
        AuraApplyLength = 8,
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
        fragment_delay = 2.1, -- Guessed from recorded video!
        PerformCast = function(spell, env, state)
            env.pain.gained = env.pain.gained + 10

            local targetTime = env.currentTime + spell.fragment_delay
            state:Defer(targetTime, 'fracture', 'add_fragments', 1)
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
    soul_cleave = {
        cost_type = 'pain',
        PerformCast = function(spell, env)
            env.soul_fragments.spent = env.soul_fragments.spent + mmin(env.soul_fragments.curr,2)
        end,
    },
}

local vengeance_talent_overrides = {
    felblade = {
        PerformCast = function(spell, env)
            env.pain.gained = env.pain.gained + 30
        end,
    },
    fracture = {
        fragment_delay = 2.1, -- Guessed from recorded video!
        PerformCast = function(spell, env, state)
            env.pain.gained = env.pain.gained + 25

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
    spell_any_flame_sigil = {
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

-- Hmm, dodgy.
vengeance_base_overrides.infernal_strike.spell_any_flame_sigil = vengeance_sigil_overrides.spell_any_flame_sigil

local vengeance_azerite_overrides = {
    memory_of_lucid_dreams = {},
    worldvein_resonance = {},
    heart_essence = {},
    concentrated_flame = {},
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

--[[
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
        vengeance_sigil_overrides,
        vengeance_azerite_overrides,
        vengeance_hooks,
    },
    blacklisted = {
        'consume_magic',
    },
    config_checkboxes = {
        fiery_demise_selected = false,
    },
    conditional_substitutions_post = {
        { "in_flight", "infernal_strike.in_flight" },
        { "travel_time", "infernal_strike.travel_time" },
        { "sigil_placed", "any_flame_sigil.placed" },
    },
})
]]
