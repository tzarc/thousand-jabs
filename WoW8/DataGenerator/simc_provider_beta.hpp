#pragma once
#if __has_include("generated/beta/sc_spell_data.beta.h")

#include "simc_provider_base.hpp"

class simc_provider_beta : public simc_provider_base
{
public:
    simc_data::spell get_spell(uint32_t spellID) const override;
};

#endif // __has_include("generated/beta/sc_spell_data.beta.h")
