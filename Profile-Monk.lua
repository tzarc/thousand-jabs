local _, private = ...;
local TJ = private.TJ
local DBG = private.DBG
local tcache = private.tcache
local db = private.db

private.apls["dummy::PrePatch::Monk_Brewmaster"] = [[
actions=auto_attack

actions+=/call_action_list,name=st,if=active_enemies<3
actions+=/call_action_list,name=aoe,if=active_enemies>=3

actions.st=keg_smash
actions.st+=/tiger_palm,if=energy>65
actions.st+=/blackout_strike
actions.st+=/rushing_jade_wind,if=talent.rushing_jade_wind.enabled
actions.st+=/breath_of_fire,if=debuff.keg_smash.up
actions.st+=/chi_wave,if=talent.chi_wave.enabled

actions.aoe=keg_smash
actions.aoe+=/chi_burst,if=talent.chi_burst.enabled
actions.aoe+=/breath_of_fire,if=debuff.keg_smash.up
actions.aoe+=/rushing_jade_wind,if=talent.rushing_jade_wind.enabled
actions.aoe+=/tiger_palm,if=energy>65
actions.aoe+=/blackout_strike
actions.aoe+=/chi_wave,if=talent.chi_wave.enabled
]]

------------------------------------------------------------------------------------------------------------------------
-- Local variables
------------------------------------------------------------------------------------------------------------------------
local padding = 4

------------------------------------------------------------------------------------------------------------------------
-- Helper functions
------------------------------------------------------------------------------------------------------------------------
local function IsWindwalker()
    return GetSpecialization() == 3 and true or false
end

------------------------------------------------------------------------------------------------------------------------
-- Monk energy/chi
------------------------------------------------------------------------------------------------------------------------
local monk_power = private:LogMissingAccess("monk_power",{
    energy = {
        sampled = function(power,env) return (UnitPower('player', SPELL_POWER_ENERGY) or 0) end,
        regen = function(power, env) return GetPowerRegen() end,
        spent = 0,
        curr = function(power,env) return power.sampled - power.spent + power.regen * env.predictionOffset end,
        max = function(power,env) return (UnitPowerMax('player', SPELL_POWER_ENERGY) or 0) end,
        time_to_max = function(power,env) return (power.max - power.curr) /power.regen end,
    },
})

------------------------------------------------------------------------------------------------------------------------
-- Monk common functions
------------------------------------------------------------------------------------------------------------------------
local monk_functions = private:LogMissingAccess("monk_functions",{
    Activate = function(self)
    end,
    Deactivate = function(self)
    end,
    PerformUpdate = function(self)
    end,
    CreateFrames = function(self, parent)
    end,
})

------------------------------------------------------------------------------------------------------------------------
-- Monk event handler functions
------------------------------------------------------------------------------------------------------------------------
local monk_event_handlers = private:LogMissingAccess("monk_event_handlers",{
    UNIT_POWER = function(self, eventName, unitID, powerType)
    end,
    UNIT_POWER_FREQUENT = function(self, eventName, unitID, powerType)
        self:UNIT_POWER(eventName, unitID, powerType)
    end,
})

------------------------------------------------------------------------------------------------------------------------
-- Common monk abilities
------------------------------------------------------------------------------------------------------------------------
local monk_common_abilities = private:LogMissingAccess("monk_common_abilities",{
    expel_harm = {
        abilityID = 115072,
        energyCost = 15,
        cooldownTime = 15,

        PerformCast = function(spell, env)
            env.energy.spent = env.energy.spent + spell.energyCost
        end,

        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return ((env.energy.curr >= spell.energyCost) and true or false) end,
    },
})

------------------------------------------------------------------------------------------------------------------------
-- Monk talents
------------------------------------------------------------------------------------------------------------------------
local monk_talents = private:LogMissingAccess("monk_talents",{
    chi_wave = {
        talentIDs = { 1, 3 },
        abilityID = 115098,
        cooldownTime = 15,

        talent_selected = function(spell, env) return select(4, GetTalentInfo(spell.talentIDs[1], spell.talentIDs[2], GetActiveSpecGroup())) or false end,
        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return ((spell.talent_selected and spell.cooldown_remains == 0) and true or false) end,
    },
    chi_burst = {
        talentIDs = { 1, 1 },
        abilityID = 123986,
        cooldownTime = 30,

        talent_selected = function(spell, env) return select(4, GetTalentInfo(spell.talentIDs[1], spell.talentIDs[2], GetActiveSpecGroup())) or false end,
        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return ((spell.talent_selected and spell.cooldown_remains == 0) and true or false) end,
    },
    rushing_jade_wind = {
        talentIDs = { 6, 1 },
        abilityID = 116847,
        cooldownTime = function(spell,env) return (6.0 * env.playerHasteMultiplier) end,
        talent_selected = function(spell, env) return select(4, GetTalentInfo(spell.talentIDs[1], spell.talentIDs[2], GetActiveSpecGroup())) or false end,

        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return ((spell.talent_selected and spell.cooldown_remains == 0) and true or false) end,
    },
    blackout_combo = {
        talentIDs = { 7, 2 },
        auraID = 228563,
        auraMine = true,
        auraUnit = 'player',

        talent_selected = function(spell, env) return select(4, GetTalentInfo(spell.talentIDs[1], spell.talentIDs[2], GetActiveSpecGroup())) or false end,
    },
})

------------------------------------------------------------------------------------------------------------------------
-- Brewmaster-specific abilties
------------------------------------------------------------------------------------------------------------------------
local monk_brewmaster_abilities = private:LogMissingAccess("monk_brewmaster_abilities",{
    tiger_palm = {
        abilityID = 100780,
        energyCost = 25,

        PerformCast = function(spell, env)
            env.energy.spent = env.energy.spent + spell.energyCost
        end,

        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return ((env.energy.curr >= spell.energyCost) and true or false) end,
    },
    keg_smash = {
        abilityID = 121253,
        auraID = 121253,
        auraMine = true,
        auraUnit = 'target',
        energyCost = 40,
        cooldownTime = function(spell,env) return (8.0 * env.playerHasteMultiplier) end,

        PerformCast = function(spell, env)
            env.energy.spent = env.energy.spent + spell.energyCost
        end,

        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return ((env.energy.curr >= spell.energyCost and spell.cooldown_remains == 0) and true or false) end,
    },
    blackout_strike = {
        abilityID = 205523,
        cooldownTime = 3,

        PerformCast = function(spell, env)
            env.blackout_combo.expirationTime = env.currentTime + 14
        end,

        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return ((spell.cooldown_remains == 0) and true or false) end,
    },
    breath_of_fire = {
        abilityID = 115181,
        cooldownTime = 15,

        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return ((spell.cooldown_remains == 0) and true or false) end,
    },
})

------------------------------------------------------------------------------------------------------------------------
-- Brewmaster profile definition
------------------------------------------------------------------------------------------------------------------------
private:RegisterProfile("Brewmaster", 10, 1, private:MergeTables(monk_functions, monk_event_handlers, monk_power, monk_talents, monk_common_abilities, monk_brewmaster_abilities, {
    gcdAbility = 100780, -- Tiger Palm
    blacklistedActions = {
    },
    actionList = private.apls["dummy::PrePatch::Monk_Brewmaster"],
}))