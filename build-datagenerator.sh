#!/bin/bash

THIS_SCRIPT="$(readlink -f "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(readlink -f "$(dirname "$THIS_SCRIPT")")"

[[ ! -d "Support/DataGenerator/build" ]] && mkdir -p "Support/DataGenerator/build"

find "Support/DataGenerator" -not -path 'Support/DataGenerator/build' -and \( -iname '*.cpp' -or -iname '*.h' -or -iname '*.hpp' \) | parallel "echo \"Formatting '{1}'\" && clang-format -i '{1}'"

pushd "Support/DataGenerator/build" >/dev/null 2>&1 \
    && cmake .. \
    && make \
    && cp datagenerator "${SCRIPT_DIR}" \
    && popd >/dev/null 2>&1