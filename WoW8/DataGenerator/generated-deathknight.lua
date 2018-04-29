----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BfA only.
----------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(4, GetBuildInfo()) < 80000 then
    return
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Class check
----------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(3, UnitClass('player')) ~= 6 then return end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
local addonName, TJ = ...
TJ.ClassData = TJ.ClassData or {}
TJ.ClassData[6] = TJ.ClassData[6] or {}
local classData = TJ.ClassData[6]
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

classData.spells[3714] = {
  spellID = 3714,
  name = "Path of Frost",
  slug = "path_of_frost",
  gcd = 1.5,
  duration = 600.0,
  power = {
    [1] = { resource = "rune", amount = 1, },
  },
}

classData.spells[16827] = {
  spellID = 16827,
  name = "Claw",
  slug = "claw",
  max_range = 5,
  gcd = 1.0,
  cooldown = 3.0,
  power = {
    [1] = { resource = "focus", amount = 25, },
  },
}

classData.spells[17253] = {
  spellID = 17253,
  name = "Bite",
  slug = "bite",
  max_range = 5,
  gcd = 1.0,
  cooldown = 3.0,
  power = {
    [1] = { resource = "focus", amount = 25, },
  },
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

classData.spells[24423] = {
  spellID = 24423,
  name = "Bloody Screech",
  slug = "bloody_screech",
  max_range = 5,
  cooldown = 6.0,
}

classData.spells[24450] = {
  spellID = 24450,
  name = "Prowl",
  slug = "prowl",
  initial_stacks = 1,
  cooldown = 10.0,
}

classData.spells[26064] = {
  spellID = 26064,
  name = "Shell Shield",
  slug = "shell_shield",
  cooldown = 60.0,
  duration = 12.0,
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

classData.spells[35346] = {
  spellID = 35346,
  name = "Warp Time",
  slug = "warp_time",
  max_range = 5,
  cooldown = 10.0,
  duration = 6.0,
}

classData.spells[42650] = {
  spellID = 42650,
  name = "Army of the Dead",
  slug = "army_of_the_dead",
  gcd = 1.5,
  cooldown = 600.0,
  duration = 4.0,
  power = {
    [1] = { resource = "rune", amount = 3, },
    [2] = { resource = "runic_power", amount = -30, },
  },
}

classData.spells[42651] = {
  spellID = 42651,
  name = "Army of the Dead",
  slug = "army_of_the_dead",
  duration = 40.0,
}

classData.spells[43265] = {
  spellID = 43265,
  name = "Death and Decay",
  slug = "death_and_decay",
  max_range = 30,
  gcd = 1.5,
  cooldown = 30.0,
  duration = 10.0,
  power = {
    [1] = { resource = "rune", amount = 1, },
    [2] = { resource = "runic_power", amount = -10, },
  },
}

classData.spells[45470] = {
  spellID = 45470,
  name = "Death Strike",
  slug = "death_strike",
}

classData.spells[45524] = {
  spellID = 45524,
  name = "Chains of Ice",
  slug = "chains_of_ice",
  max_range = 30,
  gcd = 1.5,
  duration = 8.0,
  power = {
    [1] = { resource = "rune", amount = 1, },
    [2] = { resource = "runic_power", amount = -10, },
  },
}

classData.spells[46584] = {
  spellID = 46584,
  name = "Raise Dead",
  slug = "raise_dead",
  max_range = 30,
  gcd = 1.5,
  cooldown = 60.0,
}

classData.spells[47468] = {
  spellID = 47468,
  name = "Claw",
  slug = "claw",
  max_range = 5,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 40, },
  },
}

classData.spells[47481] = {
  spellID = 47481,
  name = "Gnaw",
  slug = "gnaw",
  max_range = 5,
  cooldown = 90.0,
}

classData.spells[47482] = {
  spellID = 47482,
  name = "Leap",
  slug = "leap",
  min_range = 5,
  max_range = 30,
  cooldown = 30.0,
}

classData.spells[47484] = {
  spellID = 47484,
  name = "Huddle",
  slug = "huddle",
  gcd = 1.0,
  cooldown = 45.0,
  power = {
    [1] = { resource = "energy", amount = 10, },
  },
}

classData.spells[47528] = {
  spellID = 47528,
  name = "Mind Freeze",
  slug = "mind_freeze",
  max_range = 15,
  cooldown = 15.0,
  duration = 3.0,
  power = {
    [1] = { resource = "runic_power", amount = 0, },
  },
}

classData.spells[47541] = {
  spellID = 47541,
  name = "Death Coil",
  slug = "death_coil",
  max_range = 30,
  gcd = 1.5,
  power = {
    [1] = { resource = "runic_power", amount = 45, },
  },
}

classData.spells[47568] = {
  spellID = 47568,
  name = "Empower Rune Weapon",
  slug = "empower_rune_weapon",
  charges = 1,
  charge_cooldown = 180.0,
  gcd = 1.5,
  power = {
    [1] = { resource = "runic_power", amount = -25, },
  },
}

classData.spells[47632] = {
  spellID = 47632,
  name = "Death Coil",
  slug = "death_coil",
  max_range = 40,
}

classData.spells[48263] = {
  spellID = 48263,
  name = "Veteran of the Third War",
  slug = "veteran_of_the_third_war",
  gcd = 1.0,
}

classData.spells[48265] = {
  spellID = 48265,
  name = "Death's Advance",
  slug = "deaths_advance",
  cooldown = 30.0,
  duration = 10.0,
}

classData.spells[48707] = {
  spellID = 48707,
  name = "Anti-Magic Shell",
  slug = "antimagic_shell",
  cooldown = 60.0,
  duration = 5.0,
}

classData.spells[48792] = {
  spellID = 48792,
  name = "Icebound Fortitude",
  slug = "icebound_fortitude",
  cooldown = 180.0,
  duration = 8.0,
}

classData.spells[49020] = {
  spellID = 49020,
  name = "Obliterate",
  slug = "obliterate",
  max_range = 5,
  gcd = 1.5,
  power = {
    [1] = { resource = "rune", amount = 2, },
    [2] = { resource = "runic_power", amount = -20, },
  },
}

classData.spells[49028] = {
  spellID = 49028,
  name = "Dancing Rune Weapon",
  slug = "dancing_rune_weapon",
  max_range = 30,
  gcd = 1.5,
  cooldown = 120.0,
  duration = 8.0,
}

classData.spells[49143] = {
  spellID = 49143,
  name = "Frost Strike",
  slug = "frost_strike",
  max_range = 5,
  gcd = 1.5,
  power = {
    [1] = { resource = "runic_power", amount = 25, },
  },
}

classData.spells[49184] = {
  spellID = 49184,
  name = "Howling Blast",
  slug = "howling_blast",
  max_range = 30,
  gcd = 1.5,
  power = {
    [1] = { resource = "rune", amount = 1, },
    [2] = { resource = "runic_power", amount = -10, },
  },
}

classData.spells[49206] = {
  spellID = 49206,
  name = "Summon Gargoyle",
  slug = "summon_gargoyle",
  max_range = 30,
  gcd = 1.5,
  cooldown = 180.0,
  duration = 45.0,
}

classData.spells[49530] = {
  spellID = 49530,
  name = "Sudden Doom",
  slug = "sudden_doom",
}

classData.spells[49576] = {
  spellID = 49576,
  name = "Death Grip",
  slug = "death_grip",
  max_range = 30,
  charges = 1,
  charge_cooldown = 25.0,
  gcd = 0.5,
}

classData.spells[49966] = {
  spellID = 49966,
  name = "Smack",
  slug = "smack",
  max_range = 5,
  gcd = 1.0,
  cooldown = 3.0,
  power = {
    [1] = { resource = "focus", amount = 25, },
  },
}

classData.spells[49998] = {
  spellID = 49998,
  name = "Death Strike",
  slug = "death_strike",
  max_range = 5,
  gcd = 1.5,
  power = {
    [1] = { resource = "runic_power", amount = 45, },
  },
}

