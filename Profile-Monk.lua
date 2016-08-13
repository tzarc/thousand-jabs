local _, internal = ...;
local Z = internal.Z
local DBG = internal.DBG
local LTC = LibStub('LibTableCache-1.0')
local LUC = LibStub('LibUnitCache-1.0')

------------------------------------------------------------------------------------------------------------------------
-- Brewmaster profile definition
------------------------------------------------------------------------------------------------------------------------

internal.apls['dummy::PrePatch::Monk_Brewmaster'] = [[
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

local brewmaster_base_overrides = {
    keg_smash = {
        AuraID = 121253,
        AuraMine = true,
        AuraUnit = 'target',
        AuraApplied = 'keg_smash',
        AuraApplyLength = 15,
    },
    blackout_strike = {
        AuraApplied = 'blackout_combo',
        AuraApplyLength = 14,
    },
}

local brewmaster_talent_overrides = {
    blackout_combo = {
        AuraID = 228563,
        AuraMine = true,
        AuraUnit = 'player',
    },
}

Z:RegisterProfile('Brewmaster', 10, 1, brewmaster_base_overrides, brewmaster_talent_overrides, {
    gcdAbility = 100780, -- Tiger Palm
    blacklistedActions = {},
    actionProfile = 'dummy::PrePatch::Monk_Brewmaster',
    energy = internal.resources.energy,
})

------------------------------------------------------------------------------------------------------------------------
-- Windwalker profile definition
------------------------------------------------------------------------------------------------------------------------

local windwalker_base_overrides = {
    tiger_palm = {
        PerformCast = function(spell, env)
            env.chi.gained = env.chi.gained + 2
            if env.power_strikes.aura_react then
                env.chi.gained = env.chi.gained + 1
            end
        end,
    },
    blackout_kick = {
        PerformCast = function(spell, env)
            if env.bok_proc.aura_react then
                env.chi.gained = env.chi.gained + spell.chi_cost -- refund the chi
                env.bok_proc.expirationTime = 0                  -- remove the buff
            end
        end,
    },
    energizing_elixir = {
        PerformCast = function(spell, env)
            env.chi.gained = env.chi.gained + (env.chi.max - env.chi.curr)
            env.energy.gained = env.energy.gained + (env.energy.max - env.energy.curr)
        end
    },
    storm_earth_and_fire = {
        AuraID = 137639,
        AuraMine = true,
        AuraUnit = 'player',
        AuraApplied = 'storm_earth_and_fire',
        AuraApplyLength = 15,

        CanCast = function(spell, env)
            --DevTools_Dump{storm_earth_and_fire=env.storm_earth_and_fire}
            return (not env.serenity.talent_selected) and (not spell.aura_react)
        end,
    },
    bok_proc = {
        AuraID = 116768,
        AuraMine = true,
        AuraUnit = 'player',
    },
    power_strikes = {
        AuraID = 129914,
        AuraMine = true,
        AuraUnit = 'player',
    },
}

local windwalker_talent_overrides = {
    serenity = {
        AuraID = 152173,
        AuraMine = true,
        AuraUnit = 'player',
        AuraApplied = 'serenity',
        AuraApplyLength = 8,
    },
    whirling_dragon_punch = {
        CanCast = function(spell, env)
            return (env.fists_of_fury.cooldown_remains > 0) and (env.rising_sun_kick.cooldown_remains > 0)
        end,
    },
}

local windwalker_artifact_overrides = {
    gale_burst = {
        is_artifact = true,
        artifact_selected = function(spell, env) return false end, -- TODO
    },
    strike_of_the_windlord = {
        is_artifact = true,
        artifact_selected = function(spell, env) return false end, -- TODO
    },
}

Z:RegisterProfile('Windwalker', 10, 3, windwalker_base_overrides, windwalker_talent_overrides, windwalker_artifact_overrides, {
    gcdAbility = 100780, -- Tiger Palm
    blacklistedActions = {
    },
    mappedActions = { -- ["simc_name"] = "ingame_slug"
        ["invoke_xuen"] = "invoke_xuen_the_white_tiger",
    },
    actionProfile = 'legion-dev::Tier19P::Monk_Windwalker_T19P',
    energy = internal.resources.energy,
    chi = internal.resources.chi,
})