if select(2, UnitClass('player')) ~= 'SHAMAN' then return end

local addonName, internal = ...
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Config = TJ:GetModule('Config')

if not Core:MatchesBuild('7.3.2', '7.3.2') then return end

local mmin = math.min
local mmax = math.max

-- When exporting Ele shaman, run a normal export, then select Ascendance and re-run '/tj _esd' a second time.

-- exported with /tj _esd
local elemental_abilities_exported = {
    aftershock = { TalentID = 19271, },
    ancestral_guidance = { SpellIDs = { 108281 }, TalentID = 22139, },
    ancestral_spirit = { SpellIDs = { 2008 }, },
    ancestral_swiftness = { TalentID = 19272, },
    ascendance = { SpellIDs = { 114050 }, TalentID = 21198, },
    astral_recall = { SpellIDs = { 556 }, },
    astral_shift = { SpellIDs = { 108271 }, },
    bloodlust = { SpellIDs = { 2825 }, },
    chain_lightning = { SpellIDs = { 188443 }, },
    cleanse_spirit = { SpellIDs = { 51886 }, },
    earth_elemental = { SpellIDs = { 198103 }, },
    earth_shock = { SpellIDs = { 8042 }, },
    earthbind_totem = { SpellIDs = { 2484 }, },
    earthen_rage = { TalentID = 22357, },
    earthgrab_totem = { SpellIDs = { 51485 }, TalentID = 19260, },
    earthquake = { SpellIDs = { 61882 }, },
    echo_of_the_elements = { TalentID = 21968, },
    elemental_blast = { SpellIDs = { 117014 }, TalentID = 19270, },
    elemental_focus = { SpellIDs = { 16164 }, },
    elemental_fury = { SpellIDs = { 60188 }, },
    elemental_fusion = { TalentID = 22144, },
    elemental_mastery = { SpellIDs = { 16166 }, TalentID = 19273, },
    far_sight = { SpellIDs = { 6196 }, },
    fire_elemental = { SpellIDs = { 198067 }, },
    flame_shock = { SpellIDs = { 188389 }, },
    frost_shock = { SpellIDs = { 196840 }, },
    ghost_wolf = { SpellIDs = { 2645 }, },
    gust_of_wind = { SpellIDs = { 192063 }, TalentID = 19259, },
    healing_surge = { SpellIDs = { 8004 }, },
    hex = { SpellIDs = { 51514 }, },
    icefury = { SpellIDs = { 210714 }, TalentID = 21972, },
    lava_beam = { SpellIDs = { 114074 }, },
    lava_burst = { SpellIDs = { 51505 }, },
    lava_surge = { SpellIDs = { 77756 }, },
    lightning_bolt = { SpellIDs = { 188196 }, },
    lightning_rod = { TalentID = 21199, },
    lightning_surge_totem = { SpellIDs = { 192058 }, TalentID = 19275, },
    liquid_magma_totem = { SpellIDs = { 192222 }, TalentID = 22145, },
    mastery_elemental_overload = { SpellIDs = { 168534 }, },
    pack_hobgoblin = { SpellIDs = { 69046 }, },
    path_of_flame = { TalentID = 22356, },
    primal_elementalist = { TalentID = 22172, },
    purge = { SpellIDs = { 370 }, },
    reincarnation = { SpellIDs = { 20608 }, },
    rocket_barrage = { SpellIDs = { 69041 }, },
    rocket_jump = { SpellIDs = { 69070 }, },
    storm_elemental = { SpellIDs = { 192249 }, TalentID = 19266, },
    stormkeeper = {  SpellIDs = { 205495 }, }, -- TODO: Check
    thunderstorm = { SpellIDs = { 51490 }, },
    totem_mastery = { SpellIDs = { 210643 }, TalentID = 22358, },
    voodoo_totem = { SpellIDs = { 196932 }, TalentID = 22127, },
    water_walking = { SpellIDs = { 546 }, },
    wind_rush_totem = { SpellIDs = { 192077 }, TalentID = 21963, },
    wind_shear = { SpellIDs = { 57994 }, },
}

local function DecrementUpdateElementalFocus(env)
    if env.elemental_focus.aura_up then
        env.elemental_focus.aura_stack = env.elemental_focus.aura_stack - 1
        if env.elemental_focus.aura_stack == 0 then
            env.elemental_focus.expirationTime = 0
        end
        --Core:Debug("env.elemental_focus.aura_stack = " .. env.elemental_focus.aura_stack)
    end
end

local function DecrementIcefury(env)
    if env.icefury.aura_up then
        env.icefury.aura_stack = env.icefury.aura_stack - 1
        if env.icefury.aura_stack == 0 then
            env.icefury.expirationTime = 0
        end
    end
end

