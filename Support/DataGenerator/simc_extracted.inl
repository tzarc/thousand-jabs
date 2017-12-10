bool pred_ci(char a, char b)
{
    return std::tolower(a) == std::tolower(b);
}

bool util::str_compare_ci(const std::string& l, const std::string& r)
{
    if(l.size() != r.size())
        return false;

    return std::equal(l.begin(), l.end(), r.begin(), pred_ci);
}

struct spec_map_t
{
    specialization_e spec;
    const char* name;
};

const spec_map_t spec_map[] = {
  {WARRIOR_ARMS, "Arms Warrior"},
  {WARRIOR_FURY, "Fury Warrior"},
  {WARRIOR_PROTECTION, "Protection Warrior"},
  {PALADIN_HOLY, "Holy Paladin"},
  {PALADIN_PROTECTION, "Protection Paladin"},
  {PALADIN_RETRIBUTION, "Retribution Paladin"},
  {HUNTER_BEAST_MASTERY, "Beast Mastery Hunter"},
  {HUNTER_BEAST_MASTERY, "Beast-Mastery Hunter"}, // Alternate
  {HUNTER_MARKSMANSHIP, "Marksmanship Hunter"},
  {HUNTER_SURVIVAL, "Survival Hunter"},
  {ROGUE_ASSASSINATION, "Assassination Rogue"},
  {ROGUE_OUTLAW, "Outlaw Rogue"},
  {ROGUE_SUBTLETY, "Subtlety Rogue"},
  {PRIEST_DISCIPLINE, "Discipline Priest"},
  {PRIEST_HOLY, "Holy Priest"},
  {PRIEST_SHADOW, "Shadow Priest"},
  {DEATH_KNIGHT_BLOOD, "Blood Death Knight"},   // Default
  {DEATH_KNIGHT_BLOOD, "Blood DeathKnight"},    // Alternate (battle.net match)
  {DEATH_KNIGHT_FROST, "Frost Death Knight"},   // Default
  {DEATH_KNIGHT_FROST, "Frost DeathKnight"},    // Alternate (battle.net match)
  {DEATH_KNIGHT_UNHOLY, "Unholy Death Knight"}, // Default
  {DEATH_KNIGHT_UNHOLY, "Unholy DeathKnight"},  // Alternate (battle.net match)
  {SHAMAN_ELEMENTAL, "Elemental Shaman"},
  {SHAMAN_ENHANCEMENT, "Enhancement Shaman"},
  {SHAMAN_RESTORATION, "Restoration Shaman"},
  {MAGE_ARCANE, "Arcane Mage"},
  {MAGE_FIRE, "Fire Mage"},
  {MAGE_FROST, "Frost Mage"},
  {WARLOCK_AFFLICTION, "Affliction Warlock"},
  {WARLOCK_DEMONOLOGY, "Demonology Warlock"},
  {WARLOCK_DESTRUCTION, "Destruction Warlock"},
  {MONK_BREWMASTER, "Brewmaster Monk"},
  {MONK_MISTWEAVER, "Mistweaver Monk"},
  {MONK_WINDWALKER, "Windwalker Monk"},
  {DRUID_BALANCE, "Balance Druid"},
  {DRUID_FERAL, "Feral Druid"},
  {DRUID_GUARDIAN, "Guardian Druid"},
  {DRUID_RESTORATION, "Restoration Druid"},
  {DEMON_HUNTER_HAVOC, "Havoc Demon Hunter"},
  {DEMON_HUNTER_HAVOC, "Havoc DemonHunter"},
  {DEMON_HUNTER_VENGEANCE, "Vengeance Demon Hunter"},
  {DEMON_HUNTER_VENGEANCE, "Vengeance DemonHunter"},
};

