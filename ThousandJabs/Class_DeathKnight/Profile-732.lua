if select(2, UnitClass('player')) ~= 'DEATHKNIGHT' then return end

local addonName, internal = ...
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Config = TJ:GetModule('Config')

if not Core:MatchesBuild('7.3.2', '7.3.2') then return end

------------------------------------------------------------------------------------------------------------------------
-- Blood profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local blood_abilities_exported = {
    antimagic_barrier = { TalentID = 22135, },
    antimagic_shell = { SpellIDs = { 48707 }, },
    asphyxiate = { SpellIDs = { 221562 }, },
    blood_boil = { SpellIDs = { 50842 }, },
    blood_mirror = { SpellIDs = { 206977 }, TalentID = 21208, },
    blood_tap = { SpellIDs = { 221699 }, TalentID = 22134, },
    blooddrinker = { SpellIDs = { 206931 }, TalentID = 19217, },
    bloodworms = { TalentID = 19165, },
    bonestorm = { SpellIDs = { 194844 }, TalentID = 21207, },
    control_undead = { SpellIDs = { 111673 }, },
    consumption = { SpellIDs = { 205223 }, },
    crimson_scourge = { SpellIDs = { 81136 }, },
    dancing_rune_weapon = { SpellIDs = { 49028 }, },
    dark_command = { SpellIDs = { 56222 }, },
    death_and_decay = { SpellIDs = { 43265 }, },
    death_gate = { SpellIDs = { 50977 }, },
    death_grip = { SpellIDs = { 49576 }, },
    death_strike = { SpellIDs = { 49998 }, },
    deaths_caress = { SpellIDs = { 195292 }, },
    foul_bulwark = { TalentID = 19232, },
    gorefiends_grasp = { SpellIDs = { 108199 }, },
    heart_of_ice = { TalentID = 19219, },
    heart_strike = { SpellIDs = { 206930 }, },
    heartbreaker = { TalentID = 19166, },
    icebound_fortitude = { SpellIDs = { 48792 }, },
    march_of_the_damned = { TalentID = 19228, },
    mark_of_blood = { SpellIDs = { 206940 }, TalentID = 22013, },
    marrowrend = { SpellIDs = { 195182 }, },
    mastery_blood_shield = { SpellIDs = { 77513 }, },
    mind_freeze = { SpellIDs = { 47528 }, },
    on_a_pale_horse = { SpellIDs = { 51986 }, },
    ossuary = { TalentID = 19221, },
    path_of_frost = { SpellIDs = { 3714 }, },
    purgatory = { TalentID = 21209, },
    raise_ally = { SpellIDs = { 61999 }, },
    rapid_decomposition = { TalentID = 19218, },
    red_thirst = { TalentID = 22014, },
    rune_tap = { SpellIDs = { 194679 }, TalentID = 19231, },
    runeforging = { SpellIDs = { 53428 }, },
    spectral_deflection = { TalentID = 19220, },
    tightening_grasp = { TalentID = 19227, },
    tombstone = { SpellIDs = { 219809 }, TalentID = 22015, },
    tremble_before_me = { TalentID = 19226, },
    vampiric_blood = { SpellIDs = { 55233 }, },
    veteran_of_the_third_war = { SpellIDs = { 48263 }, },
    will_of_the_necropolis = { TalentID = 19230, },
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
    mind_freeze = {
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

TJ:RegisterPlayerClass({
    name = 'Blood',
    class_id = 6,
    spec_id = 1,
    default_action_profile = 'custom::deathknight::blood',
    resources = { 'rune', 'runic_power', 'runic_power_per_time', 'runic_power_per_time_no_base' },
    actions = {
        blood_abilities_exported,
        blood_base_abilities,
    },
    blacklisted = {},
})

------------------------------------------------------------------------------------------------------------------------
-- Unholy profile definition
------------------------------------------------------------------------------------------------------------------------

-- When exporting for Unholy, summon the pet then run /tj _esd
-- Make sure to run this twice, both with Sludge Belcher active and inactive.

-- exported with /tj _esd
local unholy_abilities_exported = {
    all_will_serve = { TalentID = 22024, },
    antimagic_shell = { SpellIDs = { 48707 }, },
    apocalypse = { SpellIDs = { 220143 }, },
    army_of_the_dead = { SpellIDs = { 42650 }, },
    asphyxiate = { SpellIDs = { 108194 }, TalentID = 22524, },
    blighted_rune_weapon = { SpellIDs = { 194918 }, TalentID = 22029, },
    bursting_sores = { TalentID = 22025, },
    castigator = { TalentID = 22518, },
    chains_of_ice = { SpellIDs = { 45524 }, },
    claw = { SpellIDs = { 47468 }, },
    clawing_shadows = { SpellIDs = { 207311 }, TalentID = 22520, },
    cleaver = { SpellIDs = { 212333 }, },
    control_undead = { SpellIDs = { 111673 }, },
    corpse_shield = { SpellIDs = { 207319 }, TalentID = 22530, },
    dark_arbiter = { SpellIDs = { 207349 }, TalentID = 22030, },
    dark_command = { SpellIDs = { 56222 }, },
    dark_succor = { SpellIDs = { 178819 }, },
    dark_transformation = { SpellIDs = { 63560 }, },
    death_and_decay = { SpellIDs = { 43265 }, },
    death_coil = { SpellIDs = { 47541 }, },
    death_gate = { SpellIDs = { 50977 }, },
    death_grip = { SpellIDs = { 49576 }, },
    death_strike = { SpellIDs = { 49998 }, },
    debilitating_infestation = { TalentID = 22526, },
    defile = { SpellIDs = { 152280 }, TalentID = 22110, },
    ebon_fever = { TalentID = 22026, },
    epidemic = { SpellIDs = { 207317 }, TalentID = 22027, },
    festering_strike = { SpellIDs = { 85948 }, },
    gnaw = { SpellIDs = { 47481 }, },
    hook = { SpellIDs = { 212468 }, },
    huddle = { SpellIDs = { 47484 }, },
    icebound_fortitude = { SpellIDs = { 48792 }, },
    infected_claws = { TalentID = 22536, },
    leap = { SpellIDs = { 47482 }, },
    lingering_apparition = { TalentID = 22022, },
    mastery_dreadblade = { SpellIDs = { 77515 }, },
    mind_freeze = { SpellIDs = { 47528 }, },
    necrosis = { TalentID = 22534, },
    on_a_pale_horse = { SpellIDs = { 51986 }, },
    outbreak = { SpellIDs = { 77575 }, },
    path_of_frost = { SpellIDs = { 3714 }, },
    pestilent_pustules = { TalentID = 22028, },
    protective_bile = { SpellIDs = { 212384 }, },
    raise_ally = { SpellIDs = { 61999 }, },
    raise_dead = { SpellIDs = { 46584 }, },
    runeforging = { SpellIDs = { 53428 }, },
    runic_corruption = { SpellIDs = { 51462 }, },
    scourge_strike = { SpellIDs = { 55090 }, },
    shadow_infusion = { TalentID = 22532, },
    sludge_belcher = { TalentID = 22522, },
    smash = { SpellIDs = { 212336 }, },
    soul_reaper = { SpellIDs = { 130736 }, TalentID = 22538, },
    spell_eater = { TalentID = 22528, },
    sudden_doom = { SpellIDs = { 49530 }, },
    summon_gargoyle = { SpellIDs = { 49206 }, },
    unholy_frenzy = { TalentID = 22516, },
    wraith_walk = { SpellIDs = { 212552 }, },
}

local unholy_base_abilities = {
    antimagic_shell = {
        AuraID = 48707,
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'antimagic_shell',
        AuraApplyLength = 10,
    },
    chains_of_ice = {
        AuraID = 45524,
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'chains_of_ice',
        AuraApplyLength = 8,
    },
    dark_transformation = {
        AuraID = 63560,
        AuraMine = true,
        AuraUnit = "pet",
        AuraApplied = 'dark_transformation',
        AuraApplyLength = 20,
    },
    death_and_decay = {
        AuraID = 188290,
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'death_and_decay',
        AuraApplyLength = 10,
    },
    death_coil = {
        -- This needs to be manually specified - if there's a profile reload while sudden doom is up, then there's no cost associated with it
        cost_type = 'runic_power',
        runic_power_cost = function(spell, env)
            return env.sudden_doom.aura_up and 0 or 45
        end,
        PerformCast = function(spell, env)
            if env.sudden_doom.aura_up then
                env.sudden_doom.expirationTime = 0
            end
            if env.necrosis.talent_enabled then
                env.necrosis.expirationTime = env.currentTime + 6
            end
        end,
    },
    festering_strike = {
        AuraApplied = 'festering_wound',
        AuraApplyLength = 24,
        PerformCast = function(spell,env)
            env.festering_wound.aura_stack = env.festering_wound.aura_stack + 2
        end,
    },
    icebound_fortitude = {
        AuraID = 48792,
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'icebound_fortitude',
        AuraApplyLength = 8,
        spell_cast_time = 0.01, -- off GCD!
    },
    mind_freeze = {
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
    outbreak = {
        AuraID = 196782,
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'outbreak',
        AuraApplyLength = 6,
        PerformCast = function(spell, env)
            env.virulent_plague.expirationTime = env.currentTime + 20
            if env.debilitating_infestation.talent_enabled then
                env.debilitating_infestation.expirationTime = env.currentTime + 6
            end
        end
    },
    raise_dead = {
        CanCast = function(spell, env)
            if UnitExists('pet') then return false end
            local lastCast = env.lastCastTimes[46584]
            if not lastCast then return true end
            if lastCast + 15 < env.currentTime then return true end
            return false
        end,
    },
    scourge_strike = {
        PerformCast = function(spell,env)
            if env.festering_wound.aura_stack > 0 then
                env.festering_wound.aura_stack = env.festering_wound.aura_stack - 1
                env.runic_power.gained = env.runic_power.gained + 3
            end
            if env.festering_wound.aura_stack == 0 then
                env.festering_wound.expirationTime = 0
            end
        end,
    },
    wraith_walk = {
        AuraID = 212552,
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'wraith_walk',
        AuraApplyLength = 3,
    },
}

local unholy_non_ability_auras = {
    festering_wound = {
        AuraID = 194310,
        AuraUnit = 'target',
        AuraMine = true,
    },
    sudden_doom = {
        AuraID = 81340,
        AuraUnit = 'player',
        AuraMine = true,
    },
    unholy_frenzy = {
        AuraID = 207290,
        AuraUnit = 'target',
        AuraMine = true,
    },
    unholy_strength = {
        AuraID = 53365,
        AuraUnit = 'target',
        AuraMine = true,
    },
    virulent_plague = {
        AuraID = 191587,
        AuraUnit = 'target',
        AuraMine = true,
    },
}

local unholy_talents = {
    blighted_rune_weapon = {
        AuraID = 194918,
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'blighted_rune_weapon',
        AuraApplyLength = 10,
    },
    clawing_shadows = {
        PerformCast = function(spell,env)
            if env.festering_wound.aura_stack > 0 then
                env.festering_wound.aura_stack = env.festering_wound.aura_stack - 1
                env.runic_power.gained = env.runic_power.gained + 3
            end
            if env.festering_wound.aura_stack == 0 then
                env.festering_wound.expirationTime = 0
            end
            if env.soul_reaper.aura_up then
                env.soul_reaper_self.expirationTime = env.currentTime + 6
                env.soul_reaper_self.aura_stack = env.soul_reaper_self.aura_stack + 1
            end
        end,
    },
    corpse_shield = {
        AuraID = 207319,
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'corpse_shield',
        AuraApplyLength = 10,
    },
    debilitating_infestation = {
        AuraID = 208278,
        AuraUnit = 'target',
        AuraMine = true,
    },
    defile = {
        AuraID = 218100,
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'defile',
        AuraApplyLength = 10,
        PerformCast = function(spell, env)
            env.death_and_decay.expirationTime = env.currentTime + 10
        end
    },
    necrosis = {
        AuraID = 216974,
        AuraUnit = 'target',
        AuraMine = true,
    },
    pet = {
        valkyr_battlemaiden_active = function(spell,env) -- Dark Arbiter
            -- active for 20secs after last cast
            local lastCast = env.lastCastTimes[207349]
            return lastCast and (env.currentTime < (lastCast + 20)) and true or false
        end,
    },
    soul_reaper = { -- Self-buff, from when festering explodes, corresponding debuff on the target is below. Note that there are conditional substitutions present to be able to change the debuff name.
        AuraID = 215711,
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'soul_reaper_debuff',
        AuraApplyLength = 10,
    },
    soul_reaper_debuff = { -- Target debuff
        AuraID = 130736,
        AuraUnit = 'target',
        AuraMine = true,
    },
}

local unholy_artifact = {
    }

local unholy_tier_bonuses = {
    master_of_ghouls = { -- T20 2P
        AuraID = { 242064, 246995 },
        AuraUnit = 'player',
        AuraMine = true,
    },
}

local unholy_legendaries = {
    cold_heart = {
        AuraID = 235599,
        AuraUnit = 'player',
        AuraMine = true,
    },
    temptation = { -- Not a legendary, from Ring of Collapsing Futures from Kara
        AuraID = 234143,
        AuraUnit = 'player',
        AuraMine = true,
    },
}

local unholy_hooks = {
    hooks = {
        OnStateInit = function(env)
            local dummy = env.rune.curr -- Need to invoke the rune sampling routine
        end,
        OnPredictActionAtOffset = function(env)
            local dummy = env.rune.curr -- Need to invoke the rune sampling routine
            --[[
            Core:Debug({
            all = env.rune.all_remains,
            gained = env.rune.gained,
            spent = env.rune.spent,
            skipped = env.rune.skipped,
            curr = env.rune.curr,
            })
            --]]
        end,
        perform_spend = function(spell, env, action, origCostType, origCostAmount)
            return origCostType, origCostAmount
        end,
        can_spend = function(spell, env, action, origCostType, origCostAmount)
            return origCostType, origCostAmount
        end,
    }
}


TJ:RegisterPlayerClass({
    name = 'Unholy',
    class_id = 6,
    spec_id = 3,
    default_action_profile = 'simc::deathknight::unholy',
    resources = { 'rune', 'runic_power', 'runic_power_per_time', 'runic_power_per_time_no_base' },
    actions = {
        unholy_abilities_exported,
        unholy_base_abilities,
        unholy_non_ability_auras,
        unholy_talents,
        unholy_artifact,
        unholy_tier_bonuses,
        unholy_legendaries,
        unholy_hooks
    },
    blacklisted = {},
    conditional_substitutions_pre = {
        { "^energy$", "pet_energy" }, -- Energy corresponds to pet, not player
        { "^energy%.", "pet_energy." }, -- Energy corresponds to pet, not player
        { "debuff.soul_reaper", "debuff.soul_reaper_debuff" }, -- Need to differentiate between the target debuff and the player buff
    }
})

------------------------------------------------------------------------------------------------------------------------
-- Frost profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local frost_abilities_exported = {
    abominations_might = { TalentID = 22521, },
    antimagic_shell = { SpellIDs = { 48707 }, },
    avalanche = { TalentID = 22519, },
    blinding_sleet = { SpellIDs = { 207167 }, TalentID = 22523, },
    breath_of_sindragosa = { SpellIDs = { 152279 }, TalentID = 22109, },
    chains_of_ice = { SpellIDs = { 45524 }, },
    control_undead = { SpellIDs = { 111673 }, },
    dark_command = { SpellIDs = { 56222 }, },
    dark_succor = { SpellIDs = { 178819 }, },
    death_gate = { SpellIDs = { 50977 }, },
    death_grip = { SpellIDs = { 49576 }, },
    death_strike = { SpellIDs = { 49998 }, },
    empower_rune_weapon = { SpellIDs = { 47568 }, },
    freezing_fog = { TalentID = 22019, },
    frost_strike = { SpellIDs = { 49143 }, },
    frostscythe = { SpellIDs = { 207230 }, TalentID = 22531, },
    frozen_pulse = { TalentID = 22533, },
    gathering_storm = { TalentID = 22535, },
    glacial_advance = { SpellIDs = { 194913 }, TalentID = 22517, },
    horn_of_winter = { SpellIDs = { 57330 }, TalentID = 22021, },
    howling_blast = { SpellIDs = { 49184 }, },
    hungering_rune_weapon = { SpellIDs = { 207127 }, TalentID = 22537, },
    icebound_fortitude = { SpellIDs = { 48792 }, },
    icecap = { TalentID = 22515, },
    icy_talons = { TalentID = 22017, },
    inexorable_assault = { TalentID = 22031, },
    killing_machine = { SpellIDs = { 51128 }, },
    mastery_frozen_heart = { SpellIDs = { 77514 }, },
    mind_freeze = { SpellIDs = { 47528 }, },
    murderous_efficiency = { TalentID = 22020, },
    obliterate = { SpellIDs = { 49020 }, },
    obliteration = { SpellIDs = { 207256 }, TalentID = 22023, },
    on_a_pale_horse = { SpellIDs = { 51986 }, },
    path_of_frost = { SpellIDs = { 3714 }, },
    permafrost = { TalentID = 22529, },
    pillar_of_frost = { SpellIDs = { 51271 }, },
    raise_ally = { SpellIDs = { 61999 }, },
    remorseless_winter = { SpellIDs = { 196770 }, },
    rime = { SpellIDs = { 59057 }, },
    runeforging = { SpellIDs = { 53428 }, },
    runic_attenuation = { TalentID = 22018, },
    runic_empowerment = { SpellIDs = { 81229 }, },
    shattering_strikes = { TalentID = 22016, },
    sindragosas_fury = { SpellIDs = { 190778, } },
    volatile_shielding = { TalentID = 22527, },
    winter_is_coming = { TalentID = 22525, },
    wraith_walk = { SpellIDs = { 212552 }, },
}

local frost_base_abilities = {
    mind_freeze = {
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
    howling_blast = {
        AuraApplied = 'frost_fever',
        AuraApplyLength = 24,
        PerformCast = function(spell, env)
            if env.rime.aura_up then
                -- The cost is free, so we need to re-add the runic power we normally would've received
                env.runic_power.gained = env.runic_power.gained + 10
                -- Remove Rime
                env.rime.expirationTime = 0
            end
        end
    },
    obliterate = {
        PerformCast = function(spell, env)
            if env.obliteration.aura_up then
                -- The cost is decreased by 1 rune, so we need to re-add the runic power we normally would've received
                env.runic_power.gained = env.runic_power.gained + 10
            end
        end
    },
    frost_strike = {
        PerformCast = function(spell, env)
            if env.obliteration.aura_up then
                env.killing_machine.expirationTime = env.currentTime + 10
            end
        end
    },
    empower_rune_weapon = {
        PerformCast = function(spell, env)
            env.rune.gained = env.rune.gained + 6 -- This will get reset next time around anyway, and we can't cast 6 runes before that
            env.runic_power.gained = env.runic_power.gained + 25
        end,
        spell_cast_time = 0.01,
    },
    frost_fever = {
        AuraID = 55095,
        AuraUnit = 'target',
        AuraMine = true,
    },
    unholy_strength = {
        AuraID = 53365,
        AuraMine = true,
        AuraUnit = "player",
    },
    razorice = {
        AuraID = 51714,
        AuraUnit = 'target',
        AuraMine = true,
    },
    rime = {
        AuraID = 59052,
        AuraUnit = 'player',
        AuraMine = true,
    },
    killing_machine = {
        AuraID = 51124,
        AuraUnit = 'player',
        AuraMine = true,
    },
    pillar_of_frost = {
        AuraID = 51271,
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'pillar_of_frost',
        AuraApplyLength = 20,
        spell_cast_time = 0.01,
    },
    icebound_fortitude = {
        AuraID = 48792,
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'icebound_fortitude',
        AuraApplyLength = 8,
        spell_cast_time = 0.01,
    },
    remorseless_winter = {
        AuraID = 211793,
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'remorseless_winter',
        AuraApplyLength = 8,
    },
    temptation = {
        AuraID = 234143,
        AuraMine = true,
        AuraUnit = "player",
    },
    horn_of_winter = {
        PerformCast = function(spell, env)
            env.rune.gained = env.rune.gained + 2
            env.runic_power.gained = env.runic_power.gained + 20
        end,
    }
}

local frost_talent_overrides = {
    icy_talons = {
        AuraID = 194879,
        AuraUnit = 'player',
        AuraMine = true,
    },
    obliteration = {
        AuraID = 207256,
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'obliteration',
        AuraApplyLength = 8,
        spell_cast_time = 0.01,
    },
}

local frost_legendaries = {
    perseverance_of_the_ebon_martyr = {
        AuraID = { 216059 },
        AuraUnit = 'target',
        AuraMine = true,
    },
    cold_heart = {
        AuraID = 235599,
        AuraMine = true,
        AuraUnit = "player",
    },
}

local frost_hooks = {
    hooks = {
        OnPredictActionAtOffset = function(env)
        --[[
        Core:Debug({
        remaining = env.rune.all_remains,
        available = env.rune.curr,
        env_obliterate_rune_cost = env.obliterate.rune_cost,
        env_obliterate_spell_can_cast = env.obliterate.spell_can_cast,
        })
        --]]
        end,
        perform_spend = function(spell, env, action, origCostType, origCostAmount)
            -- One-less-rune for Obliterate when Obliteration is active
            if env.obliteration.aura_up and action == 'obliterate' then
                return origCostType, origCostAmount-1
            end
            -- Howling Blast is free when Rime is active
            if env.rime.aura_up and action == 'howling_blast' then
                return 'none'
            end
            return origCostType, origCostAmount
        end,
        can_spend = function(spell, env, action, origCostType, origCostAmount)
            -- One-less-rune for Obliterate when Obliteration is active
            if env.obliteration.aura_up and action == 'obliterate' then
                return origCostType, origCostAmount-1
            end
            -- Howling Blast is free when Rime is active
            if env.rime.aura_up and action == 'howling_blast' then
                return 'none'
            end
            return origCostType, origCostAmount
        end,
    }
}

TJ:RegisterPlayerClass({
    name = 'Frost',
    class_id = 6,
    spec_id = 2,
    default_action_profile = 'simc::deathknight::frost',
    resources = { 'rune', 'runic_power', 'runic_power_per_time', 'runic_power_per_time_no_base' },
    actions = {
        frost_abilities_exported,
        frost_base_abilities,
        frost_talent_overrides,
        frost_legendaries,
        frost_hooks,
    },
    blacklisted = {},
})
