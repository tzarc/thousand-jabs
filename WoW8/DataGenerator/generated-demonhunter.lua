----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BfA only.
----------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(4, GetBuildInfo()) < 80000 then
    return
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Class check
----------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(3, UnitClass('player')) ~= 12 then return end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
local addonName, TJ = ...
TJ.ClassData = TJ.ClassData or {}
TJ.ClassData[12] = TJ.ClassData[12] or {}
local classData = TJ.ClassData[12]
classData.spells = classData.spells or {}

classData.spells[674] = {
  spellID = 674,
  name = "Dual Wield",
  slug = "dual_wield",
}

classData.spells[1490] = {
  spellID = 1490,
  name = "Chaos Brand",
  slug = "chaos_brand",
  max_range = 100,
}

classData.spells[21563] = {
  spellID = 21563,
  name = "Command",
  slug = "command",
}

classData.spells[131347] = {
  spellID = 131347,
  name = "Glide",
  slug = "glide",
  cooldown = 1.5,
}

classData.spells[162243] = {
  spellID = 162243,
  name = "Demon's Bite",
  slug = "demons_bite",
  max_range = 5,
  gcd = 1.5,
}

classData.spells[162264] = {
  spellID = 162264,
  name = "Metamorphosis",
  slug = "metamorphosis",
  duration = 30.0,
}

classData.spells[162697] = {
  spellID = 162697,
  name = "Stat Negation Aura - Agility DPS",
  slug = "stat_negation_aura__agility_dps",
}

classData.spells[162700] = {
  spellID = 162700,
  name = "Stat Negation Aura - Agility Tank",
  slug = "stat_negation_aura__agility_tank",
}

classData.spells[162794] = {
  spellID = 162794,
  name = "Chaos Strike",
  slug = "chaos_strike",
  max_range = 5,
  gcd = 1.5,
  power = {
    [1] = { resource = "fury", amount = 40, },
  },
}

classData.spells[163073] = {
  spellID = 163073,
  name = "Demon Soul",
  slug = "demon_soul",
  duration = 15.0,
}

classData.spells[178740] = {
  spellID = 178740,
  name = "Immolation Aura",
  slug = "immolation_aura",
  replaces_spell_id = 198013,
  gcd = 1.5,
  cooldown = 15.0,
  duration = 6.0,
}

classData.spells[178741] = {
  spellID = 178741,
  name = "Immolation Aura",
  slug = "immolation_aura",
}

classData.spells[178940] = {
  spellID = 178940,
  name = "Shattered Souls",
  slug = "shattered_souls",
}

classData.spells[178963] = {
  spellID = 178963,
  name = "Consume Soul",
  slug = "consume_soul",
  max_range = 100,
}

classData.spells[178976] = {
  spellID = 178976,
  name = "Leather Specialization",
  slug = "leather_specialization",
}

classData.spells[179057] = {
  spellID = 179057,
  name = "Chaos Nova",
  slug = "chaos_nova",
  initial_stacks = 1,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 5.0,
  power = {
    [1] = { resource = "fury", amount = 30, },
  },
}

classData.spells[183752] = {
  spellID = 183752,
  name = "Consume Magic",
  slug = "consume_magic",
  max_range = 10,
  cooldown = 15.0,
  duration = 3.0,
}

classData.spells[183782] = {
  spellID = 183782,
  name = "Consume Magic",
  slug = "consume_magic",
}

classData.spells[185123] = {
  spellID = 185123,
  name = "Throw Glaive",
  slug = "throw_glaive",
  max_range = 30,
  charges = 1,
  charge_cooldown = 9.0,
  gcd = 1.5,
}

classData.spells[185164] = {
  spellID = 185164,
  name = "Mastery: Demonic Presence",
  slug = "mastery_demonic_presence",
}

classData.spells[185245] = {
  spellID = 185245,
  name = "Torment",
  slug = "torment",
  replaces_spell_id = 198589,
  max_range = 30,
  cooldown = 8.0,
  duration = 3.0,
}

