----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BfA only.
----------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(4, GetBuildInfo()) < 80000 then
    return
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Class check
----------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(3, UnitClass('player')) ~= 1 then return end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
local addonName, TJ = ...
TJ.ClassData = TJ.ClassData or {}
TJ.ClassData[1] = TJ.ClassData[1] or {}
local classData = TJ.ClassData[1]
classData.spells = classData.spells or {}

classData.spells[71] = {
  spellID = 71,
  name = "Defensive Stance",
  slug = "defensive_stance",
  internal_cooldown = 0.5,
}

classData.spells[100] = {
  spellID = 100,
  name = "Charge",
  slug = "charge",
  min_range = 8,
  max_range = 25,
  charges = 1,
  charge_cooldown = 20.0,
  gcd = 0.5,
  cooldown = 1.5,
}

classData.spells[107] = {
  spellID = 107,
  name = "Block",
  slug = "block",
}

classData.spells[355] = {
  spellID = 355,
  name = "Taunt",
  slug = "taunt",
  max_range = 30,
  cooldown = 8.0,
  duration = 3.0,
}

classData.spells[674] = {
  spellID = 674,
  name = "Dual Wield",
  slug = "dual_wield",
}

classData.spells[772] = {
  spellID = 772,
  name = "Rend",
  slug = "rend",
  max_range = 5,
  gcd = 1.5,
  duration = 12.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "rage", amount = 30, },
  },
}

classData.spells[845] = {
  spellID = 845,
  name = "Cleave",
  slug = "cleave",
  max_range = 5,
  gcd = 1.5,
  cooldown = 6.0,
  power = {
    [1] = { resource = "rage", amount = 20, },
  },
}

classData.spells[871] = {
  spellID = 871,
  name = "Shield Wall",
  slug = "shield_wall",
  cooldown = 240.0,
  duration = 8.0,
}

classData.spells[1160] = {
  spellID = 1160,
  name = "Demoralizing Shout",
  slug = "demoralizing_shout",
  gcd = 1.5,
  cooldown = 45.0,
  duration = 8.0,
}

classData.spells[1464] = {
  spellID = 1464,
  name = "Slam",
  slug = "slam",
  max_range = 5,
  gcd = 1.5,
  power = {
    [1] = { resource = "rage", amount = 20, },
  },
}

classData.spells[1680] = {
  spellID = 1680,
  name = "Whirlwind",
  slug = "whirlwind",
  gcd = 1.5,
  power = {
    [1] = { resource = "rage", amount = 30, },
  },
}

classData.spells[1715] = {
  spellID = 1715,
  name = "Hamstring",
  slug = "hamstring",
  max_range = 5,
  gcd = 1.5,
  duration = 15.0,
  power = {
    [1] = { resource = "rage", amount = 10, },
  },
}

classData.spells[1719] = {
  spellID = 1719,
  name = "Recklessness",
  slug = "recklessness",
  gcd = 1.5,
  cooldown = 60.0,
  duration = 6.0,
}

classData.spells[2565] = {
  spellID = 2565,
  name = "Shield Block",
  slug = "shield_block",
  charges = 1,
  charge_cooldown = 13.0,
  cooldown = 1.0,
  power = {
    [1] = { resource = "rage", amount = 40, },
  },
}

classData.spells[3127] = {
  spellID = 3127,
  name = "Parry",
  slug = "parry",
}

classData.spells[5246] = {
  spellID = 5246,
  name = "Intimidating Shout",
  slug = "intimidating_shout",
  max_range = 8,
  gcd = 1.5,
  cooldown = 90.0,
  duration = 8.0,
}

classData.spells[5301] = {
  spellID = 5301,
  name = "Revenge Trigger",
  slug = "revenge_trigger",
  internal_cooldown = 3.0,
}

classData.spells[5302] = {
  spellID = 5302,
  name = "Revenge!",
  slug = "revenge",
  initial_stacks = 1,
  duration = 6.0,
}

classData.spells[5308] = {
  spellID = 5308,
  name = "Execute",
  slug = "execute",
  max_range = 5,
  gcd = 1.5,
  power = {
    [1] = { resource = "rage", amount = 25, },
  },
}

classData.spells[6343] = {
  spellID = 6343,
  name = "Thunder Clap",
  slug = "thunder_clap",
  gcd = 1.5,
  cooldown = 6.0,
  duration = 10.0,
}

classData.spells[6544] = {
  spellID = 6544,
  name = "Heroic Leap",
  slug = "heroic_leap",
  min_range = 8,
  max_range = 40,
  charges = 1,
  charge_cooldown = 45.0,
  gcd = 0.5,
  cooldown = 0.8,
}

classData.spells[6552] = {
  spellID = 6552,
  name = "Pummel",
  slug = "pummel",
  max_range = 5,
  cooldown = 15.0,
  duration = 4.0,
}

classData.spells[6572] = {
  spellID = 6572,
  name = "Revenge",
  slug = "revenge",
  max_range = 5,
  gcd = 1.5,
  cooldown = 3.0,
  power = {
    [1] = { resource = "rage", amount = 30, },
  },
}

