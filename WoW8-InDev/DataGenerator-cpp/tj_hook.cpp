#include "simulationcraft.hpp"

#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

#include <cstring>
#include <vector>
#include <set>
#include "dbc/sc_spell_info.hpp"

#include "wow_version_def.h"
#include "tj_classinfo.hpp"

#define LEVEL_FOR_GENERATING_DATA 120

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
      //      DEATH_KNIGHT,
      //      DEMON_HUNTER,
      //      DRUID,
      //      HUNTER,
      MAGE,
      //      MONK,
      //      PALADIN,
      //      PRIEST,
      //      ROGUE,
      //      SHAMAN,
      //      WARLOCK,
      //      WARRIOR,
    };
    // copied from simc\engine\dbc\generated\sc_specialization_data.inc
    const specialization_e specs_to_output[]
      = {WARRIOR_ARMS,         WARRIOR_FURY,        WARRIOR_PROTECTION,  PALADIN_HOLY,        PALADIN_PROTECTION, PALADIN_RETRIBUTION,
         HUNTER_BEAST_MASTERY, HUNTER_MARKSMANSHIP, HUNTER_SURVIVAL,     ROGUE_ASSASSINATION, ROGUE_OUTLAW,       ROGUE_SUBTLETY,
         PRIEST_DISCIPLINE,    PRIEST_HOLY,         PRIEST_SHADOW,       DEATH_KNIGHT_BLOOD,  DEATH_KNIGHT_FROST, DEATH_KNIGHT_UNHOLY,
         SHAMAN_ELEMENTAL,     SHAMAN_ENHANCEMENT,  SHAMAN_RESTORATION,  MAGE_ARCANE,         MAGE_FIRE,          MAGE_FROST,
         WARLOCK_AFFLICTION,   WARLOCK_DEMONOLOGY,  WARLOCK_DESTRUCTION, MONK_BREWMASTER,     MONK_MISTWEAVER,    MONK_WINDWALKER,
         DRUID_BALANCE,        DRUID_FERAL,         DRUID_GUARDIAN,      DRUID_RESTORATION,   DEMON_HUNTER_HAVOC, DEMON_HUNTER_VENGEANCE};

    static std::ostream& dump_spell(sim_t* sim, const std::string& divider, std::ostream& os, uint32_t spellID)
    {
        auto spellinfo = tj::spell_info(sim, spellID);
        auto spell = spellinfo.Spell;
        if(spell)
        {
            if(!spell->ok())
                return os;

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
                              std::quoted(tj::detail::make_slug(spell->name_cstr())));

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

            if(spell->cast_time(LEVEL_FOR_GENERATING_DATA) > timespan_t::zero())
                os << fmt::format("  cast_time = {:.2f},\n", spell->cast_time(LEVEL_FOR_GENERATING_DATA).total_seconds());

            if(spell->cooldown() > timespan_t::zero())
                os << fmt::format("  cooldown = {:.1f},\n", spell->cooldown().total_seconds());

            if(spell->duration() > timespan_t::zero())
                os << fmt::format("  duration = {:.1f},\n", spell->duration().total_seconds());

            if(spell->internal_cooldown() > timespan_t::zero())
                os << fmt::format("  internal_cooldown = {:.1f},\n", spell->internal_cooldown().total_seconds());

            if(tj::detail::has_attribute(spell, tj::detail::attribute_channeled_1) || tj::detail::has_attribute(spell, tj::detail::attribute_channeled_2))
                os << fmt::format("  channeled = true,\n");

            if(tj::detail::has_attribute(spell, tj::detail::attribute_periodic_affected_by_haste))
                os << fmt::format("  haste_affected_ticks = true,\n");

            if(spell->power_count() > 0)
            {
                os << fmt::format("  power = {{\n");

                for(size_t i = 1; i <= spell->power_count(); ++i)
                {
                    auto power = spell->powerN(i);
                    const auto resourceType = power.resource();
                    const auto amount = power._cost ? power.cost() : 0;
                    const auto amountMax = power._cost ? power.max_cost() : 0;
                    const auto amountPerTick = power._cost ? power.cost_per_tick() : 0;
                    const auto pct = !power._cost ? power.cost() : 0;
                    const auto pctMax = !power._cost ? power.max_cost() : 0;
                    const auto pctPerTick = !power._cost ? power.cost_per_tick() : 0;
                    const auto powerAura = power.aura_id();
                    os << fmt::format("    [{:d}] = {{ resource = {:s}, ", i, std::quoted(util::resource_type_string(resourceType)));
                    if(amount != 0)
                        os << fmt::format("amount = {:d}, ", static_cast<int>(amount));
                    if(amountMax != 0)
                        os << fmt::format("amount_max = {:d}, ", static_cast<int>(amountMax));
                    if(amountPerTick != 0)
                        os << fmt::format("amount_per_tick = {:d}, ", static_cast<int>(amountPerTick));
                    if(pct != 0)
                        os << fmt::format("percent = {:.2f}, ", 100 * pct);
                    if(pctMax != 0)
                        os << fmt::format("percent_max = {:.2f}, ", 100 * pctMax);
                    if(pctPerTick != 0)
                        os << fmt::format("percent_per_tick = {:.2f}, ", 100 * pctPerTick);
                    if(powerAura > 0)
                        os << fmt::format("aura = {:d}, ", static_cast<int>(powerAura));
                    os << fmt::format("}},\n");
                }

                os << fmt::format("  }},\n");
            }

#ifdef _DEBUG
            std::set<unsigned> affecting;
            auto affecting_effects = sim->dbc.effects_affecting_spell(spell);
            for(auto&& ae : affecting_effects)
                if(ae->id() > 0 && ae->spell_id() > 0)
                    affecting.insert(ae->spell_id());

            if(affecting.size() > 0)
            {
                os << fmt::format("  affected_by_spells = {{");
                for(const auto& a : affecting)
                    os << fmt::format(" {:d}, ", a);
                os << fmt::format("}},\n");
            }

            if(spell->effect_count() > 0)
            {
                os << fmt::format("  spell_effects = {{\n");
                os << fmt::format("    --{:>4s},  {:>8s}, {:>8s}, {:>5s}, {:>7s}, {:>16s}, {:>7s}, {:>7s}, {:>9s}, {:>6s}, {:>6s}\n",
                                  "idx",
                                  "effectid",
                                  "trigsp",
                                  "type",
                                  "subtype",
                                  "base",
                                  "misc1",
                                  "misc2",
                                  "period",
                                  "rad",
                                  "maxrad");

                for(size_t i = 1; i <= spell->effect_count(); ++i)
                {
                    const auto& e = spell->effectN(i);
                    //                    if(e.id() == 0)
                    //                        continue;

                    std::string targets = "target =  { ";
                    if(e.target_1())
                        targets += fmt::format("'{:s}', ", tj_get_target(e.target_1()));
                    if(e.target_2())
                        targets += fmt::format("'{:s}', ", tj_get_target(e.target_2()));
                    targets += "}";

                    os
                      << fmt::format("    [{:2d}] = {{ {:8d}, {:8d}, {:5d}, {:7d}, {:16.3f}, {:7d}, {:7d}, {:9.3f}, {:6.1f}, {:6.1f} }}, -- {:s} {:s} - {:s}\n",
                                     i,
                                     e.id(),
                                     e.trigger_spell_id(),
                                     e.type(),
                                     e.subtype(),
                                     e.base_value(),
                                     e.misc_value1(),
                                     e.misc_value2(),
                                     e.period().total_seconds(),
                                     e.radius(),
                                     e.radius_max(),
                                     tj_get_effect_type(e.type()),
                                     tj_get_subeffect_type(e.subtype()),
                                     (e.target_1() || e.target_2()) ? targets : std::string{});

                    std::set<unsigned> affected;
                    auto affected_spells = sim->dbc.effect_affects_spells(spell->class_family(), &e);
                    for(auto&& as : affected_spells)
                        if(as->id() > 0)
                            affected.insert(as->id());

                    if(affected.size() > 0)
                    {
                        os << fmt::format("    -- Applies effect to spells:");
                        for(const auto& a : affected)
                            os << fmt::format(" {:d}, ", a);
                        os << fmt::format("\n");
                    }
                }
                os << fmt::format("  }},\n");
            }
#endif

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
            const tj::class_info info(sim, playerClass);
            if(!info)
                continue;

            fmt::print("Generating generated-{:s}.lua\n", info.ClassName);
            std::ofstream f(fmt::format("generated-{:s}.lua", info.ClassName));

            const auto divider = std::string(160, '-');
            const auto header = fmt::format(R"({:s}
-- Generated from data for WoW {:s}
{:s}
-- Class check
if select(3, UnitClass('player')) ~= {:d} then return end
{:s}
local _, TJ = ...
{:s}
-- Version check
if not TJ:MatchesBuild('{:s}', '{:s}') then return end
{:s}
TJ.ClassData = TJ.ClassData or {{}}
TJ.ClassData[{:d}] = TJ.ClassData[{:d}] or {{}}
local classData = TJ.ClassData[{:d}]
classData.abilities = classData.abilities or {{}}
classData.spells = classData.spells or {{}}

)",
                                            divider,
                                            WOW_BUILD_VERSION,
                                            divider,
                                            info.ClassId,
                                            divider,
                                            divider,
                                            WOW_BASE_VERSION,
                                            WOW_BASE_VERSION,
                                            divider,
                                            info.ClassId,
                                            info.ClassId,
                                            info.ClassId);
            f << header;

            for(unsigned i = 1; i <= sim->dbc.specialization_max_per_class(); ++i)
            {
                const tj::spec_info spec(sim, playerClass, i);
                if(spec.Spec == SPEC_NONE)
                    continue;

                f << fmt::format("{:s}\n-- Abilities: {:s}\n", divider, spec.FullSpecName);
                f << fmt::format("classData.abilities[{:d}] = {{\n", spec.SpecId);
                for(const auto& a : spec.Abilities)
                {
                    const tj::spell_info s(sim, a);
                    f << fmt::format("  {:7d}, -- {:s} / {:s}\n", a, s.SpellSlug, s.SpellName);
                }
                f << fmt::format("}}\n\n");
            }

            for(auto&& spellID : info.AllClassSpells)
                dump_spell(sim, divider, f, spellID);
        }
    }
    catch(const std::exception& e)
    {
        std::cerr << e.what() << std::endl;
    }

    return 0;
}
