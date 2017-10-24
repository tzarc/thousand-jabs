if select(2, UnitClass('player')) ~= 'MAGE' then return end

local addonName, internal = ...
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Config = TJ:GetModule('Config')

if not Core:MatchesBuild('7.3.2', '7.3.2') then return end

local mmax = math.max

------------------------------------------------------------------------------------------------------------------------
-- Frost profile definition
------------------------------------------------------------------------------------------------------------------------

-- When exporting Frost, ensure that the Water Elemental is out before running /tj _esd.

-- exported with /tj _esd
local frost_abilities_exported = {
    arctic_gale = { TalentID = 22473, },
    blink = { SpellIDs = { 1953 }, },
    blizzard = { SpellIDs = { 190356 }, },
    bone_chilling = { TalentID = 22463, },
    brain_freeze = { SpellIDs = { 190447 }, },
    cold_snap = { SpellIDs = { 235219 }, },
    comet_storm = { SpellIDs = { 153595 }, TalentID = 21634, },
    cone_of_cold = { SpellIDs = { 120 }, },
    conjure_refreshment = { SpellIDs = { 190336 }, },
    counterspell = { SpellIDs = { 2139 }, },
    ebonbolt = { SpellIDs = { 214634 }, },
    fingers_of_frost = { SpellIDs = { 112965 }, },
    flurry = { SpellIDs = { 44614 }, },
    freeze = { SpellIDs = { 33395 }, },
    frigid_winds = { TalentID = 22446, },
    frost_bomb = { SpellIDs = { 112948 }, TalentID = 22454, },
    frost_nova = { SpellIDs = { 122 }, },
    frostbolt = { SpellIDs = { 116 }, },
    frozen_orb = { SpellIDs = { 84714 }, },
    frozen_touch = { TalentID = 22466, },
    glacial_insulation = { TalentID = 16025, },
    glacial_spike = { SpellIDs = { 199786 }, TalentID = 22309, },
    ice_barrier = { SpellIDs = { 11426 }, },
    ice_block = { SpellIDs = { 45438 }, },
    ice_floes = { SpellIDs = { 108839 }, TalentID = 22903, },
    ice_lance = { SpellIDs = { 30455 }, },
    ice_nova = { SpellIDs = { 157997 }, TalentID = 22452, },
    ice_ward = { TalentID = 22471, },
    icy_veins = { SpellIDs = { 12472 }, },
    incanters_flow = { TalentID = 22447, },
    invisibility = { SpellIDs = { 66 }, },
    lonely_winter = { TalentID = 22460, },
    mastery_icicles = { SpellIDs = { 76613 }, },
    mirror_image = { SpellIDs = { 55342 }, TalentID = 22444, },
    pack_hobgoblin = { SpellIDs = { 69046 }, },
    polymorph = { SpellIDs = { 118 }, },
    ray_of_frost = { SpellIDs = { 205021 }, TalentID = 22457, },
    ring_of_frost = { SpellIDs = { 113724 }, TalentID = 22448, },
    rocket_barrage = { SpellIDs = { 69041 }, },
    rocket_jump = { SpellIDs = { 69070 }, },
    rune_of_power = { SpellIDs = { 116011 }, TalentID = 22445, },
    shatter = { SpellIDs = { 12982 }, },
    shimmer = { SpellIDs = { 212653 }, TalentID = 22442, },
    slow_fall = { SpellIDs = { 130 }, },
    spellsteal = { SpellIDs = { 30449 }, },
    splitting_ice = { TalentID = 22469, },
    summon_water_elemental = { SpellIDs = { 31687 }, },
    thermal_void = { TalentID = 21632, },
    time_warp = { SpellIDs = { 80353 }, },
    unstable_magic = { TalentID = 22449, },
    water_jet = { SpellIDs = { 135029 }, },
    waterbolt = { SpellIDs = { 31707 }, },
}

