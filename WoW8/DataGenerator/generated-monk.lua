----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BfA only.
----------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(4, GetBuildInfo()) < 80000 then
    return
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Class check
----------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(3, UnitClass('player')) ~= 10 then return end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
local addonName, TJ = ...
TJ.ClassData = TJ.ClassData or {}
TJ.ClassData[10] = TJ.ClassData[10] or {}
local classData = TJ.ClassData[10]
classData.spells = classData.spells or {}

classData.spells[674] = {
  spellID = 674,
  name = "Dual Wield",
  slug = "dual_wield",
}

classData.spells[2649] = {
  spellID = 2649,
  name = "Growl",
  slug = "growl",
  max_range = 30,
  cooldown = 8.0,
  duration = 3.0,
}

classData.spells[8647] = {
  spellID = 8647,
  name = "Mystic Touch",
  slug = "mystic_touch",
}

classData.spells[8875] = {
  spellID = 8875,
  name = "Pet Damage",
  slug = "pet_damage",
}

classData.spells[19577] = {
  spellID = 19577,
  name = "Intimidation",
  slug = "intimidation",
  max_range = 100,
  initial_stacks = 1,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 15.0,
}

classData.spells[19581] = {
  spellID = 19581,
  name = "Pet Health",
  slug = "pet_health",
}

classData.spells[20591] = {
  spellID = 20591,
  name = "Expansive Mind",
  slug = "expansive_mind",
}

classData.spells[21563] = {
  spellID = 21563,
  name = "Command",
  slug = "command",
}

classData.spells[24394] = {
  spellID = 24394,
  name = "Intimidation",
  slug = "intimidation",
  max_range = 100,
  duration = 5.0,
}

classData.spells[28880] = {
  spellID = 28880,
  name = "Gift of the Naaru",
  slug = "gift_of_the_naaru",
  max_range = 40,
  cooldown = 180.0,
  duration = 5.0,
  haste_affected_ticks = true,
}

classData.spells[33697] = {
  spellID = 33697,
  name = "Blood Fury",
  slug = "blood_fury",
  cooldown = 120.0,
  duration = 15.0,
}

classData.spells[34902] = {
  spellID = 34902,
  name = "Hunter Pet",
  slug = "hunter_pet",
}

classData.spells[61684] = {
  spellID = 61684,
  name = "Dash",
  slug = "dash",
  cooldown = 20.0,
  duration = 10.0,
}

classData.spells[65220] = {
  spellID = 65220,
  name = "Avoidance",
  slug = "avoidance",
}

classData.spells[88680] = {
  spellID = 88680,
  name = "Kindred Spirits",
  slug = "kindred_spirits",
}

classData.spells[100780] = {
  spellID = 100780,
  name = "Tiger Palm",
  slug = "tiger_palm",
  max_range = 5,
  gcd = 1.5,
  power = {
    [1] = { resource = "energy", amount = 50, aura = 137023, },
    [2] = { resource = "energy", amount = 50, aura = 137025, },
  },
}

classData.spells[100784] = {
  spellID = 100784,
  name = "Blackout Kick",
  slug = "blackout_kick",
  max_range = 5,
  gcd = 1.5,
  cooldown = 3.0,
  power = {
    [1] = { resource = "chi", amount = 3, aura = 137025, },
  },
}

classData.spells[101545] = {
  spellID = 101545,
  name = "Flying Serpent Kick",
  slug = "flying_serpent_kick",
  charges = 1,
  charge_cooldown = 25.0,
  gcd = 1.0,
  cooldown = 25.0,
  duration = 2.0,
}

classData.spells[101546] = {
  spellID = 101546,
  name = "Spinning Crane Kick",
  slug = "spinning_crane_kick",
  gcd = 1.5,
  duration = 1.5,
  channeled = true,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "chi", amount = 2, aura = 137025, },
    [2] = { resource = "mana", amount = 0, aura = 137024, },
    [3] = { resource = "chi", amount = 3, aura = 137023, },
  },
}

classData.spells[101643] = {
  spellID = 101643,
  name = "Transcendence",
  slug = "transcendence",
  gcd = 1.5,
  cooldown = 10.0,
  duration = 900.0,
}

classData.spells[103985] = {
  spellID = 103985,
  name = "Stance of the Fierce Tiger",
  slug = "stance_of_the_fierce_tiger",
}

classData.spells[107270] = {
  spellID = 107270,
  name = "Spinning Crane Kick",
  slug = "spinning_crane_kick",
}

classData.spells[107428] = {
  spellID = 107428,
  name = "Rising Sun Kick",
  slug = "rising_sun_kick",
  max_range = 5,
  charges = 1,
  charge_cooldown = 10.0,
  gcd = 1.5,
  power = {
    [1] = { resource = "chi", amount = 2, aura = 137025, },
    [2] = { resource = "mana", amount = 0, aura = 137024, },
  },
}

classData.spells[107500] = {
  spellID = 107500,
  name = "<DND> Monk Energy Driver",
  slug = "dnd_monk_energy_driver",
}

classData.spells[109132] = {
  spellID = 109132,
  name = "Roll",
  slug = "roll",
  charges = 2,
  charge_cooldown = 20.0,
  cooldown = 0.8,
}

classData.spells[113656] = {
  spellID = 113656,
  name = "Fists of Fury",
  slug = "fists_of_fury",
  max_range = 8,
  gcd = 1.0,
  cooldown = 24.0,
  duration = 4.0,
  channeled = true,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "chi", amount = 3, },
  },
}

classData.spells[113746] = {
  spellID = 113746,
  name = "Mystic Touch",
  slug = "mystic_touch",
  max_range = 50000,
}

classData.spells[115008] = {
  spellID = 115008,
  name = "Chi Torpedo",
  slug = "chi_torpedo",
  charges = 2,
  charge_cooldown = 20.0,
  duration = 1.1,
}

