#!/bin/bash

set -e

SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
cd "${SCRIPT_DIR}"

nsudo() { [[ ${EUID} -ne 0 ]] && echo "sudo" ; true ; }
havecmd()  { command command type "${1}" >/dev/null 2>&1 || return 1 ; }

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

check_dependencies() {
	if [[ "$(uname -s)" == "Linux" ]] ; then
		if havecmd dnf ; then # Debian / Ubuntu etc.
			if ! havecmd parallel ; then $(nsudo) dnf install -y parallel; fi
			if ! havecmd dos2unix ; then $(nsudo) dnf install -y dos2unix; fi
			if ! havecmd perltidy ; then $(nsudo) dnf install -y perltidy; fi

			nvm use --lts
			if ! havecmd luafmt ; then npm install -g lua-fmt; fi
		fi
	fi

	if ! havecmd dos2unix || ! havecmd parallel || ! havecmd luafmt ; then
		echo_fail "Aborting cleanup, missing dependencies."
		exit 1
	fi

	if [[ ! -d "${SCRIPT_DIR}/.packager/.git" ]] ; then
		git clone https://github.com/BigWigsMods/packager.git "${SCRIPT_DIR}/.packager"
	fi
	pushd "${SCRIPT_DIR}/.packager" >/dev/null 2>&1 \
		&& { pwd && git pull --ff-only || true ; } \
		&& popd >/dev/null 2>&1
}

tjfind() {
    find . \( "$@" \) -and -not -path './.git/*' -and -not -path './simc*' -and -not -path './.release/*' -and -not -path './.packager/*' -print | sort
}

check_dependencies

# Remove executable flag on all files
tjfind -type f | parallel "chmod -x '{1}'"

# Make sure scripts are executable
tjfind -iname '*.sh' -or -iname '*.pl' -or -iname '*.py' | parallel "chmod +x '{1}'"

# Make sure everything has Unix line endings
tjfind -iname '*.toc' -or -iname '*.lua' -or -iname '*.sh' -or -iname '*.pl' -or -iname '*.py' -or -iname '*.simc' -or -iname '*.xml' -or -iname '*.cpp' -or -iname '*.h' -or -iname '*.hpp' -or -iname '*.inl' -or -iname '*.md' | parallel "dos2unix '{1}' >/dev/null 2>&1"

# Remove trailing whitespace
tjfind -iname '*.toc' -or -iname '*.lua' -or -iname '*.sh' -or -iname '*.pl' -or -iname '*.py' -or -iname '*.simc' -or -iname '*.cpp' -or -iname '*.h' -or -iname '*.hpp' -or -iname '*.inl' | parallel "sed -i 's/[ \t]*\$//' '{1}'"

# Reformat perl scripts
tjfind -iname '*.pl' | parallel "echo \"Formatting '{1}'\" && perltidy -pt=2 -dws -nsak='if for while' -l=200 '{1}' && cat '{1}.tdy' > '{1}' && rm '{1}.tdy'"

# Reformat lua files
tjfind -iname '*.lua' | parallel "echo \"Formatting '{1}'\" && luafmt --quotemark=single --use-tabs -w replace '{1}'"

# Reformat cpp files
tjfind -iname '*.cpp' -or -iname '*.h' -or -iname '*.hpp' -or -iname '*.inl' | parallel "echo \"Formatting '{1}'\" && clang-format -i '{1}'"

# Disable devMode
tjfind -iname '*.lua' | parallel "sed -i 's/^local devMode = true/local devMode = false/' '{1}'"

# Install this script as a pre-commit hook if it's not already present
if [[ ! -L "${SCRIPT_DIR}/.git/hooks/pre-commit" ]] ; then
    (cd "${SCRIPT_DIR}/.git/hooks" && ln -sf ../../cleanup.sh pre-commit)
fi

# Drop out of "git commit" if there are any uncommitted changes after the cleanup.
if [[ ! -z "$(echo "${BASH_SOURCE[@]}" | grep "pre-commit")" ]] ; then
    [[ ! -z "$(git diff)" ]] && echo -e "\e[0;37m[\e[1;31mFAIL\e[0;37m]\e[0m Aborting commit: 'git diff' says changes are still present." && exit 1
fi

exit 0
