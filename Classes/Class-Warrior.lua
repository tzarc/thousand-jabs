local _, internal = ...;
local Z = internal.Z

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
        spell_duration = 15,
        spell_remains = function(spell, env) return spell.spell_duration - spell.time_since_last_cast end, -- TODO: Is this how long the DoT has to go?
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

Z:RegisterPlayerClass({
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
