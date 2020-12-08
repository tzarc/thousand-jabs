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
}

local brewmaster_talent_overrides = {
    }

TJ:RegisterPlayerClass({
    name = 'Brewmaster',
    class_id = 10,
    spec_id = 1,
    default_action_profile = 'simc::monk::brewmaster',
    resources = { 'energy', 'chi' },
    actions = {
        brewmaster_abilities_exported,
        brewmaster_base_overrides,
        brewmaster_talent_overrides
    },
    blacklisted = {
    },
    config_checkboxes = {
    },
    conditional_substitutions_post = {
    },
})
