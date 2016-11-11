#!/bin/bash

if [[ -z $1 ]] ; then
    LATEST_TAG=$(git tag | grep -P '[0-9]{5}\.[0-9]{3}' | sort | tail -n1)
    TAG_HI=$(echo $LATEST_TAG | cut -d'.' -f1)
    TAG_LO=$(echo $LATEST_TAG | cut -d'.' -f2 | sed -e 's#^0*##g')
    TAG_LO=$(($TAG_LO + 1))
    NEW_TAG="$(printf "%d.%03d" ${TAG_HI} ${TAG_LO})"
else
    NEW_TAG=$1
fi

# Update the Version: tag in the toc
sed -i "s#Version: \([v0-9\.]\+\)#Version: ${NEW_TAG}#" ThousandJabs.toc
git diff
echo "--------------------"
echo "git commit -am \"Commit for ${NEW_TAG}.\""
echo "git tag -a \"${NEW_TAG}\" -m \"Tagging ${NEW_TAG}.\""
echo "git push curseforge master tag \"${NEW_TAG}\""
echo "git push github --tags"
