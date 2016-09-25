local _, internal = ...;
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

-- exported with /tj _esd
local blood_abilities_exported = {
    antimagic_barrier = { TalentIDs = { 3, 3 }, },
    antimagic_shell = { AbilityID = 48707, },
    asphyxiate = { AbilityID = 221562, },
    auto_attack = { AbilityID = 6603, },
    blood_boil = { AbilityID = 50842, },
    blood_mirror = { AbilityID = 206977, TalentIDs = { 7, 2 }, },
    blood_tap = { AbilityID = 221699, TalentIDs = { 3, 2 }, },
    blooddrinker = { AbilityID = 206931, TalentIDs = { 1, 3 }, },
    bloodworms = { TalentIDs = { 1, 1 }, },
    bonestorm = { AbilityID = 194844, TalentIDs = { 7, 1 }, },
    consumption = { AbilityID = 205223, },
    control_undead = { AbilityID = 111673, },
    dancing_rune_weapon = { AbilityID = 49028, },
    dark_command = { AbilityID = 56222, },
    death_and_decay = { AbilityID = 43265, },
    death_gate = { AbilityID = 50977, },
    death_grip = { AbilityID = 49576, },
    death_strike = { AbilityID = 49998, },
    deaths_caress = { AbilityID = 195292, },
    foul_bulwark = { TalentIDs = { 6, 3 }, },
    gift_of_the_naaru = { AbilityID = 59545, },
    gorefiends_grasp = { AbilityID = 108199, },
    heart_strike = { AbilityID = 206930, },
    heartbreaker = { TalentIDs = { 1, 2 }, },
    march_of_the_damned = { TalentIDs = { 5, 3 }, },
    mark_of_blood = { AbilityID = 206940, TalentIDs = { 4, 1 }, },
    marrowrend = { AbilityID = 195182, },
    mind_freeze = { AbilityID = 47528, },
    ossuary = { TalentIDs = { 3, 1 }, },
    path_of_frost = { AbilityID = 3714, },
    purgatory = { TalentIDs = { 7, 3 }, },
    raise_ally = { AbilityID = 61999, },
    rapid_decomposition = { TalentIDs = { 2, 1 }, },
    red_thirst = { TalentIDs = { 4, 2 }, },
    rune_tap = { AbilityID = 194679, TalentIDs = { 6, 2 }, },
    runeforging = { AbilityID = 53428, },
    soulgorge = { AbilityID = 212744, TalentIDs = { 2, 2 }, },
    spectral_deflection = { TalentIDs = { 2, 3 }, },
    tightening_grasp = { TalentIDs = { 5, 1 }, },
    tombstone = { AbilityID = 219809, TalentIDs = { 4, 3 }, },
    tremble_before_me = { TalentIDs = { 5, 2 }, },
    vampiric_blood = { AbilityID = 55233, },
    will_of_the_necropolis = { TalentIDs = { 6, 1 }, },
    wraith_walk = { AbilityID = 212552, },
}

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
    heart_strike = {
        PerformCast = function(spell,env)
            env.runic_power.gained = env.runic_power.gained + 5
        end,
    },
}

Z:RegisterPlayerClass({
    name = 'Blood',
    class_id = 6,
    spec_id = 1,
    action_profile = 'dummy::PrePatch::Death_Knight_Blood_PrePatch',
    resources = { 'rune', 'runic_power' },
    actions = {
        blood_abilities_exported,
        blood_base_abilities,
    },
    blacklisted = {},
})