classData.spells[186452] = {
  spellID = 186452,
  name = "Energy Regen",
  slug = "energy_regen",
}

classData.spells[187727] = {
  spellID = 187727,
  name = "Immolation Aura",
  slug = "immolation_aura",
}

classData.spells[187827] = {
  spellID = 187827,
  name = "Metamorphosis",
  slug = "metamorphosis",
  replaces_spell_id = 191427,
  cooldown = 180.0,
  duration = 15.0,
}

classData.spells[188499] = {
  spellID = 188499,
  name = "Blade Dance",
  slug = "blade_dance",
  gcd = 1.5,
  cooldown = 9.0,
  duration = 1.0,
  power = {
    [1] = { resource = "fury", amount = 35, },
  },
}

classData.spells[188501] = {
  spellID = 188501,
  name = "Spectral Sight",
  slug = "spectral_sight",
  gcd = 1.5,
  cooldown = 30.0,
  duration = 10.0,
}

classData.spells[189110] = {
  spellID = 189110,
  name = "Infernal Strike",
  slug = "infernal_strike",
  replaces_spell_id = 195072,
  max_range = 30,
  charges = 2,
  charge_cooldown = 20.0,
  gcd = 0.5,
  cooldown = 0.8,
}

classData.spells[189112] = {
  spellID = 189112,
  name = "Infernal Strike",
  slug = "infernal_strike",
  max_range = 50000,
}

classData.spells[189926] = {
  spellID = 189926,
  name = "Increased Threat",
  slug = "increased_threat",
}

classData.spells[191427] = {
  spellID = 191427,
  name = "Metamorphosis",
  slug = "metamorphosis",
  max_range = 40,
  gcd = 1.5,
  cooldown = 240.0,
}

classData.spells[192611] = {
  spellID = 192611,
  name = "Fel Rush",
  slug = "fel_rush",
  max_range = 50000,
}

classData.spells[192939] = {
  spellID = 192939,
  name = "Fel Mastery",
  slug = "fel_mastery",
  internal_cooldown = 1.0,
}

classData.spells[193840] = {
  spellID = 193840,
  name = "Chaos Strike",
  slug = "chaos_strike",
}

classData.spells[195072] = {
  spellID = 195072,
  name = "Fel Rush",
  slug = "fel_rush",
  charges = 2,
  charge_cooldown = 10.0,
  gcd = 0.2,
  cooldown = 1.0,
}

classData.spells[196055] = {
  spellID = 196055,
  name = "Double Jump",
  slug = "double_jump",
}

classData.spells[196555] = {
  spellID = 196555,
  name = "Netherwalk",
  slug = "netherwalk",
  gcd = 1.5,
  cooldown = 120.0,
  duration = 5.0,
}

classData.spells[196718] = {
  spellID = 196718,
  name = "Darkness",
  slug = "darkness",
  gcd = 1.5,
  cooldown = 180.0,
  duration = 8.0,
}

classData.spells[197125] = {
  spellID = 197125,
  name = "Chaos Strike",
  slug = "chaos_strike",
  internal_cooldown = 0.5,
}

classData.spells[197130] = {
  spellID = 197130,
  name = "Glide",
  slug = "glide",
}

classData.spells[198013] = {
  spellID = 198013,
  name = "Eye Beam",
  slug = "eye_beam",
  max_range = 20,
  gcd = 1.5,
  cooldown = 30.0,
  duration = 2.0,
  channeled = true,
  haste_affected_ticks = true,
  power = {
    [1] = { resource = "fury", amount = 30, },
  },
}

classData.spells[198030] = {
  spellID = 198030,
  name = "Eye Beam",
  slug = "eye_beam",
  max_range = 50000,
}

classData.spells[198589] = {
  spellID = 198589,
  name = "Blur",
  slug = "blur",
  cooldown = 60.0,
}

classData.spells[198793] = {
  spellID = 198793,
  name = "Vengeful Retreat",
  slug = "vengeful_retreat",
  gcd = 0.5,
  cooldown = 25.0,
  duration = 1.0,
}

