----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BfA only.
----------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(4, GetBuildInfo()) < 80000 then
    return
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Class check
----------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(3, UnitClass('player')) ~= 3 then return end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
local addonName, TJ = ...
TJ.ClassData = TJ.ClassData or {}
TJ.ClassData[3] = TJ.ClassData[3] or {}
local classData = TJ.ClassData[3]
classData.spells = classData.spells or {}

classData.spells[136] = {
  spellID = 136,
  name = "Mend Pet",
  slug = "mend_pet",
  max_range = 45,
  gcd = 1.5,
  cooldown = 10.0,
  duration = 10.0,
}

classData.spells[674] = {
  spellID = 674,
  name = "Dual Wield",
  slug = "dual_wield",
}

classData.spells[781] = {
  spellID = 781,
  name = "Disengage",
  slug = "disengage",
  max_range = 50000,
  charges = 1,
  charge_cooldown = 30.0,
  gcd = 0.5,
  cooldown = 1.0,
}

classData.spells[883] = {
  spellID = 883,
  name = "Call Pet 1",
  slug = "call_pet_1",
  gcd = 1.5,
}

classData.spells[982] = {
  spellID = 982,
  name = "Revive Pet",
  slug = "revive_pet",
  gcd = 1.5,
  duration = 3.0,
  power = {
    [1] = { resource = "focus", amount = 35, },
  },
}

classData.spells[1462] = {
  spellID = 1462,
  name = "Beast Lore",
  slug = "beast_lore",
  max_range = 40,
  gcd = 1.5,
  duration = 30.0,
}

classData.spells[1494] = {
  spellID = 1494,
  name = "Track Beasts",
  slug = "track_beasts",
}

classData.spells[1515] = {
  spellID = 1515,
  name = "Tame Beast",
  slug = "tame_beast",
  max_range = 30,
  gcd = 1.5,
  duration = 6.0,
  channeled = true,
  haste_affected_ticks = true,
}

classData.spells[1539] = {
  spellID = 1539,
  name = "Feed Pet",
  slug = "feed_pet",
  max_range = 50000,
}

classData.spells[1543] = {
  spellID = 1543,
  name = "Flare",
  slug = "flare",
  max_range = 40,
  gcd = 1.5,
  cooldown = 20.0,
}

classData.spells[2641] = {
  spellID = 2641,
  name = "Dismiss Pet",
  slug = "dismiss_pet",
  max_range = 50000,
  gcd = 1.5,
}

classData.spells[2643] = {
  spellID = 2643,
  name = "Multi-Shot",
  slug = "multishot",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "focus", amount = 40, },
  },
}

classData.spells[2649] = {
  spellID = 2649,
  name = "Growl",
  slug = "growl",
  max_range = 30,
  cooldown = 8.0,
  duration = 3.0,
}

classData.spells[3355] = {
  spellID = 3355,
  name = "Freezing Trap",
  slug = "freezing_trap",
  max_range = 100,
  duration = 60.0,
}

classData.spells[5116] = {
  spellID = 5116,
  name = "Concussive Shot",
  slug = "concussive_shot",
  max_range = 40,
  gcd = 1.5,
  cooldown = 5.0,
  duration = 6.0,
}

classData.spells[5384] = {
  spellID = 5384,
  name = "Feign Death",
  slug = "feign_death",
  cooldown = 30.0,
  duration = 360.0,
}

classData.spells[6197] = {
  spellID = 6197,
  name = "Eagle Eye",
  slug = "eagle_eye",
  max_range = 50000,
  gcd = 1.5,
  duration = 60.0,
  channeled = true,
}

classData.spells[6991] = {
  spellID = 6991,
  name = "Feed Pet",
  slug = "feed_pet",
  max_range = 10,
  cooldown = 10.0,
}

classData.spells[13481] = {
  spellID = 13481,
  name = "Tame Beast",
  slug = "tame_beast",
  max_range = 30,
}

classData.spells[13809] = {
  spellID = 13809,
  name = "Ice Trap",
  slug = "ice_trap",
  gcd = 1.5,
  cooldown = 30.0,
  duration = 60.0,
}

