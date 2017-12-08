#include "simc_copied.hpp"
#include "simc_data.hpp"
#include "util.hpp"

#include <cstring>
#include <iomanip>
#include <iostream>
#include <set>
#include <string>
#include <vector>

void export_itemsets(int classID)
{
    auto itemsets = simc_data::get_itemsets(classID);

    std::cout << "TJ.Generated.Itemsets[" << classID << "] = {";
    for(const auto& s : itemsets)
    {
        std::cout << "\n    ['" << s.first << "'] = {";
        for(const auto& i : s.second)
            std::cout << "\n        " << i << ", -- " << simc_data::item_info(i).name;
        std::cout << "\n    },";
    }
    std::cout << "\n}\n";
}

void export_talents_for_spec(int specID)
{
    auto talents = simc_data::talents_from_specID(specID);

    int maxLen = 0;
    for(const auto& talent : talents)
    {
        auto l = util::make_slug(talent.name).length();
        if(maxLen < l)
            maxLen = l;
    }

    std::cout << "    talents = {\n";
    for(const auto& talent : talents)
    {
        std::cout << "        " << std::setw(maxLen) << util::make_slug(talent.name) << std::setw(0) << " = { TalentIDs = { " << talent.row << ", "
                  << talent.col << " }, TalentID = " << std::setw(5) << talent.id << std::setw(0) << " }, -- " << talent.name << "\n";
    }
    std::cout << "    },\n";
}

void export_artifact_traits_for_artifact(size_t artifactID)
{
    auto artifactTraits = simc_data::artifactTraits_from_artifactID(artifactID);

    int maxLen = 0;
    for(const auto& artifactTrait : artifactTraits)
    {
        auto l = util::make_slug(artifactTrait.name).length();
        if(maxLen < l)
            maxLen = l;
    }

    std::cout << "    artifact_traits = {\n";
    for(const auto& trait : artifactTraits)
    {
        std::cout << "        " << std::setw(maxLen) << util::make_slug(trait.name) << std::setw(0) << " = { TraitID = " << std::setw(4) << trait.id
                  << std::setw(0) << ", MaxRank = " << std::setw(2) << trait.max_rank << std::setw(0) << " }, -- " << trait.name << "\n";
    }
    std::cout << "    }\n";
}

void export_data_for_class(int classID)
{
    auto className = simc_copied::className_from_classID(classID);
    std::cout << "\n\n-- " << className << " (classID=" << classID << ")\n";
    export_itemsets(classID);

    for(const auto& specID : simc_data::specIDs_from_classID(classID))
    {
        auto specName = simc_copied::specName_from_specID(specID);
        auto classID = simc_data::classID_from_specID(specID);
        auto specIndex = simc_data::specIdx_from_specID(specID);
        auto artifactID = simc_data::artifactID_from_specID(specID);
        std::cout << "\n-- " << specName << " (specID=" << specID << ", specIndex=" << specIndex << ", artifactID=" << artifactID << ")\n";
        std::cout << "TJ.Generated.SpecInfo[" << specID << "] = {\n";
        export_talents_for_spec(specID);
        export_artifact_traits_for_artifact(artifactID);
        std::cout << "}\n";
    }
}

int main()
{
    try
    {
        for(int i = 1; i <= 12; ++i)
            export_data_for_class(i);
    }
    catch(std::exception& e)
    {
        std::cerr << e.what() << "\n";
    }
    return 0;
}
