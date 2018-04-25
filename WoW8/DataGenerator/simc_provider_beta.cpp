#if __has_include("generated/beta/sc_spell_data.beta.h")

#include <cstdint>
#include <string>
#include "util.hpp"
#include "simc_provider_beta.hpp"
#include "generated/beta/sc_specialization_data.beta.h"
#include "generated/beta/extracted.beta.h"
#include "generated/beta/sc_spell_data.beta.h"
#include "generated/beta/sc_spec_list.beta.h"
#include "generated/beta/sc_spell_lists.beta.h"
#include "generated/beta/sc_talent_data.beta.h"
#include "generated/beta/sc_item_data.beta.h"
#include "generated/beta/sc_item_data2.beta.h"

simc_data::spell simc_provider_beta::get_spell(uint32_t spellID) const
{
    for(auto&& e : __spell_data)
    {
        if(e._id == spellID)
        {
            simc_data::spell s;
            s.ID = e._id;
            s.Name = e._name;
            s.MinRange = e._min_range;
            s.MaxRange = e._max_range;
            return s;
        }
    }

    return {};
}

#endif
