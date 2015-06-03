#!/bin/bash
find . -type f -exec chmod -x "{}" \;
chmod +x *.sh
for file in *.lua ; do
    dos2unix $file
    chmod -x $file
    sed -i 's/[ \t]*$//' $file
    sed -i 's/local doDebug = true/local doDebug = false/' $file
done
