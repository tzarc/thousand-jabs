#!/bin/bash
find . -type f -exec chmod -x "{}" \;
chmod +x *.sh
for file in *.toc *.lua *.xml *.sh ; do
    dos2unix $file
    chmod -x $file
    sed -i 's/[ \t]*$//' $file
    sed -i 's/^local devMode = true/local devMode = false/' $file
done

for file in *.sh ; do
    chmod +x $file
done
