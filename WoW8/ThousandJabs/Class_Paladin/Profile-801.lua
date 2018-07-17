--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BfA only.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if GetBuildInfo and select(4, GetBuildInfo()) < 80000 then
    return
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(2, UnitClass('player')) ~= 'PALADIN' then return end

local addonName, internal = ...
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Config = TJ:GetModule('Config')

local mmax = math.max
local mmin = math.min

if not Core:MatchesBuild('8.0.0', '8.0.9') then return end

------------------------------------------------------------------------------------------------------------------------
-- Retribution profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local retribution_abilities_exported = {
    art_of_war = { SpellIDs = { 267344 }, },
    avenging_wrath = { SpellIDs = { 31884 }, },
    blade_of_justice = { SpellIDs = { 184575 }, },
    blade_of_wrath = { TalentID = 22592, },
    blessing_of_freedom = { SpellIDs = { 1044 }, },
    blessing_of_protection = { SpellIDs = { 1022 }, },
    blinding_light = { SpellIDs = { 115750 }, TalentID = 21811, },
    cavalier = { TalentID = 22185, },
    cleanse_toxins = { SpellIDs = { 213644 }, },
    consecration = { SpellIDs = { 205228 }, TalentID = 22182, },
    contemplation = { SpellIDs = { 121183 }, },
    crusade = { SpellIDs = { 231895 }, TalentID = 22215, },
    crusader_strike = { SpellIDs = { 35395 }, },
    divine_judgment = { TalentID = 22375, },
    divine_purpose = { TalentID = 22591, },
    divine_shield = { SpellIDs = { 642 }, },
    divine_steed = { SpellIDs = { 190784 }, },
    divine_storm = { SpellIDs = { 53385 }, },
    execution_sentence = { SpellIDs = { 267798 }, TalentID = 22175, },
    eye_for_an_eye = { SpellIDs = { 205191 }, TalentID = 22186, },
    fires_of_justice = { TalentID = 22319, },
    fist_of_justice = { TalentID = 22896, },
    flash_of_light = { SpellIDs = { 19750 }, },
    greater_blessing_of_kings = { SpellIDs = { 203538 }, },
    greater_blessing_of_wisdom = { SpellIDs = { 203539 }, },
    hammer_of_justice = { SpellIDs = { 853 }, },
    hammer_of_wrath = { SpellIDs = { 24275 }, TalentID = 22593, },
    hand_of_hindrance = { SpellIDs = { 183218 }, },
    hand_of_reckoning = { SpellIDs = { 62124 }, },
    heart_of_the_crusader = { SpellIDs = { 32223 }, },
    inquisition = { SpellIDs = { 84963 }, TalentID = 22634, },
    judgment = { SpellIDs = { 20271 }, },
    justicars_vengeance = { SpellIDs = { 215661 }, TalentID = 22483, },
    lay_on_hands = { SpellIDs = { 633 }, },
    mastery_hand_of_light = { SpellIDs = { 267316 }, },
    rebuke = { SpellIDs = { 96231 }, },
    redemption = { SpellIDs = { 7328 }, },
    repentance = { SpellIDs = { 20066 }, TalentID = 22180, },
    retribution = { SpellIDs = { 183435 }, },
    righteous_verdict = { TalentID = 22557, },
    selfless_healer = { TalentID = 23167, },
    shield_of_vengeance = { SpellIDs = { 184662 }, },
    templars_verdict = { SpellIDs = { 85256 }, },
    unbreakable_spirit = { TalentID = 22595, },
    wake_of_ashes = { SpellIDs = { 255937 }, TalentID = 22183, },
    word_of_glory = { SpellIDs = { 210191 }, TalentID = 23086, },
    zeal = { TalentID = 22590, },
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
    avenging_wrath = {
        AuraID = { 31884 },
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'avenging_wrath',
        AuraApplyLength = 20,
        cooldown_remains_override = function(spell, env)
            if env.crusade.talent_enabled then
                return 0 -- This seems to be different to other cases?
            else
                return (spell.blacklisted and 999) or mmax(0, spell.cooldownStart + spell.cooldownDuration - env.currentTime)
            end
        end,
    },
    blade_of_justice = {
        PerformCast = function(spell, env)
            env.holy_power.gained = env.holy_power.gained + mmin(2, env.holy_power.deficit)
        end,
    },
    blessing_of_protection = {
        AuraID = { 1022 },
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'blessing_of_protection',
        AuraApplyLength = 10,
        PerformCast = function(spell, env)
            env.forbearance.expirationTime = env.currentTime + 30
        end,
        CanCast = function(spell, env)
            return env.forbearance.aura_down and true or false
        end,
    },
    crusader_strike = {
        PerformCast = function(spell,env)
            env.holy_power.gained = env.holy_power.gained + mmin(1, env.holy_power.deficit)
        end,
    },
    divine_shield = {
        AuraID = { 642 },
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'divine_shield',
        AuraApplyLength = 8,
        PerformCast = function(spell, env)
            env.forbearance.expirationTime = env.currentTime + 30
        end,
        CanCast = function(spell, env)
            return env.forbearance.aura_down and true or false
        end,
    },
    divine_storm = {
        PerformCast = function(spell, env)
            env.scarlet_inquisitors_expurgation.expirationTime = 0
            env.scarlet_inquisitors_expurgation.aura_stack = 0
        end,
    },
    forbearance = {
        AuraID = { 25771 },
        AuraUnit = 'player',
        AuraMine = true,
    },
    hammer_of_justice = {
        AuraID = { 853 },
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'hammer_of_justice',
        AuraApplyLength = 3,
    },
    hand_of_hindrance = {
        AuraID = { 183218 },
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'hand_of_hindrance',
        AuraApplyLength = 10,
    },
    hand_of_reckoning = {
        AuraID = { 62124 },
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'hand_of_reckoning',
        AuraApplyLength = 3,
    },
    judgment = {
        AuraID = { 197277 },
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'judgment',
        AuraApplyLength = 8,
        PerformCast = function(spell, env)
            if env.judgment_of_light.talent_enabled then
                env.judgment_of_light.expirationTime = env.currentTime + 30
                env.judgment_of_light.aura_stack = 40
            end
            if env.set_bonus.tier21_4pc then
                env.sacred_judgment.expirationTime = env.currentTime + 10
            end
        end
    },
    judgment_of_light = {
        AuraID = { 196941 },
        AuraUnit = 'target',
        AuraMine = true,
    },
    shield_of_vengeance = {
        AuraID = { 184662 },
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'shield_of_vengeance',
        AuraApplyLength = 15,
    },
}

