#pragma once

#include <string>

#include "sc_enums.hpp"
#include "dbc/specialization.hpp"

extern const char* tj_get_class_name(player_e pt);
extern const char* tj_get_race_name(unsigned raceID);
extern const char* tj_get_target(unsigned targetType);
extern const char* tj_get_resource(int resourceID);
extern const char* tj_get_attribute(unsigned attributeID);
extern const char* tj_get_property_type(unsigned propertyType);
extern const char* tj_get_effect_type(unsigned effectType);
extern const char* tj_get_subeffect_type(unsigned subeffectType);
extern const char* tj_get_mechanic_type(unsigned mechanicType);

namespace tj
{
    namespace detail
    {
        const player_e all_classes[] = {
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

        player_e class_from_spec(specialization_e spec)
        {
            const talent_data_t* talent = talent_data_t::list();
            do
            {
                if(talent->specialization() == spec)
                {
                    for(player_e p = PLAYER_NONE; p < PLAYER_MAX; ++p)
                        if(talent->is_class(p))
                            return p;
                }
                ++talent;
            } while(talent && talent->id() > 0);
            return PLAYER_NONE;
        }

        specialization_e specialization_from_class_spec(player_e playerClass, int specIndex)
        {
            for(const auto& s : specdata::__specs)
            {
                if(class_from_spec(s) == playerClass)
                {
                    if(specdata::__idx_specs[s] == specIndex - 1)
                        return s;
                }
            }

            return SPEC_NONE;
        }

        const std::set<unsigned>& all_class_spells(sim_t* sim, player_e playerClass)
        {
            static std::unordered_map<player_e, std::set<unsigned>> allClassSpells;
            static std::mutex mtx;
            std::unique_lock<std::mutex> lock{mtx};

            auto it = allClassSpells.find(playerClass);
            if(it != allClassSpells.end())
                return it->second;

            auto& classSpells = allClassSpells[playerClass];
            auto spell_query
              = std::unique_ptr<spell_data_expr_t>(spell_data_expr_t::parse(sim, fmt::format("spell.class={:s}", util::player_type_string(playerClass))));
            spell_query->evaluate();

            for(auto&& spellID : spell_query->result_spell_list)
                classSpells.insert(spellID);

            while(true)
            {
                bool found = false;
                std::set<uint32_t> requiredCopy(classSpells.begin(), classSpells.end());
                for(auto&& spellID : requiredCopy)
                {
                    const auto spell = dbc::find_spell(sim, spellID);
                    if(spell->effect_count() > 0)
                    {
                        for(size_t i = 1; i <= spell->effect_count(); ++i)
                        {
                            const auto& effect = spell->effectN(i);

                            if(effect.spell_id() > 0 && classSpells.find(effect.spell_id()) == classSpells.end())
                            {
                                found = true;
                                classSpells.insert(effect.spell_id());
                            }

                            if(effect.trigger_spell_id() > 0 && classSpells.find(effect.trigger_spell_id()) == classSpells.end())
                            {
                                found = true;
                                classSpells.insert(effect.trigger_spell_id());
                            }

                            auto affected_spells = sim->dbc.effect_affects_spells(spell->class_family(), &effect);
                            for(auto&& as : affected_spells)
                            {
                                if(as->id() > 0 && classSpells.find(as->id()) == classSpells.end())
                                {
                                    found = true;
                                    classSpells.insert(as->id());
                                }
                            }

                            auto affecting_effects = sim->dbc.effects_affecting_spell(spell);
                            for(auto&& ae : affecting_effects)
                            {
                                if(ae->id() > 0 && ae->spell_id() > 0 && classSpells.find(ae->spell_id()) == classSpells.end())
                                {
                                    found = true;
                                    classSpells.insert(ae->spell_id());
                                }
                            }
                        }
                    }
                }

                if(!found)
                    break;
            }

            return classSpells;
        }

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
    } // namespace detail

    struct class_info
    {
        player_e Class{PLAYER_NONE};
        int ClassId{-1};
        std::string ClassName{};
        std::string FullClassName{};
        std::set<unsigned> Abilities{};
        std::set<unsigned> AllClassSpells{};

        class_info(sim_t* sim, player_e playerClass)
        {
            Class = playerClass;

            if(playerClass != PLAYER_NONE)
            {
                ClassId = util::class_id(Class);
                ClassName = util::player_type_string(Class);
                FullClassName = tj_get_class_name(playerClass);

                AllClassSpells = detail::all_class_spells(sim, playerClass);

                for(size_t idx = 0, ability = 0; (ability = sim->dbc.class_ability(ClassId, 0, idx)); ++idx)
                    Abilities.insert(ability);
            }
        }

        explicit operator bool() const { return Class != PLAYER_NONE; }

        static std::string to_string(const class_info& spec) { return fmt::format("{:s} (classID={:d})", spec.ClassName, spec.ClassId); }
    };

    struct spec_info : class_info
    {
        specialization_e Spec{SPEC_NONE};
        std::string SpecName{};
        std::string FullSpecName{};
        int SpecId{-1};
        int SpecIndex{-1};

        spec_info(sim_t* sim, specialization_e spec) : class_info(sim, detail::class_from_spec(spec)) { assign(sim, spec); }

        spec_info(sim_t* sim, player_e playerClass, int specIndex) : class_info(sim, playerClass)
        {
            auto spec = detail::specialization_from_class_spec(playerClass, specIndex);
            assign(sim, spec);
        }

        void assign(sim_t* sim, specialization_e spec)
        {
            Spec = spec;
            if(spec != SPEC_NONE)
            {
                SpecName = dbc::specialization_string(spec);
                FullSpecName = util::specialization_string(spec);
                SpecId = static_cast<int>(spec);
                SpecIndex = specdata::spec_idx(spec) + 1; // +1 to match in-game GetSpecialization()

                for(size_t idx = 0, ability = 0; (ability = sim->dbc.class_ability(ClassId, SpecIndex, idx)); ++idx)
                    Abilities.insert(ability);
            }
        }

        explicit operator bool() const { return Spec != SPEC_NONE; }

        static std::string to_string(const spec_info& spec)
        {
            return fmt::format("{:s} {:s} (classID={:d} specID={:d} specIndex={:d})", spec.SpecName, spec.ClassName, spec.ClassId, spec.SpecId, spec.SpecIndex);
        }
    };

    struct spell_info
    {
        unsigned SpellID{0};
        const spell_data_t* Spell{nullptr};
        std::string SpellName{};
        std::string SpellSlug{};

        spell_info(sim_t* sim, unsigned spellID)
        {
            const auto* spell = dbc::find_spell(sim, spellID);
            if(!spell)
                return;

            SpellID = spellID;
            Spell = spell;
            SpellName = spell->name_cstr();
            SpellSlug = detail::make_slug(SpellName);
        }

        explicit operator bool() const { return Spell != nullptr && Spell->ok(); }
    };

} // namespace tj