#!/bin/bash

if [[ -z $1 ]] ; then
    LATEST_TAG=$(git for-each-ref --sort=taggerdate --format '%(refname) %(taggerdate)' refs/tags | tail -n1 | cut -d'/' -f3 | cut -d' ' -f1)
    LATEST_BASE_TAG=$(echo $LATEST_TAG | cut -d'-' -f1)

    echo LATEST_TAG=$LATEST_TAG
    echo LATEST_BASE_TAG=$LATEST_BASE_TAG

    TAG_HI=$(echo $LATEST_TAG | cut -d'.' -f1)
    TAG_LO=$(($(echo $LATEST_TAG | cut -d'.' -f2 | sed -e 's#^0*##g' -e 's#-alpha.*##g') + 0))
    echo TAG_HI=$TAG_HI
    echo TAG_LO=$TAG_LO

    case "$LATEST_TAG" in
        *alpha*)
            # No change to tag
            ;;
        *)
            # Latest tag wasn't an alpha, we need to bump...
            TAG_LO=$(($TAG_LO + 1))
            ;;
    esac

    NEXT_TAG=$(printf "%d.%03d" ${TAG_HI} ${TAG_LO})
    echo NEXT_TAG=${NEXT_TAG}

    CURRENT_ALPHA_COUNT=$(git for-each-ref --sort=taggerdate --format '%(refname) %(taggerdate)' refs/tags | grep -P "^refs/tags/$NEXT_TAG" | wc -l)

    NEW_TAG="$(printf "%d.%03d-alpha.%03d" ${TAG_HI} ${TAG_LO} ${CURRENT_ALPHA_COUNT})"
    echo NEW_TAG=$NEW_TAG

    echo
else
    NEW_TAG=$1
fi
echo "git commit -am \"Commit for ${NEW_TAG}.\""
echo "git tag -a \"${NEW_TAG}\" -m \"Tagging ${NEW_TAG}.\""
echo "git push origin"
echo "git push origin --tags"