const struct
{
    const char* name;
    player_e pt;
} _class_map[] = {
  {nullptr, PLAYER_NONE},
  {"Warrior", WARRIOR},
  {"Paladin", PALADIN},
  {"Hunter", HUNTER},
  {"Rogue", ROGUE},
  {"Priest", PRIEST},
  {"Death Knight", DEATH_KNIGHT},
  {"Shaman", SHAMAN},
  {"Mage", MAGE},
  {"Warlock", WARLOCK},
  {"Monk", MONK},
  {"Druid", DRUID},
  {"Demon Hunter", DEMON_HUNTER},
  {nullptr, PLAYER_NONE},
};

int simc_copied::translate_spec_str(int ptype, const std::string& spec_str)
{
    using namespace util;
    switch(ptype)
    {
        case DEATH_KNIGHT:
        {
            if(str_compare_ci(spec_str, "blood"))
                return DEATH_KNIGHT_BLOOD;
            if(str_compare_ci(spec_str, "tank"))
                return DEATH_KNIGHT_BLOOD;
            else if(str_compare_ci(spec_str, "frost"))
                return DEATH_KNIGHT_FROST;
            else if(str_compare_ci(spec_str, "unholy"))
                return DEATH_KNIGHT_UNHOLY;
            break;
        }
        case DEMON_HUNTER:
        {
            if(str_compare_ci(spec_str, "havoc"))
                return DEMON_HUNTER_HAVOC;
            else if(str_compare_ci(spec_str, "vengeance"))
                return DEMON_HUNTER_VENGEANCE;
            break;
        }
        case DRUID:
        {
            if(str_compare_ci(spec_str, "balance"))
                return DRUID_BALANCE;
            else if(str_compare_ci(spec_str, "caster"))
                return DRUID_BALANCE;
            else if(str_compare_ci(spec_str, "laserchicken"))
                return DRUID_BALANCE;
            else if(str_compare_ci(spec_str, "feral"))
                return DRUID_FERAL;
            else if(str_compare_ci(spec_str, "feral_combat"))
                return DRUID_FERAL;
            else if(str_compare_ci(spec_str, "cat"))
                return DRUID_FERAL;
            else if(str_compare_ci(spec_str, "melee"))
                return DRUID_FERAL;
            else if(str_compare_ci(spec_str, "guardian"))
                return DRUID_GUARDIAN;
            else if(str_compare_ci(spec_str, "bear"))
                return DRUID_GUARDIAN;
            else if(str_compare_ci(spec_str, "tank"))
                return DRUID_GUARDIAN;
            else if(str_compare_ci(spec_str, "restoration"))
                return DRUID_RESTORATION;
            else if(str_compare_ci(spec_str, "resto"))
                return DRUID_RESTORATION;
            else if(str_compare_ci(spec_str, "healer"))
                return DRUID_RESTORATION;
            else if(str_compare_ci(spec_str, "tree"))
                return DRUID_RESTORATION;

            break;
        }
        case HUNTER:
        {
            if(str_compare_ci(spec_str, "beast_mastery"))
                return HUNTER_BEAST_MASTERY;
            if(str_compare_ci(spec_str, "bm"))
                return HUNTER_BEAST_MASTERY;
            else if(str_compare_ci(spec_str, "marksmanship"))
                return HUNTER_MARKSMANSHIP;
            else if(str_compare_ci(spec_str, "mm"))
                return HUNTER_MARKSMANSHIP;
            else if(str_compare_ci(spec_str, "survival"))
                return HUNTER_SURVIVAL;
            else if(str_compare_ci(spec_str, "sv"))
                return HUNTER_SURVIVAL;
            break;
        }
        case MAGE:
        {
            if(str_compare_ci(spec_str, "arcane"))
                return MAGE_ARCANE;
            else if(str_compare_ci(spec_str, "fire"))
                return MAGE_FIRE;
            else if(str_compare_ci(spec_str, "frost"))
                return MAGE_FROST;
            break;
        }
        case MONK:
        {
            if(str_compare_ci(spec_str, "brewmaster"))
                return MONK_BREWMASTER;
            else if(str_compare_ci(spec_str, "brm"))
                return MONK_BREWMASTER;
            else if(str_compare_ci(spec_str, "tank"))
                return MONK_BREWMASTER;
            else if(str_compare_ci(spec_str, "mistweaver"))
                return MONK_MISTWEAVER;
            else if(str_compare_ci(spec_str, "mw"))
                return MONK_MISTWEAVER;
            else if(str_compare_ci(spec_str, "healer"))
                return MONK_MISTWEAVER;
            else if(str_compare_ci(spec_str, "windwalker"))
                return MONK_WINDWALKER;
            else if(str_compare_ci(spec_str, "ww"))
                return MONK_WINDWALKER;
            else if(str_compare_ci(spec_str, "dps"))
                return MONK_WINDWALKER;
            else if(str_compare_ci(spec_str, "melee"))
                return MONK_WINDWALKER;
            break;
        }
        case PALADIN:
        {
            if(str_compare_ci(spec_str, "holy"))
                return PALADIN_HOLY;
            if(str_compare_ci(spec_str, "healer"))
                return PALADIN_HOLY;
            else if(str_compare_ci(spec_str, "protection"))
                return PALADIN_PROTECTION;
            else if(str_compare_ci(spec_str, "prot"))
                return PALADIN_PROTECTION;
            else if(str_compare_ci(spec_str, "tank"))
                return PALADIN_PROTECTION;
            else if(str_compare_ci(spec_str, "retribution"))
                return PALADIN_RETRIBUTION;
            else if(str_compare_ci(spec_str, "ret"))
                return PALADIN_RETRIBUTION;
            else if(str_compare_ci(spec_str, "dps"))
                return PALADIN_RETRIBUTION;
            else if(str_compare_ci(spec_str, "melee"))
                return PALADIN_RETRIBUTION;
            break;
        }
        case PRIEST:
        {
            if(str_compare_ci(spec_str, "discipline"))
                return PRIEST_DISCIPLINE;
            if(str_compare_ci(spec_str, "disc"))
                return PRIEST_DISCIPLINE;
            else if(str_compare_ci(spec_str, "holy"))
                return PRIEST_HOLY;
            else if(str_compare_ci(spec_str, "shadow"))
                return PRIEST_SHADOW;
            else if(str_compare_ci(spec_str, "caster"))
                return PRIEST_SHADOW;
            break;
        }
        case ROGUE:
        {
            if(str_compare_ci(spec_str, "assassination"))
                return ROGUE_ASSASSINATION;
            else if(str_compare_ci(spec_str, "ass"))
                return ROGUE_ASSASSINATION;
            else if(str_compare_ci(spec_str, "mut"))
                return ROGUE_ASSASSINATION;
            else if(str_compare_ci(spec_str, "outlaw"))
                return ROGUE_OUTLAW;
            else if(str_compare_ci(spec_str, "pirate"))
                return ROGUE_OUTLAW;
            else if(str_compare_ci(spec_str, "swashbuckler"))
                return ROGUE_OUTLAW;
            else if(str_compare_ci(spec_str, "subtlety"))
                return ROGUE_SUBTLETY;
            else if(str_compare_ci(spec_str, "sub"))
                return ROGUE_SUBTLETY;
            break;
        }
        case SHAMAN:
        {
            if(str_compare_ci(spec_str, "elemental"))
                return SHAMAN_ELEMENTAL;
            if(str_compare_ci(spec_str, "ele"))
                return SHAMAN_ELEMENTAL;
            if(str_compare_ci(spec_str, "caster"))
                return SHAMAN_ELEMENTAL;
            else if(str_compare_ci(spec_str, "enhancement"))
                return SHAMAN_ENHANCEMENT;
            else if(str_compare_ci(spec_str, "enh"))
                return SHAMAN_ENHANCEMENT;
            else if(str_compare_ci(spec_str, "melee"))
                return SHAMAN_ENHANCEMENT;
            else if(str_compare_ci(spec_str, "restoration"))
                return SHAMAN_RESTORATION;
            else if(str_compare_ci(spec_str, "resto"))
                return SHAMAN_RESTORATION;
            else if(str_compare_ci(spec_str, "healer"))
                return SHAMAN_RESTORATION;
            break;
        }
        case WARLOCK:
        {
            if(str_compare_ci(spec_str, "affliction"))
                return WARLOCK_AFFLICTION;
            if(str_compare_ci(spec_str, "affl"))
                return WARLOCK_AFFLICTION;
            if(str_compare_ci(spec_str, "aff"))
                return WARLOCK_AFFLICTION;
            else if(str_compare_ci(spec_str, "demonology"))
                return WARLOCK_DEMONOLOGY;
            else if(str_compare_ci(spec_str, "demo"))
                return WARLOCK_DEMONOLOGY;
            else if(str_compare_ci(spec_str, "destruction"))
                return WARLOCK_DESTRUCTION;
            else if(str_compare_ci(spec_str, "destro"))
                return WARLOCK_DESTRUCTION;
            break;
        }
        case WARRIOR:
        {
            if(str_compare_ci(spec_str, "arms"))
                return WARRIOR_ARMS;
            else if(str_compare_ci(spec_str, "fury"))
                return WARRIOR_FURY;
            else if(str_compare_ci(spec_str, "protection"))
                return WARRIOR_PROTECTION;
            else if(str_compare_ci(spec_str, "prot"))
                return WARRIOR_PROTECTION;
            else if(str_compare_ci(spec_str, "tank"))
                return WARRIOR_PROTECTION;
            break;
        }
        default:
            break;
    }
    return SPEC_NONE;
}

