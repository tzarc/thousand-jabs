local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Config = TJ:GetModule('Config')

local mmax = math.max

------------------------------------------------------------------------------------------------------------------------
-- Frost profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local frost_abilities_exported = {}
if TJ:MatchesBuild('7.1.5', '7.1.5') then
    frost_abilities_exported = {
        arctic_gale = { TalentID = 22473, },
        blink = { SpellIDs = { 1953 }, },
        blizzard = { SpellIDs = { 190356 }, },
        bone_chilling = { TalentID = 22463, },
        cold_snap = { SpellIDs = { 235219 }, },
        comet_storm = { TalentID = 21634, },
        cone_of_cold = { SpellIDs = { 120 }, },
        conjure_refreshment = { SpellIDs = { 190336 }, },
        counterspell = { SpellIDs = { 2139 }, },
        ebonbolt = { SpellIDs = { 214634 }, },
        flurry = { SpellIDs = { 44614 }, },
        freeze = { SpellIDs = { 33395 }, },
        frigid_winds = { TalentID = 22446, },
        frost_bomb = { SpellIDs = { 112948 }, TalentID = 22454, },
        frost_nova = { SpellIDs = { 122 }, },
        frostbolt = { SpellIDs = { 116 }, },
        frozen_orb = { SpellIDs = { 84714 }, },
        frozen_touch = { TalentID = 22466, },
        glacial_insulation = { TalentID = 16025, },
        glacial_spike = { TalentID = 22309, },
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
        mirror_image = { SpellIDs = { 55342 }, TalentID = 22444, },
        pack_hobgoblin = { SpellIDs = { 69046 }, },
        polymorph = { SpellIDs = { 118 }, },
        ray_of_frost = { SpellIDs = { 205021 }, TalentID = 22457, },
        ring_of_frost = { SpellIDs = { 113724 }, TalentID = 22448, },
        rocket_barrage = { SpellIDs = { 69041 }, },
        rocket_jump = { SpellIDs = { 69070 }, },
        rune_of_power = { SpellIDs = { 116011 }, TalentID = 22445, },
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
end

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
        PerformCast = function(spell, env)
            if env.fingers_of_frost.aura_stack > 0 then
                env.fingers_of_frost.aura_stack = env.fingers_of_frost.aura_stack - 1
            end
            if env.fingers_of_frost.aura_stack == 0 then
                env.fingers_of_frost.expirationTime = 0
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
    zannesu_journey = {
        AuraID = 206397,
        AuraUnit = 'player',
        AuraMine = true,
    },
    water_jet = {
        spell_cast_time = 0.01, -- pet ability, off GCD
        OverlayTitle = "PET ABILITY",
    }
}

local frost_artifact_overrides = {
    icy_hand = {
        artifact_enabled = function(spell,env)
            return Config:GetSpec("icy_hand_selected") and true or false
        end,
    },
}

TJ:RegisterPlayerClass({
    betaProfile = true,
    name = 'Frost',
    class_id = 8,
    spec_id = 3,
    action_profile = 'legion-dev::mage::frost',
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
})
