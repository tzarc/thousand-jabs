#!/bin/bash

if [[ -z $1 ]] ; then
    LATEST_TAG=$(git tag | grep -v '^v' | sort | tail -n1)
    TAG_HI=$(echo $LATEST_TAG | cut -d'.' -f1)
    TAG_LO=$(echo $LATEST_TAG | cut -d'.' -f2)
    TAG_BUILD=$(echo $LATEST_TAG | cut -d'.' -f3)
    NEW_BUILD=$(($TAG_BUILD + 1))
    NEW_TAG="${TAG_HI}.${TAG_LO}.${NEW_BUILD}"
else
    NEW_TAG=$1
fi

# Update the Version: tag in the toc
sed -i "s#Version: \([v0-9\.]\+\)#Version: ${NEW_TAG}#" ThousandJabs.toc
git diff
echo "--------------------"
echo "git commit -am \"Commit for ${NEW_TAG}.\""
echo "git tag -a \"${NEW_TAG}\" -m \"Tagging ${NEW_TAG}.\""
echo "git push origin master tag \"${NEW_TAG}\""