classData.spells[50245] = {
  spellID = 50245,
  name = "Pin",
  slug = "pin",
  max_range = 5,
  cooldown = 10.0,
  duration = 6.0,
  channeled = true,
}

classData.spells[50285] = {
  spellID = 50285,
  name = "Dust Cloud",
  slug = "dust_cloud",
  max_range = 5,
  cooldown = 25.0,
  duration = 6.0,
}

classData.spells[50401] = {
  spellID = 50401,
  name = "Razorice",
  slug = "razorice",
  max_range = 10,
}

classData.spells[50433] = {
  spellID = 50433,
  name = "Ankle Crack",
  slug = "ankle_crack",
  max_range = 5,
  cooldown = 10.0,
  duration = 6.0,
}

classData.spells[50613] = {
  spellID = 50613,
  name = "Arcane Torrent",
  slug = "arcane_torrent",
  gcd = 1.5,
  cooldown = 90.0,
}

classData.spells[50842] = {
  spellID = 50842,
  name = "Blood Boil",
  slug = "blood_boil",
  charges = 2,
  charge_cooldown = 7.5,
  gcd = 1.5,
}

classData.spells[50977] = {
  spellID = 50977,
  name = "Death Gate",
  slug = "death_gate",
  gcd = 1.5,
  cooldown = 60.0,
  duration = 60.0,
  power = {
    [1] = { resource = "rune", amount = 1, },
    [2] = { resource = "runic_power", amount = -10, },
  },
}

classData.spells[51124] = {
  spellID = 51124,
  name = "Killing Machine",
  slug = "killing_machine",
  max_stacks = 1,
  duration = 10.0,
}

classData.spells[51128] = {
  spellID = 51128,
  name = "Killing Machine",
  slug = "killing_machine",
}

classData.spells[51271] = {
  spellID = 51271,
  name = "Pillar of Frost",
  slug = "pillar_of_frost",
  gcd = 1.5,
  cooldown = 60.0,
  duration = 20.0,
}

classData.spells[51399] = {
  spellID = 51399,
  name = "Death Grip",
  slug = "death_grip",
  max_range = 30,
  duration = 3.0,
}

classData.spells[51460] = {
  spellID = 51460,
  name = "Runic Corruption",
  slug = "runic_corruption",
  duration = 3.0,
}

classData.spells[51462] = {
  spellID = 51462,
  name = "Runic Corruption",
  slug = "runic_corruption",
}

classData.spells[51714] = {
  spellID = 51714,
  name = "Razorice",
  slug = "razorice",
  max_range = 50000,
  max_stacks = 5,
  duration = 20.0,
}

classData.spells[51963] = {
  spellID = 51963,
  name = "Gargoyle Strike",
  slug = "gargoyle_strike",
  max_range = 40,
}

classData.spells[51986] = {
  spellID = 51986,
  name = "On a Pale Horse",
  slug = "on_a_pale_horse",
}

classData.spells[52212] = {
  spellID = 52212,
  name = "Death and Decay",
  slug = "death_and_decay",
  max_range = 100,
}

classData.spells[53148] = {
  spellID = 53148,
  name = "Charge",
  slug = "charge",
  min_range = 8,
  max_range = 25,
  duration = 1.0,
}

classData.spells[53184] = {
  spellID = 53184,
  name = "Spiked Collar",
  slug = "spiked_collar",
  max_range = 5,
}

classData.spells[53343] = {
  spellID = 53343,
  name = "Rune of Razorice",
  slug = "rune_of_razorice",
}

classData.spells[53344] = {
  spellID = 53344,
  name = "Rune of the Fallen Crusader",
  slug = "rune_of_the_fallen_crusader",
}

classData.spells[53365] = {
  spellID = 53365,
  name = "Unholy Strength",
  slug = "unholy_strength",
  max_range = 40,
  max_stacks = 1,
  duration = 15.0,
}

classData.spells[53478] = {
  spellID = 53478,
  name = "Last Stand",
  slug = "last_stand",
  cooldown = 360.0,
  duration = 20.0,
}

classData.spells[53490] = {
  spellID = 53490,
  name = "Bullheaded",
  slug = "bullheaded",
  gcd = 1.5,
  cooldown = 180.0,
  duration = 0.1,
}

classData.spells[54644] = {
  spellID = 54644,
  name = "Frost Breath",
  slug = "frost_breath",
  max_range = 30,
  cooldown = 10.0,
  duration = 6.0,
}

classData.spells[54680] = {
  spellID = 54680,
  name = "Monstrous Bite",
  slug = "monstrous_bite",
  max_range = 5,
  cooldown = 8.0,
}

classData.spells[54689] = {
  spellID = 54689,
  name = "Froststorm Breath",
  slug = "froststorm_breath",
  max_range = 30,
}

classData.spells[55078] = {
  spellID = 55078,
  name = "Blood Plague",
  slug = "blood_plague",
  max_range = 50000,
  duration = 24.0,
}

classData.spells[55090] = {
  spellID = 55090,
  name = "Scourge Strike",
  slug = "scourge_strike",
  max_range = 5,
  gcd = 1.5,
  power = {
    [1] = { resource = "rune", amount = 1, },
    [2] = { resource = "runic_power", amount = -10, },
  },
}

classData.spells[55095] = {
  spellID = 55095,
  name = "Frost Fever",
  slug = "frost_fever",
  max_range = 50000,
  duration = 24.0,
}

classData.spells[55233] = {
  spellID = 55233,
  name = "Vampiric Blood",
  slug = "vampiric_blood",
  cooldown = 90.0,
  duration = 10.0,
}

classData.spells[56222] = {
  spellID = 56222,
  name = "Dark Command",
  slug = "dark_command",
  max_range = 30,
  cooldown = 8.0,
  duration = 3.0,
}

classData.spells[57330] = {
  spellID = 57330,
  name = "Horn of Winter",
  slug = "horn_of_winter",
  gcd = 1.5,
  cooldown = 45.0,
}

classData.spells[57627] = {
  spellID = 57627,
  name = "Charge",
  slug = "charge",
  max_range = 5,
  initial_stacks = 1,
  duration = 6.0,
}

classData.spells[58640] = {
  spellID = 58640,
  name = "Glyph of the Geist",
  slug = "glyph_of_the_geist",
}

classData.spells[58642] = {
  spellID = 58642,
  name = "Glyph of Foul Menagerie",
  slug = "glyph_of_foul_menagerie",
}

classData.spells[58707] = {
  spellID = 58707,
  name = "Geist",
  slug = "geist",
  cooldown = 1.5,
}

classData.spells[58723] = {
  spellID = 58723,
  name = "Foul Menagerie",
  slug = "foul_menagerie",
  cooldown = 1.5,
}

classData.spells[59052] = {
  spellID = 59052,
  name = "Rime",
  slug = "rime",
  initial_stacks = 1,
  max_stacks = 1,
  duration = 15.0,
}

classData.spells[59057] = {
  spellID = 59057,
  name = "Rime",
  slug = "rime",
}

classData.spells[59545] = {
  spellID = 59545,
  name = "Gift of the Naaru",
  slug = "gift_of_the_naaru",
  max_range = 40,
  cooldown = 180.0,
  duration = 5.0,
  haste_affected_ticks = true,
}

classData.spells[61684] = {
  spellID = 61684,
  name = "Dash",
  slug = "dash",
  cooldown = 20.0,
  duration = 10.0,
}

classData.spells[61685] = {
  spellID = 61685,
  name = "Charge",
  slug = "charge",
  min_range = 8,
  max_range = 25,
  initial_stacks = 1,
  gcd = 1.5,
  cooldown = 25.0,
  duration = 4.0,
}

classData.spells[61777] = {
  spellID = 61777,
  name = "Summon Gargoyle",
  slug = "summon_gargoyle",
  duration = 40.0,
  power = {
    [1] = { resource = "runic_power", amount = 0, },
  },
}

