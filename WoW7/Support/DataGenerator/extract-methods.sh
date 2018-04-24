#!/bin/bash

THIS_SCRIPT="$(readlink -f "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(readlink -f "$(dirname "$THIS_SCRIPT")")"

OUTFILE="$1"

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

echo -n > "$OUTFILE"

extract_block "${SCRIPT_DIR}/../../simc/engine/sc_util.cpp" 'bool pred_ci' \
    >> "$OUTFILE"

extract_block "${SCRIPT_DIR}/../../simc/engine/sc_util.cpp" 'bool util::str_compare_ci(' \
    | sed -e 's#util::##g' \
    >> "$OUTFILE"

extract_block_colon "${SCRIPT_DIR}/../../simc/engine/sc_enums.hpp" 'enum player_e' \
    >> "$OUTFILE"

extract_block_colon "${SCRIPT_DIR}/../../simc/engine/sc_util.cpp" 'struct spec_map_t' \
    >> "$OUTFILE"
extract_block_colon "${SCRIPT_DIR}/../../simc/engine/sc_util.cpp" 'const spec_map_t' \
    >> "$OUTFILE"
extract_block "${SCRIPT_DIR}/../../simc/engine/sc_util.cpp" 'const char\* util::player_type_string(' \
    | sed -e 's#util::##g' \
    | sed -e 's#player_e#int#g' \
    >> "$OUTFILE"

extract_block_colon "${SCRIPT_DIR}/../../simc/engine/dbc/sc_spell_info.cpp" '_class_map\[\]' \
    >> "$OUTFILE"

extract_block "${SCRIPT_DIR}/../../simc/engine/dbc/sc_const_data.cpp" 'translate_spec_str(' \
    | sed -e 's#dbc::##g' \
    | sed -e 's#player_e#int#g' \
    | sed -e 's#specialization_e#int#g' \
    >> "$OUTFILE"

extract_block "${SCRIPT_DIR}/../../simc/engine/dbc/sc_const_data.cpp" 'specialization_string(' \
    | sed -e 's#dbc::##g' \
    | sed -e 's#player_e#int#g' \
    | sed -e 's#specialization_e#int#g' \
    >> "$OUTFILE"

cat "${SCRIPT_DIR}/../../simc/engine/dbc/dbc.hpp" \
    | grep "NUM_SPELL_FLAGS =" \
    >> "$OUTFILE"

cat "${SCRIPT_DIR}/../../simc/engine/dbc/dbc.hpp" \
    | grep "NUM_CLASS_FAMILY_FLAGS =" \
    >> "$OUTFILE"

echo 'struct spell_data_t {' >> "$OUTFILE"
extract_block_colon "${SCRIPT_DIR}/../../simc/engine/dbc/dbc.hpp" 'struct spell_data_t' \
    | grep -P '^([^\s]|\s{2}[^\s])' \
    | grep -vP '^\s*//' \
    | grep -P '\s_[^_]' \
    | grep -vP 'const;?$' \
    | grep -vP '::' \
    | grep -vP '\s{2}.*({|})' \
    >> "$OUTFILE"
echo '};' >> "$OUTFILE"
