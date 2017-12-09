#include "simc_copied.hpp"
#include "simc_data.hpp"
#include "util.hpp"

#include <algorithm>
#include <cstring>
#include <iomanip>
#include <iostream>
#include <set>
#include <string>
#include <vector>

void export_itemsets(int classID)
{
    auto itemsets = simc_data::itemsets_from_classID(classID);

    fmt::print("TJ.Generated.Itemsets[{0}] = {{\n", classID);
    for(const auto& s : itemsets)
    {
        fmt::print("    ['{0}'] = {{\n", s.first);
        for(const auto& i : s.second)
            fmt::print("        {0:6d}, -- {1}\n", i, simc_data::item_info(i).name);
        fmt::print("    }},\n");
    }
    fmt::print("}}\n");
}

void export_spells_for_spec(int specID)
{
    auto classID = simc_data::classID_from_specID(specID);
    auto spells = simc_data::spells_from_classID(classID);
    std::vector<simc_data::spell_t> sortedSpells(std::begin(spells), std::end(spells));
    std::sort(std::begin(sortedSpells), std::end(sortedSpells), [&](const auto& lhs, const auto& rhs) {
        auto ls = util::make_slug(lhs.name);
        auto rs = util::make_slug(rhs.name);
        return std::tie(ls, lhs.id) < std::tie(rs, rhs.id);
    });
    int maxLen = util::member_max_slug_len(sortedSpells, &simc_data::spell_t::name);
    fmt::print("    spells = {{\n");
    for(const auto& spell : sortedSpells)
    {
        if(!spell.is_hidden
           && (spell.gcd > 0 || spell.cooldown > 0 || spell.charges > 0 || spell.charge_cooldown > 0 || spell.duration > 0 || spell.max_stack > 0))
        {
            auto spell_slug = util::make_slug(spell.name);
            fmt::print("        {0:>32s} = {{", spell_slug);
            fmt::print(" spell_id = {{ {0:6d} }},", spell.id);
            fmt::print(" spell_cast_time = {0:4.2f},", std::max(0.01f, spell.gcd));
            fmt::print(" min_range = {0},", spell.min_range);
            fmt::print(" max_range = {0},", spell.max_range);
            fmt::print(" }},\n");
        }
    }
    fmt::print("    }},\n");
}

void export_talents_for_spec(int specID)
{
    auto talents = simc_data::talents_from_specID(specID);
    int maxLen = util::member_max_slug_len(talents, &simc_data::talent_t::name);
    fmt::print("    talents = {{\n");
    for(const auto& talent : talents)
    {
        fmt::print("        {0:>{1}s} = {{ talent_location = {{ {2}, {3} }}, talent_id = {4:5d} }}, -- {5}\n",
                   util::make_slug(talent.name),
                   maxLen,
                   talent.row,
                   talent.col,
                   talent.id,
                   talent.name);
    }
    fmt::print("    }},\n");
}

void export_artifact_traits_for_artifact(size_t artifactID)
{
    auto artifactTraits = simc_data::artifactTraits_from_artifactID(artifactID);
    int maxLen = util::member_max_slug_len(artifactTraits, &simc_data::artifact_trait_t::name);
    fmt::print("    artifact_traits = {{\n");
    for(const auto& trait : artifactTraits)
    {
        fmt::print("        {0:>{1}s} = {{ TraitID = {2:5d}, MaxRank = {3:2d} }}, -- {4}\n",
                   util::make_slug(trait.name),
                   maxLen,
                   trait.id,
                   trait.max_rank,
                   trait.name);
    }
    fmt::print("    }},\n");
}

void export_data_for_class(int classID)
{
    auto className = simc_copied::className_from_classID(classID);
    fmt::print("-- {0} (classID={1})", className, classID);
    export_itemsets(classID);

    for(const auto& specID : simc_data::specIDs_from_classID(classID))
    {
        auto specName = simc_copied::specName_from_specID(specID);
        auto classID = simc_data::classID_from_specID(specID);
        auto specIndex = simc_data::specIdx_from_specID(specID);
        auto artifactID = simc_data::artifactID_from_specID(specID);
        fmt::print("-- {0} (specID={1}, specIndex={2}, artifactID={3})\n", specName, specID, specIndex, artifactID);
        fmt::print("TJ.Generated.SpecInfo[{0}] = {{\n", specID);
        fmt::print("    class_id = {0},\n", classID);
        fmt::print("    spec_id = {0},\n", specID);
        fmt::print("    spec_index = {0},\n", specIndex);
        fmt::print("    artifact_id = {0},\n", artifactID);
        export_spells_for_spec(specID);
        export_talents_for_spec(specID);
        export_artifact_traits_for_artifact(artifactID);
        fmt::print("}},\n");
    }
}

int main(int argc, char* argv[])
{
    std::vector<std::string> args(argc);
    std::copy(&argv[0], &argv[argc], std::begin(args));

    // $ ./datagenerator class_name 11
    if(args[1] == "class_name")
    {
        int classID = std::stoi(args[2]);
        auto className = simc_copied::className_from_classID(classID);
        fmt::print("\"{0}\"", className);
        return 0;
    }

    // $ ./datagenerator class_specs 11
    if(args[1] == "class_specs")
    {
        int classID = std::stoi(args[2]);
        auto specIDs = simc_data::specIDs_from_classID(classID);
        fmt::print("[\n");
        for(const auto& specID : specIDs)
            fmt::print("    {0},\n", specID);
        fmt::print("]\n");
        return 0;
    }

    // $ ./datagenerator class_dump 11
    if(args[1] == "class_dump")
    {
        int classID = std::stoi(args[2]);
        export_data_for_class(classID);
        return 0;
    }

    return 0;
}
