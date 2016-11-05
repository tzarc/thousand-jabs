#!/bin/bash

# Weapons/shields so that we can generate simc profiles
one_hand_sword=2027 # Scimitar
one_hand_dagger=4565 # Simple Dagger
two_hand_sword=1194 # Bastard Sword
two_hand_staff=2132 # Short Staff
two_hand_bow=8179 # Cadet's Bow
shield=17190 # Ornate Buckler

# Class/spec combos to generate action lists for:
allspecs=(
"playerclass=deathknight charspec=blood mainhand=${two_hand_sword}"
"playerclass=deathknight charspec=frost mainhand=${one_hand_sword} offhand=${one_hand_sword}"
"playerclass=deathknight charspec=unholy mainhand=${two_hand_sword}"

"playerclass=demonhunter charspec=vengeance mainhand=${one_hand_sword} offhand=${one_hand_sword}"
"playerclass=demonhunter charspec=havoc mainhand=${one_hand_sword} offhand=${one_hand_sword}"

"playerclass=druid charspec=balance mainhand=${two_hand_staff}"
"playerclass=druid charspec=feral mainhand=${one_hand_sword} offhand=${one_hand_sword}"
"playerclass=druid charspec=guardian mainhand=${two_hand_staff}"

"playerclass=hunter charspec=beast_mastery mainhand=${two_hand_bow}"
"playerclass=hunter charspec=marksmanship mainhand=${two_hand_bow}"
"playerclass=hunter charspec=survival mainhand=${two_hand_bow}"

"playerclass=mage charspec=arcane mainhand=${two_hand_staff}"
"playerclass=mage charspec=fire mainhand=${two_hand_staff}"
"playerclass=mage charspec=frost mainhand=${two_hand_staff}"

"playerclass=monk charspec=brewmaster mainhand=${two_hand_staff}"
"playerclass=monk charspec=windwalker mainhand=${one_hand_sword} offhand=${one_hand_sword}"

"playerclass=paladin charspec=protection mainhand=${one_hand_sword} offhand=${shield}"
"playerclass=paladin charspec=retribution mainhand=${two_hand_sword}"

"playerclass=priest charspec=shadow mainhand=${two_hand_staff}"

"playerclass=rogue charspec=assassination mainhand=${one_hand_dagger} offhand=${one_hand_dagger}"
"playerclass=rogue charspec=outlaw mainhand=${one_hand_dagger} offhand=${one_hand_dagger}"
"playerclass=rogue charspec=subtlety mainhand=${one_hand_dagger} offhand=${one_hand_dagger}"

"playerclass=shaman charspec=enhancement mainhand=${one_hand_sword} offhand=${one_hand_sword}"
"playerclass=shaman charspec=elemental mainhand=${two_hand_staff}"

"playerclass=warrior charspec=arms mainhand=${two_hand_sword}"
"playerclass=warrior charspec=fury mainhand=${one_hand_sword} offhand=${one_hand_sword}"
"playerclass=warrior charspec=protection mainhand=${one_hand_sword} offhand=${shield}"

"playerclass=warlock charspec=affliction mainhand=${two_hand_staff}"
"playerclass=warlock charspec=demonology mainhand=${two_hand_staff}"
"playerclass=warlock charspec=destruction mainhand=${two_hand_staff}"
)

# Generate some placeholder APLs because simc doesn't have functional profiles
placeholders=(
"playerclass=deathknight charspec=blood"
"playerclass=monk charspec=brewmaster"
)

BASE_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
cd "${BASE_DIR}"

if [[ ! -d "simc/.git" ]] ; then
    git clone --depth=1 https://github.com/simulationcraft/simc
fi

LAST_BRANCH=$(cd "${BASE_DIR}/simc" && git rev-parse --abbrev-ref HEAD)

create_apl_file() {
    local OUTFILE=$1
    [[ ! -d "$(dirname "${OUTFILE}")" ]] && mkdir -p "$(dirname "${OUTFILE}")"
    echo 'local _, internal = ...' >> ${OUTFILE}
    echo 'internal.apls = internal.apls or {}' >> ${OUTFILE}
    echo >> ${OUTFILE}
}

