----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BfA only.
----------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(4, GetBuildInfo()) < 80000 then
    return
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Class check
----------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(3, UnitClass('player')) ~= 8 then return end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
local addonName, TJ = ...
TJ.ClassData = TJ.ClassData or {}
TJ.ClassData[8] = TJ.ClassData[8] or {}
local classData = TJ.ClassData[8]
classData.spells = classData.spells or {}

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

classData.spells[116] = {
  spellID = 116,
  name = "Frostbolt",
  slug = "frostbolt",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[118] = {
  spellID = 118,
  name = "Polymorph",
  slug = "polymorph",
  max_range = 30,
  gcd = 1.5,
  duration = 60.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[120] = {
  spellID = 120,
  name = "Cone of Cold",
  slug = "cone_of_cold",
  gcd = 1.5,
  cooldown = 12.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[122] = {
  spellID = 122,
  name = "Frost Nova",
  slug = "frost_nova",
  charges = 1,
  charge_cooldown = 30.0,
  gcd = 1.5,
  duration = 8.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[133] = {
  spellID = 133,
  name = "Fireball",
  slug = "fireball",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[1449] = {
  spellID = 1449,
  name = "Arcane Explosion",
  slug = "arcane_explosion",
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[1459] = {
  spellID = 1459,
  name = "Arcane Intellect",
  slug = "arcane_intellect",
  max_range = 40,
  gcd = 1.5,
  duration = 3600.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[1463] = {
  spellID = 1463,
  name = "Incanter's Flow",
  slug = "incanters_flow",
}

classData.spells[1953] = {
  spellID = 1953,
  name = "Blink",
  slug = "blink",
  charges = 1,
  charge_cooldown = 15.0,
  gcd = 1.5,
  cooldown = 0.5,
  duration = 0.3,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[2120] = {
  spellID = 2120,
  name = "Flamestrike",
  slug = "flamestrike",
  max_range = 40,
  gcd = 1.5,
  duration = 8.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[2139] = {
  spellID = 2139,
  name = "Counterspell",
  slug = "counterspell",
  max_range = 40,
  cooldown = 24.0,
  duration = 6.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[2948] = {
  spellID = 2948,
  name = "Scorch",
  slug = "scorch",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[5019] = {
  spellID = 5019,
  name = "Shoot",
  slug = "shoot",
  max_range = 30,
  gcd = 1.5,
}

classData.spells[5143] = {
  spellID = 5143,
  name = "Arcane Missiles",
  slug = "arcane_missiles",
  max_range = 40,
  gcd = 1.5,
  duration = 2.5,
  channeled = true,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[7268] = {
  spellID = 7268,
  name = "Arcane Missiles",
  slug = "arcane_missiles",
  max_range = 60,
}

classData.spells[11366] = {
  spellID = 11366,
  name = "Pyroblast",
  slug = "pyroblast",
  max_range = 40,
  gcd = 1.5,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[11426] = {
  spellID = 11426,
  name = "Ice Barrier",
  slug = "ice_barrier",
  gcd = 1.5,
  cooldown = 25.0,
  duration = 60.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[12042] = {
  spellID = 12042,
  name = "Arcane Power",
  slug = "arcane_power",
  gcd = 1.5,
  cooldown = 90.0,
  duration = 10.0,
}

classData.spells[12051] = {
  spellID = 12051,
  name = "Evocation",
  slug = "evocation",
  charges = 1,
  charge_cooldown = 180.0,
  gcd = 1.5,
  duration = 6.0,
  channeled = true,
  haste_affected_ticks = true,
}

classData.spells[12472] = {
  spellID = 12472,
  name = "Icy Veins",
  slug = "icy_veins",
  gcd = 1.5,
  cooldown = 180.0,
  duration = 20.0,
}

classData.spells[12654] = {
  spellID = 12654,
  name = "Ignite",
  slug = "ignite",
  max_range = 50000,
  duration = 9.0,
}

classData.spells[12846] = {
  spellID = 12846,
  name = "Mastery: Ignite",
  slug = "mastery_ignite",
}

classData.spells[12982] = {
  spellID = 12982,
  name = "Shatter",
  slug = "shatter",
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

classData.spells[28271] = {
  spellID = 28271,
  name = "Polymorph",
  slug = "polymorph",
  max_range = 30,
  gcd = 1.5,
  duration = 60.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[28272] = {
  spellID = 28272,
  name = "Polymorph",
  slug = "polymorph",
  max_range = 30,
  gcd = 1.5,
  duration = 60.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[28730] = {
  spellID = 28730,
  name = "Arcane Torrent",
  slug = "arcane_torrent",
  gcd = 1.5,
  cooldown = 150.0,
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

classData.spells[30451] = {
  spellID = 30451,
  name = "Arcane Blast",
  slug = "arcane_blast",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[30455] = {
  spellID = 30455,
  name = "Ice Lance",
  slug = "ice_lance",
  replaces_spell_id = 108853,
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[31589] = {
  spellID = 31589,
  name = "Slow",
  slug = "slow",
  max_range = 35,
  gcd = 1.5,
  duration = 15.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[31661] = {
  spellID = 31661,
  name = "Dragon's Breath",
  slug = "dragons_breath",
  initial_stacks = 1,
  gcd = 1.5,
  cooldown = 20.0,
  duration = 4.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[31687] = {
  spellID = 31687,
  name = "Summon Water Elemental",
  slug = "summon_water_elemental",
  gcd = 1.5,
  cooldown = 30.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[31707] = {
  spellID = 31707,
  name = "Waterbolt",
  slug = "waterbolt",
  max_range = 45,
  gcd = 1.5,
}

classData.spells[32612] = {
  spellID = 32612,
  name = "Invisibility",
  slug = "invisibility",
  duration = 20.0,
}

classData.spells[33395] = {
  spellID = 33395,
  name = "Freeze",
  slug = "freeze",
  max_range = 45,
  cooldown = 25.0,
  duration = 8.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[33702] = {
  spellID = 33702,
  name = "Blood Fury",
  slug = "blood_fury",
  cooldown = 120.0,
  duration = 15.0,
}

classData.spells[36032] = {
  spellID = 36032,
  name = "Arcane Charge",
  slug = "arcane_charge",
  initial_stacks = 1,
  max_stacks = 4,
}

classData.spells[41425] = {
  spellID = 41425,
  name = "Hypothermia",
  slug = "hypothermia",
  max_range = 50000,
  duration = 30.0,
}

classData.spells[44425] = {
  spellID = 44425,
  name = "Arcane Barrage",
  slug = "arcane_barrage",
  max_range = 40,
  gcd = 1.5,
  cooldown = 3.0,
}

classData.spells[44448] = {
  spellID = 44448,
  name = "Pyroblast Clearcasting Driver",
  slug = "pyroblast_clearcasting_driver",
}

classData.spells[44457] = {
  spellID = 44457,
  name = "Living Bomb",
  slug = "living_bomb",
  max_range = 40,
  gcd = 1.5,
  cooldown = 12.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[44461] = {
  spellID = 44461,
  name = "Living Bomb",
  slug = "living_bomb",
  max_range = 50000,
}

classData.spells[44544] = {
  spellID = 44544,
  name = "Fingers of Frost",
  slug = "fingers_of_frost",
  max_range = 100,
  max_stacks = 2,
  duration = 15.0,
}

classData.spells[44614] = {
  spellID = 44614,
  name = "Flurry",
  slug = "flurry",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[45438] = {
  spellID = 45438,
  name = "Ice Block",
  slug = "ice_block",
  gcd = 1.5,
  cooldown = 240.0,
  duration = 10.0,
}

classData.spells[48107] = {
  spellID = 48107,
  name = "Heating Up",
  slug = "heating_up",
  max_range = 50000,
  max_stacks = 2,
  duration = 10.0,
}

classData.spells[48108] = {
  spellID = 48108,
  name = "Hot Streak!",
  slug = "hot_streak",
  max_stacks = 1,
  duration = 15.0,
}

classData.spells[55342] = {
  spellID = 55342,
  name = "Mirror Image",
  slug = "mirror_image",
  gcd = 1.5,
  cooldown = 120.0,
  duration = 40.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[56377] = {
  spellID = 56377,
  name = "Splitting Ice",
  slug = "splitting_ice",
}

classData.spells[56382] = {
  spellID = 56382,
  name = "Glyph of Crittermorph",
  slug = "glyph_of_crittermorph",
}

classData.spells[56384] = {
  spellID = 56384,
  name = "Arcane Momentum",
  slug = "arcane_momentum",
}

classData.spells[56599] = {
  spellID = 56599,
  name = "Crittermorph",
  slug = "crittermorph",
}

classData.spells[57724] = {
  spellID = 57724,
  name = "Sated",
  slug = "sated",
  max_range = 50000,
  duration = 600.0,
}

classData.spells[59548] = {
  spellID = 59548,
  name = "Gift of the Naaru",
  slug = "gift_of_the_naaru",
  max_range = 40,
  cooldown = 180.0,
  duration = 5.0,
  haste_affected_ticks = true,
}

classData.spells[59638] = {
  spellID = 59638,
  name = "Frostbolt",
  slug = "frostbolt",
  max_range = 40,
  duration = 4.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[61025] = {
  spellID = 61025,
  name = "Polymorph",
  slug = "polymorph",
  max_range = 30,
  gcd = 1.5,
  duration = 50.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[61305] = {
  spellID = 61305,
  name = "Polymorph",
  slug = "polymorph",
  max_range = 30,
  gcd = 1.5,
  duration = 50.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[61721] = {
  spellID = 61721,
  name = "Polymorph",
  slug = "polymorph",
  max_range = 30,
  gcd = 1.5,
  duration = 50.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[61780] = {
  spellID = 61780,
  name = "Polymorph",
  slug = "polymorph",
  max_range = 30,
  gcd = 1.5,
  duration = 50.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[65220] = {
  spellID = 65220,
  name = "Avoidance",
  slug = "avoidance",
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

classData.spells[76613] = {
  spellID = 76613,
  name = "Mastery: Icicles",
  slug = "mastery_icicles",
}

classData.spells[79684] = {
  spellID = 79684,
  name = "Clearcasting",
  slug = "clearcasting",
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[80353] = {
  spellID = 80353,
  name = "Time Warp",
  slug = "time_warp",
  gcd = 1.5,
  cooldown = 300.0,
  duration = 40.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[80354] = {
  spellID = 80354,
  name = "Temporal Displacement",
  slug = "temporal_displacement",
  max_range = 50000,
  duration = 600.0,
}

classData.spells[82691] = {
  spellID = 82691,
  name = "Ring of Frost",
  slug = "ring_of_frost",
  max_range = 100,
  duration = 10.0,
}

classData.spells[84714] = {
  spellID = 84714,
  name = "Frozen Orb",
  slug = "frozen_orb",
  max_range = 40,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 15.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[84721] = {
  spellID = 84721,
  name = "Frozen Orb",
  slug = "frozen_orb",
  max_range = 100,
}

classData.spells[86949] = {
  spellID = 86949,
  name = "Cauterize",
  slug = "cauterize",
}

classData.spells[87023] = {
  spellID = 87023,
  name = "Cauterize",
  slug = "cauterize",
  duration = 6.0,
}

classData.spells[87024] = {
  spellID = 87024,
  name = "Cauterized",
  slug = "cauterized",
  max_range = 50000,
  duration = 300.0,
}

classData.spells[87833] = {
  spellID = 87833,
  name = "Invisibility Speed",
  slug = "invisibility_speed",
}

classData.spells[88082] = {
  spellID = 88082,
  name = "Fireball",
  slug = "fireball",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[88084] = {
  spellID = 88084,
  name = "Arcane Blast",
  slug = "arcane_blast",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[89744] = {
  spellID = 89744,
  name = "Wizardry",
  slug = "wizardry",
}

classData.spells[94293] = {
  spellID = 94293,
  name = "Altered Form",
  slug = "altered_form",
}

classData.spells[108839] = {
  spellID = 108839,
  name = "Ice Floes",
  slug = "ice_floes",
  initial_stacks = 1,
  max_stacks = 3,
  charges = 3,
  charge_cooldown = 20.0,
  duration = 15.0,
  internal_cooldown = 0.1,
}

classData.spells[108843] = {
  spellID = 108843,
  name = "Blazing Speed",
  slug = "blazing_speed",
  cooldown = 25.0,
  duration = 6.0,
}

classData.spells[108853] = {
  spellID = 108853,
  name = "Fire Blast",
  slug = "fire_blast",
  max_range = 40,
  charges = 1,
  charge_cooldown = 12.0,
  cooldown = 0.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[110959] = {
  spellID = 110959,
  name = "Greater Invisibility",
  slug = "greater_invisibility",
  replaces_spell_id = 66,
  gcd = 1.5,
  cooldown = 120.0,
}

classData.spells[110960] = {
  spellID = 110960,
  name = "Greater Invisibility",
  slug = "greater_invisibility",
  duration = 20.0,
}

classData.spells[112965] = {
  spellID = 112965,
  name = "Fingers of Frost",
  slug = "fingers_of_frost",
}

classData.spells[113724] = {
  spellID = 113724,
  name = "Ring of Frost",
  slug = "ring_of_frost",
  max_range = 30,
  gcd = 1.5,
  cooldown = 45.0,
  duration = 10.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[113862] = {
  spellID = 113862,
  name = "Greater Invisibility",
  slug = "greater_invisibility",
}

classData.spells[114923] = {
  spellID = 114923,
  name = "Nether Tempest",
  slug = "nether_tempest",
  max_range = 40,
  gcd = 1.5,
  duration = 12.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[114954] = {
  spellID = 114954,
  name = "Nether Tempest",
  slug = "nether_tempest",
  max_range = 50000,
}

classData.spells[116011] = {
  spellID = 116011,
  name = "Rune of Power",
  slug = "rune_of_power",
  max_range = 30,
  charges = 2,
  charge_cooldown = 40.0,
  gcd = 1.5,
  cooldown = 10.0,
  duration = 10.0,
}

classData.spells[116014] = {
  spellID = 116014,
  name = "Rune of Power",
  slug = "rune_of_power",
  duration = 10.0,
}

classData.spells[116267] = {
  spellID = 116267,
  name = "Incanter's Flow",
  slug = "incanters_flow",
  max_range = 50000,
  max_stacks = 5,
  duration = 25.0,
}

classData.spells[117216] = {
  spellID = 117216,
  name = "Critical Mass",
  slug = "critical_mass",
}

classData.spells[120145] = {
  spellID = 120145,
  name = "Ancient Teleport: Dalaran",
  slug = "ancient_teleport_dalaran",
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[121039] = {
  spellID = 121039,
  name = "Mana Attunement",
  slug = "mana_attunement",
}

classData.spells[126578] = {
  spellID = 126578,
  name = "Conjure Familiar",
  slug = "conjure_familiar",
  gcd = 1.5,
  cooldown = 60.0,
}

classData.spells[126819] = {
  spellID = 126819,
  name = "Polymorph",
  slug = "polymorph",
  max_range = 30,
  gcd = 1.5,
  duration = 50.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[131784] = {
  spellID = 131784,
  name = "Illusion",
  slug = "illusion",
  cooldown = 600.0,
}

classData.spells[136511] = {
  spellID = 136511,
  name = "Ring of Frost",
  slug = "ring_of_frost",
  cooldown = 45.0,
  duration = 10.0,
}

classData.spells[137018] = {
  spellID = 137018,
  name = "Mage",
  slug = "mage",
}

classData.spells[137019] = {
  spellID = 137019,
  name = "Fire Mage",
  slug = "fire_mage",
}

classData.spells[137020] = {
  spellID = 137020,
  name = "Frost Mage",
  slug = "frost_mage",
}

classData.spells[137021] = {
  spellID = 137021,
  name = "Arcane Mage",
  slug = "arcane_mage",
}

classData.spells[145257] = {
  spellID = 145257,
  name = "Item - Mage T16 4P Bonus",
  slug = "item__mage_t16_4p_bonus",
}

classData.spells[145264] = {
  spellID = 145264,
  name = "Frigid Blast",
  slug = "frigid_blast",
  max_range = 100,
}

classData.spells[146662] = {
  spellID = 146662,
  name = "Glyph of Evaporation",
  slug = "glyph_of_evaporation",
}

classData.spells[146976] = {
  spellID = 146976,
  name = "Glyph of the Unbound Elemental",
  slug = "glyph_of_the_unbound_elemental",
}

classData.spells[147970] = {
  spellID = 147970,
  name = "Unbound Elemental",
  slug = "unbound_elemental",
}

classData.spells[147971] = {
  spellID = 147971,
  name = "Evaporation",
  slug = "evaporation",
}

classData.spells[148012] = {
  spellID = 148012,
  name = "Icicle",
  slug = "icicle",
  duration = 60.0,
}

classData.spells[148022] = {
  spellID = 148022,
  name = "Icicle",
  slug = "icicle",
  max_range = 100,
}

classData.spells[153561] = {
  spellID = 153561,
  name = "Meteor",
  slug = "meteor",
  max_range = 40,
  gcd = 1.5,
  cooldown = 45.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[153564] = {
  spellID = 153564,
  name = "Meteor",
  slug = "meteor",
  max_range = 100,
  haste_affected_ticks = true,
}

classData.spells[153595] = {
  spellID = 153595,
  name = "Comet Storm",
  slug = "comet_storm",
  max_range = 40,
  gcd = 1.5,
  cooldown = 30.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[153596] = {
  spellID = 153596,
  name = "Comet Storm",
  slug = "comet_storm",
  max_range = 100,
}

classData.spells[153626] = {
  spellID = 153626,
  name = "Arcane Orb",
  slug = "arcane_orb",
  max_range = 40,
  gcd = 1.5,
  cooldown = 20.0,
  duration = 2.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[153640] = {
  spellID = 153640,
  name = "Arcane Orb",
  slug = "arcane_orb",
  max_range = 100,
}

classData.spells[155147] = {
  spellID = 155147,
  name = "Overpowered",
  slug = "overpowered",
}

classData.spells[155148] = {
  spellID = 155148,
  name = "Kindling",
  slug = "kindling",
}

classData.spells[155149] = {
  spellID = 155149,
  name = "Thermal Void",
  slug = "thermal_void",
}

classData.spells[155158] = {
  spellID = 155158,
  name = "Meteor Burn",
  slug = "meteor_burn",
  max_range = 100,
  max_stacks = 3,
  duration = 10.0,
}

classData.spells[157642] = {
  spellID = 157642,
  name = "Enhanced Pyrotechnics",
  slug = "enhanced_pyrotechnics",
}

classData.spells[157644] = {
  spellID = 157644,
  name = "Enhanced Pyrotechnics",
  slug = "enhanced_pyrotechnics",
  max_stacks = 10,
  duration = 15.0,
}

classData.spells[157976] = {
  spellID = 157976,
  name = "Unstable Magic",
  slug = "unstable_magic",
}

classData.spells[157977] = {
  spellID = 157977,
  name = "Unstable Magic",
  slug = "unstable_magic",
  max_range = 100,
}

classData.spells[157978] = {
  spellID = 157978,
  name = "Unstable Magic",
  slug = "unstable_magic",
  max_range = 100,
}

classData.spells[157979] = {
  spellID = 157979,
  name = "Unstable Magic",
  slug = "unstable_magic",
  max_range = 100,
}

classData.spells[157980] = {
  spellID = 157980,
  name = "Supernova",
  slug = "supernova",
  max_range = 40,
  gcd = 1.5,
  cooldown = 25.0,
}

classData.spells[157981] = {
  spellID = 157981,
  name = "Blast Wave",
  slug = "blast_wave",
  gcd = 1.5,
  cooldown = 25.0,
  duration = 4.0,
}

classData.spells[157997] = {
  spellID = 157997,
  name = "Ice Nova",
  slug = "ice_nova",
  max_range = 40,
  gcd = 1.5,
  cooldown = 25.0,
  duration = 2.0,
}

classData.spells[161353] = {
  spellID = 161353,
  name = "Polymorph",
  slug = "polymorph",
  max_range = 30,
  gcd = 1.5,
  duration = 50.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[161354] = {
  spellID = 161354,
  name = "Polymorph",
  slug = "polymorph",
  max_range = 30,
  gcd = 1.5,
  duration = 50.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[161355] = {
  spellID = 161355,
  name = "Polymorph",
  slug = "polymorph",
  max_range = 30,
  gcd = 1.5,
  duration = 50.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[161372] = {
  spellID = 161372,
  name = "Polymorph",
  slug = "polymorph",
  max_range = 30,
  gcd = 1.5,
  duration = 50.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[162699] = {
  spellID = 162699,
  name = "Stat Negation Aura - Intellect DPS",
  slug = "stat_negation_aura__intellect_dps",
}

classData.spells[175396] = {
  spellID = 175396,
  name = "Meteor Burn",
  slug = "meteor_burn",
  max_range = 100,
  duration = 8.0,
}

classData.spells[177345] = {
  spellID = 177345,
  name = "Meteor",
  slug = "meteor",
  max_range = 100,
  duration = 3.0,
}

classData.spells[187292] = {
  spellID = 187292,
  name = "Rule of Threes",
  slug = "rule_of_threes",
  duration = 10.0,
}

classData.spells[187677] = {
  spellID = 187677,
  name = "Aegwynn's Ascendance",
  slug = "aegwynns_ascendance",
}

classData.spells[190319] = {
  spellID = 190319,
  name = "Combustion",
  slug = "combustion",
  cooldown = 120.0,
  duration = 10.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[190336] = {
  spellID = 190336,
  name = "Conjure Refreshment",
  slug = "conjure_refreshment",
  gcd = 1.5,
  cooldown = 15.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[190356] = {
  spellID = 190356,
  name = "Blizzard",
  slug = "blizzard",
  max_range = 35,
  gcd = 1.5,
  cooldown = 8.0,
  duration = 8.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[190357] = {
  spellID = 190357,
  name = "Blizzard",
  slug = "blizzard",
  max_range = 100,
}

classData.spells[190427] = {
  spellID = 190427,
  name = "Arcane Charge",
  slug = "arcane_charge",
}

classData.spells[190446] = {
  spellID = 190446,
  name = "Brain Freeze",
  slug = "brain_freeze",
  max_range = 100,
  initial_stacks = 1,
  max_stacks = 1,
  duration = 15.0,
}

classData.spells[190447] = {
  spellID = 190447,
  name = "Brain Freeze",
  slug = "brain_freeze",
}

classData.spells[190740] = {
  spellID = 190740,
  name = "Mastery: Savant",
  slug = "mastery_savant",
}

classData.spells[191764] = {
  spellID = 191764,
  name = "Frostbolt",
  slug = "frostbolt",
  max_range = 40,
  duration = 4.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[191799] = {
  spellID = 191799,
  name = "Shoot",
  slug = "shoot",
  max_range = 60,
}

classData.spells[194315] = {
  spellID = 194315,
  name = "Molten Skin",
  slug = "molten_skin",
}

classData.spells[194431] = {
  spellID = 194431,
  name = "Aftershocks",
  slug = "aftershocks",
}

classData.spells[194432] = {
  spellID = 194432,
  name = "Aftershocks",
  slug = "aftershocks",
  max_range = 40,
  haste_affected_ticks = true,
}

classData.spells[194466] = {
  spellID = 194466,
  name = "Phoenix's Flames",
  slug = "phoenixs_flames",
  max_range = 40,
  charges = 3,
  charge_cooldown = 30.0,
  gcd = 1.5,
}

classData.spells[194522] = {
  spellID = 194522,
  name = "Blast Furnace",
  slug = "blast_furnace",
  max_range = 50000,
  duration = 9.0,
}

classData.spells[195283] = {
  spellID = 195283,
  name = "Hot Streak",
  slug = "hot_streak",
  max_stacks = 1,
}

classData.spells[195302] = {
  spellID = 195302,
  name = "Arcane Charge",
  slug = "arcane_charge",
  max_stacks = 4,
}

classData.spells[195676] = {
  spellID = 195676,
  name = "Displacement",
  slug = "displacement",
  gcd = 1.5,
  cooldown = 30.0,
}

classData.spells[198144] = {
  spellID = 198144,
  name = "Ice Form",
  slug = "ice_form",
  gcd = 1.5,
  cooldown = 60.0,
  duration = 12.0,
}

classData.spells[198928] = {
  spellID = 198928,
  name = "Cinderstorm",
  slug = "cinderstorm",
  max_range = 100,
}

classData.spells[198929] = {
  spellID = 198929,
  name = "Cinderstorm",
  slug = "cinderstorm",
  max_range = 40,
  gcd = 1.5,
  cooldown = 9.0,
  duration = 2.2,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[199786] = {
  spellID = 199786,
  name = "Glacial Spike",
  slug = "glacial_spike",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[200749] = {
  spellID = 200749,
  name = "Activating Specialization",
  slug = "activating_specialization",
  max_range = 50000,
  channeled = true,
}

classData.spells[205020] = {
  spellID = 205020,
  name = "Pyromaniac",
  slug = "pyromaniac",
}

classData.spells[205021] = {
  spellID = 205021,
  name = "Ray of Frost",
  slug = "ray_of_frost",
  max_range = 40,
  gcd = 1.5,
  cooldown = 75.0,
  duration = 5.0,
  channeled = true,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[205022] = {
  spellID = 205022,
  name = "Arcane Familiar",
  slug = "arcane_familiar",
  gcd = 1.5,
  cooldown = 10.0,
  duration = 3600.0,
}

classData.spells[205024] = {
  spellID = 205024,
  name = "Lonely Winter",
  slug = "lonely_winter",
}

classData.spells[205025] = {
  spellID = 205025,
  name = "Presence of Mind",
  slug = "presence_of_mind",
  initial_stacks = 2,
  cooldown = 60.0,
}

classData.spells[205026] = {
  spellID = 205026,
  name = "Firestarter",
  slug = "firestarter",
}

classData.spells[205027] = {
  spellID = 205027,
  name = "Bone Chilling",
  slug = "bone_chilling",
}

classData.spells[205028] = {
  spellID = 205028,
  name = "Resonance",
  slug = "resonance",
}

classData.spells[205029] = {
  spellID = 205029,
  name = "Flame On",
  slug = "flame_on",
}

classData.spells[205030] = {
  spellID = 205030,
  name = "Frozen Touch",
  slug = "frozen_touch",
  cooldown = 30.0,
}

classData.spells[205032] = {
  spellID = 205032,
  name = "Charged Up",
  slug = "charged_up",
  gcd = 1.5,
  cooldown = 40.0,
  duration = 10.0,
}

classData.spells[205036] = {
  spellID = 205036,
  name = "Ice Ward",
  slug = "ice_ward",
}

classData.spells[205037] = {
  spellID = 205037,
  name = "Flame Patch",
  slug = "flame_patch",
}

classData.spells[205039] = {
  spellID = 205039,
  name = "Erosion",
  slug = "erosion",
  max_range = 40,
  cooldown = 60.0,
}

classData.spells[205470] = {
  spellID = 205470,
  name = "Flame Patch",
  slug = "flame_patch",
  max_range = 100,
  duration = 8.0,
  haste_affected_ticks = true,
}

classData.spells[205472] = {
  spellID = 205472,
  name = "Flame Patch",
  slug = "flame_patch",
  max_range = 100,
}

classData.spells[205473] = {
  spellID = 205473,
  name = "Icicles",
  slug = "icicles",
  max_stacks = 5,
  duration = 61.0,
}

classData.spells[205708] = {
  spellID = 205708,
  name = "Chilled",
  slug = "chilled",
  max_range = 100,
  duration = 15.0,
}

classData.spells[205766] = {
  spellID = 205766,
  name = "Bone Chilling",
  slug = "bone_chilling",
  max_stacks = 10,
  duration = 8.0,
}

classData.spells[208141] = {
  spellID = 208141,
  name = "Ray of Frost",
  slug = "ray_of_frost",
  max_range = 40,
  max_stacks = 6,
  duration = 10.0,
}

classData.spells[210086] = {
  spellID = 210086,
  name = "Arcane Linguist",
  slug = "arcane_linguist",
}

classData.spells[210126] = {
  spellID = 210126,
  name = "Arcane Familiar",
  slug = "arcane_familiar",
  max_range = 100,
  duration = 3600.0,
}

classData.spells[210134] = {
  spellID = 210134,
  name = "Erosion",
  slug = "erosion",
  max_range = 40,
  max_stacks = 8,
  duration = 30.0,
}

classData.spells[210154] = {
  spellID = 210154,
  name = "Erosion",
  slug = "erosion",
  max_range = 100,
  duration = 3.0,
}

classData.spells[210725] = {
  spellID = 210725,
  name = "Touch of the Magi",
  slug = "touch_of_the_magi",
  internal_cooldown = 6.0,
}

classData.spells[210726] = {
  spellID = 210726,
  name = "Mark of Aluneth",
  slug = "mark_of_aluneth",
  max_range = 40,
  max_stacks = 4,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 6.0,
}

classData.spells[210817] = {
  spellID = 210817,
  name = "Arcane Rebound",
  slug = "arcane_rebound",
  max_range = 100,
}

classData.spells[210824] = {
  spellID = 210824,
  name = "Touch of the Magi",
  slug = "touch_of_the_magi",
  max_range = 100,
  duration = 6.0,
}

classData.spells[210833] = {
  spellID = 210833,
  name = "Touch of the Magi",
  slug = "touch_of_the_magi",
  max_range = 100,
}

classData.spells[211056] = {
  spellID = 211056,
  name = "Mark of Aluneth",
  slug = "mark_of_aluneth",
  max_range = 100,
  duration = 6.0,
}

classData.spells[211076] = {
  spellID = 211076,
  name = "Mark of Aluneth",
  slug = "mark_of_aluneth",
  max_range = 100,
}

classData.spells[211088] = {
  spellID = 211088,
  name = "Mark of Aluneth",
  slug = "mark_of_aluneth",
  max_range = 100,
  max_stacks = 10,
}

classData.spells[212653] = {
  spellID = 212653,
  name = "Shimmer",
  slug = "shimmer",
  charges = 2,
  charge_cooldown = 20.0,
  cooldown = 0.5,
  duration = 0.7,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[212792] = {
  spellID = 212792,
  name = "Cone of Cold",
  slug = "cone_of_cold",
  max_range = 100,
  duration = 5.0,
}

classData.spells[212799] = {
  spellID = 212799,
  name = "Displacement Beacon",
  slug = "displacement_beacon",
  duration = 10.0,
}

classData.spells[212801] = {
  spellID = 212801,
  name = "Displacement",
  slug = "displacement",
  replaces_spell_id = 195676,
  cooldown = 30.0,
  duration = 0.3,
}

classData.spells[214130] = {
  spellID = 214130,
  name = "Icicle",
  slug = "icicle",
  duration = 60.0,
}

classData.spells[214634] = {
  spellID = 214634,
  name = "Ebonbolt",
  slug = "ebonbolt",
  max_range = 40,
  gcd = 1.5,
  cooldown = 45.0,
}

classData.spells[215775] = {
  spellID = 215775,
  name = "Phoenix Reborn",
  slug = "phoenix_reborn",
  max_range = 60,
}

classData.spells[217694] = {
  spellID = 217694,
  name = "Living Bomb",
  slug = "living_bomb",
  max_range = 40,
  duration = 4.0,
  haste_affected_ticks = true,
}

classData.spells[222305] = {
  spellID = 222305,
  name = "Fireball",
  slug = "fireball",
  max_range = 30,
  duration = 5.0,
}

classData.spells[222320] = {
  spellID = 222320,
  name = "Frostbolt",
  slug = "frostbolt",
  max_range = 30,
  duration = 5.0,
}

classData.spells[222321] = {
  spellID = 222321,
  name = "Arcane Blast",
  slug = "arcane_blast",
  max_range = 30,
}

classData.spells[224637] = {
  spellID = 224637,
  name = "Phoenix's Flames",
  slug = "phoenixs_flames",
  max_range = 40,
}

classData.spells[224968] = {
  spellID = 224968,
  name = "Mark of Aluneth",
  slug = "mark_of_aluneth",
  max_range = 40,
  max_stacks = 4,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 6.0,
}

classData.spells[225119] = {
  spellID = 225119,
  name = "Arcane Assault",
  slug = "arcane_assault",
  max_range = 100,
}

classData.spells[228354] = {
  spellID = 228354,
  name = "Flurry",
  slug = "flurry",
  max_range = 100,
  duration = 1.0,
}

classData.spells[228358] = {
  spellID = 228358,
  name = "Winter's Chill",
  slug = "winters_chill",
  max_range = 100,
  duration = 1.0,
}

classData.spells[228597] = {
  spellID = 228597,
  name = "Frostbolt",
  slug = "frostbolt",
  max_range = 100,
}

classData.spells[228598] = {
  spellID = 228598,
  name = "Ice Lance",
  slug = "ice_lance",
  max_range = 100,
  gcd = 1.5,
}

classData.spells[228599] = {
  spellID = 228599,
  name = "Ebonbolt",
  slug = "ebonbolt",
  max_range = 100,
}

classData.spells[228600] = {
  spellID = 228600,
  name = "Glacial Spike",
  slug = "glacial_spike",
  max_range = 100,
  duration = 4.0,
}

classData.spells[228601] = {
  spellID = 228601,
  name = "Comet Storm",
  slug = "comet_storm",
  max_range = 100,
}

classData.spells[231564] = {
  spellID = 231564,
  name = "Arcane Barrage",
  slug = "arcane_barrage",
}

classData.spells[231565] = {
  spellID = 231565,
  name = "Evocation",
  slug = "evocation",
}

classData.spells[231567] = {
  spellID = 231567,
  name = "Fire Blast",
  slug = "fire_blast",
}

classData.spells[231568] = {
  spellID = 231568,
  name = "Fire Blast",
  slug = "fire_blast",
}

classData.spells[231582] = {
  spellID = 231582,
  name = "Shatter",
  slug = "shatter",
}

classData.spells[231584] = {
  spellID = 231584,
  name = "Brain Freeze",
  slug = "brain_freeze",
}

classData.spells[231596] = {
  spellID = 231596,
  name = "Freeze",
  slug = "freeze",
}

classData.spells[231630] = {
  spellID = 231630,
  name = "Critical Mass",
  slug = "critical_mass",
}

classData.spells[234302] = {
  spellID = 234302,
  name = "Temporal Flux",
  slug = "temporal_flux",
}

classData.spells[235219] = {
  spellID = 235219,
  name = "Cold Snap",
  slug = "cold_snap",
  cooldown = 300.0,
}

classData.spells[235224] = {
  spellID = 235224,
  name = "Frigid Winds",
  slug = "frigid_winds",
}

classData.spells[235235] = {
  spellID = 235235,
  name = "Frost Nova",
  slug = "frost_nova",
  max_range = 100,
  duration = 8.0,
}

classData.spells[235297] = {
  spellID = 235297,
  name = "Glacial Insulation",
  slug = "glacial_insulation",
}

classData.spells[235313] = {
  spellID = 235313,
  name = "Blazing Barrier",
  slug = "blazing_barrier",
  gcd = 1.5,
  cooldown = 25.0,
  duration = 60.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[235314] = {
  spellID = 235314,
  name = "Blazing Barrier",
  slug = "blazing_barrier",
  max_range = 100,
}

classData.spells[235365] = {
  spellID = 235365,
  name = "Blazing Soul",
  slug = "blazing_soul",
}

classData.spells[235450] = {
  spellID = 235450,
  name = "Prismatic Barrier",
  slug = "prismatic_barrier",
  gcd = 1.5,
  cooldown = 25.0,
  duration = 60.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[235463] = {
  spellID = 235463,
  name = "Mana Shield",
  slug = "mana_shield",
}

classData.spells[235711] = {
  spellID = 235711,
  name = "Chrono Shift",
  slug = "chrono_shift",
}

classData.spells[235870] = {
  spellID = 235870,
  name = "Alexstrasza's Fury",
  slug = "alexstraszas_fury",
  cooldown = 45.0,
}

classData.spells[236058] = {
  spellID = 236058,
  name = "Frenetic Speed",
  slug = "frenetic_speed",
}

classData.spells[236060] = {
  spellID = 236060,
  name = "Frenetic Speed",
  slug = "frenetic_speed",
  duration = 3.0,
}

classData.spells[236298] = {
  spellID = 236298,
  name = "Chrono Shift",
  slug = "chrono_shift",
  duration = 5.0,
}

classData.spells[236299] = {
  spellID = 236299,
  name = "Chrono Shift",
  slug = "chrono_shift",
  duration = 5.0,
}

classData.spells[236457] = {
  spellID = 236457,
  name = "Slipstream",
  slug = "slipstream",
}

classData.spells[236662] = {
  spellID = 236662,
  name = "Blizzard",
  slug = "blizzard",
}

classData.spells[238126] = {
  spellID = 238126,
  name = "Time and Space",
  slug = "time_and_space",
}

classData.spells[240689] = {
  spellID = 240689,
  name = "Time and Space",
  slug = "time_and_space",
  max_range = 100,
}

classData.spells[240692] = {
  spellID = 240692,
  name = "Time and Space",
  slug = "time_and_space",
  initial_stacks = 1,
  duration = 6.0,
}

classData.spells[242252] = {
  spellID = 242252,
  name = "Item - Mage T20 Frost 2P Bonus",
  slug = "item__mage_t20_frost_2p_bonus",
}

classData.spells[242253] = {
  spellID = 242253,
  name = "Frozen Mass",
  slug = "frozen_mass",
  duration = 10.0,
}

classData.spells[242851] = {
  spellID = 242851,
  name = "Glacial Eruption",
  slug = "glacial_eruption",
  max_range = 100,
}

classData.spells[248099] = {
  spellID = 248099,
  name = "Contained Infernal Core",
  slug = "contained_infernal_core",
}

classData.spells[248100] = {
  spellID = 248100,
  name = "Shattered Fragments of Sindragosa",
  slug = "shattered_fragments_of_sindragosa",
}

classData.spells[248146] = {
  spellID = 248146,
  name = "Contained Infernal Core",
  slug = "contained_infernal_core",
  max_stacks = 30,
  duration = 30.0,
}

classData.spells[248147] = {
  spellID = 248147,
  name = "Erupting Infernal Core",
  slug = "erupting_infernal_core",
  duration = 30.0,
}

classData.spells[248176] = {
  spellID = 248176,
  name = "Shattered Fragments of Sindragosa",
  slug = "shattered_fragments_of_sindragosa",
  max_stacks = 15,
  duration = 30.0,
}

classData.spells[248177] = {
  spellID = 248177,
  name = "Rage of the Frost Wyrm",
  slug = "rage_of_the_frost_wyrm",
  duration = 30.0,
}

classData.spells[251463] = {
  spellID = 251463,
  name = "Vindicaar Matrix Crystal",
  slug = "vindicaar_matrix_crystal",
  gcd = 1.5,
}

classData.spells[251860] = {
  spellID = 251860,
  name = "Item - Mage T21 Frost 4P Bonus",
  slug = "item__mage_t21_frost_4p_bonus",
}

classData.spells[253257] = {
  spellID = 253257,
  name = "Arctic Blast",
  slug = "arctic_blast",
  duration = 15.0,
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

classData.spells[257537] = {
  spellID = 257537,
  name = "Ebonbolt",
  slug = "ebonbolt",
  max_range = 40,
  gcd = 1.5,
  cooldown = 45.0,
}

classData.spells[257538] = {
  spellID = 257538,
  name = "Ebonbolt",
  slug = "ebonbolt",
  max_range = 100,
}

classData.spells[257541] = {
  spellID = 257541,
  name = "Phoenix Flames",
  slug = "phoenix_flames",
  max_range = 40,
  charges = 3,
  charge_cooldown = 30.0,
  gcd = 1.5,
}

classData.spells[257542] = {
  spellID = 257542,
  name = "Phoenix Flames",
  slug = "phoenix_flames",
  max_range = 40,
}

classData.spells[263725] = {
  spellID = 263725,
  name = "Clearcasting",
  slug = "clearcasting",
  initial_stacks = 1,
  max_stacks = 1,
  duration = 15.0,
}

classData.spells[264351] = {
  spellID = 264351,
  name = "Mana Adept",
  slug = "mana_adept",
}

classData.spells[264352] = {
  spellID = 264352,
  name = "Mana Adept",
  slug = "mana_adept",
}

classData.spells[264353] = {
  spellID = 264353,
  name = "Mana Adept",
  slug = "mana_adept",
}

classData.spells[264354] = {
  spellID = 264354,
  name = "Rule of Threes",
  slug = "rule_of_threes",
}

classData.spells[264774] = {
  spellID = 264774,
  name = "Rule of Threes",
  slug = "rule_of_threes",
  initial_stacks = 1,
  duration = 15.0,
}

classData.spells[269644] = {
  spellID = 269644,
  name = "Searing Touch",
  slug = "searing_touch",
}

classData.spells[269650] = {
  spellID = 269650,
  name = "Pyroclasm",
  slug = "pyroclasm",
}

classData.spells[269651] = {
  spellID = 269651,
  name = "Pyroclasm",
  slug = "pyroclasm",
  max_stacks = 2,
  duration = 15.0,
}

classData.spells[270232] = {
  spellID = 270232,
  name = "Freezing Rain",
  slug = "freezing_rain",
  duration = 12.0,
}

classData.spells[270233] = {
  spellID = 270233,
  name = "Freezing Rain",
  slug = "freezing_rain",
}

classData.spells[270559] = {
  spellID = 270559,
  name = "Coming Soon",
  slug = "coming_soon",
}
