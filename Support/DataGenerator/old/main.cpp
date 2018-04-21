#include "simc_copied.hpp"
#include "simc_data.hpp"
#include "util.hpp"

#include "argagg.hpp"
#include "json.hpp"

#include "dbc/data_enums.hh"

#include <algorithm>
#include <cstring>
#include <iomanip>
#include <iostream>
#include <regex>
#include <set>
#include <string>
#include <vector>

const effect_type_t supportedEffectTypes[] = {E_APPLY_AURA, E_TRIGGER_SPELL, E_ENERGIZE, E_ADD_COMBO_POINTS};

void export_itemsets(int classID)
{
    auto itemsets = simc_data::itemsets_from_classID(classID);

    fmt::print("TJ.Generated.ClassData[{}].Itemsets = {{\n", classID);
    for(const auto& s : itemsets)
    {
        fmt::print("    ['{}'] = {{\n", s.first);
        for(const auto& i : s.second)
            fmt::print("        {:6d}, -- {}\n", i, simc_data::item_info(i).name);
        fmt::print("    }},\n");
    }
    fmt::print("}}\n\n");
}

void export_spelleffects_for_spellID(int spellID)
{
    const float auraThreshold = 0.5f;
    auto info = simc_data::spell_info(spellID);
    auto effects = simc_data::spellEffects_from_spellID(spellID);
    std::vector<simc_data::spelleffect_t> supportedEffects;
    std::copy_if(std::begin(effects), std::end(effects), std::back_inserter(supportedEffects), [&](const auto& e) {
        if(simc_data::spell_info(info.id).is_hidden)
            return false;
        return util::find_if(supportedEffectTypes, [&](const auto& f) { return f == e.type; }) != std::end(supportedEffectTypes);
    });

#ifdef _DEBUG
    fmt::print("        spell_effects = {{\n");
    fmt::print("            --{:>2s}, {:>6s}, {:>6s}, {:>5s}, {:>3s}, {:>6s}, {:>6s}, {:>6s}, {:>4s}\n", "n", "id", "ts", "t", "st", "v1", "v2", "v3", "ds");
    for(const auto& e : effects)
        fmt::print("            {{ {:2d}, {:6d}, {:6d}, {:5d}, {:3d}, {:6d}, {:6d}, {:6d}, {:4d} }},\n",
                   e.index,
                   e.id,
                   e.trigger_spell_id,
                   e.type,
                   e.subtype,
                   e.val1,
                   e.val2,
                   e.val3,
                   e.die_sides);
    fmt::print("        }},\n");
#endif

    fmt::print("        actions = {{\n");
    if(info.duration > auraThreshold)
        fmt::print("            {{ 'apply_aura', '{}', {}, {:.1f} }},\n", util::make_slug(simc_data::spell_info(info.id).name), info.id, info.duration);
    for(const auto& e : supportedEffects)
    {
        auto i = simc_data::spell_info(e.trigger_spell_id, false);
        switch(e.type)
        {
            case E_APPLY_AURA:
                if(i.id && !i.is_hidden && i.duration > auraThreshold)
                    fmt::print("            {{ 'apply_aura', '{}', {}, {:.1f} }},\n", util::make_slug(simc_data::spell_info(i.id).name), i.id, i.duration);
                break;
            case E_TRIGGER_SPELL:
                if(i.id && !i.is_hidden && i.duration > auraThreshold)
                    fmt::print("            {{ 'trigger_spell', '{}', {} }},\n", util::make_slug(simc_data::spell_info(i.id).name), i.id);
                break;
            case E_ENERGIZE:
                fmt::print("            {{ 'energize', '{}', {} }},\n", util::str(static_cast<simc_copied::powertype_t>(e.val2)), e.val1);
                break;
            case E_ADD_COMBO_POINTS:
                fmt::print("            {{ 'combo_points' }},\n");
                break;
        }
    }
    fmt::print("        }},\n");
}

std::set<int> collect_known_spells_for_classID(int classID)
{
    std::set<int> allSpellIDs;
    auto spells = simc_data::spells_from_classID(classID);
    for(const auto& e : spells)
        allSpellIDs.insert(e.id);
    bool newSpellAdded;
    do
    {
        newSpellAdded = false;
        for(const auto& s : allSpellIDs)
        {
            auto effects = simc_data::spellEffects_from_spellID(s);
            for(const auto& e : effects)
            {
                if(e.trigger_spell_id && allSpellIDs.find(e.trigger_spell_id) == allSpellIDs.end())
                {
                    newSpellAdded = true;
                    allSpellIDs.insert(e.trigger_spell_id);
                }
            }
        }
    } while(newSpellAdded);
    return allSpellIDs;
}

