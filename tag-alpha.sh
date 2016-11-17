#!/bin/bash

if [[ -z $1 ]] ; then
    LATEST_TAG=$(git for-each-ref --sort=taggerdate --format '%(refname) %(taggerdate)' refs/tags | grep -v alpha | sed -e 's#refs/tags/##g' | awk '{print $1}' | tail -n1)
    echo LATEST_TAG=$LATEST_TAG
    TAG_HI=$(echo $LATEST_TAG | cut -d'.' -f1)
    TAG_LO=$(echo $LATEST_TAG | cut -d'.' -f2 | sed -e 's#^0*##g' -e 's#-alpha.*##g')
    TAG_LO=$(($TAG_LO + 1))
    NEXT_TAG=$(printf "%d.%03d" ${TAG_HI} ${TAG_LO})
    echo NEXT_TAG=${NEXT_TAG}

    LATEST_ALPHA=$(git tag 2>&1 | grep -P "${NEXT_TAG}" | grep -vP "^${NEXT_TAG}$")
    [[ -z ${LATEST_ALPHA} ]] && LATEST_ALPHA=${NEXT_TAG}-alpha.000
    echo LATEST_ALPHA=$LATEST_ALPHA

    ALPHA_VER=$(echo $LATEST_ALPHA | cut -d'.' -f3 | sed -e 's#^0*##g')
    [[ -z ${ALPHA_VER} ]] && ALPHA_VER=0
    ALPHA_VER=$(($ALPHA_VER + 1))
    echo ALPHA_VER=$ALPHA_VER

    NEW_TAG="$(printf "%d.%03d-alpha.%03d" ${TAG_HI} ${TAG_LO} ${ALPHA_VER})"
    echo NEW_TAG=$NEW_TAG
else
    NEW_TAG=$1
fi
echo
echo "git commit -am \"Commit for ${NEW_TAG}.\""
echo "git tag -a \"${NEW_TAG}\" -m \"Tagging ${NEW_TAG}.\""
echo "git push origin"
echo "git push origin --tags"
