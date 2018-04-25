#include <iostream>

#include "simc_provider_beta.hpp"

int main()
{
    simc_provider_beta prov;
    auto s = prov.get_spell(122470);
    std::cout << s.Name << ", range: " << s.MinRange << '-' << s.MaxRange << '\n';

    return 0;
}
