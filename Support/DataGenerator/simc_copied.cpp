#include "dbc/data_definitions.hh"
#include "dbc/data_enums.hh"
#include "dbc/dbc.hpp"

namespace simc_live
{
#include "dbc/generated/sc_item_data.inc"
#include "dbc/generated/sc_item_data2.inc"
#include "dbc/generated/sc_spec_list.inc"
#include "dbc/generated/sc_spell_data.inc"
#include "dbc/generated/sc_spell_lists.inc"
#include "dbc/generated/sc_talent_data.inc"
}

#ifdef PTR
namespace simc_ptr
{
#include "dbc/generated/sc_item_data_ptr.inc"
#include "dbc/generated/sc_item_data_ptr2.inc"
#include "dbc/generated/sc_spec_list_ptr.inc"
#include "dbc/generated/sc_spell_data_ptr.inc"
#include "dbc/generated/sc_spell_lists_ptr.inc"
#include "dbc/generated/sc_talent_data_ptr.inc"
}
#endif

#include "simc_copied.hpp"
#include "util.hpp"

using namespace simc_copied;
using namespace util;
#include "simc_extracted.inl"

std::string simc_copied::className_from_classID(size_t classID)
{
    return std::string(_class_map[classID].name);
}

std::string simc_copied::specName_from_specID(size_t specID)
{
    auto it = util::find_if(spec_map, [&](const auto& s) { return s.spec == specID; });
    if(it == std::end(spec_map))
        return "!!UNKNOWN_SPEC!!";
    return std::string(it->name);
}

std::string simc_copied::powertype_string(powertype_t pt)
{
    switch(pt)
    {
#define POWER_TYPE(val, name)                                                                                                                                  \
    case powertype_t::name:                                                                                                                                    \
        return util::camel_to_underscores(#name);
        POWER_TYPES(POWER_TYPE)
#undef POWER_TYPE
    }
    return {};
}
