#!/bin/bash
find . -type f -exec chmod -x "{}" \;
chmod +x *.sh
for file in *.toc *.lua *.sh ActionProfileLists/*.xml ActionProfileLists/*.lua Classes/*.xml Classes/*.lua ; do
    dos2unix $file
    chmod -x $file
    sed -i 's/[ \t]*$//' $file
    sed -i 's/^local devMode = true/local devMode = false/' $file
    sed -i 's/^internal.allowMemoryDisplay = true/internal.allowMemoryDisplay = false/' $file
done

for file in *.lua ActionProfileLists/*.lua Classes/*.lua ; do
    luaformatter -a -s4 "${file}"
done

for file in *.sh ; do
    chmod +x $file
done
