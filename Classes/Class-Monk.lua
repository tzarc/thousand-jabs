local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Config = TJ:GetModule('Config')

------------------------------------------------------------------------------------------------------------------------
-- Brewmaster profile definition
------------------------------------------------------------------------------------------------------------------------

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
}

local brewmaster_base_overrides = {
    tiger_palm = {
        PerformCast = function(spell, env)
            if env.eye_of_the_tiger.talent_enabled then
                env.eye_of_the_tiger.expirationTime = env.currentTime + 8
            end
        end
    },
    keg_smash = {
        AuraID = 121253,
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'keg_smash',
        AuraApplyLength = 15,
    },
    blackout_strike = {
        AuraApplied = 'blackout_combo',
        AuraApplyLength = 14,
    },
    ironskin_brew = {
        AuraID = 215479,
        AuraUnit = 'player',
        AuraMine = true,
        AuraApplied = 'ironskin_brew',
        AuraApplyLength = 6,

        PerformCast = function(spell,env)
            -- Need to also decrement the number of charges for Purifying Brew
            env.purifying_brew.rechargeSpent = env.purifying_brew.rechargeSpent+1
        end,
    },
    expel_harm = {
        ChargesUseSpellCount = true,
        PerformCast = function(spell, env)
            spell.rechargeSpent = spell.rechargeSpent + spell.spell_charges
        end,
    },
    purifying_brew = {
        PerformCast = function(spell,env)
            -- Need to also decrement the number of charges for Ironskin Brew
            env.ironskin_brew.rechargeSpent = env.ironskin_brew.rechargeSpent+1

            -- Swap stagger urgency to be down one level, to approximate purification (heavy->moderate, moderate->light)
            if env.stagger_heavy.aura_up then
                env.stagger_moderate.expirationTime = env.stagger_heavy.expirationTime
                env.stagger_heavy.expirationTime = 0
            elseif env.stagger_moderate.aura_up then
                env.stagger_light.expirationTime = env.stagger_moderate.expirationTime
                env.stagger_moderate.expirationTime = 0
            end
        end,
    },
    stagger = {
        any = function(spell, env) return spell.light or spell.moderate or spell.heavy or false end,
        light = function(spell, env) return (env.stagger_light.aura_remains > 0) and true or false end,
        moderate = function(spell, env) return (env.stagger_moderate.aura_remains > 0) and true or false end,
        heavy = function(spell, env) return (env.stagger_heavy.aura_remains > 0) and true or false end,
    },
    stagger_light = {
        AuraID = 124275,
        AuraUnit = 'player',
        AuraMine = true,
    },
    stagger_moderate = {
        AuraID = 124274,
        AuraUnit = 'player',
        AuraMine = true,
    },
    stagger_heavy = {
        AuraID = 124273,
        AuraUnit = 'player',
        AuraMine = true,
    },
}

local brewmaster_talent_overrides = {
    blackout_combo = {
        AuraID = 228563,
        AuraMine = true,
        AuraUnit = 'player',
    },
    eye_of_the_tiger = {
        AuraID = 196608,
        AuraUnit = 'player',
        AuraMine = true,
    },
}

TJ:RegisterPlayerClass({
    betaProfile = true,
    name = 'Brewmaster',
    class_id = 10,
    spec_id = 1,
    action_profile = 'custom::monk::brewmaster',
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
            return (not env.serenity.talent_enabled) and (not spell.aura_react)
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
        artifact_enabled = function(spell,env) return Config:GetSpec("gale_burst_selected") end,
    },
    strike_of_the_windlord = {
        artifact_enabled = function(spell,env) return Config:GetSpec("strike_of_the_windlord_selected") end,
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

TJ:RegisterPlayerClass({
    name = 'Windwalker',
    class_id = 10,
    spec_id = 3,
    action_profile = 'legion-dev::monk::windwalker',
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
