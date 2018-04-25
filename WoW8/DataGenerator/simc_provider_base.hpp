#pragma once

#include <string>
#include <cstdint>

namespace simc_data
{
    struct spell
    {
        uint32_t ID;
        std::string Name;
        double MinRange;
        double MaxRange;
    };
} // namespace simc_data

class simc_provider_base
{
public:
    virtual simc_data::spell get_spell(uint32_t spellID) const = 0;
};
