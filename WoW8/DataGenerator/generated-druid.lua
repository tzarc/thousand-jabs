----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BfA only.
----------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(4, GetBuildInfo()) < 80000 then
    return
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Class check
----------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(3, UnitClass('player')) ~= 11 then return end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
local addonName, TJ = ...
TJ.ClassData = TJ.ClassData or {}
TJ.ClassData[11] = TJ.ClassData[11] or {}
local classData = TJ.ClassData[11]
classData.spells = classData.spells or {}

classData.spells[99] = {
  spellID = 99,
  name = "Incapacitating Roar",
  slug = "incapacitating_roar",
  gcd = 1.5,
  cooldown = 30.0,
  duration = 3.0,
}

classData.spells[339] = {
  spellID = 339,
  name = "Entangling Roots",
  slug = "entangling_roots",
  max_range = 35,
  gcd = 1.5,
  duration = 30.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[740] = {
  spellID = 740,
  name = "Tranquility",
  slug = "tranquility",
  gcd = 1.5,
  cooldown = 180.0,
  duration = 8.0,
  channeled = true,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[768] = {
  spellID = 768,
  name = "Cat Form",
  slug = "cat_form",
  gcd = 1.5,
}

classData.spells[774] = {
  spellID = 774,
  name = "Rejuvenation",
  slug = "rejuvenation",
  max_range = 40,
  gcd = 1.5,
  duration = 12.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[783] = {
  spellID = 783,
  name = "Travel Form",
  slug = "travel_form",
  gcd = 1.5,
}

classData.spells[1079] = {
  spellID = 1079,
  name = "Rip",
  slug = "rip",
  max_range = 5,
  gcd = 1.0,
  duration = 24.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "energy", amount = 30, },
    [2] = { resource = "combo_points", amount = 1, max_amount = 4, },
  },
}

classData.spells[1178] = {
  spellID = 1178,
  name = "Bear Form Passive",
  slug = "bear_form_passive",
  internal_cooldown = 0.5,
}

classData.spells[1822] = {
  spellID = 1822,
  name = "Rake",
  slug = "rake",
  max_range = 5,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 35, },
  },
}

classData.spells[1850] = {
  spellID = 1850,
  name = "Dash",
  slug = "dash",
  gcd = 1.5,
  cooldown = 120.0,
  duration = 10.0,
}

classData.spells[2637] = {
  spellID = 2637,
  name = "Hibernate",
  slug = "hibernate",
  max_range = 30,
  gcd = 1.5,
  duration = 40.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[2782] = {
  spellID = 2782,
  name = "Remove Corruption",
  slug = "remove_corruption",
  max_range = 40,
  gcd = 1.5,
  cooldown = 8.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[2908] = {
  spellID = 2908,
  name = "Soothe",
  slug = "soothe",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[3025] = {
  spellID = 3025,
  name = "Cat Form",
  slug = "cat_form",
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

classData.spells[5211] = {
  spellID = 5211,
  name = "Mighty Bash",
  slug = "mighty_bash",
  max_range = 5,
  gcd = 1.5,
  cooldown = 50.0,
  duration = 5.0,
}

classData.spells[5215] = {
  spellID = 5215,
  name = "Prowl",
  slug = "prowl",
  initial_stacks = 1,
  cooldown = 6.0,
}

classData.spells[5217] = {
  spellID = 5217,
  name = "Tiger's Fury",
  slug = "tigers_fury",
  gcd = 1.0,
  cooldown = 30.0,
  duration = 10.0,
}

classData.spells[5221] = {
  spellID = 5221,
  name = "Shred",
  slug = "shred",
  max_range = 5,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 40, },
  },
}

classData.spells[5419] = {
  spellID = 5419,
  name = "Travel Form (Passive)",
  slug = "travel_form_passive",
}

classData.spells[5420] = {
  spellID = 5420,
  name = "Incarnation: Tree of Life",
  slug = "incarnation_tree_of_life",
}

classData.spells[5421] = {
  spellID = 5421,
  name = "Aquatic Form Passive",
  slug = "aquatic_form_passive",
}

classData.spells[5487] = {
  spellID = 5487,
  name = "Bear Form",
  slug = "bear_form",
  gcd = 1.5,
}

classData.spells[6795] = {
  spellID = 6795,
  name = "Growl",
  slug = "growl",
  max_range = 30,
  cooldown = 8.0,
  duration = 3.0,
}

classData.spells[6807] = {
  spellID = 6807,
  name = "Maul",
  slug = "maul",
  max_range = 5,
  gcd = 1.5,
  power = {
    [1] = { resource = "rage", amount = 45, },
  },
}

classData.spells[8921] = {
  spellID = 8921,
  name = "Moonfire",
  slug = "moonfire",
  max_range = 40,
  gcd = 1.5,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, aura = 137012, },
  },
}

classData.spells[8936] = {
  spellID = 8936,
  name = "Regrowth",
  slug = "regrowth",
  max_range = 40,
  gcd = 1.5,
  duration = 12.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[16864] = {
  spellID = 16864,
  name = "Omen of Clarity",
  slug = "omen_of_clarity",
  internal_cooldown = 1.1,
}

classData.spells[16870] = {
  spellID = 16870,
  name = "Clearcasting",
  slug = "clearcasting",
  max_range = 100,
  max_stacks = 1,
  duration = 15.0,
}

classData.spells[16931] = {
  spellID = 16931,
  name = "Thick Hide",
  slug = "thick_hide",
}

classData.spells[16949] = {
  spellID = 16949,
  name = "Feral Instinct",
  slug = "feral_instinct",
}

classData.spells[16953] = {
  spellID = 16953,
  name = "Primal Fury",
  slug = "primal_fury",
  max_range = 100,
  max_stacks = 3,
}

classData.spells[16974] = {
  spellID = 16974,
  name = "Predatory Swiftness",
  slug = "predatory_swiftness",
  max_stacks = 1,
}

classData.spells[17057] = {
  spellID = 17057,
  name = "Bear Form",
  slug = "bear_form",
  duration = 6.0,
}

classData.spells[18562] = {
  spellID = 18562,
  name = "Swiftmend",
  slug = "swiftmend",
  max_range = 40,
  charges = 1,
  charge_cooldown = 25.0,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[20484] = {
  spellID = 20484,
  name = "Rebirth",
  slug = "rebirth",
  max_range = 40,
  gcd = 1.5,
  cooldown = 600.0,
  power = {
    [1] = { resource = "rage", amount = 10, aura = 5487, },
  },
}

classData.spells[20719] = {
  spellID = 20719,
  name = "Feline Grace",
  slug = "feline_grace",
}

classData.spells[21009] = {
  spellID = 21009,
  name = "Elusiveness",
  slug = "elusiveness",
}

classData.spells[21178] = {
  spellID = 21178,
  name = "Bear Form Passive 2",
  slug = "bear_form_passive_2",
}

classData.spells[21563] = {
  spellID = 21563,
  name = "Command",
  slug = "command",
}

classData.spells[22568] = {
  spellID = 22568,
  name = "Ferocious Bite",
  slug = "ferocious_bite",
  max_range = 5,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 25, },
    [2] = { resource = "combo_points", amount = 1, max_amount = 4, },
  },
}

