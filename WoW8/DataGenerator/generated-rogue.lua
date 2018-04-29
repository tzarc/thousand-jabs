----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BfA only.
----------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(4, GetBuildInfo()) < 80000 then
    return
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Class check
----------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(3, UnitClass('player')) ~= 4 then return end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
local addonName, TJ = ...
TJ.ClassData = TJ.ClassData or {}
TJ.ClassData[4] = TJ.ClassData[4] or {}
local classData = TJ.ClassData[4]
classData.spells = classData.spells or {}

classData.spells[53] = {
  spellID = 53,
  name = "Backstab",
  slug = "backstab",
  max_range = 5,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 35, },
  },
}

classData.spells[261] = {
  spellID = 261,
  name = "Summon Skeleton",
  slug = "summon_skeleton",
  max_range = 20,
}

classData.spells[408] = {
  spellID = 408,
  name = "Kidney Shot",
  slug = "kidney_shot",
  max_range = 5,
  gcd = 1.0,
  cooldown = 20.0,
  duration = 1.0,
  power = {
    [1] = { resource = "energy", amount = 25, },
    [2] = { resource = "combo_points", amount = 1, max_amount = 4, },
  },
}

classData.spells[674] = {
  spellID = 674,
  name = "Dual Wield",
  slug = "dual_wield",
}

classData.spells[703] = {
  spellID = 703,
  name = "Garrote",
  slug = "garrote",
  max_range = 5,
  gcd = 1.0,
  cooldown = 6.0,
  duration = 18.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "energy", amount = 45, },
  },
}

classData.spells[921] = {
  spellID = 921,
  name = "Pick Pocket",
  slug = "pick_pocket",
  max_range = 10,
  cooldown = 0.5,
}

classData.spells[1329] = {
  spellID = 1329,
  name = "Mutilate",
  slug = "mutilate",
  replaces_spell_id = 1752,
  max_range = 5,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 50, },
  },
}

classData.spells[1330] = {
  spellID = 1330,
  name = "Garrote - Silence",
  slug = "garrote__silence",
  max_range = 50000,
  duration = 3.0,
}

classData.spells[1725] = {
  spellID = 1725,
  name = "Distract",
  slug = "distract",
  max_range = 30,
  gcd = 1.0,
  cooldown = 30.0,
  power = {
    [1] = { resource = "energy", amount = 30, },
  },
}

classData.spells[1752] = {
  spellID = 1752,
  name = "Sinister Strike",
  slug = "sinister_strike",
  max_range = 5,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 40, },
  },
}

classData.spells[1766] = {
  spellID = 1766,
  name = "Kick",
  slug = "kick",
  max_range = 5,
  cooldown = 15.0,
  duration = 5.0,
}

classData.spells[1776] = {
  spellID = 1776,
  name = "Gouge",
  slug = "gouge",
  max_range = 5,
  initial_stacks = 1,
  gcd = 1.0,
  cooldown = 15.0,
  duration = 4.0,
  power = {
    [1] = { resource = "energy", amount = 25, },
  },
}

classData.spells[1784] = {
  spellID = 1784,
  name = "Stealth",
  slug = "stealth",
  initial_stacks = 1,
  cooldown = 2.0,
}

classData.spells[1804] = {
  spellID = 1804,
  name = "Pick Lock",
  slug = "pick_lock",
  max_range = 5,
}

classData.spells[1833] = {
  spellID = 1833,
  name = "Cheap Shot",
  slug = "cheap_shot",
  max_range = 5,
  gcd = 1.0,
  duration = 4.0,
  power = {
    [1] = { resource = "energy", amount = 40, },
  },
}

classData.spells[1856] = {
  spellID = 1856,
  name = "Vanish",
  slug = "vanish",
  cooldown = 120.0,
}

classData.spells[1860] = {
  spellID = 1860,
  name = "Safe Fall",
  slug = "safe_fall",
}

classData.spells[1943] = {
  spellID = 1943,
  name = "Rupture",
  slug = "rupture",
  max_range = 5,
  gcd = 1.0,
  duration = 4.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "energy", amount = 25, },
    [2] = { resource = "combo_points", amount = 1, max_amount = 4, },
  },
}

classData.spells[1966] = {
  spellID = 1966,
  name = "Feint",
  slug = "feint",
  gcd = 1.0,
  cooldown = 15.0,
  duration = 5.0,
  power = {
    [1] = { resource = "energy", amount = 35, },
  },
}

classData.spells[2094] = {
  spellID = 2094,
  name = "Blind",
  slug = "blind",
  max_range = 15,
  initial_stacks = 1,
  gcd = 1.0,
  cooldown = 120.0,
  duration = 60.0,
}

classData.spells[2098] = {
  spellID = 2098,
  name = "Dispatch",
  slug = "dispatch",
  max_range = 5,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 35, },
    [2] = { resource = "combo_points", amount = 1, max_amount = 4, },
  },
}

classData.spells[2818] = {
  spellID = 2818,
  name = "Deadly Poison",
  slug = "deadly_poison",
  max_range = 100,
  duration = 12.0,
  haste_affected_ticks = true,
}

classData.spells[2823] = {
  spellID = 2823,
  name = "Deadly Poison",
  slug = "deadly_poison",
  duration = 3600.0,
}

classData.spells[2836] = {
  spellID = 2836,
  name = "Detect Traps",
  slug = "detect_traps",
  cooldown = 1.5,
}

