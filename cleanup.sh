#!/bin/bash
find . -type f -and -not -path './.git/*' -and -not -path '*PythonEnvironment*' -and -not -path './simc*' -exec chmod -x "{}" \; -print

for file in $(find . \( -iname '*.toc' -or -iname '*.lua' -or -iname '*.sh' -or -iname '*.py' \) -and -not -path './.git' -and -not -path '*PythonEnvironment*' -and -not -path './simc*') ; do
    dos2unix $file
    chmod -x $file
    sed -i 's/[ \t]*$//' $file
    sed -i 's/^local devMode = true/local devMode = false/' $file
done

for file in $(find . \( -iname '*.lua' \) -and -not -path './.git' -and -not -path '*PythonEnvironment*' -and -not -path './simc*') ; do
    luaformatter -a -s4 "${file}"
done

for file in $(find . \( -iname '*.sh' -or -iname '*.py' \) -and -not -path './.git' -and -not -path '*PythonEnvironment*' -and -not -path './simc*') ; do
    dos2unix $file
    chmod +x $file
done
