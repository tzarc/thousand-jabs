----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BfA only.
----------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(4, GetBuildInfo()) < 80000 then
    return
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Class check
----------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(3, UnitClass('player')) ~= 7 then return end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
local addonName, TJ = ...
TJ.ClassData = TJ.ClassData or {}
TJ.ClassData[7] = TJ.ClassData[7] or {}
local classData = TJ.ClassData[7]
classData.spells = classData.spells or {}

classData.spells[107] = {
  spellID = 107,
  name = "Block",
  slug = "block",
}

classData.spells[370] = {
  spellID = 370,
  name = "Purge",
  slug = "purge",
  max_range = 30,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[379] = {
  spellID = 379,
  name = "Earth Shield",
  slug = "earth_shield",
  max_range = 300,
}

classData.spells[403] = {
  spellID = 403,
  name = "Lightning Bolt",
  slug = "lightning_bolt",
  max_range = 40,
  gcd = 1.5,
}

classData.spells[421] = {
  spellID = 421,
  name = "Chain Lightning",
  slug = "chain_lightning",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[974] = {
  spellID = 974,
  name = "Earth Shield",
  slug = "earth_shield",
  max_range = 40,
  initial_stacks = 9,
  gcd = 1.5,
  duration = 600.0,
  internal_cooldown = 3.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[1064] = {
  spellID = 1064,
  name = "Chain Heal",
  slug = "chain_heal",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[2484] = {
  spellID = 2484,
  name = "Earthbind Totem",
  slug = "earthbind_totem",
  max_range = 35,
  gcd = 1.0,
  cooldown = 30.0,
  duration = 20.0,
}

classData.spells[2645] = {
  spellID = 2645,
  name = "Ghost Wolf",
  slug = "ghost_wolf",
  gcd = 1.5,
}

classData.spells[2825] = {
  spellID = 2825,
  name = "Bloodlust",
  slug = "bloodlust",
  gcd = 1.5,
  cooldown = 300.0,
  duration = 40.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[3600] = {
  spellID = 3600,
  name = "Earthbind",
  slug = "earthbind",
  duration = 5.0,
}

classData.spells[5394] = {
  spellID = 5394,
  name = "Healing Stream Totem",
  slug = "healing_stream_totem",
  charges = 1,
  charge_cooldown = 30.0,
  gcd = 1.0,
  duration = 15.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[5672] = {
  spellID = 5672,
  name = "Healing Stream",
  slug = "healing_stream",
  duration = 15.0,
  haste_affected_ticks = true,
}

classData.spells[6196] = {
  spellID = 6196,
  name = "Far Sight",
  slug = "far_sight",
  max_range = 50000,
  gcd = 1.5,
  duration = 60.0,
  channeled = true,
}

classData.spells[8004] = {
  spellID = 8004,
  name = "Healing Surge",
  slug = "healing_surge",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[8042] = {
  spellID = 8042,
  name = "Earth Shock",
  slug = "earth_shock",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "maelstrom", amount = 60, },
  },
}

classData.spells[8143] = {
  spellID = 8143,
  name = "Tremor Totem",
  slug = "tremor_totem",
  gcd = 1.0,
  cooldown = 60.0,
  duration = 10.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[8146] = {
  spellID = 8146,
  name = "Tremor Totem Effect",
  slug = "tremor_totem_effect",
}

classData.spells[8349] = {
  spellID = 8349,
  name = "Fire Nova",
  slug = "fire_nova",
  max_range = 100,
}

classData.spells[10444] = {
  spellID = 10444,
  name = "Flametongue Attack",
  slug = "flametongue_attack",
  max_range = 50000,
}

classData.spells[16166] = {
  spellID = 16166,
  name = "Master of the Elements",
  slug = "master_of_the_elements",
  cooldown = 120.0,
}

classData.spells[16196] = {
  spellID = 16196,
  name = "Resurgence",
  slug = "resurgence",
}

classData.spells[17364] = {
  spellID = 17364,
  name = "Stormstrike",
  slug = "stormstrike",
  max_range = 5,
  gcd = 1.5,
  cooldown = 9.0,
  power = {
    [1] = { resource = "maelstrom", amount = 30, },
  },
}

classData.spells[20591] = {
  spellID = 20591,
  name = "Expansive Mind",
  slug = "expansive_mind",
}

classData.spells[20608] = {
  spellID = 20608,
  name = "Reincarnation",
  slug = "reincarnation",
  cooldown = 1800.0,
}

classData.spells[21563] = {
  spellID = 21563,
  name = "Command",
  slug = "command",
}

classData.spells[25504] = {
  spellID = 25504,
  name = "Windfury Attack",
  slug = "windfury_attack",
  max_range = 100,
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

classData.spells[30884] = {
  spellID = 30884,
  name = "Nature's Guardian",
  slug = "natures_guardian",
  internal_cooldown = 45.0,
}

classData.spells[31616] = {
  spellID = 31616,
  name = "Nature's Guardian",
  slug = "natures_guardian",
}

classData.spells[32175] = {
  spellID = 32175,
  name = "Stormstrike",
  slug = "stormstrike",
  max_range = 5,
  initial_stacks = 2,
}

classData.spells[32176] = {
  spellID = 32176,
  name = "Stormstrike Off-Hand",
  slug = "stormstrike_offhand",
  max_range = 5,
}

classData.spells[32182] = {
  spellID = 32182,
  name = "Heroism",
  slug = "heroism",
  gcd = 1.5,
  cooldown = 300.0,
  duration = 40.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[33697] = {
  spellID = 33697,
  name = "Blood Fury",
  slug = "blood_fury",
  cooldown = 120.0,
  duration = 15.0,
}

classData.spells[33750] = {
  spellID = 33750,
  name = "Windfury Attack",
  slug = "windfury_attack",
  max_range = 100,
}

classData.spells[33757] = {
  spellID = 33757,
  name = "Windfury",
  slug = "windfury",
}

classData.spells[36213] = {
  spellID = 36213,
  name = "Angered Earth",
  slug = "angered_earth",
  cooldown = 5.0,
}

classData.spells[45284] = {
  spellID = 45284,
  name = "Lightning Bolt Overload",
  slug = "lightning_bolt_overload",
  max_range = 100,
}

classData.spells[45297] = {
  spellID = 45297,
  name = "Chain Lightning Overload",
  slug = "chain_lightning_overload",
  max_range = 100,
}

classData.spells[51385] = {
  spellID = 51385,
  name = "Frozen Rune Weapon 2",
  slug = "frozen_rune_weapon_2",
  internal_cooldown = 0.0,
}

classData.spells[51386] = {
  spellID = 51386,
  name = "Frozen Rune Weapon 3",
  slug = "frozen_rune_weapon_3",
  internal_cooldown = 0.0,
}

classData.spells[51387] = {
  spellID = 51387,
  name = "Frozen Rune Weapon 4",
  slug = "frozen_rune_weapon_4",
  internal_cooldown = 0.0,
}

classData.spells[51388] = {
  spellID = 51388,
  name = "Frozen Rune Weapon 5",
  slug = "frozen_rune_weapon_5",
  internal_cooldown = 0.0,
}

classData.spells[51485] = {
  spellID = 51485,
  name = "Earthgrab Totem",
  slug = "earthgrab_totem",
  max_range = 35,
  gcd = 1.0,
  cooldown = 30.0,
  duration = 20.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[51490] = {
  spellID = 51490,
  name = "Thunderstorm",
  slug = "thunderstorm",
  gcd = 1.5,
  cooldown = 45.0,
  duration = 5.0,
}

classData.spells[51505] = {
  spellID = 51505,
  name = "Lava Burst",
  slug = "lava_burst",
  max_range = 40,
  charges = 1,
  charge_cooldown = 8.0,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, aura = 137039, },
  },
}

classData.spells[51514] = {
  spellID = 51514,
  name = "Hex",
  slug = "hex",
  max_range = 30,
  gcd = 1.5,
  cooldown = 30.0,
  duration = 60.0,
}

classData.spells[51533] = {
  spellID = 51533,
  name = "Feral Spirit",
  slug = "feral_spirit",
  max_range = 30,
  gcd = 1.5,
  cooldown = 120.0,
}

classData.spells[51564] = {
  spellID = 51564,
  name = "Tidal Waves",
  slug = "tidal_waves",
}

classData.spells[51886] = {
  spellID = 51886,
  name = "Cleanse Spirit",
  slug = "cleanse_spirit",
  max_range = 40,
  gcd = 1.5,
  cooldown = 8.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[52042] = {
  spellID = 52042,
  name = "Healing Stream Totem",
  slug = "healing_stream_totem",
  max_range = 100,
}

classData.spells[53390] = {
  spellID = 53390,
  name = "Tidal Waves",
  slug = "tidal_waves",
  initial_stacks = 1,
  max_stacks = 2,
  duration = 15.0,
}

classData.spells[57723] = {
  spellID = 57723,
  name = "Exhaustion",
  slug = "exhaustion",
  max_range = 50000,
  duration = 600.0,
}

classData.spells[57724] = {
  spellID = 57724,
  name = "Sated",
  slug = "sated",
  max_range = 50000,
  duration = 600.0,
}

classData.spells[57984] = {
  spellID = 57984,
  name = "Fire Blast",
  slug = "fire_blast",
  max_range = 40,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[57994] = {
  spellID = 57994,
  name = "Wind Shear",
  slug = "wind_shear",
  max_range = 30,
  cooldown = 12.0,
  duration = 3.0,
}

classData.spells[58135] = {
  spellID = 58135,
  name = "Glyph of the Spectral Wolf",
  slug = "glyph_of_the_spectral_wolf",
}

classData.spells[58261] = {
  spellID = 58261,
  name = "Spectral Wolf",
  slug = "spectral_wolf",
}

classData.spells[58875] = {
  spellID = 58875,
  name = "Spirit Walk",
  slug = "spirit_walk",
  cooldown = 60.0,
  duration = 8.0,
}

classData.spells[58876] = {
  spellID = 58876,
  name = "Spirit Walk",
  slug = "spirit_walk",
  max_range = 25,
  duration = 0.1,
}

classData.spells[58877] = {
  spellID = 58877,
  name = "Spirit Hunt",
  slug = "spirit_hunt",
  max_range = 100,
  gcd = 1.5,
  cooldown = 10.0,
}

classData.spells[59547] = {
  spellID = 59547,
  name = "Gift of the Naaru",
  slug = "gift_of_the_naaru",
  max_range = 40,
  cooldown = 180.0,
  duration = 5.0,
  haste_affected_ticks = true,
}

classData.spells[60103] = {
  spellID = 60103,
  name = "Lava Lash",
  slug = "lava_lash",
  max_range = 5,
  gcd = 1.5,
  power = {
    [1] = { resource = "maelstrom", amount = 40, },
  },
}

classData.spells[60188] = {
  spellID = 60188,
  name = "Elemental Fury",
  slug = "elemental_fury",
}

classData.spells[61295] = {
  spellID = 61295,
  name = "Riptide",
  slug = "riptide",
  max_range = 40,
  charges = 1,
  charge_cooldown = 6.0,
  gcd = 1.5,
  duration = 15.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[61882] = {
  spellID = 61882,
  name = "Earthquake",
  slug = "earthquake",
  max_range = 35,
  gcd = 1.5,
  duration = 6.0,
  power = {
    [1] = { resource = "maelstrom", amount = 75, },
  },
}

classData.spells[63279] = {
  spellID = 63279,
  name = "Glyph of Deluge",
  slug = "glyph_of_deluge",
}

classData.spells[63925] = {
  spellID = 63925,
  name = "Deluge",
  slug = "deluge",
}

classData.spells[64695] = {
  spellID = 64695,
  name = "Earthgrab",
  slug = "earthgrab",
  duration = 8.0,
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

classData.spells[73685] = {
  spellID = 73685,
  name = "Unleash Life",
  slug = "unleash_life",
  max_range = 40,
  initial_stacks = 1,
  charges = 1,
  charge_cooldown = 15.0,
  gcd = 1.5,
  duration = 10.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[73920] = {
  spellID = 73920,
  name = "Healing Rain",
  slug = "healing_rain",
  max_range = 40,
  gcd = 1.5,
  cooldown = 10.0,
  duration = 10.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[73921] = {
  spellID = 73921,
  name = "Healing Rain",
  slug = "healing_rain",
  max_range = 100,
}

classData.spells[77130] = {
  spellID = 77130,
  name = "Purify Spirit",
  slug = "purify_spirit",
  max_range = 40,
  charges = 1,
  charge_cooldown = 8.0,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[77223] = {
  spellID = 77223,
  name = "Mastery: Enhanced Elements",
  slug = "mastery_enhanced_elements",
}

classData.spells[77226] = {
  spellID = 77226,
  name = "Mastery: Deep Healing",
  slug = "mastery_deep_healing",
}

classData.spells[77451] = {
  spellID = 77451,
  name = "Lava Burst Overload",
  slug = "lava_burst_overload",
  max_range = 100,
}

classData.spells[77472] = {
  spellID = 77472,
  name = "Healing Wave",
  slug = "healing_wave",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[77478] = {
  spellID = 77478,
  name = "Earthquake",
  slug = "earthquake",
  max_range = 100,
}

classData.spells[77756] = {
  spellID = 77756,
  name = "Lava Surge",
  slug = "lava_surge",
}

classData.spells[77762] = {
  spellID = 77762,
  name = "Lava Surge",
  slug = "lava_surge",
  initial_stacks = 1,
  duration = 10.0,
}

classData.spells[79206] = {
  spellID = 79206,
  name = "Spiritwalker's Grace",
  slug = "spiritwalkers_grace",
  cooldown = 120.0,
  duration = 15.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[86040] = {
  spellID = 86040,
  name = "Hand of Gul'dan",
  slug = "hand_of_guldan",
  max_range = 50000,
}

classData.spells[86099] = {
  spellID = 86099,
  name = "Mail Specialization",
  slug = "mail_specialization",
}

classData.spells[86100] = {
  spellID = 86100,
  name = "Mail Specialization",
  slug = "mail_specialization",
}

classData.spells[86108] = {
  spellID = 86108,
  name = "Mail Specialization",
  slug = "mail_specialization",
}

classData.spells[86629] = {
  spellID = 86629,
  name = "Dual Wield",
  slug = "dual_wield",
}

classData.spells[94293] = {
  spellID = 94293,
  name = "Altered Form",
  slug = "altered_form",
}

classData.spells[98007] = {
  spellID = 98007,
  name = "Spirit Link Totem",
  slug = "spirit_link_totem",
}

classData.spells[98008] = {
  spellID = 98008,
  name = "Spirit Link Totem",
  slug = "spirit_link_totem",
  max_range = 40,
  charges = 1,
  charge_cooldown = 180.0,
  gcd = 1.0,
  duration = 6.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[98017] = {
  spellID = 98017,
  name = "Spirit Link",
  slug = "spirit_link",
  duration = 10.0,
}

classData.spells[98020] = {
  spellID = 98020,
  name = "Spirit Link",
  slug = "spirit_link",
}

classData.spells[104317] = {
  spellID = 104317,
  name = "Wild Imp",
  slug = "wild_imp",
  max_range = 100,
  duration = 25.0,
}

classData.spells[105174] = {
  spellID = 105174,
  name = "Hand of Gul'dan",
  slug = "hand_of_guldan",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "soul_shard", amount = 1, max_amount = 2, },
  },
}

classData.spells[108271] = {
  spellID = 108271,
  name = "Astral Shift",
  slug = "astral_shift",
  cooldown = 90.0,
  duration = 8.0,
}

classData.spells[108280] = {
  spellID = 108280,
  name = "Healing Tide Totem",
  slug = "healing_tide_totem",
  gcd = 1.0,
  cooldown = 180.0,
  duration = 10.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[108281] = {
  spellID = 108281,
  name = "Ancestral Guidance",
  slug = "ancestral_guidance",
  gcd = 1.5,
  cooldown = 120.0,
  duration = 10.0,
}

classData.spells[108283] = {
  spellID = 108283,
  name = "Echo of the Elements",
  slug = "echo_of_the_elements",
}

classData.spells[114050] = {
  spellID = 114050,
  name = "Ascendance",
  slug = "ascendance",
  gcd = 1.5,
  cooldown = 180.0,
  duration = 15.0,
}

classData.spells[114051] = {
  spellID = 114051,
  name = "Ascendance",
  slug = "ascendance",
  gcd = 1.5,
  cooldown = 180.0,
  duration = 15.0,
}

classData.spells[114052] = {
  spellID = 114052,
  name = "Ascendance",
  slug = "ascendance",
  cooldown = 180.0,
  duration = 15.0,
}

classData.spells[114074] = {
  spellID = 114074,
  name = "Lava Beam",
  slug = "lava_beam",
  max_range = 40,
  gcd = 1.5,
}

classData.spells[114089] = {
  spellID = 114089,
  name = "Windlash",
  slug = "windlash",
  max_range = 30,
}

classData.spells[114093] = {
  spellID = 114093,
  name = "Windlash Off-Hand",
  slug = "windlash_offhand",
  max_range = 30,
}

classData.spells[114738] = {
  spellID = 114738,
  name = "Lava Beam Overload",
  slug = "lava_beam_overload",
  max_range = 40,
}

classData.spells[114911] = {
  spellID = 114911,
  name = "Ancestral Guidance",
  slug = "ancestral_guidance",
}

classData.spells[114942] = {
  spellID = 114942,
  name = "Healing Tide",
  slug = "healing_tide",
}

classData.spells[115356] = {
  spellID = 115356,
  name = "Windstrike",
  slug = "windstrike",
  max_range = 30,
  gcd = 1.5,
  cooldown = 9.0,
  power = {
    [1] = { resource = "maelstrom", amount = 30, },
  },
}

classData.spells[115357] = {
  spellID = 115357,
  name = "Windstrike",
  slug = "windstrike",
  max_range = 100,
}

classData.spells[115360] = {
  spellID = 115360,
  name = "Windstrike Off-Hand",
  slug = "windstrike_offhand",
  max_range = 100,
}

classData.spells[116943] = {
  spellID = 116943,
  name = "Earthgrab",
  slug = "earthgrab",
}

classData.spells[116947] = {
  spellID = 116947,
  name = "Earthbind",
  slug = "earthbind",
  max_range = 100,
  duration = 5.0,
}

classData.spells[117013] = {
  spellID = 117013,
  name = "Primal Elementalist",
  slug = "primal_elementalist",
}

classData.spells[117014] = {
  spellID = 117014,
  name = "Elemental Blast",
  slug = "elemental_blast",
  max_range = 40,
  gcd = 1.5,
  cooldown = 12.0,
}

classData.spells[117588] = {
  spellID = 117588,
  name = "Meteor",
  slug = "meteor",
  max_range = 40,
  cooldown = 60.0,
  duration = 1.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[118297] = {
  spellID = 118297,
  name = "Immolate",
  slug = "immolate",
  max_range = 30,
  cooldown = 10.0,
  duration = 21.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[118337] = {
  spellID = 118337,
  name = "Harden Skin",
  slug = "harden_skin",
  max_range = 100,
  cooldown = 60.0,
  duration = 10.0,
}

classData.spells[118345] = {
  spellID = 118345,
  name = "Pulverize",
  slug = "pulverize",
  max_range = 5,
  cooldown = 40.0,
  duration = 4.0,
}

classData.spells[118522] = {
  spellID = 118522,
  name = "Elemental Blast: Critical Strike",
  slug = "elemental_blast_critical_strike",
  max_range = 40,
  duration = 10.0,
}

classData.spells[118905] = {
  spellID = 118905,
  name = "Static Charge",
  slug = "static_charge",
  duration = 3.0,
}

classData.spells[120588] = {
  spellID = 120588,
  name = "Elemental Blast Overload",
  slug = "elemental_blast_overload",
  max_range = 40,
}

classData.spells[123831] = {
  spellID = 123831,
  name = "Block",
  slug = "block",
}

classData.spells[137038] = {
  spellID = 137038,
  name = "Shaman",
  slug = "shaman",
}

classData.spells[137039] = {
  spellID = 137039,
  name = "Restoration Shaman",
  slug = "restoration_shaman",
}

classData.spells[137040] = {
  spellID = 137040,
  name = "Elemental Shaman",
  slug = "elemental_shaman",
}

classData.spells[137041] = {
  spellID = 137041,
  name = "Enhancement Shaman",
  slug = "enhancement_shaman",
}

classData.spells[145002] = {
  spellID = 145002,
  name = "Lightning Blast",
  slug = "lightning_blast",
  max_range = 40,
  gcd = 0.5,
}

classData.spells[147074] = {
  spellID = 147074,
  name = "Rushing Streams",
  slug = "rushing_streams",
}

classData.spells[147732] = {
  spellID = 147732,
  name = "Frostbrand",
  slug = "frostbrand",
  max_range = 100,
  duration = 3.0,
}

classData.spells[147783] = {
  spellID = 147783,
  name = "Glyph of Spirit Raptors",
  slug = "glyph_of_spirit_raptors",
}

classData.spells[147784] = {
  spellID = 147784,
  name = "Glyph of Lingering Ancestors",
  slug = "glyph_of_lingering_ancestors",
}

classData.spells[148079] = {
  spellID = 148079,
  name = "Spirit Raptors",
  slug = "spirit_raptors",
}

classData.spells[148080] = {
  spellID = 148080,
  name = "Lingering Ancestors",
  slug = "lingering_ancestors",
}

classData.spells[152244] = {
  spellID = 152244,
  name = "Adaptation",
  slug = "adaptation",
}

classData.spells[156843] = {
  spellID = 156843,
  name = "Combat Experience",
  slug = "combat_experience",
}

classData.spells[157153] = {
  spellID = 157153,
  name = "Cloudburst Totem",
  slug = "cloudburst_totem",
  charges = 1,
  charge_cooldown = 30.0,
  gcd = 1.0,
  cooldown = 1.0,
  duration = 15.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[157154] = {
  spellID = 157154,
  name = "High Tide",
  slug = "high_tide",
}

classData.spells[157299] = {
  spellID = 157299,
  name = "Storm Elemental",
  slug = "storm_elemental",
  duration = 30.0,
}

classData.spells[157331] = {
  spellID = 157331,
  name = "Wind Gust",
  slug = "wind_gust",
  max_range = 40,
  gcd = 0.5,
}

classData.spells[157348] = {
  spellID = 157348,
  name = "Call Lightning",
  slug = "call_lightning",
  max_range = 40,
  gcd = 0.5,
  cooldown = 10.0,
  duration = 15.0,
}

classData.spells[157444] = {
  spellID = 157444,
  name = "Critical Strikes",
  slug = "critical_strikes",
}

classData.spells[157503] = {
  spellID = 157503,
  name = "Cloudburst",
  slug = "cloudburst",
}

classData.spells[162697] = {
  spellID = 162697,
  name = "Stat Negation Aura - Agility DPS",
  slug = "stat_negation_aura__agility_dps",
}

classData.spells[162699] = {
  spellID = 162699,
  name = "Stat Negation Aura - Intellect DPS",
  slug = "stat_negation_aura__intellect_dps",
}

classData.spells[162701] = {
  spellID = 162701,
  name = "Stat Negation Aura - Intellect Healer",
  slug = "stat_negation_aura__intellect_healer",
}

classData.spells[165610] = {
  spellID = 165610,
  name = "Item - Shaman T17 Enhancement 4P Bonus",
  slug = "item__shaman_t17_enhancement_4p_bonus",
}

classData.spells[167204] = {
  spellID = 167204,
  name = "Feral Spirit",
  slug = "feral_spirit",
  max_range = 100,
  duration = 30.0,
}

classData.spells[168534] = {
  spellID = 168534,
  name = "Mastery: Elemental Overload",
  slug = "mastery_elemental_overload",
}

classData.spells[170374] = {
  spellID = 170374,
  name = "Earthen Rage",
  slug = "earthen_rage",
}

classData.spells[170377] = {
  spellID = 170377,
  name = "Earthen Rage",
  slug = "earthen_rage",
  duration = 6.0,
  haste_affected_ticks = true,
}

classData.spells[170379] = {
  spellID = 170379,
  name = "Earthen Rage",
  slug = "earthen_rage",
  max_range = 45,
}

classData.spells[170512] = {
  spellID = 170512,
  name = "Windfury Attack",
  slug = "windfury_attack",
  max_range = 100,
}

classData.spells[170523] = {
  spellID = 170523,
  name = "Feral Spirit Windfury Driver",
  slug = "feral_spirit_windfury_driver",
  max_range = 100,
  duration = 30.0,
}

classData.spells[173183] = {
  spellID = 173183,
  name = "Elemental Blast: Haste",
  slug = "elemental_blast_haste",
  max_range = 40,
  duration = 10.0,
}

classData.spells[173184] = {
  spellID = 173184,
  name = "Elemental Blast: Mastery",
  slug = "elemental_blast_mastery",
  max_range = 40,
  duration = 10.0,
}

classData.spells[185872] = {
  spellID = 185872,
  name = "Item - Shaman T18 Enhancement 4P Bonus",
  slug = "item__shaman_t18_enhancement_4p_bonus",
}

classData.spells[185881] = {
  spellID = 185881,
  name = "Item - Shaman T18 Elemental 4P Bonus",
  slug = "item__shaman_t18_elemental_4p_bonus",
}

classData.spells[187828] = {
  spellID = 187828,
  name = "Maelstrom",
  slug = "maelstrom",
}

classData.spells[187837] = {
  spellID = 187837,
  name = "Lightning Bolt",
  slug = "lightning_bolt",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "maelstrom", amount = 0, max_amount = 40, aura = 210727, },
  },
}

classData.spells[187874] = {
  spellID = 187874,
  name = "Crash Lightning",
  slug = "crash_lightning",
  max_range = 5,
  gcd = 1.5,
  cooldown = 6.0,
  power = {
    [1] = { resource = "maelstrom", amount = 20, },
  },
}

classData.spells[187878] = {
  spellID = 187878,
  name = "Crash Lightning",
  slug = "crash_lightning",
  duration = 10.0,
}

classData.spells[187880] = {
  spellID = 187880,
  name = "Maelstrom Weapon",
  slug = "maelstrom_weapon",
}

classData.spells[187890] = {
  spellID = 187890,
  name = "Maelstrom Weapon",
  slug = "maelstrom_weapon",
}

classData.spells[188070] = {
  spellID = 188070,
  name = "Healing Surge",
  slug = "healing_surge",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[188089] = {
  spellID = 188089,
  name = "Earthen Spike",
  slug = "earthen_spike",
  max_range = 10,
  gcd = 1.5,
  cooldown = 20.0,
  duration = 10.0,
  power = {
    [1] = { resource = "maelstrom", amount = 20, },
  },
}

classData.spells[188196] = {
  spellID = 188196,
  name = "Lightning Bolt",
  slug = "lightning_bolt",
  max_range = 40,
  gcd = 1.5,
}

classData.spells[188389] = {
  spellID = 188389,
  name = "Flame Shock",
  slug = "flame_shock",
  max_range = 40,
  gcd = 1.5,
  cooldown = 6.0,
  duration = 18.0,
  haste_affected_ticks = true,
}

classData.spells[188443] = {
  spellID = 188443,
  name = "Chain Lightning",
  slug = "chain_lightning",
  max_range = 40,
  gcd = 1.5,
}

classData.spells[188592] = {
  spellID = 188592,
  name = "Fire Elemental",
  slug = "fire_elemental",
  max_range = 30,
  gcd = 1.0,
  duration = 30.0,
}

classData.spells[188616] = {
  spellID = 188616,
  name = "Earth Elemental",
  slug = "earth_elemental",
  max_range = 30,
  duration = 60.0,
}

classData.spells[188838] = {
  spellID = 188838,
  name = "Flame Shock",
  slug = "flame_shock",
  max_range = 40,
  gcd = 1.5,
  cooldown = 6.0,
  duration = 21.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[189063] = {
  spellID = 189063,
  name = "Lightning Vortex",
  slug = "lightning_vortex",
  duration = 15.0,
}

classData.spells[189078] = {
  spellID = 189078,
  name = "Gathering Vortex",
  slug = "gathering_vortex",
  max_stacks = 20,
}

classData.spells[190185] = {
  spellID = 190185,
  name = "Feral Spirit",
  slug = "feral_spirit",
  max_range = 100,
}

classData.spells[190488] = {
  spellID = 190488,
  name = "Maelstrom Controller",
  slug = "maelstrom_controller",
}

classData.spells[190493] = {
  spellID = 190493,
  name = "Fulmination",
  slug = "fulmination",
}

classData.spells[190494] = {
  spellID = 190494,
  name = "Fulmination!",
  slug = "fulmination",
}

classData.spells[190899] = {
  spellID = 190899,
  name = "Healing Surge",
  slug = "healing_surge",
}

classData.spells[190900] = {
  spellID = 190900,
  name = "Healing Surge",
  slug = "healing_surge",
  max_stacks = 5,
}

classData.spells[191634] = {
  spellID = 191634,
  name = "Stormkeeper",
  slug = "stormkeeper",
  initial_stacks = 2,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 15.0,
}

classData.spells[191726] = {
  spellID = 191726,
  name = "Lightning Blast",
  slug = "lightning_blast",
  max_range = 40,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[191732] = {
  spellID = 191732,
  name = "Chain Lightning",
  slug = "chain_lightning",
  max_range = 40,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[192058] = {
  spellID = 192058,
  name = "Capacitor Totem",
  slug = "capacitor_totem",
  max_range = 35,
  gcd = 1.0,
  cooldown = 60.0,
  duration = 3.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[192077] = {
  spellID = 192077,
  name = "Wind Rush Totem",
  slug = "wind_rush_totem",
  max_range = 40,
  gcd = 1.0,
  cooldown = 120.0,
  duration = 15.0,
}

classData.spells[192078] = {
  spellID = 192078,
  name = "Wind Rush Totem",
  slug = "wind_rush_totem",
}

classData.spells[192082] = {
  spellID = 192082,
  name = "Wind Rush",
  slug = "wind_rush",
  max_range = 100,
  duration = 5.0,
}

classData.spells[192087] = {
  spellID = 192087,
  name = "Searing Assault",
  slug = "searing_assault",
}

classData.spells[192088] = {
  spellID = 192088,
  name = "Graceful Spirit",
  slug = "graceful_spirit",
}

classData.spells[192106] = {
  spellID = 192106,
  name = "Lightning Shield",
  slug = "lightning_shield",
  max_stacks = 15,
  gcd = 1.5,
  duration = 3600.0,
}

classData.spells[192109] = {
  spellID = 192109,
  name = "Lightning Shield",
  slug = "lightning_shield",
  max_range = 10,
}

classData.spells[192222] = {
  spellID = 192222,
  name = "Liquid Magma Totem",
  slug = "liquid_magma_totem",
  max_range = 40,
  gcd = 1.0,
  cooldown = 60.0,
  duration = 15.0,
}

classData.spells[192223] = {
  spellID = 192223,
  name = "Liquid Magma Totem",
  slug = "liquid_magma_totem",
}

classData.spells[192226] = {
  spellID = 192226,
  name = "Liquid Magma Totem",
  slug = "liquid_magma_totem",
  gcd = 1.5,
  cooldown = 45.0,
  duration = 15.0,
  haste_affected_ticks = true,
}

classData.spells[192231] = {
  spellID = 192231,
  name = "Liquid Magma",
  slug = "liquid_magma",
  max_range = 100,
}

classData.spells[192246] = {
  spellID = 192246,
  name = "Crashing Storm",
  slug = "crashing_storm",
}

classData.spells[192249] = {
  spellID = 192249,
  name = "Storm Elemental",
  slug = "storm_elemental",
  max_range = 40,
  gcd = 1.5,
  cooldown = 150.0,
}

classData.spells[193777] = {
  spellID = 193777,
  name = "Fulmination",
  slug = "fulmination",
}

classData.spells[193786] = {
  spellID = 193786,
  name = "Rockbiter",
  slug = "rockbiter",
  max_range = 20,
  charges = 2,
  charge_cooldown = 6.0,
  gcd = 1.5,
}

classData.spells[193796] = {
  spellID = 193796,
  name = "Flametongue",
  slug = "flametongue",
  max_range = 20,
  gcd = 1.5,
  cooldown = 12.0,
}

classData.spells[194084] = {
  spellID = 194084,
  name = "Flametongue",
  slug = "flametongue",
  duration = 16.0,
}

classData.spells[195222] = {
  spellID = 195222,
  name = "Stormlash",
  slug = "stormlash",
  max_range = 100,
  duration = 8.0,
  internal_cooldown = 0.1,
}

classData.spells[195256] = {
  spellID = 195256,
  name = "Stormlash",
  slug = "stormlash",
  max_range = 100,
}

classData.spells[195573] = {
  spellID = 195573,
  name = "Stormstrike",
  slug = "stormstrike",
  max_stacks = 3,
  duration = 2.0,
}

classData.spells[195592] = {
  spellID = 195592,
  name = "Crash Lightning",
  slug = "crash_lightning",
  max_range = 5,
}

classData.spells[195769] = {
  spellID = 195769,
  name = "Maelstrom Power Decrease",
  slug = "maelstrom_power_decrease",
  max_stacks = 10,
}

classData.spells[196283] = {
  spellID = 196283,
  name = "Hand of Doom",
  slug = "hand_of_doom",
}

classData.spells[196834] = {
  spellID = 196834,
  name = "Frostbrand",
  slug = "frostbrand",
  max_range = 20,
  gcd = 1.5,
  duration = 16.0,
  power = {
    [1] = { resource = "maelstrom", amount = 20, },
  },
}

classData.spells[196840] = {
  spellID = 196840,
  name = "Frost Shock",
  slug = "frost_shock",
  max_range = 40,
  gcd = 1.5,
  duration = 5.0,
  power = {
    [1] = { resource = "maelstrom", amount = 0, max_amount = 20, },
  },
}

classData.spells[196881] = {
  spellID = 196881,
  name = "Feral Lunge",
  slug = "feral_lunge",
  max_range = 5,
}

classData.spells[196884] = {
  spellID = 196884,
  name = "Feral Lunge",
  slug = "feral_lunge",
  min_range = 8,
  max_range = 25,
  gcd = 1.5,
  cooldown = 30.0,
}

classData.spells[197209] = {
  spellID = 197209,
  name = "Lightning Rod",
  slug = "lightning_rod",
  max_range = 40,
  duration = 10.0,
}

classData.spells[197211] = {
  spellID = 197211,
  name = "Fury of Air",
  slug = "fury_of_air",
  gcd = 1.5,
  power = {
    [1] = { resource = "maelstrom", amount = 3, per_tick = 3, },
  },
}

classData.spells[197214] = {
  spellID = 197214,
  name = "Sundering",
  slug = "sundering",
  gcd = 1.5,
  cooldown = 40.0,
  duration = 2.0,
  power = {
    [1] = { resource = "maelstrom", amount = 20, },
  },
}

classData.spells[197385] = {
  spellID = 197385,
  name = "Fury of Air",
  slug = "fury_of_air",
  duration = 3.0,
}

classData.spells[197464] = {
  spellID = 197464,
  name = "Crashing Waves",
  slug = "crashing_waves",
}

classData.spells[197568] = {
  spellID = 197568,
  name = "Lightning Rod",
  slug = "lightning_rod",
  max_range = 100,
}

classData.spells[197992] = {
  spellID = 197992,
  name = "Landslide",
  slug = "landslide",
}

classData.spells[197995] = {
  spellID = 197995,
  name = "Wellspring",
  slug = "wellspring",
  max_range = 30,
  gcd = 1.5,
  cooldown = 20.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[197997] = {
  spellID = 197997,
  name = "Wellspring",
  slug = "wellspring",
  max_range = 50000,
}

classData.spells[198067] = {
  spellID = 198067,
  name = "Fire Elemental",
  slug = "fire_elemental",
  max_range = 40,
  gcd = 1.5,
  cooldown = 150.0,
}

classData.spells[198103] = {
  spellID = 198103,
  name = "Earth Elemental",
  slug = "earth_elemental",
  max_range = 40,
  gcd = 1.5,
  cooldown = 300.0,
}

classData.spells[198299] = {
  spellID = 198299,
  name = "Gathering Storms",
  slug = "gathering_storms",
  max_range = 100,
}

classData.spells[198300] = {
  spellID = 198300,
  name = "Gathering Storms",
  slug = "gathering_storms",
  max_range = 100,
  duration = 12.0,
}

classData.spells[198455] = {
  spellID = 198455,
  name = "Spirit Bomb",
  slug = "spirit_bomb",
  max_range = 100,
}

classData.spells[198480] = {
  spellID = 198480,
  name = "Fire Nova",
  slug = "fire_nova",
  max_range = 100,
}

classData.spells[198483] = {
  spellID = 198483,
  name = "Snowstorm",
  slug = "snowstorm",
  max_range = 100,
  duration = 3.0,
}

classData.spells[198485] = {
  spellID = 198485,
  name = "Thunder Bite",
  slug = "thunder_bite",
  max_range = 100,
}

classData.spells[198506] = {
  spellID = 198506,
  name = "Feral Spirit",
  slug = "feral_spirit",
  max_range = 30,
  duration = 15.0,
}

classData.spells[198735] = {
  spellID = 198735,
  name = "Imbue the Elements",
  slug = "imbue_the_elements",
  max_range = 100,
}

classData.spells[198736] = {
  spellID = 198736,
  name = "Unleash Doom",
  slug = "unleash_doom",
  max_range = 100,
}

classData.spells[198838] = {
  spellID = 198838,
  name = "Earthen Wall Totem",
  slug = "earthen_wall_totem",
  max_range = 40,
  gcd = 1.0,
  cooldown = 60.0,
  duration = 15.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[198839] = {
  spellID = 198839,
  name = "Earthen Wall",
  slug = "earthen_wall",
}

classData.spells[199019] = {
  spellID = 199019,
  name = "Earthen Might",
  slug = "earthen_might",
  max_range = 100,
  duration = 10.0,
}

classData.spells[199022] = {
  spellID = 199022,
  name = "Earthen Might",
  slug = "earthen_might",
  max_range = 100,
}

classData.spells[199053] = {
  spellID = 199053,
  name = "Unleash Lava",
  slug = "unleash_lava",
  max_range = 100,
}

classData.spells[199054] = {
  spellID = 199054,
  name = "Unleash Lightning",
  slug = "unleash_lightning",
  max_range = 100,
}

classData.spells[199055] = {
  spellID = 199055,
  name = "Unleash Doom",
  slug = "unleash_doom",
  max_range = 100,
  duration = 6.0,
}

classData.spells[199116] = {
  spellID = 199116,
  name = "Doom Vortex",
  slug = "doom_vortex",
  max_range = 100,
}

classData.spells[200071] = {
  spellID = 200071,
  name = "Undulation",
  slug = "undulation",
}

classData.spells[200072] = {
  spellID = 200072,
  name = "Torrent",
  slug = "torrent",
}

classData.spells[200076] = {
  spellID = 200076,
  name = "Deluge",
  slug = "deluge",
}

classData.spells[200749] = {
  spellID = 200749,
  name = "Activating Specialization",
  slug = "activating_specialization",
  max_range = 50000,
  channeled = true,
}

classData.spells[201845] = {
  spellID = 201845,
  name = "Stormbringer",
  slug = "stormbringer",
}

classData.spells[201846] = {
  spellID = 201846,
  name = "Stormbringer",
  slug = "stormbringer",
  max_range = 100,
  initial_stacks = 1,
  duration = 12.0,
}

classData.spells[201900] = {
  spellID = 201900,
  name = "Hot Hand",
  slug = "hot_hand",
}

classData.spells[202004] = {
  spellID = 202004,
  name = "Landslide",
  slug = "landslide",
  initial_stacks = 1,
  duration = 10.0,
}

classData.spells[202044] = {
  spellID = 202044,
  name = "Stomp",
  slug = "stomp",
  max_range = 5,
  gcd = 1.5,
  cooldown = 14.0,
  duration = 3.0,
}

classData.spells[202045] = {
  spellID = 202045,
  name = "Feral Swipe",
  slug = "feral_swipe",
  max_range = 5,
  max_stacks = 15,
  gcd = 1.5,
  cooldown = 3.0,
  duration = 10.0,
}

classData.spells[202188] = {
  spellID = 202188,
  name = "Resonance Totem",
  slug = "resonance_totem",
  max_range = 40,
  gcd = 1.0,
  cooldown = 30.0,
  duration = 120.0,
}

classData.spells[202192] = {
  spellID = 202192,
  name = "Resonance Totem",
  slug = "resonance_totem",
  max_range = 30,
}

classData.spells[204945] = {
  spellID = 204945,
  name = "Doom Winds",
  slug = "doom_winds",
  max_range = 100,
  cooldown = 60.0,
  duration = 6.0,
}

classData.spells[205495] = {
  spellID = 205495,
  name = "Stormkeeper",
  slug = "stormkeeper",
  initial_stacks = 3,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 15.0,
}

classData.spells[205533] = {
  spellID = 205533,
  name = "Volcanic Inferno",
  slug = "volcanic_inferno",
  max_range = 100,
}

classData.spells[207399] = {
  spellID = 207399,
  name = "Ancestral Protection Totem",
  slug = "ancestral_protection_totem",
  max_range = 40,
  gcd = 1.0,
  cooldown = 300.0,
  duration = 30.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[207400] = {
  spellID = 207400,
  name = "Ancestral Vigor",
  slug = "ancestral_vigor",
  max_range = 100,
  duration = 10.0,
}

classData.spells[207401] = {
  spellID = 207401,
  name = "Ancestral Vigor",
  slug = "ancestral_vigor",
}

classData.spells[207495] = {
  spellID = 207495,
  name = "Ancestral Protection",
  slug = "ancestral_protection",
}

classData.spells[207498] = {
  spellID = 207498,
  name = "Ancestral Protection",
  slug = "ancestral_protection",
  max_range = 40,
  duration = 30.0,
}

classData.spells[207778] = {
  spellID = 207778,
  name = "Downpour",
  slug = "downpour",
  max_range = 40,
  gcd = 1.5,
  cooldown = 5.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[207835] = {
  spellID = 207835,
  name = "Stormlash",
  slug = "stormlash",
  max_range = 100,
  charges = 3,
  charge_cooldown = 12.0,
  gcd = 1.5,
  duration = 12.0,
}

classData.spells[207994] = {
  spellID = 207994,
  name = "Eye of the Twisting Nether",
  slug = "eye_of_the_twisting_nether",
}

classData.spells[207995] = {
  spellID = 207995,
  name = "Fire of the Twisting Nether",
  slug = "fire_of_the_twisting_nether",
  duration = 8.0,
}

classData.spells[207998] = {
  spellID = 207998,
  name = "Chill of the Twisting Nether",
  slug = "chill_of_the_twisting_nether",
  duration = 8.0,
}

classData.spells[207999] = {
  spellID = 207999,
  name = "Shock of the Twisting Nether",
  slug = "shock_of_the_twisting_nether",
  duration = 8.0,
}

classData.spells[208899] = {
  spellID = 208899,
  name = "Queen's Decree",
  slug = "queens_decree",
  max_range = 100,
  gcd = 1.5,
  duration = 6.0,
}

classData.spells[209069] = {
  spellID = 209069,
  name = "Tidal Totem",
  slug = "tidal_totem",
  max_range = 100,
}

classData.spells[210643] = {
  spellID = 210643,
  name = "Totem Mastery",
  slug = "totem_mastery",
  max_range = 40,
  gcd = 1.0,
}

classData.spells[210651] = {
  spellID = 210651,
  name = "Storm Totem",
  slug = "storm_totem",
  max_range = 40,
  gcd = 1.0,
  cooldown = 30.0,
  duration = 120.0,
}

classData.spells[210652] = {
  spellID = 210652,
  name = "Storm Totem",
  slug = "storm_totem",
  max_range = 30,
}

classData.spells[210657] = {
  spellID = 210657,
  name = "Ember Totem",
  slug = "ember_totem",
  max_range = 40,
  gcd = 1.0,
  cooldown = 30.0,
  duration = 120.0,
}

classData.spells[210658] = {
  spellID = 210658,
  name = "Ember Totem",
  slug = "ember_totem",
  max_range = 30,
}

classData.spells[210659] = {
  spellID = 210659,
  name = "Tailwind Totem",
  slug = "tailwind_totem",
  max_range = 30,
}

classData.spells[210660] = {
  spellID = 210660,
  name = "Tailwind Totem",
  slug = "tailwind_totem",
  max_range = 40,
  gcd = 1.0,
  cooldown = 30.0,
  duration = 120.0,
}

classData.spells[210689] = {
  spellID = 210689,
  name = "Lightning Rod",
  slug = "lightning_rod",
  gcd = 1.5,
}

classData.spells[210714] = {
  spellID = 210714,
  name = "Icefury",
  slug = "icefury",
  max_range = 40,
  initial_stacks = 4,
  gcd = 1.5,
  cooldown = 30.0,
  duration = 15.0,
}

classData.spells[210727] = {
  spellID = 210727,
  name = "Overcharge",
  slug = "overcharge",
}

classData.spells[210797] = {
  spellID = 210797,
  name = "Crashing Storm",
  slug = "crashing_storm",
  max_range = 100,
  duration = 6.0,
}

classData.spells[210801] = {
  spellID = 210801,
  name = "Crashing Storm",
  slug = "crashing_storm",
  max_range = 100,
}

classData.spells[210853] = {
  spellID = 210853,
  name = "Hailstorm",
  slug = "hailstorm",
}

classData.spells[210854] = {
  spellID = 210854,
  name = "Hailstorm",
  slug = "hailstorm",
  max_range = 30,
}

classData.spells[210873] = {
  spellID = 210873,
  name = "Hex",
  slug = "hex",
  max_range = 30,
  gcd = 1.5,
  cooldown = 30.0,
  duration = 60.0,
}

classData.spells[211004] = {
  spellID = 211004,
  name = "Hex",
  slug = "hex",
  max_range = 30,
  gcd = 1.5,
  cooldown = 30.0,
  duration = 60.0,
}

classData.spells[211010] = {
  spellID = 211010,
  name = "Hex",
  slug = "hex",
  max_range = 30,
  gcd = 1.5,
  cooldown = 30.0,
  duration = 60.0,
}

classData.spells[211015] = {
  spellID = 211015,
  name = "Hex",
  slug = "hex",
  max_range = 30,
  gcd = 1.5,
  cooldown = 30.0,
  duration = 60.0,
}

classData.spells[212048] = {
  spellID = 212048,
  name = "Ancestral Vision",
  slug = "ancestral_vision",
  max_range = 100,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[213307] = {
  spellID = 213307,
  name = "Stormlash",
  slug = "stormlash",
  max_range = 100,
}

classData.spells[213498] = {
  spellID = 213498,
  name = "Overcharge",
  slug = "overcharge",
  haste_affected_ticks = true,
}

classData.spells[214131] = {
  spellID = 214131,
  name = "The Deceiver's Blood Pact",
  slug = "the_deceivers_blood_pact",
}

classData.spells[214134] = {
  spellID = 214134,
  name = "The Deceiver's Blood Pact",
  slug = "the_deceivers_blood_pact",
}

classData.spells[214452] = {
  spellID = 214452,
  name = "Storm Tempests",
  slug = "storm_tempests",
  max_range = 50000,
}

classData.spells[214816] = {
  spellID = 214816,
  name = "Lightning Bolt Overload",
  slug = "lightning_bolt_overload",
  max_range = 30,
}

classData.spells[215785] = {
  spellID = 215785,
  name = "Hot Hand",
  slug = "hot_hand",
  initial_stacks = 1,
  duration = 15.0,
}

classData.spells[215802] = {
  spellID = 215802,
  name = "Feral Lunge",
  slug = "feral_lunge",
  max_range = 100,
}

classData.spells[216340] = {
  spellID = 216340,
  name = "Nature's Reprisal",
  slug = "natures_reprisal",
  max_stacks = 1,
}

classData.spells[218558] = {
  spellID = 218558,
  name = "Chain Lightning Overload",
  slug = "chain_lightning_overload",
  max_range = 50000,
}

classData.spells[218559] = {
  spellID = 218559,
  name = "Lava Beam Overload",
  slug = "lava_beam_overload",
  max_range = 50000,
}

classData.spells[219271] = {
  spellID = 219271,
  name = "Icefury Overload",
  slug = "icefury_overload",
  max_range = 40,
}

classData.spells[224125] = {
  spellID = 224125,
  name = "Molten Weapon",
  slug = "molten_weapon",
  max_range = 5,
  duration = 15.0,
}

classData.spells[224126] = {
  spellID = 224126,
  name = "Icy Edge",
  slug = "icy_edge",
  max_range = 5,
  duration = 15.0,
}

classData.spells[224127] = {
  spellID = 224127,
  name = "Crackling Surge",
  slug = "crackling_surge",
  max_range = 5,
  duration = 15.0,
}

classData.spells[224852] = {
  spellID = 224852,
  name = "Pristine Proto-Scale Girdle",
  slug = "pristine_protoscale_girdle",
  max_range = 100,
  max_stacks = 5,
  duration = 6.0,
  haste_affected_ticks = true,
}

classData.spells[226772] = {
  spellID = 226772,
  name = "Totem Mastery",
  slug = "totem_mastery",
  max_range = 50000,
  duration = 120.0,
}

classData.spells[228562] = {
  spellID = 228562,
  name = "Feral Spirit",
  slug = "feral_spirit",
  max_range = 30,
  duration = 15.0,
}

classData.spells[231721] = {
  spellID = 231721,
  name = "Lava Burst",
  slug = "lava_burst",
}

classData.spells[231722] = {
  spellID = 231722,
  name = "Chain Lightning",
  slug = "chain_lightning",
}

classData.spells[231723] = {
  spellID = 231723,
  name = "Feral Spirit",
  slug = "feral_spirit",
}

classData.spells[231725] = {
  spellID = 231725,
  name = "Riptide",
  slug = "riptide",
}

classData.spells[231780] = {
  spellID = 231780,
  name = "Chain Heal",
  slug = "chain_heal",
}

classData.spells[231785] = {
  spellID = 231785,
  name = "Tidal Waves",
  slug = "tidal_waves",
}

classData.spells[243073] = {
  spellID = 243073,
  name = "Seismic Lightning",
  slug = "seismic_lightning",
  max_range = 40,
}

classData.spells[246035] = {
  spellID = 246035,
  name = "Boulderfist",
  slug = "boulderfist",
}

classData.spells[251463] = {
  spellID = 251463,
  name = "Vindicaar Matrix Crystal",
  slug = "vindicaar_matrix_crystal",
  gcd = 1.5,
}

classData.spells[251758] = {
  spellID = 251758,
  name = "Item - Shaman T21 Elemental 4P Bonus",
  slug = "item__shaman_t21_elemental_4p_bonus",
}

classData.spells[252143] = {
  spellID = 252143,
  name = "Earth Shock Overload",
  slug = "earth_shock_overload",
  max_range = 100,
}

classData.spells[252154] = {
  spellID = 252154,
  name = "Rainfall",
  slug = "rainfall",
  max_range = 100,
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

classData.spells[260694] = {
  spellID = 260694,
  name = "Exposed Elements",
  slug = "exposed_elements",
}

classData.spells[260734] = {
  spellID = 260734,
  name = "Master of the Elements",
  slug = "master_of_the_elements",
  duration = 15.0,
}

classData.spells[260878] = {
  spellID = 260878,
  name = "Spirit Wolf",
  slug = "spirit_wolf",
}

classData.spells[260881] = {
  spellID = 260881,
  name = "Spirit Wolf",
  slug = "spirit_wolf",
  max_stacks = 4,
  duration = 10.0,
}

classData.spells[260882] = {
  spellID = 260882,
  name = "Spirit Wolf",
  slug = "spirit_wolf",
}

classData.spells[260890] = {
  spellID = 260890,
  name = "High Voltage",
  slug = "high_voltage",
}

classData.spells[260895] = {
  spellID = 260895,
  name = "Unlimited Power",
  slug = "unlimited_power",
}

classData.spells[262395] = {
  spellID = 262395,
  name = "Totem Mastery",
  slug = "totem_mastery",
  max_range = 40,
  gcd = 1.0,
}

classData.spells[262396] = {
  spellID = 262396,
  name = "Storm Totem",
  slug = "storm_totem",
  max_range = 40,
  gcd = 1.0,
  cooldown = 30.0,
  duration = 120.0,
}

classData.spells[262397] = {
  spellID = 262397,
  name = "Storm Totem",
  slug = "storm_totem",
  max_range = 30,
}

classData.spells[262398] = {
  spellID = 262398,
  name = "Ember Totem",
  slug = "ember_totem",
  max_range = 40,
  gcd = 1.0,
  cooldown = 30.0,
  duration = 120.0,
}

classData.spells[262399] = {
  spellID = 262399,
  name = "Ember Totem",
  slug = "ember_totem",
  max_range = 30,
}

classData.spells[262400] = {
  spellID = 262400,
  name = "Tailwind Totem",
  slug = "tailwind_totem",
  max_range = 30,
}

classData.spells[262401] = {
  spellID = 262401,
  name = "Tailwind Totem",
  slug = "tailwind_totem",
  max_range = 40,
  gcd = 1.0,
  cooldown = 30.0,
  duration = 120.0,
}

classData.spells[262417] = {
  spellID = 262417,
  name = "Resonance Totem",
  slug = "resonance_totem",
  max_range = 30,
}

classData.spells[262419] = {
  spellID = 262419,
  name = "Resonance Totem",
  slug = "resonance_totem",
  max_range = 40,
  gcd = 1.0,
  cooldown = 30.0,
  duration = 120.0,
}

classData.spells[262624] = {
  spellID = 262624,
  name = "Elemental Spirits",
  slug = "elemental_spirits",
  max_range = 100,
}

classData.spells[262647] = {
  spellID = 262647,
  name = "Forceful Winds",
  slug = "forceful_winds",
  max_range = 100,
  gcd = 1.5,
}

classData.spells[262652] = {
  spellID = 262652,
  name = "Forceful Winds",
  slug = "forceful_winds",
  max_range = 100,
  max_stacks = 5,
  duration = 15.0,
}

classData.spells[263806] = {
  spellID = 263806,
  name = "Wind Gust",
  slug = "wind_gust",
  max_range = 100,
  max_stacks = 20,
  duration = 30.0,
}

classData.spells[263819] = {
  spellID = 263819,
  name = "Fire Elemental",
  slug = "fire_elemental",
  max_range = 30,
  gcd = 1.0,
}

classData.spells[265046] = {
  spellID = 265046,
  name = "Static Charge",
  slug = "static_charge",
  gcd = 1.0,
  cooldown = 60.0,
}

classData.spells[268429] = {
  spellID = 268429,
  name = "Searing Assault",
  slug = "searing_assault",
  max_range = 100,
  duration = 6.0,
}

classData.spells[269352] = {
  spellID = 269352,
  name = "Hex",
  slug = "hex",
  max_range = 30,
  gcd = 1.5,
  cooldown = 30.0,
  duration = 60.0,
}

classData.spells[269808] = {
  spellID = 269808,
  name = "Exposed Elements",
  slug = "exposed_elements",
  max_range = 100,
  duration = 15.0,
}

classData.spells[271920] = {
  spellID = 271920,
  name = "Icy Edge",
  slug = "icy_edge",
  max_range = 5,
  duration = 3.0,
}

classData.spells[272737] = {
  spellID = 272737,
  name = "Unlimited Power",
  slug = "unlimited_power",
  max_stacks = 99,
  duration = 10.0,
}

classData.spells[273221] = {
  spellID = 273221,
  name = "Aftershock",
  slug = "aftershock",
}

classData.spells[273323] = {
  spellID = 273323,
  name = "Lightning Shield Overcharge",
  slug = "lightning_shield_overcharge",
  max_range = 10,
  duration = 10.0,
}

classData.spells[273324] = {
  spellID = 273324,
  name = "Lightning Shield",
  slug = "lightning_shield",
  max_range = 100,
}
