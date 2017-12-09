#include "dbc/data_definitions.hh"
#include "dbc/data_enums.hh"
#include "dbc/dbc.hpp"
#include "dbc/generated/sc_item_data.inc"
#include "dbc/generated/sc_item_data2.inc"
#include "dbc/generated/sc_spec_list.inc"
#include "dbc/generated/sc_spell_data.inc"
#include "dbc/generated/sc_spell_lists.inc"
#include "dbc/generated/sc_talent_data.inc"

#include <cstdlib>
#include <vector>

#include "simc_copied.hpp"
#include "simc_data.hpp"
#include "util.hpp"

//////////////////////////////////////////////////
// common

size_t simc_data::specIdx_from_specID(size_t specID)
{
    return specdata::__idx_specs[specID] + 1;
}

std::vector<size_t> simc_data::slug_to_itemIDs(const std::string& slug)
{
    std::vector<size_t> ret;
    for(const auto& e : __item_data)
    {
        if(!e.name)
            continue;
        auto s = util::make_slug(e.name);
        if(s == slug)
            ret.push_back(e.id);
    }
    return ret;
}

std::vector<size_t> simc_data::slug_to_spellIDs(const std::string& slug)
{
    std::vector<size_t> ret;
    for(const auto& e : __spell_data)
    {
        if(!e._name)
            continue;
        auto s = util::make_slug(e._name);
        if(s == slug)
            ret.push_back(e._id);
    }
    return ret;
}

std::set<size_t> simc_data::specIDs_from_classID(size_t classID)
{
    auto mask = util::classMask_from_classID(classID);
    std::set<size_t> specIDs;
    for(const auto& t : __talent_data)
        if(t._m_class == mask && t._spec != 0)
            specIDs.insert(t._spec);
    return specIDs;
}

size_t simc_data::classID_from_specID(size_t specID)
{
    for(const auto& t : __talent_data)
        if(t._spec == specID)
            return util::classID_from_classMask(t._m_class);
    THROW_UTIL_EXCEPTION << "Could not find classID for specID=" << specID;
}

//////////////////////////////////////////////////
// talents

namespace
{
    const auto& talent_entry(size_t id, bool failIfNotFound)
    {
        for(const auto& e : __talent_data)
        {
            if(e._id == id)
                return e;
        }
        static std::decay_t<decltype(__talent_data[0])> dummy;
        if(!failIfNotFound)
            return dummy;
        THROW_UTIL_EXCEPTION << "Could not find talent info for talentID=" << id;
    }
} // namespace

std::set<size_t> simc_data::talentIDs_from_specID(size_t specID)
{
    auto classID = simc_data::classID_from_specID(specID);
    auto mask = util::classMask_from_classID(classID);
    std::set<size_t> talentIDs;
    for(const auto& t : __talent_data)
    {
        if(t._m_class == mask && t._spec == specID)
            talentIDs.insert(t._id);
    }
    for(const auto& t : __talent_data)
    {
        if(t._m_class == mask && t._spec == 0)
        {
            auto it = util::find_if(talentIDs, [&](auto id) {
                auto t2 = talent_info(id);
                return t2.row == t._row + 1 && t2.col == t._col + 1;
            });
            if(it == std::end(talentIDs))
                talentIDs.insert(t._id);
        }
    }
    if(talentIDs.size() == 21)
        return talentIDs;

    THROW_UTIL_EXCEPTION << "Could not detect all 21 talents, " << simc_copied::specName_from_specID(specID) << " (specID=" << specID << ")";
}

simc_data::talent_t simc_data::talent_info(size_t talentID, bool failIfNotFound)
{
    auto e = talent_entry(talentID, failIfNotFound);
    return simc_data::talent_t{.id = e._id, .name = e._name, .row = e._row + 1, .col = e._col + 1, .specID = e._spec};
}

simc_data::talent_set_t simc_data::talents_from_specID(size_t specID)
{
    talent_set_t talents;
    for(const auto& talentID : talentIDs_from_specID(specID))
        talents.insert(talent_info(talentID));
    return talents;
}

//////////////////////////////////////////////////
// items

namespace
{
    const auto& item_entry(size_t id, bool failIfNotFound)
    {
        for(const auto& e : __item_data)
        {
            if(e.id == id)
                return e;
        }
        static std::decay_t<decltype(__item_data[0])> dummy;
        if(!failIfNotFound)
            return dummy;
        THROW_UTIL_EXCEPTION << "Could not find item info for itemID=" << id;
    }
} // namespace

simc_data::item_t simc_data::item_info(size_t itemID, bool failIfNotFound)
{
    auto e = item_entry(itemID, failIfNotFound);
    return simc_data::item_t{.id = e.id, .name = e.name};
}

std::map<std::string, std::set<size_t>> simc_data::itemsets_from_classID(size_t classID)
{
    std::map<std::string, std::set<size_t>> allData;

    std::set<std::string> itemsets;
    for(const auto& e : __set_bonus_data)
    {
        if(classID == e.class_id)
            itemsets.insert(e.set_opt_name);
    }
    for(const auto& s : itemsets)
    {
        std::set<unsigned> itemIDs;
        for(const auto& e : __set_bonus_data)
        {
            if(s == e.set_opt_name && classID == e.class_id)
            {
                for(const auto& i : e.item_ids)
                {
                    if(i == 0)
                        break;
                    allData[s].insert(i);
                }
            }
        }
    }
    return allData;
}

//////////////////////////////////////////////////
// artifacts

