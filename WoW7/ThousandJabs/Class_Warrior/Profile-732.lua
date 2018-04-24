--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Legion only.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(4, GetBuildInfo()) >= 80000 then
    return
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(2, UnitClass('player')) ~= 'WARRIOR' then return end

local addonName, internal = ...
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Config = TJ:GetModule('Config')

if not Core:MatchesBuild('7.3.2', '7.3.9') then return end

local mmax = math.max
local mmin = math.min

------------------------------------------------------------------------------------------------------------------------
-- Arms profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local arms_abilities_exported = {
    anger_management = { TalentID = 21204, },
    avatar = { SpellIDs = { 107574 }, TalentID = 19138, },
    battle_cry = { SpellIDs = { 1719 }, },
    berserker_rage = { SpellIDs = { 18499 }, },
    bladestorm = { SpellIDs = { 227847 }, },
    bounding_stride = { TalentID = 22627, },
    charge = { SpellIDs = { 100 }, },
    cleave = { SpellIDs = { 845 }, },
    colossus_smash = { SpellIDs = { 167105 }, },
    commanding_shout = { SpellIDs = { 97462 }, },
    dauntless = { TalentID = 22624, },
    deadly_calm = { TalentID = 22394, },
    defensive_stance = { SpellIDs = { 197690 }, TalentID = 22628, },
    die_by_the_sword = { SpellIDs = { 118038 }, },
    double_time = { TalentID = 22409, },
    execute = { SpellIDs = { 163201 }, },
    fervor_of_battle = { TalentID = 22383, },
    focused_rage = { SpellIDs = { 207982 }, TalentID = 22399, },
    hamstring = { SpellIDs = { 1715 }, },
    heroic_leap = { SpellIDs = { 6544 }, },
    heroic_throw = { SpellIDs = { 57755 }, },
    in_for_the_kill = { TalentID = 22397, },
    intimidating_shout = { SpellIDs = { 5246 }, },
    mastery_colossal_might = { SpellIDs = { 76838 }, },
    mortal_combo = { TalentID = 22393, },
    mortal_strike = { SpellIDs = { 12294 }, },
    opportunity_strikes = { TalentID = 22407, },
    overpower = { SpellIDs = { 7384 }, TalentID = 22360, },
    pummel = { SpellIDs = { 6552 }, },
    ravager = { SpellIDs = { 152277 }, TalentID = 21667, },
    rend = { SpellIDs = { 772 }, TalentID = 22489, },
    second_wind = { TalentID = 15757, },
    shockwave = { SpellIDs = { 46968 }, TalentID = 22373, },
    slam = { SpellIDs = { 1464 }, },
    storm_bolt = { SpellIDs = { 107570 }, TalentID = 22625, },
    sweeping_strikes = { TalentID = 22371, },
    tactician = { SpellIDs = { 184783 }, },
    taunt = { SpellIDs = { 355 }, },
    titanic_might = { TalentID = 22800, },
    trauma = { TalentID = 22380, },
    victory_rush = { SpellIDs = { 34428 }, },
    warbreaker = { SpellIDs = { 209577 }, },
    whirlwind = { SpellIDs = { 1680 }, },
}

