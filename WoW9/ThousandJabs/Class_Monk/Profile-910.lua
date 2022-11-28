--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Shadowlands only.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if GetBuildInfo and (select(4, GetBuildInfo()) < 90000 or select(4, GetBuildInfo()) >= 100000) then
	return
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(2, UnitClass("player")) ~= "MONK" then
	return
end

local addonName, internal = ...
local TJ = LibStub("AceAddon-3.0"):GetAddon("ThousandJabs")
local Core = TJ:GetModule("Core")
local Config = TJ:GetModule("Config")

if not Core:MatchesBuild("9.1.0", "9.1.9") then
	return
end

local mmax = math.max
local mmin = math.min
local mfloor = math.floor

------------------------------------------------------------------------------------------------------------------------
-- Common profile definition
------------------------------------------------------------------------------------------------------------------------

-- Runeforges
local runeforging_overrides = {
	charred_passions = {
		runeforge_equipped = false -- TODO
	},
	fatal_touch = {
		runeforge_equipped = false -- TODO
	},
	recently_rushing_tiger_palm = {
		runeforge_equipped = false, -- TODO
		AuraID = {337341},
		AuraUnit = "player",
		AuraMine = true
	}
}

-- Covenants
local covenant_overrides = {
	weapons_of_order = {
		-- Kyrian
		SpellIDs = {310454},
		AuraID = {310454},
		AuraUnit = "player",
		AuraMine = true
	},
	fallen_order = {
		-- Venthyr
		SpellIDs = {326860} -- TODO, add aura IDs
	},
	bonedust_brew = {
		-- Necrolord
		SpellIDs = {325216} -- TODO, add aura IDs
	},
	faeline_stomp = {
		-- Night Fae
		SpellIDs = {327104} -- TODO, add aura IDs
	}
}

-- Aliases
covenant_overrides.weapons_of_order_ww = covenant_overrides.weapons_of_order

-- Conduits
-- exported with /tj _esd
local monk_conduits_exported = {
	calculated_strikes = {ConduitID = 19},
	celestial_effervescence = {ConduitID = 47},
	coordinated_offensive = {ConduitID = 22},
	dizzying_tumble = {ConduitID = 37},
	evasive_stride = {ConduitID = 56},
	fortifying_ingredients = {ConduitID = 33},
	grounding_breath = {ConduitID = 25},
	harm_denial = {ConduitID = 15},
	inner_fury = {ConduitID = 16},
	jade_bond = {ConduitID = 28},
	lingering_numbness = {ConduitID = 35},
	nourishing_chi = {ConduitID = 54},
	resplendent_mist = {ConduitID = 31},
	rising_sun_revival = {ConduitID = 44},
	scalding_brew = {ConduitID = 46},
	strike_with_clarity = {ConduitID = 59},
	swift_transference = {ConduitID = 41},
	tumbling_technique = {ConduitID = 42},
	walk_with_the_ox = {ConduitID = 57},
	xuens_bond = {ConduitID = 24}
}

-- Legendaries
local legendary_overrides = {
	chi_energy = {
		AuraID = {337571},
		AuraUnit = "player",
		AuraMine = true
	},
	the_emperors_capacitor = {
		AuraID = {337291},
		AuraUnit = "player",
		AuraMine = true
	}
}