classData.spells[13810] = {
  spellID = 13810,
  name = "Ice Trap",
  slug = "ice_trap",
  max_range = 50000,
  duration = 30.0,
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

classData.spells[19434] = {
  spellID = 19434,
  name = "Aimed Shot",
  slug = "aimed_shot",
  max_range = 40,
  charges = 2,
  charge_cooldown = 12.0,
  gcd = 1.5,
  power = {
    [1] = { resource = "focus", amount = 30, },
  },
}

classData.spells[19574] = {
  spellID = 19574,
  name = "Bestial Wrath",
  slug = "bestial_wrath",
  max_range = 100,
  gcd = 1.5,
  cooldown = 90.0,
  duration = 15.0,
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

classData.spells[19596] = {
  spellID = 19596,
  name = "Boar's Speed",
  slug = "boars_speed",
}

classData.spells[19878] = {
  spellID = 19878,
  name = "Track Demons",
  slug = "track_demons",
}

classData.spells[19879] = {
  spellID = 19879,
  name = "Track Dragonkin",
  slug = "track_dragonkin",
}

classData.spells[19880] = {
  spellID = 19880,
  name = "Track Elementals",
  slug = "track_elementals",
}

classData.spells[19882] = {
  spellID = 19882,
  name = "Track Giants",
  slug = "track_giants",
}

classData.spells[19883] = {
  spellID = 19883,
  name = "Track Humanoids",
  slug = "track_humanoids",
}

classData.spells[19884] = {
  spellID = 19884,
  name = "Track Undead",
  slug = "track_undead",
}

classData.spells[20572] = {
  spellID = 20572,
  name = "Blood Fury",
  slug = "blood_fury",
  cooldown = 120.0,
  duration = 15.0,
}

classData.spells[20782] = {
  spellID = 20782,
  name = "Combat Experience",
  slug = "combat_experience",
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

classData.spells[34026] = {
  spellID = 34026,
  name = "Kill Command",
  slug = "kill_command",
  max_range = 50,
  gcd = 1.5,
  cooldown = 7.5,
  power = {
    [1] = { resource = "focus", amount = 30, },
  },
}

classData.spells[34477] = {
  spellID = 34477,
  name = "Misdirection",
  slug = "misdirection",
  max_range = 100,
  cooldown = 30.0,
  duration = 8.0,
}

classData.spells[35346] = {
  spellID = 35346,
  name = "Warp Time",
  slug = "warp_time",
  max_range = 5,
  cooldown = 10.0,
  duration = 6.0,
}

classData.spells[37506] = {
  spellID = 37506,
  name = "Scatter Shot",
  slug = "scatter_shot",
  max_range = 100,
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

classData.spells[50433] = {
  spellID = 50433,
  name = "Ankle Crack",
  slug = "ankle_crack",
  max_range = 5,
  cooldown = 10.0,
  duration = 6.0,
}

classData.spells[51284] = {
  spellID = 51284,
  name = "Feed Pet - Visual",
  slug = "feed_pet__visual",
  max_range = 10,
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

classData.spells[53209] = {
  spellID = 53209,
  name = "Chimaera Shot",
  slug = "chimaera_shot",
  max_range = 40,
  gcd = 1.5,
  cooldown = 15.0,
}

classData.spells[53270] = {
  spellID = 53270,
  name = "Exotic Beasts",
  slug = "exotic_beasts",
}

classData.spells[53271] = {
  spellID = 53271,
  name = "Master's Call",
  slug = "masters_call",
  max_range = 40,
  cooldown = 45.0,
}

classData.spells[53478] = {
  spellID = 53478,
  name = "Last Stand",
  slug = "last_stand",
  cooldown = 360.0,
  duration = 20.0,
}

classData.spells[53482] = {
  spellID = 53482,
  name = "Blood of the Rhino",
  slug = "blood_of_the_rhino",
}

classData.spells[53490] = {
  spellID = 53490,
  name = "Bullheaded",
  slug = "bullheaded",
  gcd = 1.5,
  cooldown = 180.0,
  duration = 0.1,
}

classData.spells[53497] = {
  spellID = 53497,
  name = "Cornered",
  slug = "cornered",
}

classData.spells[54216] = {
  spellID = 54216,
  name = "Master's Call",
  slug = "masters_call",
  max_range = 40,
  duration = 4.0,
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

classData.spells[55709] = {
  spellID = 55709,
  name = "Heart of the Phoenix",
  slug = "heart_of_the_phoenix",
  cooldown = 480.0,
}

classData.spells[56315] = {
  spellID = 56315,
  name = "Kindred Spirits",
  slug = "kindred_spirits",
}

classData.spells[56641] = {
  spellID = 56641,
  name = "Steady Shot",
  slug = "steady_shot",
  max_range = 40,
  gcd = 1.5,
}

classData.spells[57627] = {
  spellID = 57627,
  name = "Charge",
  slug = "charge",
  max_range = 5,
  initial_stacks = 1,
  duration = 6.0,
}

classData.spells[57724] = {
  spellID = 57724,
  name = "Sated",
  slug = "sated",
  max_range = 50000,
  duration = 600.0,
}

classData.spells[57870] = {
  spellID = 57870,
  name = "Glyph of Lesser Proportion",
  slug = "glyph_of_lesser_proportion",
}

classData.spells[58188] = {
  spellID = 58188,
  name = "Lesser Proportion",
  slug = "lesser_proportion",
}

classData.spells[59543] = {
  spellID = 59543,
  name = "Gift of the Naaru",
  slug = "gift_of_the_naaru",
  max_range = 40,
  cooldown = 180.0,
  duration = 5.0,
  haste_affected_ticks = true,
}

classData.spells[61648] = {
  spellID = 61648,
  name = "Aspect of the Chameleon",
  slug = "aspect_of_the_chameleon",
  gcd = 1.5,
  cooldown = 180.0,
  duration = 60.0,
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

classData.spells[61688] = {
  spellID = 61688,
  name = "Great Stamina",
  slug = "great_stamina",
}

classData.spells[62762] = {
  spellID = 62762,
  name = "Basic Attack Focus Cost Modifier",
  slug = "basic_attack_focus_cost_modifier",
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

classData.spells[76657] = {
  spellID = 76657,
  name = "Mastery: Master of Beasts",
  slug = "mastery_master_of_beasts",
}

classData.spells[77443] = {
  spellID = 77443,
  name = "Steady Shot",
  slug = "steady_shot",
  max_range = 50000,
}

classData.spells[80483] = {
  spellID = 80483,
  name = "Arcane Torrent",
  slug = "arcane_torrent",
  gcd = 1.5,
  cooldown = 90.0,
}

classData.spells[83242] = {
  spellID = 83242,
  name = "Call Pet 2",
  slug = "call_pet_2",
  gcd = 1.5,
}

classData.spells[83243] = {
  spellID = 83243,
  name = "Call Pet 3",
  slug = "call_pet_3",
  gcd = 1.5,
}

classData.spells[83244] = {
  spellID = 83244,
  name = "Call Pet 4",
  slug = "call_pet_4",
  gcd = 1.5,
}

classData.spells[83245] = {
  spellID = 83245,
  name = "Call Pet 5",
  slug = "call_pet_5",
  gcd = 1.5,
}

classData.spells[83381] = {
  spellID = 83381,
  name = "Kill Command",
  slug = "kill_command",
  max_range = 100,
}

classData.spells[86538] = {
  spellID = 86538,
  name = "Mail Specialization",
  slug = "mail_specialization",
}

classData.spells[88680] = {
  spellID = 88680,
  name = "Kindred Spirits",
  slug = "kindred_spirits",
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

classData.spells[93273] = {
  spellID = 93273,
  name = "Hunter Pet Exotic Marker (DND)",
  slug = "hunter_pet_exotic_marker_dnd",
}

classData.spells[93321] = {
  spellID = 93321,
  name = "Control Pet",
  slug = "control_pet",
}

classData.spells[93322] = {
  spellID = 93322,
  name = "Control Pet",
  slug = "control_pet",
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

classData.spells[109215] = {
  spellID = 109215,
  name = "Posthaste",
  slug = "posthaste",
}

classData.spells[109248] = {
  spellID = 109248,
  name = "Binding Shot",
  slug = "binding_shot",
  max_range = 30,
  cooldown = 45.0,
  duration = 10.0,
}

classData.spells[109298] = {
  spellID = 109298,
  name = "Narrow Escape",
  slug = "narrow_escape",
}

classData.spells[109304] = {
  spellID = 109304,
  name = "Exhilaration",
  slug = "exhilaration",
  max_range = 45,
  cooldown = 120.0,
}

classData.spells[115804] = {
  spellID = 115804,
  name = "Mortal Wounds",
  slug = "mortal_wounds",
  max_range = 100,
  duration = 10.0,
}

classData.spells[115928] = {
  spellID = 115928,
  name = "Narrow Escape",
  slug = "narrow_escape",
}

classData.spells[115939] = {
  spellID = 115939,
  name = "Beast Cleave",
  slug = "beast_cleave",
}

classData.spells[117526] = {
  spellID = 117526,
  name = "Binding Shot",
  slug = "binding_shot",
  max_range = 100,
  duration = 5.0,
}

classData.spells[118455] = {
  spellID = 118455,
  name = "Beast Cleave",
  slug = "beast_cleave",
  max_range = 50000,
  duration = 4.0,
}

classData.spells[118459] = {
  spellID = 118459,
  name = "Beast Cleave",
  slug = "beast_cleave",
  max_range = 5,
}

classData.spells[118922] = {
  spellID = 118922,
  name = "Posthaste",
  slug = "posthaste",
  max_range = 100,
  duration = 4.0,
}

classData.spells[120360] = {
  spellID = 120360,
  name = "Barrage",
  slug = "barrage",
  max_range = 40,
  gcd = 1.5,
  cooldown = 20.0,
  duration = 3.0,
  channeled = true,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "focus", amount = 60, },
  },
}

classData.spells[120361] = {
  spellID = 120361,
  name = "Barrage",
  slug = "barrage",
  max_range = 50,
}

classData.spells[120679] = {
  spellID = 120679,
  name = "Dire Beast",
  slug = "dire_beast",
  max_range = 40,
  gcd = 1.5,
  cooldown = 15.0,
  duration = 8.0,
  power = {
    [1] = { resource = "focus", amount = 35, },
  },
}

classData.spells[120761] = {
  spellID = 120761,
  name = "Glaive Toss",
  slug = "glaive_toss",
  duration = 3.0,
}

classData.spells[121414] = {
  spellID = 121414,
  name = "Glaive Toss",
  slug = "glaive_toss",
  duration = 3.0,
}

classData.spells[125050] = {
  spellID = 125050,
  name = "Fetch",
  slug = "fetch",
  max_range = 50,
  gcd = 1.5,
}

classData.spells[127933] = {
  spellID = 127933,
  name = "Fireworks",
  slug = "fireworks",
  max_range = 40,
  gcd = 1.5,
}

classData.spells[128594] = {
  spellID = 128594,
  name = "Exhilaration",
  slug = "exhilaration",
  max_range = 50000,
  cooldown = 120.0,
}

classData.spells[130392] = {
  spellID = 130392,
  name = "Blink Strikes",
  slug = "blink_strikes",
  max_range = 100,
}

classData.spells[131894] = {
  spellID = 131894,
  name = "A Murder of Crows",
  slug = "a_murder_of_crows",
  max_range = 40,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 15.0,
  power = {
    [1] = { resource = "focus", amount = 30, },
  },
}

classData.spells[131900] = {
  spellID = 131900,
  name = "A Murder of Crows",
  slug = "a_murder_of_crows",
  max_range = 100,
}

classData.spells[132950] = {
  spellID = 132950,
  name = "Flare",
  slug = "flare",
  max_range = 50000,
  duration = 20.0,
}

classData.spells[135299] = {
  spellID = 135299,
  name = "Tar Trap",
  slug = "tar_trap",
  max_range = 50000,
  duration = 39.0,
}

classData.spells[136634] = {
  spellID = 136634,
  name = "Narrow Escape",
  slug = "narrow_escape",
  max_range = 100,
  duration = 8.0,
}

classData.spells[137014] = {
  spellID = 137014,
  name = "Hunter",
  slug = "hunter",
}

classData.spells[137015] = {
  spellID = 137015,
  name = "Beast Mastery Hunter",
  slug = "beast_mastery_hunter",
}

classData.spells[137016] = {
  spellID = 137016,
  name = "Marksmanship Hunter",
  slug = "marksmanship_hunter",
}

classData.spells[137017] = {
  spellID = 137017,
  name = "Survival Hunter",
  slug = "survival_hunter",
}

classData.spells[138430] = {
  spellID = 138430,
  name = "Ancient Zandalari Knowledge",
  slug = "ancient_zandalari_knowledge",
}

classData.spells[147362] = {
  spellID = 147362,
  name = "Counter Shot",
  slug = "counter_shot",
  max_range = 40,
  cooldown = 24.0,
  duration = 3.0,
}

classData.spells[152244] = {
  spellID = 152244,
  name = "Adaptation",
  slug = "adaptation",
}

classData.spells[155228] = {
  spellID = 155228,
  name = "Lone Wolf",
  slug = "lone_wolf",
}

classData.spells[156843] = {
  spellID = 156843,
  name = "Combat Experience",
  slug = "combat_experience",
}

classData.spells[157443] = {
  spellID = 157443,
  name = "Critical Strikes",
  slug = "critical_strikes",
}

classData.spells[159786] = {
  spellID = 159786,
  name = "Molten Hide",
  slug = "molten_hide",
  max_range = 30,
  duration = 10.0,
}

classData.spells[159788] = {
  spellID = 159788,
  name = "Molten Hide",
  slug = "molten_hide",
  max_range = 30,
  internal_cooldown = 60.0,
}

classData.spells[159953] = {
  spellID = 159953,
  name = "Feast",
  slug = "feast",
  max_range = 5,
  gcd = 1.0,
  cooldown = 60.0,
}

classData.spells[159954] = {
  spellID = 159954,
  name = "Feast",
  slug = "feast",
  duration = 6.0,
  channeled = true,
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

classData.spells[160124] = {
  spellID = 160124,
  name = "Molten Hide",
  slug = "molten_hide",
  max_range = 30,
}

classData.spells[162480] = {
  spellID = 162480,
  name = "Steel Trap",
  slug = "steel_trap",
  max_range = 100,
  duration = 30.0,
}

classData.spells[162487] = {
  spellID = 162487,
  name = "Steel Trap",
  slug = "steel_trap",
  max_range = 50000,
  duration = 30.0,
  haste_affected_ticks = true,
}

classData.spells[162488] = {
  spellID = 162488,
  name = "Steel Trap",
  slug = "steel_trap",
  max_range = 40,
  gcd = 1.5,
  cooldown = 30.0,
}

classData.spells[162496] = {
  spellID = 162496,
  name = "Steel Trap",
  slug = "steel_trap",
  max_range = 100,
  duration = 60.0,
}

classData.spells[162697] = {
  spellID = 162697,
  name = "Stat Negation Aura - Agility DPS",
  slug = "stat_negation_aura__agility_dps",
}

classData.spells[166615] = {
  spellID = 166615,
  name = "Pet Active",
  slug = "pet_active",
  max_range = 100,
}

classData.spells[171454] = {
  spellID = 171454,
  name = "Chimaera Shot",
  slug = "chimaera_shot",
  max_range = 40,
}

classData.spells[171457] = {
  spellID = 171457,
  name = "Chimaera Shot",
  slug = "chimaera_shot",
  max_range = 40,
}

classData.spells[175686] = {
  spellID = 175686,
  name = "Stopping Power",
  slug = "stopping_power",
  gcd = 1.5,
}

classData.spells[185358] = {
  spellID = 185358,
  name = "Arcane Shot",
  slug = "arcane_shot",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "focus", amount = 15, },
  },
}

classData.spells[185789] = {
  spellID = 185789,
  name = "Wild Call",
  slug = "wild_call",
}

classData.spells[185791] = {
  spellID = 185791,
  name = "Wild Call",
  slug = "wild_call",
  duration = 4.0,
}

classData.spells[186254] = {
  spellID = 186254,
  name = "Bestial Wrath",
  slug = "bestial_wrath",
  max_range = 100,
  cooldown = 90.0,
  duration = 15.0,
}

classData.spells[186257] = {
  spellID = 186257,
  name = "Aspect of the Cheetah",
  slug = "aspect_of_the_cheetah",
  cooldown = 180.0,
  duration = 3.0,
}

classData.spells[186258] = {
  spellID = 186258,
  name = "Aspect of the Cheetah",
  slug = "aspect_of_the_cheetah",
  duration = 9.0,
}

classData.spells[186265] = {
  spellID = 186265,
  name = "Aspect of the Turtle",
  slug = "aspect_of_the_turtle",
  cooldown = 180.0,
  duration = 8.0,
}

classData.spells[186270] = {
  spellID = 186270,
  name = "Raptor Strike",
  slug = "raptor_strike",
  max_range = 5,
  gcd = 1.5,
  power = {
    [1] = { resource = "focus", amount = 30, },
  },
}

classData.spells[186289] = {
  spellID = 186289,
  name = "Aspect of the Eagle",
  slug = "aspect_of_the_eagle",
  max_range = 100,
  cooldown = 90.0,
  duration = 15.0,
}

classData.spells[186387] = {
  spellID = 186387,
  name = "Bursting Shot",
  slug = "bursting_shot",
  gcd = 1.5,
  cooldown = 30.0,
  duration = 4.0,
  power = {
    [1] = { resource = "focus", amount = 10, },
  },
}

classData.spells[187650] = {
  spellID = 187650,
  name = "Freezing Trap",
  slug = "freezing_trap",
  max_range = 40,
  gcd = 1.5,
  cooldown = 30.0,
}

classData.spells[187651] = {
  spellID = 187651,
  name = "Freezing Trap",
  slug = "freezing_trap",
  max_range = 100,
  cooldown = 30.0,
  duration = 60.0,
}

classData.spells[187698] = {
  spellID = 187698,
  name = "Tar Trap",
  slug = "tar_trap",
  max_range = 40,
  gcd = 1.5,
  cooldown = 30.0,
}

classData.spells[187699] = {
  spellID = 187699,
  name = "Tar Trap",
  slug = "tar_trap",
  max_range = 100,
  cooldown = 30.0,
  duration = 60.0,
}

classData.spells[187707] = {
  spellID = 187707,
  name = "Muzzle",
  slug = "muzzle",
  max_range = 5,
  cooldown = 15.0,
  duration = 3.0,
}

classData.spells[190925] = {
  spellID = 190925,
  name = "Harpoon",
  slug = "harpoon",
  min_range = 5,
  max_range = 30,
  charges = 1,
  charge_cooldown = 30.0,
  gcd = 0.5,
  cooldown = 1.0,
}

classData.spells[190927] = {
  spellID = 190927,
  name = "Harpoon",
  slug = "harpoon",
  min_range = 5,
  max_range = 50000,
  gcd = 1.5,
  cooldown = 6.0,
  duration = 3.0,
}

classData.spells[191384] = {
  spellID = 191384,
  name = "Aspect of the Beast",
  slug = "aspect_of_the_beast",
  max_range = 50000,
}

classData.spells[193455] = {
  spellID = 193455,
  name = "Cobra Shot",
  slug = "cobra_shot",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "focus", amount = 45, },
  },
}

classData.spells[193468] = {
  spellID = 193468,
  name = "Mastery: Sniper Training",
  slug = "mastery_sniper_training",
}

classData.spells[193526] = {
  spellID = 193526,
  name = "Trueshot",
  slug = "trueshot",
  gcd = 1.5,
  cooldown = 180.0,
  duration = 15.0,
}

classData.spells[193530] = {
  spellID = 193530,
  name = "Aspect of the Wild",
  slug = "aspect_of_the_wild",
  max_range = 100,
  gcd = 1.3,
  cooldown = 120.0,
  duration = 20.0,
}

classData.spells[193532] = {
  spellID = 193532,
  name = "Dire Stable",
  slug = "dire_stable",
}

classData.spells[193533] = {
  spellID = 193533,
  name = "Steady Focus",
  slug = "steady_focus",
}

classData.spells[193534] = {
  spellID = 193534,
  name = "Steady Focus",
  slug = "steady_focus",
  max_stacks = 2,
  duration = 12.0,
}

classData.spells[194407] = {
  spellID = 194407,
  name = "Spitting Cobra",
  slug = "spitting_cobra",
  gcd = 1.5,
  cooldown = 90.0,
  duration = 20.0,
}

classData.spells[194594] = {
  spellID = 194594,
  name = "Lock and Load",
  slug = "lock_and_load",
  initial_stacks = 1,
  duration = 15.0,
}

classData.spells[194595] = {
  spellID = 194595,
  name = "Lock and Load",
  slug = "lock_and_load",
}

classData.spells[195645] = {
  spellID = 195645,
  name = "Wing Clip",
  slug = "wing_clip",
  max_range = 5,
  gcd = 1.5,
  duration = 15.0,
  power = {
    [1] = { resource = "focus", amount = 30, },
  },
}

classData.spells[198670] = {
  spellID = 198670,
  name = "Piercing Shot",
  slug = "piercing_shot",
  max_range = 40,
  gcd = 1.5,
  cooldown = 30.0,
  power = {
    [1] = { resource = "focus", amount = 35, },
  },
}

classData.spells[199483] = {
  spellID = 199483,
  name = "Camouflage",
  slug = "camouflage",
  max_range = 50000,
  initial_stacks = 1,
  cooldown = 60.0,
  duration = 60.0,
}

classData.spells[199528] = {
  spellID = 199528,
  name = "One with the Pack",
  slug = "one_with_the_pack",
}

classData.spells[199530] = {
  spellID = 199530,
  name = "Stomp",
  slug = "stomp",
}

classData.spells[199532] = {
  spellID = 199532,
  name = "Killer Cobra",
  slug = "killer_cobra",
}

classData.spells[199558] = {
  spellID = 199558,
  name = "Disengage End",
  slug = "disengage_end",
  max_range = 100,
}

classData.spells[199921] = {
  spellID = 199921,
  name = "Trailblazer",
  slug = "trailblazer",
}

classData.spells[200749] = {
  spellID = 200749,
  name = "Activating Specialization",
  slug = "activating_specialization",
  max_range = 50000,
  channeled = true,
}

classData.spells[201430] = {
  spellID = 201430,
  name = "Stampede",
  slug = "stampede",
  max_range = 30,
  gcd = 1.5,
  cooldown = 180.0,
  duration = 12.0,
}

classData.spells[201594] = {
  spellID = 201594,
  name = "Stampede",
  slug = "stampede",
  max_range = 150,
}

classData.spells[201754] = {
  spellID = 201754,
  name = "Stomp",
  slug = "stomp",
}

classData.spells[203413] = {
  spellID = 203413,
  name = "Fury of the Eagle",
  slug = "fury_of_the_eagle",
  max_range = 8,
}

classData.spells[203415] = {
  spellID = 203415,
  name = "Fury of the Eagle",
  slug = "fury_of_the_eagle",
  max_range = 8,
  gcd = 1.5,
  cooldown = 45.0,
  duration = 4.0,
  channeled = true,
}

classData.spells[203525] = {
  spellID = 203525,
  name = "Talon Strike",
  slug = "talon_strike",
  max_range = 8,
}

classData.spells[204081] = {
  spellID = 204081,
  name = "On the Trail",
  slug = "on_the_trail",
  max_range = 60,
  duration = 12.0,
}

classData.spells[204147] = {
  spellID = 204147,
  name = "Windburst",
  slug = "windburst",
  max_range = 40,
  gcd = 1.5,
  cooldown = 20.0,
  power = {
    [1] = { resource = "focus", amount = 20, },
  },
}

classData.spells[204304] = {
  spellID = 204304,
  name = "Chimaera Shot",
  slug = "chimaera_shot",
  max_range = 50000,
}

classData.spells[204475] = {
  spellID = 204475,
  name = "Windburst",
  slug = "windburst",
  max_range = 100,
  duration = 5.0,
}

classData.spells[204477] = {
  spellID = 204477,
  name = "Windburst",
  slug = "windburst",
  max_range = 100,
  duration = 5.0,
}

classData.spells[205154] = {
  spellID = 205154,
  name = "Mecha-Bond Imprint Matrix",
  slug = "mechabond_imprint_matrix",
}

classData.spells[206685] = {
  spellID = 206685,
  name = "Cobra Spit",
  slug = "cobra_spit",
  max_range = 25,
}

classData.spells[207068] = {
  spellID = 207068,
  name = "Titan's Thunder",
  slug = "titans_thunder",
  max_range = 100,
  cooldown = 60.0,
  duration = 8.0,
}

classData.spells[207081] = {
  spellID = 207081,
  name = "Titan's Thunder",
  slug = "titans_thunder",
  max_range = 100,
}

classData.spells[207094] = {
  spellID = 207094,
  name = "Titan's Thunder",
  slug = "titans_thunder",
  max_range = 100,
  duration = 8.0,
}

classData.spells[207097] = {
  spellID = 207097,
  name = "Titan's Thunder",
  slug = "titans_thunder",
  max_range = 10,
}

classData.spells[209997] = {
  spellID = 209997,
  name = "Play Dead",
  slug = "play_dead",
  max_range = 100,
  cooldown = 30.0,
  duration = 360.0,
}

classData.spells[210000] = {
  spellID = 210000,
  name = "Wake Up",
  slug = "wake_up",
  max_range = 1000,
  cooldown = 30.0,
}

classData.spells[212431] = {
  spellID = 212431,
  name = "Explosive Shot",
  slug = "explosive_shot",
  max_range = 40,
  gcd = 1.5,
  cooldown = 30.0,
  duration = 4.0,
  power = {
    [1] = { resource = "focus", amount = 20, },
  },
}

classData.spells[212436] = {
  spellID = 212436,
  name = "Butchery",
  slug = "butchery",
  max_range = 8,
  charges = 3,
  charge_cooldown = 15.0,
  gcd = 1.5,
  power = {
    [1] = { resource = "focus", amount = 20, },
  },
}

classData.spells[212680] = {
  spellID = 212680,
  name = "Explosive Shot",
  slug = "explosive_shot",
  max_range = 100,
}

classData.spells[213691] = {
  spellID = 213691,
  name = "Scatter Shot",
  slug = "scatter_shot",
  max_range = 20,
  gcd = 1.5,
  cooldown = 30.0,
  duration = 4.0,
}

classData.spells[214579] = {
  spellID = 214579,
  name = "Sidewinders",
  slug = "sidewinders",
  max_range = 40,
  charges = 2,
  charge_cooldown = 12.0,
  gcd = 1.5,
}

classData.spells[214581] = {
  spellID = 214581,
  name = "Sidewinders",
  slug = "sidewinders",
  max_range = 100,
}

classData.spells[217200] = {
  spellID = 217200,
  name = "Barbed Shot",
  slug = "barbed_shot",
  max_range = 40,
  charges = 2,
  charge_cooldown = 12.0,
  gcd = 1.5,
}

classData.spells[217207] = {
  spellID = 217207,
  name = "Dire Frenzy",
  slug = "dire_frenzy",
  max_range = 25,
}

classData.spells[218635] = {
  spellID = 218635,
  name = "Titan's Thunder",
  slug = "titans_thunder",
  max_range = 10,
}

classData.spells[224729] = {
  spellID = 224729,
  name = "Bursting Shot",
  slug = "bursting_shot",
  max_range = 100,
  initial_stacks = 1,
  duration = 4.0,
}

classData.spells[227057] = {
  spellID = 227057,
  name = "Expansive Mind",
  slug = "expansive_mind",
}

classData.spells[231390] = {
  spellID = 231390,
  name = "Trailblazer",
  slug = "trailblazer",
}

classData.spells[231546] = {
  spellID = 231546,
  name = "Exhilaration",
  slug = "exhilaration",
}

classData.spells[231548] = {
  spellID = 231548,
  name = "Bestial Wrath",
  slug = "bestial_wrath",
}

classData.spells[231549] = {
  spellID = 231549,
  name = "Disengage",
  slug = "disengage",
}

classData.spells[231550] = {
  spellID = 231550,
  name = "Harpoon",
  slug = "harpoon",
}

classData.spells[242155] = {
  spellID = 242155,
  name = "Hybrid Kinship",
  slug = "hybrid_kinship",
}

classData.spells[242798] = {
  spellID = 242798,
  name = "Echo of Ohn'ara",
  slug = "echo_of_ohnara",
  max_range = 40,
}

classData.spells[246152] = {
  spellID = 246152,
  name = "Dire Frenzy",
  slug = "dire_frenzy",
  max_range = 100,
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

classData.spells[257044] = {
  spellID = 257044,
  name = "Rapid Fire",
  slug = "rapid_fire",
  max_range = 40,
  gcd = 1.5,
  cooldown = 20.0,
  duration = 3.0,
  channeled = true,
  haste_affected_ticks = true,
}

classData.spells[257045] = {
  spellID = 257045,
  name = "Rapid Fire",
  slug = "rapid_fire",
  max_range = 40,
  gcd = 1.0,
}

classData.spells[257284] = {
  spellID = 257284,
  name = "Hunter's Mark",
  slug = "hunters_mark",
  max_range = 60,
  gcd = 1.5,
}

classData.spells[257620] = {
  spellID = 257620,
  name = "Multi-Shot",
  slug = "multishot",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "focus", amount = 15, },
  },
}

classData.spells[257621] = {
  spellID = 257621,
  name = "Trick Shots",
  slug = "trick_shots",
}

classData.spells[257622] = {
  spellID = 257622,
  name = "Trick Shots",
  slug = "trick_shots",
  duration = 20.0,
}

classData.spells[257891] = {
  spellID = 257891,
  name = "Venomous Bite",
  slug = "venomous_bite",
}

classData.spells[257944] = {
  spellID = 257944,
  name = "Thrill of the Hunt",
  slug = "thrill_of_the_hunt",
}

classData.spells[257946] = {
  spellID = 257946,
  name = "Thrill of the Hunt",
  slug = "thrill_of_the_hunt",
  max_stacks = 3,
  duration = 8.0,
}

classData.spells[259277] = {
  spellID = 259277,
  name = "Kill Command",
  slug = "kill_command",
  max_range = 100,
  duration = 8.0,
}

classData.spells[259381] = {
  spellID = 259381,
  name = "Check if part 2 quests have been accepted (DNT)",
  slug = "check_if_part_2_quests_have_been_accepted_dnt",
}

classData.spells[259387] = {
  spellID = 259387,
  name = "Mongoose Bite",
  slug = "mongoose_bite",
  max_range = 5,
  gcd = 1.5,
  power = {
    [1] = { resource = "focus", amount = 30, },
  },
}

classData.spells[259388] = {
  spellID = 259388,
  name = "Mongoose Fury",
  slug = "mongoose_fury",
  max_stacks = 5,
  duration = 14.0,
}

classData.spells[259391] = {
  spellID = 259391,
  name = "Chakrams",
  slug = "chakrams",
  max_range = 40,
  gcd = 1.5,
  cooldown = 20.0,
  power = {
    [1] = { resource = "focus", amount = 30, },
  },
}

classData.spells[259396] = {
  spellID = 259396,
  name = "Chakrams",
  slug = "chakrams",
  max_range = 100,
}

classData.spells[259398] = {
  spellID = 259398,
  name = "Chakrams",
  slug = "chakrams",
  max_range = 100,
}

classData.spells[259489] = {
  spellID = 259489,
  name = "Kill Command",
  slug = "kill_command",
  max_range = 50,
  charges = 1,
  charge_cooldown = 6.0,
  gcd = 1.5,
}

classData.spells[259491] = {
  spellID = 259491,
  name = "Serpent Sting",
  slug = "serpent_sting",
  max_range = 40,
  gcd = 1.5,
  duration = 12.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "focus", amount = 20, },
  },
}

classData.spells[259495] = {
  spellID = 259495,
  name = "Wildfire Bomb",
  slug = "wildfire_bomb",
  max_range = 40,
  charges = 1,
  charge_cooldown = 18.0,
  gcd = 1.5,
}

classData.spells[259558] = {
  spellID = 259558,
  name = "Hunter's Mark",
  slug = "hunters_mark",
  max_range = 100,
}

classData.spells[260228] = {
  spellID = 260228,
  name = "Careful Aim",
  slug = "careful_aim",
}

classData.spells[260240] = {
  spellID = 260240,
  name = "Precise Shots",
  slug = "precise_shots",
}

classData.spells[260241] = {
  spellID = 260241,
  name = "Hydra's Bite",
  slug = "hydras_bite",
}

classData.spells[260242] = {
  spellID = 260242,
  name = "Precise Shots",
  slug = "precise_shots",
  max_stacks = 2,
  duration = 15.0,
}

classData.spells[260243] = {
  spellID = 260243,
  name = "Volley",
  slug = "volley",
}

classData.spells[260247] = {
  spellID = 260247,
  name = "Volley",
  slug = "volley",
  max_range = 100,
}

classData.spells[260248] = {
  spellID = 260248,
  name = "Bloodseeker",
  slug = "bloodseeker",
  max_range = 50000,
}

classData.spells[260249] = {
  spellID = 260249,
  name = "Predator",
  slug = "predator",
  max_stacks = 10,
}

classData.spells[260285] = {
  spellID = 260285,
  name = "Tip of the Spear",
  slug = "tip_of_the_spear",
}

classData.spells[260286] = {
  spellID = 260286,
  name = "Tip of the Spear",
  slug = "tip_of_the_spear",
  max_stacks = 3,
  duration = 10.0,
}

classData.spells[260309] = {
  spellID = 260309,
  name = "Master Marksman",
  slug = "master_marksman",
}

classData.spells[260331] = {
  spellID = 260331,
  name = "Birds of Prey",
  slug = "birds_of_prey",
}

classData.spells[260367] = {
  spellID = 260367,
  name = "Streamline",
  slug = "streamline",
}

classData.spells[260393] = {
  spellID = 260393,
  name = "Lethal Shots",
  slug = "lethal_shots",
}

classData.spells[260395] = {
  spellID = 260395,
  name = "Lethal Shots",
  slug = "lethal_shots",
  duration = 15.0,
}

classData.spells[260402] = {
  spellID = 260402,
  name = "Double Tap",
  slug = "double_tap",
  gcd = 1.5,
  cooldown = 60.0,
  duration = 15.0,
}

classData.spells[260404] = {
  spellID = 260404,
  name = "Calling the Shots",
  slug = "calling_the_shots",
}

classData.spells[262837] = {
  spellID = 262837,
  name = "Cobra Shot",
  slug = "cobra_shot",
}

classData.spells[262838] = {
  spellID = 262838,
  name = "Cobra Shot",
  slug = "cobra_shot",
}

classData.spells[262839] = {
  spellID = 262839,
  name = "Raptor Strike",
  slug = "raptor_strike",
}

classData.spells[263135] = {
  spellID = 263135,
  name = "Mastery: Spirit Bond",
  slug = "mastery_spirit_bond",
  max_range = 100,
}

classData.spells[263140] = {
  spellID = 263140,
  name = "Spirit Bond",
  slug = "spirit_bond",
  max_range = 100,
}

classData.spells[263183] = {
  spellID = 263183,
  name = "Disengage",
  slug = "disengage",
}

classData.spells[263186] = {
  spellID = 263186,
  name = "Kill Command",
  slug = "kill_command",
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

classData.spells[263585] = {
  spellID = 263585,
  name = "Rapid Fire",
  slug = "rapid_fire",
  max_range = 40,
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

classData.spells[264332] = {
  spellID = 264332,
  name = "Guerrilla Tactics",
  slug = "guerrilla_tactics",
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

classData.spells[264735] = {
  spellID = 264735,
  name = "Survival of the Fittest",
  slug = "survival_of_the_fittest",
  max_range = 50000,
  cooldown = 180.0,
  duration = 6.0,
}

classData.spells[265157] = {
  spellID = 265157,
  name = "Wildfire Bomb",
  slug = "wildfire_bomb",
  max_range = 50000,
}

classData.spells[265163] = {
  spellID = 265163,
  name = "Wildfire Bomb",
  slug = "wildfire_bomb",
  max_range = 100,
  duration = 0.5,
}

classData.spells[265189] = {
  spellID = 265189,
  name = "Raptor Strike",
  slug = "raptor_strike",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "focus", amount = 30, },
  },
}

classData.spells[265895] = {
  spellID = 265895,
  name = "Terms of Engagement",
  slug = "terms_of_engagement",
}

classData.spells[265896] = {
  spellID = 265896,
  name = "Terms of Engagement",
  slug = "terms_of_engagement",
  duration = 2.0,
}

classData.spells[265898] = {
  spellID = 265898,
  name = "Terms of Engagement",
  slug = "terms_of_engagement",
  duration = 10.0,
}

classData.spells[266779] = {
  spellID = 266779,
  name = "Coordinated Assault",
  slug = "coordinated_assault",
  max_range = 100,
  gcd = 1.5,
  cooldown = 120.0,
  duration = 20.0,
}

classData.spells[266921] = {
  spellID = 266921,
  name = "Born To Be Wild",
  slug = "born_to_be_wild",
}

classData.spells[267116] = {
  spellID = 267116,
  name = "Animal Companion [NYI]",
  slug = "animal_companion_nyi",
}

classData.spells[267605] = {
  spellID = 267605,
  name = "Chakrams",
  slug = "chakrams",
  max_range = 40,
  gcd = 1.5,
  cooldown = 20.0,
  duration = 5.0,
}

classData.spells[268501] = {
  spellID = 268501,
  name = "Viper's Venom",
  slug = "vipers_venom",
}

classData.spells[268552] = {
  spellID = 268552,
  name = "Viper's Venom",
  slug = "vipers_venom",
  duration = 8.0,
}

classData.spells[269502] = {
  spellID = 269502,
  name = "Lethal Shots",
  slug = "lethal_shots",
  initial_stacks = 1,
  duration = 15.0,
}

classData.spells[269576] = {
  spellID = 269576,
  name = "Master Marksman",
  slug = "master_marksman",
  initial_stacks = 1,
  duration = 12.0,
}

classData.spells[269737] = {
  spellID = 269737,
  name = "Alpha Predator",
  slug = "alpha_predator",
}

classData.spells[269747] = {
  spellID = 269747,
  name = "Scorching Wildfire",
  slug = "scorching_wildfire",
  max_range = 50000,
  duration = 5.0,
}

classData.spells[269751] = {
  spellID = 269751,
  name = "Flanking Strike",
  slug = "flanking_strike",
  max_range = 15,
  gcd = 1.5,
  cooldown = 40.0,
}

classData.spells[269752] = {
  spellID = 269752,
  name = "Flanking Strike",
  slug = "flanking_strike",
  max_range = 100,
}

classData.spells[269850] = {
  spellID = 269850,
  name = "Explosive Shot",
  slug = "explosive_shot",
  max_range = 100,
}

classData.spells[270323] = {
  spellID = 270323,
  name = "Pheromone Bomb",
  slug = "pheromone_bomb",
  max_range = 40,
  charges = 1,
  charge_cooldown = 18.0,
  gcd = 1.5,
}

classData.spells[270327] = {
  spellID = 270327,
  name = "Pheromone Bomb",
  slug = "pheromone_bomb",
  max_range = 100,
  duration = 0.5,
}

classData.spells[270329] = {
  spellID = 270329,
  name = "Pheromone Bomb",
  slug = "pheromone_bomb",
  max_range = 50000,
}

classData.spells[270332] = {
  spellID = 270332,
  name = "Scorching Pheromones",
  slug = "scorching_pheromones",
  max_range = 50000,
  duration = 5.0,
}

classData.spells[270335] = {
  spellID = 270335,
  name = "Shrapnel Bomb",
  slug = "shrapnel_bomb",
  max_range = 40,
  charges = 1,
  charge_cooldown = 18.0,
  gcd = 1.5,
}

classData.spells[270336] = {
  spellID = 270336,
  name = "Shrapnel Bomb",
  slug = "shrapnel_bomb",
  max_range = 100,
  duration = 0.5,
}

classData.spells[270338] = {
  spellID = 270338,
  name = "Shrapnel Bomb",
  slug = "shrapnel_bomb",
  max_range = 50000,
}

classData.spells[270339] = {
  spellID = 270339,
  name = "Scorching Shrapnel",
  slug = "scorching_shrapnel",
  max_range = 50000,
  duration = 5.0,
}

classData.spells[270343] = {
  spellID = 270343,
  name = "Internal Bleeding",
  slug = "internal_bleeding",
  max_range = 100,
  max_stacks = 3,
  duration = 9.0,
  haste_affected_ticks = true,
}

classData.spells[270581] = {
  spellID = 270581,
  name = "Natural Mending",
  slug = "natural_mending",
}

classData.spells[271014] = {
  spellID = 271014,
  name = "Wildfire Infusion",
  slug = "wildfire_infusion",
}

classData.spells[271625] = {
  spellID = 271625,
  name = "Harpoon",
  slug = "harpoon",
  max_range = 100,
}

classData.spells[271788] = {
  spellID = 271788,
  name = "Serpent Sting",
  slug = "serpent_sting",
  max_range = 40,
  gcd = 1.5,
  duration = 12.0,
  power = {
    [1] = { resource = "focus", amount = 10, },
  },
}

classData.spells[272651] = {
  spellID = 272651,
  name = "Command Pet",
  slug = "command_pet",
}

classData.spells[272790] = {
  spellID = 272790,
  name = "Dire Frenzy",
  slug = "dire_frenzy",
  max_range = 100,
  max_stacks = 3,
  duration = 8.0,
}

classData.spells[273277] = {
  spellID = 273277,
  name = "Summon Animal Companion",
  slug = "summon_animal_companion",
}

classData.spells[273887] = {
  spellID = 273887,
  name = "Killer Instinct",
  slug = "killer_instinct",
}
