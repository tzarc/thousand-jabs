if select(2, UnitClass('player')) ~= 'PALADIN' then return end

local addonName, internal = ...
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Config = TJ:GetModule('Config')

if not Core:MatchesBuild('7.3.2', '7.3.2') then return end

------------------------------------------------------------------------------------------------------------------------
-- Retribution profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local retribution_abilities_exported = {
    avenging_wrath = { SpellIDs = { 31884 }, },
    blade_of_justice = { SpellIDs = { 184575 }, },
    blade_of_wrath = { TalentID = 22182, },
    blessing_of_freedom = { SpellIDs = { 1044 }, },
    blessing_of_protection = { SpellIDs = { 1022 }, },
    blinding_light = { SpellIDs = { 115750 }, TalentID = 21811, },
    cavalier = { TalentID = 22483, },
    cleanse_toxins = { SpellIDs = { 213644 }, },
    consecration = { SpellIDs = { 205228 }, TalentID = 22175, },
    crusade = { TalentID = 22215, },
    crusader_strike = { SpellIDs = { 35395 }, },
    divine_hammer = { SpellIDs = { 198034 }, TalentID = 22183, },
    divine_intervention = { TalentID = 22485, },
    divine_purpose = { TalentID = 22591, },
    divine_shield = { SpellIDs = { 642 }, },
    divine_steed = { SpellIDs = { 190784 }, },
    divine_storm = { SpellIDs = { 53385 }, },
    execution_sentence = { SpellIDs = { 213757 }, TalentID = 22557, },
    eye_for_an_eye = { SpellIDs = { 205191 }, TalentID = 22185, },
    final_verdict = { TalentID = 22590, },
    fist_of_justice = { TalentID = 22896, },
    flash_of_light = { SpellIDs = { 19750 }, },
    greater_blessing_of_kings = { SpellIDs = { 203538 }, },
    greater_blessing_of_wisdom = { SpellIDs = { 203539 }, },
    greater_judgment = { TalentID = 22593, },
    hammer_of_justice = { SpellIDs = { 853 }, },
    hand_of_hindrance = { SpellIDs = { 183218 }, },
    hand_of_reckoning = { SpellIDs = { 62124 }, },
    heart_of_the_crusader = { SpellIDs = { 32223 }, },
    holy_wrath = { TalentID = 22634, },
    judgment = { SpellIDs = { 20271 }, },
    judgment_of_light = { TalentID = 22484, },
    justicars_vengeance = { SpellIDs = { 215661 }, TalentID = 22595, },
    lay_on_hands = { SpellIDs = { 633 }, },
    mastery_divine_judgment = { SpellIDs = { 76672 }, },
    rebuke = { SpellIDs = { 96231 }, },
    redemption = { SpellIDs = { 7328 }, },
    repentance = { SpellIDs = { 20066 }, TalentID = 22180, },
    retribution = { SpellIDs = { 183435 }, },
    shield_of_vengeance = { SpellIDs = { 184662 }, },
    templars_verdict = { SpellIDs = { 85256 }, },
    the_fires_of_justice = { TalentID = 22319, },
    virtues_blade = { TalentID = 22375, },
    word_of_glory = { SpellIDs = { 210191 }, TalentID = 22186, },
    zeal = { SpellIDs = { 217020 }, TalentID = 22592, },

    wake_of_ashes = { SpellIDs = { 205273 }, }, -- TODO: Confirm
}

local retribution_ability_overrides = {
    rebuke = {
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
    shield_of_vengeance = {
        AuraID = { 184662 },
        AuraUnit = 'player',
        AuraMine = true,
    },
    blessing_of_protection = {
        AuraApplied = 'forbearance',
        AuraApplyLength = 30,

        CanCast = function(spell, env)
            return env.forbearance.aura_down and true or false
        end,
    },
    divine_shield = {
        AuraApplied = 'forbearance',
        AuraApplyLength = 30,

        CanCast = function(spell, env)
            return env.forbearance.aura_down and true or false
        end,
    },
    avenging_wrath = {
        AuraID = { 31884 },
        AuraUnit = 'player',
        AuraMine = true,
    },
    forbearance = {
        AuraID = { 25771 },
        AuraUnit = 'player',
        AuraMine = true,
    },
    judgment = {
        AuraID = { 197277 },
        AuraUnit = 'target',
        AuraMine = true,
    },
}

local retribution_talent_overrides = {
    crusader_strike = {
        PerformCast = function(spell,env)
            env.holy_power.gained = env.holy_power.gained + 1
        end,
    },
    divine_hammer = {
        PerformCast = function(spell,env)
            env.holy_power.gained = env.holy_power.gained + 2
        end,
    },
    crusade = {
        AuraID = { 231895 }, -- TODO: Confirm
        AuraUnit = 'player',
        AuraMine = true,
    },
    divine_purpose = {
        AuraID = { 223817, 223819 }, -- TODO: Confirm
        AuraUnit = 'player',
        AuraMine = true,
    },
    execution_sentence = {
        AuraID = { 213757 }, -- TODO: Confirm
        AuraUnit = 'player',
        AuraMine = true,
    },
    the_fires_of_justice = {
        AuraID = { 203316, 209785 }, -- TODO: Confirm
        AuraUnit = 'player',
        AuraMine = true,
    },
}

local retribution_artifact_overrides = {
    ashes_to_ashes = {
        artifact_enabled = function(spell,env) return Config:GetSpec("ashes_to_ashes_selected") end,
    },
    wake_of_ashes = {
        AuraID = { 205290, 214083, 209122, 218001 }, -- TODO: Confirm
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'wake_of_ashes',
        AuraApplyLength = 6,
        artifact_enabled = function(spell,env) return Config:GetSpec("wake_of_ashes_selected") end,
    },
}

local retribution_legendary_overrides = {
    liadrins_fury_unleashed = {
        AuraID = { 208408 }, -- TODO: Confirm
        AuraUnit = 'player',
        AuraMine = true,
    },
    scarlet_inquisitors_expurgation = {
        AuraID = { 248013 }, -- TODO: Confirm
        AuraUnit = 'player',
        AuraMine = true,
    },
    whisper_of_the_nathrezim = {
        AuraID = { 207633 }, -- TODO: Confirm
        AuraUnit = 'player',
        AuraMine = true,
    },
}

TJ:RegisterPlayerClass({
    name = 'Retribution',
    class_id = 2,
    spec_id = 3,
    default_action_profile = 'simc::paladin::retribution',
    resources = { 'mana', 'mana_per_time', 'holy_power' },
    actions = {
        retribution_abilities_exported,
        retribution_ability_overrides,
        retribution_talent_overrides,
        retribution_artifact_overrides,
        retribution_legendary_overrides,
    },
    config_checkboxes = {
        ashes_to_ashes_selected = false,
        wake_of_ashes_selected = false,
    },
    blacklisted = {},
})