------------------------------------------------------------------------------------------------------------------------
-- Windwalker profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local windwalker_abilities_exported = {
	afterlife = {SpellIDs = {116092}},
	ascension = {TalentID = 22098},
	blackout_kick = {SpellIDs = {100784}},
	celerity = {TalentID = 19304},
	chi_burst = {SpellIDs = {123986}, TalentID = 20185},
	chi_torpedo = {SpellIDs = {115008}, TalentID = 19818},
	chi_wave = {SpellIDs = {115098}, TalentID = 19820},
	crackling_jade_lightning = {SpellIDs = {117952}},
	dampen_harm = {SpellIDs = {122278}, TalentID = 20175},
	dance_of_chiji = {TalentID = 22102},
	detox = {SpellIDs = {218164}},
	diffuse_magic = {SpellIDs = {122783}, TalentID = 20173},
	disable = {SpellIDs = {116095}},
	energizing_elixir = {SpellIDs = {115288}, TalentID = 22096},
	expel_harm = {SpellIDs = {322101}},
	eye_of_the_tiger = {TalentID = 23106},
	fist_of_the_white_tiger = {SpellIDs = {261947}, TalentID = 19771},
	fists_of_fury = {SpellIDs = {113656}},
	flying_serpent_kick = {SpellIDs = {101545}},
	fortifying_brew = {SpellIDs = {243435}},
	good_karma = {TalentID = 23364},
	hit_combo = {TalentID = 22093},
	inner_strength = {TalentID = 23258},
	invoke_xuen_the_white_tiger = {SpellIDs = {123904}},
	leg_sweep = {SpellIDs = {119381}},
	mastery_combo_strikes = {SpellIDs = {115636}},
	mystic_touch = {SpellIDs = {8647}},
	paralysis = {SpellIDs = {115078}},
	provoke = {SpellIDs = {115546}},
	resuscitate = {SpellIDs = {115178}},
	ring_of_peace = {SpellIDs = {116844}, TalentID = 19995},
	rising_sun_kick = {SpellIDs = {107428}},
	roll = {SpellIDs = {109132}},
	rushing_jade_wind = {SpellIDs = {116847}, TalentID = 23122},
	serenity = {SpellIDs = {152173}, TalentID = 21191},
	spear_hand_strike = {SpellIDs = {116705}},
	spinning_crane_kick = {SpellIDs = {101546}},
	spiritual_focus = {TalentID = 22107},
	storm_earth_and_fire = {SpellIDs = {137639}},
	summon_steward = {SpellIDs = {324739}},
	tiger_palm = {SpellIDs = {100780}},
	tiger_tail_sweep = {TalentID = 19993},
	tigers_lust = {SpellIDs = {116841}, TalentID = 19302},
	touch_of_death = {SpellIDs = {322109}},
	touch_of_karma = {SpellIDs = {122470}},
	transcendence = {SpellIDs = {101643}},
	transcendence_transfer = {SpellIDs = {119996}},
	vivify = {SpellIDs = {116670}},
	weapons_of_order = {SpellIDs = {310454}},
	whirling_dragon_punch = {SpellIDs = {152175}, TalentID = 22105},
	zen_flight = {SpellIDs = {125883}}
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
		end
	},
	tiger_palm = {
		PerformCast = function(spell, env)
			env.chi.gained = env.chi.gained + mmin(2, env.chi.deficit)
		end
	},
	pet = {
		xuen_the_white_tiger_active = function(spell, env)
			return env.invoke_xuen_the_white_tiger.time_since_last_cast < 24
		end
	},
	touch_of_death = {
		CanCast = function(spell, env)
			return env.target.hostile and env.target.curr_health < env.health.curr or env.health.target_percent < 15
		end
	},
	bok_proc = {
		AuraID = {116768},
		AuraUnit = "player",
		AuraMine = true
	},
	storm_earth_and_fire = {
		Icon = 136038, -- When we cast this, it changes to the "return to player" icon... hard-setting it here prevents that.
		CanCast = function(spell, env)
			return spell.time_since_last_cast > (15 - env.gcd)
		end
	},
	storm_earth_and_fire_fixate = {
		Icon = 236188,
		SpellIDs = windwalker_abilities_exported.storm_earth_and_fire.SpellIDs,
		CanCast = function(spell, env)
			return env.storm_earth_and_fire.time_since_last_cast < 15
		end
	}
}

local windwalker_talent_overrides = {
	combo_strike = {},
	hit_combo = {
		AuraID = {196741},
		AuraUnit = "player",
		AuraMine = true
	},
	whirling_dragon_punch = {
		CanCast = function(spell, env)
			return env.fists_of_fury.cooldown_down and env.rising_sun_kick.cooldown_down
		end
	}
}

