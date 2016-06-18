local _, private = ...;
local TJ = private.TJ
local DBG = private.DBG
local tcache = private.tcache
local db = private.db

-- Disabled for pre-Legion - DH's not available!
local IsLegion = select(4, GetBuildInfo()) >= 70000
if not IsLegion then return end

------------------------------------------------------------------------------------------------------------------------
-- Helper functions
------------------------------------------------------------------------------------------------------------------------
local function IsHavoc()
    return GetSpecialization() == 1 and true or false
end

local function IsVengeance()
    return GetSpecialization() == 2 and true or false
end

------------------------------------------------------------------------------------------------------------------------
-- Power
------------------------------------------------------------------------------------------------------------------------
local dh_veng_power = private:LogMissingAccess("dh_veng_power", {
    pain = {
        sampled = function(power,env) return (UnitPower('player', SPELL_POWER_PAIN) or 0) end,
        gained = 0,
        spent = 0,
        curr = function(power,env) return power.sampled - power.spent + power.gained end,
        max = function(power,env) return (UnitPowerMax('player', SPELL_POWER_PAIN) or 0) end,
    },
    soul_fragments = {
        auraID = 203981,
        auraUnit = 'player',
        auraMine = true,
        spent = 0,
        curr = function(power, env) return power.aura_stack - power.spent end,
    },
})

------------------------------------------------------------------------------------------------------------------------
-- Vengeance common
------------------------------------------------------------------------------------------------------------------------
local dh_veng_common = private:LogMissingAccess("dh_veng_common", {
    Activate = function(self)
    end,
    Deactivate = function(self)
    end,
    PerformUpdate = function(self)
    end,
    CreateFrames = function(self)
    end,
})

------------------------------------------------------------------------------------------------------------------------
-- Vengeance base abilities
------------------------------------------------------------------------------------------------------------------------
local dh_veng_base_abilities = private:LogMissingAccess("dh_veng_base_abilities", {
    soul_carver = {
        abilityID = 207407,
        cooldownTime = 60,
        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return (spell.cooldown_remains == 0) end,
    },
    shear = {
        abilityID = 203782,
        spell_cast_time = 1,
        painGain = 12,

        PerformCast = function(spell, env)
            env.pain.gained = env.pain.gained + spell.painGain
        end,

        spell_cast_time = 1,
        spell_can_cast = true,
    },
    fiery_brand = {
        abilityID = 204021,
        cooldownTime = 60,
        spell_cast_time = 0.1, -- nominal amount, it's supposed to be instant, but things happen in sequence, so....
        spell_can_cast = function(spell, env) return (spell.cooldown_remains == 0) end,
    },
    demon_spikes = {
        abilityID = 203720,
        auraID = 203819,
        auraUnit = 'player',
        auraMine = true,
        painCost = 10,
        rechargeTime = function(spell, env) return (env.playerHasteMultiplier * 15) end,

        PerformCast = function(spell, env)
            env.pain.spent = env.pain.spent + spell.painCost
            spell.rechargeSpent = spell.rechargeSpent + 1
            spell.expirationTime = env.currentTime + 6
        end,

        spell_cast_time = 0.1, -- nominal amount, it's supposed to be instant, but things happen in sequence, so....
        spell_can_cast = function(spell, env) return (spell.aura_remains == 0 and spell.spell_charges > 0 and env.pain.curr >= spell.painCost) end,
    },
    immolation_aura = {
        abilityID = 178740,
        cooldownTime = function(spell, env) return (env.playerHasteMultiplier * 15) end,
        --TODO GENERATE PAIN OVER TIME

        PerformCast = function(spell, env)
            spell.expirationTime = env.currentTime + 6
        end,

        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return (spell.cooldown_remains == 0) end,
    },
    sigil_of_flame = {
        abilityID = 204596,
        cooldownTime = 30,
        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return (spell.cooldown_remains == 0) end,
    },
    soul_cleave = {
        abilityID = 203798,
        painCost = 40,

        PerformCast = function(spell, env)
            env.pain.spent = env.pain.spent + spell.painCost
            env.soul_fragments.spent = env.soul_fragments.curr
        end,

        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return (env.pain.curr >= spell.painCost) end,
    },
})