classData.spells[198813] = {
  spellID = 198813,
  name = "Vengeful Retreat",
  slug = "vengeful_retreat",
  duration = 3.0,
}

classData.spells[199547] = {
  spellID = 199547,
  name = "Chaos Strike",
  slug = "chaos_strike",
  max_range = 15,
}

classData.spells[199552] = {
  spellID = 199552,
  name = "Blade Dance",
  slug = "blade_dance",
}

classData.spells[200166] = {
  spellID = 200166,
  name = "Metamorphosis",
  slug = "metamorphosis",
  duration = 3.0,
}

classData.spells[200685] = {
  spellID = 200685,
  name = "Blade Dance",
  slug = "blade_dance",
}

classData.spells[200749] = {
  spellID = 200749,
  name = "Activating Specialization",
  slug = "activating_specialization",
  max_range = 50000,
  channeled = true,
}

classData.spells[201427] = {
  spellID = 201427,
  name = "Annihilation",
  slug = "annihilation",
  max_range = 5,
  gcd = 1.5,
  power = {
    [1] = { resource = "fury", amount = 40, },
  },
}

classData.spells[201428] = {
  spellID = 201428,
  name = "Annihilation",
  slug = "annihilation",
  max_range = 15,
}

classData.spells[201453] = {
  spellID = 201453,
  name = "Metamorphosis",
  slug = "metamorphosis",
  duration = 1.0,
}

classData.spells[201467] = {
  spellID = 201467,
  name = "Fury of the Illidari",
  slug = "fury_of_the_illidari",
  max_range = 40,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 3.0,
}

classData.spells[201472] = {
  spellID = 201472,
  name = "Rage of the Illidari",
  slug = "rage_of_the_illidari",
}

classData.spells[201473] = {
  spellID = 201473,
  name = "Anguish of the Deceiver",
  slug = "anguish_of_the_deceiver",
}

classData.spells[201628] = {
  spellID = 201628,
  name = "Fury of the Illidari",
  slug = "fury_of_the_illidari",
  max_range = 100,
}

classData.spells[201789] = {
  spellID = 201789,
  name = "Fury of the Illidari",
  slug = "fury_of_the_illidari",
  max_range = 100,
}

classData.spells[202137] = {
  spellID = 202137,
  name = "Sigil of Silence",
  slug = "sigil_of_silence",
  max_range = 30,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 2.0,
}

classData.spells[202138] = {
  spellID = 202138,
  name = "Sigil of Chains",
  slug = "sigil_of_chains",
  max_range = 30,
  gcd = 1.5,
  cooldown = 90.0,
  duration = 2.0,
}

classData.spells[202388] = {
  spellID = 202388,
  name = "Inner Demons",
  slug = "inner_demons",
  max_range = 100,
}

classData.spells[202443] = {
  spellID = 202443,
  name = "Anguish",
  slug = "anguish",
  max_range = 100,
  max_stacks = 30,
  duration = 2.0,
}

classData.spells[202446] = {
  spellID = 202446,
  name = "Anguish",
  slug = "anguish",
  max_range = 100,
  max_stacks = 30,
}

classData.spells[202688] = {
  spellID = 202688,
  name = "Spectral Sight",
  slug = "spectral_sight",
}

classData.spells[202719] = {
  spellID = 202719,
  name = "Arcane Torrent",
  slug = "arcane_torrent",
  gcd = 1.5,
  cooldown = 90.0,
}

classData.spells[203513] = {
  spellID = 203513,
  name = "Demonic Wards",
  slug = "demonic_wards",
}

classData.spells[203550] = {
  spellID = 203550,
  name = "Blind Fury",
  slug = "blind_fury",
}

classData.spells[203551] = {
  spellID = 203551,
  name = "Prepared",
  slug = "prepared",
}

classData.spells[203555] = {
  spellID = 203555,
  name = "Demon Blades",
  slug = "demon_blades",
}

