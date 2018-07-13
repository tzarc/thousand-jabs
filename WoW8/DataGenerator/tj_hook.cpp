#include "simulationcraft.hpp"

#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

#include <cstring>
#include <vector>
#include <set>
#include "dbc/sc_spell_info.hpp"

#include "wow_version_def.h"

// Description/tooltip "parsing"
//
// $s2 => use the base value from effect #2
// $t1 => use the period from effect #1
// $w1 => spellpower coefficient from effect #1 (???, possibly school related?)
// $157736d => reference spellID 157736, take duration
// $?s108499[Abyssal][Infernal] => conditional, can't find reference to this ID?
// $a1 => radius for effect #1
// $A1 => radius for effect #1
// $@spelldesc172 => substitute the spell description for spell 172
// $146739o1 => looks like total amount of damage (multiply the spellpower coefficient by the # of ticks)

namespace
{
    const player_e classes_to_output[] = {
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
    };
    // copied from simc\engine\dbc\generated\sc_specialization_data.inc
    const specialization_e specs_to_output[]
      = {WARRIOR_ARMS,         WARRIOR_FURY,        WARRIOR_PROTECTION,  PALADIN_HOLY,        PALADIN_PROTECTION, PALADIN_RETRIBUTION,
         HUNTER_BEAST_MASTERY, HUNTER_MARKSMANSHIP, HUNTER_SURVIVAL,     ROGUE_ASSASSINATION, ROGUE_OUTLAW,       ROGUE_SUBTLETY,
         PRIEST_DISCIPLINE,    PRIEST_HOLY,         PRIEST_SHADOW,       DEATH_KNIGHT_BLOOD,  DEATH_KNIGHT_FROST, DEATH_KNIGHT_UNHOLY,
         SHAMAN_ELEMENTAL,     SHAMAN_ENHANCEMENT,  SHAMAN_RESTORATION,  MAGE_ARCANE,         MAGE_FIRE,          MAGE_FROST,
         WARLOCK_AFFLICTION,   WARLOCK_DEMONOLOGY,  WARLOCK_DESTRUCTION, MONK_BREWMASTER,     MONK_MISTWEAVER,    MONK_WINDWALKER,
         DRUID_BALANCE,        DRUID_FERAL,         DRUID_GUARDIAN,      DRUID_RESTORATION,   DEMON_HUNTER_HAVOC, DEMON_HUNTER_VENGEANCE};

    player_e class_from_spec(specialization_e spec)
    {
        const talent_data_t* talent = talent_data_t::list();
        do
        {
            if(talent->specialization() == spec)
            {
                for(auto&& c : classes_to_output)
                    if(talent->is_class(c))
                        return c;
            }
            ++talent;
        } while(talent && talent->id() > 0);
        return PLAYER_NONE;
    }

    std::string make_slug(const std::string& name)
    {
        std::string ret;
        for(const auto& c : name)
        {
            auto x = std::tolower(c);
            if(std::isalnum(x))
                ret += x;
            else if(std::isspace(x))
                ret += '_';
        }
        return ret;
    }

    struct class_info
    {
        player_e Class;

        int ClassId;

        std::string ClassName;

        class_info(player_e playerClass)
        {
            Class = playerClass;
            ClassId = util::class_id(Class);
            ClassName = util::player_type_string(Class);
        }

        static std::string to_string(const class_info& spec) { return fmt::format("{:s} (classID={:d})", spec.ClassName, spec.ClassId); }
    };

    struct spec_info : class_info
    {
        std::string SpecName;

        int SpecId;

        int SpecIndex;

        spec_info(specialization_e spec) : class_info(class_from_spec(spec))
        {
            SpecName = dbc::specialization_string(spec);
            SpecId = static_cast<int>(spec);
            SpecIndex = specdata::spec_idx(spec) + 1; // +1 to match in-game GetSpecialization()
        }

        static std::string to_string(const spec_info& spec)
        {
            return fmt::format("{:s} {:s} (classID={:d} specID={:d} specIndex={:d})", spec.SpecName, spec.ClassName, spec.ClassId, spec.SpecId, spec.SpecIndex);
        }
    };

    static bool has_attribute(const spell_data_t* spell, const unsigned attribute)
    {
        const unsigned attributeArrayIdx = attribute / 32;
        const unsigned attributeMask = 1ull << (attribute % 32);
        return spell->attribute(attributeArrayIdx) & attributeMask;
    }

