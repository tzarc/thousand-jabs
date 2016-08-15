#!/bin/bash

bump_lib() {
    LIB_FILE="$1"
    LIB_NAME=$(basename "${LIB_FILE}" .lua)
    CUR_VERSION=$(grep 'local MAJOR, MINOR' "${LIB_FILE}" | cut -d',' -f3 | sed -e 's#[\s\r\n]*##g')
    NEW_VERSION=$((${CUR_VERSION} + 1))
    [[ -z ${NEW_VERSION} ]] && echo "Failed to increase version." && exit 1
    sed -i "s#local MAJOR, MINOR = \"${LIB_NAME}\", \([0-9]\+\)#local MAJOR, MINOR = \"${LIB_NAME}\", ${NEW_VERSION}#" "${LIB_FILE}"
}

if [[ -z $1 ]] ; then
    LATEST_TAG=$(git tag | grep -v '^v' | sort | tail -n1)
    TAG_HI=$(echo $LATEST_TAG | cut -d'.' -f1)
    TAG_LO=$(echo $LATEST_TAG | cut -d'.' -f2 | sed -e 's#^0*##g')
    TAG_LO=$(($TAG_LO + 1))
    NEW_TAG="$(printf "%d.%02d" ${TAG_HI} ${TAG_LO})"
else
    NEW_TAG=$1
fi

bump_lib LibProfiling-1.0.lua
bump_lib LibTableCache-1.0.lua
bump_lib LibUnitCache-1.0.lua

# Update the Version: tag in the toc
sed -i "s#Version: \([v0-9\.]\+\)#Version: ${NEW_TAG}#" ThousandJabs.toc
git diff
echo "--------------------"
echo "git commit -am \"Commit for ${NEW_TAG}.\""
echo "git tag -a \"${NEW_TAG}\" -m \"Tagging ${NEW_TAG}.\""
echo "git push curseforge master tag \"${NEW_TAG}\""