classData.spells[203556] = {
  spellID = 203556,
  name = "Master of the Glaive",
  slug = "master_of_the_glaive",
}

classData.spells[203557] = {
  spellID = 203557,
  name = "Felblade",
  slug = "felblade",
}

classData.spells[203650] = {
  spellID = 203650,
  name = "Prepared",
  slug = "prepared",
  duration = 10.0,
}

classData.spells[203720] = {
  spellID = 203720,
  name = "Demon Spikes",
  slug = "demon_spikes",
  replaces_spell_id = 198793,
  charges = 2,
  charge_cooldown = 20.0,
  cooldown = 1.5,
}

classData.spells[203724] = {
  spellID = 203724,
  name = "Parry",
  slug = "parry",
}

classData.spells[203747] = {
  spellID = 203747,
  name = "Mastery: Fel Blood",
  slug = "mastery_fel_blood",
}

classData.spells[203782] = {
  spellID = 203782,
  name = "Shear",
  slug = "shear",
  max_range = 5,
  gcd = 1.5,
}

classData.spells[203783] = {
  spellID = 203783,
  name = "Shear",
  slug = "shear",
}

classData.spells[203794] = {
  spellID = 203794,
  name = "Consume Soul",
  slug = "consume_soul",
  max_range = 100,
}

classData.spells[203795] = {
  spellID = 203795,
  name = "Soul Fragment",
  slug = "soul_fragment",
  max_range = 100,
  duration = 20.0,
}

classData.spells[203796] = {
  spellID = 203796,
  name = "Demon Blades",
  slug = "demon_blades",
  max_range = 5,
  gcd = 1.5,
}

classData.spells[203819] = {
  spellID = 203819,
  name = "Demon Spikes",
  slug = "demon_spikes",
  duration = 6.0,
}

classData.spells[204021] = {
  spellID = 204021,
  name = "Fiery Brand",
  slug = "fiery_brand",
  replaces_spell_id = 179057,
  max_range = 30,
  gcd = 1.5,
  cooldown = 60.0,
}

classData.spells[204157] = {
  spellID = 204157,
  name = "Throw Glaive",
  slug = "throw_glaive",
  replaces_spell_id = 185123,
  max_range = 30,
  gcd = 1.5,
  cooldown = 3.0,
}

classData.spells[204254] = {
  spellID = 204254,
  name = "Shattered Souls",
  slug = "shattered_souls",
  internal_cooldown = 1.0,
}

classData.spells[204255] = {
  spellID = 204255,
  name = "Soul Fragment",
  slug = "soul_fragment",
  max_range = 100,
  duration = 20.0,
}

classData.spells[204490] = {
  spellID = 204490,
  name = "Sigil of Silence",
  slug = "sigil_of_silence",
  max_range = 100,
  duration = 6.0,
}

classData.spells[204497] = {
  spellID = 204497,
  name = "Felblade",
  slug = "felblade",
  duration = 3.0,
}

classData.spells[204596] = {
  spellID = 204596,
  name = "Sigil of Flame",
  slug = "sigil_of_flame",
  replaces_spell_id = 188499,
  max_range = 30,
  gcd = 1.5,
  cooldown = 30.0,
  duration = 2.0,
}

classData.spells[204598] = {
  spellID = 204598,
  name = "Sigil of Flame",
  slug = "sigil_of_flame",
  max_range = 100,
  duration = 6.0,
}

classData.spells[204843] = {
  spellID = 204843,
  name = "Sigil of Chains",
  slug = "sigil_of_chains",
  max_range = 100,
  duration = 6.0,
}

classData.spells[204909] = {
  spellID = 204909,
  name = "Soul Rending",
  slug = "soul_rending",
}

classData.spells[205411] = {
  spellID = 205411,
  name = "Desperate Instincts",
  slug = "desperate_instincts",
}

classData.spells[205478] = {
  spellID = 205478,
  name = "Desperate Instincts",
  slug = "desperate_instincts",
}

classData.spells[206416] = {
  spellID = 206416,
  name = "First Blood",
  slug = "first_blood",
}