------------------------------------------------------------------------------------------------------------------------
-- Unholy profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local unholy_abilities_exported = {
    all_will_serve = { TalentIDs = { 1, 1 }, },
    antimagic_shell = { AbilityID = 48707, },
    apocalypse = { AbilityID = 220143, },
    army_of_the_dead = { AbilityID = 42650, },
    asphyxiate = { AbilityID = 108194, TalentIDs = { 4, 2 }, },
    auto_attack = { AbilityID = 6603, },
    blighted_rune_weapon = { AbilityID = 194918, TalentIDs = { 2, 3 }, },
    bursting_sores = { TalentIDs = { 1, 2 }, },
    castigator = { TalentIDs = { 3, 2 }, },
    chains_of_ice = { AbilityID = 45524, },
    clawing_shadows = { AbilityID = 207311, TalentIDs = { 3, 3 }, },
    control_undead = { AbilityID = 111673, },
    corpse_shield = { AbilityID = 207319, TalentIDs = { 5, 2 }, },
    dark_arbiter = { AbilityID = 207349, TalentIDs = { 7, 1 }, },
    dark_command = { AbilityID = 56222, },
    dark_transformation = { AbilityID = 63560, },
    death_and_decay = { AbilityID = 43265, },
    death_coil = { AbilityID = 47541, },
    death_gate = { AbilityID = 50977, },
    death_grip = { AbilityID = 49576, },
    death_strike = { AbilityID = 49998, },
    debilitating_infestation = { TalentIDs = { 4, 3 }, },
    defile = { AbilityID = 152280, TalentIDs = { 7, 2 }, },
    ebon_fever = { TalentIDs = { 1, 3 }, },
    epidemic = { AbilityID = 207317, TalentIDs = { 2, 1 }, },
    festering_strike = { AbilityID = 85948, },
    gift_of_the_naaru = { AbilityID = 59545, },
    icebound_fortitude = { AbilityID = 48792, },
    infected_claws = { TalentIDs = { 6, 3 }, },
    lingering_apparition = { TalentIDs = { 5, 3 }, },
    mind_freeze = { AbilityID = 47528, },
    necrosis = { TalentIDs = { 6, 2 }, },
    outbreak = { AbilityID = 77575, },
    path_of_frost = { AbilityID = 3714, },
    pestilent_pustules = { TalentIDs = { 2, 2 }, },
    raise_ally = { AbilityID = 61999, },
    raise_dead = { AbilityID = 46584, },
    runeforging = { AbilityID = 53428, },
    scourge_strike = { AbilityID = 55090, },
    shadow_infusion = { TalentIDs = { 6, 1 }, },
    sludge_belcher = { TalentIDs = { 4, 1 }, },
    soul_reaper = { AbilityID = 130736, TalentIDs = { 7, 3 }, },
    spell_eater = { TalentIDs = { 5, 1 }, },
    summon_gargoyle = { AbilityID = 49206, },
    unholy_frenzy = { TalentIDs = { 3, 1 }, },
    wraith_walk = { AbilityID = 212552, },
}

local unholy_base_abilities = {
    outbreak = {
        AuraApplied = 'virulent_plague',
        AuraApplyLength = 20,
    },
    death_and_decay = {
        AuraID = 188290,
        AuraUnit = 'player',
        AuraMine = true,
    },
    defile = {
        AuraID = 218100,
        AuraUnit = 'player',
        AuraMine = true,
    },
    soul_reaper = {
        AuraID = 130736,
        AuraUnit = 'target',
        AuraMine = true,
    },
    sudden_doom = {
        AuraID = 81340,
        AuraUnit = 'player',
        AuraMine = true,
    },
    festering_strike = {
        AuraApplied = 'festering_wound',
        AuraApplyLength = 24,
        PerformCast = function(spell,env)
            env.runic_power.gained = env.runic_power.gained + 6
            env.festering_wound.aura_stack = env.festering_wound.aura_stack + 2
        end,
    },
    scourge_strike = {
        PerformCast = function(spell,env)
            if env.festering_wound.aura_stack > 0 then
                env.festering_wound.aura_stack = env.festering_wound.aura_stack - 1
            end
            if env.festering_wound.aura_stack == 0 then
                env.festering_wound.expirationTime = 0
            end
        end,
    },
    festering_wound = {
        AuraID = 194310,
        AuraMine = true,
        AuraUnit = "target",
    },
    virulent_plague = {
        AuraID = 191587,
        AuraMine = true,
        AuraUnit = "target",
    },
    dark_transformation = {
        AuraID = 63560,
        AuraMine = true,
        AuraUnit = "pet",
    },
    necrosis = {
        AuraID = 207346,
        AuraMine = true,
        AuraUnit = "player",
    },
    unholy_strength = {
        AuraID = 53368,
        AuraMine = true,
        AuraUnit = "player",
    },
    valkyr_battlemaiden = {
        pet_active = function(spell,env)
            -- active for 15secs after last cast
            local lastCast = env.last_cast_times[207349]
            return lastCast and (env.currentTime < (lastCast + 15)) and true or false
        end,
    },
}

Z:RegisterPlayerClass({
    name = 'Unholy',
    class_id = 6,
    spec_id = 3,
    action_profile = 'legion-dev::Tier19P::Death_Knight_Unholy_T19P',
    resources = { 'rune', 'runic_power' },
    actions = {
        unholy_abilities_exported,
        unholy_base_abilities,
    },
    blacklisted = {},
})