classData.spells[2983] = {
  spellID = 2983,
  name = "Sprint",
  slug = "sprint",
  cooldown = 120.0,
  duration = 8.0,
}

classData.spells[3408] = {
  spellID = 3408,
  name = "Crippling Poison",
  slug = "crippling_poison",
  duration = 3600.0,
}

classData.spells[3409] = {
  spellID = 3409,
  name = "Crippling Poison",
  slug = "crippling_poison",
  max_range = 100,
  duration = 12.0,
}

classData.spells[5171] = {
  spellID = 5171,
  name = "Slice and Dice",
  slug = "slice_and_dice",
  max_range = 100,
  gcd = 1.0,
  duration = 6.0,
  power = {
    [1] = { resource = "energy", amount = 25, },
    [2] = { resource = "combo_points", amount = 1, max_amount = 4, },
  },
}

classData.spells[5176] = {
  spellID = 5176,
  name = "Solar Wrath",
  slug = "solar_wrath",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, aura = 166163, },
  },
}

classData.spells[5277] = {
  spellID = 5277,
  name = "Evasion",
  slug = "evasion",
  cooldown = 120.0,
  duration = 10.0,
}

classData.spells[5374] = {
  spellID = 5374,
  name = "Mutilate",
  slug = "mutilate",
  max_range = 5,
}

classData.spells[6770] = {
  spellID = 6770,
  name = "Sap",
  slug = "sap",
  max_range = 10,
  initial_stacks = 1,
  gcd = 1.0,
  duration = 60.0,
  power = {
    [1] = { resource = "energy", amount = 35, },
  },
}

classData.spells[8676] = {
  spellID = 8676,
  name = "Ambush",
  slug = "ambush",
  max_range = 5,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 50, },
  },
}

classData.spells[8679] = {
  spellID = 8679,
  name = "Wound Poison",
  slug = "wound_poison",
  duration = 3600.0,
}

classData.spells[8680] = {
  spellID = 8680,
  name = "Wound Poison",
  slug = "wound_poison",
  max_range = 100,
  duration = 12.0,
}

classData.spells[11327] = {
  spellID = 11327,
  name = "Vanish",
  slug = "vanish",
  duration = 3.0,
}

classData.spells[13750] = {
  spellID = 13750,
  name = "Adrenaline Rush",
  slug = "adrenaline_rush",
  gcd = 0.8,
  cooldown = 180.0,
  duration = 20.0,
}

classData.spells[13877] = {
  spellID = 13877,
  name = "Blade Flurry",
  slug = "blade_flurry",
  charges = 2,
  charge_cooldown = 25.0,
  gcd = 1.0,
  cooldown = 12.0,
  duration = 12.0,
  power = {
    [1] = { resource = "energy", amount = 15, },
  },
}

classData.spells[14062] = {
  spellID = 14062,
  name = "Nightstalker",
  slug = "nightstalker",
}

classData.spells[14117] = {
  spellID = 14117,
  name = "Improved Poisons",
  slug = "improved_poisons",
}

classData.spells[14161] = {
  spellID = 14161,
  name = "Ruthlessness",
  slug = "ruthlessness",
}

classData.spells[14189] = {
  spellID = 14189,
  name = "Seal Fate",
  slug = "seal_fate",
  max_range = 50000,
  max_stacks = 3,
}

classData.spells[14190] = {
  spellID = 14190,
  name = "Seal Fate",
  slug = "seal_fate",
}

classData.spells[14795] = {
  spellID = 14795,
  name = "Venomhide Poison",
  slug = "venomhide_poison",
  max_range = 5,
  max_stacks = 3,
  duration = 12.0,
}

classData.spells[14983] = {
  spellID = 14983,
  name = "Vigor",
  slug = "vigor",
}

classData.spells[20572] = {
  spellID = 20572,
  name = "Blood Fury",
  slug = "blood_fury",
  cooldown = 120.0,
  duration = 15.0,
}

classData.spells[21009] = {
  spellID = 21009,
  name = "Elusiveness",
  slug = "elusiveness",
}

classData.spells[21563] = {
  spellID = 21563,
  name = "Command",
  slug = "command",
}

classData.spells[22482] = {
  spellID = 22482,
  name = "Blade Flurry",
  slug = "blade_flurry",
  max_range = 100,
}

classData.spells[25046] = {
  spellID = 25046,
  name = "Arcane Torrent",
  slug = "arcane_torrent",
  gcd = 1.0,
  cooldown = 90.0,
}

classData.spells[27576] = {
  spellID = 27576,
  name = "Mutilate",
  slug = "mutilate",
  max_range = 5,
}

classData.spells[31209] = {
  spellID = 31209,
  name = "Fleet Footed",
  slug = "fleet_footed",
}

classData.spells[31223] = {
  spellID = 31223,
  name = "Master of Subtlety",
  slug = "master_of_subtlety",
}

classData.spells[31224] = {
  spellID = 31224,
  name = "Cloak of Shadows",
  slug = "cloak_of_shadows",
  cooldown = 120.0,
  duration = 5.0,
}

classData.spells[31230] = {
  spellID = 31230,
  name = "Cheat Death",
  slug = "cheat_death",
}

classData.spells[31665] = {
  spellID = 31665,
  name = "Master of Subtlety",
  slug = "master_of_subtlety",
}

classData.spells[32645] = {
  spellID = 32645,
  name = "Envenom",
  slug = "envenom",
  replaces_spell_id = 196819,
  max_range = 5,
  gcd = 1.0,
  duration = 1.0,
  power = {
    [1] = { resource = "energy", amount = 35, },
    [2] = { resource = "combo_points", amount = 1, max_amount = 4, },
  },
}

