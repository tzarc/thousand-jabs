#pragma once
#include <cstdlib>
#include <cstring>
#include <map>
#include <set>
#include <string>
#include <vector>

namespace simc_data
{
    //////////////////////////////////////////////////
    // common
    size_t specIdx_from_specID(size_t specID);

    std::vector<size_t> slug_to_itemIDs(const std::string& slug);
    std::vector<size_t> slug_to_spellIDs(const std::string& slug);

    std::set<size_t> specIDs_from_classID(size_t classID);
    size_t classID_from_specID(size_t specID);

    //////////////////////////////////////////////////
    // talents

    std::set<size_t> talentIDs_from_specID(size_t specID);

    struct talent_t
    {
        size_t id;
        const char* name;
        size_t row;
        size_t col;
        size_t specID;
    };
    talent_t talent_info(size_t talentID);

    namespace detail
    {
        struct talent_comparator
        {
            bool operator()(const talent_t& lhs, const talent_t& rhs) const { return strcmp(lhs.name, rhs.name) < 0; }
        };
    } // namespace detail
    using talent_set_t = std::set<talent_t, detail::talent_comparator>;
    talent_set_t talents_from_specID(size_t specID);

    //////////////////////////////////////////////////
    // items
    struct item_t
    {
        size_t id;
        const char* name;
    };
    item_t item_info(size_t itemID);

    std::map<std::string, std::set<size_t>> itemsets_from_classID(size_t classID);

    //////////////////////////////////////////////////
    // artifacts
    size_t artifactID_from_specID(size_t specID);
    std::set<size_t> artifactTraitIDs_from_artifactID(size_t artifactID);

    struct artifact_trait_t
    {
        size_t id;
        const char* name;
        size_t max_rank;
    };
    artifact_trait_t artifact_trait_info(size_t artifactTraitID);

    namespace detail
    {
        struct artifact_trait_comparator
        {
            bool operator()(const artifact_trait_t& lhs, const artifact_trait_t& rhs) const { return strcmp(lhs.name, rhs.name) < 0; }
        };
    } // namespace detail
    using artifact_trait_set_t = std::set<artifact_trait_t, detail::artifact_trait_comparator>;
    artifact_trait_set_t artifactTraits_from_artifactID(size_t artifactID);

    //////////////////////////////////////////////////
    // spells
    std::set<size_t> player_spellIDs_from_specID(size_t specID);

    struct spell_t
    {
        size_t id;
        const char* name;
        bool is_ability;
        bool passive;
        float gcd;
        bool duration_affected_by_haste;
        float min_range;
        float max_range;
    };
    spell_t spell_info(size_t spellID);

    namespace detail
    {
        struct spell_comparator
        {
            bool operator()(const spell_t& lhs, const spell_t& rhs) const { return strcmp(lhs.name, rhs.name) < 0; }
        };
    } // namespace detail
    using spell_set_t = std::set<spell_t, detail::spell_comparator>;
    spell_set_t player_spells_from_specID(size_t specID);
} // namespace simc_data