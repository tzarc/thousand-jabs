#!/bin/bash
# vim:ft=sh ts=2 sw=2 sts=2

set -e

havecmd()  { command command type "${1}" >/dev/null 2>&1 || return 1 ; }
nsudo() { [[ ${EUID} -ne 0 ]] && echo "sudo" ; true ; }
activate_virtualenv() {
  [[ -z "${1}" ]] && exit 1
  local target_dir=${1}
  local python_variant="${2:python}"

  if ! havecmd virtualenv ; then
    $(nsudo) apt-get install virtualenv
  fi

  if [[ ! -d "${target_dir}" ]] ; then
    virtualenv -p "$(which ${python_variant})" "${target_dir}"
  fi

  if [[ ! -d "${target_dir}" ]] ; then
    echo "Error, '${target_dir}' does not exist."
    exit 1
  fi

  if [[ ! -f "${target_dir}/bin/activate" ]] ; then
    echo "virtualenv activation script not present."
    exit 1
  fi

  source "${target_dir}/bin/activate"
}

THIS_SCRIPT_DIR=$(readlink -f "$(dirname "${BASH_SOURCE[0]}")")
PARSER_VIRTUALENV_DIR="${THIS_SCRIPT_DIR}/python3-parser-env"
activate_virtualenv "${PARSER_VIRTUALENV_DIR}" python3

if [[ -z "$(find "${PARSER_VIRTUALENV_DIR}/lib/" -name "parsimonious")" ]] || [[ $1 == "--install" ]] || [[ $1 == "--update" ]] ; then
  pip install --upgrade pip
  pip uninstall parsimonious || true
  pip install --upgrade --compile git+https://github.com/erikrose/parsimonious
  ([[ $1 == "--install" ]] || [[ $1 == "--update" ]]) && exit $?
fi

"${PARSER_VIRTUALENV_DIR}/bin/python3" "${THIS_SCRIPT_DIR}/__parse-apls.py" "$@"