classData.spells[35546] = {
  spellID = 35546,
  name = "Combat Potency",
  slug = "combat_potency",
}

classData.spells[35551] = {
  spellID = 35551,
  name = "Combat Potency",
  slug = "combat_potency",
}

classData.spells[36554] = {
  spellID = 36554,
  name = "Shadowstep",
  slug = "shadowstep",
  max_range = 25,
  charges = 1,
  charge_cooldown = 30.0,
  cooldown = 1.0,
  duration = 2.0,
}

classData.spells[45181] = {
  spellID = 45181,
  name = "Cheated Death",
  slug = "cheated_death",
  max_range = 50000,
  duration = 360.0,
}

classData.spells[45182] = {
  spellID = 45182,
  name = "Cheating Death",
  slug = "cheating_death",
  duration = 3.0,
}

classData.spells[51667] = {
  spellID = 51667,
  name = "Cut to the Chase",
  slug = "cut_to_the_chase",
}

classData.spells[51690] = {
  spellID = 51690,
  name = "Killing Spree",
  slug = "killing_spree",
  max_range = 10,
  gcd = 1.0,
  cooldown = 120.0,
  duration = 2.0,
}

classData.spells[51723] = {
  spellID = 51723,
  name = "Fan of Knives",
  slug = "fan_of_knives",
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 35, },
  },
}

classData.spells[56814] = {
  spellID = 56814,
  name = "Detection",
  slug = "detection",
  gcd = 1.0,
  duration = 30.0,
}

classData.spells[57841] = {
  spellID = 57841,
  name = "Killing Spree",
  slug = "killing_spree",
  max_range = 5,
}

classData.spells[57842] = {
  spellID = 57842,
  name = "Killing Spree Off-Hand",
  slug = "killing_spree_offhand",
  max_range = 5,
}

classData.spells[57934] = {
  spellID = 57934,
  name = "Tricks of the Trade",
  slug = "tricks_of_the_trade",
  max_range = 100,
  cooldown = 30.0,
  duration = 30.0,
}

classData.spells[58423] = {
  spellID = 58423,
  name = "Relentless Strikes",
  slug = "relentless_strikes",
}

classData.spells[59628] = {
  spellID = 59628,
  name = "Tricks of the Trade",
  slug = "tricks_of_the_trade",
  duration = 6.0,
}

classData.spells[61329] = {
  spellID = 61329,
  name = "Combat Potency",
  slug = "combat_potency",
}

classData.spells[63268] = {
  spellID = 63268,
  name = "Glyph of Disguise",
  slug = "glyph_of_disguise",
}

classData.spells[63899] = {
  spellID = 63899,
  name = "Disguise",
  slug = "disguise",
}

classData.spells[68975] = {
  spellID = 68975,
  name = "Viciousness",
  slug = "viciousness",
}

classData.spells[68976] = {
  spellID = 68976,
  name = "Aberration",
  slug = "aberration",
}

classData.spells[68992] = {
  spellID = 68992,
  name = "Darkflight",
  slug = "darkflight",
  cooldown = 120.0,
  duration = 10.0,
}

classData.spells[76803] = {
  spellID = 76803,
  name = "Mastery: Potent Assassin",
  slug = "mastery_potent_assassin",
}

classData.spells[76806] = {
  spellID = 76806,
  name = "Mastery: Main Gauche",
  slug = "mastery_main_gauche",
}

classData.spells[76808] = {
  spellID = 76808,
  name = "Mastery: Executioner",
  slug = "mastery_executioner",
}

classData.spells[79008] = {
  spellID = 79008,
  name = "Elusiveness",
  slug = "elusiveness",
}

classData.spells[79096] = {
  spellID = 79096,
  name = "Restless Blades",
  slug = "restless_blades",
  internal_cooldown = 0.1,
}

classData.spells[79134] = {
  spellID = 79134,
  name = "Venomous Wounds",
  slug = "venomous_wounds",
}

classData.spells[79140] = {
  spellID = 79140,
  name = "Vendetta",
  slug = "vendetta",
  max_range = 30,
  gcd = 1.5,
  cooldown = 120.0,
  duration = 20.0,
}

classData.spells[79152] = {
  spellID = 79152,
  name = "Energetic Recovery",
  slug = "energetic_recovery",
}

classData.spells[82245] = {
  spellID = 82245,
  name = "Parry",
  slug = "parry",
}

classData.spells[86092] = {
  spellID = 86092,
  name = "Leather Specialization",
  slug = "leather_specialization",
}

classData.spells[86392] = {
  spellID = 86392,
  name = "Main Gauche",
  slug = "main_gauche",
  max_range = 100,
}

classData.spells[91021] = {
  spellID = 91021,
  name = "Find Weakness",
  slug = "find_weakness",
  max_range = 100,
  duration = 10.0,
}

classData.spells[91023] = {
  spellID = 91023,
  name = "Find Weakness",
  slug = "find_weakness",
}

classData.spells[94293] = {
  spellID = 94293,
  name = "Altered Form",
  slug = "altered_form",
}

classData.spells[98440] = {
  spellID = 98440,
  name = "Relentless Strikes",
  slug = "relentless_strikes",
}

classData.spells[107079] = {
  spellID = 107079,
  name = "Quaking Palm",
  slug = "quaking_palm",
  max_range = 5,
  initial_stacks = 1,
  gcd = 1.0,
  cooldown = 120.0,
  duration = 4.0,
}

