#!/bin/bash

set -e

# Weapons/shields so that we can generate simc profiles
one_hand_sword=2027 # Scimitar
one_hand_dagger=4565 # Simple Dagger
two_hand_sword=1194 # Bastard Sword
two_hand_staff=2132 # Short Staff
two_hand_bow=8179 # Cadet's Bow
shield=17190 # Ornate Buckler

# Class/spec combos to generate action lists for, talents retrieved from Wowhead's artifact calculator, with the extra ability enabled:
allspecs=(
"playerclass=deathknight charspec=blood mainhand=128402 artifact=15:0:0:0:0:289:1"
"playerclass=deathknight charspec=frost mainhand=128292 offhand=128293 artifact=12:0:0:0:0:122:1"
"playerclass=deathknight charspec=unholy mainhand=128403 artifact=16:0:0:0:0:149:1"

"playerclass=demonhunter charspec=vengeance mainhand=128832 offhand=128831 artifact=60:0:0:0:0:1096:1"
"playerclass=demonhunter charspec=havoc mainhand=127829 offhand=127830 artifact=3:0:0:0:0:1010:1"

"playerclass=druid charspec=balance mainhand=128858 artifact=59:0:0:0:0:1049:1"
"playerclass=druid charspec=feral mainhand=128860 offhand=128859 artifact=58:0:0:0:0:1153:1"
"playerclass=druid charspec=guardian mainhand=128821 offhand=128822 artifact=57:0:0:0:0:960:1"

"playerclass=hunter charspec=beast_mastery mainhand=128861 artifact=56:0:0:0:0:881:1"
"playerclass=hunter charspec=marksmanship mainhand=128826 artifact=55:0:0:0:0:307:1"
"playerclass=hunter charspec=survival mainhand=128808 artifact=34:0:0:0:0:1068:1"

"playerclass=mage charspec=arcane mainhand=127857 artifact=4:0:0:0:0:290:1"
"playerclass=mage charspec=fire mainhand=128820 offhand=133959 artifact=54:0:0:0:0:748:1"
"playerclass=mage charspec=frost mainhand=128862 artifact=53:0:0:0:0:783:1"

"playerclass=monk charspec=brewmaster mainhand=128938 artifact=52:0:0:0:0:1277:1"
"playerclass=monk charspec=windwalker mainhand=128940 offhand=133948 artifact=50:0:0:0:0:831:1"

"playerclass=paladin charspec=protection mainhand=128867 offhand=128866 artifact=49:0:0:0:0:1120:1"
"playerclass=paladin charspec=retribution mainhand=120978 artifact=2:0:0:0:0:40:1"

"playerclass=priest charspec=shadow mainhand=128827 offhand=133958 artifact=47:0:0:0:0:764:1"

"playerclass=rogue charspec=assassination mainhand=128870 offhand=128869 artifact=43:0:0:0:0:346:1"
"playerclass=rogue charspec=outlaw mainhand=128872 offhand=134552 artifact=44:0:0:0:0:1052:1"
"playerclass=rogue charspec=subtlety mainhand=128476 offhand=128479 artifact=17:0:0:0:0:851:1"

"playerclass=shaman charspec=enhancement mainhand=128819 offhand=128873 artifact=41:0:0:0:0:899:1"
"playerclass=shaman charspec=elemental mainhand=128935 offhand=128936 artifact=40:0:0:0:0:291:1"

"playerclass=warlock charspec=affliction mainhand=128942 artifact=39:0:0:0:0:999:1"
"playerclass=warlock charspec=demonology mainhand=137246 offhand=128943 artifact=37:0:0:0:0:1170:1"
"playerclass=warlock charspec=destruction mainhand=128941 artifact=38:0:0:0:0:803:1"

"playerclass=warrior charspec=arms mainhand=128910 artifact=36:0:0:0:0:1136:1"
"playerclass=warrior charspec=fury mainhand=128908 offhand=134553 artifact=35:0:0:0:0:984:1"
"playerclass=warrior charspec=protection mainhand=128288 offhand=128289 artifact=11:0:0:0:0:91:1"
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
        lua "${BASE_DIR}/Simc-Expressions.lua" < "${simcfile}" >"Temp/${branch}-${playerclass}_${charspec}.parsed.txt" 2>"Temp/${branch}-${playerclass}_${charspec}.errors.txt"
        [[ ! -s "Temp/${branch}-${playerclass}_${charspec}.errors.txt" ]] && rm "Temp/${branch}-${playerclass}_${charspec}.errors.txt"

        echo "internal.apls['${branch}::${playerclass}::${charspec}'] = [[" >> "${OUTFILE}"
        cat "${simcfile}" | grep -P '^action' >> "${OUTFILE}"
        echo "]]" >> "${OUTFILE}"
        echo >> "${OUTFILE}"
    fi
}

append_action_profiles_from_branch() {
    local BRANCH=$1
    local -a classspec
    IFS=' ' read -r -a classspec <<< "$2"
    for arg in "${classspec[@]}" ; do echo ${arg} ; eval local ${arg} ; done

    local mh=""; [[ ! -z "${mainhand}" ]] && mh="main_hand=,id=${mainhand}"
    local oh=""; [[ ! -z "${offhand}" ]] && oh="off_hand=,id=${offhand}"
    local af=""; [[ ! -z "${artifact}" ]] && af="artifact=${artifact}"

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
    "${BASE_DIR}/simc/engine/simc" ${playerclass}=${playerclass}_${charspec} level=110 spec=${charspec} ${mh} ${oh} ${af} "save=${NEW_SIMC_FILE}" >/dev/null 2>&1

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

echo '<Ui xmlns="http://www.blizzard.com/wow/ui/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.blizzard.com/wow/ui/' > "${BASE_DIR}/ActionProfileLists/all.xml"
echo '..\FrameXML\UI.xsd">' >> "${BASE_DIR}/ActionProfileLists/all.xml"
for file in $(gfind ActionProfileLists -mindepth 1 -maxdepth 1 \( -iname 'actions-*.lua' \) | sort) ; do
    echo "    <Script file=\"$(basename "${file}")\"/>" >> "${BASE_DIR}/ActionProfileLists/all.xml"
done
echo '</Ui>' >> "${BASE_DIR}/ActionProfileLists/all.xml"

echo '<Ui xmlns="http://www.blizzard.com/wow/ui/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.blizzard.com/wow/ui/' > "${BASE_DIR}/Classes/all.xml"
echo '..\FrameXML\UI.xsd">' >> "${BASE_DIR}/Classes/all.xml"
for file in $(gfind Classes -mindepth 1 -maxdepth 1 \( -iname 'Class-*.lua' \) | sort) ; do
    echo "    <Script file=\"$(basename "${file}")\"/>" >> "${BASE_DIR}/Classes/all.xml"
done
echo '</Ui>' >> "${BASE_DIR}/Classes/all.xml"


"${BASE_DIR}/cleanup.sh"

grep -ir ERROR "${BASE_DIR}/ActionProfileLists" || true
grep -ir ERROR "${BASE_DIR}/Temp" || true
find "${BASE_DIR}/Temp" -iname '*error*' || true