local retribution_talent_overrides = {
    blinding_light = {
        AuraID = { 105421 },
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'blinding_light',
        AuraApplyLength = 6,
    },
    crusade = {
        AuraID = { 231895 },
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'crusade',
        AuraApplyLength = 6,
    },
    divine_hammer = {
        PerformCast = function(spell,env)
            env.holy_power.gained = env.holy_power.gained + mmin(2, env.holy_power.deficit)
        end,
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
        PerformCast = function(spell, env)
            env.holy_power.gained = env.holy_power.gained + mmin(5, env.holy_power.deficit)
        end
    },
}

local retribution_legendary_overrides = {
    liadrins_fury_unleashed = {
        AuraID = { 208408 }, -- TODO: Confirm
        AuraUnit = 'player',
        AuraMine = true,
    },
    scarlet_inquisitors_expurgation = {
        AuraID = { 248289 },
        AuraUnit = 'player',
        AuraMine = true,
    },
    whisper_of_the_nathrezim = {
        AuraID = { 207633 }, -- TODO: Confirm
        AuraUnit = 'player',
        AuraMine = true,
    },
}

local retribution_tier_overrides = {
    sacred_judgment = { -- T21 4pc
        AuraID = { 253806 },
        AuraUnit = 'player',
        AuraMine = true,
    },
}

local retribution_hooks = {
    hooks = {
        perform_spend = function(spell, env, action, origCostType, origCostAmount)
            if origCostType == 'holy_power' and env.sacred_judgment.aura_up then
                env.sacred_judgment.expirationTime = 0
                return origCostType, mmax(0, origCostAmount - 1)
            end
            return origCostType, origCostAmount
        end,
        can_spend = function(spell, env, action, origCostType, origCostAmount)
            if origCostType == 'holy_power' and env.sacred_judgment.aura_up then
                return origCostType, mmax(0, origCostAmount - 1)
            end
            return origCostType, origCostAmount
        end,
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
        retribution_tier_overrides,
        retribution_hooks,
    },
    config_checkboxes = {
        ashes_to_ashes_selected = false,
        wake_of_ashes_selected = false,
    },
    blacklisted = {},
})