classData.spells[108208] = {
  spellID = 108208,
  name = "Subterfuge",
  slug = "subterfuge",
}

classData.spells[108209] = {
  spellID = 108209,
  name = "Shadow Focus",
  slug = "shadow_focus",
}

classData.spells[108211] = {
  spellID = 108211,
  name = "Leeching Poison",
  slug = "leeching_poison",
  duration = 3600.0,
}

classData.spells[108216] = {
  spellID = 108216,
  name = "Dirty Tricks",
  slug = "dirty_tricks",
}

classData.spells[111240] = {
  spellID = 111240,
  name = "Blindside",
  slug = "blindside",
  max_range = 5,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 30, },
  },
}

classData.spells[112942] = {
  spellID = 112942,
  name = "Shadow Focus",
  slug = "shadow_focus",
}

classData.spells[113780] = {
  spellID = 113780,
  name = "Deadly Poison",
  slug = "deadly_poison",
  max_range = 100,
}

classData.spells[114014] = {
  spellID = 114014,
  name = "Shuriken Toss",
  slug = "shuriken_toss",
  max_range = 30,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 40, },
  },
}

classData.spells[114018] = {
  spellID = 114018,
  name = "Shroud of Concealment",
  slug = "shroud_of_concealment",
  gcd = 1.0,
  cooldown = 360.0,
  duration = 15.0,
}

classData.spells[115192] = {
  spellID = 115192,
  name = "Subterfuge",
  slug = "subterfuge",
  duration = 3.0,
}

classData.spells[115834] = {
  spellID = 115834,
  name = "Shroud of Concealment",
  slug = "shroud_of_concealment",
  duration = 2.0,
}

classData.spells[121308] = {
  spellID = 121308,
  name = "Disguise",
  slug = "disguise",
  max_range = 30,
  duration = 300.0,
}

classData.spells[121411] = {
  spellID = 121411,
  name = "Crimson Tempest",
  slug = "crimson_tempest",
  gcd = 1.0,
  duration = 2.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "energy", amount = 35, },
    [2] = { resource = "combo_points", amount = 1, max_amount = 4, },
  },
}

classData.spells[121471] = {
  spellID = 121471,
  name = "Shadow Blades",
  slug = "shadow_blades",
  gcd = 1.5,
  cooldown = 180.0,
  duration = 20.0,
}

classData.spells[121473] = {
  spellID = 121473,
  name = "Shadow Blade",
  slug = "shadow_blade",
  max_range = 30,
}

classData.spells[121474] = {
  spellID = 121474,
  name = "Shadow Blade Off-hand",
  slug = "shadow_blade_offhand",
  max_range = 30,
}

classData.spells[131511] = {
  spellID = 131511,
  name = "Prey on the Weak",
  slug = "prey_on_the_weak",
}

classData.spells[137034] = {
  spellID = 137034,
  name = "Rogue",
  slug = "rogue",
}

classData.spells[137035] = {
  spellID = 137035,
  name = "Subtlety Rogue",
  slug = "subtlety_rogue",
}

classData.spells[137036] = {
  spellID = 137036,
  name = "Outlaw Rogue",
  slug = "outlaw_rogue",
}

classData.spells[137037] = {
  spellID = 137037,
  name = "Assassination Rogue",
  slug = "assassination_rogue",
}

classData.spells[137619] = {
  spellID = 137619,
  name = "Marked for Death",
  slug = "marked_for_death",
  max_range = 30,
  cooldown = 60.0,
  duration = 60.0,
}

classData.spells[140149] = {
  spellID = 140149,
  name = "Marked for Death",
  slug = "marked_for_death",
}

classData.spells[145210] = {
  spellID = 145210,
  name = "Item - Rogue T16 4P Bonus",
  slug = "item__rogue_t16_4p_bonus",
}

classData.spells[145211] = {
  spellID = 145211,
  name = "Sleight of Hand",
  slug = "sleight_of_hand",
  initial_stacks = 1,
  duration = 10.0,
}

classData.spells[145249] = {
  spellID = 145249,
  name = "Toxicologist",
  slug = "toxicologist",
  max_stacks = 20,
  duration = 5.0,
}

classData.spells[152150] = {
  spellID = 152150,
  name = "Death from Above",
  slug = "death_from_above",
  max_range = 15,
  gcd = 2.0,
  cooldown = 20.0,
  duration = 1.0,
  power = {
    [1] = { resource = "energy", amount = 25, },
    [2] = { resource = "combo_points", amount = 1, max_amount = 4, },
  },
}

classData.spells[152152] = {
  spellID = 152152,
  name = "Venom Rush",
  slug = "venom_rush",
}

classData.spells[154744] = {
  spellID = 154744,
  name = "Expansive Mind",
  slug = "expansive_mind",
}

classData.spells[154904] = {
  spellID = 154904,
  name = "Internal Bleeding",
  slug = "internal_bleeding",
}

classData.spells[154953] = {
  spellID = 154953,
  name = "Internal Bleeding",
  slug = "internal_bleeding",
  max_range = 100,
  duration = 6.0,
  haste_affected_ticks = true,
}

classData.spells[157442] = {
  spellID = 157442,
  name = "Critical Strikes",
  slug = "critical_strikes",
}

classData.spells[158188] = {
  spellID = 158188,
  name = "Stealth",
  slug = "stealth",
}

