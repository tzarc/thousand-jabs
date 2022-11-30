#!/bin/bash

set -e

SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

cd "${SCRIPT_DIR}/WoW10"
"${SCRIPT_DIR}/.packager/release.sh" -t "${SCRIPT_DIR}" -r "${SCRIPT_DIR}/.release" -d