classData.spells[22570] = {
  spellID = 22570,
  name = "Maim",
  slug = "maim",
  max_range = 5,
  gcd = 1.0,
  cooldown = 10.0,
  power = {
    [1] = { resource = "energy", amount = 35, },
    [2] = { resource = "combo_points", amount = 1, max_amount = 4, },
  },
}

classData.spells[22812] = {
  spellID = 22812,
  name = "Barkskin",
  slug = "barkskin",
  cooldown = 60.0,
  duration = 12.0,
}

classData.spells[22842] = {
  spellID = 22842,
  name = "Frenzied Regeneration",
  slug = "frenzied_regeneration",
  charges = 1,
  charge_cooldown = 36.0,
  gcd = 1.5,
  cooldown = 1.0,
  duration = 5.0,
  power = {
    [1] = { resource = "rage", amount = 10, },
  },
}

classData.spells[24858] = {
  spellID = 24858,
  name = "Moonkin Form",
  slug = "moonkin_form",
  gcd = 1.5,
}

classData.spells[29166] = {
  spellID = 29166,
  name = "Innervate",
  slug = "innervate",
  max_range = 40,
  gcd = 1.5,
  cooldown = 180.0,
  duration = 10.0,
}

classData.spells[33763] = {
  spellID = 33763,
  name = "Lifebloom",
  slug = "lifebloom",
  max_range = 40,
  max_stacks = 1,
  gcd = 1.5,
  duration = 15.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[33778] = {
  spellID = 33778,
  name = "Lifebloom",
  slug = "lifebloom",
  max_range = 40,
}

classData.spells[33873] = {
  spellID = 33873,
  name = "Nurturing Instinct",
  slug = "nurturing_instinct",
}

classData.spells[33891] = {
  spellID = 33891,
  name = "Incarnation: Tree of Life",
  slug = "incarnation_tree_of_life",
  gcd = 1.5,
  cooldown = 180.0,
}

classData.spells[33917] = {
  spellID = 33917,
  name = "Mangle",
  slug = "mangle",
  max_range = 5,
  gcd = 1.5,
  cooldown = 6.0,
}

classData.spells[37846] = {
  spellID = 37846,
  name = "Force of Nature",
  slug = "force_of_nature",
}

classData.spells[48438] = {
  spellID = 48438,
  name = "Wild Growth",
  slug = "wild_growth",
  max_range = 40,
  gcd = 1.5,
  cooldown = 10.0,
  duration = 7.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[48484] = {
  spellID = 48484,
  name = "Infected Wounds",
  slug = "infected_wounds",
}

classData.spells[50322] = {
  spellID = 50322,
  name = "Survival Instincts",
  slug = "survival_instincts",
  duration = 6.0,
}

classData.spells[52610] = {
  spellID = 52610,
  name = "Savage Roar",
  slug = "savage_roar",
  max_range = 100,
  gcd = 1.0,
  duration = 6.0,
  power = {
    [1] = { resource = "energy", amount = 30, },
    [2] = { resource = "combo_points", amount = 1, max_amount = 4, },
  },
}

classData.spells[54872] = {
  spellID = 54872,
  name = "The Orca",
  slug = "the_orca",
}

classData.spells[58158] = {
  spellID = 58158,
  name = "The Ursol Chameleon",
  slug = "the_ursol_chameleon",
  cooldown = 1.5,
}

classData.spells[58180] = {
  spellID = 58180,
  name = "Infected Wounds",
  slug = "infected_wounds",
  max_range = 5,
  max_stacks = 1,
  duration = 12.0,
}

classData.spells[61252] = {
  spellID = 61252,
  name = "Maim Damage",
  slug = "maim_damage",
}

classData.spells[61336] = {
  spellID = 61336,
  name = "Survival Instincts",
  slug = "survival_instincts",
  charges = 2,
  charge_cooldown = 180.0,
  cooldown = 6.0,
  duration = 6.0,
}

classData.spells[61391] = {
  spellID = 61391,
  name = "Typhoon",
  slug = "typhoon",
  max_range = 15,
  duration = 6.0,
}

classData.spells[62071] = {
  spellID = 62071,
  name = "Savage Roar",
  slug = "savage_roar",
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

classData.spells[69369] = {
  spellID = 69369,
  name = "Predatory Swiftness",
  slug = "predatory_swiftness",
  max_stacks = 1,
  duration = 12.0,
}

classData.spells[77492] = {
  spellID = 77492,
  name = "Mastery: Starlight",
  slug = "mastery_starlight",
}

classData.spells[77493] = {
  spellID = 77493,
  name = "Mastery: Razor Claws",
  slug = "mastery_razor_claws",
}

classData.spells[77495] = {
  spellID = 77495,
  name = "Mastery: Harmony",
  slug = "mastery_harmony",
}

classData.spells[77758] = {
  spellID = 77758,
  name = "Thrash",
  slug = "thrash",
  max_range = 8,
  gcd = 1.5,
  cooldown = 6.0,
  power = {
    [1] = { resource = "rage", amount = 0, },
  },
}

classData.spells[78674] = {
  spellID = 78674,
  name = "Starsurge",
  slug = "starsurge",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "astral_power", amount = 40, },
  },
}

classData.spells[78675] = {
  spellID = 78675,
  name = "Solar Beam",
  slug = "solar_beam",
  max_range = 40,
  cooldown = 60.0,
  duration = 8.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[80313] = {
  spellID = 80313,
  name = "Pulverize",
  slug = "pulverize",
  max_range = 5,
  gcd = 1.5,
}

classData.spells[80863] = {
  spellID = 80863,
  name = "Sabertooth",
  slug = "sabertooth",
  max_range = 100,
}

classData.spells[81097] = {
  spellID = 81097,
  name = "Incarnation: Tree of Life",
  slug = "incarnation_tree_of_life",
}

classData.spells[81098] = {
  spellID = 81098,
  name = "Incarnation: Tree of Life",
  slug = "incarnation_tree_of_life",
}

classData.spells[81262] = {
  spellID = 81262,
  name = "Efflorescence",
  slug = "efflorescence",
  max_range = 100,
  duration = 30.0,
  haste_affected_ticks = true,
}

classData.spells[81269] = {
  spellID = 81269,
  name = "Efflorescence",
  slug = "efflorescence",
  max_range = 100,
}

classData.spells[86093] = {
  spellID = 86093,
  name = "Leather Specialization",
  slug = "leather_specialization",
}

classData.spells[86096] = {
  spellID = 86096,
  name = "Leather Specialization",
  slug = "leather_specialization",
}

classData.spells[86097] = {
  spellID = 86097,
  name = "Leather Specialization",
  slug = "leather_specialization",
}

classData.spells[86104] = {
  spellID = 86104,
  name = "Leather Specialization",
  slug = "leather_specialization",
}

classData.spells[88423] = {
  spellID = 88423,
  name = "Nature's Cure",
  slug = "natures_cure",
  max_range = 40,
  charges = 1,
  charge_cooldown = 8.0,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[93402] = {
  spellID = 93402,
  name = "Sunfire",
  slug = "sunfire",
  max_range = 40,
  gcd = 1.5,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, aura = 137012, },
  },
}

classData.spells[93622] = {
  spellID = 93622,
  name = "Gore",
  slug = "gore",
  initial_stacks = 1,
  duration = 10.0,
}

classData.spells[93985] = {
  spellID = 93985,
  name = "Skull Bash",
  slug = "skull_bash",
  max_range = 100,
  duration = 4.0,
}

classData.spells[94293] = {
  spellID = 94293,
  name = "Altered Form",
  slug = "altered_form",
}

classData.spells[97547] = {
  spellID = 97547,
  name = "Solar Beam",
  slug = "solar_beam",
  max_range = 100,
  duration = 5.0,
}

classData.spells[102342] = {
  spellID = 102342,
  name = "Ironbark",
  slug = "ironbark",
  max_range = 40,
  cooldown = 60.0,
  duration = 12.0,
}

classData.spells[102351] = {
  spellID = 102351,
  name = "Cenarion Ward",
  slug = "cenarion_ward",
  max_range = 40,
  initial_stacks = 1,
  gcd = 1.5,
  cooldown = 30.0,
  duration = 30.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[102352] = {
  spellID = 102352,
  name = "Cenarion Ward",
  slug = "cenarion_ward",
  max_range = 100,
  duration = 8.0,
  haste_affected_ticks = true,
}

classData.spells[102359] = {
  spellID = 102359,
  name = "Mass Entanglement",
  slug = "mass_entanglement",
  max_range = 30,
  gcd = 1.5,
  cooldown = 30.0,
  duration = 30.0,
}

classData.spells[102401] = {
  spellID = 102401,
  name = "Wild Charge",
  slug = "wild_charge",
  min_range = 5,
  max_range = 25,
  gcd = 0.5,
  cooldown = 15.0,
  duration = 0.5,
}

classData.spells[102543] = {
  spellID = 102543,
  name = "Incarnation: King of the Jungle",
  slug = "incarnation_king_of_the_jungle",
  gcd = 1.0,
  cooldown = 180.0,
  duration = 30.0,
}

classData.spells[102547] = {
  spellID = 102547,
  name = "Prowl",
  slug = "prowl",
  initial_stacks = 1,
  cooldown = 6.0,
}

classData.spells[102558] = {
  spellID = 102558,
  name = "Incarnation: Guardian of Ursoc",
  slug = "incarnation_guardian_of_ursoc",
  gcd = 1.5,
  cooldown = 180.0,
  duration = 30.0,
}

classData.spells[102560] = {
  spellID = 102560,
  name = "Incarnation: Chosen of Elune",
  slug = "incarnation_chosen_of_elune",
  gcd = 1.5,
  cooldown = 180.0,
  duration = 30.0,
}

classData.spells[102793] = {
  spellID = 102793,
  name = "Ursol's Vortex",
  slug = "ursols_vortex",
  max_range = 30,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 10.0,
}

classData.spells[102794] = {
  spellID = 102794,
  name = "Ursol's Vortex",
  slug = "ursols_vortex",
  max_range = 50000,
}

classData.spells[106733] = {
  spellID = 106733,
  name = "Feral Overrides Passive",
  slug = "feral_overrides_passive",
}

classData.spells[106734] = {
  spellID = 106734,
  name = "Guardian Overrides Passive",
  slug = "guardian_overrides_passive",
}

classData.spells[106785] = {
  spellID = 106785,
  name = "Swipe",
  slug = "swipe",
  max_range = 8,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 40, },
  },
}

