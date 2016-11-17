#!/bin/bash

if [[ -z $1 ]] ; then
    LATEST_TAG=$(git describe --abbrev=0 | sed -e 's#-alpha.*##g')
    LATEST_ALPHA=$(git tag | grep -P "${LATEST_TAG}" | grep -vP "^${LATEST_TAG}$")
    [[ -z ${LATEST_ALPHA} ]] && LATEST_ALPHA=${LATEST_TAG}-alpha.000
    TAG_LO=$(echo $LATEST_ALPHA | cut -d'.' -f3 | sed -e 's#^0*##g')
    [[ -z ${TAG_LO} ]] && TAG_LO=0
    TAG_LO=$(($TAG_LO + 1))
    NEW_TAG="$(printf "%s-alpha.%03d" ${LATEST_TAG} ${TAG_LO})"
else
    NEW_TAG=$1
fi

echo "git commit -am \"Commit for ${NEW_TAG}.\""
echo "git tag -a \"${NEW_TAG}\" -m \"Tagging ${NEW_TAG}.\""
echo "git push origin"
echo "git push origin --tags"