namespace
{
    const auto& artifact_trait_entry(size_t id, bool failIfNotFound)
    {
        for(const auto& e : __artifact_power_data)
        {
            if(e.id == id)
                return e;
        }
        static std::decay_t<decltype(__artifact_power_data[0])> dummy;
        if(!failIfNotFound)
            return dummy;
        THROW_UTIL_EXCEPTION << "Could not find artifact trait info for traitID=" << id;
    }
} // namespace

size_t simc_data::artifactID_from_specID(size_t specID)
{
    for(const auto& t : __artifact_data)
    {
        if(t.id_spec == specID)
        {
            return t.id;
        }
    }
    THROW_UTIL_EXCEPTION << "Could not find artifactID for specID=" << specID;
}

std::set<size_t> simc_data::artifactTraitIDs_from_artifactID(size_t artifactID)
{
    std::set<size_t> allTraitIDs;
    for(const auto& t : __artifact_power_data)
    {
        if(t.id_artifact == artifactID)
            allTraitIDs.insert(t.id);
    }
    return allTraitIDs;
}

simc_data::artifact_trait_t simc_data::artifact_trait_info(size_t artifactTraitID, bool failIfNotFound)
{
    const auto& e = artifact_trait_entry(artifactTraitID, failIfNotFound);
    return simc_data::artifact_trait_t{.id = e.id, .name = e.name, .max_rank = e.max_rank};
}

simc_data::artifact_trait_set_t simc_data::artifactTraits_from_artifactID(size_t artifactID)
{
    artifact_trait_set_t traits;
    for(const auto& id : artifactTraitIDs_from_artifactID(artifactID))
        traits.insert(artifact_trait_info(id));
    return traits;
}

//////////////////////////////////////////////////
// spells

namespace
{
    const auto& spell_entry(size_t id, bool failIfNotFound)
    {
        for(const auto& e : __spell_data)
        {
            if(e._id == id)
                return e;
        }
        static std::decay_t<decltype(__spell_data[0])> dummy;
        if(!failIfNotFound)
            return dummy;
        THROW_UTIL_EXCEPTION << "Could not find spell info for spellID=" << id;
    }
} // namespace

std::set<size_t> simc_data::spellIDs_from_classID(size_t classID)
{
    auto mask = util::classMask_from_classID(classID);
    std::set<size_t> spellIDs;
    for(const auto& e : __spell_data)
        if((e._class_mask & mask) == mask)
            spellIDs.insert(e._id);
    return spellIDs;
}

simc_data::spell_t simc_data::spell_info(size_t spellID, bool failIfNotFound)
{
    const auto& e = spell_entry(spellID, failIfNotFound);
    return simc_data::spell_t{
      .id = e._id,
      .name = e._name,
      .is_ability = e.flags(SPELL_ATTR_UNK4),
      .is_passive = e.flags(SPELL_ATTR_PASSIVE),
      .is_hidden = e.flags(SPELL_ATTR_HIDDEN),
      .gcd = static_cast<float>(e._gcd) / 1000.0f,
      .duration = static_cast<float>(e._duration) / 1000.0f,
      .cooldown = static_cast<float>(e._cooldown) / 1000.0f,
      .charges = e._charges,
      .charge_cooldown = static_cast<float>(e._charge_cooldown) / 1000.0f,
      .max_stack = e._max_stack,
      .min_range = static_cast<float>(e._min_range),
      .max_range = static_cast<float>(e._max_range),
      .description = e._desc,
      .tooltip = e._tooltip,
    };
}

simc_data::spell_set_t simc_data::spells_from_classID(size_t classID)
{
    spell_set_t spells;
    for(const auto& id : spellIDs_from_classID(classID))
        spells.insert(spell_info(id));
    return spells;
}

simc_data::spell_set_t simc_data::player_abilities_from_classID(size_t classID)
{
    simc_data::spell_set_t ret;
    const auto spells = spells_from_classID(classID);
    std::copy_if(std::begin(spells), std::end(spells), std::inserter(ret, std::end(ret)), [&](const auto& spell) {
        return !spell.is_hidden; // && (spell.gcd > 0 || spell.cooldown > 0 || spell.charges > 0 || spell.charge_cooldown > 0);
    });
    return ret;
}

//////////////////////////////////////////////////
// spell effects

namespace
{
    const auto& spelleffect_entry(size_t id, bool failIfNotFound)
    {
        for(const auto& e : __spelleffect_data)
        {
            if(e._id == id)
                return e;
        }
        static std::decay_t<decltype(__spelleffect_data[0])> dummy;
        if(!failIfNotFound)
            return dummy;
        THROW_UTIL_EXCEPTION << "Could not find spell effect info for spellID=" << id;
    }
} // namespace

std::set<size_t> simc_data::spellEffectIDs_from_spellID(size_t spellID)
{
    std::set<size_t> ids;
    for(const auto& e : __spelleffect_data)
        if(e._spell_id == spellID)
            ids.insert(e._id);
    return ids;
}

simc_data::spelleffect_t simc_data::spelleffect_info(size_t spellEffectID, bool failIfNotFound)
{
    const auto& e = spelleffect_entry(spellEffectID, failIfNotFound);
    return spelleffect_t{.id = e._id,
                         .index = e._index,
                         .type = e._type,
                         .subtype = e._subtype,
                         .trigger_spell_id = e._trigger_spell_id,
                         .val1 = e._base_value,
                         .val2 = e._misc_value,
                         .val3 = e._misc_value_2,
                         .die_sides = e._die_sides};
}

simc_data::spelleffect_set_t simc_data::spellEffects_from_spellID(size_t spellID)
{
    spelleffect_set_t spellEffects;
    for(const auto& id : spellEffectIDs_from_spellID(spellID))
        spellEffects.insert(spelleffect_info(id));
    return spellEffects;
}
