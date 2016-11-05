#!/bin/bash

tjfind() {
    find . \( "$@" \) -and -not -path './.git/*' -and -not -path '*__pycache__*' -and -not -path '*PythonEnvironment*' -and -not -path './simc*' -and -not -path './Temp*' -print
}

for file in $(tjfind -type f) ; do
    echo ${file}
    chmod -x "${file}"
done

for file in $(tjfind -iname '*.toc' -or -iname '*.lua' -or -iname '*.sh' -or -iname '*.py' -or -iname '*.simc') ; do
    dos2unix $file
    chmod -x $file
    sed -i 's/[ \t]*$//' $file
    sed -i 's/^local devMode = true/local devMode = false/' $file
done

for file in $(tjfind -iname '*.lua') ; do
    luaformatter -a -s4 "${file}"
done

for file in $(tjfind -iname '*.sh' -or -iname '*.py') ; do
    dos2unix $file
    chmod +x $file
done
