local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Config = TJ:GetModule('Config')

------------------------------------------------------------------------------------------------------------------------
-- Arms profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local arms_abilities_exported = {
    anger_management = { TalentIDs = { 7, 1 }, },
    avatar = { SpellIDs = { 107574 }, TalentIDs = { 3, 3 }, },
    battle_cry = { SpellIDs = { 1719 }, },
    berserker_rage = { SpellIDs = { 18499 }, },
    bladestorm = { SpellIDs = { 227847 }, },
    bounding_stride = { TalentIDs = { 4, 2 }, },
    charge = { SpellIDs = { 100 }, },
    cleave = { SpellIDs = { 845 }, },
    colossus_smash = { SpellIDs = { 167105 }, },
    commanding_shout = { SpellIDs = { 97462 }, },
    dauntless = { TalentIDs = { 1, 1 }, },
    deadly_calm = { TalentIDs = { 6, 1 }, },
    defensive_stance = { SpellIDs = { 197690 }, TalentIDs = { 4, 3 }, },
    die_by_the_sword = { SpellIDs = { 118038 }, },
    double_time = { TalentIDs = { 2, 3 }, },
    execute = { SpellIDs = { 163201 }, },
    fervor_of_battle = { TalentIDs = { 3, 1 }, },
    focused_rage = { SpellIDs = { 207982 }, TalentIDs = { 5, 3 }, },
    hamstring = { SpellIDs = { 1715 }, },
    heroic_leap = { SpellIDs = { 6544 }, },
    heroic_throw = { SpellIDs = { 57755 }, },
    in_for_the_kill = { TalentIDs = { 5, 1 }, },
    intimidating_shout = { SpellIDs = { 5246 }, },
    mortal_combo = { TalentIDs = { 5, 2 }, },
    mortal_strike = { SpellIDs = { 12294 }, },
    opportunity_strikes = { TalentIDs = { 7, 2 }, },
    overpower = { SpellIDs = { 7384 }, TalentIDs = { 1, 2 }, },
    pummel = { SpellIDs = { 6552 }, },
    ravager = { SpellIDs = { 152277 }, TalentIDs = { 7, 3 }, },
    rend = { SpellIDs = { 772 }, TalentIDs = { 3, 2 }, },
    second_wind = { TalentIDs = { 4, 1 }, },
    shockwave = { SpellIDs = { 46968 }, TalentIDs = { 2, 1 }, },
    slam = { SpellIDs = { 1464 }, },
    storm_bolt = { SpellIDs = { 107570 }, TalentIDs = { 2, 2 }, },
    sweeping_strikes = { TalentIDs = { 1, 3 }, },
    taunt = { SpellIDs = { 355 }, },
    titanic_might = { TalentIDs = { 6, 3 }, },
    trauma = { TalentIDs = { 6, 2 }, },
    victory_rush = { SpellIDs = { 34428 }, },
    warbreaker = { SpellIDs = { 209577 }, },
    whirlwind = { SpellIDs = { 1680 }, },
}

local arms_base_overrides = {
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
    mortal_strike = {
        PerformCast = function(spell,env)
            if env.health.target_percent < 20 then
                env.rage.gained = env.rage.gained + 20
            end
        end,
    },
    colossus_smash = {
        AuraID = 208086,
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'colossus_smash',
        AuraApplyLength = 15,
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
    warbreaker = {
        AuraApplied = 'colossus_smash',
        AuraApplyLength = 15,
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

TJ:RegisterPlayerClass({
    name = 'Arms',
    class_id = 1,
    spec_id = 1,
    action_profile = 'legion-dev::warrior::arms',
    resources = { 'rage' },
    actions = {
        arms_abilities_exported,
        arms_base_overrides,
    },
    blacklisted = {},
})

------------------------------------------------------------------------------------------------------------------------
-- Protection profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local protection_abilities_exported = {
    anger_management = { TalentIDs = { 7, 1 }, },
    auto_attack = { SpellIDs = { 6603 }, },
    avatar = { SpellIDs = { 107574 }, TalentIDs = { 3, 3 }, },
    battle_cry = { SpellIDs = { 1719 }, },
    berserker_rage = { SpellIDs = { 18499 }, },
    best_served_cold = { TalentIDs = { 5, 1 }, },
    booming_voice = { TalentIDs = { 6, 3 }, },
    bounding_stride = { TalentIDs = { 4, 2 }, },
    crackling_thunder = { TalentIDs = { 4, 3 }, },
    demoralizing_shout = { SpellIDs = { 1160 }, },
    devastate = { SpellIDs = { 20243 }, },
    focused_rage = { SpellIDs = { 204488 }, },
    heavy_repercussions = { TalentIDs = { 7, 2 }, },
    heroic_leap = { SpellIDs = { 6544 }, },
    heroic_throw = { SpellIDs = { 57755 }, },
    ignore_pain = { SpellIDs = { 190456 }, },
    impending_victory = { SpellIDs = { 202168 }, TalentIDs = { 2, 1 }, },
    indomitable = { TalentIDs = { 5, 3 }, },
    inspiring_presence = { TalentIDs = { 2, 2 }, },
    intercept = { SpellIDs = { 198304 }, },
    into_the_fray = { TalentIDs = { 6, 2 }, },
    last_stand = { SpellIDs = { 12975 }, },
    neltharions_fury = { SpellIDs = { 203524 }, },
    never_surrender = { TalentIDs = { 5, 2 }, },
    pummel = { SpellIDs = { 6552 }, },
    quaking_palm = { SpellIDs = { 107079 }, },
    ravager = { SpellIDs = { 228920 }, TalentIDs = { 7, 3 }, },
    renewed_fury = { TalentIDs = { 3, 1 }, },
    revenge = { SpellIDs = { 6572 }, },
    safeguard = { TalentIDs = { 2, 3 }, },
    shield_block = { SpellIDs = { 2565 }, },
    shield_slam = { SpellIDs = { 23922 }, },
    shield_wall = { SpellIDs = { 871 }, },
    shockwave = { SpellIDs = { 46968 }, TalentIDs = { 1, 1 }, },
    spell_reflection = { SpellIDs = { 23920 }, },
    storm_bolt = { SpellIDs = { 107570 }, TalentIDs = { 1, 2 }, },
    taunt = { SpellIDs = { 355 }, },
    thunder_clap = { SpellIDs = { 6343 }, },
    ultimatum = { TalentIDs = { 3, 2 }, },
    vengeance = { TalentIDs = { 6, 1 }, },
    victory_rush = { SpellIDs = { 34428 }, },
    warbringer = { TalentIDs = { 1, 3 }, },
    warlords_challenge = { TalentIDs = { 4, 1 }, },
}

local protection_overrides = {
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
            env.rage.gained = env.rage.gained + 10
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
            env.rage.gained = env.rage.gained + 50
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
}


TJ:RegisterPlayerClass({
    betaProfile = true,
    name = 'Protection',
    class_id = 1,
    spec_id = 3,
    action_profile = 'legion-dev::warrior::protection',
    resources = { 'rage' },
    actions = {
        protection_abilities_exported,
        protection_overrides,
    },
    blacklisted = {},
    config_checkboxes = {},
    conditional_substitutions = {}
})
