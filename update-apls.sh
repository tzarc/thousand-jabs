#!/bin/bash

BASE_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
cd "${BASE_DIR}"

LAST_BRANCH=zzzzzzzzzzzzzzzzzzzz

if [[ ! -d "simc/.git" ]] ; then
    git clone https://github.com/simulationcraft/simc
fi

create_apl_file() {
    OUTFILE=$1
    echo 'local _, internal = ...' >> ${OUTFILE}
    echo 'internal.apls = internal.apls or {}' >> ${OUTFILE}
    echo >> ${OUTFILE}
}

append_action_profiles_from_dir() {
    BRANCH=$1
    TIER_DIR="$(readlink -f "$2")"
    CLASS=$3
    OUTFILE="ActionProfileLists/ActionProfileLists-${CLASS}.lua"
    [[ ! -f ${OUTFILE} ]] && create_apl_file ${OUTFILE}
    OIFS=$IFS
    IFS=$'\r\n'
    for file in $(gfind "${TIER_DIR}" \( -iname '*.simc' -and -iname "${CLASS}*" \) | sort) ; do
        BN=$(basename "$file")
        BN=${BN%.simc}
        DATA=$(cat "${file}" | grep -P '^action')
        TD=$(basename "${TIER_DIR}")
        if [[ ! -z "${DATA}" ]] ; then
            echo "${file}"
            echo "internal.apls[\"${BRANCH}::${TD}::${BN}\"] = [[" >> ${OUTFILE}
            echo "${DATA}" >> ${OUTFILE}
            echo "]]" >> ${OUTFILE}
            echo >> ${OUTFILE}
        fi
    done
    IFS=$OIFS
}

append_action_profiles_from_branch() {
    BRANCH=$1
    TIER=$2
    CLASS=$3
    OIFS=$IFS
    IFS=$'\r\n'
    if [[ "${BRANCH}" != "${LAST_BRANCH}" ]] ; then
        (cd "${BASE_DIR}/simc" && git reset --hard HEAD && git clean -xfd && git checkout "${BRANCH}" && git pull)
        LAST_BRANCH="${BRANCH}"
    fi
    if [[ -z "${TIER}" ]] ; then
        for tier_dir in $(gfind "${BASE_DIR}/simc/profiles" -mindepth 1 -maxdepth 1 -type d -name 'Tier*' | sort) ; do
            append_action_profiles_from_dir "${BRANCH}" "${tier_dir}" "${CLASS}"
        done
    else
        FULL_TIER_DIR="${BASE_DIR}/simc/profiles/${TIER}"
        if [[ -d "${FULL_TIER_DIR}" ]] ; then
            append_action_profiles_from_dir "${BRANCH}" "${FULL_TIER_DIR}" "${CLASS}"
        fi
    fi
    IFS=$OIFS
}

gfind ./ActionProfileLists/ -mindepth 1 -maxdepth 1 \( -iname 'ActionProfileLists-*.lua' \) -delete

for tier in Tier19P Tier19H legion ; do
    for class in Death_Knight Demon_Hunter Druid Hunter Mage Monk Paladin Priest Rogue Shaman Warlock Warrior ; do
        append_action_profiles_from_branch legion-dev ${tier} ${class}
    done
done

echo '<Ui xmlns="http://www.blizzard.com/wow/ui/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.blizzard.com/wow/ui/' > ActionProfileLists/all.xml
echo '..\FrameXML\UI.xsd">' >> ActionProfileLists/all.xml
for file in $(gfind ActionProfileLists -mindepth 1 -maxdepth 1 \( -iname 'ActionProfileLists-*.lua' \) | sort) ; do
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