classData.spells[6673] = {
  spellID = 6673,
  name = "Battle Shout",
  slug = "battle_shout",
  gcd = 1.5,
  duration = 3600.0,
}

classData.spells[7384] = {
  spellID = 7384,
  name = "Overpower",
  slug = "overpower",
  max_range = 5,
  max_stacks = 2,
  charges = 1,
  charge_cooldown = 12.0,
  gcd = 1.5,
  duration = 15.0,
}

classData.spells[7922] = {
  spellID = 7922,
  name = "Warbringer",
  slug = "warbringer",
  max_range = 50000,
}

classData.spells[12292] = {
  spellID = 12292,
  name = "Bloodbath",
  slug = "bloodbath",
  max_range = 5,
  gcd = 1.5,
  cooldown = 40.0,
}

classData.spells[12294] = {
  spellID = 12294,
  name = "Mortal Strike",
  slug = "mortal_strike",
  max_range = 5,
  gcd = 1.5,
  cooldown = 6.0,
  power = {
    [1] = { resource = "rage", amount = 30, },
  },
}

classData.spells[12323] = {
  spellID = 12323,
  name = "Piercing Howl",
  slug = "piercing_howl",
  gcd = 1.5,
  duration = 15.0,
  power = {
    [1] = { resource = "rage", amount = 10, },
  },
}

classData.spells[12950] = {
  spellID = 12950,
  name = "Whirlwind",
  slug = "whirlwind",
  internal_cooldown = 0.5,
}

classData.spells[12975] = {
  spellID = 12975,
  name = "Last Stand",
  slug = "last_stand",
  cooldown = 180.0,
  duration = 15.0,
}

classData.spells[18499] = {
  spellID = 18499,
  name = "Berserker Rage",
  slug = "berserker_rage",
  cooldown = 60.0,
  duration = 6.0,
}

classData.spells[20243] = {
  spellID = 20243,
  name = "Devastate",
  slug = "devastate",
  max_range = 5,
  max_stacks = 3,
  gcd = 1.5,
}

classData.spells[20572] = {
  spellID = 20572,
  name = "Blood Fury",
  slug = "blood_fury",
  cooldown = 120.0,
  duration = 15.0,
}

classData.spells[21563] = {
  spellID = 21563,
  name = "Command",
  slug = "command",
}

classData.spells[23881] = {
  spellID = 23881,
  name = "Bloodthirst",
  slug = "bloodthirst",
  max_range = 5,
  gcd = 1.5,
  cooldown = 4.5,
}

classData.spells[23920] = {
  spellID = 23920,
  name = "Spell Reflection",
  slug = "spell_reflection",
  initial_stacks = 1,
  charges = 1,
  charge_cooldown = 25.0,
  cooldown = 1.0,
  duration = 5.0,
}

classData.spells[23922] = {
  spellID = 23922,
  name = "Shield Slam",
  slug = "shield_slam",
  max_range = 5,
  gcd = 1.5,
  cooldown = 9.0,
}

