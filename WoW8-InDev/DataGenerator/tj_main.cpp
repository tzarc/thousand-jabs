#include "simulationcraft.hpp"

#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

#include <cstring>
#include <vector>
#include <set>
#include "dbc/dbc.hpp"
#include "dbc/sc_spell_info.hpp"

#include "wow_version_def.h"

extern int run_simc(int argc, char** argv);

namespace
{
    template <typename F>
    int fork_exec(F&& func)
    {
        pid_t pid = fork();
        if(pid < 0)
            return pid;
        if(pid == 0)
            exit(func());
        int status;
        waitpid(pid, &status, 0);
        return WEXITSTATUS(status);
    }

    int run_sim_args(std::initializer_list<const char*> args, bool do_fork = true)
    {
        std::vector<std::array<char, 1024>> writableArgs;
        for(auto&& arg : args)
        {
            writableArgs.resize(writableArgs.size() + 1);
            std::strncpy(writableArgs.back().data(), arg, writableArgs.back().size() - 1);
        }
        std::vector<char*> argv;
        for(auto&& arg : writableArgs)
            argv.push_back(arg.data());

        if(!do_fork)
            return run_simc((int)argv.size(), argv.data());

        return fork_exec([&]() { return run_simc((int)argv.size(), argv.data()); });
    }
} // namespace

int run_tj(void)
{
    int rc;
    rc = run_sim_args(
      {"./datagenerator", "mage=mage_frost", "default_actions=1", "level=120", "spec=frost", "main_hand=,id=163956", "save=generated_mage_frost.simc"});

#if SC_USE_PTR
    rc = run_sim_args({"./datagenerator",
                       "ptr=1",
                       "mage=mage_frost",
                       "default_actions=1",
                       "level=120",
                       "spec=frost",
                       "main_hand=,id=163956",
                       "save=generated_mage_frost_ptr.simc"});
#endif

    rc = run_sim_args({"./datagenerator", "tj"}, false);

    return rc;
}