------------------------------------------------------------------------------------------------------------------------
-- Vengeance talents
------------------------------------------------------------------------------------------------------------------------
local dh_veng_talents = private:LogMissingAccess("dh_veng_talents", {
    felblade = {
        talentIDs = { 3, 1 },
        abilityID = 213241,
        cooldownTime = function(spell, env) return (env.playerHasteMultiplier * 15) end,
        painGain = 20,

        PerformCast = function(spell, env)
            env.pain.gained = env.pain.gained + spell.painGain
        end,

        talent_selected = function(spell, env) return select(4, GetTalentInfo(spell.talentIDs[1], spell.talentIDs[2], GetActiveSpecGroup())) or false end,
        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return ((spell.talent_selected and spell.cooldown_remains == 0) and true or false) end,
    },
    fracture = {
        talentIDs = { 4, 2 },
        abilityID = 209795,
        painCost = 40,
        fragmentCost = 2,

        --TODO SOUL FRAGMENT CHECK
        PerformCast = function(spell, env)
            env.soul_fragments.spent = env.soul_fragments.spent + spell.fragmentCost
            env.pain.spent = env.pain.spent + spell.painCost
        end,

        talent_selected = function(spell, env) return select(4, GetTalentInfo(spell.talentIDs[1], spell.talentIDs[2], GetActiveSpecGroup())) or false end,
        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return ((spell.talent_selected and env.soul_fragments.curr >= 2) and true or false) end,
    },
    fel_eruption = {
        talentIDs = { 5, 2 },
        abilityID = 211881,
        cooldownTime = 35,
        painCost = 10,

        PerformCast = function(spell, env)
            env.pain.spent = env.pain.spent + spell.painCost
        end,

        talent_selected = function(spell, env) return select(4, GetTalentInfo(spell.talentIDs[1], spell.talentIDs[2], GetActiveSpecGroup())) or false end,
        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return ((spell.talent_selected and spell.cooldown_remains == 0) and true or false) end,
    },
    fel_devastation = {
        talentIDs = { 6, 1 },
        abilityID = 218679,
        painCost = 20,

        PerformCast = function(spell, env)
            env.pain.spent = env.pain.spent + spell.painCost
        end,

        -- TODO: need to sort out soul fragment check
        talent_selected = function(spell, env) return select(4, GetTalentInfo(spell.talentIDs[1], spell.talentIDs[2], GetActiveSpecGroup())) or false end,
        spell_cast_time = 2,
        spell_can_cast = function(spell, env) return ((spell.talent_selected and spell.cooldown_remains == 0) and true or false) end,
    },
    spirit_bomb = {
        talentIDs = { 6, 3 },
        abilityID = 218679,
        fragmentCost = 1,

        PerformCast = function(spell, env)
            env.soul_fragments.spent = env.soul_fragments.spent + spell.fragmentCost
            env.frail.expirationTime = env.currentTime + 15
        end,

        talent_selected = function(spell, env) return select(4, GetTalentInfo(spell.talentIDs[1], spell.talentIDs[2], GetActiveSpecGroup())) or false end,
        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return ((spell.talent_selected and env.soul_fragments.curr >= 1) and true or false) end,
    },
    frail = { -- Spirit bomb debuff
        auraID = 224509,
        auraUnit = 'target',
        auraMine = true,
    }
})

------------------------------------------------------------------------------------------------------------------------
-- Vengeance profile definition
------------------------------------------------------------------------------------------------------------------------
private:RegisterProfile("Vengeance", 12, 2, private:MergeTables(dh_veng_common, dh_veng_power, dh_veng_base_abilities, dh_veng_talents, {
    gcdAbility = 203782, -- Shear
    blacklistedActions = {
        "empower_wards",
    },
    actionList = private.apls["legion-dev::Tier19P::Demon_Hunter_Vengeance_T19P"],
}))
