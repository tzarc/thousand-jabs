#!/bin/bash

BASE_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
cd "${BASE_DIR}"
OUTPUT_FILE="${BASE_DIR}/ActionProfileLists/equipped.lua"


# Work out all the equipped items
equipped_items=$(cat ActionProfileLists/*.lua | grep -P 'equipped\.[a-z][a-zA-Z0-9_]+' -o | sed -e 's#equipped\.##g' | sort | uniq)

echo 'local _, internal = ...' > "${OUTPUT_FILE}"
echo 'internal.equipped_mapping = internal.equipped_mapping or {}' >> ${OUTPUT_FILE}
echo >> "${OUTPUT_FILE}"

OIFS=$IFS
IFS=$'\n'
for item in ${equipped_items} ; do
    echo -n "internal.equipped_mapping.${item} = { " >> ${OUTPUT_FILE}
    url="http://ptr.wowhead.com/items/name:$(echo ${item} | sed -e 's#_#+#g')/slot:16:18:5:8:11:10:1:23:7:21:2:22:13:24:15:28:14:4:3:19:25:12:17:6:9"
    echo "Item: ${item} - ${url}"
    output=$(wget -O- "${url}" 2>&1)

    allitems=$(echo "${output}" | grep -P '_\[\d+\]' -o | sed "s#_\[\(.*\)\]#\1#g")
    for itemid in ${allitems} ; do
        echo -n "${itemid}, " >> ${OUTPUT_FILE}
    done

    echo "}" >> ${OUTPUT_FILE}
done
IFS=$OIFS