    // taken from sc_spell_info.cpp, _attribute_strings
    constexpr unsigned attribute_hidden = 7;
    constexpr unsigned attribute_periodic_affected_by_haste = 173;
    constexpr unsigned attribute_channeled_1 = 34;
    constexpr unsigned attribute_channeled_2 = 38;

    static std::ostream& dump_spell(sim_t* sim, const std::string& divider, std::ostream& os, uint32_t spellID)
    {
        const auto spell = dbc::find_spell(sim, spellID);
        if(spell)
        {
            if(!spell->ok())
                return os;
                /*
                if ( has_attribute( spell, attribute_hidden ) )
                  return os;
                */
#ifdef _DEBUG
            os << '\n' << divider << "\n--[[\n" << spell_info::to_str(sim->dbc, spell, MAX_LEVEL) << "\n]]\n";
#endif
            os << fmt::format(R"(
classData.spells[{:d}] = {{
  spellID = {:d},
  name = {:s},
  slug = {:s},
)",
                              spell->id(),
                              spell->id(),
                              std::quoted(spell->name_cstr()),
                              std::quoted(make_slug(spell->name_cstr())));

            if(spell->replace_spell_id() > 0)
                os << fmt::format("  replaces_spell_id = {:d},\n", spell->replace_spell_id());

            if(spell->min_range() > 0)
                os << fmt::format("  min_range = {:d},\n", static_cast<int>(spell->min_range()));

            if(spell->max_range() > 0)
                os << fmt::format("  max_range = {:d},\n", static_cast<int>(spell->max_range()));

            if(spell->initial_stacks() > 0)
                os << fmt::format("  initial_stacks = {:d},\n", spell->initial_stacks());

            if(spell->max_stacks() > 0)
                os << fmt::format("  max_stacks = {:d},\n", spell->max_stacks());

            if(spell->charges() > 0)
                os << fmt::format("  charges = {:d},\n", spell->charges());

            if(spell->charge_cooldown() > timespan_t::zero())
                os << fmt::format("  charge_cooldown = {:.1f},\n", spell->charge_cooldown().total_seconds());

            if(spell->gcd() > timespan_t::zero())
                os << fmt::format("  gcd = {:.1f},\n", spell->gcd().total_seconds());

            if(spell->cooldown() > timespan_t::zero())
                os << fmt::format("  cooldown = {:.1f},\n", spell->cooldown().total_seconds());

            if(spell->duration() > timespan_t::zero())
                os << fmt::format("  duration = {:.1f},\n", spell->duration().total_seconds());

            if(spell->internal_cooldown() > timespan_t::zero())
                os << fmt::format("  internal_cooldown = {:.1f},\n", spell->internal_cooldown().total_seconds());

            if(has_attribute(spell, attribute_channeled_1) || has_attribute(spell, attribute_channeled_2))
                os << fmt::format("  channeled = true,\n");

            if(has_attribute(spell, attribute_periodic_affected_by_haste))
                os << fmt::format("  haste_affected_ticks = true,\n");

            if(spell->id() == 117952)
                int i = 0;

            if(spell->power_count() > 0)
            {
                os << fmt::format("  power = {{\n");

                for(size_t i = 1; i <= spell->power_count(); ++i)
                {
                    auto power = spell->powerN(i);
                    const auto resourceType = power.resource();
                    const auto amount = power.cost();
                    const auto amountMax = power.max_cost();
                    const auto amountPerTick = power.cost_per_tick();
                    const auto powerAura = power.aura_id();
                    os << fmt::format("    [{:d}] = {{ resource = {:s}, amount = {:d}, ",
                                      i,
                                      std::quoted(util::resource_type_string(resourceType)),
                                      static_cast<int>(amount));
                    if(amountMax > 0)
                        os << fmt::format("max_amount = {:d}, ", static_cast<int>(amountMax));
                    if(amountPerTick > 0)
                        os << fmt::format("per_tick = {:d}, ", static_cast<int>(amountPerTick));
                    if(powerAura > 0)
                        os << fmt::format("aura = {:d}, ", static_cast<int>(powerAura));
                    os << fmt::format("}},\n");
                }

                os << fmt::format("  }},\n");
            }

            if(spell->effect_count() > 0)
            {
                os << fmt::format("  spell_effects = {{\n");
                os << fmt::format("    --{:>4s}, {:>8s}, {:>8s}, {:>5s}, {:>7s}, {:>11s}, {:>7s}, {:>7s}, {:>4s}, {:>9s}\n",
                                  "idx",
                                  "effectid",
                                  "trigsp",
                                  "type",
                                  "subtype",
                                  "base",
                                  "misc1",
                                  "misc2",
                                  "roll",
                                  "period");

                for(size_t i = 1; i <= spell->effect_count(); ++i)
                {
                    const auto& e = spell->effectN(i);
                    os << fmt::format("    [{:d}] = {{ {:8d}, {:8d}, {:5d}, {:7d}, {:11.3f}, {:7d}, {:7d}, {:4d}, {:9.3f} }},\n",
                                      i,
                                      e.id(),
                                      e.trigger_spell_id(),
                                      e.type(),
                                      e.subtype(),
                                      e.base_value(),
                                      e.misc_value1(),
                                      e.misc_value2(),
                                      0 /*e->die_sides*/,
                                      e.period().total_seconds());
                }
                os << fmt::format("  }},\n");
            }

            os << "}\n";
        }

        return os;
    }

} // namespace

int run_tj_hook(sim_t* sim)
{
    try
    {
        for(auto&& playerClass : classes_to_output)
        {
            const class_info info{playerClass};
            fmt::print("Generating generated-{:s}.lua\n", info.ClassName);
            std::ofstream f(fmt::format("generated-{:s}.lua", info.ClassName));

            const auto divider = std::string(160, '-');
            const auto header = fmt::format(R"({:s}
-- Generated from data for WoW {:s}
{:s}
-- BfA only.
{:s}
if select(4, GetBuildInfo()) < 80000 then
    return
end
{:s}
-- Class check
{:s}
if select(3, UnitClass('player')) ~= {:d} then return end
{:s}
local addonName, TJ = ...
TJ.ClassData = TJ.ClassData or {{}}
TJ.ClassData[{:d}] = TJ.ClassData[{:d}] or {{}}
local classData = TJ.ClassData[{:d}]
classData.spells = classData.spells or {{}}
)",
                                            divider,
                                            WOW_BUILD_VERSION,
                                            divider,
                                            divider,
                                            divider,
                                            divider,
                                            info.ClassId,
                                            divider,
                                            info.ClassId,
                                            info.ClassId,
                                            info.ClassId);

            f << header;

            auto spell_query = std::unique_ptr<spell_data_expr_t>(spell_data_expr_t::parse(sim, fmt::format("spell.class={:s}", info.ClassName)));
            spell_query->evaluate();

            std::set<uint32_t> spellsRequired;

            for(auto&& spellID : spell_query->result_spell_list)
            {
                spellsRequired.insert(spellID);
            }

            // Need to loop through the returned spells and work out if any others get triggered, and include those too
            while(true)
            {
                bool found = false;
                std::set<uint32_t> requiredCopy(spellsRequired.begin(), spellsRequired.end());
                for(auto&& spellID : requiredCopy)
                {
                    const auto spell = dbc::find_spell(sim, spellID);
                    if(spell->effect_count() > 0)
                    {
                        for(size_t i = 1; i <= spell->effect_count(); ++i)
                        {
                            const auto& effect = spell->effectN(i);

                            if(effect.spell_id() > 0 && spellsRequired.find(effect.spell_id()) == spellsRequired.end())
                            {
                                found = true;
                                spellsRequired.insert(effect.spell_id());
                            }

                            if(effect.trigger_spell_id() > 0 && spellsRequired.find(effect.trigger_spell_id()) == spellsRequired.end())
                            {
                                found = true;
                                spellsRequired.insert(effect.trigger_spell_id());
                            }

                            std::vector<const spell_data_t*> affected_spells = sim->dbc.effect_affects_spells(spell->class_family(), &effect);
                            for(auto&& as : affected_spells)
                            {
                                if(as->id() > 0 && spellsRequired.find(as->id()) == spellsRequired.end())
                                {
                                    found = true;
                                    spellsRequired.insert(as->id());
                                }
                            }
                        }
                    }
                }

                if(!found)
                    break;
            }

            for(auto&& spellID : spellsRequired)
                dump_spell(sim, divider, f, spellID);
        }

        auto s = dbc::find_spell(sim, 233498);
    }
    catch(const std::exception& e)
    {
        std::cerr << e.what() << std::endl;
    }

    return 0;
}