classData.spells[162697] = {
  spellID = 162697,
  name = "Stat Negation Aura - Agility DPS",
  slug = "stat_negation_aura__agility_dps",
}

classData.spells[163786] = {
  spellID = 163786,
  name = "Death from Above",
  slug = "death_from_above",
  max_range = 15,
  duration = 3.0,
}

classData.spells[173458] = {
  spellID = 173458,
  name = "Backstab",
  slug = "backstab",
  max_range = 5,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 35, },
  },
}

classData.spells[185311] = {
  spellID = 185311,
  name = "Crimson Vial",
  slug = "crimson_vial",
  gcd = 1.0,
  cooldown = 30.0,
  duration = 6.0,
  power = {
    [1] = { resource = "energy", amount = 30, },
  },
}

classData.spells[185313] = {
  spellID = 185313,
  name = "Shadow Dance",
  slug = "shadow_dance",
  charges = 2,
  charge_cooldown = 60.0,
  cooldown = 1.0,
  duration = 5.0,
}

classData.spells[185314] = {
  spellID = 185314,
  name = "Deepening Shadows",
  slug = "deepening_shadows",
}

classData.spells[185438] = {
  spellID = 185438,
  name = "Shadowstrike",
  slug = "shadowstrike",
  max_range = 5,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 40, },
  },
}

classData.spells[185565] = {
  spellID = 185565,
  name = "Poisoned Knife",
  slug = "poisoned_knife",
  max_range = 30,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 40, },
  },
}

classData.spells[185763] = {
  spellID = 185763,
  name = "Pistol Shot",
  slug = "pistol_shot",
  max_range = 20,
  gcd = 1.0,
  duration = 6.0,
  power = {
    [1] = { resource = "energy", amount = 40, },
  },
}

classData.spells[192376] = {
  spellID = 192376,
  name = "Poison Knives",
  slug = "poison_knives",
}

classData.spells[192380] = {
  spellID = 192380,
  name = "Poison Knives",
  slug = "poison_knives",
  max_range = 100,
}

classData.spells[192434] = {
  spellID = 192434,
  name = "From the Shadows",
  slug = "from_the_shadows",
  max_range = 100,
}

classData.spells[192660] = {
  spellID = 192660,
  name = "Poison Bomb",
  slug = "poison_bomb",
  max_range = 100,
}

classData.spells[192759] = {
  spellID = 192759,
  name = "Kingsbane",
  slug = "kingsbane",
  max_range = 5,
  gcd = 1.0,
  cooldown = 45.0,
  duration = 14.0,
  power = {
    [1] = { resource = "energy", amount = 35, },
  },
}

classData.spells[192760] = {
  spellID = 192760,
  name = "Kingsbane",
  slug = "kingsbane",
  max_range = 100,
}

classData.spells[192853] = {
  spellID = 192853,
  name = "Kingsbane",
  slug = "kingsbane",
  max_range = 100,
  max_stacks = 99,
  duration = 20.0,
}

classData.spells[192986] = {
  spellID = 192986,
  name = "Pick Pocket",
  slug = "pick_pocket",
  max_range = 5,
  cooldown = 10.0,
}

classData.spells[193315] = {
  spellID = 193315,
  name = "Sinister Strike",
  slug = "sinister_strike",
  max_range = 5,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 45, },
  },
}

classData.spells[193316] = {
  spellID = 193316,
  name = "Roll the Bones",
  slug = "roll_the_bones",
  max_range = 100,
  gcd = 1.0,
  duration = 6.0,
  power = {
    [1] = { resource = "energy", amount = 25, },
    [2] = { resource = "combo_points", amount = 1, max_amount = 4, },
  },
}

classData.spells[193356] = {
  spellID = 193356,
  name = "Broadsides",
  slug = "broadsides",
}

classData.spells[193357] = {
  spellID = 193357,
  name = "Shark Infested Waters",
  slug = "shark_infested_waters",
}

classData.spells[193358] = {
  spellID = 193358,
  name = "Grand Melee",
  slug = "grand_melee",
}

classData.spells[193359] = {
  spellID = 193359,
  name = "True Bearing",
  slug = "true_bearing",
  internal_cooldown = 0.1,
}

classData.spells[193531] = {
  spellID = 193531,
  name = "Deeper Stratagem",
  slug = "deeper_stratagem",
}

classData.spells[193536] = {
  spellID = 193536,
  name = "Weaponmaster",
  slug = "weaponmaster",
  max_range = 100,
}

classData.spells[193537] = {
  spellID = 193537,
  name = "Weaponmaster",
  slug = "weaponmaster",
  internal_cooldown = 0.5,
}

classData.spells[193538] = {
  spellID = 193538,
  name = "Alacrity",
  slug = "alacrity",
  max_stacks = 5,
  duration = 20.0,
}

classData.spells[193539] = {
  spellID = 193539,
  name = "Alacrity",
  slug = "alacrity",
}

classData.spells[193546] = {
  spellID = 193546,
  name = "Iron Stomach",
  slug = "iron_stomach",
}

classData.spells[193640] = {
  spellID = 193640,
  name = "Elaborate Planning",
  slug = "elaborate_planning",
}

classData.spells[193641] = {
  spellID = 193641,
  name = "Elaborate Planning",
  slug = "elaborate_planning",
  max_stacks = 1,
  duration = 4.0,
}

