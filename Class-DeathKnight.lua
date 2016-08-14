local addonName, internal = ...;
local Z = internal.Z

------------------------------------------------------------------------------------------------------------------------
-- Blood profile definition
------------------------------------------------------------------------------------------------------------------------

internal.apls["dummy::PrePatch::Death_Knight_Blood_PrePatch"] = [[
actions=auto_attack

actions+=/call_action_list,name=st,if=active_enemies=1
actions+=/call_action_list,name=cleave,if=active_enemies=2
actions+=/call_action_list,name=aoe,if=active_enemies>=3

actions.st=blood_boil,if=debuff.blood_plague.down
actions.st+=/death_strike,if=runic_power>95
actions.st+=/death_and_decay,if=buff.crimson_scourge.up
actions.st+=/marrowrend,if=buff.bone_shield.stack<5
actions.st+=/death_strike,if=runic_power>80
actions.st+=/death_strike,if=incoming_damage_3s>health.max*0.25
actions.st+=/blood_boil,if=buff.bone_shield.stack<5
actions.st+=/death_and_decay
actions.st+=/heart_strike

actions.cleave=blood_boil,if=debuff.blood_plague.down
actions.cleave+=/death_strike,if=runic_power>95
actions.cleave+=/death_and_decay,if=buff.crimson_scourge.up
actions.cleave+=/marrowrend,if=buff.bone_shield.stack<5
actions.cleave+=/blood_boil,if=buff.bone_shield.stack<5
actions.cleave+=/death_strike,if=runic_power>80
actions.cleave+=/death_strike,if=incoming_damage_3s>health.max*0.25
actions.cleave+=/death_and_decay
actions.cleave+=/heart_strike

actions.aoe=blood_boil,if=debuff.blood_plague.down
actions.aoe+=/death_strike,if=runic_power>95
actions.aoe+=/death_and_decay,if=buff.crimson_scourge.up
actions.aoe+=/marrowrend,if=buff.bone_shield.stack<1
actions.aoe+=/blood_boil,if=buff.bone_shield.stack<1
actions.aoe+=/death_strike,if=runic_power>80
actions.aoe+=/death_strike,if=incoming_damage_3s>health.max*0.25
actions.aoe+=/death_and_decay
actions.aoe+=/heart_strike
]]

local blood_base_abilities = {
    blood_boil = {
        AuraApplied = 'blood_plague',
        AuraApplyLength = 24,
    },
    blood_plague = {
        AuraID = 55078,
        AuraMine = true,
        AuraUnit = "target",
    },
    crimson_scourge = {
        AuraID = 81141,
        AuraMine = true,
        AuraUnit = "target",
    },
    bone_shield = {
        AuraID = 195181,
        AuraMine = true,
        AuraUnit = "player",
    },
    marrowrend = {
        PerformCast = function(spell,env)
            env.bone_shield.aura_stack = env.bone_shield.aura_stack + 3
        end,
    },
}

--[[
Z:RegisterPlayerClass({
    name = 'Blood',
    class_id = 6,
    spec_id = 1,
    action_profile = 'dummy::PrePatch::Death_Knight_Blood_PrePatch',
    gcd_ability = 'death_strike',
    resources = { 'rune', 'runic_power' },
    actions = {
        blood_base_abilities,
    },
    blacklisted = {},
})
]]