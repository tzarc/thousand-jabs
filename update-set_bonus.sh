#!/bin/bash

BASE_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
cd "${BASE_DIR}"
OUTPUT_FILE="${BASE_DIR}/ActionProfileLists/set_bonuses.lua"

start_line="$(cat "${BASE_DIR}/simc/dbc_extract3/dbc/generator.py" | awk '/\s*set_bonus_map/ {print NR; exit 0; }')"
set_bonus_map="{\n$(cat simc/dbc_extract3/dbc/generator.py | tail -n +${start_line} | awk -v 'RS=\n\n' '1;{exit}' | grep -vP '\s*#.*' | sed -e "s#'#\"#g" -e 's#set_bonus_map =#"set_bonus_map":#g')\n}"

echo -e "${set_bonus_map}" > set_bonuses.json