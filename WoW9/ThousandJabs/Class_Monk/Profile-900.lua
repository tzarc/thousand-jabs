--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Shadowlands only.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if GetBuildInfo and (select(4, GetBuildInfo()) < 90000 or select(4, GetBuildInfo()) >= 100000) then return end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(2, UnitClass('player')) ~= 'MONK' then return end

local addonName, internal = ...
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Config = TJ:GetModule('Config')

if not Core:MatchesBuild('9.0.0', '9.0.9') then return end

local mmax = math.max
local mmin = math.min
local mfloor = math.floor

------------------------------------------------------------------------------------------------------------------------
-- Common profile definition
------------------------------------------------------------------------------------------------------------------------

-- Runeforges
local runeforging_overrides = {
    charred_passions = {
        runeforge_equipped = false, -- TODO
    },
}

-- Covenants
local covenant_overrides = {
    weapons_of_order = { -- Kyrian
        SpellIDs = { 310454 }, -- TODO, add aura IDs
    },
    fallen_order = { -- Venthyr
        SpellIDs = { 326860 }, -- TODO, add aura IDs
    },
    bonedust_brew = { -- Necrolord
        SpellIDs = { 325216 }, -- TODO, add aura IDs
    },
    faeline_stomp = { -- Night Fae
        SpellIDs = { 327104 }, -- TODO, add aura IDs
    },
}

------------------------------------------------------------------------------------------------------------------------
-- Brewmaster profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local brewmaster_abilities_exported = {
    black_ox_brew = { SpellIDs = { 115399 }, TalentID = 19992, },
    blackout_combo = { TalentID = 22108, },
    blackout_kick = { SpellIDs = { 205523 }, },
    bob_and_weave = { TalentID = 20174, },
    breath_of_fire = { SpellIDs = { 115181 }, },
    celerity = { TalentID = 19304, },
    celestial_brew = { SpellIDs = { 322507 }, },
    celestial_flames = { TalentID = 22104, },
    chi_burst = { SpellIDs = { 123986 }, TalentID = 20185, },
    chi_torpedo = { SpellIDs = { 115008 }, TalentID = 19818, },
    chi_wave = { SpellIDs = { 115098 }, TalentID = 19820, },
    crackling_jade_lightning = { SpellIDs = { 117952 }, },
    dampen_harm = { SpellIDs = { 122278 }, TalentID = 20175, },
    detox = { SpellIDs = { 218164 }, },
    expel_harm = { SpellIDs = { 322101 }, },
    exploding_keg = { SpellIDs = { 325153 }, TalentID = 22103, },
    eye_of_the_tiger = { TalentID = 23106, },
    fortifying_brew = { SpellIDs = { 115203 }, },
    gift_of_the_ox = { SpellIDs = { 124502 }, },
    healing_elixir = { SpellIDs = { 122281 }, TalentID = 23363, },
    high_tolerance = { TalentID = 22106, },
    invoke_niuzao_the_black_ox = { SpellIDs = { 132578 }, },
    keg_smash = { SpellIDs = { 121253 }, },
    leg_sweep = { SpellIDs = { 119381 }, },
    light_brewing = { TalentID = 22099, },
    mystic_touch = { SpellIDs = { 8647 }, },
    paralysis = { SpellIDs = { 115078 }, },
    provoke = { SpellIDs = { 115546 }, },
    purifying_brew = { SpellIDs = { 119582 }, },
    resuscitate = { SpellIDs = { 115178 }, },
    ring_of_peace = { SpellIDs = { 116844 }, TalentID = 19995, },
    roll = { SpellIDs = { 109132 }, },
    rushing_jade_wind = { SpellIDs = { 116847 }, TalentID = 20184, },
    shuffle = { SpellIDs = { 322120 }, },
    spear_hand_strike = { SpellIDs = { 116705 }, },
    special_delivery = { TalentID = 19819, },
    spinning_crane_kick = { SpellIDs = { 322729 }, },
    spitfire = { TalentID = 22097, },
    stagger = { SpellIDs = { 115069 }, },
    summon_black_ox_statue = { SpellIDs = { 115315 }, TalentID = 19994, },
    tiger_palm = { SpellIDs = { 100780 }, },
    tiger_tail_sweep = { TalentID = 19993, },
    tigers_lust = { SpellIDs = { 116841 }, TalentID = 19302, },
    touch_of_death = { SpellIDs = { 322109 }, },
    transcendence = { SpellIDs = { 101643 }, },
    transcendence_transfer = { SpellIDs = { 119996 }, },
    vivify = { SpellIDs = { 116670 }, },
    zen_flight = { SpellIDs = { 125883 }, },
    zen_meditation = { SpellIDs = { 115176 }, },
}

