----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BfA only.
----------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(4, GetBuildInfo()) < 80000 then
    return
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Class check
----------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(3, UnitClass('player')) ~= 5 then return end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
local addonName, TJ = ...
TJ.ClassData = TJ.ClassData or {}
TJ.ClassData[5] = TJ.ClassData[5] or {}
local classData = TJ.ClassData[5]
classData.spells = classData.spells or {}

classData.spells[17] = {
  spellID = 17,
  name = "Power Word: Shield",
  slug = "power_word_shield",
  max_range = 40,
  gcd = 1.5,
  duration = 15.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[139] = {
  spellID = 139,
  name = "Renew",
  slug = "renew",
  max_range = 40,
  gcd = 1.5,
  duration = 15.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[527] = {
  spellID = 527,
  name = "Purify",
  slug = "purify",
  max_range = 40,
  charges = 1,
  charge_cooldown = 8.0,
  gcd = 1.5,
  cooldown = 8.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[528] = {
  spellID = 528,
  name = "Dispel Magic",
  slug = "dispel_magic",
  max_range = 30,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[585] = {
  spellID = 585,
  name = "Smite",
  slug = "smite",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, aura = 137032, },
  },
}

classData.spells[586] = {
  spellID = 586,
  name = "Fade",
  slug = "fade",
  cooldown = 30.0,
  duration = 10.0,
}

classData.spells[589] = {
  spellID = 589,
  name = "Shadow Word: Pain",
  slug = "shadow_word_pain",
  max_range = 40,
  gcd = 1.5,
  duration = 16.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, aura = 137032, },
  },
}

classData.spells[596] = {
  spellID = 596,
  name = "Prayer of Healing",
  slug = "prayer_of_healing",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[605] = {
  spellID = 605,
  name = "Mind Control",
  slug = "mind_control",
  max_range = 30,
  gcd = 1.5,
  duration = 30.0,
  channeled = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[1706] = {
  spellID = 1706,
  name = "Levitate",
  slug = "levitate",
  max_range = 30,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, aura = 137032, },
    [2] = { resource = "mana", amount = 0, aura = 137031, },
  },
}

