#!/bin/bash

BASE_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
cd "${BASE_DIR}"

if [[ ! -d "simc/.git" ]] ; then
    git clone https://github.com/simulationcraft/simc
fi

echo 'local _, private = ...' > ActionProfileLists.lua
echo 'private.apls = {}' >> ActionProfileLists.lua
echo >> ActionProfileLists.lua

append_action_profiles_from_dir() {
    BRANCH=$1
    TIER_DIR="$(readlink -f "$2")"
    OIFS=$IFS
    IFS=$'\r\n'
    for file in $(gfind "${TIER_DIR}" \( -iname '*.simc' -and -not -iname 'generate_*' \) | sort) ; do
        BN=$(basename "$file")
        BN=${BN%.simc}
        DATA=$(cat "${file}" | grep -P '^action')
        TD=$(basename "${TIER_DIR}")
        if [[ ! -z "${DATA}" ]] ; then
            echo "${file}"
            echo "private.apls[\"${BRANCH}::${TD}::${BN}\"] = [[" >> ActionProfileLists.lua
            echo "${DATA}" >> ActionProfileLists.lua
            echo "]]" >> ActionProfileLists.lua
            echo >> ActionProfileLists.lua
        fi
    done
    IFS=$OIFS
}

append_action_profiles_from_branch() {
    BRANCH=$1
    TIER=$2
    OIFS=$IFS
    IFS=$'\r\n'
    (cd "${BASE_DIR}/simc" && git reset --hard HEAD && git clean -xfd && git checkout "${BRANCH}" && git pull)
    if [[ -z "${TIER}" ]] ; then
        for tier_dir in $(gfind "${BASE_DIR}/simc/profiles" -mindepth 1 -maxdepth 1 -type d -name 'Tier*' | sort) ; do
            append_action_profiles_from_dir "${BRANCH}" "${tier_dir}"
        done
    else
        FULL_TIER_DIR="${BASE_DIR}/simc/profiles/${TIER}"
        if [[ -d "${FULL_TIER_DIR}" ]] ; then
            append_action_profiles_from_dir "${BRANCH}" "${FULL_TIER_DIR}"
        fi
    fi
    IFS=$OIFS
}

append_action_profiles_from_branch master Tier17H
append_action_profiles_from_branch master Tier18H
append_action_profiles_from_branch master Tier19H
append_action_profiles_from_branch legion-dev Tier19P
append_action_profiles_from_branch legion-dev Tier19H

./cleanup.sh