local elemental_base_overrides = {
    wind_shear = {
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
    flame_shock = {
        spell_cast_time = 0.01,
        AuraID = 188389,
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'flame_shock',
        AuraApplyLength = 120, -- Not actually this long - next screen update will end up reading the new length
        aura_duration = 15,
        cost_type = 'maelstrom',
        spell_refreshable = function(spell, env)
            if spell.aura_down then return true end
            if spell.aura_remains <= spell.aura_duration * 0.3 then return true end
            return false
        end,
        maelstrom_cost = function(spell, env)
            return mmax(0, mmin(20, env.maelstrom.curr))
        end,
        PerformCast = function(spell, env)
            spell.expirationTime = env.currentTime + 30 -- Next reset it'll fix up the duration, don't bother about the cost
            DecrementUpdateElementalFocus(env)
        end,
    },
    earth_shock = {
        spell_cast_time = 0.01,
        cost_type = 'maelstrom',
        maelstrom_cost = function(spell, env)
            return mmax(10, mmin(100, env.maelstrom.curr))
        end,
        PerformCast = function(spell, env)
            DecrementUpdateElementalFocus(env)
        end,
    },
    frost_shock = {
        spell_cast_time = 0.01,
        cost_type = 'maelstrom',
        maelstrom_cost = function(spell, env)
            return mmax(0, mmin(20, env.maelstrom.curr))
        end,
        PerformCast = function(spell, env)
            DecrementUpdateElementalFocus(env)
            DecrementIcefury(env)
        end,
    },
    lightning_bolt = {
        PerformCast = function(spell, env)
            env.maelstrom.gained = env.maelstrom.gained + 8
            DecrementUpdateElementalFocus(env)
        end,
    },
    chain_lightning = {
        PerformCast = function(spell, env)
            env.maelstrom.gained = env.maelstrom.gained + (6 * mmin(5, env.seen_targets))
            DecrementUpdateElementalFocus(env)
        end,
    },
    thunderstorm = {
        PerformCast = function(spell, env)
            DecrementUpdateElementalFocus(env)
        end,
    },
    earthquake = {
        PerformCast = function(spell, env)
            DecrementUpdateElementalFocus(env)
        end,
    },
    lava_burst = {
        spell_cast_time = function(spell, env)
            -- Insta-cast when Lava Surge is up
            if env.lava_surge.aura_up then
                return 0.01
            end
            return spell.base_cast_time
        end,
        PerformCast = function(spell, env)
            env.maelstrom.gained = env.maelstrom.gained + 12
            if env.lava_surge.aura_up then
                env.lava_surge.expirationTime = 0
            end
            DecrementUpdateElementalFocus(env)
        end,
    },
    lava_beam = {
        PerformCast = function(spell, env)
            DecrementUpdateElementalFocus(env)
        end,
    },
    lava_surge = {
        AuraID = 77762,
        AuraUnit = 'player',
        AuraMine = true,
    },
    elemental_focus = {
        AuraID = 16246,
        AuraUnit = 'player',
        AuraMine = true,
    },
}

local elemental_talent_overrides = {
    ascendance = {
        aura_duration = 15,
    },
    elemental_blast = {
        PerformCast = function(spell, env)
            DecrementUpdateElementalFocus(env)
        end,
    },
    totem_mastery = {
        AuraApplied = 'resonance_totem',
        AuraApplyLength = 120,
        CanCast = function(spell, env)
            return env.resonance_totem.aura_down and true or false
        end,
    },
    icefury = {
        AuraID = 210714,
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'icefury',
        AuraApplyLength = 15,
        PerformCast = function(spell, env)
            env.maelstrom.gained = env.maelstrom.gained + 24
            env.icefury.aura_stack = 4
            DecrementUpdateElementalFocus(env)
        end,
    },
    resonance_totem = {
        AuraID = 202192,
        AuraUnit = 'player',
        AuraMine = true,
    },
    lightning_rod = {
        AuraID = 197209,
        AuraUnit = 'target',
        AuraMine = true,
    },
}

local elemental_artifact_abilities = {
    power_of_the_maelstrom = {
        AuraID = 191861,
        AuraUnit = 'player',
        AuraMine = true,
    },
    swelling_maelstrom = {
        artifact_enabled = function(spell,env)
            return Config:GetSpec("swelling_maelstrom_selected") and true or false
        end,
    },
    seismic_storm = {
        artifact_enabled = function(spell,env)
            return Config:GetSpec("seismic_storm_selected") and true or false
        end,
    },
}

local elemental_legendary_overrides = {
    echoes_of_the_great_sundering = {

    }
}

local elemental_tier = {
    earthen_strength = { -- T21 2P
        AuraID = { 251757, 252141 },
        AuraUnit = 'player',
        AuraMine = true,
    },
}

local elemental_hooks = {
    hooks = {
        OnStateInit = function(env)
        end,
    }
}

TJ:RegisterPlayerClass({
    name = 'Elemental',
    class_id = 7,
    spec_id = 1,
    default_action_profile = 'simc::shaman::elemental',
    resources = { 'mana', 'maelstrom' },
    actions = {
        elemental_abilities_exported,
        elemental_base_overrides,
        elemental_talent_overrides,
        elemental_artifact_abilities,
        elemental_legendary_overrides,
        elemental_tier,
        elemental_hooks,
    },
    config_checkboxes = {
        swelling_maelstrom_selected = false,
        seismic_storm_selected = false,
    },
})
