#include "dbc/data_definitions.hh"
#include "dbc/data_enums.hh"
#include "dbc/dbc.hpp"

#include "simc_extracted.inl"

//#include "generated/alpha/all.inl"
//#include "generated/beta/all.inl"
#include "generated/live/all.inl"
//#include "generated/ptr/all.inl"

#include "simc_copied.hpp"
#include "util.hpp"

using namespace simc_copied;
using namespace util;

std::string simc_copied::className_from_classID(int classID)
{
    return std::string(_class_map[classID].name);
}

std::string simc_copied::specName_from_specID(int specID)
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
