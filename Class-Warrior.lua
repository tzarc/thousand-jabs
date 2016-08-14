local addonName, internal = ...;
local Z = internal.Z

------------------------------------------------------------------------------------------------------------------------
-- Arms profile definition
------------------------------------------------------------------------------------------------------------------------

local arms_base_overrides = {
    heroic_charge = {
        CanCast = function(spell,env)
            return env.charge.spell_can_cast and env.heroic_leap.spell_can_cast
        end,
    },
    charge = {
        CanCast = function(spell,env)
            local r = IsSpellInRange(spell.SpellBookItem, BOOKTYPE_SPELL, "target")
            return r and r == 1 and true or false
        end,
        PerformCast = function(spell,env)
            env.rage.gained = env.rage.gained + 20
        end
    },
    heroic_leap = {
        CanCast = function(spell,env)
            local r = IsSpellInRange(spell.SpellBookItem, BOOKTYPE_SPELL, "target")
            return r and r == 1 and true or false
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
        arms_base_overrides,
    },
    blacklisted = {},
})