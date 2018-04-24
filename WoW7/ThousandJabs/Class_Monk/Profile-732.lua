--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Legion only.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(4, GetBuildInfo()) >= 80000 then
    return
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(2, UnitClass('player')) ~= 'MONK' then return end

local addonName, internal = ...
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Config = TJ:GetModule('Config')

if not Core:MatchesBuild('7.3.2', '7.3.9') then return end

local mmin = math.min

------------------------------------------------------------------------------------------------------------------------
-- Brewmaster profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local brewmaster_abilities_exported = {
    black_ox_brew = { SpellIDs = { 115399 }, TalentID = 22097, },
    blackout_combo = { TalentID = 22104, },
    blackout_strike = { SpellIDs = { 205523 }, },
    breath_of_fire = { SpellIDs = { 115181 }, },
    brewmasters_balance = { SpellIDs = { 245013 }, },
    celerity = { TalentID = 19302, },
    chi_burst = { SpellIDs = { 123986 }, TalentID = 19823, },
    chi_torpedo = { SpellIDs = { 115008 }, TalentID = 19304, },
    chi_wave = { SpellIDs = { 115098 }, TalentID = 20185, },
    crackling_jade_lightning = { SpellIDs = { 117952 }, },
    dampen_harm = { SpellIDs = { 122278 }, TalentID = 20175, },
    detox = { SpellIDs = { 218164 }, },
    effuse = { SpellIDs = { 116694 }, },
    elusive_dance = { TalentID = 22106, },
    expel_harm = { SpellIDs = { 115072 }, },
    exploding_keg = { SpellIDs = { 214326 }, },
    eye_of_the_tiger = { TalentID = 22091, },
    fortifying_brew = { SpellIDs = { 115203 }, },
    gift_of_the_mists = { TalentID = 22096, },
    gift_of_the_ox = { SpellIDs = { 124502 }, },
    healing_elixir = { SpellIDs = { 122281 }, TalentID = 20174, },
    high_tolerance = { TalentID = 22108, },
    invoke_niuzao_the_black_ox = { SpellIDs = { 132578 }, TalentID = 22101, },
    ironskin_brew = { SpellIDs = { 115308 }, },
    keg_smash = { SpellIDs = { 121253 }, },
    leg_sweep = { SpellIDs = { 119381 }, TalentID = 19995, },
    light_brewing = { TalentID = 22098, },
    mastery_elusive_brawler = { SpellIDs = { 117906 }, },
    mystic_vitality = { TalentID = 22917, },
    paralysis = { SpellIDs = { 115078 }, },
    provoke = { SpellIDs = { 115546 }, },
    purifying_brew = { SpellIDs = { 119582 }, },
    resuscitate = { SpellIDs = { 115178 }, },
    ring_of_peace = { SpellIDs = { 116844 }, TalentID = 19993, },
    roll = { SpellIDs = { 109132 }, },
    rushing_jade_wind = { SpellIDs = { 116847 }, TalentID = 19819, },
    spear_hand_strike = { SpellIDs = { 116705 }, },
    special_delivery = { TalentID = 22102, },
    stagger = { SpellIDs = { 115069 }, },
    summon_black_ox_statue = { SpellIDs = { 115315 }, TalentID = 19994, },
    tiger_palm = { SpellIDs = { 100780 }, },
    tigers_lust = { SpellIDs = { 116841 }, TalentID = 19818, },
    transcendence = { SpellIDs = { 101643 }, },
    transcendence_transfer = { SpellIDs = { 119996 }, },
    zen_meditation = { SpellIDs = { 115176 }, },
}