classData.spells[2050] = {
  spellID = 2050,
  name = "Holy Word: Serenity",
  slug = "holy_word_serenity",
  max_range = 40,
  charges = 1,
  charge_cooldown = 60.0,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[2060] = {
  spellID = 2060,
  name = "Heal",
  slug = "heal",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[2061] = {
  spellID = 2061,
  name = "Flash Heal",
  slug = "flash_heal",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[2096] = {
  spellID = 2096,
  name = "Mind Vision",
  slug = "mind_vision",
  max_range = 50000,
  gcd = 1.5,
  duration = 60.0,
  channeled = true,
  power = {
    [1] = { resource = "mana", amount = 0, aura = 87336, },
  },
}

classData.spells[5019] = {
  spellID = 5019,
  name = "Shoot",
  slug = "shoot",
  max_range = 30,
  gcd = 1.5,
}

classData.spells[8092] = {
  spellID = 8092,
  name = "Mind Blast",
  slug = "mind_blast",
  max_range = 40,
  charges = 1,
  charge_cooldown = 7.5,
  gcd = 1.5,
}

classData.spells[8122] = {
  spellID = 8122,
  name = "Psychic Scream",
  slug = "psychic_scream",
  gcd = 1.5,
  cooldown = 60.0,
  duration = 8.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[9484] = {
  spellID = 9484,
  name = "Shackle Undead",
  slug = "shackle_undead",
  max_range = 30,
  gcd = 1.5,
  duration = 50.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[14914] = {
  spellID = 14914,
  name = "Holy Fire",
  slug = "holy_fire",
  max_range = 40,
  max_stacks = 1,
  gcd = 1.5,
  cooldown = 10.0,
  duration = 7.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[15286] = {
  spellID = 15286,
  name = "Vampiric Embrace",
  slug = "vampiric_embrace",
  gcd = 1.5,
  cooldown = 120.0,
  duration = 15.0,
}

classData.spells[15407] = {
  spellID = 15407,
  name = "Mind Flay",
  slug = "mind_flay",
  replaces_spell_id = 585,
  max_range = 40,
  gcd = 1.5,
  duration = 3.0,
  channeled = true,
  haste_affected_ticks = true,
}

classData.spells[15487] = {
  spellID = 15487,
  name = "Silence",
  slug = "silence",
  max_range = 30,
  cooldown = 45.0,
  duration = 4.0,
}

classData.spells[19236] = {
  spellID = 19236,
  name = "Desperate Prayer",
  slug = "desperate_prayer",
  cooldown = 90.0,
  duration = 10.0,
}

classData.spells[20591] = {
  spellID = 20591,
  name = "Expansive Mind",
  slug = "expansive_mind",
}

classData.spells[20711] = {
  spellID = 20711,
  name = "Spirit of Redemption",
  slug = "spirit_of_redemption",
}

classData.spells[21562] = {
  spellID = 21562,
  name = "Power Word: Fortitude",
  slug = "power_word_fortitude",
  max_range = 40,
  gcd = 1.5,
  duration = 3600.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[21563] = {
  spellID = 21563,
  name = "Command",
  slug = "command",
}

classData.spells[27827] = {
  spellID = 27827,
  name = "Spirit of Redemption",
  slug = "spirit_of_redemption",
  duration = 15.0,
}

classData.spells[28516] = {
  spellID = 28516,
  name = "Sunwell Torrent",
  slug = "sunwell_torrent",
  max_range = 20,
  gcd = 1.5,
  duration = 5.0,
  channeled = true,
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

classData.spells[32375] = {
  spellID = 32375,
  name = "Mass Dispel",
  slug = "mass_dispel",
  max_range = 30,
  gcd = 1.5,
  cooldown = 45.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[32379] = {
  spellID = 32379,
  name = "Shadow Word: Death",
  slug = "shadow_word_death",
  max_range = 40,
  charges = 2,
  charge_cooldown = 9.0,
  gcd = 1.5,
}

classData.spells[32546] = {
  spellID = 32546,
  name = "Binding Heal",
  slug = "binding_heal",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[32592] = {
  spellID = 32592,
  name = "Mass Dispel",
  slug = "mass_dispel",
  max_range = 30,
}

classData.spells[33076] = {
  spellID = 33076,
  name = "Prayer of Mending",
  slug = "prayer_of_mending",
  max_range = 40,
  gcd = 1.5,
  cooldown = 12.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[33110] = {
  spellID = 33110,
  name = "Prayer of Mending",
  slug = "prayer_of_mending",
  max_range = 50000,
}

classData.spells[33206] = {
  spellID = 33206,
  name = "Pain Suppression",
  slug = "pain_suppression",
  max_range = 40,
  cooldown = 180.0,
  duration = 8.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[34433] = {
  spellID = 34433,
  name = "Shadowfiend",
  slug = "shadowfiend",
  max_range = 40,
  gcd = 1.5,
  cooldown = 180.0,
  duration = 15.0,
}

classData.spells[34861] = {
  spellID = 34861,
  name = "Holy Word: Sanctify",
  slug = "holy_word_sanctify",
  max_range = 40,
  gcd = 1.5,
  cooldown = 60.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[34914] = {
  spellID = 34914,
  name = "Vampiric Touch",
  slug = "vampiric_touch",
  max_range = 40,
  gcd = 1.5,
  duration = 21.0,
  haste_affected_ticks = true,
}

classData.spells[41635] = {
  spellID = 41635,
  name = "Prayer of Mending",
  slug = "prayer_of_mending",
  max_range = 50000,
  max_stacks = 10,
  gcd = 1.5,
  duration = 30.0,
}

classData.spells[45242] = {
  spellID = 45242,
  name = "Focused Will",
  slug = "focused_will",
  max_stacks = 2,
  duration = 8.0,
}

classData.spells[45243] = {
  spellID = 45243,
  name = "Focused Will",
  slug = "focused_will",
}

classData.spells[47536] = {
  spellID = 47536,
  name = "Rapture",
  slug = "rapture",
  gcd = 1.5,
  cooldown = 90.0,
  duration = 10.0,
}

classData.spells[47540] = {
  spellID = 47540,
  name = "Penance",
  slug = "penance",
  max_range = 40,
  gcd = 1.5,
  cooldown = 9.0,
  channeled = true,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[47585] = {
  spellID = 47585,
  name = "Dispersion",
  slug = "dispersion",
  gcd = 1.5,
  cooldown = 120.0,
  duration = 6.0,
}

classData.spells[47666] = {
  spellID = 47666,
  name = "Penance",
  slug = "penance",
  max_range = 40,
}

classData.spells[47750] = {
  spellID = 47750,
  name = "Penance",
  slug = "penance",
  max_range = 40,
}

classData.spells[47755] = {
  spellID = 47755,
  name = "Shield Discipline",
  slug = "shield_discipline",
  max_range = 100,
}

classData.spells[47758] = {
  spellID = 47758,
  name = "Penance",
  slug = "penance",
  max_range = 40,
  duration = 2.0,
  channeled = true,
  haste_affected_ticks = true,
}

classData.spells[47788] = {
  spellID = 47788,
  name = "Guardian Spirit",
  slug = "guardian_spirit",
  max_range = 40,
  cooldown = 180.0,
  duration = 10.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[48045] = {
  spellID = 48045,
  name = "Mind Sear",
  slug = "mind_sear",
  max_range = 40,
  gcd = 1.5,
  duration = 3.0,
  channeled = true,
  haste_affected_ticks = true,
}

classData.spells[49821] = {
  spellID = 49821,
  name = "Mind Sear",
  slug = "mind_sear",
  max_range = 100,
}

classData.spells[57986] = {
  spellID = 57986,
  name = "Glyph of Shackle Undead",
  slug = "glyph_of_shackle_undead",
}

classData.spells[58251] = {
  spellID = 58251,
  name = "Shackle Undead",
  slug = "shackle_undead",
}

classData.spells[59544] = {
  spellID = 59544,
  name = "Gift of the Naaru",
  slug = "gift_of_the_naaru",
  max_range = 40,
  cooldown = 180.0,
  duration = 5.0,
  haste_affected_ticks = true,
}

classData.spells[62618] = {
  spellID = 62618,
  name = "Power Word: Barrier",
  slug = "power_word_barrier",
  max_range = 40,
  gcd = 1.5,
  cooldown = 180.0,
  duration = 10.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[63619] = {
  spellID = 63619,
  name = "Shadowcrawl",
  slug = "shadowcrawl",
  max_range = 30,
  gcd = 1.5,
  cooldown = 6.0,
}

classData.spells[63733] = {
  spellID = 63733,
  name = "Holy Words",
  slug = "holy_words",
}

classData.spells[64044] = {
  spellID = 64044,
  name = "Psychic Horror",
  slug = "psychic_horror",
  max_range = 30,
  gcd = 1.5,
  cooldown = 45.0,
  duration = 4.0,
}

classData.spells[64129] = {
  spellID = 64129,
  name = "Body and Soul",
  slug = "body_and_soul",
  internal_cooldown = 6.0,
}

classData.spells[64843] = {
  spellID = 64843,
  name = "Divine Hymn",
  slug = "divine_hymn",
  max_range = 40,
  gcd = 1.5,
  cooldown = 180.0,
  duration = 8.0,
  channeled = true,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[64844] = {
  spellID = 64844,
  name = "Divine Hymn",
  slug = "divine_hymn",
  max_range = 40,
  duration = 8.0,
}

classData.spells[64901] = {
  spellID = 64901,
  name = "Symbol of Hope",
  slug = "symbol_of_hope",
  max_range = 40,
  gcd = 1.5,
  cooldown = 300.0,
  duration = 6.0,
  channeled = true,
}

classData.spells[65081] = {
  spellID = 65081,
  name = "Body and Soul",
  slug = "body_and_soul",
  max_range = 50000,
  duration = 3.0,
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

classData.spells[72734] = {
  spellID = 72734,
  name = "Mass Dispel",
  slug = "mass_dispel",
}

classData.spells[73325] = {
  spellID = 73325,
  name = "Leap of Faith",
  slug = "leap_of_faith",
  max_range = 40,
  cooldown = 90.0,
  duration = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[73510] = {
  spellID = 73510,
  name = "Mind Spike",
  slug = "mind_spike",
  max_range = 40,
  gcd = 1.5,
}

classData.spells[77485] = {
  spellID = 77485,
  name = "Mastery: Echo of Light",
  slug = "mastery_echo_of_light",
}

classData.spells[77486] = {
  spellID = 77486,
  name = "Mastery: Madness",
  slug = "mastery_madness",
}

classData.spells[77489] = {
  spellID = 77489,
  name = "Echo of Light",
  slug = "echo_of_light",
  max_range = 100,
  duration = 6.0,
}

classData.spells[78203] = {
  spellID = 78203,
  name = "Shadowy Apparitions",
  slug = "shadowy_apparitions",
}

classData.spells[81749] = {
  spellID = 81749,
  name = "Atonement",
  slug = "atonement",
}

classData.spells[81782] = {
  spellID = 81782,
  name = "Power Word: Barrier",
  slug = "power_word_barrier",
  max_range = 50000,
  duration = 12.0,
}

classData.spells[87204] = {
  spellID = 87204,
  name = "Sin and Punishment",
  slug = "sin_and_punishment",
  duration = 3.0,
}

classData.spells[88625] = {
  spellID = 88625,
  name = "Holy Word: Chastise",
  slug = "holy_word_chastise",
  max_range = 30,
  gcd = 1.5,
  cooldown = 60.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[89745] = {
  spellID = 89745,
  name = "Mysticism",
  slug = "mysticism",
}

classData.spells[94293] = {
  spellID = 94293,
  name = "Altered Form",
  slug = "altered_form",
}

classData.spells[94472] = {
  spellID = 94472,
  name = "Atonement",
  slug = "atonement",
  max_range = 50000,
}

classData.spells[98367] = {
  spellID = 98367,
  name = "Prayer of Healing",
  slug = "prayer_of_healing",
  max_range = 50000,
}

classData.spells[107905] = {
  spellID = 107905,
  name = "Shadow",
  slug = "shadow",
}

classData.spells[107906] = {
  spellID = 107906,
  name = "Glyph of Shadow",
  slug = "glyph_of_shadow",
}

classData.spells[109142] = {
  spellID = 109142,
  name = "Twist of Fate",
  slug = "twist_of_fate",
}

classData.spells[109186] = {
  spellID = 109186,
  name = "Surge of Light",
  slug = "surge_of_light",
}

classData.spells[109964] = {
  spellID = 109964,
  name = "Spirit Shell",
  slug = "spirit_shell",
  cooldown = 60.0,
  duration = 10.0,
}

classData.spells[110744] = {
  spellID = 110744,
  name = "Divine Star",
  slug = "divine_star",
  max_range = 30,
  gcd = 1.5,
  cooldown = 15.0,
  duration = 15.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[110745] = {
  spellID = 110745,
  name = "Divine Star",
  slug = "divine_star",
  max_range = 100,
}

classData.spells[111759] = {
  spellID = 111759,
  name = "Levitate",
  slug = "levitate",
  max_range = 30,
  gcd = 1.5,
  duration = 600.0,
}

classData.spells[112660] = {
  spellID = 112660,
  name = "Heavens",
  slug = "heavens",
}

classData.spells[114255] = {
  spellID = 114255,
  name = "Surge of Light",
  slug = "surge_of_light",
  max_stacks = 2,
  duration = 20.0,
}

classData.spells[114908] = {
  spellID = 114908,
  name = "Spirit Shell",
  slug = "spirit_shell",
  max_range = 100,
  duration = 15.0,
}

classData.spells[120517] = {
  spellID = 120517,
  name = "Halo",
  slug = "halo",
  max_range = 30,
  gcd = 1.5,
  cooldown = 40.0,
  duration = 3.2,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[120581] = {
  spellID = 120581,
  name = "Glyph of the Heavens",
  slug = "glyph_of_the_heavens",
}

classData.spells[120692] = {
  spellID = 120692,
  name = "Halo",
  slug = "halo",
  max_range = 100,
}

classData.spells[120696] = {
  spellID = 120696,
  name = "Halo",
  slug = "halo",
  max_range = 100,
}

classData.spells[121536] = {
  spellID = 121536,
  name = "Angelic Feather",
  slug = "angelic_feather",
  max_range = 40,
  charges = 3,
  charge_cooldown = 20.0,
  gcd = 1.5,
}

classData.spells[121557] = {
  spellID = 121557,
  name = "Angelic Feather",
  slug = "angelic_feather",
  max_range = 50000,
  duration = 5.0,
}

classData.spells[122128] = {
  spellID = 122128,
  name = "Divine Star",
  slug = "divine_star",
  max_range = 100,
}

classData.spells[123040] = {
  spellID = 123040,
  name = "Mindbender",
  slug = "mindbender",
  max_range = 40,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 12.0,
}

classData.spells[123051] = {
  spellID = 123051,
  name = "Mana Leech",
  slug = "mana_leech",
  max_range = 50000,
}

classData.spells[123254] = {
  spellID = 123254,
  name = "Twist of Fate",
  slug = "twist_of_fate",
  duration = 8.0,
}

classData.spells[124430] = {
  spellID = 124430,
  name = "Shadowy Insight",
  slug = "shadowy_insight",
  duration = 12.0,
}

classData.spells[126094] = {
  spellID = 126094,
  name = "Glyph of the Val'kyr",
  slug = "glyph_of_the_valkyr",
}

classData.spells[126695] = {
  spellID = 126695,
  name = "The Val'kyr",
  slug = "the_valkyr",
}

classData.spells[126745] = {
  spellID = 126745,
  name = "Glyph of Shadowy Friends",
  slug = "glyph_of_shadowy_friends",
}

classData.spells[126797] = {
  spellID = 126797,
  name = "Shadowy Friends",
  slug = "shadowy_friends",
}

classData.spells[129250] = {
  spellID = 129250,
  name = "Power Word: Solace",
  slug = "power_word_solace",
  max_range = 40,
  gcd = 1.5,
  cooldown = 12.0,
}

classData.spells[131556] = {
  spellID = 131556,
  name = "Sin and Punishment",
  slug = "sin_and_punishment",
}

classData.spells[132157] = {
  spellID = 132157,
  name = "Holy Nova",
  slug = "holy_nova",
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[137030] = {
  spellID = 137030,
  name = "Priest",
  slug = "priest",
}

classData.spells[137031] = {
  spellID = 137031,
  name = "Holy Priest",
  slug = "holy_priest",
}

classData.spells[137032] = {
  spellID = 137032,
  name = "Discipline Priest",
  slug = "discipline_priest",
}

classData.spells[137033] = {
  spellID = 137033,
  name = "Shadow Priest",
  slug = "shadow_priest",
}

classData.spells[147072] = {
  spellID = 147072,
  name = "Glyph of Inspired Hymns",
  slug = "glyph_of_inspired_hymns",
}

classData.spells[147776] = {
  spellID = 147776,
  name = "Glyph of the Sha",
  slug = "glyph_of_the_sha",
}

classData.spells[148071] = {
  spellID = 148071,
  name = "Sha",
  slug = "sha",
}

classData.spells[148074] = {
  spellID = 148074,
  name = "Inspired Hymns",
  slug = "inspired_hymns",
}

classData.spells[148859] = {
  spellID = 148859,
  name = "Shadowy Apparition",
  slug = "shadowy_apparition",
  max_range = 100,
}

classData.spells[155271] = {
  spellID = 155271,
  name = "Auspicious Spirits",
  slug = "auspicious_spirits",
}

classData.spells[155793] = {
  spellID = 155793,
  name = "Prayer of Mending",
  slug = "prayer_of_mending",
  max_range = 50000,
}

classData.spells[161862] = {
  spellID = 161862,
  name = "Ascension",
  slug = "ascension",
  gcd = 1.5,
  cooldown = 90.0,
  duration = 20.0,
}

classData.spells[162452] = {
  spellID = 162452,
  name = "Shadowy Insight",
  slug = "shadowy_insight",
  max_stacks = 2,
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

classData.spells[185916] = {
  spellID = 185916,
  name = "Voidform",
  slug = "voidform",
}

classData.spells[186263] = {
  spellID = 186263,
  name = "Shadow Mend",
  slug = "shadow_mend",
  replaces_spell_id = 2061,
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[186440] = {
  spellID = 186440,
  name = "Shadow Mend",
  slug = "shadow_mend",
}

classData.spells[187464] = {
  spellID = 187464,
  name = "Shadow Mend",
  slug = "shadow_mend",
  max_range = 40,
  duration = 10.0,
}

classData.spells[190714] = {
  spellID = 190714,
  name = "Shadow Word: Death",
  slug = "shadow_word_death",
}

classData.spells[190719] = {
  spellID = 190719,
  name = "Shadow Word: Death",
  slug = "shadow_word_death",
}

classData.spells[193063] = {
  spellID = 193063,
  name = "Masochism",
  slug = "masochism",
}

classData.spells[193065] = {
  spellID = 193065,
  name = "Masochism",
  slug = "masochism",
  duration = 10.0,
}

classData.spells[193134] = {
  spellID = 193134,
  name = "Castigation",
  slug = "castigation",
}

classData.spells[193155] = {
  spellID = 193155,
  name = "Enlightenment",
  slug = "enlightenment",
}

classData.spells[193157] = {
  spellID = 193157,
  name = "Benediction",
  slug = "benediction",
}

classData.spells[193173] = {
  spellID = 193173,
  name = "Mania",
  slug = "mania",
}

classData.spells[193195] = {
  spellID = 193195,
  name = "Fortress of the Mind",
  slug = "fortress_of_the_mind",
}

classData.spells[193223] = {
  spellID = 193223,
  name = "Surrender to Madness",
  slug = "surrender_to_madness",
  gcd = 1.5,
  cooldown = 240.0,
  duration = 60.0,
}

classData.spells[193225] = {
  spellID = 193225,
  name = "Legacy of the Void",
  slug = "legacy_of_the_void",
}

classData.spells[193473] = {
  spellID = 193473,
  name = "Mind Flay",
  slug = "mind_flay",
  max_range = 100,
  cooldown = 1.0,
  duration = 10.0,
  channeled = true,
}

classData.spells[194249] = {
  spellID = 194249,
  name = "Voidform",
  slug = "voidform",
  max_stacks = 100,
}

classData.spells[194251] = {
  spellID = 194251,
  name = "Insanity",
  slug = "insanity",
}

classData.spells[194384] = {
  spellID = 194384,
  name = "Atonement",
  slug = "atonement",
  max_range = 60,
  duration = 15.0,
}

classData.spells[194509] = {
  spellID = 194509,
  name = "Power Word: Radiance",
  slug = "power_word_radiance",
  max_range = 40,
  charges = 2,
  charge_cooldown = 18.0,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[196684] = {
  spellID = 196684,
  name = "Invoke the Naaru",
  slug = "invoke_the_naaru",
  max_range = 100,
  internal_cooldown = 15.0,
}

classData.spells[196685] = {
  spellID = 196685,
  name = "Invoke the Naaru",
  slug = "invoke_the_naaru",
  max_range = 100,
  duration = 15.0,
}

classData.spells[196704] = {
  spellID = 196704,
  name = "Psychic Voice",
  slug = "psychic_voice",
}

classData.spells[196705] = {
  spellID = 196705,
  name = "Invoke the Naaru",
  slug = "invoke_the_naaru",
  max_range = 100,
  duration = 15.0,
}

classData.spells[196707] = {
  spellID = 196707,
  name = "Afterlife",
  slug = "afterlife",
}

classData.spells[196781] = {
  spellID = 196781,
  name = "Holy Mending",
  slug = "holy_mending",
  max_range = 100,
}

classData.spells[196985] = {
  spellID = 196985,
  name = "Light of the Naaru",
  slug = "light_of_the_naaru",
}

classData.spells[197045] = {
  spellID = 197045,
  name = "Shield Discipline",
  slug = "shield_discipline",
}

classData.spells[197419] = {
  spellID = 197419,
  name = "Contrition",
  slug = "contrition",
}

classData.spells[199849] = {
  spellID = 199849,
  name = "Lingering Insanity",
  slug = "lingering_insanity",
}

classData.spells[199853] = {
  spellID = 199853,
  name = "Reaper of Souls",
  slug = "reaper_of_souls",
}

classData.spells[199855] = {
  spellID = 199855,
  name = "San'layn",
  slug = "sanlayn",
}

classData.spells[199911] = {
  spellID = 199911,
  name = "Shadow Word: Death",
  slug = "shadow_word_death",
  max_range = 40,
  charges = 2,
  charge_cooldown = 9.0,
  gcd = 1.5,
}

classData.spells[200010] = {
  spellID = 200010,
  name = "Power Leech",
  slug = "power_leech",
  max_range = 50000,
}

classData.spells[200128] = {
  spellID = 200128,
  name = "Trail of Light",
  slug = "trail_of_light",
}

classData.spells[200153] = {
  spellID = 200153,
  name = "Enduring Renewal",
  slug = "enduring_renewal",
}

classData.spells[200174] = {
  spellID = 200174,
  name = "Mindbender",
  slug = "mindbender",
  max_range = 40,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 15.0,
}

classData.spells[200183] = {
  spellID = 200183,
  name = "Apotheosis",
  slug = "apotheosis",
  gcd = 1.5,
  cooldown = 180.0,
  duration = 30.0,
}

classData.spells[200196] = {
  spellID = 200196,
  name = "Holy Word: Chastise",
  slug = "holy_word_chastise",
  max_range = 30,
  initial_stacks = 1,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 4.0,
}

classData.spells[200199] = {
  spellID = 200199,
  name = "Censure",
  slug = "censure",
}

classData.spells[200200] = {
  spellID = 200200,
  name = "Holy Word: Chastise",
  slug = "holy_word_chastise",
  max_range = 30,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 4.0,
}

classData.spells[200209] = {
  spellID = 200209,
  name = "Guardian Angel",
  slug = "guardian_angel",
}

classData.spells[200309] = {
  spellID = 200309,
  name = "Grace",
  slug = "grace",
}

classData.spells[200749] = {
  spellID = 200749,
  name = "Activating Specialization",
  slug = "activating_specialization",
  max_range = 50000,
  channeled = true,
}

classData.spells[204197] = {
  spellID = 204197,
  name = "Purge the Wicked",
  slug = "purge_the_wicked",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[204213] = {
  spellID = 204213,
  name = "Purge the Wicked",
  slug = "purge_the_wicked",
  max_range = 40,
  duration = 20.0,
  haste_affected_ticks = true,
}

classData.spells[204263] = {
  spellID = 204263,
  name = "Shining Force",
  slug = "shining_force",
  max_range = 40,
  gcd = 1.5,
  cooldown = 45.0,
  duration = 3.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[204883] = {
  spellID = 204883,
  name = "Circle of Healing",
  slug = "circle_of_healing",
  max_range = 40,
  gcd = 1.5,
  cooldown = 15.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[205065] = {
  spellID = 205065,
  name = "Void Torrent",
  slug = "void_torrent",
  max_range = 40,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 4.0,
  channeled = true,
  haste_affected_ticks = true,
}

classData.spells[205351] = {
  spellID = 205351,
  name = "Shadow Word: Void",
  slug = "shadow_word_void",
  max_range = 40,
  charges = 2,
  charge_cooldown = 9.0,
  gcd = 1.5,
}

classData.spells[205364] = {
  spellID = 205364,
  name = "Mind Control",
  slug = "mind_control",
  max_range = 30,
  gcd = 1.5,
  cooldown = 120.0,
  duration = 30.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[205367] = {
  spellID = 205367,
  name = "Dominant Mind",
  slug = "dominant_mind",
}

classData.spells[205369] = {
  spellID = 205369,
  name = "Mind Bomb",
  slug = "mind_bomb",
  max_range = 30,
  gcd = 1.5,
  cooldown = 30.0,
  duration = 2.0,
}

classData.spells[205385] = {
  spellID = 205385,
  name = "Shadow Crash",
  slug = "shadow_crash",
  max_range = 40,
  gcd = 1.5,
  cooldown = 20.0,
}

classData.spells[205386] = {
  spellID = 205386,
  name = "Shadow Crash",
  slug = "shadow_crash",
  max_range = 100,
}

classData.spells[205448] = {
  spellID = 205448,
  name = "Void Bolt",
  slug = "void_bolt",
  max_range = 40,
  gcd = 1.5,
  cooldown = 4.5,
}

classData.spells[205477] = {
  spellID = 205477,
  name = "Id",
  slug = "id",
}

classData.spells[207946] = {
  spellID = 207946,
  name = "Light's Wrath",
  slug = "lights_wrath",
  max_range = 40,
  gcd = 1.5,
  cooldown = 90.0,
}

classData.spells[207948] = {
  spellID = 207948,
  name = "Light's Wrath",
  slug = "lights_wrath",
  max_range = 100,
}

classData.spells[208065] = {
  spellID = 208065,
  name = "Light of T'uure",
  slug = "light_of_tuure",
  max_range = 40,
  charges = 2,
  charge_cooldown = 45.0,
  gcd = 1.5,
  duration = 10.0,
}

classData.spells[208232] = {
  spellID = 208232,
  name = "Mind Sear",
  slug = "mind_sear",
}

classData.spells[212036] = {
  spellID = 212036,
  name = "Mass Resurrection",
  slug = "mass_resurrection",
  max_range = 100,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[212570] = {
  spellID = 212570,
  name = "Surrendered Soul",
  slug = "surrendered_soul",
  duration = 180.0,
}

classData.spells[213634] = {
  spellID = 213634,
  name = "Purify Disease",
  slug = "purify_disease",
  max_range = 40,
  charges = 1,
  charge_cooldown = 8.0,
  gcd = 1.5,
  cooldown = 8.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[214121] = {
  spellID = 214121,
  name = "Body and Mind",
  slug = "body_and_mind",
  max_range = 40,
  gcd = 1.5,
  cooldown = 10.0,
  duration = 4.0,
}

classData.spells[214621] = {
  spellID = 214621,
  name = "Schism",
  slug = "schism",
  max_range = 40,
  gcd = 1.5,
  cooldown = 24.0,
  duration = 9.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[215769] = {
  spellID = 215769,
  name = "Spirit of Redemption",
  slug = "spirit_of_redemption",
  cooldown = 180.0,
  duration = 7.0,
}

classData.spells[217676] = {
  spellID = 217676,
  name = "Mind Spike Detonation",
  slug = "mind_spike_detonation",
  max_range = 100,
}

classData.spells[218413] = {
  spellID = 218413,
  name = "Voidform",
  slug = "voidform",
}

classData.spells[226943] = {
  spellID = 226943,
  name = "Mind Bomb",
  slug = "mind_bomb",
  max_range = 100,
  duration = 5.0,
}

classData.spells[228260] = {
  spellID = 228260,
  name = "Void Eruption",
  slug = "void_eruption",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "insanity", amount = 9000, },
  },
}

classData.spells[228264] = {
  spellID = 228264,
  name = "Voidform",
  slug = "voidform",
}

classData.spells[228266] = {
  spellID = 228266,
  name = "Void Bolt",
  slug = "void_bolt",
}

classData.spells[228360] = {
  spellID = 228360,
  name = "Void Eruption",
  slug = "void_eruption",
  max_range = 100,
}

classData.spells[231682] = {
  spellID = 231682,
  name = "Smite",
  slug = "smite",
}

classData.spells[231687] = {
  spellID = 231687,
  name = "Holy Fire",
  slug = "holy_fire",
}

classData.spells[231688] = {
  spellID = 231688,
  name = "Void Bolt",
  slug = "void_bolt",
}

classData.spells[232633] = {
  spellID = 232633,
  name = "Arcane Torrent",
  slug = "arcane_torrent",
  gcd = 1.5,
  cooldown = 90.0,
}

classData.spells[232698] = {
  spellID = 232698,
  name = "Shadowform",
  slug = "shadowform",
  gcd = 1.5,
}

classData.spells[234746] = {
  spellID = 234746,
  name = "Void Bolt",
  slug = "void_bolt",
  max_range = 100,
}

classData.spells[235189] = {
  spellID = 235189,
  name = "Perseverance",
  slug = "perseverance",
}

classData.spells[238063] = {
  spellID = 238063,
  name = "Lenience",
  slug = "lenience",
}

classData.spells[238136] = {
  spellID = 238136,
  name = "Cosmic Ripple",
  slug = "cosmic_ripple",
}

classData.spells[238558] = {
  spellID = 238558,
  name = "Misery",
  slug = "misery",
}

classData.spells[243241] = {
  spellID = 243241,
  name = "Cosmic Ripple",
  slug = "cosmic_ripple",
}

classData.spells[246287] = {
  spellID = 246287,
  name = "Evangelism",
  slug = "evangelism",
  gcd = 1.5,
  cooldown = 75.0,
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

classData.spells[262484] = {
  spellID = 262484,
  name = "Power Leech",
  slug = "power_leech",
  max_range = 100,
}

classData.spells[262485] = {
  spellID = 262485,
  name = "Power Leech",
  slug = "power_leech",
  max_range = 50000,
}

classData.spells[262861] = {
  spellID = 262861,
  name = "Smite",
  slug = "smite",
}

classData.spells[263165] = {
  spellID = 263165,
  name = "Void Torrent",
  slug = "void_torrent",
  max_range = 40,
  gcd = 1.5,
  cooldown = 45.0,
  duration = 4.0,
  channeled = true,
  haste_affected_ticks = true,
}

classData.spells[263346] = {
  spellID = 263346,
  name = "Dark Void",
  slug = "dark_void",
  max_range = 40,
  gcd = 1.5,
  cooldown = 30.0,
}

classData.spells[263406] = {
  spellID = 263406,
  name = "Surrendered to Madness",
  slug = "surrendered_to_madness",
  duration = 30.0,
}

classData.spells[263715] = {
  spellID = 263715,
  name = "Silence",
  slug = "silence",
  max_range = 100,
  duration = 4.0,
}

classData.spells[263716] = {
  spellID = 263716,
  name = "Last Word",
  slug = "last_word",
}

classData.spells[265202] = {
  spellID = 265202,
  name = "Holy Word: Salvation",
  slug = "holy_word_salvation",
  max_range = 40,
  gcd = 1.5,
  cooldown = 720.0,
}

classData.spells[265258] = {
  spellID = 265258,
  name = "Twist of Fate",
  slug = "twist_of_fate",
  duration = 10.0,
}

classData.spells[265259] = {
  spellID = 265259,
  name = "Twist of Fate",
  slug = "twist_of_fate",
}

classData.spells[270501] = {
  spellID = 270501,
  name = "Contrition",
  slug = "contrition",
  max_range = 100,
}

classData.spells[271466] = {
  spellID = 271466,
  name = "Luminous Barrier",
  slug = "luminous_barrier",
  max_range = 40,
  gcd = 1.5,
  cooldown = 180.0,
  duration = 10.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[271531] = {
  spellID = 271531,
  name = "Orison",
  slug = "orison",
}

classData.spells[271532] = {
  spellID = 271532,
  name = "Orison",
  slug = "orison",
  max_range = 100,
}

classData.spells[271534] = {
  spellID = 271534,
  name = "Mastery: Reverence",
  slug = "mastery_reverence",
}

classData.spells[272775] = {
  spellID = 272775,
  name = "Moment of Repose",
  slug = "moment_of_repose",
}

classData.spells[272776] = {
  spellID = 272776,
  name = "Moment of Repose",
  slug = "moment_of_repose",
  max_range = 100,
}

classData.spells[274960] = {
  spellID = 274960,
  name = "Coming Soon!",
  slug = "coming_soon",
  gcd = 1.5,
}
