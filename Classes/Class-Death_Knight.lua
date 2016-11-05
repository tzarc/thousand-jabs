local _, internal = ...;
local Z = internal.Z

------------------------------------------------------------------------------------------------------------------------
-- Blood profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local blood_abilities_exported = {
    antimagic_barrier = { TalentIDs = { 3, 3 }, },
    antimagic_shell = { SpellIDs = { 48707 }, },
    asphyxiate = { SpellIDs = { 221562 }, },
    blood_boil = { SpellIDs = { 50842 }, },
    blood_mirror = { SpellIDs = { 206977 }, TalentIDs = { 7, 2 }, },
    blood_tap = { SpellIDs = { 221699 }, TalentIDs = { 3, 2 }, },
    blooddrinker = { SpellIDs = { 206931 }, TalentIDs = { 1, 3 }, },
    bloodworms = { TalentIDs = { 1, 1 }, },
    bonestorm = { SpellIDs = { 194844 }, TalentIDs = { 7, 1 }, },
    control_undead = { SpellIDs = { 111673 }, },
    dancing_rune_weapon = { SpellIDs = { 49028 }, },
    dark_command = { SpellIDs = { 56222 }, },
    death_and_decay = { SpellIDs = { 43265 }, },
    death_gate = { SpellIDs = { 50977 }, },
    death_grip = { SpellIDs = { 49576 }, },
    death_strike = { SpellIDs = { 49998 }, },
    deaths_caress = { SpellIDs = { 195292 }, },
    foul_bulwark = { TalentIDs = { 6, 3 }, },
    gorefiends_grasp = { SpellIDs = { 108199 }, },
    heart_strike = { SpellIDs = { 206930 }, },
    heartbreaker = { TalentIDs = { 1, 2 }, },
    march_of_the_damned = { TalentIDs = { 5, 3 }, },
    mark_of_blood = { SpellIDs = { 206940 }, TalentIDs = { 4, 1 }, },
    marrowrend = { SpellIDs = { 195182 }, },
    mind_freeze = { SpellIDs = { 47528 }, },
    ossuary = { TalentIDs = { 3, 1 }, },
    path_of_frost = { SpellIDs = { 3714 }, },
    purgatory = { TalentIDs = { 7, 3 }, },
    raise_ally = { SpellIDs = { 61999 }, },
    rapid_decomposition = { TalentIDs = { 2, 1 }, },
    red_thirst = { TalentIDs = { 4, 2 }, },
    rune_tap = { SpellIDs = { 194679 }, TalentIDs = { 6, 2 }, },
    runeforging = { SpellIDs = { 53428 }, },
    soulgorge = { SpellIDs = { 212744 }, TalentIDs = { 2, 2 }, },
    spectral_deflection = { TalentIDs = { 2, 3 }, },
    tightening_grasp = { TalentIDs = { 5, 1 }, },
    tombstone = { SpellIDs = { 219809 }, TalentIDs = { 4, 3 }, },
    tremble_before_me = { TalentIDs = { 5, 2 }, },
    vampiric_blood = { SpellIDs = { 55233 }, },
    will_of_the_necropolis = { TalentIDs = { 6, 1 }, },
    wraith_walk = { SpellIDs = { 212552 }, },
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
    action_profile = 'placeholder::deathknight::blood',
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
    antimagic_shell = { SpellIDs = { 48707 }, },
    apocalypse = { SpellIDs = { 220143 }, },
    army_of_the_dead = { SpellIDs = { 42650 }, },
    asphyxiate = { SpellIDs = { 108194 }, TalentIDs = { 4, 2 }, },
    blighted_rune_weapon = { SpellIDs = { 194918 }, TalentIDs = { 2, 3 }, },
    bursting_sores = { TalentIDs = { 1, 2 }, },
    castigator = { TalentIDs = { 3, 2 }, },
    chains_of_ice = { SpellIDs = { 45524 }, },
    clawing_shadows = { SpellIDs = { 207311 }, TalentIDs = { 3, 3 }, },
    control_undead = { SpellIDs = { 111673 }, },
    corpse_shield = { SpellIDs = { 207319 }, TalentIDs = { 5, 2 }, },
    dark_arbiter = { SpellIDs = { 207349 }, TalentIDs = { 7, 1 }, },
    dark_command = { SpellIDs = { 56222 }, },
    dark_transformation = { SpellIDs = { 63560 }, },
    death_and_decay = { SpellIDs = { 43265 }, },
    death_coil = { SpellIDs = { 47541 }, },
    death_gate = { SpellIDs = { 50977 }, },
    death_grip = { SpellIDs = { 49576 }, },
    death_strike = { SpellIDs = { 49998 }, },
    debilitating_infestation = { TalentIDs = { 4, 3 }, },
    defile = { SpellIDs = { 152280 }, TalentIDs = { 7, 2 }, },
    ebon_fever = { TalentIDs = { 1, 3 }, },
    epidemic = { SpellIDs = { 207317 }, TalentIDs = { 2, 1 }, },
    festering_strike = { SpellIDs = { 85948 }, },
    icebound_fortitude = { SpellIDs = { 48792 }, },
    infected_claws = { TalentIDs = { 6, 3 }, },
    lingering_apparition = { TalentIDs = { 5, 3 }, },
    mind_freeze = { SpellIDs = { 47528 }, },
    necrosis = { TalentIDs = { 6, 2 }, },
    outbreak = { SpellIDs = { 77575 }, },
    path_of_frost = { SpellIDs = { 3714 }, },
    pestilent_pustules = { TalentIDs = { 2, 2 }, },
    raise_ally = { SpellIDs = { 61999 }, },
    raise_dead = { SpellIDs = { 46584 }, },
    runeforging = { SpellIDs = { 53428 }, },
    scourge_strike = { SpellIDs = { 55090 }, },
    shadow_infusion = { TalentIDs = { 6, 1 }, },
    sludge_belcher = { TalentIDs = { 4, 1 }, },
    soul_reaper = { SpellIDs = { 130736 }, TalentIDs = { 7, 3 }, },
    spell_eater = { TalentIDs = { 5, 1 }, },
    summon_gargoyle = { SpellIDs = { 49206 }, },
    unholy_frenzy = { TalentIDs = { 3, 1 }, },
    wraith_walk = { SpellIDs = { 212552 }, },
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
    action_profile = 'legion-dev::deathknight::unholy',
    resources = { 'rune', 'runic_power' },
    actions = {
        unholy_abilities_exported,
        unholy_base_abilities,
    },
    blacklisted = {},
})