std::string simc_copied::specialization_string(int spec)
{
    switch(spec)
    {
        case WARRIOR_ARMS:
            return "arms";
        case WARRIOR_FURY:
            return "fury";
        case WARRIOR_PROTECTION:
            return "protection";
        case PALADIN_HOLY:
            return "holy";
        case PALADIN_PROTECTION:
            return "protection";
        case PALADIN_RETRIBUTION:
            return "retribution";
        case HUNTER_BEAST_MASTERY:
            return "beast_mastery";
        case HUNTER_MARKSMANSHIP:
            return "marksmanship";
        case HUNTER_SURVIVAL:
            return "survival";
        case ROGUE_ASSASSINATION:
            return "assassination";
        case ROGUE_OUTLAW:
            return "outlaw";
        case ROGUE_SUBTLETY:
            return "subtlety";
        case PRIEST_DISCIPLINE:
            return "discipline";
        case PRIEST_HOLY:
            return "holy";
        case PRIEST_SHADOW:
            return "shadow";
        case DEATH_KNIGHT_BLOOD:
            return "blood";
        case DEATH_KNIGHT_FROST:
            return "frost";
        case DEATH_KNIGHT_UNHOLY:
            return "unholy";
        case SHAMAN_ELEMENTAL:
            return "elemental";
        case SHAMAN_ENHANCEMENT:
            return "enhancement";
        case SHAMAN_RESTORATION:
            return "restoration";
        case MAGE_ARCANE:
            return "arcane";
        case MAGE_FIRE:
            return "fire";
        case MAGE_FROST:
            return "frost";
        case WARLOCK_AFFLICTION:
            return "affliction";
        case WARLOCK_DEMONOLOGY:
            return "demonology";
        case WARLOCK_DESTRUCTION:
            return "destruction";
        case MONK_BREWMASTER:
            return "brewmaster";
        case MONK_MISTWEAVER:
            return "mistweaver";
        case MONK_WINDWALKER:
            return "windwalker";
        case DRUID_BALANCE:
            return "balance";
        case DRUID_FERAL:
            return "feral";
        case DRUID_GUARDIAN:
            return "guardian";
        case DRUID_RESTORATION:
            return "restoration";
        case DEMON_HUNTER_HAVOC:
            return "havoc";
        case DEMON_HUNTER_VENGEANCE:
            return "vengeance";
        case PET_FEROCITY:
            return "ferocity";
        case PET_TENACITY:
            return "tenacity";
        case PET_CUNNING:
            return "cunning";
        default:
            return "unknown";
    }
}