append_action_profile() {
    local branch=$1
    local playerclass=$2
    local charspec=$3
    local simcfile=$4

    local OUTFILE="${BASE_DIR}/ActionProfileLists/actions-${playerclass}.lua"
    [[ ! -f "${OUTFILE}" ]] && create_apl_file "${OUTFILE}"
    DATA=$(cat "${simcfile}" | grep -P '^action')

    if [[ ! -z "${DATA}" ]] ; then
        echo "internal.apls[\"${branch}::${playerclass}::${charspec}\"] = [[" >> ${OUTFILE}
        echo "${DATA}" >> ${OUTFILE}
        echo "]]" >> ${OUTFILE}
        echo >> ${OUTFILE}

        "${BASE_DIR}/parse-apls.sh" "${simcfile}" > "Temp/${branch}-${playerclass}_${charspec}.parsed.txt" 2>"Temp/${branch}-error_${playerclass}_${charspec}.parsed.txt"
        [[ ! -s "Temp/${branch}-error_${playerclass}_${charspec}.parsed.txt" ]] && rm "Temp/${branch}-error_${playerclass}_${charspec}.parsed.txt"
    fi
}

append_action_profiles_from_branch() {
    local BRANCH=$1
    local -a classspec
    IFS=' ' read -r -a classspec <<< "$2"
    for arg in "${classspec[@]}" ; do echo ${arg} ; eval local ${arg} ; done

    local mh=""; [[ ! -z "${mainhand}" ]] && mh="main_hand=,id=${mainhand}"
    local oh=""; [[ ! -z "${offhand}" ]] && oh="off_hand=,id=${offhand}"

    OIFS=$IFS
    IFS=$'\r\n'
    if [[ "${BRANCH}" != "${LAST_BRANCH}" ]] ; then
        (cd "${BASE_DIR}/simc" && git reset --hard HEAD && git clean -xfd && git checkout "${BRANCH}" && git pull)
        LAST_BRANCH="${BRANCH}"
    fi
    IFS=$OIFS

    (cd "${BASE_DIR}/simc/engine" && make -j15 OS=UNIX)

    [[ ! -d "${BASE_DIR}/Temp" ]] && mkdir -p "${BASE_DIR}/Temp"
    local NEW_SIMC_FILE="${BASE_DIR}/Temp/${BRANCH}-${playerclass}_${charspec}.simc"
    "${BASE_DIR}/simc/engine/simc" ${playerclass}=${playerclass}_${charspec} level=110 spec=${charspec} ${mh} ${oh} "save=${NEW_SIMC_FILE}"

    append_action_profile ${BRANCH} ${playerclass} ${charspec} "${NEW_SIMC_FILE}"
}

append_placeholder_profile() {
    local -a classspec
    IFS=' ' read -r -a classspec <<< "$1"
    for arg in "${classspec[@]}" ; do echo ${arg} ; eval local ${arg} ; done

    [[ ! -d "${BASE_DIR}/Temp" ]] && mkdir -p "${BASE_DIR}/Temp"
    local SIMC_FILE="${BASE_DIR}/Placeholders/${playerclass}_${charspec}.simc"
    append_action_profile placeholder ${playerclass} ${charspec} "${SIMC_FILE}"
}

[[ -d "${BASE_DIR}/Temp" ]] && find "${BASE_DIR}/Temp" -type f -delete
[[ ! -d "${BASE_DIR}/Temp" ]] && mkdir -p "${BASE_DIR}/Temp"
[[ -d "${BASE_DIR}/ActionProfileLists" ]] && find "${BASE_DIR}/ActionProfileLists" -type f -delete
[[ ! -d "${BASE_DIR}/ActionProfileLists" ]] && mkdir -p "${BASE_DIR}/ActionProfileLists"

for classspec in "${allspecs[@]}" ; do
    append_action_profiles_from_branch legion-dev "${classspec}"
done
for classspec in "${placeholders[@]}" ; do
    append_placeholder_profile "${classspec}"
done

echo '<Ui xmlns="http://www.blizzard.com/wow/ui/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.blizzard.com/wow/ui/' > ActionProfileLists/all.xml
echo '..\FrameXML\UI.xsd">' >> ActionProfileLists/all.xml
for file in $(gfind ActionProfileLists -mindepth 1 -maxdepth 1 \( -iname 'actions-*.lua' \) | sort) ; do
    echo "    <Script file=\"$(basename "${file}")\"/>" >> ActionProfileLists/all.xml
done
echo '</Ui>' >> ActionProfileLists/all.xml

echo '<Ui xmlns="http://www.blizzard.com/wow/ui/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.blizzard.com/wow/ui/' > Classes/all.xml
echo '..\FrameXML\UI.xsd">' >> Classes/all.xml
for file in $(gfind Classes -mindepth 1 -maxdepth 1 \( -iname 'Class-*.lua' \) | sort) ; do
    echo "    <Script file=\"$(basename "${file}")\"/>" >> Classes/all.xml
done
echo '</Ui>' >> Classes/all.xml


./cleanup.sh
./test-parser.sh