classData.spells[61999] = {
  spellID = 61999,
  name = "Raise Ally",
  slug = "raise_ally",
  max_range = 40,
  gcd = 1.5,
  cooldown = 600.0,
  power = {
    [1] = { resource = "runic_power", amount = 30, },
  },
}

classData.spells[62137] = {
  spellID = 62137,
  name = "Avoidance",
  slug = "avoidance",
}

classData.spells[62157] = {
  spellID = 62157,
  name = "Stoneskin Gargoyle",
  slug = "stoneskin_gargoyle",
}

classData.spells[62158] = {
  spellID = 62158,
  name = "Rune of the Stoneskin Gargoyle",
  slug = "rune_of_the_stoneskin_gargoyle",
}

classData.spells[62762] = {
  spellID = 62762,
  name = "Basic Attack Focus Cost Modifier",
  slug = "basic_attack_focus_cost_modifier",
}

classData.spells[63560] = {
  spellID = 63560,
  name = "Dark Transformation",
  slug = "dark_transformation",
  max_range = 100,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 20.0,
}

classData.spells[63896] = {
  spellID = 63896,
  name = "Bullheaded",
  slug = "bullheaded",
  duration = 12.0,
}

classData.spells[63900] = {
  spellID = 63900,
  name = "Thunderstomp",
  slug = "thunderstomp",
  max_range = 5,
  gcd = 1.5,
  cooldown = 10.0,
  power = {
    [1] = { resource = "focus", amount = 20, },
  },
}

classData.spells[66188] = {
  spellID = 66188,
  name = "Death Strike Off-Hand",
  slug = "death_strike_offhand",
  max_range = 100,
}

classData.spells[66196] = {
  spellID = 66196,
  name = "Frost Strike Off-Hand",
  slug = "frost_strike_offhand",
  max_range = 100,
}

classData.spells[66198] = {
  spellID = 66198,
  name = "Obliterate Off-Hand",
  slug = "obliterate_offhand",
  max_range = 100,
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

classData.spells[70890] = {
  spellID = 70890,
  name = "Scourge Strike",
  slug = "scourge_strike",
  max_range = 100,
}

classData.spells[77513] = {
  spellID = 77513,
  name = "Mastery: Blood Shield",
  slug = "mastery_blood_shield",
}

classData.spells[77514] = {
  spellID = 77514,
  name = "Mastery: Frozen Heart",
  slug = "mastery_frozen_heart",
}

classData.spells[77515] = {
  spellID = 77515,
  name = "Mastery: Dreadblade",
  slug = "mastery_dreadblade",
}

classData.spells[77535] = {
  spellID = 77535,
  name = "Blood Shield",
  slug = "blood_shield",
  duration = 10.0,
}

classData.spells[77575] = {
  spellID = 77575,
  name = "Outbreak",
  slug = "outbreak",
  max_range = 30,
  gcd = 1.5,
  power = {
    [1] = { resource = "rune", amount = 1, },
    [2] = { resource = "runic_power", amount = -10, },
  },
}

classData.spells[81136] = {
  spellID = 81136,
  name = "Crimson Scourge",
  slug = "crimson_scourge",
}

classData.spells[81141] = {
  spellID = 81141,
  name = "Crimson Scourge",
  slug = "crimson_scourge",
  duration = 15.0,
}

classData.spells[81229] = {
  spellID = 81229,
  name = "Runic Empowerment",
  slug = "runic_empowerment",
}

classData.spells[81256] = {
  spellID = 81256,
  name = "Dancing Rune Weapon",
  slug = "dancing_rune_weapon",
  duration = 8.0,
}

classData.spells[81280] = {
  spellID = 81280,
  name = "Blood Burst",
  slug = "blood_burst",
}

classData.spells[81340] = {
  spellID = 81340,
  name = "Sudden Doom",
  slug = "sudden_doom",
  initial_stacks = 1,
  max_stacks = 1,
  duration = 10.0,
}

classData.spells[82246] = {
  spellID = 82246,
  name = "Parry",
  slug = "parry",
}

classData.spells[85948] = {
  spellID = 85948,
  name = "Festering Strike",
  slug = "festering_strike",
  max_range = 5,
  gcd = 1.5,
  power = {
    [1] = { resource = "rune", amount = 2, },
    [2] = { resource = "runic_power", amount = -20, },
  },
}

classData.spells[86113] = {
  spellID = 86113,
  name = "Plate Specialization",
  slug = "plate_specialization",
}

classData.spells[86536] = {
  spellID = 86536,
  name = "Plate Specialization",
  slug = "plate_specialization",
}

classData.spells[86537] = {
  spellID = 86537,
  name = "Plate Specialization",
  slug = "plate_specialization",
}

classData.spells[90328] = {
  spellID = 90328,
  name = "Spirit Walk",
  slug = "spirit_walk",
  initial_stacks = 1,
  cooldown = 10.0,
}

classData.spells[90347] = {
  spellID = 90347,
  name = "Play",
  slug = "play",
  gcd = 1.5,
  duration = 15.0,
}

classData.spells[90361] = {
  spellID = 90361,
  name = "Spirit Mend",
  slug = "spirit_mend",
  max_range = 25,
  cooldown = 30.0,
  duration = 10.0,
  power = {
    [1] = { resource = "focus", amount = 5, },
  },
}

classData.spells[91776] = {
  spellID = 91776,
  name = "Claw",
  slug = "claw",
  max_range = 5,
  power = {
    [1] = { resource = "energy", amount = 40, },
  },
}

classData.spells[91778] = {
  spellID = 91778,
  name = "Sweeping Claws",
  slug = "sweeping_claws",
  max_range = 5,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 40, },
  },
}

classData.spells[91797] = {
  spellID = 91797,
  name = "Monstrous Blow",
  slug = "monstrous_blow",
  max_range = 5,
  cooldown = 90.0,
  duration = 2.0,
}

classData.spells[91800] = {
  spellID = 91800,
  name = "Gnaw",
  slug = "gnaw",
  max_range = 5,
  cooldown = 90.0,
  duration = 1.0,
}

classData.spells[91802] = {
  spellID = 91802,
  name = "Shambling Rush",
  slug = "shambling_rush",
  min_range = 5,
  max_range = 30,
  cooldown = 30.0,
}

classData.spells[91807] = {
  spellID = 91807,
  name = "Shambling Rush",
  slug = "shambling_rush",
  min_range = 5,
  max_range = 30,
  duration = 2.0,
}

classData.spells[91809] = {
  spellID = 91809,
  name = "Leap",
  slug = "leap",
  min_range = 5,
  max_range = 30,
  cooldown = 30.0,
}

classData.spells[91837] = {
  spellID = 91837,
  name = "Putrid Bulwark",
  slug = "putrid_bulwark",
  gcd = 1.0,
  cooldown = 45.0,
  duration = 10.0,
  power = {
    [1] = { resource = "energy", amount = 10, },
  },
}

classData.spells[91838] = {
  spellID = 91838,
  name = "Huddle",
  slug = "huddle",
  gcd = 1.0,
  cooldown = 45.0,
  duration = 10.0,
  channeled = true,
  power = {
    [1] = { resource = "energy", amount = 10, },
  },
}

classData.spells[92380] = {
  spellID = 92380,
  name = "Froststorm Breath",
  slug = "froststorm_breath",
  duration = 8.0,
  channeled = true,
  power = {
    [1] = { resource = "focus", amount = 10, per_tick = 5, },
  },
}

classData.spells[93433] = {
  spellID = 93433,
  name = "Burrow Attack",
  slug = "burrow_attack",
  cooldown = 14.0,
  duration = 8.0,
  channeled = true,
  power = {
    [1] = { resource = "focus", amount = 10, per_tick = 5, },
  },
}

classData.spells[94019] = {
  spellID = 94019,
  name = "Rest",
  slug = "rest",
  gcd = 1.5,
  duration = 12.0,
}

classData.spells[94022] = {
  spellID = 94022,
  name = "Trick",
  slug = "trick",
  gcd = 1.5,
}

classData.spells[94293] = {
  spellID = 94293,
  name = "Altered Form",
  slug = "altered_form",
}