local brewmaster_base_overrides = {
    spear_hand_strike = {
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
    tiger_palm = {
        PerformCast = function(spell, env)
            -- Extend Eye of the Tiger
            if env.eye_of_the_tiger.talent_enabled then
                env.eye_of_the_tiger.expirationTime = env.currentTime + 8
            end

            -- Remove Blackout Combo
            if env.blackout_combo.talent_enabled then
                env.blackout_combo.expirationTime = 0
            end
        end
    },
    breath_of_fire = {
        PerformCast = function(spell, env)
            -- Remove Blackout Combo
            if env.blackout_combo.talent_enabled then
                env.blackout_combo.expirationTime = 0
            end
        end
    },
    keg_smash = {
        AuraID = 121253,
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'keg_smash',
        AuraApplyLength = 15,
        PerformCast = function(spell, env)
            -- Remove Blackout Combo
            if env.blackout_combo.talent_enabled then
                env.blackout_combo.expirationTime = 0
            end
        end
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

            -- Remove Blackout Combo
            if env.blackout_combo.talent_enabled then
                env.blackout_combo.expirationTime = 0
            end
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

            -- Remove Blackout Combo
            if env.blackout_combo.talent_enabled then
                env.blackout_combo.expirationTime = 0
            end

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
    name = 'Brewmaster',
    class_id = 10,
    spec_id = 1,
    default_action_profile = 'custom::monk::brewmaster',
    resources = { 'energy', 'energy_per_time' },
    actions = {
        brewmaster_abilities_exported,
        brewmaster_base_overrides,
        brewmaster_talent_overrides,
    },
    blacklisted = {
        'gift_of_the_ox',
        'greater_gift_of_the_ox',
    },
})

------------------------------------------------------------------------------------------------------------------------
-- Windwalker profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local windwalker_abilities_exported = {
    afterlife = { SpellIDs = { 116092 }, },
    ascension = { TalentID = 19771, },
    blackout_kick = { SpellIDs = { 100784 }, },
    celerity = { TalentID = 19302, },
    chi_burst = { SpellIDs = { 123986 }, TalentID = 19823, },
    chi_orbit = { TalentID = 22107, },
    chi_torpedo = { SpellIDs = { 115008 }, TalentID = 19304, },
    chi_wave = { SpellIDs = { 115098 }, TalentID = 20185, },
    crackling_jade_lightning = { SpellIDs = { 117952 }, },
    dampen_harm = { SpellIDs = { 122278 }, TalentID = 20175, },
    detox = { SpellIDs = { 218164 }, },
    diffuse_magic = { SpellIDs = { 122783 }, TalentID = 20173, },
    disable = { SpellIDs = { 116095 }, },
    effuse = { SpellIDs = { 116694 }, },
    energizing_elixir = { SpellIDs = { 115288 }, TalentID = 22099, },
    eye_of_the_tiger = { TalentID = 22091, },
    fists_of_fury = { SpellIDs = { 113656 }, },
    flying_serpent_kick = { SpellIDs = { 101545 }, },
    healing_elixir = { SpellIDs = { 122281 }, TalentID = 20174, },
    hit_combo = { TalentID = 22103, },
    invoke_xuen_the_white_tiger = { SpellIDs = { 123904 }, TalentID = 20184, },
    leg_sweep = { SpellIDs = { 119381 }, TalentID = 19995, },
    mastery_combo_strikes = { SpellIDs = { 115636 }, },
    paralysis = { SpellIDs = { 115078 }, },
    power_strikes = { TalentID = 19992, },
    provoke = { SpellIDs = { 115546 }, },
    resuscitate = { SpellIDs = { 115178 }, },
    ring_of_peace = { SpellIDs = { 116844 }, TalentID = 19993, },
    rising_sun_kick = { SpellIDs = { 107428 }, },
    roll = { SpellIDs = { 109132 }, },
    rushing_jade_wind = { SpellIDs = { 116847 }, TalentID = 19819, },
    serenity = { SpellIDs = { 152173 }, TalentID = 21191, },
    spear_hand_strike = { SpellIDs = { 116705 }, },
    spinning_crane_kick = { SpellIDs = { 101546 }, },
    storm_earth_and_fire = { SpellIDs = { 137639 }, },
    strike_of_the_windlord = { SpellIDs = { 205320 }, },
    summon_black_ox_statue = { SpellIDs = { 115315 }, TalentID = 22100, },
    tiger_palm = { SpellIDs = { 100780 }, },
    tigers_lust = { SpellIDs = { 116841 }, TalentID = 19818, },
    touch_of_death = { SpellIDs = { 115080 }, },
    touch_of_karma = { SpellIDs = { 122470 }, },
    transcendence = { SpellIDs = { 101643 }, },
    transcendence_transfer = { SpellIDs = { 119996 }, },
    whirling_dragon_punch = { SpellIDs = { 152175 }, TalentID = 22105, },
}

local windwalker_base_overrides = {
    spear_hand_strike = {
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
    touch_of_death = {
        AuraID = 115080,
        AuraMine = true,
        AuraUnit = 'target',
        AuraApplied = 'touch_of_death',
        AuraApplyLength = 8,
        CanCast = function(spell, env)
            return spell.aura_down and true or false
        end,
        PerformCast = function(spell, env)
        end,
    },
    touch_of_karma = {
        spell_cast_time = 0.01, -- off GCD!
    },
    tiger_palm = {
        PerformCast = function(spell, env)
            env.chi.gained = env.chi.gained + 2
            if env.power_strikes.aura_react then
                env.chi.gained = env.chi.gained + 1
            end
        end,
    },
    blackout_kick = {
        cost_type = 'chi',
        chi_cost = function(spell, env) return env.serenity.aura_up and 0 or 1 end,
        PerformCast = function(spell, env)
            if env.bok_proc.aura_react then
                if env.set_bonus.tier21_2pc then
                    env.chi.gained = env.chi.gained + mmin(1, env.chi.deficit)
                end
                env.bok_proc.expirationTime = 0 -- remove the buff
            end
        end,
    },
    fists_of_fury = {
        cost_type = 'chi',
        chi_cost = function(spell, env) return env.serenity.aura_up and 0 or 3 end,
        spell_cast_time = function(spell,env) return env.playerHasteMultiplier * 4 end, -- seems like we can't detect this...
    },
    energizing_elixir = {
        PerformCast = function(spell, env)
            env.chi.gained = env.chi.gained + (env.chi.max - env.chi.curr)
            env.energy.gained = env.energy.gained + (env.energy.max - env.energy.curr)
        end,
        spell_cast_time = 0.01, -- off GCD!
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

        spell_cast_time = 0.01, -- off GCD!
    },
    bok_proc = {
        AuraID = 116768,
        AuraMine = true,
        AuraUnit = 'player',
    },
    spinning_crane_kick = {
        cost_type = 'chi',
        chi_cost = function(spell, env) return env.serenity.aura_up and 0 or 3 end,
        count = function(spell, env)
            return env.active_enemies
        end
    },
    rising_sun_kick = {
        cost_type = 'chi',
        chi_cost = function(spell, env) return env.serenity.aura_up and 0 or 2 end,
    },
}

local windwalker_talent_overrides = {
    serenity = {
        AuraID = 152173,
        AuraMine = true,
        AuraUnit = 'player',
        AuraApplied = 'serenity',
        AuraApplyLength = 8,
        spell_cast_time = 0.01, -- off GCD!
    },
    whirling_dragon_punch = {
        CanCast = function(spell, env)
            return (env.fists_of_fury.cooldown_remains > 0) and (env.rising_sun_kick.cooldown_remains > 0)
        end,
    },
    power_strikes = {
        AuraID = 129914,
        AuraUnit = 'player',
        AuraMine = true,
    },
    healing_elixir = {
        spell_cast_time = 0.01, -- off GCD!
    },
    rushing_jade_wind = {
        AuraApplied = 'mark_of_the_crane',
        AuraApplyLength = 14,
    },
    mark_of_the_crane = { -- from RJW
        AuraID = 228287,
        AuraUnit = 'target',
        AuraMine = true,
    }
}

local windwalker_artifact_overrides = {
    gale_burst = {
        artifact_enabled = function(spell,env) return Config:GetSpec("gale_burst_selected") end,
    },
    strike_of_the_windlord = {
        cost_type = 'chi',
        chi_cost = function(spell, env) return env.serenity.aura_up and 0 or 2 end,
        artifact_enabled = function(spell,env) return Config:GetSpec("strike_of_the_windlord_selected") end,
    },
}

local windwalker_legendaries = {
    the_emperors_capacitor = {
        AuraID = 235053,
        AuraUnit = 'player',
        AuraMine = true,
    }
}

local windwalker_tiersets = {
    pressure_point = {
        AuraID = { 246331, 247255 },
        AuraUnit = 'player',
        AuraMine = true,
    }
}

local lastSerenityState
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
        OnStateInit = function(env)
            -- Dodgy shit for when serenity changes costs
            if lastSerenityState ~= env.serenity.aura_up then
                lastSerenityState = env.serenity.aura_up
                TJ:QueueProfileReload(true)
            end
        end,
    },
}

TJ:RegisterPlayerClass({
    name = 'Windwalker',
    class_id = 10,
    spec_id = 3,
    default_action_profile = 'simc::monk::windwalker',
    resources = { 'energy', 'energy_per_time', 'chi' },
    actions = {
        windwalker_abilities_exported,
        windwalker_base_overrides,
        windwalker_talent_overrides,
        windwalker_artifact_overrides,
        windwalker_legendaries,
        windwalker_tiersets,
        windwalker_hooks,
    },
    config_checkboxes = {
        gale_burst_selected = false,
        strike_of_the_windlord_selected = false,
    },
    simc_mapping = { -- simc_name = "equivalent_parsed_ingame_table_name"
        invoke_xuen = "invoke_xuen_the_white_tiger",
    },
})
