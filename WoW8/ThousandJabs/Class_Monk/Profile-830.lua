------------------------------------------------------------------------------------------------------------------------
-- BfA only.
------------------------------------------------------------------------------------------------------------------------
if GetBuildInfo and (select(4, GetBuildInfo()) < 80000 or select(4, GetBuildInfo()) >= 90000) then
    return
end

------------------------------------------------------------------------------------------------------------------------
if select(2, UnitClass('player')) ~= 'MONK' then return end

local addonName, internal = ...
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Config = TJ:GetModule('Config')

if not Core:MatchesBuild('8.3.0', '8.3.9') then return end

local mmin = math.min

------------------------------------------------------------------------------------------------------------------------
-- Brewmaster profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local brewmaster_abilities_exported = {
    black_ox_brew = { SpellIDs = { 115399 }, TalentID = 19992, },
    blackout_combo = { TalentID = 22108, },
    blackout_strike = { SpellIDs = { 205523 }, },
    bob_and_weave = { TalentID = 20174, },
    breath_of_fire = { SpellIDs = { 115181 }, },
    brewmasters_balance = { SpellIDs = { 245013 }, },
    celerity = { TalentID = 19304, },
    chi_burst = { SpellIDs = { 123986 }, TalentID = 20185, },
    chi_torpedo = { SpellIDs = { 115008 }, TalentID = 19818, },
    chi_wave = { SpellIDs = { 115098 }, TalentID = 19820, },
    crackling_jade_lightning = { SpellIDs = { 117952 }, },
    dampen_harm = { SpellIDs = { 122278 }, TalentID = 20175, },
    detox = { SpellIDs = { 218164 }, },
    expel_harm = { SpellIDs = { 115072 }, },
    eye_of_the_tiger = { TalentID = 23106, },
    fortifying_brew = { SpellIDs = { 115203 }, },
    gift_of_the_ox = { SpellIDs = { 124502 }, },
    guard = { SpellIDs = { 115295 }, TalentID = 22104, },
    healing_elixir = { SpellIDs = { 122281 }, TalentID = 23363, },
    high_tolerance = { TalentID = 22106, },
    invoke_niuzao_the_black_ox = { SpellIDs = { 132578 }, TalentID = 22103, },
    ironskin_brew = { SpellIDs = { 115308 }, },
    keg_smash = { SpellIDs = { 121253 }, },
    leg_sweep = { SpellIDs = { 119381 }, },
    light_brewing = { TalentID = 22099, },
    mastery_elusive_brawler = { SpellIDs = { 117906 }, },
    mystic_touch = { SpellIDs = { 8647 }, },
    paralysis = { SpellIDs = { 115078 }, },
    provoke = { SpellIDs = { 115546 }, },
    purifying_brew = { SpellIDs = { 119582 }, },
    resuscitate = { SpellIDs = { 115178 }, },
    ring_of_peace = { SpellIDs = { 116844 }, TalentID = 19995, },
    roll = { SpellIDs = { 109132 }, },
    rushing_jade_wind = { SpellIDs = { 116847 }, TalentID = 20184, },
    spear_hand_strike = { SpellIDs = { 116705 }, },
    special_delivery = { TalentID = 19819, },
    spitfire = { TalentID = 22097, },
    stagger = { SpellIDs = { 115069 }, },
    summon_black_ox_statue = { SpellIDs = { 115315 }, TalentID = 19994, },
    tiger_palm = { SpellIDs = { 100780 }, },
    tiger_tail_sweep = { TalentID = 19993, },
    tigers_lust = { SpellIDs = { 116841 }, TalentID = 19302, },
    transcendence = { SpellIDs = { 101643 }, },
    transcendence_transfer = { SpellIDs = { 119996 }, },
    vivify = { SpellIDs = { 116670 }, },
    zen_flight = { SpellIDs = { 125883 }, },
    zen_meditation = { SpellIDs = { 115176 }, },
}