classData.spells[115057] = {
  spellID = 115057,
  name = "Flying Serpent Kick",
  slug = "flying_serpent_kick",
  duration = 0.2,
}

classData.spells[115069] = {
  spellID = 115069,
  name = "Stagger",
  slug = "stagger",
  gcd = 1.0,
}

classData.spells[115072] = {
  spellID = 115072,
  name = "Expel Harm",
  slug = "expel_harm",
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 15, },
  },
}

classData.spells[115078] = {
  spellID = 115078,
  name = "Paralysis",
  slug = "paralysis",
  max_range = 20,
  initial_stacks = 1,
  gcd = 1.5,
  cooldown = 45.0,
  duration = 60.0,
  power = {
    [1] = { resource = "mana", amount = 0, aura = 115070, },
    [2] = { resource = "energy", amount = 20, aura = 115069, },
    [3] = { resource = "energy", amount = 20, aura = 103985, },
    [4] = { resource = "mana", amount = 0, aura = 154436, },
  },
}

classData.spells[115080] = {
  spellID = 115080,
  name = "Touch of Death",
  slug = "touch_of_death",
  max_range = 5,
  gcd = 1.5,
  cooldown = 120.0,
  duration = 8.0,
}

classData.spells[115098] = {
  spellID = 115098,
  name = "Chi Wave",
  slug = "chi_wave",
  max_range = 40,
  gcd = 1.5,
  cooldown = 15.0,
}

classData.spells[115151] = {
  spellID = 115151,
  name = "Renewing Mist",
  slug = "renewing_mist",
  max_range = 40,
  gcd = 1.5,
  cooldown = 8.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[115173] = {
  spellID = 115173,
  name = "Celerity",
  slug = "celerity",
}

classData.spells[115175] = {
  spellID = 115175,
  name = "Soothing Mist",
  slug = "soothing_mist",
  max_range = 40,
  gcd = 1.0,
  duration = 8.0,
  channeled = true,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, per_tick = 0, },
  },
}

classData.spells[115176] = {
  spellID = 115176,
  name = "Zen Meditation",
  slug = "zen_meditation",
  initial_stacks = 1,
  cooldown = 300.0,
  duration = 8.0,
  channeled = true,
}

classData.spells[115181] = {
  spellID = 115181,
  name = "Breath of Fire",
  slug = "breath_of_fire",
  gcd = 1.0,
  cooldown = 15.0,
}

classData.spells[115203] = {
  spellID = 115203,
  name = "Fortifying Brew",
  slug = "fortifying_brew",
  cooldown = 420.0,
}

classData.spells[115288] = {
  spellID = 115288,
  name = "Energizing Elixir",
  slug = "energizing_elixir",
  max_stacks = 3,
  gcd = 1.0,
  cooldown = 60.0,
}

classData.spells[115308] = {
  spellID = 115308,
  name = "Ironskin Brew",
  slug = "ironskin_brew",
  charges = 3,
  charge_cooldown = 16.0,
  cooldown = 1.0,
}

classData.spells[115310] = {
  spellID = 115310,
  name = "Revival",
  slug = "revival",
  gcd = 1.5,
  cooldown = 180.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[115313] = {
  spellID = 115313,
  name = "Summon Jade Serpent Statue",
  slug = "summon_jade_serpent_statue",
  max_range = 40,
  gcd = 1.5,
  cooldown = 10.0,
  duration = 900.0,
}

classData.spells[115315] = {
  spellID = 115315,
  name = "Summon Black Ox Statue",
  slug = "summon_black_ox_statue",
  max_range = 40,
  gcd = 1.0,
  cooldown = 10.0,
  duration = 900.0,
}

classData.spells[115396] = {
  spellID = 115396,
  name = "Ascension",
  slug = "ascension",
}

classData.spells[115399] = {
  spellID = 115399,
  name = "Black Ox Brew",
  slug = "black_ox_brew",
  cooldown = 90.0,
}

classData.spells[115450] = {
  spellID = 115450,
  name = "Detox",
  slug = "detox",
  max_range = 40,
  charges = 1,
  charge_cooldown = 8.0,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[115546] = {
  spellID = 115546,
  name = "Provoke",
  slug = "provoke",
  max_range = 30,
  cooldown = 8.0,
}

classData.spells[115636] = {
  spellID = 115636,
  name = "Mastery: Combo Strikes",
  slug = "mastery_combo_strikes",
}

classData.spells[115804] = {
  spellID = 115804,
  name = "Mortal Wounds",
  slug = "mortal_wounds",
  max_range = 100,
  duration = 10.0,
}

classData.spells[116092] = {
  spellID = 116092,
  name = "Afterlife",
  slug = "afterlife",
  internal_cooldown = 1.0,
}

classData.spells[116095] = {
  spellID = 116095,
  name = "Disable",
  slug = "disable",
  max_range = 5,
  gcd = 1.5,
  duration = 15.0,
  power = {
    [1] = { resource = "energy", amount = 15, aura = 115069, },
    [2] = { resource = "mana", amount = 0, aura = 115070, },
    [3] = { resource = "energy", amount = 15, },
  },
}

classData.spells[116189] = {
  spellID = 116189,
  name = "Provoke",
  slug = "provoke",
  max_range = 100,
  duration = 3.0,
}

classData.spells[116645] = {
  spellID = 116645,
  name = "Teachings of the Monastery",
  slug = "teachings_of_the_monastery",
}

classData.spells[116670] = {
  spellID = 116670,
  name = "Vivify",
  slug = "vivify",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, aura = 137024, },
    [2] = { resource = "energy", amount = 30, aura = 137023, },
    [3] = { resource = "energy", amount = 30, aura = 137025, },
  },
}

classData.spells[116680] = {
  spellID = 116680,
  name = "Thunder Focus Tea",
  slug = "thunder_focus_tea",
  max_stacks = 1,
  cooldown = 30.0,
  duration = 30.0,
}