local brewmaster_base_overrides = {
    spear_hand_strike = {
        spell_cast_time = 0.01, -- off GCD!
        CanCast = function(spell, env)
            return env.target.is_casting and env.target.is_interruptible
        end,
        PerformCast = function(spell, env)
            if env.target.is_interruptible then
                env.target.is_casting = false
                env.target.is_interruptible = false
            end
        end,
    },
    invoke_niuzao_the_black_ox = {
        CanCast = function(spell, env)
            return env.target.exists
        end,
    },
    touch_of_death = {
        CanCast = function(spell, env)
            return env.target.exists
        end,
    },
    purifying_brew = {
        CanCast = function(spell, env)
            return env.stagger.total_damage_staggered > (env.health.max * 0.03) -- Skip stagger that's too small.
        end,
        PerformCast = function(spell,env)
            -- Swap stagger urgency to be down one level, to approximate purification (heavy->moderate, moderate->light)
            if env.stagger.heavy then
                env.stagger_moderate.expirationTime = env.stagger_heavy.expirationTime
                env.stagger_heavy.expirationTime = 0
            elseif env.stagger.moderate then
                env.stagger_light.expirationTime = env.stagger_moderate.expirationTime
                env.stagger_moderate.expirationTime = 0
            end
        end,
    },
    elusive_brawler = {
        AuraID = 195630,
        AuraUnit = 'player',
        AuraMine = true,
    },
    keg_smash = {
        AuraID = 121253,
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'keg_smash',
        AuraApplyLength = 15,
    },
    breath_of_fire = {
        AuraApplied = 'breath_of_fire_dot',
        AuraApplyLength = 12,
    },
    breath_of_fire_dot = {
        AuraID = 123725,
        AuraUnit = 'target',
        AuraMine = true,
        aura_refreshable = function(spell, env)
            return spell.aura_remains < (env.breath_of_fire.AuraApplyLength / 2) and true or false -- Half of the dot in order to deal with time extension
        end,
    },
}

local brewmaster_talent_overrides = {
    diffuse_magic = { -- No longer Brewmaster ability?
        AuraID = 122783,
        AuraMine = true,
        AuraUnit = 'player',
        AuraApplied = 'diffuse_magic',
        AuraApplyLength = 6,
    },
}

local brewmaster_stagger_overrides = {
    stagger = {
        any = function(spell, env) return spell.light or spell.moderate or spell.heavy or false end,
        light = function(spell, env) return (env.stagger_light.aura_remains > 0) and true or false end,
        moderate = function(spell, env) return (env.stagger_moderate.aura_remains > 0) and true or false end,
        heavy = function(spell, env) return (env.stagger_heavy.aura_remains > 0) and true or false end,
        total_damage_staggered = function(spell, env)
            return UnitStagger('player') or 0
        end,
        ticks_remain = function(spell, env)
            return mfloor(spell.aura_remains * 2) -- every 0.5 secs, so double the
        end,
        damage_per_tick = function(spell, env)
            local ticks = spell.ticks_remain
            if ticks <= 0 then return 0 end
            return spell.total_damage_staggered / ticks
        end,
        aura_remains = function(spell, env)
            return spell.heavy and env.stagger_heavy.aura_remains
                or spell.moderate and env.stagger_moderate.aura_remains
                or spell.light and env.stagger_light.aura_remains
                or 0
        end,
    },
    stagger_light = {
        AuraID = 124275,
        AuraUnit = 'player',
        AuraMine = true,
    },
    stagger_moderate = {
        AuraID = 124274,
        AuraUnit = 'player',
        AuraMine = true,
    },
    stagger_heavy = {
        AuraID = 124273,
        AuraUnit = 'player',
        AuraMine = true,
    },
}

-- Stagger tick damage accumulator
for i = 1,20 do
    brewmaster_stagger_overrides.stagger['last_tick_damage_'..i] = function(spell, env)
        return spell.damage_per_tick * i
    end
end

TJ:RegisterPlayerClass({
    name = 'Brewmaster',
    class_id = 10,
    spec_id = 1,
    default_action_profile = 'simc::monk::brewmaster',
    resources = { 'energy', 'energy_per_time', 'chi' },
    actions = {
        runeforging_overrides,
        covenant_overrides,
        brewmaster_abilities_exported,
        brewmaster_base_overrides,
        brewmaster_talent_overrides,
        brewmaster_stagger_overrides
    },
    blacklisted = {
        'gift_of_the_ox'
    },
    config_checkboxes = {
    },
    conditional_substitutions_post = {
    },
})