classData.spells[195452] = {
  spellID = 195452,
  name = "Nightblade",
  slug = "nightblade",
  max_range = 5,
  gcd = 1.0,
  duration = 6.0,
  internal_cooldown = 1.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "energy", amount = 25, },
    [2] = { resource = "combo_points", amount = 1, max_amount = 4, },
  },
}

classData.spells[195457] = {
  spellID = 195457,
  name = "Grappling Hook",
  slug = "grappling_hook",
  max_range = 40,
  gcd = 0.5,
  cooldown = 60.0,
}

classData.spells[195627] = {
  spellID = 195627,
  name = "Opportunity",
  slug = "opportunity",
  initial_stacks = 1,
  duration = 10.0,
}

classData.spells[196819] = {
  spellID = 196819,
  name = "Eviscerate",
  slug = "eviscerate",
  max_range = 5,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 35, },
    [2] = { resource = "combo_points", amount = 1, max_amount = 4, },
  },
}

classData.spells[196861] = {
  spellID = 196861,
  name = "Iron Wire",
  slug = "iron_wire",
}

classData.spells[196864] = {
  spellID = 196864,
  name = "Master Poisoner",
  slug = "master_poisoner",
}

classData.spells[196911] = {
  spellID = 196911,
  name = "Shadow Techniques",
  slug = "shadow_techniques",
  max_range = 50000,
}

classData.spells[196912] = {
  spellID = 196912,
  name = "Shadow Techniques",
  slug = "shadow_techniques",
}

classData.spells[196922] = {
  spellID = 196922,
  name = "Hit and Run",
  slug = "hit_and_run",
}

classData.spells[196924] = {
  spellID = 196924,
  name = "Acrobatic Strikes",
  slug = "acrobatic_strikes",
}

classData.spells[196937] = {
  spellID = 196937,
  name = "Ghostly Strike",
  slug = "ghostly_strike",
  max_range = 5,
  gcd = 1.0,
  cooldown = 35.0,
  duration = 10.0,
  power = {
    [1] = { resource = "energy", amount = 30, },
  },
}

classData.spells[196938] = {
  spellID = 196938,
  name = "Quick Draw",
  slug = "quick_draw",
}

classData.spells[196951] = {
  spellID = 196951,
  name = "Strike from the Shadows",
  slug = "strike_from_the_shadows",
}

classData.spells[196958] = {
  spellID = 196958,
  name = "Strike from the Shadows",
  slug = "strike_from_the_shadows",
  max_range = 50000,
  duration = 2.0,
}

classData.spells[196976] = {
  spellID = 196976,
  name = "Master of Shadows",
  slug = "master_of_shadows",
}

classData.spells[196980] = {
  spellID = 196980,
  name = "Master of Shadows",
  slug = "master_of_shadows",
  duration = 3.0,
}

classData.spells[197393] = {
  spellID = 197393,
  name = "Finality: Eviscerate",
  slug = "finality_eviscerate",
  max_range = 5,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 35, },
    [2] = { resource = "combo_points", amount = 1, max_amount = 4, },
  },
}

classData.spells[197395] = {
  spellID = 197395,
  name = "Finality: Nightblade",
  slug = "finality_nightblade",
  max_range = 5,
  gcd = 1.0,
  duration = 6.0,
  power = {
    [1] = { resource = "energy", amount = 25, },
    [2] = { resource = "combo_points", amount = 1, max_amount = 4, },
  },
}

classData.spells[197496] = {
  spellID = 197496,
  name = "Finality: Eviscerate",
  slug = "finality_eviscerate",
  duration = 30.0,
}

classData.spells[197498] = {
  spellID = 197498,
  name = "Finality: Nightblade",
  slug = "finality_nightblade",
  duration = 30.0,
}

classData.spells[197611] = {
  spellID = 197611,
  name = "Second Shuriken",
  slug = "second_shuriken",
  max_range = 100,
}

classData.spells[197800] = {
  spellID = 197800,
  name = "Shadow Nova",
  slug = "shadow_nova",
}

classData.spells[197835] = {
  spellID = 197835,
  name = "Shuriken Storm",
  slug = "shuriken_storm",
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 35, },
  },
}

classData.spells[199600] = {
  spellID = 199600,
  name = "Buried Treasure",
  slug = "buried_treasure",
}

classData.spells[199603] = {
  spellID = 199603,
  name = "Jolly Roger",
  slug = "jolly_roger",
}

classData.spells[199672] = {
  spellID = 199672,
  name = "Rupture",
  slug = "rupture",
  max_range = 100,
}

classData.spells[199736] = {
  spellID = 199736,
  name = "Find Treasure",
  slug = "find_treasure",
  cooldown = 1.5,
}

classData.spells[199753] = {
  spellID = 199753,
  name = "Riposte",
  slug = "riposte",
  max_range = 50000,
  gcd = 1.0,
}

classData.spells[199754] = {
  spellID = 199754,
  name = "Riposte",
  slug = "riposte",
  cooldown = 120.0,
  duration = 10.0,
  internal_cooldown = 1.0,
}

classData.spells[199804] = {
  spellID = 199804,
  name = "Between the Eyes",
  slug = "between_the_eyes",
  max_range = 20,
  gcd = 1.0,
  cooldown = 30.0,
  power = {
    [1] = { resource = "energy", amount = 25, },
    [2] = { resource = "combo_points", amount = 1, max_amount = 4, },
  },
}

classData.spells[200733] = {
  spellID = 200733,
  name = "Weaponmaster",
  slug = "weaponmaster",
}

