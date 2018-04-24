#include "dbc/data_definitions.hh"
#include "dbc/data_enums.hh"
#include "dbc/dbc.hpp"

//#include "generated/alpha/all.inl"
//#include "generated/beta/all.inl"
#include "generated/live/all.inl"
//#include "generated/ptr/all.inl"

#include <cstdlib>
#include <vector>

#include "simc_copied.hpp"
#include "simc_data.hpp"
#include "util.hpp"

//////////////////////////////////////////////////
// common

int simc_data::specIdx_from_specID(int specID)
{
    return specdata::__idx_specs[specID] + 1;
}

std::vector<int> simc_data::slug_to_itemIDs(const std::string& slug)
{
    std::vector<int> ret;
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

std::vector<int> simc_data::slug_to_spellIDs(const std::string& slug)
{
    std::vector<int> ret;
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

std::set<int> simc_data::specIDs_from_classID(int classID)
{
    auto mask = util::classMask_from_classID(classID);
    std::set<int> specIDs;
    for(const auto& t : __talent_data)
        if(t._m_class == mask && t._spec != 0)
            specIDs.insert(t._spec);
    return specIDs;
}

int simc_data::classID_from_specID(int specID)
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
    const auto& talent_entry(int id, bool throwIfNotFound)
    {
        for(const auto& e : __talent_data)
        {
            if(e._id == id)
                return e;
        }
        static std::decay_t<decltype(__talent_data[0])> dummy;
        if(!throwIfNotFound)
            return dummy;
        THROW_UTIL_EXCEPTION << "Could not find talent info for talentID=" << id;
    }
} // namespace

std::set<int> simc_data::talentIDs_from_specID(int specID)
{
    auto classID = simc_data::classID_from_specID(specID);
    auto mask = util::classMask_from_classID(classID);
    std::set<int> talentIDs;
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

simc_data::talent_t simc_data::talent_info(int talentID, bool throwIfNotFound)
{
    auto e = talent_entry(talentID, throwIfNotFound);
    return simc_data::talent_t{.id = e._id, .name = e._name, .row = e._row + 1, .col = e._col + 1, .specID = e._spec};
}

simc_data::talent_set_t simc_data::talents_from_specID(int specID)
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
    const auto& item_entry(int id, bool throwIfNotFound)
    {
        for(const auto& e : __item_data)
        {
            if(e.id == id)
                return e;
        }
        static std::decay_t<decltype(__item_data[0])> dummy;
        if(!throwIfNotFound)
            return dummy;
        THROW_UTIL_EXCEPTION << "Could not find item info for itemID=" << id;
    }
} // namespace

simc_data::item_t simc_data::item_info(int itemID, bool throwIfNotFound)
{
    auto e = item_entry(itemID, throwIfNotFound);
    return simc_data::item_t{.id = e.id, .name = e.name};
}

std::map<std::string, std::set<int>> simc_data::itemsets_from_classID(int classID)
{
    std::map<std::string, std::set<int>> allData;

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
    const auto& artifact_trait_entry(int id, bool throwIfNotFound)
    {
        for(const auto& e : __artifact_power_data)
        {
            if(e.id == id)
                return e;
        }
        static std::decay_t<decltype(__artifact_power_data[0])> dummy;
        if(!throwIfNotFound)
            return dummy;
        THROW_UTIL_EXCEPTION << "Could not find artifact trait info for traitID=" << id;
    }
} // namespace

int simc_data::artifactID_from_specID(int specID)
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

std::pair<int, int> simc_data::artifactItemIDs_from_artifactID(int artifactID)
{
    // Gotta go through the normal items table to check for the artifact ID
    int mainHand = 0;
    for(const auto& e : __item_data)
    {
        if(e.id_artifact == artifactID)
        {
            mainHand = e.id;
            break;
        }
    }
    if(mainHand == 0)
        THROW_UTIL_EXCEPTION << "Could not find artifact itemID for artifactID=" << artifactID;

    // Handle the dual-wield scenario
    for(const auto& e : __item_child_equipment_data)
    {
        if(e.id_item == mainHand || e.id_child == mainHand)
        {
            auto i1 = item_entry(e.id_item, true);
            auto i2 = item_entry(e.id_child, true);

            // Dual-wield
            if(i1.inventory_type == INVTYPE_WEAPONMAINHAND && i2.inventory_type == INVTYPE_WEAPONOFFHAND)
                return std::make_pair<int, int>(e.id_item, e.id_child);
            if(i1.inventory_type == INVTYPE_WEAPONOFFHAND && i2.inventory_type == INVTYPE_WEAPONMAINHAND)
                return std::make_pair<int, int>(e.id_child, e.id_item);

            // Dual-wield 2H'er: Fury/TG
            if(i1.inventory_type == INVTYPE_2HWEAPON && i2.inventory_type == INVTYPE_2HWEAPON)
                return std::make_pair<int, int>(e.id_item, e.id_child);

            // Weapon + Shield
            if(i1.inventory_type == INVTYPE_WEAPONMAINHAND && i2.inventory_type == INVTYPE_SHIELD)
                return std::make_pair<int, int>(e.id_item, e.id_child);
            if(i1.inventory_type == INVTYPE_SHIELD && i2.inventory_type == INVTYPE_WEAPONMAINHAND)
                return std::make_pair<int, int>(e.id_child, e.id_item);

            // Weapon + Offhand
            if(i1.inventory_type == INVTYPE_WEAPONMAINHAND && i2.inventory_type == INVTYPE_HOLDABLE)
                return std::make_pair<int, int>(e.id_item, e.id_child);
            if(i1.inventory_type == INVTYPE_HOLDABLE && i2.inventory_type == INVTYPE_WEAPONMAINHAND)
                return std::make_pair<int, int>(e.id_child, e.id_item);

            THROW_UTIL_EXCEPTION << "Unknown item slots for artifactID=" << artifactID << " -- (i1=" << i1.inventory_type << ", i2=" << i2.inventory_type
                                 << ")";
        }
    }

    return std::pair<int, int>(mainHand, 0);
}

std::pair<int, int> simc_data::artifactItemIDs_from_specID(int specID)
{
    return artifactItemIDs_from_artifactID(artifactID_from_specID(specID));
}

std::set<int> simc_data::artifactTraitIDs_from_artifactID(int artifactID)
{
    std::set<int> allTraitIDs;
    for(const auto& t : __artifact_power_data)
    {
        if(t.id_artifact == artifactID)
            allTraitIDs.insert(t.id);
    }
    return allTraitIDs;
}

simc_data::artifact_trait_t simc_data::artifact_trait_info(int artifactTraitID, bool throwIfNotFound)
{
    const auto& e = artifact_trait_entry(artifactTraitID, throwIfNotFound);
    return simc_data::artifact_trait_t{.id = e.id, .name = e.name, .max_rank = e.max_rank};
}

simc_data::artifact_trait_set_t simc_data::artifactTraits_from_artifactID(int artifactID)
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
    const auto& spell_entry(int id, bool throwIfNotFound)
    {
        for(const auto& e : __spell_data)
        {
            if(e._id == id)
                return e;
        }
        static std::decay_t<decltype(__spell_data[0])> dummy;
        if(!throwIfNotFound)
            return dummy;
        THROW_UTIL_EXCEPTION << "Could not find spell info for spellID=" << id;
    }
} // namespace