TJ:RegisterPlayerClass({
    name = 'Brewmaster',
    class_id = 10,
    spec_id = 1,
    default_action_profile = 'custom::monk::brewmaster',
    resources = { 'energy', 'energy_per_time' },
    actions = {
        brewmaster_abilities_exported,
    },
    blacklisted = {
    },
})

------------------------------------------------------------------------------------------------------------------------
-- Windwalker profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local windwalker_abilities_exported = {
    afterlife = { SpellIDs = { 116092 }, },
    ascension = { TalentID = 22098, },
    blackout_kick = { SpellIDs = { 100784 }, },
    celerity = { TalentID = 19304, },
    chi_burst = { SpellIDs = { 123986 }, TalentID = 20185, },
    chi_torpedo = { SpellIDs = { 115008 }, TalentID = 19818, },
    chi_wave = { SpellIDs = { 115098 }, TalentID = 19820, },
    crackling_jade_lightning = { SpellIDs = { 117952 }, },
    dampen_harm = { SpellIDs = { 122278 }, TalentID = 20175, },
    detox = { SpellIDs = { 218164 }, },
    diffuse_magic = { SpellIDs = { 122783 }, TalentID = 20173, },
    disable = { SpellIDs = { 116095 }, },
    energizing_elixir = { SpellIDs = { 115288 }, TalentID = 22096, },
    eye_of_the_tiger = { TalentID = 23106, },
    fist_of_the_white_tiger = { SpellIDs = { 261947 }, TalentID = 19771, },
    fists_of_fury = { SpellIDs = { 113656 }, },
    flying_serpent_kick = { SpellIDs = { 101545 }, },
    good_karma = { SpellIDs = { 280195 }, TalentID = 23364, },
    hit_combo = { TalentID = 22093, },
    inner_strength = { TalentID = 23258, },
    invoke_xuen_the_white_tiger = { SpellIDs = { 123904 }, TalentID = 22102, },
    leg_sweep = { SpellIDs = { 119381 }, },
    mastery_combo_strikes = { SpellIDs = { 115636 }, },
    mystic_touch = { SpellIDs = { 8647 }, },
    paralysis = { SpellIDs = { 115078 }, },
    provoke = { SpellIDs = { 115546 }, },
    resuscitate = { SpellIDs = { 115178 }, },
    ring_of_peace = { SpellIDs = { 116844 }, TalentID = 19995, },
    rising_sun_kick = { SpellIDs = { 107428 }, },
    roll = { SpellIDs = { 109132 }, },
    rushing_jade_wind = { SpellIDs = { 116847 }, TalentID = 23122, },
    serenity = { SpellIDs = { 152173 }, TalentID = 21191, },
    spear_hand_strike = { SpellIDs = { 116705 }, },
    spinning_crane_kick = { SpellIDs = { 101546 }, },
    spiritual_focus = { TalentID = 22107, },
    storm_earth_and_fire = { SpellIDs = { 137639 }, },
    tiger_palm = { SpellIDs = { 100780 }, },
    tiger_tail_sweep = { SpellIDs = { 264348 }, TalentID = 19993, },
    tigers_lust = { SpellIDs = { 116841 }, TalentID = 19302, },
    touch_of_death = { SpellIDs = { 115080 }, },
    touch_of_karma = { SpellIDs = { 122470 }, },
    transcendence = { SpellIDs = { 101643 }, },
    transcendence_transfer = { SpellIDs = { 119996 }, },
    vivify = { SpellIDs = { 116670 }, },
    whirling_dragon_punch = { SpellIDs = { 152175 }, TalentID = 22105, },
    zen_flight = { SpellIDs = { 125883 }, },
}

TJ:RegisterPlayerClass({
    name = 'Windwalker',
    class_id = 10,
    spec_id = 3,
    default_action_profile = 'simc::monk::windwalker',
    resources = { 'energy', 'energy_per_time', 'chi' },
    actions = {
        windwalker_abilities_exported,
    },
    config_checkboxes = {
    },
    simc_mapping = { -- simc_name = "equivalent_parsed_ingame_table_name"
    },
    blacklisted = {
    },
})