classData.spells[95714] = {
  spellID = 95714,
  name = "Burrow Attack",
  slug = "burrow_attack",
}

classData.spells[95725] = {
  spellID = 95725,
  name = "Froststorm Breath",
  slug = "froststorm_breath",
}

classData.spells[97821] = {
  spellID = 97821,
  name = "Void-Touched",
  slug = "voidtouched",
  max_range = 100,
  duration = 300.0,
}

classData.spells[101568] = {
  spellID = 101568,
  name = "Dark Succor",
  slug = "dark_succor",
  duration = 20.0,
}

classData.spells[108194] = {
  spellID = 108194,
  name = "Asphyxiate",
  slug = "asphyxiate",
  max_range = 20,
  gcd = 1.5,
  cooldown = 45.0,
  duration = 5.0,
}

classData.spells[108199] = {
  spellID = 108199,
  name = "Gorefiend's Grasp",
  slug = "gorefiends_grasp",
  max_range = 30,
  gcd = 1.5,
  cooldown = 120.0,
  duration = 10.0,
}

classData.spells[111673] = {
  spellID = 111673,
  name = "Control Undead",
  slug = "control_undead",
  max_range = 30,
  gcd = 1.5,
  duration = 300.0,
  power = {
    [1] = { resource = "rune", amount = 1, },
    [2] = { resource = "runic_power", amount = -10, },
  },
}

classData.spells[114556] = {
  spellID = 114556,
  name = "Purgatory",
  slug = "purgatory",
}

classData.spells[115804] = {
  spellID = 115804,
  name = "Mortal Wounds",
  slug = "mortal_wounds",
  max_range = 100,
  duration = 10.0,
}

classData.spells[116783] = {
  spellID = 116783,
  name = "Death Siphon",
  slug = "death_siphon",
  max_range = 100,
}

classData.spells[116888] = {
  spellID = 116888,
  name = "Shroud of Purgatory",
  slug = "shroud_of_purgatory",
  duration = 3.0,
}

classData.spells[123981] = {
  spellID = 123981,
  name = "Perdition",
  slug = "perdition",
  max_range = 50000,
  duration = 240.0,
}

classData.spells[124285] = {
  spellID = 124285,
  name = "Death's Advance",
  slug = "deaths_advance",
}

classData.spells[127344] = {
  spellID = 127344,
  name = "Corpse Explosion",
  slug = "corpse_explosion",
  max_range = 30,
  gcd = 1.0,
  cooldown = 15.0,
}

classData.spells[130392] = {
  spellID = 130392,
  name = "Blink Strikes",
  slug = "blink_strikes",
  max_range = 100,
}

classData.spells[130736] = {
  spellID = 130736,
  name = "Soul Reaper",
  slug = "soul_reaper",
  max_range = 5,
  gcd = 1.5,
  cooldown = 45.0,
  duration = 5.0,
  power = {
    [1] = { resource = "rune", amount = 1, },
    [2] = { resource = "runic_power", amount = -10, },
  },
}

classData.spells[137005] = {
  spellID = 137005,
  name = "Death Knight",
  slug = "death_knight",
}

classData.spells[137006] = {
  spellID = 137006,
  name = "Frost Death Knight",
  slug = "frost_death_knight",
}

classData.spells[137007] = {
  spellID = 137007,
  name = "Unholy Death Knight",
  slug = "unholy_death_knight",
}

classData.spells[137008] = {
  spellID = 137008,
  name = "Blood Death Knight",
  slug = "blood_death_knight",
}

classData.spells[144907] = {
  spellID = 144907,
  name = "Item - Death Knight T16 DPS 4P Bonus",
  slug = "item__death_knight_t16_dps_4p_bonus",
}

classData.spells[144909] = {
  spellID = 144909,
  name = "Item - Death Knight T16 DPS 4P Bonus (Hidden)",
  slug = "item__death_knight_t16_dps_4p_bonus_hidden",
  duration = 20.0,
}

classData.spells[144934] = {
  spellID = 144934,
  name = "Item - Death Knight T16 Blood 2P Bonus",
  slug = "item__death_knight_t16_blood_2p_bonus",
}

classData.spells[144948] = {
  spellID = 144948,
  name = "Bone Wall",
  slug = "bone_wall",
  initial_stacks = 1,
  max_stacks = 6,
  duration = 120.0,
}

classData.spells[144950] = {
  spellID = 144950,
  name = "Item - Death Knight T16 Blood 4P Bonus",
  slug = "item__death_knight_t16_blood_4p_bonus",
}

classData.spells[144953] = {
  spellID = 144953,
  name = "Deathbringer",
  slug = "deathbringer",
  initial_stacks = 1,
  duration = 10.0,
}

classData.spells[146652] = {
  spellID = 146652,
  name = "Glyph of the Skeleton",
  slug = "glyph_of_the_skeleton",
}

classData.spells[147620] = {
  spellID = 147620,
  name = "Frozen Power",
  slug = "frozen_power",
}

classData.spells[147963] = {
  spellID = 147963,
  name = "Skeleton",
  slug = "skeleton",
  cooldown = 1.5,
}

classData.spells[152244] = {
  spellID = 152244,
  name = "Adaptation",
  slug = "adaptation",
}

classData.spells[152279] = {
  spellID = 152279,
  name = "Breath of Sindragosa",
  slug = "breath_of_sindragosa",
  cooldown = 120.0,
  power = {
    [1] = { resource = "runic_power", amount = 0, per_tick = 15, },
  },
}

classData.spells[152280] = {
  spellID = 152280,
  name = "Defile",
  slug = "defile",
  max_range = 30,
  gcd = 1.5,
  cooldown = 30.0,
  duration = 10.0,
  power = {
    [1] = { resource = "rune", amount = 1, },
    [2] = { resource = "runic_power", amount = -10, },
  },
}

classData.spells[154747] = {
  spellID = 154747,
  name = "Expansive Mind",
  slug = "expansive_mind",
}

classData.spells[155166] = {
  spellID = 155166,
  name = "Breath of Sindragosa",
  slug = "breath_of_sindragosa",
}

classData.spells[156000] = {
  spellID = 156000,
  name = "Defile",
  slug = "defile",
  max_range = 100,
}

classData.spells[156843] = {
  spellID = 156843,
  name = "Combat Experience",
  slug = "combat_experience",
}

classData.spells[160011] = {
  spellID = 160011,
  name = "Agile Reflexes",
  slug = "agile_reflexes",
  cooldown = 90.0,
  duration = 20.0,
}

classData.spells[160057] = {
  spellID = 160057,
  name = "Thick Hide",
  slug = "thick_hide",
  max_range = 100,
  internal_cooldown = 120.0,
}

classData.spells[160058] = {
  spellID = 160058,
  name = "Thick Hide",
  slug = "thick_hide",
  duration = 12.0,
}

classData.spells[160060] = {
  spellID = 160060,
  name = "Deadly Sting",
  slug = "deadly_sting",
  max_range = 5,
  cooldown = 6.0,
}

classData.spells[160065] = {
  spellID = 160065,
  name = "Tendon Rip",
  slug = "tendon_rip",
  max_range = 5,
  cooldown = 10.0,
  duration = 6.0,
}

classData.spells[160067] = {
  spellID = 160067,
  name = "Web Spray",
  slug = "web_spray",
  max_range = 5,
  cooldown = 10.0,
  duration = 6.0,
}

