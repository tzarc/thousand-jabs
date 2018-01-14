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
    int specIdx_from_specID(int specID);

    std::vector<int> slug_to_itemIDs(const std::string& slug);
    std::vector<int> slug_to_spellIDs(const std::string& slug);

    std::set<int> specIDs_from_classID(int classID);
    int classID_from_specID(int specID);

    //////////////////////////////////////////////////
    // talents

    std::set<int> talentIDs_from_specID(int specID);

    struct talent_t
    {
        int id;
        const char* name;
        int row;
        int col;
        int specID;
    };
    talent_t talent_info(int talentID, bool throwIfNotFound = true);

    namespace detail
    {
        struct talent_comparator
        {
            bool operator()(const talent_t& lhs, const talent_t& rhs) const { return std::tie(lhs.row, lhs.col, lhs.id) < std::tie(rhs.row, rhs.col, rhs.id); }
        };
    } // namespace detail
    using talent_set_t = std::set<talent_t, detail::talent_comparator>;
    talent_set_t talents_from_specID(int specID);

    //////////////////////////////////////////////////
    // items
    struct item_t
    {
        int id;
        const char* name;
    };
    item_t item_info(int itemID, bool throwIfNotFound = true);

    std::map<std::string, std::set<int>> itemsets_from_classID(int classID);

    //////////////////////////////////////////////////
    // artifacts
    int artifactID_from_specID(int specID);
    std::set<int> artifactTraitIDs_from_artifactID(int artifactID);
    std::pair<int, int> artifactItemIDs_from_artifactID(int artifactID);
    std::pair<int, int> artifactItemIDs_from_specID(int specID);

    struct artifact_trait_t
    {
        int id;
        const char* name;
        int max_rank;
    };
    artifact_trait_t artifact_trait_info(int artifactTraitID, bool throwIfNotFound = true);

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
    artifact_trait_set_t artifactTraits_from_artifactID(int artifactID);

    //////////////////////////////////////////////////
    // spells
    std::set<int> spellIDs_from_classID(int classID);

    struct spell_t
    {
        int id;
        const char* name;
        bool is_ability;
        bool is_passive;
        bool is_hidden;
        float gcd;
        float duration;
        float cooldown;
        int charges;
        float charge_cooldown;
        int max_stack;
        float min_range;
        float max_range;
        const char* description;
        const char* tooltip;
    };
    spell_t spell_info(int spellID, bool throwIfNotFound = true);

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
    spell_set_t spells_from_classID(int classID);

    //////////////////////////////////////////////////
    // spell effects
    std::set<int> spellEffectIDs_from_spellID(int spellID);

    struct spelleffect_t
    {
        int id;
        int index;
        int type;
        int subtype;
        int trigger_spell_id;
        int val1;
        int val2;
        int val3;
        int die_sides;
    };
    spelleffect_t spelleffect_info(int spellEffectID, bool throwIfNotFound = true);

    namespace detail
    {
        struct spelleffect_comparator
        {
            bool operator()(const spelleffect_t& lhs, const spelleffect_t& rhs) const { return lhs.id < rhs.id; }
        };
    } // namespace detail
    using spelleffect_set_t = std::set<spelleffect_t, detail::spelleffect_comparator>;
    spelleffect_set_t spellEffects_from_spellID(int spellID);
} // namespace simc_data