classData.spells[116705] = {
  spellID = 116705,
  name = "Spear Hand Strike",
  slug = "spear_hand_strike",
  max_range = 5,
  cooldown = 15.0,
  duration = 4.0,
}

classData.spells[116706] = {
  spellID = 116706,
  name = "Disable",
  slug = "disable",
  max_range = 100,
  max_stacks = 1,
  duration = 8.0,
}

classData.spells[116768] = {
  spellID = 116768,
  name = "Blackout Kick!",
  slug = "blackout_kick",
  initial_stacks = 1,
  duration = 15.0,
}

classData.spells[116812] = {
  spellID = 116812,
  name = "Parry",
  slug = "parry",
}

classData.spells[116841] = {
  spellID = 116841,
  name = "Tiger's Lust",
  slug = "tigers_lust",
  max_range = 20,
  gcd = 1.5,
  cooldown = 30.0,
  duration = 6.0,
}

classData.spells[116844] = {
  spellID = 116844,
  name = "Ring of Peace",
  slug = "ring_of_peace",
  max_range = 40,
  gcd = 1.5,
  cooldown = 45.0,
  duration = 8.0,
}

classData.spells[116847] = {
  spellID = 116847,
  name = "Rushing Jade Wind",
  slug = "rushing_jade_wind",
  gcd = 1.5,
  cooldown = 6.0,
  duration = 6.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "chi", amount = 1, },
  },
}

classData.spells[116849] = {
  spellID = 116849,
  name = "Life Cocoon",
  slug = "life_cocoon",
  max_range = 40,
  cooldown = 120.0,
  duration = 12.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[117418] = {
  spellID = 117418,
  name = "Fists of Fury",
  slug = "fists_of_fury",
  max_range = 8,
}

classData.spells[117906] = {
  spellID = 117906,
  name = "Mastery: Elusive Brawler",
  slug = "mastery_elusive_brawler",
}

classData.spells[117907] = {
  spellID = 117907,
  name = "Mastery: Gust of Mists",
  slug = "mastery_gust_of_mists",
}

classData.spells[117952] = {
  spellID = 117952,
  name = "Crackling Jade Lightning",
  slug = "crackling_jade_lightning",
  max_range = 40,
  gcd = 1.5,
  duration = 4.0,
  channeled = true,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "energy", amount = 20, per_tick = 20, aura = 137025, },
    [2] = { resource = "energy", amount = 20, per_tick = 20, aura = 137023, },
  },
}

classData.spells[117959] = {
  spellID = 117959,
  name = "Crackling Jade Lightning",
  slug = "crackling_jade_lightning",
}

classData.spells[118635] = {
  spellID = 118635,
  name = "Provoke",
  slug = "provoke",
  max_range = 100,
  duration = 3.0,
}

classData.spells[119085] = {
  spellID = 119085,
  name = "Chi Torpedo",
  slug = "chi_torpedo",
  max_stacks = 2,
  duration = 10.0,
}

classData.spells[119381] = {
  spellID = 119381,
  name = "Leg Sweep",
  slug = "leg_sweep",
  gcd = 1.5,
  cooldown = 60.0,
  duration = 3.0,
}

classData.spells[119582] = {
  spellID = 119582,
  name = "Purifying Brew",
  slug = "purifying_brew",
  charges = 3,
  charge_cooldown = 16.0,
  cooldown = 1.0,
}

classData.spells[119611] = {
  spellID = 119611,
  name = "Renewing Mist",
  slug = "renewing_mist",
  max_range = 50000,
  duration = 20.0,
  haste_affected_ticks = true,
}

classData.spells[119650] = {
  spellID = 119650,
  name = "Energy Usage",
  slug = "energy_usage",
}

classData.spells[119996] = {
  spellID = 119996,
  name = "Transcendence: Transfer",
  slug = "transcendence_transfer",
  max_range = 40,
  gcd = 1.5,
  cooldown = 45.0,
  duration = 1.0,
}

classData.spells[120086] = {
  spellID = 120086,
  name = "Fists of Fury",
  slug = "fists_of_fury",
  max_range = 5,
  duration = 4.0,
}

classData.spells[120224] = {
  spellID = 120224,
  name = "Leather Specialization",
  slug = "leather_specialization",
}

classData.spells[120225] = {
  spellID = 120225,
  name = "Leather Specialization",
  slug = "leather_specialization",
}

classData.spells[120227] = {
  spellID = 120227,
  name = "Leather Specialization",
  slug = "leather_specialization",
}

classData.spells[120954] = {
  spellID = 120954,
  name = "Fortifying Brew",
  slug = "fortifying_brew",
  duration = 15.0,
}

classData.spells[121093] = {
  spellID = 121093,
  name = "Gift of the Naaru",
  slug = "gift_of_the_naaru",
  max_range = 40,
  cooldown = 180.0,
  duration = 5.0,
  haste_affected_ticks = true,
}

classData.spells[121253] = {
  spellID = 121253,
  name = "Keg Smash",
  slug = "keg_smash",
  max_range = 15,
  charges = 1,
  charge_cooldown = 8.0,
  gcd = 1.0,
  cooldown = 1.0,
  duration = 15.0,
  power = {
    [1] = { resource = "energy", amount = 40, },
  },
}

classData.spells[121283] = {
  spellID = 121283,
  name = "Power Strikes",
  slug = "power_strikes",
  max_range = 50000,
}

classData.spells[121817] = {
  spellID = 121817,
  name = "Power Strikes",
  slug = "power_strikes",
}

classData.spells[122278] = {
  spellID = 122278,
  name = "Dampen Harm",
  slug = "dampen_harm",
  cooldown = 120.0,
  duration = 10.0,
}

classData.spells[122280] = {
  spellID = 122280,
  name = "Healing Elixir",
  slug = "healing_elixir",
}

