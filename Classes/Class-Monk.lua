local _, internal = ...;
local Z = internal.Z

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

-- exported with /tj _esd
local brewmaster_abilities_exported = {
    black_ox_brew = { SpellIDs = { 115399 }, TalentIDs = { 3, 2 }, },
    blackout_combo = { TalentIDs = { 7, 2 }, },
    blackout_strike = { SpellIDs = { 205523 }, },
    breath_of_fire = { SpellIDs = { 115181 }, },
    celerity = { TalentIDs = { 2, 3 }, },
    chi_burst = { SpellIDs = { 123986 }, TalentIDs = { 1, 1 }, },
    chi_torpedo = { SpellIDs = { 115008 }, TalentIDs = { 2, 1 }, },
    chi_wave = { SpellIDs = { 115098 }, TalentIDs = { 1, 3 }, },
    crackling_jade_lightning = { SpellIDs = { 117952 }, },
    dampen_harm = { SpellIDs = { 122278 }, TalentIDs = { 5, 3 }, },
    detox = { SpellIDs = { 218164 }, },
    diffuse_magic = { SpellIDs = { 122783 }, TalentIDs = { 5, 2 }, },
    effuse = { SpellIDs = { 116694 }, },
    elusive_dance = { TalentIDs = { 7, 1 }, },
    expel_harm = { SpellIDs = { 115072 }, },
    exploding_keg = { SpellIDs = { 214326 }, },
    eye_of_the_tiger = { TalentIDs = { 1, 2 }, },
    fortifying_brew = { SpellIDs = { 115203 }, },
    gift_of_the_mists = { TalentIDs = { 3, 3 }, },
    healing_elixir = { SpellIDs = { 122281 }, TalentIDs = { 5, 1 }, },
    high_tolerance = { TalentIDs = { 7, 3 }, },
    invoke_niuzao_the_black_ox = { SpellIDs = { 132578 }, TalentIDs = { 6, 2 }, },
    ironskin_brew = { SpellIDs = { 115308 }, },
    keg_smash = { SpellIDs = { 121253 }, },
    leg_sweep = { SpellIDs = { 119381 }, TalentIDs = { 4, 3 }, },
    light_brewing = { TalentIDs = { 3, 1 }, },
    paralysis = { SpellIDs = { 115078 }, },
    provoke = { SpellIDs = { 115546 }, },
    purifying_brew = { SpellIDs = { 119582 }, },
    quaking_palm = { SpellIDs = { 107079 }, },
    resuscitate = { SpellIDs = { 115178 }, },
    ring_of_peace = { SpellIDs = { 116844 }, TalentIDs = { 4, 1 }, },
    roll = { SpellIDs = { 109132 }, },
    rushing_jade_wind = { SpellIDs = { 116847 }, TalentIDs = { 6, 1 }, },
    spear_hand_strike = { SpellIDs = { 116705 }, },
    special_delivery = { TalentIDs = { 6, 3 }, },
    summon_black_ox_statue = { SpellIDs = { 115315 }, TalentIDs = { 4, 2 }, },
    tiger_palm = { SpellIDs = { 100780 }, },
    tigers_lust = { SpellIDs = { 116841 }, TalentIDs = { 2, 2 }, },
    transcendence = { SpellIDs = { 101643 }, },
    transcendence_transfer = { SpellIDs = { 119996 }, },
    zen_meditation = { SpellIDs = { 115176 }, },
    zen_pilgrimage = { SpellIDs = { 126892 }, },
}

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

Z:RegisterPlayerClass({
    name = 'Brewmaster',
    class_id = 10,
    spec_id = 1,
    action_profile = 'dummy::PrePatch::Monk_Brewmaster',
    resources = { 'energy', 'energy_per_time' },
    actions = {
        brewmaster_abilities_exported,
        brewmaster_base_overrides,
        brewmaster_talent_overrides,
    },
    blacklisted = {},
})