classData.spells[200749] = {
  spellID = 200749,
  name = "Activating Specialization",
  slug = "activating_specialization",
  max_range = 50000,
  channeled = true,
}

classData.spells[200758] = {
  spellID = 200758,
  name = "Gloomblade",
  slug = "gloomblade",
  max_range = 5,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 35, },
  },
}

classData.spells[200759] = {
  spellID = 200759,
  name = "Soothing Darkness",
  slug = "soothing_darkness",
}

classData.spells[200802] = {
  spellID = 200802,
  name = "Agonizing Poison",
  slug = "agonizing_poison",
  duration = 3600.0,
}

classData.spells[200803] = {
  spellID = 200803,
  name = "Agonizing Poison",
  slug = "agonizing_poison",
  max_range = 100,
  max_stacks = 5,
  duration = 12.0,
}

classData.spells[200806] = {
  spellID = 200806,
  name = "Exsanguinate",
  slug = "exsanguinate",
  max_range = 5,
  gcd = 1.0,
  cooldown = 45.0,
  power = {
    [1] = { resource = "energy", amount = 25, },
  },
}

classData.spells[202665] = {
  spellID = 202665,
  name = "Curse of the Dreadblades",
  slug = "curse_of_the_dreadblades",
  cooldown = 90.0,
  duration = 12.0,
}

classData.spells[202668] = {
  spellID = 202668,
  name = "Curse of the Dreadblades",
  slug = "curse_of_the_dreadblades",
}

classData.spells[202669] = {
  spellID = 202669,
  name = "Curse of the Dreadblades",
  slug = "curse_of_the_dreadblades",
}

classData.spells[202822] = {
  spellID = 202822,
  name = "Greed",
  slug = "greed",
}

classData.spells[202823] = {
  spellID = 202823,
  name = "Greed",
  slug = "greed",
}

classData.spells[202848] = {
  spellID = 202848,
  name = "Blunderbuss",
  slug = "blunderbuss",
  duration = 10.0,
}

classData.spells[202895] = {
  spellID = 202895,
  name = "Blunderbuss",
  slug = "blunderbuss",
  max_range = 20,
  gcd = 1.0,
  duration = 6.0,
  power = {
    [1] = { resource = "energy", amount = 40, },
  },
}

classData.spells[202897] = {
  spellID = 202897,
  name = "Blunderbuss",
  slug = "blunderbuss",
}

classData.spells[206760] = {
  spellID = 206760,
  name = "Night Terrors",
  slug = "night_terrors",
  max_range = 5,
  max_stacks = 1,
  duration = 8.0,
}

classData.spells[207777] = {
  spellID = 207777,
  name = "Dismantle",
  slug = "dismantle",
  max_range = 5,
  gcd = 1.0,
  cooldown = 45.0,
  duration = 6.0,
  power = {
    [1] = { resource = "energy", amount = 25, },
  },
}

classData.spells[209041] = {
  spellID = 209041,
  name = "Insignia of Ravenholdt",
  slug = "insignia_of_ravenholdt",
}

classData.spells[209782] = {
  spellID = 209782,
  name = "Goremaw's Bite",
  slug = "goremaws_bite",
  max_range = 8,
  gcd = 1.0,
  cooldown = 60.0,
}

classData.spells[209783] = {
  spellID = 209783,
  name = "Goremaw's Bite",
  slug = "goremaws_bite",
  max_range = 8,
}

classData.spells[209784] = {
  spellID = 209784,
  name = "Goremaw's Bite",
  slug = "goremaws_bite",
  max_range = 8,
}

classData.spells[209786] = {
  spellID = 209786,
  name = "Goremaw's Bite",
  slug = "goremaws_bite",
  max_range = 8,
  max_stacks = 1,
  duration = 8.0,
}

classData.spells[210108] = {
  spellID = 210108,
  name = "Detection",
  slug = "detection",
}

classData.spells[212198] = {
  spellID = 212198,
  name = "Crimson Vial",
  slug = "crimson_vial",
  cooldown = 60.0,
  duration = 6.0,
}

classData.spells[212205] = {
  spellID = 212205,
  name = "Create: Crimson Vial",
  slug = "create_crimson_vial",
  charges = 3,
  charge_cooldown = 60.0,
  gcd = 1.5,
}

classData.spells[212283] = {
  spellID = 212283,
  name = "Symbols of Death",
  slug = "symbols_of_death",
  charges = 1,
  charge_cooldown = 30.0,
  gcd = 1.0,
  duration = 10.0,
}

classData.spells[220893] = {
  spellID = 220893,
  name = "Soul Rip",
  slug = "soul_rip",
  max_range = 100,
}

classData.spells[220901] = {
  spellID = 220901,
  name = "Goremaw's Bite",
  slug = "goremaws_bite",
  max_range = 8,
  duration = 6.0,
}

classData.spells[221622] = {
  spellID = 221622,
  name = "Thick as Thieves",
  slug = "thick_as_thieves",
}

classData.spells[222018] = {
  spellID = 222018,
  name = "Nightblade",
  slug = "nightblade",
  max_range = 100,
}

classData.spells[222062] = {
  spellID = 222062,
  name = "Kingsbane",
  slug = "kingsbane",
  max_range = 100,
}

classData.spells[222775] = {
  spellID = 222775,
  name = "Strike from the Shadows",
  slug = "strike_from_the_shadows",
  max_range = 50000,
  duration = 5.0,
}

classData.spells[231691] = {
  spellID = 231691,
  name = "Sprint",
  slug = "sprint",
}