local arms_base_overrides = {
    pummel = {
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
    charge = {
        CanCast = function(spell,env)
            return (12 <= env.movement.distance and env.movement.distance <= 25) -- tooltip says 8, but in-game range is 12... does tooltip mean range-to-max-melee?
        end,
        PerformCast = function(spell,env)
            env.rage.gained = env.rage.gained + 20
            env.movement.distance = 5 -- melee
        end,
    },
    heroic_leap = {
        CanCast = function(spell,env)
            return not env.melee.in_range
        end,
        PerformCast = function(spell,env)
            env.movement.distance = 5 -- melee
        end,
    },
    execute = {
        cost_type = 'rage',
        rage_min = 10,
        rage_max = 40,
        rage_cost = function(spell, env)
            return mmin(spell.rage_max, mmax(spell.rage_min, env.rage.curr))
        end,
        CanCast = function(spell,env)
            return env.health.target_percent < 20
        end,
    },
    mortal_strike = {
        PerformCast = function(spell,env)
            if env.health.target_percent < 20 and env.in_for_the_kill.talent_enabled then
                env.rage.gained = env.rage.gained + 30
            end
        end,
    },
    colossus_smash = {
        AuraID = 208086,
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'colossus_smash',
        AuraApplyLength = 8,
    },
    battle_cry = {
        AuraID = 1719,
        AuraUnit = 'player',
        AuraMine = true,
    },
    cleave = {
        AuraID = 188923,
        AuraUnit = 'player',
        AuraMine = true,
    },
    shattered_defenses = {
        AuraID = 209706,
        AuraUnit = 'player',
        AuraMine = true,
    },
    precise_strikes = {
        AuraID = 209492,
        AuraUnit = 'player',
        AuraMine = true,
    },
    focused_rage = {
        AuraID = 207982,
        AuraUnit = 'player',
        AuraMine = true,
        spell_cast_time = 0.01, -- off GCD!
    },
    stone_heart = {
        AuraID = 225947,
        AuraUnit = 'player',
        AuraMine = true,
    },
    battle_cry_deadly_calm = {
        AuraID = 227266,
        AuraUnit = 'player',
        AuraMine = true,
    },
    rend = {
        AuraID = 772,
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'rend',
        AuraApplyLength = 15,
        aura_duration = 15,
        spell_remains = function(spell, env) return spell.AuraApplyLength - spell.time_since_last_cast end, -- TODO: Is this how long the DoT has to go?
    },
    overpower = {
        AuraID = 60503,
        AuraUnit = 'player',
        AuraMine = true,
        CanCast = function(spell,env)
            return spell.aura_remains > 0 and true or false
        end,
        PerformCast = function(spell,env)
            spell.expirationTime = 0
        end,
    },
}

local arms_artifact = {
    warbreaker = {
        AuraApplied = 'colossus_smash',
        AuraApplyLength = 15,
    },
    executioners_precision = {
        AuraID = { 238147, 242188 },
        AuraUnit = 'player',
        AuraMine = true,
    },
}

local arms_legendaries = {
    corrupted_blood_of_zakajz = {
        AuraID = { 209566, 209567, 209569 },
        AuraUnit = 'player',
        AuraMine = true,
    }
}

local arms_tier = {
    weighted_blade = {
        AuraID = { 251879, 253383 },
        AuraUnit = 'player',
        AuraMine = true,
    },
}

TJ:RegisterPlayerClass({
    name = 'Arms',
    class_id = 1,
    spec_id = 1,
    default_action_profile = 'simc::warrior::arms',
    resources = { 'rage' },
    actions = {
        arms_abilities_exported,
        arms_base_overrides,
        arms_legendaries,
        arms_artifact,
        arms_tier,
    },
    blacklisted = {},
})

------------------------------------------------------------------------------------------------------------------------
-- Fury profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local fury_abilities_exported = {
    avatar = { SpellIDs = { 107574 }, TalentID = 19138, },
    battle_cry = { SpellIDs = { 1719 }, },
    berserker_rage = { SpellIDs = { 18499 }, },
    bladestorm = { SpellIDs = { 46924 }, TalentID = 22405, },
    bloodbath = { SpellIDs = { 12292 }, TalentID = 22395, },
    bloodthirst = { SpellIDs = { 23881 }, },
    bounding_stride = { TalentID = 22627, },
    carnage = { TalentID = 19140, },
    charge = { SpellIDs = { 100 }, },
    commanding_shout = { SpellIDs = { 97462 }, },
    double_time = { TalentID = 22409, },
    dragon_roar = { SpellIDs = { 118000 }, TalentID = 16037, },
    endless_rage = { TalentID = 22633, },
    enrage = { SpellIDs = { 184361 }, },
    enraged_regeneration = { SpellIDs = { 184364 }, },
    execute = { SpellIDs = { 5308 }, },
    frenzy = { TalentID = 22544, },
    fresh_meat = { TalentID = 22491, },
    frothing_berserker = { TalentID = 22391, },
    furious_charge = { TalentID = 22635, },
    furious_slash = { SpellIDs = { 100130 }, },
    heroic_leap = { SpellIDs = { 6544 }, },
    heroic_throw = { SpellIDs = { 57755 }, },
    inner_rage = { TalentID = 22400, },
    intimidating_shout = { SpellIDs = { 5246 }, },
    massacre = { TalentID = 22384, },
    mastery_unshackled_fury = { SpellIDs = { 76856 }, },
    odyns_fury = { SpellIDs = { 205545 }, },
    outburst = { TalentID = 22381, },
    piercing_howl = { SpellIDs = { 12323 }, },
    pummel = { SpellIDs = { 6552 }, },
    raging_blow = { SpellIDs = { 85288 }, },
    rampage = { SpellIDs = { 184367 }, },
    reckless_abandon = { TalentID = 22402, },
    shockwave = { SpellIDs = { 46968 }, TalentID = 22374, },
    storm_bolt = { SpellIDs = { 107570 }, TalentID = 22372, },
    taunt = { SpellIDs = { 355 }, },
    titans_grip = { SpellIDs = { 46917 }, },
    war_machine = { TalentID = 22632, },
    warpaint = { TalentID = 22382, },
    whirlwind = { SpellIDs = { 190411 }, },
    wrecking_ball = { TalentID = 22379, },
}

local fury_base_overrides = {
    pummel = {
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
    charge = {
        CanCast = function(spell,env)
            return (12 <= env.movement.distance and env.movement.distance <= 25) -- tooltip says 8, but in-game range is 12... does tooltip mean range-to-max-melee?
        end,
        PerformCast = function(spell,env)
            env.rage.gained = env.rage.gained + 20
            env.movement.distance = 5 -- melee
        end,
    },
    heroic_leap = {
        CanCast = function(spell,env)
            return not env.melee.in_range
        end,
        PerformCast = function(spell,env)
            env.movement.distance = 5 -- melee
        end,
    },
    execute = {
        CanCast = function(spell,env)
            return env.health.target_percent < 20
        end,
    },
    battle_cry = {
        AuraID = 1719,
        AuraUnit = 'player',
        AuraMine = true,
        PerformCast = function(spell,env)
            env.rage.gained = env.rage.gained + 100
        end,
    },
    bloodthirst = {
        PerformCast = function(spell,env)
            env.rage.gained = env.rage.gained + 10
        end,
    },
    raging_blow = {
        PerformCast = function(spell,env)
            env.rage.gained = env.rage.gained + 5
        end,
    },
    enrage = {
        AuraID = 184361,
        AuraUnit = 'player',
        AuraMine = true,
    },
    frothing_berserker = {
        AuraID = 215571,
        AuraUnit = 'player',
        AuraMine = true,
    },
    meat_cleaver = {
        AuraID = 85739,
        AuraUnit = 'player',
        AuraMine = true,
    },
    draught_of_souls = {
        AuraID = 225141,
        AuraUnit = 'player',
        AuraMine = true,
    },
    massacre = {
        AuraID = 206315,
        AuraUnit = 'player',
        AuraMine = true,
    },
}

local fury_artifact = {
    odyns_fury = {
        AuraID = { 205546, 205547 },
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'odyns_fury',
        AuraApplyLength = 4,
    },
    juggernaut = {
        AuraID = { 201009 },
        AuraUnit = 'player',
        AuraMine = true,
        artifact_enabled = function(spell,env) return Config:GetSpec("juggernaut_selected") end,
    },
}

local fury_legendaries = {
    corrupted_blood_of_zakajz = {
        AuraID = { 209566, 209567, 209569 },
        AuraUnit = 'player',
        AuraMine = true,
    },
    fujiedas_fury = {
        AuraID = { 207775 },
        AuraUnit = 'player',
        AuraMine = true,
    },
    stone_heart = {
        AuraID = { 207767 },
        AuraUnit = 'player',
        AuraMine = true,
    },
}

TJ:RegisterPlayerClass({
    name = 'Fury',
    class_id = 1,
    spec_id = 2,
    default_action_profile = 'simc::warrior::fury',
    resources = { 'rage' },
    actions = {
        fury_abilities_exported,
        fury_base_overrides,
        fury_legendaries,
        fury_artifact,
    },
    config_checkboxes = {
        juggernaut_selected = false,
    },
    blacklisted = {},
})

------------------------------------------------------------------------------------------------------------------------
-- Protection profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local protection_abilities_exported = {
    anger_management = { TalentID = 21204, },
    avatar = { SpellIDs = { 107574 }, TalentID = 19138, },
    battle_cry = { SpellIDs = { 1719 }, },
    berserker_rage = { SpellIDs = { 18499 }, },
    best_served_cold = { TalentID = 22626, },
    booming_voice = { TalentID = 22401, },
    bounding_stride = { TalentID = 22627, },
    crackling_thunder = { TalentID = 22488, },
    deep_wounds = { SpellIDs = { 115768 }, },
    demoralizing_shout = { SpellIDs = { 1160 }, },
    devastate = { SpellIDs = { 20243 }, },
    devastator = { SpellIDs = { 236279 }, TalentID = 22392, },
    heavy_repercussions = { TalentID = 22406, },
    heroic_leap = { SpellIDs = { 6544 }, },
    heroic_throw = { SpellIDs = { 57755 }, },
    ignore_pain = { SpellIDs = { 190456 }, },
    impending_victory = { SpellIDs = { 202168 }, TalentID = 19676, },
    indomitable = { TalentID = 22362, },
    inspiring_presence = { TalentID = 22629, },
    intercept = { SpellIDs = { 198304 }, },
    into_the_fray = { TalentID = 22398, },
    last_stand = { SpellIDs = { 12975 }, },
    mastery_critical_block = { SpellIDs = { 76857 }, },
    neltharions_fury = { SpellIDs = { 203524 }, },
    never_surrender = { TalentID = 22631, },
    pummel = { SpellIDs = { 6552 }, },
    ravager = { SpellIDs = { 228920 }, TalentID = 22801, },
    renewed_fury = { TalentID = 22378, },
    revenge = { SpellIDs = { 6572 }, },
    safeguard = { TalentID = 22789, },
    shield_block = { SpellIDs = { 2565 }, },
    shield_slam = { SpellIDs = { 23922 }, },
    shield_wall = { SpellIDs = { 871 }, },
    shockwave = { SpellIDs = { 46968 }, TalentID = 15760, },
    spell_reflection = { SpellIDs = { 23920 }, },
    storm_bolt = { SpellIDs = { 107570 }, TalentID = 15759, },
    taunt = { SpellIDs = { 355 }, },
    thunder_clap = { SpellIDs = { 6343 }, },
    vengeance = { TalentID = 22396, },
    victory_rush = { SpellIDs = { 34428 }, },
    warbringer = { TalentID = 15774, },
    warlords_challenge = { TalentID = 22630, },
}

local protection_overrides = {
    pummel = {
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
    avatar = {
        AuraID = { 107574 },
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'avatar',
        AuraApplyLength = 20,
    },
    intercept = {
        CanCast = function(spell,env)
            return (12 <= env.movement.distance and env.movement.distance <= 25) -- tooltip says 8, but in-game range is 12... does tooltip mean range-to-max-melee?
        end,
        PerformCast = function(spell,env)
            env.rage.gained = env.rage.gained + 15
            env.movement.distance = 5 -- melee
        end,
    },
    battle_cry = {
        AuraID = { 1719 },
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'battle_cry',
        AuraApplyLength = 5,
    },
    berserker_rage = {
        AuraID = { 18499 },
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'berserker_rage',
        AuraApplyLength = 6,
    },
    demoralizing_shout = {
        AuraID = { 1160 },
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'demoralizing_shout',
        AuraApplyLength = 8,
        PerformCast = function(spell, env)
            if env.booming_voice.talent_enabled then
                env.rage.gained = env.rage.gained + 60
            end
        end,
    },
    heroic_leap = {
        CanCast = function(spell,env)
            return not env.melee.in_range
        end,
        PerformCast = function(spell,env)
            env.movement.distance = 5 -- melee
        end,
    },
    ignore_pain = {
        AuraID = { 190456 },
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'ignore_pain',
        AuraApplyLength = 5,
        CanCast = function(spell, env)
            return (env.rage.curr >= 20) and true or false
        end,
        PerformCast = function(spell, env)
            local currRage = env.rage.curr
            local spent = math.min(60, currRage)
            env.rage.spent = env.rage.spent + spent
        end,
    },
    last_stand = {
        AuraID = { 12975 },
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'last_stand',
        AuraApplyLength = 15,
    },
    neltharions_fury = {
        AuraID = { 203526 },
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'ignore_pain',
        AuraApplyLength = 5,
    },
    ravager = {
        AuraID = { 227744 },
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'ravager',
        AuraApplyLength = 12,
    },
    revenge = {
        PerformCast = function(spell,env)
            env.rage.gained = env.rage.gained + 5
        end,
    },
    shield_block = {
        AuraID = { 132404 },
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'shield_block',
        AuraApplyLength = 6,
    },
    shield_slam = {
        PerformCast = function(spell,env)
            env.rage.gained = env.rage.gained + 20
        end,
    },
    shield_wall = {
        AuraID = { 871 },
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'shield_wall',
        AuraApplyLength = 8,
    },
    spell_reflection = {
        AuraID = { 23920 },
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'spell_reflection',
        AuraApplyLength = 5,
    },
    thunder_clap = {
        AuraID = { 6343 },
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'thunder_clap',
        AuraApplyLength = 10,
    },
    ultimatum = {
        AuraID = { 122510 },
        AuraUnit = 'player',
        AuraMine = true,
    },
    vengeance_focused_rage = {
        AuraID = { 202573 },
        AuraUnit = 'player',
        AuraMine = true,
    },
    vengeance_ignore_pain = {
        AuraID = { 202574 },
        AuraUnit = 'player',
        AuraMine = true,
    },
    vengeance_revenge = {
        AuraID = { 202573 },
        AuraUnit = 'player',
        AuraMine = true,
    },
}


TJ:RegisterPlayerClass({
    name = 'Protection',
    class_id = 1,
    spec_id = 3,
    default_action_profile = 'simc::warrior::protection',
    resources = { 'rage' },
    actions = {
        protection_abilities_exported,
        protection_overrides,
    },
    blacklisted = {},
    config_checkboxes = {},
    conditional_substitutions_post = {}
})