void export_spells_for_classID(int classID)
{
    auto spells = collect_known_spells_for_classID(classID);
    std::vector<simc_data::spell_t> sortedAbilities;
    for(const auto& s : spells)
    {
        auto info = simc_data::spell_info(s, false);
        if(info.id != 0)
            sortedAbilities.push_back(info);
    }
    std::sort(std::begin(sortedAbilities), std::end(sortedAbilities), [&](const auto& lhs, const auto& rhs) {
        auto ls = util::make_slug(lhs.name);
        auto rs = util::make_slug(rhs.name);
        return std::tie(ls, lhs.id) < std::tie(rs, rhs.id);
    });
    fmt::print("TJ.Generated.ClassData[{}].Spells = {{\n", classID);
    for(const auto& spell : sortedAbilities)
    {
        if(!spell.is_hidden)
        {
            auto spell_slug = util::make_slug(spell.name);
            fmt::print("    [{}] = {{ -- {}\n", spell.id, spell.name);
            fmt::print("        slug = '{}',\n", spell_slug);
            fmt::print("        cast_time = {:.2f},\n", std::max(0.01f, spell.gcd));
            if(spell.duration > 0)
                fmt::print("        duration = {:.2f},\n", spell.duration);
            if(spell.min_range > 0)
                fmt::print("        min_range = {:.0f},\n", spell.min_range);
            if(spell.max_range > 0)
                fmt::print("        max_range = {:.0f},\n", spell.max_range);
#ifdef _DEBUG
            if(spell.description)
            {
                std::string q(spell.description);
                q = std::regex_replace(q, std::regex("\r"), "");
                q = std::regex_replace(q, std::regex("\n"), "\\n");
                q = std::regex_replace(q, std::regex("\'"), "\\'");
                fmt::print("        description = '{}',\n", q);
            }
            if(spell.tooltip)
            {
                std::string q(spell.tooltip);
                q = std::regex_replace(q, std::regex("\r"), "");
                q = std::regex_replace(q, std::regex("\n"), "\\n");
                q = std::regex_replace(q, std::regex("\'"), "\\'");
                fmt::print("        tooltip = '{}',\n", q);
            }
#endif
            export_spelleffects_for_spellID(spell.id);
            fmt::print("    }},\n");
        }
    }
    fmt::print("}}\n\n");
}

void export_talents_for_spec(int classID, int specID)
{
    auto talents = simc_data::talents_from_specID(specID);
    int maxLen = util::member_max_slug_len(talents, &simc_data::talent_t::name);
    fmt::print("TJ.Generated.ClassData[{}].Talents[{}] = {{\n", classID, specID);
    for(const auto& talent : talents)
    {
        fmt::print("    {:>{}s} = {{ talent_location = {{ {}, {} }}, talent_id = {:5d} }}, -- {}\n",
                   util::make_slug(talent.name),
                   maxLen,
                   talent.row,
                   talent.col,
                   talent.id,
                   talent.name);
    }
    fmt::print("}}\n\n");
}

void export_artifact_traits_for_artifact(int classID, int specID, int artifactID)
{
    auto artifactTraits = simc_data::artifactTraits_from_artifactID(artifactID);
    int maxLen = util::member_max_slug_len(artifactTraits, &simc_data::artifact_trait_t::name);
    fmt::print("TJ.Generated.ClassData[{}].ArtifactTraits[{}] = {{\n", classID, specID);
    for(const auto& trait : artifactTraits)
    {
        fmt::print("    {:>{}s} = {{ TraitID = {:5d}, MaxRank = {:2d} }}, -- {}\n", util::make_slug(trait.name), maxLen, trait.id, trait.max_rank, trait.name);
    }
    fmt::print("}}\n\n");
}

