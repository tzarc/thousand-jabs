#!/bin/bash

set -e

tjfind() {
    find . \( "$@" \) -and -not -path './.git/*' -and -not -path '*__pycache__*' -and -not -path '*PythonEnvironment*' -and -not -path './simc*' -and -not -path './Temp*' -print | sort
}

for file in $(tjfind -type f) ; do
    chmod -x "${file}"
done

for file in $(tjfind -iname '*.toc' -or -iname '*.lua' -or -iname '*.sh' -or -iname '*.py' -or -iname '*.simc') ; do
    dos2unix $file >/dev/null 2>&1
    chmod -x $file >/dev/null 2>&1
    sed -i 's/[ \t]*$//' $file
    sed -i 's/^local devMode = true/local devMode = false/' $file
done

for file in $(tjfind -iname '*.lua') ; do
    echo "Formatting '${file}'..."
    luaformatter -a -s4 "${file}"
done

for file in $(tjfind -iname '*.sh' -or -iname '*.pl') ; do
    dos2unix $file >/dev/null 2>&1
    chmod +x $file >/dev/null 2>&1
done

for file in $(tjfind -iname '*.pl') ; do
    perltidy -b -pt=0 -l=200 "${file}"
done
