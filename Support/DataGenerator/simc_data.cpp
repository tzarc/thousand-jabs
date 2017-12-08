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

std::map<std::string, std::set<size_t>> simc_data::get_itemsets(size_t classID)
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
    return -1;
}

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
    if(talentIDs.size() != 21)
        THROW_UTIL_EXCEPTION << "Could not detect all 21 talents, " << simc_copied::specName_from_specID(specID) << " (specID=" << specID << ")";
    return talentIDs;
}

simc_data::talent_t simc_data::talent_info(size_t talentID)
{
    for(const auto& t : __talent_data)
    {
        if(t._id == talentID)
            return simc_data::talent_t{.id = t._id, .name = t._name, .row = t._row + 1, .col = t._col + 1, .specID = t._spec};
    }
    return {};
}

simc_data::talent_set_t simc_data::talents_from_specID(size_t specID)
{
    talent_set_t talents;
    for(const auto& talentID : talentIDs_from_specID(specID))
        talents.insert(talent_info(talentID));
    return talents;
}

simc_data::item_t simc_data::item_info(size_t itemID)
{
    for(const auto& t : __item_data)
    {
        if(t.id == itemID)
            return simc_data::item_t{.id = t.id, .name = t.name};
    }
    return {};
}

size_t simc_data::artifactID_from_specID(size_t specID)
{
    for(const auto& t : __artifact_data)
    {
        if(t.id_spec == specID)
        {
            return t.id;
        }
    }
    return -1;
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

simc_data::artifact_trait_t simc_data::artifact_trait_info(size_t artifactTraitID)
{
    for(const auto& t : __artifact_power_data)
    {
        if(t.id == artifactTraitID)
            return simc_data::artifact_trait_t{.id = t.id, .name = t.name, .max_rank = t.max_rank};
    }
    return {};
}

simc_data::artifact_trait_set_t simc_data::artifactTraits_from_artifactID(size_t artifactID)
{
    artifact_trait_set_t traits;
    for(const auto& id : artifactTraitIDs_from_artifactID(artifactID))
        traits.insert(artifact_trait_info(id));
    return traits;
}