classData.spells[206476] = {
  spellID = 206476,
  name = "Momentum",
  slug = "momentum",
  internal_cooldown = 0.5,
}

classData.spells[206477] = {
  spellID = 206477,
  name = "Unleashed Power",
  slug = "unleashed_power",
}

classData.spells[206478] = {
  spellID = 206478,
  name = "Demonic Appetite",
  slug = "demonic_appetite",
}

classData.spells[206491] = {
  spellID = 206491,
  name = "Nemesis",
  slug = "nemesis",
  max_range = 50,
  gcd = 1.5,
  cooldown = 120.0,
  duration = 60.0,
}

classData.spells[207197] = {
  spellID = 207197,
  name = "Riposte",
  slug = "riposte",
}

classData.spells[207407] = {
  spellID = 207407,
  name = "Soul Carver",
  slug = "soul_carver",
  max_range = 5,
  gcd = 1.5,
  cooldown = 40.0,
  duration = 3.0,
}

classData.spells[207548] = {
  spellID = 207548,
  name = "Agonizing Flames",
  slug = "agonizing_flames",
}

classData.spells[207550] = {
  spellID = 207550,
  name = "Abyssal Strike",
  slug = "abyssal_strike",
}

classData.spells[207666] = {
  spellID = 207666,
  name = "Concentrated Sigils",
  slug = "concentrated_sigils",
}

classData.spells[207684] = {
  spellID = 207684,
  name = "Sigil of Misery",
  slug = "sigil_of_misery",
  max_range = 30,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 2.0,
}

classData.spells[207685] = {
  spellID = 207685,
  name = "Sigil of Misery",
  slug = "sigil_of_misery",
  max_range = 100,
  duration = 20.0,
}

classData.spells[207693] = {
  spellID = 207693,
  name = "Feast of Souls",
  slug = "feast_of_souls",
  max_range = 100,
  duration = 6.0,
}

classData.spells[207697] = {
  spellID = 207697,
  name = "Feast of Souls",
  slug = "feast_of_souls",
}

classData.spells[207739] = {
  spellID = 207739,
  name = "Burning Alive",
  slug = "burning_alive",
}

classData.spells[207744] = {
  spellID = 207744,
  name = "Fiery Brand",
  slug = "fiery_brand",
  max_range = 100,
  duration = 8.0,
}

classData.spells[207771] = {
  spellID = 207771,
  name = "Fiery Brand",
  slug = "fiery_brand",
  max_range = 100,
  duration = 8.0,
}

classData.spells[208605] = {
  spellID = 208605,
  name = "Nemesis",
  slug = "nemesis",
  duration = 60.0,
}

classData.spells[208628] = {
  spellID = 208628,
  name = "Momentum",
  slug = "momentum",
  duration = 6.0,
}

classData.spells[208827] = {
  spellID = 208827,
  name = "Anger of the Half-Giants",
  slug = "anger_of_the_halfgiants",
}

classData.spells[209245] = {
  spellID = 209245,
  name = "Fiery Brand",
  slug = "fiery_brand",
  max_range = 30,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 12.0,
}

classData.spells[209247] = {
  spellID = 209247,
  name = "Fiery Brand",
  slug = "fiery_brand",
  max_range = 40,
  duration = 30.0,
}

classData.spells[209258] = {
  spellID = 209258,
  name = "Last Resort",
  slug = "last_resort",
}

classData.spells[209261] = {
  spellID = 209261,
  name = "Uncontained Fel",
  slug = "uncontained_fel",
  max_range = 50000,
  duration = 480.0,
}

classData.spells[209281] = {
  spellID = 209281,
  name = "Quickened Sigils",
  slug = "quickened_sigils",
}

classData.spells[209400] = {
  spellID = 209400,
  name = "Razor Spikes",
  slug = "razor_spikes",
}

classData.spells[209426] = {
  spellID = 209426,
  name = "Darkness",
  slug = "darkness",
  max_range = 100,
  duration = 8.0,
}