classData.spells[24428] = {
  spellID = 24428,
  name = "Improved Hamstring",
  slug = "improved_hamstring",
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

classData.spells[29725] = {
  spellID = 29725,
  name = "Sudden Death",
  slug = "sudden_death",
  internal_cooldown = 3.0,
}

classData.spells[29838] = {
  spellID = 29838,
  name = "Second Wind",
  slug = "second_wind",
}

classData.spells[32215] = {
  spellID = 32215,
  name = "Victorious State",
  slug = "victorious_state",
}

classData.spells[32216] = {
  spellID = 32216,
  name = "Victorious",
  slug = "victorious",
  duration = 20.0,
}

classData.spells[34428] = {
  spellID = 34428,
  name = "Victory Rush",
  slug = "victory_rush",
  max_range = 5,
  gcd = 1.5,
}

classData.spells[44949] = {
  spellID = 44949,
  name = "Whirlwind Off-Hand",
  slug = "whirlwind_offhand",
}

classData.spells[46917] = {
  spellID = 46917,
  name = "Titan's Grip",
  slug = "titans_grip",
}

classData.spells[46924] = {
  spellID = 46924,
  name = "Bladestorm",
  slug = "bladestorm",
  gcd = 1.5,
  cooldown = 90.0,
  duration = 6.0,
  haste_affected_ticks = true,
}

classData.spells[46968] = {
  spellID = 46968,
  name = "Shockwave",
  slug = "shockwave",
  gcd = 1.5,
  cooldown = 30.0,
}

classData.spells[50622] = {
  spellID = 50622,
  name = "Bladestorm",
  slug = "bladestorm",
}

classData.spells[52174] = {
  spellID = 52174,
  name = "Heroic Leap",
  slug = "heroic_leap",
  max_range = 50000,
}

classData.spells[57755] = {
  spellID = 57755,
  name = "Heroic Throw",
  slug = "heroic_throw",
  min_range = 8,
  max_range = 30,
  gcd = 1.5,
  cooldown = 6.0,
}

classData.spells[58099] = {
  spellID = 58099,
  name = "Glyph of Gushing Wound",
  slug = "glyph_of_gushing_wound",
}

classData.spells[58104] = {
  spellID = 58104,
  name = "Glyph of Mighty Victory",
  slug = "glyph_of_mighty_victory",
}

classData.spells[58279] = {
  spellID = 58279,
  name = "Gushing Wound",
  slug = "gushing_wound",
}

classData.spells[58281] = {
  spellID = 58281,
  name = "Mighty Victory",
  slug = "mighty_victory",
}

classData.spells[60503] = {
  spellID = 60503,
  name = "Overpower!",
  slug = "overpower",
  initial_stacks = 1,
  duration = 12.0,
}

classData.spells[68163] = {
  spellID = 68163,
  name = "Thunder Strike",
  slug = "thunder_strike",
}

classData.spells[68164] = {
  spellID = 68164,
  name = "Glyph of Thunder Strike",
  slug = "glyph_of_thunder_strike",
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

classData.spells[69179] = {
  spellID = 69179,
  name = "Arcane Torrent",
  slug = "arcane_torrent",
  gcd = 1.5,
  cooldown = 90.0,
}

classData.spells[76856] = {
  spellID = 76856,
  name = "Mastery: Unshackled Fury",
  slug = "mastery_unshackled_fury",
}

classData.spells[76857] = {
  spellID = 76857,
  name = "Mastery: Critical Block",
  slug = "mastery_critical_block",
}

classData.spells[85288] = {
  spellID = 85288,
  name = "Raging Blow",
  slug = "raging_blow",
  max_range = 5,
  gcd = 1.5,
}

classData.spells[85384] = {
  spellID = 85384,
  name = "Raging Blow",
  slug = "raging_blow",
  max_range = 100,
}

classData.spells[85739] = {
  spellID = 85739,
  name = "Meat Cleaver",
  slug = "meat_cleaver",
  initial_stacks = 1,
  duration = 20.0,
}

classData.spells[86101] = {
  spellID = 86101,
  name = "Plate Specialization",
  slug = "plate_specialization",
}

classData.spells[86110] = {
  spellID = 86110,
  name = "Plate Specialization",
  slug = "plate_specialization",
}

classData.spells[86535] = {
  spellID = 86535,
  name = "Plate Specialization",
  slug = "plate_specialization",
}

classData.spells[88163] = {
  spellID = 88163,
  name = "Attack",
  slug = "attack",
}

classData.spells[94293] = {
  spellID = 94293,
  name = "Altered Form",
  slug = "altered_form",
}

classData.spells[95738] = {
  spellID = 95738,
  name = "Bladestorm Off-Hand",
  slug = "bladestorm_offhand",
}

classData.spells[96103] = {
  spellID = 96103,
  name = "Raging Blow",
  slug = "raging_blow",
  max_range = 100,
}

classData.spells[97462] = {
  spellID = 97462,
  name = "Rallying Cry",
  slug = "rallying_cry",
  gcd = 1.5,
  cooldown = 180.0,
}

classData.spells[97463] = {
  spellID = 97463,
  name = "Rallying Cry",
  slug = "rallying_cry",
  max_range = 100,
  duration = 10.0,
}

classData.spells[100130] = {
  spellID = 100130,
  name = "Furious Slash",
  slug = "furious_slash",
  max_range = 5,
  gcd = 1.5,
}

classData.spells[103827] = {
  spellID = 103827,
  name = "Double Time",
  slug = "double_time",
}

classData.spells[103828] = {
  spellID = 103828,
  name = "Warbringer",
  slug = "warbringer",
}

classData.spells[105771] = {
  spellID = 105771,
  name = "Charge",
  slug = "charge",
  max_range = 50000,
  duration = 1.0,
}

classData.spells[107570] = {
  spellID = 107570,
  name = "Storm Bolt",
  slug = "storm_bolt",
  max_range = 20,
  gcd = 1.5,
  cooldown = 30.0,
}

classData.spells[107574] = {
  spellID = 107574,
  name = "Avatar",
  slug = "avatar",
  gcd = 1.5,
  cooldown = 90.0,
  duration = 20.0,
}

classData.spells[112792] = {
  spellID = 112792,
  name = "Hawk Feast",
  slug = "hawk_feast",
}

classData.spells[112793] = {
  spellID = 112793,
  name = "Burning Anger",
  slug = "burning_anger",
}

classData.spells[113344] = {
  spellID = 113344,
  name = "Bloodbath",
  slug = "bloodbath",
  max_range = 100,
  duration = 6.0,
}

classData.spells[115767] = {
  spellID = 115767,
  name = "Deep Wounds",
  slug = "deep_wounds",
  max_range = 100,
  duration = 15.0,
  haste_affected_ticks = true,
}

classData.spells[115768] = {
  spellID = 115768,
  name = "Deep Wounds",
  slug = "deep_wounds",
}

classData.spells[115804] = {
  spellID = 115804,
  name = "Mortal Wounds",
  slug = "mortal_wounds",
  max_range = 100,
  duration = 10.0,
}

classData.spells[115942] = {
  spellID = 115942,
  name = "Glyph of Thunder Strike",
  slug = "glyph_of_thunder_strike",
}

classData.spells[115943] = {
  spellID = 115943,
  name = "Glyph of Hawk Feast",
  slug = "glyph_of_hawk_feast",
}

classData.spells[115944] = {
  spellID = 115944,
  name = "Hawk Feast",
  slug = "hawk_feast",
  max_range = 5,
}

classData.spells[115946] = {
  spellID = 115946,
  name = "Glyph of Burning Anger",
  slug = "glyph_of_burning_anger",
}

classData.spells[115993] = {
  spellID = 115993,
  name = "Burning Anger",
  slug = "burning_anger",
  max_range = 100,
  duration = 5.0,
}

classData.spells[117313] = {
  spellID = 117313,
  name = "Bloodthirst Heal",
  slug = "bloodthirst_heal",
}

classData.spells[118000] = {
  spellID = 118000,
  name = "Dragon Roar",
  slug = "dragon_roar",
  gcd = 1.5,
  cooldown = 25.0,
  duration = 6.0,
}

classData.spells[118038] = {
  spellID = 118038,
  name = "Die by the Sword",
  slug = "die_by_the_sword",
  cooldown = 180.0,
  duration = 8.0,
}

classData.spells[118779] = {
  spellID = 118779,
  name = "Victory Rush",
  slug = "victory_rush",
  max_range = 5,
  gcd = 1.5,
  cooldown = 30.0,
  duration = 6.0,
}

classData.spells[119938] = {
  spellID = 119938,
  name = "Overpower",
  slug = "overpower",
}

classData.spells[123779] = {
  spellID = 123779,
  name = "Glyph of the Blazing Trail",
  slug = "glyph_of_the_blazing_trail",
}

classData.spells[123780] = {
  spellID = 123780,
  name = "Blazing Trail",
  slug = "blazing_trail",
}

classData.spells[123829] = {
  spellID = 123829,
  name = "Block",
  slug = "block",
}

classData.spells[125565] = {
  spellID = 125565,
  name = "Demoralizing Shout",
  slug = "demoralizing_shout",
  duration = 9.0,
}

classData.spells[126664] = {
  spellID = 126664,
  name = "Charge",
  slug = "charge",
  max_range = 50000,
}

classData.spells[132168] = {
  spellID = 132168,
  name = "Shockwave",
  slug = "shockwave",
  max_range = 50000,
  duration = 2.0,
}

classData.spells[132169] = {
  spellID = 132169,
  name = "Storm Bolt",
  slug = "storm_bolt",
  max_range = 30,
  duration = 4.0,
}

classData.spells[132404] = {
  spellID = 132404,
  name = "Shield Block",
  slug = "shield_block",
  duration = 4.0,
}

classData.spells[137047] = {
  spellID = 137047,
  name = "Warrior",
  slug = "warrior",
  internal_cooldown = 0.5,
}

classData.spells[137048] = {
  spellID = 137048,
  name = "Protection Warrior",
  slug = "protection_warrior",
}

classData.spells[137049] = {
  spellID = 137049,
  name = "Arms Warrior",
  slug = "arms_warrior",
}

classData.spells[137050] = {
  spellID = 137050,
  name = "Fury Warrior",
  slug = "fury_warrior",
}

classData.spells[144441] = {
  spellID = 144441,
  name = "Item - Warrior T16 DPS 4P Bonus",
  slug = "item__warrior_t16_dps_4p_bonus",
}

classData.spells[144442] = {
  spellID = 144442,
  name = "Death Sentence",
  slug = "death_sentence",
  initial_stacks = 1,
  duration = 12.0,
}

classData.spells[146974] = {
  spellID = 146974,
  name = "Glyph of the Weaponmaster",
  slug = "glyph_of_the_weaponmaster",
}

classData.spells[147367] = {
  spellID = 147367,
  name = "Weaponmaster",
  slug = "weaponmaster",
  duration = 600.0,
}

classData.spells[147833] = {
  spellID = 147833,
  name = "Intervene",
  slug = "intervene",
  max_range = 25,
  initial_stacks = 1,
  duration = 10.0,
}

classData.spells[148114] = {
  spellID = 148114,
  name = "Weaponmaster",
  slug = "weaponmaster",
}

classData.spells[152277] = {
  spellID = 152277,
  name = "Ravager",
  slug = "ravager",
  max_range = 40,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 7.0,
  haste_affected_ticks = true,
}

classData.spells[152278] = {
  spellID = 152278,
  name = "Anger Management",
  slug = "anger_management",
}

classData.spells[154746] = {
  spellID = 154746,
  name = "Expansive Mind",
  slug = "expansive_mind",
}

classData.spells[156287] = {
  spellID = 156287,
  name = "Ravager",
  slug = "ravager",
  max_range = 100,
}

classData.spells[162698] = {
  spellID = 162698,
  name = "Stat Negation Aura - Strength DPS",
  slug = "stat_negation_aura__strength_dps",
}

classData.spells[162702] = {
  spellID = 162702,
  name = "Stat Negation Aura - Strength Tank",
  slug = "stat_negation_aura__strength_tank",
  replaces_spell_id = 162698,
}

classData.spells[163201] = {
  spellID = 163201,
  name = "Execute",
  slug = "execute",
  max_range = 5,
  gcd = 1.5,
  power = {
    [1] = { resource = "rage", amount = 20, max_amount = 20, },
  },
}

classData.spells[163558] = {
  spellID = 163558,
  name = "Execute Off-Hand",
  slug = "execute_offhand",
  max_range = 5,
  gcd = 1.5,
}

classData.spells[167105] = {
  spellID = 167105,
  name = "Colossus Smash",
  slug = "colossus_smash",
  max_range = 5,
  gcd = 1.5,
  cooldown = 45.0,
}

classData.spells[184361] = {
  spellID = 184361,
  name = "Enrage",
  slug = "enrage",
}

classData.spells[184362] = {
  spellID = 184362,
  name = "Enrage",
  slug = "enrage",
  duration = 6.0,
}

classData.spells[184364] = {
  spellID = 184364,
  name = "Enraged Regeneration",
  slug = "enraged_regeneration",
  cooldown = 120.0,
  duration = 8.0,
}

classData.spells[184367] = {
  spellID = 184367,
  name = "Rampage",
  slug = "rampage",
  max_range = 5,
  gcd = 2.0,
  cooldown = 1.5,
  power = {
    [1] = { resource = "rage", amount = 85, },
  },
}

classData.spells[184707] = {
  spellID = 184707,
  name = "Rampage",
  slug = "rampage",
  max_range = 8,
}

classData.spells[184709] = {
  spellID = 184709,
  name = "Rampage",
  slug = "rampage",
  max_range = 8,
}

classData.spells[184783] = {
  spellID = 184783,
  name = "Tactician",
  slug = "tactician",
}

classData.spells[188672] = {
  spellID = 188672,
  name = "Reflective Plating",
  slug = "reflective_plating",
}

classData.spells[190411] = {
  spellID = 190411,
  name = "Whirlwind",
  slug = "whirlwind",
  gcd = 1.5,
}

classData.spells[197690] = {
  spellID = 197690,
  name = "Defensive Stance",
  slug = "defensive_stance",
  cooldown = 6.0,
}

classData.spells[198304] = {
  spellID = 198304,
  name = "Intercept",
  slug = "intercept",
  replaces_spell_id = 100,
  min_range = 8,
  max_range = 25,
  charges = 1,
  charge_cooldown = 20.0,
  gcd = 0.5,
  cooldown = 1.5,
}

classData.spells[198758] = {
  spellID = 198758,
  name = "Intercept",
  slug = "intercept",
  max_range = 25,
  charges = 1,
  charge_cooldown = 20.0,
  cooldown = 1.5,
}

classData.spells[199023] = {
  spellID = 199023,
  name = "Morale Killer",
  slug = "morale_killer",
}

classData.spells[199042] = {
  spellID = 199042,
  name = "Thunderstruck",
  slug = "thunderstruck",
  max_range = 50000,
  duration = 1.0,
}

classData.spells[199045] = {
  spellID = 199045,
  name = "Thunderstruck",
  slug = "thunderstruck",
}

classData.spells[199114] = {
  spellID = 199114,
  name = "Warrior Intervene Charge Clear",
  slug = "warrior_intervene_charge_clear",
}

classData.spells[199658] = {
  spellID = 199658,
  name = "Whirlwind",
  slug = "whirlwind",
}

classData.spells[199667] = {
  spellID = 199667,
  name = "Whirlwind",
  slug = "whirlwind",
}

classData.spells[199850] = {
  spellID = 199850,
  name = "Whirlwind",
  slug = "whirlwind",
}

classData.spells[200749] = {
  spellID = 200749,
  name = "Activating Specialization",
  slug = "activating_specialization",
  max_range = 50000,
  channeled = true,
}

classData.spells[201363] = {
  spellID = 201363,
  name = "Rampage",
  slug = "rampage",
  max_range = 8,
}

classData.spells[201364] = {
  spellID = 201364,
  name = "Rampage",
  slug = "rampage",
  max_range = 8,
}

classData.spells[202095] = {
  spellID = 202095,
  name = "Indomitable",
  slug = "indomitable",
}

classData.spells[202147] = {
  spellID = 202147,
  name = "Second Wind",
  slug = "second_wind",
}

classData.spells[202149] = {
  spellID = 202149,
  name = "Second Wind",
  slug = "second_wind",
  duration = 5.0,
}

classData.spells[202163] = {
  spellID = 202163,
  name = "Bounding Stride",
  slug = "bounding_stride",
}

classData.spells[202164] = {
  spellID = 202164,
  name = "Bounding Stride",
  slug = "bounding_stride",
  duration = 3.0,
}

classData.spells[202166] = {
  spellID = 202166,
  name = "Impending Victory",
  slug = "impending_victory",
}

classData.spells[202168] = {
  spellID = 202168,
  name = "Impending Victory",
  slug = "impending_victory",
  max_range = 5,
  gcd = 1.5,
  cooldown = 30.0,
  power = {
    [1] = { resource = "rage", amount = 10, },
  },
}

classData.spells[202224] = {
  spellID = 202224,
  name = "Furious Charge",
  slug = "furious_charge",
}

classData.spells[202225] = {
  spellID = 202225,
  name = "Furious Charge",
  slug = "furious_charge",
  initial_stacks = 1,
  duration = 5.0,
}

classData.spells[202296] = {
  spellID = 202296,
  name = "Endless Rage",
  slug = "endless_rage",
}

classData.spells[202316] = {
  spellID = 202316,
  name = "Fervor of Battle",
  slug = "fervor_of_battle",
}

classData.spells[202539] = {
  spellID = 202539,
  name = "Frenzy",
  slug = "frenzy",
  max_stacks = 3,
  duration = 15.0,
}

classData.spells[202560] = {
  spellID = 202560,
  name = "Best Served Cold",
  slug = "best_served_cold",
}

classData.spells[202572] = {
  spellID = 202572,
  name = "Vengeance",
  slug = "vengeance",
}

classData.spells[202573] = {
  spellID = 202573,
  name = "Vengeance: Revenge",
  slug = "vengeance_revenge",
  initial_stacks = 1,
  duration = 15.0,
}

classData.spells[202574] = {
  spellID = 202574,
  name = "Vengeance: Shield Block",
  slug = "vengeance_shield_block",
  initial_stacks = 1,
  duration = 15.0,
}

classData.spells[202602] = {
  spellID = 202602,
  name = "Into the Fray",
  slug = "into_the_fray",
  max_stacks = 5,
}

classData.spells[202603] = {
  spellID = 202603,
  name = "Into the Fray",
  slug = "into_the_fray",
}

classData.spells[202743] = {
  spellID = 202743,
  name = "Booming Voice",
  slug = "booming_voice",
}

classData.spells[202751] = {
  spellID = 202751,
  name = "Reckless Abandon",
  slug = "reckless_abandon",
}

classData.spells[202922] = {
  spellID = 202922,
  name = "Carnage",
  slug = "carnage",
}

classData.spells[203177] = {
  spellID = 203177,
  name = "Heavy Repercussions",
  slug = "heavy_repercussions",
}

classData.spells[203178] = {
  spellID = 203178,
  name = "Opportunity Strikes",
  slug = "opportunity_strikes",
  max_range = 100,
}

classData.spells[203179] = {
  spellID = 203179,
  name = "Opportunity Strikes",
  slug = "opportunity_strikes",
  internal_cooldown = 0.5,
}

classData.spells[203201] = {
  spellID = 203201,
  name = "Crackling Thunder",
  slug = "crackling_thunder",
}

classData.spells[203524] = {
  spellID = 203524,
  name = "Neltharion's Fury",
  slug = "neltharions_fury",
  gcd = 1.5,
  cooldown = 45.0,
  duration = 3.0,
  channeled = true,
}

classData.spells[203526] = {
  spellID = 203526,
  name = "Neltharion's Fury",
  slug = "neltharions_fury",
  max_range = 100,
}

classData.spells[205545] = {
  spellID = 205545,
  name = "Odyn's Fury",
  slug = "odyns_fury",
  gcd = 1.5,
  cooldown = 45.0,
}

classData.spells[205546] = {
  spellID = 205546,
  name = "Odyn's Fury",
  slug = "odyns_fury",
  duration = 4.0,
}

classData.spells[205547] = {
  spellID = 205547,
  name = "Odyn's Fury",
  slug = "odyns_fury",
}

classData.spells[206313] = {
  spellID = 206313,
  name = "Frenzy",
  slug = "frenzy",
}

classData.spells[206315] = {
  spellID = 206315,
  name = "Massacre",
  slug = "massacre",
}

classData.spells[206316] = {
  spellID = 206316,
  name = "Massacre",
  slug = "massacre",
  initial_stacks = 1,
  duration = 10.0,
}

classData.spells[206320] = {
  spellID = 206320,
  name = "Outburst",
  slug = "outburst",
}

classData.spells[206333] = {
  spellID = 206333,
  name = "Taste for Blood",
  slug = "taste_for_blood",
  max_stacks = 6,
  duration = 8.0,
}

classData.spells[208086] = {
  spellID = 208086,
  name = "Colossus Smash",
  slug = "colossus_smash",
  max_range = 50000,
  duration = 10.0,
}

classData.spells[208154] = {
  spellID = 208154,
  name = "Warpaint",
  slug = "warpaint",
}

classData.spells[209492] = {
  spellID = 209492,
  name = "Precise Strikes",
  slug = "precise_strikes",
  max_range = 100,
}

classData.spells[209493] = {
  spellID = 209493,
  name = "Precise Strikes",
  slug = "precise_strikes",
  max_range = 100,
  duration = 15.0,
}

classData.spells[209573] = {
  spellID = 209573,
  name = "Void Cleave",
  slug = "void_cleave",
  max_range = 100,
}

classData.spells[209577] = {
  spellID = 209577,
  name = "Warbreaker",
  slug = "warbreaker",
  max_range = 100,
  gcd = 1.5,
  cooldown = 60.0,
}

classData.spells[209694] = {
  spellID = 209694,
  name = "Rampage!",
  slug = "rampage",
}

classData.spells[209697] = {
  spellID = 209697,
  name = "Rampage!",
  slug = "rampage",
  duration = 6.0,
}

classData.spells[209700] = {
  spellID = 209700,
  name = "Void Cleave",
  slug = "void_cleave",
  max_range = 100,
}

classData.spells[210972] = {
  spellID = 210972,
  name = "Rampage!",
  slug = "rampage",
}

classData.spells[213915] = {
  spellID = 213915,
  name = "Mass Spell Reflection",
  slug = "mass_spell_reflection",
  cooldown = 30.0,
  duration = 3.0,
}

classData.spells[215537] = {
  spellID = 215537,
  name = "Trauma",
  slug = "trauma",
  max_range = 20,
  duration = 6.0,
}

classData.spells[215538] = {
  spellID = 215538,
  name = "Trauma",
  slug = "trauma",
}

classData.spells[215556] = {
  spellID = 215556,
  name = "War Machine",
  slug = "war_machine",
}

classData.spells[215557] = {
  spellID = 215557,
  name = "War Machine",
  slug = "war_machine",
  max_range = 100,
  duration = 1.5,
}

classData.spells[215562] = {
  spellID = 215562,
  name = "War Machine",
  slug = "war_machine",
  duration = 15.0,
}

classData.spells[215568] = {
  spellID = 215568,
  name = "Fresh Meat",
  slug = "fresh_meat",
}

classData.spells[215569] = {
  spellID = 215569,
  name = "Wrecking Ball",
  slug = "wrecking_ball",
}

classData.spells[215570] = {
  spellID = 215570,
  name = "Wrecking Ball",
  slug = "wrecking_ball",
  duration = 10.0,
}

classData.spells[215571] = {
  spellID = 215571,
  name = "Frothing Berserker",
  slug = "frothing_berserker",
}

classData.spells[215572] = {
  spellID = 215572,
  name = "Frothing Berserker",
  slug = "frothing_berserker",
  duration = 6.0,
}

classData.spells[215573] = {
  spellID = 215573,
  name = "Inner Rage",
  slug = "inner_rage",
}

classData.spells[218617] = {
  spellID = 218617,
  name = "Rampage",
  slug = "rampage",
  max_range = 8,
}

classData.spells[218822] = {
  spellID = 218822,
  name = "Gaze of the Val'kyr",
  slug = "gaze_of_the_valkyr",
  max_range = 100,
  duration = 900.0,
}

classData.spells[218826] = {
  spellID = 218826,
  name = "Trial by Combat",
  slug = "trial_by_combat",
  max_range = 100,
  duration = 8.0,
}

classData.spells[218834] = {
  spellID = 218834,
  name = "Gaze of the Val'kyr",
  slug = "gaze_of_the_valkyr",
  max_range = 100,
}

classData.spells[218835] = {
  spellID = 218835,
  name = "Gaze of the Val'kyr",
  slug = "gaze_of_the_valkyr",
  max_range = 100,
}

classData.spells[218836] = {
  spellID = 218836,
  name = "Gaze of the Val'kyr",
  slug = "gaze_of_the_valkyr",
  max_range = 100,
  duration = 8.0,
}

classData.spells[218850] = {
  spellID = 218850,
  name = "Gaze of the Val'kyr",
  slug = "gaze_of_the_valkyr",
  max_range = 100,
  duration = 15.0,
}

classData.spells[218877] = {
  spellID = 218877,
  name = "Gaze of the Val'kyr",
  slug = "gaze_of_the_valkyr",
  max_range = 100,
  duration = 8.0,
}

classData.spells[222634] = {
  spellID = 222634,
  name = "Bladestorm",
  slug = "bladestorm",
  gcd = 1.5,
  cooldown = 60.0,
  duration = 6.0,
}

classData.spells[223657] = {
  spellID = 223657,
  name = "Safeguard",
  slug = "safeguard",
}

classData.spells[223658] = {
  spellID = 223658,
  name = "Safeguard",
  slug = "safeguard",
  max_range = 40,
  duration = 6.0,
}

classData.spells[223662] = {
  spellID = 223662,
  name = "Warlord's Challenge",
  slug = "warlords_challenge",
}

classData.spells[227744] = {
  spellID = 227744,
  name = "Ravager",
  slug = "ravager",
  max_range = 40,
  duration = 12.0,
}

classData.spells[227847] = {
  spellID = 227847,
  name = "Bladestorm",
  slug = "bladestorm",
  gcd = 1.5,
  cooldown = 90.0,
  duration = 6.0,
  haste_affected_ticks = true,
}

classData.spells[228920] = {
  spellID = 228920,
  name = "Ravager",
  slug = "ravager",
  max_range = 40,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 7.0,
  haste_affected_ticks = true,
}

classData.spells[231824] = {
  spellID = 231824,
  name = "Furious Slash",
  slug = "furious_slash",
}

classData.spells[231827] = {
  spellID = 231827,
  name = "Execute",
  slug = "execute",
}

classData.spells[231830] = {
  spellID = 231830,
  name = "Execute",
  slug = "execute",
}

classData.spells[231834] = {
  spellID = 231834,
  name = "Shield Slam",
  slug = "shield_slam",
}

classData.spells[231842] = {
  spellID = 231842,
  name = "Dual Wield",
  slug = "dual_wield",
}

classData.spells[231847] = {
  spellID = 231847,
  name = "Shield Block",
  slug = "shield_block",
}

classData.spells[236027] = {
  spellID = 236027,
  name = "Charge",
  slug = "charge",
  max_range = 50000,
  duration = 6.0,
}

classData.spells[236279] = {
  spellID = 236279,
  name = "Devastator",
  slug = "devastator",
}

classData.spells[236282] = {
  spellID = 236282,
  name = "Devastator",
  slug = "devastator",
  max_range = 5,
  max_stacks = 3,
}

classData.spells[237744] = {
  spellID = 237744,
  name = "Warbringer",
  slug = "warbringer",
  max_range = 50000,
  duration = 2.5,
}

classData.spells[242301] = {
  spellID = 242301,
  name = "Item - Warrior T20 Fury 4P Bonus",
  slug = "item__warrior_t20_fury_4p_bonus",
}

classData.spells[242952] = {
  spellID = 242952,
  name = "Bloody Rage",
  slug = "bloody_rage",
  max_stacks = 10,
  duration = 10.0,
}

classData.spells[242953] = {
  spellID = 242953,
  name = "Bloody Rage",
  slug = "bloody_rage",
  max_stacks = 10,
  duration = 10.0,
}

classData.spells[243223] = {
  spellID = 243223,
  name = "Helya's Scorn",
  slug = "helyas_scorn",
}

classData.spells[243228] = {
  spellID = 243228,
  name = "Odyn's Glory",
  slug = "odyns_glory",
}

classData.spells[248439] = {
  spellID = 248439,
  name = "Ravager",
  slug = "ravager",
}

classData.spells[248621] = {
  spellID = 248621,
  name = "In For The Kill",
  slug = "in_for_the_kill",
}

classData.spells[248622] = {
  spellID = 248622,
  name = "In For The Kill",
  slug = "in_for_the_kill",
  duration = 10.0,
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

classData.spells[257019] = {
  spellID = 257019,
  name = "Meat Cleaver",
  slug = "meat_cleaver",
  duration = 8.0,
}

classData.spells[260643] = {
  spellID = 260643,
  name = "Skullsplitter",
  slug = "skullsplitter",
  max_range = 5,
  gcd = 1.5,
  cooldown = 21.0,
}

classData.spells[260708] = {
  spellID = 260708,
  name = "Sweeping Strikes",
  slug = "sweeping_strikes",
  gcd = 1.5,
  cooldown = 25.0,
  duration = 10.0,
}

classData.spells[260798] = {
  spellID = 260798,
  name = "Execute",
  slug = "execute",
  max_range = 5,
}

classData.spells[262111] = {
  spellID = 262111,
  name = "Mastery: Deep Wounds",
  slug = "mastery_deep_wounds",
  replaces_spell_id = 262304,
}

classData.spells[262115] = {
  spellID = 262115,
  name = "Deep Wounds",
  slug = "deep_wounds",
  max_range = 100,
  duration = 3.0,
}

classData.spells[262150] = {
  spellID = 262150,
  name = "Dreadnaught",
  slug = "dreadnaught",
}

classData.spells[262161] = {
  spellID = 262161,
  name = "Warbreaker",
  slug = "warbreaker",
  gcd = 1.5,
  cooldown = 45.0,
}

classData.spells[262228] = {
  spellID = 262228,
  name = "Deadly Calm",
  slug = "deadly_calm",
  gcd = 1.5,
  cooldown = 60.0,
  duration = 6.0,
}

classData.spells[262231] = {
  spellID = 262231,
  name = "War Machine",
  slug = "war_machine",
}

classData.spells[262232] = {
  spellID = 262232,
  name = "War Machine",
  slug = "war_machine",
  duration = 8.0,
}

classData.spells[262304] = {
  spellID = 262304,
  name = "Deep Wounds",
  slug = "deep_wounds",
}

classData.spells[264186] = {
  spellID = 264186,
  name = "Coming Soon",
  slug = "coming_soon",
}

classData.spells[268243] = {
  spellID = 268243,
  name = "Collateral Damage",
  slug = "collateral_damage",
}

classData.spells[274818] = {
  spellID = 274818,
  name = "Bloodbath",
  slug = "bloodbath",
  duration = 10.0,
}
