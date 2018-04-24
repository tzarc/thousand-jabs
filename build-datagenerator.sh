#!/bin/bash

set -e

THIS_SCRIPT="$(readlink -f "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(readlink -f "$(dirname "$THIS_SCRIPT")")"

GIT_BRANCH="bfa-dev"
if [[ ! -d "${SCRIPT_DIR}/simc/.git" ]] ; then
    git clone -b $GIT_BRANCH https://github.com/simulationcraft/simc "${SCRIPT_DIR}/simc"
else
    { pushd "${SCRIPT_DIR}/simc" && git reset --hard origin/HEAD && git checkout -- . && git checkout $GIT_BRANCH && git pull && popd ; }
fi

[[ ! -d "${SCRIPT_DIR}/Temp" ]] && mkdir -p "${SCRIPT_DIR}/Temp"
[[ ! -d "${SCRIPT_DIR}/Support/DataGenerator/build" ]] && mkdir -p "${SCRIPT_DIR}/Support/DataGenerator/build"

pushd "${SCRIPT_DIR}/Support/DataGenerator/build" >/dev/null 2>&1
../extract-methods.sh ../generated/live/extracted.h
../extract-methods.sh ../generated/ptr/extracted.h
../extract-methods.sh ../generated/beta/extracted.h
../extract-methods.sh ../generated/alpha/extracted.h

find .. -not -path '../build/*' -and  -not -path '../3rdparty/*' -and  -not -path '*/generated/*' -and \( -iname '*.cpp' -or -iname '*.h' -or -iname '*.hpp' -or -iname '*.inl' \) \
    | parallel "echo \"Formatting '{1}'\" && clang-format -i '{1}'"

cmake -DCMAKE_BUILD_TYPE=Debug ..
make -j$(cat /proc/cpuinfo | grep rocessor | wc -l)

cp datagenerator "${SCRIPT_DIR}"
chmod +x "${SCRIPT_DIR}/datagenerator"

popd >/dev/null 2>&1