std::set<int> simc_data::spellIDs_from_classID(int classID)
{
    auto mask = util::classMask_from_classID(classID);
    std::set<int> spellIDs;
    for(const auto& e : __spell_data)
        if((e._class_mask & mask) == mask)
            spellIDs.insert(e._id);
    return spellIDs;
}

simc_data::spell_t simc_data::spell_info(int spellID, bool throwIfNotFound)
{
    const auto& e = spell_entry(spellID, throwIfNotFound);
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

simc_data::spell_set_t simc_data::spells_from_classID(int classID)
{
    spell_set_t spells;
    for(const auto& id : spellIDs_from_classID(classID))
        spells.insert(spell_info(id));
    return spells;
}

//////////////////////////////////////////////////
// spell effects

namespace
{
    const auto& spelleffect_entry(int id, bool throwIfNotFound)
    {
        for(const auto& e : __spelleffect_data)
        {
            if(e._id == id)
                return e;
        }
        static std::decay_t<decltype(__spelleffect_data[0])> dummy;
        if(!throwIfNotFound)
            return dummy;
        THROW_UTIL_EXCEPTION << "Could not find spell effect info for spellID=" << id;
    }
} // namespace

std::set<int> simc_data::spellEffectIDs_from_spellID(int spellID)
{
    std::set<int> ids;
    for(const auto& e : __spelleffect_data)
        if(e._spell_id == spellID)
            ids.insert(e._id);
    return ids;
}

simc_data::spelleffect_t simc_data::spelleffect_info(int spellEffectID, bool throwIfNotFound)
{
    const auto& e = spelleffect_entry(spellEffectID, throwIfNotFound);
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

simc_data::spelleffect_set_t simc_data::spellEffects_from_spellID(int spellID)
{
    spelleffect_set_t spellEffects;
    for(const auto& id : spellEffectIDs_from_spellID(spellID))
        spellEffects.insert(spelleffect_info(id));
    return spellEffects;
}
