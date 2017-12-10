#!/bin/bash

THIS_SCRIPT="$(readlink -f "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(readlink -f "$(dirname "$THIS_SCRIPT")")"

extract_block() {
    local file=$1
    local func=$2
    sed "/${func}/,/^}\$/!d" $file
    echo
}
extract_block_colon() {
    local file=$1
    local func=$2
    sed "/${func}/,/^};\$/!d" $file
    echo
}

echo -n > "${SCRIPT_DIR}/simc_extracted.inl"

extract_block "${SCRIPT_DIR}/../../simc/engine/sc_util.cpp" 'bool pred_ci' \
    >> "${SCRIPT_DIR}/simc_extracted.inl"

extract_block "${SCRIPT_DIR}/../../simc/engine/sc_util.cpp" 'bool util::str_compare_ci(' \
    >> "${SCRIPT_DIR}/simc_extracted.inl"

extract_block_colon "${SCRIPT_DIR}/../../simc/engine/sc_util.cpp" 'struct spec_map_t' \
    >> "${SCRIPT_DIR}/simc_extracted.inl"
extract_block_colon "${SCRIPT_DIR}/../../simc/engine/sc_util.cpp" 'const spec_map_t' \
    >> "${SCRIPT_DIR}/simc_extracted.inl"

extract_block_colon "${SCRIPT_DIR}/../../simc/engine/dbc/sc_spell_info.cpp" '_class_map\[\]' \
    >> "${SCRIPT_DIR}/simc_extracted.inl"

extract_block "${SCRIPT_DIR}/../../simc/engine/dbc/sc_const_data.cpp" 'translate_spec_str(' \
    | sed -e 's#dbc::#simc_copied::#g' \
    | sed -e 's#player_e#int#g' \
    | sed -e 's#specialization_e#int#g' \
    >> "${SCRIPT_DIR}/simc_extracted.inl"

extract_block "${SCRIPT_DIR}/../../simc/engine/dbc/sc_const_data.cpp" 'specialization_string(' \
    | sed -e 's#dbc::#simc_copied::#g' \
    | sed -e 's#player_e#int#g' \
    | sed -e 's#specialization_e#int#g' \
    >> "${SCRIPT_DIR}/simc_extracted.inl"
