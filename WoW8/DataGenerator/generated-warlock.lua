----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BfA only.
----------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(4, GetBuildInfo()) < 80000 then
    return
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Class check
----------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(3, UnitClass('player')) ~= 9 then return end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
local addonName, TJ = ...
TJ.ClassData = TJ.ClassData or {}
TJ.ClassData[9] = TJ.ClassData[9] or {}
local classData = TJ.ClassData[9]
classData.spells = classData.spells or {}

classData.spells[126] = {
  spellID = 126,
  name = "Eye of Kilrogg",
  slug = "eye_of_kilrogg",
  max_range = 50000,
  gcd = 1.5,
  duration = 45.0,
  channeled = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[172] = {
  spellID = 172,
  name = "Corruption",
  slug = "corruption",
  max_range = 40,
  gcd = 1.5,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[348] = {
  spellID = 348,
  name = "Immolate",
  slug = "immolate",
  max_range = 40,
  gcd = 1.5,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[686] = {
  spellID = 686,
  name = "Shadow Bolt",
  slug = "shadow_bolt",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[688] = {
  spellID = 688,
  name = "Summon Imp",
  slug = "summon_imp",
  gcd = 1.5,
  power = {
    [1] = { resource = "soul_shard", amount = 1, },
  },
}

classData.spells[691] = {
  spellID = 691,
  name = "Summon Felhunter",
  slug = "summon_felhunter",
  gcd = 1.5,
  power = {
    [1] = { resource = "soul_shard", amount = 1, },
  },
}

classData.spells[697] = {
  spellID = 697,
  name = "Summon Voidwalker",
  slug = "summon_voidwalker",
  gcd = 1.5,
  power = {
    [1] = { resource = "soul_shard", amount = 1, },
  },
}

classData.spells[698] = {
  spellID = 698,
  name = "Ritual of Summoning",
  slug = "ritual_of_summoning",
  max_range = 30,
  gcd = 1.5,
  cooldown = 120.0,
  duration = 120.0,
  channeled = true,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[710] = {
  spellID = 710,
  name = "Banish",
  slug = "banish",
  max_range = 30,
  gcd = 1.5,
  duration = 30.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[712] = {
  spellID = 712,
  name = "Summon Succubus",
  slug = "summon_succubus",
  gcd = 1.5,
  power = {
    [1] = { resource = "soul_shard", amount = 1, },
  },
}

classData.spells[755] = {
  spellID = 755,
  name = "Health Funnel",
  slug = "health_funnel",
  max_range = 45,
  gcd = 1.5,
  duration = 5.0,
  channeled = true,
  haste_affected_ticks = true,
}

classData.spells[980] = {
  spellID = 980,
  name = "Agony",
  slug = "agony",
  max_range = 40,
  max_stacks = 6,
  gcd = 1.5,
  duration = 18.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[1098] = {
  spellID = 1098,
  name = "Enslave Demon",
  slug = "enslave_demon",
  max_range = 30,
  gcd = 1.5,
  duration = 300.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[1122] = {
  spellID = 1122,
  name = "Summon Infernal",
  slug = "summon_infernal",
  max_range = 30,
  gcd = 1.5,
  cooldown = 180.0,
  duration = 0.2,
  power = {
    [1] = { resource = "soul_shard", amount = 1, },
  },
}

classData.spells[3026] = {
  spellID = 3026,
  name = "Use Soulstone",
  slug = "use_soulstone",
}

classData.spells[3110] = {
  spellID = 3110,
  name = "Firebolt",
  slug = "firebolt",
  max_range = 40,
  gcd = 0.5,
  power = {
    [1] = { resource = "energy", amount = 40, },
  },
}

classData.spells[3716] = {
  spellID = 3716,
  name = "Consuming Shadows",
  slug = "consuming_shadows",
  max_range = 5,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 20, },
  },
}

classData.spells[5019] = {
  spellID = 5019,
  name = "Shoot",
  slug = "shoot",
  max_range = 30,
  gcd = 1.5,
}

classData.spells[5740] = {
  spellID = 5740,
  name = "Rain of Fire",
  slug = "rain_of_fire",
  max_range = 35,
  gcd = 1.5,
  duration = 8.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "soul_shard", amount = 3, },
  },
}

classData.spells[5782] = {
  spellID = 5782,
  name = "Fear",
  slug = "fear",
  max_range = 30,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[6201] = {
  spellID = 6201,
  name = "Create Healthstone",
  slug = "create_healthstone",
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[6203] = {
  spellID = 6203,
  name = "Soulstone",
  slug = "soulstone",
  max_range = 50000,
}

classData.spells[6262] = {
  spellID = 6262,
  name = "Healthstone",
  slug = "healthstone",
  cooldown = 60.0,
}

classData.spells[6307] = {
  spellID = 6307,
  name = "Blood Pact",
  slug = "blood_pact",
}

classData.spells[6353] = {
  spellID = 6353,
  name = "Soul Fire",
  slug = "soul_fire",
  max_range = 40,
  gcd = 1.5,
  cooldown = 45.0,
  power = {
    [1] = { resource = "soul_shard", amount = 1, },
  },
}

classData.spells[6358] = {
  spellID = 6358,
  name = "Seduction",
  slug = "seduction",
  max_range = 30,
  cooldown = 30.0,
  duration = 30.0,
  channeled = true,
}

classData.spells[6360] = {
  spellID = 6360,
  name = "Whiplash",
  slug = "whiplash",
  max_range = 10,
  cooldown = 10.0,
  duration = 6.0,
}

classData.spells[6789] = {
  spellID = 6789,
  name = "Mortal Coil",
  slug = "mortal_coil",
  max_range = 20,
  gcd = 1.5,
  cooldown = 45.0,
  duration = 3.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[7814] = {
  spellID = 7814,
  name = "Lash of Pain",
  slug = "lash_of_pain",
  max_range = 5,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 60, },
  },
}

classData.spells[7870] = {
  spellID = 7870,
  name = "Lesser Invisibility",
  slug = "lesser_invisibility",
  initial_stacks = 1,
  gcd = 1.5,
  duration = 300.0,
  power = {
    [1] = { resource = "energy", amount = 20, },
  },
}

classData.spells[17735] = {
  spellID = 17735,
  name = "Suffering",
  slug = "suffering",
  max_range = 30,
  cooldown = 10.0,
  duration = 5.0,
}

classData.spells[17767] = {
  spellID = 17767,
  name = "Shadow Bulwark",
  slug = "shadow_bulwark",
  max_range = 50000,
  gcd = 1.0,
  cooldown = 120.0,
  duration = 20.0,
}

classData.spells[17877] = {
  spellID = 17877,
  name = "Shadowburn",
  slug = "shadowburn",
  max_range = 40,
  charges = 2,
  charge_cooldown = 12.0,
  gcd = 1.5,
  duration = 5.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[17941] = {
  spellID = 17941,
  name = "Agony",
  slug = "agony",
}

classData.spells[17962] = {
  spellID = 17962,
  name = "Conflagrate",
  slug = "conflagrate",
  max_range = 40,
  charges = 1,
  charge_cooldown = 13.0,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[19483] = {
  spellID = 19483,
  name = "Immolation",
  slug = "immolation",
  haste_affected_ticks = true,
}

classData.spells[19505] = {
  spellID = 19505,
  name = "Devour Magic",
  slug = "devour_magic",
  max_range = 30,
  cooldown = 15.0,
  power = {
    [1] = { resource = "energy", amount = 20, },
  },
}

classData.spells[19647] = {
  spellID = 19647,
  name = "Spell Lock",
  slug = "spell_lock",
  max_range = 40,
  cooldown = 24.0,
  duration = 6.0,
}

classData.spells[19658] = {
  spellID = 19658,
  name = "Devour Magic",
  slug = "devour_magic",
  max_range = 45,
}

classData.spells[20153] = {
  spellID = 20153,
  name = "Immolation",
  slug = "immolation",
}

classData.spells[20591] = {
  spellID = 20591,
  name = "Expansive Mind",
  slug = "expansive_mind",
}

classData.spells[20707] = {
  spellID = 20707,
  name = "Soulstone",
  slug = "soulstone",
  max_range = 40,
  gcd = 1.5,
  cooldown = 600.0,
  duration = 900.0,
}

classData.spells[21563] = {
  spellID = 21563,
  name = "Command",
  slug = "command",
}

classData.spells[22703] = {
  spellID = 22703,
  name = "Infernal Awakening",
  slug = "infernal_awakening",
  max_range = 50000,
  duration = 2.0,
}

classData.spells[25112] = {
  spellID = 25112,
  name = "Summon Voidwalker",
  slug = "summon_voidwalker",
  gcd = 1.5,
}

classData.spells[27243] = {
  spellID = 27243,
  name = "Seed of Corruption",
  slug = "seed_of_corruption",
  max_range = 40,
  gcd = 1.5,
  duration = 12.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "soul_shard", amount = 1, },
  },
}

classData.spells[27285] = {
  spellID = 27285,
  name = "Seed of Corruption",
  slug = "seed_of_corruption",
  max_range = 50000,
}

classData.spells[28730] = {
  spellID = 28730,
  name = "Arcane Torrent",
  slug = "arcane_torrent",
  gcd = 1.5,
  cooldown = 150.0,
}

classData.spells[29722] = {
  spellID = 29722,
  name = "Incinerate",
  slug = "incinerate",
  replaces_spell_id = 686,
  max_range = 40,
  max_stacks = 5,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[30108] = {
  spellID = 30108,
  name = "Unstable Affliction",
  slug = "unstable_affliction",
  max_range = 40,
  max_stacks = 10,
  gcd = 1.5,
  power = {
    [1] = { resource = "soul_shard", amount = 1, },
  },
}

classData.spells[30146] = {
  spellID = 30146,
  name = "Summon Felguard",
  slug = "summon_felguard",
  gcd = 1.5,
  power = {
    [1] = { resource = "soul_shard", amount = 1, },
  },
}

classData.spells[30151] = {
  spellID = 30151,
  name = "Pursuit",
  slug = "pursuit",
  min_range = 8,
  max_range = 25,
  gcd = 1.5,
  cooldown = 15.0,
  duration = 8.0,
  power = {
    [1] = { resource = "energy", amount = 20, },
  },
}

classData.spells[30153] = {
  spellID = 30153,
  name = "Pursuit",
  slug = "pursuit",
  max_range = 50000,
}

classData.spells[30213] = {
  spellID = 30213,
  name = "Legion Strike",
  slug = "legion_strike",
  max_range = 5,
  gcd = 1.0,
  duration = 6.0,
  power = {
    [1] = { resource = "energy", amount = 60, },
  },
}

classData.spells[30283] = {
  spellID = 30283,
  name = "Shadowfury",
  slug = "shadowfury",
  max_range = 35,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 3.0,
}

classData.spells[32233] = {
  spellID = 32233,
  name = "Avoidance",
  slug = "avoidance",
}

classData.spells[32388] = {
  spellID = 32388,
  name = "Shadow Embrace",
  slug = "shadow_embrace",
}

classData.spells[32390] = {
  spellID = 32390,
  name = "Shadow Embrace",
  slug = "shadow_embrace",
  max_range = 50000,
  max_stacks = 3,
  duration = 10.0,
}

classData.spells[33702] = {
  spellID = 33702,
  name = "Blood Fury",
  slug = "blood_fury",
  cooldown = 120.0,
  duration = 15.0,
}

classData.spells[42223] = {
  spellID = 42223,
  name = "Rain of Fire",
  slug = "rain_of_fire",
  max_range = 100,
}

classData.spells[48181] = {
  spellID = 48181,
  name = "Haunt",
  slug = "haunt",
  max_range = 40,
  gcd = 1.5,
  cooldown = 15.0,
  duration = 15.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[54049] = {
  spellID = 54049,
  name = "Shadow Bite",
  slug = "shadow_bite",
  max_range = 5,
  gcd = 1.0,
  power = {
    [1] = { resource = "energy", amount = 60, },
  },
}

classData.spells[56246] = {
  spellID = 56246,
  name = "Glyph of Felguard",
  slug = "glyph_of_felguard",
}

classData.spells[56285] = {
  spellID = 56285,
  name = "Felguard",
  slug = "felguard",
}

classData.spells[58094] = {
  spellID = 58094,
  name = "Glyph of Soulwell",
  slug = "glyph_of_soulwell",
}

classData.spells[58275] = {
  spellID = 58275,
  name = "Soulwell",
  slug = "soulwell",
}

classData.spells[63106] = {
  spellID = 63106,
  name = "Siphon Life",
  slug = "siphon_life",
  max_range = 40,
  gcd = 1.5,
  duration = 15.0,
  haste_affected_ticks = true,
}

classData.spells[63312] = {
  spellID = 63312,
  name = "Glyph of Crimson Banish",
  slug = "glyph_of_crimson_banish",
}

classData.spells[63943] = {
  spellID = 63943,
  name = "Crimson Banish",
  slug = "crimson_banish",
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

classData.spells[77215] = {
  spellID = 77215,
  name = "Mastery: Potent Afflictions",
  slug = "mastery_potent_afflictions",
}

classData.spells[77219] = {
  spellID = 77219,
  name = "Mastery: Master Demonologist",
  slug = "mastery_master_demonologist",
}

classData.spells[77220] = {
  spellID = 77220,
  name = "Mastery: Chaotic Energies",
  slug = "mastery_chaotic_energies",
}

classData.spells[80240] = {
  spellID = 80240,
  name = "Havoc",
  slug = "havoc",
  max_range = 40,
  max_stacks = 1,
  gcd = 1.5,
  cooldown = 25.0,
  duration = 10.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[85692] = {
  spellID = 85692,
  name = "Doom Bolt",
  slug = "doom_bolt",
  max_range = 30,
  power = {
    [1] = { resource = "energy", amount = 35, },
  },
}

classData.spells[86040] = {
  spellID = 86040,
  name = "Hand of Gul'dan",
  slug = "hand_of_guldan",
  max_range = 50000,
}

classData.spells[86091] = {
  spellID = 86091,
  name = "Nethermancy",
  slug = "nethermancy",
}

classData.spells[89751] = {
  spellID = 89751,
  name = "Felstorm",
  slug = "felstorm",
  cooldown = 30.0,
  duration = 5.0,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "energy", amount = 60, },
  },
}

classData.spells[89753] = {
  spellID = 89753,
  name = "Felstorm",
  slug = "felstorm",
}

classData.spells[89766] = {
  spellID = 89766,
  name = "Axe Toss",
  slug = "axe_toss",
  max_range = 30,
  cooldown = 30.0,
  duration = 4.0,
}

classData.spells[89792] = {
  spellID = 89792,
  name = "Flee",
  slug = "flee",
  max_range = 40,
  cooldown = 20.0,
  duration = 0.2,
  power = {
    [1] = { resource = "energy", amount = 20, },
  },
}

classData.spells[89808] = {
  spellID = 89808,
  name = "Singe Magic",
  slug = "singe_magic",
  max_range = 30,
  cooldown = 15.0,
}

classData.spells[93282] = {
  spellID = 93282,
  name = "Flee",
  slug = "flee",
  max_range = 40,
  cooldown = 20.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[93375] = {
  spellID = 93375,
  name = "Control Demon",
  slug = "control_demon",
}

classData.spells[94293] = {
  spellID = 94293,
  name = "Altered Form",
  slug = "altered_form",
}

classData.spells[101508] = {
  spellID = 101508,
  name = "The Codex of Xerrath",
  slug = "the_codex_of_xerrath",
}

classData.spells[104316] = {
  spellID = 104316,
  name = "Call Dreadstalkers",
  slug = "call_dreadstalkers",
  max_range = 40,
  gcd = 1.5,
  cooldown = 20.0,
  power = {
    [1] = { resource = "soul_shard", amount = 2, },
  },
}

classData.spells[104317] = {
  spellID = 104317,
  name = "Wild Imp",
  slug = "wild_imp",
  max_range = 100,
  duration = 25.0,
}

classData.spells[104318] = {
  spellID = 104318,
  name = "Fel Firebolt",
  slug = "fel_firebolt",
  max_range = 40,
  power = {
    [1] = { resource = "energy", amount = 20, },
  },
}

classData.spells[104773] = {
  spellID = 104773,
  name = "Unending Resolve",
  slug = "unending_resolve",
  cooldown = 180.0,
  duration = 8.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
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

classData.spells[108366] = {
  spellID = 108366,
  name = "Soul Leech",
  slug = "soul_leech",
  max_range = 50000,
  duration = 15.0,
}

classData.spells[108370] = {
  spellID = 108370,
  name = "Soul Leech",
  slug = "soul_leech",
}

classData.spells[108396] = {
  spellID = 108396,
  name = "Mortal Coil",
  slug = "mortal_coil",
}

classData.spells[108415] = {
  spellID = 108415,
  name = "Soul Link",
  slug = "soul_link",
  max_range = 100,
}

classData.spells[108416] = {
  spellID = 108416,
  name = "Dark Pact",
  slug = "dark_pact",
  max_range = 100,
  cooldown = 60.0,
  duration = 20.0,
}

classData.spells[108446] = {
  spellID = 108446,
  name = "Soul Link",
  slug = "soul_link",
  gcd = 1.5,
}

classData.spells[108501] = {
  spellID = 108501,
  name = "Grimoire of Service",
  slug = "grimoire_of_service",
  cooldown = 90.0,
}

classData.spells[108503] = {
  spellID = 108503,
  name = "Grimoire of Sacrifice",
  slug = "grimoire_of_sacrifice",
  max_range = 50000,
  gcd = 1.5,
  cooldown = 30.0,
}

classData.spells[108558] = {
  spellID = 108558,
  name = "Nightfall",
  slug = "nightfall",
}

classData.spells[111400] = {
  spellID = 111400,
  name = "Burning Rush",
  slug = "burning_rush",
  gcd = 1.5,
}

classData.spells[111685] = {
  spellID = 111685,
  name = "Summon Infernal",
  slug = "summon_infernal",
  max_range = 50000,
  duration = 30.0,
}

classData.spells[111771] = {
  spellID = 111771,
  name = "Demonic Gateway",
  slug = "demonic_gateway",
  min_range = 10,
  max_range = 40,
  gcd = 1.5,
  cooldown = 10.0,
  duration = 0.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[111859] = {
  spellID = 111859,
  name = "Grimoire: Imp",
  slug = "grimoire_imp",
  max_range = 40,
  gcd = 1.5,
  cooldown = 90.0,
  duration = 27.0,
  power = {
    [1] = { resource = "soul_shard", amount = 1, },
  },
}

classData.spells[111895] = {
  spellID = 111895,
  name = "Grimoire: Voidwalker",
  slug = "grimoire_voidwalker",
  max_range = 40,
  gcd = 1.5,
  cooldown = 90.0,
  duration = 27.0,
  power = {
    [1] = { resource = "soul_shard", amount = 1, },
  },
}

classData.spells[111896] = {
  spellID = 111896,
  name = "Grimoire: Succubus",
  slug = "grimoire_succubus",
  max_range = 40,
  gcd = 1.5,
  cooldown = 90.0,
  duration = 27.0,
  power = {
    [1] = { resource = "soul_shard", amount = 1, },
  },
}

classData.spells[111897] = {
  spellID = 111897,
  name = "Grimoire: Felhunter",
  slug = "grimoire_felhunter",
  max_range = 40,
  gcd = 1.5,
  cooldown = 90.0,
  duration = 27.0,
  power = {
    [1] = { resource = "soul_shard", amount = 1, },
  },
}

classData.spells[111898] = {
  spellID = 111898,
  name = "Grimoire: Felguard",
  slug = "grimoire_felguard",
  max_range = 40,
  gcd = 1.5,
  cooldown = 90.0,
  duration = 27.0,
  power = {
    [1] = { resource = "soul_shard", amount = 1, },
  },
}

classData.spells[112042] = {
  spellID = 112042,
  name = "Threatening Presence",
  slug = "threatening_presence",
  gcd = 1.5,
}

classData.spells[113858] = {
  spellID = 113858,
  name = "Dark Soul",
  slug = "dark_soul",
  charge_cooldown = 120.0,
  gcd = 1.5,
  cooldown = 120.0,
  duration = 20.0,
}

classData.spells[113942] = {
  spellID = 113942,
  name = "Demonic Gateway",
  slug = "demonic_gateway",
  duration = 90.0,
}

classData.spells[116858] = {
  spellID = 116858,
  name = "Chaos Bolt",
  slug = "chaos_bolt",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "soul_shard", amount = 2, },
  },
}

classData.spells[117198] = {
  spellID = 117198,
  name = "Soul Shards",
  slug = "soul_shards",
}

classData.spells[117225] = {
  spellID = 117225,
  name = "Void Reflexes",
  slug = "void_reflexes",
}

classData.spells[117828] = {
  spellID = 117828,
  name = "Backdraft",
  slug = "backdraft",
  initial_stacks = 1,
  max_stacks = 2,
  duration = 10.0,
}

classData.spells[118699] = {
  spellID = 118699,
  name = "Fear",
  slug = "fear",
  max_range = 30,
  duration = 20.0,
}

classData.spells[119898] = {
  spellID = 119898,
  name = "Command Demon",
  slug = "command_demon",
}

classData.spells[134477] = {
  spellID = 134477,
  name = "Threatening Presence",
  slug = "threatening_presence",
  gcd = 1.5,
}

classData.spells[137042] = {
  spellID = 137042,
  name = "Warlock",
  slug = "warlock",
}

classData.spells[137043] = {
  spellID = 137043,
  name = "Affliction Warlock",
  slug = "affliction_warlock",
}

classData.spells[137044] = {
  spellID = 137044,
  name = "Demonology Warlock",
  slug = "demonology_warlock",
}

classData.spells[137046] = {
  spellID = 137046,
  name = "Destruction Warlock",
  slug = "destruction_warlock",
}

classData.spells[146739] = {
  spellID = 146739,
  name = "Corruption",
  slug = "corruption",
  max_range = 40,
  duration = 14.0,
  haste_affected_ticks = true,
}

classData.spells[152107] = {
  spellID = 152107,
  name = "Grimoire of Supremacy",
  slug = "grimoire_of_supremacy",
}

classData.spells[152108] = {
  spellID = 152108,
  name = "Cataclysm",
  slug = "cataclysm",
  max_range = 40,
  gcd = 1.5,
  cooldown = 30.0,
}

classData.spells[157695] = {
  spellID = 157695,
  name = "Demonbolt",
  slug = "demonbolt",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[157736] = {
  spellID = 157736,
  name = "Immolate",
  slug = "immolate",
  max_range = 100,
  duration = 18.0,
  haste_affected_ticks = true,
}

classData.spells[157903] = {
  spellID = 157903,
  name = "Warlock",
  slug = "warlock",
}

classData.spells[162699] = {
  spellID = 162699,
  name = "Stat Negation Aura - Intellect DPS",
  slug = "stat_negation_aura__intellect_dps",
}

classData.spells[170995] = {
  spellID = 170995,
  name = "Cripple",
  slug = "cripple",
  max_range = 30,
  gcd = 1.5,
  cooldown = 30.0,
  duration = 30.0,
  channeled = true,
}

classData.spells[171011] = {
  spellID = 171011,
  name = "Burning Presence",
  slug = "burning_presence",
  gcd = 1.5,
}

classData.spells[171014] = {
  spellID = 171014,
  name = "Seethe",
  slug = "seethe",
  max_range = 30,
  cooldown = 10.0,
  duration = 5.0,
}

classData.spells[171017] = {
  spellID = 171017,
  name = "Meteor Strike",
  slug = "meteor_strike",
  max_range = 50000,
  cooldown = 60.0,
  duration = 2.0,
}

classData.spells[171021] = {
  spellID = 171021,
  name = "Torch Magic",
  slug = "torch_magic",
  max_range = 30,
  cooldown = 10.0,
}

classData.spells[171138] = {
  spellID = 171138,
  name = "Shadow Lock",
  slug = "shadow_lock",
  max_range = 40,
  cooldown = 24.0,
  duration = 6.0,
  power = {
    [1] = { resource = "energy", amount = 20, },
  },
}

classData.spells[185964] = {
  spellID = 185964,
  name = "Item - Warlock T18 Demonology 4P Bonus",
  slug = "item__warlock_t18_demonology_4p_bonus",
}

classData.spells[187385] = {
  spellID = 187385,
  name = "Chaos Barrage",
  slug = "chaos_barrage",
  duration = 5.5,
  haste_affected_ticks = true,
}

classData.spells[187394] = {
  spellID = 187394,
  name = "Chaos Barrage",
  slug = "chaos_barrage",
  max_range = 100,
}

classData.spells[189296] = {
  spellID = 189296,
  name = "Prince Malchezaar",
  slug = "prince_malchezaar",
  duration = 10.0,
}

classData.spells[189297] = {
  spellID = 189297,
  name = "Illidari Satyr",
  slug = "illidari_satyr",
  duration = 10.0,
}

classData.spells[189298] = {
  spellID = 189298,
  name = "Vicious Hellhound",
  slug = "vicious_hellhound",
  duration = 10.0,
}

classData.spells[190019] = {
  spellID = 190019,
  name = "Avoidance",
  slug = "avoidance",
}

classData.spells[193332] = {
  spellID = 193332,
  name = "Call Dreadstalkers",
  slug = "call_dreadstalkers",
  max_range = 50000,
  duration = 12.0,
}

classData.spells[193541] = {
  spellID = 193541,
  name = "Immolate",
  slug = "immolate",
}

classData.spells[196098] = {
  spellID = 196098,
  name = "Soul Harvest",
  slug = "soul_harvest",
  cooldown = 120.0,
  duration = 4.0,
}

classData.spells[196099] = {
  spellID = 196099,
  name = "Grimoire of Sacrifice",
  slug = "grimoire_of_sacrifice",
  max_range = 50000,
  duration = 3600.0,
}

classData.spells[196100] = {
  spellID = 196100,
  name = "Grimoire of Sacrifice",
  slug = "grimoire_of_sacrifice",
  max_range = 50000,
}

classData.spells[196102] = {
  spellID = 196102,
  name = "Writhe in Agony",
  slug = "writhe_in_agony",
}

classData.spells[196103] = {
  spellID = 196103,
  name = "Absolute Corruption",
  slug = "absolute_corruption",
}

classData.spells[196226] = {
  spellID = 196226,
  name = "Sow the Seeds",
  slug = "sow_the_seeds",
}

classData.spells[196269] = {
  spellID = 196269,
  name = "Shadowy Inspiration",
  slug = "shadowy_inspiration",
}

classData.spells[196277] = {
  spellID = 196277,
  name = "Implosion",
  slug = "implosion",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[196278] = {
  spellID = 196278,
  name = "Implosion",
  slug = "implosion",
  max_range = 100,
}

classData.spells[196283] = {
  spellID = 196283,
  name = "Hand of Doom",
  slug = "hand_of_doom",
}

classData.spells[196300] = {
  spellID = 196300,
  name = "Demonbolt",
  slug = "demonbolt",
  max_range = 40,
}

classData.spells[196364] = {
  spellID = 196364,
  name = "Unstable Affliction",
  slug = "unstable_affliction",
  max_range = 50000,
  duration = 4.0,
}

classData.spells[196406] = {
  spellID = 196406,
  name = "Backdraft",
  slug = "backdraft",
}

classData.spells[196408] = {
  spellID = 196408,
  name = "Fire and Brimstone",
  slug = "fire_and_brimstone",
}

classData.spells[196412] = {
  spellID = 196412,
  name = "Eradication",
  slug = "eradication",
}

classData.spells[196414] = {
  spellID = 196414,
  name = "Eradication",
  slug = "eradication",
  duration = 7.0,
}

classData.spells[196447] = {
  spellID = 196447,
  name = "Channel Demonfire",
  slug = "channel_demonfire",
  max_range = 40,
  gcd = 1.5,
  cooldown = 25.0,
  duration = 3.0,
  channeled = true,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[196448] = {
  spellID = 196448,
  name = "Channel Demonfire",
  slug = "channel_demonfire",
  max_range = 100,
}

classData.spells[196449] = {
  spellID = 196449,
  name = "Channel Demonfire",
  slug = "channel_demonfire",
  max_range = 40,
}

classData.spells[196586] = {
  spellID = 196586,
  name = "Dimensional Rift",
  slug = "dimensional_rift",
  max_range = 40,
  charges = 3,
  charge_cooldown = 45.0,
  gcd = 1.5,
}

classData.spells[196606] = {
  spellID = 196606,
  name = "Shadowy Inspiration",
  slug = "shadowy_inspiration",
  initial_stacks = 1,
  duration = 15.0,
}

classData.spells[196639] = {
  spellID = 196639,
  name = "Shadowy Tear",
  slug = "shadowy_tear",
  max_range = 60,
  duration = 16.0,
}

classData.spells[196657] = {
  spellID = 196657,
  name = "Shadow Bolt",
  slug = "shadow_bolt",
  max_range = 100,
}

classData.spells[196659] = {
  spellID = 196659,
  name = "Shadow Barrage",
  slug = "shadow_barrage",
  duration = 14.0,
  haste_affected_ticks = true,
}

classData.spells[198590] = {
  spellID = 198590,
  name = "Drain Soul",
  slug = "drain_soul",
  max_range = 40,
  gcd = 1.5,
  duration = 6.0,
  channeled = true,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, per_tick = 0, },
  },
}

classData.spells[199111] = {
  spellID = 199111,
  name = "Inimitable Agony",
  slug = "inimitable_agony",
}

classData.spells[199112] = {
  spellID = 199112,
  name = "Hideous Corruption",
  slug = "hideous_corruption",
}

classData.spells[199120] = {
  spellID = 199120,
  name = "Drained to a Husk",
  slug = "drained_to_a_husk",
}

classData.spells[199152] = {
  spellID = 199152,
  name = "Inherently Unstable",
  slug = "inherently_unstable",
}

classData.spells[199153] = {
  spellID = 199153,
  name = "Seeds of Doom",
  slug = "seeds_of_doom",
}

classData.spells[199158] = {
  spellID = 199158,
  name = "Perdition",
  slug = "perdition",
}

classData.spells[199163] = {
  spellID = 199163,
  name = "Shadowy Incantations",
  slug = "shadowy_incantations",
}

classData.spells[199212] = {
  spellID = 199212,
  name = "Shadows of the Flesh",
  slug = "shadows_of_the_flesh",
}

classData.spells[199214] = {
  spellID = 199214,
  name = "Long Dark Night of the Soul",
  slug = "long_dark_night_of_the_soul",
}

classData.spells[199220] = {
  spellID = 199220,
  name = "Sweet Souls",
  slug = "sweet_souls",
}

classData.spells[199257] = {
  spellID = 199257,
  name = "Fatal Echoes",
  slug = "fatal_echoes",
}

classData.spells[199281] = {
  spellID = 199281,
  name = "Compounding Horror",
  slug = "compounding_horror",
  max_stacks = 5,
  duration = 10.0,
}

classData.spells[199282] = {
  spellID = 199282,
  name = "Compounding Horror",
  slug = "compounding_horror",
}

classData.spells[199471] = {
  spellID = 199471,
  name = "Soul Flame",
  slug = "soul_flame",
}

classData.spells[199472] = {
  spellID = 199472,
  name = "Wrath of Consumption",
  slug = "wrath_of_consumption",
}

classData.spells[199581] = {
  spellID = 199581,
  name = "Soul Flame",
  slug = "soul_flame",
  max_range = 100,
}

classData.spells[199646] = {
  spellID = 199646,
  name = "Wrath of Consumption",
  slug = "wrath_of_consumption",
  max_stacks = 5,
  duration = 20.0,
}

classData.spells[200749] = {
  spellID = 200749,
  name = "Activating Specialization",
  slug = "activating_specialization",
  max_range = 50000,
  channeled = true,
}

classData.spells[201424] = {
  spellID = 201424,
  name = "Harvester of Souls",
  slug = "harvester_of_souls",
}

classData.spells[205145] = {
  spellID = 205145,
  name = "Demonic Calling",
  slug = "demonic_calling",
}

classData.spells[205146] = {
  spellID = 205146,
  name = "Demonic Calling",
  slug = "demonic_calling",
  initial_stacks = 1,
  duration = 20.0,
}

classData.spells[205148] = {
  spellID = 205148,
  name = "Reverse Entropy",
  slug = "reverse_entropy",
}

classData.spells[205178] = {
  spellID = 205178,
  name = "Soul Effigy",
  slug = "soul_effigy",
  max_range = 40,
  gcd = 1.5,
  duration = 600.0,
}

classData.spells[205179] = {
  spellID = 205179,
  name = "Phantom Singularity",
  slug = "phantom_singularity",
  max_range = 40,
  gcd = 1.5,
  cooldown = 40.0,
  duration = 16.0,
  haste_affected_ticks = true,
}

classData.spells[205184] = {
  spellID = 205184,
  name = "Roaring Blaze",
  slug = "roaring_blaze",
}

classData.spells[205196] = {
  spellID = 205196,
  name = "Dreadbite",
  slug = "dreadbite",
  max_range = 50000,
}

classData.spells[205231] = {
  spellID = 205231,
  name = "Eye Laser",
  slug = "eye_laser",
  max_range = 40,
}

classData.spells[205246] = {
  spellID = 205246,
  name = "Phantom Singularity",
  slug = "phantom_singularity",
  max_range = 500,
}

classData.spells[205247] = {
  spellID = 205247,
  name = "Soul Effigy",
  slug = "soul_effigy",
}

classData.spells[205260] = {
  spellID = 205260,
  name = "Soul Effigy",
  slug = "soul_effigy",
  max_range = 100,
}

classData.spells[211714] = {
  spellID = 211714,
  name = "Thal'kiel's Consumption",
  slug = "thalkiels_consumption",
  max_range = 40,
  gcd = 1.5,
  cooldown = 45.0,
}

classData.spells[211715] = {
  spellID = 211715,
  name = "Thal'kiel's Consumption",
  slug = "thalkiels_consumption",
  max_range = 100,
}

classData.spells[213014] = {
  spellID = 213014,
  name = "Varo'then's Restraint",
  slug = "varothens_restraint",
}

classData.spells[213229] = {
  spellID = 213229,
  name = "Chaos Bolt",
  slug = "chaos_bolt",
  max_range = 50000,
}

classData.spells[215276] = {
  spellID = 215276,
  name = "Chaos Tear",
  slug = "chaos_tear",
  max_range = 60,
  duration = 5.0,
}

classData.spells[215279] = {
  spellID = 215279,
  name = "Chaos Bolt",
  slug = "chaos_bolt",
  max_range = 100,
}

classData.spells[215409] = {
  spellID = 215409,
  name = "Chaos Bolt",
  slug = "chaos_bolt",
  duration = 6.0,
}

classData.spells[215941] = {
  spellID = 215941,
  name = "Soul Conduit",
  slug = "soul_conduit",
}

classData.spells[216187] = {
  spellID = 216187,
  name = "Grimoire of Service",
  slug = "grimoire_of_service",
}

classData.spells[216463] = {
  spellID = 216463,
  name = "Souls of the Damned",
  slug = "souls_of_the_damned",
  duration = 90.0,
}

classData.spells[216695] = {
  spellID = 216695,
  name = "Tormented Souls",
  slug = "tormented_souls",
  max_range = 60,
  max_stacks = 12,
}

classData.spells[216698] = {
  spellID = 216698,
  name = "Reap Souls",
  slug = "reap_souls",
  cooldown = 5.0,
}

classData.spells[216708] = {
  spellID = 216708,
  name = "Deadwind Harvester",
  slug = "deadwind_harvester",
  duration = 5.0,
}

classData.spells[216721] = {
  spellID = 216721,
  name = "Souls of the Damned",
  slug = "souls_of_the_damned",
  max_range = 100,
  duration = 90.0,
}

classData.spells[216722] = {
  spellID = 216722,
  name = "Souls of the Damned",
  slug = "souls_of_the_damned",
}

classData.spells[216724] = {
  spellID = 216724,
  name = "Souls of the Damned",
  slug = "souls_of_the_damned",
}

classData.spells[218615] = {
  spellID = 218615,
  name = "Harvester of Souls",
  slug = "harvester_of_souls",
  max_range = 60,
}

classData.spells[219272] = {
  spellID = 219272,
  name = "Demon Skin",
  slug = "demon_skin",
}

classData.spells[219450] = {
  spellID = 219450,
  name = "Glyph of the Observer",
  slug = "glyph_of_the_observer",
}

classData.spells[221862] = {
  spellID = 221862,
  name = "Crystalline Shadows",
  slug = "crystalline_shadows",
}

classData.spells[224103] = {
  spellID = 224103,
  name = "Lord of Flames",
  slug = "lord_of_flames",
}

classData.spells[226772] = {
  spellID = 226772,
  name = "Totem Mastery",
  slug = "totem_mastery",
  max_range = 50000,
  duration = 120.0,
}

classData.spells[226802] = {
  spellID = 226802,
  name = "Lord of Flames",
  slug = "lord_of_flames",
  duration = 600.0,
}

classData.spells[226804] = {
  spellID = 226804,
  name = "Lord of Flames",
  slug = "lord_of_flames",
  max_range = 60,
  duration = 25.0,
}

classData.spells[231489] = {
  spellID = 231489,
  name = "Compounding Horror",
  slug = "compounding_horror",
  max_range = 40,
}

classData.spells[231791] = {
  spellID = 231791,
  name = "Unstable Affliction",
  slug = "unstable_affliction",
}

classData.spells[231792] = {
  spellID = 231792,
  name = "Agony",
  slug = "agony",
}

classData.spells[231793] = {
  spellID = 231793,
  name = "Conflagrate",
  slug = "conflagrate",
}

classData.spells[231811] = {
  spellID = 231811,
  name = "Soulstone",
  slug = "soulstone",
}

classData.spells[232670] = {
  spellID = 232670,
  name = "Shadow Bolt",
  slug = "shadow_bolt",
  max_range = 40,
  gcd = 1.5,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[233490] = {
  spellID = 233490,
  name = "Unstable Affliction",
  slug = "unstable_affliction",
  max_range = 100,
  max_stacks = 1,
  duration = 8.0,
}

classData.spells[233496] = {
  spellID = 233496,
  name = "Unstable Affliction",
  slug = "unstable_affliction",
  max_range = 100,
  max_stacks = 1,
  duration = 8.0,
}

classData.spells[233497] = {
  spellID = 233497,
  name = "Unstable Affliction",
  slug = "unstable_affliction",
  max_range = 100,
  max_stacks = 1,
  duration = 8.0,
}

classData.spells[233498] = {
  spellID = 233498,
  name = "Unstable Affliction",
  slug = "unstable_affliction",
  max_range = 100,
  max_stacks = 1,
  duration = 8.0,
}

classData.spells[233499] = {
  spellID = 233499,
  name = "Unstable Affliction",
  slug = "unstable_affliction",
  max_range = 100,
  max_stacks = 1,
  duration = 8.0,
}

classData.spells[234153] = {
  spellID = 234153,
  name = "Drain Life",
  slug = "drain_life",
  max_range = 40,
  gcd = 1.5,
  duration = 6.0,
  channeled = true,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "mana", amount = 0, per_tick = 0, },
  },
}

classData.spells[234876] = {
  spellID = 234876,
  name = "Death's Embrace",
  slug = "deaths_embrace",
}

classData.spells[238072] = {
  spellID = 238072,
  name = "Winnowing",
  slug = "winnowing",
}

classData.spells[238108] = {
  spellID = 238108,
  name = "Sinister Seeds",
  slug = "sinister_seeds",
}

classData.spells[238144] = {
  spellID = 238144,
  name = "Rend Soul",
  slug = "rend_soul",
}

classData.spells[242834] = {
  spellID = 242834,
  name = "Rend Soul",
  slug = "rend_soul",
}

classData.spells[242922] = {
  spellID = 242922,
  name = "Jaws of Shadow",
  slug = "jaws_of_shadow",
  max_range = 100,
  duration = 15.0,
}

classData.spells[243050] = {
  spellID = 243050,
  name = "Searing Bolt",
  slug = "searing_bolt",
  max_range = 100,
  max_stacks = 20,
  duration = 20.0,
}

classData.spells[244670] = {
  spellID = 244670,
  name = "Incinerate",
  slug = "incinerate",
  max_range = 100,
}

classData.spells[245330] = {
  spellID = 245330,
  name = "Conflagrate",
  slug = "conflagrate",
  max_range = 100,
}

classData.spells[245731] = {
  spellID = 245731,
  name = "Shadowburn",
  slug = "shadowburn",
  max_range = 100,
}

classData.spells[246985] = {
  spellID = 246985,
  name = "Soul Shards",
  slug = "soul_shards",
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

classData.spells[260641] = {
  spellID = 260641,
  name = "Bile Spit",
  slug = "bile_spit",
  max_range = 50,
  max_stacks = 3,
  cooldown = 3.0,
  duration = 12.0,
}

classData.spells[262031] = {
  spellID = 262031,
  name = "Empowered Healthstone",
  slug = "empowered_healthstone",
}

classData.spells[262080] = {
  spellID = 262080,
  name = "Empowered Healthstone",
  slug = "empowered_healthstone",
  duration = 6.0,
}

classData.spells[264000] = {
  spellID = 264000,
  name = "Creeping Death",
  slug = "creeping_death",
}

classData.spells[264057] = {
  spellID = 264057,
  name = "Soul Strike",
  slug = "soul_strike",
  max_range = 50,
  gcd = 1.5,
  cooldown = 10.0,
}

classData.spells[264078] = {
  spellID = 264078,
  name = "Dreadlash",
  slug = "dreadlash",
  max_range = 40,
}

classData.spells[264106] = {
  spellID = 264106,
  name = "Deathbolt",
  slug = "deathbolt",
  max_range = 40,
  gcd = 1.5,
  cooldown = 25.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[264119] = {
  spellID = 264119,
  name = "Summon Vilefiend",
  slug = "summon_vilefiend",
  max_range = 40,
  gcd = 1.5,
  cooldown = 45.0,
  duration = 15.0,
  power = {
    [1] = { resource = "soul_shard", amount = 1, },
  },
}

classData.spells[264130] = {
  spellID = 264130,
  name = "Power Siphon",
  slug = "power_siphon",
  max_range = 100,
  gcd = 1.5,
  cooldown = 30.0,
}

classData.spells[264173] = {
  spellID = 264173,
  name = "Demonic Core",
  slug = "demonic_core",
  max_range = 100,
  max_stacks = 4,
  duration = 20.0,
}

classData.spells[264178] = {
  spellID = 264178,
  name = "Demonbolt",
  slug = "demonbolt",
  max_range = 40,
  gcd = 1.5,
}

classData.spells[264364] = {
  spellID = 264364,
  name = "Embers",
  slug = "embers",
  max_range = 100,
}

classData.spells[264365] = {
  spellID = 264365,
  name = "Burning Ember",
  slug = "burning_ember",
  max_range = 100,
}

classData.spells[264571] = {
  spellID = 264571,
  name = "Nightfall",
  slug = "nightfall",
  initial_stacks = 1,
  duration = 12.0,
}

classData.spells[264874] = {
  spellID = 264874,
  name = "Darkfury",
  slug = "darkfury",
}

classData.spells[264993] = {
  spellID = 264993,
  name = "Shadow Shield",
  slug = "shadow_shield",
  gcd = 1.5,
  cooldown = 10.0,
}

classData.spells[265187] = {
  spellID = 265187,
  name = "Summon Demonic Tyrant",
  slug = "summon_demonic_tyrant",
  max_range = 40,
  gcd = 1.5,
  cooldown = 90.0,
  duration = 15.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[265273] = {
  spellID = 265273,
  name = "Demonic Power",
  slug = "demonic_power",
  max_range = 100,
  gcd = 1.5,
  cooldown = 90.0,
  duration = 15.0,
}

classData.spells[265279] = {
  spellID = 265279,
  name = "Demonfire Blast",
  slug = "demonfire_blast",
  max_range = 40,
}

classData.spells[265412] = {
  spellID = 265412,
  name = "Doom",
  slug = "doom",
  max_range = 40,
  gcd = 1.5,
  duration = 30.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[265469] = {
  spellID = 265469,
  name = "Doom",
  slug = "doom",
  max_range = 50000,
}

classData.spells[265931] = {
  spellID = 265931,
  name = "Roaring Blaze",
  slug = "roaring_blaze",
  max_range = 100,
  duration = 6.0,
  haste_affected_ticks = true,
}

classData.spells[266030] = {
  spellID = 266030,
  name = "Reverse Entropy",
  slug = "reverse_entropy",
  duration = 8.0,
}

classData.spells[266086] = {
  spellID = 266086,
  name = "Grimoire of Supremacy",
  slug = "grimoire_of_supremacy",
}

classData.spells[266091] = {
  spellID = 266091,
  name = "Grimoire of Supremacy",
  slug = "grimoire_of_supremacy",
  max_stacks = 20,
}

classData.spells[266134] = {
  spellID = 266134,
  name = "Internal Combustion",
  slug = "internal_combustion",
}

classData.spells[267102] = {
  spellID = 267102,
  name = "Demonic Core",
  slug = "demonic_core",
  max_range = 100,
}

classData.spells[267115] = {
  spellID = 267115,
  name = "Flashover",
  slug = "flashover",
}

classData.spells[267170] = {
  spellID = 267170,
  name = "From the Shadows",
  slug = "from_the_shadows",
  max_range = 40,
}

classData.spells[267171] = {
  spellID = 267171,
  name = "Demonic Strength",
  slug = "demonic_strength",
  max_range = 100,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 20.0,
}

classData.spells[267211] = {
  spellID = 267211,
  name = "Bilescourge Bombers",
  slug = "bilescourge_bombers",
  max_range = 100,
  gcd = 1.5,
  cooldown = 30.0,
  duration = 6.0,
  power = {
    [1] = { resource = "soul_shard", amount = 2, },
  },
}

classData.spells[267213] = {
  spellID = 267213,
  name = "Bilescourge Bombers",
  slug = "bilescourge_bombers",
  max_range = 100,
}

classData.spells[267214] = {
  spellID = 267214,
  name = "Sacrificed Souls",
  slug = "sacrificed_souls",
  max_range = 100,
}

classData.spells[267215] = {
  spellID = 267215,
  name = "Demonic Consumption",
  slug = "demonic_consumption",
  max_range = 100,
}

classData.spells[267216] = {
  spellID = 267216,
  name = "Inner Demons",
  slug = "inner_demons",
  max_range = 100,
}

classData.spells[267217] = {
  spellID = 267217,
  name = "Nether Portal",
  slug = "nether_portal",
  max_range = 40,
  gcd = 1.5,
  cooldown = 180.0,
  duration = 20.0,
  power = {
    [1] = { resource = "soul_shard", amount = 3, },
  },
}

classData.spells[267964] = {
  spellID = 267964,
  name = "Soul Strike",
  slug = "soul_strike",
  max_range = 100,
}

classData.spells[267971] = {
  spellID = 267971,
  name = "Demonic Consumption",
  slug = "demonic_consumption",
  max_range = 100,
}

classData.spells[267972] = {
  spellID = 267972,
  name = "Demonic Consumption",
  slug = "demonic_consumption",
  max_range = 100,
  duration = 20.0,
}

classData.spells[267987] = {
  spellID = 267987,
  name = "Summon Illidari Satyr",
  slug = "summon_illidari_satyr",
  max_range = 100,
  duration = 15.0,
}

classData.spells[267988] = {
  spellID = 267988,
  name = "Summon Vicious Hellhound",
  slug = "summon_vicious_hellhound",
  max_range = 100,
  duration = 15.0,
}

classData.spells[267989] = {
  spellID = 267989,
  name = "Summon Eyes of Gul'dan",
  slug = "summon_eyes_of_guldan",
  max_range = 100,
  duration = 15.0,
}

classData.spells[267991] = {
  spellID = 267991,
  name = "Summon Void Terror",
  slug = "summon_void_terror",
  max_range = 100,
  duration = 15.0,
}

classData.spells[267992] = {
  spellID = 267992,
  name = "Summon Bilescourge",
  slug = "summon_bilescourge",
  max_range = 100,
  duration = 15.0,
}

classData.spells[267994] = {
  spellID = 267994,
  name = "Summon Shivarra",
  slug = "summon_shivarra",
  max_range = 100,
  duration = 15.0,
}

classData.spells[267995] = {
  spellID = 267995,
  name = "Summon Wrathguard",
  slug = "summon_wrathguard",
  max_range = 100,
  duration = 15.0,
}

classData.spells[267996] = {
  spellID = 267996,
  name = "Summon Darkhound",
  slug = "summon_darkhound",
  max_range = 100,
  duration = 15.0,
}

classData.spells[268001] = {
  spellID = 268001,
  name = "Summon Ur'zul",
  slug = "summon_urzul",
  max_range = 100,
  duration = 15.0,
}

classData.spells[268044] = {
  spellID = 268044,
  name = "Coming Soon",
  slug = "coming_soon",
}

classData.spells[268358] = {
  spellID = 268358,
  name = "Demonic Circle",
  slug = "demonic_circle",
  cooldown = 10.0,
  power = {
    [1] = { resource = "mana", amount = 0, },
  },
}

classData.spells[270481] = {
  spellID = 270481,
  name = "Demonfire",
  slug = "demonfire",
  max_range = 40,
}

classData.spells[270545] = {
  spellID = 270545,
  name = "Inferno",
  slug = "inferno",
}

classData.spells[270569] = {
  spellID = 270569,
  name = "From the Shadows",
  slug = "from_the_shadows",
  max_range = 100,
  duration = 12.0,
}

classData.spells[271971] = {
  spellID = 271971,
  name = "Dreadbite",
  slug = "dreadbite",
  max_range = 50000,
}

classData.spells[272012] = {
  spellID = 272012,
  name = "Shadow Slash",
  slug = "shadow_slash",
  max_range = 5,
  gcd = 1.0,
}

classData.spells[272013] = {
  spellID = 272013,
  name = "Demon Fangs",
  slug = "demon_fangs",
  max_range = 5,
  gcd = 1.0,
}

classData.spells[272131] = {
  spellID = 272131,
  name = "Eye of Gul'dan",
  slug = "eye_of_guldan",
  max_range = 100,
  gcd = 1.0,
  cooldown = 4.0,
  duration = 15.0,
  channeled = true,
}

classData.spells[272156] = {
  spellID = 272156,
  name = "Double Breath",
  slug = "double_breath",
  max_range = 5,
  gcd = 1.0,
}

classData.spells[272167] = {
  spellID = 272167,
  name = "Toxic Bile",
  slug = "toxic_bile",
  max_range = 40,
  gcd = 1.0,
}

classData.spells[272172] = {
  spellID = 272172,
  name = "Multi-Slash",
  slug = "multislash",
  max_range = 5,
  gcd = 1.0,
}

classData.spells[272432] = {
  spellID = 272432,
  name = "Overhead Assault",
  slug = "overhead_assault",
  max_range = 5,
  gcd = 1.0,
}

classData.spells[272435] = {
  spellID = 272435,
  name = "Fel Bite",
  slug = "fel_bite",
  max_range = 5,
  gcd = 1.0,
}

classData.spells[272439] = {
  spellID = 272439,
  name = "Many Faced Bite",
  slug = "many_faced_bite",
  max_range = 5,
  gcd = 1.0,
}

classData.spells[272591] = {
  spellID = 272591,
  name = "Sacrificed Souls",
  slug = "sacrificed_souls",
  max_range = 100,
  max_stacks = 5,
  duration = 10.0,
}