classData.spells[231716] = {
  spellID = 231716,
  name = "Eviscerate",
  slug = "eviscerate",
}

classData.spells[231718] = {
  spellID = 231718,
  name = "Shadowstrike",
  slug = "shadowstrike",
}

classData.spells[231719] = {
  spellID = 231719,
  name = "Garrote",
  slug = "garrote",
}

classData.spells[235484] = {
  spellID = 235484,
  name = "Between the Eyes",
  slug = "between_the_eyes",
}

classData.spells[238103] = {
  spellID = 238103,
  name = "Dreadblade's Vigor",
  slug = "dreadblades_vigor",
}

classData.spells[238104] = {
  spellID = 238104,
  name = "Enveloping Shadows",
  slug = "enveloping_shadows",
}

classData.spells[245388] = {
  spellID = 245388,
  name = "Toxic Blade",
  slug = "toxic_blade",
  max_range = 5,
  gcd = 1.0,
  cooldown = 25.0,
  power = {
    [1] = { resource = "energy", amount = 20, },
  },
}

classData.spells[245389] = {
  spellID = 245389,
  name = "Toxic Blade",
  slug = "toxic_blade",
  max_range = 100,
  duration = 9.0,
}

classData.spells[245623] = {
  spellID = 245623,
  name = "Shadowstrike",
  slug = "shadowstrike",
}

classData.spells[245639] = {
  spellID = 245639,
  name = "Shuriken Combo",
  slug = "shuriken_combo",
}

classData.spells[245640] = {
  spellID = 245640,
  name = "Shuriken Combo",
  slug = "shuriken_combo",
  max_stacks = 5,
  duration = 15.0,
}

classData.spells[245687] = {
  spellID = 245687,
  name = "Dark Shadow",
  slug = "dark_shadow",
}

classData.spells[245751] = {
  spellID = 245751,
  name = "Sprint",
  slug = "sprint",
}

classData.spells[245752] = {
  spellID = 245752,
  name = "Sprint",
  slug = "sprint",
}

classData.spells[246558] = {
  spellID = 246558,
  name = "Lesser Adrenaline Rush",
  slug = "lesser_adrenaline_rush",
  cooldown = 180.0,
  duration = 8.0,
}

classData.spells[251463] = {
  spellID = 251463,
  name = "Vindicaar Matrix Crystal",
  slug = "vindicaar_matrix_crystal",
  gcd = 1.5,
}

classData.spells[255529] = {
  spellID = 255529,
  name = "Vindicaar Matrix Crystal",
  slug = "vindicaar_matrix_crystal",
}

classData.spells[255544] = {
  spellID = 255544,
  name = "Poison Bomb",
  slug = "poison_bomb",
}

classData.spells[255545] = {
  spellID = 255545,
  name = "Poison Bomb",
  slug = "poison_bomb",
  max_range = 100,
  duration = 2.0,
}

classData.spells[255546] = {
  spellID = 255546,
  name = "Poison Bomb",
  slug = "poison_bomb",
  max_range = 100,
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

classData.spells[255909] = {
  spellID = 255909,
  name = "Prey on the Weak",
  slug = "prey_on_the_weak",
  max_range = 100,
  duration = 6.0,
}

classData.spells[255989] = {
  spellID = 255989,
  name = "Master Assassin",
  slug = "master_assassin",
}

classData.spells[256148] = {
  spellID = 256148,
  name = "Iron Wire",
  slug = "iron_wire",
  max_range = 100,
  duration = 8.0,
}

classData.spells[256165] = {
  spellID = 256165,
  name = "Blinding Powder",
  slug = "blinding_powder",
}

classData.spells[256170] = {
  spellID = 256170,
  name = "Loaded Dice",
  slug = "loaded_dice",
}

classData.spells[256171] = {
  spellID = 256171,
  name = "Loaded Dice",
  slug = "loaded_dice",
  initial_stacks = 1,
  duration = 45.0,
}

classData.spells[256188] = {
  spellID = 256188,
  name = "Retractable Hook",
  slug = "retractable_hook",
}

classData.spells[256495] = {
  spellID = 256495,
  name = "Vendetta",
  slug = "vendetta",
  duration = 3.0,
}

classData.spells[256735] = {
  spellID = 256735,
  name = "Master Assassin",
  slug = "master_assassin",
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

classData.spells[257505] = {
  spellID = 257505,
  name = "Shot in the Dark",
  slug = "shot_in_the_dark",
}

classData.spells[270061] = {
  spellID = 270061,
  name = "Hidden Blades",
  slug = "hidden_blades",
}

classData.spells[270070] = {
  spellID = 270070,
  name = "Hidden Blades",
  slug = "hidden_blades",
  max_stacks = 20,
}

classData.spells[271464] = {
  spellID = 271464,
  name = "Coming Soon",
  slug = "coming_soon",
}

classData.spells[271877] = {
  spellID = 271877,
  name = "Blade Rush",
  slug = "blade_rush",
  max_range = 20,
  gcd = 1.0,
  cooldown = 45.0,
}

classData.spells[271881] = {
  spellID = 271881,
  name = "Blade Rush",
  slug = "blade_rush",
  max_range = 20,
}

classData.spells[271896] = {
  spellID = 271896,
  name = "Blade Rush",
  slug = "blade_rush",
  duration = 5.0,
}

classData.spells[272026] = {
  spellID = 272026,
  name = "Dancing Steel",
  slug = "dancing_steel",
}
