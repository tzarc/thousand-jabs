#!/bin/bash
find . ActionProfileLists Classes -mindepth 1 -maxdepth 1 -type f -exec chmod -x "{}" \; -print
chmod +x *.sh
for file in *.toc *.lua *.sh ActionProfileLists/*.xml ActionProfileLists/*.lua Classes/*.xml Classes/*.lua ; do
    dos2unix $file
    chmod -x $file
    sed -i 's/[ \t]*$//' $file
    sed -i 's/^local devMode = true/local devMode = false/' $file
done

for file in *.lua Libs/*.lua ActionProfileLists/*.lua Classes/*.lua ; do
    luaformatter -a -s4 "${file}"
done

for file in *.sh *.py ; do
    dos2unix $file
    chmod +x $file
done