classData.spells[161797] = {
  spellID = 161797,
  name = "Riposte",
  slug = "riposte",
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

classData.spells[165568] = {
  spellID = 165568,
  name = "Item - Death Knight T17 Frost 4P Bonus",
  slug = "item__death_knight_t17_frost_4p_bonus",
}

classData.spells[165569] = {
  spellID = 165569,
  name = "Frozen Runeblade",
  slug = "frozen_runeblade",
  max_range = 100,
}

classData.spells[167655] = {
  spellID = 167655,
  name = "Item - Death Knight T17 Frost 4P Driver",
  slug = "item__death_knight_t17_frost_4p_driver",
  max_range = 100,
  duration = 20.0,
}

classData.spells[170202] = {
  spellID = 170202,
  name = "Frozen Runeblade",
  slug = "frozen_runeblade",
  max_range = 100,
  max_stacks = 50,
  duration = 20.0,
}

classData.spells[170205] = {
  spellID = 170205,
  name = "Item - Death Knight T17 Frost 4P Driver",
  slug = "item__death_knight_t17_frost_4p_driver",
  max_range = 100,
  duration = 20.0,
}

classData.spells[170575] = {
  spellID = 170575,
  name = "Frozen Runeblade Visual",
  slug = "frozen_runeblade_visual",
  max_range = 100,
  max_stacks = 50,
}

classData.spells[178808] = {
  spellID = 178808,
  name = "Frozen Runeblade",
  slug = "frozen_runeblade",
  max_range = 100,
}

classData.spells[178819] = {
  spellID = 178819,
  name = "Dark Succor",
  slug = "dark_succor",
}

classData.spells[184982] = {
  spellID = 184982,
  name = "Frozen Obliteration",
  slug = "frozen_obliteration",
  max_range = 100,
}

classData.spells[187865] = {
  spellID = 187865,
  name = "Item - Death Knight T18 Unholy 2P Bonus",
  slug = "item__death_knight_t18_unholy_2p_bonus",
}

classData.spells[187970] = {
  spellID = 187970,
  name = "Crazed Monstrosity",
  slug = "crazed_monstrosity",
}

classData.spells[187981] = {
  spellID = 187981,
  name = "Crazed Monstrosity",
  slug = "crazed_monstrosity",
  duration = 30.0,
}

classData.spells[188290] = {
  spellID = 188290,
  name = "Death and Decay",
  slug = "death_and_decay",
  max_range = 50000,
  duration = 10.0,
}

classData.spells[189186] = {
  spellID = 189186,
  name = "Crystalline Swords",
  slug = "crystalline_swords",
}

classData.spells[190778] = {
  spellID = 190778,
  name = "Sindragosa's Fury",
  slug = "sindragosas_fury",
  gcd = 1.5,
  cooldown = 300.0,
  duration = 10.0,
}

classData.spells[190780] = {
  spellID = 190780,
  name = "Frost Breath",
  slug = "frost_breath",
  max_range = 100,
  max_stacks = 1,
  duration = 10.0,
}

classData.spells[191384] = {
  spellID = 191384,
  name = "Aspect of the Beast",
  slug = "aspect_of_the_beast",
  max_range = 50000,
}

classData.spells[191587] = {
  spellID = 191587,
  name = "Virulent Plague",
  slug = "virulent_plague",
  max_range = 50000,
  duration = 21.0,
}

classData.spells[191685] = {
  spellID = 191685,
  name = "Virulent Eruption",
  slug = "virulent_eruption",
  max_range = 100,
}

classData.spells[191727] = {
  spellID = 191727,
  name = "Famine",
  slug = "famine",
  max_range = 100,
  max_stacks = 3,
  duration = 6.0,
}

classData.spells[191728] = {
  spellID = 191728,
  name = "War",
  slug = "war",
  max_range = 100,
  max_stacks = 3,
  duration = 6.0,
}

classData.spells[191729] = {
  spellID = 191729,
  name = "Pestilence",
  slug = "pestilence",
  max_range = 100,
  max_stacks = 3,
  duration = 6.0,
}

classData.spells[191730] = {
  spellID = 191730,
  name = "Death",
  slug = "death",
  max_range = 100,
  max_stacks = 3,
  duration = 6.0,
}

classData.spells[194310] = {
  spellID = 194310,
  name = "Festering Wound",
  slug = "festering_wound",
  max_range = 50000,
  max_stacks = 8,
  duration = 24.0,
  internal_cooldown = 1.0,
}

classData.spells[194311] = {
  spellID = 194311,
  name = "Festering Wound",
  slug = "festering_wound",
  max_range = 50000,
}

classData.spells[194662] = {
  spellID = 194662,
  name = "Rapid Decomposition",
  slug = "rapid_decomposition",
}

classData.spells[194679] = {
  spellID = 194679,
  name = "Rune Tap",
  slug = "rune_tap",
  charges = 2,
  charge_cooldown = 25.0,
  cooldown = 1.5,
  duration = 4.0,
  power = {
    [1] = { resource = "rune", amount = 1, },
    [2] = { resource = "runic_power", amount = -10, },
  },
}

classData.spells[194844] = {
  spellID = 194844,
  name = "Bonestorm",
  slug = "bonestorm",
  gcd = 1.5,
  cooldown = 60.0,
  duration = 1.0,
  power = {
    [1] = { resource = "runic_power", amount = 10, max_amount = 90, },
  },
}

classData.spells[194878] = {
  spellID = 194878,
  name = "Icy Talons",
  slug = "icy_talons",
}

classData.spells[194879] = {
  spellID = 194879,
  name = "Icy Talons",
  slug = "icy_talons",
  max_stacks = 3,
  duration = 6.0,
}

classData.spells[194909] = {
  spellID = 194909,
  name = "Frozen Pulse",
  slug = "frozen_pulse",
}

classData.spells[194912] = {
  spellID = 194912,
  name = "Gathering Storm",
  slug = "gathering_storm",
}

classData.spells[194913] = {
  spellID = 194913,
  name = "Glacial Advance",
  slug = "glacial_advance",
  max_range = 100,
  gcd = 1.5,
  cooldown = 15.0,
  power = {
    [1] = { resource = "rune", amount = 1, },
    [2] = { resource = "runic_power", amount = -10, },
  },
}

classData.spells[194916] = {
  spellID = 194916,
  name = "All Will Serve",
  slug = "all_will_serve",
}

classData.spells[194917] = {
  spellID = 194917,
  name = "Pestilent Pustules",
  slug = "pestilent_pustules",
}

classData.spells[194918] = {
  spellID = 194918,
  name = "Blighted Rune Weapon",
  slug = "blighted_rune_weapon",
  initial_stacks = 5,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 30.0,
}

classData.spells[195181] = {
  spellID = 195181,
  name = "Bone Shield",
  slug = "bone_shield",
  initial_stacks = 1,
  max_stacks = 10,
  duration = 30.0,
  internal_cooldown = 2.0,
}

classData.spells[195182] = {
  spellID = 195182,
  name = "Marrowrend",
  slug = "marrowrend",
  max_range = 5,
  gcd = 1.5,
  power = {
    [1] = { resource = "rune", amount = 2, },
    [2] = { resource = "runic_power", amount = -20, },
  },
}

classData.spells[195292] = {
  spellID = 195292,
  name = "Death's Caress",
  slug = "deaths_caress",
  max_range = 30,
  gcd = 1.5,
  power = {
    [1] = { resource = "rune", amount = 1, },
    [2] = { resource = "runic_power", amount = -10, },
  },
}

classData.spells[195617] = {
  spellID = 195617,
  name = "Frost Fever",
  slug = "frost_fever",
  max_range = 50000,
}

classData.spells[195621] = {
  spellID = 195621,
  name = "Frost Fever",
  slug = "frost_fever",
  max_range = 50000,
  internal_cooldown = 1.0,
}

classData.spells[195679] = {
  spellID = 195679,
  name = "Bloodworms",
  slug = "bloodworms",
}

classData.spells[195750] = {
  spellID = 195750,
  name = "Frozen Pulse",
  slug = "frozen_pulse",
}

classData.spells[195757] = {
  spellID = 195757,
  name = "Festering Wound",
  slug = "festering_wound",
}

classData.spells[195758] = {
  spellID = 195758,
  name = "Blighted Rune Weapon",
  slug = "blighted_rune_weapon",
  max_range = 100,
}

classData.spells[195975] = {
  spellID = 195975,
  name = "Glacial Advance",
  slug = "glacial_advance",
  max_range = 100,
}

classData.spells[196263] = {
  spellID = 196263,
  name = "Unholy Vigor",
  slug = "unholy_vigor",
  max_range = 50000,
}

classData.spells[196361] = {
  spellID = 196361,
  name = "Bloodworm",
  slug = "bloodworm",
  duration = 16.0,
}

classData.spells[196528] = {
  spellID = 196528,
  name = "Bonestorm",
  slug = "bonestorm",
}

classData.spells[196545] = {
  spellID = 196545,
  name = "Bonestorm",
  slug = "bonestorm",
}

classData.spells[196770] = {
  spellID = 196770,
  name = "Remorseless Winter",
  slug = "remorseless_winter",
  gcd = 1.5,
  cooldown = 20.0,
  duration = 8.0,
  power = {
    [1] = { resource = "rune", amount = 1, },
    [2] = { resource = "runic_power", amount = -10, },
  },
}

classData.spells[196771] = {
  spellID = 196771,
  name = "Remorseless Winter",
  slug = "remorseless_winter",
}

classData.spells[196782] = {
  spellID = 196782,
  name = "Outbreak",
  slug = "outbreak",
  max_range = 100,
  duration = 6.0,
}

classData.spells[197147] = {
  spellID = 197147,
  name = "Festering Wound",
  slug = "festering_wound",
}

classData.spells[197531] = {
  spellID = 197531,
  name = "Bloodworms",
  slug = "bloodworms",
  max_range = 100,
}

classData.spells[198494] = {
  spellID = 198494,
  name = "Bloodworms",
  slug = "bloodworms",
  duration = 15.0,
}

classData.spells[198715] = {
  spellID = 198715,
  name = "Val'kyr Strike",
  slug = "valkyr_strike",
  max_range = 40,
}

classData.spells[198943] = {
  spellID = 198943,
  name = "Shadow Infusion",
  slug = "shadow_infusion",
}

classData.spells[200749] = {
  spellID = 200749,
  name = "Activating Specialization",
  slug = "activating_specialization",
  max_range = 50000,
  channeled = true,
}

classData.spells[202846] = {
  spellID = 202846,
  name = "Blood for Blood",
  slug = "blood_for_blood",
}

classData.spells[204088] = {
  spellID = 204088,
  name = "Northrend Winds",
  slug = "northrend_winds",
}

classData.spells[204959] = {
  spellID = 204959,
  name = "Frozen Soul",
  slug = "frozen_soul",
}

classData.spells[205164] = {
  spellID = 205164,
  name = "Crystalline Swords",
  slug = "crystalline_swords",
  max_range = 100,
}

classData.spells[205165] = {
  spellID = 205165,
  name = "Crystalline Swords",
  slug = "crystalline_swords",
  max_range = 100,
}

classData.spells[205223] = {
  spellID = 205223,
  name = "Consumption",
  slug = "consumption",
  max_range = 5,
  gcd = 1.5,
  cooldown = 45.0,
}

classData.spells[205224] = {
  spellID = 205224,
  name = "Consumption",
  slug = "consumption",
}

classData.spells[205723] = {
  spellID = 205723,
  name = "Red Thirst",
  slug = "red_thirst",
}

classData.spells[205727] = {
  spellID = 205727,
  name = "Anti-Magic Barrier",
  slug = "antimagic_barrier",
}

classData.spells[206930] = {
  spellID = 206930,
  name = "Heart Strike",
  slug = "heart_strike",
  max_range = 5,
  gcd = 1.5,
  duration = 8.0,
  power = {
    [1] = { resource = "rune", amount = 1, },
    [2] = { resource = "runic_power", amount = -15, },
    [3] = { resource = "health", amount = 0, max_amount = 10, aura = 202846, },
  },
}

classData.spells[206931] = {
  spellID = 206931,
  name = "Blooddrinker",
  slug = "blooddrinker",
  max_range = 30,
  gcd = 1.5,
  cooldown = 30.0,
  duration = 3.0,
  channeled = true,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "rune", amount = 1, },
    [2] = { resource = "runic_power", amount = -10, },
  },
}

