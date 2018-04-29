----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BfA only.
----------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(4, GetBuildInfo()) < 80000 then
    return
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Class check
----------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(3, UnitClass('player')) ~= 2 then return end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
local addonName, TJ = ...
TJ.ClassData = TJ.ClassData or {}
TJ.ClassData[2] = TJ.ClassData[2] or {}
local classData = TJ.ClassData[2]
classData.spells = classData.spells or {}

classData.spells[65] = {
  spellID = 65,
  name = "Haste",
  slug = "haste",
  duration = 30.0,
}

classData.spells[66] = {
  spellID = 66,
  name = "Invisibility",
  slug = "invisibility",
  gcd = 1.5,
  cooldown = 300.0,
  duration = 3.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[107] = {
  spellID = 107,
  name = "Block",
  slug = "block",
}

classData.spells[498] = {
  spellID = 498,
  name = "Divine Protection",
  slug = "divine_protection",
  cooldown = 60.0,
  duration = 8.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[633] = {
  spellID = 633,
  name = "Lay on Hands",
  slug = "lay_on_hands",
  max_range = 40,
  cooldown = 600.0,
}

classData.spells[642] = {
  spellID = 642,
  name = "Divine Shield",
  slug = "divine_shield",
  gcd = 1.5,
  cooldown = 300.0,
  duration = 8.0,
}

classData.spells[853] = {
  spellID = 853,
  name = "Hammer of Justice",
  slug = "hammer_of_justice",
  max_range = 10,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 6.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[1022] = {
  spellID = 1022,
  name = "Blessing of Protection",
  slug = "blessing_of_protection",
  max_range = 40,
  charges = 1,
  charge_cooldown = 300.0,
  gcd = 1.5,
  cooldown = 1.5,
  duration = 10.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[1044] = {
  spellID = 1044,
  name = "Blessing of Freedom",
  slug = "blessing_of_freedom",
  max_range = 40,
  charges = 1,
  charge_cooldown = 45.0,
  gcd = 1.5,
  cooldown = 1.5,
  duration = 8.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[4987] = {
  spellID = 4987,
  name = "Cleanse",
  slug = "cleanse",
  max_range = 40,
  charges = 1,
  charge_cooldown = 8.0,
  gcd = 1.5,
  cooldown = 8.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[6940] = {
  spellID = 6940,
  name = "Blessing of Sacrifice",
  slug = "blessing_of_sacrifice",
  max_range = 40,
  charges = 1,
  charge_cooldown = 120.0,
  cooldown = 1.0,
  duration = 12.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[19750] = {
  spellID = 19750,
  name = "Flash of Light",
  slug = "flash_of_light",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[20066] = {
  spellID = 20066,
  name = "Repentance",
  slug = "repentance",
  max_range = 30,
  initial_stacks = 1,
  gcd = 1.5,
  cooldown = 15.0,
  duration = 60.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[20271] = {
  spellID = 20271,
  name = "Judgment",
  slug = "judgment",
  max_range = 30,
  charges = 1,
  charge_cooldown = 12.0,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, aura = 137029, },
  },
}

classData.spells[20473] = {
  spellID = 20473,
  name = "Holy Shock",
  slug = "holy_shock",
  max_range = 40,
  gcd = 1.5,
  cooldown = 9.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
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

classData.spells[24275] = {
  spellID = 24275,
  name = "Hammer of Wrath",
  slug = "hammer_of_wrath",
  max_range = 30,
  gcd = 1.5,
  cooldown = 6.0,
}

classData.spells[25771] = {
  spellID = 25771,
  name = "Forbearance",
  slug = "forbearance",
  max_range = 50000,
  duration = 30.0,
}

classData.spells[25780] = {
  spellID = 25780,
  name = "Righteous Fury",
  slug = "righteous_fury",
  cooldown = 1.5,
}

classData.spells[25912] = {
  spellID = 25912,
  name = "Holy Shock",
  slug = "holy_shock",
  max_range = 100,
}

classData.spells[25914] = {
  spellID = 25914,
  name = "Holy Shock",
  slug = "holy_shock",
  max_range = 100,
}

classData.spells[26573] = {
  spellID = 26573,
  name = "Consecration",
  slug = "consecration",
  gcd = 1.5,
  cooldown = 9.0,
  duration = 9.0,
  haste_affected_ticks = true,
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

classData.spells[31821] = {
  spellID = 31821,
  name = "Aura Mastery",
  slug = "aura_mastery",
  gcd = 1.5,
  cooldown = 180.0,
  duration = 6.0,
}

classData.spells[31850] = {
  spellID = 31850,
  name = "Ardent Defender",
  slug = "ardent_defender",
  replaces_spell_id = 498,
  cooldown = 120.0,
  duration = 8.0,
}

classData.spells[31884] = {
  spellID = 31884,
  name = "Avenging Wrath",
  slug = "avenging_wrath",
  gcd = 1.5,
  cooldown = 120.0,
  duration = 20.0,
}

classData.spells[31935] = {
  spellID = 31935,
  name = "Avenger's Shield",
  slug = "avengers_shield",
  max_range = 30,
  gcd = 1.5,
  cooldown = 15.0,
  duration = 3.0,
}

classData.spells[32223] = {
  spellID = 32223,
  name = "Heart of the Crusader",
  slug = "heart_of_the_crusader",
  gcd = 1.5,
}

classData.spells[32612] = {
  spellID = 32612,
  name = "Invisibility",
  slug = "invisibility",
  duration = 20.0,
}

classData.spells[35395] = {
  spellID = 35395,
  name = "Crusader Strike",
  slug = "crusader_strike",
  max_range = 5,
  charges = 1,
  charge_cooldown = 6.0,
  gcd = 1.5,
}

classData.spells[53376] = {
  spellID = 53376,
  name = "Sanctified Wrath",
  slug = "sanctified_wrath",
}

classData.spells[53385] = {
  spellID = 53385,
  name = "Divine Storm",
  slug = "divine_storm",
  gcd = 1.5,
  power = {
    [1] = { resource = "holy_power", amount = 3, },
  },
}

classData.spells[53563] = {
  spellID = 53563,
  name = "Beacon of Light",
  slug = "beacon_of_light",
  max_range = 60,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[53576] = {
  spellID = 53576,
  name = "Infusion of Light",
  slug = "infusion_of_light",
}

classData.spells[53595] = {
  spellID = 53595,
  name = "Hammer of the Righteous",
  slug = "hammer_of_the_righteous",
  replaces_spell_id = 35395,
  max_range = 5,
  charges = 2,
  charge_cooldown = 4.5,
  gcd = 1.5,
}

classData.spells[53600] = {
  spellID = 53600,
  name = "Shield of the Righteous",
  slug = "shield_of_the_righteous",
  max_range = 5,
  charges = 3,
  charge_cooldown = 20.0,
  cooldown = 1.0,
}

classData.spells[53651] = {
  spellID = 53651,
  name = "Light's Beacon",
  slug = "lights_beacon",
  max_range = 60,
}

classData.spells[53652] = {
  spellID = 53652,
  name = "Beacon of Light",
  slug = "beacon_of_light",
  max_range = 60,
}

classData.spells[54149] = {
  spellID = 54149,
  name = "Infusion of Light",
  slug = "infusion_of_light",
  initial_stacks = 1,
  duration = 15.0,
}

classData.spells[55115] = {
  spellID = 55115,
  name = "Luminous Charger",
  slug = "luminous_charger",
}

classData.spells[57954] = {
  spellID = 57954,
  name = "Glyph of Fire From the Heavens",
  slug = "glyph_of_fire_from_the_heavens",
}

classData.spells[57979] = {
  spellID = 57979,
  name = "Glyph of Winged Vengeance",
  slug = "glyph_of_winged_vengeance",
}

classData.spells[58244] = {
  spellID = 58244,
  name = "Winged Vengeance",
  slug = "winged_vengeance",
}

classData.spells[58247] = {
  spellID = 58247,
  name = "Fire From the Heavens",
  slug = "fire_from_the_heavens",
}

classData.spells[59542] = {
  spellID = 59542,
  name = "Gift of the Naaru",
  slug = "gift_of_the_naaru",
  max_range = 40,
  cooldown = 180.0,
  duration = 5.0,
  haste_affected_ticks = true,
}

classData.spells[62124] = {
  spellID = 62124,
  name = "Hand of Reckoning",
  slug = "hand_of_reckoning",
  max_range = 30,
  charges = 1,
  charge_cooldown = 8.0,
  duration = 3.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[66235] = {
  spellID = 66235,
  name = "Ardent Defender",
  slug = "ardent_defender",
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

classData.spells[76671] = {
  spellID = 76671,
  name = "Mastery: Divine Bulwark",
  slug = "mastery_divine_bulwark",
}

classData.spells[81297] = {
  spellID = 81297,
  name = "Consecration",
  slug = "consecration",
  max_range = 50000,
}

classData.spells[82242] = {
  spellID = 82242,
  name = "Parry",
  slug = "parry",
}

classData.spells[82326] = {
  spellID = 82326,
  name = "Holy Light",
  slug = "holy_light",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[84963] = {
  spellID = 84963,
  name = "Inquisition",
  slug = "inquisition",
  gcd = 1.5,
  duration = 15.0,
  power = {
    [1] = { resource = "holy_power", amount = 1, max_amount = 2, },
  },
}

classData.spells[85043] = {
  spellID = 85043,
  name = "Grand Crusader",
  slug = "grand_crusader",
  internal_cooldown = 1.0,
}

classData.spells[85222] = {
  spellID = 85222,
  name = "Light of Dawn",
  slug = "light_of_dawn",
  gcd = 1.5,
  cooldown = 12.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[85256] = {
  spellID = 85256,
  name = "Templar's Verdict",
  slug = "templars_verdict",
  max_range = 5,
  gcd = 1.5,
  power = {
    [1] = { resource = "holy_power", amount = 3, },
  },
}

classData.spells[85416] = {
  spellID = 85416,
  name = "Grand Crusader",
  slug = "grand_crusader",
  initial_stacks = 1,
  duration = 6.0,
}

classData.spells[85804] = {
  spellID = 85804,
  name = "Selfless Healer",
  slug = "selfless_healer",
  internal_cooldown = 0.5,
}

classData.spells[86102] = {
  spellID = 86102,
  name = "Plate Specialization",
  slug = "plate_specialization",
}

classData.spells[86103] = {
  spellID = 86103,
  name = "Plate Specialization",
  slug = "plate_specialization",
}

classData.spells[86539] = {
  spellID = 86539,
  name = "Plate Specialization",
  slug = "plate_specialization",
}

classData.spells[86657] = {
  spellID = 86657,
  name = "Ancient Guardian",
  slug = "ancient_guardian",
  max_range = 50,
  duration = 40.0,
  channeled = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[86659] = {
  spellID = 86659,
  name = "Guardian of Ancient Kings",
  slug = "guardian_of_ancient_kings",
  max_range = 30,
  cooldown = 300.0,
  duration = 8.0,
}

classData.spells[86678] = {
  spellID = 86678,
  name = "Light of the Ancient Kings",
  slug = "light_of_the_ancient_kings",
  max_range = 100,
  max_stacks = 5,
}

classData.spells[86704] = {
  spellID = 86704,
  name = "Ancient Fury",
  slug = "ancient_fury",
}

classData.spells[87833] = {
  spellID = 87833,
  name = "Invisibility Speed",
  slug = "invisibility_speed",
}

classData.spells[88263] = {
  spellID = 88263,
  name = "Hammer of the Righteous",
  slug = "hammer_of_the_righteous",
  max_range = 50000,
}

classData.spells[89401] = {
  spellID = 89401,
  name = "Glyph of the Luminous Charger",
  slug = "glyph_of_the_luminous_charger",
}

classData.spells[94289] = {
  spellID = 94289,
  name = "Protector of the Innocent",
  slug = "protector_of_the_innocent",
  max_range = 100,
}

classData.spells[94293] = {
  spellID = 94293,
  name = "Altered Form",
  slug = "altered_form",
}

classData.spells[96231] = {
  spellID = 96231,
  name = "Rebuke",
  slug = "rebuke",
  max_range = 5,
  cooldown = 15.0,
  duration = 4.0,
}

classData.spells[105424] = {
  spellID = 105424,
  name = "Judgments of the Wise",
  slug = "judgments_of_the_wise",
}

classData.spells[105805] = {
  spellID = 105805,
  name = "Sanctuary",
  slug = "sanctuary",
}

classData.spells[105809] = {
  spellID = 105809,
  name = "Holy Avenger",
  slug = "holy_avenger",
  gcd = 1.5,
  cooldown = 90.0,
  duration = 20.0,
}

classData.spells[114154] = {
  spellID = 114154,
  name = "Unbreakable Spirit",
  slug = "unbreakable_spirit",
}

classData.spells[114158] = {
  spellID = 114158,
  name = "Light's Hammer",
  slug = "lights_hammer",
  max_range = 40,
  gcd = 1.5,
  cooldown = 60.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[114163] = {
  spellID = 114163,
  name = "Eternal Flame",
  slug = "eternal_flame",
  max_range = 40,
  gcd = 1.5,
  cooldown = 1.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "holy_power", amount = 3, },
  },
}

classData.spells[114165] = {
  spellID = 114165,
  name = "Holy Prism",
  slug = "holy_prism",
  max_range = 40,
  gcd = 1.5,
  cooldown = 20.0,
  power = {
    [1] = { resource = "mana", amount = 0, aura = 137029, },
  },
}

classData.spells[114250] = {
  spellID = 114250,
  name = "Selfless Healer",
  slug = "selfless_healer",
  max_stacks = 3,
  duration = 15.0,
}

classData.spells[114852] = {
  spellID = 114852,
  name = "Holy Prism",
  slug = "holy_prism",
  max_range = 40,
  gcd = 1.5,
  cooldown = 20.0,
}

classData.spells[114871] = {
  spellID = 114871,
  name = "Holy Prism",
  slug = "holy_prism",
  max_range = 40,
  gcd = 1.5,
  cooldown = 20.0,
}

classData.spells[114918] = {
  spellID = 114918,
  name = "Light's Hammer",
  slug = "lights_hammer",
  duration = 14.0,
}

classData.spells[114919] = {
  spellID = 114919,
  name = "Light's Hammer",
  slug = "lights_hammer",
  max_range = 100,
}

classData.spells[115675] = {
  spellID = 115675,
  name = "Boundless Conviction",
  slug = "boundless_conviction",
}

classData.spells[115750] = {
  spellID = 115750,
  name = "Blinding Light",
  slug = "blinding_light",
  gcd = 1.5,
  cooldown = 90.0,
  duration = 6.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[115995] = {
  spellID = 115995,
  name = "Fire From the Heavens",
  slug = "fire_from_the_heavens",
  max_range = 100,
  duration = 4.0,
}

classData.spells[119952] = {
  spellID = 119952,
  name = "Arcing Light",
  slug = "arcing_light",
  max_range = 100,
}

classData.spells[121183] = {
  spellID = 121183,
  name = "Contemplation",
  slug = "contemplation",
  gcd = 1.5,
  cooldown = 8.0,
  duration = 8.0,
}

classData.spells[122773] = {
  spellID = 122773,
  name = "Light's Hammer",
  slug = "lights_hammer",
  max_range = 50000,
  duration = 15.5,
}

classData.spells[123830] = {
  spellID = 123830,
  name = "Block",
  slug = "block",
}

classData.spells[132403] = {
  spellID = 132403,
  name = "Shield of the Righteous",
  slug = "shield_of_the_righteous",
  max_range = 5,
  duration = 5.0,
}

classData.spells[137026] = {
  spellID = 137026,
  name = "Paladin",
  slug = "paladin",
}

classData.spells[137027] = {
  spellID = 137027,
  name = "Retribution Paladin",
  slug = "retribution_paladin",
}

classData.spells[137028] = {
  spellID = 137028,
  name = "Protection Paladin",
  slug = "protection_paladin",
}

classData.spells[137029] = {
  spellID = 137029,
  name = "Holy Paladin",
  slug = "holy_paladin",
}

classData.spells[144566] = {
  spellID = 144566,
  name = "Item - Paladin T16 Protection 4P Bonus",
  slug = "item__paladin_t16_protection_4p_bonus",
}

classData.spells[144569] = {
  spellID = 144569,
  name = "Bastion of Power",
  slug = "bastion_of_power",
  duration = 20.0,
}

classData.spells[144580] = {
  spellID = 144580,
  name = "Item - Paladin T16 Protection 2P Bonus",
  slug = "item__paladin_t16_protection_2p_bonus",
}

classData.spells[144581] = {
  spellID = 144581,
  name = "Blessing of the Guardians",
  slug = "blessing_of_the_guardians",
  duration = 10.0,
}

classData.spells[146959] = {
  spellID = 146959,
  name = "Glyph of Pillar of Light",
  slug = "glyph_of_pillar_of_light",
}

classData.spells[147974] = {
  spellID = 147974,
  name = "Pillar of Light",
  slug = "pillar_of_light",
}

classData.spells[148040] = {
  spellID = 148040,
  name = "Sacred Shield Overridde (Holy)",
  slug = "sacred_shield_overridde_holy",
}

classData.spells[152261] = {
  spellID = 152261,
  name = "Holy Shield",
  slug = "holy_shield",
}

classData.spells[152262] = {
  spellID = 152262,
  name = "Seraphim",
  slug = "seraphim",
  gcd = 1.5,
  cooldown = 45.0,
  duration = 8.0,
}

classData.spells[155145] = {
  spellID = 155145,
  name = "Arcane Torrent",
  slug = "arcane_torrent",
  gcd = 1.5,
  cooldown = 90.0,
}

classData.spells[156322] = {
  spellID = 156322,
  name = "Eternal Flame",
  slug = "eternal_flame",
  max_range = 100,
  duration = 10.0,
  haste_affected_ticks = true,
}

classData.spells[156910] = {
  spellID = 156910,
  name = "Beacon of Faith",
  slug = "beacon_of_faith",
  max_range = 60,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[157122] = {
  spellID = 157122,
  name = "Holy Shield",
  slug = "holy_shield",
  max_range = 100,
}

classData.spells[161800] = {
  spellID = 161800,
  name = "Riposte",
  slug = "riposte",
}

classData.spells[162056] = {
  spellID = 162056,
  name = "Jailer's Judgment",
  slug = "jailers_judgment",
  max_range = 15,
  gcd = 1.5,
  cooldown = 180.0,
  duration = 6.0,
}

classData.spells[162698] = {
  spellID = 162698,
  name = "Stat Negation Aura - Strength DPS",
  slug = "stat_negation_aura__strength_dps",
}

classData.spells[162701] = {
  spellID = 162701,
  name = "Stat Negation Aura - Intellect Healer",
  slug = "stat_negation_aura__intellect_healer",
}

classData.spells[162702] = {
  spellID = 162702,
  name = "Stat Negation Aura - Strength Tank",
  slug = "stat_negation_aura__strength_tank",
  replaces_spell_id = 162698,
}

classData.spells[179546] = {
  spellID = 179546,
  name = "Ashes to Ashes",
  slug = "ashes_to_ashes",
  max_range = 100,
}

classData.spells[180290] = {
  spellID = 180290,
  name = "Ashen Strike",
  slug = "ashen_strike",
  max_range = 100,
}

classData.spells[183218] = {
  spellID = 183218,
  name = "Hand of Hindrance",
  slug = "hand_of_hindrance",
  max_range = 30,
  gcd = 1.5,
  cooldown = 30.0,
  duration = 10.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[183415] = {
  spellID = 183415,
  name = "Aura of Mercy",
  slug = "aura_of_mercy",
  cooldown = 180.0,
}

classData.spells[183416] = {
  spellID = 183416,
  name = "Aura of Sacrifice",
  slug = "aura_of_sacrifice",
}

classData.spells[183425] = {
  spellID = 183425,
  name = "Devotion Aura",
  slug = "devotion_aura",
}

classData.spells[183435] = {
  spellID = 183435,
  name = "Retribution",
  slug = "retribution",
}

classData.spells[183436] = {
  spellID = 183436,
  name = "Retribution",
  slug = "retribution",
  duration = 10.0,
}

classData.spells[183778] = {
  spellID = 183778,
  name = "Judgment of Light",
  slug = "judgment_of_light",
}

classData.spells[183811] = {
  spellID = 183811,
  name = "Judgment of Light",
  slug = "judgment_of_light",
  max_range = 100,
}

classData.spells[183997] = {
  spellID = 183997,
  name = "Mastery: Lightbringer",
  slug = "mastery_lightbringer",
}

classData.spells[183998] = {
  spellID = 183998,
  name = "Light of the Martyr",
  slug = "light_of_the_martyr",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[184092] = {
  spellID = 184092,
  name = "Light of the Protector",
  slug = "light_of_the_protector",
  charges = 1,
  charge_cooldown = 20.0,
  gcd = 1.5,
}

classData.spells[184575] = {
  spellID = 184575,
  name = "Blade of Justice",
  slug = "blade_of_justice",
  max_range = 12,
  gcd = 1.5,
  cooldown = 10.5,
}

classData.spells[184662] = {
  spellID = 184662,
  name = "Shield of Vengeance",
  slug = "shield_of_vengeance",
  gcd = 1.5,
  cooldown = 120.0,
  duration = 15.0,
}

classData.spells[184689] = {
  spellID = 184689,
  name = "Shield of Vengeance",
  slug = "shield_of_vengeance",
  max_range = 8,
}

classData.spells[188370] = {
  spellID = 188370,
  name = "Consecration",
  slug = "consecration",
  max_range = 50000,
}

classData.spells[190784] = {
  spellID = 190784,
  name = "Divine Steed",
  slug = "divine_steed",
  charges = 1,
  charge_cooldown = 60.0,
  gcd = 1.5,
}

classData.spells[193115] = {
  spellID = 193115,
  name = "Blade of Light",
  slug = "blade_of_light",
  max_range = 100,
}

classData.spells[196926] = {
  spellID = 196926,
  name = "Crusader's Might",
  slug = "crusaders_might",
}

classData.spells[196941] = {
  spellID = 196941,
  name = "Judgment of Light",
  slug = "judgment_of_light",
  max_range = 30,
  initial_stacks = 25,
  duration = 30.0,
}

classData.spells[197277] = {
  spellID = 197277,
  name = "Judgment",
  slug = "judgment",
  max_range = 100,
  initial_stacks = 1,
  duration = 15.0,
}

classData.spells[197646] = {
  spellID = 197646,
  name = "Divine Purpose",
  slug = "divine_purpose",
}

classData.spells[198034] = {
  spellID = 198034,
  name = "Divine Hammer",
  slug = "divine_hammer",
  gcd = 1.5,
  cooldown = 25.0,
  duration = 9.0,
  haste_affected_ticks = true,
}

classData.spells[198054] = {
  spellID = 198054,
  name = "Fist of Justice",
  slug = "fist_of_justice",
  internal_cooldown = 1.0,
}

classData.spells[198137] = {
  spellID = 198137,
  name = "Divine Hammer",
  slug = "divine_hammer",
  max_range = 50000,
}

classData.spells[199325] = {
  spellID = 199325,
  name = "Unbound Freedom",
  slug = "unbound_freedom",
}

classData.spells[200025] = {
  spellID = 200025,
  name = "Beacon of Virtue",
  slug = "beacon_of_virtue",
  max_range = 40,
  gcd = 1.5,
  cooldown = 15.0,
  duration = 8.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[200474] = {
  spellID = 200474,
  name = "Power of the Silver Hand",
  slug = "power_of_the_silver_hand",
  max_range = 100,
}

classData.spells[200652] = {
  spellID = 200652,
  name = "Tyr's Deliverance",
  slug = "tyrs_deliverance",
  max_range = 100,
  gcd = 1.5,
  cooldown = 90.0,
  duration = 10.0,
  haste_affected_ticks = true,
}

classData.spells[200653] = {
  spellID = 200653,
  name = "Tyr's Deliverance",
  slug = "tyrs_deliverance",
  max_range = 100,
}

classData.spells[200654] = {
  spellID = 200654,
  name = "Tyr's Deliverance",
  slug = "tyrs_deliverance",
  max_range = 100,
  duration = 10.0,
}

classData.spells[200656] = {
  spellID = 200656,
  name = "Power of the Silver Hand",
  slug = "power_of_the_silver_hand",
  max_range = 100,
  duration = 10.0,
}

classData.spells[200749] = {
  spellID = 200749,
  name = "Activating Specialization",
  slug = "activating_specialization",
  max_range = 50000,
  channeled = true,
}

classData.spells[203316] = {
  spellID = 203316,
  name = "Fires of Justice",
  slug = "fires_of_justice",
  gcd = 1.5,
}

classData.spells[203538] = {
  spellID = 203538,
  name = "Greater Blessing of Kings",
  slug = "greater_blessing_of_kings",
  max_range = 30,
  gcd = 1.5,
  duration = 3600.0,
}

classData.spells[203539] = {
  spellID = 203539,
  name = "Greater Blessing of Wisdom",
  slug = "greater_blessing_of_wisdom",
  max_range = 30,
  gcd = 1.5,
  duration = 3600.0,
}

classData.spells[203776] = {
  spellID = 203776,
  name = "First Avenger",
  slug = "first_avenger",
}

classData.spells[203785] = {
  spellID = 203785,
  name = "Consecrated Hammer",
  slug = "consecrated_hammer",
}

classData.spells[203791] = {
  spellID = 203791,
  name = "Last Defender",
  slug = "last_defender",
}

classData.spells[203797] = {
  spellID = 203797,
  name = "Retribution Aura",
  slug = "retribution_aura",
}

classData.spells[204011] = {
  spellID = 204011,
  name = "Retribution Aura",
  slug = "retribution_aura",
  max_range = 40,
}

classData.spells[204018] = {
  spellID = 204018,
  name = "Blessing of Spellwarding",
  slug = "blessing_of_spellwarding",
  max_range = 40,
  gcd = 1.5,
  cooldown = 180.0,
  duration = 10.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[204019] = {
  spellID = 204019,
  name = "Blessed Hammer",
  slug = "blessed_hammer",
  charges = 3,
  charge_cooldown = 4.5,
  gcd = 1.5,
  duration = 5.0,
}

classData.spells[204023] = {
  spellID = 204023,
  name = "Crusader's Judgment",
  slug = "crusaders_judgment",
}

classData.spells[204035] = {
  spellID = 204035,
  name = "Bastion of Light",
  slug = "bastion_of_light",
  cooldown = 120.0,
}

classData.spells[204054] = {
  spellID = 204054,
  name = "Consecrated Ground",
  slug = "consecrated_ground",
}

classData.spells[204074] = {
  spellID = 204074,
  name = "Righteous Protector",
  slug = "righteous_protector",
}

classData.spells[204077] = {
  spellID = 204077,
  name = "Final Stand",
  slug = "final_stand",
}

classData.spells[204079] = {
  spellID = 204079,
  name = "Final Stand",
  slug = "final_stand",
  duration = 8.0,
}

classData.spells[204150] = {
  spellID = 204150,
  name = "Aegis of Light",
  slug = "aegis_of_light",
  gcd = 1.5,
  cooldown = 180.0,
  duration = 6.0,
  channeled = true,
}

classData.spells[204241] = {
  spellID = 204241,
  name = "Consecration",
  slug = "consecration",
  max_range = 50000,
}

classData.spells[204301] = {
  spellID = 204301,
  name = "Blessed Hammer",
  slug = "blessed_hammer",
  max_range = 100,
  duration = 10.0,
}

classData.spells[205191] = {
  spellID = 205191,
  name = "Eye for an Eye",
  slug = "eye_for_an_eye",
  gcd = 1.5,
  cooldown = 60.0,
  duration = 10.0,
}

classData.spells[205202] = {
  spellID = 205202,
  name = "Eye for an Eye",
  slug = "eye_for_an_eye",
  max_range = 5,
}

classData.spells[205228] = {
  spellID = 205228,
  name = "Consecration",
  slug = "consecration",
  gcd = 1.5,
  cooldown = 20.0,
  duration = 6.0,
  haste_affected_ticks = true,
}

classData.spells[205273] = {
  spellID = 205273,
  name = "Wake of Ashes",
  slug = "wake_of_ashes",
  gcd = 1.5,
  cooldown = 30.0,
  duration = 6.0,
}

classData.spells[205290] = {
  spellID = 205290,
  name = "Wake of Ashes",
  slug = "wake_of_ashes",
  max_range = 100,
  duration = 6.0,
}

classData.spells[206338] = {
  spellID = 206338,
  name = "Chain of Thrayn",
  slug = "chain_of_thrayn",
}

classData.spells[209202] = {
  spellID = 209202,
  name = "Eye of Tyr",
  slug = "eye_of_tyr",
  gcd = 1.5,
  cooldown = 60.0,
  duration = 9.0,
}

classData.spells[209785] = {
  spellID = 209785,
  name = "Fires of Justice",
  slug = "fires_of_justice",
  max_stacks = 1,
  duration = 15.0,
}

classData.spells[210191] = {
  spellID = 210191,
  name = "Word of Glory",
  slug = "word_of_glory",
  charges = 2,
  charge_cooldown = 60.0,
  gcd = 1.5,
  power = {
    [1] = { resource = "holy_power", amount = 3, },
  },
}

classData.spells[210291] = {
  spellID = 210291,
  name = "Aura of Mercy",
  slug = "aura_of_mercy",
  max_range = 100,
}

classData.spells[211557] = {
  spellID = 211557,
  name = "Justice Gaze",
  slug = "justice_gaze",
}

classData.spells[211561] = {
  spellID = 211561,
  name = "Hammer of Justice",
  slug = "hammer_of_justice",
  max_range = 40,
}

classData.spells[212056] = {
  spellID = 212056,
  name = "Absolution",
  slug = "absolution",
  max_range = 100,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[213644] = {
  spellID = 213644,
  name = "Cleanse Toxins",
  slug = "cleanse_toxins",
  max_range = 40,
  charges = 1,
  charge_cooldown = 8.0,
  gcd = 1.5,
  cooldown = 8.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[213652] = {
  spellID = 213652,
  name = "Hand of the Protector",
  slug = "hand_of_the_protector",
  max_range = 40,
  charges = 1,
  charge_cooldown = 15.0,
  gcd = 1.5,
}

classData.spells[214202] = {
  spellID = 214202,
  name = "Rule of Law",
  slug = "rule_of_law",
  charges = 2,
  charge_cooldown = 30.0,
  cooldown = 1.5,
  duration = 10.0,
}

classData.spells[214222] = {
  spellID = 214222,
  name = "Judgment",
  slug = "judgment",
  max_range = 100,
  initial_stacks = 1,
  duration = 15.0,
}

classData.spells[215661] = {
  spellID = 215661,
  name = "Justicar's Vengeance",
  slug = "justicars_vengeance",
  max_range = 5,
  gcd = 1.5,
  power = {
    [1] = { resource = "holy_power", amount = 5, },
  },
}

classData.spells[216331] = {
  spellID = 216331,
  name = "Avenging Crusader",
  slug = "avenging_crusader",
  gcd = 1.5,
  cooldown = 120.0,
  duration = 20.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[217020] = {
  spellID = 217020,
  name = "Zeal",
  slug = "zeal",
  max_range = 5,
  max_stacks = 3,
  charges = 2,
  charge_cooldown = 6.0,
  gcd = 1.5,
  duration = 12.0,
}

classData.spells[218001] = {
  spellID = 218001,
  name = "Wake of Ashes",
  slug = "wake_of_ashes",
  max_range = 100,
}

classData.spells[219562] = {
  spellID = 219562,
  name = "Light of the Martyr",
  slug = "light_of_the_martyr",
}

classData.spells[220637] = {
  spellID = 220637,
  name = "Judgment",
  slug = "judgment",
}

classData.spells[221883] = {
  spellID = 221883,
  name = "Divine Steed",
  slug = "divine_steed",
  gcd = 1.5,
  duration = 3.0,
}

classData.spells[223306] = {
  spellID = 223306,
  name = "Bestow Faith",
  slug = "bestow_faith",
  max_range = 40,
  gcd = 1.5,
  cooldown = 12.0,
  duration = 5.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[223817] = {
  spellID = 223817,
  name = "Divine Purpose",
  slug = "divine_purpose",
  internal_cooldown = 0.1,
}

classData.spells[224239] = {
  spellID = 224239,
  name = "Divine Storm",
  slug = "divine_storm",
  max_range = 100,
}

classData.spells[224266] = {
  spellID = 224266,
  name = "Templar's Verdict",
  slug = "templars_verdict",
  max_range = 100,
}

classData.spells[225311] = {
  spellID = 225311,
  name = "Light of Dawn",
  slug = "light_of_dawn",
  max_range = 100,
}

classData.spells[227068] = {
  spellID = 227068,
  name = "Righteousness",
  slug = "righteousness",
}

classData.spells[228288] = {
  spellID = 228288,
  name = "Judgment",
  slug = "judgment",
  max_range = 100,
}

classData.spells[229976] = {
  spellID = 229976,
  name = "Blessed Hammer",
  slug = "blessed_hammer",
}

classData.spells[230332] = {
  spellID = 230332,
  name = "Cavalier",
  slug = "cavalier",
}

classData.spells[231642] = {
  spellID = 231642,
  name = "Beacon of Light",
  slug = "beacon_of_light",
}

classData.spells[231644] = {
  spellID = 231644,
  name = "Judgment",
  slug = "judgment",
}

classData.spells[231657] = {
  spellID = 231657,
  name = "Judgment",
  slug = "judgment",
}

classData.spells[231663] = {
  spellID = 231663,
  name = "Judgment",
  slug = "judgment",
}

classData.spells[231665] = {
  spellID = 231665,
  name = "Avenger's Shield",
  slug = "avengers_shield",
}

classData.spells[231667] = {
  spellID = 231667,
  name = "Crusader Strike",
  slug = "crusader_strike",
}

classData.spells[231832] = {
  spellID = 231832,
  name = "Blade of Wrath",
  slug = "blade_of_wrath",
  internal_cooldown = 3.0,
}

classData.spells[231895] = {
  spellID = 231895,
  name = "Crusade",
  slug = "crusade",
  max_stacks = 10,
  charges = 1,
  charge_cooldown = 120.0,
  gcd = 1.5,
  cooldown = 20.0,
  duration = 25.0,
}

classData.spells[234299] = {
  spellID = 234299,
  name = "Fist of Justice",
  slug = "fist_of_justice",
  internal_cooldown = 1.0,
}

classData.spells[238062] = {
  spellID = 238062,
  name = "Righteous Verdict",
  slug = "righteous_verdict",
  internal_cooldown = 0.1,
}

classData.spells[238098] = {
  spellID = 238098,
  name = "Blessing of the Ashbringer",
  slug = "blessing_of_the_ashbringer",
}

classData.spells[238996] = {
  spellID = 238996,
  name = "Righteous Verdict",
  slug = "righteous_verdict",
  initial_stacks = 1,
  duration = 15.0,
}

classData.spells[242267] = {
  spellID = 242267,
  name = "Item - Paladin T20 Retribution 4P Bonus",
  slug = "item__paladin_t20_retribution_4p_bonus",
}

classData.spells[242981] = {
  spellID = 242981,
  name = "Blessing of the Ashbringer",
  slug = "blessing_of_the_ashbringer",
}

classData.spells[246973] = {
  spellID = 246973,
  name = "Sacred Judgment",
  slug = "sacred_judgment",
  duration = 8.0,
}

classData.spells[248033] = {
  spellID = 248033,
  name = "Awakening",
  slug = "awakening",
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

classData.spells[255937] = {
  spellID = 255937,
  name = "Wake of Ashes",
  slug = "wake_of_ashes",
  gcd = 1.5,
  cooldown = 45.0,
  duration = 5.0,
}

classData.spells[255941] = {
  spellID = 255941,
  name = "Wake of Ashes",
  slug = "wake_of_ashes",
  max_range = 100,
  duration = 5.0,
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

classData.spells[267316] = {
  spellID = 267316,
  name = "Mastery: Hand of Light",
  slug = "mastery_hand_of_light",
}

classData.spells[267610] = {
  spellID = 267610,
  name = "Righteous Verdict",
  slug = "righteous_verdict",
}

classData.spells[267611] = {
  spellID = 267611,
  name = "Righteous Verdict",
  slug = "righteous_verdict",
  duration = 6.0,
}

classData.spells[267798] = {
  spellID = 267798,
  name = "Execution Sentence",
  slug = "execution_sentence",
  max_range = 20,
  gcd = 1.5,
  cooldown = 30.0,
  power = {
    [1] = { resource = "holy_power", amount = 3, },
  },
}

classData.spells[267799] = {
  spellID = 267799,
  name = "Execution Sentence",
  slug = "execution_sentence",
  max_range = 100,
  duration = 12.0,
}

classData.spells[269569] = {
  spellID = 269569,
  name = "Zeal",
  slug = "zeal",
}

classData.spells[269571] = {
  spellID = 269571,
  name = "Zeal",
  slug = "zeal",
  max_range = 50000,
  initial_stacks = 1,
  max_stacks = 9,
  duration = 20.0,
}

classData.spells[269937] = {
  spellID = 269937,
  name = "Zeal",
  slug = "zeal",
  max_range = 30,
}

classData.spells[271580] = {
  spellID = 271580,
  name = "Divine Judgment",
  slug = "divine_judgment",
}

classData.spells[271581] = {
  spellID = 271581,
  name = "Divine Judgment",
  slug = "divine_judgment",
  max_stacks = 15,
  duration = 15.0,
}

classData.spells[272906] = {
  spellID = 272906,
  name = "Holy Shock",
  slug = "holy_shock",
}