classData.spells[106830] = {
  spellID = 106830,
  name = "Thrash",
  slug = "thrash",
  max_range = 8,
  gcd = 1.0,
  duration = 15.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "energy", amount = 45, },
  },
}

classData.spells[106832] = {
  spellID = 106832,
  name = "Thrash",
  slug = "thrash",
  max_range = 5,
}

classData.spells[106839] = {
  spellID = 106839,
  name = "Skull Bash",
  slug = "skull_bash",
  max_range = 13,
  cooldown = 15.0,
}

classData.spells[106898] = {
  spellID = 106898,
  name = "Stampeding Roar",
  slug = "stampeding_roar",
  max_range = 10,
  gcd = 1.5,
  cooldown = 120.0,
  duration = 8.0,
}

classData.spells[106951] = {
  spellID = 106951,
  name = "Berserk",
  slug = "berserk",
  gcd = 1.0,
  cooldown = 180.0,
  duration = 15.0,
}

classData.spells[107059] = {
  spellID = 107059,
  name = "Glyph of the Ursol Chameleon",
  slug = "glyph_of_the_ursol_chameleon",
}

classData.spells[108238] = {
  spellID = 108238,
  name = "Renewal",
  slug = "renewal",
  cooldown = 90.0,
}

classData.spells[108299] = {
  spellID = 108299,
  name = "Killer Instinct",
  slug = "killer_instinct",
}

classData.spells[113043] = {
  spellID = 113043,
  name = "Omen of Clarity",
  slug = "omen_of_clarity",
}

classData.spells[113636] = {
  spellID = 113636,
  name = "Cat Form",
  slug = "cat_form",
}

classData.spells[114107] = {
  spellID = 114107,
  name = "Soul of the Forest",
  slug = "soul_of_the_forest",
}

classData.spells[114108] = {
  spellID = 114108,
  name = "Soul of the Forest",
  slug = "soul_of_the_forest",
  initial_stacks = 1,
  duration = 15.0,
}

classData.spells[114282] = {
  spellID = 114282,
  name = "Treant Form",
  slug = "treant_form",
  gcd = 1.5,
}

classData.spells[114301] = {
  spellID = 114301,
  name = "Glyph of Stars",
  slug = "glyph_of_stars",
}

