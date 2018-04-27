#include "simulationcraft.hpp"
#include "dbc/sc_spell_info.hpp"

int run_tj(sim_t* sim)
{
    try
    {
        auto s = dbc::find_spell(sim, 235999);
        std::cout << spell_info::to_str(sim->dbc, s, 1) << std::endl;
    }
    catch(const std::exception& e)
    {
        std::cerr << e.what() << std::endl;
    }
    return 0;
}