classData.spells[209795] = {
  spellID = 209795,
  name = "Fracture",
  slug = "fracture",
  max_range = 5,
  gcd = 1.5,
  power = {
    [1] = { resource = "pain", amount = 30, },
  },
}

classData.spells[210003] = {
  spellID = 210003,
  name = "Razor Spikes",
  slug = "razor_spikes",
  max_range = 5,
  duration = 6.0,
}

classData.spells[210041] = {
  spellID = 210041,
  name = "Demonic Appetite",
  slug = "demonic_appetite",
}

classData.spells[210042] = {
  spellID = 210042,
  name = "Consume Soul",
  slug = "consume_soul",
  max_range = 100,
}

classData.spells[210152] = {
  spellID = 210152,
  name = "Death Sweep",
  slug = "death_sweep",
  gcd = 1.5,
  cooldown = 9.0,
  duration = 1.0,
  power = {
    [1] = { resource = "fury", amount = 35, },
  },
}

classData.spells[210153] = {
  spellID = 210153,
  name = "Death Sweep",
  slug = "death_sweep",
}

classData.spells[210155] = {
  spellID = 210155,
  name = "Death Sweep",
  slug = "death_sweep",
}

classData.spells[210788] = {
  spellID = 210788,
  name = "Soul Fragments",
  slug = "soul_fragments",
  duration = 25.0,
}

classData.spells[211796] = {
  spellID = 211796,
  name = "Chaos Blades",
  slug = "chaos_blades",
  max_range = 30,
}

classData.spells[211881] = {
  spellID = 211881,
  name = "Fel Eruption",
  slug = "fel_eruption",
  max_range = 20,
  gcd = 1.5,
  cooldown = 30.0,
  duration = 4.0,
  power = {
    [1] = { resource = "fury", amount = 10, aura = 212612, },
    [2] = { resource = "pain", amount = 10, aura = 212613, },
  },
}

classData.spells[212084] = {
  spellID = 212084,
  name = "Fel Devastation",
  slug = "fel_devastation",
  max_range = 20,
  gcd = 1.5,
  cooldown = 60.0,
  duration = 2.0,
  channeled = true,
  haste_affected_ticks = true,
}

classData.spells[212105] = {
  spellID = 212105,
  name = "Fel Devastation",
  slug = "fel_devastation",
  max_range = 50000,
}

classData.spells[212106] = {
  spellID = 212106,
  name = "Fel Devastation",
  slug = "fel_devastation",
}

classData.spells[212611] = {
  spellID = 212611,
  name = "Demon Hunter",
  slug = "demon_hunter",
}

classData.spells[212612] = {
  spellID = 212612,
  name = "Havoc Demon Hunter",
  slug = "havoc_demon_hunter",
}

classData.spells[212613] = {
  spellID = 212613,
  name = "Vengeance Demon Hunter",
  slug = "vengeance_demon_hunter",
}

classData.spells[212800] = {
  spellID = 212800,
  name = "Blur",
  slug = "blur",
  cooldown = 60.0,
  duration = 10.0,
}

classData.spells[212817] = {
  spellID = 212817,
  name = "Fiery Demise",
  slug = "fiery_demise",
}

classData.spells[212818] = {
  spellID = 212818,
  name = "Fiery Demise",
  slug = "fiery_demise",
  max_range = 100,
  duration = 8.0,
}

classData.spells[213011] = {
  spellID = 213011,
  name = "Charred Warblades",
  slug = "charred_warblades",
}

classData.spells[213243] = {
  spellID = 213243,
  name = "Felblade",
  slug = "felblade",
  max_range = 15,
}

classData.spells[213405] = {
  spellID = 213405,
  name = "Master of the Glaive",
  slug = "master_of_the_glaive",
  max_range = 100,
  duration = 6.0,
}

classData.spells[213410] = {
  spellID = 213410,
  name = "Demonic",
  slug = "demonic",
}

classData.spells[214743] = {
  spellID = 214743,
  name = "Soul Carver",
  slug = "soul_carver",
  max_range = 5,
  gcd = 1.5,
  cooldown = 60.0,
}