classData.spells[114333] = {
  spellID = 114333,
  name = "Glyph of the Orca",
  slug = "glyph_of_the_orca",
}

classData.spells[117679] = {
  spellID = 117679,
  name = "Incarnation",
  slug = "incarnation",
  duration = 30.0,
}

classData.spells[122114] = {
  spellID = 122114,
  name = "Chosen of Elune",
  slug = "chosen_of_elune",
}

classData.spells[124974] = {
  spellID = 124974,
  name = "Nature's Vigil",
  slug = "natures_vigil",
  cooldown = 90.0,
  duration = 30.0,
}

classData.spells[124988] = {
  spellID = 124988,
  name = "Nature's Vigil",
  slug = "natures_vigil",
  max_range = 40,
}

classData.spells[124991] = {
  spellID = 124991,
  name = "Nature's Vigil",
  slug = "natures_vigil",
  max_range = 40,
}

classData.spells[125972] = {
  spellID = 125972,
  name = "Feline Grace",
  slug = "feline_grace",
}

classData.spells[127757] = {
  spellID = 127757,
  name = "Charm Woodland Creature",
  slug = "charm_woodland_creature",
  max_range = 40,
  duration = 3600.0,
}

classData.spells[131113] = {
  spellID = 131113,
  name = "Glyph of the Cheetah",
  slug = "glyph_of_the_cheetah",
}

classData.spells[131151] = {
  spellID = 131151,
  name = "The Cheetah",
  slug = "the_cheetah",
}

classData.spells[131768] = {
  spellID = 131768,
  name = "Feline Swiftness",
  slug = "feline_swiftness",
}

classData.spells[132213] = {
  spellID = 132213,
  name = "Visual Effect: Tree of Life",
  slug = "visual_effect_tree_of_life",
}

classData.spells[132469] = {
  spellID = 132469,
  name = "Typhoon",
  slug = "typhoon",
  max_range = 15,
  gcd = 1.5,
  cooldown = 30.0,
}

classData.spells[135700] = {
  spellID = 135700,
  name = "Clearcasting",
  slug = "clearcasting",
  max_range = 100,
  initial_stacks = 1,
  max_stacks = 1,
  duration = 15.0,
}

classData.spells[137009] = {
  spellID = 137009,
  name = "Druid",
  slug = "druid",
}

classData.spells[137010] = {
  spellID = 137010,
  name = "Guardian Druid",
  slug = "guardian_druid",
}

classData.spells[137011] = {
  spellID = 137011,
  name = "Feral Druid",
  slug = "feral_druid",
}

classData.spells[137012] = {
  spellID = 137012,
  name = "Restoration Druid",
  slug = "restoration_druid",
}

classData.spells[137013] = {
  spellID = 137013,
  name = "Balance Druid",
  slug = "balance_druid",
}

classData.spells[137542] = {
  spellID = 137542,
  name = "Charged Bolt",
  slug = "charged_bolt",
  max_range = 10,
}

classData.spells[138284] = {
  spellID = 138284,
  name = "Item - Druid T15 Restoration 2P Bonus",
  slug = "item__druid_t15_restoration_2p_bonus",
}

classData.spells[144841] = {
  spellID = 144841,
  name = "Item - Druid T16 Feral 4P Bonus",
  slug = "item__druid_t16_feral_4p_bonus",
}

classData.spells[145108] = {
  spellID = 145108,
  name = "Ysera's Gift",
  slug = "yseras_gift",
  max_range = 100,
}

classData.spells[145109] = {
  spellID = 145109,
  name = "Ysera's Gift",
  slug = "yseras_gift",
}

classData.spells[145110] = {
  spellID = 145110,
  name = "Ysera's Gift",
  slug = "yseras_gift",
  max_range = 30,
}

classData.spells[145152] = {
  spellID = 145152,
  name = "Bloodtalons",
  slug = "bloodtalons",
  initial_stacks = 2,
  max_stacks = 1,
  duration = 30.0,
  internal_cooldown = 0.1,
}

classData.spells[145205] = {
  spellID = 145205,
  name = "Efflorescence",
  slug = "efflorescence",
  max_range = 40,
  gcd = 1.5,
  duration = 30.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[146874] = {
  spellID = 146874,
  name = "Feral Rage",
  slug = "feral_rage",
  max_range = 70,
  initial_stacks = 1,
  max_stacks = 1,
  duration = 12.0,
}

classData.spells[155578] = {
  spellID = 155578,
  name = "Guardian of Elune",
  slug = "guardian_of_elune",
}

classData.spells[155580] = {
  spellID = 155580,
  name = "Lunar Inspiration",
  slug = "lunar_inspiration",
}

classData.spells[155625] = {
  spellID = 155625,
  name = "Moonfire",
  slug = "moonfire",
  max_range = 40,
  gcd = 1.0,
  duration = 14.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "energy", amount = 30, },
  },
}

classData.spells[155627] = {
  spellID = 155627,
  name = "Lunar Inspiration",
  slug = "lunar_inspiration",
}

classData.spells[155672] = {
  spellID = 155672,
  name = "Bloodtalons",
  slug = "bloodtalons",
}

classData.spells[155675] = {
  spellID = 155675,
  name = "Germination",
  slug = "germination",
}

classData.spells[155722] = {
  spellID = 155722,
  name = "Rake",
  slug = "rake",
  max_range = 100,
  duration = 15.0,
  haste_affected_ticks = true,
}

classData.spells[155783] = {
  spellID = 155783,
  name = "Mastery: Nature's Guardian",
  slug = "mastery_natures_guardian",
}

classData.spells[155835] = {
  spellID = 155835,
  name = "Bristling Fur",
  slug = "bristling_fur",
  gcd = 1.5,
  cooldown = 40.0,
  duration = 8.0,
}

classData.spells[157447] = {
  spellID = 157447,
  name = "Critical Strikes",
  slug = "critical_strikes",
}

classData.spells[157982] = {
  spellID = 157982,
  name = "Tranquility",
  slug = "tranquility",
  max_range = 40,
  max_stacks = 5,
  duration = 8.0,
}

classData.spells[158476] = {
  spellID = 158476,
  name = "Soul of the Forest",
  slug = "soul_of_the_forest",
}

classData.spells[158477] = {
  spellID = 158477,
  name = "Soul of the Forest",
  slug = "soul_of_the_forest",
}

classData.spells[158478] = {
  spellID = 158478,
  name = "Soul of the Forest",
  slug = "soul_of_the_forest",
}

classData.spells[158792] = {
  spellID = 158792,
  name = "Pulverize",
  slug = "pulverize",
  duration = 20.0,
}

