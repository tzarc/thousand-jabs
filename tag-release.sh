#!/bin/bash

if [[ -z $1 ]] ; then
    LATEST_TAG=$(git describe --exact-match --abbrev=0 | sed -e 's#-alpha.*##g')
    TAG_HI=$(echo $LATEST_TAG | cut -d'.' -f1)
    TAG_LO=$(echo $LATEST_TAG | cut -d'.' -f2 | sed -e 's#^0*##g' -e 's#-alpha.*##g')
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
echo "git push origin"
echo "git push origin --tags"