classData.spells[206940] = {
  spellID = 206940,
  name = "Mark of Blood",
  slug = "mark_of_blood",
  max_range = 15,
  gcd = 1.5,
  duration = 25.0,
  power = {
    [1] = { resource = "runic_power", amount = 30, },
  },
}

classData.spells[206945] = {
  spellID = 206945,
  name = "Mark of Blood",
  slug = "mark_of_blood",
  max_range = 100,
}

classData.spells[206967] = {
  spellID = 206967,
  name = "Will of the Necropolis",
  slug = "will_of_the_necropolis",
}

classData.spells[206970] = {
  spellID = 206970,
  name = "Tightening Grasp",
  slug = "tightening_grasp",
}

classData.spells[206974] = {
  spellID = 206974,
  name = "Foul Bulwark",
  slug = "foul_bulwark",
}

classData.spells[206977] = {
  spellID = 206977,
  name = "Blood Mirror",
  slug = "blood_mirror",
  max_range = 5,
  cooldown = 120.0,
  duration = 10.0,
}

classData.spells[207057] = {
  spellID = 207057,
  name = "Shattering Strikes",
  slug = "shattering_strikes",
}

classData.spells[207060] = {
  spellID = 207060,
  name = "Freezing Fog",
  slug = "freezing_fog",
}

classData.spells[207061] = {
  spellID = 207061,
  name = "Murderous Efficiency",
  slug = "murderous_efficiency",
}

classData.spells[207062] = {
  spellID = 207062,
  name = "Murderous Efficiency",
  slug = "murderous_efficiency",
  max_range = 50000,
}

classData.spells[207104] = {
  spellID = 207104,
  name = "Runic Attenuation",
  slug = "runic_attenuation",
}

classData.spells[207126] = {
  spellID = 207126,
  name = "Icecap",
  slug = "icecap",
  internal_cooldown = 0.5,
}

classData.spells[207127] = {
  spellID = 207127,
  name = "Hungering Rune Weapon",
  slug = "hungering_rune_weapon",
  charges = 1,
  charge_cooldown = 180.0,
  gcd = 1.5,
  cooldown = 1.0,
  duration = 12.0,
}

classData.spells[207142] = {
  spellID = 207142,
  name = "Avalanche",
  slug = "avalanche",
  internal_cooldown = 0.1,
}

classData.spells[207150] = {
  spellID = 207150,
  name = "Avalanche",
  slug = "avalanche",
  max_range = 100,
}

classData.spells[207161] = {
  spellID = 207161,
  name = "Abomination's Might",
  slug = "abominations_might",
}

classData.spells[207165] = {
  spellID = 207165,
  name = "Abomination's Might",
  slug = "abominations_might",
  max_range = 50000,
  duration = 2.0,
}

classData.spells[207167] = {
  spellID = 207167,
  name = "Blinding Sleet",
  slug = "blinding_sleet",
  initial_stacks = 1,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 4.0,
}

classData.spells[207170] = {
  spellID = 207170,
  name = "Winter is Coming",
  slug = "winter_is_coming",
}

classData.spells[207171] = {
  spellID = 207171,
  name = "Winter is Coming",
  slug = "winter_is_coming",
  max_range = 50000,
  duration = 8.0,
}

classData.spells[207188] = {
  spellID = 207188,
  name = "Volatile Shielding",
  slug = "volatile_shielding",
}

classData.spells[207200] = {
  spellID = 207200,
  name = "Permafrost",
  slug = "permafrost",
}

classData.spells[207230] = {
  spellID = 207230,
  name = "Frostscythe",
  slug = "frostscythe",
  max_range = 8,
  gcd = 1.5,
  power = {
    [1] = { resource = "rune", amount = 1, },
  },
}

classData.spells[207256] = {
  spellID = 207256,
  name = "Obliteration",
  slug = "obliteration",
  gcd = 1.5,
  cooldown = 90.0,
  duration = 12.0,
}

classData.spells[207260] = {
  spellID = 207260,
  name = "Arrow Spray",
  slug = "arrow_spray",
  max_range = 40,
  gcd = 1.0,
}