local frost_base_abilities = {
    counterspell = {
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
    ice_lance = {
        spell_travel_time = function(spell, env) return mmax(2, (env.movement.distance / 20)) end, -- 10yd->0.5sec, ballpark, can't really tell
        PerformCast = function(spell, env)
            if env.fingers_of_frost.aura_stack > 0 then
                env.fingers_of_frost.aura_stack = env.fingers_of_frost.aura_stack - 1
            end
            if env.fingers_of_frost.aura_stack == 0 then
                env.fingers_of_frost.expirationTime = 0
            end
            if not env.glacial_spike.talent_enabled then
                env.icicles.aura_stack = 0
                env.icicles.expirationTime = 0
            end
        end,
    },
    ray_of_frost = {
        CanCast = function(spell, env)
            local lastCast = env.lastCastTimes[spell.SpellIDs[1]] or 0
            local castEnd = lastCast + 10
            return (lastCast == 0 or env.currentTime < castEnd) and true or false
        end,
    },
    frostbolt = {
        PerformCast = function(spell, env)
            env.icicles.expirationTime = env.currentTime + 60
            env.icicles.aura_stack = env.icicles.aura_stack + 1
        end,
    },
    fingers_of_frost = {
        AuraID = { 44544, 112965 },
        AuraUnit = 'player',
        AuraMine = true,
    },
    icy_veins = {
        AuraID = 12472,
        AuraUnit = 'player',
        AuraMine = true,
    },
    icicles = {
        AuraID = 205473,
        AuraUnit = 'player',
        AuraMine = true,
    },
    glacial_spike = {
        spell_travel_time = function(spell, env)
            local velocity = 40 -- yd/sec, from simc allspells.txt
            return mmax(0.1, (env.movement.distance or 0) / velocity)
        end,
        CanCast = function(spell, env)
            return env.icicles.aura_stack == 5 and true or false
        end,
    },
    brain_freeze = {
        AuraID = { 190447, 231584 },
        AuraUnit = 'player',
        AuraMine = true,
    },
    rune_of_power = {
        AuraID = 116014,
        AuraUnit = 'player',
        AuraMine = true,
        aura_remains = function(spell, env) -- Override, as the actual buff doesn't have a timer
            return mmax(0, ((env.lastCastTimes[spell.SpellIDs[1]] or 0) + 10) - env.currentTime)
        end,
        CanCast = function(spell, env)
            return spell.aura_down and true or false
        end,
        PerformCast = function(spell, env)
            spell.expirationTime = env.currentTime + 10
        end,
    },
    winters_chill = {
        AuraID = 228358,
        AuraUnit = 'target',
        AuraMine = true,
    },
    zannesu_journey = {
        AuraID = 206397,
        AuraUnit = 'player',
        AuraMine = true,
    },
    frozen_mass = {
        AuraID = 242253,
        AuraUnit = 'player',
        AuraMine = true,
    },
    waterbolt = {
        spell_cast_time = 0.01, -- pet ability, off GCD
    },
    water_jet = {
        spell_cast_time = 0.01, -- pet ability, off GCD
        OverlayTitle = "PET ABILITY",
    },
    summon_water_elemental = {
        CanCast = function(spell, env)
            return (not UnitExists("pet"))
        end
    },
}

local frost_artifact_overrides = {
    icy_hand = {
        artifact_enabled = function(spell,env)
            return Config:GetSpec("icy_hand_selected") and true or false
        end,
    },
}

TJ:RegisterPlayerClass({
    name = 'Frost',
    class_id = 8,
    spec_id = 3,
    default_action_profile = 'simc::mage::frost',
    resources = { 'mana' },
    actions = {
        frost_abilities_exported,
        frost_base_abilities,
        frost_artifact_overrides,
    },
    config_checkboxes = {
        icy_hand_selected = false,
    },
    blacklisted = {},
    simc_mapping = { -- simc_name = "equivalent_parsed_ingame_table_name"
        water_elemental = "summon_water_elemental",
    },
})
