#include "dbc/data_definitions.hh"
#include "dbc/data_enums.hh"
#include "dbc/dbc.hpp"
#include "dbc/generated/sc_item_data.inc"
#include "dbc/generated/sc_item_data2.inc"
#include "dbc/generated/sc_spec_list.inc"
#include "dbc/generated/sc_spell_data.inc"
#include "dbc/generated/sc_spell_lists.inc"
#include "dbc/generated/sc_talent_data.inc"

#include "simc_copied.hpp"
#include "util.hpp"

namespace
{
    // clang-format off
    const struct { const char* name; player_e pt; } _class_map[] =
    {
      { nullptr, PLAYER_NONE },
      { "Warrior", WARRIOR },
      { "Paladin", PALADIN },
      { "Hunter", HUNTER },
      { "Rogue", ROGUE },
      { "Priest", PRIEST },
      { "Death Knight", DEATH_KNIGHT },
      { "Shaman", SHAMAN },
      { "Mage", MAGE },
      { "Warlock", WARLOCK },
      { "Monk", MONK },
      { "Druid", DRUID },
      { "Demon Hunter", DEMON_HUNTER },
      { nullptr, PLAYER_NONE },
    };

    struct spec_map_t
    {
      specialization_e spec;
      const char* name;
    };

    const spec_map_t spec_map[] =
    {
      { WARRIOR_ARMS,         "Arms Warrior"         },
      { WARRIOR_FURY,         "Fury Warrior"         },
      { WARRIOR_PROTECTION,   "Protection Warrior"   },
      { PALADIN_HOLY,         "Holy Paladin"         },
      { PALADIN_PROTECTION,   "Protection Paladin"   },
      { PALADIN_RETRIBUTION,  "Retribution Paladin"  },
      { HUNTER_BEAST_MASTERY, "Beast Mastery Hunter" },
      { HUNTER_BEAST_MASTERY, "Beast-Mastery Hunter" }, // Alternate
      { HUNTER_MARKSMANSHIP,  "Marksmanship Hunter"  },
      { HUNTER_SURVIVAL,      "Survival Hunter"      },
      { ROGUE_ASSASSINATION,  "Assassination Rogue"  },
      { ROGUE_OUTLAW,         "Outlaw Rogue"         },
      { ROGUE_SUBTLETY,       "Subtlety Rogue"       },
      { PRIEST_DISCIPLINE,    "Discipline Priest"    },
      { PRIEST_HOLY,          "Holy Priest"          },
      { PRIEST_SHADOW,        "Shadow Priest"        },
      { DEATH_KNIGHT_BLOOD,   "Blood Death Knight"   }, // Default
      { DEATH_KNIGHT_BLOOD,   "Blood DeathKnight"    }, // Alternate (battle.net match)
      { DEATH_KNIGHT_FROST,   "Frost Death Knight"   }, // Default
      { DEATH_KNIGHT_FROST,   "Frost DeathKnight"    }, // Alternate (battle.net match)
      { DEATH_KNIGHT_UNHOLY,  "Unholy Death Knight"  }, // Default
      { DEATH_KNIGHT_UNHOLY,  "Unholy DeathKnight"   }, // Alternate (battle.net match)
      { SHAMAN_ELEMENTAL,     "Elemental Shaman"     },
      { SHAMAN_ENHANCEMENT,   "Enhancement Shaman"   },
      { SHAMAN_RESTORATION,   "Restoration Shaman"   },
      { MAGE_ARCANE,          "Arcane Mage"          },
      { MAGE_FIRE,            "Fire Mage"            },
      { MAGE_FROST,           "Frost Mage"           },
      { WARLOCK_AFFLICTION,   "Affliction Warlock"   },
      { WARLOCK_DEMONOLOGY,   "Demonology Warlock"   },
      { WARLOCK_DESTRUCTION,  "Destruction Warlock"  },
      { MONK_BREWMASTER,      "Brewmaster Monk"      },
      { MONK_MISTWEAVER,      "Mistweaver Monk"      },
      { MONK_WINDWALKER,      "Windwalker Monk"      },
      { DRUID_BALANCE,        "Balance Druid"        },
      { DRUID_FERAL,          "Feral Druid"          },
      { DRUID_GUARDIAN,       "Guardian Druid"       },
      { DRUID_RESTORATION,    "Restoration Druid"    },
      { DEMON_HUNTER_HAVOC,   "Havoc Demon Hunter"   },
      { DEMON_HUNTER_HAVOC,   "Havoc DemonHunter"    },
      { DEMON_HUNTER_VENGEANCE, "Vengeance Demon Hunter" },
      { DEMON_HUNTER_VENGEANCE, "Vengeance DemonHunter"  },
    };
    // clang-format on
} // namespace

std::string simc_copied::className_from_classID(size_t classID)
{
    return std::string(_class_map[classID].name);
}

std::string simc_copied::specName_from_specID(size_t specID)
{
    auto it = util::find_if(spec_map, [&](const auto& s) { return s.spec == specID; });
    if(it == std::end(spec_map))
        return "!!UNKNOWN_SPEC!!";
    return std::string(it->name);
}
