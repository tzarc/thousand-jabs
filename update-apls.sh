#!/bin/bash

BASE_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
cd "${BASE_DIR}"

if [[ ! -d "simc/.git" ]] ; then
    git clone https://github.com/simulationcraft/simc
else
    (cd "${BASE_DIR}/simc" && git pull)
fi

echo 'local _, private = ...' > ActionProfileLists.lua
echo 'private.apls = {}' >> ActionProfileLists.lua
echo >> ActionProfileLists.lua

get_action_profiles_from_branch() {
    BRANCH=$1
    OIFS=$IFS
    IFS=$'\r\n'
    (cd "${BASE_DIR}/simc" && git checkout "${BRANCH}")
    for tier_dir in $(gfind ./simc/profiles -mindepth 1 -maxdepth 1 -type d -name 'Tier*' | sort) ; do
        for file in $(gfind "${tier_dir}" \( -iname '*.simc' -and -not -iname 'generate_*' \) | sort) ; do
            BN=$(basename "$file")
            BN=${BN%.simc}
            DATA=$(cat "${file}" | grep -P '^action')
            TD=$(basename "${tier_dir}")
            if [[ ! -z "${DATA}" ]] ; then
                echo "${file}"
                echo "private.apls[\"${BRANCH}::${TD}::${BN}\"] = [[" >> ActionProfileLists.lua
                echo "${DATA}" >> ActionProfileLists.lua
                echo "]]" >> ActionProfileLists.lua
                echo >> ActionProfileLists.lua
            fi
        done
    done
    IFS=$OIFS
}

get_action_profiles_from_branch master
get_action_profiles_from_branch legion-dev