------------------------------------------------------------------------------------------------------------------------
-- Protection profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local protection_abilities_exported = {
    aegis_of_light = { SpellIDs = { 204150 }, TalentID = 23087, },
    ardent_defender = { SpellIDs = { 31850 }, },
    avengers_shield = { SpellIDs = { 31935 }, },
    avenging_wrath = { SpellIDs = { 31884 }, },
    bastion_of_light = { SpellIDs = { 204035 }, TalentID = 22594, },
    blessed_hammer = { SpellIDs = { 204019 }, TalentID = 22430, },
    blessing_of_freedom = { SpellIDs = { 1044 }, },
    blessing_of_protection = { SpellIDs = { 1022 }, },
    blessing_of_sacrifice = { SpellIDs = { 6940 }, },
    blessing_of_spellwarding = { SpellIDs = { 204018 }, TalentID = 22435, },
    blinding_light = { SpellIDs = { 115750 }, TalentID = 21811, },
    cavalier = { TalentID = 22434, },
    cleanse_toxins = { SpellIDs = { 213644 }, },
    consecrated_ground = { TalentID = 22438, },
    consecration = { SpellIDs = { 26573 }, },
    contemplation = { SpellIDs = { 121183 }, },
    crusaders_judgment = { TalentID = 22604, },
    divine_shield = { SpellIDs = { 642 }, },
    divine_steed = { SpellIDs = { 190784 }, },
    final_stand = { TalentID = 21795, },
    first_avenger = { TalentID = 22431, },
    fist_of_justice = { TalentID = 22179, },
    flash_of_light = { SpellIDs = { 19750 }, },
    grand_crusader = { SpellIDs = { 85043 }, },
    guardian_of_ancient_kings = { SpellIDs = { 86659 }, },
    hammer_of_justice = { SpellIDs = { 853 }, },
    hammer_of_the_righteous = { SpellIDs = { 53595 }, },
    hand_of_reckoning = { SpellIDs = { 62124 }, },
    hand_of_the_protector = { SpellIDs = { 213652 }, TalentID = 17601, },
    heart_of_the_crusader = { SpellIDs = { 32223 }, },
    holy_shield = { TalentID = 22428, },
    judgment = { SpellIDs = { 275779 }, },
    judgment_of_light = { TalentID = 22189, },
    last_defender = { TalentID = 21201, },
    lay_on_hands = { SpellIDs = { 633 }, },
    light_of_the_protector = { SpellIDs = { 184092 }, },
    mastery_divine_bulwark = { SpellIDs = { 76671 }, },
    rebuke = { SpellIDs = { 96231 }, },
    redemption = { SpellIDs = { 7328 }, },
    redoubt = { TalentID = 22558, },
    repentance = { SpellIDs = { 20066 }, TalentID = 22180, },
    retribution_aura = { TalentID = 22433, },
    righteous_protector = { TalentID = 21202, },
    seraphim = { SpellIDs = { 152262 }, TalentID = 22645, },
    shield_of_the_righteous = { SpellIDs = { 53600 }, },
    unbreakable_spirit = { TalentID = 22705, },
}

local protection_base_overrides = {
    role = {
        attack = false -- Huh?
    },
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
    avengers_shield = {
        AuraID = { 31935 },
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'avengers_shield',
        AuraApplyLength = 3,
    },
    avenging_wrath = {
        AuraID = { 31884 },
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'avenging_wrath',
        AuraApplyLength = 20,
    },
    blessing_of_protection = {
        AuraID = { 1022 },
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'blessing_of_protection',
        AuraApplyLength = 10,
        PerformCast = function(spell, env)
            env.forbearance.expirationTime = env.currentTime + 30
        end,
        CanCast = function(spell, env)
            return env.forbearance.aura_down and true or false
        end,
    },
    blessing_of_sacrifice = {
        AuraID = { 6940 }, -- TODO: Check this
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'blessing_of_sacrifice',
        AuraApplyLength = 12,
        PerformCast = function(spell, env)
            env.forbearance.expirationTime = env.currentTime + 30
        end,
        CanCast = function(spell, env)
            return env.forbearance.aura_down and true or false
        end,
    },
    consecration = {
        AuraID = { 204242 },
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'consecration',
        AuraApplyLength = 10,
    },
    divine_shield = {
        AuraID = { 642 },
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'divine_shield',
        AuraApplyLength = 8,
        PerformCast = function(spell, env)
            env.forbearance.expirationTime = env.currentTime + 30
        end,
        CanCast = function(spell, env)
            return env.forbearance.aura_down and true or false
        end,
    },
    forbearance = {
        AuraID = { 25771 },
        AuraUnit = 'player',
        AuraMine = true,
    },
    guardian_of_ancient_kings = {
        AuraID = { 86659 },
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'guardian_of_ancient_kings',
        AuraApplyLength = 10,
    },
    hammer_of_justice = {
        AuraID = { 853 },
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'hammer_of_justice',
        AuraApplyLength = 3,
    },
    hand_of_reckoning = {
        AuraID = { 62124 },
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'hand_of_reckoning',
        AuraApplyLength = 3,
    },
    judgment = {
        PerformCast = function(spell, env)
            if env.judgment_of_light.talent_enabled then
                env.judgment_of_light.expirationTime = env.currentTime + 30
                env.judgment_of_light.aura_stack = 40
            end
        end
    },
    judgment_of_light = {
        AuraID = { 196941 },
        AuraUnit = 'target',
        AuraMine = true,
    },
}

local protection_talent_overrides = {
    bastion_of_light = {
        PerformCast = function(spell, env)
            spell.rechargeGained = mmin(3, spell.spell_max_charges-spell.spell_charges)
        end,
    },
    blessed_hammer = {
        AuraID = { 204301 },
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'blessed_hammer',
        AuraApplyLength = 10,
    },
    blinding_light = {
        AuraID = { 105421 },
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'blinding_light',
        AuraApplyLength = 6,
    },
}

local protection_artifact_overrides = {
    eye_of_tyr = {
        AuraID = { 209202 },
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'eye_of_tyr',
        AuraApplyLength = 10,
    }
}

TJ:RegisterPlayerClass({
    name = 'Protection',
    class_id = 2,
    spec_id = 2,
    default_action_profile = 'simc::paladin::protection',
    resources = { 'mana', 'mana_per_time' },
    actions = {
        protection_abilities_exported,
        protection_base_overrides,
        protection_talent_overrides,
        protection_artifact_overrides,
    },
    config_checkboxes = {
    },
    blacklisted = {},
})