classData.spells[207264] = {
  spellID = 207264,
  name = "Bursting Sores",
  slug = "bursting_sores",
}

classData.spells[207267] = {
  spellID = 207267,
  name = "Bursting Sores",
  slug = "bursting_sores",
  max_range = 50000,
}

classData.spells[207269] = {
  spellID = 207269,
  name = "Ebon Fever",
  slug = "ebon_fever",
}

classData.spells[207272] = {
  spellID = 207272,
  name = "Infected Claws",
  slug = "infected_claws",
}

classData.spells[207289] = {
  spellID = 207289,
  name = "Unholy Frenzy",
  slug = "unholy_frenzy",
}

classData.spells[207290] = {
  spellID = 207290,
  name = "Unholy Frenzy",
  slug = "unholy_frenzy",
  max_range = 50000,
  duration = 2.5,
}

classData.spells[207305] = {
  spellID = 207305,
  name = "Castigator",
  slug = "castigator",
}

classData.spells[207311] = {
  spellID = 207311,
  name = "Clawing Shadows",
  slug = "clawing_shadows",
  max_range = 30,
  gcd = 1.5,
  power = {
    [1] = { resource = "rune", amount = 1, },
    [2] = { resource = "runic_power", amount = -10, },
  },
}

classData.spells[207313] = {
  spellID = 207313,
  name = "Sludge Belcher",
  slug = "sludge_belcher",
}

classData.spells[207316] = {
  spellID = 207316,
  name = "Debilitating Infestation",
  slug = "debilitating_infestation",
}

classData.spells[207317] = {
  spellID = 207317,
  name = "Epidemic",
  slug = "epidemic",
  charges = 3,
  charge_cooldown = 10.0,
  gcd = 1.5,
  power = {
    [1] = { resource = "rune", amount = 1, },
    [2] = { resource = "runic_power", amount = -10, },
  },
}

classData.spells[207319] = {
  spellID = 207319,
  name = "Corpse Shield",
  slug = "corpse_shield",
  gcd = 1.5,
  cooldown = 60.0,
  duration = 10.0,
}

classData.spells[207321] = {
  spellID = 207321,
  name = "Spell Eater",
  slug = "spell_eater",
}

classData.spells[207346] = {
  spellID = 207346,
  name = "Necrosis",
  slug = "necrosis",
}

classData.spells[207349] = {
  spellID = 207349,
  name = "Dark Arbiter",
  slug = "dark_arbiter",
  max_range = 30,
  gcd = 1.5,
  cooldown = 120.0,
  duration = 20.0,
}

classData.spells[208278] = {
  spellID = 208278,
  name = "Debilitating Infestation",
  slug = "debilitating_infestation",
  max_range = 100,
  duration = 3.0,
}

classData.spells[210738] = {
  spellID = 210738,
  name = "Heartbreaker",
  slug = "heartbreaker",
  max_range = 50000,
}

classData.spells[210764] = {
  spellID = 210764,
  name = "Rune Strike",
  slug = "rune_strike",
  max_range = 5,
  charges = 2,
  charge_cooldown = 60.0,
  gcd = 1.5,
}

classData.spells[211793] = {
  spellID = 211793,
  name = "Remorseless Winter",
  slug = "remorseless_winter",
  max_stacks = 1,
  duration = 3.0,
}

classData.spells[211805] = {
  spellID = 211805,
  name = "Gathering Storm",
  slug = "gathering_storm",
  max_range = 50000,
  max_stacks = 10,
  duration = 8.0,
}

classData.spells[211831] = {
  spellID = 211831,
  name = "Abomination's Might",
  slug = "abominations_might",
  max_range = 50000,
  duration = 5.0,
}

classData.spells[211947] = {
  spellID = 211947,
  name = "Shadow Empowerment",
  slug = "shadow_empowerment",
  max_range = 40,
  max_stacks = 1,
}

classData.spells[212332] = {
  spellID = 212332,
  name = "Smash",
  slug = "smash",
  max_range = 5,
  cooldown = 90.0,
  duration = 1.0,
}

classData.spells[212333] = {
  spellID = 212333,
  name = "Cleaver",
  slug = "cleaver",
  max_range = 5,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 40, },
  },
}

classData.spells[212335] = {
  spellID = 212335,
  name = "Cleaver",
  slug = "cleaver",
  max_range = 5,
  power = {
    [1] = { resource = "energy", amount = 40, },
  },
}

classData.spells[212336] = {
  spellID = 212336,
  name = "Smash",
  slug = "smash",
  max_range = 5,
  cooldown = 90.0,
}

classData.spells[212337] = {
  spellID = 212337,
  name = "Powerful Smash",
  slug = "powerful_smash",
  max_range = 5,
  cooldown = 90.0,
  duration = 2.0,
}

classData.spells[212338] = {
  spellID = 212338,
  name = "Vile Gas",
  slug = "vile_gas",
  max_range = 5,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 40, },
  },
}

classData.spells[212412] = {
  spellID = 212412,
  name = "Dark Arbiter",
  slug = "dark_arbiter",
  max_range = 30,
  gcd = 1.5,
  cooldown = 180.0,
  duration = 40.0,
}

classData.spells[212423] = {
  spellID = 212423,
  name = "Skulker Shot",
  slug = "skulker_shot",
  max_range = 35,
  gcd = 1.0,
}

classData.spells[212552] = {
  spellID = 212552,
  name = "Wraith Walk",
  slug = "wraith_walk",
  gcd = 1.5,
  cooldown = 45.0,
  duration = 3.0,
  channeled = true,
}

classData.spells[212654] = {
  spellID = 212654,
  name = "Wraith Walk",
  slug = "wraith_walk",
  duration = 0.0,
}

classData.spells[212739] = {
  spellID = 212739,
  name = "Epidemic",
  slug = "epidemic",
  max_range = 100,
}

classData.spells[212763] = {
  spellID = 212763,
  name = "Lingering Apparition",
  slug = "lingering_apparition",
}

classData.spells[215711] = {
  spellID = 215711,
  name = "Soul Reaper",
  slug = "soul_reaper",
  max_range = 100,
  max_stacks = 3,
  duration = 15.0,
}

classData.spells[215969] = {
  spellID = 215969,
  name = "Epidemic",
  slug = "epidemic",
  max_range = 100,
}

classData.spells[216974] = {
  spellID = 216974,
  name = "Necrosis",
  slug = "necrosis",
  duration = 6.0,
}

classData.spells[218100] = {
  spellID = 218100,
  name = "Defile",
  slug = "defile",
  max_range = 100,
  max_stacks = 10,
  cooldown = 1.0,
  duration = 6.0,
}

classData.spells[219779] = {
  spellID = 219779,
  name = "March of the Damned",
  slug = "march_of_the_damned",
}

classData.spells[219786] = {
  spellID = 219786,
  name = "Ossuary",
  slug = "ossuary",
}

classData.spells[219809] = {
  spellID = 219809,
  name = "Tombstone",
  slug = "tombstone",
  gcd = 1.5,
  cooldown = 60.0,
  duration = 8.0,
}

classData.spells[220143] = {
  spellID = 220143,
  name = "Apocalypse",
  slug = "apocalypse",
  max_range = 5,
  gcd = 1.5,
  cooldown = 90.0,
}

classData.spells[221180] = {
  spellID = 221180,
  name = "Army of the Dead",
  slug = "army_of_the_dead",
  duration = 15.0,
}

classData.spells[221322] = {
  spellID = 221322,
  name = "Runic Attenuation",
  slug = "runic_attenuation",
}

classData.spells[221536] = {
  spellID = 221536,
  name = "Heartbreaker",
  slug = "heartbreaker",
}

classData.spells[221562] = {
  spellID = 221562,
  name = "Asphyxiate",
  slug = "asphyxiate",
  max_range = 20,
  gcd = 1.5,
  cooldown = 45.0,
  duration = 5.0,
}