classData.spells[159195] = {
  spellID = 159195,
  name = "Mastery: Nature's Guardian",
  slug = "mastery_natures_guardian",
}

classData.spells[159286] = {
  spellID = 159286,
  name = "Primal Fury",
  slug = "primal_fury",
  internal_cooldown = 0.9,
}

classData.spells[159456] = {
  spellID = 159456,
  name = "Travel Form",
  slug = "travel_form",
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

classData.spells[163505] = {
  spellID = 163505,
  name = "Rake",
  slug = "rake",
  max_range = 50000,
  duration = 4.0,
}

classData.spells[164545] = {
  spellID = 164545,
  name = "Solar Empowerment",
  slug = "solar_empowerment",
  initial_stacks = 1,
  max_stacks = 1,
  duration = 40.0,
}

classData.spells[164547] = {
  spellID = 164547,
  name = "Lunar Empowerment",
  slug = "lunar_empowerment",
  initial_stacks = 1,
  max_stacks = 1,
  duration = 40.0,
}

classData.spells[164812] = {
  spellID = 164812,
  name = "Moonfire",
  slug = "moonfire",
  max_range = 100,
  duration = 16.0,
  haste_affected_ticks = true,
}

classData.spells[164815] = {
  spellID = 164815,
  name = "Sunfire",
  slug = "sunfire",
  max_range = 100,
  duration = 12.0,
  haste_affected_ticks = true,
}

classData.spells[164862] = {
  spellID = 164862,
  name = "Flap",
  slug = "flap",
  gcd = 0.5,
  duration = 15.0,
  channeled = true,
}

classData.spells[165962] = {
  spellID = 165962,
  name = "Flight Form",
  slug = "flight_form",
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[168877] = {
  spellID = 168877,
  name = "Maim",
  slug = "maim",
  max_range = 5,
  gcd = 1.0,
  cooldown = 10.0,
  power = {
    [1] = { resource = "energy", amount = 35, },
  },
}

classData.spells[168878] = {
  spellID = 168878,
  name = "Maim",
  slug = "maim",
  max_range = 5,
  gcd = 1.0,
  cooldown = 10.0,
  power = {
    [1] = { resource = "energy", amount = 35, },
  },
}

classData.spells[168879] = {
  spellID = 168879,
  name = "Maim",
  slug = "maim",
  max_range = 5,
  gcd = 1.0,
  cooldown = 10.0,
  power = {
    [1] = { resource = "energy", amount = 35, },
  },
}

classData.spells[168880] = {
  spellID = 168880,
  name = "Maim",
  slug = "maim",
  max_range = 5,
  gcd = 1.0,
  cooldown = 10.0,
  power = {
    [1] = { resource = "energy", amount = 35, },
  },
}

classData.spells[168881] = {
  spellID = 168881,
  name = "Maim",
  slug = "maim",
  max_range = 5,
  gcd = 1.0,
  cooldown = 10.0,
  power = {
    [1] = { resource = "energy", amount = 35, },
  },
}

classData.spells[171803] = {
  spellID = 171803,
  name = "Glyph of the Sun",
  slug = "glyph_of_the_sun",
}

classData.spells[171891] = {
  spellID = 171891,
  name = "The Sun",
  slug = "the_sun",
  cooldown = 1.5,
}

classData.spells[175682] = {
  spellID = 175682,
  name = "Nature's Control",
  slug = "natures_control",
  gcd = 1.5,
}

classData.spells[184878] = {
  spellID = 184878,
  name = "Stalwart Guardian",
  slug = "stalwart_guardian",
}

classData.spells[185321] = {
  spellID = 185321,
  name = "Stalwart Guardian",
  slug = "stalwart_guardian",
  max_range = 5,
}

classData.spells[187875] = {
  spellID = 187875,
  name = "Item - Druid T18 Balance 2P Bonus",
  slug = "item__druid_t18_balance_2p_bonus",
}

classData.spells[188046] = {
  spellID = 188046,
  name = "Fey Missile",
  slug = "fey_missile",
  max_range = 40,
  gcd = 0.5,
}

classData.spells[188083] = {
  spellID = 188083,
  name = "Fey Moonwing",
  slug = "fey_moonwing",
  duration = 30.0,
}

classData.spells[189800] = {
  spellID = 189800,
  name = "Nature's Essence",
  slug = "natures_essence",
  max_range = 100,
}

classData.spells[189853] = {
  spellID = 189853,
  name = "Dreamwalker",
  slug = "dreamwalker",
  max_range = 100,
}

classData.spells[190984] = {
  spellID = 190984,
  name = "Solar Wrath",
  slug = "solar_wrath",
  max_range = 40,
  gcd = 1.5,
}

classData.spells[191034] = {
  spellID = 191034,
  name = "Starfall",
  slug = "starfall",
  max_range = 40,
  gcd = 1.5,
  duration = 8.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "astral_power", amount = 60, },
  },
}

classData.spells[191037] = {
  spellID = 191037,
  name = "Starfall",
  slug = "starfall",
  max_range = 50000,
}

classData.spells[192081] = {
  spellID = 192081,
  name = "Ironfur",
  slug = "ironfur",
  max_stacks = 1,
  cooldown = 0.5,
  duration = 7.0,
  power = {
    [1] = { resource = "rage", amount = 45, },
  },
}

classData.spells[192090] = {
  spellID = 192090,
  name = "Thrash",
  slug = "thrash",
  max_range = 100,
  max_stacks = 3,
  duration = 15.0,
  haste_affected_ticks = true,
}

