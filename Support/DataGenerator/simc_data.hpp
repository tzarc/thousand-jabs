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
    talent_t talent_info(size_t talentID, bool throwIfNotFound = true);

    namespace detail
    {
        struct talent_comparator
        {
            bool operator()(const talent_t& lhs, const talent_t& rhs) const { return std::tie(lhs.row, lhs.col, lhs.id) < std::tie(rhs.row, rhs.col, rhs.id); }
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
    item_t item_info(size_t itemID, bool throwIfNotFound = true);

    std::map<std::string, std::set<size_t>> itemsets_from_classID(size_t classID);

    //////////////////////////////////////////////////
    // artifacts
    size_t artifactID_from_specID(size_t specID);
    std::set<size_t> artifactTraitIDs_from_artifactID(size_t artifactID);
    std::pair<size_t, size_t> artifactItemIDs_from_artifactID(size_t artifactID);
    std::pair<size_t, size_t> artifactItemIDs_from_specID(size_t specID);

    struct artifact_trait_t
    {
        size_t id;
        const char* name;
        size_t max_rank;
    };
    artifact_trait_t artifact_trait_info(size_t artifactTraitID, bool throwIfNotFound = true);

    namespace detail
    {
        struct artifact_trait_comparator
        {
            bool operator()(const artifact_trait_t& lhs, const artifact_trait_t& rhs) const
            {
                auto ls = util::make_slug(lhs.name);
                auto rs = util::make_slug(rhs.name);
                return std::tie(ls, lhs.id) < std::tie(rs, rhs.id);
            }
        };
    } // namespace detail
    using artifact_trait_set_t = std::set<artifact_trait_t, detail::artifact_trait_comparator>;
    artifact_trait_set_t artifactTraits_from_artifactID(size_t artifactID);

    //////////////////////////////////////////////////
    // spells
    std::set<size_t> spellIDs_from_classID(size_t classID);

    struct spell_t
    {
        size_t id;
        const char* name;
        bool is_ability;
        bool is_passive;
        bool is_hidden;
        float gcd;
        float duration;
        float cooldown;
        size_t charges;
        float charge_cooldown;
        size_t max_stack;
        float min_range;
        float max_range;
        const char* description;
        const char* tooltip;
    };
    spell_t spell_info(size_t spellID, bool throwIfNotFound = true);

    namespace detail
    {
        struct spell_comparator
        {
            bool operator()(const spell_t& lhs, const spell_t& rhs) const
            {
                auto ls = util::make_slug(lhs.name);
                auto rs = util::make_slug(rhs.name);
                return std::tie(ls, lhs.id) < std::tie(rs, rhs.id);
            }
        };
    } // namespace detail
    using spell_set_t = std::set<spell_t, detail::spell_comparator>;
    spell_set_t spells_from_classID(size_t classID);

    //////////////////////////////////////////////////
    // spell effects
    std::set<size_t> spellEffectIDs_from_spellID(size_t spellID);

    struct spelleffect_t
    {
        size_t id;
        size_t index;
        size_t type;
        size_t subtype;
        size_t trigger_spell_id;
        int val1;
        int val2;
        int val3;
        int die_sides;
    };
    spelleffect_t spelleffect_info(size_t spellEffectID, bool throwIfNotFound = true);

    namespace detail
    {
        struct spelleffect_comparator
        {
            bool operator()(const spelleffect_t& lhs, const spelleffect_t& rhs) const { return lhs.id < rhs.id; }
        };
    } // namespace detail
    using spelleffect_set_t = std::set<spelleffect_t, detail::spelleffect_comparator>;
    spelleffect_set_t spellEffects_from_spellID(size_t spellID);
} // namespace simc_data
