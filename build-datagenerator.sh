#!/bin/bash

THIS_SCRIPT="$(readlink -f "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(readlink -f "$(dirname "$THIS_SCRIPT")")"

if [[ ! -d "${SCRIPT_DIR}/simc/.git" ]] ; then
    git clone --depth=1 https://github.com/simulationcraft/simc "${SCRIPT_DIR}/simc"
else
    { pushd "${SCRIPT_DIR}/simc" && git reset --hard origin/HEAD && git checkout -- . && git pull --depth=1 && popd ; }
fi

[[ ! -d "Support/DataGenerator/build" ]] && mkdir -p "Support/DataGenerator/build"

find "./Support/DataGenerator" -not -path './Support/DataGenerator/build/*' -and  -not -path './Support/DataGenerator/3rdparty/*' -and \( -iname '*.cpp' -or -iname '*.h' -or -iname '*.hpp' \) | parallel "echo \"Formatting '{1}'\" && clang-format -i '{1}'"

pushd "Support/DataGenerator/build" >/dev/null 2>&1 \
    && cmake -DCMAKE_BUILD_TYPE=Debug .. \
    && make -j5 \
    && cp datagenerator "${SCRIPT_DIR}" \
    && chmod +x "${SCRIPT_DIR}/datagenerator" \
    && "${SCRIPT_DIR}/datagenerator" class_dump 1 > "${SCRIPT_DIR}/Temp/Generated-Warrior.lua" \
    && "${SCRIPT_DIR}/datagenerator" class_dump 2 > "${SCRIPT_DIR}/Temp/Generated-Paladin.lua" \
    && "${SCRIPT_DIR}/datagenerator" class_dump 3 > "${SCRIPT_DIR}/Temp/Generated-Hunter.lua" \
    && "${SCRIPT_DIR}/datagenerator" class_dump 4 > "${SCRIPT_DIR}/Temp/Generated-Rogue.lua" \
    && "${SCRIPT_DIR}/datagenerator" class_dump 5 > "${SCRIPT_DIR}/Temp/Generated-Priest.lua" \
    && "${SCRIPT_DIR}/datagenerator" class_dump 6 > "${SCRIPT_DIR}/Temp/Generated-DeathKnight.lua" \
    && "${SCRIPT_DIR}/datagenerator" class_dump 7 > "${SCRIPT_DIR}/Temp/Generated-Shaman.lua" \
    && "${SCRIPT_DIR}/datagenerator" class_dump 8 > "${SCRIPT_DIR}/Temp/Generated-Mage.lua" \
    && "${SCRIPT_DIR}/datagenerator" class_dump 9 > "${SCRIPT_DIR}/Temp/Generated-Warlock.lua" \
    && "${SCRIPT_DIR}/datagenerator" class_dump 10 > "${SCRIPT_DIR}/Temp/Generated-Monk.lua" \
    && "${SCRIPT_DIR}/datagenerator" class_dump 11 > "${SCRIPT_DIR}/Temp/Generated-Druid.lua" \
    && "${SCRIPT_DIR}/datagenerator" class_dump 12 > "${SCRIPT_DIR}/Temp/Generated-DemonHunter.lua" \
    && { for file in $(find "${SCRIPT_DIR}/Temp" -name 'Generated-*.lua') ; do lua $file ; done ; } \
    && popd >/dev/null 2>&1
