#!/bin/bash

set -e

SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
cd "${SCRIPT_DIR}"

tjfind() {
    find . \( "$@" \) -and -not -path './.git/*' -and -not -path './simc*' -and -not -path './Temp*' -print | sort
}

# Remove executable flag on all files
tjfind -type f | parallel "chmod -x '{1}'"

# Remove trailing whitespace
tjfind -iname '*.toc' -or -iname '*.lua' -or -iname '*.sh' -or -iname '*.py' -or -iname '*.simc' | parallel "sed -i 's/[ \t]*\$//' '{1}'"

# Disable devMode
tjfind -iname '*.lua' | parallel "sed -i 's/^local devMode = true/local devMode = false/' '{1}'"

# Reformat lua files
tjfind -iname '*.lua' | parallel "echo \"Formatting '{1}'\" && luaformatter -a -s4 '{1}'"

# Reformat perl scripts
tjfind -iname '*.pl' | parallel "perltidy -pt=2 -dws -nsak='if for while' -l=200 '{1}' && cat '{1}.tdy' > '{1}' && rm '{1}.tdy'"

# Make sure everything has Unix line endings
tjfind -iname '*.toc' -or -iname '*.lua' -or -iname '*.sh' -or -iname '*.pl' -or -iname '*.simc' | parallel "dos2unix '{1}' >/dev/null 2>&1"

# Make sure scripts are executable
tjfind -iname '*.sh' -or -iname '*.pl' | parallel "chmod +x '{1}'"

if [[ ! -L "${SCRIPT_DIR}/.git/hooks/pre-commit" ]] ; then
    (cd "${SCRIPT_DIR}/.git/hooks" && ln -sf ../../cleanup.sh pre-commit)
fi

[[ ! -z "$(git diff)" ]] && echo -e "\e[0;37m[\e[1;31mFAIL\e[0;37m]\e[0m Aborting commit: 'git diff' says changes are still present." && exit 1
exit 0