classData.spells[193753] = {
  spellID = 193753,
  name = "Dreamwalk",
  slug = "dreamwalk",
  gcd = 1.5,
  cooldown = 60.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[194153] = {
  spellID = 194153,
  name = "Lunar Strike",
  slug = "lunar_strike",
  max_range = 40,
  gcd = 1.5,
}

classData.spells[194223] = {
  spellID = 194223,
  name = "Celestial Alignment",
  slug = "celestial_alignment",
  gcd = 1.5,
  cooldown = 180.0,
  duration = 15.0,
}

classData.spells[197061] = {
  spellID = 197061,
  name = "Stonebark",
  slug = "stonebark",
}

classData.spells[197073] = {
  spellID = 197073,
  name = "Inner Peace",
  slug = "inner_peace",
}

classData.spells[197488] = {
  spellID = 197488,
  name = "Balance Affinity",
  slug = "balance_affinity",
}

classData.spells[197490] = {
  spellID = 197490,
  name = "Feral Affinity",
  slug = "feral_affinity",
}

classData.spells[197491] = {
  spellID = 197491,
  name = "Guardian Affinity",
  slug = "guardian_affinity",
}

classData.spells[197492] = {
  spellID = 197492,
  name = "Restoration Affinity",
  slug = "restoration_affinity",
}

classData.spells[197524] = {
  spellID = 197524,
  name = "Astral Influence",
  slug = "astral_influence",
}

classData.spells[197625] = {
  spellID = 197625,
  name = "Moonkin Form",
  slug = "moonkin_form",
  gcd = 1.5,
}

classData.spells[197626] = {
  spellID = 197626,
  name = "Starsurge",
  slug = "starsurge",
  max_range = 40,
  gcd = 1.5,
  cooldown = 10.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[197628] = {
  spellID = 197628,
  name = "Lunar Strike",
  slug = "lunar_strike",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[197629] = {
  spellID = 197629,
  name = "Solar Wrath",
  slug = "solar_wrath",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[197630] = {
  spellID = 197630,
  name = "Sunfire",
  slug = "sunfire",
  max_range = 40,
  gcd = 1.5,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[197632] = {
  spellID = 197632,
  name = "Balance Affinity",
  slug = "balance_affinity",
}

classData.spells[197637] = {
  spellID = 197637,
  name = "Stellar Empowerment",
  slug = "stellar_empowerment",
  max_range = 50000,
  duration = 1.5,
}

classData.spells[197692] = {
  spellID = 197692,
  name = "Feral Overrides Passive",
  slug = "feral_overrides_passive",
}

classData.spells[197721] = {
  spellID = 197721,
  name = "Flourish",
  slug = "flourish",
  gcd = 1.5,
  cooldown = 90.0,
  duration = 8.0,
}

classData.spells[197911] = {
  spellID = 197911,
  name = "Astral Power",
  slug = "astral_power",
}

classData.spells[200383] = {
  spellID = 200383,
  name = "Prosperity",
  slug = "prosperity",
}

classData.spells[200389] = {
  spellID = 200389,
  name = "Cultivation",
  slug = "cultivation",
  max_range = 100,
  duration = 6.0,
  haste_affected_ticks = true,
}

classData.spells[200390] = {
  spellID = 200390,
  name = "Cultivation",
  slug = "cultivation",
}

classData.spells[200749] = {
  spellID = 200749,
  name = "Activating Specialization",
  slug = "activating_specialization",
  max_range = 50000,
  channeled = true,
}

classData.spells[200851] = {
  spellID = 200851,
  name = "Rage of the Sleeper",
  slug = "rage_of_the_sleeper",
  cooldown = 90.0,
  duration = 10.0,
}

classData.spells[202021] = {
  spellID = 202021,
  name = "Predator",
  slug = "predator",
}

classData.spells[202022] = {
  spellID = 202022,
  name = "Blood Scent",
  slug = "blood_scent",
}

classData.spells[202028] = {
  spellID = 202028,
  name = "Brutal Slash",
  slug = "brutal_slash",
  max_range = 8,
  charges = 3,
  charge_cooldown = 10.0,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 30, },
  },
}

classData.spells[202031] = {
  spellID = 202031,
  name = "Sabertooth",
  slug = "sabertooth",
}

classData.spells[202032] = {
  spellID = 202032,
  name = "Jagged Wounds",
  slug = "jagged_wounds",
}

classData.spells[202085] = {
  spellID = 202085,
  name = "Enraged Mangle",
  slug = "enraged_mangle",
  max_range = 5,
  gcd = 1.5,
  power = {
    [1] = { resource = "rage", amount = 15, },
  },
}

classData.spells[202155] = {
  spellID = 202155,
  name = "Feral Affinity",
  slug = "feral_affinity",
}

classData.spells[202157] = {
  spellID = 202157,
  name = "Feral Affinity",
  slug = "feral_affinity",
}

classData.spells[202342] = {
  spellID = 202342,
  name = "Shooting Stars",
  slug = "shooting_stars",
}

classData.spells[202345] = {
  spellID = 202345,
  name = "Starlord",
  slug = "starlord",
}

classData.spells[202347] = {
  spellID = 202347,
  name = "Stellar Flare",
  slug = "stellar_flare",
  max_range = 40,
  gcd = 1.5,
  duration = 24.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "astral_power", amount = 10, },
  },
}

classData.spells[202354] = {
  spellID = 202354,
  name = "Stellar Drift",
  slug = "stellar_drift",
}

classData.spells[202360] = {
  spellID = 202360,
  name = "Blessing of the Ancients",
  slug = "blessing_of_the_ancients",
  cooldown = 15.0,
}

classData.spells[202425] = {
  spellID = 202425,
  name = "Warrior of Elune",
  slug = "warrior_of_elune",
  initial_stacks = 1,
  max_stacks = 3,
  cooldown = 45.0,
}

classData.spells[202430] = {
  spellID = 202430,
  name = "Nature's Balance",
  slug = "natures_balance",
}

classData.spells[202497] = {
  spellID = 202497,
  name = "Shooting Stars",
  slug = "shooting_stars",
  max_range = 50000,
}

classData.spells[202737] = {
  spellID = 202737,
  name = "Blessing of Elune",
  slug = "blessing_of_elune",
}

classData.spells[202739] = {
  spellID = 202739,
  name = "Blessing of An'she",
  slug = "blessing_of_anshe",
  haste_affected_ticks = true,
}

classData.spells[202767] = {
  spellID = 202767,
  name = "New Moon",
  slug = "new_moon",
  max_range = 40,
  charges = 3,
  charge_cooldown = 15.0,
  gcd = 1.5,
}

classData.spells[202768] = {
  spellID = 202768,
  name = "Half Moon",
  slug = "half_moon",
  max_range = 40,
  charges = 3,
  charge_cooldown = 15.0,
  gcd = 1.5,
}

classData.spells[202770] = {
  spellID = 202770,
  name = "Fury of Elune",
  slug = "fury_of_elune",
  max_range = 40,
  gcd = 1.5,
  cooldown = 90.0,
  duration = 8.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "astral_power", amount = 80, },
  },
}

classData.spells[202771] = {
  spellID = 202771,
  name = "Full Moon",
  slug = "full_moon",
  max_range = 40,
  charges = 3,
  charge_cooldown = 15.0,
  gcd = 1.5,
}

classData.spells[203001] = {
  spellID = 203001,
  name = "Goldrinn's Fang",
  slug = "goldrinns_fang",
  max_range = 60,
}

classData.spells[203018] = {
  spellID = 203018,
  name = "Touch of the Moon",
  slug = "touch_of_the_moon",
  internal_cooldown = 20.0,
}

classData.spells[203953] = {
  spellID = 203953,
  name = "Brambles",
  slug = "brambles",
}