classData.spells[122281] = {
  spellID = 122281,
  name = "Healing Elixir",
  slug = "healing_elixir",
  charges = 2,
  charge_cooldown = 30.0,
}

classData.spells[122470] = {
  spellID = 122470,
  name = "Touch of Karma",
  slug = "touch_of_karma",
  max_range = 20,
  cooldown = 90.0,
  duration = 10.0,
}

classData.spells[122783] = {
  spellID = 122783,
  name = "Diffuse Magic",
  slug = "diffuse_magic",
  cooldown = 90.0,
  duration = 6.0,
}

classData.spells[123154] = {
  spellID = 123154,
  name = "Fists of Fury Visual Target",
  slug = "fists_of_fury_visual_target",
  max_range = 50000,
}

classData.spells[123586] = {
  spellID = 123586,
  name = "Flying Serpent Kick",
  slug = "flying_serpent_kick",
  duration = 4.0,
}

classData.spells[123725] = {
  spellID = 123725,
  name = "Breath of Fire",
  slug = "breath_of_fire",
  max_range = 50000,
  gcd = 1.0,
  duration = 12.0,
}

classData.spells[123904] = {
  spellID = 123904,
  name = "Invoke Xuen, the White Tiger",
  slug = "invoke_xuen_the_white_tiger",
  max_range = 40,
  gcd = 1.0,
  cooldown = 120.0,
  duration = 20.0,
}

classData.spells[123986] = {
  spellID = 123986,
  name = "Chi Burst",
  slug = "chi_burst",
  max_range = 40,
  gcd = 1.5,
  cooldown = 30.0,
  duration = 1.0,
}

classData.spells[123996] = {
  spellID = 123996,
  name = "Crackling Tiger Lightning",
  slug = "crackling_tiger_lightning",
  max_range = 50000,
}

classData.spells[123999] = {
  spellID = 123999,
  name = "Crackling Tiger Lightning Driver",
  slug = "crackling_tiger_lightning_driver",
}

classData.spells[124146] = {
  spellID = 124146,
  name = "Dual Wield",
  slug = "dual_wield",
}

classData.spells[124255] = {
  spellID = 124255,
  name = "Stagger",
  slug = "stagger",
}

classData.spells[124273] = {
  spellID = 124273,
  name = "Heavy Stagger",
  slug = "heavy_stagger",
  duration = 10.0,
}

classData.spells[124274] = {
  spellID = 124274,
  name = "Moderate Stagger",
  slug = "moderate_stagger",
  duration = 10.0,
}

classData.spells[124275] = {
  spellID = 124275,
  name = "Light Stagger",
  slug = "light_stagger",
  duration = 10.0,
}

classData.spells[124280] = {
  spellID = 124280,
  name = "Touch of Karma",
  slug = "touch_of_karma",
  max_range = 50000,
  duration = 6.0,
}

classData.spells[124502] = {
  spellID = 124502,
  name = "Gift of the Ox",
  slug = "gift_of_the_ox",
}

classData.spells[124503] = {
  spellID = 124503,
  name = "Gift of the Ox",
  slug = "gift_of_the_ox",
  max_range = 100,
  duration = 30.0,
}

classData.spells[124506] = {
  spellID = 124506,
  name = "Gift of the Ox",
  slug = "gift_of_the_ox",
  max_range = 100,
  duration = 30.0,
}

classData.spells[124507] = {
  spellID = 124507,
  name = "Gift of the Ox",
  slug = "gift_of_the_ox",
  max_range = 50000,
}

