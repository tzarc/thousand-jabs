#!/bin/bash

echo "local _, private = ..." > ActionProfileLists.lua
echo "private.apls = {}" >> ActionProfileLists.lua
echo ""  >> ActionProfileLists.lua

OIFS=$IFS
IFS=$'\n'
for file in $(find ../simulationcraft/source/profiles/Tier17M -name '*.simc' -not -name 'generate*' | sort) ; do
  FN=$(readlink -f $file)
  CONTENTS=$(cat "$file")
  ACTIONS=$(echo -e "${CONTENTS}" | grep -P '^action')
  if [[ ! -z "${ACTIONS}" ]] ; then
    echo "private.apls[\"$(basename ${FN})\"] = [[" >> ActionProfileLists.lua
    echo -e "${ACTIONS}" >> ActionProfileLists.lua
    echo "]]" >> ActionProfileLists.lua
    echo ""  >> ActionProfileLists.lua
  fi
done
IFS=$OIFS

dos2unix ActionProfileLists.lua