------------------------------------------------------------------------------------------------------------------------
-- Windwalker profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local windwalker_abilities_exported = {
    ascension = { TalentIDs = { 3, 2 }, },
    blackout_kick = { SpellIDs = { 100784 }, },
    celerity = { TalentIDs = { 2, 3 }, },
    chi_burst = { SpellIDs = { 123986 }, TalentIDs = { 1, 1 }, },
    chi_orbit = { TalentIDs = { 7, 1 }, },
    chi_torpedo = { SpellIDs = { 115008 }, TalentIDs = { 2, 1 }, },
    chi_wave = { SpellIDs = { 115098 }, TalentIDs = { 1, 3 }, },
    crackling_jade_lightning = { SpellIDs = { 117952 }, },
    dampen_harm = { SpellIDs = { 122278 }, TalentIDs = { 5, 3 }, },
    detox = { SpellIDs = { 218164 }, },
    diffuse_magic = { SpellIDs = { 122783 }, TalentIDs = { 5, 2 }, },
    disable = { SpellIDs = { 116095 }, },
    disabling_technique = { SpellIDs = { 175697 }, },
    dizzying_kicks = { TalentIDs = { 4, 2 }, },
    effuse = { SpellIDs = { 116694 }, },
    energizing_elixir = { SpellIDs = { 115288 }, TalentIDs = { 3, 1 }, },
    eye_of_the_tiger = { TalentIDs = { 1, 2 }, },
    fists_of_fury = { SpellIDs = { 113656 }, },
    flying_serpent_kick = { SpellIDs = { 101545 }, },
    healing_elixir = { SpellIDs = { 122281 }, TalentIDs = { 5, 1 }, },
    hit_combo = { TalentIDs = { 6, 3 }, },
    invoke_xuen_the_white_tiger = { SpellIDs = { 123904 }, TalentIDs = { 6, 2 }, },
    leg_sweep = { SpellIDs = { 119381 }, TalentIDs = { 4, 3 }, },
    paralysis = { SpellIDs = { 115078 }, },
    power_strikes = { TalentIDs = { 3, 3 }, },
    provoke = { SpellIDs = { 115546 }, },
    quaking_palm = { SpellIDs = { 107079 }, },
    resuscitate = { SpellIDs = { 115178 }, },
    ring_of_peace = { SpellIDs = { 116844 }, TalentIDs = { 4, 1 }, },
    rising_sun_kick = { SpellIDs = { 107428 }, },
    roll = { SpellIDs = { 109132 }, },
    rushing_jade_wind = { SpellIDs = { 116847 }, TalentIDs = { 6, 1 }, },
    serenity = { SpellIDs = { 152173 }, TalentIDs = { 7, 3 }, },
    spear_hand_strike = { SpellIDs = { 116705 }, },
    spinning_crane_kick = { SpellIDs = { 101546 }, },
    storm_earth_and_fire = { SpellIDs = { 137639 }, },
    strike_of_the_windlord = { SpellIDs = { 205320 }, },
    tiger_palm = { SpellIDs = { 100780 }, },
    tigers_lust = { SpellIDs = { 116841 }, TalentIDs = { 2, 2 }, },
    touch_of_death = { SpellIDs = { 115080 }, },
    touch_of_karma = { SpellIDs = { 122470 }, },
    transcendence = { SpellIDs = { 101643 }, },
    transcendence_transfer = { SpellIDs = { 119996 }, },
    whirling_dragon_punch = { SpellIDs = { 152175 }, TalentIDs = { 7, 2 }, },
    zen_pilgrimage = { SpellIDs = { 126892 }, },
}

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
                env.bok_proc.expirationTime = 0 -- remove the buff
            end
        end,
    },
    fists_of_fury = {
        spell_cast_time = function(spell,env) return env.playerHasteMultiplier * 4 end, -- seems like we can't detect this...
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
    power_strikes = {
        AuraID = 129914,
        AuraMine = true,
        AuraUnit = 'player',
    },
}

local windwalker_artifact_overrides = {
    gale_burst = {
        artifact_selected = function(spell,env) return internal.GetSpecConf("gale_burst_selected") end,
    },
    strike_of_the_windlord = {
        artifact_selected = function(spell,env) return internal.GetSpecConf("strike_of_the_windlord_selected") end,
    },
}

local windwalker_hooks = {
    hooks = {
        perform_spend = function(spell, env, action, origCostType, origCostAmount)
            if origCostType == 'chi' then
                if env.serenity.aura_remains > 0 then -- if serenity is active, then no chi costs (still need appropriate amount of chi!)
                    return 'none'
                elseif action == 'blackout_kick' and env.bok_proc.aura_remains > 0 then -- no spend for BoK when there's a proc
                    return 'none'
                end
            end
            return origCostType, origCostAmount
        end,
    },
}

Z:RegisterPlayerClass({
    name = 'Windwalker',
    class_id = 10,
    spec_id = 3,
    action_profile = 'legion-dev::Tier19P::Monk_Windwalker_T19P',
    resources = { 'energy', 'energy_per_time', 'chi' },
    actions = {
        windwalker_abilities_exported,
        windwalker_base_overrides,
        windwalker_talent_overrides,
        windwalker_artifact_overrides,
        windwalker_hooks,
    },
    blacklisted = {
        'spear_hand_strike',
    },
    config_checkboxes = {
        gale_burst_selected = true,
        strike_of_the_windlord_selected = true,
    },
    simc_mapping = { -- simc_name = "equivalent_parsed_ingame_table_name"
        invoke_xuen = "invoke_xuen_the_white_tiger",
    },
})
