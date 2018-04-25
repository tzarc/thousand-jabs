#define CLASS_ABILITY_SIZE (52)
#define CLASS_ABILITY_TREE_SIZE (6)

#ifndef MAX_CLASS
#define MAX_CLASS (13)
#endif
// Class based active abilities, wow build 26491
static unsigned __class_ability_data[][CLASS_ABILITY_TREE_SIZE][CLASS_ABILITY_SIZE] = {
  {
    {
           0,
    },
    {
           0,
    },
    {
           0,
    },
    {
           0,
    },
    {
           0,
    },
    {
           0,
    },
  },
  // Class active abilities for Warrior
  {
    // General tree, 14 abilities
    {
        6673, // Battle Shout
      117313, // Bloodthirst Heal
         100, // Charge
      163558, // Execute Off-Hand
        6544, // Heroic Leap
       57755, // Heroic Throw
      203524, // Neltharion's Fury (Artifact)
      205545, // Odyn's Fury (Artifact)
      203178, // Opportunity Strikes
        6552, // Pummel
      156287, // Ravager
         355, // Taunt
      215537, // Trauma
      209577, // Warbreaker (Artifact)
           0,
    },
    // Arms tree, 14 abilities
    {
       18499, // Berserker Rage
      227847, // Bladestorm
      167105, // Colossus Smash
      118038, // Die by the Sword
      163201, // Execute
        1715, // Hamstring
        5246, // Intimidating Shout
       12294, // Mortal Strike
        7384, // Overpower
       97462, // Rallying Cry
        1464, // Slam
      260708, // Sweeping Strikes
       34428, // Victory Rush
        1680, // Whirlwind
           0,
    },
    // Fury tree, 12 abilities
    {
       18499, // Berserker Rage
       23881, // Bloodthirst
      184364, // Enraged Regeneration
        5308, // Execute
      100130, // Furious Slash
        5246, // Intimidating Shout
       12323, // Piercing Howl
       85288, // Raging Blow
       97462, // Rallying Cry
      184367, // Rampage
        1719, // Recklessness
      190411, // Whirlwind
           0,
    },
    // Protection tree, 14 abilities
    {
       18499, // Berserker Rage
        1160, // Demoralizing Shout
       20243, // Devastate
      198304, // Intercept
       12975, // Last Stand
       97462, // Rallying Cry
        1719, // Recklessness
        6572, // Revenge
        2565, // Shield Block
       23922, // Shield Slam
         871, // Shield Wall
       23920, // Spell Reflection
        6343, // Thunder Clap
       34428, // Victory Rush
           0,
    },
    {
           0,
    },
    {
           0,
    },
  },
  // Class active abilities for Paladin
  {
    // General tree, 17 abilities
    {
       86704, // Ancient Fury
       66235, // Ardent Defender
        1044, // Blessing of Freedom
      121183, // Contemplation
       35395, // Crusader Strike
         642, // Divine Shield
      190784, // Divine Steed
      209202, // Eye of Tyr (Artifact)
       62124, // Hand of Reckoning
      162056, // Jailer's Judgment
       20271, // Judgment
      228288, // Judgment
         633, // Lay on Hands
      114919, // Light's Hammer
      200652, // Tyr's Deliverance (Artifact)
      200654, // Tyr's Deliverance
      205273, // Wake of Ashes (Artifact)
           0,
    },
    // Holy tree, 15 abilities
    {
      212056, // Absolution
       31821, // Aura Mastery
       31884, // Avenging Wrath
       53563, // Beacon of Light
        1022, // Blessing of Protection
        6940, // Blessing of Sacrifice
        4987, // Cleanse
       26573, // Consecration
         498, // Divine Protection
       19750, // Flash of Light
         853, // Hammer of Justice
       82326, // Holy Light
       20473, // Holy Shock
       85222, // Light of Dawn
      183998, // Light of the Martyr
           0,
    },
    // Protection tree, 15 abilities
    {
       31850, // Ardent Defender
       31935, // Avenger's Shield
       31884, // Avenging Wrath
        1022, // Blessing of Protection
        6940, // Blessing of Sacrifice
      213644, // Cleanse Toxins
       26573, // Consecration
         498, // Divine Protection
       19750, // Flash of Light
       86659, // Guardian of Ancient Kings
         853, // Hammer of Justice
       53595, // Hammer of the Righteous
      184092, // Light of the Protector
       96231, // Rebuke
       53600, // Shield of the Righteous
           0,
    },
    // Retribution tree, 13 abilities
    {
       31884, // Avenging Wrath
      184575, // Blade of Justice
        1022, // Blessing of Protection
      213644, // Cleanse Toxins
       53385, // Divine Storm
       19750, // Flash of Light
      203538, // Greater Blessing of Kings
      203539, // Greater Blessing of Wisdom
         853, // Hammer of Justice
      183218, // Hand of Hindrance
       96231, // Rebuke
      184662, // Shield of Vengeance
       85256, // Templar's Verdict
           0,
    },
    {
           0,
    },
    {
           0,
    },
  },
  // Class active abilities for Hunter
  {
    // General tree, 23 abilities
    {
       61648, // Aspect of the Chameleon
      186257, // Aspect of the Cheetah
      186265, // Aspect of the Turtle
        1462, // Beast Lore
         883, // Call Pet 1
       83242, // Call Pet 2
       83243, // Call Pet 3
       83244, // Call Pet 4
       83245, // Call Pet 5
      272651, // Command Pet
        6991, // Feed Pet
        5384, // Feign Death
      125050, // Fetch
      127933, // Fireworks
        1543, // Flare
      203415, // Fury of the Eagle (Artifact)
         136, // Mend Pet
         982, // Revive Pet
      175686, // Stopping Power
        1515, // Tame Beast
      207068, // Titan's Thunder (Artifact)
      207097, // Titan's Thunder
      204147, // Windburst (Artifact)
           0,
    },
    // Beast Mastery tree, 13 abilities
    {
      193530, // Aspect of the Wild
      217200, // Barbed Shot
       19574, // Bestial Wrath
      193455, // Cobra Shot
        5116, // Concussive Shot
      147362, // Counter Shot
      109304, // Exhilaration
      187650, // Freezing Trap
       19577, // Intimidation
       34026, // Kill Command
       34477, // Misdirection
        2643, // Multi-Shot
      187698, // Tar Trap
           0,
    },
    // Marksmanship tree, 13 abilities
    {
       19434, // Aimed Shot
      185358, // Arcane Shot
      186387, // Bursting Shot
        5116, // Concussive Shot
      147362, // Counter Shot
      109304, // Exhilaration
      187650, // Freezing Trap
       34477, // Misdirection
      257620, // Multi-Shot
      257044, // Rapid Fire
       56641, // Steady Shot
      187698, // Tar Trap
      193526, // Trueshot
           0,
    },
    // Survival tree, 14 abilities
    {
      186289, // Aspect of the Eagle
      266779, // Coordinated Assault
      109304, // Exhilaration
      187650, // Freezing Trap
      190925, // Harpoon
       19577, // Intimidation
      259489, // Kill Command
       34477, // Misdirection
      187707, // Muzzle
      186270, // Raptor Strike
      259491, // Serpent Sting
      187698, // Tar Trap
      259495, // Wildfire Bomb
      195645, // Wing Clip
           0,
    },
    {
           0,
    },
    // Pet tree, 52 abilities
    {
      263446, // Acid Spit (Exotic Ability)
      160011, // Agile Reflexes (Special Ability)
       50433, // Ankle Crack (Special Ability)
      118459, // Beast Cleave
       17253, // Bite (Basic Attack)
       24423, // Bloody Screech (Special Ability)
      263869, // Bristle (Special Ability)
       93433, // Burrow Attack (Exotic Ability)
      263892, // Catlike Reflexes (Special Ability)
       16827, // Claw (Basic Attack)
       61684, // Dash (Ferocity, Cunning Ability)
      160060, // Deadly Sting (Special Ability)
      243120, // Deathstrike Venom
      243121, // Deathstrike Venom
      263887, // Dragon's Guile (Special Ability)
       50285, // Dust Cloud (Special Ability)
      159953, // Feast (Exotic Ability)
       54644, // Frost Breath (Special Ability)
       92380, // Froststorm Breath (Exotic Ability)
      263840, // Furious Bite (Special Ability)
        2649, // Growl (Basic Ability)
      263853, // Infected Bite (Special Ability)
       19577, // Intimidation
       24394, // Intimidation
      138374, // Lightning Blast
      263423, // Lock Jaw (Special Ability)
       54680, // Monstrous Bite (Special Ability)
      264264, // Nether Shock (Special Ability)
      263867, // Obsidian Skin (Special Ability)
       50245, // Pin (Special Ability)
       90347, // Play (Bonus Ability)
       24450, // Prowl (Bonus Ability)
      263857, // Ravage (Special Ability)
       94019, // Rest (Bonus Ability)
      263854, // Savage Rend (Special Ability)
      264055, // Serenity Dust (Special Ability)
      263904, // Serpent's Swiftness (Special Ability)
       26064, // Shell Shield (Special Ability)
       49966, // Smack (Basic Attack)
      264263, // Sonic Blast (Special Ability)
       90361, // Spirit Mend (Exotic Ability)
      264265, // Spirit Shock (Special Ability)
       90328, // Spirit Walk (Bonus Ability)
      264056, // Spore Cloud (Special Ability)
      263852, // Talon Rend (Special Ability)
      242735, // Talon Slash
      160065, // Tendon Rip (Special Ability)
      263858, // Toxic Sting (Special Ability)
       94022, // Trick (Bonus Ability)
       35346, // Warp Time (Special Ability)
      160067, // Web Spray (Special Ability)
      264360, // Winged Agility (Special Ability)
    },
  },
  // Class active abilities for Rogue
  {
    // General tree, 16 abilities
    {
       22482, // Blade Flurry
       31224, // Cloak of Shadows
      212205, // Create: Crimson Vial (Honor Talent)
      185311, // Crimson Vial
      202665, // Curse of the Dreadblades (Artifact)
        2818, // Deadly Poison
       56814, // Detection
        1966, // Feint
      209782, // Goremaw's Bite (Artifact)
        1766, // Kick
      192759, // Kingsbane (Artifact)
        1804, // Pick Lock
      114018, // Shroud of Concealment
        2983, // Sprint
       57934, // Tricks of the Trade
        8680, // Wound Poison
           0,
    },
    // Assassination tree, 21 abilities
    {
        2094, // Blind
        1833, // Cheap Shot
        3408, // Crippling Poison
        2823, // Deadly Poison
        1725, // Distract
       32645, // Envenom
        5277, // Evasion
      196819, // Eviscerate
       51723, // Fan of Knives
         703, // Garrote
         408, // Kidney Shot
        1329, // Mutilate
      185565, // Poisoned Knife
        1943, // Rupture
        6770, // Sap
       36554, // Shadowstep
        1752, // Sinister Strike
        1784, // Stealth
        1856, // Vanish
       79140, // Vendetta
        8679, // Wound Poison
           0,
    },
    // Outlaw tree, 17 abilities
    {
       13750, // Adrenaline Rush
        8676, // Ambush
      199804, // Between the Eyes
       13877, // Blade Flurry
        2094, // Blind
        1833, // Cheap Shot
        2098, // Dispatch
        1725, // Distract
        1776, // Gouge
      195457, // Grappling Hook
      185763, // Pistol Shot
      199754, // Riposte
      193316, // Roll the Bones
        6770, // Sap
      193315, // Sinister Strike
        1784, // Stealth
        1856, // Vanish
           0,
    },
    // Subtlety tree, 18 abilities
    {
          53, // Backstab
        2094, // Blind
        1833, // Cheap Shot
        1725, // Distract
        5277, // Evasion
      196819, // Eviscerate
         408, // Kidney Shot
      195452, // Nightblade
        6770, // Sap
      121471, // Shadow Blades
      185313, // Shadow Dance
       36554, // Shadowstep
      185438, // Shadowstrike
      197835, // Shuriken Storm
      114014, // Shuriken Toss
        1784, // Stealth
      212283, // Symbols of Death
        1856, // Vanish
           0,
    },
    {
           0,
    },
    {
           0,
    },
  },
  // Class active abilities for Priest
  {
    // General tree, 14 abilities
    {
      161862, // Ascension
         528, // Dispel Magic
       77489, // Echo of Light
         586, // Fade
      208065, // Light of T'uure (Artifact)
      207946, // Light's Wrath (Artifact)
      207948, // Light's Wrath
       32375, // Mass Dispel
         605, // Mind Control
       21562, // Power Word: Fortitude
        9484, // Shackle Undead
         585, // Smite
      215769, // Spirit of Redemption (Honor Talent)
      205065, // Void Torrent (Artifact)
           0,
    },
    // Discipline tree, 17 abilities
    {
       19236, // Desperate Prayer
        2061, // Flash Heal
      132157, // Holy Nova
       73325, // Leap of Faith
        1706, // Levitate
      212036, // Mass Resurrection
       33206, // Pain Suppression
       47540, // Penance
       62618, // Power Word: Barrier
      194509, // Power Word: Radiance
          17, // Power Word: Shield
        8122, // Psychic Scream
         527, // Purify
       47536, // Rapture
      186263, // Shadow Mend
         589, // Shadow Word: Pain
       34433, // Shadowfiend
           0,
    },
    // Holy tree, 19 abilities
    {
       19236, // Desperate Prayer
       64843, // Divine Hymn
        2061, // Flash Heal
       47788, // Guardian Spirit
        2060, // Heal
       14914, // Holy Fire
      132157, // Holy Nova
       88625, // Holy Word: Chastise
       34861, // Holy Word: Sanctify
        2050, // Holy Word: Serenity
       73325, // Leap of Faith
        1706, // Levitate
      212036, // Mass Resurrection
         596, // Prayer of Healing
       33076, // Prayer of Mending
        8122, // Psychic Scream
         527, // Purify
         139, // Renew
       64901, // Symbol of Hope
           0,
    },
    // Shadow tree, 19 abilities
    {
       47585, // Dispersion
        2061, // Flash Heal
       73325, // Leap of Faith
        1706, // Levitate
        8092, // Mind Blast
       15407, // Mind Flay
       48045, // Mind Sear
      217676, // Mind Spike Detonation
          17, // Power Word: Shield
        8122, // Psychic Scream
      213634, // Purify Disease
      186263, // Shadow Mend
         589, // Shadow Word: Pain
       34433, // Shadowfiend
      232698, // Shadowform
       15487, // Silence
       15286, // Vampiric Embrace
       34914, // Vampiric Touch
      228260, // Void Eruption
           0,
    },
    {
           0,
    },
    // Pet tree, 2 abilities
    {
      193473, // Mind Flay
       63619, // Shadowcrawl
           0,
    },
  },
  // Class active abilities for Death Knight
  {
    // General tree, 18 abilities
    {
       48707, // Anti-Magic Shell
      220143, // Apocalypse (Artifact)
      205223, // Consumption (Artifact)
      111673, // Control Undead
      127344, // Corpse Explosion
       56222, // Dark Command
       50977, // Death Gate
       49576, // Death Grip
       49998, // Death Strike
       48265, // Death's Advance
       47568, // Empower Rune Weapon
      190780, // Frost Breath
       57330, // Horn of Winter
       47528, // Mind Freeze
        3714, // Path of Frost
       61999, // Raise Ally
      264349, // Reap Magic
      190778, // Sindragosa's Fury (Artifact)
           0,
    },
    // Blood tree, 11 abilities
    {
      221562, // Asphyxiate
       50842, // Blood Boil
       49028, // Dancing Rune Weapon
       43265, // Death and Decay
      195292, // Death's Caress
      108199, // Gorefiend's Grasp
      206930, // Heart Strike
       48792, // Icebound Fortitude
      195182, // Marrowrend
       55233, // Vampiric Blood
      212552, // Wraith Walk
           0,
    },
    // Frost tree, 9 abilities
    {
       45524, // Chains of Ice
       47568, // Empower Rune Weapon
       49143, // Frost Strike
       49184, // Howling Blast
       48792, // Icebound Fortitude
       49020, // Obliterate
       51271, // Pillar of Frost
      196770, // Remorseless Winter
      212552, // Wraith Walk
           0,
    },
    // Unholy tree, 12 abilities
    {
       42650, // Army of the Dead
       45524, // Chains of Ice
       63560, // Dark Transformation
       47541, // Death Coil
       43265, // Death and Decay
       85948, // Festering Strike
       48792, // Icebound Fortitude
       77575, // Outbreak
       46584, // Raise Dead
       55090, // Scourge Strike
       49206, // Summon Gargoyle
      212552, // Wraith Walk
           0,
    },
    {
           0,
    },
    // Pet tree, 10 abilities
    {
      207260, // Arrow Spray
       81280, // Blood Burst
       47468, // Claw
      212333, // Cleaver
       51963, // Gargoyle Strike
       47481, // Gnaw
       47484, // Huddle
       47482, // Leap
      212423, // Skulker Shot
      198715, // Val'kyr Strike
           0,
    },
  },
  // Class active abilities for Shaman
  {
    // General tree, 19 abilities
    {
      114911, // Ancestral Guidance
      108271, // Astral Shift
        2825, // Bloodlust
      192058, // Capacitor Totem
      204945, // Doom Winds (Artifact)
      207778, // Downpour (Artifact)
        2484, // Earthbind Totem
        2645, // Ghost Wolf
       32182, // Heroism
       51514, // Hex
      210873, // Hex
      211004, // Hex
      211010, // Hex
      211015, // Hex
      269352, // Hex
         370, // Purge
      205495, // Stormkeeper (Artifact)
        8143, // Tremor Totem (Earth Totem)
      115356, // Windstrike
           0,
    },
    // Elemental tree, 14 abilities
    {
      188443, // Chain Lightning
       51886, // Cleanse Spirit
      198103, // Earth Elemental
        8042, // Earth Shock
       61882, // Earthquake
      198067, // Fire Elemental
      188389, // Flame Shock
      196840, // Frost Shock
        8004, // Healing Surge
      114074, // Lava Beam
       51505, // Lava Burst
      188196, // Lightning Bolt
       51490, // Thunderstorm
       57994, // Wind Shear
           0,
    },
    // Enhancement tree, 12 abilities
    {
       51886, // Cleanse Spirit
      187874, // Crash Lightning
       51533, // Feral Spirit
      193796, // Flametongue
      196834, // Frostbrand
      188070, // Healing Surge
       60103, // Lava Lash
      187837, // Lightning Bolt
      193786, // Rockbiter
       58875, // Spirit Walk
       17364, // Stormstrike
       57994, // Wind Shear
           0,
    },
    // Restoration tree, 16 abilities
    {
      212048, // Ancestral Vision
        1064, // Chain Heal
         421, // Chain Lightning
      188838, // Flame Shock
       73920, // Healing Rain
        5394, // Healing Stream Totem
        8004, // Healing Surge
      108280, // Healing Tide Totem
       77472, // Healing Wave
       51505, // Lava Burst
         403, // Lightning Bolt
       77130, // Purify Spirit
       61295, // Riptide
       98008, // Spirit Link Totem
       79206, // Spiritwalker's Grace
       57994, // Wind Shear
           0,
    },
    {
           0,
    },
    // Pet tree, 8 abilities
    {
       36213, // Angered Earth
      157348, // Call Lightning
       57984, // Fire Blast
      118337, // Harden Skin
      118297, // Immolate
      117588, // Meteor
      118345, // Pulverize
      157331, // Wind Gust
           0,
    },
  },
  // Class active abilities for Mage
  {
    // General tree, 27 abilities
    {
      120145, // Ancient Teleport: Dalaran
        1459, // Arcane Intellect
        1953, // Blink
      190336, // Conjure Refreshment
        2139, // Counterspell
      214634, // Ebonbolt (Artifact)
         122, // Frost Nova
       45438, // Ice Block
      131784, // Illusion
      210726, // Mark of Aluneth (Artifact)
      211076, // Mark of Aluneth
      211088, // Mark of Aluneth
      224968, // Mark of Aluneth (Artifact)
      194466, // Phoenix's Flames (Artifact)
         118, // Polymorph (Sheep)
       28271, // Polymorph (Turtle)
       28272, // Polymorph (Pig)
       61025, // Polymorph (Serpent)
       61305, // Polymorph (Black Cat)
       61721, // Polymorph (Rabbit)
       61780, // Polymorph (Turkey)
      126819, // Polymorph (Pig)
      161353, // Polymorph (Polar Bear Cub)
      161354, // Polymorph (Monkey)
      161355, // Polymorph (Penguin)
      161372, // Polymorph (Turtle)
       80353, // Time Warp
           0,
    },
    // Arcane tree, 13 abilities
    {
       44425, // Arcane Barrage
       30451, // Arcane Blast
        1449, // Arcane Explosion
        5143, // Arcane Missiles
       12042, // Arcane Power
      195676, // Displacement
      212801, // Displacement
       12051, // Evocation
      110959, // Greater Invisibility
          66, // Invisibility
      205025, // Presence of Mind
      235450, // Prismatic Barrier
       31589, // Slow
           0,
    },
    // Fire tree, 9 abilities
    {
      235313, // Blazing Barrier
      190319, // Combustion
       31661, // Dragon's Breath
      108853, // Fire Blast
         133, // Fireball
        2120, // Flamestrike
          66, // Invisibility
       11366, // Pyroblast
        2948, // Scorch
           0,
    },
    // Frost tree, 12 abilities
    {
      190356, // Blizzard
      235219, // Cold Snap
         120, // Cone of Cold
      108853, // Fire Blast
       44614, // Flurry
         116, // Frostbolt
       84714, // Frozen Orb
       11426, // Ice Barrier
       30455, // Ice Lance
       12472, // Icy Veins
          66, // Invisibility
       31687, // Summon Water Elemental
           0,
    },
    {
           0,
    },
    // Pet tree, 6 abilities
    {
      225119, // Arcane Assault
       88084, // Arcane Blast
       88082, // Fireball
       33395, // Freeze
       59638, // Frostbolt
       31707, // Waterbolt
           0,
    },
  },
  // Class active abilities for Warlock
  {
    // General tree, 27 abilities
    {
         710, // Banish
      187394, // Chaos Barrage
      215279, // Chaos Bolt
      119898, // Command Demon
        6201, // Create Healthstone
      111771, // Demonic Gateway
      196586, // Dimensional Rift (Artifact)
        1098, // Enslave Demon
        5782, // Fear
      111897, // Grimoire: Felhunter (Summon)
      111859, // Grimoire: Imp (Summon)
      111896, // Grimoire: Succubus (Summon)
      111895, // Grimoire: Voidwalker (Summon)
         755, // Health Funnel
      108396, // Mortal Coil (Talent)
      216698, // Reap Souls (Artifact)
         698, // Ritual of Summoning
      196657, // Shadow Bolt
       63106, // Siphon Life
       20707, // Soulstone
         691, // Summon Felhunter (Summon)
         688, // Summon Imp (Summon)
         712, // Summon Succubus (Summon)
         697, // Summon Voidwalker (Summon)
      211714, // Thal'kiel's Consumption (Artifact)
      211715, // Thal'kiel's Consumption
      104773, // Unending Resolve
           0,
    },
    // Affliction tree, 7 abilities
    {
         980, // Agony
         172, // Corruption
      234153, // Drain Life
       27243, // Seed of Corruption
      232670, // Shadow Bolt
       30283, // Shadowfury
       30108, // Unstable Affliction
           0,
    },
    // Demonology tree, 21 abilities
    {
      104316, // Call Dreadstalkers
      264178, // Demonbolt
      234153, // Drain Life
      270569, // From the Shadows
      111898, // Grimoire: Felguard (Summon)
      105174, // Hand of Gul'dan
      196277, // Implosion
         686, // Shadow Bolt
       30283, // Shadowfury
      196606, // Shadowy Inspiration
      267992, // Summon Bilescourge
      267996, // Summon Darkhound
      265187, // Summon Demonic Tyrant
      267989, // Summon Eyes of Gul'dan
       30146, // Summon Felguard (Summon)
      267987, // Summon Illidari Satyr
      267994, // Summon Shivarra
      268001, // Summon Ur'zul
      267988, // Summon Vicious Hellhound
      267991, // Summon Void Terror
      267995, // Summon Wrathguard
           0,
    },
    // Destruction tree, 13 abilities
    {
      116858, // Chaos Bolt
      215276, // Chaos Tear
       17962, // Conflagrate
      234153, // Drain Life
       80240, // Havoc
         348, // Immolate
       29722, // Incinerate
      226802, // Lord of Flames
        5740, // Rain of Fire
         686, // Shadow Bolt
       30283, // Shadowfury
      196639, // Shadowy Tear
        1122, // Summon Infernal (Guardian)
           0,
    },
    {
           0,
    },
    // Pet tree, 42 abilities
    {
       89766, // Axe Toss (Special Ability)
      260641, // Bile Spit
        6307, // Blood Pact (Special Ability)
      171011, // Burning Presence (Special Ability)
        3716, // Consuming Shadows (Basic Attack)
      170995, // Cripple
      272013, // Demon Fangs
      270481, // Demonfire
      265279, // Demonfire Blast
      267971, // Demonic Consumption
      267972, // Demonic Consumption
       19505, // Devour Magic (Special Ability)
       85692, // Doom Bolt
      272156, // Double Breath
      205231, // Eye Laser
      272131, // Eye of Gul'dan
      272435, // Fel Bite
      104318, // Fel Firebolt (Basic Attack)
       89751, // Felstorm (Special Ability)
        3110, // Firebolt (Basic Attack)
       89792, // Flee (Special Ability)
       19483, // Immolation
        7814, // Lash of Pain (Basic Attack)
       30213, // Legion Strike (Basic Attack)
        7870, // Lesser Invisibility (Special Ability)
      272439, // Many Faced Bite
      272172, // Multi-Slash
      272432, // Overhead Assault
       30151, // Pursuit (Special Ability)
        6358, // Seduction (Command Demon Ability)
      171014, // Seethe (Special Ability)
       54049, // Shadow Bite (Basic Attack)
      171138, // Shadow Lock (Special Ability)
      272012, // Shadow Slash
       89808, // Singe Magic (Command Demon Ability)
       19647, // Spell Lock (Command Demon Ability)
       17735, // Suffering (Special Ability)
      112042, // Threatening Presence (Special Ability)
      134477, // Threatening Presence (Special Ability)
      171021, // Torch Magic (Special Ability)
      272167, // Toxic Bile
        6360, // Whiplash (Special Ability)
           0,
    },
  },
  // Class active abilities for Monk
  {
    // General tree, 17 abilities
    {
      100784, // Blackout Kick
      117952, // Crackling Jade Lightning
      196061, // Crosswinds
      175697, // Disabling Technique
      214326, // Exploding Keg (Artifact)
      122281, // Healing Elixir
      115078, // Paralysis
      115546, // Provoke
      109132, // Roll
      205406, // Sheilun's Gift (Artifact)
      209525, // Soothing Mist (Honor Talent)
      205320, // Strike of the Windlord (Artifact)
      100780, // Tiger Palm
      101643, // Transcendence
      119996, // Transcendence: Transfer
      125883, // Zen Flight
      126892, // Zen Pilgrimage
           0,
    },
    // Brewmaster tree, 18 abilities
    {
      205523, // Blackout Strike
      115181, // Breath of Fire
      216521, // Celestial Fortune
      218164, // Detox
      195630, // Elusive Brawler
      115072, // Expel Harm
      115203, // Fortifying Brew
      124273, // Heavy Stagger
      115308, // Ironskin Brew
      121253, // Keg Smash
      119381, // Leg Sweep
      124275, // Light Stagger
      124274, // Moderate Stagger
      119582, // Purifying Brew
      116705, // Spear Hand Strike
      227291, // Stomp
      116670, // Vivify
      115176, // Zen Meditation
           0,
    },
    // Mistweaver tree, 15 abilities
    {
      228649, // Blackout Kick
      115450, // Detox
      124682, // Enveloping Mist
      191837, // Essence Font
      243435, // Fortifying Brew
      119381, // Leg Sweep
      116849, // Life Cocoon
      212051, // Reawaken
      115151, // Renewing Mist
      115310, // Revival
      107428, // Rising Sun Kick
      115175, // Soothing Mist
      101546, // Spinning Crane Kick
      116680, // Thunder Focus Tea
      116670, // Vivify
           0,
    },
    // Windwalker tree, 21 abilities
    {
      116768, // Blackout Kick!
      211432, // Combo Master
      196061, // Crosswinds
      218164, // Detox
      116095, // Disable
      113656, // Fists of Fury
      101545, // Flying Serpent Kick
      115057, // Flying Serpent Kick
      252768, // Focus of Xuen
      213114, // Hidden Master's Forbidden Touch
      119381, // Leg Sweep
      228287, // Mark of the Crane
      240672, // Master of Combinations
      107428, // Rising Sun Kick
      116705, // Spear Hand Strike
      101546, // Spinning Crane Kick
      137639, // Storm, Earth, and Fire
      242387, // Thunderfist
      115080, // Touch of Death
      122470, // Touch of Karma
      116670, // Vivify
           0,
    },
    {
           0,
    },
    {
           0,
    },
  },
  // Class active abilities for Druid
  {
    // General tree, 29 abilities
    {
      210722, // Ashamane's Frenzy (Artifact)
      210723, // Ashamane's Frenzy
        5487, // Bear Form (Shapeshift)
         768, // Cat Form (Shapeshift)
      127757, // Charm Woodland Creature
        1850, // Dash
      193753, // Dreamwalk
      236716, // Enraged Maul (Honor Talent)
         339, // Entangling Roots
      208253, // Essence of G'Hanir (Artifact)
      164862, // Flap
      165962, // Flight Form (Shapeshift)
      202771, // Full Moon (Artifact)
        6795, // Growl
      202768, // Half Moon (Artifact)
        2637, // Hibernate
       33917, // Mangle
        8921, // Moonfire (Lunar)
      164812, // Moonfire (Lunar)
      175682, // Nature's Control
      202767, // New Moon (Artifact)
      200851, // Rage of the Sleeper (Artifact)
       20484, // Rebirth
        8936, // Regrowth
        5221, // Shred
      210053, // Stag Form (Shapeshift)
      164815, // Sunfire (Solar)
         783, // Travel Form (Shapeshift)
      114282, // Treant Form (Shapeshift)
           0,
    },
    // Balance tree, 22 abilities
    {
       22812, // Barkskin
      194223, // Celestial Alignment
      122114, // Chosen of Elune
      202771, // Full Moon (Artifact)
      274283, // Full Moon
      211547, // Fury of Elune
      203001, // Goldrinn's Fang
      202768, // Half Moon (Artifact)
      274282, // Half Moon
       29166, // Innervate
      194153, // Lunar Strike (Lunar)
       24858, // Moonkin Form
      209406, // Oneth's Intuition
      209407, // Oneth's Overconfidence
        5215, // Prowl
        2782, // Remove Corruption
       78675, // Solar Beam
      190984, // Solar Wrath (Solar)
        2908, // Soothe
      191034, // Starfall
       78674, // Starsurge
       93402, // Sunfire (Solar)
           0,
    },
    // Feral tree, 21 abilities
    {
      210705, // Ashamane's Rip
      106951, // Berserk
      145152, // Bloodtalons
      252750, // Bloody Gash
      210649, // Feral Instinct
      146874, // Feral Rage
       22568, // Ferocious Bite
       22570, // Maim
      155625, // Moonfire
       69369, // Predatory Swiftness
        5215, // Prowl
        1822, // Rake
        2782, // Remove Corruption
        1079, // Rip
      106839, // Skull Bash
        2908, // Soothe
      106898, // Stampeding Roar
       61336, // Survival Instincts
      213764, // Swipe
      106832, // Thrash
        5217, // Tiger's Fury
           0,
    },
    // Guardian tree, 16 abilities
    {
       22812, // Barkskin
      203958, // Brambles
       22842, // Frenzied Regeneration
          99, // Incapacitating Roar
      192081, // Ironfur
        6807, // Maul
      227034, // Nature's Guardian
        5215, // Prowl
        2782, // Remove Corruption
      106839, // Skull Bash
      185321, // Stalwart Guardian
      106898, // Stampeding Roar
       61336, // Survival Instincts
      213764, // Swipe
      213771, // Swipe
      106832, // Thrash
           0,
    },
    // Restoration tree, 16 abilities
    {
       22812, // Barkskin
      145205, // Efflorescence
       29166, // Innervate
      102342, // Ironbark
       33763, // Lifebloom
       88423, // Nature's Cure
        5215, // Prowl
         774, // Rejuvenation
      212040, // Revitalize
        5176, // Solar Wrath (Solar)
        2908, // Soothe
       93402, // Sunfire (Solar)
       18562, // Swiftmend
         740, // Tranquility
      102793, // Ursol's Vortex
       48438, // Wild Growth
           0,
    },
    // Pet tree, 1 abilities
    {
      188046, // Fey Missile
           0,
    },
  },
  // Class active abilities for Demon Hunter
  {
    // General tree, 18 abilities
    {
      188499, // Blade Dance
      198589, // Blur
      179057, // Chaos Nova
      162794, // Chaos Strike
      183752, // Consume Magic
      198013, // Eye Beam
      195072, // Fel Rush
      201467, // Fury of the Illidari (Artifact)
      201628, // Fury of the Illidari
      201789, // Fury of the Illidari
      131347, // Glide
      217832, // Imprison
      191427, // Metamorphosis
      207407, // Soul Carver (Artifact)
      188501, // Spectral Sight
      185123, // Throw Glaive
      185245, // Torment
      198793, // Vengeful Retreat
           0,
    },
    // Havoc tree, 7 abilities
    {
      202446, // Anguish
      211796, // Chaos Blades
      196718, // Darkness
      203796, // Demon Blades
      162243, // Demon's Bite
      208605, // Nemesis
      217070, // Rage of the Illidari
           0,
    },
    // Vengeance tree, 14 abilities
    {
      213011, // Charred Warblades
      203720, // Demon Spikes
      204021, // Fiery Brand
      209245, // Fiery Brand
      212818, // Fiery Demise
      178740, // Immolation Aura
      189110, // Infernal Strike
      203782, // Shear
      204596, // Sigil of Flame
      207684, // Sigil of Misery
      202137, // Sigil of Silence
      228477, // Soul Cleave
      204157, // Throw Glaive
      185245, // Torment
           0,
    },
    {
           0,
    },
    {
           0,
    },
    {
           0,
    },
  },
};
#define TREE_SPECIALIZATION_SIZE (36)

// Talent tree specialization abilities, wow build 26491
static unsigned __tree_specialization_data[][MAX_SPECS_PER_CLASS][TREE_SPECIALIZATION_SIZE] = {
  // Specialization abilities for Hunter pets
  {
    // Specialization abilities for Ferocity
    {
       61684, // Dash (Ferocity, Cunning Ability)
       55709, // Heart of the Phoenix (Ferocity Ability)
       20782, // Combat Experience
       53184, // Spiked Collar
       53482, // Blood of the Rhino
       19596, // Boar's Speed
       53497, // Cornered
       61688, // Great Stamina
      264663, // Predator's Thirst
      264667, // Primal Rage (Ferocity Ability)
           0,
    },
    // Specialization abilities for Tenacity
    {
       61685, // Charge (Tenacity Ability)
       53478, // Last Stand (Tenacity Ability)
       63900, // Thunderstomp (Tenacity Ability)
       53482, // Blood of the Rhino
       20782, // Combat Experience
       61688, // Great Stamina
      264662, // Endurance Training
       19596, // Boar's Speed
      264735, // Survival of the Fittest (Tenacity Ability)
       53497, // Cornered
       53184, // Spiked Collar
           0,
    },
    // Specialization abilities for Cunning
    {
       53490, // Bullheaded (Cunning Ability)
       61684, // Dash (Ferocity, Cunning Ability)
       19596, // Boar's Speed
       20782, // Combat Experience
       53497, // Cornered
       53482, // Blood of the Rhino
       61688, // Great Stamina
       53184, // Spiked Collar
       53271, // Master's Call (Cunning Ability)
      264656, // Pathfinding
           0,
    },
    {
           0,
    },
  },
  // Specialization abilities for Warrior
  {
    // Specialization abilities for Arms
    {
       12294, // Mortal Strike
       86101, // Plate Specialization
      137049, // Arms Warrior
       97462, // Rallying Cry
      163201, // Execute
      167105, // Colossus Smash
        1680, // Whirlwind
      162698, // Stat Negation Aura - Strength DPS
      184783, // Tactician
        1464, // Slam
       34428, // Victory Rush
       18499, // Berserker Rage
        1715, // Hamstring
        5246, // Intimidating Shout
      118038, // Die by the Sword
      227847, // Bladestorm
      262111, // Mastery: Deep Wounds
      260708, // Sweeping Strikes
        7384, // Overpower
      262304, // Deep Wounds
      231830, // Execute (Rank 2)
           0,
    },
    // Specialization abilities for Fury
    {
       23881, // Bloodthirst
       85288, // Raging Blow
       46917, // Titan's Grip
       86110, // Plate Specialization
       12950, // Whirlwind (Rank 2)
       76856, // Mastery: Unshackled Fury
      137050, // Fury Warrior
       97462, // Rallying Cry
        1719, // Recklessness
        5308, // Execute
       12323, // Piercing Howl
      162698, // Stat Negation Aura - Strength DPS
      184361, // Enrage
      184364, // Enraged Regeneration
      184367, // Rampage
       18499, // Berserker Rage
      190411, // Whirlwind
      100130, // Furious Slash
      209694, // Rampage!
        5246, // Intimidating Shout
      231842, // Dual Wield
      231824, // Furious Slash (Rank 2)
      231827, // Execute (Rank 2)
           0,
    },
    // Specialization abilities for Protection
    {
       23922, // Shield Slam
        6572, // Revenge
       12975, // Last Stand
       86535, // Plate Specialization
       76857, // Mastery: Critical Block
          71, // Defensive Stance
        1160, // Demoralizing Shout
      137048, // Protection Warrior
        6343, // Thunder Clap
         871, // Shield Wall
      162702, // Stat Negation Aura - Strength Tank
      115768, // Deep Wounds
       20243, // Devastate
       23920, // Spell Reflection
        2565, // Shield Block
      198304, // Intercept
       34428, // Victory Rush
        1719, // Recklessness
       18499, // Berserker Rage
        5301, // Revenge Trigger
      231834, // Shield Slam (Rank 2)
      231847, // Shield Block (Rank 2)
       97462, // Rallying Cry
           0,
    },
    {
           0,
    },
  },
  // Specialization abilities for Paladin
  {
    // Specialization abilities for Holy
    {
       20473, // Holy Shock
       53563, // Beacon of Light
       53651, // Light's Beacon
       53576, // Infusion of Light
       86103, // Plate Specialization (Holy, Passive)
       82326, // Holy Light
       85222, // Light of Dawn
       31821, // Aura Mastery
      137029, // Holy Paladin
      148040, // Sacred Shield Overridde (Holy)
      162701, // Stat Negation Aura - Intellect Healer
       19750, // Flash of Light
        4987, // Cleanse
         498, // Divine Protection
        1022, // Blessing of Protection
        6940, // Blessing of Sacrifice
      183998, // Light of the Martyr
      183997, // Mastery: Lightbringer
       26573, // Consecration
         853, // Hammer of Justice
      212056, // Absolution
      219562, // Light of the Martyr
      227068, // Righteousness
      231644, // Judgment (Rank 2)
      231642, // Beacon of Light (Rank 2)
      231667, // Crusader Strike (Rank 2)
      272906, // Holy Shock (Rank 2)
       31884, // Avenging Wrath
           0,
    },
    // Specialization abilities for Protection
    {
       31935, // Avenger's Shield
      105424, // Judgments of the Wise
       26573, // Consecration
       53600, // Shield of the Righteous
       85043, // Grand Crusader
       86102, // Plate Specialization (Protection, Passive)
      105805, // Sanctuary
       31850, // Ardent Defender
       86659, // Guardian of Ancient Kings
       76671, // Mastery: Divine Bulwark
      137028, // Protection Paladin
      161800, // Riposte
       53595, // Hammer of the Righteous
      162702, // Stat Negation Aura - Strength Tank
       25780, // Righteous Fury
         498, // Divine Protection
        1022, // Blessing of Protection
        6940, // Blessing of Sacrifice
       96231, // Rebuke
      184092, // Light of the Protector
         853, // Hammer of Justice
      213644, // Cleanse Toxins
       19750, // Flash of Light
       31884, // Avenging Wrath
      231657, // Judgment (Rank 2)
      231665, // Avenger's Shield (Rank 2)
      229976, // Blessed Hammer
           0,
    },
    // Specialization abilities for Retribution
    {
       85256, // Templar's Verdict
       53385, // Divine Storm
       86539, // Plate Specialization (Retribution, Passive)
       31884, // Avenging Wrath
      137027, // Retribution Paladin
      162698, // Stat Negation Aura - Strength DPS
       19750, // Flash of Light
      183218, // Hand of Hindrance
      183435, // Retribution
       96231, // Rebuke
        1022, // Blessing of Protection
      184575, // Blade of Justice
         853, // Hammer of Justice
      184662, // Shield of Vengeance
      203538, // Greater Blessing of Kings
      203539, // Greater Blessing of Wisdom
      213644, // Cleanse Toxins
      231667, // Crusader Strike (Rank 2)
      231663, // Judgment (Rank 3)
      267316, // Mastery: Hand of Light
           0,
    },
    {
           0,
    },
  },
  // Specialization abilities for Hunter
  {
    // Specialization abilities for Beast Mastery
    {
       34026, // Kill Command
      115939, // Beast Cleave
       19574, // Bestial Wrath
       56315, // Kindred Spirits
       53270, // Exotic Beasts
       76657, // Mastery: Master of Beasts
      137015, // Beast Mastery Hunter
        5116, // Concussive Shot
      147362, // Counter Shot
        2643, // Multi-Shot
       34477, // Misdirection
      162697, // Stat Negation Aura - Agility DPS
      193455, // Cobra Shot
      185789, // Wild Call
      193530, // Aspect of the Wild
      109304, // Exhilaration
         781, // Disengage
      231548, // Bestial Wrath (Rank 2)
      231546, // Exhilaration (Rank 2)
      231549, // Disengage (Rank 2)
      187698, // Tar Trap
      187650, // Freezing Trap
      217200, // Barbed Shot
      262837, // Cobra Shot (Rank 2)
      262838, // Cobra Shot (Rank 3)
       19577, // Intimidation
           0,
    },
    // Specialization abilities for Marksmanship
    {
       19434, // Aimed Shot
      137016, // Marksmanship Hunter
        5116, // Concussive Shot
      147362, // Counter Shot
       34477, // Misdirection
      185358, // Arcane Shot
      186387, // Bursting Shot
      162697, // Stat Negation Aura - Agility DPS
      193468, // Mastery: Sniper Training (Mastery)
      193526, // Trueshot
         781, // Disengage
      231549, // Disengage (Rank 2)
      109304, // Exhilaration
      231546, // Exhilaration (Rank 2)
      187650, // Freezing Trap
      187698, // Tar Trap
      257044, // Rapid Fire
      257620, // Multi-Shot
       56641, // Steady Shot
      257621, // Trick Shots
      155228, // Lone Wolf
      260240, // Precise Shots
           0,
    },
    // Specialization abilities for Survival
    {
      137017, // Survival Hunter
      186270, // Raptor Strike
      187650, // Freezing Trap
      187698, // Tar Trap
      187707, // Muzzle
      190925, // Harpoon
      162697, // Stat Negation Aura - Agility DPS
      195645, // Wing Clip
      109304, // Exhilaration
      231550, // Harpoon (Rank 2)
      231546, // Exhilaration (Rank 2)
      259489, // Kill Command
      259495, // Wildfire Bomb
      259491, // Serpent Sting
         781, // Disengage
      262839, // Raptor Strike (Rank 2)
      263135, // Mastery: Spirit Bond
      263183, // Disengage (Rank 2)
      263186, // Kill Command (Rank 2)
       34477, // Misdirection
      266779, // Coordinated Assault
      186289, // Aspect of the Eagle
       19577, // Intimidation
           0,
    },
    {
           0,
    },
  },
  // Specialization abilities for Rogue
  {
    // Specialization abilities for Assassination
    {
       14117, // Improved Poisons
        1329, // Mutilate
       32645, // Envenom
       14190, // Seal Fate
       79134, // Venomous Wounds
       51667, // Cut to the Chase
       79140, // Vendetta
       76803, // Mastery: Potent Assassin
      137037, // Assassination Rogue
        1943, // Rupture
       51723, // Fan of Knives
         703, // Garrote
      185565, // Poisoned Knife
      162697, // Stat Negation Aura - Agility DPS
        3408, // Crippling Poison
        2823, // Deadly Poison
        8679, // Wound Poison
       36554, // Shadowstep
        1725, // Distract
        1833, // Cheap Shot
         921, // Pick Pocket
        6770, // Sap
        1784, // Stealth
        1856, // Vanish
        5277, // Evasion
         408, // Kidney Shot
      231691, // Sprint (Rank 2)
        1752, // Sinister Strike
      196819, // Eviscerate
      231719, // Garrote (Rank 2)
        2094, // Blind
           0,
    },
    // Specialization abilities for Outlaw
    {
       61329, // Combat Potency
       13877, // Blade Flurry
       35551, // Combat Potency
       13750, // Adrenaline Rush
       76806, // Mastery: Main Gauche
      137036, // Outlaw Rogue
       14161, // Ruthlessness
        8676, // Ambush
      185763, // Pistol Shot
      162697, // Stat Negation Aura - Agility DPS
      193315, // Sinister Strike
        1776, // Gouge
        2098, // Dispatch
        1784, // Stealth
         921, // Pick Pocket
        1725, // Distract
        1856, // Vanish
      199736, // Find Treasure (Racial)
      199754, // Riposte
      199804, // Between the Eyes
        2094, // Blind
        1833, // Cheap Shot
      193316, // Roll the Bones
        6770, // Sap
      231691, // Sprint (Rank 2)
      235484, // Between the Eyes (Rank 2)
       79096, // Restless Blades
      195457, // Grappling Hook
           0,
    },
    // Specialization abilities for Subtlety
    {
          53, // Backstab
       79152, // Energetic Recovery
       76808, // Mastery: Executioner
      137035, // Subtlety Rogue
      114014, // Shuriken Toss
      185314, // Deepening Shadows
      185438, // Shadowstrike
      162697, // Stat Negation Aura - Agility DPS
      195452, // Nightblade
        1725, // Distract
        1833, // Cheap Shot
         921, // Pick Pocket
        6770, // Sap
        1784, // Stealth
        1856, // Vanish
      196819, // Eviscerate
      196912, // Shadow Techniques
      121471, // Shadow Blades
      197835, // Shuriken Storm
       36554, // Shadowstep
      185313, // Shadow Dance
        2094, // Blind
      212283, // Symbols of Death
        5277, // Evasion
         408, // Kidney Shot
       58423, // Relentless Strikes (Passive)
      231691, // Sprint (Rank 2)
      231716, // Eviscerate (Rank 2)
      231718, // Shadowstrike (Rank 2)
      245639, // Shuriken Combo
      245751, // Sprint (Rank 2)
           0,
    },
    {
           0,
    },
  },
  // Specialization abilities for Priest
  {
    // Specialization abilities for Discipline
    {
       47540, // Penance
       33206, // Pain Suppression
       62618, // Power Word: Barrier
         527, // Purify
       81749, // Atonement
      137032, // Discipline Priest
       47536, // Rapture
      162701, // Stat Negation Aura - Intellect Healer
          17, // Power Word: Shield
       73325, // Leap of Faith
        1706, // Levitate
        2096, // Mind Vision
      186263, // Shadow Mend
         589, // Shadow Word: Pain
       34433, // Shadowfiend
      186440, // Shadow Mend
      194509, // Power Word: Radiance
        8122, // Psychic Scream
       45243, // Focused Will
      212036, // Mass Resurrection
        2061, // Flash Heal
      231682, // Smite (Rank 2)
      262861, // Smite (Rank 2)
       19236, // Desperate Prayer
      271534, // Mastery: Reverence
      132157, // Holy Nova
           0,
    },
    // Specialization abilities for Holy
    {
       88625, // Holy Word: Chastise
       20711, // Spirit of Redemption
        2060, // Heal
         596, // Prayer of Healing
       34861, // Holy Word: Sanctify
       47788, // Guardian Spirit
       64843, // Divine Hymn
         527, // Purify
       63733, // Holy Words (Rank 2)
       77485, // Mastery: Echo of Light
       14914, // Holy Fire
      137031, // Holy Priest
       45243, // Focused Will
      162701, // Stat Negation Aura - Intellect Healer
         139, // Renew
       73325, // Leap of Faith
       33076, // Prayer of Mending
        1706, // Levitate
        2050, // Holy Word: Serenity
      132157, // Holy Nova
        2061, // Flash Heal
      212036, // Mass Resurrection
      231687, // Holy Fire (Rank 2)
       19236, // Desperate Prayer
      262861, // Smite (Rank 2)
        8122, // Psychic Scream
       64901, // Symbol of Hope
           0,
    },
    // Specialization abilities for Shadow
    {
       15407, // Mind Flay
        8092, // Mind Blast
       15487, // Silence
       34914, // Vampiric Touch
       78203, // Shadowy Apparitions
       47585, // Dispersion
       15286, // Vampiric Embrace
       77486, // Mastery: Madness
      137033, // Shadow Priest
      185916, // Voidform
      186263, // Shadow Mend
      186440, // Shadow Mend
        2096, // Mind Vision
         589, // Shadow Word: Pain
       34433, // Shadowfiend
        8122, // Psychic Scream
          17, // Power Word: Shield
        1706, // Levitate
      213634, // Purify Disease
      228260, // Void Eruption
      228266, // Void Bolt
      228264, // Voidform
      231688, // Void Bolt (Rank 2)
        2061, // Flash Heal
      232698, // Shadowform
      162699, // Stat Negation Aura - Intellect DPS
       73325, // Leap of Faith
       48045, // Mind Sear
      190719, // Shadow Word: Death
           0,
    },
    {
           0,
    },
  },
  // Specialization abilities for Death Knight
  {
    // Specialization abilities for Blood
    {
       86537, // Plate Specialization (Passive)
       49028, // Dancing Rune Weapon
       55233, // Vampiric Blood
       77513, // Mastery: Blood Shield
       81136, // Crimson Scourge
      137008, // Blood Death Knight
      161797, // Riposte
      162702, // Stat Negation Aura - Strength Tank
       48263, // Veteran of the Third War
       43265, // Death and Decay
       50842, // Blood Boil
      195182, // Marrowrend
      195292, // Death's Caress
      108199, // Gorefiend's Grasp
      212552, // Wraith Walk
      206930, // Heart Strike
      221562, // Asphyxiate
       48792, // Icebound Fortitude
           0,
    },
    // Specialization abilities for Frost
    {
       49143, // Frost Strike
       49184, // Howling Blast
       86113, // Plate Specialization (Passive)
       49020, // Obliterate
       51128, // Killing Machine
       51271, // Pillar of Frost
       59057, // Rime
       77514, // Mastery: Frozen Heart
      137006, // Frost Death Knight
         674, // Dual Wield (Passive)
      162698, // Stat Negation Aura - Strength DPS
       47568, // Empower Rune Weapon
       48792, // Icebound Fortitude
       45524, // Chains of Ice
      178819, // Dark Succor
      195621, // Frost Fever
      196770, // Remorseless Winter
       81229, // Runic Empowerment
      212552, // Wraith Walk
           0,
    },
    // Specialization abilities for Unholy
    {
       86536, // Plate Specialization (Passive)
       55090, // Scourge Strike
       85948, // Festering Strike
       49530, // Sudden Doom
       63560, // Dark Transformation
       49206, // Summon Gargoyle
       77515, // Mastery: Dreadblade
      137007, // Unholy Death Knight
       46584, // Raise Dead
      162698, // Stat Negation Aura - Strength DPS
       42650, // Army of the Dead
       77575, // Outbreak
       43265, // Death and Decay
       45524, // Chains of Ice
      178819, // Dark Succor
       48792, // Icebound Fortitude
       47541, // Death Coil
      197147, // Festering Wound
       51462, // Runic Corruption
      212552, // Wraith Walk
           0,
    },
    {
           0,
    },
  },
  // Specialization abilities for Shaman
  {
    // Specialization abilities for Elemental
    {
       60188, // Elemental Fury
       51490, // Thunderstorm
       51505, // Lava Burst
       77756, // Lava Surge
       86108, // Mail Specialization (Passive)
      137040, // Elemental Shaman
      162699, // Stat Negation Aura - Intellect DPS
        8042, // Earth Shock
       61882, // Earthquake
      187828, // Maelstrom
      190488, // Maelstrom Controller
      188196, // Lightning Bolt
      190493, // Fulmination
      188443, // Chain Lightning
      188389, // Flame Shock
       57994, // Wind Shear
      168534, // Mastery: Elemental Overload
      196840, // Frost Shock
      198067, // Fire Elemental
      198103, // Earth Elemental
       51886, // Cleanse Spirit
        8004, // Healing Surge
      231721, // Lava Burst (Rank 2)
      231722, // Chain Lightning (Rank 2)
           0,
    },
    // Specialization abilities for Enhancement
    {
       86629, // Dual Wield
       86099, // Mail Specialization (Passive)
       51533, // Feral Spirit
       58875, // Spirit Walk
       77223, // Mastery: Enhanced Elements
      137041, // Enhancement Shaman
      157444, // Critical Strikes (Passive)
      162697, // Stat Negation Aura - Agility DPS
      187837, // Lightning Bolt
      188070, // Healing Surge
       57994, // Wind Shear
      187880, // Maelstrom Weapon
       17364, // Stormstrike
      193786, // Rockbiter
      193796, // Flametongue
       60103, // Lava Lash
      187874, // Crash Lightning
      190899, // Healing Surge (Rank 2)
      196834, // Frostbrand
      201845, // Stormbringer
       33757, // Windfury
       51886, // Cleanse Spirit
      231723, // Feral Spirit (Rank 2)
           0,
    },
    // Specialization abilities for Restoration
    {
       61295, // Riptide
       77130, // Purify Spirit
       16196, // Resurgence
       86100, // Mail Specialization (Passive)
       51564, // Tidal Waves
       77472, // Healing Wave
       98008, // Spirit Link Totem
       77226, // Mastery: Deep Healing
      137039, // Restoration Shaman
      108280, // Healing Tide Totem
       79206, // Spiritwalker's Grace
      162701, // Stat Negation Aura - Intellect Healer
        1064, // Chain Heal
       73920, // Healing Rain
      188838, // Flame Shock
        5394, // Healing Stream Totem
         421, // Chain Lightning
        8004, // Healing Surge
       57994, // Wind Shear
         403, // Lightning Bolt
       51505, // Lava Burst
       77756, // Lava Surge
      212048, // Ancestral Vision
      231780, // Chain Heal (Rank 2)
      231785, // Tidal Waves (Rank 2)
      231725, // Riptide (Rank 2)
      231721, // Lava Burst (Rank 2)
           0,
    },
    {
           0,
    },
  },
  // Specialization abilities for Mage
  {
    // Specialization abilities for Arcane
    {
       30451, // Arcane Blast
        5143, // Arcane Missiles
       79684, // Clearcasting
       44425, // Arcane Barrage
       31589, // Slow
       12042, // Arcane Power
      137021, // Arcane Mage
        1449, // Arcane Explosion
       12051, // Evocation
      190427, // Arcane Charge
      190740, // Mastery: Savant
      162699, // Stat Negation Aura - Intellect DPS
      212801, // Displacement
      195676, // Displacement
      110959, // Greater Invisibility
      231564, // Arcane Barrage (Rank 2)
      231565, // Evocation (Rank 2)
          66, // Invisibility
      235450, // Prismatic Barrier
      205025, // Presence of Mind
           0,
    },
    // Specialization abilities for Fire
    {
       11366, // Pyroblast
         133, // Fireball
       44448, // Pyroblast Clearcasting Driver
      108853, // Fire Blast
      117216, // Critical Mass
       12846, // Mastery: Ignite
      137019, // Fire Mage
        2948, // Scorch
        2120, // Flamestrike
      157642, // Enhanced Pyrotechnics
      162699, // Stat Negation Aura - Intellect DPS
      190319, // Combustion
      195283, // Hot Streak
       31661, // Dragon's Breath
          66, // Invisibility
      231567, // Fire Blast (Rank 3)
      231568, // Fire Blast (Rank 2)
      231630, // Critical Mass (Rank 2)
       86949, // Cauterize
      235313, // Blazing Barrier
           0,
    },
    // Specialization abilities for Frost
    {
       31687, // Summon Water Elemental
         116, // Frostbolt
      112965, // Fingers of Frost
       12472, // Icy Veins
       84714, // Frozen Orb
       76613, // Mastery: Icicles
      137020, // Frost Mage
       12982, // Shatter
       30455, // Ice Lance
      190356, // Blizzard
      190447, // Brain Freeze
      162699, // Stat Negation Aura - Intellect DPS
         120, // Cone of Cold
          66, // Invisibility
       44614, // Flurry
      231584, // Brain Freeze (Rank 2)
      231582, // Shatter (Rank 2)
      231596, // Freeze (Pet)
      108853, // Fire Blast
      235219, // Cold Snap
       11426, // Ice Barrier
      236662, // Blizzard (Rank 2)
           0,
    },
    {
           0,
    },
  },
  // Specialization abilities for Warlock
  {
    // Specialization abilities for Affliction
    {
       30108, // Unstable Affliction
         980, // Agony
       27243, // Seed of Corruption
       77215, // Mastery: Potent Afflictions
      137043, // Affliction Warlock
      162699, // Stat Negation Aura - Intellect DPS
         172, // Corruption
      231791, // Unstable Affliction (Rank 2)
      231792, // Agony (Rank 2)
      231811, // Soulstone (Rank 2)
      232670, // Shadow Bolt
      234153, // Drain Life
       30283, // Shadowfury
           0,
    },
    // Specialization abilities for Demonology
    {
      105174, // Hand of Gul'dan
       77219, // Mastery: Master Demonologist
       30146, // Summon Felguard (Summon)
      137044, // Demonology Warlock
      162699, // Stat Negation Aura - Intellect DPS
      104316, // Call Dreadstalkers
      108415, // Soul Link
         686, // Shadow Bolt
      231811, // Soulstone (Rank 2)
      234153, // Drain Life
       30283, // Shadowfury
      264178, // Demonbolt
      267102, // Demonic Core
      265187, // Summon Demonic Tyrant
      196277, // Implosion
           0,
    },
    // Specialization abilities for Destruction
    {
       17962, // Conflagrate
         348, // Immolate
       80240, // Havoc
       29722, // Incinerate
       77220, // Mastery: Chaotic Energies
      116858, // Chaos Bolt
        5740, // Rain of Fire
      137046, // Destruction Warlock
      162699, // Stat Negation Aura - Intellect DPS
      193541, // Immolate
         686, // Shadow Bolt
      231793, // Conflagrate (Rank 2)
      231811, // Soulstone (Rank 2)
      234153, // Drain Life
        1122, // Summon Infernal (Guardian)
       30283, // Shadowfury
      196406, // Backdraft
           0,
    },
    {
           0,
    },
  },
  // Specialization abilities for Monk
  {
    // Specialization abilities for Brewmaster
    {
      115181, // Breath of Fire
      115308, // Ironskin Brew
      117906, // Mastery: Elusive Brawler
      115069, // Stagger
      119582, // Purifying Brew
      120225, // Leather Specialization (Passive)
      121253, // Keg Smash
      124502, // Gift of the Ox
      137023, // Brewmaster Monk
      157445, // Critical Strikes (Passive)
      115176, // Zen Meditation
      162700, // Stat Negation Aura - Agility Tank
      115203, // Fortifying Brew
      116705, // Spear Hand Strike
      205523, // Blackout Strike
      216519, // Celestial Fortune
      218164, // Detox
      115072, // Expel Harm
      231602, // Vivify (Rank 2)
      245013, // Brewmaster's Balance
      119381, // Leg Sweep
      116670, // Vivify
           0,
    },
    // Specialization abilities for Mistweaver
    {
      115151, // Renewing Mist
      115310, // Revival
      116645, // Teachings of the Monastery
      116680, // Thunder Focus Tea
      117907, // Mastery: Gust of Mists
      120224, // Leather Specialization (Passive)
      116849, // Life Cocoon
      124682, // Enveloping Mist
      137024, // Mistweaver Monk
      162701, // Stat Negation Aura - Intellect Healer
      191837, // Essence Font
      115450, // Detox
      107428, // Rising Sun Kick
      101546, // Spinning Crane Kick
      116670, // Vivify
      212051, // Reawaken
      231605, // Enveloping Mist (Rank 2)
      231606, // Renewing Mist (Rank 2)
      231633, // Essence Font (Rank 2)
      231876, // Thunder Focus Tea (Rank 2)
      262840, // Rising Sun Kick (Rank 2)
      119381, // Leg Sweep
      243435, // Fortifying Brew
      115175, // Soothing Mist
      274586, // Vivify (Rank 2)
           0,
    },
    // Specialization abilities for Windwalker
    {
      113656, // Fists of Fury
      101545, // Flying Serpent Kick
      107428, // Rising Sun Kick
      116092, // Afterlife
      120227, // Leather Specialization (Passive)
      115636, // Mastery: Combo Strikes
      124146, // Dual Wield
      122470, // Touch of Karma
      128595, // Combat Conditioning
      137025, // Windwalker Monk
      137384, // Combo Breaker
      137639, // Storm, Earth, and Fire
      116095, // Disable
      157445, // Critical Strikes (Passive)
      162697, // Stat Negation Aura - Agility DPS
      103985, // Stance of the Fierce Tiger (Stance)
      115080, // Touch of Death
      101546, // Spinning Crane Kick
      116705, // Spear Hand Strike
      157411, // Windwalking
      218164, // Detox
      220357, // Cyclone Strikes
      231602, // Vivify (Rank 2)
      231627, // Storm, Earth, and Fire (Rank 2)
      119381, // Leg Sweep
      261916, // Blackout Kick (Rank 2)
      261917, // Blackout Kick (Rank 3)
      262840, // Rising Sun Kick (Rank 2)
      271232, // Touch of Death Amplifier
      116670, // Vivify
           0,
    },
    {
           0,
    },
  },
  // Specialization abilities for Druid
  {
    // Specialization abilities for Balance
    {
       24858, // Moonkin Form
       78675, // Solar Beam
      108299, // Killer Instinct
       86104, // Leather Specialization
       77492, // Mastery: Starlight
      137013, // Balance Druid
      162699, // Stat Negation Aura - Intellect DPS
       22812, // Barkskin
      190984, // Solar Wrath (Solar)
      191034, // Starfall
      194153, // Lunar Strike (Lunar)
      194223, // Celestial Alignment
       29166, // Innervate
       78674, // Starsurge
       93402, // Sunfire (Solar)
        5215, // Prowl
      197524, // Astral Influence
      197911, // Astral Power (Passive)
        2782, // Remove Corruption
      231021, // Starsurge (Rank 2)
      231042, // Moonkin Form (Rank 2)
      231049, // Starfall (Rank 2)
      231050, // Sunfire (Rank 2)
      159456, // Travel Form (Rank 2)
      228545, // Shapeshift Form (Shapeshift)
        2908, // Soothe
           0,
    },
    // Specialization abilities for Feral
    {
      106733, // Feral Overrides Passive (Passive)
        5217, // Tiger's Fury
       16949, // Feral Instinct
        1079, // Rip
       16974, // Predatory Swiftness
       33873, // Nurturing Instinct
       16864, // Omen of Clarity
       86097, // Leather Specialization
      106839, // Skull Bash
       77493, // Mastery: Razor Claws
       48484, // Infected Wounds
      137011, // Feral Druid
      157447, // Critical Strikes (Passive)
      162697, // Stat Negation Aura - Agility DPS
       22570, // Maim
        1822, // Rake
       61336, // Survival Instincts
       22568, // Ferocious Bite
        5215, // Prowl
      106898, // Stampeding Roar
      106832, // Thrash
      159286, // Primal Fury
      131768, // Feline Swiftness
      197692, // Feral Overrides Passive (Passive)
      106951, // Berserk
        2782, // Remove Corruption
      213764, // Swipe
      228545, // Shapeshift Form (Shapeshift)
      231052, // Rake (Rank 2)
      231055, // Tiger's Fury (Rank 2)
      231056, // Ferocious Bite (Rank 2)
      231057, // Shred (Rank 3)
      231063, // Shred (Rank 2)
      159456, // Travel Form (Rank 2)
      231283, // Swipe (Rank 2)
        2908, // Soothe
    },
    // Specialization abilities for Guardian
    {
      106734, // Guardian Overrides Passive (Passive)
       33873, // Nurturing Instinct
       16931, // Thick Hide
       86096, // Leather Specialization
      106839, // Skull Bash
      155783, // Mastery: Nature's Guardian
      159195, // Mastery: Nature's Guardian
      137010, // Guardian Druid
      157447, // Critical Strikes (Passive)
      162700, // Stat Negation Aura - Agility Tank
       22812, // Barkskin
        6807, // Maul
       61336, // Survival Instincts
       22842, // Frenzied Regeneration
      106898, // Stampeding Roar
      192081, // Ironfur
        5215, // Prowl
          99, // Incapacitating Roar
      210706, // Gore
        2782, // Remove Corruption
      213764, // Swipe
      106832, // Thrash
      231064, // Mangle (Rank 2)
      231065, // Lightning Reflexes
      231070, // Ironfur (Rank 2)
      159456, // Travel Form (Rank 2)
      228545, // Shapeshift Form (Shapeshift)
      270100, // Bear Form (Rank 2)
      273048, // Frenzied Regeneration (Rank 2)
           0,
    },
    // Specialization abilities for Restoration
    {
       18562, // Swiftmend
       88423, // Nature's Cure
      108299, // Killer Instinct
      102342, // Ironbark
      113043, // Omen of Clarity
       86093, // Leather Specialization
       48438, // Wild Growth
       33763, // Lifebloom
       77495, // Mastery: Harmony
      137012, // Restoration Druid
      145205, // Efflorescence
         740, // Tranquility
      162701, // Stat Negation Aura - Intellect Healer
         774, // Rejuvenation
       22812, // Barkskin
      145108, // Ysera's Gift
        5215, // Prowl
        5176, // Solar Wrath (Solar)
      102793, // Ursol's Vortex
       93402, // Sunfire (Solar)
       29166, // Innervate
      212040, // Revitalize
      231040, // Rejuvenation (Rank 2)
      231050, // Sunfire (Rank 2)
      159456, // Travel Form (Rank 2)
        2908, // Soothe
           0,
    },
  },
  // Specialization abilities for Demon Hunter
  {
    // Specialization abilities for Havoc
    {
      178940, // Shattered Souls
      212612, // Havoc Demon Hunter
      185164, // Mastery: Demonic Presence
      178976, // Leather Specialization (Passive)
      196718, // Darkness
      162243, // Demon's Bite
      162697, // Stat Negation Aura - Agility DPS
      197125, // Chaos Strike (Passive)
           0,
    },
    // Specialization abilities for Vengeance
    {
      189926, // Increased Threat
      185245, // Torment
      187827, // Metamorphosis
      204021, // Fiery Brand
      178740, // Immolation Aura
      189110, // Infernal Strike
      203513, // Demonic Wards
      203782, // Shear
      203720, // Demon Spikes
      202137, // Sigil of Silence
      204157, // Throw Glaive
      204596, // Sigil of Flame
      207197, // Riposte
      204254, // Shattered Souls
      212613, // Vengeance Demon Hunter
      203747, // Mastery: Fel Blood
      226359, // Leather Specialization (Passive)
      228477, // Soul Cleave
      207684, // Sigil of Misery
      162700, // Stat Negation Aura - Agility Tank
      203783, // Shear
           0,
    },
    {
           0,
    },
    {
           0,
    },
  },
};
#define CLASS_MASTERY_ABILITY_SIZE (1)

// Class mastery abilities, wow build 26491
static unsigned __class_mastery_ability_data[MAX_CLASS][MAX_SPECS_PER_CLASS][CLASS_MASTERY_ABILITY_SIZE] = {
  {
    {
          0,
    },
    {
          0,
    },
    {
          0,
    },
    {
          0,
    },
  },
  // Class mastery abilities for Warrior
  {
    // Masteries for Arms specialization
    {
     262111, // Mastery: Deep Wounds
    },
    // Masteries for Fury specialization
    {
      76856, // Mastery: Unshackled Fury
    },
    // Masteries for Protection specialization
    {
      76857, // Mastery: Critical Block
    },
    {
          0,
    },
  },
  // Class mastery abilities for Paladin
  {
    // Masteries for Holy specialization
    {
     183997, // Mastery: Lightbringer
    },
    // Masteries for Protection specialization
    {
      76671, // Mastery: Divine Bulwark
    },
    // Masteries for Retribution specialization
    {
     267316, // Mastery: Hand of Light
    },
    {
          0,
    },
  },
  // Class mastery abilities for Hunter
  {
    // Masteries for Beast Mastery specialization
    {
      76657, // Mastery: Master of Beasts
    },
    // Masteries for Marksmanship specialization
    {
     193468, // Mastery: Sniper Training
    },
    // Masteries for Survival specialization
    {
     263135, // Mastery: Spirit Bond
    },
    {
          0,
    },
  },
  // Class mastery abilities for Rogue
  {
    // Masteries for Assassination specialization
    {
      76803, // Mastery: Potent Assassin
    },
    // Masteries for Outlaw specialization
    {
      76806, // Mastery: Main Gauche
    },
    // Masteries for Subtlety specialization
    {
      76808, // Mastery: Executioner
    },
    {
          0,
    },
  },
  // Class mastery abilities for Priest
  {
    // Masteries for Discipline specialization
    {
     271534, // Mastery: Reverence
    },
    // Masteries for Holy specialization
    {
      77485, // Mastery: Echo of Light
    },
    // Masteries for Shadow specialization
    {
      77486, // Mastery: Madness
    },
    {
          0,
    },
  },
  // Class mastery abilities for Death Knight
  {
    // Masteries for Blood specialization
    {
      77513, // Mastery: Blood Shield
    },
    // Masteries for Frost specialization
    {
      77514, // Mastery: Frozen Heart
    },
    // Masteries for Unholy specialization
    {
      77515, // Mastery: Dreadblade
    },
    {
          0,
    },
  },
  // Class mastery abilities for Shaman
  {
    // Masteries for Elemental specialization
    {
     168534, // Mastery: Elemental Overload
    },
    // Masteries for Enhancement specialization
    {
      77223, // Mastery: Enhanced Elements
    },
    // Masteries for Restoration specialization
    {
      77226, // Mastery: Deep Healing
    },
    {
          0,
    },
  },
  // Class mastery abilities for Mage
  {
    // Masteries for Arcane specialization
    {
     190740, // Mastery: Savant
    },
    // Masteries for Fire specialization
    {
      12846, // Mastery: Ignite
    },
    // Masteries for Frost specialization
    {
      76613, // Mastery: Icicles
    },
    {
          0,
    },
  },
  // Class mastery abilities for Warlock
  {
    // Masteries for Affliction specialization
    {
      77215, // Mastery: Potent Afflictions
    },
    // Masteries for Demonology specialization
    {
      77219, // Mastery: Master Demonologist
    },
    // Masteries for Destruction specialization
    {
      77220, // Mastery: Chaotic Energies
    },
    {
          0,
    },
  },
  // Class mastery abilities for Monk
  {
    // Masteries for Brewmaster specialization
    {
     117906, // Mastery: Elusive Brawler
    },
    // Masteries for Mistweaver specialization
    {
     117907, // Mastery: Gust of Mists
    },
    // Masteries for Windwalker specialization
    {
     115636, // Mastery: Combo Strikes
    },
    {
          0,
    },
  },
  // Class mastery abilities for Druid
  {
    // Masteries for Balance specialization
    {
      77492, // Mastery: Starlight
    },
    // Masteries for Feral specialization
    {
      77493, // Mastery: Razor Claws
    },
    // Masteries for Guardian specialization
    {
     155783, // Mastery: Nature's Guardian
    },
    // Masteries for Restoration specialization
    {
      77495, // Mastery: Harmony
    },
  },
  // Class mastery abilities for Demon Hunter
  {
    // Masteries for Havoc specialization
    {
     185164, // Mastery: Demonic Presence
    },
    // Masteries for Vengeance specialization
    {
     203747, // Mastery: Fel Blood
    },
    {
          0,
    },
    {
          0,
    },
  },
};
#define RACE_ABILITY_SIZE (5)

#ifndef MAX_RACE
#define MAX_RACE (31)
#endif

// Racial abilities, wow build 26491
static unsigned __race_ability_data[MAX_RACE][MAX_CLASS][RACE_ABILITY_SIZE] = {
  {
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
  },
  // Racial abilities for Human
  {
    // Generic racial abilities
    {
      59752, // Every Man for Himself
      20598, // The Human Spirit
          0,
    },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
  },
  // Racial abilities for Orc
  {
    // Generic racial abilities
    {
      20573, // Hardiness
          0,
    },
    // Racial abilities for Warrior class
    {
      20572, // Blood Fury
      21563, // Command
          0,
    },
    // Racial abilities for Paladin class
    {
      21563, // Command
          0,
    },
    // Racial abilities for Hunter class
    {
      20572, // Blood Fury
      21563, // Command
          0,
    },
    // Racial abilities for Rogue class
    {
      20572, // Blood Fury
      21563, // Command
          0,
    },
    // Racial abilities for Priest class
    {
      21563, // Command
          0,
    },
    // Racial abilities for Death Knight class
    {
      20572, // Blood Fury
      21563, // Command
          0,
    },
    // Racial abilities for Shaman class
    {
      33697, // Blood Fury
      21563, // Command
          0,
    },
    // Racial abilities for Mage class
    {
      33702, // Blood Fury
      21563, // Command
          0,
    },
    // Racial abilities for Warlock class
    {
      33702, // Blood Fury
      21563, // Command
          0,
    },
    // Racial abilities for Monk class
    {
      33697, // Blood Fury
      21563, // Command
          0,
    },
    // Racial abilities for Druid class
    {
      21563, // Command
          0,
    },
    // Racial abilities for Demon Hunter class
    {
      21563, // Command
          0,
    },
  },
  // Racial abilities for Dwarf
  {
    // Generic racial abilities
    {
      92682, // Explorer
      20596, // Frost Resistance
      59224, // Might of the Mountain
      20594, // Stoneform
          0,
    },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
  },
  // Racial abilities for Night Elf
  {
    // Generic racial abilities
    {
      20583, // Nature Resistance
      20582, // Quickness
      58984, // Shadowmeld
      154748, // Touch of Elune
          0,
    },
    {     0, },
    {     0, },
    {     0, },
    // Racial abilities for Rogue class
    {
      21009, // Elusiveness
          0,
    },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    // Racial abilities for Druid class
    {
      21009, // Elusiveness
          0,
    },
    {     0, },
  },
  // Racial abilities for Undead
  {
    // Generic racial abilities
    {
      20577, // Cannibalize
      20579, // Shadow Resistance
       5227, // Touch of the Grave
       7744, // Will of the Forsaken
          0,
    },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
  },
  // Racial abilities for Tauren
  {
    // Generic racial abilities
    {
      154743, // Brawn
      20550, // Endurance
      20551, // Nature Resistance
      20549, // War Stomp
          0,
    },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
  },
  // Racial abilities for Gnome
  {
    // Generic racial abilities
    {
      20592, // Arcane Resistance
      20589, // Escape Artist
      92680, // Nimble Fingers
          0,
    },
    // Racial abilities for Warrior class
    {
      154746, // Expansive Mind
          0,
    },
    // Racial abilities for Paladin class
    {
      20591, // Expansive Mind
          0,
    },
    // Racial abilities for Hunter class
    {
      227057, // Expansive Mind
          0,
    },
    // Racial abilities for Rogue class
    {
      154744, // Expansive Mind
          0,
    },
    // Racial abilities for Priest class
    {
      20591, // Expansive Mind
          0,
    },
    // Racial abilities for Death Knight class
    {
      154747, // Expansive Mind
          0,
    },
    // Racial abilities for Shaman class
    {
      20591, // Expansive Mind
          0,
    },
    // Racial abilities for Mage class
    {
      20591, // Expansive Mind
          0,
    },
    // Racial abilities for Warlock class
    {
      20591, // Expansive Mind
          0,
    },
    // Racial abilities for Monk class
    {
      20591, // Expansive Mind
      154744, // Expansive Mind
          0,
    },
    {     0, },
    {     0, },
  },
  // Racial abilities for Troll
  {
    // Generic racial abilities
    {
      20557, // Beast Slaying
      26297, // Berserking
      58943, // Da Voodoo Shuffle
      20555, // Regeneration
          0,
    },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
  },
  // Racial abilities for Goblin
  {
    // Generic racial abilities
    {
      69041, // Rocket Barrage
      69070, // Rocket Jump
      69042, // Time is Money
          0,
    },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
  },
  // Racial abilities for Blood Elf
  {
    // Generic racial abilities
    {
      154742, // Arcane Acuity
        822, // Arcane Resistance
          0,
    },
    // Racial abilities for Warrior class
    {
      69179, // Arcane Torrent
          0,
    },
    // Racial abilities for Paladin class
    {
      155145, // Arcane Torrent
          0,
    },
    // Racial abilities for Hunter class
    {
      80483, // Arcane Torrent
          0,
    },
    // Racial abilities for Rogue class
    {
      25046, // Arcane Torrent
          0,
    },
    // Racial abilities for Priest class
    {
      232633, // Arcane Torrent
          0,
    },
    // Racial abilities for Death Knight class
    {
      50613, // Arcane Torrent
          0,
    },
    {     0, },
    // Racial abilities for Mage class
    {
      28730, // Arcane Torrent
          0,
    },
    // Racial abilities for Warlock class
    {
      28730, // Arcane Torrent
          0,
    },
    // Racial abilities for Monk class
    {
      129597, // Arcane Torrent
          0,
    },
    {     0, },
    // Racial abilities for Demon Hunter class
    {
      202719, // Arcane Torrent
          0,
    },
  },
  // Racial abilities for Draenei
  {
    // Generic racial abilities
    {
       6562, // Heroic Presence
      59221, // Shadow Resistance
          0,
    },
    // Racial abilities for Warrior class
    {
      28880, // Gift of the Naaru
          0,
    },
    // Racial abilities for Paladin class
    {
      59542, // Gift of the Naaru
          0,
    },
    // Racial abilities for Hunter class
    {
      59543, // Gift of the Naaru
          0,
    },
    {     0, },
    // Racial abilities for Priest class
    {
      59544, // Gift of the Naaru
          0,
    },
    // Racial abilities for Death Knight class
    {
      59545, // Gift of the Naaru
          0,
    },
    // Racial abilities for Shaman class
    {
      59547, // Gift of the Naaru
          0,
    },
    // Racial abilities for Mage class
    {
      59548, // Gift of the Naaru
          0,
    },
    {     0, },
    // Racial abilities for Monk class
    {
      121093, // Gift of the Naaru
          0,
    },
    {     0, },
    {     0, },
  },
  {
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
  },
  {
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
  },
  {
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
  },
  {
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
  },
  {
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
  },
  {
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
  },
  {
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
  },
  {
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
  },
  {
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
  },
  {
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
  },
  // Racial abilities for Worgen
  {
    {     0, },
    // Racial abilities for Warrior class
    {
      68976, // Aberration
      94293, // Altered Form
      68992, // Darkflight
      68975, // Viciousness
          0,
    },
    // Racial abilities for Paladin class
    {
      68976, // Aberration
      94293, // Altered Form
      68992, // Darkflight
      68975, // Viciousness
          0,
    },
    // Racial abilities for Hunter class
    {
      68976, // Aberration
      94293, // Altered Form
      68992, // Darkflight
      68975, // Viciousness
          0,
    },
    // Racial abilities for Rogue class
    {
      68976, // Aberration
      94293, // Altered Form
      68992, // Darkflight
      68975, // Viciousness
          0,
    },
    // Racial abilities for Priest class
    {
      68976, // Aberration
      94293, // Altered Form
      68992, // Darkflight
      68975, // Viciousness
          0,
    },
    // Racial abilities for Death Knight class
    {
      68976, // Aberration
      94293, // Altered Form
      68992, // Darkflight
      68975, // Viciousness
          0,
    },
    // Racial abilities for Shaman class
    {
      68976, // Aberration
      94293, // Altered Form
      68992, // Darkflight
      68975, // Viciousness
          0,
    },
    // Racial abilities for Mage class
    {
      68976, // Aberration
      94293, // Altered Form
      68992, // Darkflight
      68975, // Viciousness
          0,
    },
    // Racial abilities for Warlock class
    {
      68976, // Aberration
      94293, // Altered Form
      68992, // Darkflight
      68975, // Viciousness
          0,
    },
    {     0, },
    // Racial abilities for Druid class
    {
      68976, // Aberration
      94293, // Altered Form
      68992, // Darkflight
      68975, // Viciousness
          0,
    },
    {     0, },
  },
  {
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
  },
  {
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
  },
  // Racial abilities for Pandaren
  {
    // Generic racial abilities
    {
      107076, // Bouncy
      107072, // Epicurean
      107074, // Inner Peace
      107079, // Quaking Palm
          0,
    },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
  },
  {
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
  },
  // Racial abilities for Nightborne
  {
    // Generic racial abilities
    {
      260364, // Arcane Pulse
      255664, // Arcane Resistance
      255661, // Cantrips
      255665, // Magical Affinity
          0,
    },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
  },
  // Racial abilities for Highmountain Tauren
  {
    // Generic racial abilities
    {
      255654, // Bull Rush
      255658, // Mountaineer
      255655, // Pride of Ironhorn
      255659, // Rugged Tenacity
      255656, // Waste Not, Want Not
    },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
  },
  // Racial abilities for Void Elf
  {
    // Generic racial abilities
    {
      255668, // Chill of Night
      255669, // Entropic Embrace
      255667, // Ethereal Connection
      255670, // Preternatural Calm
      256948, // Spatial Rift
    },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
    {     0, },
  },
  // Racial abilities for Lightforged Draenei
  {
    {     0, },
    // Racial abilities for Warrior class
    {
      255653, // Demonbane
      255651, // Holy Resistance
      255647, // Light's Judgment
      255652, // Light's Reckoning
          0,
    },
    // Racial abilities for Paladin class
    {
      255653, // Demonbane
      255651, // Holy Resistance
      255647, // Light's Judgment
      255652, // Light's Reckoning
          0,
    },
    // Racial abilities for Hunter class
    {
      255653, // Demonbane
      255651, // Holy Resistance
      255647, // Light's Judgment
      255652, // Light's Reckoning
          0,
    },
    // Racial abilities for Rogue class
    {
      255653, // Demonbane
      255651, // Holy Resistance
      255647, // Light's Judgment
      255652, // Light's Reckoning
          0,
    },
    // Racial abilities for Priest class
    {
      255653, // Demonbane
      255651, // Holy Resistance
      255647, // Light's Judgment
      255652, // Light's Reckoning
          0,
    },
    // Racial abilities for Death Knight class
    {
      255653, // Demonbane
      255651, // Holy Resistance
      255647, // Light's Judgment
      255652, // Light's Reckoning
          0,
    },
    // Racial abilities for Shaman class
    {
      255653, // Demonbane
      255651, // Holy Resistance
      255647, // Light's Judgment
      255652, // Light's Reckoning
          0,
    },
    // Racial abilities for Mage class
    {
      255653, // Demonbane
      255651, // Holy Resistance
      255647, // Light's Judgment
      255652, // Light's Reckoning
          0,
    },
    // Racial abilities for Warlock class
    {
      255653, // Demonbane
      255651, // Holy Resistance
      255647, // Light's Judgment
      255652, // Light's Reckoning
          0,
    },
    // Racial abilities for Monk class
    {
      255653, // Demonbane
      255651, // Holy Resistance
      255647, // Light's Judgment
      255652, // Light's Reckoning
          0,
    },
    // Racial abilities for Druid class
    {
      255653, // Demonbane
      255651, // Holy Resistance
      255647, // Light's Judgment
      255652, // Light's Reckoning
          0,
    },
    // Racial abilities for Demon Hunter class
    {
      255653, // Demonbane
      255651, // Holy Resistance
      255647, // Light's Judgment
      255652, // Light's Reckoning
          0,
    },
  },
};
#define SET_BONUS_DATA_SIZE (688)

// Set bonus data, wow build 26491
static item_set_bonus_t __set_bonus_data[SET_BONUS_DATA_SIZE] = {
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Gladiator's Battlegear"                     ,        "pvp",      0,  1230,    0,   2,   1,   71, 165636, { 127055, 127081, 127092, 127103, 127114,  0 } },
  { "Gladiator's Battlegear"                     ,        "pvp",      0,  1230,    0,   2,   1,   72, 165639, { 127055, 127081, 127092, 127103, 127114,  0 } },
  { "Gladiator's Battlegear"                     ,        "pvp",      0,  1230,    0,   2,   1,   73, 165641, { 127055, 127081, 127092, 127103, 127114,  0 } },
  { "Gladiator's Battlegear"                     ,        "pvp",      0,  1230,    0,   4,   1,   73, 165670, { 127055, 127081, 127092, 127103, 127114,  0 } },
  { "Gladiator's Battlegear"                     ,        "pvp",      0,  1230,    0,   4,   1,   72, 165670, { 127055, 127081, 127092, 127103, 127114,  0 } },
  { "Gladiator's Battlegear"                     ,        "pvp",      0,  1230,    0,   4,   1,   71, 165670, { 127055, 127081, 127092, 127103, 127114,  0 } },
  { "Gladiator's Vindication"                    ,        "pvp",      0,  1225,    0,   2,   2,   70, 165886, { 127052, 127076, 127087, 127098, 127109,  0 } },
  { "Gladiator's Vindication"                    ,        "pvp",      0,  1225,    0,   2,   2,   66, 165905, { 127052, 127076, 127087, 127098, 127109,  0 } },
  { "Gladiator's Vindication"                    ,        "pvp",      0,  1225,    0,   2,   2,   65, 170860, { 127052, 127076, 127087, 127098, 127109,  0 } },
  { "Gladiator's Vindication"                    ,        "pvp",      0,  1225,    0,   4,   2,   70, 165895, { 127052, 127076, 127087, 127098, 127109,  0 } },
  { "Gladiator's Vindication"                    ,        "pvp",      0,  1225,    0,   4,   2,   66, 171427, { 127052, 127076, 127087, 127098, 127109,  0 } },
  { "Gladiator's Vindication"                    ,        "pvp",      0,  1225,    0,   4,   2,   65, 185571, { 127052, 127076, 127087, 127098, 127109,  0 } },
  { "Gladiator's Pursuit"                        ,        "pvp",      0,  1222,    0,   2,   3,  255, 166005, { 127050, 127073, 127084, 127095, 127106,  0 } },
  { "Gladiator's Pursuit"                        ,        "pvp",      0,  1222,    0,   2,   3,  253, 166005, { 127050, 127073, 127084, 127095, 127106,  0 } },
  { "Gladiator's Pursuit"                        ,        "pvp",      0,  1222,    0,   2,   3,  254, 166005, { 127050, 127073, 127084, 127095, 127106,  0 } },
  { "Gladiator's Pursuit"                        ,        "pvp",      0,  1222,    0,   4,   3,  253, 171478, { 127050, 127073, 127084, 127095, 127106,  0 } },
  { "Gladiator's Pursuit"                        ,        "pvp",      0,  1222,    0,   4,   3,  254, 170884, { 127050, 127073, 127084, 127095, 127106,  0 } },
  { "Gladiator's Pursuit"                        ,        "pvp",      0,  1222,    0,   4,   3,  255, 166012, { 127050, 127073, 127084, 127095, 127106,  0 } },
  { "Gladiator's Vestments"                      ,        "pvp",      0,  1227,    0,   2,   4,  259, 165995, { 127053, 127078, 127089, 127100, 127111,  0 } },
  { "Gladiator's Vestments"                      ,        "pvp",      0,  1227,    0,   2,   4,  261, 165995, { 127053, 127078, 127089, 127100, 127111,  0 } },
  { "Gladiator's Vestments"                      ,        "pvp",      0,  1227,    0,   2,   4,  260, 165995, { 127053, 127078, 127089, 127100, 127111,  0 } },
  { "Gladiator's Vestments"                      ,        "pvp",      0,  1227,    0,   4,   4,  259, 170883, { 127053, 127078, 127089, 127100, 127111,  0 } },
  { "Gladiator's Vestments"                      ,        "pvp",      0,  1227,    0,   4,   4,  261, 170877, { 127053, 127078, 127089, 127100, 127111,  0 } },
  { "Gladiator's Vestments"                      ,        "pvp",      0,  1227,    0,   4,   4,  260, 182303, { 127053, 127078, 127089, 127100, 127111,  0 } },
  { "Gladiator's Investiture"                    ,        "pvp",      0,  1226,    0,   2,   5,  256, 171124, { 127065, 127077, 127088, 127099, 127110,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Gladiator's Investiture"                    ,        "pvp",      0,  1226,    0,   2,   5,  257, 171158, { 127065, 127077, 127088, 127099, 127110,  0 } },
  { "Gladiator's Investiture"                    ,        "pvp",      0,  1226,    0,   2,   5,  258, 171146, { 127065, 127077, 127088, 127099, 127110,  0 } },
  { "Gladiator's Investiture"                    ,        "pvp",      0,  1226,    0,   4,   5,  256, 171141, { 127065, 127077, 127088, 127099, 127110,  0 } },
  { "Gladiator's Investiture"                    ,        "pvp",      0,  1226,    0,   4,   5,  257, 171142, { 127065, 127077, 127088, 127099, 127110,  0 } },
  { "Gladiator's Investiture"                    ,        "pvp",      0,  1226,    0,   4,   5,  258, 171151, { 127065, 127077, 127088, 127099, 127110,  0 } },
  { "Gladiator's Desecration"                    ,        "pvp",      0,  1220,    0,   2,   6,  252, 166020, { 127049, 127071, 127082, 127093, 127104,  0 } },
  { "Gladiator's Desecration"                    ,        "pvp",      0,  1220,    0,   2,   6,  250, 166020, { 127049, 127071, 127082, 127093, 127104,  0 } },
  { "Gladiator's Desecration"                    ,        "pvp",      0,  1220,    0,   2,   6,  251, 166020, { 127049, 127071, 127082, 127093, 127104,  0 } },
  { "Gladiator's Desecration"                    ,        "pvp",      0,  1220,    0,   4,   6,  250, 171456, { 127049, 127071, 127082, 127093, 127104,  0 } },
  { "Gladiator's Desecration"                    ,        "pvp",      0,  1220,    0,   4,   6,  251, 166056, { 127049, 127071, 127082, 127093, 127104,  0 } },
  { "Gladiator's Desecration"                    ,        "pvp",      0,  1220,    0,   4,   6,  252, 166061, { 127049, 127071, 127082, 127093, 127104,  0 } },
  { "Gladiator's Wartide"                        ,        "pvp",      0,  1228,    0,   2,   7,  262, 171109, { 127054, 127079, 127090, 127101, 127112,  0 } },
  { "Gladiator's Wartide"                        ,        "pvp",      0,  1228,    0,   2,   7,  263, 166103, { 127054, 127079, 127090, 127101, 127112,  0 } },
  { "Gladiator's Wartide"                        ,        "pvp",      0,  1228,    0,   2,   7,  264, 171381, { 127054, 127079, 127090, 127101, 127112,  0 } },
  { "Gladiator's Wartide"                        ,        "pvp",      0,  1228,    0,   4,   7,  262, 166096, { 127054, 127079, 127090, 127101, 127112,  0 } },
  { "Gladiator's Wartide"                        ,        "pvp",      0,  1228,    0,   4,   7,  264, 166063, { 127054, 127079, 127090, 127101, 127112,  0 } },
  { "Gladiator's Wartide"                        ,        "pvp",      0,  1228,    0,   4,   7,  263, 171121, { 127054, 127079, 127090, 127101, 127112,  0 } },
  { "Gladiator's Regalia"                        ,        "pvp",      0,  1223,    0,   2,   8,   62, 171349, { 127064, 127074, 127085, 127096, 127107,  0 } },
  { "Gladiator's Regalia"                        ,        "pvp",      0,  1223,    0,   2,   8,   63, 165977, { 127064, 127074, 127085, 127096, 127107,  0 } },
  { "Gladiator's Regalia"                        ,        "pvp",      0,  1223,    0,   2,   8,   64, 180721, { 127064, 127074, 127085, 127096, 127107,  0 } },
  { "Gladiator's Regalia"                        ,        "pvp",      0,  1223,    0,   4,   8,   62, 171351, { 127064, 127074, 127085, 127096, 127107,  0 } },
  { "Gladiator's Regalia"                        ,        "pvp",      0,  1223,    0,   4,   8,   63, 171169, { 127064, 127074, 127085, 127096, 127107,  0 } },
  { "Gladiator's Regalia"                        ,        "pvp",      0,  1223,    0,   4,   8,   64, 180741, { 127064, 127074, 127085, 127096, 127107,  0 } },
  { "Gladiator's Felshroud"                      ,        "pvp",      0,  1229,    0,   2,   9,  265, 171377, { 127066, 127080, 127091, 127102, 127113,  0 } },
  { "Gladiator's Felshroud"                      ,        "pvp",      0,  1229,    0,   2,   9,  266, 171393, { 127066, 127080, 127091, 127102, 127113,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Gladiator's Felshroud"                      ,        "pvp",      0,  1229,    0,   2,   9,  267, 171383, { 127066, 127080, 127091, 127102, 127113,  0 } },
  { "Gladiator's Felshroud"                      ,        "pvp",      0,  1229,    0,   4,   9,  265, 171379, { 127066, 127080, 127091, 127102, 127113,  0 } },
  { "Gladiator's Felshroud"                      ,        "pvp",      0,  1229,    0,   4,   9,  266, 165967, { 127066, 127080, 127091, 127102, 127113,  0 } },
  { "Gladiator's Felshroud"                      ,        "pvp",      0,  1229,    0,   4,   9,  267, 189209, { 127066, 127080, 127091, 127102, 127113,  0 } },
  { "Gladiator's Ironskin"                       ,        "pvp",      0,  1224,    0,   2,  10,  268, 165691, { 127051, 127075, 127086, 127097, 127108,  0 } },
  { "Gladiator's Ironskin"                       ,        "pvp",      0,  1224,    0,   2,  10,  270, 170799, { 127051, 127075, 127086, 127097, 127108,  0 } },
  { "Gladiator's Ironskin"                       ,        "pvp",      0,  1224,    0,   2,  10,  269, 180743, { 127051, 127075, 127086, 127097, 127108,  0 } },
  { "Gladiator's Ironskin"                       ,        "pvp",      0,  1224,    0,   4,  10,  270, 165697, { 127051, 127075, 127086, 127097, 127108,  0 } },
  { "Gladiator's Ironskin"                       ,        "pvp",      0,  1224,    0,   4,  10,  268, 171445, { 127051, 127075, 127086, 127097, 127108,  0 } },
  { "Gladiator's Ironskin"                       ,        "pvp",      0,  1224,    0,   4,  10,  269, 181742, { 127051, 127075, 127086, 127097, 127108,  0 } },
  { "Gladiator's Sanctuary"                      ,        "pvp",      0,  1221,    0,   2,  11,  102, 165701, { 127063, 127072, 127083, 127094, 127105,  0 } },
  { "Gladiator's Sanctuary"                      ,        "pvp",      0,  1221,    0,   2,  11,  103, 170848, { 127063, 127072, 127083, 127094, 127105,  0 } },
  { "Gladiator's Sanctuary"                      ,        "pvp",      0,  1221,    0,   2,  11,  104, 171408, { 127063, 127072, 127083, 127094, 127105,  0 } },
  { "Gladiator's Sanctuary"                      ,        "pvp",      0,  1221,    0,   2,  11,  105, 170853, { 127063, 127072, 127083, 127094, 127105,  0 } },
  { "Gladiator's Sanctuary"                      ,        "pvp",      0,  1221,    0,   4,  11,  103, 165698, { 127063, 127072, 127083, 127094, 127105,  0 } },
  { "Gladiator's Sanctuary"                      ,        "pvp",      0,  1221,    0,   4,  11,  104, 171489, { 127063, 127072, 127083, 127094, 127105,  0 } },
  { "Gladiator's Sanctuary"                      ,        "pvp",      0,  1221,    0,   4,  11,  102, 180717, { 127063, 127072, 127083, 127094, 127105,  0 } },
  { "Gladiator's Sanctuary"                      ,        "pvp",      0,  1221,    0,   4,  11,  105, 165707, { 127063, 127072, 127083, 127094, 127105,  0 } },
  { "Blacksteel Battleplate"                     ,  "tier17lfr",      1,  1245,   17,   2,   1,   71, 179139, { 120396, 120395, 120394, 120393, 120392, 120391,  0 } },
  { "Blacksteel Battleplate"                     ,  "tier17lfr",      1,  1245,   17,   2,   1,   72, 179139, { 120396, 120395, 120394, 120393, 120392, 120391,  0 } },
  { "Blacksteel Battleplate"                     ,  "tier17lfr",      1,  1245,   17,   2,   1,   73, 179142, { 120396, 120395, 120394, 120393, 120392, 120391,  0 } },
  { "Blacksteel Battleplate"                     ,  "tier17lfr",      1,  1245,   17,   4,   1,   71, 179140, { 120396, 120395, 120394, 120393, 120392, 120391,  0 } },
  { "Blacksteel Battleplate"                     ,  "tier17lfr",      1,  1245,   17,   4,   1,   72, 179140, { 120396, 120395, 120394, 120393, 120392, 120391,  0 } },
  { "Blacksteel Battleplate"                     ,  "tier17lfr",      1,  1245,   17,   4,   1,   73, 179143, { 120396, 120395, 120394, 120393, 120392, 120391,  0 } },
  { "Blacksteel Battleplate"                     ,  "tier17lfr",      1,  1245,   17,   2,   2,   65, 179145, { 120396, 120395, 120394, 120393, 120392, 120391,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Blacksteel Battleplate"                     ,  "tier17lfr",      1,  1245,   17,   2,   2,   66, 179142, { 120396, 120395, 120394, 120393, 120392, 120391,  0 } },
  { "Blacksteel Battleplate"                     ,  "tier17lfr",      1,  1245,   17,   2,   2,   70, 179139, { 120396, 120395, 120394, 120393, 120392, 120391,  0 } },
  { "Blacksteel Battleplate"                     ,  "tier17lfr",      1,  1245,   17,   4,   2,   65, 179146, { 120396, 120395, 120394, 120393, 120392, 120391,  0 } },
  { "Blacksteel Battleplate"                     ,  "tier17lfr",      1,  1245,   17,   4,   2,   66, 179143, { 120396, 120395, 120394, 120393, 120392, 120391,  0 } },
  { "Blacksteel Battleplate"                     ,  "tier17lfr",      1,  1245,   17,   4,   2,   70, 179140, { 120396, 120395, 120394, 120393, 120392, 120391,  0 } },
  { "Ashlink Armor"                              ,  "tier17lfr",      1,  1246,   17,   2,   3,  255, 179130, { 120390, 120389, 120388, 120387, 120386, 120385,  0 } },
  { "Ashlink Armor"                              ,  "tier17lfr",      1,  1246,   17,   2,   3,  253, 179130, { 120390, 120389, 120388, 120387, 120386, 120385,  0 } },
  { "Ashlink Armor"                              ,  "tier17lfr",      1,  1246,   17,   2,   3,  254, 179130, { 120390, 120389, 120388, 120387, 120386, 120385,  0 } },
  { "Ashlink Armor"                              ,  "tier17lfr",      1,  1246,   17,   4,   3,  255, 179131, { 120390, 120389, 120388, 120387, 120386, 120385,  0 } },
  { "Ashlink Armor"                              ,  "tier17lfr",      1,  1246,   17,   4,   3,  253, 179131, { 120390, 120389, 120388, 120387, 120386, 120385,  0 } },
  { "Ashlink Armor"                              ,  "tier17lfr",      1,  1246,   17,   4,   3,  254, 179131, { 120390, 120389, 120388, 120387, 120386, 120385,  0 } },
  { "Sootfur Garb"                               ,  "tier17lfr",      1,  1247,   17,   2,   4,  259, 179114, { 120384, 120383, 120382, 120381, 120380, 120379,  0 } },
  { "Sootfur Garb"                               ,  "tier17lfr",      1,  1247,   17,   2,   4,  261, 179114, { 120384, 120383, 120382, 120381, 120380, 120379,  0 } },
  { "Sootfur Garb"                               ,  "tier17lfr",      1,  1247,   17,   2,   4,  260, 179114, { 120384, 120383, 120382, 120381, 120380, 120379,  0 } },
  { "Sootfur Garb"                               ,  "tier17lfr",      1,  1247,   17,   4,   4,  259, 179115, { 120384, 120383, 120382, 120381, 120380, 120379,  0 } },
  { "Sootfur Garb"                               ,  "tier17lfr",      1,  1247,   17,   4,   4,  261, 179115, { 120384, 120383, 120382, 120381, 120380, 120379,  0 } },
  { "Sootfur Garb"                               ,  "tier17lfr",      1,  1247,   17,   4,   4,  260, 179115, { 120384, 120383, 120382, 120381, 120380, 120379,  0 } },
  { "Ebonflame Raiment"                          ,  "tier17lfr",      1,  1248,   17,   2,   5,  257, 179110, { 120378, 120377, 120376, 120375, 120374, 120373,  0 } },
  { "Ebonflame Raiment"                          ,  "tier17lfr",      1,  1248,   17,   2,   5,  258, 179108, { 120378, 120377, 120376, 120375, 120374, 120373,  0 } },
  { "Ebonflame Raiment"                          ,  "tier17lfr",      1,  1248,   17,   2,   5,  256, 179110, { 120378, 120377, 120376, 120375, 120374, 120373,  0 } },
  { "Ebonflame Raiment"                          ,  "tier17lfr",      1,  1248,   17,   4,   5,  257, 179111, { 120378, 120377, 120376, 120375, 120374, 120373,  0 } },
  { "Ebonflame Raiment"                          ,  "tier17lfr",      1,  1248,   17,   4,   5,  258, 179107, { 120378, 120377, 120376, 120375, 120374, 120373,  0 } },
  { "Ebonflame Raiment"                          ,  "tier17lfr",      1,  1248,   17,   4,   5,  256, 179111, { 120378, 120377, 120376, 120375, 120374, 120373,  0 } },
  { "Blacksteel Battleplate"                     ,  "tier17lfr",      1,  1245,   17,   2,   6,  250, 179142, { 120396, 120395, 120394, 120393, 120392, 120391,  0 } },
  { "Blacksteel Battleplate"                     ,  "tier17lfr",      1,  1245,   17,   2,   6,  251, 179139, { 120396, 120395, 120394, 120393, 120392, 120391,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Blacksteel Battleplate"                     ,  "tier17lfr",      1,  1245,   17,   2,   6,  252, 179139, { 120396, 120395, 120394, 120393, 120392, 120391,  0 } },
  { "Blacksteel Battleplate"                     ,  "tier17lfr",      1,  1245,   17,   4,   6,  250, 179143, { 120396, 120395, 120394, 120393, 120392, 120391,  0 } },
  { "Blacksteel Battleplate"                     ,  "tier17lfr",      1,  1245,   17,   4,   6,  251, 179140, { 120396, 120395, 120394, 120393, 120392, 120391,  0 } },
  { "Blacksteel Battleplate"                     ,  "tier17lfr",      1,  1245,   17,   4,   6,  252, 179140, { 120396, 120395, 120394, 120393, 120392, 120391,  0 } },
  { "Ashlink Armor"                              ,  "tier17lfr",      1,  1246,   17,   2,   7,  264, 179137, { 120390, 120389, 120388, 120387, 120386, 120385,  0 } },
  { "Ashlink Armor"                              ,  "tier17lfr",      1,  1246,   17,   2,   7,  262, 179133, { 120390, 120389, 120388, 120387, 120386, 120385,  0 } },
  { "Ashlink Armor"                              ,  "tier17lfr",      1,  1246,   17,   2,   7,  263, 179130, { 120390, 120389, 120388, 120387, 120386, 120385,  0 } },
  { "Ashlink Armor"                              ,  "tier17lfr",      1,  1246,   17,   4,   7,  264, 179138, { 120390, 120389, 120388, 120387, 120386, 120385,  0 } },
  { "Ashlink Armor"                              ,  "tier17lfr",      1,  1246,   17,   4,   7,  262, 179134, { 120390, 120389, 120388, 120387, 120386, 120385,  0 } },
  { "Ashlink Armor"                              ,  "tier17lfr",      1,  1246,   17,   4,   7,  263, 179131, { 120390, 120389, 120388, 120387, 120386, 120385,  0 } },
  { "Ebonflame Raiment"                          ,  "tier17lfr",      1,  1248,   17,   2,   8,   62, 179108, { 120378, 120377, 120376, 120375, 120374, 120373,  0 } },
  { "Ebonflame Raiment"                          ,  "tier17lfr",      1,  1248,   17,   2,   8,   63, 179108, { 120378, 120377, 120376, 120375, 120374, 120373,  0 } },
  { "Ebonflame Raiment"                          ,  "tier17lfr",      1,  1248,   17,   2,   8,   64, 179108, { 120378, 120377, 120376, 120375, 120374, 120373,  0 } },
  { "Ebonflame Raiment"                          ,  "tier17lfr",      1,  1248,   17,   4,   8,   62, 179107, { 120378, 120377, 120376, 120375, 120374, 120373,  0 } },
  { "Ebonflame Raiment"                          ,  "tier17lfr",      1,  1248,   17,   4,   8,   63, 179107, { 120378, 120377, 120376, 120375, 120374, 120373,  0 } },
  { "Ebonflame Raiment"                          ,  "tier17lfr",      1,  1248,   17,   4,   8,   64, 179107, { 120378, 120377, 120376, 120375, 120374, 120373,  0 } },
  { "Ebonflame Raiment"                          ,  "tier17lfr",      1,  1248,   17,   2,   9,  265, 179108, { 120378, 120377, 120376, 120375, 120374, 120373,  0 } },
  { "Ebonflame Raiment"                          ,  "tier17lfr",      1,  1248,   17,   2,   9,  266, 179108, { 120378, 120377, 120376, 120375, 120374, 120373,  0 } },
  { "Ebonflame Raiment"                          ,  "tier17lfr",      1,  1248,   17,   2,   9,  267, 179108, { 120378, 120377, 120376, 120375, 120374, 120373,  0 } },
  { "Ebonflame Raiment"                          ,  "tier17lfr",      1,  1248,   17,   4,   9,  265, 179107, { 120378, 120377, 120376, 120375, 120374, 120373,  0 } },
  { "Ebonflame Raiment"                          ,  "tier17lfr",      1,  1248,   17,   4,   9,  266, 179107, { 120378, 120377, 120376, 120375, 120374, 120373,  0 } },
  { "Ebonflame Raiment"                          ,  "tier17lfr",      1,  1248,   17,   4,   9,  267, 179107, { 120378, 120377, 120376, 120375, 120374, 120373,  0 } },
  { "Sootfur Garb"                               ,  "tier17lfr",      1,  1247,   17,   2,  10,  269, 179114, { 120384, 120383, 120382, 120381, 120380, 120379,  0 } },
  { "Sootfur Garb"                               ,  "tier17lfr",      1,  1247,   17,   2,  10,  270, 179121, { 120384, 120383, 120382, 120381, 120380, 120379,  0 } },
  { "Sootfur Garb"                               ,  "tier17lfr",      1,  1247,   17,   2,  10,  268, 179127, { 120384, 120383, 120382, 120381, 120380, 120379,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Sootfur Garb"                               ,  "tier17lfr",      1,  1247,   17,   4,  10,  269, 179115, { 120384, 120383, 120382, 120381, 120380, 120379,  0 } },
  { "Sootfur Garb"                               ,  "tier17lfr",      1,  1247,   17,   4,  10,  270, 179122, { 120384, 120383, 120382, 120381, 120380, 120379,  0 } },
  { "Sootfur Garb"                               ,  "tier17lfr",      1,  1247,   17,   4,  10,  268, 179128, { 120384, 120383, 120382, 120381, 120380, 120379,  0 } },
  { "Sootfur Garb"                               ,  "tier17lfr",      1,  1247,   17,   2,  11,  104, 179127, { 120384, 120383, 120382, 120381, 120380, 120379,  0 } },
  { "Sootfur Garb"                               ,  "tier17lfr",      1,  1247,   17,   2,  11,  105, 179121, { 120384, 120383, 120382, 120381, 120380, 120379,  0 } },
  { "Sootfur Garb"                               ,  "tier17lfr",      1,  1247,   17,   2,  11,  102, 179117, { 120384, 120383, 120382, 120381, 120380, 120379,  0 } },
  { "Sootfur Garb"                               ,  "tier17lfr",      1,  1247,   17,   2,  11,  103, 179114, { 120384, 120383, 120382, 120381, 120380, 120379,  0 } },
  { "Sootfur Garb"                               ,  "tier17lfr",      1,  1247,   17,   4,  11,  104, 179128, { 120384, 120383, 120382, 120381, 120380, 120379,  0 } },
  { "Sootfur Garb"                               ,  "tier17lfr",      1,  1247,   17,   4,  11,  105, 179122, { 120384, 120383, 120382, 120381, 120380, 120379,  0 } },
  { "Sootfur Garb"                               ,  "tier17lfr",      1,  1247,   17,   4,  11,  102, 179118, { 120384, 120383, 120382, 120381, 120380, 120379,  0 } },
  { "Sootfur Garb"                               ,  "tier17lfr",      1,  1247,   17,   4,  11,  103, 179115, { 120384, 120383, 120382, 120381, 120380, 120379,  0 } },
  { "Demonbreaker Wargear"                       ,  "tier18lfr",      2,  1263,   18,   2,   1,   72, 187141, { 128127, 128032, 128139, 128134, 128135, 128123,  0 } },
  { "Demonbreaker Wargear"                       ,  "tier18lfr",      2,  1263,   18,   2,   1,   73, 187142, { 128127, 128032, 128139, 128134, 128135, 128123,  0 } },
  { "Demonbreaker Wargear"                       ,  "tier18lfr",      2,  1263,   18,   2,   1,   71, 187141, { 128127, 128032, 128139, 128134, 128135, 128123,  0 } },
  { "Demonbreaker Wargear"                       ,  "tier18lfr",      2,  1263,   18,   4,   1,   72, 187151, { 128127, 128032, 128139, 128134, 128135, 128123,  0 } },
  { "Demonbreaker Wargear"                       ,  "tier18lfr",      2,  1263,   18,   4,   1,   73, 187143, { 128127, 128032, 128139, 128134, 128135, 128123,  0 } },
  { "Demonbreaker Wargear"                       ,  "tier18lfr",      2,  1263,   18,   4,   1,   71, 187151, { 128127, 128032, 128139, 128134, 128135, 128123,  0 } },
  { "Demonbreaker Wargear"                       ,  "tier18lfr",      2,  1263,   18,   2,   2,   65, 187140, { 128127, 128032, 128139, 128134, 128135, 128123,  0 } },
  { "Demonbreaker Wargear"                       ,  "tier18lfr",      2,  1263,   18,   2,   2,   70, 187141, { 128127, 128032, 128139, 128134, 128135, 128123,  0 } },
  { "Demonbreaker Wargear"                       ,  "tier18lfr",      2,  1263,   18,   2,   2,   66, 187142, { 128127, 128032, 128139, 128134, 128135, 128123,  0 } },
  { "Demonbreaker Wargear"                       ,  "tier18lfr",      2,  1263,   18,   4,   2,   65, 187155, { 128127, 128032, 128139, 128134, 128135, 128123,  0 } },
  { "Demonbreaker Wargear"                       ,  "tier18lfr",      2,  1263,   18,   4,   2,   70, 187151, { 128127, 128032, 128139, 128134, 128135, 128123,  0 } },
  { "Demonbreaker Wargear"                       ,  "tier18lfr",      2,  1263,   18,   4,   2,   66, 187143, { 128127, 128032, 128139, 128134, 128135, 128123,  0 } },
  { "Rancorbite Battlegear"                      ,  "tier18lfr",      2,  1262,   18,   2,   3,  255, 187137, { 128126, 128080, 128138, 128132, 128133, 128122,  0 } },
  { "Rancorbite Battlegear"                      ,  "tier18lfr",      2,  1262,   18,   2,   3,  254, 187137, { 128126, 128080, 128138, 128132, 128133, 128122,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Rancorbite Battlegear"                      ,  "tier18lfr",      2,  1262,   18,   2,   3,  253, 187137, { 128126, 128080, 128138, 128132, 128133, 128122,  0 } },
  { "Rancorbite Battlegear"                      ,  "tier18lfr",      2,  1262,   18,   4,   3,  255, 187688, { 128126, 128080, 128138, 128132, 128133, 128122,  0 } },
  { "Rancorbite Battlegear"                      ,  "tier18lfr",      2,  1262,   18,   4,   3,  254, 187688, { 128126, 128080, 128138, 128132, 128133, 128122,  0 } },
  { "Rancorbite Battlegear"                      ,  "tier18lfr",      2,  1262,   18,   4,   3,  253, 187688, { 128126, 128080, 128138, 128132, 128133, 128122,  0 } },
  { "Ironpelt Armor"                             ,  "tier18lfr",      2,  1261,   18,   2,   4,  259, 187135, { 128125, 128054, 128137, 128130, 128131, 128121,  0 } },
  { "Ironpelt Armor"                             ,  "tier18lfr",      2,  1261,   18,   2,   4,  260, 187135, { 128125, 128054, 128137, 128130, 128131, 128121,  0 } },
  { "Ironpelt Armor"                             ,  "tier18lfr",      2,  1261,   18,   2,   4,  261, 187135, { 128125, 128054, 128137, 128130, 128131, 128121,  0 } },
  { "Ironpelt Armor"                             ,  "tier18lfr",      2,  1261,   18,   4,   4,  259, 187863, { 128125, 128054, 128137, 128130, 128131, 128121,  0 } },
  { "Ironpelt Armor"                             ,  "tier18lfr",      2,  1261,   18,   4,   4,  260, 187863, { 128125, 128054, 128137, 128130, 128131, 128121,  0 } },
  { "Ironpelt Armor"                             ,  "tier18lfr",      2,  1261,   18,   4,   4,  261, 187863, { 128125, 128054, 128137, 128130, 128131, 128121,  0 } },
  { "Felfume Raiment"                            ,  "tier18lfr",      2,  1260,   18,   2,   5,  258, 187075, { 128052, 128136, 128128, 128129, 128124, 128120,  0 } },
  { "Felfume Raiment"                            ,  "tier18lfr",      2,  1260,   18,   2,   5,  257, 187132, { 128052, 128136, 128128, 128129, 128124, 128120,  0 } },
  { "Felfume Raiment"                            ,  "tier18lfr",      2,  1260,   18,   2,   5,  256, 187132, { 128052, 128136, 128128, 128129, 128124, 128120,  0 } },
  { "Felfume Raiment"                            ,  "tier18lfr",      2,  1260,   18,   4,   5,  258, 187079, { 128052, 128136, 128128, 128129, 128124, 128120,  0 } },
  { "Felfume Raiment"                            ,  "tier18lfr",      2,  1260,   18,   4,   5,  257, 187430, { 128052, 128136, 128128, 128129, 128124, 128120,  0 } },
  { "Felfume Raiment"                            ,  "tier18lfr",      2,  1260,   18,   4,   5,  256, 187430, { 128052, 128136, 128128, 128129, 128124, 128120,  0 } },
  { "Demonbreaker Wargear"                       ,  "tier18lfr",      2,  1263,   18,   2,   6,  252, 187141, { 128127, 128032, 128139, 128134, 128135, 128123,  0 } },
  { "Demonbreaker Wargear"                       ,  "tier18lfr",      2,  1263,   18,   2,   6,  250, 187142, { 128127, 128032, 128139, 128134, 128135, 128123,  0 } },
  { "Demonbreaker Wargear"                       ,  "tier18lfr",      2,  1263,   18,   2,   6,  251, 187141, { 128127, 128032, 128139, 128134, 128135, 128123,  0 } },
  { "Demonbreaker Wargear"                       ,  "tier18lfr",      2,  1263,   18,   4,   6,  252, 187151, { 128127, 128032, 128139, 128134, 128135, 128123,  0 } },
  { "Demonbreaker Wargear"                       ,  "tier18lfr",      2,  1263,   18,   4,   6,  250, 187143, { 128127, 128032, 128139, 128134, 128135, 128123,  0 } },
  { "Demonbreaker Wargear"                       ,  "tier18lfr",      2,  1263,   18,   4,   6,  251, 187151, { 128127, 128032, 128139, 128134, 128135, 128123,  0 } },
  { "Rancorbite Battlegear"                      ,  "tier18lfr",      2,  1262,   18,   2,   7,  263, 187137, { 128126, 128080, 128138, 128132, 128133, 128122,  0 } },
  { "Rancorbite Battlegear"                      ,  "tier18lfr",      2,  1262,   18,   2,   7,  262, 187138, { 128126, 128080, 128138, 128132, 128133, 128122,  0 } },
  { "Rancorbite Battlegear"                      ,  "tier18lfr",      2,  1262,   18,   2,   7,  264, 187139, { 128126, 128080, 128138, 128132, 128133, 128122,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Rancorbite Battlegear"                      ,  "tier18lfr",      2,  1262,   18,   4,   7,  263, 187688, { 128126, 128080, 128138, 128132, 128133, 128122,  0 } },
  { "Rancorbite Battlegear"                      ,  "tier18lfr",      2,  1262,   18,   4,   7,  262, 187778, { 128126, 128080, 128138, 128132, 128133, 128122,  0 } },
  { "Rancorbite Battlegear"                      ,  "tier18lfr",      2,  1262,   18,   4,   7,  264, 187158, { 128126, 128080, 128138, 128132, 128133, 128122,  0 } },
  { "Felfume Raiment"                            ,  "tier18lfr",      2,  1260,   18,   2,   8,   62, 187075, { 128052, 128136, 128128, 128129, 128124, 128120,  0 } },
  { "Felfume Raiment"                            ,  "tier18lfr",      2,  1260,   18,   2,   8,   63, 187075, { 128052, 128136, 128128, 128129, 128124, 128120,  0 } },
  { "Felfume Raiment"                            ,  "tier18lfr",      2,  1260,   18,   2,   8,   64, 187075, { 128052, 128136, 128128, 128129, 128124, 128120,  0 } },
  { "Felfume Raiment"                            ,  "tier18lfr",      2,  1260,   18,   4,   8,   62, 187079, { 128052, 128136, 128128, 128129, 128124, 128120,  0 } },
  { "Felfume Raiment"                            ,  "tier18lfr",      2,  1260,   18,   4,   8,   63, 187079, { 128052, 128136, 128128, 128129, 128124, 128120,  0 } },
  { "Felfume Raiment"                            ,  "tier18lfr",      2,  1260,   18,   4,   8,   64, 187079, { 128052, 128136, 128128, 128129, 128124, 128120,  0 } },
  { "Felfume Raiment"                            ,  "tier18lfr",      2,  1260,   18,   2,   9,  265, 187075, { 128052, 128136, 128128, 128129, 128124, 128120,  0 } },
  { "Felfume Raiment"                            ,  "tier18lfr",      2,  1260,   18,   2,   9,  266, 187075, { 128052, 128136, 128128, 128129, 128124, 128120,  0 } },
  { "Felfume Raiment"                            ,  "tier18lfr",      2,  1260,   18,   2,   9,  267, 187075, { 128052, 128136, 128128, 128129, 128124, 128120,  0 } },
  { "Felfume Raiment"                            ,  "tier18lfr",      2,  1260,   18,   4,   9,  265, 187079, { 128052, 128136, 128128, 128129, 128124, 128120,  0 } },
  { "Felfume Raiment"                            ,  "tier18lfr",      2,  1260,   18,   4,   9,  266, 187079, { 128052, 128136, 128128, 128129, 128124, 128120,  0 } },
  { "Felfume Raiment"                            ,  "tier18lfr",      2,  1260,   18,   4,   9,  267, 187079, { 128052, 128136, 128128, 128129, 128124, 128120,  0 } },
  { "Ironpelt Armor"                             ,  "tier18lfr",      2,  1261,   18,   2,  10,  270, 187134, { 128125, 128054, 128137, 128130, 128131, 128121,  0 } },
  { "Ironpelt Armor"                             ,  "tier18lfr",      2,  1261,   18,   2,  10,  269, 187135, { 128125, 128054, 128137, 128130, 128131, 128121,  0 } },
  { "Ironpelt Armor"                             ,  "tier18lfr",      2,  1261,   18,   2,  10,  268, 187136, { 128125, 128054, 128137, 128130, 128131, 128121,  0 } },
  { "Ironpelt Armor"                             ,  "tier18lfr",      2,  1261,   18,   4,  10,  270, 187604, { 128125, 128054, 128137, 128130, 128131, 128121,  0 } },
  { "Ironpelt Armor"                             ,  "tier18lfr",      2,  1261,   18,   4,  10,  269, 187863, { 128125, 128054, 128137, 128130, 128131, 128121,  0 } },
  { "Ironpelt Armor"                             ,  "tier18lfr",      2,  1261,   18,   4,  10,  268, 187862, { 128125, 128054, 128137, 128130, 128131, 128121,  0 } },
  { "Ironpelt Armor"                             ,  "tier18lfr",      2,  1261,   18,   2,  11,  102, 187133, { 128125, 128054, 128137, 128130, 128131, 128121,  0 } },
  { "Ironpelt Armor"                             ,  "tier18lfr",      2,  1261,   18,   2,  11,  105, 187134, { 128125, 128054, 128137, 128130, 128131, 128121,  0 } },
  { "Ironpelt Armor"                             ,  "tier18lfr",      2,  1261,   18,   2,  11,  103, 187135, { 128125, 128054, 128137, 128130, 128131, 128121,  0 } },
  { "Ironpelt Armor"                             ,  "tier18lfr",      2,  1261,   18,   2,  11,  104, 187136, { 128125, 128054, 128137, 128130, 128131, 128121,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Ironpelt Armor"                             ,  "tier18lfr",      2,  1261,   18,   4,  11,  102, 187435, { 128125, 128054, 128137, 128130, 128131, 128121,  0 } },
  { "Ironpelt Armor"                             ,  "tier18lfr",      2,  1261,   18,   4,  11,  105, 187604, { 128125, 128054, 128137, 128130, 128131, 128121,  0 } },
  { "Ironpelt Armor"                             ,  "tier18lfr",      2,  1261,   18,   4,  11,  103, 187863, { 128125, 128054, 128137, 128130, 128131, 128121,  0 } },
  { "Ironpelt Armor"                             ,  "tier18lfr",      2,  1261,   18,   4,  11,  104, 187862, { 128125, 128054, 128137, 128130, 128131, 128121,  0 } },
  { "Battlelord's Plate"                         ,   "tier19oh",      3,  1280,   19,   2,   1,   -1, 221615, { 139681, 139682, 139683, 139684, 139685, 139686, 139687, 139688,  0 } },
  { "Battlelord's Plate"                         ,   "tier19oh",      3,  1280,   19,   4,   1,   -1, 221617, { 139681, 139682, 139683, 139684, 139685, 139686, 139687, 139688,  0 } },
  { "Battlelord's Plate"                         ,   "tier19oh",      3,  1280,   19,   6,   1,   -1, 221533, { 139681, 139682, 139683, 139684, 139685, 139686, 139687, 139688,  0 } },
  { "Battlelord's Plate"                         ,   "tier19oh",      3,  1280,   19,   8,   1,   -1, 221669, { 139681, 139682, 139683, 139684, 139685, 139686, 139687, 139688,  0 } },
  { "Battleplate of the Silver Hand"             ,   "tier19oh",      3,  1275,   19,   2,   2,   -1, 221615, { 139690, 139691, 139692, 139693, 139694, 139695, 139696, 139697,  0 } },
  { "Battleplate of the Silver Hand"             ,   "tier19oh",      3,  1275,   19,   4,   2,   -1, 221617, { 139690, 139691, 139692, 139693, 139694, 139695, 139696, 139697,  0 } },
  { "Battleplate of the Silver Hand"             ,   "tier19oh",      3,  1275,   19,   6,   2,   65, 221534, { 139690, 139691, 139692, 139693, 139694, 139695, 139696, 139697,  0 } },
  { "Battleplate of the Silver Hand"             ,   "tier19oh",      3,  1275,   19,   6,   2,   70, 221533, { 139690, 139691, 139692, 139693, 139694, 139695, 139696, 139697,  0 } },
  { "Battleplate of the Silver Hand"             ,   "tier19oh",      3,  1275,   19,   6,   2,   66, 221533, { 139690, 139691, 139692, 139693, 139694, 139695, 139696, 139697,  0 } },
  { "Battleplate of the Silver Hand"             ,   "tier19oh",      3,  1275,   19,   8,   2,   -1, 221653, { 139690, 139691, 139692, 139693, 139694, 139695, 139696, 139697,  0 } },
  { "Guise of the Unseen Path"                   ,   "tier19oh",      3,  1272,   19,   2,   3,   -1, 221615, { 139707, 139708, 139709, 139710, 139711, 139712, 139713, 139714,  0 } },
  { "Guise of the Unseen Path"                   ,   "tier19oh",      3,  1272,   19,   4,   3,   -1, 221617, { 139707, 139708, 139709, 139710, 139711, 139712, 139713, 139714,  0 } },
  { "Guise of the Unseen Path"                   ,   "tier19oh",      3,  1272,   19,   6,   3,   -1, 221535, { 139707, 139708, 139709, 139710, 139711, 139712, 139713, 139714,  0 } },
  { "Guise of the Unseen Path"                   ,   "tier19oh",      3,  1272,   19,   8,   3,   -1, 221642, { 139707, 139708, 139709, 139710, 139711, 139712, 139713, 139714,  0 } },
  { "Battlegear of the Uncrowned"                ,   "tier19oh",      3,  1277,   19,   2,   4,   -1, 221615, { 139739, 139740, 139741, 139742, 139743, 139744, 139745, 139746,  0 } },
  { "Battlegear of the Uncrowned"                ,   "tier19oh",      3,  1277,   19,   4,   4,   -1, 221617, { 139739, 139740, 139741, 139742, 139743, 139744, 139745, 139746,  0 } },
  { "Battlegear of the Uncrowned"                ,   "tier19oh",      3,  1277,   19,   6,   4,   -1, 221535, { 139739, 139740, 139741, 139742, 139743, 139744, 139745, 139746,  0 } },
  { "Battlegear of the Uncrowned"                ,   "tier19oh",      3,  1277,   19,   8,   4,   -1, 221662, { 139739, 139740, 139741, 139742, 139743, 139744, 139745, 139746,  0 } },
  { "Regalia of the High Priest"                 ,   "tier19oh",      3,  1276,   19,   2,   5,   -1, 221615, { 139759, 139755, 139756, 139757, 139758, 139760, 139761, 139762,  0 } },
  { "Regalia of the High Priest"                 ,   "tier19oh",      3,  1276,   19,   4,   5,   -1, 221617, { 139759, 139755, 139756, 139757, 139758, 139760, 139761, 139762,  0 } },
  { "Regalia of the High Priest"                 ,   "tier19oh",      3,  1276,   19,   6,   5,   -1, 221534, { 139759, 139755, 139756, 139757, 139758, 139760, 139761, 139762,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Regalia of the High Priest"                 ,   "tier19oh",      3,  1276,   19,   8,   5,   -1, 221655, { 139759, 139755, 139756, 139757, 139758, 139760, 139761, 139762,  0 } },
  { "Deathlord's Battleplate"                    ,   "tier19oh",      3,  1269,   19,   2,   6,   -1, 221615, { 139673, 139674, 139675, 139676, 139677, 139678, 139679, 139680,  0 } },
  { "Deathlord's Battleplate"                    ,   "tier19oh",      3,  1269,   19,   4,   6,   -1, 221617, { 139673, 139674, 139675, 139676, 139677, 139678, 139679, 139680,  0 } },
  { "Deathlord's Battleplate"                    ,   "tier19oh",      3,  1269,   19,   6,   6,   -1, 221533, { 139673, 139674, 139675, 139676, 139677, 139678, 139679, 139680,  0 } },
  { "Deathlord's Battleplate"                    ,   "tier19oh",      3,  1269,   19,   8,   6,   -1, 221620, { 139673, 139674, 139675, 139676, 139677, 139678, 139679, 139680,  0 } },
  { "Raiment of the Farseer"                     ,   "tier19oh",      3,  1278,   19,   2,   7,   -1, 221615, { 139698, 139699, 139700, 139701, 139702, 139703, 139704, 139705,  0 } },
  { "Raiment of the Farseer"                     ,   "tier19oh",      3,  1278,   19,   4,   7,   -1, 221617, { 139698, 139699, 139700, 139701, 139702, 139703, 139704, 139705,  0 } },
  { "Raiment of the Farseer"                     ,   "tier19oh",      3,  1278,   19,   6,   7,  262, 221534, { 139698, 139699, 139700, 139701, 139702, 139703, 139704, 139705,  0 } },
  { "Raiment of the Farseer"                     ,   "tier19oh",      3,  1278,   19,   6,   7,  264, 221534, { 139698, 139699, 139700, 139701, 139702, 139703, 139704, 139705,  0 } },
  { "Raiment of the Farseer"                     ,   "tier19oh",      3,  1278,   19,   6,   7,  263, 221535, { 139698, 139699, 139700, 139701, 139702, 139703, 139704, 139705,  0 } },
  { "Raiment of the Farseer"                     ,   "tier19oh",      3,  1278,   19,   8,   7,   -1, 221664, { 139698, 139699, 139700, 139701, 139702, 139703, 139704, 139705,  0 } },
  { "Vesture of Tirisgarde"                      ,   "tier19oh",      3,  1273,   19,   2,   8,   -1, 221615, { 139751, 139747, 139748, 139749, 139750, 139752, 139753, 139754,  0 } },
  { "Vesture of Tirisgarde"                      ,   "tier19oh",      3,  1273,   19,   4,   8,   -1, 221617, { 139751, 139747, 139748, 139749, 139750, 139752, 139753, 139754,  0 } },
  { "Vesture of Tirisgarde"                      ,   "tier19oh",      3,  1273,   19,   6,   8,   -1, 221534, { 139751, 139747, 139748, 139749, 139750, 139752, 139753, 139754,  0 } },
  { "Vesture of Tirisgarde"                      ,   "tier19oh",      3,  1273,   19,   8,   8,   -1, 221646, { 139751, 139747, 139748, 139749, 139750, 139752, 139753, 139754,  0 } },
  { "Vestments of the Black Harvest"             ,   "tier19oh",      3,  1279,   19,   2,   9,   -1, 221615, { 139767, 139763, 139764, 139765, 139766, 139768, 139769, 139770,  0 } },
  { "Vestments of the Black Harvest"             ,   "tier19oh",      3,  1279,   19,   4,   9,   -1, 221617, { 139767, 139763, 139764, 139765, 139766, 139768, 139769, 139770,  0 } },
  { "Vestments of the Black Harvest"             ,   "tier19oh",      3,  1279,   19,   6,   9,   -1, 221534, { 139767, 139763, 139764, 139765, 139766, 139768, 139769, 139770,  0 } },
  { "Vestments of the Black Harvest"             ,   "tier19oh",      3,  1279,   19,   8,   9,   -1, 221667, { 139767, 139763, 139764, 139765, 139766, 139768, 139769, 139770,  0 } },
  { "Grandmaster's Finery"                       ,   "tier19oh",      3,  1274,   19,   2,  10,   -1, 221615, { 139731, 139732, 139733, 139734, 139735, 139736, 139737, 139738,  0 } },
  { "Grandmaster's Finery"                       ,   "tier19oh",      3,  1274,   19,   4,  10,   -1, 221617, { 139731, 139732, 139733, 139734, 139735, 139736, 139737, 139738,  0 } },
  { "Grandmaster's Finery"                       ,   "tier19oh",      3,  1274,   19,   6,  10,  268, 221535, { 139731, 139732, 139733, 139734, 139735, 139736, 139737, 139738,  0 } },
  { "Grandmaster's Finery"                       ,   "tier19oh",      3,  1274,   19,   6,  10,  270, 221534, { 139731, 139732, 139733, 139734, 139735, 139736, 139737, 139738,  0 } },
  { "Grandmaster's Finery"                       ,   "tier19oh",      3,  1274,   19,   6,  10,  269, 221535, { 139731, 139732, 139733, 139734, 139735, 139736, 139737, 139738,  0 } },
  { "Grandmaster's Finery"                       ,   "tier19oh",      3,  1274,   19,   8,  10,   -1, 221651, { 139731, 139732, 139733, 139734, 139735, 139736, 139737, 139738,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Dreamgrove Raiment"                         ,   "tier19oh",      3,  1271,   19,   2,  11,   -1, 221615, { 139723, 139724, 139725, 139726, 139727, 139728, 139729, 139730,  0 } },
  { "Dreamgrove Raiment"                         ,   "tier19oh",      3,  1271,   19,   4,  11,   -1, 221617, { 139723, 139724, 139725, 139726, 139727, 139728, 139729, 139730,  0 } },
  { "Dreamgrove Raiment"                         ,   "tier19oh",      3,  1271,   19,   6,  11,  103, 221535, { 139723, 139724, 139725, 139726, 139727, 139728, 139729, 139730,  0 } },
  { "Dreamgrove Raiment"                         ,   "tier19oh",      3,  1271,   19,   6,  11,  104, 221535, { 139723, 139724, 139725, 139726, 139727, 139728, 139729, 139730,  0 } },
  { "Dreamgrove Raiment"                         ,   "tier19oh",      3,  1271,   19,   6,  11,  105, 221534, { 139723, 139724, 139725, 139726, 139727, 139728, 139729, 139730,  0 } },
  { "Dreamgrove Raiment"                         ,   "tier19oh",      3,  1271,   19,   6,  11,  102, 221534, { 139723, 139724, 139725, 139726, 139727, 139728, 139729, 139730,  0 } },
  { "Dreamgrove Raiment"                         ,   "tier19oh",      3,  1271,   19,   8,  11,  104, 221636, { 139723, 139724, 139725, 139726, 139727, 139728, 139729, 139730,  0 } },
  { "Dreamgrove Raiment"                         ,   "tier19oh",      3,  1271,   19,   8,  11,  105, 221636, { 139723, 139724, 139725, 139726, 139727, 139728, 139729, 139730,  0 } },
  { "Dreamgrove Raiment"                         ,   "tier19oh",      3,  1271,   19,   8,  11,  102, 221636, { 139723, 139724, 139725, 139726, 139727, 139728, 139729, 139730,  0 } },
  { "Dreamgrove Raiment"                         ,   "tier19oh",      3,  1271,   19,   8,  11,  103, 221638, { 139723, 139724, 139725, 139726, 139727, 139728, 139729, 139730,  0 } },
  { "Battlegear of the Shattered Abyss"          ,   "tier19oh",      3,  1270,   19,   2,  12,   -1, 221615, { 139715, 139716, 139717, 139718, 139719, 139720, 139721, 139722,  0 } },
  { "Battlegear of the Shattered Abyss"          ,   "tier19oh",      3,  1270,   19,   4,  12,   -1, 221617, { 139715, 139716, 139717, 139718, 139719, 139720, 139721, 139722,  0 } },
  { "Battlegear of the Shattered Abyss"          ,   "tier19oh",      3,  1270,   19,   6,  12,   -1, 221535, { 139715, 139716, 139717, 139718, 139719, 139720, 139721, 139722,  0 } },
  { "Battlegear of the Shattered Abyss"          ,   "tier19oh",      3,  1270,   19,   8,  12,   -1, 221632, { 139715, 139716, 139717, 139718, 139719, 139720, 139721, 139722,  0 } },
  { "March of the Legion"                        , "march_of_the_legion",      4,  1293,   19,   2,   1,   -1, 228445, { 134529, 134533,  0 } },
  { "March of the Legion"                        , "march_of_the_legion",      4,  1293,   19,   2,   2,   -1, 228445, { 134529, 134533,  0 } },
  { "March of the Legion"                        , "march_of_the_legion",      4,  1293,   19,   2,   3,   -1, 228445, { 134529, 134533,  0 } },
  { "March of the Legion"                        , "march_of_the_legion",      4,  1293,   19,   2,   4,   -1, 228445, { 134529, 134533,  0 } },
  { "March of the Legion"                        , "march_of_the_legion",      4,  1293,   19,   2,   5,   -1, 228445, { 134529, 134533,  0 } },
  { "March of the Legion"                        , "march_of_the_legion",      4,  1293,   19,   2,   6,   -1, 228445, { 134529, 134533,  0 } },
  { "March of the Legion"                        , "march_of_the_legion",      4,  1293,   19,   2,   7,   -1, 228445, { 134529, 134533,  0 } },
  { "March of the Legion"                        , "march_of_the_legion",      4,  1293,   19,   2,   8,   -1, 228445, { 134529, 134533,  0 } },
  { "March of the Legion"                        , "march_of_the_legion",      4,  1293,   19,   2,   9,   -1, 228445, { 134529, 134533,  0 } },
  { "March of the Legion"                        , "march_of_the_legion",      4,  1293,   19,   2,  10,   -1, 228445, { 134529, 134533,  0 } },
  { "March of the Legion"                        , "march_of_the_legion",      4,  1293,   19,   2,  11,   -1, 228445, { 134529, 134533,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "March of the Legion"                        , "march_of_the_legion",      4,  1293,   19,   2,  12,   -1, 228445, { 134529, 134533,  0 } },
  { "Journey Through Time"                       , "journey_through_time",      5,  1294,   19,   2,   1,   -1, 228447, { 137419, 137487,  0 } },
  { "Journey Through Time"                       , "journey_through_time",      5,  1294,   19,   2,   2,   -1, 228447, { 137419, 137487,  0 } },
  { "Journey Through Time"                       , "journey_through_time",      5,  1294,   19,   2,   3,   -1, 228447, { 137419, 137487,  0 } },
  { "Journey Through Time"                       , "journey_through_time",      5,  1294,   19,   2,   4,   -1, 228447, { 137419, 137487,  0 } },
  { "Journey Through Time"                       , "journey_through_time",      5,  1294,   19,   2,   5,   -1, 228447, { 137419, 137487,  0 } },
  { "Journey Through Time"                       , "journey_through_time",      5,  1294,   19,   2,   6,   -1, 228447, { 137419, 137487,  0 } },
  { "Journey Through Time"                       , "journey_through_time",      5,  1294,   19,   2,   7,   -1, 228447, { 137419, 137487,  0 } },
  { "Journey Through Time"                       , "journey_through_time",      5,  1294,   19,   2,   8,   -1, 228447, { 137419, 137487,  0 } },
  { "Journey Through Time"                       , "journey_through_time",      5,  1294,   19,   2,   9,   -1, 228447, { 137419, 137487,  0 } },
  { "Journey Through Time"                       , "journey_through_time",      5,  1294,   19,   2,  10,   -1, 228447, { 137419, 137487,  0 } },
  { "Journey Through Time"                       , "journey_through_time",      5,  1294,   19,   2,  11,   -1, 228447, { 137419, 137487,  0 } },
  { "Journey Through Time"                       , "journey_through_time",      5,  1294,   19,   2,  12,   -1, 228447, { 137419, 137487,  0 } },
  { "Nightwell Arcanum"                          , "tier19p_cloth",      6,  1295,   19,   2,   1,   -1, 224146, { 134432, 134424,  0 } },
  { "Nightwell Arcanum"                          , "tier19p_cloth",      6,  1295,   19,   2,   2,   -1, 224146, { 134432, 134424,  0 } },
  { "Nightwell Arcanum"                          , "tier19p_cloth",      6,  1295,   19,   2,   3,   -1, 224146, { 134432, 134424,  0 } },
  { "Nightwell Arcanum"                          , "tier19p_cloth",      6,  1295,   19,   2,   4,   -1, 224146, { 134432, 134424,  0 } },
  { "Nightwell Arcanum"                          , "tier19p_cloth",      6,  1295,   19,   2,   5,   -1, 224146, { 134432, 134424,  0 } },
  { "Nightwell Arcanum"                          , "tier19p_cloth",      6,  1295,   19,   2,   6,   -1, 224146, { 134432, 134424,  0 } },
  { "Nightwell Arcanum"                          , "tier19p_cloth",      6,  1295,   19,   2,   7,   -1, 224146, { 134432, 134424,  0 } },
  { "Nightwell Arcanum"                          , "tier19p_cloth",      6,  1295,   19,   2,   8,   -1, 224146, { 134432, 134424,  0 } },
  { "Nightwell Arcanum"                          , "tier19p_cloth",      6,  1295,   19,   2,   9,   -1, 224146, { 134432, 134424,  0 } },
  { "Nightwell Arcanum"                          , "tier19p_cloth",      6,  1295,   19,   2,  10,   -1, 224146, { 134432, 134424,  0 } },
  { "Nightwell Arcanum"                          , "tier19p_cloth",      6,  1295,   19,   2,  11,   -1, 224146, { 134432, 134424,  0 } },
  { "Nightwell Arcanum"                          , "tier19p_cloth",      6,  1295,   19,   2,  12,   -1, 224146, { 134432, 134424,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Jacin's Ruse"                               , "tier19p_leather",      7,  1296,   19,   2,   1,   -1, 224148, { 137480, 137397,  0 } },
  { "Jacin's Ruse"                               , "tier19p_leather",      7,  1296,   19,   2,   2,   -1, 224148, { 137480, 137397,  0 } },
  { "Jacin's Ruse"                               , "tier19p_leather",      7,  1296,   19,   2,   3,   -1, 224148, { 137480, 137397,  0 } },
  { "Jacin's Ruse"                               , "tier19p_leather",      7,  1296,   19,   2,   4,   -1, 224148, { 137480, 137397,  0 } },
  { "Jacin's Ruse"                               , "tier19p_leather",      7,  1296,   19,   2,   5,   -1, 224148, { 137480, 137397,  0 } },
  { "Jacin's Ruse"                               , "tier19p_leather",      7,  1296,   19,   2,   6,   -1, 224148, { 137480, 137397,  0 } },
  { "Jacin's Ruse"                               , "tier19p_leather",      7,  1296,   19,   2,   7,   -1, 224148, { 137480, 137397,  0 } },
  { "Jacin's Ruse"                               , "tier19p_leather",      7,  1296,   19,   2,   8,   -1, 224148, { 137480, 137397,  0 } },
  { "Jacin's Ruse"                               , "tier19p_leather",      7,  1296,   19,   2,   9,   -1, 224148, { 137480, 137397,  0 } },
  { "Jacin's Ruse"                               , "tier19p_leather",      7,  1296,   19,   2,  10,   -1, 224148, { 137480, 137397,  0 } },
  { "Jacin's Ruse"                               , "tier19p_leather",      7,  1296,   19,   2,  11,   -1, 224148, { 137480, 137397,  0 } },
  { "Jacin's Ruse"                               , "tier19p_leather",      7,  1296,   19,   2,  12,   -1, 224148, { 137480, 137397,  0 } },
  { "Traitor's Oath"                             , "tier19p_mail",      8,  1297,   19,   2,   1,   -1, 224150, { 134480, 137405,  0 } },
  { "Traitor's Oath"                             , "tier19p_mail",      8,  1297,   19,   2,   2,   -1, 224150, { 134480, 137405,  0 } },
  { "Traitor's Oath"                             , "tier19p_mail",      8,  1297,   19,   2,   3,   -1, 224150, { 134480, 137405,  0 } },
  { "Traitor's Oath"                             , "tier19p_mail",      8,  1297,   19,   2,   4,   -1, 224150, { 134480, 137405,  0 } },
  { "Traitor's Oath"                             , "tier19p_mail",      8,  1297,   19,   2,   5,   -1, 224150, { 134480, 137405,  0 } },
  { "Traitor's Oath"                             , "tier19p_mail",      8,  1297,   19,   2,   6,   -1, 224150, { 134480, 137405,  0 } },
  { "Traitor's Oath"                             , "tier19p_mail",      8,  1297,   19,   2,   7,   -1, 224150, { 134480, 137405,  0 } },
  { "Traitor's Oath"                             , "tier19p_mail",      8,  1297,   19,   2,   8,   -1, 224150, { 134480, 137405,  0 } },
  { "Traitor's Oath"                             , "tier19p_mail",      8,  1297,   19,   2,   9,   -1, 224150, { 134480, 137405,  0 } },
  { "Traitor's Oath"                             , "tier19p_mail",      8,  1297,   19,   2,  10,   -1, 224150, { 134480, 137405,  0 } },
  { "Traitor's Oath"                             , "tier19p_mail",      8,  1297,   19,   2,  11,   -1, 224150, { 134480, 137405,  0 } },
  { "Traitor's Oath"                             , "tier19p_mail",      8,  1297,   19,   2,  12,   -1, 224150, { 134480, 137405,  0 } },
  { "Fortitude of the Nightborne"                , "tier19p_plate",      9,  1298,   19,   2,   1,   -1, 228448, { 134518, 134503,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Fortitude of the Nightborne"                , "tier19p_plate",      9,  1298,   19,   2,   2,   -1, 228448, { 134518, 134503,  0 } },
  { "Fortitude of the Nightborne"                , "tier19p_plate",      9,  1298,   19,   2,   3,   -1, 228448, { 134518, 134503,  0 } },
  { "Fortitude of the Nightborne"                , "tier19p_plate",      9,  1298,   19,   2,   4,   -1, 228448, { 134518, 134503,  0 } },
  { "Fortitude of the Nightborne"                , "tier19p_plate",      9,  1298,   19,   2,   5,   -1, 228448, { 134518, 134503,  0 } },
  { "Fortitude of the Nightborne"                , "tier19p_plate",      9,  1298,   19,   2,   6,   -1, 228448, { 134518, 134503,  0 } },
  { "Fortitude of the Nightborne"                , "tier19p_plate",      9,  1298,   19,   2,   7,   -1, 228448, { 134518, 134503,  0 } },
  { "Fortitude of the Nightborne"                , "tier19p_plate",      9,  1298,   19,   2,   8,   -1, 228448, { 134518, 134503,  0 } },
  { "Fortitude of the Nightborne"                , "tier19p_plate",      9,  1298,   19,   2,   9,   -1, 228448, { 134518, 134503,  0 } },
  { "Fortitude of the Nightborne"                , "tier19p_plate",      9,  1298,   19,   2,  10,   -1, 228448, { 134518, 134503,  0 } },
  { "Fortitude of the Nightborne"                , "tier19p_plate",      9,  1298,   19,   2,  11,   -1, 228448, { 134518, 134503,  0 } },
  { "Fortitude of the Nightborne"                , "tier19p_plate",      9,  1298,   19,   2,  12,   -1, 228448, { 134518, 134503,  0 } },
  { "Blackhand's Battlegear"                     ,     "tier17",     10,  1242,   17,   2,   1,   71, 165345, { 115580, 115581, 115582, 115583, 115584,  0 } },
  { "Blackhand's Battlegear"                     ,     "tier17",     10,  1242,   17,   2,   1,   72, 165337, { 115580, 115581, 115582, 115583, 115584,  0 } },
  { "Blackhand's Battlegear"                     ,     "tier17",     10,  1242,   17,   2,   1,   73, 165338, { 115580, 115581, 115582, 115583, 115584,  0 } },
  { "Blackhand's Battlegear"                     ,     "tier17",     10,  1242,   17,   4,   1,   71, 165336, { 115580, 115581, 115582, 115583, 115584,  0 } },
  { "Blackhand's Battlegear"                     ,     "tier17",     10,  1242,   17,   4,   1,   72, 165349, { 115580, 115581, 115582, 115583, 115584,  0 } },
  { "Blackhand's Battlegear"                     ,     "tier17",     10,  1242,   17,   4,   1,   73, 165351, { 115580, 115581, 115582, 115583, 115584,  0 } },
  { "Battlegear of Guiding Light"                ,     "tier17",     10,  1238,   17,   2,   2,   65, 165438, { 115565, 115566, 115567, 115568, 115569,  0 } },
  { "Battlegear of Guiding Light"                ,     "tier17",     10,  1238,   17,   2,   2,   66, 165446, { 115565, 115566, 115567, 115568, 115569,  0 } },
  { "Battlegear of Guiding Light"                ,     "tier17",     10,  1238,   17,   2,   2,   70, 165440, { 115565, 115566, 115567, 115568, 115569,  0 } },
  { "Battlegear of Guiding Light"                ,     "tier17",     10,  1238,   17,   4,   2,   65, 167697, { 115565, 115566, 115567, 115568, 115569,  0 } },
  { "Battlegear of Guiding Light"                ,     "tier17",     10,  1238,   17,   4,   2,   66, 167740, { 115565, 115566, 115567, 115568, 115569,  0 } },
  { "Battlegear of Guiding Light"                ,     "tier17",     10,  1238,   17,   4,   2,   70, 165439, { 115565, 115566, 115567, 115568, 115569,  0 } },
  { "Rylakstalker's Battlegear"                  ,     "tier17",     10,  1236,   17,   2,   3,  253, 165517, { 115545, 115546, 115547, 115548, 115549,  0 } },
  { "Rylakstalker's Battlegear"                  ,     "tier17",     10,  1236,   17,   2,   3,  254, 165519, { 115545, 115546, 115547, 115548, 115549,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Rylakstalker's Battlegear"                  ,     "tier17",     10,  1236,   17,   2,   3,  255, 165544, { 115545, 115546, 115547, 115548, 115549,  0 } },
  { "Rylakstalker's Battlegear"                  ,     "tier17",     10,  1236,   17,   4,   3,  253, 165518, { 115545, 115546, 115547, 115548, 115549,  0 } },
  { "Rylakstalker's Battlegear"                  ,     "tier17",     10,  1236,   17,   4,   3,  254, 165525, { 115545, 115546, 115547, 115548, 115549,  0 } },
  { "Rylakstalker's Battlegear"                  ,     "tier17",     10,  1236,   17,   4,   3,  255, 165545, { 115545, 115546, 115547, 115548, 115549,  0 } },
  { "Poisoner's Battlegear"                      ,     "tier17",     10,  1240,   17,   2,   4,  259, 165516, { 115570, 115571, 115572, 115573, 115574,  0 } },
  { "Poisoner's Battlegear"                      ,     "tier17",     10,  1240,   17,   2,   4,  260, 165480, { 115570, 115571, 115572, 115573, 115574,  0 } },
  { "Poisoner's Battlegear"                      ,     "tier17",     10,  1240,   17,   2,   4,  261, 165482, { 115570, 115571, 115572, 115573, 115574,  0 } },
  { "Poisoner's Battlegear"                      ,     "tier17",     10,  1240,   17,   4,   4,  259, 166886, { 115570, 115571, 115572, 115573, 115574,  0 } },
  { "Poisoner's Battlegear"                      ,     "tier17",     10,  1240,   17,   4,   4,  260, 165478, { 115570, 115571, 115572, 115573, 115574,  0 } },
  { "Poisoner's Battlegear"                      ,     "tier17",     10,  1240,   17,   4,   4,  261, 165514, { 115570, 115571, 115572, 115573, 115574,  0 } },
  { "Soul Priest's Raiment"                      ,     "tier17",     10,  1239,   17,   2,   5,  256, 165614, { 115560, 115561, 115562, 115563, 115564,  0 } },
  { "Soul Priest's Raiment"                      ,     "tier17",     10,  1239,   17,   2,   5,  257, 165621, { 115560, 115561, 115562, 115563, 115564,  0 } },
  { "Soul Priest's Raiment"                      ,     "tier17",     10,  1239,   17,   2,   5,  258, 165628, { 115560, 115561, 115562, 115563, 115564,  0 } },
  { "Soul Priest's Raiment"                      ,     "tier17",     10,  1239,   17,   4,   5,  256, 167694, { 115560, 115561, 115562, 115563, 115564,  0 } },
  { "Soul Priest's Raiment"                      ,     "tier17",     10,  1239,   17,   4,   5,  257, 167684, { 115560, 115561, 115562, 115563, 115564,  0 } },
  { "Soul Priest's Raiment"                      ,     "tier17",     10,  1239,   17,   4,   5,  258, 165629, { 115560, 115561, 115562, 115563, 115564,  0 } },
  { "Ogreskull Boneplate Battlegear"             ,     "tier17",     10,  1234,   17,   2,   6,  250, 167192, { 115535, 115536, 115537, 115538, 115539,  0 } },
  { "Ogreskull Boneplate Battlegear"             ,     "tier17",     10,  1234,   17,   2,   6,  251, 165547, { 115535, 115536, 115537, 115538, 115539,  0 } },
  { "Ogreskull Boneplate Battlegear"             ,     "tier17",     10,  1234,   17,   2,   6,  252, 165575, { 115535, 115536, 115537, 115538, 115539,  0 } },
  { "Ogreskull Boneplate Battlegear"             ,     "tier17",     10,  1234,   17,   4,   6,  250, 165571, { 115535, 115536, 115537, 115538, 115539,  0 } },
  { "Ogreskull Boneplate Battlegear"             ,     "tier17",     10,  1234,   17,   4,   6,  251, 165568, { 115535, 115536, 115537, 115538, 115539,  0 } },
  { "Ogreskull Boneplate Battlegear"             ,     "tier17",     10,  1234,   17,   4,   6,  252, 165574, { 115535, 115536, 115537, 115538, 115539,  0 } },
  { "Windspeaker's Regalia"                      ,     "tier17",     10,  1241,   17,   2,   7,  262, 165577, { 115575, 115576, 115577, 115578, 115579,  0 } },
  { "Windspeaker's Regalia"                      ,     "tier17",     10,  1241,   17,   2,   7,  263, 165605, { 115575, 115576, 115577, 115578, 115579,  0 } },
  { "Windspeaker's Regalia"                      ,     "tier17",     10,  1241,   17,   2,   7,  264, 165576, { 115575, 115576, 115577, 115578, 115579,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Windspeaker's Regalia"                      ,     "tier17",     10,  1241,   17,   4,   7,  262, 165580, { 115575, 115576, 115577, 115578, 115579,  0 } },
  { "Windspeaker's Regalia"                      ,     "tier17",     10,  1241,   17,   4,   7,  263, 165610, { 115575, 115576, 115577, 115578, 115579,  0 } },
  { "Windspeaker's Regalia"                      ,     "tier17",     10,  1241,   17,   4,   7,  264, 167702, { 115575, 115576, 115577, 115578, 115579,  0 } },
  { "Arcanoshatter Regalia"                      ,     "tier17",     10,  1235,   17,   2,   8,   62, 165475, { 115550, 115551, 115552, 115553, 115554,  0 } },
  { "Arcanoshatter Regalia"                      ,     "tier17",     10,  1235,   17,   2,   8,   63, 165458, { 115550, 115551, 115552, 115553, 115554,  0 } },
  { "Arcanoshatter Regalia"                      ,     "tier17",     10,  1235,   17,   2,   8,   64, 165469, { 115550, 115551, 115552, 115553, 115554,  0 } },
  { "Arcanoshatter Regalia"                      ,     "tier17",     10,  1235,   17,   4,   8,   62, 165476, { 115550, 115551, 115552, 115553, 115554,  0 } },
  { "Arcanoshatter Regalia"                      ,     "tier17",     10,  1235,   17,   4,   8,   63, 165459, { 115550, 115551, 115552, 115553, 115554,  0 } },
  { "Arcanoshatter Regalia"                      ,     "tier17",     10,  1235,   17,   4,   8,   64, 165470, { 115550, 115551, 115552, 115553, 115554,  0 } },
  { "Shadow Council's Garb"                      ,     "tier17",     10,  1243,   17,   2,   9,  265, 165448, { 115585, 115586, 115587, 115588, 115589,  0 } },
  { "Shadow Council's Garb"                      ,     "tier17",     10,  1243,   17,   2,   9,  266, 165450, { 115585, 115586, 115587, 115588, 115589,  0 } },
  { "Shadow Council's Garb"                      ,     "tier17",     10,  1243,   17,   2,   9,  267, 165455, { 115585, 115586, 115587, 115588, 115589,  0 } },
  { "Shadow Council's Garb"                      ,     "tier17",     10,  1243,   17,   4,   9,  265, 165449, { 115585, 115586, 115587, 115588, 115589,  0 } },
  { "Shadow Council's Garb"                      ,     "tier17",     10,  1243,   17,   4,   9,  266, 165451, { 115585, 115586, 115587, 115588, 115589,  0 } },
  { "Shadow Council's Garb"                      ,     "tier17",     10,  1243,   17,   4,   9,  267, 165452, { 115585, 115586, 115587, 115588, 115589,  0 } },
  { "Battlegear of the Somber Gaze"              ,     "tier17",     10,  1237,   17,   2,  10,  268, 165353, { 115555, 115556, 115557, 115558, 115559,  0 } },
  { "Battlegear of the Somber Gaze"              ,     "tier17",     10,  1237,   17,   2,  10,  270, 165404, { 115555, 115556, 115557, 115558, 115559,  0 } },
  { "Battlegear of the Somber Gaze"              ,     "tier17",     10,  1237,   17,   2,  10,  269, 165403, { 115555, 115556, 115557, 115558, 115559,  0 } },
  { "Battlegear of the Somber Gaze"              ,     "tier17",     10,  1237,   17,   4,  10,  268, 165352, { 115555, 115556, 115557, 115558, 115559,  0 } },
  { "Battlegear of the Somber Gaze"              ,     "tier17",     10,  1237,   17,   4,  10,  270, 167718, { 115555, 115556, 115557, 115558, 115559,  0 } },
  { "Battlegear of the Somber Gaze"              ,     "tier17",     10,  1237,   17,   4,  10,  269, 165402, { 115555, 115556, 115557, 115558, 115559,  0 } },
  { "Living Wood Battlegear"                     ,     "tier17",     10,  1233,   17,   2,  11,  103, 165431, { 115540, 115541, 115542, 115543, 115544,  0 } },
  { "Living Wood Battlegear"                     ,     "tier17",     10,  1233,   17,   2,  11,  102, 165433, { 115540, 115541, 115542, 115543, 115544,  0 } },
  { "Living Wood Battlegear"                     ,     "tier17",     10,  1233,   17,   2,  11,  104, 165410, { 115540, 115541, 115542, 115543, 115544,  0 } },
  { "Living Wood Battlegear"                     ,     "tier17",     10,  1233,   17,   2,  11,  105, 165437, { 115540, 115541, 115542, 115543, 115544,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Living Wood Battlegear"                     ,     "tier17",     10,  1233,   17,   4,  11,  103, 165432, { 115540, 115541, 115542, 115543, 115544,  0 } },
  { "Living Wood Battlegear"                     ,     "tier17",     10,  1233,   17,   4,  11,  102, 166677, { 115540, 115541, 115542, 115543, 115544,  0 } },
  { "Living Wood Battlegear"                     ,     "tier17",     10,  1233,   17,   4,  11,  104, 165423, { 115540, 115541, 115542, 115543, 115544,  0 } },
  { "Living Wood Battlegear"                     ,     "tier17",     10,  1233,   17,   4,  11,  105, 167714, { 115540, 115541, 115542, 115543, 115544,  0 } },
  { "Battlegear of Iron Wrath"                   ,     "tier18",     11,  1258,   18,   2,   1,   71, 185800, { 124319, 124329, 124334, 124340, 124346,  0 } },
  { "Battlegear of Iron Wrath"                   ,     "tier18",     11,  1258,   18,   2,   1,   72, 185798, { 124319, 124329, 124334, 124340, 124346,  0 } },
  { "Battlegear of Iron Wrath"                   ,     "tier18",     11,  1258,   18,   2,   1,   73, 185796, { 124319, 124329, 124334, 124340, 124346,  0 } },
  { "Battlegear of Iron Wrath"                   ,     "tier18",     11,  1258,   18,   4,   1,   71, 185804, { 124319, 124329, 124334, 124340, 124346,  0 } },
  { "Battlegear of Iron Wrath"                   ,     "tier18",     11,  1258,   18,   4,   1,   72, 185799, { 124319, 124329, 124334, 124340, 124346,  0 } },
  { "Battlegear of Iron Wrath"                   ,     "tier18",     11,  1258,   18,   4,   1,   73, 185797, { 124319, 124329, 124334, 124340, 124346,  0 } },
  { "Watch of the Ceaseless Vigil"               ,     "tier18",     11,  1254,   18,   2,   2,   65, 185545, { 124318, 124328, 124333, 124339, 124345,  0 } },
  { "Watch of the Ceaseless Vigil"               ,     "tier18",     11,  1254,   18,   2,   2,   66, 185675, { 124318, 124328, 124333, 124339, 124345,  0 } },
  { "Watch of the Ceaseless Vigil"               ,     "tier18",     11,  1254,   18,   2,   2,   70,  67188, { 124318, 124328, 124333, 124339, 124345,  0 } },
  { "Watch of the Ceaseless Vigil"               ,     "tier18",     11,  1254,   18,   4,   2,   65, 185571, { 124318, 124328, 124333, 124339, 124345,  0 } },
  { "Watch of the Ceaseless Vigil"               ,     "tier18",     11,  1254,   18,   4,   2,   66, 185677, { 124318, 124328, 124333, 124339, 124345,  0 } },
  { "Watch of the Ceaseless Vigil"               ,     "tier18",     11,  1254,   18,   4,   2,   70, 185648, { 124318, 124328, 124333, 124339, 124345,  0 } },
  { "Battlegear of the Savage Hunt"              ,     "tier18",     11,  1253,   18,   2,   3,  253, 188200, { 124284, 124292, 124296, 124301, 124307,  0 } },
  { "Battlegear of the Savage Hunt"              ,     "tier18",     11,  1253,   18,   2,   3,  254, 188190, { 124284, 124292, 124296, 124301, 124307,  0 } },
  { "Battlegear of the Savage Hunt"              ,     "tier18",     11,  1253,   18,   2,   3,  255, 188198, { 124284, 124292, 124296, 124301, 124307,  0 } },
  { "Battlegear of the Savage Hunt"              ,     "tier18",     11,  1253,   18,   4,   3,  253, 188201, { 124284, 124292, 124296, 124301, 124307,  0 } },
  { "Battlegear of the Savage Hunt"              ,     "tier18",     11,  1253,   18,   4,   3,  254, 188191, { 124284, 124292, 124296, 124301, 124307,  0 } },
  { "Battlegear of the Savage Hunt"              ,     "tier18",     11,  1253,   18,   4,   3,  255, 188199, { 124284, 124292, 124296, 124301, 124307,  0 } },
  { "Felblade Armor"                             ,     "tier18",     11,  1256,   18,   2,   4,  259, 186182, { 124248, 124257, 124263, 124269, 124274,  0 } },
  { "Felblade Armor"                             ,     "tier18",     11,  1256,   18,   2,   4,  260, 186285, { 124248, 124257, 124263, 124269, 124274,  0 } },
  { "Felblade Armor"                             ,     "tier18",     11,  1256,   18,   2,   4,  261, 186278, { 124248, 124257, 124263, 124269, 124274,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Felblade Armor"                             ,     "tier18",     11,  1256,   18,   4,   4,  259, 186277, { 124248, 124257, 124263, 124269, 124274,  0 } },
  { "Felblade Armor"                             ,     "tier18",     11,  1256,   18,   4,   4,  260, 186288, { 124248, 124257, 124263, 124269, 124274,  0 } },
  { "Felblade Armor"                             ,     "tier18",     11,  1256,   18,   4,   4,  261, 186279, { 124248, 124257, 124263, 124269, 124274,  0 } },
  { "Attire of Piety"                            ,     "tier18",     11,  1255,   18,   2,   5,  256, 186477, { 124155, 124161, 124166, 124172, 124178,  0 } },
  { "Attire of Piety"                            ,     "tier18",     11,  1255,   18,   2,   5,  257, 186298, { 124155, 124161, 124166, 124172, 124178,  0 } },
  { "Attire of Piety"                            ,     "tier18",     11,  1255,   18,   2,   5,  258, 186980, { 124155, 124161, 124166, 124172, 124178,  0 } },
  { "Attire of Piety"                            ,     "tier18",     11,  1255,   18,   4,   5,  256, 186492, { 124155, 124161, 124166, 124172, 124178,  0 } },
  { "Attire of Piety"                            ,     "tier18",     11,  1255,   18,   4,   5,  257, 186378, { 124155, 124161, 124166, 124172, 124178,  0 } },
  { "Attire of Piety"                            ,     "tier18",     11,  1255,   18,   4,   5,  258, 186981, { 124155, 124161, 124166, 124172, 124178,  0 } },
  { "Demongaze Armor"                            ,     "tier18",     11,  1249,   18,   2,   6,  250, 187872, { 124317, 124327, 124332, 124338, 124344,  0 } },
  { "Demongaze Armor"                            ,     "tier18",     11,  1249,   18,   2,   6,  251, 187868, { 124317, 124327, 124332, 124338, 124344,  0 } },
  { "Demongaze Armor"                            ,     "tier18",     11,  1249,   18,   2,   6,  252, 187865, { 124317, 124327, 124332, 124338, 124344,  0 } },
  { "Demongaze Armor"                            ,     "tier18",     11,  1249,   18,   4,   6,  250, 187873, { 124317, 124327, 124332, 124338, 124344,  0 } },
  { "Demongaze Armor"                            ,     "tier18",     11,  1249,   18,   4,   6,  251, 187870, { 124317, 124327, 124332, 124338, 124344,  0 } },
  { "Demongaze Armor"                            ,     "tier18",     11,  1249,   18,   4,   6,  252, 187866, { 124317, 124327, 124332, 124338, 124344,  0 } },
  { "Embrace of the Living Mountain"             ,     "tier18",     11,  1257,   18,   2,   7,  262, 185880, { 124293, 124297, 124302, 124303, 124308,  0 } },
  { "Embrace of the Living Mountain"             ,     "tier18",     11,  1257,   18,   2,   7,  263, 185871, { 124293, 124297, 124302, 124303, 124308,  0 } },
  { "Embrace of the Living Mountain"             ,     "tier18",     11,  1257,   18,   2,   7,  264, 185873, { 124293, 124297, 124302, 124303, 124308,  0 } },
  { "Embrace of the Living Mountain"             ,     "tier18",     11,  1257,   18,   4,   7,  262, 185881, { 124293, 124297, 124302, 124303, 124308,  0 } },
  { "Embrace of the Living Mountain"             ,     "tier18",     11,  1257,   18,   4,   7,  263, 185872, { 124293, 124297, 124302, 124303, 124308,  0 } },
  { "Embrace of the Living Mountain"             ,     "tier18",     11,  1257,   18,   4,   7,  264, 185874, { 124293, 124297, 124302, 124303, 124308,  0 } },
  { "Raiment of the Arcanic Conclave"            ,     "tier18",     11,  1251,   18,   2,   8,   62, 186166, { 124154, 124160, 124165, 124171, 124177,  0 } },
  { "Raiment of the Arcanic Conclave"            ,     "tier18",     11,  1251,   18,   2,   8,   63, 186167, { 124154, 124160, 124165, 124171, 124177,  0 } },
  { "Raiment of the Arcanic Conclave"            ,     "tier18",     11,  1251,   18,   2,   8,   64, 185969, { 124154, 124160, 124165, 124171, 124177,  0 } },
  { "Raiment of the Arcanic Conclave"            ,     "tier18",     11,  1251,   18,   4,   8,   62, 186165, { 124154, 124160, 124165, 124171, 124177,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Raiment of the Arcanic Conclave"            ,     "tier18",     11,  1251,   18,   4,   8,   63, 186168, { 124154, 124160, 124165, 124171, 124177,  0 } },
  { "Raiment of the Arcanic Conclave"            ,     "tier18",     11,  1251,   18,   4,   8,   64, 185971, { 124154, 124160, 124165, 124171, 124177,  0 } },
  { "Deathrattle Regalia"                        ,     "tier18",     11,  1259,   18,   2,   9,  265, 185882, { 124156, 124162, 124167, 124173, 124179,  0 } },
  { "Deathrattle Regalia"                        ,     "tier18",     11,  1259,   18,   2,   9,  266, 185884, { 124156, 124162, 124167, 124173, 124179,  0 } },
  { "Deathrattle Regalia"                        ,     "tier18",     11,  1259,   18,   2,   9,  267, 185965, { 124156, 124162, 124167, 124173, 124179,  0 } },
  { "Deathrattle Regalia"                        ,     "tier18",     11,  1259,   18,   4,   9,  265, 185883, { 124156, 124162, 124167, 124173, 124179,  0 } },
  { "Deathrattle Regalia"                        ,     "tier18",     11,  1259,   18,   4,   9,  266, 185964, { 124156, 124162, 124167, 124173, 124179,  0 } },
  { "Deathrattle Regalia"                        ,     "tier18",     11,  1259,   18,   4,   9,  267, 185967, { 124156, 124162, 124167, 124173, 124179,  0 } },
  { "Battlewrap of the Hurricane's Eye"          ,     "tier18",     11,  1252,   18,   2,  10,  268, 185398, { 124247, 124256, 124262, 124268, 124273,  0 } },
  { "Battlewrap of the Hurricane's Eye"          ,     "tier18",     11,  1252,   18,   2,  10,  270, 185126, { 124247, 124256, 124262, 124268, 124273,  0 } },
  { "Battlewrap of the Hurricane's Eye"          ,     "tier18",     11,  1252,   18,   2,  10,  269, 185542, { 124247, 124256, 124262, 124268, 124273,  0 } },
  { "Battlewrap of the Hurricane's Eye"          ,     "tier18",     11,  1252,   18,   4,  10,  268, 185399, { 124247, 124256, 124262, 124268, 124273,  0 } },
  { "Battlewrap of the Hurricane's Eye"          ,     "tier18",     11,  1252,   18,   4,  10,  270, 185258, { 124247, 124256, 124262, 124268, 124273,  0 } },
  { "Battlewrap of the Hurricane's Eye"          ,     "tier18",     11,  1252,   18,   4,  10,  269, 185543, { 124247, 124256, 124262, 124268, 124273,  0 } },
  { "Oathclaw Wargarb"                           ,     "tier18",     11,  1250,   18,   2,  11,  103, 185805, { 124246, 124255, 124261, 124267, 124272,  0 } },
  { "Oathclaw Wargarb"                           ,     "tier18",     11,  1250,   18,   2,  11,  104, 185813, { 124246, 124255, 124261, 124267, 124272,  0 } },
  { "Oathclaw Wargarb"                           ,     "tier18",     11,  1250,   18,   2,  11,  105, 185294, { 124246, 124255, 124261, 124267, 124272,  0 } },
  { "Oathclaw Wargarb"                           ,     "tier18",     11,  1250,   18,   2,  11,  102, 187875, { 124246, 124255, 124261, 124267, 124272,  0 } },
  { "Oathclaw Wargarb"                           ,     "tier18",     11,  1250,   18,   4,  11,  103, 185811, { 124246, 124255, 124261, 124267, 124272,  0 } },
  { "Oathclaw Wargarb"                           ,     "tier18",     11,  1250,   18,   4,  11,  104, 185814, { 124246, 124255, 124261, 124267, 124272,  0 } },
  { "Oathclaw Wargarb"                           ,     "tier18",     11,  1250,   18,   4,  11,  105, 185397, { 124246, 124255, 124261, 124267, 124272,  0 } },
  { "Oathclaw Wargarb"                           ,     "tier18",     11,  1250,   18,   4,  11,  102, 187877, { 124246, 124255, 124261, 124267, 124272,  0 } },
  { "Warplate of the Obsidian Aspect"            ,     "tier19",     12,  1292,   19,   2,   1,   71, 212156, { 138351, 138354, 138357, 138360, 138363, 138374,  0 } },
  { "Warplate of the Obsidian Aspect"            ,     "tier19",     12,  1292,   19,   2,   1,   72, 212157, { 138351, 138354, 138357, 138360, 138363, 138374,  0 } },
  { "Warplate of the Obsidian Aspect"            ,     "tier19",     12,  1292,   19,   2,   1,   73, 212237, { 138351, 138354, 138357, 138360, 138363, 138374,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Warplate of the Obsidian Aspect"            ,     "tier19",     12,  1292,   19,   4,   1,   71, 212149, { 138351, 138354, 138357, 138360, 138363, 138374,  0 } },
  { "Warplate of the Obsidian Aspect"            ,     "tier19",     12,  1292,   19,   4,   1,   72, 212158, { 138351, 138354, 138357, 138360, 138363, 138374,  0 } },
  { "Warplate of the Obsidian Aspect"            ,     "tier19",     12,  1292,   19,   4,   1,   73, 212244, { 138351, 138354, 138357, 138360, 138363, 138374,  0 } },
  { "Battleplate of the Highlord"                ,     "tier19",     12,  1287,   19,   2,   2,   65, 211436, { 138350, 138353, 138356, 138359, 138362, 138369,  0 } },
  { "Battleplate of the Highlord"                ,     "tier19",     12,  1287,   19,   2,   2,   70, 211444, { 138350, 138353, 138356, 138359, 138362, 138369,  0 } },
  { "Battleplate of the Highlord"                ,     "tier19",     12,  1287,   19,   2,   2,   66, 211553, { 138350, 138353, 138356, 138359, 138362, 138369,  0 } },
  { "Battleplate of the Highlord"                ,     "tier19",     12,  1287,   19,   4,   2,   65, 211438, { 138350, 138353, 138356, 138359, 138362, 138369,  0 } },
  { "Battleplate of the Highlord"                ,     "tier19",     12,  1287,   19,   4,   2,   70, 211448, { 138350, 138353, 138356, 138359, 138362, 138369,  0 } },
  { "Battleplate of the Highlord"                ,     "tier19",     12,  1287,   19,   4,   2,   66, 211554, { 138350, 138353, 138356, 138359, 138362, 138369,  0 } },
  { "Eagletalon Battlegear"                      ,     "tier19",     12,  1284,   19,   2,   3,  253, 211181, { 138339, 138340, 138342, 138344, 138347, 138368,  0 } },
  { "Eagletalon Battlegear"                      ,     "tier19",     12,  1284,   19,   2,   3,  254, 211331, { 138339, 138340, 138342, 138344, 138347, 138368,  0 } },
  { "Eagletalon Battlegear"                      ,     "tier19",     12,  1284,   19,   2,   3,  255, 211340, { 138339, 138340, 138342, 138344, 138347, 138368,  0 } },
  { "Eagletalon Battlegear"                      ,     "tier19",     12,  1284,   19,   4,   3,  253, 211172, { 138339, 138340, 138342, 138344, 138347, 138368,  0 } },
  { "Eagletalon Battlegear"                      ,     "tier19",     12,  1284,   19,   4,   3,  254, 211322, { 138339, 138340, 138342, 138344, 138347, 138368,  0 } },
  { "Eagletalon Battlegear"                      ,     "tier19",     12,  1284,   19,   4,   3,  255, 211357, { 138339, 138340, 138342, 138344, 138347, 138368,  0 } },
  { "Doomblade Battlegear"                       ,     "tier19",     12,  1289,   19,   2,   4,  261, 211661, { 138326, 138329, 138332, 138335, 138338, 138371,  0 } },
  { "Doomblade Battlegear"                       ,     "tier19",     12,  1289,   19,   2,   4,  260, 211667, { 138326, 138329, 138332, 138335, 138338, 138371,  0 } },
  { "Doomblade Battlegear"                       ,     "tier19",     12,  1289,   19,   2,   4,  259, 211671, { 138326, 138329, 138332, 138335, 138338, 138371,  0 } },
  { "Doomblade Battlegear"                       ,     "tier19",     12,  1289,   19,   4,   4,  261, 211663, { 138326, 138329, 138332, 138335, 138338, 138371,  0 } },
  { "Doomblade Battlegear"                       ,     "tier19",     12,  1289,   19,   4,   4,  260, 211668, { 138326, 138329, 138332, 138335, 138338, 138371,  0 } },
  { "Doomblade Battlegear"                       ,     "tier19",     12,  1289,   19,   4,   4,  259, 211673, { 138326, 138329, 138332, 138335, 138338, 138371,  0 } },
  { "Vestments of the Purifier"                  ,     "tier19",     12,  1288,   19,   2,   5,  256, 211556, { 138310, 138313, 138316, 138319, 138322, 138370,  0 } },
  { "Vestments of the Purifier"                  ,     "tier19",     12,  1288,   19,   2,   5,  257, 211638, { 138310, 138313, 138316, 138319, 138322, 138370,  0 } },
  { "Vestments of the Purifier"                  ,     "tier19",     12,  1288,   19,   2,   5,  258, 211646, { 138310, 138313, 138316, 138319, 138322, 138370,  0 } },
  { "Vestments of the Purifier"                  ,     "tier19",     12,  1288,   19,   4,   5,  256, 211563, { 138310, 138313, 138316, 138319, 138322, 138370,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Vestments of the Purifier"                  ,     "tier19",     12,  1288,   19,   4,   5,  257, 211640, { 138310, 138313, 138316, 138319, 138322, 138370,  0 } },
  { "Vestments of the Purifier"                  ,     "tier19",     12,  1288,   19,   4,   5,  258, 211654, { 138310, 138313, 138316, 138319, 138322, 138370,  0 } },
  { "Dreadwyrm Battleplate"                      ,     "tier19",     12,  1281,   19,   2,   6,  250, 211039, { 138349, 138352, 138355, 138358, 138361, 138364,  0 } },
  { "Dreadwyrm Battleplate"                      ,     "tier19",     12,  1281,   19,   2,   6,  251, 211042, { 138349, 138352, 138355, 138358, 138361, 138364,  0 } },
  { "Dreadwyrm Battleplate"                      ,     "tier19",     12,  1281,   19,   2,   6,  252, 211047, { 138349, 138352, 138355, 138358, 138361, 138364,  0 } },
  { "Dreadwyrm Battleplate"                      ,     "tier19",     12,  1281,   19,   4,   6,  250, 211041, { 138349, 138352, 138355, 138358, 138361, 138364,  0 } },
  { "Dreadwyrm Battleplate"                      ,     "tier19",     12,  1281,   19,   4,   6,  251, 211045, { 138349, 138352, 138355, 138358, 138361, 138364,  0 } },
  { "Dreadwyrm Battleplate"                      ,     "tier19",     12,  1281,   19,   4,   6,  252, 211050, { 138349, 138352, 138355, 138358, 138361, 138364,  0 } },
  { "Regalia of Shackled Elements"               ,     "tier19",     12,  1290,   19,   2,   7,  262, 211951, { 138341, 138343, 138345, 138346, 138348, 138372,  0 } },
  { "Regalia of Shackled Elements"               ,     "tier19",     12,  1290,   19,   2,   7,  263, 211987, { 138341, 138343, 138345, 138346, 138348, 138372,  0 } },
  { "Regalia of Shackled Elements"               ,     "tier19",     12,  1290,   19,   2,   7,  264, 211992, { 138341, 138343, 138345, 138346, 138348, 138372,  0 } },
  { "Regalia of Shackled Elements"               ,     "tier19",     12,  1290,   19,   4,   7,  262, 211963, { 138341, 138343, 138345, 138346, 138348, 138372,  0 } },
  { "Regalia of Shackled Elements"               ,     "tier19",     12,  1290,   19,   4,   7,  263, 211988, { 138341, 138343, 138345, 138346, 138348, 138372,  0 } },
  { "Regalia of Shackled Elements"               ,     "tier19",     12,  1290,   19,   4,   7,  264, 211993, { 138341, 138343, 138345, 138346, 138348, 138372,  0 } },
  { "Regalia of Everburning Knowledge"           ,     "tier19",     12,  1285,   19,   2,   8,   62, 211379, { 138309, 138312, 138315, 138318, 138321, 138365,  0 } },
  { "Regalia of Everburning Knowledge"           ,     "tier19",     12,  1285,   19,   2,   8,   63, 211394, { 138309, 138312, 138315, 138318, 138321, 138365,  0 } },
  { "Regalia of Everburning Knowledge"           ,     "tier19",     12,  1285,   19,   2,   8,   64, 211411, { 138309, 138312, 138315, 138318, 138321, 138365,  0 } },
  { "Regalia of Everburning Knowledge"           ,     "tier19",     12,  1285,   19,   4,   8,   62, 211386, { 138309, 138312, 138315, 138318, 138321, 138365,  0 } },
  { "Regalia of Everburning Knowledge"           ,     "tier19",     12,  1285,   19,   4,   8,   63, 211395, { 138309, 138312, 138315, 138318, 138321, 138365,  0 } },
  { "Regalia of Everburning Knowledge"           ,     "tier19",     12,  1285,   19,   4,   8,   64, 211404, { 138309, 138312, 138315, 138318, 138321, 138365,  0 } },
  { "Legacy of Azj'Aqir"                         ,     "tier19",     12,  1291,   19,   2,   9,  265, 212002, { 138311, 138314, 138317, 138320, 138323, 138373,  0 } },
  { "Legacy of Azj'Aqir"                         ,     "tier19",     12,  1291,   19,   2,   9,  266, 212005, { 138311, 138314, 138317, 138320, 138323, 138373,  0 } },
  { "Legacy of Azj'Aqir"                         ,     "tier19",     12,  1291,   19,   2,   9,  267, 212018, { 138311, 138314, 138317, 138320, 138323, 138373,  0 } },
  { "Legacy of Azj'Aqir"                         ,     "tier19",     12,  1291,   19,   4,   9,  265, 212003, { 138311, 138314, 138317, 138320, 138323, 138373,  0 } },
  { "Legacy of Azj'Aqir"                         ,     "tier19",     12,  1291,   19,   4,   9,  266, 212007, { 138311, 138314, 138317, 138320, 138323, 138373,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Legacy of Azj'Aqir"                         ,     "tier19",     12,  1291,   19,   4,   9,  267, 212017, { 138311, 138314, 138317, 138320, 138323, 138373,  0 } },
  { "Vestments of Enveloped Dissonance"          ,     "tier19",     12,  1286,   19,   2,  10,  268, 211415, { 138325, 138328, 138331, 138334, 138337, 138367,  0 } },
  { "Vestments of Enveloped Dissonance"          ,     "tier19",     12,  1286,   19,   2,  10,  270, 211418, { 138325, 138328, 138331, 138334, 138337, 138367,  0 } },
  { "Vestments of Enveloped Dissonance"          ,     "tier19",     12,  1286,   19,   2,  10,  269, 211427, { 138325, 138328, 138331, 138334, 138337, 138367,  0 } },
  { "Vestments of Enveloped Dissonance"          ,     "tier19",     12,  1286,   19,   4,  10,  268, 211417, { 138325, 138328, 138331, 138334, 138337, 138367,  0 } },
  { "Vestments of Enveloped Dissonance"          ,     "tier19",     12,  1286,   19,   4,  10,  270, 211423, { 138325, 138328, 138331, 138334, 138337, 138367,  0 } },
  { "Vestments of Enveloped Dissonance"          ,     "tier19",     12,  1286,   19,   4,  10,  269, 211430, { 138325, 138328, 138331, 138334, 138337, 138367,  0 } },
  { "Garb of the Astral Warden"                  ,     "tier19",     12,  1283,   19,   2,  11,  102, 211092, { 138324, 138327, 138330, 138333, 138336, 138366,  0 } },
  { "Garb of the Astral Warden"                  ,     "tier19",     12,  1283,   19,   2,  11,  103, 211140, { 138324, 138327, 138330, 138333, 138336, 138366,  0 } },
  { "Garb of the Astral Warden"                  ,     "tier19",     12,  1283,   19,   2,  11,  104, 211149, { 138324, 138327, 138330, 138333, 138336, 138366,  0 } },
  { "Garb of the Astral Warden"                  ,     "tier19",     12,  1283,   19,   2,  11,  105, 211165, { 138324, 138327, 138330, 138333, 138336, 138366,  0 } },
  { "Garb of the Astral Warden"                  ,     "tier19",     12,  1283,   19,   4,  11,  102, 211104, { 138324, 138327, 138330, 138333, 138336, 138366,  0 } },
  { "Garb of the Astral Warden"                  ,     "tier19",     12,  1283,   19,   4,  11,  103, 211142, { 138324, 138327, 138330, 138333, 138336, 138366,  0 } },
  { "Garb of the Astral Warden"                  ,     "tier19",     12,  1283,   19,   4,  11,  104, 211150, { 138324, 138327, 138330, 138333, 138336, 138366,  0 } },
  { "Garb of the Astral Warden"                  ,     "tier19",     12,  1283,   19,   4,  11,  105, 211170, { 138324, 138327, 138330, 138333, 138336, 138366,  0 } },
  { "Vestment of Second Sight"                   ,     "tier19",     12,  1282,   19,   2,  12,  577, 211054, { 138375, 138376, 138377, 138378, 138379, 138380,  0 } },
  { "Vestment of Second Sight"                   ,     "tier19",     12,  1282,   19,   2,  12,  581, 211075, { 138375, 138376, 138377, 138378, 138379, 138380,  0 } },
  { "Vestment of Second Sight"                   ,     "tier19",     12,  1282,   19,   4,  12,  577, 211074, { 138375, 138376, 138377, 138378, 138379, 138380,  0 } },
  { "Vestment of Second Sight"                   ,     "tier19",     12,  1282,   19,   4,  12,  581, 211077, { 138375, 138376, 138377, 138378, 138379, 138380,  0 } },
  { "Titanic Onslaught Armor"                    ,     "tier20",     13,  1312,   20,   2,   1,   71, 242298, { 147187, 147188, 147189, 147190, 147191, 147192,  0 } },
  { "Titanic Onslaught Armor"                    ,     "tier20",     13,  1312,   20,   2,   1,   72, 242299, { 147187, 147188, 147189, 147190, 147191, 147192,  0 } },
  { "Titanic Onslaught Armor"                    ,     "tier20",     13,  1312,   20,   2,   1,   73, 242302, { 147187, 147188, 147189, 147190, 147191, 147192,  0 } },
  { "Titanic Onslaught Armor"                    ,     "tier20",     13,  1312,   20,   4,   1,   71, 242297, { 147187, 147188, 147189, 147190, 147191, 147192,  0 } },
  { "Titanic Onslaught Armor"                    ,     "tier20",     13,  1312,   20,   4,   1,   72, 242301, { 147187, 147188, 147189, 147190, 147191, 147192,  0 } },
  { "Titanic Onslaught Armor"                    ,     "tier20",     13,  1312,   20,   4,   1,   73, 242373, { 147187, 147188, 147189, 147190, 147191, 147192,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Radiant Lightbringer Armor"                 ,     "tier20",     13,  1307,   20,   2,   2,   65, 242261, { 147157, 147158, 147159, 147160, 147161, 147162,  0 } },
  { "Radiant Lightbringer Armor"                 ,     "tier20",     13,  1307,   20,   2,   2,   66, 242263, { 147157, 147158, 147159, 147160, 147161, 147162,  0 } },
  { "Radiant Lightbringer Armor"                 ,     "tier20",     13,  1307,   20,   2,   2,   70, 242267, { 147157, 147158, 147159, 147160, 147161, 147162,  0 } },
  { "Radiant Lightbringer Armor"                 ,     "tier20",     13,  1307,   20,   4,   2,   65, 242262, { 147157, 147158, 147159, 147160, 147161, 147162,  0 } },
  { "Radiant Lightbringer Armor"                 ,     "tier20",     13,  1307,   20,   4,   2,   66, 242264, { 147157, 147158, 147159, 147160, 147161, 147162,  0 } },
  { "Radiant Lightbringer Armor"                 ,     "tier20",     13,  1307,   20,   4,   2,   70, 242266, { 147157, 147158, 147159, 147160, 147161, 147162,  0 } },
  { "Wildstalker Armor"                          ,     "tier20",     13,  1304,   20,   2,   3,  253, 242239, { 147139, 147140, 147141, 147142, 147143, 147144,  0 } },
  { "Wildstalker Armor"                          ,     "tier20",     13,  1304,   20,   2,   3,  254, 242242, { 147139, 147140, 147141, 147142, 147143, 147144,  0 } },
  { "Wildstalker Armor"                          ,     "tier20",     13,  1304,   20,   2,   3,  255, 242244, { 147139, 147140, 147141, 147142, 147143, 147144,  0 } },
  { "Wildstalker Armor"                          ,     "tier20",     13,  1304,   20,   4,   3,  253, 242240, { 147139, 147140, 147141, 147142, 147143, 147144,  0 } },
  { "Wildstalker Armor"                          ,     "tier20",     13,  1304,   20,   4,   3,  254, 242241, { 147139, 147140, 147141, 147142, 147143, 147144,  0 } },
  { "Wildstalker Armor"                          ,     "tier20",     13,  1304,   20,   4,   3,  255, 242245, { 147139, 147140, 147141, 147142, 147143, 147144,  0 } },
  { "Fanged Slayer's Armor"                      ,     "tier20",     13,  1309,   20,   2,   4,  259, 242274, { 147169, 147170, 147171, 147172, 147173, 147174,  0 } },
  { "Fanged Slayer's Armor"                      ,     "tier20",     13,  1309,   20,   2,   4,  260, 242276, { 147169, 147170, 147171, 147172, 147173, 147174,  0 } },
  { "Fanged Slayer's Armor"                      ,     "tier20",     13,  1309,   20,   2,   4,  261, 242280, { 147169, 147170, 147171, 147172, 147173, 147174,  0 } },
  { "Fanged Slayer's Armor"                      ,     "tier20",     13,  1309,   20,   4,   4,  259, 242275, { 147169, 147170, 147171, 147172, 147173, 147174,  0 } },
  { "Fanged Slayer's Armor"                      ,     "tier20",     13,  1309,   20,   4,   4,  260, 242278, { 147169, 147170, 147171, 147172, 147173, 147174,  0 } },
  { "Fanged Slayer's Armor"                      ,     "tier20",     13,  1309,   20,   4,   4,  261, 242279, { 147169, 147170, 147171, 147172, 147173, 147174,  0 } },
  { "Vestments of Blind Absolution"              ,     "tier20",     13,  1308,   20,   2,   5,  256, 242268, { 147163, 147164, 147165, 147166, 147167, 147168,  0 } },
  { "Vestments of Blind Absolution"              ,     "tier20",     13,  1308,   20,   2,   5,  257, 242270, { 147163, 147164, 147165, 147166, 147167, 147168,  0 } },
  { "Vestments of Blind Absolution"              ,     "tier20",     13,  1308,   20,   2,   5,  258, 242272, { 147163, 147164, 147165, 147166, 147167, 147168,  0 } },
  { "Vestments of Blind Absolution"              ,     "tier20",     13,  1308,   20,   4,   5,  256, 242269, { 147163, 147164, 147165, 147166, 147167, 147168,  0 } },
  { "Vestments of Blind Absolution"              ,     "tier20",     13,  1308,   20,   4,   5,  257, 242271, { 147163, 147164, 147165, 147166, 147167, 147168,  0 } },
  { "Vestments of Blind Absolution"              ,     "tier20",     13,  1308,   20,   4,   5,  258, 242273, { 147163, 147164, 147165, 147166, 147167, 147168,  0 } },
  { "Gravewarden Armaments"                      ,     "tier20",     13,  1301,   20,   2,   6,  250, 242001, { 147121, 147122, 147123, 147124, 147125, 147126,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Gravewarden Armaments"                      ,     "tier20",     13,  1301,   20,   2,   6,  251, 242058, { 147121, 147122, 147123, 147124, 147125, 147126,  0 } },
  { "Gravewarden Armaments"                      ,     "tier20",     13,  1301,   20,   2,   6,  252, 242064, { 147121, 147122, 147123, 147124, 147125, 147126,  0 } },
  { "Gravewarden Armaments"                      ,     "tier20",     13,  1301,   20,   4,   6,  250, 242009, { 147121, 147122, 147123, 147124, 147125, 147126,  0 } },
  { "Gravewarden Armaments"                      ,     "tier20",     13,  1301,   20,   4,   6,  251, 242063, { 147121, 147122, 147123, 147124, 147125, 147126,  0 } },
  { "Gravewarden Armaments"                      ,     "tier20",     13,  1301,   20,   4,   6,  252, 242225, { 147121, 147122, 147123, 147124, 147125, 147126,  0 } },
  { "Regalia of the Skybreaker"                  ,     "tier20",     13,  1310,   20,   2,   7,  262, 242282, { 147175, 147176, 147177, 147178, 147179, 147180,  0 } },
  { "Regalia of the Skybreaker"                  ,     "tier20",     13,  1310,   20,   2,   7,  263, 242283, { 147175, 147176, 147177, 147178, 147179, 147180,  0 } },
  { "Regalia of the Skybreaker"                  ,     "tier20",     13,  1310,   20,   2,   7,  264, 242287, { 147175, 147176, 147177, 147178, 147179, 147180,  0 } },
  { "Regalia of the Skybreaker"                  ,     "tier20",     13,  1310,   20,   4,   7,  262, 242281, { 147175, 147176, 147177, 147178, 147179, 147180,  0 } },
  { "Regalia of the Skybreaker"                  ,     "tier20",     13,  1310,   20,   4,   7,  263, 242285, { 147175, 147176, 147177, 147178, 147179, 147180,  0 } },
  { "Regalia of the Skybreaker"                  ,     "tier20",     13,  1310,   20,   4,   7,  264, 242288, { 147175, 147176, 147177, 147178, 147179, 147180,  0 } },
  { "Regalia of the Arcane Tempest"              ,     "tier20",     13,  1305,   20,   2,   8,   62, 242248, { 147145, 147146, 147147, 147148, 147149, 147150,  0 } },
  { "Regalia of the Arcane Tempest"              ,     "tier20",     13,  1305,   20,   2,   8,   63, 242249, { 147145, 147146, 147147, 147148, 147149, 147150,  0 } },
  { "Regalia of the Arcane Tempest"              ,     "tier20",     13,  1305,   20,   2,   8,   64, 242252, { 147145, 147146, 147147, 147148, 147149, 147150,  0 } },
  { "Regalia of the Arcane Tempest"              ,     "tier20",     13,  1305,   20,   4,   8,   64, 242254, { 147145, 147146, 147147, 147148, 147149, 147150,  0 } },
  { "Regalia of the Arcane Tempest"              ,     "tier20",     13,  1305,   20,   4,   8,   63, 242250, { 147145, 147146, 147147, 147148, 147149, 147150,  0 } },
  { "Regalia of the Arcane Tempest"              ,     "tier20",     13,  1305,   20,   4,   8,   62, 246225, { 147145, 147146, 147147, 147148, 147149, 147150,  0 } },
  { "Diabolic Raiment"                           ,     "tier20",     13,  1311,   20,   2,   9,  265, 242290, { 147181, 147182, 147183, 147184, 147185, 147186,  0 } },
  { "Diabolic Raiment"                           ,     "tier20",     13,  1311,   20,   2,   9,  266, 242293, { 147181, 147182, 147183, 147184, 147185, 147186,  0 } },
  { "Diabolic Raiment"                           ,     "tier20",     13,  1311,   20,   2,   9,  267, 242295, { 147181, 147182, 147183, 147184, 147185, 147186,  0 } },
  { "Diabolic Raiment"                           ,     "tier20",     13,  1311,   20,   4,   9,  265, 242291, { 147181, 147182, 147183, 147184, 147185, 147186,  0 } },
  { "Diabolic Raiment"                           ,     "tier20",     13,  1311,   20,   4,   9,  266, 242294, { 147181, 147182, 147183, 147184, 147185, 147186,  0 } },
  { "Diabolic Raiment"                           ,     "tier20",     13,  1311,   20,   4,   9,  267, 242296, { 147181, 147182, 147183, 147184, 147185, 147186,  0 } },
  { "Xuen's Battlegear"                          ,     "tier20",     13,  1306,   20,   2,  10,  268, 242255, { 147151, 147152, 147153, 147154, 147155, 147156,  0 } },
  { "Xuen's Battlegear"                          ,     "tier20",     13,  1306,   20,   2,  10,  270, 242257, { 147151, 147152, 147153, 147154, 147155, 147156,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Xuen's Battlegear"                          ,     "tier20",     13,  1306,   20,   2,  10,  269, 242260, { 147151, 147152, 147153, 147154, 147155, 147156,  0 } },
  { "Xuen's Battlegear"                          ,     "tier20",     13,  1306,   20,   4,  10,  268, 242256, { 147151, 147152, 147153, 147154, 147155, 147156,  0 } },
  { "Xuen's Battlegear"                          ,     "tier20",     13,  1306,   20,   4,  10,  270, 242258, { 147151, 147152, 147153, 147154, 147155, 147156,  0 } },
  { "Xuen's Battlegear"                          ,     "tier20",     13,  1306,   20,   4,  10,  269, 242259, { 147151, 147152, 147153, 147154, 147155, 147156,  0 } },
  { "Stormheart Raiment"                         ,     "tier20",     13,  1303,   20,   2,  11,  102, 242231, { 147133, 147134, 147135, 147136, 147137, 147138,  0 } },
  { "Stormheart Raiment"                         ,     "tier20",     13,  1303,   20,   2,  11,  103, 242234, { 147133, 147134, 147135, 147136, 147137, 147138,  0 } },
  { "Stormheart Raiment"                         ,     "tier20",     13,  1303,   20,   2,  11,  104, 242236, { 147133, 147134, 147135, 147136, 147137, 147138,  0 } },
  { "Stormheart Raiment"                         ,     "tier20",     13,  1303,   20,   2,  11,  105, 242238, { 147133, 147134, 147135, 147136, 147137, 147138,  0 } },
  { "Stormheart Raiment"                         ,     "tier20",     13,  1303,   20,   4,  11,  102, 242233, { 147133, 147134, 147135, 147136, 147137, 147138,  0 } },
  { "Stormheart Raiment"                         ,     "tier20",     13,  1303,   20,   4,  11,  103, 242235, { 147133, 147134, 147135, 147136, 147137, 147138,  0 } },
  { "Stormheart Raiment"                         ,     "tier20",     13,  1303,   20,   4,  11,  104, 242237, { 147133, 147134, 147135, 147136, 147137, 147138,  0 } },
  { "Stormheart Raiment"                         ,     "tier20",     13,  1303,   20,   4,  11,  105, 242313, { 147133, 147134, 147135, 147136, 147137, 147138,  0 } },
  { "Demonbane Armor"                            ,     "tier20",     13,  1302,   20,   2,  12,  577, 242227, { 147127, 147128, 147129, 147130, 147131, 147132,  0 } },
  { "Demonbane Armor"                            ,     "tier20",     13,  1302,   20,   2,  12,  581, 242228, { 147127, 147128, 147129, 147130, 147131, 147132,  0 } },
  { "Demonbane Armor"                            ,     "tier20",     13,  1302,   20,   4,  12,  577, 242226, { 147127, 147128, 147129, 147130, 147131, 147132,  0 } },
  { "Demonbane Armor"                            ,     "tier20",     13,  1302,   20,   4,  12,  581, 242229, { 147127, 147128, 147129, 147130, 147131, 147132,  0 } },
  { "Juggernaut Battlegear"                      ,     "tier21",     14,  1319,   21,   2,   1,   71, 251878, { 152178, 152179, 152180, 152181, 152182, 152183,  0 } },
  { "Juggernaut Battlegear"                      ,     "tier21",     14,  1319,   21,   2,   1,   72, 251880, { 152178, 152179, 152180, 152181, 152182, 152183,  0 } },
  { "Juggernaut Battlegear"                      ,     "tier21",     14,  1319,   21,   2,   1,   73, 251882, { 152178, 152179, 152180, 152181, 152182, 152183,  0 } },
  { "Juggernaut Battlegear"                      ,     "tier21",     14,  1319,   21,   4,   1,   71, 251879, { 152178, 152179, 152180, 152181, 152182, 152183,  0 } },
  { "Juggernaut Battlegear"                      ,     "tier21",     14,  1319,   21,   4,   1,   72, 251881, { 152178, 152179, 152180, 152181, 152182, 152183,  0 } },
  { "Juggernaut Battlegear"                      ,     "tier21",     14,  1319,   21,   4,   1,   73, 251883, { 152178, 152179, 152180, 152181, 152182, 152183,  0 } },
  { "Light's Vanguard Battleplate"               ,     "tier21",     14,  1324,   21,   2,   2,   65, 251863, { 152148, 152149, 152150, 152151, 152152, 152153,  0 } },
  { "Light's Vanguard Battleplate"               ,     "tier21",     14,  1324,   21,   2,   2,   66, 251869, { 152148, 152149, 152150, 152151, 152152, 152153,  0 } },
  { "Light's Vanguard Battleplate"               ,     "tier21",     14,  1324,   21,   2,   2,   70, 251867, { 152148, 152149, 152150, 152151, 152152, 152153,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Light's Vanguard Battleplate"               ,     "tier21",     14,  1324,   21,   4,   2,   65, 251865, { 152148, 152149, 152150, 152151, 152152, 152153,  0 } },
  { "Light's Vanguard Battleplate"               ,     "tier21",     14,  1324,   21,   4,   2,   66, 251870, { 152148, 152149, 152150, 152151, 152152, 152153,  0 } },
  { "Light's Vanguard Battleplate"               ,     "tier21",     14,  1324,   21,   4,   2,   70, 251868, { 152148, 152149, 152150, 152151, 152152, 152153,  0 } },
  { "Serpentstalker Guise"                       ,     "tier21",     14,  1327,   21,   2,   3,  253, 251755, { 152130, 152131, 152132, 152133, 152134, 152135,  0 } },
  { "Serpentstalker Guise"                       ,     "tier21",     14,  1327,   21,   2,   3,  254, 251754, { 152130, 152131, 152132, 152133, 152134, 152135,  0 } },
  { "Serpentstalker Guise"                       ,     "tier21",     14,  1327,   21,   2,   3,  255, 251751, { 152130, 152131, 152132, 152133, 152134, 152135,  0 } },
  { "Serpentstalker Guise"                       ,     "tier21",     14,  1327,   21,   4,   3,  253, 251756, { 152130, 152131, 152132, 152133, 152134, 152135,  0 } },
  { "Serpentstalker Guise"                       ,     "tier21",     14,  1327,   21,   4,   3,  254, 251753, { 152130, 152131, 152132, 152133, 152134, 152135,  0 } },
  { "Serpentstalker Guise"                       ,     "tier21",     14,  1327,   21,   4,   3,  255, 251752, { 152130, 152131, 152132, 152133, 152134, 152135,  0 } },
  { "Regalia of the Dashing Scoundrel"           ,     "tier21",     14,  1322,   21,   2,   4,  259, 251776, { 152160, 152161, 152162, 152163, 152164, 152165,  0 } },
  { "Regalia of the Dashing Scoundrel"           ,     "tier21",     14,  1322,   21,   2,   4,  260, 251778, { 152160, 152161, 152162, 152163, 152164, 152165,  0 } },
  { "Regalia of the Dashing Scoundrel"           ,     "tier21",     14,  1322,   21,   2,   4,  261, 251785, { 152160, 152161, 152162, 152163, 152164, 152165,  0 } },
  { "Regalia of the Dashing Scoundrel"           ,     "tier21",     14,  1322,   21,   4,   4,  259, 251777, { 152160, 152161, 152162, 152163, 152164, 152165,  0 } },
  { "Regalia of the Dashing Scoundrel"           ,     "tier21",     14,  1322,   21,   4,   4,  260, 251783, { 152160, 152161, 152162, 152163, 152164, 152165,  0 } },
  { "Regalia of the Dashing Scoundrel"           ,     "tier21",     14,  1322,   21,   4,   4,  261, 251788, { 152160, 152161, 152162, 152163, 152164, 152165,  0 } },
  { "Gilded Seraph's Raiment"                    ,     "tier21",     14,  1323,   21,   2,   5,  256, 251843, { 152154, 152155, 152156, 152157, 152158, 152159,  0 } },
  { "Gilded Seraph's Raiment"                    ,     "tier21",     14,  1323,   21,   2,   5,  257, 251831, { 152154, 152155, 152156, 152157, 152158, 152159,  0 } },
  { "Gilded Seraph's Raiment"                    ,     "tier21",     14,  1323,   21,   2,   5,  258, 251845, { 152154, 152155, 152156, 152157, 152158, 152159,  0 } },
  { "Gilded Seraph's Raiment"                    ,     "tier21",     14,  1323,   21,   4,   5,  256, 251844, { 152154, 152155, 152156, 152157, 152158, 152159,  0 } },
  { "Gilded Seraph's Raiment"                    ,     "tier21",     14,  1323,   21,   4,   5,  257, 251842, { 152154, 152155, 152156, 152157, 152158, 152159,  0 } },
  { "Gilded Seraph's Raiment"                    ,     "tier21",     14,  1323,   21,   4,   5,  258, 251846, { 152154, 152155, 152156, 152157, 152158, 152159,  0 } },
  { "Dreadwake Armor"                            ,     "tier21",     14,  1330,   21,   2,   6,  250, 251876, { 152112, 152113, 152114, 152115, 152116, 152117,  0 } },
  { "Dreadwake Armor"                            ,     "tier21",     14,  1330,   21,   2,   6,  251, 251873, { 152112, 152113, 152114, 152115, 152116, 152117,  0 } },
  { "Dreadwake Armor"                            ,     "tier21",     14,  1330,   21,   2,   6,  252, 251871, { 152112, 152113, 152114, 152115, 152116, 152117,  0 } },
  { "Dreadwake Armor"                            ,     "tier21",     14,  1330,   21,   4,   6,  250, 251877, { 152112, 152113, 152114, 152115, 152116, 152117,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Dreadwake Armor"                            ,     "tier21",     14,  1330,   21,   4,   6,  251, 251875, { 152112, 152113, 152114, 152115, 152116, 152117,  0 } },
  { "Dreadwake Armor"                            ,     "tier21",     14,  1330,   21,   4,   6,  252, 251872, { 152112, 152113, 152114, 152115, 152116, 152117,  0 } },
  { "Garb of Venerated Spirits"                  ,     "tier21",     14,  1321,   21,   2,   7,  262, 251757, { 152166, 152167, 152168, 152169, 152170, 152171,  0 } },
  { "Garb of Venerated Spirits"                  ,     "tier21",     14,  1321,   21,   2,   7,  263, 251762, { 152166, 152167, 152168, 152169, 152170, 152171,  0 } },
  { "Garb of Venerated Spirits"                  ,     "tier21",     14,  1321,   21,   2,   7,  264, 251764, { 152166, 152167, 152168, 152169, 152170, 152171,  0 } },
  { "Garb of Venerated Spirits"                  ,     "tier21",     14,  1321,   21,   4,   7,  262, 251758, { 152166, 152167, 152168, 152169, 152170, 152171,  0 } },
  { "Garb of Venerated Spirits"                  ,     "tier21",     14,  1321,   21,   4,   7,  263, 251761, { 152166, 152167, 152168, 152169, 152170, 152171,  0 } },
  { "Garb of Venerated Spirits"                  ,     "tier21",     14,  1321,   21,   4,   7,  264, 251765, { 152166, 152167, 152168, 152169, 152170, 152171,  0 } },
  { "Runebound Regalia"                          ,     "tier21",     14,  1326,   21,   2,   8,   62, 251861, { 152136, 152137, 152138, 152139, 152140, 152141,  0 } },
  { "Runebound Regalia"                          ,     "tier21",     14,  1326,   21,   2,   8,   63, 251857, { 152136, 152137, 152138, 152139, 152140, 152141,  0 } },
  { "Runebound Regalia"                          ,     "tier21",     14,  1326,   21,   2,   8,   64, 251859, { 152136, 152137, 152138, 152139, 152140, 152141,  0 } },
  { "Runebound Regalia"                          ,     "tier21",     14,  1326,   21,   4,   8,   62, 251862, { 152136, 152137, 152138, 152139, 152140, 152141,  0 } },
  { "Runebound Regalia"                          ,     "tier21",     14,  1326,   21,   4,   8,   63, 251858, { 152136, 152137, 152138, 152139, 152140, 152141,  0 } },
  { "Runebound Regalia"                          ,     "tier21",     14,  1326,   21,   4,   8,   64, 251860, { 152136, 152137, 152138, 152139, 152140, 152141,  0 } },
  { "Grim Inquisitor's Regalia"                  ,     "tier21",     14,  1320,   21,   2,   9,  266, 251851, { 152172, 152173, 152174, 152175, 152176, 152177,  0 } },
  { "Grim Inquisitor's Regalia"                  ,     "tier21",     14,  1320,   21,   2,   9,  267, 251854, { 152172, 152173, 152174, 152175, 152176, 152177,  0 } },
  { "Grim Inquisitor's Regalia"                  ,     "tier21",     14,  1320,   21,   2,   9,  265, 251847, { 152172, 152173, 152174, 152175, 152176, 152177,  0 } },
  { "Grim Inquisitor's Regalia"                  ,     "tier21",     14,  1320,   21,   4,   9,  265, 251849, { 152172, 152173, 152174, 152175, 152176, 152177,  0 } },
  { "Grim Inquisitor's Regalia"                  ,     "tier21",     14,  1320,   21,   4,   9,  266, 251852, { 152172, 152173, 152174, 152175, 152176, 152177,  0 } },
  { "Grim Inquisitor's Regalia"                  ,     "tier21",     14,  1320,   21,   4,   9,  267, 251855, { 152172, 152173, 152174, 152175, 152176, 152177,  0 } },
  { "Chi'Ji's Battlegear"                        ,     "tier21",     14,  1325,   21,   2,  10,  268, 251829, { 152142, 152143, 152144, 152145, 152146, 152147,  0 } },
  { "Chi'Ji's Battlegear"                        ,     "tier21",     14,  1325,   21,   2,  10,  270, 251825, { 152142, 152143, 152144, 152145, 152146, 152147,  0 } },
  { "Chi'Ji's Battlegear"                        ,     "tier21",     14,  1325,   21,   2,  10,  269, 251823, { 152142, 152143, 152144, 152145, 152146, 152147,  0 } },
  { "Chi'Ji's Battlegear"                        ,     "tier21",     14,  1325,   21,   4,  10,  268, 251830, { 152142, 152143, 152144, 152145, 152146, 152147,  0 } },
  { "Chi'Ji's Battlegear"                        ,     "tier21",     14,  1325,   21,   4,  10,  270, 251826, { 152142, 152143, 152144, 152145, 152146, 152147,  0 } },
  // Set bonus name                              ,      OptName, EnumID, SetID, Tier, Bns, Cls, Spec,  Spell, Items
  { "Chi'Ji's Battlegear"                        ,     "tier21",     14,  1325,   21,   4,  10,  269, 251821, { 152142, 152143, 152144, 152145, 152146, 152147,  0 } },
  { "Bearmantle Battlegear"                      ,     "tier21",     14,  1328,   21,   2,  11,  102, 251803, { 152124, 152125, 152126, 152127, 152128, 152129,  0 } },
  { "Bearmantle Battlegear"                      ,     "tier21",     14,  1328,   21,   2,  11,  103, 251789, { 152124, 152125, 152126, 152127, 152128, 152129,  0 } },
  { "Bearmantle Battlegear"                      ,     "tier21",     14,  1328,   21,   2,  11,  104, 251791, { 152124, 152125, 152126, 152127, 152128, 152129,  0 } },
  { "Bearmantle Battlegear"                      ,     "tier21",     14,  1328,   21,   2,  11,  105, 251813, { 152124, 152125, 152126, 152127, 152128, 152129,  0 } },
  { "Bearmantle Battlegear"                      ,     "tier21",     14,  1328,   21,   4,  11,  102, 251809, { 152124, 152125, 152126, 152127, 152128, 152129,  0 } },
  { "Bearmantle Battlegear"                      ,     "tier21",     14,  1328,   21,   4,  11,  103, 251790, { 152124, 152125, 152126, 152127, 152128, 152129,  0 } },
  { "Bearmantle Battlegear"                      ,     "tier21",     14,  1328,   21,   4,  11,  104, 251792, { 152124, 152125, 152126, 152127, 152128, 152129,  0 } },
  { "Bearmantle Battlegear"                      ,     "tier21",     14,  1328,   21,   4,  11,  105, 251814, { 152124, 152125, 152126, 152127, 152128, 152129,  0 } },
  { "Felreaper Vestments"                        ,     "tier21",     14,  1329,   21,   2,  12,  577, 251767, { 152118, 152119, 152120, 152121, 152122, 152123,  0 } },
  { "Felreaper Vestments"                        ,     "tier21",     14,  1329,   21,   2,  12,  581, 251770, { 152118, 152119, 152120, 152121, 152122, 152123,  0 } },
  { "Felreaper Vestments"                        ,     "tier21",     14,  1329,   21,   4,  12,  577, 251769, { 152118, 152119, 152120, 152121, 152122, 152123,  0 } },
  { "Felreaper Vestments"                        ,     "tier21",     14,  1329,   21,   4,  12,  581, 251774, { 152118, 152119, 152120, 152121, 152122, 152123,  0 } },
};
#define RPPMMOD_SIZE (911)

// 911 RPPM Modifiers, wow build level 26491
static struct rppm_modifier_t __rppmmodifier_data[] = {
  {  17495,    4,  1,  1.0000 },
  {  27656,    4,  1,  1.0000 },
  {  29633,    4,  1,  1.0000 },
  {  29725,    4,  1,  1.0000 },
  {  45054,    4,  1,  1.0000 },
  {  49530,    1,  1,  1.0000 },
  {  51128,    4,  1,  1.0000 },
  {  51128,    4,  2,  1.0000 },
  {  60066,    4,  2,  1.0000 },
  {  60306,    4,  1,  1.0000 },
  {  64764,    4,  1,  1.0000 },
  { 104428,    4,  1,  1.0000 },
  { 104441,    4,  1,  1.0000 },
  { 118314,    4,  1,  1.0000 },
  { 119938,    4,  1,  1.0000 },
  { 126468,    4,  1,  1.0000 },
  { 137248,    0,  7, -1.0000 },
  { 137592,    0,  7, -1.0000 },
  { 137592,   62,  4, -0.2390 },
  { 137592,   63,  4, -0.2950 },
  { 137592,   64,  4,  0.3870 },
  { 137592,  265,  4, -0.3750 },
  { 137592,  266,  4, -0.4020 },
  { 137592,  267,  4, -0.4910 },
  { 137592,  262,  4,  0.8910 },
  { 137592,  102,  4,  0.8720 },
  { 137592,  258,  4, -0.0670 },
  { 137594,    0,  7, -1.0000 },
  { 137595,    4,  1,  1.0000 },
  { 137595,    0,  7, -1.0000 },
  { 137595,  260,  4,  0.1360 },
  { 137595,  259,  4,  0.7890 },
  { 137595,  261,  4,  0.1140 },
  { 137595,   71,  4,  0.3390 },
  { 137595,   72,  4,  0.2570 },
  { 137595,  103,  4,  0.7210 },
  { 137595,  251,  4,  0.5320 },
  { 137595,  252,  4, -0.1620 },
  { 137595,   70,  4,  0.2950 },
  { 137595,  263,  4, -0.1910 },
  { 137595,  269,  4,  0.0870 },
  { 137595,  253,  4, -0.0500 },
  { 137595,  254,  4,  0.1070 },
  { 137595,  255,  4, -0.0500 },
  { 137595,  250,  4, -0.4000 },
  { 137595,  104,  4, -0.4000 },
  { 137595,  268,  4, -0.4000 },
  { 137595,   66,  4, -0.4000 },
  { 137595,   73,  4, -0.4000 },
  { 138120,   72,  4, -0.6250 },
  { 138365,    4,  1,  1.0000 },
  { 138367,    4,  1,  1.0000 },
  { 138849,    4,  1,  1.0000 },
  { 138924,    4,  1,  1.0000 },
  { 138964,  528,  6,  1.0000 },
  { 138964,  102,  4, -0.3500 },
  { 138964,    0,  7, -0.7500 },
  { 138964,  256,  3, -0.4000 },
  { 138968,    4,  1,  1.0000 },
  { 139116,  528,  6,  1.0000 },
  { 139134,    4,  2,  1.0000 },
  { 139171,    4,  2,  1.0000 },
  { 139190,    4,  1,  1.0000 },
  { 146195,    4,  1,  1.0000 },
  { 146195,  250,  4, -0.4000 },
  { 146195,  104,  4, -0.4000 },
  { 146195,  268,  4, -0.4000 },
  { 146195,   66,  4, -0.4000 },
  { 146195,   73,  4, -0.4000 },
  { 146195,   71,  4,  0.3500 },
  { 146195,  253,  4,  0.0000 },
  { 146195,  260,  4,  0.1500 },
  { 146195,  259,  4,  0.5500 },
  { 146195,  263,  4,  0.5500 },
  { 146195,  103,  4,  0.3000 },
  { 146195,  251,  4,  0.5000 },
  { 146195,   72,  4,  0.0500 },
  { 146195,  254,  4,  0.2000 },
  { 146195,   70,  4,  0.4500 },
  { 146195,  261,  4,  0.0000 },
  { 146195,  255,  4,  0.1500 },
  { 146195,  252,  4,  0.0500 },
  { 146195,  269,  4,  0.2000 },
  { 146197,    4,  1,  1.0000 },
  { 146197,   62,  4,  0.2500 },
  { 146197,  266,  4,  0.2500 },
  { 146197,  265,  4,  0.1000 },
  { 146197,  267,  4,  0.1500 },
  { 146197,  262,  4,  0.0500 },
  { 146197,   63,  4,  0.2000 },
  { 146197,   64,  4,  0.2000 },
  { 146197,  102,  4,  0.1000 },
  { 146197,  258,  4,  0.0000 },
  { 146197,  250,  4, -0.7500 },
  { 146197,  104,  4, -0.7500 },
  { 146197,  268,  4, -0.7500 },
  { 146197,   66,  4, -0.7500 },
  { 146197,   73,  4, -0.7500 },
  { 146199,  105,  4, -0.2000 },
  { 146199,  270,  4, -0.2000 },
  { 146199,   65,  4,  0.1000 },
  { 146199,  256,  4,  0.4000 },
  { 146199,  257,  4,  0.0000 },
  { 146199,  264,  4, -0.3000 },
  { 146199,  250,  4, -0.7500 },
  { 146199,  104,  4, -0.7500 },
  { 146199,  268,  4, -0.7500 },
  { 146199,   66,  4, -0.7500 },
  { 146199,   73,  4, -0.7500 },
  { 146316,    4,  1,  1.0000 },
  { 159239,    4,  1,  1.0000 },
  { 160223,    0,  7, -1.0000 },
  { 162452,    4,  1,  1.0000 },
  { 165476,    4,  1,  1.0000 },
  { 166441,    4,  1,  1.0000 },
  { 179115,    8,  3,  0.1000 },
  { 179115,  512,  3, -0.1000 },
  { 179128,    4,  1,  1.0000 },
  { 179143,    4,  1,  1.0000 },
  { 183951,    4,  1,  1.0000 },
  { 183951,   62,  4, -0.4000 },
  { 183951,  258,  4, -0.1670 },
  { 184066,   62,  4, -0.4000 },
  { 184066,  258,  4, -0.1670 },
  { 184249,    4,  1,  1.0000 },
  { 187143,    4,  1,  1.0000 },
  { 187435,    4,  1,  1.0000 },
  { 188027,    4,  1,  1.0000 },
  { 188028,    4,  1,  1.0000 },
  { 188534,    4,  1,  1.0000 },
  { 190889,    4,  1,  1.0000 },
  { 190890,    4,  1,  1.0000 },
  { 191048,    4,  1,  1.0000 },
  { 192623,    4,  1,  1.0000 },
  { 193371,    4,  1,  1.0000 },
  { 196099,    5,  1,  1.0000 },
  { 196777,    4,  1,  1.0000 },
  { 197846,    4,  1,  1.0000 },
  { 198735,    4,  1,  1.0000 },
  { 199806,    4,  1,  1.0000 },
  { 201336,    4,  1,  1.0000 },
  { 201407,    4,  1,  1.0000 },
  { 201471,    4,  1,  1.0000 },
  { 201900,    4,  1,  1.0000 },
  { 202762,    4,  1,  1.0000 },
  { 202840,    4,  1,  1.0000 },
  { 203557,    4,  1,  1.0000 },
  { 206478,    4,  1,  1.0000 },
  { 207320,    4,  1,  1.0000 },
  { 207767,   71,  4, -0.4000 },
  { 208213,    4,  1,  1.0000 },
  { 208653,    0,  4,  0.0000 },
  { 209579,    4,  1,  1.0000 },
  { 211984,    4,  1,  1.0000 },
  { 213782,    4,  1,  1.0000 },
  { 213782,  252,  4, -0.3200 },
  { 214054,    4,  1,  1.0000 },
  { 214054,  263,  4, -0.2400 },
  { 214349,    4,  1,  1.0000 },
  { 214349,  252,  4, -0.3200 },
  { 214396,    4,  1,  1.0000 },
  { 214492,    4,  1,  1.0000 },
  { 214571,    4,  1,  1.0000 },
  { 214962,    4,  1,  1.0000 },
  { 215089,  252,  4, -0.3200 },
  { 215089,    4,  1,  1.0000 },
  { 215120,    4,  1,  1.0000 },
  { 215120,  263,  4, -0.2400 },
  { 215247,    4,  1,  1.0000 },
  { 215264,    4,  1,  1.0000 },
  { 215293,    4,  1,  1.0000 },
  { 215404,    4,  1,  1.0000 },
  { 215444,    4,  1,  1.0000 },
  { 215444,  252,  4, -0.3200 },
  { 215569,    4,  1,  1.0000 },
  { 215658,    4,  1,  1.0000 },
  { 215745,    4,  1,  1.0000 },
  { 215745,  253,  4, -0.2700 },
  { 215857,    4,  2,  1.0000 },
  { 216085,    4,  1,  1.0000 },
  { 216085,  263,  4, -0.2400 },
  { 216085,  253,  4, -0.2700 },
  { 221767,    4,  2,  1.0000 },
  { 221811,    4,  1,  1.0000 },
  { 221811,  263,  4, -0.2400 },
  { 221845,    3,  1,  1.0000 },
  { 221845,  252,  4, -0.3200 },
  { 221873,    4,  1,  1.0000 },
  { 222015,    4,  1,  1.0000 },
  { 222167,    4,  1,  1.0000 },
  { 222187,    4,  1,  1.0000 },
  { 222187,  263,  4, -0.2400 },
  { 222207,    4,  1,  1.0000 },
  { 222703,    4,  1,  1.0000 },
  { 222705,  252,  4, -0.3200 },
  { 224059,    4,  1,  1.0000 },
  { 224073,    4,  1,  1.0000 },
  { 224076,    4,  1,  1.0000 },
  { 224158,    4,  1,  1.0000 },
  { 225123, 4060,  3, -0.5000 },
  { 225123,  250,  4, -0.5000 },
  { 225123,   65,  4, -0.5000 },
  { 225123,   66,  4, -0.5000 },
  { 225123,   73,  4, -0.5000 },
  { 225123,    4,  1,  1.0000 },
  { 225125, 2607,  3, -0.5000 },
  { 225125,  103,  4, -0.5000 },
  { 225125,  104,  4, -0.5000 },
  { 225125,  105,  4, -0.5000 },
  { 225125,  257,  4, -0.5000 },
  { 225125,  263,  4, -0.5000 },
  { 225125,  264,  4, -0.5000 },
  { 225127,  435,  3, -0.5000 },
  { 225127,  581,  4, -0.5000 },
  { 225127,  102,  4, -0.5000 },
  { 225127,  104,  4, -0.5000 },
  { 225127,  105,  4, -0.5000 },
  { 225127,  253,  4, -0.5000 },
  { 225127,  254,  4, -0.5000 },
  { 225127,  268,  4, -0.5000 },
  { 225127,  270,  4, -0.5000 },
  { 225127,  262,  4, -0.5000 },
  { 225127,  264,  4, -0.5000 },
  { 225127,    4,  1,  1.0000 },
  { 225128, 2477,  3, -0.5000 },
  { 225128,  102,  4, -0.5000 },
  { 225128,  103,  4, -0.5000 },
  { 225128,  104,  4, -0.5000 },
  { 225128,  268,  4, -0.5000 },
  { 225128,  269,  4, -0.5000 },
  { 225128,   66,  4, -0.5000 },
  { 225128,   70,  4, -0.5000 },
  { 225128,  258,  4, -0.5000 },
  { 225128,  262,  4, -0.5000 },
  { 225128,  263,  4, -0.5000 },
  { 225128,    4,  1,  1.0000 },
  { 225129,  400,  3, -0.5000 },
  { 225129,  250,  4, -0.5000 },
  { 225129,  581,  4, -0.5000 },
  { 225129,  102,  4, -0.5000 },
  { 225129,  104,  4, -0.5000 },
  { 225129,  105,  4, -0.5000 },
  { 225129,  268,  4, -0.5000 },
  { 225129,  270,  4, -0.5000 },
  { 225129,   65,  4, -0.5000 },
  { 225129,   66,  4, -0.5000 },
  { 225129,  262,  4, -0.5000 },
  { 225129,  264,  4, -0.5000 },
  { 225129,   73,  4, -0.5000 },
  { 225131, 2603,  3, -0.5000 },
  { 225131,  103,  4, -0.5000 },
  { 225131,  104,  4, -0.5000 },
  { 225131,  105,  4, -0.5000 },
  { 225131,  255,  4, -0.5000 },
  { 225131,  257,  4, -0.5000 },
  { 225131,  263,  4, -0.5000 },
  { 225131,  264,  4, -0.5000 },
  { 225131,    4,  1,  1.0000 },
  { 225134, 2603,  3, -0.5000 },
  { 225134,  103,  4, -0.5000 },
  { 225134,  104,  4, -0.5000 },
  { 225134,  105,  4, -0.5000 },
  { 225134,  255,  4, -0.5000 },
  { 225134,  257,  4, -0.5000 },
  { 225134,  263,  4, -0.5000 },
  { 225134,  264,  4, -0.5000 },
  { 225134,    4,  1,  1.0000 },
  { 225135,  435,  3, -0.5000 },
  { 225135,  581,  4, -0.5000 },
  { 225135,  102,  4, -0.5000 },
  { 225135,  104,  4, -0.5000 },
  { 225135,  105,  4, -0.5000 },
  { 225135,  268,  4, -0.5000 },
  { 225135,  270,  4, -0.5000 },
  { 225135,  262,  4, -0.5000 },
  { 225135,  264,  4, -0.5000 },
  { 225135,  577,  4,  0.0000 },
  { 225135,  103,  4, -0.3000 },
  { 225135,  253,  4,  1.0000 },
  { 225135,  254,  4,  1.0000 },
  { 225135,  255,  4,  1.5000 },
  { 225135,  269,  4,  0.0000 },
  { 225135,    8,  3, -0.3000 },
  { 225135,  263,  4,  0.0000 },
  { 225136, 2477,  3, -0.5000 },
  { 225136,  102,  4, -0.5000 },
  { 225136,  103,  4, -0.5000 },
  { 225136,  104,  4, -0.5000 },
  { 225136,  268,  4, -0.5000 },
  { 225136,  269,  4, -0.5000 },
  { 225136,   66,  4, -0.5000 },
  { 225136,   70,  4, -0.5000 },
  { 225136,  258,  4, -0.5000 },
  { 225136,  262,  4, -0.5000 },
  { 225136,  263,  4, -0.5000 },
  { 225137, 2607,  3, -0.5000 },
  { 225137,  103,  4, -0.5000 },
  { 225137,  104,  4, -0.5000 },
  { 225137,  105,  4, -0.5000 },
  { 225137,  257,  4, -0.5000 },
  { 225137,  263,  4, -0.5000 },
  { 225137,  264,  4, -0.5000 },
  { 225137,    4,  1,  1.0000 },
  { 225138,    4,  1,  1.0000 },
  { 225138,  105,  4,  0.1200 },
  { 225138,  270,  4,  0.0300 },
  { 225138,  257,  4,  0.1800 },
  { 225138,  256,  4, -0.2400 },
  { 225138,   65,  4, -0.1300 },
  { 225138,  264,  4,  0.1200 },
  { 225139,  251,  4,  1.2000 },
  { 225139,  252,  4,  1.8000 },
  { 225139,  577,  4,  0.1200 },
  { 225139,  103,  4,  1.2400 },
  { 225139,  253,  4,  1.8000 },
  { 225139,  254,  4,  1.2400 },
  { 225139,  255,  4,  0.5000 },
  { 225139,  269,  4, -0.2000 },
  { 225139,   70,  4,  0.0000 },
  { 225139,  259,  4,  0.1700 },
  { 225139,  260,  4,  1.8000 },
  { 225139,  261,  4,  2.0000 },
  { 225139,  263,  4,  2.0000 },
  { 225139,   71,  4,  0.1000 },
  { 225139,   72,  4,  0.7200 },
  { 225142, 2607,  3, -0.5000 },
  { 225142,  103,  4, -0.5000 },
  { 225142,  104,  4, -0.5000 },
  { 225142,  105,  4, -0.5000 },
  { 225142,  257,  4, -0.5000 },
  { 225142,  263,  4, -0.5000 },
  { 225142,  264,  4, -0.5000 },
  { 225601,    4,  1,  1.0000 },
  { 225606,    4,  1,  1.0000 },
  { 227171,    4,  1,  1.0000 },
  { 227868,    4,  1,  1.0000 },
  { 228141,    4,  1,  1.0000 },
  { 228400,    3,  1,  1.0000 },
  { 228445,    4,  1,  1.0000 },
  { 230080,    4,  1,  1.0000 },
  { 230140,    4,  1,  1.0000 },
  { 230236,    4,  1,  1.0000 },
  { 230236,  263,  4, -0.5000 },
  { 230241,    4,  1,  1.0000 },
  { 230257,    4,  1,  1.0000 },
  { 230257,  263,  4, -0.5000 },
  { 230257, 2603,  3, -0.5000 },
  { 230257,  103,  4, -0.5000 },
  { 230257,  104,  4, -0.5000 },
  { 230257,  105,  4, -0.5000 },
  { 230257,  255,  4, -0.5000 },
  { 230257,  257,  4, -0.5000 },
  { 230257,  264,  4, -0.5000 },
  { 231832,    1,  1,  1.0000 },
  { 235003,    4,  1,  1.0000 },
  { 235011,    4,  1,  1.0000 },
  { 236167,    4,  1,  1.0000 },
  { 236545,    3,  1,  1.0000 },
  { 238498, 2093,  3, -0.5000 },
  { 238498,  103,  4, -0.5000 },
  { 238498,  104,  4, -0.5000 },
  { 238498,  263,  4, -0.5000 },
  { 238498,  268,  4, -0.5000 },
  { 238498,  269,  4, -0.5000 },
  { 238498,   70,  4, -0.5000 },
  { 238498,   66,  4, -0.5000 },
  { 238524,  435,  3, -0.5000 },
  { 238524,    4,  1,  1.0000 },
  { 241496,    4,  1,  1.0000 },
  { 242207,  476,  3, -0.5000 },
  { 242207,  251,  4, -0.5000 },
  { 242207,  252,  4, -0.5000 },
  { 242207,  577,  4, -0.5000 },
  { 242207,  102,  4, -0.5000 },
  { 242207,  103,  4, -0.5000 },
  { 242207,  105,  4, -0.5000 },
  { 242207,  270,  4, -0.5000 },
  { 242207,  269,  4, -0.5000 },
  { 242207,   65,  4, -0.5000 },
  { 242207,   70,  4, -0.5000 },
  { 242207,   71,  4, -0.5000 },
  { 242207,   72,  4, -0.5000 },
  { 242215,  400,  3, -0.5000 },
  { 242215,  250,  4, -0.5000 },
  { 242215,  581,  4, -0.5000 },
  { 242215,  102,  4, -0.5000 },
  { 242215,  104,  4, -0.5000 },
  { 242215,  105,  4, -0.5000 },
  { 242215,  253,  4, -0.5000 },
  { 242215,  254,  4, -0.5000 },
  { 242215,  268,  4, -0.5000 },
  { 242215,  270,  4, -0.5000 },
  { 242215,   65,  4, -0.5000 },
  { 242215,   66,  4, -0.5000 },
  { 242215,  262,  4, -0.5000 },
  { 242215,  264,  4, -0.5000 },
  { 242215,   73,  4, -0.5000 },
  { 242215,    4,  1,  1.0000 },
  { 242217,  400,  3, -0.5000 },
  { 242217,  250,  4, -0.5000 },
  { 242217,  581,  4, -0.5000 },
  { 242217,  102,  4, -0.5000 },
  { 242217,  104,  4, -0.5000 },
  { 242217,  105,  4, -0.5000 },
  { 242217,  253,  4, -0.5000 },
  { 242217,  254,  4, -0.5000 },
  { 242217,  268,  4, -0.5000 },
  { 242217,  270,  4, -0.5000 },
  { 242217,   65,  4, -0.5000 },
  { 242217,   66,  4, -0.5000 },
  { 242217,  262,  4, -0.5000 },
  { 242217,  264,  4, -0.5000 },
  { 242217,   73,  4, -0.5000 },
  { 242287,    4,  1,  1.0000 },
  { 242290,    4,  1,  1.0000 },
  { 242325, 2477,  3, -0.5000 },
  { 242325,  102,  4, -0.5000 },
  { 242325,  103,  4, -0.5000 },
  { 242325,  104,  4, -0.5000 },
  { 242325,  268,  4, -0.5000 },
  { 242325,  269,  4, -0.5000 },
  { 242325,   66,  4, -0.5000 },
  { 242325,   70,  4, -0.5000 },
  { 242325,  258,  4, -0.5000 },
  { 242325,  262,  4, -0.5000 },
  { 242325,  263,  4, -0.5000 },
  { 242325,    4,  1,  1.0000 },
  { 242524, 2603,  3, -0.5000 },
  { 242524,  103,  4, -0.5000 },
  { 242524,  104,  4, -0.5000 },
  { 242524,  105,  4, -0.5000 },
  { 242524,  255,  4, -0.5000 },
  { 242524,  257,  4, -0.5000 },
  { 242524,  263,  4, -0.5000 },
  { 242524,  264,  4, -0.5000 },
  { 242524,    4,  1,  1.0000 },
  { 242541, 2477,  3, -0.5000 },
  { 242541,  102,  4, -0.5000 },
  { 242541,  103,  4, -0.5000 },
  { 242541,  104,  4, -0.5000 },
  { 242541,  268,  4, -0.5000 },
  { 242541,  269,  4, -0.5000 },
  { 242541,   66,  4, -0.5000 },
  { 242541,   70,  4, -0.5000 },
  { 242541,  258,  4, -0.5000 },
  { 242541,  262,  4, -0.5000 },
  { 242541,  263,  4, -0.5000 },
  { 242570, 2603,  3, -0.5000 },
  { 242570,  103,  4, -0.5000 },
  { 242570,  104,  4, -0.5000 },
  { 242570,  105,  4, -0.5000 },
  { 242570,  255,  4, -0.5000 },
  { 242570,  257,  4, -0.5000 },
  { 242570,  263,  4, -0.5000 },
  { 242570,  264,  4, -0.5000 },
  { 242570,    4,  1,  1.0000 },
  { 242605, 2603,  3, -0.5000 },
  { 242605,  103,  4, -0.5000 },
  { 242605,  104,  4, -0.5000 },
  { 242605,  105,  4, -0.5000 },
  { 242605,  255,  4, -0.5000 },
  { 242605,  257,  4, -0.5000 },
  { 242605,  263,  4, -0.5000 },
  { 242605,  264,  4, -0.5000 },
  { 242605,    4,  1,  1.0000 },
  { 242611,  400,  3, -0.5000 },
  { 242611,  250,  4, -0.5000 },
  { 242611,  581,  4, -0.5000 },
  { 242611,  102,  4, -0.5000 },
  { 242611,  104,  4, -0.5000 },
  { 242611,  105,  4, -0.5000 },
  { 242611,  268,  4, -0.5000 },
  { 242611,  270,  4, -0.5000 },
  { 242611,   65,  4, -0.5000 },
  { 242611,   66,  4, -0.5000 },
  { 242611,  262,  4, -0.5000 },
  { 242611,  264,  4, -0.5000 },
  { 242611,   73,  4, -0.5000 },
  { 242616,  476,  3, -0.5000 },
  { 242616,  251,  4, -0.5000 },
  { 242616,  252,  4, -0.5000 },
  { 242616,  577,  4, -0.5000 },
  { 242616,  102,  4, -0.5000 },
  { 242616,  103,  4, -0.5000 },
  { 242616,  105,  4, -0.5000 },
  { 242616,  270,  4, -0.5000 },
  { 242616,  269,  4, -0.5000 },
  { 242616,   65,  4, -0.5000 },
  { 242616,   70,  4, -0.5000 },
  { 242616,   71,  4, -0.5000 },
  { 242616,   72,  4, -0.5000 },
  { 242616,    4,  1,  1.0000 },
  { 242628,  476,  3, -0.5000 },
  { 242628,  251,  4, -0.5000 },
  { 242628,  252,  4, -0.5000 },
  { 242628,  577,  4, -0.5000 },
  { 242628,  102,  4, -0.5000 },
  { 242628,  103,  4, -0.5000 },
  { 242628,  105,  4, -0.5000 },
  { 242628,  270,  4, -0.5000 },
  { 242628,  269,  4, -0.5000 },
  { 242628,   65,  4, -0.5000 },
  { 242628,   70,  4, -0.5000 },
  { 242628,   71,  4, -0.5000 },
  { 242628,   72,  4, -0.5000 },
  { 242628,    4,  1,  1.0000 },
  { 244034,    4,  1,  1.0000 },
  { 244041,    4,  1,  1.0000 },
  { 244134,    4,  1,  1.0000 },
  { 244193,    4,  1,  1.0000 },
  { 244193,  253,  4, -0.2700 },
  { 244330,    4,  1,  1.0000 },
  { 244381,    4,  1,  1.0000 },
  { 247625,    4,  1,  1.0000 },
  { 248168,    4,  1,  1.0000 },
  { 248171,    4,  1,  1.0000 },
  { 248173,    4,  1,  1.0000 },
  { 248175,    4,  1,  1.0000 },
  { 248198,    4,  1,  1.0000 },
  { 248199,    4,  1,  1.0000 },
  { 248200,    4,  1,  1.0000 },
  { 248218,    4,  1,  1.0000 },
  { 248256,    4,  1,  1.0000 },
  { 248257,    4,  1,  1.0000 },
  { 248260,    4,  1,  1.0000 },
  { 248262,    4,  1,  1.0000 },
  { 248264,    4,  1,  1.0000 },
  { 248265,    4,  1,  1.0000 },
  { 248266,    4,  1,  1.0000 },
  { 248267,    4,  1,  1.0000 },
  { 248268,    4,  1,  1.0000 },
  { 248269,    4,  1,  1.0000 },
  { 248274,    4,  1,  1.0000 },
  { 248276,    4,  1,  1.0000 },
  { 248277,    4,  1,  1.0000 },
  { 248278,    4,  1,  1.0000 },
  { 250075,    3,  1,  1.0000 },
  { 250091,    4,  1,  1.0000 },
  { 250091,  253,  4, -0.2700 },
  { 250093,    3,  1,  1.0000 },
  { 250768, 2477,  3, -0.5000 },
  { 250768,  102,  4, -0.5000 },
  { 250768,  103,  4, -0.5000 },
  { 250768,  104,  4, -0.5000 },
  { 250768,  268,  4, -0.5000 },
  { 250768,  269,  4, -0.5000 },
  { 250768,   66,  4, -0.5000 },
  { 250768,   70,  4, -0.5000 },
  { 250768,  258,  4, -0.5000 },
  { 250768,  262,  4, -0.5000 },
  { 250768,  263,  4, -0.5000 },
  { 250768,    4,  1,  1.0000 },
  { 250846, 2607,  3, -0.5000 },
  { 250846,  103,  4, -0.5000 },
  { 250846,  104,  4, -0.5000 },
  { 250846,  105,  4, -0.5000 },
  { 250846,  257,  4, -0.5000 },
  { 250846,  263,  4, -0.5000 },
  { 250846,  264,  4, -0.5000 },
  { 250846,    4,  1,  1.0000 },
  { 251316,    4,  1,  1.0000 },
  { 251875,    4,  1,  1.0000 },
  { 251925,  476,  3, -0.5000 },
  { 251925,  251,  4, -0.5000 },
  { 251925,  252,  4, -0.5000 },
  { 251925,  577,  4, -0.5000 },
  { 251925,  102,  4, -0.5000 },
  { 251925,  103,  4, -0.5000 },
  { 251925,  105,  4, -0.5000 },
  { 251925,  270,  4, -0.5000 },
  { 251925,  269,  4, -0.5000 },
  { 251925,   65,  4, -0.5000 },
  { 251925,   70,  4, -0.5000 },
  { 251925,   71,  4, -0.5000 },
  { 251925,   72,  4, -0.5000 },
  { 251925,    4,  1,  1.0000 },
  { 252207,    4,  1,  1.0000 },
  { 252875,    4,  1,  1.0000 },
  { 252888,    4,  1,  1.0000 },
  { 252922,    4,  1,  1.0000 },
  { 253070,    4,  1,  1.0000 },
  { 253093,    4,  1,  1.0000 },
  { 253111,    4,  1,  1.0000 },
  { 253242, 2603,  3, -0.5000 },
  { 253242,  103,  4, -0.5000 },
  { 253242,  104,  4, -0.5000 },
  { 253242,  105,  4, -0.5000 },
  { 253242,  255,  4, -0.5000 },
  { 253242,  257,  4, -0.5000 },
  { 253242,  263,  4, -0.5000 },
  { 253242,  264,  4, -0.5000 },
  { 253242,    4,  1,  1.0000 },
  { 253259, 2089,  3, -0.5000 },
  { 253259,  103,  4, -0.5000 },
  { 253259,  104,  4, -0.5000 },
  { 253259,  255,  4, -0.5000 },
  { 253259,  263,  4, -0.5000 },
  { 253259,  268,  4, -0.5000 },
  { 253259,  269,  4, -0.5000 },
  { 253259,   66,  4, -0.5000 },
  { 253259,   70,  4, -0.5000 },
  { 253259,    3,  2,  1.0000 },
  { 253263, 2603,  3, -0.5000 },
  { 253263,  103,  4, -0.5000 },
  { 253263,  104,  4, -0.5000 },
  { 253263,  105,  4, -0.5000 },
  { 253263,  255,  4, -0.5000 },
  { 253263,  257,  4, -0.5000 },
  { 253263,  263,  4, -0.5000 },
  { 253263,  264,  4, -0.5000 },
  { 253263,    4,  1,  1.0000 },
  { 253268, 2477,  3, -0.5000 },
  { 253268,  102,  4, -0.5000 },
  { 253268,  103,  4, -0.5000 },
  { 253268,  104,  4, -0.5000 },
  { 253268,  268,  4, -0.5000 },
  { 253268,  269,  4, -0.5000 },
  { 253268,   66,  4, -0.5000 },
  { 253268,   70,  4, -0.5000 },
  { 253268,  258,  4, -0.5000 },
  { 253268,  262,  4, -0.5000 },
  { 253268,  263,  4, -0.5000 },
  { 253285, 2477,  3, -0.5000 },
  { 253285,  102,  4, -0.5000 },
  { 253285,  103,  4, -0.5000 },
  { 253285,  104,  4, -0.5000 },
  { 253285,  268,  4, -0.5000 },
  { 253285,  269,  4, -0.5000 },
  { 253285,   66,  4, -0.5000 },
  { 253285,   70,  4, -0.5000 },
  { 253285,  258,  4, -0.5000 },
  { 253285,  262,  4, -0.5000 },
  { 253285,  263,  4, -0.5000 },
  { 253285,    4,  1,  1.0000 },
  { 253304,  400,  3, -0.5000 },
  { 253304,  250,  4, -0.5000 },
  { 253304,  581,  4, -0.5000 },
  { 253304,  102,  4, -0.5000 },
  { 253304,  104,  4, -0.5000 },
  { 253304,  105,  4, -0.5000 },
  { 253304,  268,  4, -0.5000 },
  { 253304,  270,  4, -0.5000 },
  { 253304,   65,  4, -0.5000 },
  { 253304,   66,  4, -0.5000 },
  { 253304,  262,  4, -0.5000 },
  { 253304,  264,  4, -0.5000 },
  { 253304,   73,  4, -0.5000 },
  { 253305,  400,  3, -0.5000 },
  { 253305,  250,  4, -0.5000 },
  { 253305,  581,  4, -0.5000 },
  { 253305,  102,  4, -0.5000 },
  { 253305,  104,  4, -0.5000 },
  { 253305,  105,  4, -0.5000 },
  { 253305,  268,  4, -0.5000 },
  { 253305,  270,  4, -0.5000 },
  { 253305,   65,  4, -0.5000 },
  { 253305,   66,  4, -0.5000 },
  { 253305,  262,  4, -0.5000 },
  { 253305,  264,  4, -0.5000 },
  { 253305,   73,  4, -0.5000 },
  { 253310,  400,  3, -0.5000 },
  { 253310,  250,  4, -0.5000 },
  { 253310,  581,  4, -0.5000 },
  { 253310,  102,  4, -0.5000 },
  { 253310,  104,  4, -0.5000 },
  { 253310,  105,  4, -0.5000 },
  { 253310,  268,  4, -0.5000 },
  { 253310,  270,  4, -0.5000 },
  { 253310,   65,  4, -0.5000 },
  { 253310,   66,  4, -0.5000 },
  { 253310,  262,  4, -0.5000 },
  { 253310,  264,  4, -0.5000 },
  { 253310,   73,  4, -0.5000 },
  { 253310,    4,  1,  1.0000 },
  { 253323,  400,  3, -0.5000 },
  { 253323,  250,  4, -0.5000 },
  { 253323,  581,  4, -0.5000 },
  { 253323,  102,  4, -0.5000 },
  { 253323,  104,  4, -0.5000 },
  { 253323,  105,  4, -0.5000 },
  { 253323,  253,  4, -0.5000 },
  { 253323,  254,  4, -0.5000 },
  { 253323,  268,  4, -0.5000 },
  { 253323,  270,  4, -0.5000 },
  { 253323,   65,  4, -0.5000 },
  { 253323,   66,  4, -0.5000 },
  { 253323,  262,  4, -0.5000 },
  { 253323,  264,  4, -0.5000 },
  { 253323,   73,  4, -0.5000 },
  { 253323,    4,  1,  1.0000 },
  { 253326,  400,  3, -0.5000 },
  { 253326,  250,  4, -0.5000 },
  { 253326,  581,  4, -0.5000 },
  { 253326,  102,  4, -0.5000 },
  { 253326,  104,  4, -0.5000 },
  { 253326,  105,  4, -0.5000 },
  { 253326,  253,  4, -0.5000 },
  { 253326,  254,  4, -0.5000 },
  { 253326,  268,  4, -0.5000 },
  { 253326,  270,  4, -0.5000 },
  { 253326,   65,  4, -0.5000 },
  { 253326,   66,  4, -0.5000 },
  { 253326,  262,  4, -0.5000 },
  { 253326,  264,  4, -0.5000 },
  { 253326,   73,  4, -0.5000 },
  { 253326,    4,  1,  1.0000 },
  { 253793,    4,  1,  1.0000 },
  { 255148,    4,  1,  1.0000 },
  { 255150,    4,  1,  1.0000 },
  { 255151,    4,  1,  1.0000 },
  { 255818, 2603,  3, -0.5000 },
  { 255818,  103,  4, -0.5000 },
  { 255818,  104,  4, -0.5000 },
  { 255818,  105,  4, -0.5000 },
  { 255818,  255,  4, -0.5000 },
  { 255818,  257,  4, -0.5000 },
  { 255818,  263,  4, -0.5000 },
  { 255818,  264,  4, -0.5000 },
  { 255818,    4,  1,  1.0000 },
  { 256067,    3,  1,  1.0000 },
  { 256815,  476,  3, -0.5000 },
  { 256815,  251,  4, -0.5000 },
  { 256815,  252,  4, -0.5000 },
  { 256815,  577,  4, -0.5000 },
  { 256815,  102,  4, -0.5000 },
  { 256815,  103,  4, -0.5000 },
  { 256815,  105,  4, -0.5000 },
  { 256815,  270,  4, -0.5000 },
  { 256815,  269,  4, -0.5000 },
  { 256815,   65,  4, -0.5000 },
  { 256815,   70,  4, -0.5000 },
  { 256815,   71,  4, -0.5000 },
  { 256815,   72,  4, -0.5000 },
  { 256819,  435,  3, -0.5000 },
  { 256819,  581,  4, -0.5000 },
  { 256819,  102,  4, -0.5000 },
  { 256819,  104,  4, -0.5000 },
  { 256819,  105,  4, -0.5000 },
  { 256819,  268,  4, -0.5000 },
  { 256819,  270,  4, -0.5000 },
  { 256819,  262,  4, -0.5000 },
  { 256819,  264,  4, -0.5000 },
  { 256819,    4,  1,  1.0000 },
  { 256822, 2477,  3, -0.5000 },
  { 256822,  102,  4, -0.5000 },
  { 256822,  103,  4, -0.5000 },
  { 256822,  104,  4, -0.5000 },
  { 256822,  268,  4, -0.5000 },
  { 256822,  269,  4, -0.5000 },
  { 256822,   66,  4, -0.5000 },
  { 256822,   70,  4, -0.5000 },
  { 256822,  258,  4, -0.5000 },
  { 256822,  262,  4, -0.5000 },
  { 256822,  263,  4, -0.5000 },
  { 256822,    4,  1,  1.0000 },
  { 256825, 4060,  3, -0.5000 },
  { 256825,  250,  4, -0.5000 },
  { 256825,   65,  4, -0.5000 },
  { 256825,   66,  4, -0.5000 },
  { 256825,   73,  4, -0.5000 },
  { 256827, 2607,  3, -0.5000 },
  { 256827,  103,  4, -0.5000 },
  { 256827,  104,  4, -0.5000 },
  { 256827,  105,  4, -0.5000 },
  { 256827,  257,  4, -0.5000 },
  { 256827,  263,  4, -0.5000 },
  { 256827,  264,  4, -0.5000 },
  { 258880,    4,  1,  1.0000 },
  { 258885,    4,  1,  1.0000 },
  { 258896,    3,  1,  1.0000 },
  { 258907,    4,  1,  1.0000 },
  { 258933,    4,  1,  1.0000 },
  { 258942,    4,  1,  1.0000 },
  { 258946,    4,  1,  1.0000 },
  { 258954,    4,  1,  1.0000 },
  { 258969,    4,  1,  1.0000 },
  { 258972,    4,  1,  1.0000 },
  { 258976,    4,  1,  1.0000 },
  { 258981,    4,  1,  1.0000 },
  { 258984,    4,  1,  1.0000 },
  { 258989,    4,  1,  1.0000 },
  { 258993,    4,  1,  1.0000 },
  { 259003,    4,  1,  1.0000 },
  { 259004,    4,  1,  1.0000 },
  { 259005,    4,  1,  1.0000 },
  { 259006,    4,  1,  1.0000 },
  { 259007,    4,  1,  1.0000 },
  { 259008,    4,  1,  1.0000 },
  { 259009,    4,  1,  1.0000 },
  { 262505,  400,  3, -0.5000 },
  { 262505,  250,  4, -0.5000 },
  { 262505,  581,  4, -0.5000 },
  { 262505,  102,  4, -0.5000 },
  { 262505,  104,  4, -0.5000 },
  { 262505,  105,  4, -0.5000 },
  { 262505,  268,  4, -0.5000 },
  { 262505,  270,  4, -0.5000 },
  { 262505,   65,  4, -0.5000 },
  { 262505,   66,  4, -0.5000 },
  { 262505,  262,  4, -0.5000 },
  { 262505,  264,  4, -0.5000 },
  { 262505,   73,  4, -0.5000 },
  { 262507, 4060,  3, -0.5000 },
  { 262507,  250,  4, -0.5000 },
  { 262507,   65,  4, -0.5000 },
  { 262507,   66,  4, -0.5000 },
  { 262507,   73,  4, -0.5000 },
  { 262507,    4,  1,  1.0000 },
  { 265000,    4,  1,  1.0000 },
  { 265003,    4,  1,  1.0000 },
  { 265025,    4,  1,  1.0000 },
  { 265027,    4,  1,  1.0000 },
  { 265034,    4,  1,  1.0000 },
  { 265036,    4,  1,  1.0000 },
  { 265057,    4,  1,  1.0000 },
  { 265066,    4,  1,  1.0000 },
  { 265071,    4,  1,  1.0000 },
  { 265072,    4,  1,  1.0000 },
  { 265073,    4,  1,  1.0000 },
  { 265078,    4,  1,  1.0000 },
  { 265079,    4,  1,  1.0000 },
  { 265082,    4,  1,  1.0000 },
  { 265083,    4,  1,  1.0000 },
  { 265162,    4,  1,  1.0000 },
  { 265167,    4,  1,  1.0000 },
  { 265170,    4,  1,  1.0000 },
  { 265174,    4,  1,  1.0000 },
  { 265176,    4,  1,  1.0000 },
  { 265230,    4,  1,  1.0000 },
  { 265233,    4,  1,  1.0000 },
  { 265234,    4,  1,  1.0000 },
  { 265236,    4,  1,  1.0000 },
  { 265238,    4,  1,  1.0000 },
  { 265240,    4,  1,  1.0000 },
  { 265255,    4,  1,  1.0000 },
  { 265266,    4,  1,  1.0000 },
  { 265270,    4,  1,  1.0000 },
  { 265274,    4,  1,  1.0000 },
  { 265276,    4,  1,  1.0000 },
  { 265278,    4,  1,  1.0000 },
  { 265282,    4,  1,  1.0000 },
  { 265310,    4,  1,  1.0000 },
  { 265317,    4,  1,  1.0000 },
  { 265318,    4,  1,  1.0000 },
  { 265327,    4,  1,  1.0000 },
  { 265331,    4,  1,  1.0000 },
  { 265353,    4,  1,  1.0000 },
  { 265408,    4,  1,  1.0000 },
  { 265413,    4,  1,  1.0000 },
  { 265414,    4,  1,  1.0000 },
  { 265416,    4,  1,  1.0000 },
  { 265419,    4,  1,  1.0000 },
  { 265421,    4,  1,  1.0000 },
  { 265950,    4,  1,  1.0000 },
  { 267177,    4,  1,  1.0000 },
  { 268035,    4,  1,  1.0000 },
  { 268191,    4,  1,  1.0000 },
  { 268501,    4,  1,  1.0000 },
  { 268553,    4,  1,  1.0000 },
  { 268603,    4,  1,  1.0000 },
  { 268605,    4,  1,  1.0000 },
  { 268608,    4,  1,  1.0000 },
  { 268617,    4,  1,  1.0000 },
  { 268620,    4,  1,  1.0000 },
  { 268624,    4,  1,  1.0000 },
  { 268771,    4,  1,  1.0000 },
  { 268855,    4,  1,  1.0000 },
  { 268888,    4,  1,  1.0000 },
  { 268900,    4,  1,  1.0000 },
  { 268906,    4,  1,  1.0000 },
  { 268912,    4,  1,  1.0000 },
  { 269009,    4,  1,  1.0000 },
  { 269066,    4,  1,  1.0000 },
  { 269853,    4,  1,  1.0000 },
  { 269884,    4,  1,  1.0000 },
  { 269886,    3,  1,  1.0000 },
  { 269891,    4,  1,  1.0000 },
  { 270668,    4,  1,  1.0000 },
  { 270679,    4,  1,  1.0000 },
  { 270809,    4,  1,  1.0000 },
  { 270921,    4,  1,  1.0000 },
  { 271190,    4,  1,  1.0000 },
  { 271547,    4,  1,  1.0000 },
  { 271631,    4,  1,  1.0000 },
  { 271681,    4,  1,  1.0000 },
  { 271683,    4,  1,  1.0000 },
  { 271705,    4,  1,  1.0000 },
  { 272258,    4,  1,  1.0000 },
  { 272275,    4,  1,  1.0000 },
  { 272817,    4,  1,  1.0000 },
  { 273153,    4,  1,  1.0000 },
  { 273684,    4,  1,  1.0000 },
  { 273830,    4,  1,  1.0000 },
  { 273936,    4,  1,  1.0000 },
  { 273941,    4,  1,  1.0000 },
  { 273954,    4,  1,  1.0000 },
  { 273975,    4,  1,  1.0000 },
  { 273987,    4,  1,  1.0000 },
  { 273991,    3,  1,  1.0000 },
  { 274071,    4,  1,  1.0000 },
  { 274072,    4,  1,  1.0000 },
  { 274145,    4,  1,  1.0000 },
  { 274219,    3,  1,  1.0000 },
  { 274225,    4,  1,  1.0000 },
  { 274233,    4,  1,  1.0000 },
  { 274239,    4,  1,  1.0000 },
  { 274429,    4,  1,  1.0000 },
  { 274477,    4,  1,  1.0000 },
  { 274484,    4,  1,  1.0000 },
  { 274790,    4,  1,  1.0000 },
  { 274835,    4,  1,  1.0000 },
  {      0,    0,  0,  0.0000 },
};
#define ARTIFACT_SIZE (41)

// Artifact base data, wow build 26491
static struct artifact_t __artifact_data[ARTIFACT_SIZE] = {
  {  2,  70 },
  {  3, 577 },
  {  4,  62 },
  { 11,  73 },
  { 12, 251 },
  { 13, 105 },
  { 15, 250 },
  { 16, 252 },
  { 17, 261 },
  { 34, 255 },
  { 35,  72 },
  { 36,  71 },
  { 37, 266 },
  { 38, 267 },
  { 39, 265 },
  { 40, 262 },
  { 41, 263 },
  { 42, 264 },
  { 43, 259 },
  { 44, 260 },
  { 45, 257 },
  { 46, 256 },
  { 47, 258 },
  { 48,  65 },
  { 49,  66 },
  { 50, 269 },
  { 51, 270 },
  { 52, 268 },
  { 53,  64 },
  { 54,  63 },
  { 55, 254 },
  { 56, 253 },
  { 57, 104 },
  { 58, 103 },
  { 59, 102 },
  { 60, 581 },
  { 74,  70 },
  { 80,  70 },
  { 81,  65 },
  { 82,  66 },
  {  0,   0 },
};

#define ARTIFACT_POWER_SIZE (908)

// Artifact power data, wow build 26491
static struct artifact_power_data_t __artifact_power_data[ARTIFACT_POWER_SIZE] = {
  { 1739,   0,  64,  0,   3, 250879, "Netherlight Fortification"          }, // Netherlight Fortification (id=250879, n_ranks=3)
  { 1770,   0,  64,  0,   3, 252088, "Light Speed"                        }, // Light Speed (id=252088, n_ranks=3)
  { 1771,   0,  64,  0,   3, 252091, "Master of Shadows"                  }, // Master of Shadows (id=252091, n_ranks=3)
  { 1774,   0,  64,  0,   3, 252191, "Murderous Intent"                   }, // Murderous Intent (id=252191, n_ranks=3)
  { 1775,   0,  64,  0,   3, 252207, "Refractive Shell"                   }, // Refractive Shell (id=252207, n_ranks=3)
  { 1777,   0,  64,  0,   3, 252799, "Shocklight"                         }, // Shocklight (id=252799, n_ranks=3)
  { 1778,   0,  64,  0,   3, 252875, "Shadowbind"                         }, // Shadowbind (id=252875, n_ranks=3)
  { 1779,   0,  64,  0,   3, 252888, "Chaotic Darkness"                   }, // Chaotic Darkness (id=252888, n_ranks=3)
  { 1780,   0,  64,  0,   3, 252906, "Torment the Weak"                   }, // Torment the Weak (id=252906, n_ranks=3)
  { 1781,   0,  64,  0,   3, 252922, "Dark Sorrows"                       }, // Dark Sorrows (id=252922, n_ranks=3)
  { 1782,   0,  64,  0,   3, 253070, "Secure in the Light"                }, // Secure in the Light (id=253070, n_ranks=3)
  { 1783,   0,  64,  0,   3, 253093, "Infusion of Light"                  }, // Infusion of Light (id=253093, n_ranks=3)
  { 1784,   0,  64,  0,   3, 253111, "Light's Embrace"                    }, // Light's Embrace (id=253111, n_ranks=3)
  {   40,   2,  18,  0,   0, 205273, "Wake of Ashes"                      }, // Wake of Ashes (id=205273, n_ranks=1)
  {   41,   2,  32,  4,   3, 186941, "Highlord's Judgment"                }, // Highlord's Judgment (id=186941, n_ranks=8)
  {   42,   2,  32,  5,   3, 184759, "Sharpened Edge"                     }, // Sharpened Edge (id=184759, n_ranks=8)
  {   43,   2,  32,  6,   3, 184843, "Righteous Blade"                    }, // Righteous Blade (id=184843, n_ranks=8)
  {   44,   2,  32, 11,   3, 186934, "Embrace the Light"                  }, // Embrace the Light (id=186934, n_ranks=8)
  {   47,   2,  32, 12,   3, 184778, "Deflection"                         }, // Deflection (id=184778, n_ranks=8)
  {   49,   2,   1,  1,   1, 186773, "Divine Tempest"                     }, // Divine Tempest (id=186773, n_ranks=1)
  {   50,   2,  32,  8,   3, 186927, "Deliver the Justice"                }, // Deliver the Justice (id=186927, n_ranks=8)
  {   51,   2,  32,  9,   3, 185368, "Might of the Templar"               }, // Might of the Templar (id=185368, n_ranks=8)
  {   52,   2,  32, 10,   3, 186944, "Protector of the Ashen Blade"       }, // Protector of the Ashen Blade (id=186944, n_ranks=8)
  {   53,   2,  32,  7,   3, 186945, "Wrath of the Ashbringer"            }, // Wrath of the Ashbringer (id=186945, n_ranks=8)
  {   54,   2,   1,  2,   1, 186788, "Echo of the Highlord"               }, // Echo of the Highlord (id=186788, n_ranks=1)
  {  350,   2,   0,  0,   1, 185086, "Endless Resolve"                    }, // Endless Resolve (id=185086, n_ranks=1)
  {  351,   2,   0,  0,   1, 182234, "Unbreakable Will"                   }, // Unbreakable Will (id=182234, n_ranks=1)
  {  352,   2,   0,  0,   1, 193058, "Healing Storm"                      }, // Healing Storm (id=193058, n_ranks=1)
  {  353,   2,   1,  3,   1, 179546, "Ashes to Ashes"                     }, // Ashes to Ashes (id=179546, n_ranks=1)
  { 1118,   2,   5,  0,  20, 207604, "Ashbringer's Light"                 }, // Ashbringer's Light (id=207604, n_ranks=20)
  { 1207,   2,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1275,   2,   0,  0,   1, 214081, "Blade of Light"                     }, // Blade of Light (id=214081, n_ranks=1)
  { 1561,   2,  32, 13,   4, 238062, "Righteous Verdict"                  }, // Righteous Verdict (id=238062, n_ranks=8)
  { 1562,   2,   0,  0,   1, 238098, "Blessing of the Ashbringer"         }, // Blessing of the Ashbringer (id=238098, n_ranks=1)
  { 1563,   2,   1,  0,   1, 238134, "Judge Unworthy"                     }, // Judge Unworthy (id=238134, n_ranks=1)
  { 1564,   2,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1647,   2,   2,  0,   1, 241147, "Ferocity of the Silver Hand"        }, // Ferocity of the Silver Hand (id=241147, n_ranks=1)
  { 1000,   3,  32,  4,   3, 201454, "Contained Fury"                     }, // Contained Fury (id=201454, n_ranks=8)
  { 1001,   3,  32,  5,   3, 201455, "Critical Chaos"                     }, // Critical Chaos (id=201455, n_ranks=8)
  { 1002,   3,  32,  6,   3, 201456, "Chaos Vision"                       }, // Chaos Vision (id=201456, n_ranks=8)
  { 1003,   3,  32,  7,   3, 201457, "Sharpened Glaives"                  }, // Sharpened Glaives (id=201457, n_ranks=8)
  { 1004,   3,  32,  8,   3, 201458, "Demon Rage"                         }, // Demon Rage (id=201458, n_ranks=8)
  { 1005,   3,  32, 11,   3, 201459, "Illidari Knowledge"                 }, // Illidari Knowledge (id=201459, n_ranks=8)
  { 1006,   3,  32,  9,   3, 201460, "Unleashed Demons"                   }, // Unleashed Demons (id=201460, n_ranks=8)
  { 1007,   3,  32, 12,   3, 201463, "Deceiver's Fury"                    }, // Deceiver's Fury (id=201463, n_ranks=8)
  { 1008,   3,  32, 10,   3, 201464, "Overwhelming Power"                 }, // Overwhelming Power (id=201464, n_ranks=8)
  { 1010,   3,  18,  0,   0, 201467, "Fury of the Illidari"               }, // Fury of the Illidari (id=201467, n_ranks=1)
  { 1011,   3,   0,  0,   1, 201468, "Feast on the Souls"                 }, // Feast on the Souls (id=201468, n_ranks=1)
  { 1012,   3,   0,  0,   1, 201469, "Demon Speed"                        }, // Demon Speed (id=201469, n_ranks=1)
  { 1013,   3,   0,  0,   1, 201470, "Balanced Blades"                    }, // Balanced Blades (id=201470, n_ranks=1)
  { 1014,   3,   1,  1,   1, 201471, "Inner Demons"                       }, // Inner Demons (id=201471, n_ranks=1)
  { 1015,   3,   1,  2,   1, 201472, "Rage of the Illidari"               }, // Rage of the Illidari (id=201472, n_ranks=1)
  { 1016,   3,   1,  3,   1, 201473, "Anguish of the Deceiver"            }, // Anguish of the Deceiver (id=201473, n_ranks=1)
  { 1190,   3,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1330,   3,   0,  0,   1, 214795, "Warglaives of Chaos"                }, // Warglaives of Chaos (id=214795, n_ranks=1)
  { 1362,   3,   5,  0,  20, 214907, "Chaos Burn"                         }, // Chaos Burn (id=214907, n_ranks=20)
  { 1493,   3,  32, 13,   4, 238045, "Wide Eyes"                          }, // Wide Eyes (id=238045, n_ranks=8)
  { 1494,   3,   0,  0,   1, 243188, "Bladedancer's Grace"                }, // Bladedancer's Grace (id=243188, n_ranks=1)
  { 1495,   3,   1,  0,   1, 238117, "Chaotic Onslaught"                  }, // Chaotic Onslaught (id=238117, n_ranks=1)
  { 1496,   3,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1630,   3,   2,  0,   1, 241090, "Illidari Ferocity"                  }, // Illidari Ferocity (id=241090, n_ranks=1)
  {   72,   4,  32,  4,   3, 187304, "Torrential Barrage"                 }, // Torrential Barrage (id=187304, n_ranks=8)
  {   73,   4,   1,  1,   1, 188006, "Arcane Rebound"                     }, // Arcane Rebound (id=188006, n_ranks=1)
  {   74,   4,  32,  5,   3, 187258, "Blasting Rod"                       }, // Blasting Rod (id=187258, n_ranks=8)
  {   75,   4,  32,  6,   3, 187321, "Aegwynn's Wrath"                    }, // Aegwynn's Wrath (id=187321, n_ranks=8)
  {   77,   4,  32,  8,   3, 187313, "Arcane Purification"                }, // Arcane Purification (id=187313, n_ranks=8)
  {   78,   4,   0,  0,   1, 187310, "Crackling Energy"                   }, // Crackling Energy (id=187310, n_ranks=1)
  {   79,   4,  32, 10,   3, 187287, "Aegwynn's Fury"                     }, // Aegwynn's Fury (id=187287, n_ranks=8)
  {   80,   4,   1,  3,   1, 215463, "Rule of Threes"                     }, // Rule of Threes (id=215463, n_ranks=1)
  {   81,   4,  32,  9,   3, 187276, "Ethereal Sensitivity"               }, // Ethereal Sensitivity (id=187276, n_ranks=8)
  {   82,   4,  32,  7,   3, 187264, "Aegwynn's Imperative"               }, // Aegwynn's Imperative (id=187264, n_ranks=8)
  {   83,   4,  32, 11,   3, 187301, "Everywhere At Once"                 }, // Everywhere At Once (id=187301, n_ranks=8)
  {   84,   4,  32, 12,   3, 210716, "Force Barrier"                      }, // Force Barrier (id=210716, n_ranks=8)
  {   86,   4,   1,  2,   1, 210725, "Touch of the Magi"                  }, // Touch of the Magi (id=210725, n_ranks=1)
  {   87,   4,   0,  0,   1, 187680, "Aegwynn's Ascendance"               }, // Aegwynn's Ascendance (id=187680, n_ranks=1)
  {  290,   4,  18,  0,   0, 224968, "Mark of Aluneth"                    }, // Mark of Aluneth (id=224968, n_ranks=1)
  { 1169,   4,   0,  0,   1, 210730, "Sloooow Down"                       }, // Sloooow Down (id=210730, n_ranks=1)
  { 1199,   4,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1339,   4,   0,  0,   1, 187318, "Might of the Guardians"             }, // Might of the Guardians (id=187318, n_ranks=1)
  { 1371,   4,   5,  0,  20, 214917, "Ancient Power"                      }, // Ancient Power (id=214917, n_ranks=20)
  { 1529,   4,  32, 13,   4, 238054, "Aegwynn's Intensity"                }, // Aegwynn's Intensity (id=238054, n_ranks=8)
  { 1530,   4,   0,  0,   1, 238090, "Aluneth's Avarice"                  }, // Aluneth's Avarice (id=238090, n_ranks=1)
  { 1531,   4,   1,  0,   1, 238126, "Time and Space"                     }, // Time and Space (id=238126, n_ranks=1)
  { 1532,   4,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1639,   4,   2,  0,   1, 241121, "Intensity of the Tirisgarde"        }, // Intensity of the Tirisgarde (id=241121, n_ranks=1)
  {   91,  11,  18,  0,   0, 203524, "Neltharion's Fury"                  }, // Neltharion's Fury (id=203524, n_ranks=1)
  {   92,  11,   1,  1,   1, 189059, "Scales of Earth"                    }, // Scales of Earth (id=189059, n_ranks=1)
  {   93,  11,   1,  2,   1, 203576, "Dragon Scales"                      }, // Dragon Scales (id=203576, n_ranks=1)
  {   94,  11,   1,  3,   1, 188778, "Might of the Vrykul"                }, // Might of the Vrykul (id=188778, n_ranks=1)
  {   95,  11,  32,  4,   3, 188635, "Vrykul Shield Training"             }, // Vrykul Shield Training (id=188635, n_ranks=8)
  {   96,  11,  32,  5,   3, 216272, "Rage of the Fallen"                 }, // Rage of the Fallen (id=216272, n_ranks=8)
  {   97,  11,   0,  0,   1, 188651, "Rumbling Voice"                     }, // Rumbling Voice (id=188651, n_ranks=1)
  {   98,  11,  32,  6,   3, 188683, "Will to Survive"                    }, // Will to Survive (id=188683, n_ranks=8)
  {   99,  11,  32,  7,   3, 203230, "Leaping Giants"                     }, // Leaping Giants (id=203230, n_ranks=8)
  {  100,  11,  32,  8,   3, 203225, "Dragon Skin"                        }, // Dragon Skin (id=203225, n_ranks=8)
  {  101,  11,  32,  9,   3, 203227, "Intolerance"                        }, // Intolerance (id=203227, n_ranks=8)
  {  102,  11,  32, 10,   3, 188639, "Shatter the Bones"                  }, // Shatter the Bones (id=188639, n_ranks=8)
  {  103,  11,   0,  0,   1, 203261, "Wall of Steel"                      }, // Wall of Steel (id=203261, n_ranks=1)
  {  104,  11,   0,  0,   1, 188672, "Reflective Plating"                 }, // Reflective Plating (id=188672, n_ranks=1)
  {  105,  11,  32, 11,   3, 188632, "Toughness"                          }, // Toughness (id=188632, n_ranks=8)
  {  106,  11,  32, 12,   3, 188644, "Thunder Crash"                      }, // Thunder Crash (id=188644, n_ranks=8)
  { 1222,  11,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1358,  11,   0,  0,   1, 188647, "Strength of the Earth Aspect"       }, // Strength of the Earth Aspect (id=188647, n_ranks=1)
  { 1395,  11,   5,  0,  20, 214939, "Unbreakable Bulwark"                }, // Unbreakable Bulwark (id=214939, n_ranks=20)
  { 1456,  11,   8,  0,   0, 226829, "Artificial Damage"                  }, // Artificial Damage (id=226829, n_ranks=1)
  { 1621,  11,  32, 13,   4, 238077, "Bastion of the Aspects"             }, // Bastion of the Aspects (id=238077, n_ranks=8)
  { 1622,  11,   0,  0,   1, 238113, "Gleaming Scales"                    }, // Gleaming Scales (id=238113, n_ranks=1)
  { 1623,  11,   1,  0,   1, 238149, "Neltharion's Thunder"               }, // Neltharion's Thunder (id=238149, n_ranks=1)
  { 1624,  11,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1716,  11,   2,  0,   1, 241270, "Protection of the Valarjar"         }, // Protection of the Valarjar (id=241270, n_ranks=1)
  {  108,  12,  32,  4,   3, 189080, "Cold as Ice"                        }, // Cold as Ice (id=189080, n_ranks=8)
  {  109,  12,  32,  6,   3, 189086, "Blast Radius"                       }, // Blast Radius (id=189086, n_ranks=8)
  {  110,  12,  32,  5,   3, 189092, "Ambidexterity"                      }, // Ambidexterity (id=189092, n_ranks=8)
  {  111,  12,  32, 10,   3, 189097, "Over-Powered"                       }, // Over-Powered (id=189097, n_ranks=8)
  {  113,  12,  32,  8,   3, 189144, "Nothing but the Boots"              }, // Nothing but the Boots (id=189144, n_ranks=8)
  {  114,  12,  32,  9,   3, 189147, "Bad to the Bone"                    }, // Bad to the Bone (id=189147, n_ranks=8)
  {  115,  12,  32, 11,   3, 189154, "Ice in Your Veins"                  }, // Ice in Your Veins (id=189154, n_ranks=8)
  {  117,  12,  32,  7,   3, 189164, "Dead of Winter"                     }, // Dead of Winter (id=189164, n_ranks=8)
  {  119,  12,   0,  0,   1, 189179, "Frozen Core"                        }, // Frozen Core (id=189179, n_ranks=1)
  {  120,  12,   0,  0,   1, 189180, "Mirror Ball"                        }, // Mirror Ball (id=189180, n_ranks=1)
  {  122,  12,  18,  1,   0, 189186, "Crystalline Swords"                 }, // Crystalline Swords (id=189186, n_ranks=1)
  {  123,  12,   1,  2,   1, 189185, "Hypothermia"                        }, // Hypothermia (id=189185, n_ranks=1)
  {  124,  12,   1,  3,   1, 190778, "Sindragosa's Fury"                  }, // Sindragosa's Fury (id=190778, n_ranks=1)
  { 1090,  12,  32, 12,   3, 204875, "Frozen Skin"                        }, // Frozen Skin (id=204875, n_ranks=8)
  { 1091,  12,   0,  0,   1, 205209, "Chill of the Grave"                 }, // Chill of the Grave (id=205209, n_ranks=1)
  { 1092,  12,   1,  3,   1, 189184, "Frozen Soul"                        }, // Frozen Soul (id=189184, n_ranks=1)
  { 1188,  12,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1332,  12,   0,  0,   1, 218931, "Blades of Frost"                    }, // Blades of Frost (id=218931, n_ranks=1)
  { 1360,  12,   5,  0,  20, 214904, "Soulbiter"                          }, // Soulbiter (id=214904, n_ranks=20)
  { 1485,  12,  32, 13,   4, 238043, "Runefrost"                          }, // Runefrost (id=238043, n_ranks=8)
  { 1486,  12,   0,  0,   1, 238079, "Runic Chills"                       }, // Runic Chills (id=238079, n_ranks=1)
  { 1487,  12,   1,  0,   1, 238115, "Thronebreaker"                      }, // Thronebreaker (id=238115, n_ranks=1)
  { 1488,  12,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1628,  12,   2,  0,   1, 241047, "Ferocity of the Ebon Blade"         }, // Ferocity of the Ebon Blade (id=241047, n_ranks=1)
  {  125,  13,  18,  0,   0, 208253, "Essence of G'Hanir"                 }, // Essence of G'Hanir (id=208253, n_ranks=1)
  {  126,  13,   1,  1,   1, 189849, "Dreamwalker"                        }, // Dreamwalker (id=189849, n_ranks=1)
  {  127,  13,   1,  2,   1, 189857, "Tranquil Mind"                      }, // Tranquil Mind (id=189857, n_ranks=1)
  {  128,  13,   1,  3,   1, 189870, "Power of the Archdruid"             }, // Power of the Archdruid (id=189870, n_ranks=1)
  {  129,  13,   0,  0,   1, 189787, "Nature's Essence"                   }, // Nature's Essence (id=189787, n_ranks=1)
  {  130,  13,  32,  4,   3, 189772, "Knowledge of the Ancients"          }, // Knowledge of the Ancients (id=189772, n_ranks=8)
  {  131,  13,  32,  5,   3, 189768, "Seeds of the World Tree"            }, // Seeds of the World Tree (id=189768, n_ranks=8)
  {  132,  13,  32,  6,   3, 189760, "Essence of Nordrassil"              }, // Essence of Nordrassil (id=189760, n_ranks=8)
  {  133,  13,  32,  7,   3, 189757, "Infusion of Nature"                 }, // Infusion of Nature (id=189757, n_ranks=8)
  {  134,  13,  32,  8,   3, 189754, "Armor of the Ancients"              }, // Armor of the Ancients (id=189754, n_ranks=8)
  {  135,  13,  32,  9,   3, 189749, "Natural Mending"                    }, // Natural Mending (id=189749, n_ranks=8)
  {  136,  13,  32, 10,   3, 189744, "Blessing of the World Tree"         }, // Blessing of the World Tree (id=189744, n_ranks=8)
  {  137,  13,  32, 11,   3, 186396, "Persistence"                        }, // Persistence (id=186396, n_ranks=8)
  {  138,  13,   0,  0,   1, 186393, "Blooms of G'Hanir"                  }, // Blooms of G'Hanir (id=186393, n_ranks=1)
  {  139,  13,   0,  0,   1, 186372, "Mark of Shifting"                   }, // Mark of Shifting (id=186372, n_ranks=1)
  {  140,  13,  32, 12,   3, 186320, "Grovewalker"                        }, // Grovewalker (id=186320, n_ranks=8)
  { 1195,  13,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1254,  13,   8,  0,   0, 213428, "Artificial Damage"                  }, // Artificial Damage (id=213428, n_ranks=1)
  { 1335,  13,   0,  0,   1, 222644, "Nature's Vigor"                     }, // Nature's Vigor (id=222644, n_ranks=1)
  { 1367,  13,   5,  0,  20, 214913, "G'Hanir's Bloom"                    }, // G'Hanir's Bloom (id=214913, n_ranks=20)
  { 1513,  13,  32, 13,   4, 238050, "Eternal Restoration"                }, // Eternal Restoration (id=238050, n_ranks=8)
  { 1514,  13,   0,  0,   1, 238086, "Joy of Spring"                      }, // Joy of Spring (id=238086, n_ranks=1)
  { 1515,  13,   1,  0,   1, 238122, "Deep Rooted"                        }, // Deep Rooted (id=238122, n_ranks=1)
  { 1516,  13,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1635,  13,   2,  0,   1, 241102, "Grace of the Cenarion Circle"       }, // Grace of the Cenarion Circle (id=241102, n_ranks=1)
  {  272,  15,  32,  4,   3, 192450, "Iron Heart"                         }, // Iron Heart (id=192450, n_ranks=8)
  {  273,  15,  32,  5,   3, 192453, "Meat Shield"                        }, // Meat Shield (id=192453, n_ranks=8)
  {  274,  15,  32,  6,   3, 192447, "Grim Perseverance"                  }, // Grim Perseverance (id=192447, n_ranks=8)
  {  275,  15,  32,  7,   3, 192457, "Veinrender"                         }, // Veinrender (id=192457, n_ranks=8)
  {  276,  15,  32,  8,   3, 192460, "Coagulopathy"                       }, // Coagulopathy (id=192460, n_ranks=8)
  {  277,  15,  32,  9,   3, 192542, "Vampiric Fangs"                     }, // Vampiric Fangs (id=192542, n_ranks=8)
  {  278,  15,  32, 10,   3, 192464, "All-Consuming Rot"                  }, // All-Consuming Rot (id=192464, n_ranks=8)
  {  279,  15,  32, 11,   3, 192514, "Dance of Darkness"                  }, // Dance of Darkness (id=192514, n_ranks=8)
  {  280,  15,  32, 12,   3, 192538, "Bonebreaker"                        }, // Bonebreaker (id=192538, n_ranks=8)
  {  281,  15,   0,  0,   1, 192557, "Rattling Bones"                     }, // Rattling Bones (id=192557, n_ranks=1)
  {  282,  15,   0,  0,   1, 192548, "Blood Feast"                        }, // Blood Feast (id=192548, n_ranks=1)
  {  283,  15,   0,  0,   1, 192570, "Mouth of Hell"                      }, // Mouth of Hell (id=192570, n_ranks=1)
  {  284,  15,   1,  1,   1, 192558, "Skeletal Shattering"                }, // Skeletal Shattering (id=192558, n_ranks=1)
  {  285,  15,   1,  2,   1, 192567, "Unending Thirst"                    }, // Unending Thirst (id=192567, n_ranks=1)
  {  286,  15,   1,  3,   1, 193213, "Umbilicus Eternus"                  }, // Umbilicus Eternus (id=193213, n_ranks=1)
  {  289,  15,  18,  0,   0, 205223, "Consumption"                        }, // Consumption (id=205223, n_ranks=1)
  { 1187,  15,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1331,  15,   0,  0,   1, 221775, "Sanguinary Affinity"                }, // Sanguinary Affinity (id=221775, n_ranks=1)
  { 1359,  15,   5,  0,  20, 214903, "The Hungering Maw"                  }, // The Hungering Maw (id=214903, n_ranks=20)
  { 1451,  15,   8,  0,   0, 226829, "Artificial Damage"                  }, // Artificial Damage (id=226829, n_ranks=1)
  { 1481,  15,  32, 13,   4, 238042, "Carrion Feast"                      }, // Carrion Feast (id=238042, n_ranks=8)
  { 1482,  15,   0,  0,   1, 238078, "Vampiric Aura"                      }, // Vampiric Aura (id=238078, n_ranks=1)
  { 1483,  15,   1,  0,   1, 238114, "Souldrinker"                        }, // Souldrinker (id=238114, n_ranks=1)
  { 1484,  15,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1627,  15,   2,  0,   1, 241018, "Fortitude of the Ebon Blade"        }, // Fortitude of the Ebon Blade (id=241018, n_ranks=1)
  {  149,  16,  18,  0,   0, 220143, "Apocalypse"                         }, // Apocalypse (id=220143, n_ranks=1)
  {  150,  16,   1,  1,   1, 191760, "The Shambler"                       }, // The Shambler (id=191760, n_ranks=1)
  {  151,  16,   1,  2,   1, 191741, "Double Doom"                        }, // Double Doom (id=191741, n_ranks=1)
  {  152,  16,   1,  3,   1, 191747, "Scourge of Worlds"                  }, // Scourge of Worlds (id=191747, n_ranks=1)
  {  153,  16,   0,  0,   1, 191637, "Portal to the Underworld"           }, // Portal to the Underworld (id=191637, n_ranks=1)
  {  154,  16,   0,  0,   1, 191731, "Armies of the Damned"               }, // Armies of the Damned (id=191731, n_ranks=1)
  {  156,  16,  32,  4,   3, 191419, "Deadliest Coil"                     }, // Deadliest Coil (id=191419, n_ranks=8)
  {  157,  16,  32,  5,   3, 191442, "Rotten Touch"                       }, // Rotten Touch (id=191442, n_ranks=8)
  {  158,  16,  32,  6,   3, 191485, "Plaguebearer"                       }, // Plaguebearer (id=191485, n_ranks=8)
  {  262,  16,  32, 11,   3, 191565, "Deadly Durability"                  }, // Deadly Durability (id=191565, n_ranks=8)
  {  263,  16,   0,  0,   1, 191721, "Gravitational Pull"                 }, // Gravitational Pull (id=191721, n_ranks=1)
  {  264,  16,  32,  7,   3, 191592, "Runic Tattoos"                      }, // Runic Tattoos (id=191592, n_ranks=8)
  {  265,  16,  32,  8,   3, 191494, "Scourge the Unbeliever"             }, // Scourge the Unbeliever (id=191494, n_ranks=8)
  {  266,  16,  32,  9,   3, 191488, "The Darkest Crusade"                }, // The Darkest Crusade (id=191488, n_ranks=8)
  {  267,  16,  32, 12,   3, 191584, "Unholy Endurance"                   }, // Unholy Endurance (id=191584, n_ranks=8)
  { 1119,  16,  32, 10,   3, 208598, "Eternal Agony"                      }, // Eternal Agony (id=208598, n_ranks=8)
  { 1189,  16,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1333,  16,   0,  0,   1, 218280, "Feast of Souls"                     }, // Feast of Souls (id=218280, n_ranks=1)
  { 1361,  16,   5,  0,  20, 214906, "Fleshsearer"                        }, // Fleshsearer (id=214906, n_ranks=20)
  { 1489,  16,  32, 13,   4, 238044, "Lash of Shadows"                    }, // Lash of Shadows (id=238044, n_ranks=8)
  { 1490,  16,   0,  0,   1, 238080, "Death's Harbinger"                  }, // Death's Harbinger (id=238080, n_ranks=1)
  { 1491,  16,   1,  0,   1, 238116, "Black Claws"                        }, // Black Claws (id=238116, n_ranks=1)
  { 1492,  16,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1629,  16,   2,  0,   1, 241050, "Cunning of the Ebon Blade"          }, // Cunning of the Ebon Blade (id=241050, n_ranks=1)
  {  851,  17,  18,  0,   0, 209782, "Goremaw's Bite"                     }, // Goremaw's Bite (id=209782, n_ranks=1)
  {  852,  17,  32,  4,   3, 197231, "The Quiet Knife"                    }, // The Quiet Knife (id=197231, n_ranks=8)
  {  853,  17,  32,  5,   3, 197233, "Demon's Kiss"                       }, // Demon's Kiss (id=197233, n_ranks=8)
  {  854,  17,  32,  6,   3, 197234, "Gutripper"                          }, // Gutripper (id=197234, n_ranks=8)
  {  855,  17,  32,  7,   3, 197235, "Precision Strike"                   }, // Precision Strike (id=197235, n_ranks=8)
  {  856,  17,  32,  8,   3, 197369, "Fortune's Bite"                     }, // Fortune's Bite (id=197369, n_ranks=8)
  {  857,  17,  32,  9,   3, 197386, "Soul Shadows"                       }, // Soul Shadows (id=197386, n_ranks=8)
  {  858,  17,  32, 10,   3, 197239, "Energetic Stabbing"                 }, // Energetic Stabbing (id=197239, n_ranks=8)
  {  859,  17,  32, 11,   3, 197241, "Catlike Reflexes"                   }, // Catlike Reflexes (id=197241, n_ranks=8)
  {  860,  17,  32, 12,   3, 197244, "Ghost Armor"                        }, // Ghost Armor (id=197244, n_ranks=8)
  {  861,  17,   0,  0,   1, 197610, "Second Shuriken"                    }, // Second Shuriken (id=197610, n_ranks=1)
  {  862,  17,   0,  0,   1, 197256, "Flickering Shadows"                 }, // Flickering Shadows (id=197256, n_ranks=1)
  {  863,  17,   0,  0,   1, 197604, "Embrace of Darkness"                }, // Embrace of Darkness (id=197604, n_ranks=1)
  {  864,  17,   1,  1,   1, 209835, "Akaari's Soul"                      }, // Akaari's Soul (id=209835, n_ranks=1)
  {  865,  17,   1,  2,   1, 209781, "Shadow Nova"                        }, // Shadow Nova (id=209781, n_ranks=1)
  {  866,  17,   1,  3,   1, 197406, "Finality"                           }, // Finality (id=197406, n_ranks=1)
  { 1213,  17,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1349,  17,   0,  0,   1, 221856, "Shadow Fangs"                       }, // Shadow Fangs (id=221856, n_ranks=1)
  { 1386,  17,   5,  0,  20, 214930, "Legionblade"                        }, // Legionblade (id=214930, n_ranks=20)
  { 1585,  17,  32, 13,   4, 238068, "Weak Point"                         }, // Weak Point (id=238068, n_ranks=8)
  { 1586,  17,   0,  0,   1, 242707, "Shadow's Whisper"                   }, // Shadow's Whisper (id=242707, n_ranks=1)
  { 1587,  17,   1,  0,   1, 238140, "Feeding Frenzy"                     }, // Feeding Frenzy (id=238140, n_ranks=1)
  { 1588,  17,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1653,  17,   2,  0,   1, 241154, "Shadows of the Uncrowned"           }, // Shadows of the Uncrowned (id=241154, n_ranks=1)
  { 1068,  34,  18,  0,   0, 203415, "Fury of the Eagle"                  }, // Fury of the Eagle (id=203415, n_ranks=1)
  { 1070,  34,  32,  4,   3, 203566, "Sharpened Fang"                     }, // Sharpened Fang (id=203566, n_ranks=8)
  { 1071,  34,  32,  5,   3, 203577, "My Beloved Monster"                 }, // My Beloved Monster (id=203577, n_ranks=8)
  { 1072,  34,  32,  6,   3, 203578, "Lacerating Talons"                  }, // Lacerating Talons (id=203578, n_ranks=8)
  { 1073,  34,  32,  7,   3, 203638, "Raptor's Cry"                       }, // Raptor's Cry (id=203638, n_ranks=8)
  { 1074,  34,  32,  8,   3, 203669, "Fluffy, Go"                         }, // Fluffy, Go (id=203669, n_ranks=8)
  { 1075,  34,  32,  9,   3, 203670, "Explosive Force"                    }, // Explosive Force (id=203670, n_ranks=8)
  { 1076,  34,  32, 10,   3, 203673, "Hellcarver"                         }, // Hellcarver (id=203673, n_ranks=8)
  { 1077,  34,  32, 11,   3, 224764, "Bird of Prey"                       }, // Bird of Prey (id=224764, n_ranks=8)
  { 1078,  34,  32, 12,   3, 203749, "Hunter's Bounty"                    }, // Hunter's Bounty (id=203749, n_ranks=8)
  { 1079,  34,   0,  0,   1, 225092, "Embrace of the Aspects"             }, // Embrace of the Aspects (id=225092, n_ranks=1)
  { 1080,  34,   0,  0,   1, 203752, "Hunter's Guile"                     }, // Hunter's Guile (id=203752, n_ranks=1)
  { 1081,  34,   0,  0,   1, 203754, "Terms of Engagement"                }, // Terms of Engagement (id=203754, n_ranks=1)
  { 1082,  34,   1,  1,   1, 203755, "Aspect of the Skylord"              }, // Aspect of the Skylord (id=203755, n_ranks=1)
  { 1083,  34,   1,  2,   1, 203563, "Talon Strike"                       }, // Talon Strike (id=203563, n_ranks=1)
  { 1084,  34,   1,  3,   1, 203757, "Eagle's Bite"                       }, // Eagle's Bite (id=203757, n_ranks=1)
  { 1198,  34,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1338,  34,   0,  0,   1, 221773, "Iron Talons"                        }, // Iron Talons (id=221773, n_ranks=1)
  { 1370,  34,   5,  0,  20, 214916, "Voice of the Wild Gods"             }, // Voice of the Wild Gods (id=214916, n_ranks=20)
  { 1525,  34,  32, 13,   4, 238053, "Jaws of the Mongoose"               }, // Jaws of the Mongoose (id=238053, n_ranks=8)
  { 1526,  34,   0,  0,   1, 238089, "Talon Bond"                         }, // Talon Bond (id=238089, n_ranks=1)
  { 1527,  34,   1,  0,   1, 238125, "Echoes of Ohn'ara"                  }, // Echoes of Ohn'ara (id=238125, n_ranks=1)
  { 1528,  34,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1638,  34,   2,  0,   1, 241115, "Ferocity of the Unseen Path"        }, // Ferocity of the Unseen Path (id=241115, n_ranks=1)
  {  980,  35,   1,  1,   1, 200875, "Juggernaut"                         }, // Juggernaut (id=200875, n_ranks=1)
  {  981,  35,   1,  2,   1, 200845, "Rage of the Valarjar"               }, // Rage of the Valarjar (id=200845, n_ranks=1)
  {  982,  35,   1,  3,   1, 200872, "Odyn's Champion"                    }, // Odyn's Champion (id=200872, n_ranks=1)
  {  984,  35,  18,  0,   0, 205545, "Odyn's Fury"                        }, // Odyn's Fury (id=205545, n_ranks=1)
  {  985,  35,   0,  0,   1, 200871, "Focus In Chaos"                     }, // Focus In Chaos (id=200871, n_ranks=1)
  {  986,  35,   0,  0,   1, 200870, "Helya's Wrath"                      }, // Helya's Wrath (id=200870, n_ranks=1)
  {  987,  35,   0,  0,   1, 200863, "Sense Death"                        }, // Sense Death (id=200863, n_ranks=1)
  {  988,  35,  32,  4,   3, 200846, "Deathdealer"                        }, // Deathdealer (id=200846, n_ranks=8)
  {  989,  35,  32,  5,   3, 216273, "Wild Slashes"                       }, // Wild Slashes (id=216273, n_ranks=8)
  {  990,  35,  32,  6,   3, 200849, "Wrath and Fury"                     }, // Wrath and Fury (id=200849, n_ranks=8)
  {  991,  35,  32,  7,   3, 200853, "Unstoppable"                        }, // Unstoppable (id=200853, n_ranks=8)
  {  992,  35,  32,  8,   3, 200856, "Uncontrolled Rage"                  }, // Uncontrolled Rage (id=200856, n_ranks=8)
  {  993,  35,  32, 11,   3, 200857, "Battle Scars"                       }, // Battle Scars (id=200857, n_ranks=8)
  {  994,  35,  32, 12,   3, 200859, "Bloodcraze"                         }, // Bloodcraze (id=200859, n_ranks=8)
  {  995,  35,  32,  9,   3, 200860, "Unrivaled Strength"                 }, // Unrivaled Strength (id=200860, n_ranks=8)
  {  996,  35,  32, 10,   3, 200861, "Raging Berserker"                   }, // Raging Berserker (id=200861, n_ranks=8)
  { 1221,  35,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1357,  35,   0,  0,   1, 200847, "Thirst for Battle"                  }, // Thirst for Battle (id=200847, n_ranks=1)
  { 1394,  35,   5,  0,  20, 214938, "Titanic Power"                      }, // Titanic Power (id=214938, n_ranks=20)
  { 1617,  35,  32, 13,   4, 238076, "Pulse of Battle"                    }, // Pulse of Battle (id=238076, n_ranks=8)
  { 1618,  35,   0,  0,   1, 238112, "Oathblood"                          }, // Oathblood (id=238112, n_ranks=1)
  { 1619,  35,   1,  0,   1, 238148, "Death and Glory"                    }, // Death and Glory (id=238148, n_ranks=1)
  { 1620,  35,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1715,  35,   2,  0,   1, 241269, "Fury of the Valarjar"               }, // Fury of the Valarjar (id=241269, n_ranks=1)
  { 1136,  36,  18,  0,   0, 209577, "Warbreaker"                         }, // Warbreaker (id=209577, n_ranks=1)
  { 1137,  36,   1,  1,   1, 248580, "Shattered Defenses"                 }, // Shattered Defenses (id=248580, n_ranks=1)
  { 1138,  36,   1,  2,   1, 209573, "Void Cleave"                        }, // Void Cleave (id=209573, n_ranks=1)
  { 1139,  36,   1,  3,   1, 209566, "Corrupted Blood of Zakajz"          }, // Corrupted Blood of Zakajz (id=209566, n_ranks=1)
  { 1140,  36,   0,  0,   1, 209559, "Defensive Measures"                 }, // Defensive Measures (id=209559, n_ranks=1)
  { 1141,  36,   0,  0,   1, 209554, "Focus in Battle"                    }, // Focus in Battle (id=209554, n_ranks=1)
  { 1142,  36,   0,  0,   1, 209548, "Will of the First King"             }, // Will of the First King (id=209548, n_ranks=1)
  { 1143,  36,  32,  4,   3, 209459, "Unending Rage"                      }, // Unending Rage (id=209459, n_ranks=8)
  { 1144,  36,  32,  5,   3, 209462, "One Against Many"                   }, // One Against Many (id=209462, n_ranks=8)
  { 1145,  36,  32,  6,   3, 209472, "Crushing Blows"                     }, // Crushing Blows (id=209472, n_ranks=8)
  { 1146,  36,  32,  7,   3, 216274, "Many Will Fall"                     }, // Many Will Fall (id=216274, n_ranks=8)
  { 1147,  36,  32,  8,   3, 209481, "Deathblow"                          }, // Deathblow (id=209481, n_ranks=8)
  { 1148,  36,  32, 11,   3, 209483, "Tactical Advance"                   }, // Tactical Advance (id=209483, n_ranks=8)
  { 1149,  36,  32,  9,   3, 248579, "Precise Strikes"                    }, // Precise Strikes (id=248579, n_ranks=8)
  { 1150,  36,  32, 10,   3, 209494, "Exploit the Weakness"               }, // Exploit the Weakness (id=209494, n_ranks=8)
  { 1151,  36,  32, 12,   3, 209541, "Touch of Zakajz"                    }, // Touch of Zakajz (id=209541, n_ranks=8)
  { 1220,  36,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1356,  36,   0,  0,   1, 209480, "Thoradin's Might"                   }, // Thoradin's Might (id=209480, n_ranks=1)
  { 1393,  36,   5,  0,  20, 214937, "Unbreakable Steel"                  }, // Unbreakable Steel (id=214937, n_ranks=20)
  { 1613,  36,  32, 13,   4, 238075, "Storm of Swords"                    }, // Storm of Swords (id=238075, n_ranks=8)
  { 1614,  36,   0,  0,   1, 238111, "Soul of the Slaughter"              }, // Soul of the Slaughter (id=238111, n_ranks=1)
  { 1615,  36,   1,  0,   1, 238147, "Executioner's Precision"            }, // Executioner's Precision (id=238147, n_ranks=1)
  { 1616,  36,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1714,  36,   2,  0,   1, 241264, "Arms of the Valarjar"               }, // Arms of the Valarjar (id=241264, n_ranks=1)
  { 1170,  37,  18,  0,   0, 211714, "Thal'kiel's Consumption"            }, // Thal'kiel's Consumption (id=211714, n_ranks=1)
  { 1171,  37,  32,  4,   3, 211108, "Summoner's Prowess"                 }, // Summoner's Prowess (id=211108, n_ranks=8)
  { 1172,  37,  32,  5,   3, 211126, "Legionwrath"                        }, // Legionwrath (id=211126, n_ranks=8)
  { 1173,  37,  32,  6,   3, 211106, "The Doom of Azeroth"                }, // The Doom of Azeroth (id=211106, n_ranks=8)
  { 1174,  37,  32,  7,   3, 211123, "Sharpened Dreadfangs"               }, // Sharpened Dreadfangs (id=211123, n_ranks=8)
  { 1175,  37,  32,  8,   3, 211105, "Dirty Hands"                        }, // Dirty Hands (id=211105, n_ranks=8)
  { 1176,  37,  32,  9,   3, 211119, "Infernal Furnace"                   }, // Infernal Furnace (id=211119, n_ranks=8)
  { 1177,  37,  32, 10,   3, 211099, "Maw of Shadows"                     }, // Maw of Shadows (id=211099, n_ranks=8)
  { 1178,  37,  32, 11,   3, 211144, "Open Link"                          }, // Open Link (id=211144, n_ranks=8)
  { 1179,  37,  32, 12,   3, 211131, "Firm Resolve"                       }, // Firm Resolve (id=211131, n_ranks=8)
  { 1180,  37,   0,  0,   1, 211158, "Imp-erator"                         }, // Imp-erator (id=211158, n_ranks=1)
  { 1181,  37,   0,  0,   1, 218567, "Soul Skin"                          }, // Soul Skin (id=218567, n_ranks=1)
  { 1182,  37,   0,  0,   1, 218572, "Doom, Doubled"                      }, // Doom, Doubled (id=218572, n_ranks=1)
  { 1183,  37,   1,  1,   1, 211219, "The Expendables"                    }, // The Expendables (id=211219, n_ranks=1)
  { 1184,  37,   1,  2,   1, 211720, "Thal'kiel's Discord"                }, // Thal'kiel's Discord (id=211720, n_ranks=1)
  { 1185,  37,   1,  3,   1, 211530, "Stolen Power"                       }, // Stolen Power (id=211530, n_ranks=1)
  { 1218,  37,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1354,  37,   0,  0,   1, 221882, "Breath of Thal'kiel"                }, // Breath of Thal'kiel (id=221882, n_ranks=1)
  { 1391,  37,   5,  0,  20, 214935, "Thal'kiel's Lingering Power"        }, // Thal'kiel's Lingering Power (id=214935, n_ranks=20)
  { 1605,  37,  32, 13,   4, 238073, "Left Hand of Darkness"              }, // Left Hand of Darkness (id=238073, n_ranks=8)
  { 1606,  37,   0,  0,   1, 238109, "Jaws of Shadow"                     }, // Jaws of Shadow (id=238109, n_ranks=1)
  { 1607,  37,   1,  0,   1, 238145, "Thal'kiel's Ascendance"             }, // Thal'kiel's Ascendance (id=238145, n_ranks=1)
  { 1608,  37,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1712,  37,   2,  0,   1, 241252, "Swarms of the Black Harvest"        }, // Swarms of the Black Harvest (id=241252, n_ranks=1)
  {  803,  38,  18,  0,   0, 196586, "Dimensional Rift"                   }, // Dimensional Rift (id=196586, n_ranks=1)
  {  804,  38,  32,  4,   3, 196211, "Master of Disaster"                 }, // Master of Disaster (id=196211, n_ranks=8)
  {  805,  38,  32,  5,   3, 196217, "Chaotic Instability"                }, // Chaotic Instability (id=196217, n_ranks=8)
  {  806,  38,  32,  6,   3, 196222, "Fire and the Flames"                }, // Fire and the Flames (id=196222, n_ranks=8)
  {  807,  38,  32,  7,   3, 196227, "Residual Flames"                    }, // Residual Flames (id=196227, n_ranks=8)
  {  808,  38,  32,  8,   3, 196236, "Soulsnatcher"                       }, // Soulsnatcher (id=196236, n_ranks=8)
  {  809,  38,  32,  9,   3, 196432, "Burning Hunger"                     }, // Burning Hunger (id=196432, n_ranks=8)
  {  810,  38,  32, 10,   3, 196258, "Fire From the Sky"                  }, // Fire From the Sky (id=196258, n_ranks=8)
  {  811,  38,  32, 11,   3, 196301, "Devourer of Life"                   }, // Devourer of Life (id=196301, n_ranks=8)
  {  812,  38,  32, 12,   3, 196305, "Eternal Struggle"                   }, // Eternal Struggle (id=196305, n_ranks=8)
  {  813,  38,   0,  0,   1, 196675, "Planeswalker"                       }, // Planeswalker (id=196675, n_ranks=1)
  {  814,  38,   0,  0,   1, 215223, "Demonic Durability"                 }, // Demonic Durability (id=215223, n_ranks=1)
  {  815,  38,   0,  0,   1, 215273, "Impish Incineration"                }, // Impish Incineration (id=215273, n_ranks=1)
  {  816,  38,   1,  1,   1, 219415, "Dimension Ripper"                   }, // Dimension Ripper (id=219415, n_ranks=1)
  {  817,  38,   1,  2,   1, 219195, "Conflagration of Chaos"             }, // Conflagration of Chaos (id=219195, n_ranks=1)
  {  818,  38,   1,  3,   1, 224103, "Lord of Flames"                     }, // Lord of Flames (id=224103, n_ranks=1)
  { 1219,  38,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1355,  38,   0,  0,   1, 215183, "Flames of the Pit"                  }, // Flames of the Pit (id=215183, n_ranks=1)
  { 1392,  38,   5,  0,  20, 214936, "Stolen Power"                       }, // Stolen Power (id=214936, n_ranks=20)
  { 1609,  38,  32, 13,   4, 238074, "Flames of Sargeras"                 }, // Flames of Sargeras (id=238074, n_ranks=8)
  { 1610,  38,   0,  0,   1, 238110, "Cry Havoc"                          }, // Cry Havoc (id=238110, n_ranks=1)
  { 1611,  38,   1,  0,   1, 238146, "Flame Rift"                         }, // Flame Rift (id=238146, n_ranks=1)
  { 1612,  38,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1713,  38,   2,  0,   1, 241253, "Flames of the Black Harvest"        }, // Flames of the Black Harvest (id=241253, n_ranks=1)
  {  915,  39,  32,  4,   3, 199111, "Inimitable Agony"                   }, // Inimitable Agony (id=199111, n_ranks=8)
  {  916,  39,  32,  5,   3, 199112, "Hideous Corruption"                 }, // Hideous Corruption (id=199112, n_ranks=8)
  {  917,  39,  32,  6,   3, 199120, "Drained to a Husk"                  }, // Drained to a Husk (id=199120, n_ranks=8)
  {  918,  39,  32,  7,   3, 199152, "Inherently Unstable"                }, // Inherently Unstable (id=199152, n_ranks=8)
  {  919,  39,  32,  8,   3, 199153, "Seeds of Doom"                      }, // Seeds of Doom (id=199153, n_ranks=8)
  {  920,  39,  32,  9,   3, 199158, "Perdition"                          }, // Perdition (id=199158, n_ranks=8)
  {  921,  39,  32, 10,   3, 199163, "Shadowy Incantations"               }, // Shadowy Incantations (id=199163, n_ranks=8)
  {  922,  39,  32, 11,   3, 199212, "Shadows of the Flesh"               }, // Shadows of the Flesh (id=199212, n_ranks=8)
  {  923,  39,  32, 12,   3, 199214, "Long Dark Night of the Soul"        }, // Long Dark Night of the Soul (id=199214, n_ranks=8)
  {  924,  39,   0,  0,   1, 199220, "Sweet Souls"                        }, // Sweet Souls (id=199220, n_ranks=1)
  {  925,  39,   0,  0,   1, 199257, "Fatal Echoes"                       }, // Fatal Echoes (id=199257, n_ranks=1)
  {  926,  39,   0,  0,   1, 199282, "Compounding Horror"                 }, // Compounding Horror (id=199282, n_ranks=1)
  {  927,  39,   1,  0,   1, 199471, "Soul Flame"                         }, // Soul Flame (id=199471, n_ranks=1)
  {  928,  39,   1,  0,   1, 199472, "Wrath of Consumption"               }, // Wrath of Consumption (id=199472, n_ranks=1)
  {  929,  39,   1,  0,   1, 201424, "Harvester of Souls"                 }, // Harvester of Souls (id=201424, n_ranks=1)
  {  999,  39,  18,  0,   0, 216698, "Reap Souls"                         }, // Reap Souls (id=216698, n_ranks=1)
  { 1217,  39,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1353,  39,   0,  0,   1, 221862, "Crystalline Shadows"                }, // Crystalline Shadows (id=221862, n_ranks=1)
  { 1390,  39,   5,  0,  20, 214934, "Soulstealer"                        }, // Soulstealer (id=214934, n_ranks=20)
  { 1601,  39,  32, 13,   4, 238072, "Winnowing"                          }, // Winnowing (id=238072, n_ranks=8)
  { 1602,  39,   0,  0,   1, 238108, "Sinister Seeds"                     }, // Sinister Seeds (id=238108, n_ranks=1)
  { 1603,  39,   1,  0,   1, 238144, "Rend Soul"                          }, // Rend Soul (id=238144, n_ranks=1)
  { 1604,  39,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1711,  39,   2,  0,   1, 241257, "Degradation of the Black Harvest"   }, // Degradation of the Black Harvest (id=241257, n_ranks=1)
  {  291,  40,  18,  0,   0, 205495, "Stormkeeper"                        }, // Stormkeeper (id=205495, n_ranks=1)
  {  292,  40,   0,  0,   1, 191602, "Static Overload"                    }, // Static Overload (id=191602, n_ranks=1)
  {  293,  40,   0,  0,   1, 191647, "Master of the Elements"             }, // Master of the Elements (id=191647, n_ranks=1)
  {  294,  40,   0,  0,   1, 191512, "Elementalist"                       }, // Elementalist (id=191512, n_ranks=1)
  {  295,  40,   1,  1,   1, 191717, "Fury of the Storms"                 }, // Fury of the Storms (id=191717, n_ranks=1)
  {  296,  40,   1,  2,   1, 191861, "Power of the Maelstrom"             }, // Power of the Maelstrom (id=191861, n_ranks=1)
  {  297,  40,   1,  3,   1, 192630, "Volcanic Inferno"                   }, // Volcanic Inferno (id=192630, n_ranks=1)
  {  298,  40,  32,  4,   3, 191493, "Call the Thunder"                   }, // Call the Thunder (id=191493, n_ranks=8)
  {  299,  40,  32,  5,   3, 191499, "The Ground Trembles"                }, // The Ground Trembles (id=191499, n_ranks=8)
  {  300,  40,  32,  6,   3, 191504, "Lava Imbued"                        }, // Lava Imbued (id=191504, n_ranks=8)
  {  301,  40,  32,  7,   3, 191740, "Firestorm"                          }, // Firestorm (id=191740, n_ranks=8)
  {  302,  40,  32, 11,   3, 191569, "Protection of the Elements"         }, // Protection of the Elements (id=191569, n_ranks=8)
  {  303,  40,  32,  8,   3, 191572, "Molten Blast"                       }, // Molten Blast (id=191572, n_ranks=8)
  {  304,  40,  32,  9,   3, 191577, "Electric Discharge"                 }, // Electric Discharge (id=191577, n_ranks=8)
  {  305,  40,  32, 12,   3, 191582, "Shamanistic Healing"                }, // Shamanistic Healing (id=191582, n_ranks=8)
  {  306,  40,  32, 10,   3, 191598, "Earthen Attunement"                 }, // Earthen Attunement (id=191598, n_ranks=8)
  { 1214,  40,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1350,  40,   0,  0,   1, 215414, "Surge of Power"                     }, // Surge of Power (id=215414, n_ranks=1)
  { 1387,  40,   5,  0,  20, 214931, "Stormkeeper's Power"                }, // Stormkeeper's Power (id=214931, n_ranks=20)
  { 1589,  40,  32, 13,   4, 238069, "Elemental Destabilization"          }, // Elemental Destabilization (id=238069, n_ranks=8)
  { 1590,  40,   0,  0,   1, 238105, "Swelling Maelstrom"                 }, // Swelling Maelstrom (id=238105, n_ranks=1)
  { 1591,  40,   1,  0,   1, 238141, "Seismic Storm"                      }, // Seismic Storm (id=238141, n_ranks=1)
  { 1592,  40,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1683,  40,   2,  0,   1, 241202, "Power of the Earthen Ring"          }, // Power of the Earthen Ring (id=241202, n_ranks=1)
  {  899,  41,  18,  0,   0, 204945, "Doom Winds"                         }, // Doom Winds (id=204945, n_ranks=1)
  {  900,  41,   1,  1,   1, 198736, "Unleash Doom"                       }, // Unleash Doom (id=198736, n_ranks=1)
  {  901,  41,   1,  2,   1, 198505, "Doom Wolves"                        }, // Doom Wolves (id=198505, n_ranks=1)
  {  902,  41,   0,  0,   1, 198361, "Raging Storms"                      }, // Raging Storms (id=198361, n_ranks=1)
  {  903,  41,   0,  0,   1, 198367, "Stormflurry"                        }, // Stormflurry (id=198367, n_ranks=1)
  {  904,  41,   0,  0,   1, 198434, "Alpha Wolf"                         }, // Alpha Wolf (id=198434, n_ranks=1)
  {  905,  41,  32,  4,   3, 215381, "Weapons of the Elements"            }, // Weapons of the Elements (id=215381, n_ranks=8)
  {  906,  41,  32,  5,   3, 198236, "Forged in Lava"                     }, // Forged in Lava (id=198236, n_ranks=8)
  {  907,  41,  32, 10,   3, 198238, "Spirit of the Maelstrom"            }, // Spirit of the Maelstrom (id=198238, n_ranks=8)
  {  908,  41,  32,  6,   3, 198247, "Wind Surge"                         }, // Wind Surge (id=198247, n_ranks=8)
  {  909,  41,  32, 12,   3, 198248, "Elemental Healing"                  }, // Elemental Healing (id=198248, n_ranks=8)
  {  910,  41,  32,  7,   3, 198292, "Wind Strikes"                       }, // Wind Strikes (id=198292, n_ranks=8)
  {  911,  41,  32, 11,   3, 198296, "Spiritual Healing"                  }, // Spiritual Healing (id=198296, n_ranks=8)
  {  912,  41,  32,  8,   3, 198299, "Gathering Storms"                   }, // Gathering Storms (id=198299, n_ranks=8)
  {  913,  41,  32,  9,   3, 198349, "Gathering of the Maelstrom"         }, // Gathering of the Maelstrom (id=198349, n_ranks=8)
  {  930,  41,   1,  3,   1, 199107, "Doom Vortex"                        }, // Doom Vortex (id=199107, n_ranks=1)
  { 1215,  41,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1351,  41,   0,  0,   1, 198228, "Hammer of Storms"                   }, // Hammer of Storms (id=198228, n_ranks=1)
  { 1388,  41,   5,  0,  20, 214932, "Earthshattering Blows"              }, // Earthshattering Blows (id=214932, n_ranks=20)
  { 1593,  41,  32, 13,   4, 238070, "Crashing Hammer"                    }, // Crashing Hammer (id=238070, n_ranks=8)
  { 1594,  41,   0,  0,   1, 238106, "Winds of Change"                    }, // Winds of Change (id=238106, n_ranks=1)
  { 1595,  41,   1,  0,   1, 238142, "Lashing Flames"                     }, // Lashing Flames (id=238142, n_ranks=1)
  { 1596,  41,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1687,  41,   2,  0,   1, 241203, "Might of the Earthen Ring"          }, // Might of the Earthen Ring (id=241203, n_ranks=1)
  { 1102,  42,  18,  0,   0, 207778, "Downpour"                           }, // Downpour (id=207778, n_ranks=1)
  { 1103,  42,  32,  4,   3, 207088, "Tidal Chains"                       }, // Tidal Chains (id=207088, n_ranks=8)
  { 1104,  42,  32,  5,   3, 207092, "Buffeting Waves"                    }, // Buffeting Waves (id=207092, n_ranks=8)
  { 1105,  42,  32,  6,   3, 207118, "Pull of the Sea"                    }, // Pull of the Sea (id=207118, n_ranks=8)
  { 1106,  42,  32,  7,   3, 207206, "Wavecrash"                          }, // Wavecrash (id=207206, n_ranks=8)
  { 1107,  42,  32,  8,   3, 207255, "Empowered Droplets"                 }, // Empowered Droplets (id=207255, n_ranks=8)
  { 1108,  42,  32,  9,   3, 207285, "Queen Ascendant"                    }, // Queen Ascendant (id=207285, n_ranks=8)
  { 1109,  42,  32, 10,   3, 207348, "Floodwaters"                        }, // Floodwaters (id=207348, n_ranks=8)
  { 1110,  42,  32, 11,   3, 207351, "Ghost in the Mist"                  }, // Ghost in the Mist (id=207351, n_ranks=8)
  { 1111,  42,  32, 12,   3, 207354, "Caress of the Tidemother"           }, // Caress of the Tidemother (id=207354, n_ranks=8)
  { 1112,  42,   0,  0,   1, 207355, "Sense of Urgency"                   }, // Sense of Urgency (id=207355, n_ranks=1)
  { 1113,  42,   0,  0,   1, 207356, "Refreshing Currents"                }, // Refreshing Currents (id=207356, n_ranks=1)
  { 1114,  42,   0,  0,   1, 207357, "Servant of the Queen"               }, // Servant of the Queen (id=207357, n_ranks=1)
  { 1115,  42,   1,  1,   1, 207358, "Tidal Pools"                        }, // Tidal Pools (id=207358, n_ranks=1)
  { 1116,  42,   1,  2,   1, 207360, "Queen's Decree"                     }, // Queen's Decree (id=207360, n_ranks=1)
  { 1117,  42,   1,  3,   1, 207362, "Cumulative Upkeep"                  }, // Cumulative Upkeep (id=207362, n_ranks=1)
  { 1216,  42,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1258,  42,   8,  0,   0, 213428, "Artificial Damage"                  }, // Artificial Damage (id=213428, n_ranks=1)
  { 1352,  42,   0,  0,   1, 224841, "Grace of the Sea"                   }, // Grace of the Sea (id=224841, n_ranks=1)
  { 1389,  42,   5,  0,  20, 214933, "Flow of the Tides"                  }, // Flow of the Tides (id=214933, n_ranks=20)
  { 1597,  42,  32, 13,   4, 238071, "Tidewalker"                         }, // Tidewalker (id=238071, n_ranks=8)
  { 1598,  42,   0,  0,   1, 242652, "Pitter-Patter"                      }, // Pitter-Patter (id=242652, n_ranks=1)
  { 1599,  42,   1,  0,   1, 238143, "Deep Waters"                        }, // Deep Waters (id=238143, n_ranks=1)
  { 1600,  42,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1693,  42,   2,  0,   1, 241205, "Echo of the Earthen Ring"           }, // Echo of the Earthen Ring (id=241205, n_ranks=1)
  {  323,  43,  32,  4,   3, 192310, "Toxic Blades"                       }, // Toxic Blades (id=192310, n_ranks=8)
  {  324,  43,  32,  5,   3, 192315, "Serrated Edge"                      }, // Serrated Edge (id=192315, n_ranks=8)
  {  325,  43,  32,  6,   3, 192318, "Master Alchemist"                   }, // Master Alchemist (id=192318, n_ranks=8)
  {  326,  43,  32, 11,   3, 192323, "Fade into Shadows"                  }, // Fade into Shadows (id=192323, n_ranks=8)
  {  327,  43,  32,  7,   3, 192326, "Balanced Blades"                    }, // Balanced Blades (id=192326, n_ranks=8)
  {  328,  43,  32,  8,   3, 192329, "Gushing Wound"                      }, // Gushing Wound (id=192329, n_ranks=8)
  {  329,  43,  32, 12,   3, 192345, "Shadow Walker"                      }, // Shadow Walker (id=192345, n_ranks=8)
  {  330,  43,  32,  9,   3, 192349, "Master Assassin"                    }, // Master Assassin (id=192349, n_ranks=8)
  {  331,  43,  32, 10,   3, 192376, "Poison Knives"                      }, // Poison Knives (id=192376, n_ranks=8)
  {  332,  43,   0,  0,   1, 192384, "Urge to Kill"                       }, // Urge to Kill (id=192384, n_ranks=1)
  {  333,  43,   0,  0,   1, 192422, "Shadow Swiftness"                   }, // Shadow Swiftness (id=192422, n_ranks=1)
  {  334,  43,   0,  0,   1, 192424, "Surge of Toxins"                    }, // Surge of Toxins (id=192424, n_ranks=1)
  {  335,  43,   1,  0,   1, 192428, "From the Shadows"                   }, // From the Shadows (id=192428, n_ranks=1)
  {  337,  43,   1,  0,   1, 192657, "Bag of Tricks"                      }, // Bag of Tricks (id=192657, n_ranks=1)
  {  346,  43,  18,  0,   0, 192759, "Kingsbane"                          }, // Kingsbane (id=192759, n_ranks=1)
  {  347,  43,   1,  0,   1, 192923, "Blood of the Assassinated"          }, // Blood of the Assassinated (id=192923, n_ranks=1)
  { 1211,  43,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1276,  43,   0,  0,   1, 214368, "Assassin's Blades"                  }, // Assassin's Blades (id=214368, n_ranks=1)
  { 1384,  43,   5,  0,  20, 214928, "Slayer's Precision"                 }, // Slayer's Precision (id=214928, n_ranks=20)
  { 1577,  43,  32, 13,   4, 238066, "Strangler"                          }, // Strangler (id=238066, n_ranks=8)
  { 1578,  43,   0,  0,   1, 238102, "Dense Concoction"                   }, // Dense Concoction (id=238102, n_ranks=1)
  { 1579,  43,   1,  0,   1, 238138, "Sinister Circulation"               }, // Sinister Circulation (id=238138, n_ranks=1)
  { 1580,  43,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1651,  43,   2,  0,   1, 241152, "Silence of the Uncrowned"           }, // Silence of the Uncrowned (id=241152, n_ranks=1)
  { 1052,  44,  18,  0,   0, 202665, "Curse of the Dreadblades"           }, // Curse of the Dreadblades (id=202665, n_ranks=1)
  { 1053,  44,   1,  1,   1, 202897, "Blunderbuss"                        }, // Blunderbuss (id=202897, n_ranks=1)
  { 1054,  44,   1,  2,   1, 202820, "Greed"                              }, // Greed (id=202820, n_ranks=1)
  { 1055,  44,   1,  3,   1, 202769, "Blurred Time"                       }, // Blurred Time (id=202769, n_ranks=1)
  { 1056,  44,   0,  0,   1, 202755, "Deception"                          }, // Deception (id=202755, n_ranks=1)
  { 1057,  44,   0,  0,   1, 202753, "Hidden Blade"                       }, // Hidden Blade (id=202753, n_ranks=1)
  { 1058,  44,   0,  0,   1, 202628, "Blademaster"                        }, // Blademaster (id=202628, n_ranks=1)
  { 1059,  44,  32,  4,   3, 216230, "Black Powder"                       }, // Black Powder (id=216230, n_ranks=8)
  { 1060,  44,  32,  5,   3, 202507, "Blade Dancer"                       }, // Blade Dancer (id=202507, n_ranks=8)
  { 1061,  44,  32,  6,   3, 202514, "Fate's Thirst"                      }, // Fate's Thirst (id=202514, n_ranks=8)
  { 1062,  44,  32, 11,   3, 202521, "Fortune's Strike"                   }, // Fortune's Strike (id=202521, n_ranks=8)
  { 1063,  44,  32,  7,   3, 202522, "Gunslinger"                         }, // Gunslinger (id=202522, n_ranks=8)
  { 1064,  44,  32,  8,   3, 202524, "Fatebringer"                        }, // Fatebringer (id=202524, n_ranks=8)
  { 1065,  44,  32,  9,   3, 202530, "Fortune Strikes"                    }, // Fortune Strikes (id=202530, n_ranks=8)
  { 1066,  44,  32, 12,   3, 202533, "Ghostly Shell"                      }, // Ghostly Shell (id=202533, n_ranks=8)
  { 1067,  44,  32, 10,   3, 202907, "Fortune's Boon"                     }, // Fortune's Boon (id=202907, n_ranks=8)
  { 1212,  44,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1348,  44,   0,  0,   1, 202463, "Cursed Edges"                       }, // Cursed Edges (id=202463, n_ranks=1)
  { 1385,  44,   5,  0,  20, 214929, "Cursed Steel"                       }, // Cursed Steel (id=214929, n_ranks=20)
  { 1581,  44,  32, 13,   4, 238067, "Sabermetrics"                       }, // Sabermetrics (id=238067, n_ranks=8)
  { 1582,  44,   0,  0,   1, 238103, "Dreadblade's Vigor"                 }, // Dreadblade's Vigor (id=238103, n_ranks=1)
  { 1583,  44,   1,  0,   1, 238139, "Loaded Dice"                        }, // Loaded Dice (id=238139, n_ranks=1)
  { 1584,  44,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1652,  44,   2,  0,   1, 241153, "Bravado of the Uncrowned"           }, // Bravado of the Uncrowned (id=241153, n_ranks=1)
  {  834,  45,  18,  0,   0, 196684, "Invoke the Naaru"                   }, // Invoke the Naaru (id=196684, n_ranks=1)
  {  835,  45,   1,  1,   1, 196492, "Renew the Faith"                    }, // Renew the Faith (id=196492, n_ranks=1)
  {  836,  45,   1,  2,   1, 208065, "Light of T'uure"                    }, // Light of T'uure (id=208065, n_ranks=1)
  {  837,  45,   1,  3,   1, 196578, "Blessing of T'uure"                 }, // Blessing of T'uure (id=196578, n_ranks=1)
  {  838,  45,  32, 11,   3, 196489, "Power of the Naaru"                 }, // Power of the Naaru (id=196489, n_ranks=8)
  {  839,  45,   0,  0,   1, 196437, "Guardians of the Light"             }, // Guardians of the Light (id=196437, n_ranks=1)
  {  840,  45,   0,  0,   1, 196779, "Holy Mending"                       }, // Holy Mending (id=196779, n_ranks=1)
  {  841,  45,  32, 12,   3, 196355, "Trust in the Light"                 }, // Trust in the Light (id=196355, n_ranks=8)
  {  842,  45,  32,  5,   3, 196358, "Say Your Prayers"                   }, // Say Your Prayers (id=196358, n_ranks=8)
  {  843,  45,  32,  6,   3, 196416, "Serenity Now"                       }, // Serenity Now (id=196416, n_ranks=8)
  {  844,  45,  32,  7,   3, 196418, "Reverence"                          }, // Reverence (id=196418, n_ranks=8)
  {  845,  45,   0,  0,   1, 196419, "Focus in the Light"                 }, // Focus in the Light (id=196419, n_ranks=1)
  {  846,  45,  32,  8,   3, 196422, "Holy Hands"                         }, // Holy Hands (id=196422, n_ranks=8)
  {  847,  45,  32,  9,   3, 196429, "Hallowed Ground"                    }, // Hallowed Ground (id=196429, n_ranks=8)
  {  848,  45,  32, 10,   3, 196430, "Words of Healing"                   }, // Words of Healing (id=196430, n_ranks=8)
  {  849,  45,  32,  4,   3, 196434, "Holy Guidance"                      }, // Holy Guidance (id=196434, n_ranks=8)
  { 1209,  45,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1257,  45,   8,  0,   0, 213428, "Artificial Damage"                  }, // Artificial Damage (id=213428, n_ranks=1)
  { 1346,  45,   0,  0,   1, 222646, "Follower of the Light"              }, // Follower of the Light (id=222646, n_ranks=1)
  { 1380,  45,   5,  0,  20, 214926, "Beacon of Light"                    }, // Beacon of Light (id=214926, n_ranks=20)
  { 1569,  45,  32, 13,   4, 238064, "Caress of the Naaru"                }, // Caress of the Naaru (id=238064, n_ranks=8)
  { 1570,  45,   0,  0,   1, 238100, "Times and Measures"                 }, // Times and Measures (id=238100, n_ranks=1)
  { 1571,  45,   1,  0,   1, 238136, "Cosmic Ripple"                      }, // Cosmic Ripple (id=238136, n_ranks=1)
  { 1572,  45,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1649,  45,   2,  0,   1, 241149, "Light of the Conclave"              }, // Light of the Conclave (id=241149, n_ranks=1)
  {  883,  46,  18,  0,   0, 207946, "Light's Wrath"                      }, // Light's Wrath (id=207946, n_ranks=1)
  {  884,  46,   0,  0,   1, 197779, "Taming the Shadows"                 }, // Taming the Shadows (id=197779, n_ranks=1)
  {  885,  46,   0,  0,   1, 197781, "Share in the Light"                 }, // Share in the Light (id=197781, n_ranks=1)
  {  886,  46,   1,  1,   1, 197815, "Barrier for the Devoted"            }, // Barrier for the Devoted (id=197815, n_ranks=1)
  {  887,  46,   1,  2,   1, 198074, "Sins of the Many"                   }, // Sins of the Many (id=198074, n_ranks=1)
  {  888,  46,  32,  4,   3, 197708, "Confession"                         }, // Confession (id=197708, n_ranks=8)
  {  889,  46,  32, 11,   3, 197711, "Vestments of Discipline"            }, // Vestments of Discipline (id=197711, n_ranks=8)
  {  890,  46,  32,  5,   3, 197713, "Pain is in Your Mind"               }, // Pain is in Your Mind (id=197713, n_ranks=8)
  {  891,  46,  32,  6,   3, 197715, "The Edge of Dark and Light"         }, // The Edge of Dark and Light (id=197715, n_ranks=8)
  {  892,  46,  32,  7,   3, 197716, "Burst of Light"                     }, // Burst of Light (id=197716, n_ranks=8)
  {  893,  46,  32,  8,   3, 197727, "Doomsayer"                          }, // Doomsayer (id=197727, n_ranks=8)
  {  894,  46,  32,  9,   3, 197729, "Shield of Faith"                    }, // Shield of Faith (id=197729, n_ranks=8)
  {  895,  46,  32, 10,   3, 197762, "Borrowed Time"                      }, // Borrowed Time (id=197762, n_ranks=8)
  {  896,  46,  32, 12,   3, 216212, "Darkest Shadows"                    }, // Darkest Shadows (id=216212, n_ranks=8)
  {  897,  46,   1,  3,   1, 198068, "Power of the Dark Side"             }, // Power of the Dark Side (id=198068, n_ranks=1)
  {  898,  46,   0,  0,   1, 197766, "Speed of the Pious"                 }, // Speed of the Pious (id=197766, n_ranks=1)
  { 1208,  46,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1345,  46,   0,  0,   1, 216122, "Invoke the Light"                   }, // Invoke the Light (id=216122, n_ranks=1)
  { 1379,  46,   5,  0,  20, 214925, "Forbidden Flame"                    }, // Forbidden Flame (id=214925, n_ranks=20)
  { 1436,  46,   8,  0,   0, 219655, "Artificial Damage"                  }, // Artificial Damage (id=219655, n_ranks=1)
  { 1565,  46,  32, 13,   4, 238063, "Lenience"                           }, // Lenience (id=238063, n_ranks=8)
  { 1566,  46,   0,  0,   1, 238099, "Tyranny of Pain"                    }, // Tyranny of Pain (id=238099, n_ranks=1)
  { 1567,  46,   1,  0,   1, 238135, "Aegis of Wrath"                     }, // Aegis of Wrath (id=238135, n_ranks=1)
  { 1568,  46,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1648,  46,   2,  0,   1, 241148, "Will of the Conclave"               }, // Will of the Conclave (id=241148, n_ranks=1)
  {  764,  47,  18,  0,   0, 205065, "Void Torrent"                       }, // Void Torrent (id=205065, n_ranks=1)
  {  765,  47,   0,  0,   1, 194024, "Thrive in the Shadows"              }, // Thrive in the Shadows (id=194024, n_ranks=1)
  {  766,  47,   0,  0,   1, 194026, "Sinister Thoughts"                  }, // Sinister Thoughts (id=194026, n_ranks=1)
  {  767,  47,  32,  4,   3, 194093, "Unleash the Shadows"                }, // Unleash the Shadows (id=194093, n_ranks=8)
  {  768,  47,   1,  1,   1, 193371, "Call to the Void"                   }, // Call to the Void (id=193371, n_ranks=1)
  {  769,  47,   1,  2,   1, 194179, "Sphere of Insanity"                 }, // Sphere of Insanity (id=194179, n_ranks=1)
  {  770,  47,   1,  3,   1, 194378, "Mass Hysteria"                      }, // Mass Hysteria (id=194378, n_ranks=1)
  {  771,  47,  32, 11,   3, 193642, "From the Shadows"                   }, // From the Shadows (id=193642, n_ranks=8)
  {  772,  47,  32,  5,   3, 193643, "Mind Shattering"                    }, // Mind Shattering (id=193643, n_ranks=8)
  {  773,  47,  32,  6,   3, 193644, "To the Pain"                        }, // To the Pain (id=193644, n_ranks=8)
  {  774,  47,  32,  7,   3, 193645, "Death's Embrace"                    }, // Death's Embrace (id=193645, n_ranks=8)
  {  775,  47,  32, 12,   3, 193647, "Thoughts of Insanity"               }, // Thoughts of Insanity (id=193647, n_ranks=8)
  {  776,  47,  32, 10,   3, 194002, "Creeping Shadows"                   }, // Creeping Shadows (id=194002, n_ranks=8)
  {  777,  47,  32,  8,   3, 194007, "Touch of Darkness"                  }, // Touch of Darkness (id=194007, n_ranks=8)
  {  778,  47,  32,  9,   3, 194016, "Void Corruption"                    }, // Void Corruption (id=194016, n_ranks=8)
  {  779,  47,   0,  0,   1, 194018, "Mental Fortitude"                   }, // Mental Fortitude (id=194018, n_ranks=1)
  { 1210,  47,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1347,  47,   0,  0,   1, 215322, "Void Siphon"                        }, // Void Siphon (id=215322, n_ranks=1)
  { 1381,  47,   5,  0,  20, 214927, "Darkening Whispers"                 }, // Darkening Whispers (id=214927, n_ranks=20)
  { 1573,  47,  32, 13,   4, 238065, "Fiending Dark"                      }, // Fiending Dark (id=238065, n_ranks=8)
  { 1574,  47,   0,  0,   1, 238101, "Mind Quickening"                    }, // Mind Quickening (id=238101, n_ranks=1)
  { 1575,  47,   1,  0,   1, 238137, "Lash of Insanity"                   }, // Lash of Insanity (id=238137, n_ranks=1)
  { 1576,  47,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1650,  47,   2,  0,   1, 241150, "Darkness of the Conclave"           }, // Darkness of the Conclave (id=241150, n_ranks=1)
  {  963,  48,   1,  2,   1, 200474, "Power of the Silver Hand"           }, // Power of the Silver Hand (id=200474, n_ranks=1)
  {  964,  48,   1,  3,   1, 200430, "Protection of Tyr"                  }, // Protection of Tyr (id=200430, n_ranks=1)
  {  965,  48,  18,  0,   0, 200652, "Tyr's Deliverance"                  }, // Tyr's Deliverance (id=200652, n_ranks=1)
  {  966,  48,   1,  1,   1, 200421, "The Light Saves"                    }, // The Light Saves (id=200421, n_ranks=1)
  {  967,  48,   0,  0,   1, 200407, "Protection of the Light"            }, // Protection of the Light (id=200407, n_ranks=1)
  {  968,  48,   0,  0,   1, 200373, "Vindicator"                         }, // Vindicator (id=200373, n_ranks=1)
  {  969,  48,  32, 11,   3, 200327, "Share the Burden"                   }, // Share the Burden (id=200327, n_ranks=8)
  {  970,  48,  32,  4,   3, 200326, "Focused Healing"                    }, // Focused Healing (id=200326, n_ranks=8)
  {  971,  48,  32,  5,   3, 200316, "Justice through Sacrifice"          }, // Justice through Sacrifice (id=200316, n_ranks=8)
  {  972,  48,  32,  6,   3, 200315, "Shock Treatment"                    }, // Shock Treatment (id=200315, n_ranks=8)
  {  973,  48,   0,  0,   1, 200311, "Templar of the Light"               }, // Templar of the Light (id=200311, n_ranks=1)
  {  974,  48,  32, 12,   3, 200302, "Knight of the Silver Hand"          }, // Knight of the Silver Hand (id=200302, n_ranks=8)
  {  975,  48,  32,  9,   3, 200298, "Blessings of the Silver Hand"       }, // Blessings of the Silver Hand (id=200298, n_ranks=8)
  {  976,  48,  32,  7,   3, 200296, "Expel the Darkness"                 }, // Expel the Darkness (id=200296, n_ranks=8)
  {  977,  48,  32,  8,   3, 200294, "Deliver the Light"                  }, // Deliver the Light (id=200294, n_ranks=8)
  { 1186,  48,  32, 10,   3, 200482, "Second Sunrise"                     }, // Second Sunrise (id=200482, n_ranks=8)
  { 1205,  48,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1256,  48,   8,  0,   0, 213428, "Artificial Damage"                  }, // Artificial Damage (id=213428, n_ranks=1)
  { 1342,  48,   0,  0,   1, 222648, "Virtues of the Light"               }, // Virtues of the Light (id=222648, n_ranks=1)
  { 1377,  48,   5,  0,  20, 214923, "Silver Touch"                       }, // Silver Touch (id=214923, n_ranks=20)
  { 1553,  48,  32, 13,   4, 238060, "Tyr's Munificence"                  }, // Tyr's Munificence (id=238060, n_ranks=8)
  { 1554,  48,   0,  0,   1, 238096, "Stoicism"                           }, // Stoicism (id=238096, n_ranks=1)
  { 1555,  48,   1,  0,   1, 238132, "Sacred Dawn"                        }, // Sacred Dawn (id=238132, n_ranks=1)
  { 1556,  48,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1645,  48,   2,  0,   1, 241145, "Light of the Silver Hand"           }, // Light of the Silver Hand (id=241145, n_ranks=1)
  { 1120,  49,  18,  0,   0, 209202, "Eye of Tyr"                         }, // Eye of Tyr (id=209202, n_ranks=1)
  { 1121,  49,  32,  4,   3, 209229, "Hammer Time"                        }, // Hammer Time (id=209229, n_ranks=8)
  { 1122,  49,  32,  5,   3, 209217, "Stern Judgment"                     }, // Stern Judgment (id=209217, n_ranks=8)
  { 1123,  49,  32,  6,   3, 209220, "Unflinching Defense"                }, // Unflinching Defense (id=209220, n_ranks=8)
  { 1124,  49,  32,  7,   3, 209226, "Righteous Crusader"                 }, // Righteous Crusader (id=209226, n_ranks=8)
  { 1125,  49,  32,  8,   3, 209223, "Scatter the Shadows"                }, // Scatter the Shadows (id=209223, n_ranks=8)
  { 1126,  49,  32,  9,   3, 209218, "Consecration in Flame"              }, // Consecration in Flame (id=209218, n_ranks=8)
  { 1127,  49,  32, 10,   3, 209216, "Bastion of Truth"                   }, // Bastion of Truth (id=209216, n_ranks=8)
  { 1128,  49,  32, 11,   3, 209224, "Resolve of Truth"                   }, // Resolve of Truth (id=209224, n_ranks=8)
  { 1129,  49,  32, 12,   3, 209225, "Faith's Armor"                      }, // Faith's Armor (id=209225, n_ranks=8)
  { 1130,  49,   0,  0,   1, 209341, "Painful Truths"                     }, // Painful Truths (id=209341, n_ranks=1)
  { 1131,  49,   0,  0,   1, 209285, "Sacrifice of the Just"              }, // Sacrifice of the Just (id=209285, n_ranks=1)
  { 1132,  49,   0,  0,   1, 209376, "Forbearant Faithful"                }, // Forbearant Faithful (id=209376, n_ranks=1)
  { 1133,  49,   1,  1,   1, 209389, "Bulwark of Order"                   }, // Bulwark of Order (id=209389, n_ranks=1)
  { 1134,  49,   1,  2,   1, 209539, "Light of the Titans"                }, // Light of the Titans (id=209539, n_ranks=1)
  { 1135,  49,   1,  3,   1, 209474, "Tyr's Enforcer"                     }, // Tyr's Enforcer (id=209474, n_ranks=1)
  { 1206,  49,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1343,  49,   0,  0,   1, 221841, "Truthguard's Light"                 }, // Truthguard's Light (id=221841, n_ranks=1)
  { 1378,  49,   5,  0,  20, 214924, "Unrelenting Light"                  }, // Unrelenting Light (id=214924, n_ranks=20)
  { 1455,  49,   8,  0,   0, 226829, "Artificial Damage"                  }, // Artificial Damage (id=226829, n_ranks=1)
  { 1557,  49,  32, 13,   4, 238061, "Holy Aegis"                         }, // Holy Aegis (id=238061, n_ranks=8)
  { 1558,  49,   0,  0,   1, 238097, "Defender of Truth"                  }, // Defender of Truth (id=238097, n_ranks=1)
  { 1559,  49,   1,  0,   1, 238133, "Blessed Stalwart"                   }, // Blessed Stalwart (id=238133, n_ranks=1)
  { 1560,  49,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1646,  49,   2,  0,   1, 241146, "Bulwark of the Silver Hand"         }, // Bulwark of the Silver Hand (id=241146, n_ranks=1)
  {  800,  50,  32,  4,   3, 195243, "Inner Peace"                        }, // Inner Peace (id=195243, n_ranks=8)
  {  801,  50,  32, 11,   3, 195244, "Light on Your Feet"                 }, // Light on Your Feet (id=195244, n_ranks=8)
  {  820,  50,  32,  5,   3, 195263, "Rising Winds"                       }, // Rising Winds (id=195263, n_ranks=8)
  {  821,  50,  32,  6,   3, 218607, "Tiger Claws"                        }, // Tiger Claws (id=218607, n_ranks=8)
  {  822,  50,  32,  7,   3, 195266, "Death Art"                          }, // Death Art (id=195266, n_ranks=8)
  {  824,  50,  32,  8,   3, 195269, "Power of a Thousand Cranes"         }, // Power of a Thousand Cranes (id=195269, n_ranks=8)
  {  825,  50,  32,  9,   3, 195291, "Fists of the Wind"                  }, // Fists of the Wind (id=195291, n_ranks=8)
  {  826,  50,   0,  0,   1, 195295, "Good Karma"                         }, // Good Karma (id=195295, n_ranks=1)
  {  827,  50,   0,  0,   1, 195298, "Spiritual Focus"                    }, // Spiritual Focus (id=195298, n_ranks=1)
  {  828,  50,   0,  0,   1, 195300, "Transfer the Power"                 }, // Transfer the Power (id=195300, n_ranks=1)
  {  829,  50,  32, 12,   3, 195380, "Healing Winds"                      }, // Healing Winds (id=195380, n_ranks=8)
  {  830,  50,   1,  1,   1, 195399, "Gale Burst"                         }, // Gale Burst (id=195399, n_ranks=1)
  {  831,  50,  18,  0,   0, 205320, "Strike of the Windlord"             }, // Strike of the Windlord (id=205320, n_ranks=1)
  {  832,  50,   1,  2,   1, 195650, "Crosswinds"                         }, // Crosswinds (id=195650, n_ranks=1)
  {  833,  50,   1,  3,   1, 196082, "Tornado Kicks"                      }, // Tornado Kicks (id=196082, n_ranks=1)
  { 1094,  50,  32, 10,   3, 195267, "Strength of Xuen"                   }, // Strength of Xuen (id=195267, n_ranks=8)
  { 1204,  50,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1341,  50,   0,  0,   1, 195265, "Dark Skies"                         }, // Dark Skies (id=195265, n_ranks=1)
  { 1376,  50,   5,  0,  20, 214922, "Windborne Blows"                    }, // Windborne Blows (id=214922, n_ranks=20)
  { 1549,  50,  32, 13,   4, 238059, "Split Personality"                  }, // Split Personality (id=238059, n_ranks=8)
  { 1550,  50,   0,  0,   1, 238095, "Master of Combinations"             }, // Master of Combinations (id=238095, n_ranks=1)
  { 1551,  50,   1,  0,   1, 238131, "Thunderfist"                        }, // Thunderfist (id=238131, n_ranks=1)
  { 1552,  50,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1644,  50,   2,  0,   1, 241136, "Ferocity of the Broken Temple"      }, // Ferocity of the Broken Temple (id=241136, n_ranks=1)
  {  931,  51,  18,  0,   0, 205406, "Sheilun's Gift"                     }, // Sheilun's Gift (id=205406, n_ranks=1)
  {  932,  51,   1,  1,   1, 199887, "The Mists of Sheilun"               }, // The Mists of Sheilun (id=199887, n_ranks=1)
  {  933,  51,   1,  2,   1, 199665, "Blessings of Yu'lon"                }, // Blessings of Yu'lon (id=199665, n_ranks=1)
  {  934,  51,   1,  3,   1, 199640, "Celestial Breath"                   }, // Celestial Breath (id=199640, n_ranks=1)
  {  935,  51,   0,  0,   1, 199401, "Light on Your Feet"                 }, // Light on Your Feet (id=199401, n_ranks=1)
  {  936,  51,   0,  0,   1, 199563, "Mists of Life"                      }, // Mists of Life (id=199563, n_ranks=1)
  {  937,  51,   0,  0,   1, 199573, "Dancing Mists"                      }, // Dancing Mists (id=199573, n_ranks=1)
  {  938,  51,  32,  4,   3, 199364, "Coalescing Mists"                   }, // Coalescing Mists (id=199364, n_ranks=8)
  {  939,  51,  32, 11,   3, 199365, "Shroud of Mist"                     }, // Shroud of Mist (id=199365, n_ranks=8)
  {  940,  51,  32,  5,   3, 199366, "Way of the Mistweaver"              }, // Way of the Mistweaver (id=199366, n_ranks=8)
  {  941,  51,  32,  6,   3, 199367, "Protection of Shaohao"              }, // Protection of Shaohao (id=199367, n_ranks=8)
  {  942,  51,  32,  7,   3, 199372, "Extended Healing"                   }, // Extended Healing (id=199372, n_ranks=8)
  {  943,  51,  32,  8,   3, 199377, "Soothing Remedies"                  }, // Soothing Remedies (id=199377, n_ranks=8)
  {  944,  51,  32,  9,   3, 199380, "Infusion of Life"                   }, // Infusion of Life (id=199380, n_ranks=8)
  {  945,  51,  32, 12,   3, 199384, "Spirit Tether"                      }, // Spirit Tether (id=199384, n_ranks=8)
  {  946,  51,  32, 10,   3, 199485, "Essence of the Mists"               }, // Essence of the Mists (id=199485, n_ranks=8)
  { 1203,  51,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1255,  51,   8,  0,   0, 213428, "Artificial Damage"                  }, // Artificial Damage (id=213428, n_ranks=1)
  { 1295,  51,   0,  0,   1, 214516, "Mists of Wisdom"                    }, // Mists of Wisdom (id=214516, n_ranks=1)
  { 1375,  51,   5,  0,  20, 214921, "Mistweaving"                        }, // Mistweaving (id=214921, n_ranks=20)
  { 1545,  51,  32, 13,   4, 238058, "Tendrils of Revival"                }, // Tendrils of Revival (id=238058, n_ranks=8)
  { 1546,  51,   0,  0,   1, 238094, "Effusive Mists"                     }, // Effusive Mists (id=238094, n_ranks=1)
  { 1547,  51,   1,  0,   1, 238130, "Whispers of Shaohao"                }, // Whispers of Shaohao (id=238130, n_ranks=1)
  { 1548,  51,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1643,  51,   2,  0,   1, 241134, "Mists of the Broken Temple"         }, // Mists of the Broken Temple (id=241134, n_ranks=1)
  { 1202,  52,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1277,  52,  18,  0,   0, 214326, "Exploding Keg"                      }, // Exploding Keg (id=214326, n_ranks=1)
  { 1278,  52,  32,  4,   3, 213051, "Obsidian Fists"                     }, // Obsidian Fists (id=213051, n_ranks=8)
  { 1279,  52,  32,  5,   3, 213049, "Hot Blooded"                        }, // Hot Blooded (id=213049, n_ranks=8)
  { 1280,  52,  32,  6,   3, 213180, "Overflow"                           }, // Overflow (id=213180, n_ranks=8)
  { 1281,  52,  32,  7,   3, 213062, "Dark Side of the Moon"              }, // Dark Side of the Moon (id=213062, n_ranks=8)
  { 1282,  52,  32,  8,   3, 213055, "Staggering Around"                  }, // Staggering Around (id=213055, n_ranks=8)
  { 1283,  52,  32,  9,   3, 213133, "Healthy Appetite"                   }, // Healthy Appetite (id=213133, n_ranks=8)
  { 1284,  52,  32, 10,   3, 213136, "Gifted Student"                     }, // Gifted Student (id=213136, n_ranks=8)
  { 1285,  52,  32, 11,   3, 213047, "Potent Kick"                        }, // Potent Kick (id=213047, n_ranks=8)
  { 1286,  52,  32, 12,   3, 213116, "Face Palm"                          }, // Face Palm (id=213116, n_ranks=8)
  { 1287,  52,   0,  0,   1, 213161, "Swift as a Coursing River"          }, // Swift as a Coursing River (id=213161, n_ranks=1)
  { 1288,  52,   0,  0,   1, 216424, "Obstinate Determination"            }, // Obstinate Determination (id=216424, n_ranks=1)
  { 1289,  52,   0,  0,   1, 213050, "Smashed"                            }, // Smashed (id=213050, n_ranks=1)
  { 1290,  52,   1,  1,   1, 213183, "Dragonfire Brew"                    }, // Dragonfire Brew (id=213183, n_ranks=1)
  { 1291,  52,   1,  2,   1, 214372, "Brew-Stache"                        }, // Brew-Stache (id=214372, n_ranks=1)
  { 1292,  52,   1,  3,   1, 213340, "Fortification"                      }, // Fortification (id=213340, n_ranks=1)
  { 1293,  52,   0,  0,   1, 214428, "Full Keg"                           }, // Full Keg (id=214428, n_ranks=1)
  { 1374,  52,   5,  0,  20, 214920, "Wanderer's Hardiness"               }, // Wanderer's Hardiness (id=214920, n_ranks=20)
  { 1454,  52,   8,  0,   0, 226829, "Artificial Damage"                  }, // Artificial Damage (id=226829, n_ranks=1)
  { 1541,  52,  32, 13,   4, 238057, "Draught of Darkness"                }, // Draught of Darkness (id=238057, n_ranks=8)
  { 1542,  52,   0,  0,   1, 238093, "Stave Off"                          }, // Stave Off (id=238093, n_ranks=1)
  { 1543,  52,   1,  0,   1, 238129, "Quick Sip"                          }, // Quick Sip (id=238129, n_ranks=1)
  { 1544,  52,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1642,  52,   2,  0,   1, 241131, "Endurance of the Broken Temple"     }, // Endurance of the Broken Temple (id=241131, n_ranks=1)
  {  783,  53,  18,  0,   0, 214634, "Ebonbolt"                           }, // Ebonbolt (id=214634, n_ranks=1)
  {  784,  53,  32,  4,   3, 195315, "Icy Caress"                         }, // Icy Caress (id=195315, n_ranks=8)
  {  785,  53,  32,  5,   3, 195317, "Ice Age"                            }, // Ice Age (id=195317, n_ranks=8)
  {  786,  53,  32,  6,   3, 195322, "Let It Go"                          }, // Let It Go (id=195322, n_ranks=8)
  {  787,  53,  32,  7,   3, 195323, "Orbital Strike"                     }, // Orbital Strike (id=195323, n_ranks=8)
  {  788,  53,  32,  8,   3, 195345, "Frozen Veins"                       }, // Frozen Veins (id=195345, n_ranks=8)
  {  789,  53,  32,  9,   3, 195351, "Clarity of Thought"                 }, // Clarity of Thought (id=195351, n_ranks=8)
  {  790,  53,  32, 10,   3, 195352, "The Storm Rages"                    }, // The Storm Rages (id=195352, n_ranks=8)
  {  791,  53,  32, 11,   3, 195354, "Shield of Alodi"                    }, // Shield of Alodi (id=195354, n_ranks=8)
  {  792,  53,  32, 12,   3, 214626, "Jouster"                            }, // Jouster (id=214626, n_ranks=8)
  {  793,  53,   0,  0,   1, 195419, "Chain Reaction"                     }, // Chain Reaction (id=195419, n_ranks=1)
  {  794,  53,   0,  0,   1, 214664, "Ice Nine"                           }, // Ice Nine (id=214664, n_ranks=1)
  {  795,  53,   0,  0,   1, 220817, "Icy Hand"                           }, // Icy Hand (id=220817, n_ranks=1)
  {  796,  53,   1,  1,   1, 214776, "It's Cold Outside"                  }, // It's Cold Outside (id=214776, n_ranks=1)
  {  797,  53,   1,  2,   1, 195615, "Black Ice"                          }, // Black Ice (id=195615, n_ranks=1)
  {  798,  53,   1,  3,   1, 195448, "Chilled to the Core"                }, // Chilled to the Core (id=195448, n_ranks=1)
  { 1200,  53,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1296,  53,   0,  0,   1, 214629, "Shattering Bolts"                   }, // Shattering Bolts (id=214629, n_ranks=1)
  { 1373,  53,   5,  0,  20, 214919, "Spellborne"                         }, // Spellborne (id=214919, n_ranks=20)
  { 1537,  53,  32, 13,   4, 238056, "Obsidian Lance"                     }, // Obsidian Lance (id=238056, n_ranks=8)
  { 1538,  53,   0,  0,   1, 238092, "Freezing Rain"                      }, // Freezing Rain (id=238092, n_ranks=1)
  { 1539,  53,   1,  0,   1, 238128, "Glacial Eruption"                   }, // Glacial Eruption (id=238128, n_ranks=1)
  { 1540,  53,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1641,  53,   2,  0,   1, 241125, "Frigidity of the Tirisgarde"        }, // Frigidity of the Tirisgarde (id=241125, n_ranks=1)
  {  748,  54,  18,  0,   0, 194466, "Phoenix's Flames"                   }, // Phoenix's Flames (id=194466, n_ranks=1)
  {  749,  54,  32,  4,   3, 194224, "Fire at Will"                       }, // Fire at Will (id=194224, n_ranks=8)
  {  750,  54,  32,  5,   3, 194234, "Reignition Overdrive"               }, // Reignition Overdrive (id=194234, n_ranks=8)
  {  751,  54,  32, 10,   3, 194239, "Pyroclasmic Paranoia"               }, // Pyroclasmic Paranoia (id=194239, n_ranks=8)
  {  752,  54,  32,  6,   3, 194312, "Burning Gaze"                       }, // Burning Gaze (id=194312, n_ranks=8)
  {  753,  54,  32,  7,   3, 210182, "Blue Flame Special"                 }, // Blue Flame Special (id=210182, n_ranks=8)
  {  754,  54,  32,  8,   3, 194313, "Great Balls of Fire"                }, // Great Balls of Fire (id=194313, n_ranks=8)
  {  755,  54,  32,  9,   3, 194314, "Everburning Consumption"            }, // Everburning Consumption (id=194314, n_ranks=8)
  {  756,  54,  32, 11,   3, 194318, "Cauterizing Blink"                  }, // Cauterizing Blink (id=194318, n_ranks=8)
  {  757,  54,  32, 12,   3, 194315, "Molten Skin"                        }, // Molten Skin (id=194315, n_ranks=8)
  {  758,  54,   0,  0,   1, 194487, "Blast Furnace"                      }, // Blast Furnace (id=194487, n_ranks=1)
  {  759,  54,   0,  0,   1, 215796, "Big Mouth"                          }, // Big Mouth (id=215796, n_ranks=1)
  {  760,  54,   0,  0,   1, 227481, "Scorched Earth"                     }, // Scorched Earth (id=227481, n_ranks=1)
  {  761,  54,   1,  1,   1, 194431, "Aftershocks"                        }, // Aftershocks (id=194431, n_ranks=1)
  {  762,  54,   1,  2,   1, 215773, "Phoenix Reborn"                     }, // Phoenix Reborn (id=215773, n_ranks=1)
  {  763,  54,   1,  3,   1, 194331, "Pyretic Incantation"                }, // Pyretic Incantation (id=194331, n_ranks=1)
  { 1201,  54,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1340,  54,   0,  0,   1, 221844, "Wings of Flame"                     }, // Wings of Flame (id=221844, n_ranks=1)
  { 1372,  54,   5,  0,  20, 214918, "Empowered Spellblade"               }, // Empowered Spellblade (id=214918, n_ranks=20)
  { 1533,  54,  32, 13,   4, 238055, "Pre-Ignited"                        }, // Pre-Ignited (id=238055, n_ranks=8)
  { 1534,  54,   0,  0,   1, 238091, "Warmth of the Phoenix"              }, // Warmth of the Phoenix (id=238091, n_ranks=1)
  { 1535,  54,   1,  0,   1, 238127, "Strafing Run"                       }, // Strafing Run (id=238127, n_ranks=1)
  { 1536,  54,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1640,  54,   2,  0,   1, 241124, "Instability of the Tirisgarde"      }, // Instability of the Tirisgarde (id=241124, n_ranks=1)
  {  307,  55,  18,  0,   0, 204147, "Windburst"                          }, // Windburst (id=204147, n_ranks=1)
  {  308,  55,   0,  0,   1, 204219, "Mark of the Windrunner"             }, // Mark of the Windrunner (id=204219, n_ranks=1)
  {  309,  55,   0,  0,   1, 191328, "Critical Focus"                     }, // Critical Focus (id=191328, n_ranks=1)
  {  310,  55,   0,  0,   1, 191339, "Rapid Killing"                      }, // Rapid Killing (id=191339, n_ranks=1)
  {  311,  55,   1,  1,   1, 191048, "Call of the Hunter"                 }, // Call of the Hunter (id=191048, n_ranks=1)
  {  312,  55,  32,  4,   3, 190449, "Deadly Aim"                         }, // Deadly Aim (id=190449, n_ranks=8)
  {  313,  55,  32,  5,   3, 190457, "Windrunner's Guidance"              }, // Windrunner's Guidance (id=190457, n_ranks=8)
  {  314,  55,  32,  6,   3, 190462, "Quick Shot"                         }, // Quick Shot (id=190462, n_ranks=8)
  {  315,  55,  32,  7,   3, 190467, "Called Shot"                        }, // Called Shot (id=190467, n_ranks=8)
  {  316,  55,  32, 11,   3, 190503, "Healing Shell"                      }, // Healing Shell (id=190503, n_ranks=8)
  {  317,  55,  32, 12,   3, 190514, "Survival of the Fittest"            }, // Survival of the Fittest (id=190514, n_ranks=8)
  {  318,  55,  32,  8,   3, 190520, "Precision"                          }, // Precision (id=190520, n_ranks=8)
  {  319,  55,  32,  9,   3, 190529, "Marked for Death"                   }, // Marked for Death (id=190529, n_ranks=8)
  {  320,  55,  32, 10,   3, 190567, "Gust of Wind"                       }, // Gust of Wind (id=190567, n_ranks=8)
  {  321,  55,   1,  2,   1, 190852, "Legacy of the Windrunners"          }, // Legacy of the Windrunners (id=190852, n_ranks=1)
  {  322,  55,   1,  3,   1, 204089, "Bullseye"                           }, // Bullseye (id=204089, n_ranks=1)
  { 1197,  55,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1337,  55,   0,  0,   1, 214826, "Wind Arrows"                        }, // Wind Arrows (id=214826, n_ranks=1)
  { 1369,  55,   5,  0,  20, 214915, "Windflight Arrows"                  }, // Windflight Arrows (id=214915, n_ranks=20)
  { 1521,  55,  32, 13,   4, 238052, "Unerring Arrows"                    }, // Unerring Arrows (id=238052, n_ranks=8)
  { 1522,  55,   0,  0,   1, 238088, "Feet of Wind"                       }, // Feet of Wind (id=238088, n_ranks=1)
  { 1523,  55,   1,  0,   1, 238124, "Cyclonic Burst"                     }, // Cyclonic Burst (id=238124, n_ranks=1)
  { 1524,  55,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1637,  55,   2,  0,   1, 241114, "Acuity of the Unseen Path"          }, // Acuity of the Unseen Path (id=241114, n_ranks=1)
  {  868,  56,  32,  4,   3, 197038, "Wilderness Expert"                  }, // Wilderness Expert (id=197038, n_ranks=8)
  {  869,  56,  32,  5,   3, 197047, "Furious Swipes"                     }, // Furious Swipes (id=197047, n_ranks=8)
  {  870,  56,  32,  6,   3, 197080, "Pack Leader"                        }, // Pack Leader (id=197080, n_ranks=8)
  {  871,  56,  32, 12,   3, 197138, "Natural Reflexes"                   }, // Natural Reflexes (id=197138, n_ranks=8)
  {  872,  56,  32,  7,   3, 197139, "Focus of the Titans"                }, // Focus of the Titans (id=197139, n_ranks=8)
  {  873,  56,  32,  8,   3, 197140, "Spitting Cobras"                    }, // Spitting Cobras (id=197140, n_ranks=8)
  {  874,  56,  32, 11,   3, 197160, "Mimiron's Shell"                    }, // Mimiron's Shell (id=197160, n_ranks=8)
  {  875,  56,  32,  9,   3, 197162, "Jaws of Thunder"                    }, // Jaws of Thunder (id=197162, n_ranks=8)
  {  876,  56,   0,  0,   1, 197178, "Hunter's Advantage"                 }, // Hunter's Advantage (id=197178, n_ranks=1)
  {  877,  56,   0,  0,   1, 197199, "Spirit Bond"                        }, // Spirit Bond (id=197199, n_ranks=1)
  {  878,  56,   1,  1,   1, 197248, "Master of Beasts"                   }, // Master of Beasts (id=197248, n_ranks=1)
  {  879,  56,   1,  2,   1, 207068, "Titan's Thunder"                    }, // Titan's Thunder (id=207068, n_ranks=1)
  {  880,  56,   0,  0,   1, 197343, "Pathfinder"                         }, // Pathfinder (id=197343, n_ranks=1)
  {  881,  56,  18,  0,   0, 197344, "Hati's Bond"                        }, // Hati's Bond (id=197344, n_ranks=1)
  {  882,  56,   1,  3,   1, 197354, "Surge of the Stormgod"              }, // Surge of the Stormgod (id=197354, n_ranks=1)
  { 1095,  56,  32, 10,   3, 206910, "Unleash the Beast"                  }, // Unleash the Beast (id=206910, n_ranks=8)
  { 1196,  56,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1336,  56,   0,  0,   1, 215779, "Beast Master"                       }, // Beast Master (id=215779, n_ranks=1)
  { 1368,  56,   5,  0,  20, 214914, "Spiritbound"                        }, // Spiritbound (id=214914, n_ranks=20)
  { 1517,  56,  32, 13,   4, 238051, "Slithering Serpents"                }, // Slithering Serpents (id=238051, n_ranks=8)
  { 1518,  56,   0,  0,   1, 238087, "Thunderslash"                       }, // Thunderslash (id=238087, n_ranks=1)
  { 1519,  56,   1,  0,   1, 238123, "Cobra Commander"                    }, // Cobra Commander (id=238123, n_ranks=1)
  { 1520,  56,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1636,  56,   2,  0,   1, 241110, "Bond of the Unseen Path"            }, // Bond of the Unseen Path (id=241110, n_ranks=1)
  {  948,  57,  32,  4,   3, 200395, "Reinforced Fur"                     }, // Reinforced Fur (id=200395, n_ranks=8)
  {  949,  57,  32,  5,   3, 200399, "Ursoc's Endurance"                  }, // Ursoc's Endurance (id=200399, n_ranks=8)
  {  950,  57,  32, 11,   3, 200400, "Wildflesh"                          }, // Wildflesh (id=200400, n_ranks=8)
  {  951,  57,  32,  7,   3, 200402, "Perpetual Spring"                   }, // Perpetual Spring (id=200402, n_ranks=8)
  {  952,  57,  32,  8,   3, 200409, "Jagged Claws"                       }, // Jagged Claws (id=200409, n_ranks=8)
  {  953,  57,  32,  9,   3, 200414, "Bestial Fortitude"                  }, // Bestial Fortitude (id=200414, n_ranks=8)
  {  954,  57,  32, 10,   3, 200415, "Sharpened Instincts"                }, // Sharpened Instincts (id=200415, n_ranks=8)
  {  955,  57,  32,  6,   3, 208762, "Mauler"                             }, // Mauler (id=208762, n_ranks=8)
  {  956,  57,  32, 12,   3, 200440, "Vicious Bites"                      }, // Vicious Bites (id=200440, n_ranks=8)
  {  957,  57,   0,  0,   1, 215799, "Bear Hug"                           }, // Bear Hug (id=215799, n_ranks=1)
  {  958,  57,   0,  0,   1, 200515, "Bloody Paws"                        }, // Bloody Paws (id=200515, n_ranks=1)
  {  959,  57,   0,  0,   1, 214996, "Roar of the Crowd"                  }, // Roar of the Crowd (id=214996, n_ranks=1)
  {  960,  57,  18,  0,   0, 200851, "Rage of the Sleeper"                }, // Rage of the Sleeper (id=200851, n_ranks=1)
  {  961,  57,   1,  1,   1, 200855, "Embrace of the Nightmare"           }, // Embrace of the Nightmare (id=200855, n_ranks=1)
  {  962,  57,   1,  2,   1, 200854, "Gory Fur"                           }, // Gory Fur (id=200854, n_ranks=1)
  {  979,  57,   1,  3,   1, 200850, "Adaptive Fur"                       }, // Adaptive Fur (id=200850, n_ranks=1)
  { 1194,  57,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1334,  57,   0,  0,   1, 215061, "Iron Claws"                         }, // Iron Claws (id=215061, n_ranks=1)
  { 1366,  57,   5,  0,  20, 214912, "Ursoc's Bond"                       }, // Ursoc's Bond (id=214912, n_ranks=20)
  { 1453,  57,   8,  0,   0, 226829, "Artificial Damage"                  }, // Artificial Damage (id=226829, n_ranks=1)
  { 1509,  57,  32, 13,   4, 238049, "Scintillating Moonlight"            }, // Scintillating Moonlight (id=238049, n_ranks=8)
  { 1510,  57,   0,  0,   1, 238085, "Fleshknitting"                      }, // Fleshknitting (id=238085, n_ranks=1)
  { 1511,  57,   1,  0,   1, 238121, "Pawsitive Outlook"                  }, // Pawsitive Outlook (id=238121, n_ranks=1)
  { 1512,  57,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1634,  57,   2,  0,   1, 241101, "Fortitude of the Cenarion Circle"   }, // Fortitude of the Cenarion Circle (id=241101, n_ranks=1)
  { 1153,  58,  18,  0,   0, 210722, "Ashamane's Frenzy"                  }, // Ashamane's Frenzy (id=210722, n_ranks=1)
  { 1154,  58,   1,  1,   1, 210702, "Ashamane's Bite"                    }, // Ashamane's Bite (id=210702, n_ranks=1)
  { 1155,  58,   1,  2,   1, 210676, "Shadow Thrash"                      }, // Shadow Thrash (id=210676, n_ranks=1)
  { 1156,  58,   1,  3,   1, 210666, "Open Wounds"                        }, // Open Wounds (id=210666, n_ranks=1)
  { 1157,  58,   0,  0,   1, 210663, "Scent of Blood"                     }, // Scent of Blood (id=210663, n_ranks=1)
  { 1158,  58,   0,  0,   1, 210650, "Protection of Ashamane"             }, // Protection of Ashamane (id=210650, n_ranks=1)
  { 1159,  58,   0,  0,   1, 210638, "Hardened Roots"                     }, // Hardened Roots (id=210638, n_ranks=1)
  { 1160,  58,  32, 11,   3, 210557, "Honed Instincts"                    }, // Honed Instincts (id=210557, n_ranks=8)
  { 1161,  58,  32,  4,   3, 210570, "Razor Fangs"                        }, // Razor Fangs (id=210570, n_ranks=8)
  { 1162,  58,  32,  5,   3, 210571, "Feral Power"                        }, // Feral Power (id=210571, n_ranks=8)
  { 1163,  58,  32,  6,   3, 210575, "Powerful Bite"                      }, // Powerful Bite (id=210575, n_ranks=8)
  { 1164,  58,  32,  7,   3, 210579, "Ashamane's Energy"                  }, // Ashamane's Energy (id=210579, n_ranks=8)
  { 1165,  58,  32, 12,   3, 210590, "Attuned to Nature"                  }, // Attuned to Nature (id=210590, n_ranks=8)
  { 1166,  58,  32,  8,   3, 210593, "Tear the Flesh"                     }, // Tear the Flesh (id=210593, n_ranks=8)
  { 1167,  58,  32, 10,   3, 210631, "Feral Instinct"                     }, // Feral Instinct (id=210631, n_ranks=8)
  { 1168,  58,  32,  9,   3, 210637, "Sharpened Claws"                    }, // Sharpened Claws (id=210637, n_ranks=8)
  { 1193,  58,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1327,  58,   0,  0,   1, 214736, "Shredder Fangs"                     }, // Shredder Fangs (id=214736, n_ranks=1)
  { 1365,  58,   5,  0,  20, 214911, "Fangs of the First"                 }, // Fangs of the First (id=214911, n_ranks=20)
  { 1505,  58,  32, 13,   4, 238048, "Thrashing Claws"                    }, // Thrashing Claws (id=238048, n_ranks=8)
  { 1506,  58,   0,  0,   1, 238084, "Fury of Ashamane"                   }, // Fury of Ashamane (id=238084, n_ranks=1)
  { 1507,  58,   1,  0,   1, 238120, "Bloodletter's Frailty"              }, // Bloodletter's Frailty (id=238120, n_ranks=1)
  { 1508,  58,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1633,  58,   2,  0,   1, 241100, "Ferocity of the Cenarion Circle"    }, // Ferocity of the Cenarion Circle (id=241100, n_ranks=1)
  { 1034,  59,  32, 11,   3, 202302, "Bladed Feathers"                    }, // Bladed Feathers (id=202302, n_ranks=8)
  { 1035,  59,  32, 12,   3, 203018, "Touch of the Moon"                  }, // Touch of the Moon (id=203018, n_ranks=8)
  { 1036,  59,  32,  4,   3, 202384, "Dark Side of the Moon"              }, // Dark Side of the Moon (id=202384, n_ranks=8)
  { 1037,  59,  32,  5,   3, 202386, "Twilight Glow"                      }, // Twilight Glow (id=202386, n_ranks=8)
  { 1038,  59,  32,  6,   3, 202426, "Solar Stabbing"                     }, // Solar Stabbing (id=202426, n_ranks=8)
  { 1039,  59,  32,  7,   3, 202433, "Scythe of the Stars"                }, // Scythe of the Stars (id=202433, n_ranks=8)
  { 1040,  59,  32,  8,   3, 202445, "Falling Star"                       }, // Falling Star (id=202445, n_ranks=8)
  { 1041,  59,  32,  9,   3, 202466, "Sunfire Burns"                      }, // Sunfire Burns (id=202466, n_ranks=8)
  { 1042,  59,  32, 10,   3, 202464, "Empowerment"                        }, // Empowerment (id=202464, n_ranks=8)
  { 1043,  59,   0,  0,   1, 202890, "Rapid Innervation"                  }, // Rapid Innervation (id=202890, n_ranks=1)
  { 1044,  59,   0,  0,   1, 202918, "Light of the Sun"                   }, // Light of the Sun (id=202918, n_ranks=1)
  { 1045,  59,   0,  0,   1, 213682, "Sunblind"                           }, // Sunblind (id=213682, n_ranks=1)
  { 1046,  59,   1,  1,   1, 202940, "Moon and Stars"                     }, // Moon and Stars (id=202940, n_ranks=1)
  { 1047,  59,   1,  2,   1, 202996, "Power of Goldrinn"                  }, // Power of Goldrinn (id=202996, n_ranks=1)
  { 1048,  59,   1,  3,   1, 214508, "Echoing Stars"                      }, // Echoing Stars (id=214508, n_ranks=1)
  { 1049,  59,  18,  0,   0, 202767, "New Moon"                           }, // New Moon (id=202767, n_ranks=1)
  { 1192,  59,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1294,  59,   0,  0,   1, 214514, "Skywrath"                           }, // Skywrath (id=214514, n_ranks=1)
  { 1364,  59,   5,  0,  20, 214910, "Goldrinn's Fury"                    }, // Goldrinn's Fury (id=214910, n_ranks=20)
  { 1501,  59,  32, 13,   4, 238047, "Light of the Evening Star"          }, // Light of the Evening Star (id=238047, n_ranks=8)
  { 1502,  59,   0,  0,   1, 238083, "Wax and Wane"                       }, // Wax and Wane (id=238083, n_ranks=1)
  { 1503,  59,   1,  0,   1, 238119, "Circadian Invocation"               }, // Circadian Invocation (id=238119, n_ranks=1)
  { 1504,  59,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1632,  59,   2,  0,   1, 241099, "Radiance of the Cenarion Circle"    }, // Radiance of the Cenarion Circle (id=241099, n_ranks=1)
  { 1096,  60,  18,  0,   0, 207407, "Soul Carver"                        }, // Soul Carver (id=207407, n_ranks=1)
  { 1097,  60,   0,  0,   1, 212894, "Demonic Flames"                     }, // Demonic Flames (id=212894, n_ranks=1)
  { 1098,  60,   1,  1,   1, 207387, "Painbringer"                        }, // Painbringer (id=207387, n_ranks=1)
  { 1099,  60,  32,  4,   3, 207343, "Aldrachi Design"                    }, // Aldrachi Design (id=207343, n_ranks=8)
  { 1100,  60,  32,  5,   3, 207347, "Aura of Pain"                       }, // Aura of Pain (id=207347, n_ranks=8)
  { 1101,  60,  32,  6,   3, 207352, "Honed Warblades"                    }, // Honed Warblades (id=207352, n_ranks=8)
  { 1191,  60,   8,  0,   0, 211309, "Artificial Stamina"                 }, // Artificial Stamina (id=211309, n_ranks=1)
  { 1228,  60,   0,  0,   1, 212829, "Defensive Spikes"                   }, // Defensive Spikes (id=212829, n_ranks=1)
  { 1229,  60,  32,  7,   3, 207375, "Infernal Force"                     }, // Infernal Force (id=207375, n_ranks=8)
  { 1230,  60,  32,  8,   3, 212816, "Embrace the Pain"                   }, // Embrace the Pain (id=212816, n_ranks=8)
  { 1231,  60,  32,  9,   3, 212817, "Fiery Demise"                       }, // Fiery Demise (id=212817, n_ranks=8)
  { 1232,  60,  32, 10,   3, 212819, "Will of the Illidari"               }, // Will of the Illidari (id=212819, n_ranks=8)
  { 1233,  60,  32, 11,   3, 212821, "Devour Souls"                       }, // Devour Souls (id=212821, n_ranks=8)
  { 1234,  60,  32, 12,   3, 212827, "Shatter the Souls"                  }, // Shatter the Souls (id=212827, n_ranks=8)
  { 1235,  60,   1,  3,   1, 213010, "Charred Warblades"                  }, // Charred Warblades (id=213010, n_ranks=1)
  { 1236,  60,   1,  2,   1, 213017, "Fueled by Pain"                     }, // Fueled by Pain (id=213017, n_ranks=1)
  { 1328,  60,   0,  0,   1, 214744, "Tormented Souls"                    }, // Tormented Souls (id=214744, n_ranks=1)
  { 1363,  60,   5,  0,  20, 214909, "Soulgorger"                         }, // Soulgorger (id=214909, n_ranks=20)
  { 1434,  60,   0,  0,   1, 218910, "Siphon Power"                       }, // Siphon Power (id=218910, n_ranks=1)
  { 1452,  60,   8,  0,   0, 226829, "Artificial Damage"                  }, // Artificial Damage (id=226829, n_ranks=1)
  { 1497,  60,  32, 13,   4, 238046, "Lingering Ordeal"                   }, // Lingering Ordeal (id=238046, n_ranks=8)
  { 1498,  60,   0,  0,   1, 238082, "Erupting Souls"                     }, // Erupting Souls (id=238082, n_ranks=1)
  { 1499,  60,   1,  0,   1, 238118, "Flaming Soul"                       }, // Flaming Soul (id=238118, n_ranks=1)
  { 1500,  60,   5,  0,  50, 239042, "Concordance of the Legionfall"      }, // Concordance of the Legionfall (id=239042, n_ranks=100)
  { 1631,  60,   2,  0,   1, 241091, "Illidari Durability"                }, // Illidari Durability (id=241091, n_ranks=1)
  { 1089,  74,   0,  0,   0,      0, 0                                    },
  { 1237,  80,   1,  3,   1, 193108, "Blades of Light"                    }, // Blades of Light (id=193108, n_ranks=1)
  { 1238,  80,   0,  0,   1, 193058, "Healing Storm"                      }, // Healing Storm (id=193058, n_ranks=1)
  { 1239,  80,   0,  0,   1, 182234, "Unbreakable Will"                   }, // Unbreakable Will (id=182234, n_ranks=1)
  { 1240,  80,   0,  0,   1, 185086, "Endless Resolve"                    }, // Endless Resolve (id=185086, n_ranks=1)
  { 1241,  80,   1,  2,   1, 186788, "Echo of the Highlord"               }, // Echo of the Highlord (id=186788, n_ranks=1)
  { 1242,  80,   0,  7,   3, 186945, "Wrath of the Ashbringer"            }, // Wrath of the Ashbringer (id=186945, n_ranks=6)
  { 1243,  80,   0, 10,   3, 186944, "Protector of the Ashen Blade"       }, // Protector of the Ashen Blade (id=186944, n_ranks=6)
  { 1244,  80,   0,  9,   3, 185368, "Might of the Templar"               }, // Might of the Templar (id=185368, n_ranks=6)
  { 1245,  80,   0,  8,   3, 186927, "Deliver the Justice"                }, // Deliver the Justice (id=186927, n_ranks=6)
  { 1246,  80,   1,  1,   1, 186773, "Divine Tempest"                     }, // Divine Tempest (id=186773, n_ranks=1)
  { 1247,  80,   0, 12,   3, 184778, "Deflection"                         }, // Deflection (id=184778, n_ranks=6)
  { 1248,  80,   0, 11,   3, 186934, "Embrace the Light"                  }, // Embrace the Light (id=186934, n_ranks=6)
  { 1249,  80,   0,  6,   3, 184843, "Righteous Blade"                    }, // Righteous Blade (id=184843, n_ranks=6)
  { 1250,  80,   0,  5,   3, 184759, "Sharpened Edge"                     }, // Sharpened Edge (id=184759, n_ranks=6)
  { 1251,  80,   0,  4,   3, 186941, "Highlord's Judgment"                }, // Highlord's Judgment (id=186941, n_ranks=6)
  { 1252,  80,   1,  0,   1, 205273, "Wake of Ashes"                      }, // Wake of Ashes (id=205273, n_ranks=1)
  { 1253,  80,   2,  0,   1, 179546, "Ashes to Ashes"                     }, // Ashes to Ashes (id=179546, n_ranks=1)
  {    0,   0,   0,  0,   0,      0, 0                                    },
};
#define ARTIFACT_POWER_RANK_SIZE (7746)

// Artifact power rank data, wow build 26491
static struct artifact_power_rank_t __artifact_power_rank_data[ARTIFACT_POWER_RANK_SIZE] = {
  {  2316,   40,  0, 205273,      0.000, 0x00000000, 0 },
  {  2317,   41,  0, 186941,      8.000, 0x00000000, 0 },
  {  3199,   41,  1, 186941,     16.000, 0x00000000, 0 },
  {  3200,   41,  2, 186941,     24.000, 0x00000000, 0 },
  {  3201,   41,  3, 186941,     32.000, 0x00000000, 0 },
  {  3202,   41,  4, 186941,     40.000, 0x00000000, 0 },
  {  3203,   41,  5, 186941,     48.000, 0x00000000, 0 },
  {  7056,   41,  6, 186941,     56.000, 0x00000000, 0 },
  {  7057,   41,  7, 186941,     64.000, 0x00000000, 0 },
  {  2320,   42,  0, 184759,      6.000, 0x00000000, 0 },
  {  3204,   42,  1, 184759,     12.000, 0x00000000, 0 },
  {  3205,   42,  2, 184759,     18.000, 0x00000000, 0 },
  {  3206,   42,  3, 184759,     24.000, 0x00000000, 0 },
  {  3207,   42,  4, 184759,     30.000, 0x00000000, 0 },
  {  3208,   42,  5, 184759,     36.000, 0x00000000, 0 },
  {  7058,   42,  6, 184759,     42.000, 0x00000000, 0 },
  {  7059,   42,  7, 184759,     48.000, 0x00000000, 0 },
  {  2323,   43,  0, 184843,      4.000, 0x00000000, 0 },
  {  3209,   43,  1, 184843,      8.000, 0x00000000, 0 },
  {  3210,   43,  2, 184843,     12.000, 0x00000000, 0 },
  {  3211,   43,  3, 184843,     16.000, 0x00000000, 0 },
  {  3212,   43,  4, 184843,     20.000, 0x00000000, 0 },
  {  3213,   43,  5, 184843,     24.000, 0x00000000, 0 },
  {  7060,   43,  6, 184843,     28.000, 0x00000000, 0 },
  {  7061,   43,  7, 184843,     32.000, 0x00000000, 0 },
  {  2326,   44,  0, 186934,     15.000, 0x00000000, 0 },
  {  3214,   44,  1, 186934,     30.000, 0x00000000, 0 },
  {  3215,   44,  2, 186934,     45.000, 0x00000000, 0 },
  {  3216,   44,  3, 186934,     60.000, 0x00000000, 0 },
  {  3217,   44,  4, 186934,     75.000, 0x00000000, 0 },
  {  3218,   44,  5, 186934,     90.000, 0x00000000, 0 },
  {  7062,   44,  6, 186934,    105.000, 0x00000000, 0 },
  {  7063,   44,  7, 186934,    120.000, 0x00000000, 0 },
  {  2329,   47,  0, 184778, -10000.000, 0x00000000, 0 },
  {  3219,   47,  1, 184778, -20000.000, 0x00000000, 0 },
  {  3220,   47,  2, 184778, -30000.000, 0x00000000, 0 },
  {  3221,   47,  3, 184778, -40000.000, 0x00000000, 0 },
  {  3222,   47,  4, 184778, -50000.000, 0x00000000, 0 },
  {  3223,   47,  5, 184778, -60000.000, 0x00000000, 0 },
  {  7064,   47,  6, 184778, -70000.000, 0x00000000, 0 },
  {  7065,   47,  7, 184778, -80000.000, 0x00000000, 0 },
  {  2332,   49,  0, 186773,      0.000, 0x00000000, 0 },
  {  2333,   50,  0, 186927,      8.000, 0x00000000, 0 },
  {  3224,   50,  1, 186927,     16.000, 0x00000000, 0 },
  {  3225,   50,  2, 186927,     24.000, 0x00000000, 0 },
  {  3226,   50,  3, 186927,     32.000, 0x00000000, 0 },
  {  3227,   50,  4, 186927,     40.000, 0x00000000, 0 },
  {  3228,   50,  5, 186927,     48.000, 0x00000000, 0 },
  {  7066,   50,  6, 186927,     56.000, 0x00000000, 0 },
  {  7067,   50,  7, 186927,     64.000, 0x00000000, 0 },
  {  2336,   51,  0, 185368,      2.000, 0x00000000, 0 },
  {  3229,   51,  1, 185368,      4.000, 0x00000000, 0 },
  {  3230,   51,  2, 185368,      6.000, 0x00000000, 0 },
  {  3231,   51,  3, 185368,      8.000, 0x00000000, 0 },
  {  3232,   51,  4, 185368,     10.000, 0x00000000, 0 },
  {  3233,   51,  5, 185368,     12.000, 0x00000000, 0 },
  {  7068,   51,  6, 185368,     14.000, 0x00000000, 0 },
  {  7069,   51,  7, 185368,     16.000, 0x00000000, 0 },
  {  2339,   52,  0, 186944,    -10.000, 0x00000000, 0 },
  {  3234,   52,  1, 186944,    -20.000, 0x00000000, 0 },
  {  3235,   52,  2, 186944,    -30.000, 0x00000000, 0 },
  {  3236,   52,  3, 186944,    -40.000, 0x00000000, 0 },
  {  3237,   52,  4, 186944,    -50.000, 0x00000000, 0 },
  {  3238,   52,  5, 186944,    -60.000, 0x00000000, 0 },
  {  7070,   52,  6, 186944,    -70.000, 0x00000000, 0 },
  {  7071,   52,  7, 186944,    -80.000, 0x00000000, 0 },
  {  2342,   53,  0, 186945,   2000.000, 0x00000000, 0 },
  {  3239,   53,  1, 186945,   4000.000, 0x00000000, 0 },
  {  3240,   53,  2, 186945,   6000.000, 0x00000000, 0 },
  {  3241,   53,  3, 186945,   8000.000, 0x00000000, 0 },
  {  3242,   53,  4, 186945,  10000.000, 0x00000000, 0 },
  {  3243,   53,  5, 186945,  12000.000, 0x00000000, 0 },
  {  7072,   53,  6, 186945,  14000.000, 0x00000000, 0 },
  {  7073,   53,  7, 186945,  16000.000, 0x00000000, 0 },
  {  2345,   54,  0, 186788,      0.000, 0x00000000, 0 },
  {  2380,   72,  0, 187304,      3.000, 0x00000000, 0 },
  {  3514,   72,  1, 187304,      6.000, 0x00000000, 0 },
  {  3515,   72,  2, 187304,     10.000, 0x00000000, 0 },
  {  3516,   72,  3, 187304,     13.000, 0x00000000, 0 },
  {  3517,   72,  4, 187304,     16.000, 0x00000000, 0 },
  {  3518,   72,  5, 187304,     20.000, 0x00000000, 0 },
  {  6948,   72,  6, 187304,     23.000, 0x00000000, 0 },
  {  6949,   72,  7, 187304,     26.000, 0x00000000, 0 },
  {  2383,   73,  0, 188006,      0.000, 0x00000000, 0 },
  {  2384,   74,  0, 187258,      2.000, 0x00000000, 0 },
  {  3519,   74,  1, 187258,      4.000, 0x00000000, 0 },
  {  3520,   74,  2, 187258,      6.000, 0x00000000, 0 },
  {  3521,   74,  3, 187258,      8.000, 0x00000000, 0 },
  {  3522,   74,  4, 187258,     10.000, 0x00000000, 0 },
  {  3523,   74,  5, 187258,     12.000, 0x00000000, 0 },
  {  6950,   74,  6, 187258,     14.000, 0x00000000, 0 },
  {  6951,   74,  7, 187258,     16.000, 0x00000000, 0 },
  {  2387,   75,  0, 187321,      1.000, 0x00000000, 0 },
  {  3524,   75,  1, 187321,      2.000, 0x00000000, 0 },
  {  3525,   75,  2, 187321,      3.000, 0x00000000, 0 },
  {  3526,   75,  3, 187321,      4.000, 0x00000000, 0 },
  {  3527,   75,  4, 187321,      5.000, 0x00000000, 0 },
  {  3528,   75,  5, 187321,      6.000, 0x00000000, 0 },
  {  6952,   75,  6, 187321,      7.000, 0x00000000, 0 },
  {  6953,   75,  7, 187321,      8.000, 0x00000000, 0 },
  {  2393,   77,  0, 187313,      3.000, 0x00000000, 0 },
  {  3534,   77,  1, 187313,      6.000, 0x00000000, 0 },
  {  3535,   77,  2, 187313,     10.000, 0x00000000, 0 },
  {  3536,   77,  3, 187313,     13.000, 0x00000000, 0 },
  {  3537,   77,  4, 187313,     16.000, 0x00000000, 0 },
  {  3538,   77,  5, 187313,     20.000, 0x00000000, 0 },
  {  6954,   77,  6, 187313,     23.000, 0x00000000, 0 },
  {  6955,   77,  7, 187313,     26.000, 0x00000000, 0 },
  {  2396,   78,  0, 187310,      0.000, 0x00000000, 0 },
  {  2399,   79,  0, 187287,      2.000, 0x00000000, 0 },
  {  3544,   79,  1, 187287,      4.000, 0x00000000, 0 },
  {  3545,   79,  2, 187287,      6.000, 0x00000000, 0 },
  {  3546,   79,  3, 187287,      8.000, 0x00000000, 0 },
  {  3547,   79,  4, 187287,     10.000, 0x00000000, 0 },
  {  3548,   79,  5, 187287,     12.000, 0x00000000, 0 },
  {  6956,   79,  6, 187287,     14.000, 0x00000000, 0 },
  {  6957,   79,  7, 187287,     16.000, 0x00000000, 0 },
  {  2402,   80,  0, 215463,      0.000, 0x00000000, 0 },
  {  2405,   81,  0, 187276,      1.000, 0x00000000, 0 },
  {  3554,   81,  1, 187276,      2.000, 0x00000000, 0 },
  {  3555,   81,  2, 187276,      3.000, 0x00000000, 0 },
  {  3556,   81,  3, 187276,      4.000, 0x00000000, 0 },
  {  3557,   81,  4, 187276,      5.000, 0x00000000, 0 },
  {  3558,   81,  5, 187276,      6.000, 0x00000000, 0 },
  {  6958,   81,  6, 187276,      7.000, 0x00000000, 0 },
  {  6959,   81,  7, 187276,      8.000, 0x00000000, 0 },
  {  2408,   82,  0, 187264,   1000.000, 0x00000000, 0 },
  {  3559,   82,  1, 187264,   2000.000, 0x00000000, 0 },
  {  3560,   82,  2, 187264,   3000.000, 0x00000000, 0 },
  {  3561,   82,  3, 187264,   4000.000, 0x00000000, 0 },
  {  3562,   82,  4, 187264,   5000.000, 0x00000000, 0 },
  {  3563,   82,  5, 187264,   6000.000, 0x00000000, 0 },
  {  6960,   82,  6, 187264,   7000.000, 0x00000000, 0 },
  {  6961,   82,  7, 187264,   8000.000, 0x00000000, 0 },
  {  2411,   83,  0, 187301,      1.000, 0x00000000, 0 },
  {  3564,   83,  1, 187301,      2.000, 0x00000000, 0 },
  {  3565,   83,  2, 187301,      3.000, 0x00000000, 0 },
  {  3566,   83,  3, 187301,      4.000, 0x00000000, 0 },
  {  3567,   83,  4, 187301,      5.000, 0x00000000, 0 },
  {  3568,   83,  5, 187301,      6.000, 0x00000000, 0 },
  {  6962,   83,  6, 187301,      7.000, 0x00000000, 0 },
  {  6963,   83,  7, 187301,      8.000, 0x00000000, 0 },
  {  2414,   84,  0, 210716,     20.000, 0x00000000, 0 },
  {  5142,   84,  1, 210716,     40.000, 0x00000000, 0 },
  {  5143,   84,  2, 210716,     60.000, 0x00000000, 0 },
  {  5144,   84,  3, 210716,     80.000, 0x00000000, 0 },
  {  5145,   84,  4, 210716,    100.000, 0x00000000, 0 },
  {  5146,   84,  5, 210716,    120.000, 0x00000000, 0 },
  {  6964,   84,  6, 210716,    140.000, 0x00000000, 0 },
  {  6965,   84,  7, 210716,    160.000, 0x00000000, 0 },
  {  2420,   86,  0, 210725,      0.000, 0x00000000, 0 },
  {  2421,   87,  0, 187680,      0.000, 0x00000000, 0 },
  {  2422,   91,  0, 203524,      0.000, 0x00000000, 0 },
  {  2423,   92,  0, 189059,      0.000, 0x00000000, 0 },
  {  2424,   93,  0, 203576,      0.000, 0x00000000, 0 },
  {  2425,   94,  0, 188778,      0.000, 0x00000000, 0 },
  {  2426,   95,  0, 188635,      2.000, 0x00000000, 0 },
  {  3469,   95,  1, 188635,      4.000, 0x00000000, 0 },
  {  3470,   95,  2, 188635,      6.000, 0x00000000, 0 },
  {  3471,   95,  3, 188635,      8.000, 0x00000000, 0 },
  {  3472,   95,  4, 188635,     10.000, 0x00000000, 0 },
  {  3473,   95,  5, 188635,     12.000, 0x00000000, 0 },
  {  7358,   95,  6, 188635,     14.000, 0x00000000, 0 },
  {  7359,   95,  7, 188635,     16.000, 0x00000000, 0 },
  {  2429,   96,  0, 216272,      6.000, 0x00000000, 0 },
  {  6463,   96,  1, 216272,     12.000, 0x00000000, 0 },
  {  6464,   96,  2, 216272,     18.000, 0x00000000, 0 },
  {  6465,   96,  3, 216272,     24.000, 0x00000000, 0 },
  {  6466,   96,  4, 216272,     30.000, 0x00000000, 0 },
  {  6467,   96,  5, 216272,     36.000, 0x00000000, 0 },
  {  7350,   96,  6, 216272,     42.000, 0x00000000, 0 },
  {  7351,   96,  7, 216272,     48.000, 0x00000000, 0 },
  {  2432,   97,  0, 188651,      0.000, 0x00000000, 0 },
  {  2433,   98,  0, 188683,     10.000, 0x00000000, 0 },
  {  3479,   98,  1, 188683,     20.000, 0x00000000, 0 },
  {  3480,   98,  2, 188683,     30.000, 0x00000000, 0 },
  {  3481,   98,  3, 188683,     40.000, 0x00000000, 0 },
  {  3482,   98,  4, 188683,     50.000, 0x00000000, 0 },
  {  3483,   98,  5, 188683,     60.000, 0x00000000, 0 },
  {  7360,   98,  6, 188683,     70.000, 0x00000000, 0 },
  {  7361,   98,  7, 188683,     80.000, 0x00000000, 0 },
  {  2436,   99,  0, 203230,  -2000.000, 0x00000000, 0 },
  {  4801,   99,  1, 203230,  -4000.000, 0x00000000, 0 },
  {  4802,   99,  2, 203230,  -6000.000, 0x00000000, 0 },
  {  4803,   99,  3, 203230,  -8000.000, 0x00000000, 0 },
  {  4804,   99,  4, 203230, -10000.000, 0x00000000, 0 },
  {  4805,   99,  5, 203230, -12000.000, 0x00000000, 0 },
  {  7348,   99,  6, 203230, -14000.000, 0x00000000, 0 },
  {  7349,   99,  7, 203230, -16000.000, 0x00000000, 0 },
  {  2439,  100,  0, 203225,      2.000, 0x00000000, 0 },
  {  4806,  100,  1, 203225,      4.000, 0x00000000, 0 },
  {  4807,  100,  2, 203225,      6.000, 0x00000000, 0 },
  {  4808,  100,  3, 203225,      8.000, 0x00000000, 0 },
  {  4809,  100,  4, 203225,     10.000, 0x00000000, 0 },
  {  4810,  100,  5, 203225,     12.000, 0x00000000, 0 },
  {  7344,  100,  6, 203225,     14.000, 0x00000000, 0 },
  {  7345,  100,  7, 203225,     16.000, 0x00000000, 0 },
  {  2442,  101,  0, 203227,    100.000, 0x00000000, 0 },
  {  4795,  101,  1, 203227,    200.000, 0x00000000, 0 },
  {  4796,  101,  2, 203227,    300.000, 0x00000000, 0 },
  {  4797,  101,  3, 203227,    400.000, 0x00000000, 0 },
  {  4798,  101,  4, 203227,    500.000, 0x00000000, 0 },
  {  4799,  101,  5, 203227,    600.000, 0x00000000, 0 },
  {  7346,  101,  6, 203227,    700.000, 0x00000000, 0 },
  {  7347,  101,  7, 203227,    800.000, 0x00000000, 0 },
  {  2445,  102,  0, 188639,      5.000, 0x00000000, 0 },
  {  3499,  102,  1, 188639,     10.000, 0x00000000, 0 },
  {  3500,  102,  2, 188639,     15.000, 0x00000000, 0 },
  {  3501,  102,  3, 188639,     20.000, 0x00000000, 0 },
  {  3502,  102,  4, 188639,     25.000, 0x00000000, 0 },
  {  3503,  102,  5, 188639,     30.000, 0x00000000, 0 },
  {  7352,  102,  6, 188639,     35.000, 0x00000000, 0 },
  {  7353,  102,  7, 188639,     40.000, 0x00000000, 0 },
  {  2448,  103,  0, 203261,      0.000, 0x00000000, 0 },
  {  2449,  104,  0, 188672,      0.000, 0x00000000, 0 },
  {  2450,  105,  0, 188632,      1.000, 0x00000000, 0 },
  {  3504,  105,  1, 188632,      2.000, 0x00000000, 0 },
  {  3505,  105,  2, 188632,      3.000, 0x00000000, 0 },
  {  3506,  105,  3, 188632,      4.000, 0x00000000, 0 },
  {  3507,  105,  4, 188632,      5.000, 0x00000000, 0 },
  {  3508,  105,  5, 188632,      6.000, 0x00000000, 0 },
  {  7356,  105,  6, 188632,      7.000, 0x00000000, 0 },
  {  7357,  105,  7, 188632,      8.000, 0x00000000, 0 },
  {  2453,  106,  0, 188644,     10.000, 0x00000000, 0 },
  {  3509,  106,  1, 188644,     20.000, 0x00000000, 0 },
  {  3510,  106,  2, 188644,     30.000, 0x00000000, 0 },
  {  3511,  106,  3, 188644,     40.000, 0x00000000, 0 },
  {  3512,  106,  4, 188644,     50.000, 0x00000000, 0 },
  {  3513,  106,  5, 188644,     60.000, 0x00000000, 0 },
  {  7354,  106,  6, 188644,     70.000, 0x00000000, 0 },
  {  7355,  106,  7, 188644,     80.000, 0x00000000, 0 },
  {  2457,  108,  0, 189080,      1.000, 0x00000000, 0 },
  {  3595,  108,  1, 189080,      2.000, 0x00000000, 0 },
  {  3596,  108,  2, 189080,      3.000, 0x00000000, 0 },
  {  3597,  108,  3, 189080,      4.000, 0x00000000, 0 },
  {  3598,  108,  4, 189080,      5.000, 0x00000000, 0 },
  {  3599,  108,  5, 189080,      6.000, 0x00000000, 0 },
  {  6529,  108,  6, 189080,      7.000, 0x00000000, 0 },
  {  6530,  108,  7, 189080,      8.000, 0x00000000, 0 },
  {  2460,  109,  0, 189086,      6.000, 0x00000000, 0 },
  {  3600,  109,  1, 189086,     12.000, 0x00000000, 0 },
  {  3601,  109,  2, 189086,     18.000, 0x00000000, 0 },
  {  3602,  109,  3, 189086,     24.000, 0x00000000, 0 },
  {  3603,  109,  4, 189086,     30.000, 0x00000000, 0 },
  {  3604,  109,  5, 189086,     36.000, 0x00000000, 0 },
  {  6531,  109,  6, 189086,     42.000, 0x00000000, 0 },
  {  6532,  109,  7, 189086,     48.000, 0x00000000, 0 },
  {  2463,  110,  0, 189092,     10.000, 0x00000000, 0 },
  {  3605,  110,  1, 189092,     20.000, 0x00000000, 0 },
  {  3606,  110,  2, 189092,     30.000, 0x00000000, 0 },
  {  3607,  110,  3, 189092,     40.000, 0x00000000, 0 },
  {  3608,  110,  4, 189092,     50.000, 0x00000000, 0 },
  {  3609,  110,  5, 189092,     60.000, 0x00000000, 0 },
  {  6533,  110,  6, 189092,     70.000, 0x00000000, 0 },
  {  6534,  110,  7, 189092,     80.000, 0x00000000, 0 },
  {  2466,  111,  0, 189097,     30.000, 0x00000000, 0 },
  {  3610,  111,  1, 189097,     60.000, 0x00000000, 0 },
  {  3611,  111,  2, 189097,     90.000, 0x00000000, 0 },
  {  3612,  111,  3, 189097,    120.000, 0x00000000, 0 },
  {  3613,  111,  4, 189097,    150.000, 0x00000000, 0 },
  {  3614,  111,  5, 189097,    180.000, 0x00000000, 0 },
  {  6535,  111,  6, 189097,    210.000, 0x00000000, 0 },
  {  6536,  111,  7, 189097,    240.000, 0x00000000, 0 },
  {  2472,  113,  0, 189144,     12.000, 0x00000000, 0 },
  {  3620,  113,  1, 189144,     24.000, 0x00000000, 0 },
  {  3621,  113,  2, 189144,     36.000, 0x00000000, 0 },
  {  3622,  113,  3, 189144,     48.000, 0x00000000, 0 },
  {  3623,  113,  4, 189144,     60.000, 0x00000000, 0 },
  {  3624,  113,  5, 189144,     72.000, 0x00000000, 0 },
  {  6537,  113,  6, 189144,     84.000, 0x00000000, 0 },
  {  6538,  113,  7, 189144,     96.000, 0x00000000, 0 },
  {  2475,  114,  0, 189147,     15.000, 0x00000000, 0 },
  {  3625,  114,  1, 189147,     30.000, 0x00000000, 0 },
  {  3626,  114,  2, 189147,     45.000, 0x00000000, 0 },
  {  3627,  114,  3, 189147,     60.000, 0x00000000, 0 },
  {  3628,  114,  4, 189147,     75.000, 0x00000000, 0 },
  {  3629,  114,  5, 189147,     90.000, 0x00000000, 0 },
  {  6539,  114,  6, 189147,    105.000, 0x00000000, 0 },
  {  6540,  114,  7, 189147,    120.000, 0x00000000, 0 },
  {  2478,  115,  0, 189154,    100.000, 0x00000000, 0 },
  {  3630,  115,  1, 189154,    200.000, 0x00000000, 0 },
  {  3631,  115,  2, 189154,    300.000, 0x00000000, 0 },
  {  3632,  115,  3, 189154,    400.000, 0x00000000, 0 },
  {  3633,  115,  4, 189154,    500.000, 0x00000000, 0 },
  {  3634,  115,  5, 189154,    600.000, 0x00000000, 0 },
  {  6541,  115,  6, 189154,    700.000, 0x00000000, 0 },
  {  6542,  115,  7, 189154,    800.000, 0x00000000, 0 },
  {  2484,  117,  0, 189164,      5.000, 0x00000000, 0 },
  {  3635,  117,  1, 189164,     10.000, 0x00000000, 0 },
  {  3636,  117,  2, 189164,     15.000, 0x00000000, 0 },
  {  3637,  117,  3, 189164,     20.000, 0x00000000, 0 },
  {  3638,  117,  4, 189164,     25.000, 0x00000000, 0 },
  {  3639,  117,  5, 189164,     30.000, 0x00000000, 0 },
  {  6543,  117,  6, 189164,     35.000, 0x00000000, 0 },
  {  6544,  117,  7, 189164,     40.000, 0x00000000, 0 },
  {  2490,  119,  0, 189179,      0.000, 0x00000000, 0 },
  {  2491,  120,  0, 189180,      0.000, 0x00000000, 0 },
  {  2493,  122,  0, 189186,      0.000, 0x00000000, 0 },
  {  2494,  123,  0, 189185,      0.000, 0x00000000, 0 },
  {  2495,  124,  0, 190778,      0.000, 0x00000000, 0 },
  {  2496,  125,  0, 208253,      0.000, 0x00000000, 0 },
  {  2497,  126,  0, 189849,      0.000, 0x00000000, 0 },
  {  2498,  127,  0, 189857,      0.000, 0x00000000, 0 },
  {  2499,  128,  0, 189870,      0.000, 0x00000000, 0 },
  {  2500,  129,  0, 189787,      0.000, 0x00000000, 0 },
  {  2501,  130,  0, 189772,      2.000, 0x00000000, 0 },
  {  3424,  130,  1, 189772,      4.000, 0x00000000, 0 },
  {  3425,  130,  2, 189772,      6.000, 0x00000000, 0 },
  {  3426,  130,  3, 189772,      8.000, 0x00000000, 0 },
  {  3427,  130,  4, 189772,     10.000, 0x00000000, 0 },
  {  3428,  130,  5, 189772,     12.000, 0x00000000, 0 },
  {  6876,  130,  6, 189772,     14.000, 0x00000000, 0 },
  {  6877,  130,  7, 189772,     16.000, 0x00000000, 0 },
  {  2504,  131,  0, 189768,      8.000, 0x00000000, 0 },
  {  3429,  131,  1, 189768,     16.000, 0x00000000, 0 },
  {  3430,  131,  2, 189768,     24.000, 0x00000000, 0 },
  {  3431,  131,  3, 189768,     32.000, 0x00000000, 0 },
  {  3432,  131,  4, 189768,     40.000, 0x00000000, 0 },
  {  3433,  131,  5, 189768,     48.000, 0x00000000, 0 },
  {  6878,  131,  6, 189768,     56.000, 0x00000000, 0 },
  {  6879,  131,  7, 189768,     64.000, 0x00000000, 0 },
  {  2507,  132,  0, 189760,      5.000, 0x00000000, 0 },
  {  3434,  132,  1, 189760,     10.000, 0x00000000, 0 },
  {  3435,  132,  2, 189760,     15.000, 0x00000000, 0 },
  {  3436,  132,  3, 189760,     20.000, 0x00000000, 0 },
  {  3437,  132,  4, 189760,     25.000, 0x00000000, 0 },
  {  3438,  132,  5, 189760,     30.000, 0x00000000, 0 },
  {  6880,  132,  6, 189760,     35.000, 0x00000000, 0 },
  {  6881,  132,  7, 189760,     40.000, 0x00000000, 0 },
  {  2510,  133,  0, 189757,     -2.000, 0x00000000, 0 },
  {  3439,  133,  1, 189757,     -4.000, 0x00000000, 0 },
  {  3440,  133,  2, 189757,     -6.000, 0x00000000, 0 },
  {  3441,  133,  3, 189757,     -8.000, 0x00000000, 0 },
  {  3442,  133,  4, 189757,    -10.000, 0x00000000, 0 },
  {  3443,  133,  5, 189757,    -12.000, 0x00000000, 0 },
  {  6882,  133,  6, 189757,    -14.000, 0x00000000, 0 },
  {  6883,  133,  7, 189757,    -16.000, 0x00000000, 0 },
  {  2513,  134,  0, 189754,     -2.000, 0x00000000, 0 },
  {  3444,  134,  1, 189754,     -4.000, 0x00000000, 0 },
  {  3445,  134,  2, 189754,     -6.000, 0x00000000, 0 },
  {  3446,  134,  3, 189754,     -8.000, 0x00000000, 0 },
  {  3447,  134,  4, 189754,    -10.000, 0x00000000, 0 },
  {  3448,  134,  5, 189754,    -12.000, 0x00000000, 0 },
  {  6884,  134,  6, 189754,    -14.000, 0x00000000, 0 },
  {  6885,  134,  7, 189754,    -16.000, 0x00000000, 0 },
  {  2516,  135,  0, 189749,     10.000, 0x00000000, 0 },
  {  3449,  135,  1, 189749,     20.000, 0x00000000, 0 },
  {  3450,  135,  2, 189749,     30.000, 0x00000000, 0 },
  {  3451,  135,  3, 189749,     40.000, 0x00000000, 0 },
  {  3452,  135,  4, 189749,     50.000, 0x00000000, 0 },
  {  3453,  135,  5, 189749,     60.000, 0x00000000, 0 },
  {  6886,  135,  6, 189749,     70.000, 0x00000000, 0 },
  {  6887,  135,  7, 189749,     80.000, 0x00000000, 0 },
  {  2519,  136,  0, 189744,      3.000, 0x00000000, 0 },
  {  3454,  136,  1, 189744,      6.000, 0x00000000, 0 },
  {  3455,  136,  2, 189744,     10.000, 0x00000000, 0 },
  {  3456,  136,  3, 189744,     13.000, 0x00000000, 0 },
  {  3457,  136,  4, 189744,     16.000, 0x00000000, 0 },
  {  3458,  136,  5, 189744,     20.000, 0x00000000, 0 },
  {  6888,  136,  6, 189744,     23.000, 0x00000000, 0 },
  {  6889,  136,  7, 189744,     26.000, 0x00000000, 0 },
  {  2522,  137,  0, 186396,   1000.000, 0x00000000, 0 },
  {  3459,  137,  1, 186396,   2000.000, 0x00000000, 0 },
  {  3460,  137,  2, 186396,   3000.000, 0x00000000, 0 },
  {  3461,  137,  3, 186396,   4000.000, 0x00000000, 0 },
  {  3462,  137,  4, 186396,   5000.000, 0x00000000, 0 },
  {  3463,  137,  5, 186396,   6000.000, 0x00000000, 0 },
  {  6890,  137,  6, 186396,   7000.000, 0x00000000, 0 },
  {  6891,  137,  7, 186396,   8000.000, 0x00000000, 0 },
  {  2525,  138,  0, 186393,      0.000, 0x00000000, 0 },
  {  2526,  139,  0, 186372,      0.000, 0x00000000, 0 },
  {  2527,  140,  0, 186320,      1.000, 0x00000000, 0 },
  {  3464,  140,  1, 186320,      2.000, 0x00000000, 0 },
  {  3465,  140,  2, 186320,      3.000, 0x00000000, 0 },
  {  3466,  140,  3, 186320,      4.000, 0x00000000, 0 },
  {  3467,  140,  4, 186320,      5.000, 0x00000000, 0 },
  {  3468,  140,  5, 186320,      6.000, 0x00000000, 0 },
  {  6892,  140,  6, 186320,      7.000, 0x00000000, 0 },
  {  6893,  140,  7, 186320,      8.000, 0x00000000, 0 },
  {  2530,  149,  0, 220143,      0.000, 0x00000000, 0 },
  {  2531,  150,  0, 191760,      0.000, 0x00000000, 0 },
  {  2532,  151,  0, 191741,      0.000, 0x00000000, 0 },
  {  2533,  152,  0, 191747,      0.000, 0x00000000, 0 },
  {  2534,  153,  0, 191637,      0.000, 0x00000000, 0 },
  {  2535,  154,  0, 191731,      0.000, 0x00000000, 0 },
  {  2536,  156,  0, 191419,      7.000, 0x00000000, 0 },
  {  3645,  156,  1, 191419,     14.000, 0x00000000, 0 },
  {  3646,  156,  2, 191419,     21.000, 0x00000000, 0 },
  {  3647,  156,  3, 191419,     28.000, 0x00000000, 0 },
  {  3648,  156,  4, 191419,     35.000, 0x00000000, 0 },
  {  3649,  156,  5, 191419,     42.000, 0x00000000, 0 },
  {  6761,  156,  6, 191419,     49.000, 0x00000000, 0 },
  {  6762,  156,  7, 191419,     56.000, 0x00000000, 0 },
  {  2539,  157,  0, 191442,      7.000, 0x00000000, 0 },
  {  3650,  157,  1, 191442,     14.000, 0x00000000, 0 },
  {  3651,  157,  2, 191442,     21.000, 0x00000000, 0 },
  {  3652,  157,  3, 191442,     28.000, 0x00000000, 0 },
  {  3653,  157,  4, 191442,     35.000, 0x00000000, 0 },
  {  3654,  157,  5, 191442,     42.000, 0x00000000, 0 },
  {  6763,  157,  6, 191442,     49.000, 0x00000000, 0 },
  {  6764,  157,  7, 191442,     56.000, 0x00000000, 0 },
  {  2542,  158,  0, 191485,      7.000, 0x00000000, 0 },
  {  3655,  158,  1, 191485,     14.000, 0x00000000, 0 },
  {  3656,  158,  2, 191485,     21.000, 0x00000000, 0 },
  {  3657,  158,  3, 191485,     28.000, 0x00000000, 0 },
  {  3658,  158,  4, 191485,     35.000, 0x00000000, 0 },
  {  3659,  158,  5, 191485,     42.000, 0x00000000, 0 },
  {  6765,  158,  6, 191485,     49.000, 0x00000000, 0 },
  {  6766,  158,  7, 191485,     56.000, 0x00000000, 0 },
  {  2545,  262,  0, 191565,      8.000, 0x00000000, 0 },
  {  3670,  262,  1, 191565,     16.000, 0x00000000, 0 },
  {  3671,  262,  2, 191565,     24.000, 0x00000000, 0 },
  {  3672,  262,  3, 191565,     32.000, 0x00000000, 0 },
  {  3673,  262,  4, 191565,     40.000, 0x00000000, 0 },
  {  3674,  262,  5, 191565,     48.000, 0x00000000, 0 },
  {  6767,  262,  6, 191565,     56.000, 0x00000000, 0 },
  {  6768,  262,  7, 191565,     64.000, 0x00000000, 0 },
  {  2548,  263,  0, 191721,      0.000, 0x00000000, 0 },
  {  2549,  264,  0, 191592,      0.000, 0x00000000, 0 },
  {  2550,  264,  1, 191593,      0.000, 0x00000000, 0 },
  {  2551,  264,  2, 191594,      0.000, 0x00000000, 0 },
  {  6505,  264,  3, 224466,      0.000, 0x00000000, 0 },
  {  6506,  264,  4, 224467,      0.000, 0x00000000, 0 },
  {  6507,  264,  5, 224468,      0.000, 0x00000000, 0 },
  {  6769,  264,  6, 239106,      0.000, 0x00000000, 0 },
  {  6770,  264,  7, 239107,      0.000, 0x00000000, 0 },
  {  2552,  265,  0, 191494,      3.000, 0x00000000, 0 },
  {  3665,  265,  1, 191494,      6.000, 0x00000000, 0 },
  {  3666,  265,  2, 191494,     10.000, 0x00000000, 0 },
  {  3667,  265,  3, 191494,     13.000, 0x00000000, 0 },
  {  3668,  265,  4, 191494,     16.000, 0x00000000, 0 },
  {  3669,  265,  5, 191494,     20.000, 0x00000000, 0 },
  {  6771,  265,  6, 191494,     23.000, 0x00000000, 0 },
  {  6772,  265,  7, 191494,     26.000, 0x00000000, 0 },
  {  2555,  266,  0, 191488,     10.000, 0x00000000, 0 },
  {  3660,  266,  1, 191488,     20.000, 0x00000000, 0 },
  {  3661,  266,  2, 191488,     30.000, 0x00000000, 0 },
  {  3662,  266,  3, 191488,     40.000, 0x00000000, 0 },
  {  3663,  266,  4, 191488,     50.000, 0x00000000, 0 },
  {  3664,  266,  5, 191488,     60.000, 0x00000000, 0 },
  {  6773,  266,  6, 191488,     70.000, 0x00000000, 0 },
  {  6774,  266,  7, 191488,     80.000, 0x00000000, 0 },
  {  2558,  267,  0, 191584,     -5.000, 0x00000000, 0 },
  {  3675,  267,  1, 191584,    -10.000, 0x00000000, 0 },
  {  3676,  267,  2, 191584,    -15.000, 0x00000000, 0 },
  {  3677,  267,  3, 191584,    -20.000, 0x00000000, 0 },
  {  3678,  267,  4, 191584,    -25.000, 0x00000000, 0 },
  {  3679,  267,  5, 191584,    -30.000, 0x00000000, 0 },
  {  6775,  267,  6, 191584,    -35.000, 0x00000000, 0 },
  {  6776,  267,  7, 191584,    -40.000, 0x00000000, 0 },
  {  2561,  272,  0, 192450,      2.000, 0x00000000, 0 },
  {  3685,  272,  1, 192450,      4.000, 0x00000000, 0 },
  {  3686,  272,  2, 192450,      6.000, 0x00000000, 0 },
  {  3687,  272,  3, 192450,      8.000, 0x00000000, 0 },
  {  3688,  272,  4, 192450,     10.000, 0x00000000, 0 },
  {  3689,  272,  5, 192450,     12.000, 0x00000000, 0 },
  {  6592,  272,  6, 192450,     14.000, 0x00000000, 0 },
  {  6593,  272,  7, 192450,     16.000, 0x00000000, 0 },
  {  2564,  273,  0, 192453,      1.000, 0x00000000, 0 },
  {  3690,  273,  1, 192453,      2.000, 0x00000000, 0 },
  {  3691,  273,  2, 192453,      3.000, 0x00000000, 0 },
  {  3692,  273,  3, 192453,      4.000, 0x00000000, 0 },
  {  3693,  273,  4, 192453,      5.000, 0x00000000, 0 },
  {  3694,  273,  5, 192453,      6.000, 0x00000000, 0 },
  {  6594,  273,  6, 192453,      7.000, 0x00000000, 0 },
  {  6595,  273,  7, 192453,      8.000, 0x00000000, 0 },
  {  2567,  274,  0, 192447,      1.000, 0x00000000, 0 },
  {  3680,  274,  1, 192447,      2.000, 0x00000000, 0 },
  {  3681,  274,  2, 192447,      3.000, 0x00000000, 0 },
  {  3682,  274,  3, 192447,      4.000, 0x00000000, 0 },
  {  3683,  274,  4, 192447,      5.000, 0x00000000, 0 },
  {  3684,  274,  5, 192447,      6.000, 0x00000000, 0 },
  {  6596,  274,  6, 192447,      7.000, 0x00000000, 0 },
  {  6597,  274,  7, 192447,      8.000, 0x00000000, 0 },
  {  2570,  275,  0, 192457,      3.000, 0x00000000, 0 },
  {  3695,  275,  1, 192457,      6.000, 0x00000000, 0 },
  {  3696,  275,  2, 192457,      9.000, 0x00000000, 0 },
  {  3697,  275,  3, 192457,     12.000, 0x00000000, 0 },
  {  3698,  275,  4, 192457,     15.000, 0x00000000, 0 },
  {  3699,  275,  5, 192457,     18.000, 0x00000000, 0 },
  {  6598,  275,  6, 192457,     21.000, 0x00000000, 0 },
  {  6599,  275,  7, 192457,     24.000, 0x00000000, 0 },
  {  2573,  276,  0, 192460,      4.000, 0x00000000, 0 },
  {  3700,  276,  1, 192460,      8.000, 0x00000000, 0 },
  {  3701,  276,  2, 192460,     12.000, 0x00000000, 0 },
  {  3702,  276,  3, 192460,     16.000, 0x00000000, 0 },
  {  3703,  276,  4, 192460,     20.000, 0x00000000, 0 },
  {  3704,  276,  5, 192460,     24.000, 0x00000000, 0 },
  {  6604,  276,  6, 192460,     28.000, 0x00000000, 0 },
  {  6605,  276,  7, 192460,     32.000, 0x00000000, 0 },
  {  2576,  277,  0, 192542,      0.000, 0x00000000, 0 },
  {  2577,  277,  1, 192543,      0.000, 0x00000000, 0 },
  {  2578,  277,  2, 192544,      0.000, 0x00000000, 0 },
  {  4974,  277,  3, 208793,      0.000, 0x00000000, 0 },
  {  4975,  277,  4, 208794,      0.000, 0x00000000, 0 },
  {  4976,  277,  5, 208795,      0.000, 0x00000000, 0 },
  {  6600,  277,  6, 238686,      0.000, 0x00000000, 0 },
  {  6601,  277,  7, 238687,      0.000, 0x00000000, 0 },
  {  2579,  278,  0, 192464,      4.000, 0x00000000, 0 },
  {  3705,  278,  1, 192464,      8.000, 0x00000000, 0 },
  {  3706,  278,  2, 192464,     12.000, 0x00000000, 0 },
  {  3707,  278,  3, 192464,     16.000, 0x00000000, 0 },
  {  3708,  278,  4, 192464,     20.000, 0x00000000, 0 },
  {  3709,  278,  5, 192464,     24.000, 0x00000000, 0 },
  {  6602,  278,  6, 192464,     28.000, 0x00000000, 0 },
  {  6603,  278,  7, 192464,     32.000, 0x00000000, 0 },
  {  2582,  279,  0, 192514,   2000.000, 0x00000000, 0 },
  {  3710,  279,  1, 192514,   4000.000, 0x00000000, 0 },
  {  3711,  279,  2, 192514,   6000.000, 0x00000000, 0 },
  {  3712,  279,  3, 192514,   8000.000, 0x00000000, 0 },
  {  3713,  279,  4, 192514,  10000.000, 0x00000000, 0 },
  {  3714,  279,  5, 192514,  12000.000, 0x00000000, 0 },
  {  6606,  279,  6, 192514,  14000.000, 0x00000000, 0 },
  {  6607,  279,  7, 192514,  16000.000, 0x00000000, 0 },
  {  2585,  280,  0, 192538,      8.000, 0x00000000, 0 },
  {  3715,  280,  1, 192538,     16.000, 0x00000000, 0 },
  {  3716,  280,  2, 192538,     24.000, 0x00000000, 0 },
  {  3717,  280,  3, 192538,     32.000, 0x00000000, 0 },
  {  3718,  280,  4, 192538,     40.000, 0x00000000, 0 },
  {  3719,  280,  5, 192538,     48.000, 0x00000000, 0 },
  {  6608,  280,  6, 192538,     56.000, 0x00000000, 0 },
  {  6609,  280,  7, 192538,     64.000, 0x00000000, 0 },
  {  2588,  281,  0, 192557,      0.000, 0x00000000, 0 },
  {  2589,  282,  0, 192548,      0.000, 0x00000000, 0 },
  {  2590,  283,  0, 192570,      0.000, 0x00000000, 0 },
  {  2591,  284,  0, 192558,      0.000, 0x00000000, 0 },
  {  2592,  285,  0, 192567,      0.000, 0x00000000, 0 },
  {  2593,  286,  0, 193213,      0.000, 0x00000000, 0 },
  {  4029,  289,  0, 205223,      0.000, 0x00000000, 0 },
  {  2594,  290,  0, 224968,      0.000, 0x00000000, 0 },
  {  2595,  291,  0, 205495,      0.000, 0x00000000, 0 },
  {  2596,  292,  0, 191602,      0.000, 0x00000000, 0 },
  {  2597,  293,  0, 191647,      0.000, 0x00000000, 0 },
  {  5316,  294,  0, 191512,      0.000, 0x00000000, 0 },
  {  2599,  295,  0, 191717,      0.000, 0x00000000, 0 },
  {  2600,  296,  0, 191861,      0.000, 0x00000000, 0 },
  {  2601,  297,  0, 192630,      0.000, 0x00000000, 0 },
  {  2602,  298,  0, 191493,      1.000, 0x00000000, 0 },
  {  3381,  298,  1, 191493,      2.000, 0x00000000, 0 },
  {  3382,  298,  2, 191493,      3.000, 0x00000000, 0 },
  {  3383,  298,  3, 191493,      4.000, 0x00000000, 0 },
  {  3384,  298,  4, 191493,      5.000, 0x00000000, 0 },
  {  3385,  298,  5, 191493,      6.000, 0x00000000, 0 },
  {  7182,  298,  6, 191493,      7.000, 0x00000000, 0 },
  {  7183,  298,  7, 191493,      8.000, 0x00000000, 0 },
  {  2605,  299,  0, 191499,      5.000, 0x00000000, 0 },
  {  3386,  299,  1, 191499,     10.000, 0x00000000, 0 },
  {  3387,  299,  2, 191499,     15.000, 0x00000000, 0 },
  {  3388,  299,  3, 191499,     20.000, 0x00000000, 0 },
  {  3389,  299,  4, 191499,     25.000, 0x00000000, 0 },
  {  3390,  299,  5, 191499,     30.000, 0x00000000, 0 },
  {  7198,  299,  6, 191499,     35.000, 0x00000000, 0 },
  {  7199,  299,  7, 191499,     40.000, 0x00000000, 0 },
  {  2608,  300,  0, 191504,      3.000, 0x00000000, 0 },
  {  3391,  300,  1, 191504,      6.000, 0x00000000, 0 },
  {  3392,  300,  2, 191504,      9.000, 0x00000000, 0 },
  {  3393,  300,  3, 191504,     12.000, 0x00000000, 0 },
  {  3394,  300,  4, 191504,     15.000, 0x00000000, 0 },
  {  3395,  300,  5, 191504,     18.000, 0x00000000, 0 },
  {  7190,  300,  6, 191504,     21.000, 0x00000000, 0 },
  {  7191,  300,  7, 191504,     24.000, 0x00000000, 0 },
  {  2611,  301,  0, 191740,      8.000, 0x00000000, 0 },
  {  5317,  301,  1, 191740,     16.000, 0x00000000, 0 },
  {  5318,  301,  2, 191740,     24.000, 0x00000000, 0 },
  {  5319,  301,  3, 191740,     32.000, 0x00000000, 0 },
  {  5320,  301,  4, 191740,     40.000, 0x00000000, 0 },
  {  5321,  301,  5, 191740,     48.000, 0x00000000, 0 },
  {  7188,  301,  6, 191740,     56.000, 0x00000000, 0 },
  {  7189,  301,  7, 191740,     64.000, 0x00000000, 0 },
  {  2614,  302,  0, 191569,     15.000, 0x00000000, 0 },
  {  3401,  302,  1, 191569,     30.000, 0x00000000, 0 },
  {  3402,  302,  2, 191569,     45.000, 0x00000000, 0 },
  {  3403,  302,  3, 191569,     60.000, 0x00000000, 0 },
  {  3404,  302,  4, 191569,     75.000, 0x00000000, 0 },
  {  3405,  302,  5, 191569,     90.000, 0x00000000, 0 },
  {  7194,  302,  6, 191569,    105.000, 0x00000000, 0 },
  {  7195,  302,  7, 191569,    120.000, 0x00000000, 0 },
  {  2617,  303,  0, 191572,      4.000, 0x00000000, 0 },
  {  3406,  303,  1, 191572,      8.000, 0x00000000, 0 },
  {  3407,  303,  2, 191572,     12.000, 0x00000000, 0 },
  {  3408,  303,  3, 191572,     16.000, 0x00000000, 0 },
  {  3409,  303,  4, 191572,     20.000, 0x00000000, 0 },
  {  3410,  303,  5, 191572,     24.000, 0x00000000, 0 },
  {  7192,  303,  6, 191572,     28.000, 0x00000000, 0 },
  {  7193,  303,  7, 191572,     32.000, 0x00000000, 0 },
  {  2620,  304,  0, 191577,      5.000, 0x00000000, 0 },
  {  3411,  304,  1, 191577,     10.000, 0x00000000, 0 },
  {  3412,  304,  2, 191577,     15.000, 0x00000000, 0 },
  {  3413,  304,  3, 191577,     20.000, 0x00000000, 0 },
  {  3414,  304,  4, 191577,     25.000, 0x00000000, 0 },
  {  3415,  304,  5, 191577,     30.000, 0x00000000, 0 },
  {  7186,  304,  6, 191577,     35.000, 0x00000000, 0 },
  {  7187,  304,  7, 191577,     40.000, 0x00000000, 0 },
  {  2623,  305,  0, 191582,      1.000, 0x00000000, 0 },
  {  5501,  305,  1, 191582,      2.000, 0x00000000, 0 },
  {  5502,  305,  2, 191582,      3.000, 0x00000000, 0 },
  {  5503,  305,  3, 191582,      4.000, 0x00000000, 0 },
  {  5504,  305,  4, 191582,      5.000, 0x00000000, 0 },
  {  5505,  305,  5, 191582,      6.000, 0x00000000, 0 },
  {  7196,  305,  6, 191582,      7.000, 0x00000000, 0 },
  {  7197,  305,  7, 191582,      8.000, 0x00000000, 0 },
  {  2626,  306,  0, 191598,      4.000, 0x00000000, 0 },
  {  3419,  306,  1, 191598,      8.000, 0x00000000, 0 },
  {  3420,  306,  2, 191598,     12.000, 0x00000000, 0 },
  {  3421,  306,  3, 191598,     16.000, 0x00000000, 0 },
  {  3422,  306,  4, 191598,     20.000, 0x00000000, 0 },
  {  3423,  306,  5, 191598,     24.000, 0x00000000, 0 },
  {  7184,  306,  6, 191598,     28.000, 0x00000000, 0 },
  {  7185,  306,  7, 191598,     32.000, 0x00000000, 0 },
  {  2629,  307,  0, 204147,      0.000, 0x00000000, 0 },
  {  2630,  308,  0, 204219,      0.000, 0x00000000, 0 },
  {  2631,  309,  0, 191328,      0.000, 0x00000000, 0 },
  {  2632,  310,  0, 191339,      0.000, 0x00000000, 0 },
  {  2633,  311,  0, 191048,      0.000, 0x00000000, 0 },
  {  2634,  312,  0, 190449,      3.000, 0x00000000, 0 },
  {  3336,  312,  1, 190449,      6.000, 0x00000000, 0 },
  {  3337,  312,  2, 190449,     10.000, 0x00000000, 0 },
  {  3338,  312,  3, 190449,     13.000, 0x00000000, 0 },
  {  3339,  312,  4, 190449,     16.000, 0x00000000, 0 },
  {  3340,  312,  5, 190449,     20.000, 0x00000000, 0 },
  {  6912,  312,  6, 190449,     23.000, 0x00000000, 0 },
  {  6913,  312,  7, 190449,     26.000, 0x00000000, 0 },
  {  2637,  313,  0, 190457,      3.000, 0x00000000, 0 },
  {  3341,  313,  1, 190457,      6.000, 0x00000000, 0 },
  {  3342,  313,  2, 190457,     10.000, 0x00000000, 0 },
  {  3343,  313,  3, 190457,     13.000, 0x00000000, 0 },
  {  3344,  313,  4, 190457,     16.000, 0x00000000, 0 },
  {  3345,  313,  5, 190457,     20.000, 0x00000000, 0 },
  {  6914,  313,  6, 190457,     23.000, 0x00000000, 0 },
  {  6915,  313,  7, 190457,     26.000, 0x00000000, 0 },
  {  2640,  314,  0, 190462, -10000.000, 0x00000000, 0 },
  {  3346,  314,  1, 190462, -20000.000, 0x00000000, 0 },
  {  3347,  314,  2, 190462, -30000.000, 0x00000000, 0 },
  {  3348,  314,  3, 190462, -38000.000, 0x00000000, 0 },
  {  3349,  314,  4, 190462, -45000.000, 0x00000000, 0 },
  {  3350,  314,  5, 190462, -52000.000, 0x00000000, 0 },
  {  6916,  314,  6, 190462, -58000.000, 0x00000000, 0 },
  {  6917,  314,  7, 190462, -63000.000, 0x00000000, 0 },
  {  2643,  315,  0, 190467,      3.000, 0x00000000, 0 },
  {  3351,  315,  1, 190467,      6.000, 0x00000000, 0 },
  {  3352,  315,  2, 190467,     10.000, 0x00000000, 0 },
  {  3353,  315,  3, 190467,     13.000, 0x00000000, 0 },
  {  3354,  315,  4, 190467,     16.000, 0x00000000, 0 },
  {  3355,  315,  5, 190467,     20.000, 0x00000000, 0 },
  {  6918,  315,  6, 190467,     23.000, 0x00000000, 0 },
  {  6919,  315,  7, 190467,     26.000, 0x00000000, 0 },
  {  2646,  316,  0, 190503,      3.000, 0x00000000, 0 },
  {  3356,  316,  1, 190503,      6.000, 0x00000000, 0 },
  {  3357,  316,  2, 190503,     10.000, 0x00000000, 0 },
  {  3358,  316,  3, 190503,     13.000, 0x00000000, 0 },
  {  3359,  316,  4, 190503,     16.000, 0x00000000, 0 },
  {  3360,  316,  5, 190503,     20.000, 0x00000000, 0 },
  {  6920,  316,  6, 190503,     23.000, 0x00000000, 0 },
  {  6921,  316,  7, 190503,     26.000, 0x00000000, 0 },
  {  2649,  317,  0, 190514,     -3.000, 0x00000000, 0 },
  {  3361,  317,  1, 190514,     -6.000, 0x00000000, 0 },
  {  3362,  317,  2, 190514,    -10.000, 0x00000000, 0 },
  {  3363,  317,  3, 190514,    -13.000, 0x00000000, 0 },
  {  3364,  317,  4, 190514,    -16.000, 0x00000000, 0 },
  {  3365,  317,  5, 190514,    -20.000, 0x00000000, 0 },
  {  6922,  317,  6, 190514,    -23.000, 0x00000000, 0 },
  {  6923,  317,  7, 190514,    -26.000, 0x00000000, 0 },
  {  2652,  318,  0, 190520,      3.000, 0x00000000, 0 },
  {  3366,  318,  1, 190520,      6.000, 0x00000000, 0 },
  {  3367,  318,  2, 190520,     10.000, 0x00000000, 0 },
  {  3368,  318,  3, 190520,     13.000, 0x00000000, 0 },
  {  3369,  318,  4, 190520,     16.000, 0x00000000, 0 },
  {  3370,  318,  5, 190520,     20.000, 0x00000000, 0 },
  {  6924,  318,  6, 190520,     23.000, 0x00000000, 0 },
  {  6925,  318,  7, 190520,     26.000, 0x00000000, 0 },
  {  2655,  319,  0, 190529,      2.000, 0x00000000, 0 },
  {  3371,  319,  1, 190529,      4.000, 0x00000000, 0 },
  {  3372,  319,  2, 190529,      6.000, 0x00000000, 0 },
  {  3373,  319,  3, 190529,      8.000, 0x00000000, 0 },
  {  3374,  319,  4, 190529,     10.000, 0x00000000, 0 },
  {  3375,  319,  5, 190529,     12.000, 0x00000000, 0 },
  {  6926,  319,  6, 190529,     14.000, 0x00000000, 0 },
  {  6927,  319,  7, 190529,     16.000, 0x00000000, 0 },
  {  2658,  320,  0, 190567,     -5.000, 0x00000000, 0 },
  {  3376,  320,  1, 190567,    -10.000, 0x00000000, 0 },
  {  3377,  320,  2, 190567,    -15.000, 0x00000000, 0 },
  {  3378,  320,  3, 190567,    -20.000, 0x00000000, 0 },
  {  3379,  320,  4, 190567,    -25.000, 0x00000000, 0 },
  {  3380,  320,  5, 190567,    -30.000, 0x00000000, 0 },
  {  6928,  320,  6, 190567,    -35.000, 0x00000000, 0 },
  {  6929,  320,  7, 190567,    -40.000, 0x00000000, 0 },
  {  2661,  321,  0, 190852,      0.000, 0x00000000, 0 },
  {  2662,  322,  0, 204089,      0.000, 0x00000000, 0 },
  {  2663,  323,  0, 192310,      3.000, 0x00000000, 0 },
  {  3291,  323,  1, 192310,      6.000, 0x00000000, 0 },
  {  3292,  323,  2, 192310,     10.000, 0x00000000, 0 },
  {  3293,  323,  3, 192310,     13.000, 0x00000000, 0 },
  {  3294,  323,  4, 192310,     16.000, 0x00000000, 0 },
  {  3295,  323,  5, 192310,     20.000, 0x00000000, 0 },
  {  7146,  323,  6, 192310,     23.000, 0x00000000, 0 },
  {  7147,  323,  7, 192310,     26.000, 0x00000000, 0 },
  {  2666,  324,  0, 192315,      3.000, 0x00000000, 0 },
  {  3296,  324,  1, 192315,      6.000, 0x00000000, 0 },
  {  3297,  324,  2, 192315,     10.000, 0x00000000, 0 },
  {  3298,  324,  3, 192315,     13.000, 0x00000000, 0 },
  {  3299,  324,  4, 192315,     16.000, 0x00000000, 0 },
  {  3300,  324,  5, 192315,     20.000, 0x00000000, 0 },
  {  7142,  324,  6, 192315,     23.000, 0x00000000, 0 },
  {  7143,  324,  7, 192315,     26.000, 0x00000000, 0 },
  {  2669,  325,  0, 192318,      5.000, 0x00000000, 0 },
  {  3301,  325,  1, 192318,     10.000, 0x00000000, 0 },
  {  3302,  325,  2, 192318,     15.000, 0x00000000, 0 },
  {  3303,  325,  3, 192318,     20.000, 0x00000000, 0 },
  {  3304,  325,  4, 192318,     25.000, 0x00000000, 0 },
  {  3305,  325,  5, 192318,     30.000, 0x00000000, 0 },
  {  7138,  325,  6, 192318,     35.000, 0x00000000, 0 },
  {  7139,  325,  7, 192318,     40.000, 0x00000000, 0 },
  {  2672,  326,  0, 192323,  -3000.000, 0x00000000, 0 },
  {  3306,  326,  1, 192323,  -6000.000, 0x00000000, 0 },
  {  3307,  326,  2, 192323, -10000.000, 0x00000000, 0 },
  {  3308,  326,  3, 192323, -13000.000, 0x00000000, 0 },
  {  3309,  326,  4, 192323, -16000.000, 0x00000000, 0 },
  {  3310,  326,  5, 192323, -20000.000, 0x00000000, 0 },
  {  7134,  326,  6, 192323, -23000.000, 0x00000000, 0 },
  {  7135,  326,  7, 192323, -26000.000, 0x00000000, 0 },
  {  2675,  327,  0, 192326,      4.000, 0x00000000, 0 },
  {  3311,  327,  1, 192326,      8.000, 0x00000000, 0 },
  {  3312,  327,  2, 192326,     12.000, 0x00000000, 0 },
  {  3313,  327,  3, 192326,     16.000, 0x00000000, 0 },
  {  3314,  327,  4, 192326,     20.000, 0x00000000, 0 },
  {  3315,  327,  5, 192326,     24.000, 0x00000000, 0 },
  {  7132,  327,  6, 192326,     28.000, 0x00000000, 0 },
  {  7133,  327,  7, 192326,     32.000, 0x00000000, 0 },
  {  2678,  328,  0, 192329,      3.000, 0x00000000, 0 },
  {  3316,  328,  1, 192329,      6.000, 0x00000000, 0 },
  {  3317,  328,  2, 192329,     10.000, 0x00000000, 0 },
  {  3318,  328,  3, 192329,     13.000, 0x00000000, 0 },
  {  3319,  328,  4, 192329,     16.000, 0x00000000, 0 },
  {  3320,  328,  5, 192329,     20.000, 0x00000000, 0 },
  {  7136,  328,  6, 192329,     23.000, 0x00000000, 0 },
  {  7137,  328,  7, 192329,     26.000, 0x00000000, 0 },
  {  2681,  329,  0, 192345,  -3000.000, 0x00000000, 0 },
  {  3321,  329,  1, 192345,  -6000.000, 0x00000000, 0 },
  {  3322,  329,  2, 192345, -10000.000, 0x00000000, 0 },
  {  3323,  329,  3, 192345, -13000.000, 0x00000000, 0 },
  {  3324,  329,  4, 192345, -16000.000, 0x00000000, 0 },
  {  3325,  329,  5, 192345, -20000.000, 0x00000000, 0 },
  {  7144,  329,  6, 192345, -23000.000, 0x00000000, 0 },
  {  7145,  329,  7, 192345, -26000.000, 0x00000000, 0 },
  {  2684,  330,  0, 192349, -10000.000, 0x00000000, 0 },
  {  3326,  330,  1, 192349, -20000.000, 0x00000000, 0 },
  {  3327,  330,  2, 192349, -30000.000, 0x00000000, 0 },
  {  3328,  330,  3, 192349, -38000.000, 0x00000000, 0 },
  {  3329,  330,  4, 192349, -44000.000, 0x00000000, 0 },
  {  3330,  330,  5, 192349, -48000.000, 0x00000000, 0 },
  {  7130,  330,  6, 192349, -52000.000, 0x00000000, 0 },
  {  7131,  330,  7, 192349, -56000.000, 0x00000000, 0 },
  {  2687,  331,  0, 192376,      3.000, 0x00000000, 0 },
  {  3331,  331,  1, 192376,      6.000, 0x00000000, 0 },
  {  3332,  331,  2, 192376,      9.000, 0x00000000, 0 },
  {  3333,  331,  3, 192376,     12.000, 0x00000000, 0 },
  {  3334,  331,  4, 192376,     15.000, 0x00000000, 0 },
  {  3335,  331,  5, 192376,     18.000, 0x00000000, 0 },
  {  7140,  331,  6, 192376,     21.000, 0x00000000, 0 },
  {  7141,  331,  7, 192376,     24.000, 0x00000000, 0 },
  {  2690,  332,  0, 192384,      0.000, 0x00000000, 0 },
  {  2691,  333,  0, 192422,      0.000, 0x00000000, 0 },
  {  2692,  334,  0, 192424,      0.000, 0x00000000, 0 },
  {  2693,  335,  0, 192428,      0.000, 0x00000000, 0 },
  {  2694,  337,  0, 192657,      0.000, 0x00000000, 0 },
  {  2695,  346,  0, 192759,      0.000, 0x00000000, 0 },
  {  2696,  347,  0, 192923,      0.000, 0x00000000, 0 },
  {  2697,  350,  0, 185086,      0.000, 0x00000000, 0 },
  {  2698,  351,  0, 182234,      0.000, 0x00000000, 0 },
  {  2699,  352,  0, 193058,      0.000, 0x00000000, 0 },
  {  2700,  353,  0, 179546,      0.000, 0x00000000, 0 },
  {  3160,  748,  0, 194466,      0.000, 0x00000000, 0 },
  {  2727,  749,  0, 194224,     -3.000, 0x00000000, 0 },
  {  3720,  749,  1, 194224,     -6.000, 0x00000000, 0 },
  {  3721,  749,  2, 194224,     -9.000, 0x00000000, 0 },
  {  3722,  749,  3, 194224,    -12.000, 0x00000000, 0 },
  {  3723,  749,  4, 194224,    -15.000, 0x00000000, 0 },
  {  3724,  749,  5, 194224,    -18.000, 0x00000000, 0 },
  {  6966,  749,  6, 194224,    -21.000, 0x00000000, 0 },
  {  6967,  749,  7, 194224,    -24.000, 0x00000000, 0 },
  {  3161,  750,  0, 194234,      8.000, 0x00000000, 0 },
  {  3725,  750,  1, 194234,     16.000, 0x00000000, 0 },
  {  3726,  750,  2, 194234,     24.000, 0x00000000, 0 },
  {  3727,  750,  3, 194234,     32.000, 0x00000000, 0 },
  {  3728,  750,  4, 194234,     40.000, 0x00000000, 0 },
  {  3729,  750,  5, 194234,     48.000, 0x00000000, 0 },
  {  6968,  750,  6, 194234,     56.000, 0x00000000, 0 },
  {  6969,  750,  7, 194234,     64.000, 0x00000000, 0 },
  {  3162,  751,  0, 194239,      2.000, 0x00000000, 0 },
  {  3730,  751,  1, 194239,      4.000, 0x00000000, 0 },
  {  3731,  751,  2, 194239,      6.000, 0x00000000, 0 },
  {  3732,  751,  3, 194239,      8.000, 0x00000000, 0 },
  {  3733,  751,  4, 194239,     10.000, 0x00000000, 0 },
  {  3734,  751,  5, 194239,     12.000, 0x00000000, 0 },
  {  6970,  751,  6, 194239,     14.000, 0x00000000, 0 },
  {  6971,  751,  7, 194239,     16.000, 0x00000000, 0 },
  {  3163,  752,  0, 194312,      1.000, 0x00000000, 0 },
  {  3735,  752,  1, 194312,      2.000, 0x00000000, 0 },
  {  3736,  752,  2, 194312,      3.000, 0x00000000, 0 },
  {  3737,  752,  3, 194312,      4.000, 0x00000000, 0 },
  {  3738,  752,  4, 194312,      5.000, 0x00000000, 0 },
  {  3739,  752,  5, 194312,      6.000, 0x00000000, 0 },
  {  6972,  752,  6, 194312,      7.000, 0x00000000, 0 },
  {  6973,  752,  7, 194312,      8.000, 0x00000000, 0 },
  {  5135,  753,  0, 210182,      5.000, 0x00000000, 0 },
  {  5136,  753,  1, 210182,     10.000, 0x00000000, 0 },
  {  5137,  753,  2, 210182,     15.000, 0x00000000, 0 },
  {  5138,  753,  3, 210182,     20.000, 0x00000000, 0 },
  {  5139,  753,  4, 210182,     25.000, 0x00000000, 0 },
  {  5140,  753,  5, 210182,     30.000, 0x00000000, 0 },
  {  6974,  753,  6, 210182,     35.000, 0x00000000, 0 },
  {  6975,  753,  7, 210182,     40.000, 0x00000000, 0 },
  {  3165,  754,  0, 194313,      3.000, 0x00000000, 0 },
  {  3745,  754,  1, 194313,      6.000, 0x00000000, 0 },
  {  3746,  754,  2, 194313,      9.000, 0x00000000, 0 },
  {  3747,  754,  3, 194313,     12.000, 0x00000000, 0 },
  {  3748,  754,  4, 194313,     15.000, 0x00000000, 0 },
  {  3749,  754,  5, 194313,     18.000, 0x00000000, 0 },
  {  6976,  754,  6, 194313,     21.000, 0x00000000, 0 },
  {  6977,  754,  7, 194313,     24.000, 0x00000000, 0 },
  {  3166,  755,  0, 194314,      4.000, 0x00000000, 0 },
  {  3750,  755,  1, 194314,      8.000, 0x00000000, 0 },
  {  3751,  755,  2, 194314,     12.000, 0x00000000, 0 },
  {  3752,  755,  3, 194314,     16.000, 0x00000000, 0 },
  {  3753,  755,  4, 194314,     20.000, 0x00000000, 0 },
  {  3754,  755,  5, 194314,     24.000, 0x00000000, 0 },
  {  6978,  755,  6, 194314,     28.000, 0x00000000, 0 },
  {  6979,  755,  7, 194314,     32.000, 0x00000000, 0 },
  {  3167,  756,  0, 194318,      0.833, 0x00000000, 0 },
  {  3760,  756,  1, 194318,      1.666, 0x00000000, 0 },
  {  3761,  756,  2, 194318,      2.500, 0x00000000, 0 },
  {  3762,  756,  3, 194318,      3.333, 0x00000000, 0 },
  {  3763,  756,  4, 194318,      4.167, 0x00000000, 0 },
  {  3764,  756,  5, 194318,      5.000, 0x00000000, 0 },
  {  6980,  756,  6, 194318,      6.000, 0x00000000, 0 },
  {  6981,  756,  7, 194318,      7.200, 0x00000000, 0 },
  {  3168,  757,  0, 194315,     -5.000, 0x00000000, 0 },
  {  3755,  757,  1, 194315,    -10.000, 0x00000000, 0 },
  {  3756,  757,  2, 194315,    -15.000, 0x00000000, 0 },
  {  3757,  757,  3, 194315,    -20.000, 0x00000000, 0 },
  {  3758,  757,  4, 194315,    -25.000, 0x00000000, 0 },
  {  3759,  757,  5, 194315,    -30.000, 0x00000000, 0 },
  {  6982,  757,  6, 194315,    -35.000, 0x00000000, 0 },
  {  6983,  757,  7, 194315,    -40.000, 0x00000000, 0 },
  {  5500,  758,  0, 194487,      0.000, 0x00000000, 0 },
  {  3169,  759,  0, 215796,      0.000, 0x00000000, 0 },
  {  3170,  760,  0, 227481,      0.000, 0x00000000, 0 },
  {  3171,  761,  0, 194431,      0.000, 0x00000000, 0 },
  {  5134,  762,  0, 215773,      0.000, 0x00000000, 0 },
  {  3172,  763,  0, 194331,      0.000, 0x00000000, 0 },
  {  3173,  764,  0, 205065,      0.000, 0x00000000, 0 },
  {  3174,  765,  0, 194024,      0.000, 0x00000000, 0 },
  {  3175,  766,  0, 194026,      0.000, 0x00000000, 0 },
  {  3176,  767,  0, 194093,     15.000, 0x00000000, 0 },
  {  3286,  767,  1, 194093,     30.000, 0x00000000, 0 },
  {  3287,  767,  2, 194093,     45.000, 0x00000000, 0 },
  {  3288,  767,  3, 194093,     60.000, 0x00000000, 0 },
  {  3289,  767,  4, 194093,     75.000, 0x00000000, 0 },
  {  3290,  767,  5, 194093,     90.000, 0x00000000, 0 },
  {  7124,  767,  6, 194093,    105.000, 0x00000000, 0 },
  {  7125,  767,  7, 194093,    120.000, 0x00000000, 0 },
  {  3177,  768,  0, 193371,      0.000, 0x00000000, 0 },
  {  3178,  769,  0, 194179,      0.000, 0x00000000, 0 },
  {  3179,  770,  0, 194378,      0.000, 0x00000000, 0 },
  {  3180,  771,  0, 193642, -10000.000, 0x00000000, 0 },
  {  3194,  771,  1, 193642, -20000.000, 0x00000000, 0 },
  {  3195,  771,  2, 193642, -30000.000, 0x00000000, 0 },
  {  3196,  771,  3, 193642, -40000.000, 0x00000000, 0 },
  {  3197,  771,  4, 193642, -50000.000, 0x00000000, 0 },
  {  3198,  771,  5, 193642, -60000.000, 0x00000000, 0 },
  {  7114,  771,  6, 193642, -70000.000, 0x00000000, 0 },
  {  7115,  771,  7, 193642, -80000.000, 0x00000000, 0 },
  {  3181,  772,  0, 193643,      5.000, 0x00000000, 0 },
  {  3251,  772,  1, 193643,     10.000, 0x00000000, 0 },
  {  3252,  772,  2, 193643,     15.000, 0x00000000, 0 },
  {  3253,  772,  3, 193643,     20.000, 0x00000000, 0 },
  {  3254,  772,  4, 193643,     25.000, 0x00000000, 0 },
  {  3255,  772,  5, 193643,     30.000, 0x00000000, 0 },
  {  7116,  772,  6, 193643,     35.000, 0x00000000, 0 },
  {  7117,  772,  7, 193643,     40.000, 0x00000000, 0 },
  {  3182,  773,  0, 193644,      6.000, 0x00000000, 0 },
  {  3256,  773,  1, 193644,     12.000, 0x00000000, 0 },
  {  3257,  773,  2, 193644,     18.000, 0x00000000, 0 },
  {  3258,  773,  3, 193644,     24.000, 0x00000000, 0 },
  {  3259,  773,  4, 193644,     30.000, 0x00000000, 0 },
  {  3260,  773,  5, 193644,     36.000, 0x00000000, 0 },
  {  7120,  773,  6, 193644,     42.000, 0x00000000, 0 },
  {  7121,  773,  7, 193644,     48.000, 0x00000000, 0 },
  {  3183,  774,  0, 193645,      3.000, 0x00000000, 0 },
  {  3261,  774,  1, 193645,      6.000, 0x00000000, 0 },
  {  3262,  774,  2, 193645,     10.000, 0x00000000, 0 },
  {  3263,  774,  3, 193645,     13.000, 0x00000000, 0 },
  {  3264,  774,  4, 193645,     16.000, 0x00000000, 0 },
  {  3265,  774,  5, 193645,     20.000, 0x00000000, 0 },
  {  7112,  774,  6, 193645,     23.000, 0x00000000, 0 },
  {  7113,  774,  7, 193645,     26.000, 0x00000000, 0 },
  {  3184,  775,  0, 193647,     10.000, 0x00000000, 0 },
  {  6513,  775,  1, 193647,     20.000, 0x00000000, 0 },
  {  6514,  775,  2, 193647,     30.000, 0x00000000, 0 },
  {  6515,  775,  3, 193647,     40.000, 0x00000000, 0 },
  {  6516,  775,  4, 193647,     50.000, 0x00000000, 0 },
  {  6517,  775,  5, 193647,     60.000, 0x00000000, 0 },
  {  7118,  775,  6, 193647,     70.000, 0x00000000, 0 },
  {  7119,  775,  7, 193647,     80.000, 0x00000000, 0 },
  {  3185,  776,  0, 194002,      1.000, 0x00000000, 0 },
  {  3271,  776,  1, 194002,      2.000, 0x00000000, 0 },
  {  3272,  776,  2, 194002,      3.000, 0x00000000, 0 },
  {  3273,  776,  3, 194002,      4.000, 0x00000000, 0 },
  {  3274,  776,  4, 194002,      5.000, 0x00000000, 0 },
  {  3275,  776,  5, 194002,      6.000, 0x00000000, 0 },
  {  7110,  776,  6, 194002,      7.000, 0x00000000, 0 },
  {  7111,  776,  7, 194002,      8.000, 0x00000000, 0 },
  {  3186,  777,  0, 194007,      5.000, 0x00000000, 0 },
  {  3276,  777,  1, 194007,     10.000, 0x00000000, 0 },
  {  3277,  777,  2, 194007,     15.000, 0x00000000, 0 },
  {  3278,  777,  3, 194007,     20.000, 0x00000000, 0 },
  {  3279,  777,  4, 194007,     25.000, 0x00000000, 0 },
  {  3280,  777,  5, 194007,     30.000, 0x00000000, 0 },
  {  7122,  777,  6, 194007,     35.000, 0x00000000, 0 },
  {  7123,  777,  7, 194007,     40.000, 0x00000000, 0 },
  {  3187,  778,  0, 194016,      5.000, 0x00000000, 0 },
  {  3281,  778,  1, 194016,     10.000, 0x00000000, 0 },
  {  3282,  778,  2, 194016,     15.000, 0x00000000, 0 },
  {  3283,  778,  3, 194016,     20.000, 0x00000000, 0 },
  {  3284,  778,  4, 194016,     25.000, 0x00000000, 0 },
  {  3285,  778,  5, 194016,     30.000, 0x00000000, 0 },
  {  7126,  778,  6, 194016,     35.000, 0x00000000, 0 },
  {  7127,  778,  7, 194016,     40.000, 0x00000000, 0 },
  {  3188,  779,  0, 194018,      0.000, 0x00000000, 0 },
  {  3777,  783,  0, 214634,      0.000, 0x00000000, 0 },
  {  3782,  784,  0, 195315,      3.000, 0x00000000, 0 },
  {  3783,  784,  1, 195315,      6.000, 0x00000000, 0 },
  {  3784,  784,  2, 195315,     10.000, 0x00000000, 0 },
  {  3785,  784,  3, 195315,     13.000, 0x00000000, 0 },
  {  3786,  784,  4, 195315,     16.000, 0x00000000, 0 },
  {  3787,  784,  5, 195315,     20.000, 0x00000000, 0 },
  {  6984,  784,  6, 195315,     23.000, 0x00000000, 0 },
  {  6985,  784,  7, 195315,     26.000, 0x00000000, 0 },
  {  3788,  785,  0, 195317,      5.000, 0x00000000, 0 },
  {  3789,  785,  1, 195317,     10.000, 0x00000000, 0 },
  {  3790,  785,  2, 195317,     15.000, 0x00000000, 0 },
  {  3791,  785,  3, 195317,     20.000, 0x00000000, 0 },
  {  3792,  785,  4, 195317,     25.000, 0x00000000, 0 },
  {  3793,  785,  5, 195317,     30.000, 0x00000000, 0 },
  {  6986,  785,  6, 195317,     35.000, 0x00000000, 0 },
  {  6987,  785,  7, 195317,     40.000, 0x00000000, 0 },
  {  3794,  786,  0, 195322,      8.000, 0x00000000, 0 },
  {  3795,  786,  1, 195322,     16.000, 0x00000000, 0 },
  {  3796,  786,  2, 195322,     24.000, 0x00000000, 0 },
  {  3797,  786,  3, 195322,     32.000, 0x00000000, 0 },
  {  3798,  786,  4, 195322,     40.000, 0x00000000, 0 },
  {  3799,  786,  5, 195322,     48.000, 0x00000000, 0 },
  {  6988,  786,  6, 195322,     56.000, 0x00000000, 0 },
  {  6989,  786,  7, 195322,     64.000, 0x00000000, 0 },
  {  3800,  787,  0, 195323,     30.000, 0x00000000, 0 },
  {  3801,  787,  1, 195323,     60.000, 0x00000000, 0 },
  {  3802,  787,  2, 195323,     90.000, 0x00000000, 0 },
  {  3803,  787,  3, 195323,    120.000, 0x00000000, 0 },
  {  3804,  787,  4, 195323,    150.000, 0x00000000, 0 },
  {  3805,  787,  5, 195323,    180.000, 0x00000000, 0 },
  {  6990,  787,  6, 195323,    210.000, 0x00000000, 0 },
  {  6991,  787,  7, 195323,    240.000, 0x00000000, 0 },
  {  3806,  788,  0, 195345,   -500.000, 0x00000000, 0 },
  {  3807,  788,  1, 195345,  -1000.000, 0x00000000, 0 },
  {  3808,  788,  2, 195345,  -1500.000, 0x00000000, 0 },
  {  3809,  788,  3, 195345,  -2000.000, 0x00000000, 0 },
  {  3810,  788,  4, 195345,  -2500.000, 0x00000000, 0 },
  {  3811,  788,  5, 195345,  -3000.000, 0x00000000, 0 },
  {  6992,  788,  6, 195345,  -3500.000, 0x00000000, 0 },
  {  6993,  788,  7, 195345,  -4000.000, 0x00000000, 0 },
  {  3812,  789,  0, 195351,      2.000, 0x00000000, 0 },
  {  3813,  789,  1, 195351,      4.000, 0x00000000, 0 },
  {  3814,  789,  2, 195351,      6.000, 0x00000000, 0 },
  {  3815,  789,  3, 195351,      8.000, 0x00000000, 0 },
  {  3816,  789,  4, 195351,     10.000, 0x00000000, 0 },
  {  3817,  789,  5, 195351,     12.000, 0x00000000, 0 },
  {  6994,  789,  6, 195351,     14.000, 0x00000000, 0 },
  {  6995,  789,  7, 195351,     16.000, 0x00000000, 0 },
  {  3818,  790,  0, 195352,      5.000, 0x00000000, 0 },
  {  3819,  790,  1, 195352,     10.000, 0x00000000, 0 },
  {  3820,  790,  2, 195352,     15.000, 0x00000000, 0 },
  {  3821,  790,  3, 195352,     20.000, 0x00000000, 0 },
  {  3822,  790,  4, 195352,     25.000, 0x00000000, 0 },
  {  3823,  790,  5, 195352,     30.000, 0x00000000, 0 },
  {  6996,  790,  6, 195352,     35.000, 0x00000000, 0 },
  {  6997,  790,  7, 195352,     40.000, 0x00000000, 0 },
  {  3824,  791,  0, 195354,     20.000, 0x00000000, 0 },
  {  3825,  791,  1, 195354,     40.000, 0x00000000, 0 },
  {  3826,  791,  2, 195354,     60.000, 0x00000000, 0 },
  {  3827,  791,  3, 195354,     80.000, 0x00000000, 0 },
  {  3828,  791,  4, 195354,    100.000, 0x00000000, 0 },
  {  3829,  791,  5, 195354,    120.000, 0x00000000, 0 },
  {  6998,  791,  6, 195354,    140.000, 0x00000000, 0 },
  {  6999,  791,  7, 195354,    160.000, 0x00000000, 0 },
  {  3830,  792,  0, 214626,     -2.000, 0x00000000, 0 },
  {  3831,  792,  1, 214626,     -4.000, 0x00000000, 0 },
  {  3832,  792,  2, 214626,     -6.000, 0x00000000, 0 },
  {  3833,  792,  3, 214626,     -8.000, 0x00000000, 0 },
  {  3834,  792,  4, 214626,    -10.000, 0x00000000, 0 },
  {  3835,  792,  5, 214626,    -12.000, 0x00000000, 0 },
  {  7000,  792,  6, 214626,    -14.000, 0x00000000, 0 },
  {  7001,  792,  7, 214626,    -16.000, 0x00000000, 0 },
  {  3836,  793,  0, 195419,      0.000, 0x00000000, 0 },
  {  5584,  794,  0, 214664,      0.000, 0x00000000, 0 },
  {  3837,  795,  0, 220817,      0.000, 0x00000000, 0 },
  {  5618,  796,  0, 214776,      0.000, 0x00000000, 0 },
  {  5615,  797,  0, 195615,      0.000, 0x00000000, 0 },
  {  3838,  798,  0, 195448,      0.000, 0x00000000, 0 },
  {  3765,  800,  0, 195243,     10.000, 0x00000000, 0 },
  {  3766,  800,  1, 195243,     20.000, 0x00000000, 0 },
  {  3767,  800,  2, 195243,     30.000, 0x00000000, 0 },
  {  3768,  800,  3, 195243,     40.000, 0x00000000, 0 },
  {  3769,  800,  4, 195243,     50.000, 0x00000000, 0 },
  {  3770,  800,  5, 195243,     60.000, 0x00000000, 0 },
  {  7020,  800,  6, 195243,     70.000, 0x00000000, 0 },
  {  7021,  800,  7, 195243,     80.000, 0x00000000, 0 },
  {  3771,  801,  0, 195244,      3.000, 0x00000000, 0 },
  {  3772,  801,  1, 195244,      6.000, 0x00000000, 0 },
  {  3773,  801,  2, 195244,     10.000, 0x00000000, 0 },
  {  3774,  801,  3, 195244,     13.000, 0x00000000, 0 },
  {  3775,  801,  4, 195244,     16.000, 0x00000000, 0 },
  {  3776,  801,  5, 195244,     20.000, 0x00000000, 0 },
  {  7022,  801,  6, 195244,     23.000, 0x00000000, 0 },
  {  7023,  801,  7, 195244,     26.000, 0x00000000, 0 },
  {  3903,  803,  0, 196586,      0.000, 0x00000000, 0 },
  {  3904,  804,  0, 196211,      3.000, 0x00000000, 0 },
  {  3905,  804,  1, 196211,      6.000, 0x00000000, 0 },
  {  3906,  804,  2, 196211,      9.000, 0x00000000, 0 },
  {  3907,  804,  3, 196211,     12.000, 0x00000000, 0 },
  {  3908,  804,  4, 196211,     15.000, 0x00000000, 0 },
  {  3909,  804,  5, 196211,     18.000, 0x00000000, 0 },
  {  7302,  804,  6, 196211,     21.000, 0x00000000, 0 },
  {  7303,  804,  7, 196211,     24.000, 0x00000000, 0 },
  {  3910,  805,  0, 196217,      5.000, 0x00000000, 0 },
  {  3911,  805,  1, 196217,     10.000, 0x00000000, 0 },
  {  3912,  805,  2, 196217,     15.000, 0x00000000, 0 },
  {  3913,  805,  3, 196217,     20.000, 0x00000000, 0 },
  {  3914,  805,  4, 196217,     25.000, 0x00000000, 0 },
  {  3915,  805,  5, 196217,     30.000, 0x00000000, 0 },
  {  7292,  805,  6, 196217,     35.000, 0x00000000, 0 },
  {  7293,  805,  7, 196217,     40.000, 0x00000000, 0 },
  {  3916,  806,  0, 196222,     -2.000, 0x00000000, 0 },
  {  3917,  806,  1, 196222,     -4.000, 0x00000000, 0 },
  {  3918,  806,  2, 196222,     -6.000, 0x00000000, 0 },
  {  3919,  806,  3, 196222,     -8.000, 0x00000000, 0 },
  {  3920,  806,  4, 196222,    -10.000, 0x00000000, 0 },
  {  3921,  806,  5, 196222,    -12.000, 0x00000000, 0 },
  {  7298,  806,  6, 196222,    -14.000, 0x00000000, 0 },
  {  7299,  806,  7, 196222,    -16.000, 0x00000000, 0 },
  {  3922,  807,  0, 196227,      6.000, 0x00000000, 0 },
  {  3923,  807,  1, 196227,     12.000, 0x00000000, 0 },
  {  3924,  807,  2, 196227,     18.000, 0x00000000, 0 },
  {  3925,  807,  3, 196227,     24.000, 0x00000000, 0 },
  {  3926,  807,  4, 196227,     30.000, 0x00000000, 0 },
  {  3927,  807,  5, 196227,     36.000, 0x00000000, 0 },
  {  7304,  807,  6, 196227,     42.000, 0x00000000, 0 },
  {  7305,  807,  7, 196227,     48.000, 0x00000000, 0 },
  {  3928,  808,  0, 196236,      3.000, 0x00000000, 0 },
  {  3929,  808,  1, 196236,      6.000, 0x00000000, 0 },
  {  3930,  808,  2, 196236,      9.000, 0x00000000, 0 },
  {  3931,  808,  3, 196236,     12.000, 0x00000000, 0 },
  {  3932,  808,  4, 196236,     15.000, 0x00000000, 0 },
  {  3933,  808,  5, 196236,     18.000, 0x00000000, 0 },
  {  7306,  808,  6, 196236,     21.000, 0x00000000, 0 },
  {  7307,  808,  7, 196236,     24.000, 0x00000000, 0 },
  {  3955,  809,  0, 196432,      8.000, 0x00000000, 0 },
  {  3956,  809,  1, 196432,     16.000, 0x00000000, 0 },
  {  3957,  809,  2, 196432,     24.000, 0x00000000, 0 },
  {  3958,  809,  3, 196432,     32.000, 0x00000000, 0 },
  {  3959,  809,  4, 196432,     40.000, 0x00000000, 0 },
  {  3960,  809,  5, 196432,     48.000, 0x00000000, 0 },
  {  7290,  809,  6, 196432,     56.000, 0x00000000, 0 },
  {  7291,  809,  7, 196432,     64.000, 0x00000000, 0 },
  {  3934,  810,  0, 196258,      5.000, 0x00000000, 0 },
  {  3935,  810,  1, 196258,     10.000, 0x00000000, 0 },
  {  3936,  810,  2, 196258,     15.000, 0x00000000, 0 },
  {  3937,  810,  3, 196258,     20.000, 0x00000000, 0 },
  {  3938,  810,  4, 196258,     25.000, 0x00000000, 0 },
  {  3939,  810,  5, 196258,     30.000, 0x00000000, 0 },
  {  7300,  810,  6, 196258,     35.000, 0x00000000, 0 },
  {  7301,  810,  7, 196258,     40.000, 0x00000000, 0 },
  {  3942,  811,  0, 196301,     15.000, 0x00000000, 0 },
  {  3943,  811,  1, 196301,     30.000, 0x00000000, 0 },
  {  3944,  811,  2, 196301,     45.000, 0x00000000, 0 },
  {  3945,  811,  3, 196301,     60.000, 0x00000000, 0 },
  {  3946,  811,  4, 196301,     75.000, 0x00000000, 0 },
  {  3947,  811,  5, 196301,     90.000, 0x00000000, 0 },
  {  7294,  811,  6, 196301,    105.000, 0x00000000, 0 },
  {  7295,  811,  7, 196301,    120.000, 0x00000000, 0 },
  {  3948,  812,  0, 196305,     -3.000, 0x00000000, 0 },
  {  3949,  812,  1, 196305,     -6.000, 0x00000000, 0 },
  {  3950,  812,  2, 196305,     -9.000, 0x00000000, 0 },
  {  3951,  812,  3, 196305,    -12.000, 0x00000000, 0 },
  {  3952,  812,  4, 196305,    -15.000, 0x00000000, 0 },
  {  3953,  812,  5, 196305,    -18.000, 0x00000000, 0 },
  {  7296,  812,  6, 196305,    -21.000, 0x00000000, 0 },
  {  7297,  812,  7, 196305,    -24.000, 0x00000000, 0 },
  {  3966,  813,  0, 196675,      0.000, 0x00000000, 0 },
  {  6445,  814,  0, 215223,      0.000, 0x00000000, 0 },
  {  6446,  815,  0, 215273,      0.000, 0x00000000, 0 },
  {  3961,  816,  0, 219415,      0.000, 0x00000000, 0 },
  {  3964,  817,  0, 219195,      0.000, 0x00000000, 0 },
  {  3965,  818,  0, 224103,      0.000, 0x00000000, 0 },
  {  3858,  820,  0, 195263,      5.000, 0x00000000, 0 },
  {  3859,  820,  1, 195263,     10.000, 0x00000000, 0 },
  {  3860,  820,  2, 195263,     15.000, 0x00000000, 0 },
  {  3861,  820,  3, 195263,     20.000, 0x00000000, 0 },
  {  3862,  820,  4, 195263,     25.000, 0x00000000, 0 },
  {  3863,  820,  5, 195263,     30.000, 0x00000000, 0 },
  {  7024,  820,  6, 195263,     35.000, 0x00000000, 0 },
  {  7025,  820,  7, 195263,     40.000, 0x00000000, 0 },
  {  3864,  821,  0, 218607,     10.000, 0x00000000, 0 },
  {  6483,  821,  1, 218607,     20.000, 0x00000000, 0 },
  {  6484,  821,  2, 218607,     30.000, 0x00000000, 0 },
  {  6485,  821,  3, 218607,     40.000, 0x00000000, 0 },
  {  6486,  821,  4, 218607,     50.000, 0x00000000, 0 },
  {  6487,  821,  5, 218607,     60.000, 0x00000000, 0 },
  {  7026,  821,  6, 218607,     70.000, 0x00000000, 0 },
  {  7027,  821,  7, 218607,     80.000, 0x00000000, 0 },
  {  3870,  822,  0, 195266,     10.000, 0x00000000, 0 },
  {  3871,  822,  1, 195266,     20.000, 0x00000000, 0 },
  {  3872,  822,  2, 195266,     30.000, 0x00000000, 0 },
  {  3873,  822,  3, 195266,     40.000, 0x00000000, 0 },
  {  4881,  822,  4, 195266,     50.000, 0x00000000, 0 },
  {  6526,  822,  5, 195266,     60.000, 0x00000000, 0 },
  {  7028,  822,  6, 195266,     70.000, 0x00000000, 0 },
  {  7029,  822,  7, 195266,     80.000, 0x00000000, 0 },
  {  3880,  824,  0, 195269,      3.000, 0x00000000, 0 },
  {  3881,  824,  1, 195269,      6.000, 0x00000000, 0 },
  {  3882,  824,  2, 195269,     10.000, 0x00000000, 0 },
  {  3883,  824,  3, 195269,     13.000, 0x00000000, 0 },
  {  3884,  824,  4, 195269,     16.000, 0x00000000, 0 },
  {  3885,  824,  5, 195269,     20.000, 0x00000000, 0 },
  {  7030,  824,  6, 195269,     23.000, 0x00000000, 0 },
  {  7031,  824,  7, 195269,     26.000, 0x00000000, 0 },
  {  3886,  825,  0, 195291,      5.000, 0x00000000, 0 },
  {  3887,  825,  1, 195291,     10.000, 0x00000000, 0 },
  {  3888,  825,  2, 195291,     15.000, 0x00000000, 0 },
  {  4878,  825,  3, 195291,     20.000, 0x00000000, 0 },
  {  4879,  825,  4, 195291,     25.000, 0x00000000, 0 },
  {  4880,  825,  5, 195291,     30.000, 0x00000000, 0 },
  {  7032,  825,  6, 195291,     35.000, 0x00000000, 0 },
  {  7033,  825,  7, 195291,     40.000, 0x00000000, 0 },
  {  3889,  826,  0, 195295,      0.000, 0x00000000, 0 },
  {  3890,  827,  0, 195298,      0.000, 0x00000000, 0 },
  {  3891,  828,  0, 195300,      0.000, 0x00000000, 0 },
  {  3892,  829,  0, 195380,     10.000, 0x00000000, 0 },
  {  3893,  829,  1, 195380,     15.000, 0x00000000, 0 },
  {  3894,  829,  2, 195380,     20.000, 0x00000000, 0 },
  {  3895,  829,  3, 195380,     25.000, 0x00000000, 0 },
  {  3896,  829,  4, 195380,     30.000, 0x00000000, 0 },
  {  3897,  829,  5, 195380,     35.000, 0x00000000, 0 },
  {  7034,  829,  6, 195380,     40.000, 0x00000000, 0 },
  {  7035,  829,  7, 195380,     45.000, 0x00000000, 0 },
  {  3898,  830,  0, 195399,      0.000, 0x00000000, 0 },
  {  3899,  831,  0, 205320,      0.000, 0x00000000, 0 },
  {  3900,  832,  0, 195650,      0.000, 0x00000000, 0 },
  {  3901,  833,  0, 196082,      0.000, 0x00000000, 0 },
  {  3967,  834,  0, 196684,      0.000, 0x00000000, 0 },
  {  3968,  835,  0, 196492,      0.000, 0x00000000, 0 },
  {  3969,  836,  0, 208065,      0.000, 0x00000000, 0 },
  {  3970,  837,  0, 196578,      0.000, 0x00000000, 0 },
  {  3971,  838,  0, 196489,      6.000, 0x00000000, 0 },
  {  5506,  838,  1, 196489,     12.000, 0x00000000, 0 },
  {  5507,  838,  2, 196489,     18.000, 0x00000000, 0 },
  {  5508,  838,  3, 196489,     24.000, 0x00000000, 0 },
  {  5509,  838,  4, 196489,     30.000, 0x00000000, 0 },
  {  5510,  838,  5, 196489,     36.000, 0x00000000, 0 },
  {  7080,  838,  6, 196489,     42.000, 0x00000000, 0 },
  {  7081,  838,  7, 196489,     48.000, 0x00000000, 0 },
  {  3972,  839,  0, 196437,      0.000, 0x00000000, 0 },
  {  3973,  840,  0, 196779,      0.000, 0x00000000, 0 },
  {  3974,  841,  0, 196355,      5.000, 0x00000000, 0 },
  {  3975,  841,  1, 196355,     10.000, 0x00000000, 0 },
  {  3976,  841,  2, 196355,     15.000, 0x00000000, 0 },
  {  3977,  841,  3, 196355,     20.000, 0x00000000, 0 },
  {  3978,  841,  4, 196355,     25.000, 0x00000000, 0 },
  {  3979,  841,  5, 196355,     30.000, 0x00000000, 0 },
  {  7088,  841,  6, 196355,     35.000, 0x00000000, 0 },
  {  7089,  841,  7, 196355,     40.000, 0x00000000, 0 },
  {  3980,  842,  0, 196358,      6.000, 0x00000000, 0 },
  {  3981,  842,  1, 196358,     12.000, 0x00000000, 0 },
  {  3982,  842,  2, 196358,     18.000, 0x00000000, 0 },
  {  3983,  842,  3, 196358,     24.000, 0x00000000, 0 },
  {  3984,  842,  4, 196358,     30.000, 0x00000000, 0 },
  {  3985,  842,  5, 196358,     36.000, 0x00000000, 0 },
  {  7084,  842,  6, 196358,     42.000, 0x00000000, 0 },
  {  7085,  842,  7, 196358,     48.000, 0x00000000, 0 },
  {  3986,  843,  0, 196416,      5.000, 0x00000000, 0 },
  {  3987,  843,  1, 196416,     10.000, 0x00000000, 0 },
  {  3988,  843,  2, 196416,     15.000, 0x00000000, 0 },
  {  3989,  843,  3, 196416,     20.000, 0x00000000, 0 },
  {  3990,  843,  4, 196416,     25.000, 0x00000000, 0 },
  {  3991,  843,  5, 196416,     30.000, 0x00000000, 0 },
  {  7086,  843,  6, 196416,     35.000, 0x00000000, 0 },
  {  7087,  843,  7, 196416,     40.000, 0x00000000, 0 },
  {  3992,  844,  0, 196418,      3.000, 0x00000000, 0 },
  {  3993,  844,  1, 196418,      6.000, 0x00000000, 0 },
  {  3994,  844,  2, 196418,      9.000, 0x00000000, 0 },
  {  3995,  844,  3, 196418,     12.000, 0x00000000, 0 },
  {  3996,  844,  4, 196418,     15.000, 0x00000000, 0 },
  {  3997,  844,  5, 196418,     18.000, 0x00000000, 0 },
  {  7082,  844,  6, 196418,     21.000, 0x00000000, 0 },
  {  7083,  844,  7, 196418,     24.000, 0x00000000, 0 },
  {  3998,  845,  0, 196419,      0.000, 0x00000000, 0 },
  {  4004,  846,  0, 196422,      5.000, 0x00000000, 0 },
  {  4005,  846,  1, 196422,     10.000, 0x00000000, 0 },
  {  4006,  846,  2, 196422,     15.000, 0x00000000, 0 },
  {  4007,  846,  3, 196422,     20.000, 0x00000000, 0 },
  {  4008,  846,  4, 196422,     25.000, 0x00000000, 0 },
  {  4009,  846,  5, 196422,     30.000, 0x00000000, 0 },
  {  7078,  846,  6, 196422,     35.000, 0x00000000, 0 },
  {  7079,  846,  7, 196422,     40.000, 0x00000000, 0 },
  {  4010,  847,  0, 196429,  -3000.000, 0x00000000, 0 },
  {  4011,  847,  1, 196429,  -6000.000, 0x00000000, 0 },
  {  4012,  847,  2, 196429, -10000.000, 0x00000000, 0 },
  {  4013,  847,  3, 196429, -13000.000, 0x00000000, 0 },
  {  4014,  847,  4, 196429, -16000.000, 0x00000000, 0 },
  {  4015,  847,  5, 196429, -20000.000, 0x00000000, 0 },
  {  7074,  847,  6, 196429, -23000.000, 0x00000000, 0 },
  {  7075,  847,  7, 196429, -26000.000, 0x00000000, 0 },
  {  4016,  848,  0, 196430,      3.000, 0x00000000, 0 },
  {  4017,  848,  1, 196430,      6.000, 0x00000000, 0 },
  {  4018,  848,  2, 196430,     10.000, 0x00000000, 0 },
  {  4019,  848,  3, 196430,     13.000, 0x00000000, 0 },
  {  4020,  848,  4, 196430,     16.000, 0x00000000, 0 },
  {  4021,  848,  5, 196430,     20.000, 0x00000000, 0 },
  {  7090,  848,  6, 196430,     23.000, 0x00000000, 0 },
  {  7091,  848,  7, 196430,     26.000, 0x00000000, 0 },
  {  4022,  849,  0, 196434,      4.000, 0x00000000, 0 },
  {  4023,  849,  1, 196434,      8.000, 0x00000000, 0 },
  {  4024,  849,  2, 196434,     12.000, 0x00000000, 0 },
  {  4025,  849,  3, 196434,     16.000, 0x00000000, 0 },
  {  4026,  849,  4, 196434,     20.000, 0x00000000, 0 },
  {  4027,  849,  5, 196434,     24.000, 0x00000000, 0 },
  {  7076,  849,  6, 196434,     28.000, 0x00000000, 0 },
  {  7077,  849,  7, 196434,     32.000, 0x00000000, 0 },
  {  4030,  851,  0, 209782,      0.000, 0x00000000, 0 },
  {  4031,  852,  0, 197231,      5.000, 0x00000000, 0 },
  {  4046,  852,  1, 197231,     10.000, 0x00000000, 0 },
  {  4047,  852,  2, 197231,     15.000, 0x00000000, 0 },
  {  4048,  852,  3, 197231,     20.000, 0x00000000, 0 },
  {  4049,  852,  4, 197231,     25.000, 0x00000000, 0 },
  {  4050,  852,  5, 197231,     30.000, 0x00000000, 0 },
  {  7180,  852,  6, 197231,     35.000, 0x00000000, 0 },
  {  7181,  852,  7, 197231,     40.000, 0x00000000, 0 },
  {  4032,  853,  0, 197233,      5.000, 0x00000000, 0 },
  {  4051,  853,  1, 197233,     10.000, 0x00000000, 0 },
  {  4052,  853,  2, 197233,     15.000, 0x00000000, 0 },
  {  4053,  853,  3, 197233,     20.000, 0x00000000, 0 },
  {  4054,  853,  4, 197233,     25.000, 0x00000000, 0 },
  {  4055,  853,  5, 197233,     30.000, 0x00000000, 0 },
  {  7166,  853,  6, 197233,     35.000, 0x00000000, 0 },
  {  7167,  853,  7, 197233,     40.000, 0x00000000, 0 },
  {  4033,  854,  0, 197234,      5.000, 0x00000000, 0 },
  {  4056,  854,  1, 197234,     10.000, 0x00000000, 0 },
  {  4057,  854,  2, 197234,     15.000, 0x00000000, 0 },
  {  4058,  854,  3, 197234,     20.000, 0x00000000, 0 },
  {  4059,  854,  4, 197234,     25.000, 0x00000000, 0 },
  {  4060,  854,  5, 197234,     30.000, 0x00000000, 0 },
  {  7174,  854,  6, 197234,     35.000, 0x00000000, 0 },
  {  7175,  854,  7, 197234,     40.000, 0x00000000, 0 },
  {  4034,  855,  0, 197235,      5.000, 0x00000000, 0 },
  {  4061,  855,  1, 197235,     10.000, 0x00000000, 0 },
  {  4062,  855,  2, 197235,     15.000, 0x00000000, 0 },
  {  4063,  855,  3, 197235,     20.000, 0x00000000, 0 },
  {  4064,  855,  4, 197235,     25.000, 0x00000000, 0 },
  {  4065,  855,  5, 197235,     30.000, 0x00000000, 0 },
  {  7176,  855,  6, 197235,     35.000, 0x00000000, 0 },
  {  7177,  855,  7, 197235,     40.000, 0x00000000, 0 },
  {  4035,  856,  0, 197369,      5.000, 0x00000000, 0 },
  {  4142,  856,  1, 197369,     10.000, 0x00000000, 0 },
  {  4143,  856,  2, 197369,     15.000, 0x00000000, 0 },
  {  4144,  856,  3, 197369,     20.000, 0x00000000, 0 },
  {  4145,  856,  4, 197369,     25.000, 0x00000000, 0 },
  {  4146,  856,  5, 197369,     30.000, 0x00000000, 0 },
  {  7170,  856,  6, 197369,     35.000, 0x00000000, 0 },
  {  7171,  856,  7, 197369,     40.000, 0x00000000, 0 },
  {  4036,  857,  0, 197386,   3000.000, 0x00000000, 0 },
  {  4147,  857,  1, 197386,   6000.000, 0x00000000, 0 },
  {  4148,  857,  2, 197386,  10000.000, 0x00000000, 0 },
  {  4149,  857,  3, 197386,  13000.000, 0x00000000, 0 },
  {  4150,  857,  4, 197386,  16000.000, 0x00000000, 0 },
  {  4151,  857,  5, 197386,  20000.000, 0x00000000, 0 },
  {  7178,  857,  6, 197386,  23000.000, 0x00000000, 0 },
  {  7179,  857,  7, 197386,  26000.000, 0x00000000, 0 },
  {  4037,  858,  0, 197239,      2.000, 0x00000000, 0 },
  {  4066,  858,  1, 197239,      4.000, 0x00000000, 0 },
  {  4067,  858,  2, 197239,      6.000, 0x00000000, 0 },
  {  4068,  858,  3, 197239,      8.000, 0x00000000, 0 },
  {  4069,  858,  4, 197239,     10.000, 0x00000000, 0 },
  {  4070,  858,  5, 197239,     12.000, 0x00000000, 0 },
  {  7168,  858,  6, 197239,     14.000, 0x00000000, 0 },
  {  7169,  858,  7, 197239,     16.000, 0x00000000, 0 },
  {  4038,  859,  0, 197241,      0.000, 0x00000000, 0 },
  {  4071,  859,  1, 210144,      0.000, 0x00000000, 0 },
  {  4072,  859,  2, 210145,      0.000, 0x00000000, 0 },
  {  4073,  859,  3, 210146,      0.000, 0x00000000, 0 },
  {  4074,  859,  4, 210147,      0.000, 0x00000000, 0 },
  {  4075,  859,  5, 210148,      0.000, 0x00000000, 0 },
  {  7164,  859,  6, 239290,      0.000, 0x00000000, 0 },
  {  7165,  859,  7, 239291,      0.000, 0x00000000, 0 },
  {  4039,  860,  0, 197244,      3.000, 0x00000000, 0 },
  {  4076,  860,  1, 197244,      6.000, 0x00000000, 0 },
  {  4077,  860,  2, 197244,     10.000, 0x00000000, 0 },
  {  4078,  860,  3, 197244,     13.000, 0x00000000, 0 },
  {  4079,  860,  4, 197244,     16.000, 0x00000000, 0 },
  {  4080,  860,  5, 197244,     20.000, 0x00000000, 0 },
  {  7172,  860,  6, 197244,     23.000, 0x00000000, 0 },
  {  7173,  860,  7, 197244,     26.000, 0x00000000, 0 },
  {  4040,  861,  0, 197610,      0.000, 0x00000000, 0 },
  {  4041,  862,  0, 197256,      0.000, 0x00000000, 0 },
  {  4042,  863,  0, 197604,      0.000, 0x00000000, 0 },
  {  4043,  864,  0, 209835,      0.000, 0x00000000, 0 },
  {  4044,  865,  0, 209781,      0.000, 0x00000000, 0 },
  {  4045,  866,  0, 197406,      0.000, 0x00000000, 0 },
  {  4087,  868,  0, 197038,   1000.000, 0x00000000, 0 },
  {  4088,  868,  1, 197038,   2000.000, 0x00000000, 0 },
  {  4089,  868,  2, 197038,   3000.000, 0x00000000, 0 },
  {  4090,  868,  3, 197038,   4000.000, 0x00000000, 0 },
  {  4091,  868,  4, 197038,   5000.000, 0x00000000, 0 },
  {  4092,  868,  5, 197038,   6000.000, 0x00000000, 0 },
  {  6894,  868,  6, 197038,   7000.000, 0x00000000, 0 },
  {  6895,  868,  7, 197038,   8000.000, 0x00000000, 0 },
  {  4093,  869,  0, 197047,     10.000, 0x00000000, 0 },
  {  4094,  869,  1, 197047,     20.000, 0x00000000, 0 },
  {  4095,  869,  2, 197047,     30.000, 0x00000000, 0 },
  {  4096,  869,  3, 197047,     40.000, 0x00000000, 0 },
  {  4097,  869,  4, 197047,     50.000, 0x00000000, 0 },
  {  4098,  869,  5, 197047,     60.000, 0x00000000, 0 },
  {  6896,  869,  6, 197047,     70.000, 0x00000000, 0 },
  {  6897,  869,  7, 197047,     80.000, 0x00000000, 0 },
  {  4099,  870,  0, 197080,      3.000, 0x00000000, 0 },
  {  4100,  870,  1, 197080,      6.000, 0x00000000, 0 },
  {  4101,  870,  2, 197080,      9.000, 0x00000000, 0 },
  {  4102,  870,  3, 197080,     12.000, 0x00000000, 0 },
  {  4103,  870,  4, 197080,     15.000, 0x00000000, 0 },
  {  4104,  870,  5, 197080,     18.000, 0x00000000, 0 },
  {  6898,  870,  6, 197080,     21.000, 0x00000000, 0 },
  {  6899,  870,  7, 197080,     24.000, 0x00000000, 0 },
  {  4105,  871,  0, 197138,      2.000, 0x00000000, 0 },
  {  4106,  871,  1, 197138,      4.000, 0x00000000, 0 },
  {  4107,  871,  2, 197138,      6.000, 0x00000000, 0 },
  {  4108,  871,  3, 197138,      8.000, 0x00000000, 0 },
  {  4109,  871,  4, 197138,     10.000, 0x00000000, 0 },
  {  4110,  871,  5, 197138,     12.000, 0x00000000, 0 },
  {  6900,  871,  6, 197138,     14.000, 0x00000000, 0 },
  {  6901,  871,  7, 197138,     16.000, 0x00000000, 0 },
  {  4111,  872,  0, 197139,      5.000, 0x00000000, 0 },
  {  4112,  872,  1, 197139,     10.000, 0x00000000, 0 },
  {  4113,  872,  2, 197139,     15.000, 0x00000000, 0 },
  {  4114,  872,  3, 197139,     20.000, 0x00000000, 0 },
  {  4115,  872,  4, 197139,     25.000, 0x00000000, 0 },
  {  4116,  872,  5, 197139,     30.000, 0x00000000, 0 },
  {  6902,  872,  6, 197139,     35.000, 0x00000000, 0 },
  {  6903,  872,  7, 197139,     40.000, 0x00000000, 0 },
  {  4117,  873,  0, 197140,      3.000, 0x00000000, 0 },
  {  4118,  873,  1, 197140,      6.000, 0x00000000, 0 },
  {  4119,  873,  2, 197140,     10.000, 0x00000000, 0 },
  {  4120,  873,  3, 197140,     13.000, 0x00000000, 0 },
  {  4121,  873,  4, 197140,     16.000, 0x00000000, 0 },
  {  4122,  873,  5, 197140,     20.000, 0x00000000, 0 },
  {  6904,  873,  6, 197140,     23.000, 0x00000000, 0 },
  {  6905,  873,  7, 197140,     26.000, 0x00000000, 0 },
  {  4123,  874,  0, 197160,     10.000, 0x00000000, 0 },
  {  4124,  874,  1, 197160,     20.000, 0x00000000, 0 },
  {  4125,  874,  2, 197160,     30.000, 0x00000000, 0 },
  {  4126,  874,  3, 197160,     40.000, 0x00000000, 0 },
  {  4127,  874,  4, 197160,     50.000, 0x00000000, 0 },
  {  4128,  874,  5, 197160,     60.000, 0x00000000, 0 },
  {  6906,  874,  6, 197160,     70.000, 0x00000000, 0 },
  {  6907,  874,  7, 197160,     80.000, 0x00000000, 0 },
  {  4129,  875,  0, 197162,      8.000, 0x00000000, 0 },
  {  4130,  875,  1, 197162,     16.000, 0x00000000, 0 },
  {  4131,  875,  2, 197162,     24.000, 0x00000000, 0 },
  {  4132,  875,  3, 197162,     32.000, 0x00000000, 0 },
  {  4133,  875,  4, 197162,     40.000, 0x00000000, 0 },
  {  4134,  875,  5, 197162,     48.000, 0x00000000, 0 },
  {  6908,  875,  6, 197162,     56.000, 0x00000000, 0 },
  {  6909,  875,  7, 197162,     64.000, 0x00000000, 0 },
  {  4135,  876,  0, 197178,      0.000, 0x00000000, 0 },
  {  4136,  877,  0, 197199,      0.000, 0x00000000, 0 },
  {  4137,  878,  0, 197248,      0.000, 0x00000000, 0 },
  {  4138,  879,  0, 207068,      0.000, 0x00000000, 0 },
  {  4139,  880,  0, 197343,      0.000, 0x00000000, 0 },
  {  4140,  881,  0, 197344,      0.000, 0x00000000, 0 },
  {  4141,  882,  0, 197354,      0.000, 0x00000000, 0 },
  {  4152,  883,  0, 207946,      0.000, 0x00000000, 0 },
  {  4153,  884,  0, 197779,      0.000, 0x00000000, 0 },
  {  4154,  885,  0, 197781,      0.000, 0x00000000, 0 },
  {  4155,  886,  0, 197815,      0.000, 0x00000000, 0 },
  {  4156,  887,  0, 198074,      0.000, 0x00000000, 0 },
  {  4157,  888,  0, 197708,      4.000, 0x00000000, 0 },
  {  4158,  888,  1, 197708,      8.000, 0x00000000, 0 },
  {  4159,  888,  2, 197708,     12.000, 0x00000000, 0 },
  {  4160,  888,  3, 197708,     16.000, 0x00000000, 0 },
  {  4161,  888,  4, 197708,     20.000, 0x00000000, 0 },
  {  4162,  888,  5, 197708,     24.000, 0x00000000, 0 },
  {  7094,  888,  6, 197708,     28.000, 0x00000000, 0 },
  {  7095,  888,  7, 197708,     32.000, 0x00000000, 0 },
  {  4163,  889,  0, 197711,     -3.000, 0x00000000, 0 },
  {  4164,  889,  1, 197711,     -6.000, 0x00000000, 0 },
  {  4165,  889,  2, 197711,    -10.000, 0x00000000, 0 },
  {  4166,  889,  3, 197711,    -13.000, 0x00000000, 0 },
  {  4167,  889,  4, 197711,    -16.000, 0x00000000, 0 },
  {  4168,  889,  5, 197711,    -20.000, 0x00000000, 0 },
  {  7108,  889,  6, 197711,    -23.000, 0x00000000, 0 },
  {  7109,  889,  7, 197711,    -26.000, 0x00000000, 0 },
  {  4169,  890,  0, 197713, -10000.000, 0x00000000, 0 },
  {  4170,  890,  1, 197713, -20000.000, 0x00000000, 0 },
  {  4171,  890,  2, 197713, -30000.000, 0x00000000, 0 },
  {  4172,  890,  3, 197713, -40000.000, 0x00000000, 0 },
  {  4173,  890,  4, 197713, -50000.000, 0x00000000, 0 },
  {  4174,  890,  5, 197713, -60000.000, 0x00000000, 0 },
  {  7100,  890,  6, 197713, -70000.000, 0x00000000, 0 },
  {  7101,  890,  7, 197713, -80000.000, 0x00000000, 0 },
  {  4175,  891,  0, 197715,      5.000, 0x00000000, 0 },
  {  4176,  891,  1, 197715,     10.000, 0x00000000, 0 },
  {  4177,  891,  2, 197715,     15.000, 0x00000000, 0 },
  {  4178,  891,  3, 197715,     20.000, 0x00000000, 0 },
  {  4179,  891,  4, 197715,     25.000, 0x00000000, 0 },
  {  4180,  891,  5, 197715,     30.000, 0x00000000, 0 },
  {  7106,  891,  6, 197715,     35.000, 0x00000000, 0 },
  {  7107,  891,  7, 197715,     40.000, 0x00000000, 0 },
  {  4181,  892,  0, 197716,      5.000, 0x00000000, 0 },
  {  4182,  892,  1, 197716,     10.000, 0x00000000, 0 },
  {  4183,  892,  2, 197716,     15.000, 0x00000000, 0 },
  {  4184,  892,  3, 197716,     20.000, 0x00000000, 0 },
  {  4185,  892,  4, 197716,     25.000, 0x00000000, 0 },
  {  4186,  892,  5, 197716,     30.000, 0x00000000, 0 },
  {  7092,  892,  6, 197716,     35.000, 0x00000000, 0 },
  {  7093,  892,  7, 197716,     40.000, 0x00000000, 0 },
  {  4187,  893,  0, 197727,   1000.000, 0x00000000, 0 },
  {  4188,  893,  1, 197727,   2000.000, 0x00000000, 0 },
  {  4189,  893,  2, 197727,   3000.000, 0x00000000, 0 },
  {  4190,  893,  3, 197727,   4000.000, 0x00000000, 0 },
  {  4191,  893,  4, 197727,   5000.000, 0x00000000, 0 },
  {  4192,  893,  5, 197727,   6000.000, 0x00000000, 0 },
  {  7098,  893,  6, 197727,   7000.000, 0x00000000, 0 },
  {  7099,  893,  7, 197727,   8000.000, 0x00000000, 0 },
  {  4193,  894,  0, 197729,      5.000, 0x00000000, 0 },
  {  4194,  894,  1, 197729,     10.000, 0x00000000, 0 },
  {  4195,  894,  2, 197729,     15.000, 0x00000000, 0 },
  {  4196,  894,  3, 197729,     20.000, 0x00000000, 0 },
  {  4197,  894,  4, 197729,     25.000, 0x00000000, 0 },
  {  4198,  894,  5, 197729,     30.000, 0x00000000, 0 },
  {  7104,  894,  6, 197729,     35.000, 0x00000000, 0 },
  {  7105,  894,  7, 197729,     40.000, 0x00000000, 0 },
  {  4199,  895,  0, 197762,     -5.000, 0x00000000, 0 },
  {  4200,  895,  1, 197762,    -10.000, 0x00000000, 0 },
  {  4201,  895,  2, 197762,    -15.000, 0x00000000, 0 },
  {  4202,  895,  3, 197762,    -20.000, 0x00000000, 0 },
  {  4203,  895,  4, 197762,    -25.000, 0x00000000, 0 },
  {  4204,  895,  5, 197762,    -30.000, 0x00000000, 0 },
  {  7102,  895,  6, 197762,    -35.000, 0x00000000, 0 },
  {  7103,  895,  7, 197762,    -40.000, 0x00000000, 0 },
  {  4205,  896,  0, 216212,      3.000, 0x00000000, 0 },
  {  6453,  896,  1, 216212,      6.000, 0x00000000, 0 },
  {  6454,  896,  2, 216212,     10.000, 0x00000000, 0 },
  {  6455,  896,  3, 216212,     13.000, 0x00000000, 0 },
  {  6456,  896,  4, 216212,     16.000, 0x00000000, 0 },
  {  6457,  896,  5, 216212,     20.000, 0x00000000, 0 },
  {  7096,  896,  6, 216212,     23.000, 0x00000000, 0 },
  {  7097,  896,  7, 216212,     26.000, 0x00000000, 0 },
  {  4211,  897,  0, 198068,      0.000, 0x00000000, 0 },
  {  4212,  898,  0, 197766,      0.000, 0x00000000, 0 },
  {  4213,  899,  0, 204945,      0.000, 0x00000000, 0 },
  {  4214,  900,  0, 198736,      0.000, 0x00000000, 0 },
  {  4215,  901,  0, 198505,      0.000, 0x00000000, 0 },
  {  4216,  902,  0, 198361,      0.000, 0x00000000, 0 },
  {  4217,  903,  0, 198367,      0.000, 0x00000000, 0 },
  {  4218,  904,  0, 198434,      0.000, 0x00000000, 0 },
  {  4219,  905,  0, 215381,      3.000, 0x00000000, 0 },
  {  6447,  905,  1, 215381,      6.000, 0x00000000, 0 },
  {  6448,  905,  2, 215381,     10.000, 0x00000000, 0 },
  {  6449,  905,  3, 215381,     13.000, 0x00000000, 0 },
  {  6450,  905,  4, 215381,     16.000, 0x00000000, 0 },
  {  6451,  905,  5, 215381,     20.000, 0x00000000, 0 },
  {  7212,  905,  6, 215381,     23.000, 0x00000000, 0 },
  {  7213,  905,  7, 215381,     26.000, 0x00000000, 0 },
  {  4225,  906,  0, 198236,      3.000, 0x00000000, 0 },
  {  4226,  906,  1, 198236,      6.000, 0x00000000, 0 },
  {  4227,  906,  2, 198236,     10.000, 0x00000000, 0 },
  {  4228,  906,  3, 198236,     13.000, 0x00000000, 0 },
  {  4229,  906,  4, 198236,     16.000, 0x00000000, 0 },
  {  4230,  906,  5, 198236,     20.000, 0x00000000, 0 },
  {  7202,  906,  6, 198236,     23.000, 0x00000000, 0 },
  {  7203,  906,  7, 198236,     26.000, 0x00000000, 0 },
  {  4231,  907,  0, 198238,      5.000, 0x00000000, 0 },
  {  4232,  907,  1, 198238,     10.000, 0x00000000, 0 },
  {  4233,  907,  2, 198238,     15.000, 0x00000000, 0 },
  {  4234,  907,  3, 198238,     20.000, 0x00000000, 0 },
  {  4235,  907,  4, 198238,     25.000, 0x00000000, 0 },
  {  4236,  907,  5, 198238,     30.000, 0x00000000, 0 },
  {  7208,  907,  6, 198238,     35.000, 0x00000000, 0 },
  {  7209,  907,  7, 198238,     40.000, 0x00000000, 0 },
  {  4237,  908,  0, 198247,      8.000, 0x00000000, 0 },
  {  4238,  908,  1, 198247,     16.000, 0x00000000, 0 },
  {  4239,  908,  2, 198247,     24.000, 0x00000000, 0 },
  {  4240,  908,  3, 198247,     32.000, 0x00000000, 0 },
  {  4241,  908,  4, 198247,     40.000, 0x00000000, 0 },
  {  4242,  908,  5, 198247,     48.000, 0x00000000, 0 },
  {  7216,  908,  6, 198247,     56.000, 0x00000000, 0 },
  {  7217,  908,  7, 198247,     64.000, 0x00000000, 0 },
  {  4243,  909,  0, 198248,      2.000, 0x00000000, 0 },
  {  4244,  909,  1, 198248,      4.000, 0x00000000, 0 },
  {  4245,  909,  2, 198248,      6.000, 0x00000000, 0 },
  {  4246,  909,  3, 198248,      8.000, 0x00000000, 0 },
  {  4247,  909,  4, 198248,     10.000, 0x00000000, 0 },
  {  4248,  909,  5, 198248,     12.000, 0x00000000, 0 },
  {  7200,  909,  6, 198248,     14.000, 0x00000000, 0 },
  {  7201,  909,  7, 198248,     16.000, 0x00000000, 0 },
  {  4249,  910,  0, 198292,      3.000, 0x00000000, 0 },
  {  4250,  910,  1, 198292,      6.000, 0x00000000, 0 },
  {  4251,  910,  2, 198292,      9.000, 0x00000000, 0 },
  {  4252,  910,  3, 198292,     12.000, 0x00000000, 0 },
  {  4253,  910,  4, 198292,     15.000, 0x00000000, 0 },
  {  4254,  910,  5, 198292,     18.000, 0x00000000, 0 },
  {  7214,  910,  6, 198292,     21.000, 0x00000000, 0 },
  {  7215,  910,  7, 198292,     24.000, 0x00000000, 0 },
  {  4255,  911,  0, 198296,     10.000, 0x00000000, 0 },
  {  4256,  911,  1, 198296,     20.000, 0x00000000, 0 },
  {  4257,  911,  2, 198296,     30.000, 0x00000000, 0 },
  {  4258,  911,  3, 198296,     40.000, 0x00000000, 0 },
  {  4259,  911,  4, 198296,     50.000, 0x00000000, 0 },
  {  4260,  911,  5, 198296,     60.000, 0x00000000, 0 },
  {  7210,  911,  6, 198296,     70.000, 0x00000000, 0 },
  {  7211,  911,  7, 198296,     80.000, 0x00000000, 0 },
  {  4261,  912,  0, 198299,      2.000, 0x00000000, 0 },
  {  4262,  912,  1, 198299,      4.000, 0x00000000, 0 },
  {  4263,  912,  2, 198299,      6.000, 0x00000000, 0 },
  {  4264,  912,  3, 198299,      8.000, 0x00000000, 0 },
  {  4265,  912,  4, 198299,     10.000, 0x00000000, 0 },
  {  4266,  912,  5, 198299,     12.000, 0x00000000, 0 },
  {  7206,  912,  6, 198299,     14.000, 0x00000000, 0 },
  {  7207,  912,  7, 198299,     16.000, 0x00000000, 0 },
  {  4267,  913,  0, 198349,      1.000, 0x00000000, 0 },
  {  4268,  913,  1, 198349,      2.000, 0x00000000, 0 },
  {  4269,  913,  2, 198349,      3.000, 0x00000000, 0 },
  {  4270,  913,  3, 198349,      4.000, 0x00000000, 0 },
  {  4271,  913,  4, 198349,      5.000, 0x00000000, 0 },
  {  4272,  913,  5, 198349,      6.000, 0x00000000, 0 },
  {  7204,  913,  6, 198349,      7.000, 0x00000000, 0 },
  {  7205,  913,  7, 198349,      8.000, 0x00000000, 0 },
  {  4273,  915,  0, 199111,      4.000, 0x00000000, 0 },
  {  4274,  915,  1, 199111,      8.000, 0x00000000, 0 },
  {  4275,  915,  2, 199111,     12.000, 0x00000000, 0 },
  {  4276,  915,  3, 199111,     16.000, 0x00000000, 0 },
  {  4277,  915,  4, 199111,     20.000, 0x00000000, 0 },
  {  4278,  915,  5, 199111,     24.000, 0x00000000, 0 },
  {  7254,  915,  6, 199111,     28.000, 0x00000000, 0 },
  {  7255,  915,  7, 199111,     32.000, 0x00000000, 0 },
  {  4279,  916,  0, 199112,      4.000, 0x00000000, 0 },
  {  4280,  916,  1, 199112,      8.000, 0x00000000, 0 },
  {  4281,  916,  2, 199112,     12.000, 0x00000000, 0 },
  {  4282,  916,  3, 199112,     16.000, 0x00000000, 0 },
  {  4283,  916,  4, 199112,     20.000, 0x00000000, 0 },
  {  4284,  916,  5, 199112,     24.000, 0x00000000, 0 },
  {  7256,  916,  6, 199112,     28.000, 0x00000000, 0 },
  {  7257,  916,  7, 199112,     32.000, 0x00000000, 0 },
  {  4285,  917,  0, 199120,      2.000, 0x00000000, 0 },
  {  4286,  917,  1, 199120,      4.000, 0x00000000, 0 },
  {  4287,  917,  2, 199120,      6.000, 0x00000000, 0 },
  {  4288,  917,  3, 199120,      8.000, 0x00000000, 0 },
  {  4289,  917,  4, 199120,     10.000, 0x00000000, 0 },
  {  4290,  917,  5, 199120,     12.000, 0x00000000, 0 },
  {  7258,  917,  6, 199120,     14.000, 0x00000000, 0 },
  {  7259,  917,  7, 199120,     16.000, 0x00000000, 0 },
  {  4292,  918,  0, 199152,      2.000, 0x00000000, 0 },
  {  4293,  918,  1, 199152,      4.000, 0x00000000, 0 },
  {  4294,  918,  2, 199152,      6.000, 0x00000000, 0 },
  {  4295,  918,  3, 199152,      8.000, 0x00000000, 0 },
  {  4296,  918,  4, 199152,     10.000, 0x00000000, 0 },
  {  4297,  918,  5, 199152,     12.000, 0x00000000, 0 },
  {  7260,  918,  6, 199152,     14.000, 0x00000000, 0 },
  {  7261,  918,  7, 199152,     16.000, 0x00000000, 0 },
  {  4298,  919,  0, 199153,      5.000, 0x00000000, 0 },
  {  4299,  919,  1, 199153,     10.000, 0x00000000, 0 },
  {  4300,  919,  2, 199153,     15.000, 0x00000000, 0 },
  {  4301,  919,  3, 199153,     20.000, 0x00000000, 0 },
  {  4302,  919,  4, 199153,     25.000, 0x00000000, 0 },
  {  4303,  919,  5, 199153,     30.000, 0x00000000, 0 },
  {  7262,  919,  6, 199153,     35.000, 0x00000000, 0 },
  {  7263,  919,  7, 199153,     40.000, 0x00000000, 0 },
  {  4304,  920,  0, 199158,      6.000, 0x00000000, 0 },
  {  4305,  920,  1, 199158,     12.000, 0x00000000, 0 },
  {  4306,  920,  2, 199158,     20.000, 0x00000000, 0 },
  {  4307,  920,  3, 199158,     26.000, 0x00000000, 0 },
  {  4308,  920,  4, 199158,     32.000, 0x00000000, 0 },
  {  4309,  920,  5, 199158,     40.000, 0x00000000, 0 },
  {  7264,  920,  6, 199158,     46.000, 0x00000000, 0 },
  {  7265,  920,  7, 199158,     52.000, 0x00000000, 0 },
  {  4310,  921,  0, 199163,      1.000, 0x00000000, 0 },
  {  4311,  921,  1, 199163,      2.000, 0x00000000, 0 },
  {  4312,  921,  2, 199163,      3.000, 0x00000000, 0 },
  {  4313,  921,  3, 199163,      4.000, 0x00000000, 0 },
  {  4314,  921,  4, 199163,      5.000, 0x00000000, 0 },
  {  4315,  921,  5, 199163,      6.000, 0x00000000, 0 },
  {  7266,  921,  6, 199163,      7.000, 0x00000000, 0 },
  {  7267,  921,  7, 199163,      8.000, 0x00000000, 0 },
  {  4316,  922,  0, 199212,      1.000, 0x00000000, 0 },
  {  4317,  922,  1, 199212,      2.000, 0x00000000, 0 },
  {  4318,  922,  2, 199212,      3.000, 0x00000000, 0 },
  {  4319,  922,  3, 199212,      4.000, 0x00000000, 0 },
  {  4320,  922,  4, 199212,      5.000, 0x00000000, 0 },
  {  4321,  922,  5, 199212,      6.000, 0x00000000, 0 },
  {  7268,  922,  6, 199212,      7.000, 0x00000000, 0 },
  {  7269,  922,  7, 199212,      8.000, 0x00000000, 0 },
  {  4322,  923,  0, 199214,      3.000, 0x00000000, 0 },
  {  4323,  923,  1, 199214,      6.000, 0x00000000, 0 },
  {  4324,  923,  2, 199214,      9.000, 0x00000000, 0 },
  {  4325,  923,  3, 199214,     12.000, 0x00000000, 0 },
  {  4326,  923,  4, 199214,     15.000, 0x00000000, 0 },
  {  4327,  923,  5, 199214,     18.000, 0x00000000, 0 },
  {  7270,  923,  6, 199214,     21.000, 0x00000000, 0 },
  {  7271,  923,  7, 199214,     24.000, 0x00000000, 0 },
  {  4328,  924,  0, 199220,      0.000, 0x00000000, 0 },
  {  4329,  925,  0, 199257,      0.000, 0x00000000, 0 },
  {  4330,  926,  0, 199282,      0.000, 0x00000000, 0 },
  {  4332,  927,  0, 199471,      0.000, 0x00000000, 0 },
  {  4333,  928,  0, 199472,      0.000, 0x00000000, 0 },
  {  4334,  929,  0, 201424,      0.000, 0x00000000, 0 },
  {  4291,  930,  0, 199107,      0.000, 0x00000000, 0 },
  {  4335,  931,  0, 205406,      0.000, 0x00000000, 0 },
  {  4336,  932,  0, 199887,      0.000, 0x00000000, 0 },
  {  4337,  933,  0, 199665,      0.000, 0x00000000, 0 },
  {  4338,  934,  0, 199640,      0.000, 0x00000000, 0 },
  {  4339,  935,  0, 199401,      0.000, 0x00000000, 0 },
  {  4340,  936,  0, 199563,      0.000, 0x00000000, 0 },
  {  4341,  937,  0, 199573,      0.000, 0x00000000, 0 },
  {  4342,  938,  0, 199364,      3.000, 0x00000000, 0 },
  {  4343,  938,  1, 199364,      6.000, 0x00000000, 0 },
  {  4344,  938,  2, 199364,     10.000, 0x00000000, 0 },
  {  4345,  938,  3, 199364,     13.000, 0x00000000, 0 },
  {  4346,  938,  4, 199364,     16.000, 0x00000000, 0 },
  {  4347,  938,  5, 199364,     20.000, 0x00000000, 0 },
  {  7002,  938,  6, 199364,     23.000, 0x00000000, 0 },
  {  7003,  938,  7, 199364,     26.000, 0x00000000, 0 },
  {  4348,  939,  0, 199365,     -3.000, 0x00000000, 0 },
  {  4349,  939,  1, 199365,     -6.000, 0x00000000, 0 },
  {  4350,  939,  2, 199365,    -10.000, 0x00000000, 0 },
  {  4351,  939,  3, 199365,    -13.000, 0x00000000, 0 },
  {  4352,  939,  4, 199365,    -16.000, 0x00000000, 0 },
  {  4353,  939,  5, 199365,    -20.000, 0x00000000, 0 },
  {  7004,  939,  6, 199365,    -23.000, 0x00000000, 0 },
  {  7005,  939,  7, 199365,    -26.000, 0x00000000, 0 },
  {  4354,  940,  0, 199366,      3.000, 0x00000000, 0 },
  {  4355,  940,  1, 199366,      6.000, 0x00000000, 0 },
  {  4356,  940,  2, 199366,     10.000, 0x00000000, 0 },
  {  4357,  940,  3, 199366,     13.000, 0x00000000, 0 },
  {  4358,  940,  4, 199366,     16.000, 0x00000000, 0 },
  {  4359,  940,  5, 199366,     20.000, 0x00000000, 0 },
  {  7006,  940,  6, 199366,     23.000, 0x00000000, 0 },
  {  7007,  940,  7, 199366,     26.000, 0x00000000, 0 },
  {  4360,  941,  0, 199367,      5.000, 0x00000000, 0 },
  {  4361,  941,  1, 199367,     10.000, 0x00000000, 0 },
  {  4362,  941,  2, 199367,     15.000, 0x00000000, 0 },
  {  4363,  941,  3, 199367,     20.000, 0x00000000, 0 },
  {  4364,  941,  4, 199367,     25.000, 0x00000000, 0 },
  {  4365,  941,  5, 199367,     30.000, 0x00000000, 0 },
  {  7008,  941,  6, 199367,     35.000, 0x00000000, 0 },
  {  7009,  941,  7, 199367,     40.000, 0x00000000, 0 },
  {  4366,  942,  0, 199372,   1000.000, 0x00000000, 0 },
  {  4367,  942,  1, 199372,   2000.000, 0x00000000, 0 },
  {  4368,  942,  2, 199372,   3000.000, 0x00000000, 0 },
  {  4369,  942,  3, 199372,   4000.000, 0x00000000, 0 },
  {  4370,  942,  4, 199372,   5000.000, 0x00000000, 0 },
  {  4371,  942,  5, 199372,   6000.000, 0x00000000, 0 },
  {  7010,  942,  6, 199372,   7000.000, 0x00000000, 0 },
  {  7011,  942,  7, 199372,   8000.000, 0x00000000, 0 },
  {  4372,  943,  0, 199377,      3.000, 0x00000000, 0 },
  {  4373,  943,  1, 199377,      6.000, 0x00000000, 0 },
  {  4374,  943,  2, 199377,     10.000, 0x00000000, 0 },
  {  4375,  943,  3, 199377,     13.000, 0x00000000, 0 },
  {  4376,  943,  4, 199377,     16.000, 0x00000000, 0 },
  {  4377,  943,  5, 199377,     20.000, 0x00000000, 0 },
  {  7012,  943,  6, 199377,     23.000, 0x00000000, 0 },
  {  7013,  943,  7, 199377,     26.000, 0x00000000, 0 },
  {  4378,  944,  0, 199380,      5.000, 0x00000000, 0 },
  {  4379,  944,  1, 199380,     10.000, 0x00000000, 0 },
  {  4380,  944,  2, 199380,     15.000, 0x00000000, 0 },
  {  4381,  944,  3, 199380,     20.000, 0x00000000, 0 },
  {  4382,  944,  4, 199380,     25.000, 0x00000000, 0 },
  {  4383,  944,  5, 199380,     30.000, 0x00000000, 0 },
  {  7014,  944,  6, 199380,     35.000, 0x00000000, 0 },
  {  7015,  944,  7, 199380,     40.000, 0x00000000, 0 },
  {  4384,  945,  0, 199384,     20.000, 0x00000000, 0 },
  {  4385,  945,  1, 199384,     30.000, 0x00000000, 0 },
  {  4386,  945,  2, 199384,     40.000, 0x00000000, 0 },
  {  4387,  945,  3, 199384,     50.000, 0x00000000, 0 },
  {  4388,  945,  4, 199384,     60.000, 0x00000000, 0 },
  {  4389,  945,  5, 199384,     70.000, 0x00000000, 0 },
  {  7016,  945,  6, 199384,     80.000, 0x00000000, 0 },
  {  7017,  945,  7, 199384,     90.000, 0x00000000, 0 },
  {  4390,  946,  0, 199485,      5.000, 0x00000000, 0 },
  {  5573,  946,  1, 199485,     10.000, 0x00000000, 0 },
  {  5574,  946,  2, 199485,     15.000, 0x00000000, 0 },
  {  5575,  946,  3, 199485,     20.000, 0x00000000, 0 },
  {  5576,  946,  4, 199485,     25.000, 0x00000000, 0 },
  {  5577,  946,  5, 199485,     30.000, 0x00000000, 0 },
  {  7018,  946,  6, 199485,     35.000, 0x00000000, 0 },
  {  7019,  946,  7, 199485,     40.000, 0x00000000, 0 },
  {  4396,  948,  0, 200395,      4.000, 0x00000000, 0 },
  {  4397,  948,  1, 200395,      8.000, 0x00000000, 0 },
  {  4398,  948,  2, 200395,     12.000, 0x00000000, 0 },
  {  4399,  948,  3, 200395,     16.000, 0x00000000, 0 },
  {  4400,  948,  4, 200395,     20.000, 0x00000000, 0 },
  {  4401,  948,  5, 200395,     24.000, 0x00000000, 0 },
  {  6858,  948,  6, 200395,     28.000, 0x00000000, 0 },
  {  6859,  948,  7, 200395,     32.000, 0x00000000, 0 },
  {  4402,  949,  0, 200399,    500.000, 0x00000000, 0 },
  {  4403,  949,  1, 200399,   1000.000, 0x00000000, 0 },
  {  4404,  949,  2, 200399,   1500.000, 0x00000000, 0 },
  {  4405,  949,  3, 200399,   2000.000, 0x00000000, 0 },
  {  4406,  949,  4, 200399,   2500.000, 0x00000000, 0 },
  {  4407,  949,  5, 200399,   3000.000, 0x00000000, 0 },
  {  6860,  949,  6, 200399,   3500.000, 0x00000000, 0 },
  {  6861,  949,  7, 200399,   4000.000, 0x00000000, 0 },
  {  4408,  950,  0, 200400,      5.000, 0x00000000, 0 },
  {  4409,  950,  1, 200400,     10.000, 0x00000000, 0 },
  {  4410,  950,  2, 200400,     15.000, 0x00000000, 0 },
  {  4411,  950,  3, 200400,     20.000, 0x00000000, 0 },
  {  4412,  950,  4, 200400,     25.000, 0x00000000, 0 },
  {  4413,  950,  5, 200400,     30.000, 0x00000000, 0 },
  {  6862,  950,  6, 200400,     35.000, 0x00000000, 0 },
  {  6863,  950,  7, 200400,     40.000, 0x00000000, 0 },
  {  4414,  951,  0, 200402,     -3.000, 0x00000000, 0 },
  {  4415,  951,  1, 200402,     -6.000, 0x00000000, 0 },
  {  4416,  951,  2, 200402,     -9.000, 0x00000000, 0 },
  {  4417,  951,  3, 200402,    -12.000, 0x00000000, 0 },
  {  4418,  951,  4, 200402,    -15.000, 0x00000000, 0 },
  {  4419,  951,  5, 200402,    -18.000, 0x00000000, 0 },
  {  6864,  951,  6, 200402,    -21.000, 0x00000000, 0 },
  {  6865,  951,  7, 200402,    -24.000, 0x00000000, 0 },
  {  4420,  952,  0, 200409,     10.000, 0x00000000, 0 },
  {  4421,  952,  1, 200409,     20.000, 0x00000000, 0 },
  {  4422,  952,  2, 200409,     30.000, 0x00000000, 0 },
  {  4423,  952,  3, 200409,     40.000, 0x00000000, 0 },
  {  4424,  952,  4, 200409,     50.000, 0x00000000, 0 },
  {  4425,  952,  5, 200409,     60.000, 0x00000000, 0 },
  {  6866,  952,  6, 200409,     70.000, 0x00000000, 0 },
  {  6867,  952,  7, 200409,     80.000, 0x00000000, 0 },
  {  4426,  953,  0, 200414,      1.000, 0x00000000, 0 },
  {  4427,  953,  1, 200414,      2.000, 0x00000000, 0 },
  {  4428,  953,  2, 200414,      3.000, 0x00000000, 0 },
  {  4429,  953,  3, 200414,      4.000, 0x00000000, 0 },
  {  4430,  953,  4, 200414,      5.000, 0x00000000, 0 },
  {  4431,  953,  5, 200414,      6.000, 0x00000000, 0 },
  {  6868,  953,  6, 200414,      7.000, 0x00000000, 0 },
  {  6869,  953,  7, 200414,      8.000, 0x00000000, 0 },
  {  4432,  954,  0, 200415,     -3.000, 0x00000000, 0 },
  {  4433,  954,  1, 200415,     -6.000, 0x00000000, 0 },
  {  4434,  954,  2, 200415,    -10.000, 0x00000000, 0 },
  {  4435,  954,  3, 200415,    -13.000, 0x00000000, 0 },
  {  4436,  954,  4, 200415,    -16.000, 0x00000000, 0 },
  {  4437,  954,  5, 200415,    -20.000, 0x00000000, 0 },
  {  6870,  954,  6, 200415,    -23.000, 0x00000000, 0 },
  {  6871,  954,  7, 200415,    -26.000, 0x00000000, 0 },
  {  4641,  955,  0, 208762,      5.000, 0x00000000, 0 },
  {  4969,  955,  1, 208762,     10.000, 0x00000000, 0 },
  {  4970,  955,  2, 208762,     15.000, 0x00000000, 0 },
  {  4971,  955,  3, 208762,     20.000, 0x00000000, 0 },
  {  4972,  955,  4, 208762,     25.000, 0x00000000, 0 },
  {  4973,  955,  5, 208762,     30.000, 0x00000000, 0 },
  {  6872,  955,  6, 208762,     35.000, 0x00000000, 0 },
  {  6873,  955,  7, 208762,     40.000, 0x00000000, 0 },
  {  4438,  956,  0, 200440,      7.000, 0x00000000, 0 },
  {  4439,  956,  1, 200440,     14.000, 0x00000000, 0 },
  {  4440,  956,  2, 200440,     21.000, 0x00000000, 0 },
  {  4441,  956,  3, 200440,     28.000, 0x00000000, 0 },
  {  4442,  956,  4, 200440,     35.000, 0x00000000, 0 },
  {  4443,  956,  5, 200440,     42.000, 0x00000000, 0 },
  {  6874,  956,  6, 200440,     49.000, 0x00000000, 0 },
  {  6875,  956,  7, 200440,     56.000, 0x00000000, 0 },
  {  4444,  957,  0, 215799,      0.000, 0x00000000, 0 },
  {  4506,  958,  0, 200515,      0.000, 0x00000000, 0 },
  {  4576,  959,  0, 214996,      0.000, 0x00000000, 0 },
  {  4509,  960,  0, 200851,      0.000, 0x00000000, 0 },
  {  4510,  961,  0, 200855,      0.000, 0x00000000, 0 },
  {  4511,  962,  0, 200854,      0.000, 0x00000000, 0 },
  {  4445,  963,  0, 200474,      0.000, 0x00000000, 0 },
  {  4446,  964,  0, 200430,      0.000, 0x00000000, 0 },
  {  4447,  965,  0, 200652,      0.000, 0x00000000, 0 },
  {  4448,  966,  0, 200421,      0.000, 0x00000000, 0 },
  {  4449,  967,  0, 200407,      0.000, 0x00000000, 0 },
  {  4450,  968,  0, 200373,      0.000, 0x00000000, 0 },
  {  4451,  969,  0, 200327,    -10.000, 0x00000000, 0 },
  {  4452,  969,  1, 200327,    -20.000, 0x00000000, 0 },
  {  4453,  969,  2, 200327,    -30.000, 0x00000000, 0 },
  {  4454,  969,  3, 200327,    -40.000, 0x00000000, 0 },
  {  4455,  969,  4, 200327,    -50.000, 0x00000000, 0 },
  {  4456,  969,  5, 200327,    -60.000, 0x00000000, 0 },
  {  7038,  969,  6, 200327,    -70.000, 0x00000000, 0 },
  {  7039,  969,  7, 200327,    -80.000, 0x00000000, 0 },
  {  4457,  970,  0, 200326,     -9.090, 0x00000000, 0 },
  {  4458,  970,  1, 200326,    -16.667, 0x00000000, 0 },
  {  4459,  970,  2, 200326,    -23.070, 0x00000000, 0 },
  {  4460,  970,  3, 200326,    -28.570, 0x00000000, 0 },
  {  4461,  970,  4, 200326,    -33.333, 0x00000000, 0 },
  {  4462,  970,  5, 200326,    -37.500, 0x00000000, 0 },
  {  7040,  970,  6, 200326,    -41.200, 0x00000000, 0 },
  {  7041,  970,  7, 200326,    -44.500, 0x00000000, 0 },
  {  4463,  971,  0, 200316,      5.000, 0x00000000, 0 },
  {  4464,  971,  1, 200316,     10.000, 0x00000000, 0 },
  {  4465,  971,  2, 200316,     15.000, 0x00000000, 0 },
  {  4466,  971,  3, 200316,     20.000, 0x00000000, 0 },
  {  4467,  971,  4, 200316,     25.000, 0x00000000, 0 },
  {  4468,  971,  5, 200316,     30.000, 0x00000000, 0 },
  {  7042,  971,  6, 200316,     35.000, 0x00000000, 0 },
  {  7043,  971,  7, 200316,     40.000, 0x00000000, 0 },
  {  4469,  972,  0, 200315,     16.000, 0x00000000, 0 },
  {  4470,  972,  1, 200315,     32.000, 0x00000000, 0 },
  {  4471,  972,  2, 200315,     48.000, 0x00000000, 0 },
  {  4472,  972,  3, 200315,     64.000, 0x00000000, 0 },
  {  4473,  972,  4, 200315,     80.000, 0x00000000, 0 },
  {  4474,  972,  5, 200315,     96.000, 0x00000000, 0 },
  {  7044,  972,  6, 200315,    112.000, 0x00000000, 0 },
  {  7045,  972,  7, 200315,    128.000, 0x00000000, 0 },
  {  4475,  973,  0, 200311,      0.000, 0x00000000, 0 },
  {  4481,  974,  0, 200302,     -3.000, 0x00000000, 0 },
  {  4482,  974,  1, 200302,     -6.000, 0x00000000, 0 },
  {  4483,  974,  2, 200302,     -9.000, 0x00000000, 0 },
  {  4484,  974,  3, 200302,    -12.000, 0x00000000, 0 },
  {  4485,  974,  4, 200302,    -15.000, 0x00000000, 0 },
  {  4486,  974,  5, 200302,    -18.000, 0x00000000, 0 },
  {  7046,  974,  6, 200302,    -21.000, 0x00000000, 0 },
  {  7047,  974,  7, 200302,    -24.000, 0x00000000, 0 },
  {  4487,  975,  0, 200298,     -5.000, 0x00000000, 0 },
  {  4488,  975,  1, 200298,    -10.000, 0x00000000, 0 },
  {  4489,  975,  2, 200298,    -15.000, 0x00000000, 0 },
  {  4490,  975,  3, 200298,    -20.000, 0x00000000, 0 },
  {  4491,  975,  4, 200298,    -25.000, 0x00000000, 0 },
  {  4492,  975,  5, 200298,    -30.000, 0x00000000, 0 },
  {  7048,  975,  6, 200298,    -35.000, 0x00000000, 0 },
  {  7049,  975,  7, 200298,    -40.000, 0x00000000, 0 },
  {  4493,  976,  0, 200296,      3.000, 0x00000000, 0 },
  {  4494,  976,  1, 200296,      6.000, 0x00000000, 0 },
  {  4495,  976,  2, 200296,     10.000, 0x00000000, 0 },
  {  4496,  976,  3, 200296,     13.000, 0x00000000, 0 },
  {  4497,  976,  4, 200296,     16.000, 0x00000000, 0 },
  {  4498,  976,  5, 200296,     20.000, 0x00000000, 0 },
  {  7050,  976,  6, 200296,     23.000, 0x00000000, 0 },
  {  7051,  976,  7, 200296,     26.000, 0x00000000, 0 },
  {  4499,  977,  0, 200294,      3.000, 0x00000000, 0 },
  {  4500,  977,  1, 200294,      6.000, 0x00000000, 0 },
  {  4501,  977,  2, 200294,     10.000, 0x00000000, 0 },
  {  4502,  977,  3, 200294,     13.000, 0x00000000, 0 },
  {  4503,  977,  4, 200294,     16.000, 0x00000000, 0 },
  {  4504,  977,  5, 200294,     20.000, 0x00000000, 0 },
  {  7052,  977,  6, 200294,     23.000, 0x00000000, 0 },
  {  7053,  977,  7, 200294,     26.000, 0x00000000, 0 },
  {  4512,  979,  0, 200850,      0.000, 0x00000000, 0 },
  {  4513,  980,  0, 200875,      0.000, 0x00000000, 0 },
  {  4514,  981,  0, 200845,      0.000, 0x00000000, 0 },
  {  4515,  982,  0, 200872,      0.000, 0x00000000, 0 },
  {  4517,  984,  0, 205545,      0.000, 0x00000000, 0 },
  {  4518,  985,  0, 200871,      0.000, 0x00000000, 0 },
  {  4519,  986,  0, 200870,      0.000, 0x00000000, 0 },
  {  4520,  987,  0, 200863,      0.000, 0x00000000, 0 },
  {  4521,  988,  0, 200846,      3.000, 0x00000000, 0 },
  {  4522,  988,  1, 200846,      6.000, 0x00000000, 0 },
  {  4523,  988,  2, 200846,     10.000, 0x00000000, 0 },
  {  4524,  988,  3, 200846,     13.000, 0x00000000, 0 },
  {  4525,  988,  4, 200846,     16.000, 0x00000000, 0 },
  {  4526,  988,  5, 200846,     20.000, 0x00000000, 0 },
  {  7330,  988,  6, 200846,     23.000, 0x00000000, 0 },
  {  7331,  988,  7, 200846,     26.000, 0x00000000, 0 },
  {  4527,  989,  0, 216273,      7.000, 0x00000000, 0 },
  {  6508,  989,  1, 216273,     14.000, 0x00000000, 0 },
  {  6509,  989,  2, 216273,     21.000, 0x00000000, 0 },
  {  6510,  989,  3, 216273,     28.000, 0x00000000, 0 },
  {  6511,  989,  4, 216273,     35.000, 0x00000000, 0 },
  {  6512,  989,  5, 216273,     42.000, 0x00000000, 0 },
  {  7340,  989,  6, 216273,     49.000, 0x00000000, 0 },
  {  7341,  989,  7, 216273,     56.000, 0x00000000, 0 },
  {  4533,  990,  0, 200849,      5.000, 0x00000000, 0 },
  {  4534,  990,  1, 200849,     10.000, 0x00000000, 0 },
  {  4535,  990,  2, 200849,     15.000, 0x00000000, 0 },
  {  4536,  990,  3, 200849,     20.000, 0x00000000, 0 },
  {  4537,  990,  4, 200849,     25.000, 0x00000000, 0 },
  {  4538,  990,  5, 200849,     30.000, 0x00000000, 0 },
  {  7342,  990,  6, 200849,     35.000, 0x00000000, 0 },
  {  7343,  990,  7, 200849,     40.000, 0x00000000, 0 },
  {  4539,  991,  0, 200853,      3.000, 0x00000000, 0 },
  {  4540,  991,  1, 200853,      6.000, 0x00000000, 0 },
  {  4541,  991,  2, 200853,      9.000, 0x00000000, 0 },
  {  4542,  991,  3, 200853,     12.000, 0x00000000, 0 },
  {  4543,  991,  4, 200853,     15.000, 0x00000000, 0 },
  {  4544,  991,  5, 200853,     18.000, 0x00000000, 0 },
  {  7338,  991,  6, 200853,     21.000, 0x00000000, 0 },
  {  7339,  991,  7, 200853,     24.000, 0x00000000, 0 },
  {  4545,  992,  0, 200856,     50.000, 0x00000000, 0 },
  {  4546,  992,  1, 200856,    100.000, 0x00000000, 0 },
  {  4547,  992,  2, 200856,    150.000, 0x00000000, 0 },
  {  4548,  992,  3, 200856,    200.000, 0x00000000, 0 },
  {  4549,  992,  4, 200856,    250.000, 0x00000000, 0 },
  {  4550,  992,  5, 200856,    300.000, 0x00000000, 0 },
  {  7334,  992,  6, 200856,    350.000, 0x00000000, 0 },
  {  7335,  992,  7, 200856,    400.000, 0x00000000, 0 },
  {  4551,  993,  0, 200857,      2.000, 0x00000000, 0 },
  {  4552,  993,  1, 200857,      4.000, 0x00000000, 0 },
  {  4553,  993,  2, 200857,      6.000, 0x00000000, 0 },
  {  4554,  993,  3, 200857,      8.000, 0x00000000, 0 },
  {  4555,  993,  4, 200857,     10.000, 0x00000000, 0 },
  {  4556,  993,  5, 200857,     12.000, 0x00000000, 0 },
  {  7326,  993,  6, 200857,     14.000, 0x00000000, 0 },
  {  7327,  993,  7, 200857,     16.000, 0x00000000, 0 },
  {  4557,  994,  0, 200859,      1.000, 0x00000000, 0 },
  {  4558,  994,  1, 200859,      2.000, 0x00000000, 0 },
  {  4559,  994,  2, 200859,      3.000, 0x00000000, 0 },
  {  4560,  994,  3, 200859,      4.000, 0x00000000, 0 },
  {  4561,  994,  4, 200859,      5.000, 0x00000000, 0 },
  {  4562,  994,  5, 200859,      6.000, 0x00000000, 0 },
  {  7328,  994,  6, 200859,      7.000, 0x00000000, 0 },
  {  7329,  994,  7, 200859,      8.000, 0x00000000, 0 },
  {  4563,  995,  0, 200860,      5.000, 0x00000000, 0 },
  {  4564,  995,  1, 200860,     10.000, 0x00000000, 0 },
  {  4565,  995,  2, 200860,     15.000, 0x00000000, 0 },
  {  4566,  995,  3, 200860,     20.000, 0x00000000, 0 },
  {  4567,  995,  4, 200860,     25.000, 0x00000000, 0 },
  {  4568,  995,  5, 200860,     30.000, 0x00000000, 0 },
  {  7336,  995,  6, 200860,     35.000, 0x00000000, 0 },
  {  7337,  995,  7, 200860,     40.000, 0x00000000, 0 },
  {  4569,  996,  0, 200861,      1.000, 0x00000000, 0 },
  {  4570,  996,  1, 200861,      2.000, 0x00000000, 0 },
  {  4571,  996,  2, 200861,      3.000, 0x00000000, 0 },
  {  4572,  996,  3, 200861,      4.000, 0x00000000, 0 },
  {  4573,  996,  4, 200861,      5.000, 0x00000000, 0 },
  {  4574,  996,  5, 200861,      6.000, 0x00000000, 0 },
  {  7332,  996,  6, 200861,      7.000, 0x00000000, 0 },
  {  7333,  996,  7, 200861,      8.000, 0x00000000, 0 },
  {  4640,  999,  0, 216698,      0.000, 0x00000000, 0 },
  {  4578, 1000,  0, 201454,     10.000, 0x00000000, 0 },
  {  4579, 1000,  1, 201454,     20.000, 0x00000000, 0 },
  {  4580, 1000,  2, 201454,     30.000, 0x00000000, 0 },
  {  4581, 1000,  3, 201454,     40.000, 0x00000000, 0 },
  {  4582, 1000,  4, 201454,     50.000, 0x00000000, 0 },
  {  4583, 1000,  5, 201454,     60.000, 0x00000000, 0 },
  {  6779, 1000,  6, 201454,     70.000, 0x00000000, 0 },
  {  6780, 1000,  7, 201454,     80.000, 0x00000000, 0 },
  {  4584, 1001,  0, 201455,      6.000, 0x00000000, 0 },
  {  4585, 1001,  1, 201455,     12.000, 0x00000000, 0 },
  {  4586, 1001,  2, 201455,     18.000, 0x00000000, 0 },
  {  4587, 1001,  3, 201455,     24.000, 0x00000000, 0 },
  {  4588, 1001,  4, 201455,     30.000, 0x00000000, 0 },
  {  4589, 1001,  5, 201455,     36.000, 0x00000000, 0 },
  {  6781, 1001,  6, 201455,     42.000, 0x00000000, 0 },
  {  6782, 1001,  7, 201455,     48.000, 0x00000000, 0 },
  {  4590, 1002,  0, 201456,      6.000, 0x00000000, 0 },
  {  4591, 1002,  1, 201456,     12.000, 0x00000000, 0 },
  {  4592, 1002,  2, 201456,     18.000, 0x00000000, 0 },
  {  4593, 1002,  3, 201456,     24.000, 0x00000000, 0 },
  {  4594, 1002,  4, 201456,     30.000, 0x00000000, 0 },
  {  4595, 1002,  5, 201456,     36.000, 0x00000000, 0 },
  {  6783, 1002,  6, 201456,     42.000, 0x00000000, 0 },
  {  6784, 1002,  7, 201456,     48.000, 0x00000000, 0 },
  {  4596, 1003,  0, 201457,      5.000, 0x00000000, 0 },
  {  4597, 1003,  1, 201457,     10.000, 0x00000000, 0 },
  {  4598, 1003,  2, 201457,     15.000, 0x00000000, 0 },
  {  4599, 1003,  3, 201457,     20.000, 0x00000000, 0 },
  {  4600, 1003,  4, 201457,     25.000, 0x00000000, 0 },
  {  4601, 1003,  5, 201457,     30.000, 0x00000000, 0 },
  {  6785, 1003,  6, 201457,     35.000, 0x00000000, 0 },
  {  6786, 1003,  7, 201457,     40.000, 0x00000000, 0 },
  {  4602, 1004,  0, 201458,      6.000, 0x00000000, 0 },
  {  4603, 1004,  1, 201458,     12.000, 0x00000000, 0 },
  {  4604, 1004,  2, 201458,     18.000, 0x00000000, 0 },
  {  4605, 1004,  3, 201458,     24.000, 0x00000000, 0 },
  {  4606, 1004,  4, 201458,     30.000, 0x00000000, 0 },
  {  4607, 1004,  5, 201458,     36.000, 0x00000000, 0 },
  {  6787, 1004,  6, 201458,     42.000, 0x00000000, 0 },
  {  6788, 1004,  7, 201458,     48.000, 0x00000000, 0 },
  {  4608, 1005,  0, 201459,     -4.000, 0x00000000, 0 },
  {  4609, 1005,  1, 201459,     -8.000, 0x00000000, 0 },
  {  4610, 1005,  2, 201459,    -12.000, 0x00000000, 0 },
  {  4611, 1005,  3, 201459,    -16.000, 0x00000000, 0 },
  {  4612, 1005,  4, 201459,    -20.000, 0x00000000, 0 },
  {  4613, 1005,  5, 201459,    -24.000, 0x00000000, 0 },
  {  6789, 1005,  6, 201459,    -28.000, 0x00000000, 0 },
  {  6790, 1005,  7, 201459,    -32.000, 0x00000000, 0 },
  {  4614, 1006,  0, 201460, -20000.000, 0x00000000, 0 },
  {  4615, 1006,  1, 201460, -40000.000, 0x00000000, 0 },
  {  4616, 1006,  2, 201460, -60000.000, 0x00000000, 0 },
  {  4617, 1006,  3, 201460, -75000.000, 0x00000000, 0 },
  {  4618, 1006,  4, 201460, -90000.000, 0x00000000, 0 },
  {  4619, 1006,  5, 201460, -100000.000, 0x00000000, 0 },
  {  6791, 1006,  6, 201460, -110000.000, 0x00000000, 0 },
  {  6792, 1006,  7, 201460, -120000.000, 0x00000000, 0 },
  {  4620, 1007,  0, 201463,      5.000, 0x00000000, 0 },
  {  4621, 1007,  1, 201463,     10.000, 0x00000000, 0 },
  {  4622, 1007,  2, 201463,     15.000, 0x00000000, 0 },
  {  4623, 1007,  3, 201463,     20.000, 0x00000000, 0 },
  {  4624, 1007,  4, 201463,     25.000, 0x00000000, 0 },
  {  4625, 1007,  5, 201463,     30.000, 0x00000000, 0 },
  {  6793, 1007,  6, 201463,     35.000, 0x00000000, 0 },
  {  6794, 1007,  7, 201463,     40.000, 0x00000000, 0 },
  {  4626, 1008,  0, 201464,     10.000, 0x00000000, 0 },
  {  4627, 1008,  1, 201464,     20.000, 0x00000000, 0 },
  {  4628, 1008,  2, 201464,     30.000, 0x00000000, 0 },
  {  4629, 1008,  3, 201464,     40.000, 0x00000000, 0 },
  {  4630, 1008,  4, 201464,     50.000, 0x00000000, 0 },
  {  4631, 1008,  5, 201464,     60.000, 0x00000000, 0 },
  {  6795, 1008,  6, 201464,     70.000, 0x00000000, 0 },
  {  6796, 1008,  7, 201464,     80.000, 0x00000000, 0 },
  {  4633, 1010,  0, 201467,      0.000, 0x00000000, 0 },
  {  4634, 1011,  0, 201468,      0.000, 0x00000000, 0 },
  {  4635, 1012,  0, 201469,      0.000, 0x00000000, 0 },
  {  4636, 1013,  0, 201470,      0.000, 0x00000000, 0 },
  {  4637, 1014,  0, 201471,      0.000, 0x00000000, 0 },
  {  4638, 1015,  0, 201472,      0.000, 0x00000000, 0 },
  {  4639, 1016,  0, 201473,      0.000, 0x00000000, 0 },
  {  4671, 1034,  0, 202302,     25.000, 0x00000000, 0 },
  {  4672, 1034,  1, 202302,     50.000, 0x00000000, 0 },
  {  4673, 1034,  2, 202302,     75.000, 0x00000000, 0 },
  {  4674, 1034,  3, 202302,    100.000, 0x00000000, 0 },
  {  4675, 1034,  4, 202302,    125.000, 0x00000000, 0 },
  {  4676, 1034,  5, 202302,    150.000, 0x00000000, 0 },
  {  6815, 1034,  6, 202302,    175.000, 0x00000000, 0 },
  {  6816, 1034,  7, 202302,    200.000, 0x00000000, 0 },
  {  4786, 1035,  0, 203018,      1.000, 0x00000000, 0 },
  {  4959, 1035,  1, 203018,      2.000, 0x00000000, 0 },
  {  4960, 1035,  2, 203018,      3.000, 0x00000000, 0 },
  {  4961, 1035,  3, 203018,      4.000, 0x00000000, 0 },
  {  4962, 1035,  4, 203018,      5.000, 0x00000000, 0 },
  {  4963, 1035,  5, 203018,      6.000, 0x00000000, 0 },
  {  6817, 1035,  6, 203018,      7.000, 0x00000000, 0 },
  {  6818, 1035,  7, 203018,      8.000, 0x00000000, 0 },
  {  4677, 1036,  0, 202384,      5.000, 0x00000000, 0 },
  {  4678, 1036,  1, 202384,     10.000, 0x00000000, 0 },
  {  4679, 1036,  2, 202384,     15.000, 0x00000000, 0 },
  {  4680, 1036,  3, 202384,     20.000, 0x00000000, 0 },
  {  4681, 1036,  4, 202384,     25.000, 0x00000000, 0 },
  {  4682, 1036,  5, 202384,     30.000, 0x00000000, 0 },
  {  6819, 1036,  6, 202384,     35.000, 0x00000000, 0 },
  {  6820, 1036,  7, 202384,     40.000, 0x00000000, 0 },
  {  4683, 1037,  0, 202386,      7.000, 0x00000000, 0 },
  {  4684, 1037,  1, 202386,     14.000, 0x00000000, 0 },
  {  4685, 1037,  2, 202386,     21.000, 0x00000000, 0 },
  {  4686, 1037,  3, 202386,     28.000, 0x00000000, 0 },
  {  4687, 1037,  4, 202386,     35.000, 0x00000000, 0 },
  {  4688, 1037,  5, 202386,     42.000, 0x00000000, 0 },
  {  6821, 1037,  6, 202386,     49.000, 0x00000000, 0 },
  {  6822, 1037,  7, 202386,     56.000, 0x00000000, 0 },
  {  4689, 1038,  0, 202426,      5.000, 0x00000000, 0 },
  {  4690, 1038,  1, 202426,     10.000, 0x00000000, 0 },
  {  4691, 1038,  2, 202426,     15.000, 0x00000000, 0 },
  {  4692, 1038,  3, 202426,     20.000, 0x00000000, 0 },
  {  4693, 1038,  4, 202426,     25.000, 0x00000000, 0 },
  {  4694, 1038,  5, 202426,     30.000, 0x00000000, 0 },
  {  6823, 1038,  6, 202426,     35.000, 0x00000000, 0 },
  {  6824, 1038,  7, 202426,     40.000, 0x00000000, 0 },
  {  4695, 1039,  0, 202433,      6.000, 0x00000000, 0 },
  {  4696, 1039,  1, 202433,     12.000, 0x00000000, 0 },
  {  4697, 1039,  2, 202433,     18.000, 0x00000000, 0 },
  {  4698, 1039,  3, 202433,     24.000, 0x00000000, 0 },
  {  4699, 1039,  4, 202433,     30.000, 0x00000000, 0 },
  {  4700, 1039,  5, 202433,     36.000, 0x00000000, 0 },
  {  6825, 1039,  6, 202433,     42.000, 0x00000000, 0 },
  {  6826, 1039,  7, 202433,     48.000, 0x00000000, 0 },
  {  4701, 1040,  0, 202445,     10.000, 0x00000000, 0 },
  {  4702, 1040,  1, 202445,     20.000, 0x00000000, 0 },
  {  4703, 1040,  2, 202445,     30.000, 0x00000000, 0 },
  {  4704, 1040,  3, 202445,     40.000, 0x00000000, 0 },
  {  4705, 1040,  4, 202445,     50.000, 0x00000000, 0 },
  {  4706, 1040,  5, 202445,     60.000, 0x00000000, 0 },
  {  6827, 1040,  6, 202445,     70.000, 0x00000000, 0 },
  {  6828, 1040,  7, 202445,     80.000, 0x00000000, 0 },
  {  4713, 1041,  0, 202466,      7.000, 0x00000000, 0 },
  {  4714, 1041,  1, 202466,     14.000, 0x00000000, 0 },
  {  4715, 1041,  2, 202466,     21.000, 0x00000000, 0 },
  {  4716, 1041,  3, 202466,     28.000, 0x00000000, 0 },
  {  4717, 1041,  4, 202466,     35.000, 0x00000000, 0 },
  {  4718, 1041,  5, 202466,     42.000, 0x00000000, 0 },
  {  6829, 1041,  6, 202466,     49.000, 0x00000000, 0 },
  {  6830, 1041,  7, 202466,     56.000, 0x00000000, 0 },
  {  4707, 1042,  0, 202464,      3.000, 0x00000000, 0 },
  {  4708, 1042,  1, 202464,      6.000, 0x00000000, 0 },
  {  4709, 1042,  2, 202464,     10.000, 0x00000000, 0 },
  {  4710, 1042,  3, 202464,     13.000, 0x00000000, 0 },
  {  4711, 1042,  4, 202464,     16.000, 0x00000000, 0 },
  {  4712, 1042,  5, 202464,     20.000, 0x00000000, 0 },
  {  6831, 1042,  6, 202464,     24.000, 0x00000000, 0 },
  {  6832, 1042,  7, 202464,     28.000, 0x00000000, 0 },
  {  4784, 1043,  0, 202890,      0.000, 0x00000000, 0 },
  {  4783, 1044,  0, 202918,      0.000, 0x00000000, 0 },
  {  4785, 1045,  0, 213682,      0.000, 0x00000000, 0 },
  {  4788, 1046,  0, 202940,      0.000, 0x00000000, 0 },
  {  4787, 1047,  0, 202996,      0.000, 0x00000000, 0 },
  {  4789, 1048,  0, 214508,      0.000, 0x00000000, 0 },
  {  4719, 1049,  0, 202767,      0.000, 0x00000000, 0 },
  {  4722, 1052,  0, 202665,      0.000, 0x00000000, 0 },
  {  4723, 1053,  0, 202897,      0.000, 0x00000000, 0 },
  {  4724, 1054,  0, 202820,      0.000, 0x00000000, 0 },
  {  4725, 1055,  0, 202769,      0.000, 0x00000000, 0 },
  {  4726, 1056,  0, 202755,      0.000, 0x00000000, 0 },
  {  4727, 1057,  0, 202753,      0.000, 0x00000000, 0 },
  {  4728, 1058,  0, 202628,      0.000, 0x00000000, 0 },
  {  4729, 1059,  0, 216230,      6.000, 0x00000000, 0 },
  {  6458, 1059,  1, 216230,     12.000, 0x00000000, 0 },
  {  6459, 1059,  2, 216230,     18.000, 0x00000000, 0 },
  {  6460, 1059,  3, 216230,     24.000, 0x00000000, 0 },
  {  6461, 1059,  4, 216230,     30.000, 0x00000000, 0 },
  {  6462, 1059,  5, 216230,     36.000, 0x00000000, 0 },
  {  7148, 1059,  6, 216230,     42.000, 0x00000000, 0 },
  {  7149, 1059,  7, 216230,     48.000, 0x00000000, 0 },
  {  4735, 1060,  0, 202507,      3.000, 0x00000000, 0 },
  {  4736, 1060,  1, 202507,      6.000, 0x00000000, 0 },
  {  4737, 1060,  2, 202507,     10.000, 0x00000000, 0 },
  {  4738, 1060,  3, 202507,     13.000, 0x00000000, 0 },
  {  4739, 1060,  4, 202507,     16.000, 0x00000000, 0 },
  {  4740, 1060,  5, 202507,     20.000, 0x00000000, 0 },
  {  7150, 1060,  6, 202507,     23.000, 0x00000000, 0 },
  {  7151, 1060,  7, 202507,     26.000, 0x00000000, 0 },
  {  4741, 1061,  0, 202514,      4.000, 0x00000000, 0 },
  {  4742, 1061,  1, 202514,      8.000, 0x00000000, 0 },
  {  4743, 1061,  2, 202514,     12.000, 0x00000000, 0 },
  {  4744, 1061,  3, 202514,     16.000, 0x00000000, 0 },
  {  4745, 1061,  4, 202514,     20.000, 0x00000000, 0 },
  {  4746, 1061,  5, 202514,     24.000, 0x00000000, 0 },
  {  7152, 1061,  6, 202514,     28.000, 0x00000000, 0 },
  {  7153, 1061,  7, 202514,     32.000, 0x00000000, 0 },
  {  4747, 1062,  0, 202521,     10.000, 0x00000000, 0 },
  {  4748, 1062,  1, 202521,     20.000, 0x00000000, 0 },
  {  4749, 1062,  2, 202521,     30.000, 0x00000000, 0 },
  {  4750, 1062,  3, 202521,     40.000, 0x00000000, 0 },
  {  4751, 1062,  4, 202521,     50.000, 0x00000000, 0 },
  {  4752, 1062,  5, 202521,     60.000, 0x00000000, 0 },
  {  7158, 1062,  6, 202521,     70.000, 0x00000000, 0 },
  {  7159, 1062,  7, 202521,     80.000, 0x00000000, 0 },
  {  4753, 1063,  0, 202522,      6.000, 0x00000000, 0 },
  {  4754, 1063,  1, 202522,     12.000, 0x00000000, 0 },
  {  4755, 1063,  2, 202522,     18.000, 0x00000000, 0 },
  {  4756, 1063,  3, 202522,     24.000, 0x00000000, 0 },
  {  4757, 1063,  4, 202522,     30.000, 0x00000000, 0 },
  {  4758, 1063,  5, 202522,     36.000, 0x00000000, 0 },
  {  7162, 1063,  6, 202522,     42.000, 0x00000000, 0 },
  {  7163, 1063,  7, 202522,     48.000, 0x00000000, 0 },
  {  4759, 1064,  0, 202524,     -1.000, 0x00000000, 0 },
  {  4760, 1064,  1, 202524,     -2.000, 0x00000000, 0 },
  {  4761, 1064,  2, 202524,     -3.000, 0x00000000, 0 },
  {  4762, 1064,  3, 202524,     -4.000, 0x00000000, 0 },
  {  4763, 1064,  4, 202524,     -5.000, 0x00000000, 0 },
  {  4764, 1064,  5, 202524,     -6.000, 0x00000000, 0 },
  {  7128, 1064,  6, 202524,     -7.000, 0x00000000, 0 },
  {  7129, 1064,  7, 202524,     -8.000, 0x00000000, 0 },
  {  4765, 1065,  0, 202530,      2.000, 0x00000000, 0 },
  {  4766, 1065,  1, 202530,      4.000, 0x00000000, 0 },
  {  4767, 1065,  2, 202530,      6.000, 0x00000000, 0 },
  {  4768, 1065,  3, 202530,      8.000, 0x00000000, 0 },
  {  4769, 1065,  4, 202530,     10.000, 0x00000000, 0 },
  {  4770, 1065,  5, 202530,     12.000, 0x00000000, 0 },
  {  7154, 1065,  6, 202530,     14.000, 0x00000000, 0 },
  {  7155, 1065,  7, 202530,     16.000, 0x00000000, 0 },
  {  4771, 1066,  0, 202533,      2.000, 0x00000000, 0 },
  {  4772, 1066,  1, 202533,      4.000, 0x00000000, 0 },
  {  4773, 1066,  2, 202533,      6.000, 0x00000000, 0 },
  {  4774, 1066,  3, 202533,      8.000, 0x00000000, 0 },
  {  4775, 1066,  4, 202533,     10.000, 0x00000000, 0 },
  {  4776, 1066,  5, 202533,     12.000, 0x00000000, 0 },
  {  7160, 1066,  6, 202533,     14.000, 0x00000000, 0 },
  {  7161, 1066,  7, 202533,     16.000, 0x00000000, 0 },
  {  4777, 1067,  0, 202907, -10000.000, 0x00000000, 0 },
  {  4778, 1067,  1, 202907, -18000.000, 0x00000000, 0 },
  {  4779, 1067,  2, 202907, -25000.000, 0x00000000, 0 },
  {  4780, 1067,  3, 202907, -31000.000, 0x00000000, 0 },
  {  4781, 1067,  4, 202907, -37000.000, 0x00000000, 0 },
  {  4782, 1067,  5, 202907, -42000.000, 0x00000000, 0 },
  {  7156, 1067,  6, 202907, -46000.000, 0x00000000, 0 },
  {  7157, 1067,  7, 202907, -49000.000, 0x00000000, 0 },
  {  4790, 1068,  0, 203415,      0.000, 0x00000000, 0 },
  {  4792, 1070,  0, 203566,      3.000, 0x00000000, 0 },
  {  4840, 1070,  1, 203566,      6.000, 0x00000000, 0 },
  {  4841, 1070,  2, 203566,     10.000, 0x00000000, 0 },
  {  4842, 1070,  3, 203566,     13.000, 0x00000000, 0 },
  {  4843, 1070,  4, 203566,     16.000, 0x00000000, 0 },
  {  4844, 1070,  5, 203566,     20.000, 0x00000000, 0 },
  {  6934, 1070,  6, 203566,     23.000, 0x00000000, 0 },
  {  6935, 1070,  7, 203566,     26.000, 0x00000000, 0 },
  {  4793, 1071,  0, 203577,      3.000, 0x00000000, 0 },
  {  4845, 1071,  1, 203577,      6.000, 0x00000000, 0 },
  {  4846, 1071,  2, 203577,     10.000, 0x00000000, 0 },
  {  4847, 1071,  3, 203577,     13.000, 0x00000000, 0 },
  {  4848, 1071,  4, 203577,     16.000, 0x00000000, 0 },
  {  4849, 1071,  5, 203577,     20.000, 0x00000000, 0 },
  {  6936, 1071,  6, 203577,     23.000, 0x00000000, 0 },
  {  6937, 1071,  7, 203577,     26.000, 0x00000000, 0 },
  {  4794, 1072,  0, 203578,      3.000, 0x00000000, 0 },
  {  4850, 1072,  1, 203578,      6.000, 0x00000000, 0 },
  {  4851, 1072,  2, 203578,     10.000, 0x00000000, 0 },
  {  4852, 1072,  3, 203578,     13.000, 0x00000000, 0 },
  {  4853, 1072,  4, 203578,     16.000, 0x00000000, 0 },
  {  4854, 1072,  5, 203578,     20.000, 0x00000000, 0 },
  {  6938, 1072,  6, 203578,     23.000, 0x00000000, 0 },
  {  6939, 1072,  7, 203578,     26.000, 0x00000000, 0 },
  {  4800, 1073,  0, 203638,      5.000, 0x00000000, 0 },
  {  4855, 1073,  1, 203638,     10.000, 0x00000000, 0 },
  {  4856, 1073,  2, 203638,     15.000, 0x00000000, 0 },
  {  4857, 1073,  3, 203638,     20.000, 0x00000000, 0 },
  {  4858, 1073,  4, 203638,     25.000, 0x00000000, 0 },
  {  4859, 1073,  5, 203638,     30.000, 0x00000000, 0 },
  {  6940, 1073,  6, 203638,     35.000, 0x00000000, 0 },
  {  6941, 1073,  7, 203638,     40.000, 0x00000000, 0 },
  {  4811, 1074,  0, 203669,      5.000, 0x00000000, 0 },
  {  4964, 1074,  1, 203669,     10.000, 0x00000000, 0 },
  {  4965, 1074,  2, 203669,     15.000, 0x00000000, 0 },
  {  4966, 1074,  3, 203669,     20.000, 0x00000000, 0 },
  {  4967, 1074,  4, 203669,     25.000, 0x00000000, 0 },
  {  4968, 1074,  5, 203669,     30.000, 0x00000000, 0 },
  {  6942, 1074,  6, 203669,     35.000, 0x00000000, 0 },
  {  6943, 1074,  7, 203669,     40.000, 0x00000000, 0 },
  {  4812, 1075,  0, 203670,      3.000, 0x00000000, 0 },
  {  4860, 1075,  1, 203670,      6.000, 0x00000000, 0 },
  {  4861, 1075,  2, 203670,     10.000, 0x00000000, 0 },
  {  4862, 1075,  3, 203670,     13.000, 0x00000000, 0 },
  {  4863, 1075,  4, 203670,     16.000, 0x00000000, 0 },
  {  4864, 1075,  5, 203670,     20.000, 0x00000000, 0 },
  {  6944, 1075,  6, 203670,     23.000, 0x00000000, 0 },
  {  6945, 1075,  7, 203670,     26.000, 0x00000000, 0 },
  {  4813, 1076,  0, 203673,      3.000, 0x00000000, 0 },
  {  4838, 1076,  1, 203673,      6.000, 0x00000000, 0 },
  {  4839, 1076,  2, 203673,     10.000, 0x00000000, 0 },
  {  4865, 1076,  3, 203673,     13.000, 0x00000000, 0 },
  {  4866, 1076,  4, 203673,     16.000, 0x00000000, 0 },
  {  4867, 1076,  5, 203673,     20.000, 0x00000000, 0 },
  {  6946, 1076,  6, 203673,     23.000, 0x00000000, 0 },
  {  6947, 1076,  7, 203673,     26.000, 0x00000000, 0 },
  {  4814, 1077,  0, 224764,     10.000, 0x00000000, 0 },
  {  4868, 1077,  1, 224764,     20.000, 0x00000000, 0 },
  {  4869, 1077,  2, 224764,     30.000, 0x00000000, 0 },
  {  4870, 1077,  3, 224764,     40.000, 0x00000000, 0 },
  {  4871, 1077,  4, 224764,     50.000, 0x00000000, 0 },
  {  4872, 1077,  5, 224764,     60.000, 0x00000000, 0 },
  {  6930, 1077,  6, 224764,     70.000, 0x00000000, 0 },
  {  6931, 1077,  7, 224764,     80.000, 0x00000000, 0 },
  {  4815, 1078,  0, 203749,      5.000, 0x00000000, 0 },
  {  4873, 1078,  1, 203749,     10.000, 0x00000000, 0 },
  {  4874, 1078,  2, 203749,     15.000, 0x00000000, 0 },
  {  4875, 1078,  3, 203749,     20.000, 0x00000000, 0 },
  {  4876, 1078,  4, 203749,     25.000, 0x00000000, 0 },
  {  4877, 1078,  5, 203749,     30.000, 0x00000000, 0 },
  {  6932, 1078,  6, 203749,     35.000, 0x00000000, 0 },
  {  6933, 1078,  7, 203749,     40.000, 0x00000000, 0 },
  {  4816, 1079,  0, 225092,      0.000, 0x00000000, 0 },
  {  4817, 1080,  0, 203752,      0.000, 0x00000000, 0 },
  {  4818, 1081,  0, 203754,      0.000, 0x00000000, 0 },
  {  4819, 1082,  0, 203755,      0.000, 0x00000000, 0 },
  {  4820, 1083,  0, 203563,      0.000, 0x00000000, 0 },
  {  4821, 1084,  0, 203757,      0.000, 0x00000000, 0 },
  {  4823, 1090,  0, 204875,      3.000, 0x00000000, 0 },
  {  4824, 1090,  1, 204875,      6.000, 0x00000000, 0 },
  {  4825, 1090,  2, 204875,     10.000, 0x00000000, 0 },
  {  4826, 1090,  3, 204875,     13.000, 0x00000000, 0 },
  {  4827, 1090,  4, 204875,     16.000, 0x00000000, 0 },
  {  4828, 1090,  5, 204875,     20.000, 0x00000000, 0 },
  {  6545, 1090,  6, 204875,     24.000, 0x00000000, 0 },
  {  6546, 1090,  7, 204875,     28.000, 0x00000000, 0 },
  {  4830, 1091,  0, 205209,      0.000, 0x00000000, 0 },
  {  4829, 1092,  0, 189184,      0.000, 0x00000000, 0 },
  {  4832, 1094,  0, 195267,      2.000, 0x00000000, 0 },
  {  4833, 1094,  1, 195267,      4.000, 0x00000000, 0 },
  {  4834, 1094,  2, 195267,      6.000, 0x00000000, 0 },
  {  4835, 1094,  3, 195267,      8.000, 0x00000000, 0 },
  {  4836, 1094,  4, 195267,     10.000, 0x00000000, 0 },
  {  4837, 1094,  5, 195267,     12.000, 0x00000000, 0 },
  {  7036, 1094,  6, 195267,     14.000, 0x00000000, 0 },
  {  7037, 1094,  7, 195267,     16.000, 0x00000000, 0 },
  {  4882, 1095,  0, 206910,      2.000, 0x00000000, 0 },
  {  4883, 1095,  1, 206910,      4.000, 0x00000000, 0 },
  {  4884, 1095,  2, 206910,      6.000, 0x00000000, 0 },
  {  4885, 1095,  3, 206910,      8.000, 0x00000000, 0 },
  {  4886, 1095,  4, 206910,     10.000, 0x00000000, 0 },
  {  4887, 1095,  5, 206910,     12.000, 0x00000000, 0 },
  {  6910, 1095,  6, 206910,     14.000, 0x00000000, 0 },
  {  6911, 1095,  7, 206910,     16.000, 0x00000000, 0 },
  {  4888, 1096,  0, 207407,      0.000, 0x00000000, 0 },
  {  4889, 1097,  0, 212894,      0.000, 0x00000000, 0 },
  {  4890, 1098,  0, 207387,      0.000, 0x00000000, 0 },
  {  4891, 1099,  0, 207343,      1.000, 0x00000000, 0 },
  {  4892, 1099,  1, 207343,      2.000, 0x00000000, 0 },
  {  4893, 1099,  2, 207343,      3.000, 0x00000000, 0 },
  {  4894, 1099,  3, 207343,      4.000, 0x00000000, 0 },
  {  4895, 1099,  4, 207343,      5.000, 0x00000000, 0 },
  {  4896, 1099,  5, 207343,      6.000, 0x00000000, 0 },
  {  6797, 1099,  6, 207343,      7.000, 0x00000000, 0 },
  {  6798, 1099,  7, 207343,      8.000, 0x00000000, 0 },
  {  4897, 1100,  0, 207347,      3.000, 0x00000000, 0 },
  {  4898, 1100,  1, 207347,      6.000, 0x00000000, 0 },
  {  4899, 1100,  2, 207347,      9.000, 0x00000000, 0 },
  {  4900, 1100,  3, 207347,     12.000, 0x00000000, 0 },
  {  4901, 1100,  4, 207347,     15.000, 0x00000000, 0 },
  {  4902, 1100,  5, 207347,     18.000, 0x00000000, 0 },
  {  6799, 1100,  6, 207347,     21.000, 0x00000000, 0 },
  {  6800, 1100,  7, 207347,     24.000, 0x00000000, 0 },
  {  4903, 1101,  0, 207352,      3.000, 0x00000000, 0 },
  {  4904, 1101,  1, 207352,      6.000, 0x00000000, 0 },
  {  4905, 1101,  2, 207352,      9.000, 0x00000000, 0 },
  {  4906, 1101,  3, 207352,     12.000, 0x00000000, 0 },
  {  4907, 1101,  4, 207352,     15.000, 0x00000000, 0 },
  {  4908, 1101,  5, 207352,     18.000, 0x00000000, 0 },
  {  6801, 1101,  6, 207352,     21.000, 0x00000000, 0 },
  {  6802, 1101,  7, 207352,     24.000, 0x00000000, 0 },
  {  4909, 1102,  0, 207778,      0.000, 0x00000000, 0 },
  {  4910, 1103,  0, 207088,     10.000, 0x00000000, 0 },
  {  4925, 1103,  1, 207088,     20.000, 0x00000000, 0 },
  {  4926, 1103,  2, 207088,     30.000, 0x00000000, 0 },
  {  5104, 1103,  3, 207088,     40.000, 0x00000000, 0 },
  {  5105, 1103,  4, 207088,     50.000, 0x00000000, 0 },
  {  5106, 1103,  5, 207088,     60.000, 0x00000000, 0 },
  {  7218, 1103,  6, 207088,     70.000, 0x00000000, 0 },
  {  7219, 1103,  7, 207088,     80.000, 0x00000000, 0 },
  {  4911, 1104,  0, 207092,      5.000, 0x00000000, 0 },
  {  4927, 1104,  1, 207092,     10.000, 0x00000000, 0 },
  {  4928, 1104,  2, 207092,     15.000, 0x00000000, 0 },
  {  5107, 1104,  3, 207092,     20.000, 0x00000000, 0 },
  {  5108, 1104,  4, 207092,     25.000, 0x00000000, 0 },
  {  5109, 1104,  5, 207092,     30.000, 0x00000000, 0 },
  {  7220, 1104,  6, 207092,     35.000, 0x00000000, 0 },
  {  7221, 1104,  7, 207092,     40.000, 0x00000000, 0 },
  {  4912, 1105,  0, 207118,      5.000, 0x00000000, 0 },
  {  5110, 1105,  1, 210029,     10.000, 0x00000000, 0 },
  {  5111, 1105,  2, 210030,     15.000, 0x00000000, 0 },
  {  5112, 1105,  3, 210031,     20.000, 0x00000000, 0 },
  {  5113, 1105,  4, 210032,     25.000, 0x00000000, 0 },
  {  5114, 1105,  5, 210033,     30.000, 0x00000000, 0 },
  {  7222, 1105,  6, 210033,     35.000, 0x00000000, 0 },
  {  7223, 1105,  7, 210033,     40.000, 0x00000000, 0 },
  {  4913, 1106,  0, 207206,     -9.090, 0x00000000, 0 },
  {  4931, 1106,  1, 207206,    -16.667, 0x00000000, 0 },
  {  4932, 1106,  2, 207206,    -23.070, 0x00000000, 0 },
  {  5115, 1106,  3, 207206,    -28.571, 0x00000000, 0 },
  {  5116, 1106,  4, 207206,    -33.333, 0x00000000, 0 },
  {  5117, 1106,  5, 207206,    -37.500, 0x00000000, 0 },
  {  7224, 1106,  6, 207206,    -41.200, 0x00000000, 0 },
  {  7225, 1106,  7, 207206,    -44.500, 0x00000000, 0 },
  {  4914, 1107,  0, 207255,      2.000, 0x00000000, 0 },
  {  4933, 1107,  1, 207255,      4.000, 0x00000000, 0 },
  {  4934, 1107,  2, 207255,      6.000, 0x00000000, 0 },
  {  5118, 1107,  3, 207255,      8.000, 0x00000000, 0 },
  {  5119, 1107,  4, 207255,     10.000, 0x00000000, 0 },
  {  5120, 1107,  5, 207255,     12.000, 0x00000000, 0 },
  {  7226, 1107,  6, 207255,     14.000, 0x00000000, 0 },
  {  7227, 1107,  7, 207255,     16.000, 0x00000000, 0 },
  {  4915, 1108,  0, 207285,     -5.000, 0x00000000, 0 },
  {  4935, 1108,  1, 207285,    -10.000, 0x00000000, 0 },
  {  4936, 1108,  2, 207285,    -15.000, 0x00000000, 0 },
  {  5121, 1108,  3, 207285,    -20.000, 0x00000000, 0 },
  {  5122, 1108,  4, 207285,    -25.000, 0x00000000, 0 },
  {  5123, 1108,  5, 207285,    -30.000, 0x00000000, 0 },
  {  7228, 1108,  6, 207285,    -35.000, 0x00000000, 0 },
  {  7229, 1108,  7, 207285,    -40.000, 0x00000000, 0 },
  {  4916, 1109,  0, 207348,      3.000, 0x00000000, 0 },
  {  4937, 1109,  1, 207348,      6.000, 0x00000000, 0 },
  {  4938, 1109,  2, 207348,     10.000, 0x00000000, 0 },
  {  5124, 1109,  3, 207348,     13.000, 0x00000000, 0 },
  {  5125, 1109,  4, 207348,     16.000, 0x00000000, 0 },
  {  5126, 1109,  5, 207348,     20.000, 0x00000000, 0 },
  {  7230, 1109,  6, 207348,     23.000, 0x00000000, 0 },
  {  7231, 1109,  7, 207348,     26.000, 0x00000000, 0 },
  {  4917, 1110,  0, 207351,      1.000, 0x00000000, 0 },
  {  4939, 1110,  1, 207351,      2.000, 0x00000000, 0 },
  {  4940, 1110,  2, 207351,      3.000, 0x00000000, 0 },
  {  5127, 1110,  3, 207351,      4.000, 0x00000000, 0 },
  {  5128, 1110,  4, 207351,      5.000, 0x00000000, 0 },
  {  5129, 1110,  5, 207351,      6.000, 0x00000000, 0 },
  {  7232, 1110,  6, 207351,      7.000, 0x00000000, 0 },
  {  7233, 1110,  7, 207351,      8.000, 0x00000000, 0 },
  {  4918, 1111,  0, 207354,     -3.000, 0x00000000, 0 },
  {  4941, 1111,  1, 207354,     -6.000, 0x00000000, 0 },
  {  4942, 1111,  2, 207354,    -10.000, 0x00000000, 0 },
  {  5130, 1111,  3, 207354,    -13.000, 0x00000000, 0 },
  {  5131, 1111,  4, 207354,    -16.000, 0x00000000, 0 },
  {  5132, 1111,  5, 207354,    -20.000, 0x00000000, 0 },
  {  7234, 1111,  6, 207354,    -23.000, 0x00000000, 0 },
  {  7235, 1111,  7, 207354,    -26.000, 0x00000000, 0 },
  {  4922, 1112,  0, 207355,      0.000, 0x00000000, 0 },
  {  4923, 1113,  0, 207356,      0.000, 0x00000000, 0 },
  {  4924, 1114,  0, 207357,      0.000, 0x00000000, 0 },
  {  4919, 1115,  0, 207358,      0.000, 0x00000000, 0 },
  {  4920, 1116,  0, 207360,      0.000, 0x00000000, 0 },
  {  4921, 1117,  0, 207362,      0.000, 0x00000000, 0 },
  {  4943, 1118,  0, 207604,      5.000, 0x00000000, 0 },
  {  4944, 1118,  1, 207604,      5.500, 0x00000000, 0 },
  {  4945, 1118,  2, 207604,      6.000, 0x00000000, 0 },
  {  4946, 1118,  3, 207604,      6.500, 0x00000000, 0 },
  {  4947, 1118,  4, 207604,      7.000, 0x00000000, 0 },
  {  4948, 1118,  5, 207604,      7.500, 0x00000000, 0 },
  {  4949, 1118,  6, 207604,      8.000, 0x00000000, 0 },
  {  4950, 1118,  7, 207604,      8.500, 0x00000000, 0 },
  {  4951, 1118,  8, 207604,      9.000, 0x00000000, 0 },
  {  4952, 1118,  9, 207604,      9.500, 0x00000000, 0 },
  {  5647, 1118, 10, 207604,     10.000, 0x00000000, 0 },
  {  5648, 1118, 11, 207604,     10.500, 0x00000000, 0 },
  {  5649, 1118, 12, 207604,     11.000, 0x00000000, 0 },
  {  5650, 1118, 13, 207604,     11.500, 0x00000000, 0 },
  {  5651, 1118, 14, 207604,     12.000, 0x00000000, 0 },
  {  5652, 1118, 15, 207604,     12.500, 0x00000000, 0 },
  {  5653, 1118, 16, 207604,     13.000, 0x00000000, 0 },
  {  5654, 1118, 17, 207604,     13.500, 0x00000000, 0 },
  {  5655, 1118, 18, 207604,     14.000, 0x00000000, 0 },
  {  5656, 1118, 19, 207604,     14.500, 0x00000000, 0 },
  {  4953, 1119,  0, 208598,   2000.000, 0x00000000, 0 },
  {  4954, 1119,  1, 208598,   4000.000, 0x00000000, 0 },
  {  4955, 1119,  2, 208598,   6000.000, 0x00000000, 0 },
  {  4956, 1119,  3, 208598,   8000.000, 0x00000000, 0 },
  {  4957, 1119,  4, 208598,  10000.000, 0x00000000, 0 },
  {  4958, 1119,  5, 208598,  12000.000, 0x00000000, 0 },
  {  6777, 1119,  6, 208598,  14000.000, 0x00000000, 0 },
  {  6778, 1119,  7, 208598,  16000.000, 0x00000000, 0 },
  {  4977, 1120,  0, 209202,      0.000, 0x00000000, 0 },
  {  4978, 1121,  0, 209229,      5.000, 0x00000000, 0 },
  {  4979, 1121,  1, 209229,     10.000, 0x00000000, 0 },
  {  4980, 1121,  2, 209229,     15.000, 0x00000000, 0 },
  {  4981, 1121,  3, 209229,     20.000, 0x00000000, 0 },
  {  4982, 1121,  4, 209229,     25.000, 0x00000000, 0 },
  {  4983, 1121,  5, 209229,     30.000, 0x00000000, 0 },
  {  7236, 1121,  6, 209229,     35.000, 0x00000000, 0 },
  {  7237, 1121,  7, 209229,     40.000, 0x00000000, 0 },
  {  4984, 1122,  0, 209217,      3.000, 0x00000000, 0 },
  {  4985, 1122,  1, 209217,      6.000, 0x00000000, 0 },
  {  4986, 1122,  2, 209217,      9.000, 0x00000000, 0 },
  {  4987, 1122,  3, 209217,     12.000, 0x00000000, 0 },
  {  4988, 1122,  4, 209217,     15.000, 0x00000000, 0 },
  {  4989, 1122,  5, 209217,     18.000, 0x00000000, 0 },
  {  7238, 1122,  6, 209217,     21.000, 0x00000000, 0 },
  {  7239, 1122,  7, 209217,     24.000, 0x00000000, 0 },
  {  4990, 1123,  0, 209220, -10000.000, 0x00000000, 0 },
  {  5008, 1123,  1, 209220, -20000.000, 0x00000000, 0 },
  {  5009, 1123,  2, 209220, -30000.000, 0x00000000, 0 },
  {  5010, 1123,  3, 209220, -40000.000, 0x00000000, 0 },
  {  5011, 1123,  4, 209220, -50000.000, 0x00000000, 0 },
  {  5012, 1123,  5, 209220, -60000.000, 0x00000000, 0 },
  {  7240, 1123,  6, 209220, -70000.000, 0x00000000, 0 },
  {  7241, 1123,  7, 209220, -80000.000, 0x00000000, 0 },
  {  4996, 1124,  0, 209226,      0.000, 0x00000000, 0 },
  {  5013, 1124,  1, 213570,      0.000, 0x00000000, 0 },
  {  5014, 1124,  2, 213571,      0.000, 0x00000000, 0 },
  {  5015, 1124,  3, 213572,      0.000, 0x00000000, 0 },
  {  5016, 1124,  4, 213573,      0.000, 0x00000000, 0 },
  {  5017, 1124,  5, 213574,      0.000, 0x00000000, 0 },
  {  7242, 1124,  6, 239293,      0.000, 0x00000000, 0 },
  {  7243, 1124,  7, 239294,      0.000, 0x00000000, 0 },
  {  4997, 1125,  0, 209223,      6.000, 0x00000000, 0 },
  {  5018, 1125,  1, 209223,     12.000, 0x00000000, 0 },
  {  5019, 1125,  2, 209223,     18.000, 0x00000000, 0 },
  {  5020, 1125,  3, 209223,     24.000, 0x00000000, 0 },
  {  5021, 1125,  4, 209223,     30.000, 0x00000000, 0 },
  {  5022, 1125,  5, 209223,     36.000, 0x00000000, 0 },
  {  7244, 1125,  6, 209223,     42.000, 0x00000000, 0 },
  {  7245, 1125,  7, 209223,     48.000, 0x00000000, 0 },
  {  4998, 1126,  0, 209218,   1000.000, 0x00000000, 0 },
  {  5023, 1126,  1, 209218,   2000.000, 0x00000000, 0 },
  {  5024, 1126,  2, 209218,   3000.000, 0x00000000, 0 },
  {  5025, 1126,  3, 209218,   4000.000, 0x00000000, 0 },
  {  5026, 1126,  4, 209218,   5000.000, 0x00000000, 0 },
  {  5027, 1126,  5, 209218,   6000.000, 0x00000000, 0 },
  {  7246, 1126,  6, 209218,   7000.000, 0x00000000, 0 },
  {  7247, 1126,  7, 209218,   8000.000, 0x00000000, 0 },
  {  4999, 1127,  0, 209216,      2.000, 0x00000000, 0 },
  {  5028, 1127,  1, 209216,      4.000, 0x00000000, 0 },
  {  5029, 1127,  2, 209216,      6.000, 0x00000000, 0 },
  {  5030, 1127,  3, 209216,      8.000, 0x00000000, 0 },
  {  5031, 1127,  4, 209216,     10.000, 0x00000000, 0 },
  {  5032, 1127,  5, 209216,     12.000, 0x00000000, 0 },
  {  7248, 1127,  6, 209216,     14.000, 0x00000000, 0 },
  {  7249, 1127,  7, 209216,     16.000, 0x00000000, 0 },
  {  5000, 1128,  0, 209224,      1.000, 0x00000000, 0 },
  {  5033, 1128,  1, 209224,      2.000, 0x00000000, 0 },
  {  5034, 1128,  2, 209224,      3.000, 0x00000000, 0 },
  {  5035, 1128,  3, 209224,      4.000, 0x00000000, 0 },
  {  5036, 1128,  4, 209224,      5.000, 0x00000000, 0 },
  {  5037, 1128,  5, 209224,      6.000, 0x00000000, 0 },
  {  7250, 1128,  6, 209224,      7.000, 0x00000000, 0 },
  {  7251, 1128,  7, 209224,      8.000, 0x00000000, 0 },
  {  5310, 1129,  0, 209225,      0.000, 0x00000000, 0 },
  {  5311, 1129,  1, 211912,      0.000, 0x00000000, 0 },
  {  5312, 1129,  2, 211913,      0.000, 0x00000000, 0 },
  {  5313, 1129,  3, 211914,      0.000, 0x00000000, 0 },
  {  5314, 1129,  4, 211915,      0.000, 0x00000000, 0 },
  {  5315, 1129,  5, 211916,      0.000, 0x00000000, 0 },
  {  7252, 1129,  6, 239295,      0.000, 0x00000000, 0 },
  {  7253, 1129,  7, 239296,      0.000, 0x00000000, 0 },
  {  5002, 1130,  0, 209341,      0.000, 0x00000000, 0 },
  {  5003, 1131,  0, 209285,      0.000, 0x00000000, 0 },
  {  5004, 1132,  0, 209376,      0.000, 0x00000000, 0 },
  {  5005, 1133,  0, 209389,      0.000, 0x00000000, 0 },
  {  5006, 1134,  0, 209539,      0.000, 0x00000000, 0 },
  {  5007, 1135,  0, 209474,      0.000, 0x00000000, 0 },
  {  5043, 1136,  0, 209577,      0.000, 0x00000000, 0 },
  {  5044, 1137,  0, 248580,      0.000, 0x00000000, 0 },
  {  5045, 1138,  0, 209573,      0.000, 0x00000000, 0 },
  {  5046, 1139,  0, 209566,      0.000, 0x00000000, 0 },
  {  5047, 1140,  0, 209559,      0.000, 0x00000000, 0 },
  {  5048, 1141,  0, 209554,      0.000, 0x00000000, 0 },
  {  5049, 1142,  0, 209548,      0.000, 0x00000000, 0 },
  {  5050, 1143,  0, 209459,    100.000, 0x00000000, 0 },
  {  5059, 1143,  1, 209459,    200.000, 0x00000000, 0 },
  {  5060, 1143,  2, 209459,    300.000, 0x00000000, 0 },
  {  5061, 1143,  3, 209459,    400.000, 0x00000000, 0 },
  {  5062, 1143,  4, 209459,    500.000, 0x00000000, 0 },
  {  5063, 1143,  5, 209459,    600.000, 0x00000000, 0 },
  {  7324, 1143,  6, 209459,    700.000, 0x00000000, 0 },
  {  7325, 1143,  7, 209459,    800.000, 0x00000000, 0 },
  {  5051, 1144,  0, 209462,      2.000, 0x00000000, 0 },
  {  5064, 1144,  1, 209462,      4.000, 0x00000000, 0 },
  {  5065, 1144,  2, 209462,      6.000, 0x00000000, 0 },
  {  5066, 1144,  3, 209462,      8.000, 0x00000000, 0 },
  {  5067, 1144,  4, 209462,     10.000, 0x00000000, 0 },
  {  5068, 1144,  5, 209462,     12.000, 0x00000000, 0 },
  {  7316, 1144,  6, 209462,     14.000, 0x00000000, 0 },
  {  7317, 1144,  7, 209462,     16.000, 0x00000000, 0 },
  {  5052, 1145,  0, 209472,      5.000, 0x00000000, 0 },
  {  5069, 1145,  1, 209472,     10.000, 0x00000000, 0 },
  {  5070, 1145,  2, 209472,     15.000, 0x00000000, 0 },
  {  5071, 1145,  3, 209472,     20.000, 0x00000000, 0 },
  {  5072, 1145,  4, 209472,     25.000, 0x00000000, 0 },
  {  5073, 1145,  5, 209472,     30.000, 0x00000000, 0 },
  {  7308, 1145,  6, 209472,     35.000, 0x00000000, 0 },
  {  7309, 1145,  7, 209472,     40.000, 0x00000000, 0 },
  {  5053, 1146,  0, 216274,      5.000, 0x00000000, 0 },
  {  6468, 1146,  1, 216274,     10.000, 0x00000000, 0 },
  {  6469, 1146,  2, 216274,     15.000, 0x00000000, 0 },
  {  6470, 1146,  3, 216274,     20.000, 0x00000000, 0 },
  {  6471, 1146,  4, 216274,     25.000, 0x00000000, 0 },
  {  6472, 1146,  5, 216274,     30.000, 0x00000000, 0 },
  {  7314, 1146,  6, 216274,     35.000, 0x00000000, 0 },
  {  7315, 1146,  7, 216274,     40.000, 0x00000000, 0 },
  {  5054, 1147,  0, 209481,      5.000, 0x00000000, 0 },
  {  5079, 1147,  1, 209481,     10.000, 0x00000000, 0 },
  {  5080, 1147,  2, 209481,     15.000, 0x00000000, 0 },
  {  5081, 1147,  3, 209481,     20.000, 0x00000000, 0 },
  {  5082, 1147,  4, 209481,     25.000, 0x00000000, 0 },
  {  5083, 1147,  5, 209481,     30.000, 0x00000000, 0 },
  {  7310, 1147,  6, 209481,     35.000, 0x00000000, 0 },
  {  7311, 1147,  7, 209481,     40.000, 0x00000000, 0 },
  {  5055, 1148,  0, 209483,     10.000, 0x00000000, 0 },
  {  5084, 1148,  1, 209483,     20.000, 0x00000000, 0 },
  {  5085, 1148,  2, 209483,     30.000, 0x00000000, 0 },
  {  5086, 1148,  3, 209483,     40.000, 0x00000000, 0 },
  {  5087, 1148,  4, 209483,     50.000, 0x00000000, 0 },
  {  5088, 1148,  5, 209483,     60.000, 0x00000000, 0 },
  {  7320, 1148,  6, 209483,     70.000, 0x00000000, 0 },
  {  7321, 1148,  7, 209483,     80.000, 0x00000000, 0 },
  {  5056, 1149,  0, 248579,      8.000, 0x00000000, 0 },
  {  5089, 1149,  1, 248579,     16.000, 0x00000000, 0 },
  {  5090, 1149,  2, 248579,     24.000, 0x00000000, 0 },
  {  5091, 1149,  3, 248579,     32.000, 0x00000000, 0 },
  {  5092, 1149,  4, 248579,     40.000, 0x00000000, 0 },
  {  5093, 1149,  5, 248579,     48.000, 0x00000000, 0 },
  {  7318, 1149,  6, 248579,     56.000, 0x00000000, 0 },
  {  7319, 1149,  7, 248579,     64.000, 0x00000000, 0 },
  {  5057, 1150,  0, 209494,      4.000, 0x00000000, 0 },
  {  5094, 1150,  1, 209494,      8.000, 0x00000000, 0 },
  {  5095, 1150,  2, 209494,     12.000, 0x00000000, 0 },
  {  5096, 1150,  3, 209494,     16.000, 0x00000000, 0 },
  {  5097, 1150,  4, 209494,     20.000, 0x00000000, 0 },
  {  5098, 1150,  5, 209494,     24.000, 0x00000000, 0 },
  {  7312, 1150,  6, 209494,     28.000, 0x00000000, 0 },
  {  7313, 1150,  7, 209494,     32.000, 0x00000000, 0 },
  {  5058, 1151,  0, 209541,      3.000, 0x00000000, 0 },
  {  5099, 1151,  1, 209541,      6.000, 0x00000000, 0 },
  {  5100, 1151,  2, 209541,      9.000, 0x00000000, 0 },
  {  5101, 1151,  3, 209541,     12.000, 0x00000000, 0 },
  {  5102, 1151,  4, 209541,     15.000, 0x00000000, 0 },
  {  5103, 1151,  5, 209541,     18.000, 0x00000000, 0 },
  {  7322, 1151,  6, 209541,     21.000, 0x00000000, 0 },
  {  7323, 1151,  7, 209541,     24.000, 0x00000000, 0 },
  {  5141, 1153,  0, 210722,      0.000, 0x00000000, 0 },
  {  5147, 1154,  0, 210702,      0.000, 0x00000000, 0 },
  {  5148, 1155,  0, 210676,      0.000, 0x00000000, 0 },
  {  5149, 1156,  0, 210666,      0.000, 0x00000000, 0 },
  {  5150, 1157,  0, 210663,      0.000, 0x00000000, 0 },
  {  5151, 1158,  0, 210650,      0.000, 0x00000000, 0 },
  {  5152, 1159,  0, 210638,      0.000, 0x00000000, 0 },
  {  5153, 1160,  0, 210557,   1000.000, 0x00000000, 0 },
  {  5154, 1160,  1, 210557,   2000.000, 0x00000000, 0 },
  {  5155, 1160,  2, 210557,   3000.000, 0x00000000, 0 },
  {  5156, 1160,  3, 210557,   4000.000, 0x00000000, 0 },
  {  5157, 1160,  4, 210557,   5000.000, 0x00000000, 0 },
  {  5158, 1160,  5, 210557,   6000.000, 0x00000000, 0 },
  {  6833, 1160,  6, 210557,   7000.000, 0x00000000, 0 },
  {  6834, 1160,  7, 210557,   8000.000, 0x00000000, 0 },
  {  5159, 1161,  0, 210570,      4.000, 0x00000000, 0 },
  {  5160, 1161,  1, 210570,      8.000, 0x00000000, 0 },
  {  5161, 1161,  2, 210570,     12.000, 0x00000000, 0 },
  {  5162, 1161,  3, 210570,     16.000, 0x00000000, 0 },
  {  5163, 1161,  4, 210570,     20.000, 0x00000000, 0 },
  {  5164, 1161,  5, 210570,     24.000, 0x00000000, 0 },
  {  7721, 1161,  6, 210570,     28.000, 0x00000000, 0 },
  {  7722, 1161,  7, 210570,     32.000, 0x00000000, 0 },
  {  5165, 1162,  0, 210571,      5.000, 0x00000000, 0 },
  {  5166, 1162,  1, 210571,     10.000, 0x00000000, 0 },
  {  5167, 1162,  2, 210571,     15.000, 0x00000000, 0 },
  {  5168, 1162,  3, 210571,     20.000, 0x00000000, 0 },
  {  5169, 1162,  4, 210571,     25.000, 0x00000000, 0 },
  {  5170, 1162,  5, 210571,     30.000, 0x00000000, 0 },
  {  6837, 1162,  6, 210571,     35.000, 0x00000000, 0 },
  {  6838, 1162,  7, 210571,     40.000, 0x00000000, 0 },
  {  5171, 1163,  0, 210575,      7.000, 0x00000000, 0 },
  {  5172, 1163,  1, 210575,     14.000, 0x00000000, 0 },
  {  5173, 1163,  2, 210575,     21.000, 0x00000000, 0 },
  {  5174, 1163,  3, 210575,     28.000, 0x00000000, 0 },
  {  5175, 1163,  4, 210575,     35.000, 0x00000000, 0 },
  {  5176, 1163,  5, 210575,     42.000, 0x00000000, 0 },
  {  6839, 1163,  6, 210575,     49.000, 0x00000000, 0 },
  {  6840, 1163,  7, 210575,     56.000, 0x00000000, 0 },
  {  5177, 1164,  0, 210579,      5.000, 0x00000000, 0 },
  {  5178, 1164,  1, 210579,     10.000, 0x00000000, 0 },
  {  5179, 1164,  2, 210579,     15.000, 0x00000000, 0 },
  {  5180, 1164,  3, 210579,     20.000, 0x00000000, 0 },
  {  5181, 1164,  4, 210579,     25.000, 0x00000000, 0 },
  {  5182, 1164,  5, 210579,     30.000, 0x00000000, 0 },
  {  6841, 1164,  6, 210579,     35.000, 0x00000000, 0 },
  {  6842, 1164,  7, 210579,     40.000, 0x00000000, 0 },
  {  5183, 1165,  0, 210590,     15.000, 0x00000000, 0 },
  {  5184, 1165,  1, 210590,     30.000, 0x00000000, 0 },
  {  5185, 1165,  2, 210590,     45.000, 0x00000000, 0 },
  {  5186, 1165,  3, 210590,     60.000, 0x00000000, 0 },
  {  5187, 1165,  4, 210590,     75.000, 0x00000000, 0 },
  {  5188, 1165,  5, 210590,     90.000, 0x00000000, 0 },
  {  6843, 1165,  6, 210590,    105.000, 0x00000000, 0 },
  {  6844, 1165,  7, 210590,    120.000, 0x00000000, 0 },
  {  5189, 1166,  0, 210593,      6.000, 0x00000000, 0 },
  {  5190, 1166,  1, 210593,     12.000, 0x00000000, 0 },
  {  5191, 1166,  2, 210593,     18.000, 0x00000000, 0 },
  {  5192, 1166,  3, 210593,     24.000, 0x00000000, 0 },
  {  5193, 1166,  4, 210593,     30.000, 0x00000000, 0 },
  {  5194, 1166,  5, 210593,     36.000, 0x00000000, 0 },
  {  6845, 1166,  6, 210593,     42.000, 0x00000000, 0 },
  {  6846, 1166,  7, 210593,     48.000, 0x00000000, 0 },
  {  5195, 1167,  0, 210631,      5.000, 0x00000000, 0 },
  {  5196, 1167,  1, 210631,     10.000, 0x00000000, 0 },
  {  5197, 1167,  2, 210631,     15.000, 0x00000000, 0 },
  {  5198, 1167,  3, 210631,     20.000, 0x00000000, 0 },
  {  5199, 1167,  4, 210631,     25.000, 0x00000000, 0 },
  {  5200, 1167,  5, 210631,     30.000, 0x00000000, 0 },
  {  6847, 1167,  6, 210631,     35.000, 0x00000000, 0 },
  {  6848, 1167,  7, 210631,     40.000, 0x00000000, 0 },
  {  5201, 1168,  0, 210637,      7.000, 0x00000000, 0 },
  {  5202, 1168,  1, 210637,     14.000, 0x00000000, 0 },
  {  5203, 1168,  2, 210637,     21.000, 0x00000000, 0 },
  {  5204, 1168,  3, 210637,     28.000, 0x00000000, 0 },
  {  5205, 1168,  4, 210637,     35.000, 0x00000000, 0 },
  {  5206, 1168,  5, 210637,     42.000, 0x00000000, 0 },
  {  6849, 1168,  6, 210637,     49.000, 0x00000000, 0 },
  {  6850, 1168,  7, 210637,     56.000, 0x00000000, 0 },
  {  5207, 1169,  0, 210730,      0.000, 0x00000000, 0 },
  {  5208, 1170,  0, 211714,      0.000, 0x00000000, 0 },
  {  5256, 1171,  0, 211108,      2.000, 0x00000000, 0 },
  {  5257, 1171,  1, 211108,      4.000, 0x00000000, 0 },
  {  5258, 1171,  2, 211108,      6.000, 0x00000000, 0 },
  {  5259, 1171,  3, 211108,      8.000, 0x00000000, 0 },
  {  5260, 1171,  4, 211108,     10.000, 0x00000000, 0 },
  {  5261, 1171,  5, 211108,     12.000, 0x00000000, 0 },
  {  7272, 1171,  6, 211108,     14.000, 0x00000000, 0 },
  {  7273, 1171,  7, 211108,     16.000, 0x00000000, 0 },
  {  5304, 1172,  0, 211126,     10.000, 0x00000000, 0 },
  {  5305, 1172,  1, 211126,     20.000, 0x00000000, 0 },
  {  5306, 1172,  2, 211126,     30.000, 0x00000000, 0 },
  {  5307, 1172,  3, 211126,     40.000, 0x00000000, 0 },
  {  5308, 1172,  4, 211126,     50.000, 0x00000000, 0 },
  {  5309, 1172,  5, 211126,     60.000, 0x00000000, 0 },
  {  7274, 1172,  6, 211126,     70.000, 0x00000000, 0 },
  {  7275, 1172,  7, 211126,     80.000, 0x00000000, 0 },
  {  5298, 1173,  0, 211106,     10.000, 0x00000000, 0 },
  {  5299, 1173,  1, 211106,     20.000, 0x00000000, 0 },
  {  5300, 1173,  2, 211106,     30.000, 0x00000000, 0 },
  {  5301, 1173,  3, 211106,     40.000, 0x00000000, 0 },
  {  5302, 1173,  4, 211106,     50.000, 0x00000000, 0 },
  {  5303, 1173,  5, 211106,     60.000, 0x00000000, 0 },
  {  7276, 1173,  6, 211106,     70.000, 0x00000000, 0 },
  {  7277, 1173,  7, 211106,     80.000, 0x00000000, 0 },
  {  5292, 1174,  0, 211123,      5.000, 0x00000000, 0 },
  {  5293, 1174,  1, 211123,     10.000, 0x00000000, 0 },
  {  5294, 1174,  2, 211123,     15.000, 0x00000000, 0 },
  {  5295, 1174,  3, 211123,     20.000, 0x00000000, 0 },
  {  5296, 1174,  4, 211123,     25.000, 0x00000000, 0 },
  {  5297, 1174,  5, 211123,     30.000, 0x00000000, 0 },
  {  7278, 1174,  6, 211123,     35.000, 0x00000000, 0 },
  {  7279, 1174,  7, 211123,     40.000, 0x00000000, 0 },
  {  5286, 1175,  0, 211105,      5.000, 0x00000000, 0 },
  {  5287, 1175,  1, 211105,     10.000, 0x00000000, 0 },
  {  5288, 1175,  2, 211105,     15.000, 0x00000000, 0 },
  {  5289, 1175,  3, 211105,     20.000, 0x00000000, 0 },
  {  5290, 1175,  4, 211105,     25.000, 0x00000000, 0 },
  {  5291, 1175,  5, 211105,     30.000, 0x00000000, 0 },
  {  7280, 1175,  6, 211105,     35.000, 0x00000000, 0 },
  {  7281, 1175,  7, 211105,     40.000, 0x00000000, 0 },
  {  5280, 1176,  0, 211119,      8.000, 0x00000000, 0 },
  {  5281, 1176,  1, 211119,     16.000, 0x00000000, 0 },
  {  5282, 1176,  2, 211119,     24.000, 0x00000000, 0 },
  {  5283, 1176,  3, 211119,     32.000, 0x00000000, 0 },
  {  5284, 1176,  4, 211119,     40.000, 0x00000000, 0 },
  {  5285, 1176,  5, 211119,     48.000, 0x00000000, 0 },
  {  7282, 1176,  6, 211119,     56.000, 0x00000000, 0 },
  {  7283, 1176,  7, 211119,     64.000, 0x00000000, 0 },
  {  5274, 1177,  0, 211099,      5.000, 0x00000000, 0 },
  {  5275, 1177,  1, 211099,     10.000, 0x00000000, 0 },
  {  5276, 1177,  2, 211099,     15.000, 0x00000000, 0 },
  {  5277, 1177,  3, 211099,     20.000, 0x00000000, 0 },
  {  5278, 1177,  4, 211099,     25.000, 0x00000000, 0 },
  {  5279, 1177,  5, 211099,     30.000, 0x00000000, 0 },
  {  7284, 1177,  6, 211099,     35.000, 0x00000000, 0 },
  {  7285, 1177,  7, 211099,     40.000, 0x00000000, 0 },
  {  5262, 1178,  0, 211144,     10.000, 0x00000000, 0 },
  {  5263, 1178,  1, 211144,     20.000, 0x00000000, 0 },
  {  5264, 1178,  2, 211144,     30.000, 0x00000000, 0 },
  {  5265, 1178,  3, 211144,     40.000, 0x00000000, 0 },
  {  5266, 1178,  4, 211144,     50.000, 0x00000000, 0 },
  {  5267, 1178,  5, 211144,     60.000, 0x00000000, 0 },
  {  7286, 1178,  6, 211144,     70.000, 0x00000000, 0 },
  {  7287, 1178,  7, 211144,     80.000, 0x00000000, 0 },
  {  5268, 1179,  0, 211131, -10000.000, 0x00000000, 0 },
  {  5269, 1179,  1, 211131, -20000.000, 0x00000000, 0 },
  {  5270, 1179,  2, 211131, -30000.000, 0x00000000, 0 },
  {  5271, 1179,  3, 211131, -40000.000, 0x00000000, 0 },
  {  5272, 1179,  4, 211131, -50000.000, 0x00000000, 0 },
  {  5273, 1179,  5, 211131, -60000.000, 0x00000000, 0 },
  {  7288, 1179,  6, 211131, -70000.000, 0x00000000, 0 },
  {  7289, 1179,  7, 211131, -80000.000, 0x00000000, 0 },
  {  5254, 1180,  0, 211158,      0.000, 0x00000000, 0 },
  {  5255, 1181,  0, 218567,      0.000, 0x00000000, 0 },
  {  5322, 1182,  0, 218572,      0.000, 0x00000000, 0 },
  {  5251, 1183,  0, 211219,      0.000, 0x00000000, 0 },
  {  5252, 1184,  0, 211720,      0.000, 0x00000000, 0 },
  {  5253, 1185,  0, 211530,      0.000, 0x00000000, 0 },
  {  5209, 1186,  0, 200482,      5.000, 0x00000000, 0 },
  {  5210, 1186,  1, 200482,     10.000, 0x00000000, 0 },
  {  5211, 1186,  2, 200482,     15.000, 0x00000000, 0 },
  {  5212, 1186,  3, 200482,     20.000, 0x00000000, 0 },
  {  5213, 1186,  4, 200482,     25.000, 0x00000000, 0 },
  {  5214, 1186,  5, 200482,     30.000, 0x00000000, 0 },
  {  7054, 1186,  6, 200482,     35.000, 0x00000000, 0 },
  {  7055, 1186,  7, 200482,     40.000, 0x00000000, 0 },
  {  5215, 1187,  0, 211309,      0.000, 0x00000000, 0 },
  {  5216, 1188,  0, 211309,      0.000, 0x00000000, 0 },
  {  5217, 1189,  0, 211309,      0.000, 0x00000000, 0 },
  {  5218, 1190,  0, 211309,      0.000, 0x00000000, 0 },
  {  5219, 1191,  0, 211309,      0.000, 0x00000000, 0 },
  {  5220, 1192,  0, 211309,      0.000, 0x00000000, 0 },
  {  5221, 1193,  0, 211309,      0.000, 0x00000000, 0 },
  {  5222, 1194,  0, 211309,      0.000, 0x00000000, 0 },
  {  5223, 1195,  0, 211309,      0.000, 0x00000000, 0 },
  {  5224, 1196,  0, 211309,      0.000, 0x00000000, 0 },
  {  5225, 1197,  0, 211309,      0.000, 0x00000000, 0 },
  {  5226, 1198,  0, 211309,      0.000, 0x00000000, 0 },
  {  5227, 1199,  0, 211309,      0.000, 0x00000000, 0 },
  {  5228, 1200,  0, 211309,      0.000, 0x00000000, 0 },
  {  5229, 1201,  0, 211309,      0.000, 0x00000000, 0 },
  {  5230, 1202,  0, 211309,      0.000, 0x00000000, 0 },
  {  5231, 1203,  0, 211309,      0.000, 0x00000000, 0 },
  {  5232, 1204,  0, 211309,      0.000, 0x00000000, 0 },
  {  5233, 1205,  0, 211309,      0.000, 0x00000000, 0 },
  {  5234, 1206,  0, 211309,      0.000, 0x00000000, 0 },
  {  5235, 1207,  0, 211309,      0.000, 0x00000000, 0 },
  {  5236, 1208,  0, 211309,      0.000, 0x00000000, 0 },
  {  5237, 1209,  0, 211309,      0.000, 0x00000000, 0 },
  {  5238, 1210,  0, 211309,      0.000, 0x00000000, 0 },
  {  5239, 1211,  0, 211309,      0.000, 0x00000000, 0 },
  {  5240, 1212,  0, 211309,      0.000, 0x00000000, 0 },
  {  5241, 1213,  0, 211309,      0.000, 0x00000000, 0 },
  {  5242, 1214,  0, 211309,      0.000, 0x00000000, 0 },
  {  5243, 1215,  0, 211309,      0.000, 0x00000000, 0 },
  {  5244, 1216,  0, 211309,      0.000, 0x00000000, 0 },
  {  5245, 1217,  0, 211309,      0.000, 0x00000000, 0 },
  {  5246, 1218,  0, 211309,      0.000, 0x00000000, 0 },
  {  5247, 1219,  0, 211309,      0.000, 0x00000000, 0 },
  {  5248, 1220,  0, 211309,      0.000, 0x00000000, 0 },
  {  5249, 1221,  0, 211309,      0.000, 0x00000000, 0 },
  {  5250, 1222,  0, 211309,      0.000, 0x00000000, 0 },
  {  5326, 1228,  0, 212829,      0.000, 0x00000000, 0 },
  {  5327, 1229,  0, 207375,      5.000, 0x00000000, 0 },
  {  5328, 1229,  1, 207375,     10.000, 0x00000000, 0 },
  {  5329, 1229,  2, 207375,     15.000, 0x00000000, 0 },
  {  5330, 1229,  3, 207375,     20.000, 0x00000000, 0 },
  {  5331, 1229,  4, 207375,     25.000, 0x00000000, 0 },
  {  5332, 1229,  5, 207375,     30.000, 0x00000000, 0 },
  {  6803, 1229,  6, 207375,     35.000, 0x00000000, 0 },
  {  6804, 1229,  7, 207375,     40.000, 0x00000000, 0 },
  {  5333, 1230,  0, 212816,      5.000, 0x00000000, 0 },
  {  5334, 1230,  1, 212816,     10.000, 0x00000000, 0 },
  {  5335, 1230,  2, 212816,     15.000, 0x00000000, 0 },
  {  5336, 1230,  3, 212816,     20.000, 0x00000000, 0 },
  {  5337, 1230,  4, 212816,     25.000, 0x00000000, 0 },
  {  5338, 1230,  5, 212816,     30.000, 0x00000000, 0 },
  {  6805, 1230,  6, 212816,     35.000, 0x00000000, 0 },
  {  6806, 1230,  7, 212816,     40.000, 0x00000000, 0 },
  {  5339, 1231,  0, 212817,     10.000, 0x00000000, 0 },
  {  5340, 1231,  1, 212817,     20.000, 0x00000000, 0 },
  {  5341, 1231,  2, 212817,     30.000, 0x00000000, 0 },
  {  5342, 1231,  3, 212817,     40.000, 0x00000000, 0 },
  {  5343, 1231,  4, 212817,     50.000, 0x00000000, 0 },
  {  5344, 1231,  5, 212817,     60.000, 0x00000000, 0 },
  {  6807, 1231,  6, 212817,     70.000, 0x00000000, 0 },
  {  6808, 1231,  7, 212817,     80.000, 0x00000000, 0 },
  {  5345, 1232,  0, 212819,      1.000, 0x00000000, 0 },
  {  5346, 1232,  1, 212819,      2.000, 0x00000000, 0 },
  {  5347, 1232,  2, 212819,      3.000, 0x00000000, 0 },
  {  5348, 1232,  3, 212819,      4.000, 0x00000000, 0 },
  {  5349, 1232,  4, 212819,      5.000, 0x00000000, 0 },
  {  5350, 1232,  5, 212819,      6.000, 0x00000000, 0 },
  {  6809, 1232,  6, 212819,      7.000, 0x00000000, 0 },
  {  6810, 1232,  7, 212819,      8.000, 0x00000000, 0 },
  {  5351, 1233,  0, 212821,      3.000, 0x00000000, 0 },
  {  5352, 1233,  1, 212821,      6.000, 0x00000000, 0 },
  {  5353, 1233,  2, 212821,      9.000, 0x00000000, 0 },
  {  5354, 1233,  3, 212821,     12.000, 0x00000000, 0 },
  {  5355, 1233,  4, 212821,     15.000, 0x00000000, 0 },
  {  5356, 1233,  5, 212821,     18.000, 0x00000000, 0 },
  {  6811, 1233,  6, 212821,     21.000, 0x00000000, 0 },
  {  6812, 1233,  7, 212821,     24.000, 0x00000000, 0 },
  {  5357, 1234,  0, 212827,      5.000, 0x00000000, 0 },
  {  5358, 1234,  1, 212827,     10.000, 0x00000000, 0 },
  {  5359, 1234,  2, 212827,     15.000, 0x00000000, 0 },
  {  5360, 1234,  3, 212827,     20.000, 0x00000000, 0 },
  {  5361, 1234,  4, 212827,     25.000, 0x00000000, 0 },
  {  5362, 1234,  5, 212827,     30.000, 0x00000000, 0 },
  {  6813, 1234,  6, 212827,     35.000, 0x00000000, 0 },
  {  6814, 1234,  7, 212827,     40.000, 0x00000000, 0 },
  {  5363, 1235,  0, 213010,      0.000, 0x00000000, 0 },
  {  5364, 1236,  0, 213017,      0.000, 0x00000000, 0 },
  {  5365, 1237,  0, 193108,      0.000, 0x00000000, 0 },
  {  5366, 1238,  0, 193058,      0.000, 0x00000000, 0 },
  {  5367, 1239,  0, 182234,      0.000, 0x00000000, 0 },
  {  5368, 1240,  0, 185086,      0.000, 0x00000000, 0 },
  {  5369, 1241,  0, 186788,      0.000, 0x00000000, 0 },
  {  5370, 1242,  0, 186945,      0.000, 0x00000000, 0 },
  {  5371, 1242,  1, 186945,   5000.000, 0x00000000, 0 },
  {  5372, 1242,  2, 186945,   7500.000, 0x00000000, 0 },
  {  5373, 1242,  3, 186945,  10000.000, 0x00000000, 0 },
  {  5374, 1242,  4, 186945,  12500.000, 0x00000000, 0 },
  {  5375, 1242,  5, 186945,  15000.000, 0x00000000, 0 },
  {  5376, 1243,  0, 186944,      0.000, 0x00000000, 0 },
  {  5377, 1243,  1, 186944, -20000.000, 0x00000000, 0 },
  {  5378, 1243,  2, 186944, -30000.000, 0x00000000, 0 },
  {  5379, 1243,  3, 186944, -40000.000, 0x00000000, 0 },
  {  5380, 1243,  4, 186944, -50000.000, 0x00000000, 0 },
  {  5381, 1243,  5, 186944, -60000.000, 0x00000000, 0 },
  {  5382, 1244,  0, 185368,      0.000, 0x00000000, 0 },
  {  5383, 1244,  1, 185368,      8.000, 0x00000000, 0 },
  {  5384, 1244,  2, 185368,     12.000, 0x00000000, 0 },
  {  5385, 1244,  3, 185368,     16.000, 0x00000000, 0 },
  {  5386, 1244,  4, 185368,     20.000, 0x00000000, 0 },
  {  5387, 1244,  5, 185368,     24.000, 0x00000000, 0 },
  {  5388, 1245,  0, 186927,      0.000, 0x00000000, 0 },
  {  5389, 1245,  1, 186927,     16.000, 0x00000000, 0 },
  {  5390, 1245,  2, 186927,     24.000, 0x00000000, 0 },
  {  5391, 1245,  3, 186927,     32.000, 0x00000000, 0 },
  {  5392, 1245,  4, 186927,     40.000, 0x00000000, 0 },
  {  5393, 1245,  5, 186927,     48.000, 0x00000000, 0 },
  {  5394, 1246,  0, 186773,      0.000, 0x00000000, 0 },
  {  5395, 1247,  0, 184778,      0.000, 0x00000000, 0 },
  {  5396, 1247,  1, 184778, -10000.000, 0x00000000, 0 },
  {  5397, 1247,  2, 184778, -15000.000, 0x00000000, 0 },
  {  5398, 1247,  3, 184778, -20000.000, 0x00000000, 0 },
  {  5399, 1247,  4, 184778, -25000.000, 0x00000000, 0 },
  {  5400, 1247,  5, 184778, -30000.000, 0x00000000, 0 },
  {  5401, 1248,  0, 186934,      0.000, 0x00000000, 0 },
  {  5402, 1248,  1, 186934,     30.000, 0x00000000, 0 },
  {  5403, 1248,  2, 186934,     45.000, 0x00000000, 0 },
  {  5404, 1248,  3, 186934,     60.000, 0x00000000, 0 },
  {  5405, 1248,  4, 186934,     75.000, 0x00000000, 0 },
  {  5406, 1248,  5, 186934,     90.000, 0x00000000, 0 },
  {  5407, 1249,  0, 184843,      0.000, 0x00000000, 0 },
  {  5408, 1249,  1, 184843,     10.000, 0x00000000, 0 },
  {  5409, 1249,  2, 184843,     15.000, 0x00000000, 0 },
  {  5410, 1249,  3, 184843,     20.000, 0x00000000, 0 },
  {  5411, 1249,  4, 184843,     25.000, 0x00000000, 0 },
  {  5412, 1249,  5, 184843,     30.000, 0x00000000, 0 },
  {  5413, 1250,  0, 184759,      0.000, 0x00000000, 0 },
  {  5414, 1250,  1, 184759,     12.000, 0x00000000, 0 },
  {  5415, 1250,  2, 184759,     18.000, 0x00000000, 0 },
  {  5416, 1250,  3, 184759,     24.000, 0x00000000, 0 },
  {  5417, 1250,  4, 184759,     30.000, 0x00000000, 0 },
  {  5418, 1250,  5, 184759,     36.000, 0x00000000, 0 },
  {  5419, 1251,  0, 186941,      0.000, 0x00000000, 0 },
  {  5420, 1251,  1, 186941,     30.000, 0x00000000, 0 },
  {  5421, 1251,  2, 186941,     45.000, 0x00000000, 0 },
  {  5422, 1251,  3, 186941,     60.000, 0x00000000, 0 },
  {  5423, 1251,  4, 186941,     75.000, 0x00000000, 0 },
  {  5424, 1251,  5, 186941,     90.000, 0x00000000, 0 },
  {  5425, 1252,  0, 205273,      0.000, 0x00000000, 0 },
  {  5426, 1253,  0, 179546,      0.000, 0x00000000, 0 },
  {  5427, 1254,  0, 213428,      0.000, 0x00000000, 0 },
  {  5428, 1255,  0, 213428,      0.000, 0x00000000, 0 },
  {  5429, 1256,  0, 213428,      0.000, 0x00000000, 0 },
  {  5430, 1257,  0, 213428,      0.000, 0x00000000, 0 },
  {  5431, 1258,  0, 213428,      0.000, 0x00000000, 0 },
  {  5499, 1275,  0, 214081,      0.000, 0x00000000, 0 },
  {  5511, 1276,  0, 214368,      0.000, 0x00000000, 0 },
  {  5512, 1277,  0, 214326,      0.000, 0x00000000, 0 },
  {  5513, 1278,  0, 213051,      3.000, 0x00000000, 0 },
  {  5514, 1278,  1, 213051,      6.000, 0x00000000, 0 },
  {  5515, 1278,  2, 213051,      9.000, 0x00000000, 0 },
  {  5516, 1278,  3, 213051,     12.000, 0x00000000, 0 },
  {  5517, 1278,  4, 213051,     15.000, 0x00000000, 0 },
  {  5518, 1278,  5, 213051,     18.000, 0x00000000, 0 },
  {  7362, 1278,  6, 213051,     21.000, 0x00000000, 0 },
  {  7363, 1278,  7, 213051,     24.000, 0x00000000, 0 },
  {  5519, 1279,  0, 213049,      0.000, 0x00000000, 0 },
  {  5520, 1279,  1, 227683,      0.000, 0x00000000, 0 },
  {  5521, 1279,  2, 227684,      0.000, 0x00000000, 0 },
  {  5522, 1279,  3, 227685,      0.000, 0x00000000, 0 },
  {  5523, 1279,  4, 227686,      0.000, 0x00000000, 0 },
  {  5524, 1279,  5, 227687,      0.000, 0x00000000, 0 },
  {  7364, 1279,  6, 239304,      0.000, 0x00000000, 0 },
  {  7365, 1279,  7, 239305,      0.000, 0x00000000, 0 },
  {  5525, 1280,  0, 213180,      5.000, 0x00000000, 0 },
  {  5526, 1280,  1, 213180,     10.000, 0x00000000, 0 },
  {  5527, 1280,  2, 213180,     15.000, 0x00000000, 0 },
  {  5528, 1280,  3, 213180,     20.000, 0x00000000, 0 },
  {  5529, 1280,  4, 213180,     25.000, 0x00000000, 0 },
  {  5530, 1280,  5, 213180,     30.000, 0x00000000, 0 },
  {  7366, 1280,  6, 213180,     35.000, 0x00000000, 0 },
  {  7367, 1280,  7, 213180,     40.000, 0x00000000, 0 },
  {  5531, 1281,  0, 213062,      0.000, 0x00000000, 0 },
  {  5532, 1281,  1, 227688,      0.000, 0x00000000, 0 },
  {  5533, 1281,  2, 227689,      0.000, 0x00000000, 0 },
  {  5534, 1281,  3, 227690,      0.000, 0x00000000, 0 },
  {  5535, 1281,  4, 227691,      0.000, 0x00000000, 0 },
  {  5536, 1281,  5, 227692,      0.000, 0x00000000, 0 },
  {  7368, 1281,  6, 239306,      0.000, 0x00000000, 0 },
  {  7369, 1281,  7, 239307,      0.000, 0x00000000, 0 },
  {  5537, 1282,  0, 213055,      1.000, 0x00000000, 0 },
  {  5538, 1282,  1, 213055,      2.000, 0x00000000, 0 },
  {  5539, 1282,  2, 213055,      3.000, 0x00000000, 0 },
  {  5540, 1282,  3, 213055,      4.000, 0x00000000, 0 },
  {  5541, 1282,  4, 213055,      5.000, 0x00000000, 0 },
  {  5542, 1282,  5, 213055,      6.000, 0x00000000, 0 },
  {  7370, 1282,  6, 213055,      7.000, 0x00000000, 0 },
  {  7371, 1282,  7, 213055,      8.000, 0x00000000, 0 },
  {  5543, 1283,  0, 213133,      1.000, 0x00000000, 0 },
  {  5544, 1283,  1, 213133,      2.000, 0x00000000, 0 },
  {  5545, 1283,  2, 213133,      3.000, 0x00000000, 0 },
  {  5546, 1283,  3, 213133,      4.000, 0x00000000, 0 },
  {  5547, 1283,  4, 213133,      5.000, 0x00000000, 0 },
  {  5548, 1283,  5, 213133,      6.000, 0x00000000, 0 },
  {  7372, 1283,  6, 213133,      7.000, 0x00000000, 0 },
  {  7373, 1283,  7, 213133,      8.000, 0x00000000, 0 },
  {  5549, 1284,  0, 213136,      1.000, 0x00000000, 0 },
  {  5550, 1284,  1, 213136,      2.000, 0x00000000, 0 },
  {  5551, 1284,  2, 213136,      3.000, 0x00000000, 0 },
  {  5552, 1284,  3, 213136,      4.000, 0x00000000, 0 },
  {  5553, 1284,  4, 213136,      5.000, 0x00000000, 0 },
  {  5554, 1284,  5, 213136,      6.000, 0x00000000, 0 },
  {  7374, 1284,  6, 213136,      7.000, 0x00000000, 0 },
  {  7375, 1284,  7, 213136,      8.000, 0x00000000, 0 },
  {  5555, 1285,  0, 213047,    500.000, 0x00000000, 0 },
  {  5556, 1285,  1, 213047,   1000.000, 0x00000000, 0 },
  {  5557, 1285,  2, 213047,   1500.000, 0x00000000, 0 },
  {  5558, 1285,  3, 213047,   2000.000, 0x00000000, 0 },
  {  5559, 1285,  4, 213047,   2500.000, 0x00000000, 0 },
  {  5560, 1285,  5, 213047,   3000.000, 0x00000000, 0 },
  {  7376, 1285,  6, 213047,   3500.000, 0x00000000, 0 },
  {  7377, 1285,  7, 213047,   4000.000, 0x00000000, 0 },
  {  5561, 1286,  0, 213116,     10.000, 0x00000000, 0 },
  {  5562, 1286,  1, 213116,     20.000, 0x00000000, 0 },
  {  5563, 1286,  2, 213116,     30.000, 0x00000000, 0 },
  {  5564, 1286,  3, 213116,     40.000, 0x00000000, 0 },
  {  5565, 1286,  4, 213116,     50.000, 0x00000000, 0 },
  {  5566, 1286,  5, 213116,     60.000, 0x00000000, 0 },
  {  7378, 1286,  6, 213116,     70.000, 0x00000000, 0 },
  {  7379, 1286,  7, 213116,     80.000, 0x00000000, 0 },
  {  5567, 1287,  0, 213161,      0.000, 0x00000000, 0 },
  {  5571, 1288,  0, 216424,      0.000, 0x00000000, 0 },
  {  5572, 1289,  0, 213050,     10.000, 0x00000000, 0 },
  {  5568, 1290,  0, 213183,      0.000, 0x00000000, 0 },
  {  5570, 1291,  0, 214372,      0.000, 0x00000000, 0 },
  {  5569, 1292,  0, 213340,      0.000, 0x00000000, 0 },
  {  5578, 1293,  0, 214428,      0.000, 0x00000000, 0 },
  {  5579, 1294,  0, 214514,      0.000, 0x00000000, 0 },
  {  5580, 1295,  0, 214516,      0.000, 0x00000000, 0 },
  {  5581, 1296,  0, 214629,      0.000, 0x00000000, 0 },
  {  5613, 1327,  0, 214736,      0.000, 0x00000000, 0 },
  {  5614, 1328,  0, 214744,      0.000, 0x00000000, 0 },
  {  5617, 1330,  0, 214795,      0.000, 0x00000000, 0 },
  {  5619, 1331,  0, 221775,      0.000, 0x00000000, 0 },
  {  5620, 1332,  0, 218931,      0.000, 0x00000000, 0 },
  {  5621, 1333,  0, 218280,      0.000, 0x00000000, 0 },
  {  5622, 1334,  0, 215061,      0.000, 0x00000000, 0 },
  {  5623, 1335,  0, 222644,      0.000, 0x00000000, 0 },
  {  5624, 1336,  0, 215779,      0.000, 0x00000000, 0 },
  {  5625, 1337,  0, 214826,      0.000, 0x00000000, 0 },
  {  5626, 1338,  0, 221773,      0.000, 0x00000000, 0 },
  {  5627, 1339,  0, 187318,      0.000, 0x00000000, 0 },
  {  5628, 1340,  0, 221844,      0.000, 0x00000000, 0 },
  {  5629, 1341,  0, 195265,      0.000, 0x00000000, 0 },
  {  5630, 1342,  0, 222648,      0.000, 0x00000000, 0 },
  {  5631, 1343,  0, 221841,      0.000, 0x00000000, 0 },
  {  5633, 1345,  0, 216122,      0.000, 0x00000000, 0 },
  {  5634, 1346,  0, 222646,      0.000, 0x00000000, 0 },
  {  5635, 1347,  0, 215322,      0.000, 0x00000000, 0 },
  {  5636, 1348,  0, 202463,      0.000, 0x00000000, 0 },
  {  5637, 1349,  0, 221856,      0.000, 0x00000000, 0 },
  {  5638, 1350,  0, 215414,      0.000, 0x00000000, 0 },
  {  5639, 1351,  0, 198228,      0.000, 0x00000000, 0 },
  {  5640, 1352,  0, 224841,      0.000, 0x00000000, 0 },
  {  5641, 1353,  0, 221862,      0.000, 0x00000000, 0 },
  {  5642, 1354,  0, 221882,      0.000, 0x00000000, 0 },
  {  5643, 1355,  0, 215183,      0.000, 0x00000000, 0 },
  {  5644, 1356,  0, 209480,      0.000, 0x00000000, 0 },
  {  5645, 1357,  0, 200847,      0.000, 0x00000000, 0 },
  {  5646, 1358,  0, 188647,      0.000, 0x00000000, 0 },
  {  5657, 1359,  0, 214903,     10.000, 0x00000000, 0 },
  {  5658, 1359,  1, 214903,     11.000, 0x00000000, 0 },
  {  5659, 1359,  2, 214903,     12.000, 0x00000000, 0 },
  {  5660, 1359,  3, 214903,     13.000, 0x00000000, 0 },
  {  5661, 1359,  4, 214903,     14.000, 0x00000000, 0 },
  {  5662, 1359,  5, 214903,     15.000, 0x00000000, 0 },
  {  5663, 1359,  6, 214903,     16.000, 0x00000000, 0 },
  {  5664, 1359,  7, 214903,     17.000, 0x00000000, 0 },
  {  5665, 1359,  8, 214903,     18.000, 0x00000000, 0 },
  {  5666, 1359,  9, 214903,     19.000, 0x00000000, 0 },
  {  5667, 1359, 10, 214903,     20.000, 0x00000000, 0 },
  {  5668, 1359, 11, 214903,     21.000, 0x00000000, 0 },
  {  5669, 1359, 12, 214903,     22.000, 0x00000000, 0 },
  {  5670, 1359, 13, 214903,     23.000, 0x00000000, 0 },
  {  5671, 1359, 14, 214903,     24.000, 0x00000000, 0 },
  {  5672, 1359, 15, 214903,     25.000, 0x00000000, 0 },
  {  5673, 1359, 16, 214903,     26.000, 0x00000000, 0 },
  {  5674, 1359, 17, 214903,     27.000, 0x00000000, 0 },
  {  5675, 1359, 18, 214903,     28.000, 0x00000000, 0 },
  {  5676, 1359, 19, 214903,     29.000, 0x00000000, 0 },
  {  5677, 1360,  0, 214904,      5.000, 0x00000000, 0 },
  {  5678, 1360,  1, 214904,      5.500, 0x00000000, 0 },
  {  5679, 1360,  2, 214904,      6.000, 0x00000000, 0 },
  {  5680, 1360,  3, 214904,      6.500, 0x00000000, 0 },
  {  5681, 1360,  4, 214904,      7.000, 0x00000000, 0 },
  {  5682, 1360,  5, 214904,      7.500, 0x00000000, 0 },
  {  5683, 1360,  6, 214904,      8.000, 0x00000000, 0 },
  {  5684, 1360,  7, 214904,      8.500, 0x00000000, 0 },
  {  5685, 1360,  8, 214904,      9.000, 0x00000000, 0 },
  {  5686, 1360,  9, 214904,      9.500, 0x00000000, 0 },
  {  5687, 1360, 10, 214904,     10.000, 0x00000000, 0 },
  {  5688, 1360, 11, 214904,     10.500, 0x00000000, 0 },
  {  5689, 1360, 12, 214904,     11.000, 0x00000000, 0 },
  {  5690, 1360, 13, 214904,     11.500, 0x00000000, 0 },
  {  5691, 1360, 14, 214904,     12.000, 0x00000000, 0 },
  {  5692, 1360, 15, 214904,     12.500, 0x00000000, 0 },
  {  5693, 1360, 16, 214904,     13.000, 0x00000000, 0 },
  {  5694, 1360, 17, 214904,     13.500, 0x00000000, 0 },
  {  5695, 1360, 18, 214904,     14.000, 0x00000000, 0 },
  {  5696, 1360, 19, 214904,     14.500, 0x00000000, 0 },
  {  5697, 1361,  0, 214906,      5.000, 0x00000000, 0 },
  {  5698, 1361,  1, 214906,      5.500, 0x00000000, 0 },
  {  5699, 1361,  2, 214906,      6.000, 0x00000000, 0 },
  {  5700, 1361,  3, 214906,      6.500, 0x00000000, 0 },
  {  5701, 1361,  4, 214906,      7.000, 0x00000000, 0 },
  {  5702, 1361,  5, 214906,      7.500, 0x00000000, 0 },
  {  5703, 1361,  6, 214906,      8.000, 0x00000000, 0 },
  {  5704, 1361,  7, 214906,      8.500, 0x00000000, 0 },
  {  5705, 1361,  8, 214906,      9.000, 0x00000000, 0 },
  {  5706, 1361,  9, 214906,      9.500, 0x00000000, 0 },
  {  5707, 1361, 10, 214906,     10.000, 0x00000000, 0 },
  {  5708, 1361, 11, 214906,     10.500, 0x00000000, 0 },
  {  5709, 1361, 12, 214906,     11.000, 0x00000000, 0 },
  {  5710, 1361, 13, 214906,     11.500, 0x00000000, 0 },
  {  5711, 1361, 14, 214906,     12.000, 0x00000000, 0 },
  {  5712, 1361, 15, 214906,     12.500, 0x00000000, 0 },
  {  5713, 1361, 16, 214906,     13.000, 0x00000000, 0 },
  {  5714, 1361, 17, 214906,     13.500, 0x00000000, 0 },
  {  5715, 1361, 18, 214906,     14.000, 0x00000000, 0 },
  {  5716, 1361, 19, 214906,     14.500, 0x00000000, 0 },
  {  5717, 1362,  0, 214907,      5.000, 0x00000000, 0 },
  {  5718, 1362,  1, 214907,      5.500, 0x00000000, 0 },
  {  5719, 1362,  2, 214907,      6.000, 0x00000000, 0 },
  {  5720, 1362,  3, 214907,      6.500, 0x00000000, 0 },
  {  5721, 1362,  4, 214907,      7.000, 0x00000000, 0 },
  {  5722, 1362,  5, 214907,      7.500, 0x00000000, 0 },
  {  5723, 1362,  6, 214907,      8.000, 0x00000000, 0 },
  {  5724, 1362,  7, 214907,      8.500, 0x00000000, 0 },
  {  5725, 1362,  8, 214907,      9.000, 0x00000000, 0 },
  {  5726, 1362,  9, 214907,      9.500, 0x00000000, 0 },
  {  5727, 1362, 10, 214907,     10.000, 0x00000000, 0 },
  {  5728, 1362, 11, 214907,     10.500, 0x00000000, 0 },
  {  5729, 1362, 12, 214907,     11.000, 0x00000000, 0 },
  {  5730, 1362, 13, 214907,     11.500, 0x00000000, 0 },
  {  5731, 1362, 14, 214907,     12.000, 0x00000000, 0 },
  {  5732, 1362, 15, 214907,     12.500, 0x00000000, 0 },
  {  5733, 1362, 16, 214907,     13.000, 0x00000000, 0 },
  {  5734, 1362, 17, 214907,     13.500, 0x00000000, 0 },
  {  5735, 1362, 18, 214907,     14.000, 0x00000000, 0 },
  {  5736, 1362, 19, 214907,     14.500, 0x00000000, 0 },
  {  5737, 1363,  0, 214909,     10.000, 0x00000000, 0 },
  {  5738, 1363,  1, 214909,     11.000, 0x00000000, 0 },
  {  5739, 1363,  2, 214909,     12.000, 0x00000000, 0 },
  {  5740, 1363,  3, 214909,     13.000, 0x00000000, 0 },
  {  5741, 1363,  4, 214909,     14.000, 0x00000000, 0 },
  {  5742, 1363,  5, 214909,     15.000, 0x00000000, 0 },
  {  5743, 1363,  6, 214909,     16.000, 0x00000000, 0 },
  {  5744, 1363,  7, 214909,     17.000, 0x00000000, 0 },
  {  5745, 1363,  8, 214909,     18.000, 0x00000000, 0 },
  {  5746, 1363,  9, 214909,     19.000, 0x00000000, 0 },
  {  5747, 1363, 10, 214909,     20.000, 0x00000000, 0 },
  {  5748, 1363, 11, 214909,     21.000, 0x00000000, 0 },
  {  5749, 1363, 12, 214909,     22.000, 0x00000000, 0 },
  {  5750, 1363, 13, 214909,     23.000, 0x00000000, 0 },
  {  5751, 1363, 14, 214909,     24.000, 0x00000000, 0 },
  {  5752, 1363, 15, 214909,     25.000, 0x00000000, 0 },
  {  5753, 1363, 16, 214909,     26.000, 0x00000000, 0 },
  {  5754, 1363, 17, 214909,     27.000, 0x00000000, 0 },
  {  5755, 1363, 18, 214909,     28.000, 0x00000000, 0 },
  {  5756, 1363, 19, 214909,     29.000, 0x00000000, 0 },
  {  5757, 1364,  0, 214910,      5.000, 0x00000000, 0 },
  {  5758, 1364,  1, 214910,      5.500, 0x00000000, 0 },
  {  5759, 1364,  2, 214910,      6.000, 0x00000000, 0 },
  {  5760, 1364,  3, 214910,      6.500, 0x00000000, 0 },
  {  5761, 1364,  4, 214910,      7.000, 0x00000000, 0 },
  {  5762, 1364,  5, 214910,      7.500, 0x00000000, 0 },
  {  5763, 1364,  6, 214910,      8.000, 0x00000000, 0 },
  {  5764, 1364,  7, 214910,      8.500, 0x00000000, 0 },
  {  5765, 1364,  8, 214910,      9.000, 0x00000000, 0 },
  {  5766, 1364,  9, 214910,      9.500, 0x00000000, 0 },
  {  5767, 1364, 10, 214910,     10.000, 0x00000000, 0 },
  {  5768, 1364, 11, 214910,     10.500, 0x00000000, 0 },
  {  5769, 1364, 12, 214910,     11.000, 0x00000000, 0 },
  {  5770, 1364, 13, 214910,     11.500, 0x00000000, 0 },
  {  5771, 1364, 14, 214910,     12.000, 0x00000000, 0 },
  {  5772, 1364, 15, 214910,     12.500, 0x00000000, 0 },
  {  5773, 1364, 16, 214910,     13.000, 0x00000000, 0 },
  {  5774, 1364, 17, 214910,     13.500, 0x00000000, 0 },
  {  5775, 1364, 18, 214910,     14.000, 0x00000000, 0 },
  {  5776, 1364, 19, 214910,     14.500, 0x00000000, 0 },
  {  5777, 1365,  0, 214911,      5.000, 0x00000000, 0 },
  {  5778, 1365,  1, 214911,      5.500, 0x00000000, 0 },
  {  5779, 1365,  2, 214911,      6.000, 0x00000000, 0 },
  {  5780, 1365,  3, 214911,      6.500, 0x00000000, 0 },
  {  5781, 1365,  4, 214911,      7.000, 0x00000000, 0 },
  {  5782, 1365,  5, 214911,      7.500, 0x00000000, 0 },
  {  5783, 1365,  6, 214911,      8.000, 0x00000000, 0 },
  {  5784, 1365,  7, 214911,      8.500, 0x00000000, 0 },
  {  5785, 1365,  8, 214911,      9.000, 0x00000000, 0 },
  {  5786, 1365,  9, 214911,      9.500, 0x00000000, 0 },
  {  5787, 1365, 10, 214911,     10.000, 0x00000000, 0 },
  {  5788, 1365, 11, 214911,     10.500, 0x00000000, 0 },
  {  5789, 1365, 12, 214911,     11.000, 0x00000000, 0 },
  {  5790, 1365, 13, 214911,     11.500, 0x00000000, 0 },
  {  5791, 1365, 14, 214911,     12.000, 0x00000000, 0 },
  {  5792, 1365, 15, 214911,     12.500, 0x00000000, 0 },
  {  5793, 1365, 16, 214911,     13.000, 0x00000000, 0 },
  {  5794, 1365, 17, 214911,     13.500, 0x00000000, 0 },
  {  5795, 1365, 18, 214911,     14.000, 0x00000000, 0 },
  {  5796, 1365, 19, 214911,     14.500, 0x00000000, 0 },
  {  5797, 1366,  0, 214912,      6.000, 0x00000000, 0 },
  {  5798, 1366,  1, 214912,      7.000, 0x00000000, 0 },
  {  5799, 1366,  2, 214912,      8.000, 0x00000000, 0 },
  {  5800, 1366,  3, 214912,      9.000, 0x00000000, 0 },
  {  5801, 1366,  4, 214912,     10.000, 0x00000000, 0 },
  {  5802, 1366,  5, 214912,     11.000, 0x00000000, 0 },
  {  5803, 1366,  6, 214912,     12.000, 0x00000000, 0 },
  {  5804, 1366,  7, 214912,     13.000, 0x00000000, 0 },
  {  5805, 1366,  8, 214912,     14.000, 0x00000000, 0 },
  {  5806, 1366,  9, 214912,     15.000, 0x00000000, 0 },
  {  5807, 1366, 10, 214912,     16.000, 0x00000000, 0 },
  {  5808, 1366, 11, 214912,     17.000, 0x00000000, 0 },
  {  5809, 1366, 12, 214912,     18.000, 0x00000000, 0 },
  {  5810, 1366, 13, 214912,     19.000, 0x00000000, 0 },
  {  5811, 1366, 14, 214912,     20.000, 0x00000000, 0 },
  {  5812, 1366, 15, 214912,     21.000, 0x00000000, 0 },
  {  5813, 1366, 16, 214912,     22.000, 0x00000000, 0 },
  {  5814, 1366, 17, 214912,     23.000, 0x00000000, 0 },
  {  5815, 1366, 18, 214912,     24.000, 0x00000000, 0 },
  {  5816, 1366, 19, 214912,     25.000, 0x00000000, 0 },
  {  5817, 1367,  0, 214913,      5.000, 0x00000000, 0 },
  {  5818, 1367,  1, 214913,      5.500, 0x00000000, 0 },
  {  5819, 1367,  2, 214913,      6.000, 0x00000000, 0 },
  {  5820, 1367,  3, 214913,      6.500, 0x00000000, 0 },
  {  5821, 1367,  4, 214913,      7.000, 0x00000000, 0 },
  {  5822, 1367,  5, 214913,      7.500, 0x00000000, 0 },
  {  5823, 1367,  6, 214913,      8.000, 0x00000000, 0 },
  {  5824, 1367,  7, 214913,      8.500, 0x00000000, 0 },
  {  5825, 1367,  8, 214913,      9.000, 0x00000000, 0 },
  {  5826, 1367,  9, 214913,      9.500, 0x00000000, 0 },
  {  5827, 1367, 10, 214913,     10.000, 0x00000000, 0 },
  {  5828, 1367, 11, 214913,     10.500, 0x00000000, 0 },
  {  5829, 1367, 12, 214913,     11.000, 0x00000000, 0 },
  {  5830, 1367, 13, 214913,     11.500, 0x00000000, 0 },
  {  5831, 1367, 14, 214913,     12.000, 0x00000000, 0 },
  {  5832, 1367, 15, 214913,     12.500, 0x00000000, 0 },
  {  5833, 1367, 16, 214913,     13.000, 0x00000000, 0 },
  {  5834, 1367, 17, 214913,     13.500, 0x00000000, 0 },
  {  5835, 1367, 18, 214913,     14.000, 0x00000000, 0 },
  {  5836, 1367, 19, 214913,     14.500, 0x00000000, 0 },
  {  5837, 1368,  0, 214914,      5.000, 0x00000000, 0 },
  {  5838, 1368,  1, 214914,      5.500, 0x00000000, 0 },
  {  5839, 1368,  2, 214914,      6.000, 0x00000000, 0 },
  {  5840, 1368,  3, 214914,      6.500, 0x00000000, 0 },
  {  5841, 1368,  4, 214914,      7.000, 0x00000000, 0 },
  {  5842, 1368,  5, 214914,      7.500, 0x00000000, 0 },
  {  5843, 1368,  6, 214914,      8.000, 0x00000000, 0 },
  {  5844, 1368,  7, 214914,      8.500, 0x00000000, 0 },
  {  5845, 1368,  8, 214914,      9.000, 0x00000000, 0 },
  {  5846, 1368,  9, 214914,      9.500, 0x00000000, 0 },
  {  5847, 1368, 10, 214914,     10.000, 0x00000000, 0 },
  {  5848, 1368, 11, 214914,     10.500, 0x00000000, 0 },
  {  5849, 1368, 12, 214914,     11.000, 0x00000000, 0 },
  {  5850, 1368, 13, 214914,     11.500, 0x00000000, 0 },
  {  5851, 1368, 14, 214914,     12.000, 0x00000000, 0 },
  {  5852, 1368, 15, 214914,     12.500, 0x00000000, 0 },
  {  5853, 1368, 16, 214914,     13.000, 0x00000000, 0 },
  {  5854, 1368, 17, 214914,     13.500, 0x00000000, 0 },
  {  5855, 1368, 18, 214914,     14.000, 0x00000000, 0 },
  {  5856, 1368, 19, 214914,     14.500, 0x00000000, 0 },
  {  5857, 1369,  0, 214915,      5.000, 0x00000000, 0 },
  {  5858, 1369,  1, 214915,      5.500, 0x00000000, 0 },
  {  5859, 1369,  2, 214915,      6.000, 0x00000000, 0 },
  {  5860, 1369,  3, 214915,      6.500, 0x00000000, 0 },
  {  5861, 1369,  4, 214915,      7.000, 0x00000000, 0 },
  {  5862, 1369,  5, 214915,      7.500, 0x00000000, 0 },
  {  5863, 1369,  6, 214915,      8.000, 0x00000000, 0 },
  {  5864, 1369,  7, 214915,      8.500, 0x00000000, 0 },
  {  5865, 1369,  8, 214915,      9.000, 0x00000000, 0 },
  {  5866, 1369,  9, 214915,      9.500, 0x00000000, 0 },
  {  5867, 1369, 10, 214915,     10.000, 0x00000000, 0 },
  {  5868, 1369, 11, 214915,     10.500, 0x00000000, 0 },
  {  5869, 1369, 12, 214915,     11.000, 0x00000000, 0 },
  {  5870, 1369, 13, 214915,     11.500, 0x00000000, 0 },
  {  5871, 1369, 14, 214915,     12.000, 0x00000000, 0 },
  {  5872, 1369, 15, 214915,     12.500, 0x00000000, 0 },
  {  5873, 1369, 16, 214915,     13.000, 0x00000000, 0 },
  {  5874, 1369, 17, 214915,     13.500, 0x00000000, 0 },
  {  5875, 1369, 18, 214915,     14.000, 0x00000000, 0 },
  {  5876, 1369, 19, 214915,     14.500, 0x00000000, 0 },
  {  5877, 1370,  0, 214916,      5.000, 0x00000000, 0 },
  {  5878, 1370,  1, 214916,      5.500, 0x00000000, 0 },
  {  5879, 1370,  2, 214916,      6.000, 0x00000000, 0 },
  {  5880, 1370,  3, 214916,      6.500, 0x00000000, 0 },
  {  5881, 1370,  4, 214916,      7.000, 0x00000000, 0 },
  {  5882, 1370,  5, 214916,      7.500, 0x00000000, 0 },
  {  5883, 1370,  6, 214916,      8.000, 0x00000000, 0 },
  {  5884, 1370,  7, 214916,      8.500, 0x00000000, 0 },
  {  5885, 1370,  8, 214916,      9.000, 0x00000000, 0 },
  {  5886, 1370,  9, 214916,      9.500, 0x00000000, 0 },
  {  5887, 1370, 10, 214916,     10.000, 0x00000000, 0 },
  {  5888, 1370, 11, 214916,     10.500, 0x00000000, 0 },
  {  5889, 1370, 12, 214916,     11.000, 0x00000000, 0 },
  {  5890, 1370, 13, 214916,     11.500, 0x00000000, 0 },
  {  5891, 1370, 14, 214916,     12.000, 0x00000000, 0 },
  {  5892, 1370, 15, 214916,     12.500, 0x00000000, 0 },
  {  5893, 1370, 16, 214916,     13.000, 0x00000000, 0 },
  {  5894, 1370, 17, 214916,     13.500, 0x00000000, 0 },
  {  5895, 1370, 18, 214916,     14.000, 0x00000000, 0 },
  {  5896, 1370, 19, 214916,     14.500, 0x00000000, 0 },
  {  5897, 1371,  0, 214917,      5.000, 0x00000000, 0 },
  {  5898, 1371,  1, 214917,      5.500, 0x00000000, 0 },
  {  5899, 1371,  2, 214917,      6.000, 0x00000000, 0 },
  {  5900, 1371,  3, 214917,      6.500, 0x00000000, 0 },
  {  5901, 1371,  4, 214917,      7.000, 0x00000000, 0 },
  {  5902, 1371,  5, 214917,      7.500, 0x00000000, 0 },
  {  5903, 1371,  6, 214917,      8.000, 0x00000000, 0 },
  {  5904, 1371,  7, 214917,      8.500, 0x00000000, 0 },
  {  5905, 1371,  8, 214917,      9.000, 0x00000000, 0 },
  {  5906, 1371,  9, 214917,      9.500, 0x00000000, 0 },
  {  5907, 1371, 10, 214917,     10.000, 0x00000000, 0 },
  {  5908, 1371, 11, 214917,     10.500, 0x00000000, 0 },
  {  5909, 1371, 12, 214917,     11.000, 0x00000000, 0 },
  {  5910, 1371, 13, 214917,     11.500, 0x00000000, 0 },
  {  5911, 1371, 14, 214917,     12.000, 0x00000000, 0 },
  {  5912, 1371, 15, 214917,     12.500, 0x00000000, 0 },
  {  5913, 1371, 16, 214917,     13.000, 0x00000000, 0 },
  {  5914, 1371, 17, 214917,     13.500, 0x00000000, 0 },
  {  5915, 1371, 18, 214917,     14.000, 0x00000000, 0 },
  {  5916, 1371, 19, 214917,     14.500, 0x00000000, 0 },
  {  5917, 1372,  0, 214918,      5.000, 0x00000000, 0 },
  {  5918, 1372,  1, 214918,      5.500, 0x00000000, 0 },
  {  5919, 1372,  2, 214918,      6.000, 0x00000000, 0 },
  {  5920, 1372,  3, 214918,      6.500, 0x00000000, 0 },
  {  5921, 1372,  4, 214918,      7.000, 0x00000000, 0 },
  {  5922, 1372,  5, 214918,      7.500, 0x00000000, 0 },
  {  5923, 1372,  6, 214918,      8.000, 0x00000000, 0 },
  {  5924, 1372,  7, 214918,      8.500, 0x00000000, 0 },
  {  5925, 1372,  8, 214918,      9.000, 0x00000000, 0 },
  {  5926, 1372,  9, 214918,      9.500, 0x00000000, 0 },
  {  5927, 1372, 10, 214918,     10.000, 0x00000000, 0 },
  {  5928, 1372, 11, 214918,     10.500, 0x00000000, 0 },
  {  5929, 1372, 12, 214918,     11.000, 0x00000000, 0 },
  {  5930, 1372, 13, 214918,     11.500, 0x00000000, 0 },
  {  5931, 1372, 14, 214918,     12.000, 0x00000000, 0 },
  {  5932, 1372, 15, 214918,     12.500, 0x00000000, 0 },
  {  5933, 1372, 16, 214918,     13.000, 0x00000000, 0 },
  {  5934, 1372, 17, 214918,     13.500, 0x00000000, 0 },
  {  5935, 1372, 18, 214918,     14.000, 0x00000000, 0 },
  {  5936, 1372, 19, 214918,     14.500, 0x00000000, 0 },
  {  5937, 1373,  0, 214919,      5.000, 0x00000000, 0 },
  {  5938, 1373,  1, 214919,      5.500, 0x00000000, 0 },
  {  5939, 1373,  2, 214919,      6.000, 0x00000000, 0 },
  {  5940, 1373,  3, 214919,      6.500, 0x00000000, 0 },
  {  5941, 1373,  4, 214919,      7.000, 0x00000000, 0 },
  {  5942, 1373,  5, 214919,      7.500, 0x00000000, 0 },
  {  5943, 1373,  6, 214919,      8.000, 0x00000000, 0 },
  {  5944, 1373,  7, 214919,      8.500, 0x00000000, 0 },
  {  5945, 1373,  8, 214919,      9.000, 0x00000000, 0 },
  {  5946, 1373,  9, 214919,      9.500, 0x00000000, 0 },
  {  5947, 1373, 10, 214919,     10.000, 0x00000000, 0 },
  {  5948, 1373, 11, 214919,     10.500, 0x00000000, 0 },
  {  5949, 1373, 12, 214919,     11.000, 0x00000000, 0 },
  {  5950, 1373, 13, 214919,     11.500, 0x00000000, 0 },
  {  5951, 1373, 14, 214919,     12.000, 0x00000000, 0 },
  {  5952, 1373, 15, 214919,     12.500, 0x00000000, 0 },
  {  5953, 1373, 16, 214919,     13.000, 0x00000000, 0 },
  {  5954, 1373, 17, 214919,     13.500, 0x00000000, 0 },
  {  5955, 1373, 18, 214919,     14.000, 0x00000000, 0 },
  {  5956, 1373, 19, 214919,     14.500, 0x00000000, 0 },
  {  5957, 1374,  0, 214920,     17.000, 0x00000000, 0 },
  {  5958, 1374,  1, 214920,     18.000, 0x00000000, 0 },
  {  5959, 1374,  2, 214920,     19.000, 0x00000000, 0 },
  {  5960, 1374,  3, 214920,     20.000, 0x00000000, 0 },
  {  5961, 1374,  4, 214920,     21.000, 0x00000000, 0 },
  {  5962, 1374,  5, 214920,     22.000, 0x00000000, 0 },
  {  5963, 1374,  6, 214920,     23.000, 0x00000000, 0 },
  {  5964, 1374,  7, 214920,     24.000, 0x00000000, 0 },
  {  5965, 1374,  8, 214920,     25.000, 0x00000000, 0 },
  {  5966, 1374,  9, 214920,     26.000, 0x00000000, 0 },
  {  5967, 1374, 10, 214920,     27.000, 0x00000000, 0 },
  {  5968, 1374, 11, 214920,     28.000, 0x00000000, 0 },
  {  5969, 1374, 12, 214920,     29.000, 0x00000000, 0 },
  {  5970, 1374, 13, 214920,     30.000, 0x00000000, 0 },
  {  5971, 1374, 14, 214920,     31.000, 0x00000000, 0 },
  {  5972, 1374, 15, 214920,     32.000, 0x00000000, 0 },
  {  5973, 1374, 16, 214920,     33.000, 0x00000000, 0 },
  {  5974, 1374, 17, 214920,     34.000, 0x00000000, 0 },
  {  5975, 1374, 18, 214920,     35.000, 0x00000000, 0 },
  {  5976, 1374, 19, 214920,     36.000, 0x00000000, 0 },
  {  5977, 1375,  0, 214921,      5.000, 0x00000000, 0 },
  {  5978, 1375,  1, 214921,      5.500, 0x00000000, 0 },
  {  5979, 1375,  2, 214921,      6.000, 0x00000000, 0 },
  {  5980, 1375,  3, 214921,      6.500, 0x00000000, 0 },
  {  5981, 1375,  4, 214921,      7.000, 0x00000000, 0 },
  {  5982, 1375,  5, 214921,      7.500, 0x00000000, 0 },
  {  5983, 1375,  6, 214921,      8.000, 0x00000000, 0 },
  {  5984, 1375,  7, 214921,      8.500, 0x00000000, 0 },
  {  5985, 1375,  8, 214921,      9.000, 0x00000000, 0 },
  {  5986, 1375,  9, 214921,      9.500, 0x00000000, 0 },
  {  5987, 1375, 10, 214921,     10.000, 0x00000000, 0 },
  {  5988, 1375, 11, 214921,     10.500, 0x00000000, 0 },
  {  5989, 1375, 12, 214921,     11.000, 0x00000000, 0 },
  {  5990, 1375, 13, 214921,     11.500, 0x00000000, 0 },
  {  5991, 1375, 14, 214921,     12.000, 0x00000000, 0 },
  {  5992, 1375, 15, 214921,     12.500, 0x00000000, 0 },
  {  5993, 1375, 16, 214921,     13.000, 0x00000000, 0 },
  {  5994, 1375, 17, 214921,     13.500, 0x00000000, 0 },
  {  5995, 1375, 18, 214921,     14.000, 0x00000000, 0 },
  {  5996, 1375, 19, 214921,     14.500, 0x00000000, 0 },
  {  5997, 1376,  0, 214922,      5.000, 0x00000000, 0 },
  {  5998, 1376,  1, 214922,      5.500, 0x00000000, 0 },
  {  5999, 1376,  2, 214922,      6.000, 0x00000000, 0 },
  {  6000, 1376,  3, 214922,      6.500, 0x00000000, 0 },
  {  6001, 1376,  4, 214922,      7.000, 0x00000000, 0 },
  {  6002, 1376,  5, 214922,      7.500, 0x00000000, 0 },
  {  6003, 1376,  6, 214922,      8.000, 0x00000000, 0 },
  {  6004, 1376,  7, 214922,      8.500, 0x00000000, 0 },
  {  6005, 1376,  8, 214922,      9.000, 0x00000000, 0 },
  {  6006, 1376,  9, 214922,      9.500, 0x00000000, 0 },
  {  6007, 1376, 10, 214922,     10.000, 0x00000000, 0 },
  {  6008, 1376, 11, 214922,     10.500, 0x00000000, 0 },
  {  6009, 1376, 12, 214922,     11.000, 0x00000000, 0 },
  {  6010, 1376, 13, 214922,     11.500, 0x00000000, 0 },
  {  6011, 1376, 14, 214922,     12.000, 0x00000000, 0 },
  {  6012, 1376, 15, 214922,     12.500, 0x00000000, 0 },
  {  6013, 1376, 16, 214922,     13.000, 0x00000000, 0 },
  {  6014, 1376, 17, 214922,     13.500, 0x00000000, 0 },
  {  6015, 1376, 18, 214922,     14.000, 0x00000000, 0 },
  {  6016, 1376, 19, 214922,     14.500, 0x00000000, 0 },
  {  6017, 1377,  0, 214923,      5.000, 0x00000000, 0 },
  {  6018, 1377,  1, 214923,      5.500, 0x00000000, 0 },
  {  6019, 1377,  2, 214923,      6.000, 0x00000000, 0 },
  {  6020, 1377,  3, 214923,      6.500, 0x00000000, 0 },
  {  6021, 1377,  4, 214923,      7.000, 0x00000000, 0 },
  {  6022, 1377,  5, 214923,      7.500, 0x00000000, 0 },
  {  6023, 1377,  6, 214923,      8.000, 0x00000000, 0 },
  {  6024, 1377,  7, 214923,      8.500, 0x00000000, 0 },
  {  6025, 1377,  8, 214923,      9.000, 0x00000000, 0 },
  {  6026, 1377,  9, 214923,      9.500, 0x00000000, 0 },
  {  6027, 1377, 10, 214923,     10.000, 0x00000000, 0 },
  {  6028, 1377, 11, 214923,     10.500, 0x00000000, 0 },
  {  6029, 1377, 12, 214923,     11.000, 0x00000000, 0 },
  {  6030, 1377, 13, 214923,     11.500, 0x00000000, 0 },
  {  6031, 1377, 14, 214923,     12.000, 0x00000000, 0 },
  {  6032, 1377, 15, 214923,     12.500, 0x00000000, 0 },
  {  6033, 1377, 16, 214923,     13.000, 0x00000000, 0 },
  {  6034, 1377, 17, 214923,     13.500, 0x00000000, 0 },
  {  6035, 1377, 18, 214923,     14.000, 0x00000000, 0 },
  {  6036, 1377, 19, 214923,     14.500, 0x00000000, 0 },
  {  6037, 1378,  0, 214924,     10.000, 0x00000000, 0 },
  {  6038, 1378,  1, 214924,     11.000, 0x00000000, 0 },
  {  6039, 1378,  2, 214924,     12.000, 0x00000000, 0 },
  {  6040, 1378,  3, 214924,     13.000, 0x00000000, 0 },
  {  6041, 1378,  4, 214924,     14.000, 0x00000000, 0 },
  {  6042, 1378,  5, 214924,     15.000, 0x00000000, 0 },
  {  6043, 1378,  6, 214924,     16.000, 0x00000000, 0 },
  {  6044, 1378,  7, 214924,     17.000, 0x00000000, 0 },
  {  6045, 1378,  8, 214924,     18.000, 0x00000000, 0 },
  {  6046, 1378,  9, 214924,     19.000, 0x00000000, 0 },
  {  6047, 1378, 10, 214924,     20.000, 0x00000000, 0 },
  {  6048, 1378, 11, 214924,     21.000, 0x00000000, 0 },
  {  6049, 1378, 12, 214924,     22.000, 0x00000000, 0 },
  {  6050, 1378, 13, 214924,     23.000, 0x00000000, 0 },
  {  6051, 1378, 14, 214924,     24.000, 0x00000000, 0 },
  {  6052, 1378, 15, 214924,     25.000, 0x00000000, 0 },
  {  6053, 1378, 16, 214924,     26.000, 0x00000000, 0 },
  {  6054, 1378, 17, 214924,     27.000, 0x00000000, 0 },
  {  6055, 1378, 18, 214924,     28.000, 0x00000000, 0 },
  {  6056, 1378, 19, 214924,     29.000, 0x00000000, 0 },
  {  6057, 1379,  0, 214925,      5.000, 0x00000000, 0 },
  {  6058, 1379,  1, 214925,      5.500, 0x00000000, 0 },
  {  6059, 1379,  2, 214925,      6.000, 0x00000000, 0 },
  {  6060, 1379,  3, 214925,      6.500, 0x00000000, 0 },
  {  6061, 1379,  4, 214925,      7.000, 0x00000000, 0 },
  {  6062, 1379,  5, 214925,      7.500, 0x00000000, 0 },
  {  6063, 1379,  6, 214925,      8.000, 0x00000000, 0 },
  {  6064, 1379,  7, 214925,      8.500, 0x00000000, 0 },
  {  6065, 1379,  8, 214925,      9.000, 0x00000000, 0 },
  {  6066, 1379,  9, 214925,      9.500, 0x00000000, 0 },
  {  6067, 1379, 10, 214925,     10.000, 0x00000000, 0 },
  {  6068, 1379, 11, 214925,     10.500, 0x00000000, 0 },
  {  6069, 1379, 12, 214925,     11.000, 0x00000000, 0 },
  {  6070, 1379, 13, 214925,     11.500, 0x00000000, 0 },
  {  6071, 1379, 14, 214925,     12.000, 0x00000000, 0 },
  {  6072, 1379, 15, 214925,     12.500, 0x00000000, 0 },
  {  6073, 1379, 16, 214925,     13.000, 0x00000000, 0 },
  {  6074, 1379, 17, 214925,     13.500, 0x00000000, 0 },
  {  6075, 1379, 18, 214925,     14.000, 0x00000000, 0 },
  {  6076, 1379, 19, 214925,     14.500, 0x00000000, 0 },
  {  6077, 1380,  0, 214926,      5.000, 0x00000000, 0 },
  {  6078, 1380,  1, 214926,      5.500, 0x00000000, 0 },
  {  6079, 1380,  2, 214926,      6.000, 0x00000000, 0 },
  {  6080, 1380,  3, 214926,      6.500, 0x00000000, 0 },
  {  6081, 1380,  4, 214926,      7.000, 0x00000000, 0 },
  {  6082, 1380,  5, 214926,      7.500, 0x00000000, 0 },
  {  6083, 1380,  6, 214926,      8.000, 0x00000000, 0 },
  {  6084, 1380,  7, 214926,      8.500, 0x00000000, 0 },
  {  6085, 1380,  8, 214926,      9.000, 0x00000000, 0 },
  {  6086, 1380,  9, 214926,      9.500, 0x00000000, 0 },
  {  6087, 1380, 10, 214926,     10.000, 0x00000000, 0 },
  {  6088, 1380, 11, 214926,     10.500, 0x00000000, 0 },
  {  6089, 1380, 12, 214926,     11.000, 0x00000000, 0 },
  {  6090, 1380, 13, 214926,     11.500, 0x00000000, 0 },
  {  6091, 1380, 14, 214926,     12.000, 0x00000000, 0 },
  {  6092, 1380, 15, 214926,     12.500, 0x00000000, 0 },
  {  6093, 1380, 16, 214926,     13.000, 0x00000000, 0 },
  {  6094, 1380, 17, 214926,     13.500, 0x00000000, 0 },
  {  6095, 1380, 18, 214926,     14.000, 0x00000000, 0 },
  {  6096, 1380, 19, 214926,     14.500, 0x00000000, 0 },
  {  6097, 1381,  0, 214927,      5.000, 0x00000000, 0 },
  {  6098, 1381,  1, 214927,      5.500, 0x00000000, 0 },
  {  6099, 1381,  2, 214927,      6.000, 0x00000000, 0 },
  {  6100, 1381,  3, 214927,      6.500, 0x00000000, 0 },
  {  6101, 1381,  4, 214927,      7.000, 0x00000000, 0 },
  {  6102, 1381,  5, 214927,      7.500, 0x00000000, 0 },
  {  6103, 1381,  6, 214927,      8.000, 0x00000000, 0 },
  {  6104, 1381,  7, 214927,      8.500, 0x00000000, 0 },
  {  6105, 1381,  8, 214927,      9.000, 0x00000000, 0 },
  {  6106, 1381,  9, 214927,      9.500, 0x00000000, 0 },
  {  6107, 1381, 10, 214927,     10.000, 0x00000000, 0 },
  {  6108, 1381, 11, 214927,     10.500, 0x00000000, 0 },
  {  6109, 1381, 12, 214927,     11.000, 0x00000000, 0 },
  {  6110, 1381, 13, 214927,     11.500, 0x00000000, 0 },
  {  6111, 1381, 14, 214927,     12.000, 0x00000000, 0 },
  {  6112, 1381, 15, 214927,     12.500, 0x00000000, 0 },
  {  6113, 1381, 16, 214927,     13.000, 0x00000000, 0 },
  {  6114, 1381, 17, 214927,     13.500, 0x00000000, 0 },
  {  6115, 1381, 18, 214927,     14.000, 0x00000000, 0 },
  {  6116, 1381, 19, 214927,     14.500, 0x00000000, 0 },
  {  6157, 1384,  0, 214928,      5.000, 0x00000000, 0 },
  {  6158, 1384,  1, 214928,      5.500, 0x00000000, 0 },
  {  6159, 1384,  2, 214928,      6.000, 0x00000000, 0 },
  {  6160, 1384,  3, 214928,      6.500, 0x00000000, 0 },
  {  6161, 1384,  4, 214928,      7.000, 0x00000000, 0 },
  {  6162, 1384,  5, 214928,      7.500, 0x00000000, 0 },
  {  6163, 1384,  6, 214928,      8.000, 0x00000000, 0 },
  {  6164, 1384,  7, 214928,      8.500, 0x00000000, 0 },
  {  6165, 1384,  8, 214928,      9.000, 0x00000000, 0 },
  {  6166, 1384,  9, 214928,      9.500, 0x00000000, 0 },
  {  6167, 1384, 10, 214928,     10.000, 0x00000000, 0 },
  {  6168, 1384, 11, 214928,     10.500, 0x00000000, 0 },
  {  6169, 1384, 12, 214928,     11.000, 0x00000000, 0 },
  {  6170, 1384, 13, 214928,     11.500, 0x00000000, 0 },
  {  6171, 1384, 14, 214928,     12.000, 0x00000000, 0 },
  {  6172, 1384, 15, 214928,     12.500, 0x00000000, 0 },
  {  6173, 1384, 16, 214928,     13.000, 0x00000000, 0 },
  {  6174, 1384, 17, 214928,     13.500, 0x00000000, 0 },
  {  6175, 1384, 18, 214928,     14.000, 0x00000000, 0 },
  {  6176, 1384, 19, 214928,     14.500, 0x00000000, 0 },
  {  6177, 1385,  0, 214929,      5.000, 0x00000000, 0 },
  {  6178, 1385,  1, 214929,      5.500, 0x00000000, 0 },
  {  6179, 1385,  2, 214929,      6.000, 0x00000000, 0 },
  {  6180, 1385,  3, 214929,      6.500, 0x00000000, 0 },
  {  6181, 1385,  4, 214929,      7.000, 0x00000000, 0 },
  {  6182, 1385,  5, 214929,      7.500, 0x00000000, 0 },
  {  6183, 1385,  6, 214929,      8.000, 0x00000000, 0 },
  {  6184, 1385,  7, 214929,      8.500, 0x00000000, 0 },
  {  6185, 1385,  8, 214929,      9.000, 0x00000000, 0 },
  {  6186, 1385,  9, 214929,      9.500, 0x00000000, 0 },
  {  6187, 1385, 10, 214929,     10.000, 0x00000000, 0 },
  {  6188, 1385, 11, 214929,     10.500, 0x00000000, 0 },
  {  6189, 1385, 12, 214929,     11.000, 0x00000000, 0 },
  {  6190, 1385, 13, 214929,     11.500, 0x00000000, 0 },
  {  6191, 1385, 14, 214929,     12.000, 0x00000000, 0 },
  {  6192, 1385, 15, 214929,     12.500, 0x00000000, 0 },
  {  6193, 1385, 16, 214929,     13.000, 0x00000000, 0 },
  {  6194, 1385, 17, 214929,     13.500, 0x00000000, 0 },
  {  6195, 1385, 18, 214929,     14.000, 0x00000000, 0 },
  {  6196, 1385, 19, 214929,     14.500, 0x00000000, 0 },
  {  6197, 1386,  0, 214930,      5.000, 0x00000000, 0 },
  {  6198, 1386,  1, 214930,      5.500, 0x00000000, 0 },
  {  6199, 1386,  2, 214930,      6.000, 0x00000000, 0 },
  {  6200, 1386,  3, 214930,      6.500, 0x00000000, 0 },
  {  6201, 1386,  4, 214930,      7.000, 0x00000000, 0 },
  {  6202, 1386,  5, 214930,      7.500, 0x00000000, 0 },
  {  6203, 1386,  6, 214930,      8.000, 0x00000000, 0 },
  {  6204, 1386,  7, 214930,      8.500, 0x00000000, 0 },
  {  6205, 1386,  8, 214930,      9.000, 0x00000000, 0 },
  {  6206, 1386,  9, 214930,      9.500, 0x00000000, 0 },
  {  6207, 1386, 10, 214930,     10.000, 0x00000000, 0 },
  {  6208, 1386, 11, 214930,     10.500, 0x00000000, 0 },
  {  6209, 1386, 12, 214930,     11.000, 0x00000000, 0 },
  {  6210, 1386, 13, 214930,     11.500, 0x00000000, 0 },
  {  6211, 1386, 14, 214930,     12.000, 0x00000000, 0 },
  {  6212, 1386, 15, 214930,     12.500, 0x00000000, 0 },
  {  6213, 1386, 16, 214930,     13.000, 0x00000000, 0 },
  {  6214, 1386, 17, 214930,     13.500, 0x00000000, 0 },
  {  6215, 1386, 18, 214930,     14.000, 0x00000000, 0 },
  {  6216, 1386, 19, 214930,     14.500, 0x00000000, 0 },
  {  6217, 1387,  0, 214931,      5.000, 0x00000000, 0 },
  {  6218, 1387,  1, 214931,      5.500, 0x00000000, 0 },
  {  6219, 1387,  2, 214931,      6.000, 0x00000000, 0 },
  {  6220, 1387,  3, 214931,      6.500, 0x00000000, 0 },
  {  6221, 1387,  4, 214931,      7.000, 0x00000000, 0 },
  {  6222, 1387,  5, 214931,      7.500, 0x00000000, 0 },
  {  6223, 1387,  6, 214931,      8.000, 0x00000000, 0 },
  {  6224, 1387,  7, 214931,      8.500, 0x00000000, 0 },
  {  6225, 1387,  8, 214931,      9.000, 0x00000000, 0 },
  {  6226, 1387,  9, 214931,      9.500, 0x00000000, 0 },
  {  6227, 1387, 10, 214931,     10.000, 0x00000000, 0 },
  {  6228, 1387, 11, 214931,     10.500, 0x00000000, 0 },
  {  6229, 1387, 12, 214931,     11.000, 0x00000000, 0 },
  {  6230, 1387, 13, 214931,     11.500, 0x00000000, 0 },
  {  6231, 1387, 14, 214931,     12.000, 0x00000000, 0 },
  {  6232, 1387, 15, 214931,     12.500, 0x00000000, 0 },
  {  6233, 1387, 16, 214931,     13.000, 0x00000000, 0 },
  {  6234, 1387, 17, 214931,     13.500, 0x00000000, 0 },
  {  6235, 1387, 18, 214931,     14.000, 0x00000000, 0 },
  {  6236, 1387, 19, 214931,     14.500, 0x00000000, 0 },
  {  6237, 1388,  0, 214932,      5.000, 0x00000000, 0 },
  {  6238, 1388,  1, 214932,      5.500, 0x00000000, 0 },
  {  6239, 1388,  2, 214932,      6.000, 0x00000000, 0 },
  {  6240, 1388,  3, 214932,      6.500, 0x00000000, 0 },
  {  6241, 1388,  4, 214932,      7.000, 0x00000000, 0 },
  {  6242, 1388,  5, 214932,      7.500, 0x00000000, 0 },
  {  6243, 1388,  6, 214932,      8.000, 0x00000000, 0 },
  {  6244, 1388,  7, 214932,      8.500, 0x00000000, 0 },
  {  6245, 1388,  8, 214932,      9.000, 0x00000000, 0 },
  {  6246, 1388,  9, 214932,      9.500, 0x00000000, 0 },
  {  6247, 1388, 10, 214932,     10.000, 0x00000000, 0 },
  {  6248, 1388, 11, 214932,     10.500, 0x00000000, 0 },
  {  6249, 1388, 12, 214932,     11.000, 0x00000000, 0 },
  {  6250, 1388, 13, 214932,     11.500, 0x00000000, 0 },
  {  6251, 1388, 14, 214932,     12.000, 0x00000000, 0 },
  {  6252, 1388, 15, 214932,     12.500, 0x00000000, 0 },
  {  6253, 1388, 16, 214932,     13.000, 0x00000000, 0 },
  {  6254, 1388, 17, 214932,     13.500, 0x00000000, 0 },
  {  6255, 1388, 18, 214932,     14.000, 0x00000000, 0 },
  {  6256, 1388, 19, 214932,     14.500, 0x00000000, 0 },
  {  6257, 1389,  0, 214933,      5.000, 0x00000000, 0 },
  {  6258, 1389,  1, 214933,      5.500, 0x00000000, 0 },
  {  6259, 1389,  2, 214933,      6.000, 0x00000000, 0 },
  {  6260, 1389,  3, 214933,      6.500, 0x00000000, 0 },
  {  6261, 1389,  4, 214933,      7.000, 0x00000000, 0 },
  {  6262, 1389,  5, 214933,      7.500, 0x00000000, 0 },
  {  6263, 1389,  6, 214933,      8.000, 0x00000000, 0 },
  {  6264, 1389,  7, 214933,      8.500, 0x00000000, 0 },
  {  6265, 1389,  8, 214933,      9.000, 0x00000000, 0 },
  {  6266, 1389,  9, 214933,      9.500, 0x00000000, 0 },
  {  6267, 1389, 10, 214933,     10.000, 0x00000000, 0 },
  {  6268, 1389, 11, 214933,     10.500, 0x00000000, 0 },
  {  6269, 1389, 12, 214933,     11.000, 0x00000000, 0 },
  {  6270, 1389, 13, 214933,     11.500, 0x00000000, 0 },
  {  6271, 1389, 14, 214933,     12.000, 0x00000000, 0 },
  {  6272, 1389, 15, 214933,     12.500, 0x00000000, 0 },
  {  6273, 1389, 16, 214933,     13.000, 0x00000000, 0 },
  {  6274, 1389, 17, 214933,     13.500, 0x00000000, 0 },
  {  6275, 1389, 18, 214933,     14.000, 0x00000000, 0 },
  {  6276, 1389, 19, 214933,     14.500, 0x00000000, 0 },
  {  6277, 1390,  0, 214934,      5.000, 0x00000000, 0 },
  {  6278, 1390,  1, 214934,      5.500, 0x00000000, 0 },
  {  6279, 1390,  2, 214934,      6.000, 0x00000000, 0 },
  {  6280, 1390,  3, 214934,      6.500, 0x00000000, 0 },
  {  6281, 1390,  4, 214934,      7.000, 0x00000000, 0 },
  {  6282, 1390,  5, 214934,      7.500, 0x00000000, 0 },
  {  6283, 1390,  6, 214934,      8.000, 0x00000000, 0 },
  {  6284, 1390,  7, 214934,      8.500, 0x00000000, 0 },
  {  6285, 1390,  8, 214934,      9.000, 0x00000000, 0 },
  {  6286, 1390,  9, 214934,      9.500, 0x00000000, 0 },
  {  6287, 1390, 10, 214934,     10.000, 0x00000000, 0 },
  {  6288, 1390, 11, 214934,     10.500, 0x00000000, 0 },
  {  6289, 1390, 12, 214934,     11.000, 0x00000000, 0 },
  {  6290, 1390, 13, 214934,     11.500, 0x00000000, 0 },
  {  6291, 1390, 14, 214934,     12.000, 0x00000000, 0 },
  {  6292, 1390, 15, 214934,     12.500, 0x00000000, 0 },
  {  6293, 1390, 16, 214934,     13.000, 0x00000000, 0 },
  {  6294, 1390, 17, 214934,     13.500, 0x00000000, 0 },
  {  6295, 1390, 18, 214934,     14.000, 0x00000000, 0 },
  {  6296, 1390, 19, 214934,     14.500, 0x00000000, 0 },
  {  6297, 1391,  0, 214935,      5.000, 0x00000000, 0 },
  {  6298, 1391,  1, 214935,      5.500, 0x00000000, 0 },
  {  6299, 1391,  2, 214935,      6.000, 0x00000000, 0 },
  {  6300, 1391,  3, 214935,      6.500, 0x00000000, 0 },
  {  6301, 1391,  4, 214935,      7.000, 0x00000000, 0 },
  {  6302, 1391,  5, 214935,      7.500, 0x00000000, 0 },
  {  6303, 1391,  6, 214935,      8.000, 0x00000000, 0 },
  {  6304, 1391,  7, 214935,      8.500, 0x00000000, 0 },
  {  6305, 1391,  8, 214935,      9.000, 0x00000000, 0 },
  {  6306, 1391,  9, 214935,      9.500, 0x00000000, 0 },
  {  6307, 1391, 10, 214935,     10.000, 0x00000000, 0 },
  {  6308, 1391, 11, 214935,     10.500, 0x00000000, 0 },
  {  6309, 1391, 12, 214935,     11.000, 0x00000000, 0 },
  {  6310, 1391, 13, 214935,     11.500, 0x00000000, 0 },
  {  6311, 1391, 14, 214935,     12.000, 0x00000000, 0 },
  {  6312, 1391, 15, 214935,     12.500, 0x00000000, 0 },
  {  6313, 1391, 16, 214935,     13.000, 0x00000000, 0 },
  {  6314, 1391, 17, 214935,     13.500, 0x00000000, 0 },
  {  6315, 1391, 18, 214935,     14.000, 0x00000000, 0 },
  {  6316, 1391, 19, 214935,     14.500, 0x00000000, 0 },
  {  6317, 1392,  0, 214936,      5.000, 0x00000000, 0 },
  {  6318, 1392,  1, 214936,      5.500, 0x00000000, 0 },
  {  6319, 1392,  2, 214936,      6.000, 0x00000000, 0 },
  {  6320, 1392,  3, 214936,      6.500, 0x00000000, 0 },
  {  6321, 1392,  4, 214936,      7.000, 0x00000000, 0 },
  {  6322, 1392,  5, 214936,      7.500, 0x00000000, 0 },
  {  6323, 1392,  6, 214936,      8.000, 0x00000000, 0 },
  {  6324, 1392,  7, 214936,      8.500, 0x00000000, 0 },
  {  6325, 1392,  8, 214936,      9.000, 0x00000000, 0 },
  {  6326, 1392,  9, 214936,      9.500, 0x00000000, 0 },
  {  6327, 1392, 10, 214936,     10.000, 0x00000000, 0 },
  {  6328, 1392, 11, 214936,     10.500, 0x00000000, 0 },
  {  6329, 1392, 12, 214936,     11.000, 0x00000000, 0 },
  {  6330, 1392, 13, 214936,     11.500, 0x00000000, 0 },
  {  6331, 1392, 14, 214936,     12.000, 0x00000000, 0 },
  {  6332, 1392, 15, 214936,     12.500, 0x00000000, 0 },
  {  6333, 1392, 16, 214936,     13.000, 0x00000000, 0 },
  {  6334, 1392, 17, 214936,     13.500, 0x00000000, 0 },
  {  6335, 1392, 18, 214936,     14.000, 0x00000000, 0 },
  {  6336, 1392, 19, 214936,     14.500, 0x00000000, 0 },
  {  6337, 1393,  0, 214937,      5.000, 0x00000000, 0 },
  {  6338, 1393,  1, 214937,      5.500, 0x00000000, 0 },
  {  6339, 1393,  2, 214937,      6.000, 0x00000000, 0 },
  {  6340, 1393,  3, 214937,      6.500, 0x00000000, 0 },
  {  6341, 1393,  4, 214937,      7.000, 0x00000000, 0 },
  {  6342, 1393,  5, 214937,      7.500, 0x00000000, 0 },
  {  6343, 1393,  6, 214937,      8.000, 0x00000000, 0 },
  {  6344, 1393,  7, 214937,      8.500, 0x00000000, 0 },
  {  6345, 1393,  8, 214937,      9.000, 0x00000000, 0 },
  {  6346, 1393,  9, 214937,      9.500, 0x00000000, 0 },
  {  6347, 1393, 10, 214937,     10.000, 0x00000000, 0 },
  {  6348, 1393, 11, 214937,     10.500, 0x00000000, 0 },
  {  6349, 1393, 12, 214937,     11.000, 0x00000000, 0 },
  {  6350, 1393, 13, 214937,     11.500, 0x00000000, 0 },
  {  6351, 1393, 14, 214937,     12.000, 0x00000000, 0 },
  {  6352, 1393, 15, 214937,     12.500, 0x00000000, 0 },
  {  6353, 1393, 16, 214937,     13.000, 0x00000000, 0 },
  {  6354, 1393, 17, 214937,     13.500, 0x00000000, 0 },
  {  6355, 1393, 18, 214937,     14.000, 0x00000000, 0 },
  {  6356, 1393, 19, 214937,     14.500, 0x00000000, 0 },
  {  6357, 1394,  0, 214938,      5.000, 0x00000000, 0 },
  {  6358, 1394,  1, 214938,      5.500, 0x00000000, 0 },
  {  6359, 1394,  2, 214938,      6.000, 0x00000000, 0 },
  {  6360, 1394,  3, 214938,      6.500, 0x00000000, 0 },
  {  6361, 1394,  4, 214938,      7.000, 0x00000000, 0 },
  {  6362, 1394,  5, 214938,      7.500, 0x00000000, 0 },
  {  6363, 1394,  6, 214938,      8.000, 0x00000000, 0 },
  {  6364, 1394,  7, 214938,      8.500, 0x00000000, 0 },
  {  6365, 1394,  8, 214938,      9.000, 0x00000000, 0 },
  {  6366, 1394,  9, 214938,      9.500, 0x00000000, 0 },
  {  6367, 1394, 10, 214938,     10.000, 0x00000000, 0 },
  {  6368, 1394, 11, 214938,     10.500, 0x00000000, 0 },
  {  6369, 1394, 12, 214938,     11.000, 0x00000000, 0 },
  {  6370, 1394, 13, 214938,     11.500, 0x00000000, 0 },
  {  6371, 1394, 14, 214938,     12.000, 0x00000000, 0 },
  {  6372, 1394, 15, 214938,     12.500, 0x00000000, 0 },
  {  6373, 1394, 16, 214938,     13.000, 0x00000000, 0 },
  {  6374, 1394, 17, 214938,     13.500, 0x00000000, 0 },
  {  6375, 1394, 18, 214938,     14.000, 0x00000000, 0 },
  {  6376, 1394, 19, 214938,     14.500, 0x00000000, 0 },
  {  6377, 1395,  0, 214939,     10.000, 0x00000000, 0 },
  {  6378, 1395,  1, 214939,     11.000, 0x00000000, 0 },
  {  6379, 1395,  2, 214939,     12.000, 0x00000000, 0 },
  {  6380, 1395,  3, 214939,     13.000, 0x00000000, 0 },
  {  6381, 1395,  4, 214939,     14.000, 0x00000000, 0 },
  {  6382, 1395,  5, 214939,     15.000, 0x00000000, 0 },
  {  6383, 1395,  6, 214939,     16.000, 0x00000000, 0 },
  {  6384, 1395,  7, 214939,     17.000, 0x00000000, 0 },
  {  6385, 1395,  8, 214939,     18.000, 0x00000000, 0 },
  {  6386, 1395,  9, 214939,     19.000, 0x00000000, 0 },
  {  6387, 1395, 10, 214939,     20.000, 0x00000000, 0 },
  {  6388, 1395, 11, 214939,     21.000, 0x00000000, 0 },
  {  6389, 1395, 12, 214939,     22.000, 0x00000000, 0 },
  {  6390, 1395, 13, 214939,     23.000, 0x00000000, 0 },
  {  6391, 1395, 14, 214939,     24.000, 0x00000000, 0 },
  {  6392, 1395, 15, 214939,     25.000, 0x00000000, 0 },
  {  6393, 1395, 16, 214939,     26.000, 0x00000000, 0 },
  {  6394, 1395, 17, 214939,     27.000, 0x00000000, 0 },
  {  6395, 1395, 18, 214939,     28.000, 0x00000000, 0 },
  {  6396, 1395, 19, 214939,     29.000, 0x00000000, 0 },
  {  6491, 1434,  0, 218910,      0.000, 0x00000000, 0 },
  {  6492, 1436,  0, 219655,      0.000, 0x00000000, 0 },
  {  6520, 1451,  0, 226829,      0.000, 0x00000000, 0 },
  {  6521, 1452,  0, 226829,      0.000, 0x00000000, 0 },
  {  6522, 1453,  0, 226829,      0.000, 0x00000000, 0 },
  {  6523, 1454,  0, 226829,      0.000, 0x00000000, 0 },
  {  6524, 1455,  0, 226829,      0.000, 0x00000000, 0 },
  {  6525, 1456,  0, 226829,      0.000, 0x00000000, 0 },
  {  6612, 1481,  0, 238042,      5.000, 0x00000000, 0 },
  {  6613, 1481,  1, 238042,     10.000, 0x00000000, 0 },
  {  6614, 1481,  2, 238042,     15.000, 0x00000000, 0 },
  {  6615, 1481,  3, 238042,     20.000, 0x00000000, 0 },
  {  6616, 1481,  4, 238042,     25.000, 0x00000000, 0 },
  {  6617, 1481,  5, 238042,     30.000, 0x00000000, 0 },
  {  6618, 1481,  6, 238042,     35.000, 0x00000000, 0 },
  {  6619, 1481,  7, 238042,     40.000, 0x00000000, 0 },
  {  6610, 1482,  0, 238078,      0.000, 0x00000000, 0 },
  {  6611, 1483,  0, 238114,      0.000, 0x00000000, 0 },
  {  6620, 1484,  0, 239042,   4000.000, 0x00000000, 0 },
  {  7742, 1484,  1, 239042,   4300.000, 0x00000000, 0 },
  {  7743, 1484,  2, 239042,   4600.000, 0x00000000, 0 },
  {  7744, 1484,  3, 239042,   4900.000, 0x00000000, 0 },
  {  7745, 1484,  4, 239042,   5200.000, 0x00000000, 0 },
  {  7746, 1484,  5, 239042,   5500.000, 0x00000000, 0 },
  {  7747, 1484,  6, 239042,   5800.000, 0x00000000, 0 },
  {  7748, 1484,  7, 239042,   6100.000, 0x00000000, 0 },
  {  7749, 1484,  8, 239042,   6400.000, 0x00000000, 0 },
  {  7750, 1484,  9, 239042,   6700.000, 0x00000000, 0 },
  {  7751, 1484, 10, 239042,   7000.000, 0x00000000, 0 },
  {  7752, 1484, 11, 239042,   7300.000, 0x00000000, 0 },
  {  7753, 1484, 12, 239042,   7600.000, 0x00000000, 0 },
  {  7754, 1484, 13, 239042,   7900.000, 0x00000000, 0 },
  {  7755, 1484, 14, 239042,   8200.000, 0x00000000, 0 },
  {  7756, 1484, 15, 239042,   8500.000, 0x00000000, 0 },
  {  7757, 1484, 16, 239042,   8800.000, 0x00000000, 0 },
  {  7758, 1484, 17, 239042,   9100.000, 0x00000000, 0 },
  {  7759, 1484, 18, 239042,   9400.000, 0x00000000, 0 },
  {  7760, 1484, 19, 239042,   9700.000, 0x00000000, 0 },
  {  7859, 1484, 20, 239042,  10000.000, 0x00000000, 0 },
  {  7860, 1484, 21, 239042,  10300.000, 0x00000000, 0 },
  {  7861, 1484, 22, 239042,  10600.000, 0x00000000, 0 },
  {  7862, 1484, 23, 239042,  10900.000, 0x00000000, 0 },
  {  7863, 1484, 24, 239042,  11200.000, 0x00000000, 0 },
  {  7864, 1484, 25, 239042,  11500.000, 0x00000000, 0 },
  {  7865, 1484, 26, 239042,  11800.000, 0x00000000, 0 },
  {  7866, 1484, 27, 239042,  12100.000, 0x00000000, 0 },
  {  7867, 1484, 28, 239042,  12400.000, 0x00000000, 0 },
  {  7868, 1484, 29, 239042,  12700.000, 0x00000000, 0 },
  {  7869, 1484, 30, 239042,  13000.000, 0x00000000, 0 },
  {  7870, 1484, 31, 239042,  13300.000, 0x00000000, 0 },
  {  7871, 1484, 32, 239042,  13600.000, 0x00000000, 0 },
  {  7872, 1484, 33, 239042,  13900.000, 0x00000000, 0 },
  {  7873, 1484, 34, 239042,  14200.000, 0x00000000, 0 },
  {  7874, 1484, 35, 239042,  14500.000, 0x00000000, 0 },
  {  7875, 1484, 36, 239042,  14800.000, 0x00000000, 0 },
  {  7876, 1484, 37, 239042,  15100.000, 0x00000000, 0 },
  {  7877, 1484, 38, 239042,  15400.000, 0x00000000, 0 },
  {  7878, 1484, 39, 239042,  15700.000, 0x00000000, 0 },
  {  7879, 1484, 40, 239042,  16000.000, 0x00000000, 0 },
  {  7880, 1484, 41, 239042,  16300.000, 0x00000000, 0 },
  {  7881, 1484, 42, 239042,  16600.000, 0x00000000, 0 },
  {  7882, 1484, 43, 239042,  16900.000, 0x00000000, 0 },
  {  7883, 1484, 44, 239042,  17200.000, 0x00000000, 0 },
  {  7884, 1484, 45, 239042,  17500.000, 0x00000000, 0 },
  {  7885, 1484, 46, 239042,  17800.000, 0x00000000, 0 },
  {  7886, 1484, 47, 239042,  18100.000, 0x00000000, 0 },
  {  7887, 1484, 48, 239042,  18400.000, 0x00000000, 0 },
  {  7888, 1484, 49, 239042,  18700.000, 0x00000000, 0 },
  {  9685, 1484, 50, 239042,  19000.000, 0x00000000, 0 },
  {  9686, 1484, 51, 239042,  19300.000, 0x00000000, 0 },
  {  9687, 1484, 52, 239042,  19600.000, 0x00000000, 0 },
  {  9688, 1484, 53, 239042,  19900.000, 0x00000000, 0 },
  {  9689, 1484, 54, 239042,  20200.000, 0x00000000, 0 },
  {  9690, 1484, 55, 239042,  20500.000, 0x00000000, 0 },
  {  9691, 1484, 56, 239042,  20800.000, 0x00000000, 0 },
  {  9692, 1484, 57, 239042,  21100.000, 0x00000000, 0 },
  {  9693, 1484, 58, 239042,  21400.000, 0x00000000, 0 },
  {  9694, 1484, 59, 239042,  21700.000, 0x00000000, 0 },
  {  9695, 1484, 60, 239042,  22000.000, 0x00000000, 0 },
  {  9696, 1484, 61, 239042,  22300.000, 0x00000000, 0 },
  {  9697, 1484, 62, 239042,  22600.000, 0x00000000, 0 },
  {  9698, 1484, 63, 239042,  22900.000, 0x00000000, 0 },
  {  9699, 1484, 64, 239042,  23200.000, 0x00000000, 0 },
  {  9700, 1484, 65, 239042,  23500.000, 0x00000000, 0 },
  {  9701, 1484, 66, 239042,  23800.000, 0x00000000, 0 },
  {  9702, 1484, 67, 239042,  24100.000, 0x00000000, 0 },
  {  9703, 1484, 68, 239042,  24400.000, 0x00000000, 0 },
  {  9704, 1484, 69, 239042,  24700.000, 0x00000000, 0 },
  {  9705, 1484, 70, 239042,  25000.000, 0x00000000, 0 },
  {  9706, 1484, 71, 239042,  25300.000, 0x00000000, 0 },
  {  9707, 1484, 72, 239042,  25600.000, 0x00000000, 0 },
  {  9708, 1484, 73, 239042,  25900.000, 0x00000000, 0 },
  {  9709, 1484, 74, 239042,  26200.000, 0x00000000, 0 },
  {  9710, 1484, 75, 239042,  26500.000, 0x00000000, 0 },
  {  9711, 1484, 76, 239042,  26800.000, 0x00000000, 0 },
  {  9712, 1484, 77, 239042,  27100.000, 0x00000000, 0 },
  {  9713, 1484, 78, 239042,  27400.000, 0x00000000, 0 },
  {  9714, 1484, 79, 239042,  27700.000, 0x00000000, 0 },
  {  9715, 1484, 80, 239042,  28000.000, 0x00000000, 0 },
  {  9716, 1484, 81, 239042,  28300.000, 0x00000000, 0 },
  {  9717, 1484, 82, 239042,  28600.000, 0x00000000, 0 },
  {  9718, 1484, 83, 239042,  28900.000, 0x00000000, 0 },
  {  9719, 1484, 84, 239042,  29200.000, 0x00000000, 0 },
  {  9720, 1484, 85, 239042,  29500.000, 0x00000000, 0 },
  {  9721, 1484, 86, 239042,  29800.000, 0x00000000, 0 },
  {  9722, 1484, 87, 239042,  30100.000, 0x00000000, 0 },
  {  9723, 1484, 88, 239042,  30400.000, 0x00000000, 0 },
  {  9724, 1484, 89, 239042,  30700.000, 0x00000000, 0 },
  {  9725, 1484, 90, 239042,  31000.000, 0x00000000, 0 },
  {  9726, 1484, 91, 239042,  31300.000, 0x00000000, 0 },
  {  9727, 1484, 92, 239042,  31600.000, 0x00000000, 0 },
  {  9728, 1484, 93, 239042,  31900.000, 0x00000000, 0 },
  {  9729, 1484, 94, 239042,  32200.000, 0x00000000, 0 },
  {  9730, 1484, 95, 239042,  32500.000, 0x00000000, 0 },
  {  9731, 1484, 96, 239042,  32800.000, 0x00000000, 0 },
  {  9732, 1484, 97, 239042,  33100.000, 0x00000000, 0 },
  {  9733, 1484, 98, 239042,  33400.000, 0x00000000, 0 },
  {  9734, 1484, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6621, 1485,  0, 238043,      5.000, 0x00000000, 0 },
  {  7380, 1485,  1, 238043,     10.000, 0x00000000, 0 },
  {  7381, 1485,  2, 238043,     15.000, 0x00000000, 0 },
  {  7382, 1485,  3, 238043,     20.000, 0x00000000, 0 },
  {  7383, 1485,  4, 238043,     25.000, 0x00000000, 0 },
  {  7384, 1485,  5, 238043,     30.000, 0x00000000, 0 },
  {  7385, 1485,  6, 238043,     35.000, 0x00000000, 0 },
  {  7386, 1485,  7, 238043,     40.000, 0x00000000, 0 },
  {  6622, 1486,  0, 238079,      0.000, 0x00000000, 0 },
  {  6623, 1487,  0, 238115,      0.000, 0x00000000, 0 },
  {  6624, 1488,  0, 239042,   4000.000, 0x00000000, 0 },
  {  7761, 1488,  1, 239042,   4300.000, 0x00000000, 0 },
  {  7762, 1488,  2, 239042,   4600.000, 0x00000000, 0 },
  {  7763, 1488,  3, 239042,   4900.000, 0x00000000, 0 },
  {  7764, 1488,  4, 239042,   5200.000, 0x00000000, 0 },
  {  7765, 1488,  5, 239042,   5500.000, 0x00000000, 0 },
  {  7766, 1488,  6, 239042,   5800.000, 0x00000000, 0 },
  {  7767, 1488,  7, 239042,   6100.000, 0x00000000, 0 },
  {  7768, 1488,  8, 239042,   6400.000, 0x00000000, 0 },
  {  7769, 1488,  9, 239042,   6700.000, 0x00000000, 0 },
  {  7770, 1488, 10, 239042,   7000.000, 0x00000000, 0 },
  {  7771, 1488, 11, 239042,   7300.000, 0x00000000, 0 },
  {  7772, 1488, 12, 239042,   7600.000, 0x00000000, 0 },
  {  7773, 1488, 13, 239042,   7900.000, 0x00000000, 0 },
  {  7774, 1488, 14, 239042,   8200.000, 0x00000000, 0 },
  {  7775, 1488, 15, 239042,   8500.000, 0x00000000, 0 },
  {  7776, 1488, 16, 239042,   8800.000, 0x00000000, 0 },
  {  7777, 1488, 17, 239042,   9100.000, 0x00000000, 0 },
  {  7778, 1488, 18, 239042,   9400.000, 0x00000000, 0 },
  {  7779, 1488, 19, 239042,   9700.000, 0x00000000, 0 },
  {  7889, 1488, 20, 239042,  10000.000, 0x00000000, 0 },
  {  7890, 1488, 21, 239042,  10300.000, 0x00000000, 0 },
  {  7891, 1488, 22, 239042,  10600.000, 0x00000000, 0 },
  {  7892, 1488, 23, 239042,  10900.000, 0x00000000, 0 },
  {  7893, 1488, 24, 239042,  11200.000, 0x00000000, 0 },
  {  7894, 1488, 25, 239042,  11500.000, 0x00000000, 0 },
  {  7895, 1488, 26, 239042,  11800.000, 0x00000000, 0 },
  {  7896, 1488, 27, 239042,  12100.000, 0x00000000, 0 },
  {  7897, 1488, 28, 239042,  12400.000, 0x00000000, 0 },
  {  7898, 1488, 29, 239042,  12700.000, 0x00000000, 0 },
  {  7899, 1488, 30, 239042,  13000.000, 0x00000000, 0 },
  {  7900, 1488, 31, 239042,  13300.000, 0x00000000, 0 },
  {  7901, 1488, 32, 239042,  13600.000, 0x00000000, 0 },
  {  7902, 1488, 33, 239042,  13900.000, 0x00000000, 0 },
  {  7903, 1488, 34, 239042,  14200.000, 0x00000000, 0 },
  {  7904, 1488, 35, 239042,  14500.000, 0x00000000, 0 },
  {  7905, 1488, 36, 239042,  14800.000, 0x00000000, 0 },
  {  7906, 1488, 37, 239042,  15100.000, 0x00000000, 0 },
  {  7907, 1488, 38, 239042,  15400.000, 0x00000000, 0 },
  {  7908, 1488, 39, 239042,  15700.000, 0x00000000, 0 },
  {  7909, 1488, 40, 239042,  16000.000, 0x00000000, 0 },
  {  7910, 1488, 41, 239042,  16300.000, 0x00000000, 0 },
  {  7911, 1488, 42, 239042,  16600.000, 0x00000000, 0 },
  {  7912, 1488, 43, 239042,  16900.000, 0x00000000, 0 },
  {  7913, 1488, 44, 239042,  17200.000, 0x00000000, 0 },
  {  7914, 1488, 45, 239042,  17500.000, 0x00000000, 0 },
  {  7915, 1488, 46, 239042,  17800.000, 0x00000000, 0 },
  {  7916, 1488, 47, 239042,  18100.000, 0x00000000, 0 },
  {  7917, 1488, 48, 239042,  18400.000, 0x00000000, 0 },
  {  7918, 1488, 49, 239042,  18700.000, 0x00000000, 0 },
  {  9735, 1488, 50, 239042,  19000.000, 0x00000000, 0 },
  {  9736, 1488, 51, 239042,  19300.000, 0x00000000, 0 },
  {  9737, 1488, 52, 239042,  19600.000, 0x00000000, 0 },
  {  9738, 1488, 53, 239042,  19900.000, 0x00000000, 0 },
  {  9739, 1488, 54, 239042,  20200.000, 0x00000000, 0 },
  {  9740, 1488, 55, 239042,  20500.000, 0x00000000, 0 },
  {  9741, 1488, 56, 239042,  20800.000, 0x00000000, 0 },
  {  9742, 1488, 57, 239042,  21100.000, 0x00000000, 0 },
  {  9743, 1488, 58, 239042,  21400.000, 0x00000000, 0 },
  {  9744, 1488, 59, 239042,  21700.000, 0x00000000, 0 },
  {  9745, 1488, 60, 239042,  22000.000, 0x00000000, 0 },
  {  9746, 1488, 61, 239042,  22300.000, 0x00000000, 0 },
  {  9747, 1488, 62, 239042,  22600.000, 0x00000000, 0 },
  {  9748, 1488, 63, 239042,  22900.000, 0x00000000, 0 },
  {  9749, 1488, 64, 239042,  23200.000, 0x00000000, 0 },
  {  9750, 1488, 65, 239042,  23500.000, 0x00000000, 0 },
  {  9751, 1488, 66, 239042,  23800.000, 0x00000000, 0 },
  {  9752, 1488, 67, 239042,  24100.000, 0x00000000, 0 },
  {  9753, 1488, 68, 239042,  24400.000, 0x00000000, 0 },
  {  9754, 1488, 69, 239042,  24700.000, 0x00000000, 0 },
  {  9755, 1488, 70, 239042,  25000.000, 0x00000000, 0 },
  {  9756, 1488, 71, 239042,  25300.000, 0x00000000, 0 },
  {  9757, 1488, 72, 239042,  25600.000, 0x00000000, 0 },
  {  9758, 1488, 73, 239042,  25900.000, 0x00000000, 0 },
  {  9759, 1488, 74, 239042,  26200.000, 0x00000000, 0 },
  {  9760, 1488, 75, 239042,  26500.000, 0x00000000, 0 },
  {  9761, 1488, 76, 239042,  26800.000, 0x00000000, 0 },
  {  9762, 1488, 77, 239042,  27100.000, 0x00000000, 0 },
  {  9763, 1488, 78, 239042,  27400.000, 0x00000000, 0 },
  {  9764, 1488, 79, 239042,  27700.000, 0x00000000, 0 },
  {  9765, 1488, 80, 239042,  28000.000, 0x00000000, 0 },
  {  9766, 1488, 81, 239042,  28300.000, 0x00000000, 0 },
  {  9767, 1488, 82, 239042,  28600.000, 0x00000000, 0 },
  {  9768, 1488, 83, 239042,  28900.000, 0x00000000, 0 },
  {  9769, 1488, 84, 239042,  29200.000, 0x00000000, 0 },
  {  9770, 1488, 85, 239042,  29500.000, 0x00000000, 0 },
  {  9771, 1488, 86, 239042,  29800.000, 0x00000000, 0 },
  {  9772, 1488, 87, 239042,  30100.000, 0x00000000, 0 },
  {  9773, 1488, 88, 239042,  30400.000, 0x00000000, 0 },
  {  9774, 1488, 89, 239042,  30700.000, 0x00000000, 0 },
  {  9775, 1488, 90, 239042,  31000.000, 0x00000000, 0 },
  {  9776, 1488, 91, 239042,  31300.000, 0x00000000, 0 },
  {  9777, 1488, 92, 239042,  31600.000, 0x00000000, 0 },
  {  9778, 1488, 93, 239042,  31900.000, 0x00000000, 0 },
  {  9779, 1488, 94, 239042,  32200.000, 0x00000000, 0 },
  {  9780, 1488, 95, 239042,  32500.000, 0x00000000, 0 },
  {  9781, 1488, 96, 239042,  32800.000, 0x00000000, 0 },
  {  9782, 1488, 97, 239042,  33100.000, 0x00000000, 0 },
  {  9783, 1488, 98, 239042,  33400.000, 0x00000000, 0 },
  {  9784, 1488, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6625, 1489,  0, 238044,      6.000, 0x00000000, 0 },
  {  7387, 1489,  1, 238044,     12.000, 0x00000000, 0 },
  {  7388, 1489,  2, 238044,     18.000, 0x00000000, 0 },
  {  7389, 1489,  3, 238044,     24.000, 0x00000000, 0 },
  {  7390, 1489,  4, 238044,     30.000, 0x00000000, 0 },
  {  7391, 1489,  5, 238044,     36.000, 0x00000000, 0 },
  {  7392, 1489,  6, 238044,     42.000, 0x00000000, 0 },
  {  7393, 1489,  7, 238044,     48.000, 0x00000000, 0 },
  {  6626, 1490,  0, 238080,      0.000, 0x00000000, 0 },
  {  6627, 1491,  0, 238116,      0.000, 0x00000000, 0 },
  {  6628, 1492,  0, 239042,   4000.000, 0x00000000, 0 },
  {  7919, 1492,  1, 239042,   4300.000, 0x00000000, 0 },
  {  7920, 1492,  2, 239042,   4600.000, 0x00000000, 0 },
  {  7921, 1492,  3, 239042,   4900.000, 0x00000000, 0 },
  {  7922, 1492,  4, 239042,   5200.000, 0x00000000, 0 },
  {  7923, 1492,  5, 239042,   5500.000, 0x00000000, 0 },
  {  7924, 1492,  6, 239042,   5800.000, 0x00000000, 0 },
  {  7925, 1492,  7, 239042,   6100.000, 0x00000000, 0 },
  {  7926, 1492,  8, 239042,   6400.000, 0x00000000, 0 },
  {  7927, 1492,  9, 239042,   6700.000, 0x00000000, 0 },
  {  7928, 1492, 10, 239042,   7000.000, 0x00000000, 0 },
  {  7929, 1492, 11, 239042,   7300.000, 0x00000000, 0 },
  {  7930, 1492, 12, 239042,   7600.000, 0x00000000, 0 },
  {  7931, 1492, 13, 239042,   7900.000, 0x00000000, 0 },
  {  7932, 1492, 14, 239042,   8200.000, 0x00000000, 0 },
  {  7933, 1492, 15, 239042,   8500.000, 0x00000000, 0 },
  {  7934, 1492, 16, 239042,   8800.000, 0x00000000, 0 },
  {  7935, 1492, 17, 239042,   9100.000, 0x00000000, 0 },
  {  7936, 1492, 18, 239042,   9400.000, 0x00000000, 0 },
  {  7937, 1492, 19, 239042,   9700.000, 0x00000000, 0 },
  {  7938, 1492, 20, 239042,  10000.000, 0x00000000, 0 },
  {  7939, 1492, 21, 239042,  10300.000, 0x00000000, 0 },
  {  7940, 1492, 22, 239042,  10600.000, 0x00000000, 0 },
  {  7941, 1492, 23, 239042,  10900.000, 0x00000000, 0 },
  {  7942, 1492, 24, 239042,  11200.000, 0x00000000, 0 },
  {  7943, 1492, 25, 239042,  11500.000, 0x00000000, 0 },
  {  7944, 1492, 26, 239042,  11800.000, 0x00000000, 0 },
  {  7945, 1492, 27, 239042,  12100.000, 0x00000000, 0 },
  {  7946, 1492, 28, 239042,  12400.000, 0x00000000, 0 },
  {  7947, 1492, 29, 239042,  12700.000, 0x00000000, 0 },
  {  7948, 1492, 30, 239042,  13000.000, 0x00000000, 0 },
  {  7949, 1492, 31, 239042,  13300.000, 0x00000000, 0 },
  {  7950, 1492, 32, 239042,  13600.000, 0x00000000, 0 },
  {  7951, 1492, 33, 239042,  13900.000, 0x00000000, 0 },
  {  7952, 1492, 34, 239042,  14200.000, 0x00000000, 0 },
  {  7953, 1492, 35, 239042,  14500.000, 0x00000000, 0 },
  {  7954, 1492, 36, 239042,  14800.000, 0x00000000, 0 },
  {  7955, 1492, 37, 239042,  15100.000, 0x00000000, 0 },
  {  7956, 1492, 38, 239042,  15400.000, 0x00000000, 0 },
  {  7957, 1492, 39, 239042,  15700.000, 0x00000000, 0 },
  {  7958, 1492, 40, 239042,  16000.000, 0x00000000, 0 },
  {  7959, 1492, 41, 239042,  16300.000, 0x00000000, 0 },
  {  7960, 1492, 42, 239042,  16600.000, 0x00000000, 0 },
  {  7961, 1492, 43, 239042,  16900.000, 0x00000000, 0 },
  {  7962, 1492, 44, 239042,  17200.000, 0x00000000, 0 },
  {  7963, 1492, 45, 239042,  17500.000, 0x00000000, 0 },
  {  7964, 1492, 46, 239042,  17800.000, 0x00000000, 0 },
  {  7965, 1492, 47, 239042,  18100.000, 0x00000000, 0 },
  {  7966, 1492, 48, 239042,  18400.000, 0x00000000, 0 },
  {  7967, 1492, 49, 239042,  18700.000, 0x00000000, 0 },
  {  9785, 1492, 50, 239042,  19000.000, 0x00000000, 0 },
  {  9786, 1492, 51, 239042,  19300.000, 0x00000000, 0 },
  {  9787, 1492, 52, 239042,  19600.000, 0x00000000, 0 },
  {  9788, 1492, 53, 239042,  19900.000, 0x00000000, 0 },
  {  9789, 1492, 54, 239042,  20200.000, 0x00000000, 0 },
  {  9790, 1492, 55, 239042,  20500.000, 0x00000000, 0 },
  {  9791, 1492, 56, 239042,  20800.000, 0x00000000, 0 },
  {  9792, 1492, 57, 239042,  21100.000, 0x00000000, 0 },
  {  9793, 1492, 58, 239042,  21400.000, 0x00000000, 0 },
  {  9794, 1492, 59, 239042,  21700.000, 0x00000000, 0 },
  {  9795, 1492, 60, 239042,  22000.000, 0x00000000, 0 },
  {  9796, 1492, 61, 239042,  22300.000, 0x00000000, 0 },
  {  9797, 1492, 62, 239042,  22600.000, 0x00000000, 0 },
  {  9798, 1492, 63, 239042,  22900.000, 0x00000000, 0 },
  {  9799, 1492, 64, 239042,  23200.000, 0x00000000, 0 },
  {  9800, 1492, 65, 239042,  23500.000, 0x00000000, 0 },
  {  9801, 1492, 66, 239042,  23800.000, 0x00000000, 0 },
  {  9802, 1492, 67, 239042,  24100.000, 0x00000000, 0 },
  {  9803, 1492, 68, 239042,  24400.000, 0x00000000, 0 },
  {  9804, 1492, 69, 239042,  24700.000, 0x00000000, 0 },
  {  9805, 1492, 70, 239042,  25000.000, 0x00000000, 0 },
  {  9806, 1492, 71, 239042,  25300.000, 0x00000000, 0 },
  {  9807, 1492, 72, 239042,  25600.000, 0x00000000, 0 },
  {  9808, 1492, 73, 239042,  25900.000, 0x00000000, 0 },
  {  9809, 1492, 74, 239042,  26200.000, 0x00000000, 0 },
  {  9810, 1492, 75, 239042,  26500.000, 0x00000000, 0 },
  {  9811, 1492, 76, 239042,  26800.000, 0x00000000, 0 },
  {  9812, 1492, 77, 239042,  27100.000, 0x00000000, 0 },
  {  9813, 1492, 78, 239042,  27400.000, 0x00000000, 0 },
  {  9814, 1492, 79, 239042,  27700.000, 0x00000000, 0 },
  {  9815, 1492, 80, 239042,  28000.000, 0x00000000, 0 },
  {  9816, 1492, 81, 239042,  28300.000, 0x00000000, 0 },
  {  9817, 1492, 82, 239042,  28600.000, 0x00000000, 0 },
  {  9818, 1492, 83, 239042,  28900.000, 0x00000000, 0 },
  {  9819, 1492, 84, 239042,  29200.000, 0x00000000, 0 },
  {  9820, 1492, 85, 239042,  29500.000, 0x00000000, 0 },
  {  9821, 1492, 86, 239042,  29800.000, 0x00000000, 0 },
  {  9822, 1492, 87, 239042,  30100.000, 0x00000000, 0 },
  {  9823, 1492, 88, 239042,  30400.000, 0x00000000, 0 },
  {  9824, 1492, 89, 239042,  30700.000, 0x00000000, 0 },
  {  9825, 1492, 90, 239042,  31000.000, 0x00000000, 0 },
  {  9826, 1492, 91, 239042,  31300.000, 0x00000000, 0 },
  {  9827, 1492, 92, 239042,  31600.000, 0x00000000, 0 },
  {  9828, 1492, 93, 239042,  31900.000, 0x00000000, 0 },
  {  9829, 1492, 94, 239042,  32200.000, 0x00000000, 0 },
  {  9830, 1492, 95, 239042,  32500.000, 0x00000000, 0 },
  {  9831, 1492, 96, 239042,  32800.000, 0x00000000, 0 },
  {  9832, 1492, 97, 239042,  33100.000, 0x00000000, 0 },
  {  9833, 1492, 98, 239042,  33400.000, 0x00000000, 0 },
  {  9834, 1492, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6629, 1493,  0, 238045,     -5.000, 0x00000000, 0 },
  {  7394, 1493,  1, 238045,    -10.000, 0x00000000, 0 },
  {  7395, 1493,  2, 238045,    -15.000, 0x00000000, 0 },
  {  7396, 1493,  3, 238045,    -20.000, 0x00000000, 0 },
  {  7397, 1493,  4, 238045,    -25.000, 0x00000000, 0 },
  {  7398, 1493,  5, 238045,    -30.000, 0x00000000, 0 },
  {  7399, 1493,  6, 238045,    -35.000, 0x00000000, 0 },
  {  7400, 1493,  7, 238045,    -40.000, 0x00000000, 0 },
  {  6630, 1494,  0, 243188,      0.000, 0x00000000, 0 },
  {  6631, 1495,  0, 238117,      0.000, 0x00000000, 0 },
  {  6632, 1496,  0, 239042,   4000.000, 0x00000000, 0 },
  {  7969, 1496,  1, 239042,   4300.000, 0x00000000, 0 },
  {  7970, 1496,  2, 239042,   4600.000, 0x00000000, 0 },
  {  7971, 1496,  3, 239042,   4900.000, 0x00000000, 0 },
  {  7972, 1496,  4, 239042,   5200.000, 0x00000000, 0 },
  {  7973, 1496,  5, 239042,   5500.000, 0x00000000, 0 },
  {  7974, 1496,  6, 239042,   5800.000, 0x00000000, 0 },
  {  7975, 1496,  7, 239042,   6100.000, 0x00000000, 0 },
  {  7976, 1496,  8, 239042,   6400.000, 0x00000000, 0 },
  {  7977, 1496,  9, 239042,   6700.000, 0x00000000, 0 },
  {  7978, 1496, 10, 239042,   7000.000, 0x00000000, 0 },
  {  7979, 1496, 11, 239042,   7300.000, 0x00000000, 0 },
  {  7980, 1496, 12, 239042,   7600.000, 0x00000000, 0 },
  {  7981, 1496, 13, 239042,   7900.000, 0x00000000, 0 },
  {  7982, 1496, 14, 239042,   8200.000, 0x00000000, 0 },
  {  7983, 1496, 15, 239042,   8500.000, 0x00000000, 0 },
  {  7984, 1496, 16, 239042,   8800.000, 0x00000000, 0 },
  {  7985, 1496, 17, 239042,   9100.000, 0x00000000, 0 },
  {  7986, 1496, 18, 239042,   9400.000, 0x00000000, 0 },
  {  7987, 1496, 19, 239042,   9700.000, 0x00000000, 0 },
  {  7988, 1496, 20, 239042,  10000.000, 0x00000000, 0 },
  {  7989, 1496, 21, 239042,  10300.000, 0x00000000, 0 },
  {  7990, 1496, 22, 239042,  10600.000, 0x00000000, 0 },
  {  7991, 1496, 23, 239042,  10900.000, 0x00000000, 0 },
  {  7992, 1496, 24, 239042,  11200.000, 0x00000000, 0 },
  {  7993, 1496, 25, 239042,  11500.000, 0x00000000, 0 },
  {  7994, 1496, 26, 239042,  11800.000, 0x00000000, 0 },
  {  7995, 1496, 27, 239042,  12100.000, 0x00000000, 0 },
  {  7996, 1496, 28, 239042,  12400.000, 0x00000000, 0 },
  {  7997, 1496, 29, 239042,  12700.000, 0x00000000, 0 },
  {  7998, 1496, 30, 239042,  13000.000, 0x00000000, 0 },
  {  7999, 1496, 31, 239042,  13300.000, 0x00000000, 0 },
  {  8000, 1496, 32, 239042,  13600.000, 0x00000000, 0 },
  {  8001, 1496, 33, 239042,  13900.000, 0x00000000, 0 },
  {  8002, 1496, 34, 239042,  14200.000, 0x00000000, 0 },
  {  8003, 1496, 35, 239042,  14500.000, 0x00000000, 0 },
  {  8004, 1496, 36, 239042,  14800.000, 0x00000000, 0 },
  {  8005, 1496, 37, 239042,  15100.000, 0x00000000, 0 },
  {  8006, 1496, 38, 239042,  15400.000, 0x00000000, 0 },
  {  8007, 1496, 39, 239042,  15700.000, 0x00000000, 0 },
  {  8008, 1496, 40, 239042,  16000.000, 0x00000000, 0 },
  {  8009, 1496, 41, 239042,  16300.000, 0x00000000, 0 },
  {  8010, 1496, 42, 239042,  16600.000, 0x00000000, 0 },
  {  8011, 1496, 43, 239042,  16900.000, 0x00000000, 0 },
  {  8012, 1496, 44, 239042,  17200.000, 0x00000000, 0 },
  {  8013, 1496, 45, 239042,  17500.000, 0x00000000, 0 },
  {  8014, 1496, 46, 239042,  17800.000, 0x00000000, 0 },
  {  8015, 1496, 47, 239042,  18100.000, 0x00000000, 0 },
  {  8016, 1496, 48, 239042,  18400.000, 0x00000000, 0 },
  {  8017, 1496, 49, 239042,  18700.000, 0x00000000, 0 },
  {  9835, 1496, 50, 239042,  19000.000, 0x00000000, 0 },
  {  9836, 1496, 51, 239042,  19300.000, 0x00000000, 0 },
  {  9837, 1496, 52, 239042,  19600.000, 0x00000000, 0 },
  {  9838, 1496, 53, 239042,  19900.000, 0x00000000, 0 },
  {  9839, 1496, 54, 239042,  20200.000, 0x00000000, 0 },
  {  9840, 1496, 55, 239042,  20500.000, 0x00000000, 0 },
  {  9841, 1496, 56, 239042,  20800.000, 0x00000000, 0 },
  {  9842, 1496, 57, 239042,  21100.000, 0x00000000, 0 },
  {  9843, 1496, 58, 239042,  21400.000, 0x00000000, 0 },
  {  9844, 1496, 59, 239042,  21700.000, 0x00000000, 0 },
  {  9845, 1496, 60, 239042,  22000.000, 0x00000000, 0 },
  {  9846, 1496, 61, 239042,  22300.000, 0x00000000, 0 },
  {  9847, 1496, 62, 239042,  22600.000, 0x00000000, 0 },
  {  9848, 1496, 63, 239042,  22900.000, 0x00000000, 0 },
  {  9849, 1496, 64, 239042,  23200.000, 0x00000000, 0 },
  {  9850, 1496, 65, 239042,  23500.000, 0x00000000, 0 },
  {  9851, 1496, 66, 239042,  23800.000, 0x00000000, 0 },
  {  9852, 1496, 67, 239042,  24100.000, 0x00000000, 0 },
  {  9853, 1496, 68, 239042,  24400.000, 0x00000000, 0 },
  {  9854, 1496, 69, 239042,  24700.000, 0x00000000, 0 },
  {  9855, 1496, 70, 239042,  25000.000, 0x00000000, 0 },
  {  9856, 1496, 71, 239042,  25300.000, 0x00000000, 0 },
  {  9857, 1496, 72, 239042,  25600.000, 0x00000000, 0 },
  {  9858, 1496, 73, 239042,  25900.000, 0x00000000, 0 },
  {  9859, 1496, 74, 239042,  26200.000, 0x00000000, 0 },
  {  9860, 1496, 75, 239042,  26500.000, 0x00000000, 0 },
  {  9861, 1496, 76, 239042,  26800.000, 0x00000000, 0 },
  {  9862, 1496, 77, 239042,  27100.000, 0x00000000, 0 },
  {  9863, 1496, 78, 239042,  27400.000, 0x00000000, 0 },
  {  9864, 1496, 79, 239042,  27700.000, 0x00000000, 0 },
  {  9865, 1496, 80, 239042,  28000.000, 0x00000000, 0 },
  {  9866, 1496, 81, 239042,  28300.000, 0x00000000, 0 },
  {  9867, 1496, 82, 239042,  28600.000, 0x00000000, 0 },
  {  9868, 1496, 83, 239042,  28900.000, 0x00000000, 0 },
  {  9869, 1496, 84, 239042,  29200.000, 0x00000000, 0 },
  {  9870, 1496, 85, 239042,  29500.000, 0x00000000, 0 },
  {  9871, 1496, 86, 239042,  29800.000, 0x00000000, 0 },
  {  9872, 1496, 87, 239042,  30100.000, 0x00000000, 0 },
  {  9873, 1496, 88, 239042,  30400.000, 0x00000000, 0 },
  {  9874, 1496, 89, 239042,  30700.000, 0x00000000, 0 },
  {  9875, 1496, 90, 239042,  31000.000, 0x00000000, 0 },
  {  9876, 1496, 91, 239042,  31300.000, 0x00000000, 0 },
  {  9877, 1496, 92, 239042,  31600.000, 0x00000000, 0 },
  {  9878, 1496, 93, 239042,  31900.000, 0x00000000, 0 },
  {  9879, 1496, 94, 239042,  32200.000, 0x00000000, 0 },
  {  9880, 1496, 95, 239042,  32500.000, 0x00000000, 0 },
  {  9881, 1496, 96, 239042,  32800.000, 0x00000000, 0 },
  {  9882, 1496, 97, 239042,  33100.000, 0x00000000, 0 },
  {  9883, 1496, 98, 239042,  33400.000, 0x00000000, 0 },
  {  9884, 1496, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6633, 1497,  0, 238046,    500.000, 0x00000000, 0 },
  {  7401, 1497,  1, 238046,   1000.000, 0x00000000, 0 },
  {  7402, 1497,  2, 238046,   1500.000, 0x00000000, 0 },
  {  7403, 1497,  3, 238046,   2000.000, 0x00000000, 0 },
  {  7404, 1497,  4, 238046,   2500.000, 0x00000000, 0 },
  {  7405, 1497,  5, 238046,   3000.000, 0x00000000, 0 },
  {  7406, 1497,  6, 238046,   3500.000, 0x00000000, 0 },
  {  7407, 1497,  7, 238046,   4000.000, 0x00000000, 0 },
  {  6634, 1498,  0, 238082,      0.000, 0x00000000, 0 },
  {  6635, 1499,  0, 238118,      0.000, 0x00000000, 0 },
  {  6636, 1500,  0, 239042,   4000.000, 0x00000000, 0 },
  {  8019, 1500,  1, 239042,   4300.000, 0x00000000, 0 },
  {  8020, 1500,  2, 239042,   4600.000, 0x00000000, 0 },
  {  8021, 1500,  3, 239042,   4900.000, 0x00000000, 0 },
  {  8022, 1500,  4, 239042,   5200.000, 0x00000000, 0 },
  {  8023, 1500,  5, 239042,   5500.000, 0x00000000, 0 },
  {  8024, 1500,  6, 239042,   5800.000, 0x00000000, 0 },
  {  8025, 1500,  7, 239042,   6100.000, 0x00000000, 0 },
  {  8026, 1500,  8, 239042,   6400.000, 0x00000000, 0 },
  {  8027, 1500,  9, 239042,   6700.000, 0x00000000, 0 },
  {  8028, 1500, 10, 239042,   7000.000, 0x00000000, 0 },
  {  8029, 1500, 11, 239042,   7300.000, 0x00000000, 0 },
  {  8030, 1500, 12, 239042,   7600.000, 0x00000000, 0 },
  {  8031, 1500, 13, 239042,   7900.000, 0x00000000, 0 },
  {  8032, 1500, 14, 239042,   8200.000, 0x00000000, 0 },
  {  8033, 1500, 15, 239042,   8500.000, 0x00000000, 0 },
  {  8034, 1500, 16, 239042,   8800.000, 0x00000000, 0 },
  {  8035, 1500, 17, 239042,   9100.000, 0x00000000, 0 },
  {  8036, 1500, 18, 239042,   9400.000, 0x00000000, 0 },
  {  8037, 1500, 19, 239042,   9700.000, 0x00000000, 0 },
  {  8038, 1500, 20, 239042,  10000.000, 0x00000000, 0 },
  {  8039, 1500, 21, 239042,  10300.000, 0x00000000, 0 },
  {  8040, 1500, 22, 239042,  10600.000, 0x00000000, 0 },
  {  8041, 1500, 23, 239042,  10900.000, 0x00000000, 0 },
  {  8042, 1500, 24, 239042,  11200.000, 0x00000000, 0 },
  {  8043, 1500, 25, 239042,  11500.000, 0x00000000, 0 },
  {  8044, 1500, 26, 239042,  11800.000, 0x00000000, 0 },
  {  8045, 1500, 27, 239042,  12100.000, 0x00000000, 0 },
  {  8046, 1500, 28, 239042,  12400.000, 0x00000000, 0 },
  {  8047, 1500, 29, 239042,  12700.000, 0x00000000, 0 },
  {  8048, 1500, 30, 239042,  13000.000, 0x00000000, 0 },
  {  8049, 1500, 31, 239042,  13300.000, 0x00000000, 0 },
  {  8050, 1500, 32, 239042,  13600.000, 0x00000000, 0 },
  {  8051, 1500, 33, 239042,  13900.000, 0x00000000, 0 },
  {  8052, 1500, 34, 239042,  14200.000, 0x00000000, 0 },
  {  8053, 1500, 35, 239042,  14500.000, 0x00000000, 0 },
  {  8054, 1500, 36, 239042,  14800.000, 0x00000000, 0 },
  {  8055, 1500, 37, 239042,  15100.000, 0x00000000, 0 },
  {  8056, 1500, 38, 239042,  15400.000, 0x00000000, 0 },
  {  8057, 1500, 39, 239042,  15700.000, 0x00000000, 0 },
  {  8058, 1500, 40, 239042,  16000.000, 0x00000000, 0 },
  {  8059, 1500, 41, 239042,  16300.000, 0x00000000, 0 },
  {  8060, 1500, 42, 239042,  16600.000, 0x00000000, 0 },
  {  8061, 1500, 43, 239042,  16900.000, 0x00000000, 0 },
  {  8062, 1500, 44, 239042,  17200.000, 0x00000000, 0 },
  {  8063, 1500, 45, 239042,  17500.000, 0x00000000, 0 },
  {  8064, 1500, 46, 239042,  17800.000, 0x00000000, 0 },
  {  8065, 1500, 47, 239042,  18100.000, 0x00000000, 0 },
  {  8066, 1500, 48, 239042,  18400.000, 0x00000000, 0 },
  {  8067, 1500, 49, 239042,  18700.000, 0x00000000, 0 },
  {  9885, 1500, 50, 239042,  19000.000, 0x00000000, 0 },
  {  9886, 1500, 51, 239042,  19300.000, 0x00000000, 0 },
  {  9887, 1500, 52, 239042,  19600.000, 0x00000000, 0 },
  {  9888, 1500, 53, 239042,  19900.000, 0x00000000, 0 },
  {  9889, 1500, 54, 239042,  20200.000, 0x00000000, 0 },
  {  9890, 1500, 55, 239042,  20500.000, 0x00000000, 0 },
  {  9891, 1500, 56, 239042,  20800.000, 0x00000000, 0 },
  {  9892, 1500, 57, 239042,  21100.000, 0x00000000, 0 },
  {  9893, 1500, 58, 239042,  21400.000, 0x00000000, 0 },
  {  9894, 1500, 59, 239042,  21700.000, 0x00000000, 0 },
  {  9895, 1500, 60, 239042,  22000.000, 0x00000000, 0 },
  {  9896, 1500, 61, 239042,  22300.000, 0x00000000, 0 },
  {  9897, 1500, 62, 239042,  22600.000, 0x00000000, 0 },
  {  9898, 1500, 63, 239042,  22900.000, 0x00000000, 0 },
  {  9899, 1500, 64, 239042,  23200.000, 0x00000000, 0 },
  {  9900, 1500, 65, 239042,  23500.000, 0x00000000, 0 },
  {  9901, 1500, 66, 239042,  23800.000, 0x00000000, 0 },
  {  9902, 1500, 67, 239042,  24100.000, 0x00000000, 0 },
  {  9903, 1500, 68, 239042,  24400.000, 0x00000000, 0 },
  {  9904, 1500, 69, 239042,  24700.000, 0x00000000, 0 },
  {  9905, 1500, 70, 239042,  25000.000, 0x00000000, 0 },
  {  9906, 1500, 71, 239042,  25300.000, 0x00000000, 0 },
  {  9907, 1500, 72, 239042,  25600.000, 0x00000000, 0 },
  {  9908, 1500, 73, 239042,  25900.000, 0x00000000, 0 },
  {  9909, 1500, 74, 239042,  26200.000, 0x00000000, 0 },
  {  9910, 1500, 75, 239042,  26500.000, 0x00000000, 0 },
  {  9911, 1500, 76, 239042,  26800.000, 0x00000000, 0 },
  {  9912, 1500, 77, 239042,  27100.000, 0x00000000, 0 },
  {  9913, 1500, 78, 239042,  27400.000, 0x00000000, 0 },
  {  9914, 1500, 79, 239042,  27700.000, 0x00000000, 0 },
  {  9915, 1500, 80, 239042,  28000.000, 0x00000000, 0 },
  {  9916, 1500, 81, 239042,  28300.000, 0x00000000, 0 },
  {  9917, 1500, 82, 239042,  28600.000, 0x00000000, 0 },
  {  9918, 1500, 83, 239042,  28900.000, 0x00000000, 0 },
  {  9919, 1500, 84, 239042,  29200.000, 0x00000000, 0 },
  {  9920, 1500, 85, 239042,  29500.000, 0x00000000, 0 },
  {  9921, 1500, 86, 239042,  29800.000, 0x00000000, 0 },
  {  9922, 1500, 87, 239042,  30100.000, 0x00000000, 0 },
  {  9923, 1500, 88, 239042,  30400.000, 0x00000000, 0 },
  {  9924, 1500, 89, 239042,  30700.000, 0x00000000, 0 },
  {  9925, 1500, 90, 239042,  31000.000, 0x00000000, 0 },
  {  9926, 1500, 91, 239042,  31300.000, 0x00000000, 0 },
  {  9927, 1500, 92, 239042,  31600.000, 0x00000000, 0 },
  {  9928, 1500, 93, 239042,  31900.000, 0x00000000, 0 },
  {  9929, 1500, 94, 239042,  32200.000, 0x00000000, 0 },
  {  9930, 1500, 95, 239042,  32500.000, 0x00000000, 0 },
  {  9931, 1500, 96, 239042,  32800.000, 0x00000000, 0 },
  {  9932, 1500, 97, 239042,  33100.000, 0x00000000, 0 },
  {  9933, 1500, 98, 239042,  33400.000, 0x00000000, 0 },
  {  9934, 1500, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6637, 1501,  0, 238047,      3.000, 0x00000000, 0 },
  {  7408, 1501,  1, 238047,      6.000, 0x00000000, 0 },
  {  7409, 1501,  2, 238047,      9.000, 0x00000000, 0 },
  {  7410, 1501,  3, 238047,     12.000, 0x00000000, 0 },
  {  7411, 1501,  4, 238047,     15.000, 0x00000000, 0 },
  {  7412, 1501,  5, 238047,     18.000, 0x00000000, 0 },
  {  7413, 1501,  6, 238047,     21.000, 0x00000000, 0 },
  {  7414, 1501,  7, 238047,     24.000, 0x00000000, 0 },
  {  6638, 1502,  0, 238083,      0.000, 0x00000000, 0 },
  {  6639, 1503,  0, 238119,      0.000, 0x00000000, 0 },
  {  6640, 1504,  0, 239042,   4000.000, 0x00000000, 0 },
  {  8069, 1504,  1, 239042,   4300.000, 0x00000000, 0 },
  {  8070, 1504,  2, 239042,   4600.000, 0x00000000, 0 },
  {  8071, 1504,  3, 239042,   4900.000, 0x00000000, 0 },
  {  8072, 1504,  4, 239042,   5200.000, 0x00000000, 0 },
  {  8073, 1504,  5, 239042,   5500.000, 0x00000000, 0 },
  {  8074, 1504,  6, 239042,   5800.000, 0x00000000, 0 },
  {  8075, 1504,  7, 239042,   6100.000, 0x00000000, 0 },
  {  8076, 1504,  8, 239042,   6400.000, 0x00000000, 0 },
  {  8077, 1504,  9, 239042,   6700.000, 0x00000000, 0 },
  {  8078, 1504, 10, 239042,   7000.000, 0x00000000, 0 },
  {  8079, 1504, 11, 239042,   7300.000, 0x00000000, 0 },
  {  8080, 1504, 12, 239042,   7600.000, 0x00000000, 0 },
  {  8081, 1504, 13, 239042,   7900.000, 0x00000000, 0 },
  {  8082, 1504, 14, 239042,   8200.000, 0x00000000, 0 },
  {  8083, 1504, 15, 239042,   8500.000, 0x00000000, 0 },
  {  8084, 1504, 16, 239042,   8800.000, 0x00000000, 0 },
  {  8085, 1504, 17, 239042,   9100.000, 0x00000000, 0 },
  {  8086, 1504, 18, 239042,   9400.000, 0x00000000, 0 },
  {  8087, 1504, 19, 239042,   9700.000, 0x00000000, 0 },
  {  8088, 1504, 20, 239042,  10000.000, 0x00000000, 0 },
  {  8089, 1504, 21, 239042,  10300.000, 0x00000000, 0 },
  {  8090, 1504, 22, 239042,  10600.000, 0x00000000, 0 },
  {  8091, 1504, 23, 239042,  10900.000, 0x00000000, 0 },
  {  8092, 1504, 24, 239042,  11200.000, 0x00000000, 0 },
  {  8093, 1504, 25, 239042,  11500.000, 0x00000000, 0 },
  {  8094, 1504, 26, 239042,  11800.000, 0x00000000, 0 },
  {  8095, 1504, 27, 239042,  12100.000, 0x00000000, 0 },
  {  8096, 1504, 28, 239042,  12400.000, 0x00000000, 0 },
  {  8097, 1504, 29, 239042,  12700.000, 0x00000000, 0 },
  {  8098, 1504, 30, 239042,  13000.000, 0x00000000, 0 },
  {  8099, 1504, 31, 239042,  13300.000, 0x00000000, 0 },
  {  8100, 1504, 32, 239042,  13600.000, 0x00000000, 0 },
  {  8101, 1504, 33, 239042,  13900.000, 0x00000000, 0 },
  {  8102, 1504, 34, 239042,  14200.000, 0x00000000, 0 },
  {  8103, 1504, 35, 239042,  14500.000, 0x00000000, 0 },
  {  8104, 1504, 36, 239042,  14800.000, 0x00000000, 0 },
  {  8105, 1504, 37, 239042,  15100.000, 0x00000000, 0 },
  {  8106, 1504, 38, 239042,  15400.000, 0x00000000, 0 },
  {  8107, 1504, 39, 239042,  15700.000, 0x00000000, 0 },
  {  8108, 1504, 40, 239042,  16000.000, 0x00000000, 0 },
  {  8109, 1504, 41, 239042,  16300.000, 0x00000000, 0 },
  {  8110, 1504, 42, 239042,  16600.000, 0x00000000, 0 },
  {  8111, 1504, 43, 239042,  16900.000, 0x00000000, 0 },
  {  8112, 1504, 44, 239042,  17200.000, 0x00000000, 0 },
  {  8113, 1504, 45, 239042,  17500.000, 0x00000000, 0 },
  {  8114, 1504, 46, 239042,  17800.000, 0x00000000, 0 },
  {  8115, 1504, 47, 239042,  18100.000, 0x00000000, 0 },
  {  8116, 1504, 48, 239042,  18400.000, 0x00000000, 0 },
  {  8117, 1504, 49, 239042,  18700.000, 0x00000000, 0 },
  {  9935, 1504, 50, 239042,  19000.000, 0x00000000, 0 },
  {  9936, 1504, 51, 239042,  19300.000, 0x00000000, 0 },
  {  9937, 1504, 52, 239042,  19600.000, 0x00000000, 0 },
  {  9938, 1504, 53, 239042,  19900.000, 0x00000000, 0 },
  {  9939, 1504, 54, 239042,  20200.000, 0x00000000, 0 },
  {  9940, 1504, 55, 239042,  20500.000, 0x00000000, 0 },
  {  9941, 1504, 56, 239042,  20800.000, 0x00000000, 0 },
  {  9942, 1504, 57, 239042,  21100.000, 0x00000000, 0 },
  {  9943, 1504, 58, 239042,  21400.000, 0x00000000, 0 },
  {  9944, 1504, 59, 239042,  21700.000, 0x00000000, 0 },
  {  9945, 1504, 60, 239042,  22000.000, 0x00000000, 0 },
  {  9946, 1504, 61, 239042,  22300.000, 0x00000000, 0 },
  {  9947, 1504, 62, 239042,  22600.000, 0x00000000, 0 },
  {  9948, 1504, 63, 239042,  22900.000, 0x00000000, 0 },
  {  9949, 1504, 64, 239042,  23200.000, 0x00000000, 0 },
  {  9950, 1504, 65, 239042,  23500.000, 0x00000000, 0 },
  {  9951, 1504, 66, 239042,  23800.000, 0x00000000, 0 },
  {  9952, 1504, 67, 239042,  24100.000, 0x00000000, 0 },
  {  9953, 1504, 68, 239042,  24400.000, 0x00000000, 0 },
  {  9954, 1504, 69, 239042,  24700.000, 0x00000000, 0 },
  {  9955, 1504, 70, 239042,  25000.000, 0x00000000, 0 },
  {  9956, 1504, 71, 239042,  25300.000, 0x00000000, 0 },
  {  9957, 1504, 72, 239042,  25600.000, 0x00000000, 0 },
  {  9958, 1504, 73, 239042,  25900.000, 0x00000000, 0 },
  {  9959, 1504, 74, 239042,  26200.000, 0x00000000, 0 },
  {  9960, 1504, 75, 239042,  26500.000, 0x00000000, 0 },
  {  9961, 1504, 76, 239042,  26800.000, 0x00000000, 0 },
  {  9962, 1504, 77, 239042,  27100.000, 0x00000000, 0 },
  {  9963, 1504, 78, 239042,  27400.000, 0x00000000, 0 },
  {  9964, 1504, 79, 239042,  27700.000, 0x00000000, 0 },
  {  9965, 1504, 80, 239042,  28000.000, 0x00000000, 0 },
  {  9966, 1504, 81, 239042,  28300.000, 0x00000000, 0 },
  {  9967, 1504, 82, 239042,  28600.000, 0x00000000, 0 },
  {  9968, 1504, 83, 239042,  28900.000, 0x00000000, 0 },
  {  9969, 1504, 84, 239042,  29200.000, 0x00000000, 0 },
  {  9970, 1504, 85, 239042,  29500.000, 0x00000000, 0 },
  {  9971, 1504, 86, 239042,  29800.000, 0x00000000, 0 },
  {  9972, 1504, 87, 239042,  30100.000, 0x00000000, 0 },
  {  9973, 1504, 88, 239042,  30400.000, 0x00000000, 0 },
  {  9974, 1504, 89, 239042,  30700.000, 0x00000000, 0 },
  {  9975, 1504, 90, 239042,  31000.000, 0x00000000, 0 },
  {  9976, 1504, 91, 239042,  31300.000, 0x00000000, 0 },
  {  9977, 1504, 92, 239042,  31600.000, 0x00000000, 0 },
  {  9978, 1504, 93, 239042,  31900.000, 0x00000000, 0 },
  {  9979, 1504, 94, 239042,  32200.000, 0x00000000, 0 },
  {  9980, 1504, 95, 239042,  32500.000, 0x00000000, 0 },
  {  9981, 1504, 96, 239042,  32800.000, 0x00000000, 0 },
  {  9982, 1504, 97, 239042,  33100.000, 0x00000000, 0 },
  {  9983, 1504, 98, 239042,  33400.000, 0x00000000, 0 },
  {  9984, 1504, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6641, 1505,  0, 238048,      5.000, 0x00000000, 0 },
  {  6851, 1505,  1, 238048,     10.000, 0x00000000, 0 },
  {  6852, 1505,  2, 238048,     15.000, 0x00000000, 0 },
  {  6853, 1505,  3, 238048,     20.000, 0x00000000, 0 },
  {  6854, 1505,  4, 238048,     25.000, 0x00000000, 0 },
  {  6855, 1505,  5, 238048,     30.000, 0x00000000, 0 },
  {  6856, 1505,  6, 238048,     35.000, 0x00000000, 0 },
  {  6857, 1505,  7, 238048,     40.000, 0x00000000, 0 },
  {  6642, 1506,  0, 238084,      0.000, 0x00000000, 0 },
  {  6643, 1507,  0, 238120,      0.000, 0x00000000, 0 },
  {  6644, 1508,  0, 239042,   4000.000, 0x00000000, 0 },
  {  7780, 1508,  1, 239042,   4300.000, 0x00000000, 0 },
  {  7781, 1508,  2, 239042,   4600.000, 0x00000000, 0 },
  {  7782, 1508,  3, 239042,   4900.000, 0x00000000, 0 },
  {  7783, 1508,  4, 239042,   5200.000, 0x00000000, 0 },
  {  7784, 1508,  5, 239042,   5500.000, 0x00000000, 0 },
  {  7785, 1508,  6, 239042,   5800.000, 0x00000000, 0 },
  {  7786, 1508,  7, 239042,   6100.000, 0x00000000, 0 },
  {  7787, 1508,  8, 239042,   6400.000, 0x00000000, 0 },
  {  7788, 1508,  9, 239042,   6700.000, 0x00000000, 0 },
  {  7789, 1508, 10, 239042,   7000.000, 0x00000000, 0 },
  {  7790, 1508, 11, 239042,   7300.000, 0x00000000, 0 },
  {  7791, 1508, 12, 239042,   7600.000, 0x00000000, 0 },
  {  7792, 1508, 13, 239042,   7900.000, 0x00000000, 0 },
  {  7793, 1508, 14, 239042,   8200.000, 0x00000000, 0 },
  {  7794, 1508, 15, 239042,   8500.000, 0x00000000, 0 },
  {  7795, 1508, 16, 239042,   8800.000, 0x00000000, 0 },
  {  7796, 1508, 17, 239042,   9100.000, 0x00000000, 0 },
  {  7797, 1508, 18, 239042,   9400.000, 0x00000000, 0 },
  {  7798, 1508, 19, 239042,   9700.000, 0x00000000, 0 },
  {  7799, 1508, 20, 239042,  10000.000, 0x00000000, 0 },
  {  7800, 1508, 21, 239042,  10300.000, 0x00000000, 0 },
  {  7801, 1508, 22, 239042,  10600.000, 0x00000000, 0 },
  {  7802, 1508, 23, 239042,  10900.000, 0x00000000, 0 },
  {  7803, 1508, 24, 239042,  11200.000, 0x00000000, 0 },
  {  7804, 1508, 25, 239042,  11500.000, 0x00000000, 0 },
  {  7805, 1508, 26, 239042,  11800.000, 0x00000000, 0 },
  {  7806, 1508, 27, 239042,  12100.000, 0x00000000, 0 },
  {  7807, 1508, 28, 239042,  12400.000, 0x00000000, 0 },
  {  7808, 1508, 29, 239042,  12700.000, 0x00000000, 0 },
  {  7809, 1508, 30, 239042,  13000.000, 0x00000000, 0 },
  {  7810, 1508, 31, 239042,  13300.000, 0x00000000, 0 },
  {  7811, 1508, 32, 239042,  13600.000, 0x00000000, 0 },
  {  7812, 1508, 33, 239042,  13900.000, 0x00000000, 0 },
  {  7813, 1508, 34, 239042,  14200.000, 0x00000000, 0 },
  {  7814, 1508, 35, 239042,  14500.000, 0x00000000, 0 },
  {  7815, 1508, 36, 239042,  14800.000, 0x00000000, 0 },
  {  7816, 1508, 37, 239042,  15100.000, 0x00000000, 0 },
  {  7817, 1508, 38, 239042,  15400.000, 0x00000000, 0 },
  {  7818, 1508, 39, 239042,  15700.000, 0x00000000, 0 },
  {  7819, 1508, 40, 239042,  16000.000, 0x00000000, 0 },
  {  7820, 1508, 41, 239042,  16300.000, 0x00000000, 0 },
  {  7821, 1508, 42, 239042,  16600.000, 0x00000000, 0 },
  {  7822, 1508, 43, 239042,  16900.000, 0x00000000, 0 },
  {  7823, 1508, 44, 239042,  17200.000, 0x00000000, 0 },
  {  7824, 1508, 45, 239042,  17500.000, 0x00000000, 0 },
  {  7825, 1508, 46, 239042,  17800.000, 0x00000000, 0 },
  {  7826, 1508, 47, 239042,  18100.000, 0x00000000, 0 },
  {  7827, 1508, 48, 239042,  18400.000, 0x00000000, 0 },
  {  7828, 1508, 49, 239042,  18700.000, 0x00000000, 0 },
  {  9985, 1508, 50, 239042,  19000.000, 0x00000000, 0 },
  {  9986, 1508, 51, 239042,  19300.000, 0x00000000, 0 },
  {  9987, 1508, 52, 239042,  19600.000, 0x00000000, 0 },
  {  9988, 1508, 53, 239042,  19900.000, 0x00000000, 0 },
  {  9989, 1508, 54, 239042,  20200.000, 0x00000000, 0 },
  {  9990, 1508, 55, 239042,  20500.000, 0x00000000, 0 },
  {  9991, 1508, 56, 239042,  20800.000, 0x00000000, 0 },
  {  9992, 1508, 57, 239042,  21100.000, 0x00000000, 0 },
  {  9993, 1508, 58, 239042,  21400.000, 0x00000000, 0 },
  {  9994, 1508, 59, 239042,  21700.000, 0x00000000, 0 },
  {  9995, 1508, 60, 239042,  22000.000, 0x00000000, 0 },
  {  9996, 1508, 61, 239042,  22300.000, 0x00000000, 0 },
  {  9997, 1508, 62, 239042,  22600.000, 0x00000000, 0 },
  {  9998, 1508, 63, 239042,  22900.000, 0x00000000, 0 },
  {  9999, 1508, 64, 239042,  23200.000, 0x00000000, 0 },
  { 10000, 1508, 65, 239042,  23500.000, 0x00000000, 0 },
  { 10001, 1508, 66, 239042,  23800.000, 0x00000000, 0 },
  { 10002, 1508, 67, 239042,  24100.000, 0x00000000, 0 },
  { 10003, 1508, 68, 239042,  24400.000, 0x00000000, 0 },
  { 10004, 1508, 69, 239042,  24700.000, 0x00000000, 0 },
  { 10005, 1508, 70, 239042,  25000.000, 0x00000000, 0 },
  { 10006, 1508, 71, 239042,  25300.000, 0x00000000, 0 },
  { 10007, 1508, 72, 239042,  25600.000, 0x00000000, 0 },
  { 10008, 1508, 73, 239042,  25900.000, 0x00000000, 0 },
  { 10009, 1508, 74, 239042,  26200.000, 0x00000000, 0 },
  { 10010, 1508, 75, 239042,  26500.000, 0x00000000, 0 },
  { 10011, 1508, 76, 239042,  26800.000, 0x00000000, 0 },
  { 10012, 1508, 77, 239042,  27100.000, 0x00000000, 0 },
  { 10013, 1508, 78, 239042,  27400.000, 0x00000000, 0 },
  { 10014, 1508, 79, 239042,  27700.000, 0x00000000, 0 },
  { 10015, 1508, 80, 239042,  28000.000, 0x00000000, 0 },
  { 10016, 1508, 81, 239042,  28300.000, 0x00000000, 0 },
  { 10017, 1508, 82, 239042,  28600.000, 0x00000000, 0 },
  { 10018, 1508, 83, 239042,  28900.000, 0x00000000, 0 },
  { 10019, 1508, 84, 239042,  29200.000, 0x00000000, 0 },
  { 10020, 1508, 85, 239042,  29500.000, 0x00000000, 0 },
  { 10021, 1508, 86, 239042,  29800.000, 0x00000000, 0 },
  { 10022, 1508, 87, 239042,  30100.000, 0x00000000, 0 },
  { 10023, 1508, 88, 239042,  30400.000, 0x00000000, 0 },
  { 10024, 1508, 89, 239042,  30700.000, 0x00000000, 0 },
  { 10025, 1508, 90, 239042,  31000.000, 0x00000000, 0 },
  { 10026, 1508, 91, 239042,  31300.000, 0x00000000, 0 },
  { 10027, 1508, 92, 239042,  31600.000, 0x00000000, 0 },
  { 10028, 1508, 93, 239042,  31900.000, 0x00000000, 0 },
  { 10029, 1508, 94, 239042,  32200.000, 0x00000000, 0 },
  { 10030, 1508, 95, 239042,  32500.000, 0x00000000, 0 },
  { 10031, 1508, 96, 239042,  32800.000, 0x00000000, 0 },
  { 10032, 1508, 97, 239042,  33100.000, 0x00000000, 0 },
  { 10033, 1508, 98, 239042,  33400.000, 0x00000000, 0 },
  { 10034, 1508, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6645, 1509,  0, 238049,     -1.000, 0x00000000, 0 },
  {  7597, 1509,  1, 238049,     -2.000, 0x00000000, 0 },
  {  7598, 1509,  2, 238049,     -3.000, 0x00000000, 0 },
  {  7599, 1509,  3, 238049,     -4.000, 0x00000000, 0 },
  {  7600, 1509,  4, 238049,     -5.000, 0x00000000, 0 },
  {  7601, 1509,  5, 238049,     -6.000, 0x00000000, 0 },
  {  7602, 1509,  6, 238049,     -7.000, 0x00000000, 0 },
  {  7603, 1509,  7, 238049,     -8.000, 0x00000000, 0 },
  {  6646, 1510,  0, 238085,      0.000, 0x00000000, 0 },
  {  6647, 1511,  0, 238121,      0.000, 0x00000000, 0 },
  {  6648, 1512,  0, 239042,   4000.000, 0x00000000, 0 },
  {  8119, 1512,  1, 239042,   4300.000, 0x00000000, 0 },
  {  8120, 1512,  2, 239042,   4600.000, 0x00000000, 0 },
  {  8121, 1512,  3, 239042,   4900.000, 0x00000000, 0 },
  {  8122, 1512,  4, 239042,   5200.000, 0x00000000, 0 },
  {  8123, 1512,  5, 239042,   5500.000, 0x00000000, 0 },
  {  8124, 1512,  6, 239042,   5800.000, 0x00000000, 0 },
  {  8125, 1512,  7, 239042,   6100.000, 0x00000000, 0 },
  {  8126, 1512,  8, 239042,   6400.000, 0x00000000, 0 },
  {  8127, 1512,  9, 239042,   6700.000, 0x00000000, 0 },
  {  8128, 1512, 10, 239042,   7000.000, 0x00000000, 0 },
  {  8129, 1512, 11, 239042,   7300.000, 0x00000000, 0 },
  {  8130, 1512, 12, 239042,   7600.000, 0x00000000, 0 },
  {  8131, 1512, 13, 239042,   7900.000, 0x00000000, 0 },
  {  8132, 1512, 14, 239042,   8200.000, 0x00000000, 0 },
  {  8133, 1512, 15, 239042,   8500.000, 0x00000000, 0 },
  {  8134, 1512, 16, 239042,   8800.000, 0x00000000, 0 },
  {  8135, 1512, 17, 239042,   9100.000, 0x00000000, 0 },
  {  8136, 1512, 18, 239042,   9400.000, 0x00000000, 0 },
  {  8137, 1512, 19, 239042,   9700.000, 0x00000000, 0 },
  {  8138, 1512, 20, 239042,  10000.000, 0x00000000, 0 },
  {  8139, 1512, 21, 239042,  10300.000, 0x00000000, 0 },
  {  8140, 1512, 22, 239042,  10600.000, 0x00000000, 0 },
  {  8141, 1512, 23, 239042,  10900.000, 0x00000000, 0 },
  {  8142, 1512, 24, 239042,  11200.000, 0x00000000, 0 },
  {  8143, 1512, 25, 239042,  11500.000, 0x00000000, 0 },
  {  8144, 1512, 26, 239042,  11800.000, 0x00000000, 0 },
  {  8145, 1512, 27, 239042,  12100.000, 0x00000000, 0 },
  {  8146, 1512, 28, 239042,  12400.000, 0x00000000, 0 },
  {  8147, 1512, 29, 239042,  12700.000, 0x00000000, 0 },
  {  8148, 1512, 30, 239042,  13000.000, 0x00000000, 0 },
  {  8149, 1512, 31, 239042,  13300.000, 0x00000000, 0 },
  {  8150, 1512, 32, 239042,  13600.000, 0x00000000, 0 },
  {  8151, 1512, 33, 239042,  13900.000, 0x00000000, 0 },
  {  8152, 1512, 34, 239042,  14200.000, 0x00000000, 0 },
  {  8153, 1512, 35, 239042,  14500.000, 0x00000000, 0 },
  {  8154, 1512, 36, 239042,  14800.000, 0x00000000, 0 },
  {  8155, 1512, 37, 239042,  15100.000, 0x00000000, 0 },
  {  8156, 1512, 38, 239042,  15400.000, 0x00000000, 0 },
  {  8157, 1512, 39, 239042,  15700.000, 0x00000000, 0 },
  {  8158, 1512, 40, 239042,  16000.000, 0x00000000, 0 },
  {  8159, 1512, 41, 239042,  16300.000, 0x00000000, 0 },
  {  8160, 1512, 42, 239042,  16600.000, 0x00000000, 0 },
  {  8161, 1512, 43, 239042,  16900.000, 0x00000000, 0 },
  {  8162, 1512, 44, 239042,  17200.000, 0x00000000, 0 },
  {  8163, 1512, 45, 239042,  17500.000, 0x00000000, 0 },
  {  8164, 1512, 46, 239042,  17800.000, 0x00000000, 0 },
  {  8165, 1512, 47, 239042,  18100.000, 0x00000000, 0 },
  {  8166, 1512, 48, 239042,  18400.000, 0x00000000, 0 },
  {  8167, 1512, 49, 239042,  18700.000, 0x00000000, 0 },
  { 10035, 1512, 50, 239042,  19000.000, 0x00000000, 0 },
  { 10036, 1512, 51, 239042,  19300.000, 0x00000000, 0 },
  { 10037, 1512, 52, 239042,  19600.000, 0x00000000, 0 },
  { 10038, 1512, 53, 239042,  19900.000, 0x00000000, 0 },
  { 10039, 1512, 54, 239042,  20200.000, 0x00000000, 0 },
  { 10040, 1512, 55, 239042,  20500.000, 0x00000000, 0 },
  { 10041, 1512, 56, 239042,  20800.000, 0x00000000, 0 },
  { 10042, 1512, 57, 239042,  21100.000, 0x00000000, 0 },
  { 10043, 1512, 58, 239042,  21400.000, 0x00000000, 0 },
  { 10044, 1512, 59, 239042,  21700.000, 0x00000000, 0 },
  { 10045, 1512, 60, 239042,  22000.000, 0x00000000, 0 },
  { 10046, 1512, 61, 239042,  22300.000, 0x00000000, 0 },
  { 10047, 1512, 62, 239042,  22600.000, 0x00000000, 0 },
  { 10048, 1512, 63, 239042,  22900.000, 0x00000000, 0 },
  { 10049, 1512, 64, 239042,  23200.000, 0x00000000, 0 },
  { 10050, 1512, 65, 239042,  23500.000, 0x00000000, 0 },
  { 10051, 1512, 66, 239042,  23800.000, 0x00000000, 0 },
  { 10052, 1512, 67, 239042,  24100.000, 0x00000000, 0 },
  { 10053, 1512, 68, 239042,  24400.000, 0x00000000, 0 },
  { 10054, 1512, 69, 239042,  24700.000, 0x00000000, 0 },
  { 10055, 1512, 70, 239042,  25000.000, 0x00000000, 0 },
  { 10056, 1512, 71, 239042,  25300.000, 0x00000000, 0 },
  { 10057, 1512, 72, 239042,  25600.000, 0x00000000, 0 },
  { 10058, 1512, 73, 239042,  25900.000, 0x00000000, 0 },
  { 10059, 1512, 74, 239042,  26200.000, 0x00000000, 0 },
  { 10060, 1512, 75, 239042,  26500.000, 0x00000000, 0 },
  { 10061, 1512, 76, 239042,  26800.000, 0x00000000, 0 },
  { 10062, 1512, 77, 239042,  27100.000, 0x00000000, 0 },
  { 10063, 1512, 78, 239042,  27400.000, 0x00000000, 0 },
  { 10064, 1512, 79, 239042,  27700.000, 0x00000000, 0 },
  { 10065, 1512, 80, 239042,  28000.000, 0x00000000, 0 },
  { 10066, 1512, 81, 239042,  28300.000, 0x00000000, 0 },
  { 10067, 1512, 82, 239042,  28600.000, 0x00000000, 0 },
  { 10068, 1512, 83, 239042,  28900.000, 0x00000000, 0 },
  { 10069, 1512, 84, 239042,  29200.000, 0x00000000, 0 },
  { 10070, 1512, 85, 239042,  29500.000, 0x00000000, 0 },
  { 10071, 1512, 86, 239042,  29800.000, 0x00000000, 0 },
  { 10072, 1512, 87, 239042,  30100.000, 0x00000000, 0 },
  { 10073, 1512, 88, 239042,  30400.000, 0x00000000, 0 },
  { 10074, 1512, 89, 239042,  30700.000, 0x00000000, 0 },
  { 10075, 1512, 90, 239042,  31000.000, 0x00000000, 0 },
  { 10076, 1512, 91, 239042,  31300.000, 0x00000000, 0 },
  { 10077, 1512, 92, 239042,  31600.000, 0x00000000, 0 },
  { 10078, 1512, 93, 239042,  31900.000, 0x00000000, 0 },
  { 10079, 1512, 94, 239042,  32200.000, 0x00000000, 0 },
  { 10080, 1512, 95, 239042,  32500.000, 0x00000000, 0 },
  { 10081, 1512, 96, 239042,  32800.000, 0x00000000, 0 },
  { 10082, 1512, 97, 239042,  33100.000, 0x00000000, 0 },
  { 10083, 1512, 98, 239042,  33400.000, 0x00000000, 0 },
  { 10084, 1512, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6649, 1513,  0, 238050,   1000.000, 0x00000000, 0 },
  {  7415, 1513,  1, 238050,   2000.000, 0x00000000, 0 },
  {  7416, 1513,  2, 238050,   3000.000, 0x00000000, 0 },
  {  7417, 1513,  3, 238050,   4000.000, 0x00000000, 0 },
  {  7418, 1513,  4, 238050,   5000.000, 0x00000000, 0 },
  {  7419, 1513,  5, 238050,   6000.000, 0x00000000, 0 },
  {  7420, 1513,  6, 238050,   7000.000, 0x00000000, 0 },
  {  7421, 1513,  7, 238050,   8000.000, 0x00000000, 0 },
  {  6650, 1514,  0, 238086,      0.000, 0x00000000, 0 },
  {  6651, 1515,  0, 238122,      0.000, 0x00000000, 0 },
  {  6652, 1516,  0, 239042,   4000.000, 0x00000000, 0 },
  {  8169, 1516,  1, 239042,   4300.000, 0x00000000, 0 },
  {  8170, 1516,  2, 239042,   4600.000, 0x00000000, 0 },
  {  8171, 1516,  3, 239042,   4900.000, 0x00000000, 0 },
  {  8172, 1516,  4, 239042,   5200.000, 0x00000000, 0 },
  {  8173, 1516,  5, 239042,   5500.000, 0x00000000, 0 },
  {  8174, 1516,  6, 239042,   5800.000, 0x00000000, 0 },
  {  8175, 1516,  7, 239042,   6100.000, 0x00000000, 0 },
  {  8176, 1516,  8, 239042,   6400.000, 0x00000000, 0 },
  {  8177, 1516,  9, 239042,   6700.000, 0x00000000, 0 },
  {  8178, 1516, 10, 239042,   7000.000, 0x00000000, 0 },
  {  8179, 1516, 11, 239042,   7300.000, 0x00000000, 0 },
  {  8180, 1516, 12, 239042,   7600.000, 0x00000000, 0 },
  {  8181, 1516, 13, 239042,   7900.000, 0x00000000, 0 },
  {  8182, 1516, 14, 239042,   8200.000, 0x00000000, 0 },
  {  8183, 1516, 15, 239042,   8500.000, 0x00000000, 0 },
  {  8184, 1516, 16, 239042,   8800.000, 0x00000000, 0 },
  {  8185, 1516, 17, 239042,   9100.000, 0x00000000, 0 },
  {  8186, 1516, 18, 239042,   9400.000, 0x00000000, 0 },
  {  8187, 1516, 19, 239042,   9700.000, 0x00000000, 0 },
  {  8188, 1516, 20, 239042,  10000.000, 0x00000000, 0 },
  {  8189, 1516, 21, 239042,  10300.000, 0x00000000, 0 },
  {  8190, 1516, 22, 239042,  10600.000, 0x00000000, 0 },
  {  8191, 1516, 23, 239042,  10900.000, 0x00000000, 0 },
  {  8192, 1516, 24, 239042,  11200.000, 0x00000000, 0 },
  {  8193, 1516, 25, 239042,  11500.000, 0x00000000, 0 },
  {  8194, 1516, 26, 239042,  11800.000, 0x00000000, 0 },
  {  8195, 1516, 27, 239042,  12100.000, 0x00000000, 0 },
  {  8196, 1516, 28, 239042,  12400.000, 0x00000000, 0 },
  {  8197, 1516, 29, 239042,  12700.000, 0x00000000, 0 },
  {  8198, 1516, 30, 239042,  13000.000, 0x00000000, 0 },
  {  8199, 1516, 31, 239042,  13300.000, 0x00000000, 0 },
  {  8200, 1516, 32, 239042,  13600.000, 0x00000000, 0 },
  {  8201, 1516, 33, 239042,  13900.000, 0x00000000, 0 },
  {  8202, 1516, 34, 239042,  14200.000, 0x00000000, 0 },
  {  8203, 1516, 35, 239042,  14500.000, 0x00000000, 0 },
  {  8204, 1516, 36, 239042,  14800.000, 0x00000000, 0 },
  {  8205, 1516, 37, 239042,  15100.000, 0x00000000, 0 },
  {  8206, 1516, 38, 239042,  15400.000, 0x00000000, 0 },
  {  8207, 1516, 39, 239042,  15700.000, 0x00000000, 0 },
  {  8208, 1516, 40, 239042,  16000.000, 0x00000000, 0 },
  {  8209, 1516, 41, 239042,  16300.000, 0x00000000, 0 },
  {  8210, 1516, 42, 239042,  16600.000, 0x00000000, 0 },
  {  8211, 1516, 43, 239042,  16900.000, 0x00000000, 0 },
  {  8212, 1516, 44, 239042,  17200.000, 0x00000000, 0 },
  {  8213, 1516, 45, 239042,  17500.000, 0x00000000, 0 },
  {  8214, 1516, 46, 239042,  17800.000, 0x00000000, 0 },
  {  8215, 1516, 47, 239042,  18100.000, 0x00000000, 0 },
  {  8216, 1516, 48, 239042,  18400.000, 0x00000000, 0 },
  {  8217, 1516, 49, 239042,  18700.000, 0x00000000, 0 },
  { 10085, 1516, 50, 239042,  19000.000, 0x00000000, 0 },
  { 10086, 1516, 51, 239042,  19300.000, 0x00000000, 0 },
  { 10087, 1516, 52, 239042,  19600.000, 0x00000000, 0 },
  { 10088, 1516, 53, 239042,  19900.000, 0x00000000, 0 },
  { 10089, 1516, 54, 239042,  20200.000, 0x00000000, 0 },
  { 10090, 1516, 55, 239042,  20500.000, 0x00000000, 0 },
  { 10091, 1516, 56, 239042,  20800.000, 0x00000000, 0 },
  { 10092, 1516, 57, 239042,  21100.000, 0x00000000, 0 },
  { 10093, 1516, 58, 239042,  21400.000, 0x00000000, 0 },
  { 10094, 1516, 59, 239042,  21700.000, 0x00000000, 0 },
  { 10095, 1516, 60, 239042,  22000.000, 0x00000000, 0 },
  { 10096, 1516, 61, 239042,  22300.000, 0x00000000, 0 },
  { 10097, 1516, 62, 239042,  22600.000, 0x00000000, 0 },
  { 10098, 1516, 63, 239042,  22900.000, 0x00000000, 0 },
  { 10099, 1516, 64, 239042,  23200.000, 0x00000000, 0 },
  { 10100, 1516, 65, 239042,  23500.000, 0x00000000, 0 },
  { 10101, 1516, 66, 239042,  23800.000, 0x00000000, 0 },
  { 10102, 1516, 67, 239042,  24100.000, 0x00000000, 0 },
  { 10103, 1516, 68, 239042,  24400.000, 0x00000000, 0 },
  { 10104, 1516, 69, 239042,  24700.000, 0x00000000, 0 },
  { 10105, 1516, 70, 239042,  25000.000, 0x00000000, 0 },
  { 10106, 1516, 71, 239042,  25300.000, 0x00000000, 0 },
  { 10107, 1516, 72, 239042,  25600.000, 0x00000000, 0 },
  { 10108, 1516, 73, 239042,  25900.000, 0x00000000, 0 },
  { 10109, 1516, 74, 239042,  26200.000, 0x00000000, 0 },
  { 10110, 1516, 75, 239042,  26500.000, 0x00000000, 0 },
  { 10111, 1516, 76, 239042,  26800.000, 0x00000000, 0 },
  { 10112, 1516, 77, 239042,  27100.000, 0x00000000, 0 },
  { 10113, 1516, 78, 239042,  27400.000, 0x00000000, 0 },
  { 10114, 1516, 79, 239042,  27700.000, 0x00000000, 0 },
  { 10115, 1516, 80, 239042,  28000.000, 0x00000000, 0 },
  { 10116, 1516, 81, 239042,  28300.000, 0x00000000, 0 },
  { 10117, 1516, 82, 239042,  28600.000, 0x00000000, 0 },
  { 10118, 1516, 83, 239042,  28900.000, 0x00000000, 0 },
  { 10119, 1516, 84, 239042,  29200.000, 0x00000000, 0 },
  { 10120, 1516, 85, 239042,  29500.000, 0x00000000, 0 },
  { 10121, 1516, 86, 239042,  29800.000, 0x00000000, 0 },
  { 10122, 1516, 87, 239042,  30100.000, 0x00000000, 0 },
  { 10123, 1516, 88, 239042,  30400.000, 0x00000000, 0 },
  { 10124, 1516, 89, 239042,  30700.000, 0x00000000, 0 },
  { 10125, 1516, 90, 239042,  31000.000, 0x00000000, 0 },
  { 10126, 1516, 91, 239042,  31300.000, 0x00000000, 0 },
  { 10127, 1516, 92, 239042,  31600.000, 0x00000000, 0 },
  { 10128, 1516, 93, 239042,  31900.000, 0x00000000, 0 },
  { 10129, 1516, 94, 239042,  32200.000, 0x00000000, 0 },
  { 10130, 1516, 95, 239042,  32500.000, 0x00000000, 0 },
  { 10131, 1516, 96, 239042,  32800.000, 0x00000000, 0 },
  { 10132, 1516, 97, 239042,  33100.000, 0x00000000, 0 },
  { 10133, 1516, 98, 239042,  33400.000, 0x00000000, 0 },
  { 10134, 1516, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6653, 1517,  0, 238051,     -2.000, 0x00000000, 0 },
  {  7422, 1517,  1, 238051,     -4.000, 0x00000000, 0 },
  {  7423, 1517,  2, 238051,     -6.000, 0x00000000, 0 },
  {  7424, 1517,  3, 238051,     -8.000, 0x00000000, 0 },
  {  7425, 1517,  4, 238051,    -10.000, 0x00000000, 0 },
  {  7426, 1517,  5, 238051,    -12.000, 0x00000000, 0 },
  {  7427, 1517,  6, 238051,    -14.000, 0x00000000, 0 },
  {  7428, 1517,  7, 238051,    -16.000, 0x00000000, 0 },
  {  6654, 1518,  0, 238087,      0.000, 0x00000000, 0 },
  {  6655, 1519,  0, 238123,      0.000, 0x00000000, 0 },
  {  6656, 1520,  0, 239042,   4000.000, 0x00000000, 0 },
  {  8219, 1520,  1, 239042,   4300.000, 0x00000000, 0 },
  {  8220, 1520,  2, 239042,   4600.000, 0x00000000, 0 },
  {  8221, 1520,  3, 239042,   4900.000, 0x00000000, 0 },
  {  8222, 1520,  4, 239042,   5200.000, 0x00000000, 0 },
  {  8223, 1520,  5, 239042,   5500.000, 0x00000000, 0 },
  {  8224, 1520,  6, 239042,   5800.000, 0x00000000, 0 },
  {  8225, 1520,  7, 239042,   6100.000, 0x00000000, 0 },
  {  8226, 1520,  8, 239042,   6400.000, 0x00000000, 0 },
  {  8227, 1520,  9, 239042,   6700.000, 0x00000000, 0 },
  {  8228, 1520, 10, 239042,   7000.000, 0x00000000, 0 },
  {  8229, 1520, 11, 239042,   7300.000, 0x00000000, 0 },
  {  8230, 1520, 12, 239042,   7600.000, 0x00000000, 0 },
  {  8231, 1520, 13, 239042,   7900.000, 0x00000000, 0 },
  {  8232, 1520, 14, 239042,   8200.000, 0x00000000, 0 },
  {  8233, 1520, 15, 239042,   8500.000, 0x00000000, 0 },
  {  8234, 1520, 16, 239042,   8800.000, 0x00000000, 0 },
  {  8235, 1520, 17, 239042,   9100.000, 0x00000000, 0 },
  {  8236, 1520, 18, 239042,   9400.000, 0x00000000, 0 },
  {  8237, 1520, 19, 239042,   9700.000, 0x00000000, 0 },
  {  8238, 1520, 20, 239042,  10000.000, 0x00000000, 0 },
  {  8239, 1520, 21, 239042,  10300.000, 0x00000000, 0 },
  {  8240, 1520, 22, 239042,  10600.000, 0x00000000, 0 },
  {  8241, 1520, 23, 239042,  10900.000, 0x00000000, 0 },
  {  8242, 1520, 24, 239042,  11200.000, 0x00000000, 0 },
  {  8243, 1520, 25, 239042,  11500.000, 0x00000000, 0 },
  {  8244, 1520, 26, 239042,  11800.000, 0x00000000, 0 },
  {  8245, 1520, 27, 239042,  12100.000, 0x00000000, 0 },
  {  8246, 1520, 28, 239042,  12400.000, 0x00000000, 0 },
  {  8247, 1520, 29, 239042,  12700.000, 0x00000000, 0 },
  {  8248, 1520, 30, 239042,  13000.000, 0x00000000, 0 },
  {  8249, 1520, 31, 239042,  13300.000, 0x00000000, 0 },
  {  8250, 1520, 32, 239042,  13600.000, 0x00000000, 0 },
  {  8251, 1520, 33, 239042,  13900.000, 0x00000000, 0 },
  {  8252, 1520, 34, 239042,  14200.000, 0x00000000, 0 },
  {  8253, 1520, 35, 239042,  14500.000, 0x00000000, 0 },
  {  8254, 1520, 36, 239042,  14800.000, 0x00000000, 0 },
  {  8255, 1520, 37, 239042,  15100.000, 0x00000000, 0 },
  {  8256, 1520, 38, 239042,  15400.000, 0x00000000, 0 },
  {  8257, 1520, 39, 239042,  15700.000, 0x00000000, 0 },
  {  8258, 1520, 40, 239042,  16000.000, 0x00000000, 0 },
  {  8259, 1520, 41, 239042,  16300.000, 0x00000000, 0 },
  {  8260, 1520, 42, 239042,  16600.000, 0x00000000, 0 },
  {  8261, 1520, 43, 239042,  16900.000, 0x00000000, 0 },
  {  8262, 1520, 44, 239042,  17200.000, 0x00000000, 0 },
  {  8263, 1520, 45, 239042,  17500.000, 0x00000000, 0 },
  {  8264, 1520, 46, 239042,  17800.000, 0x00000000, 0 },
  {  8265, 1520, 47, 239042,  18100.000, 0x00000000, 0 },
  {  8266, 1520, 48, 239042,  18400.000, 0x00000000, 0 },
  {  8267, 1520, 49, 239042,  18700.000, 0x00000000, 0 },
  { 10135, 1520, 50, 239042,  19000.000, 0x00000000, 0 },
  { 10136, 1520, 51, 239042,  19300.000, 0x00000000, 0 },
  { 10137, 1520, 52, 239042,  19600.000, 0x00000000, 0 },
  { 10138, 1520, 53, 239042,  19900.000, 0x00000000, 0 },
  { 10139, 1520, 54, 239042,  20200.000, 0x00000000, 0 },
  { 10140, 1520, 55, 239042,  20500.000, 0x00000000, 0 },
  { 10141, 1520, 56, 239042,  20800.000, 0x00000000, 0 },
  { 10142, 1520, 57, 239042,  21100.000, 0x00000000, 0 },
  { 10143, 1520, 58, 239042,  21400.000, 0x00000000, 0 },
  { 10144, 1520, 59, 239042,  21700.000, 0x00000000, 0 },
  { 10145, 1520, 60, 239042,  22000.000, 0x00000000, 0 },
  { 10146, 1520, 61, 239042,  22300.000, 0x00000000, 0 },
  { 10147, 1520, 62, 239042,  22600.000, 0x00000000, 0 },
  { 10148, 1520, 63, 239042,  22900.000, 0x00000000, 0 },
  { 10149, 1520, 64, 239042,  23200.000, 0x00000000, 0 },
  { 10150, 1520, 65, 239042,  23500.000, 0x00000000, 0 },
  { 10151, 1520, 66, 239042,  23800.000, 0x00000000, 0 },
  { 10152, 1520, 67, 239042,  24100.000, 0x00000000, 0 },
  { 10153, 1520, 68, 239042,  24400.000, 0x00000000, 0 },
  { 10154, 1520, 69, 239042,  24700.000, 0x00000000, 0 },
  { 10155, 1520, 70, 239042,  25000.000, 0x00000000, 0 },
  { 10156, 1520, 71, 239042,  25300.000, 0x00000000, 0 },
  { 10157, 1520, 72, 239042,  25600.000, 0x00000000, 0 },
  { 10158, 1520, 73, 239042,  25900.000, 0x00000000, 0 },
  { 10159, 1520, 74, 239042,  26200.000, 0x00000000, 0 },
  { 10160, 1520, 75, 239042,  26500.000, 0x00000000, 0 },
  { 10161, 1520, 76, 239042,  26800.000, 0x00000000, 0 },
  { 10162, 1520, 77, 239042,  27100.000, 0x00000000, 0 },
  { 10163, 1520, 78, 239042,  27400.000, 0x00000000, 0 },
  { 10164, 1520, 79, 239042,  27700.000, 0x00000000, 0 },
  { 10165, 1520, 80, 239042,  28000.000, 0x00000000, 0 },
  { 10166, 1520, 81, 239042,  28300.000, 0x00000000, 0 },
  { 10167, 1520, 82, 239042,  28600.000, 0x00000000, 0 },
  { 10168, 1520, 83, 239042,  28900.000, 0x00000000, 0 },
  { 10169, 1520, 84, 239042,  29200.000, 0x00000000, 0 },
  { 10170, 1520, 85, 239042,  29500.000, 0x00000000, 0 },
  { 10171, 1520, 86, 239042,  29800.000, 0x00000000, 0 },
  { 10172, 1520, 87, 239042,  30100.000, 0x00000000, 0 },
  { 10173, 1520, 88, 239042,  30400.000, 0x00000000, 0 },
  { 10174, 1520, 89, 239042,  30700.000, 0x00000000, 0 },
  { 10175, 1520, 90, 239042,  31000.000, 0x00000000, 0 },
  { 10176, 1520, 91, 239042,  31300.000, 0x00000000, 0 },
  { 10177, 1520, 92, 239042,  31600.000, 0x00000000, 0 },
  { 10178, 1520, 93, 239042,  31900.000, 0x00000000, 0 },
  { 10179, 1520, 94, 239042,  32200.000, 0x00000000, 0 },
  { 10180, 1520, 95, 239042,  32500.000, 0x00000000, 0 },
  { 10181, 1520, 96, 239042,  32800.000, 0x00000000, 0 },
  { 10182, 1520, 97, 239042,  33100.000, 0x00000000, 0 },
  { 10183, 1520, 98, 239042,  33400.000, 0x00000000, 0 },
  { 10184, 1520, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6657, 1521,  0, 238052,      3.000, 0x00000000, 0 },
  {  7429, 1521,  1, 238052,      6.000, 0x00000000, 0 },
  {  7430, 1521,  2, 238052,      9.000, 0x00000000, 0 },
  {  7431, 1521,  3, 238052,     12.000, 0x00000000, 0 },
  {  7432, 1521,  4, 238052,     15.000, 0x00000000, 0 },
  {  7433, 1521,  5, 238052,     18.000, 0x00000000, 0 },
  {  7434, 1521,  6, 238052,     21.000, 0x00000000, 0 },
  {  7435, 1521,  7, 238052,     24.000, 0x00000000, 0 },
  {  6658, 1522,  0, 238088,      0.000, 0x00000000, 0 },
  {  6659, 1523,  0, 238124,      0.000, 0x00000000, 0 },
  {  6660, 1524,  0, 239042,   4000.000, 0x00000000, 0 },
  {  8269, 1524,  1, 239042,   4300.000, 0x00000000, 0 },
  {  8270, 1524,  2, 239042,   4600.000, 0x00000000, 0 },
  {  8271, 1524,  3, 239042,   4900.000, 0x00000000, 0 },
  {  8272, 1524,  4, 239042,   5200.000, 0x00000000, 0 },
  {  8273, 1524,  5, 239042,   5500.000, 0x00000000, 0 },
  {  8274, 1524,  6, 239042,   5800.000, 0x00000000, 0 },
  {  8275, 1524,  7, 239042,   6100.000, 0x00000000, 0 },
  {  8276, 1524,  8, 239042,   6400.000, 0x00000000, 0 },
  {  8277, 1524,  9, 239042,   6700.000, 0x00000000, 0 },
  {  8278, 1524, 10, 239042,   7000.000, 0x00000000, 0 },
  {  8279, 1524, 11, 239042,   7300.000, 0x00000000, 0 },
  {  8280, 1524, 12, 239042,   7600.000, 0x00000000, 0 },
  {  8281, 1524, 13, 239042,   7900.000, 0x00000000, 0 },
  {  8282, 1524, 14, 239042,   8200.000, 0x00000000, 0 },
  {  8283, 1524, 15, 239042,   8500.000, 0x00000000, 0 },
  {  8284, 1524, 16, 239042,   8800.000, 0x00000000, 0 },
  {  8285, 1524, 17, 239042,   9100.000, 0x00000000, 0 },
  {  8286, 1524, 18, 239042,   9400.000, 0x00000000, 0 },
  {  8287, 1524, 19, 239042,   9700.000, 0x00000000, 0 },
  {  8288, 1524, 20, 239042,  10000.000, 0x00000000, 0 },
  {  8289, 1524, 21, 239042,  10300.000, 0x00000000, 0 },
  {  8290, 1524, 22, 239042,  10600.000, 0x00000000, 0 },
  {  8291, 1524, 23, 239042,  10900.000, 0x00000000, 0 },
  {  8292, 1524, 24, 239042,  11200.000, 0x00000000, 0 },
  {  8293, 1524, 25, 239042,  11500.000, 0x00000000, 0 },
  {  8294, 1524, 26, 239042,  11800.000, 0x00000000, 0 },
  {  8295, 1524, 27, 239042,  12100.000, 0x00000000, 0 },
  {  8296, 1524, 28, 239042,  12400.000, 0x00000000, 0 },
  {  8297, 1524, 29, 239042,  12700.000, 0x00000000, 0 },
  {  8298, 1524, 30, 239042,  13000.000, 0x00000000, 0 },
  {  8299, 1524, 31, 239042,  13300.000, 0x00000000, 0 },
  {  8300, 1524, 32, 239042,  13600.000, 0x00000000, 0 },
  {  8301, 1524, 33, 239042,  13900.000, 0x00000000, 0 },
  {  8302, 1524, 34, 239042,  14200.000, 0x00000000, 0 },
  {  8303, 1524, 35, 239042,  14500.000, 0x00000000, 0 },
  {  8304, 1524, 36, 239042,  14800.000, 0x00000000, 0 },
  {  8305, 1524, 37, 239042,  15100.000, 0x00000000, 0 },
  {  8306, 1524, 38, 239042,  15400.000, 0x00000000, 0 },
  {  8307, 1524, 39, 239042,  15700.000, 0x00000000, 0 },
  {  8308, 1524, 40, 239042,  16000.000, 0x00000000, 0 },
  {  8309, 1524, 41, 239042,  16300.000, 0x00000000, 0 },
  {  8310, 1524, 42, 239042,  16600.000, 0x00000000, 0 },
  {  8311, 1524, 43, 239042,  16900.000, 0x00000000, 0 },
  {  8312, 1524, 44, 239042,  17200.000, 0x00000000, 0 },
  {  8313, 1524, 45, 239042,  17500.000, 0x00000000, 0 },
  {  8314, 1524, 46, 239042,  17800.000, 0x00000000, 0 },
  {  8315, 1524, 47, 239042,  18100.000, 0x00000000, 0 },
  {  8316, 1524, 48, 239042,  18400.000, 0x00000000, 0 },
  {  8317, 1524, 49, 239042,  18700.000, 0x00000000, 0 },
  { 10185, 1524, 50, 239042,  19000.000, 0x00000000, 0 },
  { 10186, 1524, 51, 239042,  19300.000, 0x00000000, 0 },
  { 10187, 1524, 52, 239042,  19600.000, 0x00000000, 0 },
  { 10188, 1524, 53, 239042,  19900.000, 0x00000000, 0 },
  { 10189, 1524, 54, 239042,  20200.000, 0x00000000, 0 },
  { 10190, 1524, 55, 239042,  20500.000, 0x00000000, 0 },
  { 10191, 1524, 56, 239042,  20800.000, 0x00000000, 0 },
  { 10192, 1524, 57, 239042,  21100.000, 0x00000000, 0 },
  { 10193, 1524, 58, 239042,  21400.000, 0x00000000, 0 },
  { 10194, 1524, 59, 239042,  21700.000, 0x00000000, 0 },
  { 10195, 1524, 60, 239042,  22000.000, 0x00000000, 0 },
  { 10196, 1524, 61, 239042,  22300.000, 0x00000000, 0 },
  { 10197, 1524, 62, 239042,  22600.000, 0x00000000, 0 },
  { 10198, 1524, 63, 239042,  22900.000, 0x00000000, 0 },
  { 10199, 1524, 64, 239042,  23200.000, 0x00000000, 0 },
  { 10200, 1524, 65, 239042,  23500.000, 0x00000000, 0 },
  { 10201, 1524, 66, 239042,  23800.000, 0x00000000, 0 },
  { 10202, 1524, 67, 239042,  24100.000, 0x00000000, 0 },
  { 10203, 1524, 68, 239042,  24400.000, 0x00000000, 0 },
  { 10204, 1524, 69, 239042,  24700.000, 0x00000000, 0 },
  { 10205, 1524, 70, 239042,  25000.000, 0x00000000, 0 },
  { 10206, 1524, 71, 239042,  25300.000, 0x00000000, 0 },
  { 10207, 1524, 72, 239042,  25600.000, 0x00000000, 0 },
  { 10208, 1524, 73, 239042,  25900.000, 0x00000000, 0 },
  { 10209, 1524, 74, 239042,  26200.000, 0x00000000, 0 },
  { 10210, 1524, 75, 239042,  26500.000, 0x00000000, 0 },
  { 10211, 1524, 76, 239042,  26800.000, 0x00000000, 0 },
  { 10212, 1524, 77, 239042,  27100.000, 0x00000000, 0 },
  { 10213, 1524, 78, 239042,  27400.000, 0x00000000, 0 },
  { 10214, 1524, 79, 239042,  27700.000, 0x00000000, 0 },
  { 10215, 1524, 80, 239042,  28000.000, 0x00000000, 0 },
  { 10216, 1524, 81, 239042,  28300.000, 0x00000000, 0 },
  { 10217, 1524, 82, 239042,  28600.000, 0x00000000, 0 },
  { 10218, 1524, 83, 239042,  28900.000, 0x00000000, 0 },
  { 10219, 1524, 84, 239042,  29200.000, 0x00000000, 0 },
  { 10220, 1524, 85, 239042,  29500.000, 0x00000000, 0 },
  { 10221, 1524, 86, 239042,  29800.000, 0x00000000, 0 },
  { 10222, 1524, 87, 239042,  30100.000, 0x00000000, 0 },
  { 10223, 1524, 88, 239042,  30400.000, 0x00000000, 0 },
  { 10224, 1524, 89, 239042,  30700.000, 0x00000000, 0 },
  { 10225, 1524, 90, 239042,  31000.000, 0x00000000, 0 },
  { 10226, 1524, 91, 239042,  31300.000, 0x00000000, 0 },
  { 10227, 1524, 92, 239042,  31600.000, 0x00000000, 0 },
  { 10228, 1524, 93, 239042,  31900.000, 0x00000000, 0 },
  { 10229, 1524, 94, 239042,  32200.000, 0x00000000, 0 },
  { 10230, 1524, 95, 239042,  32500.000, 0x00000000, 0 },
  { 10231, 1524, 96, 239042,  32800.000, 0x00000000, 0 },
  { 10232, 1524, 97, 239042,  33100.000, 0x00000000, 0 },
  { 10233, 1524, 98, 239042,  33400.000, 0x00000000, 0 },
  { 10234, 1524, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6661, 1525,  0, 238053,     10.000, 0x00000000, 0 },
  {  7436, 1525,  1, 238053,     20.000, 0x00000000, 0 },
  {  7437, 1525,  2, 238053,     30.000, 0x00000000, 0 },
  {  7438, 1525,  3, 238053,     40.000, 0x00000000, 0 },
  {  7439, 1525,  4, 238053,     50.000, 0x00000000, 0 },
  {  7440, 1525,  5, 238053,     60.000, 0x00000000, 0 },
  {  7441, 1525,  6, 238053,     70.000, 0x00000000, 0 },
  {  7442, 1525,  7, 238053,     80.000, 0x00000000, 0 },
  {  6662, 1526,  0, 238089,      0.000, 0x00000000, 0 },
  {  6663, 1527,  0, 238125,      0.000, 0x00000000, 0 },
  {  6664, 1528,  0, 239042,   4000.000, 0x00000000, 0 },
  {  8319, 1528,  1, 239042,   4300.000, 0x00000000, 0 },
  {  8320, 1528,  2, 239042,   4600.000, 0x00000000, 0 },
  {  8321, 1528,  3, 239042,   4900.000, 0x00000000, 0 },
  {  8322, 1528,  4, 239042,   5200.000, 0x00000000, 0 },
  {  8323, 1528,  5, 239042,   5500.000, 0x00000000, 0 },
  {  8324, 1528,  6, 239042,   5800.000, 0x00000000, 0 },
  {  8325, 1528,  7, 239042,   6100.000, 0x00000000, 0 },
  {  8326, 1528,  8, 239042,   6400.000, 0x00000000, 0 },
  {  8327, 1528,  9, 239042,   6700.000, 0x00000000, 0 },
  {  8328, 1528, 10, 239042,   7000.000, 0x00000000, 0 },
  {  8329, 1528, 11, 239042,   7300.000, 0x00000000, 0 },
  {  8330, 1528, 12, 239042,   7600.000, 0x00000000, 0 },
  {  8331, 1528, 13, 239042,   7900.000, 0x00000000, 0 },
  {  8332, 1528, 14, 239042,   8200.000, 0x00000000, 0 },
  {  8333, 1528, 15, 239042,   8500.000, 0x00000000, 0 },
  {  8334, 1528, 16, 239042,   8800.000, 0x00000000, 0 },
  {  8335, 1528, 17, 239042,   9100.000, 0x00000000, 0 },
  {  8336, 1528, 18, 239042,   9400.000, 0x00000000, 0 },
  {  8337, 1528, 19, 239042,   9700.000, 0x00000000, 0 },
  {  8338, 1528, 20, 239042,  10000.000, 0x00000000, 0 },
  {  8339, 1528, 21, 239042,  10300.000, 0x00000000, 0 },
  {  8340, 1528, 22, 239042,  10600.000, 0x00000000, 0 },
  {  8341, 1528, 23, 239042,  10900.000, 0x00000000, 0 },
  {  8342, 1528, 24, 239042,  11200.000, 0x00000000, 0 },
  {  8343, 1528, 25, 239042,  11500.000, 0x00000000, 0 },
  {  8344, 1528, 26, 239042,  11800.000, 0x00000000, 0 },
  {  8345, 1528, 27, 239042,  12100.000, 0x00000000, 0 },
  {  8346, 1528, 28, 239042,  12400.000, 0x00000000, 0 },
  {  8347, 1528, 29, 239042,  12700.000, 0x00000000, 0 },
  {  8348, 1528, 30, 239042,  13000.000, 0x00000000, 0 },
  {  8349, 1528, 31, 239042,  13300.000, 0x00000000, 0 },
  {  8350, 1528, 32, 239042,  13600.000, 0x00000000, 0 },
  {  8351, 1528, 33, 239042,  13900.000, 0x00000000, 0 },
  {  8352, 1528, 34, 239042,  14200.000, 0x00000000, 0 },
  {  8353, 1528, 35, 239042,  14500.000, 0x00000000, 0 },
  {  8354, 1528, 36, 239042,  14800.000, 0x00000000, 0 },
  {  8355, 1528, 37, 239042,  15100.000, 0x00000000, 0 },
  {  8356, 1528, 38, 239042,  15400.000, 0x00000000, 0 },
  {  8357, 1528, 39, 239042,  15700.000, 0x00000000, 0 },
  {  8358, 1528, 40, 239042,  16000.000, 0x00000000, 0 },
  {  8359, 1528, 41, 239042,  16300.000, 0x00000000, 0 },
  {  8360, 1528, 42, 239042,  16600.000, 0x00000000, 0 },
  {  8361, 1528, 43, 239042,  16900.000, 0x00000000, 0 },
  {  8362, 1528, 44, 239042,  17200.000, 0x00000000, 0 },
  {  8363, 1528, 45, 239042,  17500.000, 0x00000000, 0 },
  {  8364, 1528, 46, 239042,  17800.000, 0x00000000, 0 },
  {  8365, 1528, 47, 239042,  18100.000, 0x00000000, 0 },
  {  8366, 1528, 48, 239042,  18400.000, 0x00000000, 0 },
  {  8367, 1528, 49, 239042,  18700.000, 0x00000000, 0 },
  { 10235, 1528, 50, 239042,  19000.000, 0x00000000, 0 },
  { 10236, 1528, 51, 239042,  19300.000, 0x00000000, 0 },
  { 10237, 1528, 52, 239042,  19600.000, 0x00000000, 0 },
  { 10238, 1528, 53, 239042,  19900.000, 0x00000000, 0 },
  { 10239, 1528, 54, 239042,  20200.000, 0x00000000, 0 },
  { 10240, 1528, 55, 239042,  20500.000, 0x00000000, 0 },
  { 10241, 1528, 56, 239042,  20800.000, 0x00000000, 0 },
  { 10242, 1528, 57, 239042,  21100.000, 0x00000000, 0 },
  { 10243, 1528, 58, 239042,  21400.000, 0x00000000, 0 },
  { 10244, 1528, 59, 239042,  21700.000, 0x00000000, 0 },
  { 10245, 1528, 60, 239042,  22000.000, 0x00000000, 0 },
  { 10246, 1528, 61, 239042,  22300.000, 0x00000000, 0 },
  { 10247, 1528, 62, 239042,  22600.000, 0x00000000, 0 },
  { 10248, 1528, 63, 239042,  22900.000, 0x00000000, 0 },
  { 10249, 1528, 64, 239042,  23200.000, 0x00000000, 0 },
  { 10250, 1528, 65, 239042,  23500.000, 0x00000000, 0 },
  { 10251, 1528, 66, 239042,  23800.000, 0x00000000, 0 },
  { 10252, 1528, 67, 239042,  24100.000, 0x00000000, 0 },
  { 10253, 1528, 68, 239042,  24400.000, 0x00000000, 0 },
  { 10254, 1528, 69, 239042,  24700.000, 0x00000000, 0 },
  { 10255, 1528, 70, 239042,  25000.000, 0x00000000, 0 },
  { 10256, 1528, 71, 239042,  25300.000, 0x00000000, 0 },
  { 10257, 1528, 72, 239042,  25600.000, 0x00000000, 0 },
  { 10258, 1528, 73, 239042,  25900.000, 0x00000000, 0 },
  { 10259, 1528, 74, 239042,  26200.000, 0x00000000, 0 },
  { 10260, 1528, 75, 239042,  26500.000, 0x00000000, 0 },
  { 10261, 1528, 76, 239042,  26800.000, 0x00000000, 0 },
  { 10262, 1528, 77, 239042,  27100.000, 0x00000000, 0 },
  { 10263, 1528, 78, 239042,  27400.000, 0x00000000, 0 },
  { 10264, 1528, 79, 239042,  27700.000, 0x00000000, 0 },
  { 10265, 1528, 80, 239042,  28000.000, 0x00000000, 0 },
  { 10266, 1528, 81, 239042,  28300.000, 0x00000000, 0 },
  { 10267, 1528, 82, 239042,  28600.000, 0x00000000, 0 },
  { 10268, 1528, 83, 239042,  28900.000, 0x00000000, 0 },
  { 10269, 1528, 84, 239042,  29200.000, 0x00000000, 0 },
  { 10270, 1528, 85, 239042,  29500.000, 0x00000000, 0 },
  { 10271, 1528, 86, 239042,  29800.000, 0x00000000, 0 },
  { 10272, 1528, 87, 239042,  30100.000, 0x00000000, 0 },
  { 10273, 1528, 88, 239042,  30400.000, 0x00000000, 0 },
  { 10274, 1528, 89, 239042,  30700.000, 0x00000000, 0 },
  { 10275, 1528, 90, 239042,  31000.000, 0x00000000, 0 },
  { 10276, 1528, 91, 239042,  31300.000, 0x00000000, 0 },
  { 10277, 1528, 92, 239042,  31600.000, 0x00000000, 0 },
  { 10278, 1528, 93, 239042,  31900.000, 0x00000000, 0 },
  { 10279, 1528, 94, 239042,  32200.000, 0x00000000, 0 },
  { 10280, 1528, 95, 239042,  32500.000, 0x00000000, 0 },
  { 10281, 1528, 96, 239042,  32800.000, 0x00000000, 0 },
  { 10282, 1528, 97, 239042,  33100.000, 0x00000000, 0 },
  { 10283, 1528, 98, 239042,  33400.000, 0x00000000, 0 },
  { 10284, 1528, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6665, 1529,  0, 238054,      3.000, 0x00000000, 0 },
  {  7443, 1529,  1, 238054,      6.000, 0x00000000, 0 },
  {  7444, 1529,  2, 238054,      9.000, 0x00000000, 0 },
  {  7445, 1529,  3, 238054,     12.000, 0x00000000, 0 },
  {  7446, 1529,  4, 238054,     15.000, 0x00000000, 0 },
  {  7447, 1529,  5, 238054,     18.000, 0x00000000, 0 },
  {  7448, 1529,  6, 238054,     21.000, 0x00000000, 0 },
  {  7449, 1529,  7, 238054,     24.000, 0x00000000, 0 },
  {  6666, 1530,  0, 238090,      0.000, 0x00000000, 0 },
  {  6667, 1531,  0, 238126,      0.000, 0x00000000, 0 },
  {  6668, 1532,  0, 239042,   4000.000, 0x00000000, 0 },
  {  8369, 1532,  1, 239042,   4300.000, 0x00000000, 0 },
  {  8370, 1532,  2, 239042,   4600.000, 0x00000000, 0 },
  {  8371, 1532,  3, 239042,   4900.000, 0x00000000, 0 },
  {  8372, 1532,  4, 239042,   5200.000, 0x00000000, 0 },
  {  8373, 1532,  5, 239042,   5500.000, 0x00000000, 0 },
  {  8374, 1532,  6, 239042,   5800.000, 0x00000000, 0 },
  {  8375, 1532,  7, 239042,   6100.000, 0x00000000, 0 },
  {  8376, 1532,  8, 239042,   6400.000, 0x00000000, 0 },
  {  8377, 1532,  9, 239042,   6700.000, 0x00000000, 0 },
  {  8378, 1532, 10, 239042,   7000.000, 0x00000000, 0 },
  {  8379, 1532, 11, 239042,   7300.000, 0x00000000, 0 },
  {  8380, 1532, 12, 239042,   7600.000, 0x00000000, 0 },
  {  8381, 1532, 13, 239042,   7900.000, 0x00000000, 0 },
  {  8382, 1532, 14, 239042,   8200.000, 0x00000000, 0 },
  {  8383, 1532, 15, 239042,   8500.000, 0x00000000, 0 },
  {  8384, 1532, 16, 239042,   8800.000, 0x00000000, 0 },
  {  8385, 1532, 17, 239042,   9100.000, 0x00000000, 0 },
  {  8386, 1532, 18, 239042,   9400.000, 0x00000000, 0 },
  {  8387, 1532, 19, 239042,   9700.000, 0x00000000, 0 },
  {  8388, 1532, 20, 239042,  10000.000, 0x00000000, 0 },
  {  8389, 1532, 21, 239042,  10300.000, 0x00000000, 0 },
  {  8390, 1532, 22, 239042,  10600.000, 0x00000000, 0 },
  {  8391, 1532, 23, 239042,  10900.000, 0x00000000, 0 },
  {  8392, 1532, 24, 239042,  11200.000, 0x00000000, 0 },
  {  8393, 1532, 25, 239042,  11500.000, 0x00000000, 0 },
  {  8394, 1532, 26, 239042,  11800.000, 0x00000000, 0 },
  {  8395, 1532, 27, 239042,  12100.000, 0x00000000, 0 },
  {  8396, 1532, 28, 239042,  12400.000, 0x00000000, 0 },
  {  8397, 1532, 29, 239042,  12700.000, 0x00000000, 0 },
  {  8398, 1532, 30, 239042,  13000.000, 0x00000000, 0 },
  {  8399, 1532, 31, 239042,  13300.000, 0x00000000, 0 },
  {  8400, 1532, 32, 239042,  13600.000, 0x00000000, 0 },
  {  8401, 1532, 33, 239042,  13900.000, 0x00000000, 0 },
  {  8402, 1532, 34, 239042,  14200.000, 0x00000000, 0 },
  {  8403, 1532, 35, 239042,  14500.000, 0x00000000, 0 },
  {  8404, 1532, 36, 239042,  14800.000, 0x00000000, 0 },
  {  8405, 1532, 37, 239042,  15100.000, 0x00000000, 0 },
  {  8406, 1532, 38, 239042,  15400.000, 0x00000000, 0 },
  {  8407, 1532, 39, 239042,  15700.000, 0x00000000, 0 },
  {  8408, 1532, 40, 239042,  16000.000, 0x00000000, 0 },
  {  8409, 1532, 41, 239042,  16300.000, 0x00000000, 0 },
  {  8410, 1532, 42, 239042,  16600.000, 0x00000000, 0 },
  {  8411, 1532, 43, 239042,  16900.000, 0x00000000, 0 },
  {  8412, 1532, 44, 239042,  17200.000, 0x00000000, 0 },
  {  8413, 1532, 45, 239042,  17500.000, 0x00000000, 0 },
  {  8414, 1532, 46, 239042,  17800.000, 0x00000000, 0 },
  {  8415, 1532, 47, 239042,  18100.000, 0x00000000, 0 },
  {  8416, 1532, 48, 239042,  18400.000, 0x00000000, 0 },
  {  8417, 1532, 49, 239042,  18700.000, 0x00000000, 0 },
  { 10285, 1532, 50, 239042,  19000.000, 0x00000000, 0 },
  { 10286, 1532, 51, 239042,  19300.000, 0x00000000, 0 },
  { 10287, 1532, 52, 239042,  19600.000, 0x00000000, 0 },
  { 10288, 1532, 53, 239042,  19900.000, 0x00000000, 0 },
  { 10289, 1532, 54, 239042,  20200.000, 0x00000000, 0 },
  { 10290, 1532, 55, 239042,  20500.000, 0x00000000, 0 },
  { 10291, 1532, 56, 239042,  20800.000, 0x00000000, 0 },
  { 10292, 1532, 57, 239042,  21100.000, 0x00000000, 0 },
  { 10293, 1532, 58, 239042,  21400.000, 0x00000000, 0 },
  { 10294, 1532, 59, 239042,  21700.000, 0x00000000, 0 },
  { 10295, 1532, 60, 239042,  22000.000, 0x00000000, 0 },
  { 10296, 1532, 61, 239042,  22300.000, 0x00000000, 0 },
  { 10297, 1532, 62, 239042,  22600.000, 0x00000000, 0 },
  { 10298, 1532, 63, 239042,  22900.000, 0x00000000, 0 },
  { 10299, 1532, 64, 239042,  23200.000, 0x00000000, 0 },
  { 10300, 1532, 65, 239042,  23500.000, 0x00000000, 0 },
  { 10301, 1532, 66, 239042,  23800.000, 0x00000000, 0 },
  { 10302, 1532, 67, 239042,  24100.000, 0x00000000, 0 },
  { 10303, 1532, 68, 239042,  24400.000, 0x00000000, 0 },
  { 10304, 1532, 69, 239042,  24700.000, 0x00000000, 0 },
  { 10305, 1532, 70, 239042,  25000.000, 0x00000000, 0 },
  { 10306, 1532, 71, 239042,  25300.000, 0x00000000, 0 },
  { 10307, 1532, 72, 239042,  25600.000, 0x00000000, 0 },
  { 10308, 1532, 73, 239042,  25900.000, 0x00000000, 0 },
  { 10309, 1532, 74, 239042,  26200.000, 0x00000000, 0 },
  { 10310, 1532, 75, 239042,  26500.000, 0x00000000, 0 },
  { 10311, 1532, 76, 239042,  26800.000, 0x00000000, 0 },
  { 10312, 1532, 77, 239042,  27100.000, 0x00000000, 0 },
  { 10313, 1532, 78, 239042,  27400.000, 0x00000000, 0 },
  { 10314, 1532, 79, 239042,  27700.000, 0x00000000, 0 },
  { 10315, 1532, 80, 239042,  28000.000, 0x00000000, 0 },
  { 10316, 1532, 81, 239042,  28300.000, 0x00000000, 0 },
  { 10317, 1532, 82, 239042,  28600.000, 0x00000000, 0 },
  { 10318, 1532, 83, 239042,  28900.000, 0x00000000, 0 },
  { 10319, 1532, 84, 239042,  29200.000, 0x00000000, 0 },
  { 10320, 1532, 85, 239042,  29500.000, 0x00000000, 0 },
  { 10321, 1532, 86, 239042,  29800.000, 0x00000000, 0 },
  { 10322, 1532, 87, 239042,  30100.000, 0x00000000, 0 },
  { 10323, 1532, 88, 239042,  30400.000, 0x00000000, 0 },
  { 10324, 1532, 89, 239042,  30700.000, 0x00000000, 0 },
  { 10325, 1532, 90, 239042,  31000.000, 0x00000000, 0 },
  { 10326, 1532, 91, 239042,  31300.000, 0x00000000, 0 },
  { 10327, 1532, 92, 239042,  31600.000, 0x00000000, 0 },
  { 10328, 1532, 93, 239042,  31900.000, 0x00000000, 0 },
  { 10329, 1532, 94, 239042,  32200.000, 0x00000000, 0 },
  { 10330, 1532, 95, 239042,  32500.000, 0x00000000, 0 },
  { 10331, 1532, 96, 239042,  32800.000, 0x00000000, 0 },
  { 10332, 1532, 97, 239042,  33100.000, 0x00000000, 0 },
  { 10333, 1532, 98, 239042,  33400.000, 0x00000000, 0 },
  { 10334, 1532, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6669, 1533,  0, 238055,   1000.000, 0x00000000, 0 },
  {  7450, 1533,  1, 238055,   2000.000, 0x00000000, 0 },
  {  7451, 1533,  2, 238055,   3000.000, 0x00000000, 0 },
  {  7452, 1533,  3, 238055,   4000.000, 0x00000000, 0 },
  {  7453, 1533,  4, 238055,   5000.000, 0x00000000, 0 },
  {  7454, 1533,  5, 238055,   6000.000, 0x00000000, 0 },
  {  7455, 1533,  6, 238055,   7000.000, 0x00000000, 0 },
  {  7456, 1533,  7, 238055,   8000.000, 0x00000000, 0 },
  {  6670, 1534,  0, 238091,      0.000, 0x00000000, 0 },
  {  6671, 1535,  0, 238127,      0.000, 0x00000000, 0 },
  {  6672, 1536,  0, 239042,   4000.000, 0x00000000, 0 },
  {  7723, 1536,  1, 239042,   4300.000, 0x00000000, 0 },
  {  7724, 1536,  2, 239042,   4600.000, 0x00000000, 0 },
  {  7725, 1536,  3, 239042,   4900.000, 0x00000000, 0 },
  {  7726, 1536,  4, 239042,   5200.000, 0x00000000, 0 },
  {  7727, 1536,  5, 239042,   5500.000, 0x00000000, 0 },
  {  7728, 1536,  6, 239042,   5800.000, 0x00000000, 0 },
  {  7729, 1536,  7, 239042,   6100.000, 0x00000000, 0 },
  {  7730, 1536,  8, 239042,   6400.000, 0x00000000, 0 },
  {  7731, 1536,  9, 239042,   6700.000, 0x00000000, 0 },
  {  7732, 1536, 10, 239042,   7000.000, 0x00000000, 0 },
  {  7733, 1536, 11, 239042,   7300.000, 0x00000000, 0 },
  {  7734, 1536, 12, 239042,   7600.000, 0x00000000, 0 },
  {  7735, 1536, 13, 239042,   7900.000, 0x00000000, 0 },
  {  7736, 1536, 14, 239042,   8200.000, 0x00000000, 0 },
  {  7737, 1536, 15, 239042,   8500.000, 0x00000000, 0 },
  {  7738, 1536, 16, 239042,   8800.000, 0x00000000, 0 },
  {  7739, 1536, 17, 239042,   9100.000, 0x00000000, 0 },
  {  7740, 1536, 18, 239042,   9400.000, 0x00000000, 0 },
  {  7741, 1536, 19, 239042,   9700.000, 0x00000000, 0 },
  {  7829, 1536, 20, 239042,  10000.000, 0x00000000, 0 },
  {  7830, 1536, 21, 239042,  10300.000, 0x00000000, 0 },
  {  7831, 1536, 22, 239042,  10600.000, 0x00000000, 0 },
  {  7832, 1536, 23, 239042,  10900.000, 0x00000000, 0 },
  {  7833, 1536, 24, 239042,  11200.000, 0x00000000, 0 },
  {  7834, 1536, 25, 239042,  11500.000, 0x00000000, 0 },
  {  7835, 1536, 26, 239042,  11800.000, 0x00000000, 0 },
  {  7836, 1536, 27, 239042,  12100.000, 0x00000000, 0 },
  {  7837, 1536, 28, 239042,  12400.000, 0x00000000, 0 },
  {  7838, 1536, 29, 239042,  12700.000, 0x00000000, 0 },
  {  7839, 1536, 30, 239042,  13000.000, 0x00000000, 0 },
  {  7840, 1536, 31, 239042,  13300.000, 0x00000000, 0 },
  {  7841, 1536, 32, 239042,  13600.000, 0x00000000, 0 },
  {  7842, 1536, 33, 239042,  13900.000, 0x00000000, 0 },
  {  7843, 1536, 34, 239042,  14200.000, 0x00000000, 0 },
  {  7844, 1536, 35, 239042,  14500.000, 0x00000000, 0 },
  {  7845, 1536, 36, 239042,  14800.000, 0x00000000, 0 },
  {  7846, 1536, 37, 239042,  15100.000, 0x00000000, 0 },
  {  7847, 1536, 38, 239042,  15400.000, 0x00000000, 0 },
  {  7848, 1536, 39, 239042,  15700.000, 0x00000000, 0 },
  {  7849, 1536, 40, 239042,  16000.000, 0x00000000, 0 },
  {  7850, 1536, 41, 239042,  16300.000, 0x00000000, 0 },
  {  7851, 1536, 42, 239042,  16600.000, 0x00000000, 0 },
  {  7852, 1536, 43, 239042,  16900.000, 0x00000000, 0 },
  {  7853, 1536, 44, 239042,  17200.000, 0x00000000, 0 },
  {  7854, 1536, 45, 239042,  17500.000, 0x00000000, 0 },
  {  7855, 1536, 46, 239042,  17800.000, 0x00000000, 0 },
  {  7856, 1536, 47, 239042,  18100.000, 0x00000000, 0 },
  {  7857, 1536, 48, 239042,  18400.000, 0x00000000, 0 },
  {  7858, 1536, 49, 239042,  18700.000, 0x00000000, 0 },
  { 10335, 1536, 50, 239042,  19000.000, 0x00000000, 0 },
  { 10336, 1536, 51, 239042,  19300.000, 0x00000000, 0 },
  { 10337, 1536, 52, 239042,  19600.000, 0x00000000, 0 },
  { 10338, 1536, 53, 239042,  19900.000, 0x00000000, 0 },
  { 10339, 1536, 54, 239042,  20200.000, 0x00000000, 0 },
  { 10340, 1536, 55, 239042,  20500.000, 0x00000000, 0 },
  { 10341, 1536, 56, 239042,  20800.000, 0x00000000, 0 },
  { 10342, 1536, 57, 239042,  21100.000, 0x00000000, 0 },
  { 10343, 1536, 58, 239042,  21400.000, 0x00000000, 0 },
  { 10344, 1536, 59, 239042,  21700.000, 0x00000000, 0 },
  { 10345, 1536, 60, 239042,  22000.000, 0x00000000, 0 },
  { 10346, 1536, 61, 239042,  22300.000, 0x00000000, 0 },
  { 10347, 1536, 62, 239042,  22600.000, 0x00000000, 0 },
  { 10348, 1536, 63, 239042,  22900.000, 0x00000000, 0 },
  { 10349, 1536, 64, 239042,  23200.000, 0x00000000, 0 },
  { 10350, 1536, 65, 239042,  23500.000, 0x00000000, 0 },
  { 10351, 1536, 66, 239042,  23800.000, 0x00000000, 0 },
  { 10352, 1536, 67, 239042,  24100.000, 0x00000000, 0 },
  { 10353, 1536, 68, 239042,  24400.000, 0x00000000, 0 },
  { 10354, 1536, 69, 239042,  24700.000, 0x00000000, 0 },
  { 10355, 1536, 70, 239042,  25000.000, 0x00000000, 0 },
  { 10356, 1536, 71, 239042,  25300.000, 0x00000000, 0 },
  { 10357, 1536, 72, 239042,  25600.000, 0x00000000, 0 },
  { 10358, 1536, 73, 239042,  25900.000, 0x00000000, 0 },
  { 10359, 1536, 74, 239042,  26200.000, 0x00000000, 0 },
  { 10360, 1536, 75, 239042,  26500.000, 0x00000000, 0 },
  { 10361, 1536, 76, 239042,  26800.000, 0x00000000, 0 },
  { 10362, 1536, 77, 239042,  27100.000, 0x00000000, 0 },
  { 10363, 1536, 78, 239042,  27400.000, 0x00000000, 0 },
  { 10364, 1536, 79, 239042,  27700.000, 0x00000000, 0 },
  { 10365, 1536, 80, 239042,  28000.000, 0x00000000, 0 },
  { 10366, 1536, 81, 239042,  28300.000, 0x00000000, 0 },
  { 10367, 1536, 82, 239042,  28600.000, 0x00000000, 0 },
  { 10368, 1536, 83, 239042,  28900.000, 0x00000000, 0 },
  { 10369, 1536, 84, 239042,  29200.000, 0x00000000, 0 },
  { 10370, 1536, 85, 239042,  29500.000, 0x00000000, 0 },
  { 10371, 1536, 86, 239042,  29800.000, 0x00000000, 0 },
  { 10372, 1536, 87, 239042,  30100.000, 0x00000000, 0 },
  { 10373, 1536, 88, 239042,  30400.000, 0x00000000, 0 },
  { 10374, 1536, 89, 239042,  30700.000, 0x00000000, 0 },
  { 10375, 1536, 90, 239042,  31000.000, 0x00000000, 0 },
  { 10376, 1536, 91, 239042,  31300.000, 0x00000000, 0 },
  { 10377, 1536, 92, 239042,  31600.000, 0x00000000, 0 },
  { 10378, 1536, 93, 239042,  31900.000, 0x00000000, 0 },
  { 10379, 1536, 94, 239042,  32200.000, 0x00000000, 0 },
  { 10380, 1536, 95, 239042,  32500.000, 0x00000000, 0 },
  { 10381, 1536, 96, 239042,  32800.000, 0x00000000, 0 },
  { 10382, 1536, 97, 239042,  33100.000, 0x00000000, 0 },
  { 10383, 1536, 98, 239042,  33400.000, 0x00000000, 0 },
  { 10384, 1536, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6673, 1537,  0, 238056,      3.000, 0x00000000, 0 },
  {  7611, 1537,  1, 238056,      6.000, 0x00000000, 0 },
  {  7612, 1537,  2, 238056,      9.000, 0x00000000, 0 },
  {  7613, 1537,  3, 238056,     12.000, 0x00000000, 0 },
  {  7614, 1537,  4, 238056,     15.000, 0x00000000, 0 },
  {  7615, 1537,  5, 238056,     18.000, 0x00000000, 0 },
  {  7616, 1537,  6, 238056,     21.000, 0x00000000, 0 },
  {  7617, 1537,  7, 238056,     24.000, 0x00000000, 0 },
  {  6674, 1538,  0, 238092,      0.000, 0x00000000, 0 },
  {  6675, 1539,  0, 238128,      0.000, 0x00000000, 0 },
  {  6676, 1540,  0, 239042,   4000.000, 0x00000000, 0 },
  {  8419, 1540,  1, 239042,   4300.000, 0x00000000, 0 },
  {  8420, 1540,  2, 239042,   4600.000, 0x00000000, 0 },
  {  8421, 1540,  3, 239042,   4900.000, 0x00000000, 0 },
  {  8422, 1540,  4, 239042,   5200.000, 0x00000000, 0 },
  {  8423, 1540,  5, 239042,   5500.000, 0x00000000, 0 },
  {  8424, 1540,  6, 239042,   5800.000, 0x00000000, 0 },
  {  8425, 1540,  7, 239042,   6100.000, 0x00000000, 0 },
  {  8426, 1540,  8, 239042,   6400.000, 0x00000000, 0 },
  {  8427, 1540,  9, 239042,   6700.000, 0x00000000, 0 },
  {  8428, 1540, 10, 239042,   7000.000, 0x00000000, 0 },
  {  8429, 1540, 11, 239042,   7300.000, 0x00000000, 0 },
  {  8430, 1540, 12, 239042,   7600.000, 0x00000000, 0 },
  {  8431, 1540, 13, 239042,   7900.000, 0x00000000, 0 },
  {  8432, 1540, 14, 239042,   8200.000, 0x00000000, 0 },
  {  8433, 1540, 15, 239042,   8500.000, 0x00000000, 0 },
  {  8434, 1540, 16, 239042,   8800.000, 0x00000000, 0 },
  {  8435, 1540, 17, 239042,   9100.000, 0x00000000, 0 },
  {  8436, 1540, 18, 239042,   9400.000, 0x00000000, 0 },
  {  8437, 1540, 19, 239042,   9700.000, 0x00000000, 0 },
  {  8438, 1540, 20, 239042,  10000.000, 0x00000000, 0 },
  {  8439, 1540, 21, 239042,  10300.000, 0x00000000, 0 },
  {  8440, 1540, 22, 239042,  10600.000, 0x00000000, 0 },
  {  8441, 1540, 23, 239042,  10900.000, 0x00000000, 0 },
  {  8442, 1540, 24, 239042,  11200.000, 0x00000000, 0 },
  {  8443, 1540, 25, 239042,  11500.000, 0x00000000, 0 },
  {  8444, 1540, 26, 239042,  11800.000, 0x00000000, 0 },
  {  8445, 1540, 27, 239042,  12100.000, 0x00000000, 0 },
  {  8446, 1540, 28, 239042,  12400.000, 0x00000000, 0 },
  {  8447, 1540, 29, 239042,  12700.000, 0x00000000, 0 },
  {  8448, 1540, 30, 239042,  13000.000, 0x00000000, 0 },
  {  8449, 1540, 31, 239042,  13300.000, 0x00000000, 0 },
  {  8450, 1540, 32, 239042,  13600.000, 0x00000000, 0 },
  {  8451, 1540, 33, 239042,  13900.000, 0x00000000, 0 },
  {  8452, 1540, 34, 239042,  14200.000, 0x00000000, 0 },
  {  8453, 1540, 35, 239042,  14500.000, 0x00000000, 0 },
  {  8454, 1540, 36, 239042,  14800.000, 0x00000000, 0 },
  {  8455, 1540, 37, 239042,  15100.000, 0x00000000, 0 },
  {  8456, 1540, 38, 239042,  15400.000, 0x00000000, 0 },
  {  8457, 1540, 39, 239042,  15700.000, 0x00000000, 0 },
  {  8458, 1540, 40, 239042,  16000.000, 0x00000000, 0 },
  {  8459, 1540, 41, 239042,  16300.000, 0x00000000, 0 },
  {  8460, 1540, 42, 239042,  16600.000, 0x00000000, 0 },
  {  8461, 1540, 43, 239042,  16900.000, 0x00000000, 0 },
  {  8462, 1540, 44, 239042,  17200.000, 0x00000000, 0 },
  {  8463, 1540, 45, 239042,  17500.000, 0x00000000, 0 },
  {  8464, 1540, 46, 239042,  17800.000, 0x00000000, 0 },
  {  8465, 1540, 47, 239042,  18100.000, 0x00000000, 0 },
  {  8466, 1540, 48, 239042,  18400.000, 0x00000000, 0 },
  {  8467, 1540, 49, 239042,  18700.000, 0x00000000, 0 },
  {  9635, 1540, 50, 239042,  19000.000, 0x00000000, 0 },
  {  9636, 1540, 51, 239042,  19300.000, 0x00000000, 0 },
  {  9637, 1540, 52, 239042,  19600.000, 0x00000000, 0 },
  {  9638, 1540, 53, 239042,  19900.000, 0x00000000, 0 },
  {  9639, 1540, 54, 239042,  20200.000, 0x00000000, 0 },
  {  9640, 1540, 55, 239042,  20500.000, 0x00000000, 0 },
  {  9641, 1540, 56, 239042,  20800.000, 0x00000000, 0 },
  {  9642, 1540, 57, 239042,  21100.000, 0x00000000, 0 },
  {  9643, 1540, 58, 239042,  21400.000, 0x00000000, 0 },
  {  9644, 1540, 59, 239042,  21700.000, 0x00000000, 0 },
  {  9645, 1540, 60, 239042,  22000.000, 0x00000000, 0 },
  {  9646, 1540, 61, 239042,  22300.000, 0x00000000, 0 },
  {  9647, 1540, 62, 239042,  22600.000, 0x00000000, 0 },
  {  9648, 1540, 63, 239042,  22900.000, 0x00000000, 0 },
  {  9649, 1540, 64, 239042,  23200.000, 0x00000000, 0 },
  {  9650, 1540, 65, 239042,  23500.000, 0x00000000, 0 },
  {  9651, 1540, 66, 239042,  23800.000, 0x00000000, 0 },
  {  9652, 1540, 67, 239042,  24100.000, 0x00000000, 0 },
  {  9653, 1540, 68, 239042,  24400.000, 0x00000000, 0 },
  {  9654, 1540, 69, 239042,  24700.000, 0x00000000, 0 },
  {  9655, 1540, 70, 239042,  25000.000, 0x00000000, 0 },
  {  9656, 1540, 71, 239042,  25300.000, 0x00000000, 0 },
  {  9657, 1540, 72, 239042,  25600.000, 0x00000000, 0 },
  {  9658, 1540, 73, 239042,  25900.000, 0x00000000, 0 },
  {  9659, 1540, 74, 239042,  26200.000, 0x00000000, 0 },
  {  9660, 1540, 75, 239042,  26500.000, 0x00000000, 0 },
  {  9661, 1540, 76, 239042,  26800.000, 0x00000000, 0 },
  {  9662, 1540, 77, 239042,  27100.000, 0x00000000, 0 },
  {  9663, 1540, 78, 239042,  27400.000, 0x00000000, 0 },
  {  9664, 1540, 79, 239042,  27700.000, 0x00000000, 0 },
  {  9665, 1540, 80, 239042,  28000.000, 0x00000000, 0 },
  {  9666, 1540, 81, 239042,  28300.000, 0x00000000, 0 },
  {  9667, 1540, 82, 239042,  28600.000, 0x00000000, 0 },
  {  9668, 1540, 83, 239042,  28900.000, 0x00000000, 0 },
  {  9669, 1540, 84, 239042,  29200.000, 0x00000000, 0 },
  {  9670, 1540, 85, 239042,  29500.000, 0x00000000, 0 },
  {  9671, 1540, 86, 239042,  29800.000, 0x00000000, 0 },
  {  9672, 1540, 87, 239042,  30100.000, 0x00000000, 0 },
  {  9673, 1540, 88, 239042,  30400.000, 0x00000000, 0 },
  {  9674, 1540, 89, 239042,  30700.000, 0x00000000, 0 },
  {  9675, 1540, 90, 239042,  31000.000, 0x00000000, 0 },
  {  9676, 1540, 91, 239042,  31300.000, 0x00000000, 0 },
  {  9677, 1540, 92, 239042,  31600.000, 0x00000000, 0 },
  {  9678, 1540, 93, 239042,  31900.000, 0x00000000, 0 },
  {  9679, 1540, 94, 239042,  32200.000, 0x00000000, 0 },
  {  9680, 1540, 95, 239042,  32500.000, 0x00000000, 0 },
  {  9681, 1540, 96, 239042,  32800.000, 0x00000000, 0 },
  {  9682, 1540, 97, 239042,  33100.000, 0x00000000, 0 },
  {  9683, 1540, 98, 239042,  33400.000, 0x00000000, 0 },
  {  9684, 1540, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6677, 1541,  0, 238057,      5.000, 0x00000000, 0 },
  {  7604, 1541,  1, 238057,     10.000, 0x00000000, 0 },
  {  7605, 1541,  2, 238057,     15.000, 0x00000000, 0 },
  {  7606, 1541,  3, 238057,     20.000, 0x00000000, 0 },
  {  7607, 1541,  4, 238057,     25.000, 0x00000000, 0 },
  {  7608, 1541,  5, 238057,     30.000, 0x00000000, 0 },
  {  7609, 1541,  6, 238057,     35.000, 0x00000000, 0 },
  {  7610, 1541,  7, 238057,     40.000, 0x00000000, 0 },
  {  6678, 1542,  0, 238093,      0.000, 0x00000000, 0 },
  {  6679, 1543,  0, 238129,      0.000, 0x00000000, 0 },
  {  6680, 1544,  0, 239042,   4000.000, 0x00000000, 0 },
  {  8469, 1544,  1, 239042,   4300.000, 0x00000000, 0 },
  {  8470, 1544,  2, 239042,   4600.000, 0x00000000, 0 },
  {  8471, 1544,  3, 239042,   4900.000, 0x00000000, 0 },
  {  8472, 1544,  4, 239042,   5200.000, 0x00000000, 0 },
  {  8473, 1544,  5, 239042,   5500.000, 0x00000000, 0 },
  {  8474, 1544,  6, 239042,   5800.000, 0x00000000, 0 },
  {  8475, 1544,  7, 239042,   6100.000, 0x00000000, 0 },
  {  8476, 1544,  8, 239042,   6400.000, 0x00000000, 0 },
  {  8477, 1544,  9, 239042,   6700.000, 0x00000000, 0 },
  {  8478, 1544, 10, 239042,   7000.000, 0x00000000, 0 },
  {  8479, 1544, 11, 239042,   7300.000, 0x00000000, 0 },
  {  8480, 1544, 12, 239042,   7600.000, 0x00000000, 0 },
  {  8481, 1544, 13, 239042,   7900.000, 0x00000000, 0 },
  {  8482, 1544, 14, 239042,   8200.000, 0x00000000, 0 },
  {  8483, 1544, 15, 239042,   8500.000, 0x00000000, 0 },
  {  8484, 1544, 16, 239042,   8800.000, 0x00000000, 0 },
  {  8485, 1544, 17, 239042,   9100.000, 0x00000000, 0 },
  {  8486, 1544, 18, 239042,   9400.000, 0x00000000, 0 },
  {  8487, 1544, 19, 239042,   9700.000, 0x00000000, 0 },
  {  8488, 1544, 20, 239042,  10000.000, 0x00000000, 0 },
  {  8489, 1544, 21, 239042,  10300.000, 0x00000000, 0 },
  {  8490, 1544, 22, 239042,  10600.000, 0x00000000, 0 },
  {  8491, 1544, 23, 239042,  10900.000, 0x00000000, 0 },
  {  8492, 1544, 24, 239042,  11200.000, 0x00000000, 0 },
  {  8493, 1544, 25, 239042,  11500.000, 0x00000000, 0 },
  {  8494, 1544, 26, 239042,  11800.000, 0x00000000, 0 },
  {  8495, 1544, 27, 239042,  12100.000, 0x00000000, 0 },
  {  8496, 1544, 28, 239042,  12400.000, 0x00000000, 0 },
  {  8497, 1544, 29, 239042,  12700.000, 0x00000000, 0 },
  {  8498, 1544, 30, 239042,  13000.000, 0x00000000, 0 },
  {  8499, 1544, 31, 239042,  13300.000, 0x00000000, 0 },
  {  8500, 1544, 32, 239042,  13600.000, 0x00000000, 0 },
  {  8501, 1544, 33, 239042,  13900.000, 0x00000000, 0 },
  {  8502, 1544, 34, 239042,  14200.000, 0x00000000, 0 },
  {  8503, 1544, 35, 239042,  14500.000, 0x00000000, 0 },
  {  8504, 1544, 36, 239042,  14800.000, 0x00000000, 0 },
  {  8505, 1544, 37, 239042,  15100.000, 0x00000000, 0 },
  {  8506, 1544, 38, 239042,  15400.000, 0x00000000, 0 },
  {  8507, 1544, 39, 239042,  15700.000, 0x00000000, 0 },
  {  8508, 1544, 40, 239042,  16000.000, 0x00000000, 0 },
  {  8509, 1544, 41, 239042,  16300.000, 0x00000000, 0 },
  {  8510, 1544, 42, 239042,  16600.000, 0x00000000, 0 },
  {  8511, 1544, 43, 239042,  16900.000, 0x00000000, 0 },
  {  8512, 1544, 44, 239042,  17200.000, 0x00000000, 0 },
  {  8513, 1544, 45, 239042,  17500.000, 0x00000000, 0 },
  {  8514, 1544, 46, 239042,  17800.000, 0x00000000, 0 },
  {  8515, 1544, 47, 239042,  18100.000, 0x00000000, 0 },
  {  8516, 1544, 48, 239042,  18400.000, 0x00000000, 0 },
  {  8517, 1544, 49, 239042,  18700.000, 0x00000000, 0 },
  { 10385, 1544, 50, 239042,  19000.000, 0x00000000, 0 },
  { 10386, 1544, 51, 239042,  19300.000, 0x00000000, 0 },
  { 10387, 1544, 52, 239042,  19600.000, 0x00000000, 0 },
  { 10388, 1544, 53, 239042,  19900.000, 0x00000000, 0 },
  { 10389, 1544, 54, 239042,  20200.000, 0x00000000, 0 },
  { 10390, 1544, 55, 239042,  20500.000, 0x00000000, 0 },
  { 10391, 1544, 56, 239042,  20800.000, 0x00000000, 0 },
  { 10392, 1544, 57, 239042,  21100.000, 0x00000000, 0 },
  { 10393, 1544, 58, 239042,  21400.000, 0x00000000, 0 },
  { 10394, 1544, 59, 239042,  21700.000, 0x00000000, 0 },
  { 10395, 1544, 60, 239042,  22000.000, 0x00000000, 0 },
  { 10396, 1544, 61, 239042,  22300.000, 0x00000000, 0 },
  { 10397, 1544, 62, 239042,  22600.000, 0x00000000, 0 },
  { 10398, 1544, 63, 239042,  22900.000, 0x00000000, 0 },
  { 10399, 1544, 64, 239042,  23200.000, 0x00000000, 0 },
  { 10400, 1544, 65, 239042,  23500.000, 0x00000000, 0 },
  { 10401, 1544, 66, 239042,  23800.000, 0x00000000, 0 },
  { 10402, 1544, 67, 239042,  24100.000, 0x00000000, 0 },
  { 10403, 1544, 68, 239042,  24400.000, 0x00000000, 0 },
  { 10404, 1544, 69, 239042,  24700.000, 0x00000000, 0 },
  { 10405, 1544, 70, 239042,  25000.000, 0x00000000, 0 },
  { 10406, 1544, 71, 239042,  25300.000, 0x00000000, 0 },
  { 10407, 1544, 72, 239042,  25600.000, 0x00000000, 0 },
  { 10408, 1544, 73, 239042,  25900.000, 0x00000000, 0 },
  { 10409, 1544, 74, 239042,  26200.000, 0x00000000, 0 },
  { 10410, 1544, 75, 239042,  26500.000, 0x00000000, 0 },
  { 10411, 1544, 76, 239042,  26800.000, 0x00000000, 0 },
  { 10412, 1544, 77, 239042,  27100.000, 0x00000000, 0 },
  { 10413, 1544, 78, 239042,  27400.000, 0x00000000, 0 },
  { 10414, 1544, 79, 239042,  27700.000, 0x00000000, 0 },
  { 10415, 1544, 80, 239042,  28000.000, 0x00000000, 0 },
  { 10416, 1544, 81, 239042,  28300.000, 0x00000000, 0 },
  { 10417, 1544, 82, 239042,  28600.000, 0x00000000, 0 },
  { 10418, 1544, 83, 239042,  28900.000, 0x00000000, 0 },
  { 10419, 1544, 84, 239042,  29200.000, 0x00000000, 0 },
  { 10420, 1544, 85, 239042,  29500.000, 0x00000000, 0 },
  { 10421, 1544, 86, 239042,  29800.000, 0x00000000, 0 },
  { 10422, 1544, 87, 239042,  30100.000, 0x00000000, 0 },
  { 10423, 1544, 88, 239042,  30400.000, 0x00000000, 0 },
  { 10424, 1544, 89, 239042,  30700.000, 0x00000000, 0 },
  { 10425, 1544, 90, 239042,  31000.000, 0x00000000, 0 },
  { 10426, 1544, 91, 239042,  31300.000, 0x00000000, 0 },
  { 10427, 1544, 92, 239042,  31600.000, 0x00000000, 0 },
  { 10428, 1544, 93, 239042,  31900.000, 0x00000000, 0 },
  { 10429, 1544, 94, 239042,  32200.000, 0x00000000, 0 },
  { 10430, 1544, 95, 239042,  32500.000, 0x00000000, 0 },
  { 10431, 1544, 96, 239042,  32800.000, 0x00000000, 0 },
  { 10432, 1544, 97, 239042,  33100.000, 0x00000000, 0 },
  { 10433, 1544, 98, 239042,  33400.000, 0x00000000, 0 },
  { 10434, 1544, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6681, 1545,  0, 238058, -10000.000, 0x00000000, 0 },
  {  7457, 1545,  1, 238058, -20000.000, 0x00000000, 0 },
  {  7458, 1545,  2, 238058, -30000.000, 0x00000000, 0 },
  {  7459, 1545,  3, 238058, -40000.000, 0x00000000, 0 },
  {  7460, 1545,  4, 238058, -50000.000, 0x00000000, 0 },
  {  7461, 1545,  5, 238058, -60000.000, 0x00000000, 0 },
  {  7462, 1545,  6, 238058, -70000.000, 0x00000000, 0 },
  {  7463, 1545,  7, 238058, -80000.000, 0x00000000, 0 },
  {  6682, 1546,  0, 238094,      0.000, 0x00000000, 0 },
  {  6683, 1547,  0, 238130,      0.000, 0x00000000, 0 },
  {  6684, 1548,  0, 239042,   4000.000, 0x00000000, 0 },
  {  8519, 1548,  1, 239042,   4300.000, 0x00000000, 0 },
  {  8520, 1548,  2, 239042,   4600.000, 0x00000000, 0 },
  {  8521, 1548,  3, 239042,   4900.000, 0x00000000, 0 },
  {  8522, 1548,  4, 239042,   5200.000, 0x00000000, 0 },
  {  8523, 1548,  5, 239042,   5500.000, 0x00000000, 0 },
  {  8524, 1548,  6, 239042,   5800.000, 0x00000000, 0 },
  {  8525, 1548,  7, 239042,   6100.000, 0x00000000, 0 },
  {  8526, 1548,  8, 239042,   6400.000, 0x00000000, 0 },
  {  8527, 1548,  9, 239042,   6700.000, 0x00000000, 0 },
  {  8528, 1548, 10, 239042,   7000.000, 0x00000000, 0 },
  {  8529, 1548, 11, 239042,   7300.000, 0x00000000, 0 },
  {  8530, 1548, 12, 239042,   7600.000, 0x00000000, 0 },
  {  8531, 1548, 13, 239042,   7900.000, 0x00000000, 0 },
  {  8532, 1548, 14, 239042,   8200.000, 0x00000000, 0 },
  {  8533, 1548, 15, 239042,   8500.000, 0x00000000, 0 },
  {  8534, 1548, 16, 239042,   8800.000, 0x00000000, 0 },
  {  8535, 1548, 17, 239042,   9100.000, 0x00000000, 0 },
  {  8536, 1548, 18, 239042,   9400.000, 0x00000000, 0 },
  {  8537, 1548, 19, 239042,   9700.000, 0x00000000, 0 },
  {  8538, 1548, 20, 239042,  10000.000, 0x00000000, 0 },
  {  8539, 1548, 21, 239042,  10300.000, 0x00000000, 0 },
  {  8540, 1548, 22, 239042,  10600.000, 0x00000000, 0 },
  {  8541, 1548, 23, 239042,  10900.000, 0x00000000, 0 },
  {  8542, 1548, 24, 239042,  11200.000, 0x00000000, 0 },
  {  8543, 1548, 25, 239042,  11500.000, 0x00000000, 0 },
  {  8544, 1548, 26, 239042,  11800.000, 0x00000000, 0 },
  {  8545, 1548, 27, 239042,  12100.000, 0x00000000, 0 },
  {  8546, 1548, 28, 239042,  12400.000, 0x00000000, 0 },
  {  8547, 1548, 29, 239042,  12700.000, 0x00000000, 0 },
  {  8548, 1548, 30, 239042,  13000.000, 0x00000000, 0 },
  {  8549, 1548, 31, 239042,  13300.000, 0x00000000, 0 },
  {  8550, 1548, 32, 239042,  13600.000, 0x00000000, 0 },
  {  8551, 1548, 33, 239042,  13900.000, 0x00000000, 0 },
  {  8552, 1548, 34, 239042,  14200.000, 0x00000000, 0 },
  {  8553, 1548, 35, 239042,  14500.000, 0x00000000, 0 },
  {  8554, 1548, 36, 239042,  14800.000, 0x00000000, 0 },
  {  8555, 1548, 37, 239042,  15100.000, 0x00000000, 0 },
  {  8556, 1548, 38, 239042,  15400.000, 0x00000000, 0 },
  {  8557, 1548, 39, 239042,  15700.000, 0x00000000, 0 },
  {  8558, 1548, 40, 239042,  16000.000, 0x00000000, 0 },
  {  8559, 1548, 41, 239042,  16300.000, 0x00000000, 0 },
  {  8560, 1548, 42, 239042,  16600.000, 0x00000000, 0 },
  {  8561, 1548, 43, 239042,  16900.000, 0x00000000, 0 },
  {  8562, 1548, 44, 239042,  17200.000, 0x00000000, 0 },
  {  8563, 1548, 45, 239042,  17500.000, 0x00000000, 0 },
  {  8564, 1548, 46, 239042,  17800.000, 0x00000000, 0 },
  {  8565, 1548, 47, 239042,  18100.000, 0x00000000, 0 },
  {  8566, 1548, 48, 239042,  18400.000, 0x00000000, 0 },
  {  8567, 1548, 49, 239042,  18700.000, 0x00000000, 0 },
  { 10435, 1548, 50, 239042,  19000.000, 0x00000000, 0 },
  { 10436, 1548, 51, 239042,  19300.000, 0x00000000, 0 },
  { 10437, 1548, 52, 239042,  19600.000, 0x00000000, 0 },
  { 10438, 1548, 53, 239042,  19900.000, 0x00000000, 0 },
  { 10439, 1548, 54, 239042,  20200.000, 0x00000000, 0 },
  { 10440, 1548, 55, 239042,  20500.000, 0x00000000, 0 },
  { 10441, 1548, 56, 239042,  20800.000, 0x00000000, 0 },
  { 10442, 1548, 57, 239042,  21100.000, 0x00000000, 0 },
  { 10443, 1548, 58, 239042,  21400.000, 0x00000000, 0 },
  { 10444, 1548, 59, 239042,  21700.000, 0x00000000, 0 },
  { 10445, 1548, 60, 239042,  22000.000, 0x00000000, 0 },
  { 10446, 1548, 61, 239042,  22300.000, 0x00000000, 0 },
  { 10447, 1548, 62, 239042,  22600.000, 0x00000000, 0 },
  { 10448, 1548, 63, 239042,  22900.000, 0x00000000, 0 },
  { 10449, 1548, 64, 239042,  23200.000, 0x00000000, 0 },
  { 10450, 1548, 65, 239042,  23500.000, 0x00000000, 0 },
  { 10451, 1548, 66, 239042,  23800.000, 0x00000000, 0 },
  { 10452, 1548, 67, 239042,  24100.000, 0x00000000, 0 },
  { 10453, 1548, 68, 239042,  24400.000, 0x00000000, 0 },
  { 10454, 1548, 69, 239042,  24700.000, 0x00000000, 0 },
  { 10455, 1548, 70, 239042,  25000.000, 0x00000000, 0 },
  { 10456, 1548, 71, 239042,  25300.000, 0x00000000, 0 },
  { 10457, 1548, 72, 239042,  25600.000, 0x00000000, 0 },
  { 10458, 1548, 73, 239042,  25900.000, 0x00000000, 0 },
  { 10459, 1548, 74, 239042,  26200.000, 0x00000000, 0 },
  { 10460, 1548, 75, 239042,  26500.000, 0x00000000, 0 },
  { 10461, 1548, 76, 239042,  26800.000, 0x00000000, 0 },
  { 10462, 1548, 77, 239042,  27100.000, 0x00000000, 0 },
  { 10463, 1548, 78, 239042,  27400.000, 0x00000000, 0 },
  { 10464, 1548, 79, 239042,  27700.000, 0x00000000, 0 },
  { 10465, 1548, 80, 239042,  28000.000, 0x00000000, 0 },
  { 10466, 1548, 81, 239042,  28300.000, 0x00000000, 0 },
  { 10467, 1548, 82, 239042,  28600.000, 0x00000000, 0 },
  { 10468, 1548, 83, 239042,  28900.000, 0x00000000, 0 },
  { 10469, 1548, 84, 239042,  29200.000, 0x00000000, 0 },
  { 10470, 1548, 85, 239042,  29500.000, 0x00000000, 0 },
  { 10471, 1548, 86, 239042,  29800.000, 0x00000000, 0 },
  { 10472, 1548, 87, 239042,  30100.000, 0x00000000, 0 },
  { 10473, 1548, 88, 239042,  30400.000, 0x00000000, 0 },
  { 10474, 1548, 89, 239042,  30700.000, 0x00000000, 0 },
  { 10475, 1548, 90, 239042,  31000.000, 0x00000000, 0 },
  { 10476, 1548, 91, 239042,  31300.000, 0x00000000, 0 },
  { 10477, 1548, 92, 239042,  31600.000, 0x00000000, 0 },
  { 10478, 1548, 93, 239042,  31900.000, 0x00000000, 0 },
  { 10479, 1548, 94, 239042,  32200.000, 0x00000000, 0 },
  { 10480, 1548, 95, 239042,  32500.000, 0x00000000, 0 },
  { 10481, 1548, 96, 239042,  32800.000, 0x00000000, 0 },
  { 10482, 1548, 97, 239042,  33100.000, 0x00000000, 0 },
  { 10483, 1548, 98, 239042,  33400.000, 0x00000000, 0 },
  { 10484, 1548, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6685, 1549,  0, 238059,  -5000.000, 0x00000000, 0 },
  {  7464, 1549,  1, 238059, -10000.000, 0x00000000, 0 },
  {  7465, 1549,  2, 238059, -15000.000, 0x00000000, 0 },
  {  7466, 1549,  3, 238059, -20000.000, 0x00000000, 0 },
  {  7467, 1549,  4, 238059, -24000.000, 0x00000000, 0 },
  {  7468, 1549,  5, 238059, -28000.000, 0x00000000, 0 },
  {  7469, 1549,  6, 238059, -31000.000, 0x00000000, 0 },
  {  7470, 1549,  7, 238059, -34000.000, 0x00000000, 0 },
  {  6686, 1550,  0, 238095,      0.000, 0x00000000, 0 },
  {  6687, 1551,  0, 238131,      0.000, 0x00000000, 0 },
  {  6688, 1552,  0, 239042,   4000.000, 0x00000000, 0 },
  {  8569, 1552,  1, 239042,   4300.000, 0x00000000, 0 },
  {  8570, 1552,  2, 239042,   4600.000, 0x00000000, 0 },
  {  8571, 1552,  3, 239042,   4900.000, 0x00000000, 0 },
  {  8572, 1552,  4, 239042,   5200.000, 0x00000000, 0 },
  {  8573, 1552,  5, 239042,   5500.000, 0x00000000, 0 },
  {  8574, 1552,  6, 239042,   5800.000, 0x00000000, 0 },
  {  8575, 1552,  7, 239042,   6100.000, 0x00000000, 0 },
  {  8576, 1552,  8, 239042,   6400.000, 0x00000000, 0 },
  {  8577, 1552,  9, 239042,   6700.000, 0x00000000, 0 },
  {  8578, 1552, 10, 239042,   7000.000, 0x00000000, 0 },
  {  8579, 1552, 11, 239042,   7300.000, 0x00000000, 0 },
  {  8580, 1552, 12, 239042,   7600.000, 0x00000000, 0 },
  {  8581, 1552, 13, 239042,   7900.000, 0x00000000, 0 },
  {  8582, 1552, 14, 239042,   8200.000, 0x00000000, 0 },
  {  8583, 1552, 15, 239042,   8500.000, 0x00000000, 0 },
  {  8584, 1552, 16, 239042,   8800.000, 0x00000000, 0 },
  {  8585, 1552, 17, 239042,   9100.000, 0x00000000, 0 },
  {  8586, 1552, 18, 239042,   9400.000, 0x00000000, 0 },
  {  8587, 1552, 19, 239042,   9700.000, 0x00000000, 0 },
  {  8588, 1552, 20, 239042,  10000.000, 0x00000000, 0 },
  {  8589, 1552, 21, 239042,  10300.000, 0x00000000, 0 },
  {  8590, 1552, 22, 239042,  10600.000, 0x00000000, 0 },
  {  8591, 1552, 23, 239042,  10900.000, 0x00000000, 0 },
  {  8592, 1552, 24, 239042,  11200.000, 0x00000000, 0 },
  {  8593, 1552, 25, 239042,  11500.000, 0x00000000, 0 },
  {  8594, 1552, 26, 239042,  11800.000, 0x00000000, 0 },
  {  8595, 1552, 27, 239042,  12100.000, 0x00000000, 0 },
  {  8596, 1552, 28, 239042,  12400.000, 0x00000000, 0 },
  {  8597, 1552, 29, 239042,  12700.000, 0x00000000, 0 },
  {  8598, 1552, 30, 239042,  13000.000, 0x00000000, 0 },
  {  8599, 1552, 31, 239042,  13300.000, 0x00000000, 0 },
  {  8600, 1552, 32, 239042,  13600.000, 0x00000000, 0 },
  {  8601, 1552, 33, 239042,  13900.000, 0x00000000, 0 },
  {  8602, 1552, 34, 239042,  14200.000, 0x00000000, 0 },
  {  8603, 1552, 35, 239042,  14500.000, 0x00000000, 0 },
  {  8604, 1552, 36, 239042,  14800.000, 0x00000000, 0 },
  {  8605, 1552, 37, 239042,  15100.000, 0x00000000, 0 },
  {  8606, 1552, 38, 239042,  15400.000, 0x00000000, 0 },
  {  8607, 1552, 39, 239042,  15700.000, 0x00000000, 0 },
  {  8608, 1552, 40, 239042,  16000.000, 0x00000000, 0 },
  {  8609, 1552, 41, 239042,  16300.000, 0x00000000, 0 },
  {  8610, 1552, 42, 239042,  16600.000, 0x00000000, 0 },
  {  8611, 1552, 43, 239042,  16900.000, 0x00000000, 0 },
  {  8612, 1552, 44, 239042,  17200.000, 0x00000000, 0 },
  {  8613, 1552, 45, 239042,  17500.000, 0x00000000, 0 },
  {  8614, 1552, 46, 239042,  17800.000, 0x00000000, 0 },
  {  8615, 1552, 47, 239042,  18100.000, 0x00000000, 0 },
  {  8616, 1552, 48, 239042,  18400.000, 0x00000000, 0 },
  {  8617, 1552, 49, 239042,  18700.000, 0x00000000, 0 },
  { 10485, 1552, 50, 239042,  19000.000, 0x00000000, 0 },
  { 10486, 1552, 51, 239042,  19300.000, 0x00000000, 0 },
  { 10487, 1552, 52, 239042,  19600.000, 0x00000000, 0 },
  { 10488, 1552, 53, 239042,  19900.000, 0x00000000, 0 },
  { 10489, 1552, 54, 239042,  20200.000, 0x00000000, 0 },
  { 10490, 1552, 55, 239042,  20500.000, 0x00000000, 0 },
  { 10491, 1552, 56, 239042,  20800.000, 0x00000000, 0 },
  { 10492, 1552, 57, 239042,  21100.000, 0x00000000, 0 },
  { 10493, 1552, 58, 239042,  21400.000, 0x00000000, 0 },
  { 10494, 1552, 59, 239042,  21700.000, 0x00000000, 0 },
  { 10495, 1552, 60, 239042,  22000.000, 0x00000000, 0 },
  { 10496, 1552, 61, 239042,  22300.000, 0x00000000, 0 },
  { 10497, 1552, 62, 239042,  22600.000, 0x00000000, 0 },
  { 10498, 1552, 63, 239042,  22900.000, 0x00000000, 0 },
  { 10499, 1552, 64, 239042,  23200.000, 0x00000000, 0 },
  { 10500, 1552, 65, 239042,  23500.000, 0x00000000, 0 },
  { 10501, 1552, 66, 239042,  23800.000, 0x00000000, 0 },
  { 10502, 1552, 67, 239042,  24100.000, 0x00000000, 0 },
  { 10503, 1552, 68, 239042,  24400.000, 0x00000000, 0 },
  { 10504, 1552, 69, 239042,  24700.000, 0x00000000, 0 },
  { 10505, 1552, 70, 239042,  25000.000, 0x00000000, 0 },
  { 10506, 1552, 71, 239042,  25300.000, 0x00000000, 0 },
  { 10507, 1552, 72, 239042,  25600.000, 0x00000000, 0 },
  { 10508, 1552, 73, 239042,  25900.000, 0x00000000, 0 },
  { 10509, 1552, 74, 239042,  26200.000, 0x00000000, 0 },
  { 10510, 1552, 75, 239042,  26500.000, 0x00000000, 0 },
  { 10511, 1552, 76, 239042,  26800.000, 0x00000000, 0 },
  { 10512, 1552, 77, 239042,  27100.000, 0x00000000, 0 },
  { 10513, 1552, 78, 239042,  27400.000, 0x00000000, 0 },
  { 10514, 1552, 79, 239042,  27700.000, 0x00000000, 0 },
  { 10515, 1552, 80, 239042,  28000.000, 0x00000000, 0 },
  { 10516, 1552, 81, 239042,  28300.000, 0x00000000, 0 },
  { 10517, 1552, 82, 239042,  28600.000, 0x00000000, 0 },
  { 10518, 1552, 83, 239042,  28900.000, 0x00000000, 0 },
  { 10519, 1552, 84, 239042,  29200.000, 0x00000000, 0 },
  { 10520, 1552, 85, 239042,  29500.000, 0x00000000, 0 },
  { 10521, 1552, 86, 239042,  29800.000, 0x00000000, 0 },
  { 10522, 1552, 87, 239042,  30100.000, 0x00000000, 0 },
  { 10523, 1552, 88, 239042,  30400.000, 0x00000000, 0 },
  { 10524, 1552, 89, 239042,  30700.000, 0x00000000, 0 },
  { 10525, 1552, 90, 239042,  31000.000, 0x00000000, 0 },
  { 10526, 1552, 91, 239042,  31300.000, 0x00000000, 0 },
  { 10527, 1552, 92, 239042,  31600.000, 0x00000000, 0 },
  { 10528, 1552, 93, 239042,  31900.000, 0x00000000, 0 },
  { 10529, 1552, 94, 239042,  32200.000, 0x00000000, 0 },
  { 10530, 1552, 95, 239042,  32500.000, 0x00000000, 0 },
  { 10531, 1552, 96, 239042,  32800.000, 0x00000000, 0 },
  { 10532, 1552, 97, 239042,  33100.000, 0x00000000, 0 },
  { 10533, 1552, 98, 239042,  33400.000, 0x00000000, 0 },
  { 10534, 1552, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6689, 1553,  0, 238060,      2.000, 0x00000000, 0 },
  {  7471, 1553,  1, 238060,      4.000, 0x00000000, 0 },
  {  7472, 1553,  2, 238060,      6.000, 0x00000000, 0 },
  {  7473, 1553,  3, 238060,      8.000, 0x00000000, 0 },
  {  7474, 1553,  4, 238060,     10.000, 0x00000000, 0 },
  {  7475, 1553,  5, 238060,     12.000, 0x00000000, 0 },
  {  7476, 1553,  6, 238060,     14.000, 0x00000000, 0 },
  {  7477, 1553,  7, 238060,     16.000, 0x00000000, 0 },
  {  6690, 1554,  0, 238096,      0.000, 0x00000000, 0 },
  {  6691, 1555,  0, 238132,      0.000, 0x00000000, 0 },
  {  6692, 1556,  0, 239042,   4000.000, 0x00000000, 0 },
  {  8619, 1556,  1, 239042,   4300.000, 0x00000000, 0 },
  {  8620, 1556,  2, 239042,   4600.000, 0x00000000, 0 },
  {  8621, 1556,  3, 239042,   4900.000, 0x00000000, 0 },
  {  8622, 1556,  4, 239042,   5200.000, 0x00000000, 0 },
  {  8623, 1556,  5, 239042,   5500.000, 0x00000000, 0 },
  {  8624, 1556,  6, 239042,   5800.000, 0x00000000, 0 },
  {  8625, 1556,  7, 239042,   6100.000, 0x00000000, 0 },
  {  8626, 1556,  8, 239042,   6400.000, 0x00000000, 0 },
  {  8627, 1556,  9, 239042,   6700.000, 0x00000000, 0 },
  {  8628, 1556, 10, 239042,   7000.000, 0x00000000, 0 },
  {  8629, 1556, 11, 239042,   7300.000, 0x00000000, 0 },
  {  8630, 1556, 12, 239042,   7600.000, 0x00000000, 0 },
  {  8631, 1556, 13, 239042,   7900.000, 0x00000000, 0 },
  {  8632, 1556, 14, 239042,   8200.000, 0x00000000, 0 },
  {  8633, 1556, 15, 239042,   8500.000, 0x00000000, 0 },
  {  8634, 1556, 16, 239042,   8800.000, 0x00000000, 0 },
  {  8635, 1556, 17, 239042,   9100.000, 0x00000000, 0 },
  {  8636, 1556, 18, 239042,   9400.000, 0x00000000, 0 },
  {  8637, 1556, 19, 239042,   9700.000, 0x00000000, 0 },
  {  8638, 1556, 20, 239042,  10000.000, 0x00000000, 0 },
  {  8639, 1556, 21, 239042,  10300.000, 0x00000000, 0 },
  {  8640, 1556, 22, 239042,  10600.000, 0x00000000, 0 },
  {  8641, 1556, 23, 239042,  10900.000, 0x00000000, 0 },
  {  8642, 1556, 24, 239042,  11200.000, 0x00000000, 0 },
  {  8643, 1556, 25, 239042,  11500.000, 0x00000000, 0 },
  {  8644, 1556, 26, 239042,  11800.000, 0x00000000, 0 },
  {  8645, 1556, 27, 239042,  12100.000, 0x00000000, 0 },
  {  8646, 1556, 28, 239042,  12400.000, 0x00000000, 0 },
  {  8647, 1556, 29, 239042,  12700.000, 0x00000000, 0 },
  {  8648, 1556, 30, 239042,  13000.000, 0x00000000, 0 },
  {  8649, 1556, 31, 239042,  13300.000, 0x00000000, 0 },
  {  8650, 1556, 32, 239042,  13600.000, 0x00000000, 0 },
  {  8651, 1556, 33, 239042,  13900.000, 0x00000000, 0 },
  {  8652, 1556, 34, 239042,  14200.000, 0x00000000, 0 },
  {  8653, 1556, 35, 239042,  14500.000, 0x00000000, 0 },
  {  8654, 1556, 36, 239042,  14800.000, 0x00000000, 0 },
  {  8655, 1556, 37, 239042,  15100.000, 0x00000000, 0 },
  {  8656, 1556, 38, 239042,  15400.000, 0x00000000, 0 },
  {  8657, 1556, 39, 239042,  15700.000, 0x00000000, 0 },
  {  8658, 1556, 40, 239042,  16000.000, 0x00000000, 0 },
  {  8659, 1556, 41, 239042,  16300.000, 0x00000000, 0 },
  {  8660, 1556, 42, 239042,  16600.000, 0x00000000, 0 },
  {  8661, 1556, 43, 239042,  16900.000, 0x00000000, 0 },
  {  8662, 1556, 44, 239042,  17200.000, 0x00000000, 0 },
  {  8663, 1556, 45, 239042,  17500.000, 0x00000000, 0 },
  {  8664, 1556, 46, 239042,  17800.000, 0x00000000, 0 },
  {  8665, 1556, 47, 239042,  18100.000, 0x00000000, 0 },
  {  8666, 1556, 48, 239042,  18400.000, 0x00000000, 0 },
  {  8667, 1556, 49, 239042,  18700.000, 0x00000000, 0 },
  { 10535, 1556, 50, 239042,  19000.000, 0x00000000, 0 },
  { 10536, 1556, 51, 239042,  19300.000, 0x00000000, 0 },
  { 10537, 1556, 52, 239042,  19600.000, 0x00000000, 0 },
  { 10538, 1556, 53, 239042,  19900.000, 0x00000000, 0 },
  { 10539, 1556, 54, 239042,  20200.000, 0x00000000, 0 },
  { 10540, 1556, 55, 239042,  20500.000, 0x00000000, 0 },
  { 10541, 1556, 56, 239042,  20800.000, 0x00000000, 0 },
  { 10542, 1556, 57, 239042,  21100.000, 0x00000000, 0 },
  { 10543, 1556, 58, 239042,  21400.000, 0x00000000, 0 },
  { 10544, 1556, 59, 239042,  21700.000, 0x00000000, 0 },
  { 10545, 1556, 60, 239042,  22000.000, 0x00000000, 0 },
  { 10546, 1556, 61, 239042,  22300.000, 0x00000000, 0 },
  { 10547, 1556, 62, 239042,  22600.000, 0x00000000, 0 },
  { 10548, 1556, 63, 239042,  22900.000, 0x00000000, 0 },
  { 10549, 1556, 64, 239042,  23200.000, 0x00000000, 0 },
  { 10550, 1556, 65, 239042,  23500.000, 0x00000000, 0 },
  { 10551, 1556, 66, 239042,  23800.000, 0x00000000, 0 },
  { 10552, 1556, 67, 239042,  24100.000, 0x00000000, 0 },
  { 10553, 1556, 68, 239042,  24400.000, 0x00000000, 0 },
  { 10554, 1556, 69, 239042,  24700.000, 0x00000000, 0 },
  { 10555, 1556, 70, 239042,  25000.000, 0x00000000, 0 },
  { 10556, 1556, 71, 239042,  25300.000, 0x00000000, 0 },
  { 10557, 1556, 72, 239042,  25600.000, 0x00000000, 0 },
  { 10558, 1556, 73, 239042,  25900.000, 0x00000000, 0 },
  { 10559, 1556, 74, 239042,  26200.000, 0x00000000, 0 },
  { 10560, 1556, 75, 239042,  26500.000, 0x00000000, 0 },
  { 10561, 1556, 76, 239042,  26800.000, 0x00000000, 0 },
  { 10562, 1556, 77, 239042,  27100.000, 0x00000000, 0 },
  { 10563, 1556, 78, 239042,  27400.000, 0x00000000, 0 },
  { 10564, 1556, 79, 239042,  27700.000, 0x00000000, 0 },
  { 10565, 1556, 80, 239042,  28000.000, 0x00000000, 0 },
  { 10566, 1556, 81, 239042,  28300.000, 0x00000000, 0 },
  { 10567, 1556, 82, 239042,  28600.000, 0x00000000, 0 },
  { 10568, 1556, 83, 239042,  28900.000, 0x00000000, 0 },
  { 10569, 1556, 84, 239042,  29200.000, 0x00000000, 0 },
  { 10570, 1556, 85, 239042,  29500.000, 0x00000000, 0 },
  { 10571, 1556, 86, 239042,  29800.000, 0x00000000, 0 },
  { 10572, 1556, 87, 239042,  30100.000, 0x00000000, 0 },
  { 10573, 1556, 88, 239042,  30400.000, 0x00000000, 0 },
  { 10574, 1556, 89, 239042,  30700.000, 0x00000000, 0 },
  { 10575, 1556, 90, 239042,  31000.000, 0x00000000, 0 },
  { 10576, 1556, 91, 239042,  31300.000, 0x00000000, 0 },
  { 10577, 1556, 92, 239042,  31600.000, 0x00000000, 0 },
  { 10578, 1556, 93, 239042,  31900.000, 0x00000000, 0 },
  { 10579, 1556, 94, 239042,  32200.000, 0x00000000, 0 },
  { 10580, 1556, 95, 239042,  32500.000, 0x00000000, 0 },
  { 10581, 1556, 96, 239042,  32800.000, 0x00000000, 0 },
  { 10582, 1556, 97, 239042,  33100.000, 0x00000000, 0 },
  { 10583, 1556, 98, 239042,  33400.000, 0x00000000, 0 },
  { 10584, 1556, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6693, 1557,  0, 238061,      1.000, 0x00000000, 0 },
  {  7478, 1557,  1, 238061,      2.000, 0x00000000, 0 },
  {  7479, 1557,  2, 238061,      3.000, 0x00000000, 0 },
  {  7480, 1557,  3, 238061,      4.000, 0x00000000, 0 },
  {  7481, 1557,  4, 238061,      5.000, 0x00000000, 0 },
  {  7482, 1557,  5, 238061,      6.000, 0x00000000, 0 },
  {  7483, 1557,  6, 238061,      7.000, 0x00000000, 0 },
  {  7484, 1557,  7, 238061,      8.000, 0x00000000, 0 },
  {  6694, 1558,  0, 238097,      0.000, 0x00000000, 0 },
  {  6695, 1559,  0, 238133,      0.000, 0x00000000, 0 },
  {  6696, 1560,  0, 239042,   4000.000, 0x00000000, 0 },
  {  8669, 1560,  1, 239042,   4300.000, 0x00000000, 0 },
  {  8670, 1560,  2, 239042,   4600.000, 0x00000000, 0 },
  {  8671, 1560,  3, 239042,   4900.000, 0x00000000, 0 },
  {  8672, 1560,  4, 239042,   5200.000, 0x00000000, 0 },
  {  8673, 1560,  5, 239042,   5500.000, 0x00000000, 0 },
  {  8674, 1560,  6, 239042,   5800.000, 0x00000000, 0 },
  {  8675, 1560,  7, 239042,   6100.000, 0x00000000, 0 },
  {  8676, 1560,  8, 239042,   6400.000, 0x00000000, 0 },
  {  8677, 1560,  9, 239042,   6700.000, 0x00000000, 0 },
  {  8678, 1560, 10, 239042,   7000.000, 0x00000000, 0 },
  {  8679, 1560, 11, 239042,   7300.000, 0x00000000, 0 },
  {  8680, 1560, 12, 239042,   7600.000, 0x00000000, 0 },
  {  8681, 1560, 13, 239042,   7900.000, 0x00000000, 0 },
  {  8682, 1560, 14, 239042,   8200.000, 0x00000000, 0 },
  {  8683, 1560, 15, 239042,   8500.000, 0x00000000, 0 },
  {  8684, 1560, 16, 239042,   8800.000, 0x00000000, 0 },
  {  8685, 1560, 17, 239042,   9100.000, 0x00000000, 0 },
  {  8686, 1560, 18, 239042,   9400.000, 0x00000000, 0 },
  {  8687, 1560, 19, 239042,   9700.000, 0x00000000, 0 },
  {  8688, 1560, 20, 239042,  10000.000, 0x00000000, 0 },
  {  8689, 1560, 21, 239042,  10300.000, 0x00000000, 0 },
  {  8690, 1560, 22, 239042,  10600.000, 0x00000000, 0 },
  {  8691, 1560, 23, 239042,  10900.000, 0x00000000, 0 },
  {  8692, 1560, 24, 239042,  11200.000, 0x00000000, 0 },
  {  8693, 1560, 25, 239042,  11500.000, 0x00000000, 0 },
  {  8694, 1560, 26, 239042,  11800.000, 0x00000000, 0 },
  {  8695, 1560, 27, 239042,  12100.000, 0x00000000, 0 },
  {  8696, 1560, 28, 239042,  12400.000, 0x00000000, 0 },
  {  8697, 1560, 29, 239042,  12700.000, 0x00000000, 0 },
  {  8698, 1560, 30, 239042,  13000.000, 0x00000000, 0 },
  {  8699, 1560, 31, 239042,  13300.000, 0x00000000, 0 },
  {  8700, 1560, 32, 239042,  13600.000, 0x00000000, 0 },
  {  8701, 1560, 33, 239042,  13900.000, 0x00000000, 0 },
  {  8702, 1560, 34, 239042,  14200.000, 0x00000000, 0 },
  {  8703, 1560, 35, 239042,  14500.000, 0x00000000, 0 },
  {  8704, 1560, 36, 239042,  14800.000, 0x00000000, 0 },
  {  8705, 1560, 37, 239042,  15100.000, 0x00000000, 0 },
  {  8706, 1560, 38, 239042,  15400.000, 0x00000000, 0 },
  {  8707, 1560, 39, 239042,  15700.000, 0x00000000, 0 },
  {  8708, 1560, 40, 239042,  16000.000, 0x00000000, 0 },
  {  8709, 1560, 41, 239042,  16300.000, 0x00000000, 0 },
  {  8710, 1560, 42, 239042,  16600.000, 0x00000000, 0 },
  {  8711, 1560, 43, 239042,  16900.000, 0x00000000, 0 },
  {  8712, 1560, 44, 239042,  17200.000, 0x00000000, 0 },
  {  8713, 1560, 45, 239042,  17500.000, 0x00000000, 0 },
  {  8714, 1560, 46, 239042,  17800.000, 0x00000000, 0 },
  {  8715, 1560, 47, 239042,  18100.000, 0x00000000, 0 },
  {  8716, 1560, 48, 239042,  18400.000, 0x00000000, 0 },
  {  8717, 1560, 49, 239042,  18700.000, 0x00000000, 0 },
  { 10585, 1560, 50, 239042,  19000.000, 0x00000000, 0 },
  { 10586, 1560, 51, 239042,  19300.000, 0x00000000, 0 },
  { 10587, 1560, 52, 239042,  19600.000, 0x00000000, 0 },
  { 10588, 1560, 53, 239042,  19900.000, 0x00000000, 0 },
  { 10589, 1560, 54, 239042,  20200.000, 0x00000000, 0 },
  { 10590, 1560, 55, 239042,  20500.000, 0x00000000, 0 },
  { 10591, 1560, 56, 239042,  20800.000, 0x00000000, 0 },
  { 10592, 1560, 57, 239042,  21100.000, 0x00000000, 0 },
  { 10593, 1560, 58, 239042,  21400.000, 0x00000000, 0 },
  { 10594, 1560, 59, 239042,  21700.000, 0x00000000, 0 },
  { 10595, 1560, 60, 239042,  22000.000, 0x00000000, 0 },
  { 10596, 1560, 61, 239042,  22300.000, 0x00000000, 0 },
  { 10597, 1560, 62, 239042,  22600.000, 0x00000000, 0 },
  { 10598, 1560, 63, 239042,  22900.000, 0x00000000, 0 },
  { 10599, 1560, 64, 239042,  23200.000, 0x00000000, 0 },
  { 10600, 1560, 65, 239042,  23500.000, 0x00000000, 0 },
  { 10601, 1560, 66, 239042,  23800.000, 0x00000000, 0 },
  { 10602, 1560, 67, 239042,  24100.000, 0x00000000, 0 },
  { 10603, 1560, 68, 239042,  24400.000, 0x00000000, 0 },
  { 10604, 1560, 69, 239042,  24700.000, 0x00000000, 0 },
  { 10605, 1560, 70, 239042,  25000.000, 0x00000000, 0 },
  { 10606, 1560, 71, 239042,  25300.000, 0x00000000, 0 },
  { 10607, 1560, 72, 239042,  25600.000, 0x00000000, 0 },
  { 10608, 1560, 73, 239042,  25900.000, 0x00000000, 0 },
  { 10609, 1560, 74, 239042,  26200.000, 0x00000000, 0 },
  { 10610, 1560, 75, 239042,  26500.000, 0x00000000, 0 },
  { 10611, 1560, 76, 239042,  26800.000, 0x00000000, 0 },
  { 10612, 1560, 77, 239042,  27100.000, 0x00000000, 0 },
  { 10613, 1560, 78, 239042,  27400.000, 0x00000000, 0 },
  { 10614, 1560, 79, 239042,  27700.000, 0x00000000, 0 },
  { 10615, 1560, 80, 239042,  28000.000, 0x00000000, 0 },
  { 10616, 1560, 81, 239042,  28300.000, 0x00000000, 0 },
  { 10617, 1560, 82, 239042,  28600.000, 0x00000000, 0 },
  { 10618, 1560, 83, 239042,  28900.000, 0x00000000, 0 },
  { 10619, 1560, 84, 239042,  29200.000, 0x00000000, 0 },
  { 10620, 1560, 85, 239042,  29500.000, 0x00000000, 0 },
  { 10621, 1560, 86, 239042,  29800.000, 0x00000000, 0 },
  { 10622, 1560, 87, 239042,  30100.000, 0x00000000, 0 },
  { 10623, 1560, 88, 239042,  30400.000, 0x00000000, 0 },
  { 10624, 1560, 89, 239042,  30700.000, 0x00000000, 0 },
  { 10625, 1560, 90, 239042,  31000.000, 0x00000000, 0 },
  { 10626, 1560, 91, 239042,  31300.000, 0x00000000, 0 },
  { 10627, 1560, 92, 239042,  31600.000, 0x00000000, 0 },
  { 10628, 1560, 93, 239042,  31900.000, 0x00000000, 0 },
  { 10629, 1560, 94, 239042,  32200.000, 0x00000000, 0 },
  { 10630, 1560, 95, 239042,  32500.000, 0x00000000, 0 },
  { 10631, 1560, 96, 239042,  32800.000, 0x00000000, 0 },
  { 10632, 1560, 97, 239042,  33100.000, 0x00000000, 0 },
  { 10633, 1560, 98, 239042,  33400.000, 0x00000000, 0 },
  { 10634, 1560, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6697, 1561,  0, 238062,      8.000, 0x00000000, 0 },
  {  7485, 1561,  1, 238062,     16.000, 0x00000000, 0 },
  {  7486, 1561,  2, 238062,     24.000, 0x00000000, 0 },
  {  7487, 1561,  3, 238062,     32.000, 0x00000000, 0 },
  {  7488, 1561,  4, 238062,     40.000, 0x00000000, 0 },
  {  7489, 1561,  5, 238062,     48.000, 0x00000000, 0 },
  {  7490, 1561,  6, 238062,     56.000, 0x00000000, 0 },
  {  7491, 1561,  7, 238062,     64.000, 0x00000000, 0 },
  {  6698, 1562,  0, 238098,      0.000, 0x00000000, 0 },
  {  6699, 1563,  0, 238134,      0.000, 0x00000000, 0 },
  {  6700, 1564,  0, 239042,   4000.000, 0x00000000, 0 },
  {  8719, 1564,  1, 239042,   4300.000, 0x00000000, 0 },
  {  8720, 1564,  2, 239042,   4600.000, 0x00000000, 0 },
  {  8721, 1564,  3, 239042,   4900.000, 0x00000000, 0 },
  {  8722, 1564,  4, 239042,   5200.000, 0x00000000, 0 },
  {  8723, 1564,  5, 239042,   5500.000, 0x00000000, 0 },
  {  8724, 1564,  6, 239042,   5800.000, 0x00000000, 0 },
  {  8725, 1564,  7, 239042,   6100.000, 0x00000000, 0 },
  {  8726, 1564,  8, 239042,   6400.000, 0x00000000, 0 },
  {  8727, 1564,  9, 239042,   6700.000, 0x00000000, 0 },
  {  8728, 1564, 10, 239042,   7000.000, 0x00000000, 0 },
  {  8729, 1564, 11, 239042,   7300.000, 0x00000000, 0 },
  {  8730, 1564, 12, 239042,   7600.000, 0x00000000, 0 },
  {  8731, 1564, 13, 239042,   7900.000, 0x00000000, 0 },
  {  8732, 1564, 14, 239042,   8200.000, 0x00000000, 0 },
  {  8733, 1564, 15, 239042,   8500.000, 0x00000000, 0 },
  {  8734, 1564, 16, 239042,   8800.000, 0x00000000, 0 },
  {  8735, 1564, 17, 239042,   9100.000, 0x00000000, 0 },
  {  8736, 1564, 18, 239042,   9400.000, 0x00000000, 0 },
  {  8737, 1564, 19, 239042,   9700.000, 0x00000000, 0 },
  {  8738, 1564, 20, 239042,  10000.000, 0x00000000, 0 },
  {  8739, 1564, 21, 239042,  10300.000, 0x00000000, 0 },
  {  8740, 1564, 22, 239042,  10600.000, 0x00000000, 0 },
  {  8741, 1564, 23, 239042,  10900.000, 0x00000000, 0 },
  {  8742, 1564, 24, 239042,  11200.000, 0x00000000, 0 },
  {  8743, 1564, 25, 239042,  11500.000, 0x00000000, 0 },
  {  8744, 1564, 26, 239042,  11800.000, 0x00000000, 0 },
  {  8745, 1564, 27, 239042,  12100.000, 0x00000000, 0 },
  {  8746, 1564, 28, 239042,  12400.000, 0x00000000, 0 },
  {  8747, 1564, 29, 239042,  12700.000, 0x00000000, 0 },
  {  8748, 1564, 30, 239042,  13000.000, 0x00000000, 0 },
  {  8749, 1564, 31, 239042,  13300.000, 0x00000000, 0 },
  {  8750, 1564, 32, 239042,  13600.000, 0x00000000, 0 },
  {  8751, 1564, 33, 239042,  13900.000, 0x00000000, 0 },
  {  8752, 1564, 34, 239042,  14200.000, 0x00000000, 0 },
  {  8753, 1564, 35, 239042,  14500.000, 0x00000000, 0 },
  {  8754, 1564, 36, 239042,  14800.000, 0x00000000, 0 },
  {  8755, 1564, 37, 239042,  15100.000, 0x00000000, 0 },
  {  8756, 1564, 38, 239042,  15400.000, 0x00000000, 0 },
  {  8757, 1564, 39, 239042,  15700.000, 0x00000000, 0 },
  {  8758, 1564, 40, 239042,  16000.000, 0x00000000, 0 },
  {  8759, 1564, 41, 239042,  16300.000, 0x00000000, 0 },
  {  8760, 1564, 42, 239042,  16600.000, 0x00000000, 0 },
  {  8761, 1564, 43, 239042,  16900.000, 0x00000000, 0 },
  {  8762, 1564, 44, 239042,  17200.000, 0x00000000, 0 },
  {  8763, 1564, 45, 239042,  17500.000, 0x00000000, 0 },
  {  8764, 1564, 46, 239042,  17800.000, 0x00000000, 0 },
  {  8765, 1564, 47, 239042,  18100.000, 0x00000000, 0 },
  {  8766, 1564, 48, 239042,  18400.000, 0x00000000, 0 },
  {  8767, 1564, 49, 239042,  18700.000, 0x00000000, 0 },
  { 10635, 1564, 50, 239042,  19000.000, 0x00000000, 0 },
  { 10636, 1564, 51, 239042,  19300.000, 0x00000000, 0 },
  { 10637, 1564, 52, 239042,  19600.000, 0x00000000, 0 },
  { 10638, 1564, 53, 239042,  19900.000, 0x00000000, 0 },
  { 10639, 1564, 54, 239042,  20200.000, 0x00000000, 0 },
  { 10640, 1564, 55, 239042,  20500.000, 0x00000000, 0 },
  { 10641, 1564, 56, 239042,  20800.000, 0x00000000, 0 },
  { 10642, 1564, 57, 239042,  21100.000, 0x00000000, 0 },
  { 10643, 1564, 58, 239042,  21400.000, 0x00000000, 0 },
  { 10644, 1564, 59, 239042,  21700.000, 0x00000000, 0 },
  { 10645, 1564, 60, 239042,  22000.000, 0x00000000, 0 },
  { 10646, 1564, 61, 239042,  22300.000, 0x00000000, 0 },
  { 10647, 1564, 62, 239042,  22600.000, 0x00000000, 0 },
  { 10648, 1564, 63, 239042,  22900.000, 0x00000000, 0 },
  { 10649, 1564, 64, 239042,  23200.000, 0x00000000, 0 },
  { 10650, 1564, 65, 239042,  23500.000, 0x00000000, 0 },
  { 10651, 1564, 66, 239042,  23800.000, 0x00000000, 0 },
  { 10652, 1564, 67, 239042,  24100.000, 0x00000000, 0 },
  { 10653, 1564, 68, 239042,  24400.000, 0x00000000, 0 },
  { 10654, 1564, 69, 239042,  24700.000, 0x00000000, 0 },
  { 10655, 1564, 70, 239042,  25000.000, 0x00000000, 0 },
  { 10656, 1564, 71, 239042,  25300.000, 0x00000000, 0 },
  { 10657, 1564, 72, 239042,  25600.000, 0x00000000, 0 },
  { 10658, 1564, 73, 239042,  25900.000, 0x00000000, 0 },
  { 10659, 1564, 74, 239042,  26200.000, 0x00000000, 0 },
  { 10660, 1564, 75, 239042,  26500.000, 0x00000000, 0 },
  { 10661, 1564, 76, 239042,  26800.000, 0x00000000, 0 },
  { 10662, 1564, 77, 239042,  27100.000, 0x00000000, 0 },
  { 10663, 1564, 78, 239042,  27400.000, 0x00000000, 0 },
  { 10664, 1564, 79, 239042,  27700.000, 0x00000000, 0 },
  { 10665, 1564, 80, 239042,  28000.000, 0x00000000, 0 },
  { 10666, 1564, 81, 239042,  28300.000, 0x00000000, 0 },
  { 10667, 1564, 82, 239042,  28600.000, 0x00000000, 0 },
  { 10668, 1564, 83, 239042,  28900.000, 0x00000000, 0 },
  { 10669, 1564, 84, 239042,  29200.000, 0x00000000, 0 },
  { 10670, 1564, 85, 239042,  29500.000, 0x00000000, 0 },
  { 10671, 1564, 86, 239042,  29800.000, 0x00000000, 0 },
  { 10672, 1564, 87, 239042,  30100.000, 0x00000000, 0 },
  { 10673, 1564, 88, 239042,  30400.000, 0x00000000, 0 },
  { 10674, 1564, 89, 239042,  30700.000, 0x00000000, 0 },
  { 10675, 1564, 90, 239042,  31000.000, 0x00000000, 0 },
  { 10676, 1564, 91, 239042,  31300.000, 0x00000000, 0 },
  { 10677, 1564, 92, 239042,  31600.000, 0x00000000, 0 },
  { 10678, 1564, 93, 239042,  31900.000, 0x00000000, 0 },
  { 10679, 1564, 94, 239042,  32200.000, 0x00000000, 0 },
  { 10680, 1564, 95, 239042,  32500.000, 0x00000000, 0 },
  { 10681, 1564, 96, 239042,  32800.000, 0x00000000, 0 },
  { 10682, 1564, 97, 239042,  33100.000, 0x00000000, 0 },
  { 10683, 1564, 98, 239042,  33400.000, 0x00000000, 0 },
  { 10684, 1564, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6701, 1565,  0, 238063,    -50.000, 0x00000000, 0 },
  {  7492, 1565,  1, 238063,   -100.000, 0x00000000, 0 },
  {  7493, 1565,  2, 238063,   -150.000, 0x00000000, 0 },
  {  7494, 1565,  3, 238063,   -200.000, 0x00000000, 0 },
  {  7495, 1565,  4, 238063,   -250.000, 0x00000000, 0 },
  {  7496, 1565,  5, 238063,   -300.000, 0x00000000, 0 },
  {  7497, 1565,  6, 238063,   -350.000, 0x00000000, 0 },
  {  7498, 1565,  7, 238063,   -400.000, 0x00000000, 0 },
  {  6702, 1566,  0, 238099,      0.000, 0x00000000, 0 },
  {  6703, 1567,  0, 238135,      0.000, 0x00000000, 0 },
  {  6704, 1568,  0, 239042,   4000.000, 0x00000000, 0 },
  {  8769, 1568,  1, 239042,   4300.000, 0x00000000, 0 },
  {  8770, 1568,  2, 239042,   4600.000, 0x00000000, 0 },
  {  8771, 1568,  3, 239042,   4900.000, 0x00000000, 0 },
  {  8772, 1568,  4, 239042,   5200.000, 0x00000000, 0 },
  {  8773, 1568,  5, 239042,   5500.000, 0x00000000, 0 },
  {  8774, 1568,  6, 239042,   5800.000, 0x00000000, 0 },
  {  8775, 1568,  7, 239042,   6100.000, 0x00000000, 0 },
  {  8776, 1568,  8, 239042,   6400.000, 0x00000000, 0 },
  {  8777, 1568,  9, 239042,   6700.000, 0x00000000, 0 },
  {  8778, 1568, 10, 239042,   7000.000, 0x00000000, 0 },
  {  8779, 1568, 11, 239042,   7300.000, 0x00000000, 0 },
  {  8780, 1568, 12, 239042,   7600.000, 0x00000000, 0 },
  {  8781, 1568, 13, 239042,   7900.000, 0x00000000, 0 },
  {  8782, 1568, 14, 239042,   8200.000, 0x00000000, 0 },
  {  8783, 1568, 15, 239042,   8500.000, 0x00000000, 0 },
  {  8784, 1568, 16, 239042,   8800.000, 0x00000000, 0 },
  {  8785, 1568, 17, 239042,   9100.000, 0x00000000, 0 },
  {  8786, 1568, 18, 239042,   9400.000, 0x00000000, 0 },
  {  8787, 1568, 19, 239042,   9700.000, 0x00000000, 0 },
  {  8788, 1568, 20, 239042,  10000.000, 0x00000000, 0 },
  {  8789, 1568, 21, 239042,  10300.000, 0x00000000, 0 },
  {  8790, 1568, 22, 239042,  10600.000, 0x00000000, 0 },
  {  8791, 1568, 23, 239042,  10900.000, 0x00000000, 0 },
  {  8792, 1568, 24, 239042,  11200.000, 0x00000000, 0 },
  {  8793, 1568, 25, 239042,  11500.000, 0x00000000, 0 },
  {  8794, 1568, 26, 239042,  11800.000, 0x00000000, 0 },
  {  8795, 1568, 27, 239042,  12100.000, 0x00000000, 0 },
  {  8796, 1568, 28, 239042,  12400.000, 0x00000000, 0 },
  {  8797, 1568, 29, 239042,  12700.000, 0x00000000, 0 },
  {  8798, 1568, 30, 239042,  13000.000, 0x00000000, 0 },
  {  8799, 1568, 31, 239042,  13300.000, 0x00000000, 0 },
  {  8800, 1568, 32, 239042,  13600.000, 0x00000000, 0 },
  {  8801, 1568, 33, 239042,  13900.000, 0x00000000, 0 },
  {  8802, 1568, 34, 239042,  14200.000, 0x00000000, 0 },
  {  8803, 1568, 35, 239042,  14500.000, 0x00000000, 0 },
  {  8804, 1568, 36, 239042,  14800.000, 0x00000000, 0 },
  {  8805, 1568, 37, 239042,  15100.000, 0x00000000, 0 },
  {  8806, 1568, 38, 239042,  15400.000, 0x00000000, 0 },
  {  8807, 1568, 39, 239042,  15700.000, 0x00000000, 0 },
  {  8808, 1568, 40, 239042,  16000.000, 0x00000000, 0 },
  {  8809, 1568, 41, 239042,  16300.000, 0x00000000, 0 },
  {  8810, 1568, 42, 239042,  16600.000, 0x00000000, 0 },
  {  8811, 1568, 43, 239042,  16900.000, 0x00000000, 0 },
  {  8812, 1568, 44, 239042,  17200.000, 0x00000000, 0 },
  {  8813, 1568, 45, 239042,  17500.000, 0x00000000, 0 },
  {  8814, 1568, 46, 239042,  17800.000, 0x00000000, 0 },
  {  8815, 1568, 47, 239042,  18100.000, 0x00000000, 0 },
  {  8816, 1568, 48, 239042,  18400.000, 0x00000000, 0 },
  {  8817, 1568, 49, 239042,  18700.000, 0x00000000, 0 },
  { 10685, 1568, 50, 239042,  19000.000, 0x00000000, 0 },
  { 10686, 1568, 51, 239042,  19300.000, 0x00000000, 0 },
  { 10687, 1568, 52, 239042,  19600.000, 0x00000000, 0 },
  { 10688, 1568, 53, 239042,  19900.000, 0x00000000, 0 },
  { 10689, 1568, 54, 239042,  20200.000, 0x00000000, 0 },
  { 10690, 1568, 55, 239042,  20500.000, 0x00000000, 0 },
  { 10691, 1568, 56, 239042,  20800.000, 0x00000000, 0 },
  { 10692, 1568, 57, 239042,  21100.000, 0x00000000, 0 },
  { 10693, 1568, 58, 239042,  21400.000, 0x00000000, 0 },
  { 10694, 1568, 59, 239042,  21700.000, 0x00000000, 0 },
  { 10695, 1568, 60, 239042,  22000.000, 0x00000000, 0 },
  { 10696, 1568, 61, 239042,  22300.000, 0x00000000, 0 },
  { 10697, 1568, 62, 239042,  22600.000, 0x00000000, 0 },
  { 10698, 1568, 63, 239042,  22900.000, 0x00000000, 0 },
  { 10699, 1568, 64, 239042,  23200.000, 0x00000000, 0 },
  { 10700, 1568, 65, 239042,  23500.000, 0x00000000, 0 },
  { 10701, 1568, 66, 239042,  23800.000, 0x00000000, 0 },
  { 10702, 1568, 67, 239042,  24100.000, 0x00000000, 0 },
  { 10703, 1568, 68, 239042,  24400.000, 0x00000000, 0 },
  { 10704, 1568, 69, 239042,  24700.000, 0x00000000, 0 },
  { 10705, 1568, 70, 239042,  25000.000, 0x00000000, 0 },
  { 10706, 1568, 71, 239042,  25300.000, 0x00000000, 0 },
  { 10707, 1568, 72, 239042,  25600.000, 0x00000000, 0 },
  { 10708, 1568, 73, 239042,  25900.000, 0x00000000, 0 },
  { 10709, 1568, 74, 239042,  26200.000, 0x00000000, 0 },
  { 10710, 1568, 75, 239042,  26500.000, 0x00000000, 0 },
  { 10711, 1568, 76, 239042,  26800.000, 0x00000000, 0 },
  { 10712, 1568, 77, 239042,  27100.000, 0x00000000, 0 },
  { 10713, 1568, 78, 239042,  27400.000, 0x00000000, 0 },
  { 10714, 1568, 79, 239042,  27700.000, 0x00000000, 0 },
  { 10715, 1568, 80, 239042,  28000.000, 0x00000000, 0 },
  { 10716, 1568, 81, 239042,  28300.000, 0x00000000, 0 },
  { 10717, 1568, 82, 239042,  28600.000, 0x00000000, 0 },
  { 10718, 1568, 83, 239042,  28900.000, 0x00000000, 0 },
  { 10719, 1568, 84, 239042,  29200.000, 0x00000000, 0 },
  { 10720, 1568, 85, 239042,  29500.000, 0x00000000, 0 },
  { 10721, 1568, 86, 239042,  29800.000, 0x00000000, 0 },
  { 10722, 1568, 87, 239042,  30100.000, 0x00000000, 0 },
  { 10723, 1568, 88, 239042,  30400.000, 0x00000000, 0 },
  { 10724, 1568, 89, 239042,  30700.000, 0x00000000, 0 },
  { 10725, 1568, 90, 239042,  31000.000, 0x00000000, 0 },
  { 10726, 1568, 91, 239042,  31300.000, 0x00000000, 0 },
  { 10727, 1568, 92, 239042,  31600.000, 0x00000000, 0 },
  { 10728, 1568, 93, 239042,  31900.000, 0x00000000, 0 },
  { 10729, 1568, 94, 239042,  32200.000, 0x00000000, 0 },
  { 10730, 1568, 95, 239042,  32500.000, 0x00000000, 0 },
  { 10731, 1568, 96, 239042,  32800.000, 0x00000000, 0 },
  { 10732, 1568, 97, 239042,  33100.000, 0x00000000, 0 },
  { 10733, 1568, 98, 239042,  33400.000, 0x00000000, 0 },
  { 10734, 1568, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6705, 1569,  0, 238064,      5.000, 0x00000000, 0 },
  {  7499, 1569,  1, 238064,     10.000, 0x00000000, 0 },
  {  7500, 1569,  2, 238064,     15.000, 0x00000000, 0 },
  {  7501, 1569,  3, 238064,     20.000, 0x00000000, 0 },
  {  7502, 1569,  4, 238064,     25.000, 0x00000000, 0 },
  {  7503, 1569,  5, 238064,     30.000, 0x00000000, 0 },
  {  7504, 1569,  6, 238064,     35.000, 0x00000000, 0 },
  {  7505, 1569,  7, 238064,     40.000, 0x00000000, 0 },
  {  6706, 1570,  0, 238100,      0.000, 0x00000000, 0 },
  {  6707, 1571,  0, 238136,      0.000, 0x00000000, 0 },
  {  6708, 1572,  0, 239042,   4000.000, 0x00000000, 0 },
  {  8819, 1572,  1, 239042,   4300.000, 0x00000000, 0 },
  {  8820, 1572,  2, 239042,   4600.000, 0x00000000, 0 },
  {  8821, 1572,  3, 239042,   4900.000, 0x00000000, 0 },
  {  8822, 1572,  4, 239042,   5200.000, 0x00000000, 0 },
  {  8823, 1572,  5, 239042,   5500.000, 0x00000000, 0 },
  {  8824, 1572,  6, 239042,   5800.000, 0x00000000, 0 },
  {  8825, 1572,  7, 239042,   6100.000, 0x00000000, 0 },
  {  8826, 1572,  8, 239042,   6400.000, 0x00000000, 0 },
  {  8827, 1572,  9, 239042,   6700.000, 0x00000000, 0 },
  {  8828, 1572, 10, 239042,   7000.000, 0x00000000, 0 },
  {  8829, 1572, 11, 239042,   7300.000, 0x00000000, 0 },
  {  8830, 1572, 12, 239042,   7600.000, 0x00000000, 0 },
  {  8831, 1572, 13, 239042,   7900.000, 0x00000000, 0 },
  {  8832, 1572, 14, 239042,   8200.000, 0x00000000, 0 },
  {  8833, 1572, 15, 239042,   8500.000, 0x00000000, 0 },
  {  8834, 1572, 16, 239042,   8800.000, 0x00000000, 0 },
  {  8835, 1572, 17, 239042,   9100.000, 0x00000000, 0 },
  {  8836, 1572, 18, 239042,   9400.000, 0x00000000, 0 },
  {  8837, 1572, 19, 239042,   9700.000, 0x00000000, 0 },
  {  8838, 1572, 20, 239042,  10000.000, 0x00000000, 0 },
  {  8839, 1572, 21, 239042,  10300.000, 0x00000000, 0 },
  {  8840, 1572, 22, 239042,  10600.000, 0x00000000, 0 },
  {  8841, 1572, 23, 239042,  10900.000, 0x00000000, 0 },
  {  8842, 1572, 24, 239042,  11200.000, 0x00000000, 0 },
  {  8843, 1572, 25, 239042,  11500.000, 0x00000000, 0 },
  {  8844, 1572, 26, 239042,  11800.000, 0x00000000, 0 },
  {  8845, 1572, 27, 239042,  12100.000, 0x00000000, 0 },
  {  8846, 1572, 28, 239042,  12400.000, 0x00000000, 0 },
  {  8847, 1572, 29, 239042,  12700.000, 0x00000000, 0 },
  {  8848, 1572, 30, 239042,  13000.000, 0x00000000, 0 },
  {  8849, 1572, 31, 239042,  13300.000, 0x00000000, 0 },
  {  8850, 1572, 32, 239042,  13600.000, 0x00000000, 0 },
  {  8851, 1572, 33, 239042,  13900.000, 0x00000000, 0 },
  {  8852, 1572, 34, 239042,  14200.000, 0x00000000, 0 },
  {  8853, 1572, 35, 239042,  14500.000, 0x00000000, 0 },
  {  8854, 1572, 36, 239042,  14800.000, 0x00000000, 0 },
  {  8855, 1572, 37, 239042,  15100.000, 0x00000000, 0 },
  {  8856, 1572, 38, 239042,  15400.000, 0x00000000, 0 },
  {  8857, 1572, 39, 239042,  15700.000, 0x00000000, 0 },
  {  8858, 1572, 40, 239042,  16000.000, 0x00000000, 0 },
  {  8859, 1572, 41, 239042,  16300.000, 0x00000000, 0 },
  {  8860, 1572, 42, 239042,  16600.000, 0x00000000, 0 },
  {  8861, 1572, 43, 239042,  16900.000, 0x00000000, 0 },
  {  8862, 1572, 44, 239042,  17200.000, 0x00000000, 0 },
  {  8863, 1572, 45, 239042,  17500.000, 0x00000000, 0 },
  {  8864, 1572, 46, 239042,  17800.000, 0x00000000, 0 },
  {  8865, 1572, 47, 239042,  18100.000, 0x00000000, 0 },
  {  8866, 1572, 48, 239042,  18400.000, 0x00000000, 0 },
  {  8867, 1572, 49, 239042,  18700.000, 0x00000000, 0 },
  { 10735, 1572, 50, 239042,  19000.000, 0x00000000, 0 },
  { 10736, 1572, 51, 239042,  19300.000, 0x00000000, 0 },
  { 10737, 1572, 52, 239042,  19600.000, 0x00000000, 0 },
  { 10738, 1572, 53, 239042,  19900.000, 0x00000000, 0 },
  { 10739, 1572, 54, 239042,  20200.000, 0x00000000, 0 },
  { 10740, 1572, 55, 239042,  20500.000, 0x00000000, 0 },
  { 10741, 1572, 56, 239042,  20800.000, 0x00000000, 0 },
  { 10742, 1572, 57, 239042,  21100.000, 0x00000000, 0 },
  { 10743, 1572, 58, 239042,  21400.000, 0x00000000, 0 },
  { 10744, 1572, 59, 239042,  21700.000, 0x00000000, 0 },
  { 10745, 1572, 60, 239042,  22000.000, 0x00000000, 0 },
  { 10746, 1572, 61, 239042,  22300.000, 0x00000000, 0 },
  { 10747, 1572, 62, 239042,  22600.000, 0x00000000, 0 },
  { 10748, 1572, 63, 239042,  22900.000, 0x00000000, 0 },
  { 10749, 1572, 64, 239042,  23200.000, 0x00000000, 0 },
  { 10750, 1572, 65, 239042,  23500.000, 0x00000000, 0 },
  { 10751, 1572, 66, 239042,  23800.000, 0x00000000, 0 },
  { 10752, 1572, 67, 239042,  24100.000, 0x00000000, 0 },
  { 10753, 1572, 68, 239042,  24400.000, 0x00000000, 0 },
  { 10754, 1572, 69, 239042,  24700.000, 0x00000000, 0 },
  { 10755, 1572, 70, 239042,  25000.000, 0x00000000, 0 },
  { 10756, 1572, 71, 239042,  25300.000, 0x00000000, 0 },
  { 10757, 1572, 72, 239042,  25600.000, 0x00000000, 0 },
  { 10758, 1572, 73, 239042,  25900.000, 0x00000000, 0 },
  { 10759, 1572, 74, 239042,  26200.000, 0x00000000, 0 },
  { 10760, 1572, 75, 239042,  26500.000, 0x00000000, 0 },
  { 10761, 1572, 76, 239042,  26800.000, 0x00000000, 0 },
  { 10762, 1572, 77, 239042,  27100.000, 0x00000000, 0 },
  { 10763, 1572, 78, 239042,  27400.000, 0x00000000, 0 },
  { 10764, 1572, 79, 239042,  27700.000, 0x00000000, 0 },
  { 10765, 1572, 80, 239042,  28000.000, 0x00000000, 0 },
  { 10766, 1572, 81, 239042,  28300.000, 0x00000000, 0 },
  { 10767, 1572, 82, 239042,  28600.000, 0x00000000, 0 },
  { 10768, 1572, 83, 239042,  28900.000, 0x00000000, 0 },
  { 10769, 1572, 84, 239042,  29200.000, 0x00000000, 0 },
  { 10770, 1572, 85, 239042,  29500.000, 0x00000000, 0 },
  { 10771, 1572, 86, 239042,  29800.000, 0x00000000, 0 },
  { 10772, 1572, 87, 239042,  30100.000, 0x00000000, 0 },
  { 10773, 1572, 88, 239042,  30400.000, 0x00000000, 0 },
  { 10774, 1572, 89, 239042,  30700.000, 0x00000000, 0 },
  { 10775, 1572, 90, 239042,  31000.000, 0x00000000, 0 },
  { 10776, 1572, 91, 239042,  31300.000, 0x00000000, 0 },
  { 10777, 1572, 92, 239042,  31600.000, 0x00000000, 0 },
  { 10778, 1572, 93, 239042,  31900.000, 0x00000000, 0 },
  { 10779, 1572, 94, 239042,  32200.000, 0x00000000, 0 },
  { 10780, 1572, 95, 239042,  32500.000, 0x00000000, 0 },
  { 10781, 1572, 96, 239042,  32800.000, 0x00000000, 0 },
  { 10782, 1572, 97, 239042,  33100.000, 0x00000000, 0 },
  { 10783, 1572, 98, 239042,  33400.000, 0x00000000, 0 },
  { 10784, 1572, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6709, 1573,  0, 238065,   4500.000, 0x00000000, 0 },
  {  7506, 1573,  1, 238065,   9000.000, 0x00000000, 0 },
  {  7507, 1573,  2, 238065,  13500.000, 0x00000000, 0 },
  {  7508, 1573,  3, 238065,  18000.000, 0x00000000, 0 },
  {  7509, 1573,  4, 238065,  22500.000, 0x00000000, 0 },
  {  7510, 1573,  5, 238065,  27000.000, 0x00000000, 0 },
  {  7511, 1573,  6, 238065,  31500.000, 0x00000000, 0 },
  {  7512, 1573,  7, 238065,  36000.000, 0x00000000, 0 },
  {  6710, 1574,  0, 238101,      0.000, 0x00000000, 0 },
  {  6711, 1575,  0, 238137,      0.000, 0x00000000, 0 },
  {  6712, 1576,  0, 239042,   4000.000, 0x00000000, 0 },
  {  8869, 1576,  1, 239042,   4300.000, 0x00000000, 0 },
  {  8870, 1576,  2, 239042,   4600.000, 0x00000000, 0 },
  {  8871, 1576,  3, 239042,   4900.000, 0x00000000, 0 },
  {  8872, 1576,  4, 239042,   5200.000, 0x00000000, 0 },
  {  8873, 1576,  5, 239042,   5500.000, 0x00000000, 0 },
  {  8874, 1576,  6, 239042,   5800.000, 0x00000000, 0 },
  {  8875, 1576,  7, 239042,   6100.000, 0x00000000, 0 },
  {  8876, 1576,  8, 239042,   6400.000, 0x00000000, 0 },
  {  8877, 1576,  9, 239042,   6700.000, 0x00000000, 0 },
  {  8878, 1576, 10, 239042,   7000.000, 0x00000000, 0 },
  {  8879, 1576, 11, 239042,   7300.000, 0x00000000, 0 },
  {  8880, 1576, 12, 239042,   7600.000, 0x00000000, 0 },
  {  8881, 1576, 13, 239042,   7900.000, 0x00000000, 0 },
  {  8882, 1576, 14, 239042,   8200.000, 0x00000000, 0 },
  {  8883, 1576, 15, 239042,   8500.000, 0x00000000, 0 },
  {  8884, 1576, 16, 239042,   8800.000, 0x00000000, 0 },
  {  8885, 1576, 17, 239042,   9100.000, 0x00000000, 0 },
  {  8886, 1576, 18, 239042,   9400.000, 0x00000000, 0 },
  {  8887, 1576, 19, 239042,   9700.000, 0x00000000, 0 },
  {  8888, 1576, 20, 239042,  10000.000, 0x00000000, 0 },
  {  8889, 1576, 21, 239042,  10300.000, 0x00000000, 0 },
  {  8890, 1576, 22, 239042,  10600.000, 0x00000000, 0 },
  {  8891, 1576, 23, 239042,  10900.000, 0x00000000, 0 },
  {  8892, 1576, 24, 239042,  11200.000, 0x00000000, 0 },
  {  8893, 1576, 25, 239042,  11500.000, 0x00000000, 0 },
  {  8894, 1576, 26, 239042,  11800.000, 0x00000000, 0 },
  {  8895, 1576, 27, 239042,  12100.000, 0x00000000, 0 },
  {  8896, 1576, 28, 239042,  12400.000, 0x00000000, 0 },
  {  8897, 1576, 29, 239042,  12700.000, 0x00000000, 0 },
  {  8898, 1576, 30, 239042,  13000.000, 0x00000000, 0 },
  {  8899, 1576, 31, 239042,  13300.000, 0x00000000, 0 },
  {  8900, 1576, 32, 239042,  13600.000, 0x00000000, 0 },
  {  8901, 1576, 33, 239042,  13900.000, 0x00000000, 0 },
  {  8902, 1576, 34, 239042,  14200.000, 0x00000000, 0 },
  {  8903, 1576, 35, 239042,  14500.000, 0x00000000, 0 },
  {  8904, 1576, 36, 239042,  14800.000, 0x00000000, 0 },
  {  8905, 1576, 37, 239042,  15100.000, 0x00000000, 0 },
  {  8906, 1576, 38, 239042,  15400.000, 0x00000000, 0 },
  {  8907, 1576, 39, 239042,  15700.000, 0x00000000, 0 },
  {  8908, 1576, 40, 239042,  16000.000, 0x00000000, 0 },
  {  8909, 1576, 41, 239042,  16300.000, 0x00000000, 0 },
  {  8910, 1576, 42, 239042,  16600.000, 0x00000000, 0 },
  {  8911, 1576, 43, 239042,  16900.000, 0x00000000, 0 },
  {  8912, 1576, 44, 239042,  17200.000, 0x00000000, 0 },
  {  8913, 1576, 45, 239042,  17500.000, 0x00000000, 0 },
  {  8914, 1576, 46, 239042,  17800.000, 0x00000000, 0 },
  {  8915, 1576, 47, 239042,  18100.000, 0x00000000, 0 },
  {  8916, 1576, 48, 239042,  18400.000, 0x00000000, 0 },
  {  8917, 1576, 49, 239042,  18700.000, 0x00000000, 0 },
  { 10785, 1576, 50, 239042,  19000.000, 0x00000000, 0 },
  { 10786, 1576, 51, 239042,  19300.000, 0x00000000, 0 },
  { 10787, 1576, 52, 239042,  19600.000, 0x00000000, 0 },
  { 10788, 1576, 53, 239042,  19900.000, 0x00000000, 0 },
  { 10789, 1576, 54, 239042,  20200.000, 0x00000000, 0 },
  { 10790, 1576, 55, 239042,  20500.000, 0x00000000, 0 },
  { 10791, 1576, 56, 239042,  20800.000, 0x00000000, 0 },
  { 10792, 1576, 57, 239042,  21100.000, 0x00000000, 0 },
  { 10793, 1576, 58, 239042,  21400.000, 0x00000000, 0 },
  { 10794, 1576, 59, 239042,  21700.000, 0x00000000, 0 },
  { 10795, 1576, 60, 239042,  22000.000, 0x00000000, 0 },
  { 10796, 1576, 61, 239042,  22300.000, 0x00000000, 0 },
  { 10797, 1576, 62, 239042,  22600.000, 0x00000000, 0 },
  { 10798, 1576, 63, 239042,  22900.000, 0x00000000, 0 },
  { 10799, 1576, 64, 239042,  23200.000, 0x00000000, 0 },
  { 10800, 1576, 65, 239042,  23500.000, 0x00000000, 0 },
  { 10801, 1576, 66, 239042,  23800.000, 0x00000000, 0 },
  { 10802, 1576, 67, 239042,  24100.000, 0x00000000, 0 },
  { 10803, 1576, 68, 239042,  24400.000, 0x00000000, 0 },
  { 10804, 1576, 69, 239042,  24700.000, 0x00000000, 0 },
  { 10805, 1576, 70, 239042,  25000.000, 0x00000000, 0 },
  { 10806, 1576, 71, 239042,  25300.000, 0x00000000, 0 },
  { 10807, 1576, 72, 239042,  25600.000, 0x00000000, 0 },
  { 10808, 1576, 73, 239042,  25900.000, 0x00000000, 0 },
  { 10809, 1576, 74, 239042,  26200.000, 0x00000000, 0 },
  { 10810, 1576, 75, 239042,  26500.000, 0x00000000, 0 },
  { 10811, 1576, 76, 239042,  26800.000, 0x00000000, 0 },
  { 10812, 1576, 77, 239042,  27100.000, 0x00000000, 0 },
  { 10813, 1576, 78, 239042,  27400.000, 0x00000000, 0 },
  { 10814, 1576, 79, 239042,  27700.000, 0x00000000, 0 },
  { 10815, 1576, 80, 239042,  28000.000, 0x00000000, 0 },
  { 10816, 1576, 81, 239042,  28300.000, 0x00000000, 0 },
  { 10817, 1576, 82, 239042,  28600.000, 0x00000000, 0 },
  { 10818, 1576, 83, 239042,  28900.000, 0x00000000, 0 },
  { 10819, 1576, 84, 239042,  29200.000, 0x00000000, 0 },
  { 10820, 1576, 85, 239042,  29500.000, 0x00000000, 0 },
  { 10821, 1576, 86, 239042,  29800.000, 0x00000000, 0 },
  { 10822, 1576, 87, 239042,  30100.000, 0x00000000, 0 },
  { 10823, 1576, 88, 239042,  30400.000, 0x00000000, 0 },
  { 10824, 1576, 89, 239042,  30700.000, 0x00000000, 0 },
  { 10825, 1576, 90, 239042,  31000.000, 0x00000000, 0 },
  { 10826, 1576, 91, 239042,  31300.000, 0x00000000, 0 },
  { 10827, 1576, 92, 239042,  31600.000, 0x00000000, 0 },
  { 10828, 1576, 93, 239042,  31900.000, 0x00000000, 0 },
  { 10829, 1576, 94, 239042,  32200.000, 0x00000000, 0 },
  { 10830, 1576, 95, 239042,  32500.000, 0x00000000, 0 },
  { 10831, 1576, 96, 239042,  32800.000, 0x00000000, 0 },
  { 10832, 1576, 97, 239042,  33100.000, 0x00000000, 0 },
  { 10833, 1576, 98, 239042,  33400.000, 0x00000000, 0 },
  { 10834, 1576, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6713, 1577,  0, 238066,      4.000, 0x00000000, 0 },
  {  7513, 1577,  1, 238066,      8.000, 0x00000000, 0 },
  {  7514, 1577,  2, 238066,     12.000, 0x00000000, 0 },
  {  7515, 1577,  3, 238066,     16.000, 0x00000000, 0 },
  {  7516, 1577,  4, 238066,     20.000, 0x00000000, 0 },
  {  7517, 1577,  5, 238066,     24.000, 0x00000000, 0 },
  {  7518, 1577,  6, 238066,     28.000, 0x00000000, 0 },
  {  7519, 1577,  7, 238066,     32.000, 0x00000000, 0 },
  {  6714, 1578,  0, 238102,      0.000, 0x00000000, 0 },
  {  6715, 1579,  0, 238138,      0.000, 0x00000000, 0 },
  {  6716, 1580,  0, 239042,   4000.000, 0x00000000, 0 },
  {  8919, 1580,  1, 239042,   4300.000, 0x00000000, 0 },
  {  8920, 1580,  2, 239042,   4600.000, 0x00000000, 0 },
  {  8921, 1580,  3, 239042,   4900.000, 0x00000000, 0 },
  {  8922, 1580,  4, 239042,   5200.000, 0x00000000, 0 },
  {  8923, 1580,  5, 239042,   5500.000, 0x00000000, 0 },
  {  8924, 1580,  6, 239042,   5800.000, 0x00000000, 0 },
  {  8925, 1580,  7, 239042,   6100.000, 0x00000000, 0 },
  {  8926, 1580,  8, 239042,   6400.000, 0x00000000, 0 },
  {  8927, 1580,  9, 239042,   6700.000, 0x00000000, 0 },
  {  8928, 1580, 10, 239042,   7000.000, 0x00000000, 0 },
  {  8929, 1580, 11, 239042,   7300.000, 0x00000000, 0 },
  {  8930, 1580, 12, 239042,   7600.000, 0x00000000, 0 },
  {  8931, 1580, 13, 239042,   7900.000, 0x00000000, 0 },
  {  8932, 1580, 14, 239042,   8200.000, 0x00000000, 0 },
  {  8933, 1580, 15, 239042,   8500.000, 0x00000000, 0 },
  {  8934, 1580, 16, 239042,   8800.000, 0x00000000, 0 },
  {  8935, 1580, 17, 239042,   9100.000, 0x00000000, 0 },
  {  8936, 1580, 18, 239042,   9400.000, 0x00000000, 0 },
  {  8937, 1580, 19, 239042,   9700.000, 0x00000000, 0 },
  {  8938, 1580, 20, 239042,  10000.000, 0x00000000, 0 },
  {  8939, 1580, 21, 239042,  10300.000, 0x00000000, 0 },
  {  8940, 1580, 22, 239042,  10600.000, 0x00000000, 0 },
  {  8941, 1580, 23, 239042,  10900.000, 0x00000000, 0 },
  {  8942, 1580, 24, 239042,  11200.000, 0x00000000, 0 },
  {  8943, 1580, 25, 239042,  11500.000, 0x00000000, 0 },
  {  8944, 1580, 26, 239042,  11800.000, 0x00000000, 0 },
  {  8945, 1580, 27, 239042,  12100.000, 0x00000000, 0 },
  {  8946, 1580, 28, 239042,  12400.000, 0x00000000, 0 },
  {  8947, 1580, 29, 239042,  12700.000, 0x00000000, 0 },
  {  8948, 1580, 30, 239042,  13000.000, 0x00000000, 0 },
  {  8949, 1580, 31, 239042,  13300.000, 0x00000000, 0 },
  {  8950, 1580, 32, 239042,  13600.000, 0x00000000, 0 },
  {  8951, 1580, 33, 239042,  13900.000, 0x00000000, 0 },
  {  8952, 1580, 34, 239042,  14200.000, 0x00000000, 0 },
  {  8953, 1580, 35, 239042,  14500.000, 0x00000000, 0 },
  {  8954, 1580, 36, 239042,  14800.000, 0x00000000, 0 },
  {  8955, 1580, 37, 239042,  15100.000, 0x00000000, 0 },
  {  8956, 1580, 38, 239042,  15400.000, 0x00000000, 0 },
  {  8957, 1580, 39, 239042,  15700.000, 0x00000000, 0 },
  {  8958, 1580, 40, 239042,  16000.000, 0x00000000, 0 },
  {  8959, 1580, 41, 239042,  16300.000, 0x00000000, 0 },
  {  8960, 1580, 42, 239042,  16600.000, 0x00000000, 0 },
  {  8961, 1580, 43, 239042,  16900.000, 0x00000000, 0 },
  {  8962, 1580, 44, 239042,  17200.000, 0x00000000, 0 },
  {  8963, 1580, 45, 239042,  17500.000, 0x00000000, 0 },
  {  8964, 1580, 46, 239042,  17800.000, 0x00000000, 0 },
  {  8965, 1580, 47, 239042,  18100.000, 0x00000000, 0 },
  {  8966, 1580, 48, 239042,  18400.000, 0x00000000, 0 },
  {  8967, 1580, 49, 239042,  18700.000, 0x00000000, 0 },
  { 10835, 1580, 50, 239042,  19000.000, 0x00000000, 0 },
  { 10836, 1580, 51, 239042,  19300.000, 0x00000000, 0 },
  { 10837, 1580, 52, 239042,  19600.000, 0x00000000, 0 },
  { 10838, 1580, 53, 239042,  19900.000, 0x00000000, 0 },
  { 10839, 1580, 54, 239042,  20200.000, 0x00000000, 0 },
  { 10840, 1580, 55, 239042,  20500.000, 0x00000000, 0 },
  { 10841, 1580, 56, 239042,  20800.000, 0x00000000, 0 },
  { 10842, 1580, 57, 239042,  21100.000, 0x00000000, 0 },
  { 10843, 1580, 58, 239042,  21400.000, 0x00000000, 0 },
  { 10844, 1580, 59, 239042,  21700.000, 0x00000000, 0 },
  { 10845, 1580, 60, 239042,  22000.000, 0x00000000, 0 },
  { 10846, 1580, 61, 239042,  22300.000, 0x00000000, 0 },
  { 10847, 1580, 62, 239042,  22600.000, 0x00000000, 0 },
  { 10848, 1580, 63, 239042,  22900.000, 0x00000000, 0 },
  { 10849, 1580, 64, 239042,  23200.000, 0x00000000, 0 },
  { 10850, 1580, 65, 239042,  23500.000, 0x00000000, 0 },
  { 10851, 1580, 66, 239042,  23800.000, 0x00000000, 0 },
  { 10852, 1580, 67, 239042,  24100.000, 0x00000000, 0 },
  { 10853, 1580, 68, 239042,  24400.000, 0x00000000, 0 },
  { 10854, 1580, 69, 239042,  24700.000, 0x00000000, 0 },
  { 10855, 1580, 70, 239042,  25000.000, 0x00000000, 0 },
  { 10856, 1580, 71, 239042,  25300.000, 0x00000000, 0 },
  { 10857, 1580, 72, 239042,  25600.000, 0x00000000, 0 },
  { 10858, 1580, 73, 239042,  25900.000, 0x00000000, 0 },
  { 10859, 1580, 74, 239042,  26200.000, 0x00000000, 0 },
  { 10860, 1580, 75, 239042,  26500.000, 0x00000000, 0 },
  { 10861, 1580, 76, 239042,  26800.000, 0x00000000, 0 },
  { 10862, 1580, 77, 239042,  27100.000, 0x00000000, 0 },
  { 10863, 1580, 78, 239042,  27400.000, 0x00000000, 0 },
  { 10864, 1580, 79, 239042,  27700.000, 0x00000000, 0 },
  { 10865, 1580, 80, 239042,  28000.000, 0x00000000, 0 },
  { 10866, 1580, 81, 239042,  28300.000, 0x00000000, 0 },
  { 10867, 1580, 82, 239042,  28600.000, 0x00000000, 0 },
  { 10868, 1580, 83, 239042,  28900.000, 0x00000000, 0 },
  { 10869, 1580, 84, 239042,  29200.000, 0x00000000, 0 },
  { 10870, 1580, 85, 239042,  29500.000, 0x00000000, 0 },
  { 10871, 1580, 86, 239042,  29800.000, 0x00000000, 0 },
  { 10872, 1580, 87, 239042,  30100.000, 0x00000000, 0 },
  { 10873, 1580, 88, 239042,  30400.000, 0x00000000, 0 },
  { 10874, 1580, 89, 239042,  30700.000, 0x00000000, 0 },
  { 10875, 1580, 90, 239042,  31000.000, 0x00000000, 0 },
  { 10876, 1580, 91, 239042,  31300.000, 0x00000000, 0 },
  { 10877, 1580, 92, 239042,  31600.000, 0x00000000, 0 },
  { 10878, 1580, 93, 239042,  31900.000, 0x00000000, 0 },
  { 10879, 1580, 94, 239042,  32200.000, 0x00000000, 0 },
  { 10880, 1580, 95, 239042,  32500.000, 0x00000000, 0 },
  { 10881, 1580, 96, 239042,  32800.000, 0x00000000, 0 },
  { 10882, 1580, 97, 239042,  33100.000, 0x00000000, 0 },
  { 10883, 1580, 98, 239042,  33400.000, 0x00000000, 0 },
  { 10884, 1580, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6717, 1581,  0, 238067,     10.000, 0x00000000, 0 },
  {  7520, 1581,  1, 238067,     20.000, 0x00000000, 0 },
  {  7521, 1581,  2, 238067,     30.000, 0x00000000, 0 },
  {  7522, 1581,  3, 238067,     40.000, 0x00000000, 0 },
  {  7523, 1581,  4, 238067,     50.000, 0x00000000, 0 },
  {  7524, 1581,  5, 238067,     60.000, 0x00000000, 0 },
  {  7525, 1581,  6, 238067,     70.000, 0x00000000, 0 },
  {  7526, 1581,  7, 238067,     80.000, 0x00000000, 0 },
  {  6718, 1582,  0, 238103,      0.000, 0x00000000, 0 },
  {  6719, 1583,  0, 238139,      0.000, 0x00000000, 0 },
  {  6720, 1584,  0, 239042,   4000.000, 0x00000000, 0 },
  {  8969, 1584,  1, 239042,   4300.000, 0x00000000, 0 },
  {  8970, 1584,  2, 239042,   4600.000, 0x00000000, 0 },
  {  8971, 1584,  3, 239042,   4900.000, 0x00000000, 0 },
  {  8972, 1584,  4, 239042,   5200.000, 0x00000000, 0 },
  {  8973, 1584,  5, 239042,   5500.000, 0x00000000, 0 },
  {  8974, 1584,  6, 239042,   5800.000, 0x00000000, 0 },
  {  8975, 1584,  7, 239042,   6100.000, 0x00000000, 0 },
  {  8976, 1584,  8, 239042,   6400.000, 0x00000000, 0 },
  {  8977, 1584,  9, 239042,   6700.000, 0x00000000, 0 },
  {  8978, 1584, 10, 239042,   7000.000, 0x00000000, 0 },
  {  8979, 1584, 11, 239042,   7300.000, 0x00000000, 0 },
  {  8980, 1584, 12, 239042,   7600.000, 0x00000000, 0 },
  {  8981, 1584, 13, 239042,   7900.000, 0x00000000, 0 },
  {  8982, 1584, 14, 239042,   8200.000, 0x00000000, 0 },
  {  8983, 1584, 15, 239042,   8500.000, 0x00000000, 0 },
  {  8984, 1584, 16, 239042,   8800.000, 0x00000000, 0 },
  {  8985, 1584, 17, 239042,   9100.000, 0x00000000, 0 },
  {  8986, 1584, 18, 239042,   9400.000, 0x00000000, 0 },
  {  8987, 1584, 19, 239042,   9700.000, 0x00000000, 0 },
  {  8988, 1584, 20, 239042,  10000.000, 0x00000000, 0 },
  {  8989, 1584, 21, 239042,  10300.000, 0x00000000, 0 },
  {  8990, 1584, 22, 239042,  10600.000, 0x00000000, 0 },
  {  8991, 1584, 23, 239042,  10900.000, 0x00000000, 0 },
  {  8992, 1584, 24, 239042,  11200.000, 0x00000000, 0 },
  {  8993, 1584, 25, 239042,  11500.000, 0x00000000, 0 },
  {  8994, 1584, 26, 239042,  11800.000, 0x00000000, 0 },
  {  8995, 1584, 27, 239042,  12100.000, 0x00000000, 0 },
  {  8996, 1584, 28, 239042,  12400.000, 0x00000000, 0 },
  {  8997, 1584, 29, 239042,  12700.000, 0x00000000, 0 },
  {  8998, 1584, 30, 239042,  13000.000, 0x00000000, 0 },
  {  8999, 1584, 31, 239042,  13300.000, 0x00000000, 0 },
  {  9000, 1584, 32, 239042,  13600.000, 0x00000000, 0 },
  {  9001, 1584, 33, 239042,  13900.000, 0x00000000, 0 },
  {  9002, 1584, 34, 239042,  14200.000, 0x00000000, 0 },
  {  9003, 1584, 35, 239042,  14500.000, 0x00000000, 0 },
  {  9004, 1584, 36, 239042,  14800.000, 0x00000000, 0 },
  {  9005, 1584, 37, 239042,  15100.000, 0x00000000, 0 },
  {  9006, 1584, 38, 239042,  15400.000, 0x00000000, 0 },
  {  9007, 1584, 39, 239042,  15700.000, 0x00000000, 0 },
  {  9008, 1584, 40, 239042,  16000.000, 0x00000000, 0 },
  {  9009, 1584, 41, 239042,  16300.000, 0x00000000, 0 },
  {  9010, 1584, 42, 239042,  16600.000, 0x00000000, 0 },
  {  9011, 1584, 43, 239042,  16900.000, 0x00000000, 0 },
  {  9012, 1584, 44, 239042,  17200.000, 0x00000000, 0 },
  {  9013, 1584, 45, 239042,  17500.000, 0x00000000, 0 },
  {  9014, 1584, 46, 239042,  17800.000, 0x00000000, 0 },
  {  9015, 1584, 47, 239042,  18100.000, 0x00000000, 0 },
  {  9016, 1584, 48, 239042,  18400.000, 0x00000000, 0 },
  {  9017, 1584, 49, 239042,  18700.000, 0x00000000, 0 },
  { 10885, 1584, 50, 239042,  19000.000, 0x00000000, 0 },
  { 10886, 1584, 51, 239042,  19300.000, 0x00000000, 0 },
  { 10887, 1584, 52, 239042,  19600.000, 0x00000000, 0 },
  { 10888, 1584, 53, 239042,  19900.000, 0x00000000, 0 },
  { 10889, 1584, 54, 239042,  20200.000, 0x00000000, 0 },
  { 10890, 1584, 55, 239042,  20500.000, 0x00000000, 0 },
  { 10891, 1584, 56, 239042,  20800.000, 0x00000000, 0 },
  { 10892, 1584, 57, 239042,  21100.000, 0x00000000, 0 },
  { 10893, 1584, 58, 239042,  21400.000, 0x00000000, 0 },
  { 10894, 1584, 59, 239042,  21700.000, 0x00000000, 0 },
  { 10895, 1584, 60, 239042,  22000.000, 0x00000000, 0 },
  { 10896, 1584, 61, 239042,  22300.000, 0x00000000, 0 },
  { 10897, 1584, 62, 239042,  22600.000, 0x00000000, 0 },
  { 10898, 1584, 63, 239042,  22900.000, 0x00000000, 0 },
  { 10899, 1584, 64, 239042,  23200.000, 0x00000000, 0 },
  { 10900, 1584, 65, 239042,  23500.000, 0x00000000, 0 },
  { 10901, 1584, 66, 239042,  23800.000, 0x00000000, 0 },
  { 10902, 1584, 67, 239042,  24100.000, 0x00000000, 0 },
  { 10903, 1584, 68, 239042,  24400.000, 0x00000000, 0 },
  { 10904, 1584, 69, 239042,  24700.000, 0x00000000, 0 },
  { 10905, 1584, 70, 239042,  25000.000, 0x00000000, 0 },
  { 10906, 1584, 71, 239042,  25300.000, 0x00000000, 0 },
  { 10907, 1584, 72, 239042,  25600.000, 0x00000000, 0 },
  { 10908, 1584, 73, 239042,  25900.000, 0x00000000, 0 },
  { 10909, 1584, 74, 239042,  26200.000, 0x00000000, 0 },
  { 10910, 1584, 75, 239042,  26500.000, 0x00000000, 0 },
  { 10911, 1584, 76, 239042,  26800.000, 0x00000000, 0 },
  { 10912, 1584, 77, 239042,  27100.000, 0x00000000, 0 },
  { 10913, 1584, 78, 239042,  27400.000, 0x00000000, 0 },
  { 10914, 1584, 79, 239042,  27700.000, 0x00000000, 0 },
  { 10915, 1584, 80, 239042,  28000.000, 0x00000000, 0 },
  { 10916, 1584, 81, 239042,  28300.000, 0x00000000, 0 },
  { 10917, 1584, 82, 239042,  28600.000, 0x00000000, 0 },
  { 10918, 1584, 83, 239042,  28900.000, 0x00000000, 0 },
  { 10919, 1584, 84, 239042,  29200.000, 0x00000000, 0 },
  { 10920, 1584, 85, 239042,  29500.000, 0x00000000, 0 },
  { 10921, 1584, 86, 239042,  29800.000, 0x00000000, 0 },
  { 10922, 1584, 87, 239042,  30100.000, 0x00000000, 0 },
  { 10923, 1584, 88, 239042,  30400.000, 0x00000000, 0 },
  { 10924, 1584, 89, 239042,  30700.000, 0x00000000, 0 },
  { 10925, 1584, 90, 239042,  31000.000, 0x00000000, 0 },
  { 10926, 1584, 91, 239042,  31300.000, 0x00000000, 0 },
  { 10927, 1584, 92, 239042,  31600.000, 0x00000000, 0 },
  { 10928, 1584, 93, 239042,  31900.000, 0x00000000, 0 },
  { 10929, 1584, 94, 239042,  32200.000, 0x00000000, 0 },
  { 10930, 1584, 95, 239042,  32500.000, 0x00000000, 0 },
  { 10931, 1584, 96, 239042,  32800.000, 0x00000000, 0 },
  { 10932, 1584, 97, 239042,  33100.000, 0x00000000, 0 },
  { 10933, 1584, 98, 239042,  33400.000, 0x00000000, 0 },
  { 10934, 1584, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6721, 1585,  0, 238068,     16.000, 0x00000000, 0 },
  {  7527, 1585,  1, 238068,     32.000, 0x00000000, 0 },
  {  7528, 1585,  2, 238068,     48.000, 0x00000000, 0 },
  {  7529, 1585,  3, 238068,     64.000, 0x00000000, 0 },
  {  7530, 1585,  4, 238068,     80.000, 0x00000000, 0 },
  {  7531, 1585,  5, 238068,     96.000, 0x00000000, 0 },
  {  7532, 1585,  6, 238068,    112.000, 0x00000000, 0 },
  {  7533, 1585,  7, 238068,    128.000, 0x00000000, 0 },
  {  6722, 1586,  0, 242707,      0.000, 0x00000000, 0 },
  {  6723, 1587,  0, 238140,      0.000, 0x00000000, 0 },
  {  6724, 1588,  0, 239042,   4000.000, 0x00000000, 0 },
  {  9019, 1588,  1, 239042,   4300.000, 0x00000000, 0 },
  {  9020, 1588,  2, 239042,   4600.000, 0x00000000, 0 },
  {  9021, 1588,  3, 239042,   4900.000, 0x00000000, 0 },
  {  9022, 1588,  4, 239042,   5200.000, 0x00000000, 0 },
  {  9023, 1588,  5, 239042,   5500.000, 0x00000000, 0 },
  {  9024, 1588,  6, 239042,   5800.000, 0x00000000, 0 },
  {  9025, 1588,  7, 239042,   6100.000, 0x00000000, 0 },
  {  9026, 1588,  8, 239042,   6400.000, 0x00000000, 0 },
  {  9027, 1588,  9, 239042,   6700.000, 0x00000000, 0 },
  {  9028, 1588, 10, 239042,   7000.000, 0x00000000, 0 },
  {  9029, 1588, 11, 239042,   7300.000, 0x00000000, 0 },
  {  9030, 1588, 12, 239042,   7600.000, 0x00000000, 0 },
  {  9031, 1588, 13, 239042,   7900.000, 0x00000000, 0 },
  {  9032, 1588, 14, 239042,   8200.000, 0x00000000, 0 },
  {  9033, 1588, 15, 239042,   8500.000, 0x00000000, 0 },
  {  9034, 1588, 16, 239042,   8800.000, 0x00000000, 0 },
  {  9035, 1588, 17, 239042,   9100.000, 0x00000000, 0 },
  {  9036, 1588, 18, 239042,   9400.000, 0x00000000, 0 },
  {  9037, 1588, 19, 239042,   9700.000, 0x00000000, 0 },
  {  9038, 1588, 20, 239042,  10000.000, 0x00000000, 0 },
  {  9039, 1588, 21, 239042,  10300.000, 0x00000000, 0 },
  {  9040, 1588, 22, 239042,  10600.000, 0x00000000, 0 },
  {  9041, 1588, 23, 239042,  10900.000, 0x00000000, 0 },
  {  9042, 1588, 24, 239042,  11200.000, 0x00000000, 0 },
  {  9043, 1588, 25, 239042,  11500.000, 0x00000000, 0 },
  {  9044, 1588, 26, 239042,  11800.000, 0x00000000, 0 },
  {  9045, 1588, 27, 239042,  12100.000, 0x00000000, 0 },
  {  9046, 1588, 28, 239042,  12400.000, 0x00000000, 0 },
  {  9047, 1588, 29, 239042,  12700.000, 0x00000000, 0 },
  {  9048, 1588, 30, 239042,  13000.000, 0x00000000, 0 },
  {  9049, 1588, 31, 239042,  13300.000, 0x00000000, 0 },
  {  9050, 1588, 32, 239042,  13600.000, 0x00000000, 0 },
  {  9051, 1588, 33, 239042,  13900.000, 0x00000000, 0 },
  {  9052, 1588, 34, 239042,  14200.000, 0x00000000, 0 },
  {  9053, 1588, 35, 239042,  14500.000, 0x00000000, 0 },
  {  9054, 1588, 36, 239042,  14800.000, 0x00000000, 0 },
  {  9055, 1588, 37, 239042,  15100.000, 0x00000000, 0 },
  {  9056, 1588, 38, 239042,  15400.000, 0x00000000, 0 },
  {  9057, 1588, 39, 239042,  15700.000, 0x00000000, 0 },
  {  9058, 1588, 40, 239042,  16000.000, 0x00000000, 0 },
  {  9059, 1588, 41, 239042,  16300.000, 0x00000000, 0 },
  {  9060, 1588, 42, 239042,  16600.000, 0x00000000, 0 },
  {  9061, 1588, 43, 239042,  16900.000, 0x00000000, 0 },
  {  9062, 1588, 44, 239042,  17200.000, 0x00000000, 0 },
  {  9063, 1588, 45, 239042,  17500.000, 0x00000000, 0 },
  {  9064, 1588, 46, 239042,  17800.000, 0x00000000, 0 },
  {  9065, 1588, 47, 239042,  18100.000, 0x00000000, 0 },
  {  9066, 1588, 48, 239042,  18400.000, 0x00000000, 0 },
  {  9067, 1588, 49, 239042,  18700.000, 0x00000000, 0 },
  { 10935, 1588, 50, 239042,  19000.000, 0x00000000, 0 },
  { 10936, 1588, 51, 239042,  19300.000, 0x00000000, 0 },
  { 10937, 1588, 52, 239042,  19600.000, 0x00000000, 0 },
  { 10938, 1588, 53, 239042,  19900.000, 0x00000000, 0 },
  { 10939, 1588, 54, 239042,  20200.000, 0x00000000, 0 },
  { 10940, 1588, 55, 239042,  20500.000, 0x00000000, 0 },
  { 10941, 1588, 56, 239042,  20800.000, 0x00000000, 0 },
  { 10942, 1588, 57, 239042,  21100.000, 0x00000000, 0 },
  { 10943, 1588, 58, 239042,  21400.000, 0x00000000, 0 },
  { 10944, 1588, 59, 239042,  21700.000, 0x00000000, 0 },
  { 10945, 1588, 60, 239042,  22000.000, 0x00000000, 0 },
  { 10946, 1588, 61, 239042,  22300.000, 0x00000000, 0 },
  { 10947, 1588, 62, 239042,  22600.000, 0x00000000, 0 },
  { 10948, 1588, 63, 239042,  22900.000, 0x00000000, 0 },
  { 10949, 1588, 64, 239042,  23200.000, 0x00000000, 0 },
  { 10950, 1588, 65, 239042,  23500.000, 0x00000000, 0 },
  { 10951, 1588, 66, 239042,  23800.000, 0x00000000, 0 },
  { 10952, 1588, 67, 239042,  24100.000, 0x00000000, 0 },
  { 10953, 1588, 68, 239042,  24400.000, 0x00000000, 0 },
  { 10954, 1588, 69, 239042,  24700.000, 0x00000000, 0 },
  { 10955, 1588, 70, 239042,  25000.000, 0x00000000, 0 },
  { 10956, 1588, 71, 239042,  25300.000, 0x00000000, 0 },
  { 10957, 1588, 72, 239042,  25600.000, 0x00000000, 0 },
  { 10958, 1588, 73, 239042,  25900.000, 0x00000000, 0 },
  { 10959, 1588, 74, 239042,  26200.000, 0x00000000, 0 },
  { 10960, 1588, 75, 239042,  26500.000, 0x00000000, 0 },
  { 10961, 1588, 76, 239042,  26800.000, 0x00000000, 0 },
  { 10962, 1588, 77, 239042,  27100.000, 0x00000000, 0 },
  { 10963, 1588, 78, 239042,  27400.000, 0x00000000, 0 },
  { 10964, 1588, 79, 239042,  27700.000, 0x00000000, 0 },
  { 10965, 1588, 80, 239042,  28000.000, 0x00000000, 0 },
  { 10966, 1588, 81, 239042,  28300.000, 0x00000000, 0 },
  { 10967, 1588, 82, 239042,  28600.000, 0x00000000, 0 },
  { 10968, 1588, 83, 239042,  28900.000, 0x00000000, 0 },
  { 10969, 1588, 84, 239042,  29200.000, 0x00000000, 0 },
  { 10970, 1588, 85, 239042,  29500.000, 0x00000000, 0 },
  { 10971, 1588, 86, 239042,  29800.000, 0x00000000, 0 },
  { 10972, 1588, 87, 239042,  30100.000, 0x00000000, 0 },
  { 10973, 1588, 88, 239042,  30400.000, 0x00000000, 0 },
  { 10974, 1588, 89, 239042,  30700.000, 0x00000000, 0 },
  { 10975, 1588, 90, 239042,  31000.000, 0x00000000, 0 },
  { 10976, 1588, 91, 239042,  31300.000, 0x00000000, 0 },
  { 10977, 1588, 92, 239042,  31600.000, 0x00000000, 0 },
  { 10978, 1588, 93, 239042,  31900.000, 0x00000000, 0 },
  { 10979, 1588, 94, 239042,  32200.000, 0x00000000, 0 },
  { 10980, 1588, 95, 239042,  32500.000, 0x00000000, 0 },
  { 10981, 1588, 96, 239042,  32800.000, 0x00000000, 0 },
  { 10982, 1588, 97, 239042,  33100.000, 0x00000000, 0 },
  { 10983, 1588, 98, 239042,  33400.000, 0x00000000, 0 },
  { 10984, 1588, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6725, 1589,  0, 238069,      5.000, 0x00000000, 0 },
  {  7534, 1589,  1, 238069,     10.000, 0x00000000, 0 },
  {  7535, 1589,  2, 238069,     15.000, 0x00000000, 0 },
  {  7536, 1589,  3, 238069,     20.000, 0x00000000, 0 },
  {  7537, 1589,  4, 238069,     25.000, 0x00000000, 0 },
  {  7538, 1589,  5, 238069,     30.000, 0x00000000, 0 },
  {  7539, 1589,  6, 238069,     35.000, 0x00000000, 0 },
  {  7540, 1589,  7, 238069,     40.000, 0x00000000, 0 },
  {  6726, 1590,  0, 238105,      0.000, 0x00000000, 0 },
  {  6727, 1591,  0, 238141,      0.000, 0x00000000, 0 },
  {  6728, 1592,  0, 239042,   4000.000, 0x00000000, 0 },
  {  9069, 1592,  1, 239042,   4300.000, 0x00000000, 0 },
  {  9070, 1592,  2, 239042,   4600.000, 0x00000000, 0 },
  {  9071, 1592,  3, 239042,   4900.000, 0x00000000, 0 },
  {  9072, 1592,  4, 239042,   5200.000, 0x00000000, 0 },
  {  9073, 1592,  5, 239042,   5500.000, 0x00000000, 0 },
  {  9074, 1592,  6, 239042,   5800.000, 0x00000000, 0 },
  {  9075, 1592,  7, 239042,   6100.000, 0x00000000, 0 },
  {  9076, 1592,  8, 239042,   6400.000, 0x00000000, 0 },
  {  9077, 1592,  9, 239042,   6700.000, 0x00000000, 0 },
  {  9078, 1592, 10, 239042,   7000.000, 0x00000000, 0 },
  {  9079, 1592, 11, 239042,   7300.000, 0x00000000, 0 },
  {  9080, 1592, 12, 239042,   7600.000, 0x00000000, 0 },
  {  9081, 1592, 13, 239042,   7900.000, 0x00000000, 0 },
  {  9082, 1592, 14, 239042,   8200.000, 0x00000000, 0 },
  {  9083, 1592, 15, 239042,   8500.000, 0x00000000, 0 },
  {  9084, 1592, 16, 239042,   8800.000, 0x00000000, 0 },
  {  9085, 1592, 17, 239042,   9100.000, 0x00000000, 0 },
  {  9086, 1592, 18, 239042,   9400.000, 0x00000000, 0 },
  {  9087, 1592, 19, 239042,   9700.000, 0x00000000, 0 },
  {  9088, 1592, 20, 239042,  10000.000, 0x00000000, 0 },
  {  9089, 1592, 21, 239042,  10300.000, 0x00000000, 0 },
  {  9090, 1592, 22, 239042,  10600.000, 0x00000000, 0 },
  {  9091, 1592, 23, 239042,  10900.000, 0x00000000, 0 },
  {  9092, 1592, 24, 239042,  11200.000, 0x00000000, 0 },
  {  9093, 1592, 25, 239042,  11500.000, 0x00000000, 0 },
  {  9094, 1592, 26, 239042,  11800.000, 0x00000000, 0 },
  {  9095, 1592, 27, 239042,  12100.000, 0x00000000, 0 },
  {  9096, 1592, 28, 239042,  12400.000, 0x00000000, 0 },
  {  9097, 1592, 29, 239042,  12700.000, 0x00000000, 0 },
  {  9098, 1592, 30, 239042,  13000.000, 0x00000000, 0 },
  {  9099, 1592, 31, 239042,  13300.000, 0x00000000, 0 },
  {  9100, 1592, 32, 239042,  13600.000, 0x00000000, 0 },
  {  9101, 1592, 33, 239042,  13900.000, 0x00000000, 0 },
  {  9102, 1592, 34, 239042,  14200.000, 0x00000000, 0 },
  {  9103, 1592, 35, 239042,  14500.000, 0x00000000, 0 },
  {  9104, 1592, 36, 239042,  14800.000, 0x00000000, 0 },
  {  9105, 1592, 37, 239042,  15100.000, 0x00000000, 0 },
  {  9106, 1592, 38, 239042,  15400.000, 0x00000000, 0 },
  {  9107, 1592, 39, 239042,  15700.000, 0x00000000, 0 },
  {  9108, 1592, 40, 239042,  16000.000, 0x00000000, 0 },
  {  9109, 1592, 41, 239042,  16300.000, 0x00000000, 0 },
  {  9110, 1592, 42, 239042,  16600.000, 0x00000000, 0 },
  {  9111, 1592, 43, 239042,  16900.000, 0x00000000, 0 },
  {  9112, 1592, 44, 239042,  17200.000, 0x00000000, 0 },
  {  9113, 1592, 45, 239042,  17500.000, 0x00000000, 0 },
  {  9114, 1592, 46, 239042,  17800.000, 0x00000000, 0 },
  {  9115, 1592, 47, 239042,  18100.000, 0x00000000, 0 },
  {  9116, 1592, 48, 239042,  18400.000, 0x00000000, 0 },
  {  9117, 1592, 49, 239042,  18700.000, 0x00000000, 0 },
  { 10985, 1592, 50, 239042,  19000.000, 0x00000000, 0 },
  { 10986, 1592, 51, 239042,  19300.000, 0x00000000, 0 },
  { 10987, 1592, 52, 239042,  19600.000, 0x00000000, 0 },
  { 10988, 1592, 53, 239042,  19900.000, 0x00000000, 0 },
  { 10989, 1592, 54, 239042,  20200.000, 0x00000000, 0 },
  { 10990, 1592, 55, 239042,  20500.000, 0x00000000, 0 },
  { 10991, 1592, 56, 239042,  20800.000, 0x00000000, 0 },
  { 10992, 1592, 57, 239042,  21100.000, 0x00000000, 0 },
  { 10993, 1592, 58, 239042,  21400.000, 0x00000000, 0 },
  { 10994, 1592, 59, 239042,  21700.000, 0x00000000, 0 },
  { 10995, 1592, 60, 239042,  22000.000, 0x00000000, 0 },
  { 10996, 1592, 61, 239042,  22300.000, 0x00000000, 0 },
  { 10997, 1592, 62, 239042,  22600.000, 0x00000000, 0 },
  { 10998, 1592, 63, 239042,  22900.000, 0x00000000, 0 },
  { 10999, 1592, 64, 239042,  23200.000, 0x00000000, 0 },
  { 11000, 1592, 65, 239042,  23500.000, 0x00000000, 0 },
  { 11001, 1592, 66, 239042,  23800.000, 0x00000000, 0 },
  { 11002, 1592, 67, 239042,  24100.000, 0x00000000, 0 },
  { 11003, 1592, 68, 239042,  24400.000, 0x00000000, 0 },
  { 11004, 1592, 69, 239042,  24700.000, 0x00000000, 0 },
  { 11005, 1592, 70, 239042,  25000.000, 0x00000000, 0 },
  { 11006, 1592, 71, 239042,  25300.000, 0x00000000, 0 },
  { 11007, 1592, 72, 239042,  25600.000, 0x00000000, 0 },
  { 11008, 1592, 73, 239042,  25900.000, 0x00000000, 0 },
  { 11009, 1592, 74, 239042,  26200.000, 0x00000000, 0 },
  { 11010, 1592, 75, 239042,  26500.000, 0x00000000, 0 },
  { 11011, 1592, 76, 239042,  26800.000, 0x00000000, 0 },
  { 11012, 1592, 77, 239042,  27100.000, 0x00000000, 0 },
  { 11013, 1592, 78, 239042,  27400.000, 0x00000000, 0 },
  { 11014, 1592, 79, 239042,  27700.000, 0x00000000, 0 },
  { 11015, 1592, 80, 239042,  28000.000, 0x00000000, 0 },
  { 11016, 1592, 81, 239042,  28300.000, 0x00000000, 0 },
  { 11017, 1592, 82, 239042,  28600.000, 0x00000000, 0 },
  { 11018, 1592, 83, 239042,  28900.000, 0x00000000, 0 },
  { 11019, 1592, 84, 239042,  29200.000, 0x00000000, 0 },
  { 11020, 1592, 85, 239042,  29500.000, 0x00000000, 0 },
  { 11021, 1592, 86, 239042,  29800.000, 0x00000000, 0 },
  { 11022, 1592, 87, 239042,  30100.000, 0x00000000, 0 },
  { 11023, 1592, 88, 239042,  30400.000, 0x00000000, 0 },
  { 11024, 1592, 89, 239042,  30700.000, 0x00000000, 0 },
  { 11025, 1592, 90, 239042,  31000.000, 0x00000000, 0 },
  { 11026, 1592, 91, 239042,  31300.000, 0x00000000, 0 },
  { 11027, 1592, 92, 239042,  31600.000, 0x00000000, 0 },
  { 11028, 1592, 93, 239042,  31900.000, 0x00000000, 0 },
  { 11029, 1592, 94, 239042,  32200.000, 0x00000000, 0 },
  { 11030, 1592, 95, 239042,  32500.000, 0x00000000, 0 },
  { 11031, 1592, 96, 239042,  32800.000, 0x00000000, 0 },
  { 11032, 1592, 97, 239042,  33100.000, 0x00000000, 0 },
  { 11033, 1592, 98, 239042,  33400.000, 0x00000000, 0 },
  { 11034, 1592, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6729, 1593,  0, 238070,      5.000, 0x00000000, 0 },
  {  7541, 1593,  1, 238070,     10.000, 0x00000000, 0 },
  {  7542, 1593,  2, 238070,     15.000, 0x00000000, 0 },
  {  7543, 1593,  3, 238070,     20.000, 0x00000000, 0 },
  {  7544, 1593,  4, 238070,     25.000, 0x00000000, 0 },
  {  7545, 1593,  5, 238070,     30.000, 0x00000000, 0 },
  {  7546, 1593,  6, 238070,     35.000, 0x00000000, 0 },
  {  7547, 1593,  7, 238070,     40.000, 0x00000000, 0 },
  {  6730, 1594,  0, 238106,      0.000, 0x00000000, 0 },
  {  6731, 1595,  0, 238142,      0.000, 0x00000000, 0 },
  {  6732, 1596,  0, 239042,   4000.000, 0x00000000, 0 },
  {  9119, 1596,  1, 239042,   4300.000, 0x00000000, 0 },
  {  9120, 1596,  2, 239042,   4600.000, 0x00000000, 0 },
  {  9121, 1596,  3, 239042,   4900.000, 0x00000000, 0 },
  {  9122, 1596,  4, 239042,   5200.000, 0x00000000, 0 },
  {  9123, 1596,  5, 239042,   5500.000, 0x00000000, 0 },
  {  9124, 1596,  6, 239042,   5800.000, 0x00000000, 0 },
  {  9125, 1596,  7, 239042,   6100.000, 0x00000000, 0 },
  {  9126, 1596,  8, 239042,   6400.000, 0x00000000, 0 },
  {  9127, 1596,  9, 239042,   6700.000, 0x00000000, 0 },
  {  9128, 1596, 10, 239042,   7000.000, 0x00000000, 0 },
  {  9129, 1596, 11, 239042,   7300.000, 0x00000000, 0 },
  {  9130, 1596, 12, 239042,   7600.000, 0x00000000, 0 },
  {  9131, 1596, 13, 239042,   7900.000, 0x00000000, 0 },
  {  9132, 1596, 14, 239042,   8200.000, 0x00000000, 0 },
  {  9133, 1596, 15, 239042,   8500.000, 0x00000000, 0 },
  {  9134, 1596, 16, 239042,   8800.000, 0x00000000, 0 },
  {  9135, 1596, 17, 239042,   9100.000, 0x00000000, 0 },
  {  9136, 1596, 18, 239042,   9400.000, 0x00000000, 0 },
  {  9137, 1596, 19, 239042,   9700.000, 0x00000000, 0 },
  {  9138, 1596, 20, 239042,  10000.000, 0x00000000, 0 },
  {  9139, 1596, 21, 239042,  10300.000, 0x00000000, 0 },
  {  9140, 1596, 22, 239042,  10600.000, 0x00000000, 0 },
  {  9141, 1596, 23, 239042,  10900.000, 0x00000000, 0 },
  {  9142, 1596, 24, 239042,  11200.000, 0x00000000, 0 },
  {  9143, 1596, 25, 239042,  11500.000, 0x00000000, 0 },
  {  9144, 1596, 26, 239042,  11800.000, 0x00000000, 0 },
  {  9145, 1596, 27, 239042,  12100.000, 0x00000000, 0 },
  {  9146, 1596, 28, 239042,  12400.000, 0x00000000, 0 },
  {  9147, 1596, 29, 239042,  12700.000, 0x00000000, 0 },
  {  9148, 1596, 30, 239042,  13000.000, 0x00000000, 0 },
  {  9149, 1596, 31, 239042,  13300.000, 0x00000000, 0 },
  {  9150, 1596, 32, 239042,  13600.000, 0x00000000, 0 },
  {  9151, 1596, 33, 239042,  13900.000, 0x00000000, 0 },
  {  9152, 1596, 34, 239042,  14200.000, 0x00000000, 0 },
  {  9153, 1596, 35, 239042,  14500.000, 0x00000000, 0 },
  {  9154, 1596, 36, 239042,  14800.000, 0x00000000, 0 },
  {  9155, 1596, 37, 239042,  15100.000, 0x00000000, 0 },
  {  9156, 1596, 38, 239042,  15400.000, 0x00000000, 0 },
  {  9157, 1596, 39, 239042,  15700.000, 0x00000000, 0 },
  {  9158, 1596, 40, 239042,  16000.000, 0x00000000, 0 },
  {  9159, 1596, 41, 239042,  16300.000, 0x00000000, 0 },
  {  9160, 1596, 42, 239042,  16600.000, 0x00000000, 0 },
  {  9161, 1596, 43, 239042,  16900.000, 0x00000000, 0 },
  {  9162, 1596, 44, 239042,  17200.000, 0x00000000, 0 },
  {  9163, 1596, 45, 239042,  17500.000, 0x00000000, 0 },
  {  9164, 1596, 46, 239042,  17800.000, 0x00000000, 0 },
  {  9165, 1596, 47, 239042,  18100.000, 0x00000000, 0 },
  {  9166, 1596, 48, 239042,  18400.000, 0x00000000, 0 },
  {  9167, 1596, 49, 239042,  18700.000, 0x00000000, 0 },
  { 11035, 1596, 50, 239042,  19000.000, 0x00000000, 0 },
  { 11036, 1596, 51, 239042,  19300.000, 0x00000000, 0 },
  { 11037, 1596, 52, 239042,  19600.000, 0x00000000, 0 },
  { 11038, 1596, 53, 239042,  19900.000, 0x00000000, 0 },
  { 11039, 1596, 54, 239042,  20200.000, 0x00000000, 0 },
  { 11040, 1596, 55, 239042,  20500.000, 0x00000000, 0 },
  { 11041, 1596, 56, 239042,  20800.000, 0x00000000, 0 },
  { 11042, 1596, 57, 239042,  21100.000, 0x00000000, 0 },
  { 11043, 1596, 58, 239042,  21400.000, 0x00000000, 0 },
  { 11044, 1596, 59, 239042,  21700.000, 0x00000000, 0 },
  { 11045, 1596, 60, 239042,  22000.000, 0x00000000, 0 },
  { 11046, 1596, 61, 239042,  22300.000, 0x00000000, 0 },
  { 11047, 1596, 62, 239042,  22600.000, 0x00000000, 0 },
  { 11048, 1596, 63, 239042,  22900.000, 0x00000000, 0 },
  { 11049, 1596, 64, 239042,  23200.000, 0x00000000, 0 },
  { 11050, 1596, 65, 239042,  23500.000, 0x00000000, 0 },
  { 11051, 1596, 66, 239042,  23800.000, 0x00000000, 0 },
  { 11052, 1596, 67, 239042,  24100.000, 0x00000000, 0 },
  { 11053, 1596, 68, 239042,  24400.000, 0x00000000, 0 },
  { 11054, 1596, 69, 239042,  24700.000, 0x00000000, 0 },
  { 11055, 1596, 70, 239042,  25000.000, 0x00000000, 0 },
  { 11056, 1596, 71, 239042,  25300.000, 0x00000000, 0 },
  { 11057, 1596, 72, 239042,  25600.000, 0x00000000, 0 },
  { 11058, 1596, 73, 239042,  25900.000, 0x00000000, 0 },
  { 11059, 1596, 74, 239042,  26200.000, 0x00000000, 0 },
  { 11060, 1596, 75, 239042,  26500.000, 0x00000000, 0 },
  { 11061, 1596, 76, 239042,  26800.000, 0x00000000, 0 },
  { 11062, 1596, 77, 239042,  27100.000, 0x00000000, 0 },
  { 11063, 1596, 78, 239042,  27400.000, 0x00000000, 0 },
  { 11064, 1596, 79, 239042,  27700.000, 0x00000000, 0 },
  { 11065, 1596, 80, 239042,  28000.000, 0x00000000, 0 },
  { 11066, 1596, 81, 239042,  28300.000, 0x00000000, 0 },
  { 11067, 1596, 82, 239042,  28600.000, 0x00000000, 0 },
  { 11068, 1596, 83, 239042,  28900.000, 0x00000000, 0 },
  { 11069, 1596, 84, 239042,  29200.000, 0x00000000, 0 },
  { 11070, 1596, 85, 239042,  29500.000, 0x00000000, 0 },
  { 11071, 1596, 86, 239042,  29800.000, 0x00000000, 0 },
  { 11072, 1596, 87, 239042,  30100.000, 0x00000000, 0 },
  { 11073, 1596, 88, 239042,  30400.000, 0x00000000, 0 },
  { 11074, 1596, 89, 239042,  30700.000, 0x00000000, 0 },
  { 11075, 1596, 90, 239042,  31000.000, 0x00000000, 0 },
  { 11076, 1596, 91, 239042,  31300.000, 0x00000000, 0 },
  { 11077, 1596, 92, 239042,  31600.000, 0x00000000, 0 },
  { 11078, 1596, 93, 239042,  31900.000, 0x00000000, 0 },
  { 11079, 1596, 94, 239042,  32200.000, 0x00000000, 0 },
  { 11080, 1596, 95, 239042,  32500.000, 0x00000000, 0 },
  { 11081, 1596, 96, 239042,  32800.000, 0x00000000, 0 },
  { 11082, 1596, 97, 239042,  33100.000, 0x00000000, 0 },
  { 11083, 1596, 98, 239042,  33400.000, 0x00000000, 0 },
  { 11084, 1596, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6733, 1597,  0, 238071,   2000.000, 0x00000000, 0 },
  {  7548, 1597,  1, 238071,   4000.000, 0x00000000, 0 },
  {  7549, 1597,  2, 238071,   6000.000, 0x00000000, 0 },
  {  7550, 1597,  3, 238071,   8000.000, 0x00000000, 0 },
  {  7551, 1597,  4, 238071,  10000.000, 0x00000000, 0 },
  {  7552, 1597,  5, 238071,  12000.000, 0x00000000, 0 },
  {  7553, 1597,  6, 238071,  14000.000, 0x00000000, 0 },
  {  7554, 1597,  7, 238071,  16000.000, 0x00000000, 0 },
  {  6734, 1598,  0, 242652,      0.000, 0x00000000, 0 },
  {  6735, 1599,  0, 238143,      0.000, 0x00000000, 0 },
  {  6736, 1600,  0, 239042,   4000.000, 0x00000000, 0 },
  {  9169, 1600,  1, 239042,   4300.000, 0x00000000, 0 },
  {  9170, 1600,  2, 239042,   4600.000, 0x00000000, 0 },
  {  9171, 1600,  3, 239042,   4900.000, 0x00000000, 0 },
  {  9172, 1600,  4, 239042,   5200.000, 0x00000000, 0 },
  {  9173, 1600,  5, 239042,   5500.000, 0x00000000, 0 },
  {  9174, 1600,  6, 239042,   5800.000, 0x00000000, 0 },
  {  9175, 1600,  7, 239042,   6100.000, 0x00000000, 0 },
  {  9176, 1600,  8, 239042,   6400.000, 0x00000000, 0 },
  {  9177, 1600,  9, 239042,   6700.000, 0x00000000, 0 },
  {  9178, 1600, 10, 239042,   7000.000, 0x00000000, 0 },
  {  9179, 1600, 11, 239042,   7300.000, 0x00000000, 0 },
  {  9180, 1600, 12, 239042,   7600.000, 0x00000000, 0 },
  {  9181, 1600, 13, 239042,   7900.000, 0x00000000, 0 },
  {  9182, 1600, 14, 239042,   8200.000, 0x00000000, 0 },
  {  9183, 1600, 15, 239042,   8500.000, 0x00000000, 0 },
  {  9184, 1600, 16, 239042,   8800.000, 0x00000000, 0 },
  {  9185, 1600, 17, 239042,   9100.000, 0x00000000, 0 },
  {  9186, 1600, 18, 239042,   9400.000, 0x00000000, 0 },
  {  9187, 1600, 19, 239042,   9700.000, 0x00000000, 0 },
  {  9188, 1600, 20, 239042,  10000.000, 0x00000000, 0 },
  {  9189, 1600, 21, 239042,  10300.000, 0x00000000, 0 },
  {  9190, 1600, 22, 239042,  10600.000, 0x00000000, 0 },
  {  9191, 1600, 23, 239042,  10900.000, 0x00000000, 0 },
  {  9192, 1600, 24, 239042,  11200.000, 0x00000000, 0 },
  {  9193, 1600, 25, 239042,  11500.000, 0x00000000, 0 },
  {  9194, 1600, 26, 239042,  11800.000, 0x00000000, 0 },
  {  9195, 1600, 27, 239042,  12100.000, 0x00000000, 0 },
  {  9196, 1600, 28, 239042,  12400.000, 0x00000000, 0 },
  {  9197, 1600, 29, 239042,  12700.000, 0x00000000, 0 },
  {  9198, 1600, 30, 239042,  13000.000, 0x00000000, 0 },
  {  9199, 1600, 31, 239042,  13300.000, 0x00000000, 0 },
  {  9200, 1600, 32, 239042,  13600.000, 0x00000000, 0 },
  {  9201, 1600, 33, 239042,  13900.000, 0x00000000, 0 },
  {  9202, 1600, 34, 239042,  14200.000, 0x00000000, 0 },
  {  9203, 1600, 35, 239042,  14500.000, 0x00000000, 0 },
  {  9204, 1600, 36, 239042,  14800.000, 0x00000000, 0 },
  {  9205, 1600, 37, 239042,  15100.000, 0x00000000, 0 },
  {  9206, 1600, 38, 239042,  15400.000, 0x00000000, 0 },
  {  9207, 1600, 39, 239042,  15700.000, 0x00000000, 0 },
  {  9208, 1600, 40, 239042,  16000.000, 0x00000000, 0 },
  {  9209, 1600, 41, 239042,  16300.000, 0x00000000, 0 },
  {  9210, 1600, 42, 239042,  16600.000, 0x00000000, 0 },
  {  9211, 1600, 43, 239042,  16900.000, 0x00000000, 0 },
  {  9212, 1600, 44, 239042,  17200.000, 0x00000000, 0 },
  {  9213, 1600, 45, 239042,  17500.000, 0x00000000, 0 },
  {  9214, 1600, 46, 239042,  17800.000, 0x00000000, 0 },
  {  9215, 1600, 47, 239042,  18100.000, 0x00000000, 0 },
  {  9216, 1600, 48, 239042,  18400.000, 0x00000000, 0 },
  {  9217, 1600, 49, 239042,  18700.000, 0x00000000, 0 },
  { 11085, 1600, 50, 239042,  19000.000, 0x00000000, 0 },
  { 11086, 1600, 51, 239042,  19300.000, 0x00000000, 0 },
  { 11087, 1600, 52, 239042,  19600.000, 0x00000000, 0 },
  { 11088, 1600, 53, 239042,  19900.000, 0x00000000, 0 },
  { 11089, 1600, 54, 239042,  20200.000, 0x00000000, 0 },
  { 11090, 1600, 55, 239042,  20500.000, 0x00000000, 0 },
  { 11091, 1600, 56, 239042,  20800.000, 0x00000000, 0 },
  { 11092, 1600, 57, 239042,  21100.000, 0x00000000, 0 },
  { 11093, 1600, 58, 239042,  21400.000, 0x00000000, 0 },
  { 11094, 1600, 59, 239042,  21700.000, 0x00000000, 0 },
  { 11095, 1600, 60, 239042,  22000.000, 0x00000000, 0 },
  { 11096, 1600, 61, 239042,  22300.000, 0x00000000, 0 },
  { 11097, 1600, 62, 239042,  22600.000, 0x00000000, 0 },
  { 11098, 1600, 63, 239042,  22900.000, 0x00000000, 0 },
  { 11099, 1600, 64, 239042,  23200.000, 0x00000000, 0 },
  { 11100, 1600, 65, 239042,  23500.000, 0x00000000, 0 },
  { 11101, 1600, 66, 239042,  23800.000, 0x00000000, 0 },
  { 11102, 1600, 67, 239042,  24100.000, 0x00000000, 0 },
  { 11103, 1600, 68, 239042,  24400.000, 0x00000000, 0 },
  { 11104, 1600, 69, 239042,  24700.000, 0x00000000, 0 },
  { 11105, 1600, 70, 239042,  25000.000, 0x00000000, 0 },
  { 11106, 1600, 71, 239042,  25300.000, 0x00000000, 0 },
  { 11107, 1600, 72, 239042,  25600.000, 0x00000000, 0 },
  { 11108, 1600, 73, 239042,  25900.000, 0x00000000, 0 },
  { 11109, 1600, 74, 239042,  26200.000, 0x00000000, 0 },
  { 11110, 1600, 75, 239042,  26500.000, 0x00000000, 0 },
  { 11111, 1600, 76, 239042,  26800.000, 0x00000000, 0 },
  { 11112, 1600, 77, 239042,  27100.000, 0x00000000, 0 },
  { 11113, 1600, 78, 239042,  27400.000, 0x00000000, 0 },
  { 11114, 1600, 79, 239042,  27700.000, 0x00000000, 0 },
  { 11115, 1600, 80, 239042,  28000.000, 0x00000000, 0 },
  { 11116, 1600, 81, 239042,  28300.000, 0x00000000, 0 },
  { 11117, 1600, 82, 239042,  28600.000, 0x00000000, 0 },
  { 11118, 1600, 83, 239042,  28900.000, 0x00000000, 0 },
  { 11119, 1600, 84, 239042,  29200.000, 0x00000000, 0 },
  { 11120, 1600, 85, 239042,  29500.000, 0x00000000, 0 },
  { 11121, 1600, 86, 239042,  29800.000, 0x00000000, 0 },
  { 11122, 1600, 87, 239042,  30100.000, 0x00000000, 0 },
  { 11123, 1600, 88, 239042,  30400.000, 0x00000000, 0 },
  { 11124, 1600, 89, 239042,  30700.000, 0x00000000, 0 },
  { 11125, 1600, 90, 239042,  31000.000, 0x00000000, 0 },
  { 11126, 1600, 91, 239042,  31300.000, 0x00000000, 0 },
  { 11127, 1600, 92, 239042,  31600.000, 0x00000000, 0 },
  { 11128, 1600, 93, 239042,  31900.000, 0x00000000, 0 },
  { 11129, 1600, 94, 239042,  32200.000, 0x00000000, 0 },
  { 11130, 1600, 95, 239042,  32500.000, 0x00000000, 0 },
  { 11131, 1600, 96, 239042,  32800.000, 0x00000000, 0 },
  { 11132, 1600, 97, 239042,  33100.000, 0x00000000, 0 },
  { 11133, 1600, 98, 239042,  33400.000, 0x00000000, 0 },
  { 11134, 1600, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6737, 1601,  0, 238072,      1.000, 0x00000000, 0 },
  {  7555, 1601,  1, 238072,      2.000, 0x00000000, 0 },
  {  7556, 1601,  2, 238072,      3.000, 0x00000000, 0 },
  {  7557, 1601,  3, 238072,      4.000, 0x00000000, 0 },
  {  7558, 1601,  4, 238072,      5.000, 0x00000000, 0 },
  {  7559, 1601,  5, 238072,      6.000, 0x00000000, 0 },
  {  7560, 1601,  6, 238072,      7.000, 0x00000000, 0 },
  {  7561, 1601,  7, 238072,      8.000, 0x00000000, 0 },
  {  6738, 1602,  0, 238108,      0.000, 0x00000000, 0 },
  {  6739, 1603,  0, 238144,      0.000, 0x00000000, 0 },
  {  6740, 1604,  0, 239042,   4000.000, 0x00000000, 0 },
  {  9219, 1604,  1, 239042,   4300.000, 0x00000000, 0 },
  {  9220, 1604,  2, 239042,   4600.000, 0x00000000, 0 },
  {  9221, 1604,  3, 239042,   4900.000, 0x00000000, 0 },
  {  9222, 1604,  4, 239042,   5200.000, 0x00000000, 0 },
  {  9223, 1604,  5, 239042,   5500.000, 0x00000000, 0 },
  {  9224, 1604,  6, 239042,   5800.000, 0x00000000, 0 },
  {  9225, 1604,  7, 239042,   6100.000, 0x00000000, 0 },
  {  9226, 1604,  8, 239042,   6400.000, 0x00000000, 0 },
  {  9227, 1604,  9, 239042,   6700.000, 0x00000000, 0 },
  {  9228, 1604, 10, 239042,   7000.000, 0x00000000, 0 },
  {  9229, 1604, 11, 239042,   7300.000, 0x00000000, 0 },
  {  9230, 1604, 12, 239042,   7600.000, 0x00000000, 0 },
  {  9231, 1604, 13, 239042,   7900.000, 0x00000000, 0 },
  {  9232, 1604, 14, 239042,   8200.000, 0x00000000, 0 },
  {  9233, 1604, 15, 239042,   8500.000, 0x00000000, 0 },
  {  9234, 1604, 16, 239042,   8800.000, 0x00000000, 0 },
  {  9235, 1604, 17, 239042,   9100.000, 0x00000000, 0 },
  {  9236, 1604, 18, 239042,   9400.000, 0x00000000, 0 },
  {  9237, 1604, 19, 239042,   9700.000, 0x00000000, 0 },
  {  9238, 1604, 20, 239042,  10000.000, 0x00000000, 0 },
  {  9239, 1604, 21, 239042,  10300.000, 0x00000000, 0 },
  {  9240, 1604, 22, 239042,  10600.000, 0x00000000, 0 },
  {  9241, 1604, 23, 239042,  10900.000, 0x00000000, 0 },
  {  9242, 1604, 24, 239042,  11200.000, 0x00000000, 0 },
  {  9243, 1604, 25, 239042,  11500.000, 0x00000000, 0 },
  {  9244, 1604, 26, 239042,  11800.000, 0x00000000, 0 },
  {  9245, 1604, 27, 239042,  12100.000, 0x00000000, 0 },
  {  9246, 1604, 28, 239042,  12400.000, 0x00000000, 0 },
  {  9247, 1604, 29, 239042,  12700.000, 0x00000000, 0 },
  {  9248, 1604, 30, 239042,  13000.000, 0x00000000, 0 },
  {  9249, 1604, 31, 239042,  13300.000, 0x00000000, 0 },
  {  9250, 1604, 32, 239042,  13600.000, 0x00000000, 0 },
  {  9251, 1604, 33, 239042,  13900.000, 0x00000000, 0 },
  {  9252, 1604, 34, 239042,  14200.000, 0x00000000, 0 },
  {  9253, 1604, 35, 239042,  14500.000, 0x00000000, 0 },
  {  9254, 1604, 36, 239042,  14800.000, 0x00000000, 0 },
  {  9255, 1604, 37, 239042,  15100.000, 0x00000000, 0 },
  {  9256, 1604, 38, 239042,  15400.000, 0x00000000, 0 },
  {  9257, 1604, 39, 239042,  15700.000, 0x00000000, 0 },
  {  9258, 1604, 40, 239042,  16000.000, 0x00000000, 0 },
  {  9259, 1604, 41, 239042,  16300.000, 0x00000000, 0 },
  {  9260, 1604, 42, 239042,  16600.000, 0x00000000, 0 },
  {  9261, 1604, 43, 239042,  16900.000, 0x00000000, 0 },
  {  9262, 1604, 44, 239042,  17200.000, 0x00000000, 0 },
  {  9263, 1604, 45, 239042,  17500.000, 0x00000000, 0 },
  {  9264, 1604, 46, 239042,  17800.000, 0x00000000, 0 },
  {  9265, 1604, 47, 239042,  18100.000, 0x00000000, 0 },
  {  9266, 1604, 48, 239042,  18400.000, 0x00000000, 0 },
  {  9267, 1604, 49, 239042,  18700.000, 0x00000000, 0 },
  { 11135, 1604, 50, 239042,  19000.000, 0x00000000, 0 },
  { 11136, 1604, 51, 239042,  19300.000, 0x00000000, 0 },
  { 11137, 1604, 52, 239042,  19600.000, 0x00000000, 0 },
  { 11138, 1604, 53, 239042,  19900.000, 0x00000000, 0 },
  { 11139, 1604, 54, 239042,  20200.000, 0x00000000, 0 },
  { 11140, 1604, 55, 239042,  20500.000, 0x00000000, 0 },
  { 11141, 1604, 56, 239042,  20800.000, 0x00000000, 0 },
  { 11142, 1604, 57, 239042,  21100.000, 0x00000000, 0 },
  { 11143, 1604, 58, 239042,  21400.000, 0x00000000, 0 },
  { 11144, 1604, 59, 239042,  21700.000, 0x00000000, 0 },
  { 11145, 1604, 60, 239042,  22000.000, 0x00000000, 0 },
  { 11146, 1604, 61, 239042,  22300.000, 0x00000000, 0 },
  { 11147, 1604, 62, 239042,  22600.000, 0x00000000, 0 },
  { 11148, 1604, 63, 239042,  22900.000, 0x00000000, 0 },
  { 11149, 1604, 64, 239042,  23200.000, 0x00000000, 0 },
  { 11150, 1604, 65, 239042,  23500.000, 0x00000000, 0 },
  { 11151, 1604, 66, 239042,  23800.000, 0x00000000, 0 },
  { 11152, 1604, 67, 239042,  24100.000, 0x00000000, 0 },
  { 11153, 1604, 68, 239042,  24400.000, 0x00000000, 0 },
  { 11154, 1604, 69, 239042,  24700.000, 0x00000000, 0 },
  { 11155, 1604, 70, 239042,  25000.000, 0x00000000, 0 },
  { 11156, 1604, 71, 239042,  25300.000, 0x00000000, 0 },
  { 11157, 1604, 72, 239042,  25600.000, 0x00000000, 0 },
  { 11158, 1604, 73, 239042,  25900.000, 0x00000000, 0 },
  { 11159, 1604, 74, 239042,  26200.000, 0x00000000, 0 },
  { 11160, 1604, 75, 239042,  26500.000, 0x00000000, 0 },
  { 11161, 1604, 76, 239042,  26800.000, 0x00000000, 0 },
  { 11162, 1604, 77, 239042,  27100.000, 0x00000000, 0 },
  { 11163, 1604, 78, 239042,  27400.000, 0x00000000, 0 },
  { 11164, 1604, 79, 239042,  27700.000, 0x00000000, 0 },
  { 11165, 1604, 80, 239042,  28000.000, 0x00000000, 0 },
  { 11166, 1604, 81, 239042,  28300.000, 0x00000000, 0 },
  { 11167, 1604, 82, 239042,  28600.000, 0x00000000, 0 },
  { 11168, 1604, 83, 239042,  28900.000, 0x00000000, 0 },
  { 11169, 1604, 84, 239042,  29200.000, 0x00000000, 0 },
  { 11170, 1604, 85, 239042,  29500.000, 0x00000000, 0 },
  { 11171, 1604, 86, 239042,  29800.000, 0x00000000, 0 },
  { 11172, 1604, 87, 239042,  30100.000, 0x00000000, 0 },
  { 11173, 1604, 88, 239042,  30400.000, 0x00000000, 0 },
  { 11174, 1604, 89, 239042,  30700.000, 0x00000000, 0 },
  { 11175, 1604, 90, 239042,  31000.000, 0x00000000, 0 },
  { 11176, 1604, 91, 239042,  31300.000, 0x00000000, 0 },
  { 11177, 1604, 92, 239042,  31600.000, 0x00000000, 0 },
  { 11178, 1604, 93, 239042,  31900.000, 0x00000000, 0 },
  { 11179, 1604, 94, 239042,  32200.000, 0x00000000, 0 },
  { 11180, 1604, 95, 239042,  32500.000, 0x00000000, 0 },
  { 11181, 1604, 96, 239042,  32800.000, 0x00000000, 0 },
  { 11182, 1604, 97, 239042,  33100.000, 0x00000000, 0 },
  { 11183, 1604, 98, 239042,  33400.000, 0x00000000, 0 },
  { 11184, 1604, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6741, 1605,  0, 238073,      5.000, 0x00000000, 0 },
  {  7562, 1605,  1, 238073,     10.000, 0x00000000, 0 },
  {  7563, 1605,  2, 238073,     15.000, 0x00000000, 0 },
  {  7564, 1605,  3, 238073,     20.000, 0x00000000, 0 },
  {  7565, 1605,  4, 238073,     25.000, 0x00000000, 0 },
  {  7566, 1605,  5, 238073,     30.000, 0x00000000, 0 },
  {  7567, 1605,  6, 238073,     35.000, 0x00000000, 0 },
  {  7568, 1605,  7, 238073,     40.000, 0x00000000, 0 },
  {  6742, 1606,  0, 238109,      0.000, 0x00000000, 0 },
  {  6743, 1607,  0, 238145,      0.000, 0x00000000, 0 },
  {  6744, 1608,  0, 239042,   4000.000, 0x00000000, 0 },
  {  9269, 1608,  1, 239042,   4300.000, 0x00000000, 0 },
  {  9270, 1608,  2, 239042,   4600.000, 0x00000000, 0 },
  {  9271, 1608,  3, 239042,   4900.000, 0x00000000, 0 },
  {  9272, 1608,  4, 239042,   5200.000, 0x00000000, 0 },
  {  9273, 1608,  5, 239042,   5500.000, 0x00000000, 0 },
  {  9274, 1608,  6, 239042,   5800.000, 0x00000000, 0 },
  {  9275, 1608,  7, 239042,   6100.000, 0x00000000, 0 },
  {  9276, 1608,  8, 239042,   6400.000, 0x00000000, 0 },
  {  9277, 1608,  9, 239042,   6700.000, 0x00000000, 0 },
  {  9278, 1608, 10, 239042,   7000.000, 0x00000000, 0 },
  {  9279, 1608, 11, 239042,   7300.000, 0x00000000, 0 },
  {  9280, 1608, 12, 239042,   7600.000, 0x00000000, 0 },
  {  9281, 1608, 13, 239042,   7900.000, 0x00000000, 0 },
  {  9282, 1608, 14, 239042,   8200.000, 0x00000000, 0 },
  {  9283, 1608, 15, 239042,   8500.000, 0x00000000, 0 },
  {  9284, 1608, 16, 239042,   8800.000, 0x00000000, 0 },
  {  9285, 1608, 17, 239042,   9100.000, 0x00000000, 0 },
  {  9286, 1608, 18, 239042,   9400.000, 0x00000000, 0 },
  {  9287, 1608, 19, 239042,   9700.000, 0x00000000, 0 },
  {  9288, 1608, 20, 239042,  10000.000, 0x00000000, 0 },
  {  9289, 1608, 21, 239042,  10300.000, 0x00000000, 0 },
  {  9290, 1608, 22, 239042,  10600.000, 0x00000000, 0 },
  {  9291, 1608, 23, 239042,  10900.000, 0x00000000, 0 },
  {  9292, 1608, 24, 239042,  11200.000, 0x00000000, 0 },
  {  9293, 1608, 25, 239042,  11500.000, 0x00000000, 0 },
  {  9294, 1608, 26, 239042,  11800.000, 0x00000000, 0 },
  {  9295, 1608, 27, 239042,  12100.000, 0x00000000, 0 },
  {  9296, 1608, 28, 239042,  12400.000, 0x00000000, 0 },
  {  9297, 1608, 29, 239042,  12700.000, 0x00000000, 0 },
  {  9298, 1608, 30, 239042,  13000.000, 0x00000000, 0 },
  {  9299, 1608, 31, 239042,  13300.000, 0x00000000, 0 },
  {  9300, 1608, 32, 239042,  13600.000, 0x00000000, 0 },
  {  9301, 1608, 33, 239042,  13900.000, 0x00000000, 0 },
  {  9302, 1608, 34, 239042,  14200.000, 0x00000000, 0 },
  {  9303, 1608, 35, 239042,  14500.000, 0x00000000, 0 },
  {  9304, 1608, 36, 239042,  14800.000, 0x00000000, 0 },
  {  9305, 1608, 37, 239042,  15100.000, 0x00000000, 0 },
  {  9306, 1608, 38, 239042,  15400.000, 0x00000000, 0 },
  {  9307, 1608, 39, 239042,  15700.000, 0x00000000, 0 },
  {  9308, 1608, 40, 239042,  16000.000, 0x00000000, 0 },
  {  9309, 1608, 41, 239042,  16300.000, 0x00000000, 0 },
  {  9310, 1608, 42, 239042,  16600.000, 0x00000000, 0 },
  {  9311, 1608, 43, 239042,  16900.000, 0x00000000, 0 },
  {  9312, 1608, 44, 239042,  17200.000, 0x00000000, 0 },
  {  9313, 1608, 45, 239042,  17500.000, 0x00000000, 0 },
  {  9314, 1608, 46, 239042,  17800.000, 0x00000000, 0 },
  {  9315, 1608, 47, 239042,  18100.000, 0x00000000, 0 },
  {  9316, 1608, 48, 239042,  18400.000, 0x00000000, 0 },
  {  9317, 1608, 49, 239042,  18700.000, 0x00000000, 0 },
  { 11185, 1608, 50, 239042,  19000.000, 0x00000000, 0 },
  { 11186, 1608, 51, 239042,  19300.000, 0x00000000, 0 },
  { 11187, 1608, 52, 239042,  19600.000, 0x00000000, 0 },
  { 11188, 1608, 53, 239042,  19900.000, 0x00000000, 0 },
  { 11189, 1608, 54, 239042,  20200.000, 0x00000000, 0 },
  { 11190, 1608, 55, 239042,  20500.000, 0x00000000, 0 },
  { 11191, 1608, 56, 239042,  20800.000, 0x00000000, 0 },
  { 11192, 1608, 57, 239042,  21100.000, 0x00000000, 0 },
  { 11193, 1608, 58, 239042,  21400.000, 0x00000000, 0 },
  { 11194, 1608, 59, 239042,  21700.000, 0x00000000, 0 },
  { 11195, 1608, 60, 239042,  22000.000, 0x00000000, 0 },
  { 11196, 1608, 61, 239042,  22300.000, 0x00000000, 0 },
  { 11197, 1608, 62, 239042,  22600.000, 0x00000000, 0 },
  { 11198, 1608, 63, 239042,  22900.000, 0x00000000, 0 },
  { 11199, 1608, 64, 239042,  23200.000, 0x00000000, 0 },
  { 11200, 1608, 65, 239042,  23500.000, 0x00000000, 0 },
  { 11201, 1608, 66, 239042,  23800.000, 0x00000000, 0 },
  { 11202, 1608, 67, 239042,  24100.000, 0x00000000, 0 },
  { 11203, 1608, 68, 239042,  24400.000, 0x00000000, 0 },
  { 11204, 1608, 69, 239042,  24700.000, 0x00000000, 0 },
  { 11205, 1608, 70, 239042,  25000.000, 0x00000000, 0 },
  { 11206, 1608, 71, 239042,  25300.000, 0x00000000, 0 },
  { 11207, 1608, 72, 239042,  25600.000, 0x00000000, 0 },
  { 11208, 1608, 73, 239042,  25900.000, 0x00000000, 0 },
  { 11209, 1608, 74, 239042,  26200.000, 0x00000000, 0 },
  { 11210, 1608, 75, 239042,  26500.000, 0x00000000, 0 },
  { 11211, 1608, 76, 239042,  26800.000, 0x00000000, 0 },
  { 11212, 1608, 77, 239042,  27100.000, 0x00000000, 0 },
  { 11213, 1608, 78, 239042,  27400.000, 0x00000000, 0 },
  { 11214, 1608, 79, 239042,  27700.000, 0x00000000, 0 },
  { 11215, 1608, 80, 239042,  28000.000, 0x00000000, 0 },
  { 11216, 1608, 81, 239042,  28300.000, 0x00000000, 0 },
  { 11217, 1608, 82, 239042,  28600.000, 0x00000000, 0 },
  { 11218, 1608, 83, 239042,  28900.000, 0x00000000, 0 },
  { 11219, 1608, 84, 239042,  29200.000, 0x00000000, 0 },
  { 11220, 1608, 85, 239042,  29500.000, 0x00000000, 0 },
  { 11221, 1608, 86, 239042,  29800.000, 0x00000000, 0 },
  { 11222, 1608, 87, 239042,  30100.000, 0x00000000, 0 },
  { 11223, 1608, 88, 239042,  30400.000, 0x00000000, 0 },
  { 11224, 1608, 89, 239042,  30700.000, 0x00000000, 0 },
  { 11225, 1608, 90, 239042,  31000.000, 0x00000000, 0 },
  { 11226, 1608, 91, 239042,  31300.000, 0x00000000, 0 },
  { 11227, 1608, 92, 239042,  31600.000, 0x00000000, 0 },
  { 11228, 1608, 93, 239042,  31900.000, 0x00000000, 0 },
  { 11229, 1608, 94, 239042,  32200.000, 0x00000000, 0 },
  { 11230, 1608, 95, 239042,  32500.000, 0x00000000, 0 },
  { 11231, 1608, 96, 239042,  32800.000, 0x00000000, 0 },
  { 11232, 1608, 97, 239042,  33100.000, 0x00000000, 0 },
  { 11233, 1608, 98, 239042,  33400.000, 0x00000000, 0 },
  { 11234, 1608, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6745, 1609,  0, 238074,      8.000, 0x00000000, 0 },
  {  7569, 1609,  1, 238074,     16.000, 0x00000000, 0 },
  {  7570, 1609,  2, 238074,     24.000, 0x00000000, 0 },
  {  7571, 1609,  3, 238074,     32.000, 0x00000000, 0 },
  {  7572, 1609,  4, 238074,     40.000, 0x00000000, 0 },
  {  7573, 1609,  5, 238074,     48.000, 0x00000000, 0 },
  {  7574, 1609,  6, 238074,     56.000, 0x00000000, 0 },
  {  7575, 1609,  7, 238074,     64.000, 0x00000000, 0 },
  {  6746, 1610,  0, 238110,      0.000, 0x00000000, 0 },
  {  6747, 1611,  0, 238146,      0.000, 0x00000000, 0 },
  {  6748, 1612,  0, 239042,   4000.000, 0x00000000, 0 },
  {  9319, 1612,  1, 239042,   4300.000, 0x00000000, 0 },
  {  9320, 1612,  2, 239042,   4600.000, 0x00000000, 0 },
  {  9321, 1612,  3, 239042,   4900.000, 0x00000000, 0 },
  {  9322, 1612,  4, 239042,   5200.000, 0x00000000, 0 },
  {  9323, 1612,  5, 239042,   5500.000, 0x00000000, 0 },
  {  9324, 1612,  6, 239042,   5800.000, 0x00000000, 0 },
  {  9325, 1612,  7, 239042,   6100.000, 0x00000000, 0 },
  {  9326, 1612,  8, 239042,   6400.000, 0x00000000, 0 },
  {  9327, 1612,  9, 239042,   6700.000, 0x00000000, 0 },
  {  9328, 1612, 10, 239042,   7000.000, 0x00000000, 0 },
  {  9329, 1612, 11, 239042,   7300.000, 0x00000000, 0 },
  {  9330, 1612, 12, 239042,   7600.000, 0x00000000, 0 },
  {  9331, 1612, 13, 239042,   7900.000, 0x00000000, 0 },
  {  9332, 1612, 14, 239042,   8200.000, 0x00000000, 0 },
  {  9333, 1612, 15, 239042,   8500.000, 0x00000000, 0 },
  {  9334, 1612, 16, 239042,   8800.000, 0x00000000, 0 },
  {  9335, 1612, 17, 239042,   9100.000, 0x00000000, 0 },
  {  9336, 1612, 18, 239042,   9400.000, 0x00000000, 0 },
  {  9337, 1612, 19, 239042,   9700.000, 0x00000000, 0 },
  {  9338, 1612, 20, 239042,  10000.000, 0x00000000, 0 },
  {  9339, 1612, 21, 239042,  10300.000, 0x00000000, 0 },
  {  9340, 1612, 22, 239042,  10600.000, 0x00000000, 0 },
  {  9341, 1612, 23, 239042,  10900.000, 0x00000000, 0 },
  {  9342, 1612, 24, 239042,  11200.000, 0x00000000, 0 },
  {  9343, 1612, 25, 239042,  11500.000, 0x00000000, 0 },
  {  9344, 1612, 26, 239042,  11800.000, 0x00000000, 0 },
  {  9345, 1612, 27, 239042,  12100.000, 0x00000000, 0 },
  {  9346, 1612, 28, 239042,  12400.000, 0x00000000, 0 },
  {  9347, 1612, 29, 239042,  12700.000, 0x00000000, 0 },
  {  9348, 1612, 30, 239042,  13000.000, 0x00000000, 0 },
  {  9349, 1612, 31, 239042,  13300.000, 0x00000000, 0 },
  {  9350, 1612, 32, 239042,  13600.000, 0x00000000, 0 },
  {  9351, 1612, 33, 239042,  13900.000, 0x00000000, 0 },
  {  9352, 1612, 34, 239042,  14200.000, 0x00000000, 0 },
  {  9353, 1612, 35, 239042,  14500.000, 0x00000000, 0 },
  {  9354, 1612, 36, 239042,  14800.000, 0x00000000, 0 },
  {  9355, 1612, 37, 239042,  15100.000, 0x00000000, 0 },
  {  9356, 1612, 38, 239042,  15400.000, 0x00000000, 0 },
  {  9357, 1612, 39, 239042,  15700.000, 0x00000000, 0 },
  {  9358, 1612, 40, 239042,  16000.000, 0x00000000, 0 },
  {  9359, 1612, 41, 239042,  16300.000, 0x00000000, 0 },
  {  9360, 1612, 42, 239042,  16600.000, 0x00000000, 0 },
  {  9361, 1612, 43, 239042,  16900.000, 0x00000000, 0 },
  {  9362, 1612, 44, 239042,  17200.000, 0x00000000, 0 },
  {  9363, 1612, 45, 239042,  17500.000, 0x00000000, 0 },
  {  9364, 1612, 46, 239042,  17800.000, 0x00000000, 0 },
  {  9365, 1612, 47, 239042,  18100.000, 0x00000000, 0 },
  {  9366, 1612, 48, 239042,  18400.000, 0x00000000, 0 },
  {  9367, 1612, 49, 239042,  18700.000, 0x00000000, 0 },
  { 11235, 1612, 50, 239042,  19000.000, 0x00000000, 0 },
  { 11236, 1612, 51, 239042,  19300.000, 0x00000000, 0 },
  { 11237, 1612, 52, 239042,  19600.000, 0x00000000, 0 },
  { 11238, 1612, 53, 239042,  19900.000, 0x00000000, 0 },
  { 11239, 1612, 54, 239042,  20200.000, 0x00000000, 0 },
  { 11240, 1612, 55, 239042,  20500.000, 0x00000000, 0 },
  { 11241, 1612, 56, 239042,  20800.000, 0x00000000, 0 },
  { 11242, 1612, 57, 239042,  21100.000, 0x00000000, 0 },
  { 11243, 1612, 58, 239042,  21400.000, 0x00000000, 0 },
  { 11244, 1612, 59, 239042,  21700.000, 0x00000000, 0 },
  { 11245, 1612, 60, 239042,  22000.000, 0x00000000, 0 },
  { 11246, 1612, 61, 239042,  22300.000, 0x00000000, 0 },
  { 11247, 1612, 62, 239042,  22600.000, 0x00000000, 0 },
  { 11248, 1612, 63, 239042,  22900.000, 0x00000000, 0 },
  { 11249, 1612, 64, 239042,  23200.000, 0x00000000, 0 },
  { 11250, 1612, 65, 239042,  23500.000, 0x00000000, 0 },
  { 11251, 1612, 66, 239042,  23800.000, 0x00000000, 0 },
  { 11252, 1612, 67, 239042,  24100.000, 0x00000000, 0 },
  { 11253, 1612, 68, 239042,  24400.000, 0x00000000, 0 },
  { 11254, 1612, 69, 239042,  24700.000, 0x00000000, 0 },
  { 11255, 1612, 70, 239042,  25000.000, 0x00000000, 0 },
  { 11256, 1612, 71, 239042,  25300.000, 0x00000000, 0 },
  { 11257, 1612, 72, 239042,  25600.000, 0x00000000, 0 },
  { 11258, 1612, 73, 239042,  25900.000, 0x00000000, 0 },
  { 11259, 1612, 74, 239042,  26200.000, 0x00000000, 0 },
  { 11260, 1612, 75, 239042,  26500.000, 0x00000000, 0 },
  { 11261, 1612, 76, 239042,  26800.000, 0x00000000, 0 },
  { 11262, 1612, 77, 239042,  27100.000, 0x00000000, 0 },
  { 11263, 1612, 78, 239042,  27400.000, 0x00000000, 0 },
  { 11264, 1612, 79, 239042,  27700.000, 0x00000000, 0 },
  { 11265, 1612, 80, 239042,  28000.000, 0x00000000, 0 },
  { 11266, 1612, 81, 239042,  28300.000, 0x00000000, 0 },
  { 11267, 1612, 82, 239042,  28600.000, 0x00000000, 0 },
  { 11268, 1612, 83, 239042,  28900.000, 0x00000000, 0 },
  { 11269, 1612, 84, 239042,  29200.000, 0x00000000, 0 },
  { 11270, 1612, 85, 239042,  29500.000, 0x00000000, 0 },
  { 11271, 1612, 86, 239042,  29800.000, 0x00000000, 0 },
  { 11272, 1612, 87, 239042,  30100.000, 0x00000000, 0 },
  { 11273, 1612, 88, 239042,  30400.000, 0x00000000, 0 },
  { 11274, 1612, 89, 239042,  30700.000, 0x00000000, 0 },
  { 11275, 1612, 90, 239042,  31000.000, 0x00000000, 0 },
  { 11276, 1612, 91, 239042,  31300.000, 0x00000000, 0 },
  { 11277, 1612, 92, 239042,  31600.000, 0x00000000, 0 },
  { 11278, 1612, 93, 239042,  31900.000, 0x00000000, 0 },
  { 11279, 1612, 94, 239042,  32200.000, 0x00000000, 0 },
  { 11280, 1612, 95, 239042,  32500.000, 0x00000000, 0 },
  { 11281, 1612, 96, 239042,  32800.000, 0x00000000, 0 },
  { 11282, 1612, 97, 239042,  33100.000, 0x00000000, 0 },
  { 11283, 1612, 98, 239042,  33400.000, 0x00000000, 0 },
  { 11284, 1612, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6749, 1613,  0, 238075,      5.000, 0x00000000, 0 },
  {  7576, 1613,  1, 238075,     10.000, 0x00000000, 0 },
  {  7577, 1613,  2, 238075,     15.000, 0x00000000, 0 },
  {  7578, 1613,  3, 238075,     20.000, 0x00000000, 0 },
  {  7579, 1613,  4, 238075,     25.000, 0x00000000, 0 },
  {  7580, 1613,  5, 238075,     30.000, 0x00000000, 0 },
  {  7581, 1613,  6, 238075,     35.000, 0x00000000, 0 },
  {  7582, 1613,  7, 238075,     40.000, 0x00000000, 0 },
  {  6750, 1614,  0, 238111,      0.000, 0x00000000, 0 },
  {  6751, 1615,  0, 238147,      0.000, 0x00000000, 0 },
  {  6752, 1616,  0, 239042,   4000.000, 0x00000000, 0 },
  {  9369, 1616,  1, 239042,   4300.000, 0x00000000, 0 },
  {  9370, 1616,  2, 239042,   4600.000, 0x00000000, 0 },
  {  9371, 1616,  3, 239042,   4900.000, 0x00000000, 0 },
  {  9372, 1616,  4, 239042,   5200.000, 0x00000000, 0 },
  {  9373, 1616,  5, 239042,   5500.000, 0x00000000, 0 },
  {  9374, 1616,  6, 239042,   5800.000, 0x00000000, 0 },
  {  9375, 1616,  7, 239042,   6100.000, 0x00000000, 0 },
  {  9376, 1616,  8, 239042,   6400.000, 0x00000000, 0 },
  {  9377, 1616,  9, 239042,   6700.000, 0x00000000, 0 },
  {  9378, 1616, 10, 239042,   7000.000, 0x00000000, 0 },
  {  9379, 1616, 11, 239042,   7300.000, 0x00000000, 0 },
  {  9380, 1616, 12, 239042,   7600.000, 0x00000000, 0 },
  {  9381, 1616, 13, 239042,   7900.000, 0x00000000, 0 },
  {  9382, 1616, 14, 239042,   8200.000, 0x00000000, 0 },
  {  9383, 1616, 15, 239042,   8500.000, 0x00000000, 0 },
  {  9384, 1616, 16, 239042,   8800.000, 0x00000000, 0 },
  {  9385, 1616, 17, 239042,   9100.000, 0x00000000, 0 },
  {  9386, 1616, 18, 239042,   9400.000, 0x00000000, 0 },
  {  9387, 1616, 19, 239042,   9700.000, 0x00000000, 0 },
  {  9388, 1616, 20, 239042,  10000.000, 0x00000000, 0 },
  {  9389, 1616, 21, 239042,  10300.000, 0x00000000, 0 },
  {  9390, 1616, 22, 239042,  10600.000, 0x00000000, 0 },
  {  9391, 1616, 23, 239042,  10900.000, 0x00000000, 0 },
  {  9392, 1616, 24, 239042,  11200.000, 0x00000000, 0 },
  {  9393, 1616, 25, 239042,  11500.000, 0x00000000, 0 },
  {  9394, 1616, 26, 239042,  11800.000, 0x00000000, 0 },
  {  9395, 1616, 27, 239042,  12100.000, 0x00000000, 0 },
  {  9396, 1616, 28, 239042,  12400.000, 0x00000000, 0 },
  {  9397, 1616, 29, 239042,  12700.000, 0x00000000, 0 },
  {  9398, 1616, 30, 239042,  13000.000, 0x00000000, 0 },
  {  9399, 1616, 31, 239042,  13300.000, 0x00000000, 0 },
  {  9400, 1616, 32, 239042,  13600.000, 0x00000000, 0 },
  {  9401, 1616, 33, 239042,  13900.000, 0x00000000, 0 },
  {  9402, 1616, 34, 239042,  14200.000, 0x00000000, 0 },
  {  9403, 1616, 35, 239042,  14500.000, 0x00000000, 0 },
  {  9404, 1616, 36, 239042,  14800.000, 0x00000000, 0 },
  {  9405, 1616, 37, 239042,  15100.000, 0x00000000, 0 },
  {  9406, 1616, 38, 239042,  15400.000, 0x00000000, 0 },
  {  9407, 1616, 39, 239042,  15700.000, 0x00000000, 0 },
  {  9408, 1616, 40, 239042,  16000.000, 0x00000000, 0 },
  {  9409, 1616, 41, 239042,  16300.000, 0x00000000, 0 },
  {  9410, 1616, 42, 239042,  16600.000, 0x00000000, 0 },
  {  9411, 1616, 43, 239042,  16900.000, 0x00000000, 0 },
  {  9412, 1616, 44, 239042,  17200.000, 0x00000000, 0 },
  {  9413, 1616, 45, 239042,  17500.000, 0x00000000, 0 },
  {  9414, 1616, 46, 239042,  17800.000, 0x00000000, 0 },
  {  9415, 1616, 47, 239042,  18100.000, 0x00000000, 0 },
  {  9416, 1616, 48, 239042,  18400.000, 0x00000000, 0 },
  {  9417, 1616, 49, 239042,  18700.000, 0x00000000, 0 },
  { 11285, 1616, 50, 239042,  19000.000, 0x00000000, 0 },
  { 11286, 1616, 51, 239042,  19300.000, 0x00000000, 0 },
  { 11287, 1616, 52, 239042,  19600.000, 0x00000000, 0 },
  { 11288, 1616, 53, 239042,  19900.000, 0x00000000, 0 },
  { 11289, 1616, 54, 239042,  20200.000, 0x00000000, 0 },
  { 11290, 1616, 55, 239042,  20500.000, 0x00000000, 0 },
  { 11291, 1616, 56, 239042,  20800.000, 0x00000000, 0 },
  { 11292, 1616, 57, 239042,  21100.000, 0x00000000, 0 },
  { 11293, 1616, 58, 239042,  21400.000, 0x00000000, 0 },
  { 11294, 1616, 59, 239042,  21700.000, 0x00000000, 0 },
  { 11295, 1616, 60, 239042,  22000.000, 0x00000000, 0 },
  { 11296, 1616, 61, 239042,  22300.000, 0x00000000, 0 },
  { 11297, 1616, 62, 239042,  22600.000, 0x00000000, 0 },
  { 11298, 1616, 63, 239042,  22900.000, 0x00000000, 0 },
  { 11299, 1616, 64, 239042,  23200.000, 0x00000000, 0 },
  { 11300, 1616, 65, 239042,  23500.000, 0x00000000, 0 },
  { 11301, 1616, 66, 239042,  23800.000, 0x00000000, 0 },
  { 11302, 1616, 67, 239042,  24100.000, 0x00000000, 0 },
  { 11303, 1616, 68, 239042,  24400.000, 0x00000000, 0 },
  { 11304, 1616, 69, 239042,  24700.000, 0x00000000, 0 },
  { 11305, 1616, 70, 239042,  25000.000, 0x00000000, 0 },
  { 11306, 1616, 71, 239042,  25300.000, 0x00000000, 0 },
  { 11307, 1616, 72, 239042,  25600.000, 0x00000000, 0 },
  { 11308, 1616, 73, 239042,  25900.000, 0x00000000, 0 },
  { 11309, 1616, 74, 239042,  26200.000, 0x00000000, 0 },
  { 11310, 1616, 75, 239042,  26500.000, 0x00000000, 0 },
  { 11311, 1616, 76, 239042,  26800.000, 0x00000000, 0 },
  { 11312, 1616, 77, 239042,  27100.000, 0x00000000, 0 },
  { 11313, 1616, 78, 239042,  27400.000, 0x00000000, 0 },
  { 11314, 1616, 79, 239042,  27700.000, 0x00000000, 0 },
  { 11315, 1616, 80, 239042,  28000.000, 0x00000000, 0 },
  { 11316, 1616, 81, 239042,  28300.000, 0x00000000, 0 },
  { 11317, 1616, 82, 239042,  28600.000, 0x00000000, 0 },
  { 11318, 1616, 83, 239042,  28900.000, 0x00000000, 0 },
  { 11319, 1616, 84, 239042,  29200.000, 0x00000000, 0 },
  { 11320, 1616, 85, 239042,  29500.000, 0x00000000, 0 },
  { 11321, 1616, 86, 239042,  29800.000, 0x00000000, 0 },
  { 11322, 1616, 87, 239042,  30100.000, 0x00000000, 0 },
  { 11323, 1616, 88, 239042,  30400.000, 0x00000000, 0 },
  { 11324, 1616, 89, 239042,  30700.000, 0x00000000, 0 },
  { 11325, 1616, 90, 239042,  31000.000, 0x00000000, 0 },
  { 11326, 1616, 91, 239042,  31300.000, 0x00000000, 0 },
  { 11327, 1616, 92, 239042,  31600.000, 0x00000000, 0 },
  { 11328, 1616, 93, 239042,  31900.000, 0x00000000, 0 },
  { 11329, 1616, 94, 239042,  32200.000, 0x00000000, 0 },
  { 11330, 1616, 95, 239042,  32500.000, 0x00000000, 0 },
  { 11331, 1616, 96, 239042,  32800.000, 0x00000000, 0 },
  { 11332, 1616, 97, 239042,  33100.000, 0x00000000, 0 },
  { 11333, 1616, 98, 239042,  33400.000, 0x00000000, 0 },
  { 11334, 1616, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6753, 1617,  0, 238076,     10.000, 0x00000000, 0 },
  {  7583, 1617,  1, 238076,     20.000, 0x00000000, 0 },
  {  7584, 1617,  2, 238076,     30.000, 0x00000000, 0 },
  {  7585, 1617,  3, 238076,     40.000, 0x00000000, 0 },
  {  7586, 1617,  4, 238076,     50.000, 0x00000000, 0 },
  {  7587, 1617,  5, 238076,     60.000, 0x00000000, 0 },
  {  7588, 1617,  6, 238076,     70.000, 0x00000000, 0 },
  {  7589, 1617,  7, 238076,     80.000, 0x00000000, 0 },
  {  6754, 1618,  0, 238112,      0.000, 0x00000000, 0 },
  {  6755, 1619,  0, 238148,      0.000, 0x00000000, 0 },
  {  6756, 1620,  0, 239042,   4000.000, 0x00000000, 0 },
  {  9419, 1620,  1, 239042,   4300.000, 0x00000000, 0 },
  {  9420, 1620,  2, 239042,   4600.000, 0x00000000, 0 },
  {  9421, 1620,  3, 239042,   4900.000, 0x00000000, 0 },
  {  9422, 1620,  4, 239042,   5200.000, 0x00000000, 0 },
  {  9423, 1620,  5, 239042,   5500.000, 0x00000000, 0 },
  {  9424, 1620,  6, 239042,   5800.000, 0x00000000, 0 },
  {  9425, 1620,  7, 239042,   6100.000, 0x00000000, 0 },
  {  9426, 1620,  8, 239042,   6400.000, 0x00000000, 0 },
  {  9427, 1620,  9, 239042,   6700.000, 0x00000000, 0 },
  {  9428, 1620, 10, 239042,   7000.000, 0x00000000, 0 },
  {  9429, 1620, 11, 239042,   7300.000, 0x00000000, 0 },
  {  9430, 1620, 12, 239042,   7600.000, 0x00000000, 0 },
  {  9431, 1620, 13, 239042,   7900.000, 0x00000000, 0 },
  {  9432, 1620, 14, 239042,   8200.000, 0x00000000, 0 },
  {  9433, 1620, 15, 239042,   8500.000, 0x00000000, 0 },
  {  9434, 1620, 16, 239042,   8800.000, 0x00000000, 0 },
  {  9435, 1620, 17, 239042,   9100.000, 0x00000000, 0 },
  {  9436, 1620, 18, 239042,   9400.000, 0x00000000, 0 },
  {  9437, 1620, 19, 239042,   9700.000, 0x00000000, 0 },
  {  9438, 1620, 20, 239042,  10000.000, 0x00000000, 0 },
  {  9439, 1620, 21, 239042,  10300.000, 0x00000000, 0 },
  {  9440, 1620, 22, 239042,  10600.000, 0x00000000, 0 },
  {  9441, 1620, 23, 239042,  10900.000, 0x00000000, 0 },
  {  9442, 1620, 24, 239042,  11200.000, 0x00000000, 0 },
  {  9443, 1620, 25, 239042,  11500.000, 0x00000000, 0 },
  {  9444, 1620, 26, 239042,  11800.000, 0x00000000, 0 },
  {  9445, 1620, 27, 239042,  12100.000, 0x00000000, 0 },
  {  9446, 1620, 28, 239042,  12400.000, 0x00000000, 0 },
  {  9447, 1620, 29, 239042,  12700.000, 0x00000000, 0 },
  {  9448, 1620, 30, 239042,  13000.000, 0x00000000, 0 },
  {  9449, 1620, 31, 239042,  13300.000, 0x00000000, 0 },
  {  9450, 1620, 32, 239042,  13600.000, 0x00000000, 0 },
  {  9451, 1620, 33, 239042,  13900.000, 0x00000000, 0 },
  {  9452, 1620, 34, 239042,  14200.000, 0x00000000, 0 },
  {  9453, 1620, 35, 239042,  14500.000, 0x00000000, 0 },
  {  9454, 1620, 36, 239042,  14800.000, 0x00000000, 0 },
  {  9455, 1620, 37, 239042,  15100.000, 0x00000000, 0 },
  {  9456, 1620, 38, 239042,  15400.000, 0x00000000, 0 },
  {  9457, 1620, 39, 239042,  15700.000, 0x00000000, 0 },
  {  9458, 1620, 40, 239042,  16000.000, 0x00000000, 0 },
  {  9459, 1620, 41, 239042,  16300.000, 0x00000000, 0 },
  {  9460, 1620, 42, 239042,  16600.000, 0x00000000, 0 },
  {  9461, 1620, 43, 239042,  16900.000, 0x00000000, 0 },
  {  9462, 1620, 44, 239042,  17200.000, 0x00000000, 0 },
  {  9463, 1620, 45, 239042,  17500.000, 0x00000000, 0 },
  {  9464, 1620, 46, 239042,  17800.000, 0x00000000, 0 },
  {  9465, 1620, 47, 239042,  18100.000, 0x00000000, 0 },
  {  9466, 1620, 48, 239042,  18400.000, 0x00000000, 0 },
  {  9467, 1620, 49, 239042,  18700.000, 0x00000000, 0 },
  { 11335, 1620, 50, 239042,  19000.000, 0x00000000, 0 },
  { 11336, 1620, 51, 239042,  19300.000, 0x00000000, 0 },
  { 11337, 1620, 52, 239042,  19600.000, 0x00000000, 0 },
  { 11338, 1620, 53, 239042,  19900.000, 0x00000000, 0 },
  { 11339, 1620, 54, 239042,  20200.000, 0x00000000, 0 },
  { 11340, 1620, 55, 239042,  20500.000, 0x00000000, 0 },
  { 11341, 1620, 56, 239042,  20800.000, 0x00000000, 0 },
  { 11342, 1620, 57, 239042,  21100.000, 0x00000000, 0 },
  { 11343, 1620, 58, 239042,  21400.000, 0x00000000, 0 },
  { 11344, 1620, 59, 239042,  21700.000, 0x00000000, 0 },
  { 11345, 1620, 60, 239042,  22000.000, 0x00000000, 0 },
  { 11346, 1620, 61, 239042,  22300.000, 0x00000000, 0 },
  { 11347, 1620, 62, 239042,  22600.000, 0x00000000, 0 },
  { 11348, 1620, 63, 239042,  22900.000, 0x00000000, 0 },
  { 11349, 1620, 64, 239042,  23200.000, 0x00000000, 0 },
  { 11350, 1620, 65, 239042,  23500.000, 0x00000000, 0 },
  { 11351, 1620, 66, 239042,  23800.000, 0x00000000, 0 },
  { 11352, 1620, 67, 239042,  24100.000, 0x00000000, 0 },
  { 11353, 1620, 68, 239042,  24400.000, 0x00000000, 0 },
  { 11354, 1620, 69, 239042,  24700.000, 0x00000000, 0 },
  { 11355, 1620, 70, 239042,  25000.000, 0x00000000, 0 },
  { 11356, 1620, 71, 239042,  25300.000, 0x00000000, 0 },
  { 11357, 1620, 72, 239042,  25600.000, 0x00000000, 0 },
  { 11358, 1620, 73, 239042,  25900.000, 0x00000000, 0 },
  { 11359, 1620, 74, 239042,  26200.000, 0x00000000, 0 },
  { 11360, 1620, 75, 239042,  26500.000, 0x00000000, 0 },
  { 11361, 1620, 76, 239042,  26800.000, 0x00000000, 0 },
  { 11362, 1620, 77, 239042,  27100.000, 0x00000000, 0 },
  { 11363, 1620, 78, 239042,  27400.000, 0x00000000, 0 },
  { 11364, 1620, 79, 239042,  27700.000, 0x00000000, 0 },
  { 11365, 1620, 80, 239042,  28000.000, 0x00000000, 0 },
  { 11366, 1620, 81, 239042,  28300.000, 0x00000000, 0 },
  { 11367, 1620, 82, 239042,  28600.000, 0x00000000, 0 },
  { 11368, 1620, 83, 239042,  28900.000, 0x00000000, 0 },
  { 11369, 1620, 84, 239042,  29200.000, 0x00000000, 0 },
  { 11370, 1620, 85, 239042,  29500.000, 0x00000000, 0 },
  { 11371, 1620, 86, 239042,  29800.000, 0x00000000, 0 },
  { 11372, 1620, 87, 239042,  30100.000, 0x00000000, 0 },
  { 11373, 1620, 88, 239042,  30400.000, 0x00000000, 0 },
  { 11374, 1620, 89, 239042,  30700.000, 0x00000000, 0 },
  { 11375, 1620, 90, 239042,  31000.000, 0x00000000, 0 },
  { 11376, 1620, 91, 239042,  31300.000, 0x00000000, 0 },
  { 11377, 1620, 92, 239042,  31600.000, 0x00000000, 0 },
  { 11378, 1620, 93, 239042,  31900.000, 0x00000000, 0 },
  { 11379, 1620, 94, 239042,  32200.000, 0x00000000, 0 },
  { 11380, 1620, 95, 239042,  32500.000, 0x00000000, 0 },
  { 11381, 1620, 96, 239042,  32800.000, 0x00000000, 0 },
  { 11382, 1620, 97, 239042,  33100.000, 0x00000000, 0 },
  { 11383, 1620, 98, 239042,  33400.000, 0x00000000, 0 },
  { 11384, 1620, 99, 239042,  33700.000, 0x00000000, 0 },
  {  6757, 1621,  0, 238077,      2.000, 0x00000000, 0 },
  {  7590, 1621,  1, 238077,      4.000, 0x00000000, 0 },
  {  7591, 1621,  2, 238077,      6.000, 0x00000000, 0 },
  {  7592, 1621,  3, 238077,      8.000, 0x00000000, 0 },
  {  7593, 1621,  4, 238077,     10.000, 0x00000000, 0 },
  {  7594, 1621,  5, 238077,     12.000, 0x00000000, 0 },
  {  7595, 1621,  6, 238077,     14.000, 0x00000000, 0 },
  {  7596, 1621,  7, 238077,     16.000, 0x00000000, 0 },
  {  6758, 1622,  0, 238113,      0.000, 0x00000000, 0 },
  {  6759, 1623,  0, 238149,      0.000, 0x00000000, 0 },
  {  6760, 1624,  0, 239042,   4000.000, 0x00000000, 0 },
  {  9469, 1624,  1, 239042,   4300.000, 0x00000000, 0 },
  {  9470, 1624,  2, 239042,   4600.000, 0x00000000, 0 },
  {  9471, 1624,  3, 239042,   4900.000, 0x00000000, 0 },
  {  9472, 1624,  4, 239042,   5200.000, 0x00000000, 0 },
  {  9473, 1624,  5, 239042,   5500.000, 0x00000000, 0 },
  {  9474, 1624,  6, 239042,   5800.000, 0x00000000, 0 },
  {  9475, 1624,  7, 239042,   6100.000, 0x00000000, 0 },
  {  9476, 1624,  8, 239042,   6400.000, 0x00000000, 0 },
  {  9477, 1624,  9, 239042,   6700.000, 0x00000000, 0 },
  {  9478, 1624, 10, 239042,   7000.000, 0x00000000, 0 },
  {  9479, 1624, 11, 239042,   7300.000, 0x00000000, 0 },
  {  9480, 1624, 12, 239042,   7600.000, 0x00000000, 0 },
  {  9481, 1624, 13, 239042,   7900.000, 0x00000000, 0 },
  {  9482, 1624, 14, 239042,   8200.000, 0x00000000, 0 },
  {  9483, 1624, 15, 239042,   8500.000, 0x00000000, 0 },
  {  9484, 1624, 16, 239042,   8800.000, 0x00000000, 0 },
  {  9485, 1624, 17, 239042,   9100.000, 0x00000000, 0 },
  {  9486, 1624, 18, 239042,   9400.000, 0x00000000, 0 },
  {  9487, 1624, 19, 239042,   9700.000, 0x00000000, 0 },
  {  9488, 1624, 20, 239042,  10000.000, 0x00000000, 0 },
  {  9489, 1624, 21, 239042,  10300.000, 0x00000000, 0 },
  {  9490, 1624, 22, 239042,  10600.000, 0x00000000, 0 },
  {  9491, 1624, 23, 239042,  10900.000, 0x00000000, 0 },
  {  9492, 1624, 24, 239042,  11200.000, 0x00000000, 0 },
  {  9493, 1624, 25, 239042,  11500.000, 0x00000000, 0 },
  {  9494, 1624, 26, 239042,  11800.000, 0x00000000, 0 },
  {  9495, 1624, 27, 239042,  12100.000, 0x00000000, 0 },
  {  9496, 1624, 28, 239042,  12400.000, 0x00000000, 0 },
  {  9497, 1624, 29, 239042,  12700.000, 0x00000000, 0 },
  {  9498, 1624, 30, 239042,  13000.000, 0x00000000, 0 },
  {  9499, 1624, 31, 239042,  13300.000, 0x00000000, 0 },
  {  9500, 1624, 32, 239042,  13600.000, 0x00000000, 0 },
  {  9501, 1624, 33, 239042,  13900.000, 0x00000000, 0 },
  {  9502, 1624, 34, 239042,  14200.000, 0x00000000, 0 },
  {  9503, 1624, 35, 239042,  14500.000, 0x00000000, 0 },
  {  9504, 1624, 36, 239042,  14800.000, 0x00000000, 0 },
  {  9505, 1624, 37, 239042,  15100.000, 0x00000000, 0 },
  {  9506, 1624, 38, 239042,  15400.000, 0x00000000, 0 },
  {  9507, 1624, 39, 239042,  15700.000, 0x00000000, 0 },
  {  9508, 1624, 40, 239042,  16000.000, 0x00000000, 0 },
  {  9509, 1624, 41, 239042,  16300.000, 0x00000000, 0 },
  {  9510, 1624, 42, 239042,  16600.000, 0x00000000, 0 },
  {  9511, 1624, 43, 239042,  16900.000, 0x00000000, 0 },
  {  9512, 1624, 44, 239042,  17200.000, 0x00000000, 0 },
  {  9513, 1624, 45, 239042,  17500.000, 0x00000000, 0 },
  {  9514, 1624, 46, 239042,  17800.000, 0x00000000, 0 },
  {  9515, 1624, 47, 239042,  18100.000, 0x00000000, 0 },
  {  9516, 1624, 48, 239042,  18400.000, 0x00000000, 0 },
  {  9517, 1624, 49, 239042,  18700.000, 0x00000000, 0 },
  { 11385, 1624, 50, 239042,  19000.000, 0x00000000, 0 },
  { 11386, 1624, 51, 239042,  19300.000, 0x00000000, 0 },
  { 11387, 1624, 52, 239042,  19600.000, 0x00000000, 0 },
  { 11388, 1624, 53, 239042,  19900.000, 0x00000000, 0 },
  { 11389, 1624, 54, 239042,  20200.000, 0x00000000, 0 },
  { 11390, 1624, 55, 239042,  20500.000, 0x00000000, 0 },
  { 11391, 1624, 56, 239042,  20800.000, 0x00000000, 0 },
  { 11392, 1624, 57, 239042,  21100.000, 0x00000000, 0 },
  { 11393, 1624, 58, 239042,  21400.000, 0x00000000, 0 },
  { 11394, 1624, 59, 239042,  21700.000, 0x00000000, 0 },
  { 11395, 1624, 60, 239042,  22000.000, 0x00000000, 0 },
  { 11396, 1624, 61, 239042,  22300.000, 0x00000000, 0 },
  { 11397, 1624, 62, 239042,  22600.000, 0x00000000, 0 },
  { 11398, 1624, 63, 239042,  22900.000, 0x00000000, 0 },
  { 11399, 1624, 64, 239042,  23200.000, 0x00000000, 0 },
  { 11400, 1624, 65, 239042,  23500.000, 0x00000000, 0 },
  { 11401, 1624, 66, 239042,  23800.000, 0x00000000, 0 },
  { 11402, 1624, 67, 239042,  24100.000, 0x00000000, 0 },
  { 11403, 1624, 68, 239042,  24400.000, 0x00000000, 0 },
  { 11404, 1624, 69, 239042,  24700.000, 0x00000000, 0 },
  { 11405, 1624, 70, 239042,  25000.000, 0x00000000, 0 },
  { 11406, 1624, 71, 239042,  25300.000, 0x00000000, 0 },
  { 11407, 1624, 72, 239042,  25600.000, 0x00000000, 0 },
  { 11408, 1624, 73, 239042,  25900.000, 0x00000000, 0 },
  { 11409, 1624, 74, 239042,  26200.000, 0x00000000, 0 },
  { 11410, 1624, 75, 239042,  26500.000, 0x00000000, 0 },
  { 11411, 1624, 76, 239042,  26800.000, 0x00000000, 0 },
  { 11412, 1624, 77, 239042,  27100.000, 0x00000000, 0 },
  { 11413, 1624, 78, 239042,  27400.000, 0x00000000, 0 },
  { 11414, 1624, 79, 239042,  27700.000, 0x00000000, 0 },
  { 11415, 1624, 80, 239042,  28000.000, 0x00000000, 0 },
  { 11416, 1624, 81, 239042,  28300.000, 0x00000000, 0 },
  { 11417, 1624, 82, 239042,  28600.000, 0x00000000, 0 },
  { 11418, 1624, 83, 239042,  28900.000, 0x00000000, 0 },
  { 11419, 1624, 84, 239042,  29200.000, 0x00000000, 0 },
  { 11420, 1624, 85, 239042,  29500.000, 0x00000000, 0 },
  { 11421, 1624, 86, 239042,  29800.000, 0x00000000, 0 },
  { 11422, 1624, 87, 239042,  30100.000, 0x00000000, 0 },
  { 11423, 1624, 88, 239042,  30400.000, 0x00000000, 0 },
  { 11424, 1624, 89, 239042,  30700.000, 0x00000000, 0 },
  { 11425, 1624, 90, 239042,  31000.000, 0x00000000, 0 },
  { 11426, 1624, 91, 239042,  31300.000, 0x00000000, 0 },
  { 11427, 1624, 92, 239042,  31600.000, 0x00000000, 0 },
  { 11428, 1624, 93, 239042,  31900.000, 0x00000000, 0 },
  { 11429, 1624, 94, 239042,  32200.000, 0x00000000, 0 },
  { 11430, 1624, 95, 239042,  32500.000, 0x00000000, 0 },
  { 11431, 1624, 96, 239042,  32800.000, 0x00000000, 0 },
  { 11432, 1624, 97, 239042,  33100.000, 0x00000000, 0 },
  { 11433, 1624, 98, 239042,  33400.000, 0x00000000, 0 },
  { 11434, 1624, 99, 239042,  33700.000, 0x00000000, 0 },
  {  7618, 1627,  0, 241018,      0.000, 0x00000000, 0 },
  {  7619, 1628,  0, 241047,      0.000, 0x00000000, 0 },
  {  7620, 1629,  0, 241050,      0.000, 0x00000000, 0 },
  {  7621, 1630,  0, 241090,      0.000, 0x00000000, 0 },
  {  7622, 1631,  0, 241091,      0.000, 0x00000000, 0 },
  {  7623, 1632,  0, 241099,      0.000, 0x00000000, 0 },
  {  7624, 1633,  0, 241100,      0.000, 0x00000000, 0 },
  {  7625, 1634,  0, 241101,      0.000, 0x00000000, 0 },
  {  7626, 1635,  0, 241102,      0.000, 0x00000000, 0 },
  {  7627, 1636,  0, 241110,      0.000, 0x00000000, 0 },
  {  7628, 1637,  0, 241114,      0.000, 0x00000000, 0 },
  {  7629, 1638,  0, 241115,      0.000, 0x00000000, 0 },
  {  7630, 1639,  0, 241121,      0.000, 0x00000000, 0 },
  {  7631, 1640,  0, 241124,      0.000, 0x00000000, 0 },
  {  7632, 1641,  0, 241125,      0.000, 0x00000000, 0 },
  {  7633, 1642,  0, 241131,      0.000, 0x00000000, 0 },
  {  7634, 1643,  0, 241134,      0.000, 0x00000000, 0 },
  {  7635, 1644,  0, 241136,      0.000, 0x00000000, 0 },
  {  7636, 1645,  0, 241145,      0.000, 0x00000000, 0 },
  {  7637, 1646,  0, 241146,      0.000, 0x00000000, 0 },
  {  7638, 1647,  0, 241147,      0.000, 0x00000000, 0 },
  {  7639, 1648,  0, 241148,      0.000, 0x00000000, 0 },
  {  7640, 1649,  0, 241149,      0.000, 0x00000000, 0 },
  {  7641, 1650,  0, 241150,      0.000, 0x00000000, 0 },
  {  7642, 1651,  0, 241152,      0.000, 0x00000000, 0 },
  {  7643, 1652,  0, 241153,      0.000, 0x00000000, 0 },
  {  7644, 1653,  0, 241154,      0.000, 0x00000000, 0 },
  {  7666, 1683,  0, 241202,      0.000, 0x00000000, 0 },
  {  7670, 1687,  0, 241203,      0.000, 0x00000000, 0 },
  {  7676, 1693,  0, 241205,      0.000, 0x00000000, 0 },
  {  7694, 1711,  0, 241257,      0.000, 0x00000000, 0 },
  {  7695, 1712,  0, 241252,      0.000, 0x00000000, 0 },
  {  7696, 1713,  0, 241253,      0.000, 0x00000000, 0 },
  {  7697, 1714,  0, 241264,      0.000, 0x00000000, 0 },
  {  7698, 1715,  0, 241269,      0.000, 0x00000000, 0 },
  {  7699, 1716,  0, 241270,      0.000, 0x00000000, 0 },
  {  9527, 1739,  0, 250879,      5.000, 0x00000000, 0 },
  {  9530, 1739,  1, 250879,     10.000, 0x00000000, 0 },
  {  9531, 1739,  2, 250879,     15.000, 0x00000000, 0 },
  {  9590, 1770,  0, 252088,    500.000, 0x00000000, 0 },
  {  9591, 1770,  1, 252088,   1000.000, 0x00000000, 0 },
  {  9592, 1770,  2, 252088,   1500.000, 0x00000000, 0 },
  {  9593, 1771,  0, 252091,    500.000, 0x00000000, 0 },
  {  9594, 1771,  1, 252091,   1000.000, 0x00000000, 0 },
  {  9595, 1771,  2, 252091,   1500.000, 0x00000000, 0 },
  {  9602, 1774,  0, 252191,   1500.000, 0x00000000, 0 },
  {  9603, 1774,  1, 252191,   3000.000, 0x00000000, 0 },
  {  9604, 1774,  2, 252191,   4500.000, 0x00000000, 0 },
  {  9605, 1775,  0, 252207, 300000.000, 0x00000000, 0 },
  {  9606, 1775,  1, 252207, 600000.000, 0x00000000, 0 },
  {  9607, 1775,  2, 252207, 900000.000, 0x00000000, 0 },
  {  9611, 1777,  0, 252799,   1500.000, 0x00000000, 0 },
  {  9612, 1777,  1, 252799,   3000.000, 0x00000000, 0 },
  {  9613, 1777,  2, 252799,   4500.000, 0x00000000, 0 },
  {  9614, 1778,  0, 252875, 200000.000, 0x00000000, 0 },
  {  9615, 1778,  1, 252875, 400000.000, 0x00000000, 0 },
  {  9616, 1778,  2, 252875, 600000.000, 0x00000000, 0 },
  {  9617, 1779,  0, 252888,  60000.000, 0x00000000, 0 },
  {  9618, 1779,  1, 252888, 120000.000, 0x00000000, 0 },
  {  9619, 1779,  2, 252888, 180000.000, 0x00000000, 0 },
  {  9620, 1780,  0, 252906,  16000.000, 0x00000000, 0 },
  {  9621, 1780,  1, 252906,  32000.000, 0x00000000, 0 },
  {  9622, 1780,  2, 252906,  48000.000, 0x00000000, 0 },
  {  9623, 1781,  0, 252922, 186350.000, 0x00000000, 0 },
  {  9624, 1781,  1, 252922, 372680.000, 0x00000000, 0 },
  {  9625, 1781,  2, 252922, 559030.000, 0x00000000, 0 },
  {  9626, 1782,  0, 253070, 135000.000, 0x00000000, 0 },
  {  9627, 1782,  1, 253070, 270000.000, 0x00000000, 0 },
  {  9628, 1782,  2, 253070, 405000.000, 0x00000000, 0 },
  {  9629, 1783,  0, 253093, 101000.000, 0x00000000, 0 },
  {  9630, 1783,  1, 253093, 202000.000, 0x00000000, 0 },
  {  9631, 1783,  2, 253093, 303000.000, 0x00000000, 0 },
  {  9632, 1784,  0, 253111,  45500.000, 0x00000000, 0 },
  {  9633, 1784,  1, 253111,  91000.000, 0x00000000, 0 },
  {  9634, 1784,  2, 253111, 136500.000, 0x00000000, 0 },
  {     0,    0,  0,      0,      0.000, 0x00000000, 0 },
};
#define ARTIFACT_POWER_RANK_HOTFIX_SIZE (0)

// 0 artifact_power_rank hotfix entries, wow build level 26491
static hotfix::client_hotfix_entry_t __artifact_power_rank_hotfix_data[] = {
  {      0,  0, 0, 0 },
};

