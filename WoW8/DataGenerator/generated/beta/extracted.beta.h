#pragma once
namespace hotfix {}
using namespace hotfix;

bool pred_ci ( char a, char b )
{
  return std::tolower( a ) == std::tolower( b );
}

bool str_compare_ci( const std::string& l,
                           const std::string& r )
{
  if ( l.size() != r.size() )
    return false;

  return std::equal( l.begin(), l.end(), r.begin(), pred_ci );
}

enum player_e
{
  PLAYER_SPECIAL_SCALE7 = -7,
  PLAYER_SPECIAL_SCALE6 = -6,
  PLAYER_SPECIAL_SCALE5 = -5,
  PLAYER_SPECIAL_SCALE4 = -4,
  PLAYER_SPECIAL_SCALE3 = -3,
  PLAYER_SPECIAL_SCALE2 = -2,
  PLAYER_SPECIAL_SCALE  = -1,
  PLAYER_NONE           = 0,
  DEATH_KNIGHT,
  DEMON_HUNTER,
  DRUID,
  HUNTER,
  MAGE,
  MONK,
  PALADIN,
  PRIEST,
  ROGUE,
  SHAMAN,
  WARLOCK,
  WARRIOR,
  PLAYER_PET,
  PLAYER_GUARDIAN,
  HEALING_ENEMY,
  ENEMY,
  ENEMY_ADD,
  TMI_BOSS,
  TANK_DUMMY,
  PLAYER_MAX
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

const char* player_type_string( int type )
{
  switch ( type )
  {
    case PLAYER_NONE:     return "none";
    case DEATH_KNIGHT:    return "deathknight";
    case DEMON_HUNTER:    return "demonhunter";
    case DRUID:           return "druid";
    case HUNTER:          return "hunter";
    case MAGE:            return "mage";
    case MONK:            return "monk";
    case PALADIN:         return "paladin";
    case PRIEST:          return "priest";
    case ROGUE:           return "rogue";
    case SHAMAN:          return "shaman";
    case WARLOCK:         return "warlock";
    case WARRIOR:         return "warrior";
    case PLAYER_PET:      return "pet";
    case PLAYER_GUARDIAN: return "guardian";
    case ENEMY:           return "enemy";
    case ENEMY_ADD:       return "add";
    case TMI_BOSS:        return "tmi_boss";
    case TANK_DUMMY:      return "tank_dummy";
    default:              return "unknown";
  }
}

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

int translate_spec_str( int ptype, const std::string& spec_str )
{
  using namespace util;
  switch ( ptype )
  {
    case DEATH_KNIGHT:
    {
      if ( str_compare_ci( spec_str, "blood" ) )
        return DEATH_KNIGHT_BLOOD;
      if ( str_compare_ci( spec_str, "tank" ) )
        return DEATH_KNIGHT_BLOOD;
      else if ( str_compare_ci( spec_str, "frost" ) )
        return DEATH_KNIGHT_FROST;
      else if ( str_compare_ci( spec_str, "unholy" ) )
        return DEATH_KNIGHT_UNHOLY;
      break;
    }
    case DEMON_HUNTER:
    {
      if ( str_compare_ci( spec_str, "havoc" ) )
        return DEMON_HUNTER_HAVOC;
      else if ( str_compare_ci( spec_str, "vengeance" ) )
        return DEMON_HUNTER_VENGEANCE;
      break;
    }
    case DRUID:
    {
      if ( str_compare_ci( spec_str, "balance" ) )
        return DRUID_BALANCE;
      else if ( str_compare_ci( spec_str, "caster" ) )
        return DRUID_BALANCE;
      else if ( str_compare_ci( spec_str, "laserchicken" ) )
        return DRUID_BALANCE;
      else if ( str_compare_ci( spec_str, "feral" ) )
        return DRUID_FERAL;
      else if ( str_compare_ci( spec_str, "feral_combat" ) )
        return DRUID_FERAL;
      else if ( str_compare_ci( spec_str, "cat" ) )
        return DRUID_FERAL;
      else if ( str_compare_ci( spec_str, "melee" ) )
        return DRUID_FERAL;
      else if ( str_compare_ci( spec_str, "guardian" ) )
        return DRUID_GUARDIAN;
      else if ( str_compare_ci( spec_str, "bear" ) )
        return DRUID_GUARDIAN;
      else if ( str_compare_ci( spec_str, "tank" ) )
        return DRUID_GUARDIAN;
      else if ( str_compare_ci( spec_str, "restoration" ) )
        return DRUID_RESTORATION;
      else if ( str_compare_ci( spec_str, "resto" ) )
        return DRUID_RESTORATION;
      else if ( str_compare_ci( spec_str, "healer" ) )
        return DRUID_RESTORATION;
      else if ( str_compare_ci( spec_str, "tree" ) )
        return DRUID_RESTORATION;

      break;
    }
    case HUNTER:
    {
      if ( str_compare_ci( spec_str, "beast_mastery" ) )
        return HUNTER_BEAST_MASTERY;
      if ( str_compare_ci( spec_str, "bm" ) )
        return HUNTER_BEAST_MASTERY;
      else if ( str_compare_ci( spec_str, "marksmanship" ) )
        return HUNTER_MARKSMANSHIP;
      else if ( str_compare_ci( spec_str, "mm" ) )
        return HUNTER_MARKSMANSHIP;
      else if ( str_compare_ci( spec_str, "survival" ) )
        return HUNTER_SURVIVAL;
      else if ( str_compare_ci( spec_str, "sv" ) )
        return HUNTER_SURVIVAL;
      break;
    }
    case MAGE:
    {
      if ( str_compare_ci( spec_str, "arcane" ) )
        return MAGE_ARCANE;
      else if ( str_compare_ci( spec_str, "fire" ) )
        return MAGE_FIRE;
      else if ( str_compare_ci( spec_str, "frost" ) )
        return MAGE_FROST;
      break;
    }
    case MONK:
    {
      if ( str_compare_ci( spec_str, "brewmaster" ) )
        return MONK_BREWMASTER;
      else if ( str_compare_ci( spec_str, "brm" ) )
        return MONK_BREWMASTER;
      else if ( str_compare_ci( spec_str, "tank" ) )
        return MONK_BREWMASTER;
      else if ( str_compare_ci( spec_str, "mistweaver" ) )
        return MONK_MISTWEAVER;
      else if ( str_compare_ci( spec_str, "mw" ) )
        return MONK_MISTWEAVER;
      else if ( str_compare_ci( spec_str, "healer" ) )
        return MONK_MISTWEAVER;
      else if ( str_compare_ci( spec_str, "windwalker" ) )
        return MONK_WINDWALKER;
      else if ( str_compare_ci( spec_str, "ww" ) )
        return MONK_WINDWALKER;
      else if ( str_compare_ci( spec_str, "dps" ) )
        return MONK_WINDWALKER;
      else if ( str_compare_ci( spec_str, "melee" ) )
        return MONK_WINDWALKER;
      break;
    }
    case PALADIN:
    {
      if ( str_compare_ci( spec_str, "holy" ) )
        return PALADIN_HOLY;
      if ( str_compare_ci( spec_str, "healer" ) )
        return PALADIN_HOLY;
      else if ( str_compare_ci( spec_str, "protection" ) )
        return PALADIN_PROTECTION;
      else if ( str_compare_ci( spec_str, "prot" ) )
        return PALADIN_PROTECTION;
      else if ( str_compare_ci( spec_str, "tank" ) )
        return PALADIN_PROTECTION;
      else if ( str_compare_ci( spec_str, "retribution" ) )
        return PALADIN_RETRIBUTION;
      else if ( str_compare_ci( spec_str, "ret" ) )
        return PALADIN_RETRIBUTION;
      else if ( str_compare_ci( spec_str, "dps" ) )
        return PALADIN_RETRIBUTION;
      else if ( str_compare_ci( spec_str, "melee" ) )
        return PALADIN_RETRIBUTION;
      break;
    }
    case PRIEST:
    {
      if ( str_compare_ci( spec_str, "discipline" ) )
        return PRIEST_DISCIPLINE;
      if ( str_compare_ci( spec_str, "disc" ) )
        return PRIEST_DISCIPLINE;
      else if ( str_compare_ci( spec_str, "holy" ) )
        return PRIEST_HOLY;
      else if ( str_compare_ci( spec_str, "shadow" ) )
        return PRIEST_SHADOW;
      else if ( str_compare_ci( spec_str, "caster" ) )
        return PRIEST_SHADOW;
      break;
    }
    case ROGUE:
    {
      if ( str_compare_ci( spec_str, "assassination" ) )
        return ROGUE_ASSASSINATION;
      else if ( str_compare_ci( spec_str, "ass" ) )
        return ROGUE_ASSASSINATION;
      else if ( str_compare_ci( spec_str, "mut" ) )
        return ROGUE_ASSASSINATION;
      else if ( str_compare_ci( spec_str, "outlaw" ) )
        return ROGUE_OUTLAW;
      else if ( str_compare_ci( spec_str, "pirate" ) )
        return ROGUE_OUTLAW;
      else if ( str_compare_ci( spec_str, "swashbuckler" ) )
        return ROGUE_OUTLAW;
      else if ( str_compare_ci( spec_str, "subtlety" ) )
        return ROGUE_SUBTLETY;
      else if ( str_compare_ci( spec_str, "sub" ) )
        return ROGUE_SUBTLETY;
      break;
    }
    case SHAMAN:
    {
      if ( str_compare_ci( spec_str, "elemental" ) )
        return SHAMAN_ELEMENTAL;
      if ( str_compare_ci( spec_str, "ele" ) )
        return SHAMAN_ELEMENTAL;
      if ( str_compare_ci( spec_str, "caster" ) )
        return SHAMAN_ELEMENTAL;
      else if ( str_compare_ci( spec_str, "enhancement" ) )
        return SHAMAN_ENHANCEMENT;
      else if ( str_compare_ci( spec_str, "enh" ) )
        return SHAMAN_ENHANCEMENT;
      else if ( str_compare_ci( spec_str, "melee" ) )
        return SHAMAN_ENHANCEMENT;
      else if ( str_compare_ci( spec_str, "restoration" ) )
        return SHAMAN_RESTORATION;
      else if ( str_compare_ci( spec_str, "resto" ) )
        return SHAMAN_RESTORATION;
      else if ( str_compare_ci( spec_str, "healer" ) )
        return SHAMAN_RESTORATION;
      break;
    }
    case WARLOCK:
    {
      if ( str_compare_ci( spec_str, "affliction" ) )
        return WARLOCK_AFFLICTION;
      if ( str_compare_ci( spec_str, "affl" ) )
        return WARLOCK_AFFLICTION;
      if ( str_compare_ci( spec_str, "aff" ) )
        return WARLOCK_AFFLICTION;
      else if ( str_compare_ci( spec_str, "demonology" ) )
        return WARLOCK_DEMONOLOGY;
      else if ( str_compare_ci( spec_str, "demo" ) )
        return WARLOCK_DEMONOLOGY;
      else if ( str_compare_ci( spec_str, "destruction" ) )
        return WARLOCK_DESTRUCTION;
      else if ( str_compare_ci( spec_str, "destro" ) )
        return WARLOCK_DESTRUCTION;
      break;
    }
    case WARRIOR:
    {
      if ( str_compare_ci( spec_str, "arms" ) )
        return WARRIOR_ARMS;
      else if ( str_compare_ci( spec_str, "fury" ) )
        return WARRIOR_FURY;
      else if ( str_compare_ci( spec_str, "protection" ) )
        return WARRIOR_PROTECTION;
      else if ( str_compare_ci( spec_str, "prot" ) )
        return WARRIOR_PROTECTION;
      else if ( str_compare_ci( spec_str, "tank" ) )
        return WARRIOR_PROTECTION;
      break;
    }
    default: break;
  }
  return SPEC_NONE;
}

std::string specialization_string( int spec )
{
  switch ( spec )
  {
    case WARRIOR_ARMS: return "arms";
    case WARRIOR_FURY: return "fury";
    case WARRIOR_PROTECTION: return "protection";
    case PALADIN_HOLY: return "holy";
    case PALADIN_PROTECTION: return "protection";
    case PALADIN_RETRIBUTION: return "retribution";
    case HUNTER_BEAST_MASTERY: return "beast_mastery";
    case HUNTER_MARKSMANSHIP: return "marksmanship";
    case HUNTER_SURVIVAL: return "survival";
    case ROGUE_ASSASSINATION: return "assassination";
    case ROGUE_OUTLAW: return "outlaw";
    case ROGUE_SUBTLETY: return "subtlety";
    case PRIEST_DISCIPLINE: return "discipline";
    case PRIEST_HOLY: return "holy";
    case PRIEST_SHADOW: return "shadow";
    case DEATH_KNIGHT_BLOOD: return "blood";
    case DEATH_KNIGHT_FROST: return "frost";
    case DEATH_KNIGHT_UNHOLY: return "unholy";
    case SHAMAN_ELEMENTAL: return "elemental";
    case SHAMAN_ENHANCEMENT: return "enhancement";
    case SHAMAN_RESTORATION: return "restoration";
    case MAGE_ARCANE: return "arcane";
    case MAGE_FIRE: return "fire";
    case MAGE_FROST: return "frost";
    case WARLOCK_AFFLICTION: return "affliction";
    case WARLOCK_DEMONOLOGY: return "demonology";
    case WARLOCK_DESTRUCTION: return "destruction";
    case MONK_BREWMASTER: return "brewmaster";
    case MONK_MISTWEAVER: return "mistweaver";
    case MONK_WINDWALKER: return "windwalker";
    case DRUID_BALANCE: return "balance";
    case DRUID_FERAL: return "feral";
    case DRUID_GUARDIAN: return "guardian";
    case DRUID_RESTORATION: return "restoration";
    case DEMON_HUNTER_HAVOC: return "havoc";
    case DEMON_HUNTER_VENGEANCE: return "vengeance";
    case PET_FEROCITY: return "ferocity";
    case PET_TENACITY: return "tenacity";
    case PET_CUNNING: return "cunning";
    default: return "unknown";
  }
}

const unsigned NUM_SPELL_FLAGS = 12;
const unsigned NUM_CLASS_FAMILY_FLAGS = 4;
namespace hotfix {
struct client_hotfix_entry_t {
  unsigned _id;
  unsigned _id_power;
  unsigned _index;
  unsigned _id_spell;
  double   _value;
  unsigned _hotfix;
  const client_hotfix_entry_t* _hotfix_entry;
};
}
struct spell_data_t {
  const char* _name;
  unsigned    _id;
  uint64_t    _hotfix;
  double      _prj_speed;
  unsigned    _school;
  unsigned    _class_mask;
  uint64_t    _race_mask;
  int         _scaling_type;
  int         _max_scaling_level;
  unsigned    _spell_level;
  unsigned    _max_level;
  double      _min_range;
  double      _max_range;
  unsigned    _cooldown;
  unsigned    _gcd;
  unsigned    _category_cooldown;
  unsigned    _charges;
  unsigned    _charge_cooldown;
  unsigned    _category;
  double      _duration;
  unsigned    _max_stack;
  unsigned    _proc_chance;
  int         _proc_charges;
  unsigned    _proc_flags;
  unsigned    _internal_cooldown;
  double      _rppm;
  unsigned    _equipped_class;
  unsigned    _equipped_invtype_mask;
  unsigned    _equipped_subclass_mask;
  int         _cast_min;
  int         _cast_max;
  int         _cast_div;
  double      _c_scaling;
  unsigned    _c_scaling_level;
  unsigned    _replace_spell_id;
  unsigned    _attributes[NUM_SPELL_FLAGS];
  unsigned    _class_flags[NUM_CLASS_FAMILY_FLAGS];
  unsigned    _class_flags_family;
  unsigned    _stance_mask;
  unsigned    _mechanic;
  unsigned    _power_id;
  const char* _desc;
  const char* _tooltip;
  const char* _desc_vars;
  const char* _rank_str;
  void* _effects;
  void*  _power;
  void* _driver;
  void* _labels;
  const client_hotfix_entry_t* _hotfix_entry;
};
struct spelleffect_data_t {
  unsigned         _id;
  unsigned         _hotfix;
  unsigned         _spell_id;
  unsigned         _index;
  unsigned         _type;
  unsigned         _subtype;
  double           _m_avg;
  double           _m_delta;
  double           _m_unk;
  double           _sp_coeff;
  double           _ap_coeff;
  double           _amplitude;
  double           _radius;
  double           _radius_max;
  double           _base_value;
  int              _misc_value;
  int              _misc_value_2;
  unsigned         _class_flags[NUM_CLASS_FAMILY_FLAGS];
  unsigned         _trigger_spell_id;
  double           _m_chain;
  double           _pp_combo_points;
  double           _real_ppl;
  unsigned         _mechanic;
  int              _chain_target;
  unsigned         _targeting_1;
  unsigned         _targeting_2;
  double           _m_value;
  spell_data_t* _spell;
  spell_data_t* _trigger_spell;
  const client_hotfix_entry_t* _hotfix_entry;
};
struct spellpower_data_t {
  unsigned _id;
  unsigned _spell_id;
  unsigned _aura_id;
  unsigned _hotfix;
  int      _power_type;
  int      _cost;
  int      _cost_max;
  int      _cost_per_tick;
  double   _pct_cost;
  double   _pct_cost_max;
  double   _pct_cost_per_tick;
  const client_hotfix_entry_t* _hotfix_entry;
};
struct spelllabel_data_t {
  unsigned _id;
  unsigned _id_spell;
  short    _label;
};
#define SET_BONUS_ITEM_ID_MAX ( 10 )
struct item_set_bonus_t {
  const char* set_name;
  const char* set_opt_name;
  unsigned    enum_id;
  unsigned    set_id;
  unsigned    tier;
  unsigned    bonus;
  int         class_id;
  int         spec;
  unsigned    spell_id;
  unsigned    item_ids[SET_BONUS_ITEM_ID_MAX];
};
struct rppm_modifier_t {
  unsigned         spell_id;
  unsigned         type;
  unsigned         modifier_type;
  double           coefficient;
};
struct artifact_t {
  unsigned id;
  unsigned id_spec;
};
struct artifact_power_data_t {
  unsigned    id;
  unsigned    id_artifact;
  unsigned    power_type;
  unsigned    power_index;
  unsigned    max_rank;
  unsigned    power_spell_id;
  const char* name;
};
struct artifact_power_rank_t {
  unsigned _id;
  unsigned _id_power;
  unsigned _index;
  unsigned _id_spell;
  double   _value;
  unsigned _hotfix;
  const client_hotfix_entry_t* _hotfix_entry;
};
struct talent_data_t {
  const char * _name;
  unsigned     _id;
  unsigned     _flags;
  unsigned     _m_class;
  unsigned     _spec;
  unsigned     _col;
  unsigned     _row;
  unsigned     _spell_id;
  unsigned     _replace_id;
  const spell_data_t* spell1;
};
#define MAX_ITEM_STAT 10
#define MAX_ITEM_EFFECT 5
struct item_data_t {
  unsigned id;
  const char* name;
  unsigned flags_1;
  unsigned flags_2;
  unsigned type_flags;
  int      level;
  int      req_level;
  int      req_skill;
  int      req_skill_level;
  int      quality;
  int      inventory_type;
  int      item_class;
  int      item_subclass;
  int      bind_type;
  double   delay;
  double   dmg_range;
  double   item_modifier;
  uint64_t race_mask;
  unsigned class_mask;
  int      stat_type_e[MAX_ITEM_STAT];
  int      stat_alloc[MAX_ITEM_STAT];
  double   stat_socket_mul[MAX_ITEM_STAT];
  int      trigger_spell[MAX_ITEM_EFFECT];
  int      id_spell[MAX_ITEM_EFFECT];
  int      cooldown_duration[MAX_ITEM_EFFECT];
  int      cooldown_group[MAX_ITEM_EFFECT];
  int      cooldown_group_duration[MAX_ITEM_EFFECT];
  int      socket_color[3];
  int      gem_properties;
  int      id_socket_bonus;
  int      id_set;
  int      id_suffix_group;
  int      id_scaling_distribution;
  unsigned id_artifact;
};
struct item_name_description_t {
  unsigned id;
  const char* description;
};
struct item_child_equipment_t {
  unsigned id;
  unsigned id_item;
  unsigned id_child;
};
struct item_scale_data_t {
  unsigned ilevel;
  double   values[7];
};
struct item_upgrade_t {
  unsigned id;
  unsigned upgrade_group;
  unsigned previous_upgrade_id;
  unsigned ilevel_delta;
};
struct item_upgrade_rule_t {
  unsigned id;
  unsigned upgrade_id;
  unsigned item_id;
};
struct item_armor_type_data_t {
  unsigned ilevel;
  double   armor_type[4];
};
struct item_bonus_tree_entry_t {
  unsigned id;
  int      tree_id;
  unsigned index;
  unsigned child_id;
  unsigned bonus_id;
};
struct item_bonus_node_entry_t {
  unsigned id;
  unsigned item_id;
  unsigned tree_id;
};
struct item_bonus_entry_t {
  unsigned id;
  unsigned bonus_id;
  unsigned type;
  int      value_1;
  int      value_2;
  unsigned index;
};
struct scaling_stat_distribution_t {
  unsigned id;
  unsigned min_level;
  unsigned max_level;
  unsigned curve_id;
};
struct item_enchantment_data_t {
  unsigned    id;
  int         slot;
  unsigned    id_gem;
  int         id_scaling;
  unsigned    min_scaling_level;
  unsigned    max_scaling_level;
  unsigned    req_skill;
  unsigned    req_skill_value;
  unsigned    ench_type[3];
  int         ench_amount[3];
  unsigned    ench_prop[3];
  double      ench_coeff[3];
  unsigned    id_spell;
  const char* name;
};
struct gem_property_data_t {
  unsigned id;
  unsigned enchant_id;
  unsigned color;
  unsigned min_ilevel;
};
struct curve_point_t {
  unsigned curve_id;
  unsigned index;
  double   val1;
  double   val2;
};
struct random_prop_data_t {
  unsigned ilevel;
  double   p_epic[5];
  double   p_rare[5];
  double   p_uncommon[5];
};
struct random_suffix_data_t {
  unsigned    id;
  const char* suffix;
  unsigned    enchant_id[5];
  unsigned    enchant_alloc[5];
};
