#!/bin/bash

set -e

THIS_SCRIPT="$(readlink -f "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(readlink -f "$(dirname "$THIS_SCRIPT")")"

if [[ ! -d "${SCRIPT_DIR}/simc/.git" ]] ; then
    git clone --depth=1 https://github.com/simulationcraft/simc "${SCRIPT_DIR}/simc"
else
    { pushd "${SCRIPT_DIR}/simc" && git reset --hard origin/HEAD && git checkout -- . && git pull --depth=1 && popd ; }
fi

[[ ! -d "${SCRIPT_DIR}/Temp" ]] && mkdir -p "${SCRIPT_DIR}/Temp"
[[ ! -d "${SCRIPT_DIR}/Support/DataGenerator/build" ]] && mkdir -p "${SCRIPT_DIR}/Support/DataGenerator/build"

pushd "${SCRIPT_DIR}/Support/DataGenerator/build" >/dev/null 2>&1
#../extract-methods.sh

find .. -not -path '../build/*' -and  -not -path '../3rdparty/*' -and \( -iname '*.cpp' -or -iname '*.h' -or -iname '*.hpp' -or -iname '*.inl' \) \
    | parallel "echo \"Formatting '{1}'\" && clang-format -i '{1}'"

cmake -DCMAKE_BUILD_TYPE=Debug ..
make -j$(cat /proc/cpuinfo | grep rocessor | wc -l)

cp datagenerator "${SCRIPT_DIR}"
chmod +x "${SCRIPT_DIR}/datagenerator"

"${SCRIPT_DIR}/datagenerator" --classID=1 > "${SCRIPT_DIR}/Temp/Generated-Warrior.lua"
"${SCRIPT_DIR}/datagenerator" --classID=2 > "${SCRIPT_DIR}/Temp/Generated-Paladin.lua"
"${SCRIPT_DIR}/datagenerator" --classID=3 > "${SCRIPT_DIR}/Temp/Generated-Hunter.lua"
"${SCRIPT_DIR}/datagenerator" --classID=4 > "${SCRIPT_DIR}/Temp/Generated-Rogue.lua"
"${SCRIPT_DIR}/datagenerator" --classID=5 > "${SCRIPT_DIR}/Temp/Generated-Priest.lua"
"${SCRIPT_DIR}/datagenerator" --classID=6 > "${SCRIPT_DIR}/Temp/Generated-DeathKnight.lua"
"${SCRIPT_DIR}/datagenerator" --classID=7 > "${SCRIPT_DIR}/Temp/Generated-Shaman.lua"
"${SCRIPT_DIR}/datagenerator" --classID=8 > "${SCRIPT_DIR}/Temp/Generated-Mage.lua"
"${SCRIPT_DIR}/datagenerator" --classID=9 > "${SCRIPT_DIR}/Temp/Generated-Warlock.lua"
"${SCRIPT_DIR}/datagenerator" --classID=10 > "${SCRIPT_DIR}/Temp/Generated-Monk.lua"
"${SCRIPT_DIR}/datagenerator" --classID=11 > "${SCRIPT_DIR}/Temp/Generated-Druid.lua"
"${SCRIPT_DIR}/datagenerator" --classID=12 > "${SCRIPT_DIR}/Temp/Generated-DemonHunter.lua"

"${SCRIPT_DIR}/datagenerator" --ptr --classID=1 > "${SCRIPT_DIR}/Temp/Generated-Warrior-PTR.lua"
"${SCRIPT_DIR}/datagenerator" --ptr --classID=2 > "${SCRIPT_DIR}/Temp/Generated-Paladin-PTR.lua"
"${SCRIPT_DIR}/datagenerator" --ptr --classID=3 > "${SCRIPT_DIR}/Temp/Generated-Hunter-PTR.lua"
"${SCRIPT_DIR}/datagenerator" --ptr --classID=4 > "${SCRIPT_DIR}/Temp/Generated-Rogue-PTR.lua"
"${SCRIPT_DIR}/datagenerator" --ptr --classID=5 > "${SCRIPT_DIR}/Temp/Generated-Priest-PTR.lua"
"${SCRIPT_DIR}/datagenerator" --ptr --classID=6 > "${SCRIPT_DIR}/Temp/Generated-DeathKnight-PTR.lua"
"${SCRIPT_DIR}/datagenerator" --ptr --classID=7 > "${SCRIPT_DIR}/Temp/Generated-Shaman-PTR.lua"
"${SCRIPT_DIR}/datagenerator" --ptr --classID=8 > "${SCRIPT_DIR}/Temp/Generated-Mage-PTR.lua"
"${SCRIPT_DIR}/datagenerator" --ptr --classID=9 > "${SCRIPT_DIR}/Temp/Generated-Warlock-PTR.lua"
"${SCRIPT_DIR}/datagenerator" --ptr --classID=10 > "${SCRIPT_DIR}/Temp/Generated-Monk-PTR.lua"
"${SCRIPT_DIR}/datagenerator" --ptr --classID=11 > "${SCRIPT_DIR}/Temp/Generated-Druid-PTR.lua"
"${SCRIPT_DIR}/datagenerator" --ptr --classID=12 > "${SCRIPT_DIR}/Temp/Generated-DemonHunter-PTR.lua"

for file in $(find "${SCRIPT_DIR}/Temp" -name 'Generated-*.lua') ; do
    lua $file
done

popd >/dev/null 2>&1