local windwalker_hooks = {
	hooks = {
		OnStateInit = function(env) --
			--[[
            Combo Strike has a special lua table -- instead of using the safety check which logs unknown accesses,
            we need to query the sim state to see whether the last cast matches the ability in question.
            Override the metatable and use it as a way to check if the last cast matched, returning accordingly.
            ]] setmetatable(
				env.combo_strike,
				{
					__index = function(tbl, index)
						local state = getmetatable(env).__state
						if #state.castQueue == 0 then
							return true
						end
						return (tostring(index) ~= state.castQueue[#state.castQueue].ability) and true or false
					end
				}
			)
		end,
		OnPredictActionAtOffset = function(env)
			local state = getmetatable(env).__state
			for k, v in Core:OrderedPairs(state.castQueue) do
				Core:Debug("|cFFFF6600%30s | %12.3f | %8.3f|r", v.ability, v.time, v.time - GetTime())
			end
		end
	}
}

TJ:RegisterPlayerClass(
	{
		name = "Windwalker",
		class_id = 10,
		spec_id = 3,
		default_action_profile = "simc::monk::windwalker",
		resources = {"energy", "energy_per_time", "chi"},
		actions = {
			runeforging_overrides,
			covenant_overrides,
			legendary_overrides,
			monk_conduits_exported,
			windwalker_abilities_exported,
			windwalker_base_overrides,
			windwalker_talent_overrides,
			windwalker_hooks
		},
		blacklisted = {
			"flying_serpent_kick"
		},
		config_checkboxes = {},
		conditional_substitutions_pre = {
			{"combo_strike", "combo_strike.THIS_SPELL"}
		}
	}
)

------------------------------------------------------------------------------------------------------------------------
-- Brewmaster profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local brewmaster_abilities_exported = {
	black_ox_brew = {SpellIDs = {115399}, TalentID = 19992},
	blackout_combo = {TalentID = 22108},
	blackout_kick = {SpellIDs = {205523}},
	bob_and_weave = {TalentID = 20174},
	breath_of_fire = {SpellIDs = {115181}},
	celerity = {TalentID = 19304},
	celestial_brew = {SpellIDs = {322507}},
	celestial_flames = {TalentID = 22104},
	chi_burst = {SpellIDs = {123986}, TalentID = 20185},
	chi_torpedo = {SpellIDs = {115008}, TalentID = 19818},
	chi_wave = {SpellIDs = {115098}, TalentID = 19820},
	crackling_jade_lightning = {SpellIDs = {117952}},
	dampen_harm = {SpellIDs = {122278}, TalentID = 20175},
	detox = {SpellIDs = {218164}},
	expel_harm = {SpellIDs = {322101}},
	exploding_keg = {SpellIDs = {325153}, TalentID = 22103},
	eye_of_the_tiger = {TalentID = 23106},
	fortifying_brew = {SpellIDs = {115203}},
	gift_of_the_ox = {SpellIDs = {124502}},
	healing_elixir = {SpellIDs = {122281}, TalentID = 23363},
	high_tolerance = {TalentID = 22106},
	invoke_niuzao_the_black_ox = {SpellIDs = {132578}},
	keg_smash = {SpellIDs = {121253}},
	leg_sweep = {SpellIDs = {119381}},
	light_brewing = {TalentID = 22099},
	mystic_touch = {SpellIDs = {8647}},
	paralysis = {SpellIDs = {115078}},
	provoke = {SpellIDs = {115546}},
	purifying_brew = {SpellIDs = {119582}},
	resuscitate = {SpellIDs = {115178}},
	ring_of_peace = {SpellIDs = {116844}, TalentID = 19995},
	roll = {SpellIDs = {109132}},
	rushing_jade_wind = {SpellIDs = {116847}, TalentID = 20184},
	shuffle = {SpellIDs = {322120}},
	spear_hand_strike = {SpellIDs = {116705}},
	special_delivery = {TalentID = 19819},
	spinning_crane_kick = {SpellIDs = {322729}},
	spitfire = {TalentID = 22097},
	stagger = {SpellIDs = {115069}},
	summon_black_ox_statue = {SpellIDs = {115315}, TalentID = 19994},
	tiger_palm = {SpellIDs = {100780}},
	tiger_tail_sweep = {TalentID = 19993},
	tigers_lust = {SpellIDs = {116841}, TalentID = 19302},
	touch_of_death = {SpellIDs = {322109}},
	transcendence = {SpellIDs = {101643}},
	transcendence_transfer = {SpellIDs = {119996}},
	vivify = {SpellIDs = {116670}},
	zen_flight = {SpellIDs = {125883}},
	zen_meditation = {SpellIDs = {115176}}
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
		end
	},
	invoke_niuzao_the_black_ox = {
		CanCast = function(spell, env)
			return env.target.hostile
		end
	},
	touch_of_death = {
		CanCast = function(spell, env)
			return env.target.hostile and env.target.curr_health < env.health.curr or env.health.target_percent < 15
		end
	},
	purifying_brew = {
		CanCast = function(spell, env)
			return env.stagger.total_damage_staggered > (env.health.max * 0.03) -- Skip stagger that's too small.
		end,
		PerformCast = function(spell, env)
			-- Swap stagger urgency to be down one level, to approximate purification (heavy->moderate, moderate->light)
			if env.stagger.heavy then
				env.stagger_moderate.expirationTime = env.stagger_heavy.expirationTime
				env.stagger_heavy.expirationTime = 0
			elseif env.stagger.moderate then
				env.stagger_light.expirationTime = env.stagger_moderate.expirationTime
				env.stagger_moderate.expirationTime = 0
			end
		end
	},
	elusive_brawler = {
		AuraID = 195630,
		AuraUnit = "player",
		AuraMine = true
	},
	keg_smash = {
		AuraID = 121253,
		AuraUnit = "target",
		AuraMine = true,
		AuraApplied = "keg_smash",
		AuraApplyLength = 15
	},
	breath_of_fire = {
		AuraApplied = "breath_of_fire_dot",
		AuraApplyLength = 12
	},
	breath_of_fire_dot = {
		AuraID = 123725,
		AuraUnit = "target",
		AuraMine = true,
		aura_refreshable = function(spell, env)
			return spell.aura_remains < (env.breath_of_fire.AuraApplyLength / 2) and true or false -- Half of the dot in order to deal with time extension
		end
	},
	expel_harm = {
		PerformCast = function(spell, env)
			env.health.gained = env.health.gained + (env.health.max * 0.05)
		end
	},
	healing_elixir = {
		PerformCast = function(spell, env)
			env.health.gained = env.health.gained + (env.health.max * 0.2)
		end
	}
}

local brewmaster_talent_overrides = {
	diffuse_magic = {
		-- No longer Brewmaster ability?
		AuraID = 122783,
		AuraMine = true,
		AuraUnit = "player",
		AuraApplied = "diffuse_magic",
		AuraApplyLength = 6
	}
}

local brewmaster_stagger_overrides = {
	stagger = {
		any = function(spell, env)
			return spell.light or spell.moderate or spell.heavy or false
		end,
		light = function(spell, env)
			return (env.stagger_light.aura_remains > 0) and true or false
		end,
		moderate = function(spell, env)
			return (env.stagger_moderate.aura_remains > 0) and true or false
		end,
		heavy = function(spell, env)
			return (env.stagger_heavy.aura_remains > 0) and true or false
		end,
		total_damage_staggered = function(spell, env)
			return UnitStagger("player") or 0
		end,
		ticks_remain = function(spell, env)
			return mfloor(spell.aura_remains * 2) -- every 0.5 secs, so double the
		end,
		damage_per_tick = function(spell, env)
			local ticks = spell.ticks_remain
			if ticks <= 0 then
				return 0
			end
			return spell.total_damage_staggered / ticks
		end,
		aura_remains = function(spell, env)
			return spell.heavy and env.stagger_heavy.aura_remains or spell.moderate and env.stagger_moderate.aura_remains or
				spell.light and env.stagger_light.aura_remains or
				0
		end
	},
	stagger_light = {
		AuraID = 124275,
		AuraUnit = "player",
		AuraMine = true
	},
	stagger_moderate = {
		AuraID = 124274,
		AuraUnit = "player",
		AuraMine = true
	},
	stagger_heavy = {
		AuraID = 124273,
		AuraUnit = "player",
		AuraMine = true
	}
}

-- Stagger tick damage accumulator
for i = 1, 20 do
	brewmaster_stagger_overrides.stagger["last_tick_damage_" .. i] = function(spell, env)
		return spell.damage_per_tick * i
	end
end

TJ:RegisterPlayerClass(
	{
		name = "Brewmaster",
		class_id = 10,
		spec_id = 1,
		default_action_profile = "simc::monk::brewmaster",
		resources = {"energy", "energy_per_time", "chi"},
		actions = {
			runeforging_overrides,
			covenant_overrides,
			legendary_overrides,
			monk_conduits_exported,
			brewmaster_abilities_exported,
			brewmaster_base_overrides,
			brewmaster_talent_overrides,
			brewmaster_stagger_overrides
		},
		blacklisted = {
			"gift_of_the_ox"
		},
		config_checkboxes = {},
		conditional_substitutions_post = {}
	}
)