classData.spells[215725] = {
  spellID = 215725,
  name = "Spectral Sight",
  slug = "spectral_sight",
  duration = 30.0,
}

classData.spells[217060] = {
  spellID = 217060,
  name = "Rage of the Illidari",
  slug = "rage_of_the_illidari",
  duration = 30.0,
}

classData.spells[217070] = {
  spellID = 217070,
  name = "Rage of the Illidari",
  slug = "rage_of_the_illidari",
  max_range = 100,
}

classData.spells[217832] = {
  spellID = 217832,
  name = "Imprison",
  slug = "imprison",
  max_range = 20,
  initial_stacks = 1,
  gcd = 1.5,
  cooldown = 45.0,
  duration = 60.0,
}

classData.spells[217996] = {
  spellID = 217996,
  name = "Soul Rending",
  slug = "soul_rending",
}

classData.spells[218612] = {
  spellID = 218612,
  name = "Feed the Demon",
  slug = "feed_the_demon",
}

classData.spells[218903] = {
  spellID = 218903,
  name = "Consume Magic",
  slug = "consume_magic",
}

classData.spells[221351] = {
  spellID = 221351,
  name = "Critical Strikes",
  slug = "critical_strikes",
}

classData.spells[221461] = {
  spellID = 221461,
  name = "Shattered Souls",
  slug = "shattered_souls",
  duration = 15.0,
}

classData.spells[222031] = {
  spellID = 222031,
  name = "Chaos Strike",
  slug = "chaos_strike",
  max_range = 15,
}

classData.spells[222703] = {
  spellID = 222703,
  name = "Fel Barrage",
  slug = "fel_barrage",
}

classData.spells[225919] = {
  spellID = 225919,
  name = "Fracture",
  slug = "fracture",
  max_range = 20,
}

classData.spells[225921] = {
  spellID = 225921,
  name = "Fracture",
  slug = "fracture",
  max_range = 20,
}

classData.spells[226359] = {
  spellID = 226359,
  name = "Leather Specialization",
  slug = "leather_specialization",
}

classData.spells[227174] = {
  spellID = 227174,
  name = "Fallout",
  slug = "fallout",
}

classData.spells[227255] = {
  spellID = 227255,
  name = "Spirit Bomb",
  slug = "spirit_bomb",
  max_range = 100,
}

classData.spells[227322] = {
  spellID = 227322,
  name = "Flame Crash",
  slug = "flame_crash",
}

classData.spells[227518] = {
  spellID = 227518,
  name = "Annihilation",
  slug = "annihilation",
  max_range = 15,
}

classData.spells[228477] = {
  spellID = 228477,
  name = "Soul Cleave",
  slug = "soul_cleave",
  replaces_spell_id = 162794,
  max_range = 5,
  gcd = 1.5,
  power = {
    [1] = { resource = "pain", amount = 30, },
  },
}

classData.spells[228478] = {
  spellID = 228478,
  name = "Soul Cleave",
  slug = "soul_cleave",
  max_range = 5,
}

classData.spells[232709] = {
  spellID = 232709,
  name = "Vengeful Retreat",
  slug = "vengeful_retreat",
  duration = 0.1,
}

classData.spells[232893] = {
  spellID = 232893,
  name = "Felblade",
  slug = "felblade",
  max_range = 15,
  gcd = 1.5,
  cooldown = 15.0,
}

classData.spells[236167] = {
  spellID = 236167,
  name = "Felblade",
  slug = "felblade",
}

classData.spells[243160] = {
  spellID = 243160,
  name = "Erupting Souls",
  slug = "erupting_souls",
  max_range = 100,
}

classData.spells[247121] = {
  spellID = 247121,
  name = "Metamorphosis",
  slug = "metamorphosis",
  max_range = 40,
  duration = 3.0,
}