classData.spells[203958] = {
  spellID = 203958,
  name = "Brambles",
  slug = "brambles",
  max_range = 100,
}

classData.spells[203961] = {
  spellID = 203961,
  name = "Blood Frenzy",
  slug = "blood_frenzy",
}

classData.spells[203962] = {
  spellID = 203962,
  name = "Blood Frenzy",
  slug = "blood_frenzy",
}

classData.spells[203964] = {
  spellID = 203964,
  name = "Galactic Guardian",
  slug = "galactic_guardian",
  internal_cooldown = 2.0,
}

classData.spells[203965] = {
  spellID = 203965,
  name = "Survival of the Fittest",
  slug = "survival_of_the_fittest",
}

classData.spells[203974] = {
  spellID = 203974,
  name = "Earthwarden",
  slug = "earthwarden",
}

classData.spells[203975] = {
  spellID = 203975,
  name = "Earthwarden",
  slug = "earthwarden",
  max_stacks = 3,
}

classData.spells[204053] = {
  spellID = 204053,
  name = "Rend and Tear",
  slug = "rend_and_tear",
}

classData.spells[204066] = {
  spellID = 204066,
  name = "Lunar Beam",
  slug = "lunar_beam",
  max_range = 40,
  gcd = 1.5,
  cooldown = 75.0,
  duration = 8.5,
}

classData.spells[204069] = {
  spellID = 204069,
  name = "Lunar Beam",
  slug = "lunar_beam",
  max_range = 100,
}

classData.spells[205636] = {
  spellID = 205636,
  name = "Force of Nature",
  slug = "force_of_nature",
  max_range = 40,
  gcd = 1.5,
  cooldown = 60.0,
}

classData.spells[207383] = {
  spellID = 207383,
  name = "Abundance",
  slug = "abundance",
}

classData.spells[207385] = {
  spellID = 207385,
  name = "Spring Blossoms",
  slug = "spring_blossoms",
}

classData.spells[207386] = {
  spellID = 207386,
  name = "Spring Blossoms",
  slug = "spring_blossoms",
  max_range = 100,
  duration = 6.0,
}

classData.spells[207640] = {
  spellID = 207640,
  name = "Abundance",
  slug = "abundance",
  max_stacks = 100,
  duration = 30.0,
}

classData.spells[208253] = {
  spellID = 208253,
  name = "Essence of G'Hanir",
  slug = "essence_of_ghanir",
  gcd = 1.5,
  cooldown = 90.0,
  duration = 8.0,
}

classData.spells[208681] = {
  spellID = 208681,
  name = "Luffa Wrappings",
  slug = "luffa_wrappings",
}

classData.spells[209405] = {
  spellID = 209405,
  name = "Oneth's Intuition",
  slug = "oneths_intuition",
}

classData.spells[209406] = {
  spellID = 209406,
  name = "Oneth's Intuition",
  slug = "oneths_intuition",
}

classData.spells[209407] = {
  spellID = 209407,
  name = "Oneth's Overconfidence",
  slug = "oneths_overconfidence",
}

classData.spells[210053] = {
  spellID = 210053,
  name = "Stag Form",
  slug = "stag_form",
  gcd = 1.5,
}

classData.spells[210631] = {
  spellID = 210631,
  name = "Feral Instinct",
  slug = "feral_instinct",
  max_range = 100,
}

classData.spells[210649] = {
  spellID = 210649,
  name = "Feral Instinct",
  slug = "feral_instinct",
  max_range = 100,
  duration = 15.0,
}

classData.spells[210650] = {
  spellID = 210650,
  name = "Protection of Ashamane",
  slug = "protection_of_ashamane",
  max_range = 100,
}

classData.spells[210655] = {
  spellID = 210655,
  name = "Protection of Ashamane",
  slug = "protection_of_ashamane",
  max_range = 100,
  duration = 5.0,
}

classData.spells[210687] = {
  spellID = 210687,
  name = "Shadow Thrash",
  slug = "shadow_thrash",
  max_range = 100,
}

classData.spells[210702] = {
  spellID = 210702,
  name = "Ashamane's Bite",
  slug = "ashamanes_bite",
  max_range = 100,
}

classData.spells[210705] = {
  spellID = 210705,
  name = "Ashamane's Rip",
  slug = "ashamanes_rip",
  max_range = 100,
  duration = 24.0,
}

classData.spells[210706] = {
  spellID = 210706,
  name = "Gore",
  slug = "gore",
}

classData.spells[210722] = {
  spellID = 210722,
  name = "Ashamane's Frenzy",
  slug = "ashamanes_frenzy",
  max_range = 5,
  gcd = 1.0,
  cooldown = 75.0,
  duration = 3.0,
}

classData.spells[210723] = {
  spellID = 210723,
  name = "Ashamane's Frenzy",
  slug = "ashamanes_frenzy",
  max_range = 5,
  duration = 6.0,
}

classData.spells[211140] = {
  spellID = 211140,
  name = "Item - Druid T19 Feral 2P Bonus",
  slug = "item__druid_t19_feral_2p_bonus",
}

classData.spells[211141] = {
  spellID = 211141,
  name = "Thrash",
  slug = "thrash",
  max_range = 100,
  max_stacks = 3,
}

classData.spells[211142] = {
  spellID = 211142,
  name = "Item - Druid T19 Feral 4P Bonus",
  slug = "item__druid_t19_feral_4p_bonus",
}

classData.spells[211545] = {
  spellID = 211545,
  name = "Fury of Elune",
  slug = "fury_of_elune",
  max_range = 100,
}

classData.spells[211547] = {
  spellID = 211547,
  name = "Fury of Elune",
  slug = "fury_of_elune",
  max_range = 40,
  cooldown = 0.5,
}

