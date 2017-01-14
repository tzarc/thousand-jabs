local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Config = TJ:GetModule('Config')

------------------------------------------------------------------------------------------------------------------------
-- Blood profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local blood_abilities_exported = {}
if TJ:MatchesBuild('7.1.5', '7.1.5') then
    blood_abilities_exported = {
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
        dancing_rune_weapon = { SpellIDs = { 49028 }, },
        dark_command = { SpellIDs = { 56222 }, },
        death_and_decay = { SpellIDs = { 43265 }, },
        death_gate = { SpellIDs = { 50977 }, },
        death_grip = { SpellIDs = { 49576 }, },
        death_strike = { SpellIDs = { 49998 }, },
        deaths_caress = { SpellIDs = { 195292 }, },
        foul_bulwark = { TalentID = 19232, },
        gorefiends_grasp = { SpellIDs = { 108199 }, },
        heart_strike = { SpellIDs = { 206930 }, },
        heartbreaker = { TalentID = 19166, },
        icebound_fortitude = { SpellIDs = { 48792 }, },
        march_of_the_damned = { TalentID = 19228, },
        mark_of_blood = { SpellIDs = { 206940 }, TalentID = 22013, },
        marrowrend = { SpellIDs = { 195182 }, },
        mind_freeze = { SpellIDs = { 47528 }, },
        ossuary = { TalentID = 19221, },
        path_of_frost = { SpellIDs = { 3714 }, },
        purgatory = { TalentID = 21209, },
        raise_ally = { SpellIDs = { 61999 }, },
        rapid_decomposition = { TalentID = 19218, },
        red_thirst = { TalentID = 22014, },
        rune_tap = { SpellIDs = { 194679 }, TalentID = 19231, },
        runeforging = { SpellIDs = { 53428 }, },
        soulgorge = { SpellIDs = { 212744 }, TalentID = 19219, },
        spectral_deflection = { TalentID = 19220, },
        tightening_grasp = { TalentID = 19227, },
        tombstone = { SpellIDs = { 219809 }, TalentID = 22015, },
        tremble_before_me = { TalentID = 19226, },
        vampiric_blood = { SpellIDs = { 55233 }, },
        will_of_the_necropolis = { TalentID = 19230, },
        wraith_walk = { SpellIDs = { 212552 }, },
    }
end

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
    betaProfile = true,
    name = 'Blood',
    class_id = 6,
    spec_id = 1,
    action_profile = 'custom::deathknight::blood',
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
local unholy_abilities_exported = {}
if TJ:MatchesBuild('7.1.5', '7.1.5') then
    unholy_abilities_exported = {
        all_will_serve = { TalentID = 22024, },
        antimagic_shell = { SpellIDs = { 48707 }, },
        apocalypse = { SpellIDs = { 220143 }, },
        army_of_the_dead = { SpellIDs = { 42650 }, },
        asphyxiate = { SpellIDs = { 108194 }, TalentID = 22524, },
        blighted_rune_weapon = { SpellIDs = { 194918 }, TalentID = 22029, },
        bursting_sores = { TalentID = 22025, },
        castigator = { TalentID = 22518, },
        chains_of_ice = { SpellIDs = { 45524 }, },
        clawing_shadows = { SpellIDs = { 207311 }, TalentID = 22520, },
        control_undead = { SpellIDs = { 111673 }, },
        corpse_shield = { SpellIDs = { 207319 }, TalentID = 22530, },
        dark_arbiter = { SpellIDs = { 207349 }, TalentID = 22030, },
        dark_command = { SpellIDs = { 56222 }, },
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
        icebound_fortitude = { SpellIDs = { 48792 }, },
        infected_claws = { TalentID = 22536, },
        lingering_apparition = { TalentID = 22022, },
        mind_freeze = { SpellIDs = { 47528 }, },
        necrosis = { TalentID = 22534, },
        outbreak = { SpellIDs = { 77575 }, },
        path_of_frost = { SpellIDs = { 3714 }, },
        pestilent_pustules = { TalentID = 22028, },
        raise_ally = { SpellIDs = { 61999 }, },
        raise_dead = { SpellIDs = { 46584 }, },
        runeforging = { SpellIDs = { 53428 }, },
        scourge_strike = { SpellIDs = { 55090 }, },
        shadow_infusion = { TalentID = 22532, },
        sludge_belcher = { TalentID = 22522, },
        soul_reaper = { SpellIDs = { 130736 }, TalentID = 22538, },
        spell_eater = { TalentID = 22528, },
        summon_gargoyle = { SpellIDs = { 49206 }, },
        unholy_frenzy = { TalentID = 22516, },
        wraith_walk = { SpellIDs = { 212552 }, },
    }
end

local unholy_base_abilities = {
    outbreak = {
        AuraID = 196782,
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'outbreak',
        AuraApplyLength = 6,
        PerformCast = function(spell, env)
            env.virulent_plague.expirationTime = env.currentTime + 20
        end
    },
    death_and_decay = {
        AuraID = 188290,
        AuraUnit = 'player',
        AuraMine = true,
    },
    death_coil = {
        -- This needs to be manually specified - if there's a profile reload while sudden doom is up, then there's no cost associated with it
        cost_type = 'runic_power',
        runic_power_cost = function(spell, env)
            return env.sudden_doom.aura_up and 0 or 35
        end,
        PerformCast = function(spell, env)
            if env.sudden_doom.aura_up then
                env.sudden_doom.expirationTime = 0
            end
        end,
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
            local lastCast = env.lastCastTimes[207349]
            return lastCast and (env.currentTime < (lastCast + 15)) and true or false
        end,
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
    clawing_shadows = {
        PerformCast = function(spell,env)
            if env.festering_wound.aura_stack > 0 then
                env.festering_wound.aura_stack = env.festering_wound.aura_stack - 1
            end
            if env.festering_wound.aura_stack == 0 then
                env.festering_wound.expirationTime = 0
            end
        end,
    },
}

TJ:RegisterPlayerClass({
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
