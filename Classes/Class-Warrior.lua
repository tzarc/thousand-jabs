local _, internal = ...;
local Z = internal.Z

------------------------------------------------------------------------------------------------------------------------
-- Arms profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local arms_abilities_exported = {
    anger_management = { TalentIDs = { 7, 1 }, },
    auto_attack = { AbilityID = 6603, },
    avatar = { AbilityID = 107574, TalentIDs = { 3, 3 }, },
    battle_cry = { AbilityID = 1719, },
    berserker_rage = { AbilityID = 18499, },
    bladestorm = { AbilityID = 227847, },
    bounding_stride = { TalentIDs = { 4, 2 }, },
    charge = { AbilityID = 100, },
    cleave = { AbilityID = 845, },
    colossus_smash = { AbilityID = 167105, },
    commanding_shout = { AbilityID = 97462, },
    dauntless = { TalentIDs = { 1, 1 }, },
    deadly_calm = { TalentIDs = { 6, 1 }, },
    defensive_stance = { AbilityID = 197690, TalentIDs = { 4, 3 }, },
    die_by_the_sword = { AbilityID = 118038, },
    double_time = { TalentIDs = { 2, 3 }, },
    execute = { AbilityID = 163201, },
    fervor_of_battle = { TalentIDs = { 3, 1 }, },
    focused_rage = { AbilityID = 207982, TalentIDs = { 5, 3 }, },
    hamstring = { AbilityID = 1715, },
    heroic_leap = { AbilityID = 6544, },
    heroic_throw = { AbilityID = 57755, },
    in_for_the_kill = { TalentIDs = { 5, 1 }, },
    intimidating_shout = { AbilityID = 5246, },
    mortal_combo = { TalentIDs = { 5, 2 }, },
    mortal_strike = { AbilityID = 12294, },
    opportunity_strikes = { TalentIDs = { 7, 2 }, },
    overpower = { AbilityID = 7384, TalentIDs = { 1, 2 }, },
    pack_hobgoblin = { AbilityID = 69046, },
    pummel = { AbilityID = 6552, },
    ravager = { AbilityID = 152277, TalentIDs = { 7, 3 }, },
    rend = { AbilityID = 772, TalentIDs = { 3, 2 }, },
    rocket_barrage = { AbilityID = 69041, },
    rocket_jump = { AbilityID = 69070, },
    second_wind = { TalentIDs = { 4, 1 }, },
    shockwave = { AbilityID = 46968, TalentIDs = { 2, 1 }, },
    slam = { AbilityID = 1464, },
    storm_bolt = { AbilityID = 107570, TalentIDs = { 2, 2 }, },
    sweeping_strikes = { TalentIDs = { 1, 3 }, },
    taunt = { AbilityID = 355, },
    titanic_might = { TalentIDs = { 6, 3 }, },
    trauma = { TalentIDs = { 6, 2 }, },
    victory_rush = { AbilityID = 34428, },
    warbreaker = { AbilityID = 209577, },
    whirlwind = { AbilityID = 1680, },
}

local arms_base_overrides = {
    heroic_charge = {
        CanCast = function(spell,env)
            return env.charge.spell_can_cast and env.heroic_leap.spell_can_cast
        end,
    },
    charge = {
        CanCast = function(spell,env)
            return spell.in_range
        end,
        PerformCast = function(spell,env)
            env.rage.gained = env.rage.gained + 20
        end
    },
    heroic_leap = {
        CanCast = function(spell,env)
            return spell.in_range
        end
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
}

Z:RegisterPlayerClass({
    name = 'Arms',
    class_id = 1,
    spec_id = 1,
    action_profile = 'legion-dev::Tier19P::Warrior_Arms_T19P',
    resources = { 'rage' },
    actions = {
        arms_abilities_exported,
        arms_base_overrides,
    },
    blacklisted = {},
})