void export_data_for_class(int classID)
{
    auto className = simc_copied::className_from_classID(classID);
    fmt::print("-- {} (classID={})\n", className, classID);
    export_spells_for_classID(classID);
    export_itemsets(classID);

    for(const auto& specID : simc_data::specIDs_from_classID(classID))
    {
        auto specName = simc_copied::specName_from_specID(specID);
        auto classID = simc_data::classID_from_specID(specID);
        auto specIndex = simc_data::specIdx_from_specID(specID);
        auto artifactID = simc_data::artifactID_from_specID(specID);
        fmt::print("-- {} (specID={}, specIndex={}, artifactID={})\n", specName, specID, specIndex, artifactID);
        fmt::print("TJ.Generated.ClassData[{}].SpecInfo[{}] = {{\n", classID, specID);
        fmt::print("    class_id = {},\n", classID);
        fmt::print("    spec_id = {},\n", specID);
        fmt::print("    spec_index = {},\n", specIndex);
        fmt::print("    artifact_id = {},\n", artifactID);
        auto artifactItemIDs = simc_data::artifactItemIDs_from_specID(specID);
        if(artifactItemIDs.first && artifactItemIDs.second)
            fmt::print("    artifact_itemids = {{ {}, {} }},\n", artifactItemIDs.first, artifactItemIDs.second);
        else if(artifactItemIDs.first)
            fmt::print("    artifact_itemids = {{ {} }},\n", artifactItemIDs.first);
        fmt::print("}}\n\n");
        export_talents_for_spec(classID, specID);
        export_artifact_traits_for_artifact(classID, specID, artifactID);
    }
}

int main(int argc, char* argv[])
{
    argagg::parser argparser{{
      {"ptr", {"--ptr"}, "Exports data using PTR values", 0},
      {"classID", {"--classID"}, "Input class ID", 1},
      {"itemID", {"--itemID"}, "Input item ID", 1},
      {"spellID", {"--spellID"}, "Input spell ID", 1},
      {"dumpclass", {"--dumpclass"}, "Dumps class data", 0},
    }};

    int classID = 0;
    int itemID = 0;
    int spellID = 0;
    bool dumpclass = false;

    argagg::parser_results args;
    try
    {
        args = argparser.parse(argc, argv);

        if(args["classID"])
        {
            classID = args["classID"].as<int>();
        }

        if(args["itemID"])
        {
            itemID = args["itemID"].as<int>();
        }

        if(args["spellID"])
        {
            spellID = args["spellID"].as<int>();
        }

        if(args["dumpclass"])
        {
            dumpclass = true;
        }
    }
    catch(const std::exception& e)
    {
        std::cerr << e.what() << std::endl;
        return EXIT_FAILURE;
    }

    if(dumpclass)
    {
        auto specIDs = simc_data::specIDs_from_classID(classID);

        nlohmann::json specData;
        for(const auto& specID : specIDs)
        {
            specData[std::to_string(specID)] = {{"specID", specID}};
        }

        nlohmann::json my_json = {
          {"classID", classID},
          {"specIDs", nlohmann::json(specIDs)},
          {"specData", specData},
        };

        fmt::print("{}\n", my_json.dump());
    }

    /*
    std::vector<std::string> args(argc);
    std::copy(&argv[0], &argv[argc], std::begin(args));

    // $ ./datagenerator class_name 11
    if(args[1] == "class_name")
    {
        int classID = std::stoi(args[2]);
        auto className = simc_copied::className_from_classID(classID);
        fmt::print("\"{}\"", className);
        return 0;
    }

    // $ ./datagenerator class_specs 11
    if(args[1] == "class_specs")
    {
        int classID = std::stoi(args[2]);
        auto specIDs = simc_data::specIDs_from_classID(classID);
        fmt::print("[\n");
        for(const auto& specID : specIDs)
            fmt::print("    {},\n", specID);
        fmt::print("]\n");
        return 0;
    }

    // $ ./datagenerator class_dump 11
    if(args[1] == "class_dump")
    {
        int classID = std::stoi(args[2]);
        fmt::print("TJ = TJ or {{ }}\n");
        fmt::print("TJ.Generated = TJ.Generated or {{ }}\n");
        fmt::print("TJ.Generated.ClassData = TJ.Generated.ClassData or {{ }}\n");
        fmt::print("TJ.Generated.ClassData[{}] = TJ.Generated.ClassData[{}] or {{ }}\n", classID, classID);
        fmt::print("TJ.Generated.ClassData[{}].SpecInfo = TJ.Generated.ClassData[{}].SpecInfo or {{ }}\n", classID, classID);
        fmt::print("TJ.Generated.ClassData[{}].Talents = TJ.Generated.ClassData[{}].Talents or {{ }}\n", classID, classID);
        fmt::print("TJ.Generated.ClassData[{}].ArtifactTraits = TJ.Generated.ClassData[{}].ArtifactTraits or {{ }}\n", classID, classID);
        fmt::print("\n");
        export_data_for_class(classID);
        return 0;
    }
    */

    return 0;
}
