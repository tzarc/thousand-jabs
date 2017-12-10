#pragma once
#include <cstdlib>
#include <string>

#include "util.hpp"

namespace simc_copied
{
    std::string className_from_classID(size_t classID);
    std::string specName_from_specID(size_t specID);

    int translate_spec_str(int ptype, const std::string& spec_str);
    std::string specialization_string(int spec);

    // from http://wowprogramming.com/docs/api_types
    // copied direct from page
    // Atom find/replace syntax (regex)
    //      find: \s*([0-9]+)\s.*Enum\.PowerType\.([A-Za-z0-9]+)\)
    //   replace:  \\\n X($1,$2)

#define POWER_TYPES(X)                                                                                                                                         \
    X(0, Mana)                                                                                                                                                 \
    X(1, Rage)                                                                                                                                                 \
    X(2, Focus)                                                                                                                                                \
    X(3, Energy)                                                                                                                                               \
    X(4, ComboPoints)                                                                                                                                          \
    X(5, Runes)                                                                                                                                                \
    X(6, RunicPower)                                                                                                                                           \
    X(7, SoulShards)                                                                                                                                           \
    X(8, LunarPower)                                                                                                                                           \
    X(9, HolyPower)                                                                                                                                            \
    X(10, Alternate)                                                                                                                                           \
    X(11, Maelstrom)                                                                                                                                           \
    X(12, Chi)                                                                                                                                                 \
    X(13, Insanity)                                                                                                                                            \
    X(14, Obsolete)                                                                                                                                            \
    X(15, Obsolete2)                                                                                                                                           \
    X(16, ArcaneCharges)                                                                                                                                       \
    X(17, Fury)                                                                                                                                                \
    X(18, Pain)

    enum powertype_t
    {
#define POWER_TYPE(val, name) name = val,
        POWER_TYPES(POWER_TYPE)
#undef POWER_TYPE
    };

    std::string powertype_string(powertype_t pt);

} // namespace simc_copied

namespace util
{
    inline std::string str(const simc_copied::powertype_t& pt) { return simc_copied::powertype_string(pt); }
} // namespace util