classData.spells[124682] = {
  spellID = 124682,
  name = "Enveloping Mist",
  slug = "enveloping_mist",
  max_range = 40,
  gcd = 1.5,
  duration = 6.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[125151] = {
  spellID = 125151,
  name = "Glyph of Rising Tiger Kick",
  slug = "glyph_of_rising_tiger_kick",
}

classData.spells[125152] = {
  spellID = 125152,
  name = "Rising Tiger Kick",
  slug = "rising_tiger_kick",
}

classData.spells[125174] = {
  spellID = 125174,
  name = "Touch of Karma",
  slug = "touch_of_karma",
  max_range = 50000,
  duration = 10.0,
}

classData.spells[125355] = {
  spellID = 125355,
  name = "Healing Sphere",
  slug = "healing_sphere",
  max_range = 50000,
}

classData.spells[125732] = {
  spellID = 125732,
  name = "Glyph of Honor",
  slug = "glyph_of_honor",
}

classData.spells[125735] = {
  spellID = 125735,
  name = "Honorable Bow",
  slug = "honorable_bow",
  max_range = 50000,
}

classData.spells[125739] = {
  spellID = 125739,
  name = "Honor",
  slug = "honor",
}

classData.spells[125872] = {
  spellID = 125872,
  name = "Glyph of Fighting Pose",
  slug = "glyph_of_fighting_pose",
}

classData.spells[125874] = {
  spellID = 125874,
  name = "Fighting Pose",
  slug = "fighting_pose",
}

classData.spells[125883] = {
  spellID = 125883,
  name = "Zen Flight",
  slug = "zen_flight",
  gcd = 1.0,
}

classData.spells[125931] = {
  spellID = 125931,
  name = "Glyph of Crackling Tiger Lightning",
  slug = "glyph_of_crackling_tiger_lightning",
}

classData.spells[125932] = {
  spellID = 125932,
  name = "Crackling Tiger Lightning",
  slug = "crackling_tiger_lightning",
}

classData.spells[126892] = {
  spellID = 126892,
  name = "Zen Pilgrimage",
  slug = "zen_pilgrimage",
  gcd = 1.0,
  cooldown = 60.0,
}

classData.spells[126893] = {
  spellID = 126893,
  name = "Zen Pilgrimage/Death Gate/Moonglade Storage Aura I",
  slug = "zen_pilgrimagedeath_gatemoonglade_storage_aura_i",
  gcd = 1.0,
}

classData.spells[126895] = {
  spellID = 126895,
  name = "Zen Pilgrimage: Return",
  slug = "zen_pilgrimage_return",
  gcd = 1.0,
}

classData.spells[128595] = {
  spellID = 128595,
  name = "Combat Conditioning",
  slug = "combat_conditioning",
}

classData.spells[129597] = {
  spellID = 129597,
  name = "Arcane Torrent",
  slug = "arcane_torrent",
  gcd = 1.0,
  cooldown = 90.0,
}

classData.spells[129914] = {
  spellID = 129914,
  name = "Power Strikes",
  slug = "power_strikes",
}

classData.spells[130610] = {
  spellID = 130610,
  name = "Monk",
  slug = "monk",
}

classData.spells[130654] = {
  spellID = 130654,
  name = "Chi Burst",
  slug = "chi_burst",
  max_range = 100,
}

classData.spells[132463] = {
  spellID = 132463,
  name = "Chi Wave",
  slug = "chi_wave",
  max_range = 50000,
}

classData.spells[132466] = {
  spellID = 132466,
  name = "Chi Wave",
  slug = "chi_wave",
  max_range = 50000,
}

classData.spells[132467] = {
  spellID = 132467,
  name = "Chi Wave",
  slug = "chi_wave",
  max_range = 50000,
  duration = 0.1,
}

classData.spells[132578] = {
  spellID = 132578,
  name = "Invoke Niuzao, the Black Ox",
  slug = "invoke_niuzao_the_black_ox",
  max_range = 40,
  gcd = 1.5,
  cooldown = 180.0,
  duration = 45.0,
}

classData.spells[137022] = {
  spellID = 137022,
  name = "Monk",
  slug = "monk",
}

classData.spells[137023] = {
  spellID = 137023,
  name = "Brewmaster Monk",
  slug = "brewmaster_monk",
}

classData.spells[137024] = {
  spellID = 137024,
  name = "Mistweaver Monk",
  slug = "mistweaver_monk",
}

classData.spells[137025] = {
  spellID = 137025,
  name = "Windwalker Monk",
  slug = "windwalker_monk",
}

classData.spells[137384] = {
  spellID = 137384,
  name = "Combo Breaker",
  slug = "combo_breaker",
  gcd = 1.0,
}

classData.spells[137639] = {
  spellID = 137639,
  name = "Storm, Earth, and Fire",
  slug = "storm_earth_and_fire",
  max_stacks = 2,
  charges = 1,
  charge_cooldown = 90.0,
  gcd = 1.0,
  cooldown = 16.0,
  duration = 15.0,
}

classData.spells[148135] = {
  spellID = 148135,
  name = "Chi Burst",
  slug = "chi_burst",
  max_range = 100,
}

classData.spells[148187] = {
  spellID = 148187,
  name = "Rushing Jade Wind",
  slug = "rushing_jade_wind",
}

classData.spells[152173] = {
  spellID = 152173,
  name = "Serenity",
  slug = "serenity",
  gcd = 1.0,
  cooldown = 90.0,
  duration = 9.0,
}

classData.spells[152175] = {
  spellID = 152175,
  name = "Whirling Dragon Punch",
  slug = "whirling_dragon_punch",
  gcd = 1.0,
  cooldown = 24.0,
  duration = 1.0,
}

classData.spells[154744] = {
  spellID = 154744,
  name = "Expansive Mind",
  slug = "expansive_mind",
}

classData.spells[157361] = {
  spellID = 157361,
  name = "Roll Speed Controls",
  slug = "roll_speed_controls",
}

classData.spells[157411] = {
  spellID = 157411,
  name = "Windwalking",
  slug = "windwalking",
}

classData.spells[157445] = {
  spellID = 157445,
  name = "Critical Strikes",
  slug = "critical_strikes",
}

classData.spells[158221] = {
  spellID = 158221,
  name = "Whirling Dragon Punch",
  slug = "whirling_dragon_punch",
}

classData.spells[162530] = {
  spellID = 162530,
  name = "Refreshing Jade Wind",
  slug = "refreshing_jade_wind",
}

classData.spells[162697] = {
  spellID = 162697,
  name = "Stat Negation Aura - Agility DPS",
  slug = "stat_negation_aura__agility_dps",
}

classData.spells[162700] = {
  spellID = 162700,
  name = "Stat Negation Aura - Agility Tank",
  slug = "stat_negation_aura__agility_tank",
}

classData.spells[162701] = {
  spellID = 162701,
  name = "Stat Negation Aura - Intellect Healer",
  slug = "stat_negation_aura__intellect_healer",
}

classData.spells[163178] = {
  spellID = 163178,
  name = "Summon Black Ox Statue",
  slug = "summon_black_ox_statue",
  max_range = 40,
}

classData.spells[165403] = {
  spellID = 165403,
  name = "Item - Monk T17 Windwalker2P Bonus",
  slug = "item__monk_t17_windwalker2p_bonus",
}

classData.spells[166646] = {
  spellID = 166646,
  name = "Windwalking",
  slug = "windwalking",
  max_range = 100,
}

classData.spells[175697] = {
  spellID = 175697,
  name = "Disabling Technique",
  slug = "disabling_technique",
  gcd = 1.5,
}

classData.spells[178173] = {
  spellID = 178173,
  name = "Gift of the Ox",
  slug = "gift_of_the_ox",
  max_range = 50000,
}

classData.spells[185099] = {
  spellID = 185099,
  name = "Rising Sun Kick",
  slug = "rising_sun_kick",
  max_range = 5,
}

classData.spells[191837] = {
  spellID = 191837,
  name = "Essence Font",
  slug = "essence_font",
  gcd = 1.5,
  cooldown = 12.0,
  duration = 3.0,
  channeled = true,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[191840] = {
  spellID = 191840,
  name = "Essence Font",
  slug = "essence_font",
  max_stacks = 1,
  duration = 8.0,
  haste_affected_ticks = true,
}

classData.spells[191894] = {
  spellID = 191894,
  name = "Gust of Mists",
  slug = "gust_of_mists",
  max_range = 100,
}

classData.spells[195399] = {
  spellID = 195399,
  name = "Gale Burst",
  slug = "gale_burst",
  max_range = 100,
}

classData.spells[195403] = {
  spellID = 195403,
  name = "Gale Burst",
  slug = "gale_burst",
  max_range = 100,
  duration = 8.0,
}

classData.spells[195630] = {
  spellID = 195630,
  name = "Elusive Brawler",
  slug = "elusive_brawler",
  max_stacks = 100,
  duration = 10.0,
}

classData.spells[195650] = {
  spellID = 195650,
  name = "Crosswinds",
  slug = "crosswinds",
  max_range = 100,
}

classData.spells[195651] = {
  spellID = 195651,
  name = "Crosswinds",
  slug = "crosswinds",
  max_range = 100,
  duration = 4.0,
}

classData.spells[195653] = {
  spellID = 195653,
  name = "Crosswinds",
  slug = "crosswinds",
  max_range = 100,
  duration = 3.0,
}

classData.spells[196061] = {
  spellID = 196061,
  name = "Crosswinds",
  slug = "crosswinds",
  max_range = 60,
}

classData.spells[196607] = {
  spellID = 196607,
  name = "Eye of the Tiger",
  slug = "eye_of_the_tiger",
}

classData.spells[196608] = {
  spellID = 196608,
  name = "Eye of the Tiger",
  slug = "eye_of_the_tiger",
  max_range = 100,
  duration = 8.0,
}

classData.spells[196719] = {
  spellID = 196719,
  name = "Gift of the Mists",
  slug = "gift_of_the_mists",
}

classData.spells[196721] = {
  spellID = 196721,
  name = "Light Brewing",
  slug = "light_brewing",
}

classData.spells[196725] = {
  spellID = 196725,
  name = "Refreshing Jade Wind",
  slug = "refreshing_jade_wind",
  gcd = 1.5,
  cooldown = 9.0,
  duration = 9.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[196730] = {
  spellID = 196730,
  name = "Special Delivery",
  slug = "special_delivery",
}

classData.spells[196733] = {
  spellID = 196733,
  name = "Special Delivery",
  slug = "special_delivery",
  max_range = 100,
  duration = 15.0,
}

classData.spells[196734] = {
  spellID = 196734,
  name = "Special Delivery",
  slug = "special_delivery",
  max_range = 100,
}

classData.spells[196736] = {
  spellID = 196736,
  name = "Blackout Combo",
  slug = "blackout_combo",
}

classData.spells[196737] = {
  spellID = 196737,
  name = "High Tolerance",
  slug = "high_tolerance",
}

classData.spells[196738] = {
  spellID = 196738,
  name = "Elusive Dance",
  slug = "elusive_dance",
}

classData.spells[196739] = {
  spellID = 196739,
  name = "Elusive Dance",
  slug = "elusive_dance",
  duration = 6.0,
}

classData.spells[196740] = {
  spellID = 196740,
  name = "Hit Combo",
  slug = "hit_combo",
}

classData.spells[196741] = {
  spellID = 196741,
  name = "Hit Combo",
  slug = "hit_combo",
  max_stacks = 6,
  duration = 10.0,
}

classData.spells[197206] = {
  spellID = 197206,
  name = "Uplifting Trance",
  slug = "uplifting_trance",
  max_range = 50000,
  initial_stacks = 1,
  duration = 20.0,
}

classData.spells[197218] = {
  spellID = 197218,
  name = "Thunder Focus Tea",
  slug = "thunder_focus_tea",
  max_stacks = 1,
  duration = 30.0,
}

classData.spells[197895] = {
  spellID = 197895,
  name = "Focused Thunder",
  slug = "focused_thunder",
}

classData.spells[197900] = {
  spellID = 197900,
  name = "Mist Wrap",
  slug = "mist_wrap",
}

classData.spells[197908] = {
  spellID = 197908,
  name = "Mana Tea",
  slug = "mana_tea",
  gcd = 1.5,
  cooldown = 90.0,
  duration = 12.0,
}

classData.spells[197915] = {
  spellID = 197915,
  name = "Lifecycles",
  slug = "lifecycles",
  initial_stacks = 1,
}

classData.spells[198533] = {
  spellID = 198533,
  name = "Soothing Mist",
  slug = "soothing_mist",
  max_range = 60,
  duration = 30.0,
  channeled = true,
  haste_affected_ticks = true,
}

classData.spells[198664] = {
  spellID = 198664,
  name = "Invoke Chi-Ji, the Red Crane",
  slug = "invoke_chiji_the_red_crane",
  max_range = 40,
  gcd = 1.5,
  cooldown = 180.0,
  duration = 45.0,
}

classData.spells[198756] = {
  spellID = 198756,
  name = "Crane Heal",
  slug = "crane_heal",
  max_range = 100,
}

classData.spells[198898] = {
  spellID = 198898,
  name = "Song of Chi-Ji",
  slug = "song_of_chiji",
  max_range = 40,
  gcd = 1.5,
  cooldown = 30.0,
  duration = 5.0,
}

classData.spells[198909] = {
  spellID = 198909,
  name = "Song of Chi-Ji",
  slug = "song_of_chiji",
  max_range = 100,
  initial_stacks = 1,
  duration = 20.0,
}

classData.spells[199656] = {
  spellID = 199656,
  name = "Celestial Breath",
  slug = "celestial_breath",
}

classData.spells[199894] = {
  spellID = 199894,
  name = "The Mists of Sheilun",
  slug = "the_mists_of_sheilun",
  max_range = 100,
}

classData.spells[200617] = {
  spellID = 200617,
  name = "Zen Pilgrimage",
  slug = "zen_pilgrimage",
}

classData.spells[200749] = {
  spellID = 200749,
  name = "Activating Specialization",
  slug = "activating_specialization",
  max_range = 50000,
  channeled = true,
}

classData.spells[202090] = {
  spellID = 202090,
  name = "Teachings of the Monastery",
  slug = "teachings_of_the_monastery",
  max_stacks = 3,
  duration = 12.0,
}

classData.spells[205320] = {
  spellID = 205320,
  name = "Strike of the Windlord",
  slug = "strike_of_the_windlord",
  max_range = 9,
  gcd = 1.0,
  cooldown = 40.0,
  duration = 6.0,
  power = {
    [1] = { resource = "chi", amount = 2, },
  },
}

classData.spells[205406] = {
  spellID = 205406,
  name = "Sheilun's Gift",
  slug = "sheiluns_gift",
  max_range = 40,
  gcd = 1.5,
}

classData.spells[205414] = {
  spellID = 205414,
  name = "Strike of the Windlord",
  slug = "strike_of_the_windlord",
  max_range = 12,
}

classData.spells[205523] = {
  spellID = 205523,
  name = "Blackout Strike",
  slug = "blackout_strike",
  replaces_spell_id = 100784,
  max_range = 5,
  gcd = 1.5,
  cooldown = 3.0,
}

classData.spells[209525] = {
  spellID = 209525,
  name = "Soothing Mist",
  slug = "soothing_mist",
  max_range = 40,
  gcd = 0.5,
  cooldown = 1.0,
  duration = 20.0,
  channeled = true,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, per_tick = 0, },
  },
}

classData.spells[210802] = {
  spellID = 210802,
  name = "Spirit of the Crane",
  slug = "spirit_of_the_crane",
}

classData.spells[210803] = {
  spellID = 210803,
  name = "Spirit of the Crane",
  slug = "spirit_of_the_crane",
  max_stacks = 1,
}

classData.spells[211430] = {
  spellID = 211430,
  name = "Item - Monk T19 Windwalker 4P Bonus",
  slug = "item__monk_t19_windwalker_4p_bonus",
}

classData.spells[211432] = {
  spellID = 211432,
  name = "Combo Master",
  slug = "combo_master",
  duration = 10.0,
}

classData.spells[212051] = {
  spellID = 212051,
  name = "Reawaken",
  slug = "reawaken",
  max_range = 100,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[213112] = {
  spellID = 213112,
  name = "Hidden Master's Forbidden Touch",
  slug = "hidden_masters_forbidden_touch",
}

classData.spells[213114] = {
  spellID = 213114,
  name = "Hidden Master's Forbidden Touch",
  slug = "hidden_masters_forbidden_touch",
  duration = 5.0,
}

classData.spells[213116] = {
  spellID = 213116,
  name = "Face Palm",
  slug = "face_palm",
}

classData.spells[214326] = {
  spellID = 214326,
  name = "Exploding Keg",
  slug = "exploding_keg",
  max_range = 40,
  gcd = 1.0,
  cooldown = 75.0,
  duration = 3.0,
}

classData.spells[215479] = {
  spellID = 215479,
  name = "Ironskin Brew",
  slug = "ironskin_brew",
  duration = 6.0,
}

classData.spells[216519] = {
  spellID = 216519,
  name = "Celestial Fortune",
  slug = "celestial_fortune",
}

classData.spells[216521] = {
  spellID = 216521,
  name = "Celestial Fortune",
  slug = "celestial_fortune",
}

classData.spells[218164] = {
  spellID = 218164,
  name = "Detox",
  slug = "detox",
  max_range = 40,
  charges = 1,
  charge_cooldown = 8.0,
  gcd = 1.5,
  power = {
    [1] = { resource = "energy", amount = 20, },
  },
}

classData.spells[220357] = {
  spellID = 220357,
  name = "Cyclone Strikes",
  slug = "cyclone_strikes",
}

classData.spells[220358] = {
  spellID = 220358,
  name = "Cyclone Strikes",
  slug = "cyclone_strikes",
  max_stacks = 45,
  duration = 15.0,
}

classData.spells[222029] = {
  spellID = 222029,
  name = "Strike of the Windlord",
  slug = "strike_of_the_windlord",
  max_range = 12,
}

classData.spells[227291] = {
  spellID = 227291,
  name = "Stomp",
  slug = "stomp",
  gcd = 1.0,
  cooldown = 5.0,
}

classData.spells[227679] = {
  spellID = 227679,
  name = "Face Palm",
  slug = "face_palm",
}

classData.spells[227681] = {
  spellID = 227681,
  name = "Dragonfire Brew",
  slug = "dragonfire_brew",
}

classData.spells[228287] = {
  spellID = 228287,
  name = "Mark of the Crane",
  slug = "mark_of_the_crane",
  max_range = 100,
  duration = 15.0,
}

classData.spells[228563] = {
  spellID = 228563,
  name = "Blackout Combo",
  slug = "blackout_combo",
  initial_stacks = 1,
  duration = 15.0,
}

classData.spells[228649] = {
  spellID = 228649,
  name = "Blackout Kick",
  slug = "blackout_kick",
  max_range = 5,
}

classData.spells[231602] = {
  spellID = 231602,
  name = "Vivify",
  slug = "vivify",
}

classData.spells[231605] = {
  spellID = 231605,
  name = "Enveloping Mist",
  slug = "enveloping_mist",
}

classData.spells[231606] = {
  spellID = 231606,
  name = "Renewing Mist",
  slug = "renewing_mist",
}

classData.spells[231627] = {
  spellID = 231627,
  name = "Storm, Earth, and Fire",
  slug = "storm_earth_and_fire",
}

classData.spells[231633] = {
  spellID = 231633,
  name = "Essence Font",
  slug = "essence_font",
}

classData.spells[231876] = {
  spellID = 231876,
  name = "Thunder Focus Tea",
  slug = "thunder_focus_tea",
}

classData.spells[237076] = {
  spellID = 237076,
  name = "Mystic Vitality",
  slug = "mystic_vitality",
}

classData.spells[238095] = {
  spellID = 238095,
  name = "Master of Combinations",
  slug = "master_of_combinations",
}

classData.spells[238131] = {
  spellID = 238131,
  name = "Thunderfist",
  slug = "thunderfist",
}

classData.spells[240672] = {
  spellID = 240672,
  name = "Master of Combinations",
  slug = "master_of_combinations",
  max_range = 100,
  duration = 6.0,
}

classData.spells[242387] = {
  spellID = 242387,
  name = "Thunderfist",
  slug = "thunderfist",
  max_stacks = 10,
  duration = 30.0,
}

classData.spells[242390] = {
  spellID = 242390,
  name = "Thunderfist",
  slug = "thunderfist",
  max_range = 8,
}

classData.spells[242400] = {
  spellID = 242400,
  name = "Whispers of Shaohao",
  slug = "whispers_of_shaohao",
  max_range = 100,
}

classData.spells[243435] = {
  spellID = 243435,
  name = "Fortifying Brew",
  slug = "fortifying_brew",
  cooldown = 90.0,
  duration = 15.0,
}

classData.spells[245013] = {
  spellID = 245013,
  name = "Brewmaster's Balance",
  slug = "brewmasters_balance",
}

classData.spells[251463] = {
  spellID = 251463,
  name = "Vindicaar Matrix Crystal",
  slug = "vindicaar_matrix_crystal",
  gcd = 1.5,
}

classData.spells[251823] = {
  spellID = 251823,
  name = "Item - Monk T21 Windwalker 4P Bonus",
  slug = "item__monk_t21_windwalker_4p_bonus",
}

classData.spells[252768] = {
  spellID = 252768,
  name = "Focus of Xuen",
  slug = "focus_of_xuen",
}

classData.spells[255529] = {
  spellID = 255529,
  name = "Vindicaar Matrix Crystal",
  slug = "vindicaar_matrix_crystal",
}

classData.spells[255647] = {
  spellID = 255647,
  name = "Light's Judgment",
  slug = "lights_judgment",
  max_range = 40,
  gcd = 1.5,
  cooldown = 150.0,
}

classData.spells[255651] = {
  spellID = 255651,
  name = "Holy Resistance",
  slug = "holy_resistance",
}

classData.spells[255652] = {
  spellID = 255652,
  name = "Light's Reckoning",
  slug = "lights_reckoning",
}

classData.spells[255653] = {
  spellID = 255653,
  name = "Demonbane",
  slug = "demonbane",
}

classData.spells[256893] = {
  spellID = 256893,
  name = "Light's Judgment",
  slug = "lights_judgment",
  max_range = 40,
  gcd = 1.5,
  cooldown = 150.0,
}

classData.spells[256896] = {
  spellID = 256896,
  name = "Light's Reckoning",
  slug = "lights_reckoning",
  max_range = 40,
}

classData.spells[261715] = {
  spellID = 261715,
  name = "Rushing Jade Wind",
  slug = "rushing_jade_wind",
  gcd = 1.5,
  cooldown = 6.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "energy", amount = 4, per_tick = 4, },
  },
}

