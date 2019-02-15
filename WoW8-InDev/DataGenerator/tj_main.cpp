#include "simulationcraft.hpp"

#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

#include <cstring>
#include <vector>
#include <set>
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
    rc = run_sim_args({"./datagenerator",
                       "deathknight=deathknight_blood",
                       "default_actions=1",
                       "level=110",
                       "spec=blood",
                       "main_hand=,id=128402",
                       "artifact=15:0:0:0:0:289:1",
                       "save=generated_deathknight_blood.simc"});

    rc = run_sim_args({"./datagenerator",
                       "deathknight=deathknight_frost",
                       "default_actions=1",
                       "level=110",
                       "spec=frost",
                       "main_hand=,id=128292",
                       "off_hand=,id=128293",
                       "artifact=12:0:0:0:0:122:1",
                       "save=generated_deathknight_frost.simc"});

    rc = run_sim_args({"./datagenerator",
                       "deathknight=deathknight_unholy",
                       "default_actions=1",
                       "level=110",
                       "spec=unholy",
                       "main_hand=,id=128403",
                       "artifact=16:0:0:0:0:149:1",
                       "save=generated_deathknight_unholy.simc"});

    rc = run_sim_args({"./datagenerator", "tj"}, false);
}
