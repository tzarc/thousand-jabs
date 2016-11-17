#!/bin/bash

if [[ -z $1 ]] ; then
    LATEST_TAG=$(git for-each-ref --sort=taggerdate --format '%(refname) %(taggerdate)' refs/tags | grep -v alpha | sed -e 's#refs/tags/##g' | awk '{print $1}' | tail -n1)
    echo LATEST_TAG=$LATEST_TAG
    TAG_HI=$(echo $LATEST_TAG | cut -d'.' -f1)
    TAG_LO=$(echo $LATEST_TAG | cut -d'.' -f2 | sed -e 's#^0*##g' -e 's#-alpha.*##g')
    TAG_LO=$(($TAG_LO + 1))
    NEXT_TAG=$(printf "%d.%03d" ${TAG_HI} ${TAG_LO})
    echo NEXT_TAG=${NEXT_TAG}
else
    NEXT_TAG=$1
    echo NEXT_TAG=${NEXT_TAG}
fi

# Update the Version: tag in the toc
sed -i "s#Version: \([v0-9\.]\+\)#Version: ${NEXT_TAG}#" ThousandJabs.toc
git diff
echo "--------------------"
echo "git commit -am \"Commit for ${NEXT_TAG}.\""
echo "git tag -a \"${NEXT_TAG}\" -m \"Tagging ${NEXT_TAG}.\""
echo "git push origin"
echo "git push origin --tags"