classData.spells[261767] = {
  spellID = 261767,
  name = "Inner Strength",
  slug = "inner_strength",
  max_range = 100,
}

classData.spells[261769] = {
  spellID = 261769,
  name = "Inner Strength",
  slug = "inner_strength",
  max_range = 100,
  max_stacks = 5,
  duration = 5.0,
}

classData.spells[261916] = {
  spellID = 261916,
  name = "Blackout Kick",
  slug = "blackout_kick",
}

classData.spells[261917] = {
  spellID = 261917,
  name = "Blackout Kick",
  slug = "blackout_kick",
}

classData.spells[261947] = {
  spellID = 261947,
  name = "Fist of the White Tiger",
  slug = "fist_of_the_white_tiger",
  max_range = 5,
  gcd = 1.5,
  cooldown = 30.0,
  power = {
    [1] = { resource = "energy", amount = 40, },
  },
}

classData.spells[261977] = {
  spellID = 261977,
  name = "Fist of the White Tiger",
  slug = "fist_of_the_white_tiger",
  max_range = 5,
}

classData.spells[261978] = {
  spellID = 261978,
  name = "Fist of the White Tiger",
  slug = "fist_of_the_white_tiger",
  max_range = 5,
}

classData.spells[262840] = {
  spellID = 262840,
  name = "Rising Sun Kick",
  slug = "rising_sun_kick",
}

classData.spells[264348] = {
  spellID = 264348,
  name = "Tiger Tail Sweep",
  slug = "tiger_tail_sweep",
}

classData.spells[271232] = {
  spellID = 271232,
  name = "Touch of Death Amplifier",
  slug = "touch_of_death_amplifier",
  max_range = 100,
}

classData.spells[271233] = {
  spellID = 271233,
  name = "Touch of Death Amplifier",
  slug = "touch_of_death_amplifier",
  max_range = 100,
  duration = 8.0,
}

classData.spells[274062] = {
  spellID = 274062,
  name = "Enveloping Mist",
  slug = "enveloping_mist",
  max_range = 40,
}

classData.spells[274586] = {
  spellID = 274586,
  name = "Vivify",
  slug = "vivify",
}

classData.spells[274909] = {
  spellID = 274909,
  name = "Rising Mist",
  slug = "rising_mist",
  internal_cooldown = 1.0,
}

classData.spells[274912] = {
  spellID = 274912,
  name = "Rising Mist",
  slug = "rising_mist",
}

classData.spells[274963] = {
  spellID = 274963,
  name = "Essence Well",
  slug = "essence_well",
  max_range = 100,
}