classData.spells[221847] = {
  spellID = 221847,
  name = "Blood Mirror",
  slug = "blood_mirror",
  max_range = 100,
}

classData.spells[222024] = {
  spellID = 222024,
  name = "Obliterate",
  slug = "obliterate",
  max_range = 100,
}

classData.spells[222026] = {
  spellID = 222026,
  name = "Frost Strike",
  slug = "frost_strike",
  max_range = 100,
}

classData.spells[224685] = {
  spellID = 224685,
  name = "Consumption",
  slug = "consumption",
  max_range = 30,
}

classData.spells[228322] = {
  spellID = 228322,
  name = "Hypothermia",
  slug = "hypothermia",
  max_range = 60,
}

classData.spells[237680] = {
  spellID = 237680,
  name = "Howling Blast",
  slug = "howling_blast",
  max_range = 100,
}

classData.spells[243122] = {
  spellID = 243122,
  name = "Crystalline Swords",
  slug = "crystalline_swords",
  max_range = 100,
}

classData.spells[251463] = {
  spellID = 251463,
  name = "Vindicaar Matrix Crystal",
  slug = "vindicaar_matrix_crystal",
  gcd = 1.5,
}

classData.spells[251875] = {
  spellID = 251875,
  name = "Item - Death Knight T21 Frost 4P Bonus",
  slug = "item__death_knight_t21_frost_4p_bonus",
}

classData.spells[253590] = {
  spellID = 253590,
  name = "Freezing Death",
  slug = "freezing_death",
  max_range = 100,
}

classData.spells[253593] = {
  spellID = 253593,
  name = "Inexorable Assault",
  slug = "inexorable_assault",
}

classData.spells[253594] = {
  spellID = 253594,
  name = "Inexorable Assault",
  slug = "inexorable_assault",
}

classData.spells[253597] = {
  spellID = 253597,
  name = "Inexorable Assault",
  slug = "inexorable_assault",
  max_range = 5,
  max_stacks = 20,
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

classData.spells[263423] = {
  spellID = 263423,
  name = "Lock Jaw",
  slug = "lock_jaw",
  max_range = 5,
  cooldown = 10.0,
  duration = 6.0,
}

classData.spells[263446] = {
  spellID = 263446,
  name = "Acid Spit",
  slug = "acid_spit",
  max_range = 30,
  cooldown = 10.0,
  duration = 6.0,
}

classData.spells[263840] = {
  spellID = 263840,
  name = "Furious Bite",
  slug = "furious_bite",
  max_range = 5,
  cooldown = 10.0,
  duration = 6.0,
}

classData.spells[263852] = {
  spellID = 263852,
  name = "Talon Rend",
  slug = "talon_rend",
  max_range = 5,
  cooldown = 10.0,
  duration = 6.0,
}

classData.spells[263853] = {
  spellID = 263853,
  name = "Infected Bite",
  slug = "infected_bite",
  max_range = 5,
  cooldown = 6.0,
}

classData.spells[263854] = {
  spellID = 263854,
  name = "Savage Rend",
  slug = "savage_rend",
  max_range = 5,
  cooldown = 6.0,
}

classData.spells[263857] = {
  spellID = 263857,
  name = "Ravage",
  slug = "ravage",
  max_range = 5,
  cooldown = 6.0,
}

classData.spells[263858] = {
  spellID = 263858,
  name = "Toxic Sting",
  slug = "toxic_sting",
  max_range = 5,
  cooldown = 6.0,
}

classData.spells[263867] = {
  spellID = 263867,
  name = "Obsidian Skin",
  slug = "obsidian_skin",
  cooldown = 60.0,
  duration = 12.0,
}

classData.spells[263869] = {
  spellID = 263869,
  name = "Bristle",
  slug = "bristle",
  cooldown = 60.0,
  duration = 12.0,
}

classData.spells[263887] = {
  spellID = 263887,
  name = "Dragon's Guile",
  slug = "dragons_guile",
  cooldown = 90.0,
  duration = 20.0,
}

classData.spells[263892] = {
  spellID = 263892,
  name = "Catlike Reflexes",
  slug = "catlike_reflexes",
  cooldown = 90.0,
  duration = 20.0,
}

classData.spells[263904] = {
  spellID = 263904,
  name = "Serpent's Swiftness",
  slug = "serpents_swiftness",
  cooldown = 90.0,
  duration = 20.0,
}

classData.spells[263926] = {
  spellID = 263926,
  name = "Thick Fur",
  slug = "thick_fur",
  duration = 12.0,
}

classData.spells[263934] = {
  spellID = 263934,
  name = "Thick Fur",
  slug = "thick_fur",
  max_range = 100,
  internal_cooldown = 120.0,
}

classData.spells[263938] = {
  spellID = 263938,
  name = "Silverback",
  slug = "silverback",
  duration = 12.0,
}

classData.spells[263939] = {
  spellID = 263939,
  name = "Silverback",
  slug = "silverback",
  max_range = 100,
  internal_cooldown = 120.0,
}

classData.spells[264055] = {
  spellID = 264055,
  name = "Serenity Dust",
  slug = "serenity_dust",
  max_range = 5,
  gcd = 1.0,
  cooldown = 10.0,
}

classData.spells[264056] = {
  spellID = 264056,
  name = "Spore Cloud",
  slug = "spore_cloud",
  max_range = 5,
  gcd = 1.0,
  cooldown = 10.0,
}

classData.spells[264263] = {
  spellID = 264263,
  name = "Sonic Blast",
  slug = "sonic_blast",
  max_range = 5,
  gcd = 1.0,
  cooldown = 10.0,
}

classData.spells[264264] = {
  spellID = 264264,
  name = "Nether Shock",
  slug = "nether_shock",
  max_range = 5,
  gcd = 1.0,
  cooldown = 10.0,
}

classData.spells[264265] = {
  spellID = 264265,
  name = "Spirit Shock",
  slug = "spirit_shock",
  max_range = 5,
  gcd = 1.0,
  cooldown = 10.0,
}

classData.spells[264349] = {
  spellID = 264349,
  name = "Reap Magic",
  slug = "reap_magic",
  max_range = 40,
  gcd = 1.5,
  cooldown = 10.0,
}

classData.spells[264360] = {
  spellID = 264360,
  name = "Winged Agility",
  slug = "winged_agility",
  cooldown = 90.0,
  duration = 20.0,
}

classData.spells[264656] = {
  spellID = 264656,
  name = "Pathfinding",
  slug = "pathfinding",
  max_range = 50000,
}

classData.spells[264662] = {
  spellID = 264662,
  name = "Endurance Training",
  slug = "endurance_training",
  max_range = 50000,
}

classData.spells[264663] = {
  spellID = 264663,
  name = "Predator's Thirst",
  slug = "predators_thirst",
  max_range = 50000,
}

classData.spells[264667] = {
  spellID = 264667,
  name = "Primal Rage",
  slug = "primal_rage",
  cooldown = 360.0,
  duration = 40.0,
  power = {
    [1] = { resource = "focus", amount = 50, },
  },
}

classData.spells[273946] = {
  spellID = 273946,
  name = "Hemostasis",
  slug = "hemostasis",
}

classData.spells[273947] = {
  spellID = 273947,
  name = "Hemostasis",
  slug = "hemostasis",
  max_stacks = 5,
  duration = 15.0,
}

classData.spells[273952] = {
  spellID = 273952,
  name = "Grip of the Dead",
  slug = "grip_of_the_dead",
}

classData.spells[273953] = {
  spellID = 273953,
  name = "Voracious",
  slug = "voracious",
}

classData.spells[274009] = {
  spellID = 274009,
  name = "Voracious",
  slug = "voracious",
  duration = 6.0,
  internal_cooldown = 0.5,
}

classData.spells[274156] = {
  spellID = 274156,
  name = "Consumption",
  slug = "consumption",
  max_range = 5,
  gcd = 1.5,
  cooldown = 45.0,
}

classData.spells[274893] = {
  spellID = 274893,
  name = "Consumption",
  slug = "consumption",
  max_range = 30,
}