classData.spells[247454] = {
  spellID = 247454,
  name = "Spirit Bomb",
  slug = "spirit_bomb",
  max_range = 40,
  gcd = 1.5,
  duration = 1.5,
  power = {
    [1] = { resource = "pain", amount = 30, },
  },
}

classData.spells[247455] = {
  spellID = 247455,
  name = "Spirit Bomb",
  slug = "spirit_bomb",
  max_range = 100,
}

classData.spells[247456] = {
  spellID = 247456,
  name = "Frailty",
  slug = "frailty",
  max_range = 100,
  duration = 20.0,
}

classData.spells[251463] = {
  spellID = 251463,
  name = "Vindicaar Matrix Crystal",
  slug = "vindicaar_matrix_crystal",
  gcd = 1.5,
}

classData.spells[255260] = {
  spellID = 255260,
  name = "Chaos Brand",
  slug = "chaos_brand",
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

classData.spells[258860] = {
  spellID = 258860,
  name = "Dark Slash",
  slug = "dark_slash",
  max_range = 5,
  gcd = 1.5,
  cooldown = 20.0,
  duration = 8.0,
}

classData.spells[258876] = {
  spellID = 258876,
  name = "Insatiable Hunger",
  slug = "insatiable_hunger",
}

classData.spells[258881] = {
  spellID = 258881,
  name = "Trail of Ruin",
  slug = "trail_of_ruin",
}

classData.spells[258883] = {
  spellID = 258883,
  name = "Trail of Ruin",
  slug = "trail_of_ruin",
  max_range = 8,
  duration = 4.0,
}

classData.spells[258887] = {
  spellID = 258887,
  name = "Cycle of Hatred",
  slug = "cycle_of_hatred",
}

classData.spells[258920] = {
  spellID = 258920,
  name = "Immolation Aura",
  slug = "immolation_aura",
  gcd = 1.5,
  cooldown = 30.0,
  duration = 10.0,
}

classData.spells[258921] = {
  spellID = 258921,
  name = "Immolation Aura",
  slug = "immolation_aura",
}

classData.spells[258922] = {
  spellID = 258922,
  name = "Immolation Aura",
  slug = "immolation_aura",
}

classData.spells[258925] = {
  spellID = 258925,
  name = "Fel Barrage",
  slug = "fel_barrage",
  gcd = 1.5,
  cooldown = 60.0,
  duration = 3.0,
  channeled = true,
  haste_affected_ticks = true,
}

classData.spells[258926] = {
  spellID = 258926,
  name = "Fel Barrage",
  slug = "fel_barrage",
  max_range = 100,
}

classData.spells[263642] = {
  spellID = 263642,
  name = "Fracture",
  slug = "fracture",
  max_range = 5,
  charges = 2,
  charge_cooldown = 4.5,
  gcd = 1.5,
}

classData.spells[263648] = {
  spellID = 263648,
  name = "Soul Barrier",
  slug = "soul_barrier",
  gcd = 1.5,
  cooldown = 30.0,
  duration = 12.0,
}

classData.spells[264002] = {
  spellID = 264002,
  name = "Charred Flesh",
  slug = "charred_flesh",
}

classData.spells[264004] = {
  spellID = 264004,
  name = "Gluttony",
  slug = "gluttony",
}

classData.spells[268175] = {
  spellID = 268175,
  name = "Void Reaver",
  slug = "void_reaver",
}

classData.spells[268178] = {
  spellID = 268178,
  name = "Void Reaver",
  slug = "void_reaver",
  max_range = 100,
  duration = 4.0,
}

classData.spells[273236] = {
  spellID = 273236,
  name = "Infernal Armor",
  slug = "infernal_armor",
}

classData.spells[273237] = {
  spellID = 273237,
  name = "Infernal Armor",
  slug = "infernal_armor",
}

classData.spells[273238] = {
  spellID = 273238,
  name = "Infernal Armor",
  slug = "infernal_armor",
  max_range = 100,
  duration = 6.0,
}

classData.spells[273239] = {
  spellID = 273239,
  name = "Infernal Armor",
  slug = "infernal_armor",
  max_range = 100,
}