classData.spells[212040] = {
  spellID = 212040,
  name = "Revitalize",
  slug = "revitalize",
  max_range = 100,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[213121] = {
  spellID = 213121,
  name = "Power of the Archdruid",
  slug = "power_of_the_archdruid",
  max_range = 100,
}

classData.spells[213557] = {
  spellID = 213557,
  name = "Protection of Ashamane",
  slug = "protection_of_ashamane",
  max_range = 100,
  duration = 30.0,
}

classData.spells[213672] = {
  spellID = 213672,
  name = "Touch of the Moon",
  slug = "touch_of_the_moon",
  max_range = 40,
}

classData.spells[213680] = {
  spellID = 213680,
  name = "Guardian of Elune",
  slug = "guardian_of_elune",
  initial_stacks = 1,
  duration = 15.0,
}

classData.spells[213708] = {
  spellID = 213708,
  name = "Galactic Guardian",
  slug = "galactic_guardian",
  max_range = 100,
  initial_stacks = 1,
  duration = 15.0,
}

classData.spells[213709] = {
  spellID = 213709,
  name = "Brambles",
  slug = "brambles",
  max_range = 100,
}

classData.spells[213764] = {
  spellID = 213764,
  name = "Swipe",
  slug = "swipe",
  max_range = 8,
  gcd = 1.0,
}

classData.spells[213771] = {
  spellID = 213771,
  name = "Swipe",
  slug = "swipe",
  max_range = 8,
  gcd = 1.5,
}

classData.spells[214274] = {
  spellID = 214274,
  name = "Protection of Ashamane",
  slug = "protection_of_ashamane",
  max_range = 100,
  duration = 30.0,
}

classData.spells[217615] = {
  spellID = 217615,
  name = "Guardian Affinity",
  slug = "guardian_affinity",
}

classData.spells[218889] = {
  spellID = 218889,
  name = "Essence of G'Hanir",
  slug = "essence_of_ghanir",
}

classData.spells[219432] = {
  spellID = 219432,
  name = "Rage of the Sleeper",
  slug = "rage_of_the_sleeper",
  max_range = 100,
}

classData.spells[224392] = {
  spellID = 224392,
  name = "Mark of Shifting",
  slug = "mark_of_shifting",
  max_range = 100,
  gcd = 1.5,
}

classData.spells[226104] = {
  spellID = 226104,
  name = "Echoing Stars",
  slug = "echoing_stars",
  max_range = 50000,
}

classData.spells[227034] = {
  spellID = 227034,
  name = "Nature's Guardian",
  slug = "natures_guardian",
}

classData.spells[228545] = {
  spellID = 228545,
  name = "Shapeshift Form",
  slug = "shapeshift_form",
}

classData.spells[231021] = {
  spellID = 231021,
  name = "Starsurge",
  slug = "starsurge",
}

classData.spells[231040] = {
  spellID = 231040,
  name = "Rejuvenation",
  slug = "rejuvenation",
}

classData.spells[231042] = {
  spellID = 231042,
  name = "Moonkin Form",
  slug = "moonkin_form",
}

classData.spells[231049] = {
  spellID = 231049,
  name = "Starfall",
  slug = "starfall",
}

classData.spells[231050] = {
  spellID = 231050,
  name = "Sunfire",
  slug = "sunfire",
}

classData.spells[231052] = {
  spellID = 231052,
  name = "Rake",
  slug = "rake",
}

classData.spells[231055] = {
  spellID = 231055,
  name = "Tiger's Fury",
  slug = "tigers_fury",
}

classData.spells[231056] = {
  spellID = 231056,
  name = "Ferocious Bite",
  slug = "ferocious_bite",
}

classData.spells[231057] = {
  spellID = 231057,
  name = "Shred",
  slug = "shred",
}

classData.spells[231063] = {
  spellID = 231063,
  name = "Shred",
  slug = "shred",
}

classData.spells[231064] = {
  spellID = 231064,
  name = "Mangle",
  slug = "mangle",
}

classData.spells[231065] = {
  spellID = 231065,
  name = "Lightning Reflexes",
  slug = "lightning_reflexes",
}

classData.spells[231070] = {
  spellID = 231070,
  name = "Ironfur",
  slug = "ironfur",
}

classData.spells[231283] = {
  spellID = 231283,
  name = "Swipe",
  slug = "swipe",
}

classData.spells[231437] = {
  spellID = 231437,
  name = "Archdruid's Lunarwing Form",
  slug = "archdruids_lunarwing_form",
}

classData.spells[236068] = {
  spellID = 236068,
  name = "Moment of Clarity",
  slug = "moment_of_clarity",
}

classData.spells[236716] = {
  spellID = 236716,
  name = "Enraged Maul",
  slug = "enraged_maul",
  max_range = 5,
  gcd = 1.5,
  power = {
    [1] = { resource = "rage", amount = 20, },
  },
}

classData.spells[236748] = {
  spellID = 236748,
  name = "Intimidating Roar",
  slug = "intimidating_roar",
  gcd = 1.5,
  cooldown = 30.0,
  duration = 3.0,
}

classData.spells[248280] = {
  spellID = 248280,
  name = "Force of Nature",
  slug = "force_of_nature",
  max_range = 40,
  duration = 10.0,
}

classData.spells[251463] = {
  spellID = 251463,
  name = "Vindicaar Matrix Crystal",
  slug = "vindicaar_matrix_crystal",
  gcd = 1.5,
}

classData.spells[251789] = {
  spellID = 251789,
  name = "Item - Druid  T21 Feral 2P Bonus",
  slug = "item__druid__t21_feral_2p_bonus",
}

classData.spells[252071] = {
  spellID = 252071,
  name = "Jungle Stalker",
  slug = "jungle_stalker",
  duration = 30.0,
}

classData.spells[252216] = {
  spellID = 252216,
  name = "Tiger Dash",
  slug = "tiger_dash",
  gcd = 1.5,
  cooldown = 45.0,
  duration = 4.0,
}

classData.spells[252750] = {
  spellID = 252750,
  name = "Bloody Gash",
  slug = "bloody_gash",
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

classData.spells[270100] = {
  spellID = 270100,
  name = "Bear Form",
  slug = "bear_form",
}

classData.spells[273048] = {
  spellID = 273048,
  name = "Frenzied Regeneration",
  slug = "frenzied_regeneration",
}

classData.spells[274281] = {
  spellID = 274281,
  name = "New Moon",
  slug = "new_moon",
  max_range = 40,
  charges = 3,
  charge_cooldown = 30.0,
  gcd = 1.0,
}

classData.spells[274282] = {
  spellID = 274282,
  name = "Half Moon",
  slug = "half_moon",
  max_range = 40,
  charges = 3,
  charge_cooldown = 30.0,
  gcd = 1.5,
}

classData.spells[274283] = {
  spellID = 274283,
  name = "Full Moon",
  slug = "full_moon",
  max_range = 40,
  charges = 3,
  charge_cooldown = 30.0,
  gcd = 1.5,
}

classData.spells[274837] = {
  spellID = 274837,
  name = "Feral Frenzy",
  slug = "feral_frenzy",
  max_range = 5,
  gcd = 1.0,
  cooldown = 45.0,
  duration = 1.0,
  power = {
    [1] = { resource = "energy", amount = 25, },
  },
}

classData.spells[274838] = {
  spellID = 274838,
  name = "Feral Frenzy",
  slug = "feral_frenzy",
  max_range = 5,
  duration = 6.0,
  haste_affected_ticks = true,
}

classData.spells[274902] = {
  spellID = 274902,
  name = "Photosynthesis",
  slug = "photosynthesis",
}
