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

extract_struct() {
    local file=$1
    local struct=$2
echo "struct $struct {"
extract_block_colon "$file" "struct ${struct}\s*{\?\s*" \
    | sed -e 's#//.*##g' \
    | sed -e 's#hotfix::##g' \
    | sed -e 's#std::vector<[^\\>]\+>\*#void*#g' \
    | grep -P '^([^\s]|\s{2}[^\s])' \
    | grep -P ';' \
    | grep -vP '^\s*//' \
    | grep -vP '\(.*\)' \
    | grep -vP 'const;?$' \
    | grep -vP '::' \
    | grep -vP '};' \
    | grep -vP '\s{2}.*({|})' \
    | sed -e 's#\s*$##g'
echo '};'
}

#    | grep -P '\s_[^_]' \


[[ -f "$OUTFILE" ]] && rm -f "$OUTFILE" || true
cat << EOF >> "$OUTFILE"
#pragma once
namespace hotfix {}
using namespace hotfix;

EOF

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


echo "namespace hotfix {" >> "$OUTFILE"
extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/dbc.hpp" client_hotfix_entry_t >> "$OUTFILE"
echo "}" >> "$OUTFILE"
extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/dbc.hpp" spell_data_t >> "$OUTFILE"
extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/dbc.hpp" spelleffect_data_t >> "$OUTFILE"
extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/dbc.hpp" spellpower_data_t >> "$OUTFILE"
extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/dbc.hpp" spelllabel_data_t >> "$OUTFILE"

cat "${SCRIPT_DIR}/../../simc/engine/dbc/data_definitions.hh" \
    | grep "#define\s*SET_BONUS_ITEM_ID_MAX" \
    >> "$OUTFILE"

extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/data_definitions.hh" item_set_bonus_t >> "$OUTFILE"
extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/data_definitions.hh" rppm_modifier_t >> "$OUTFILE"
extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/data_definitions.hh" artifact_t >> "$OUTFILE"
extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/data_definitions.hh" artifact_power_data_t >> "$OUTFILE"
extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/dbc.hpp" artifact_power_rank_t >> "$OUTFILE"
extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/dbc.hpp" talent_data_t >> "$OUTFILE"


cat "${SCRIPT_DIR}/../../simc/engine/dbc/data_definitions.hh" \
    | grep "#define\s*MAX_ITEM_STAT" \
    >> "$OUTFILE"

cat "${SCRIPT_DIR}/../../simc/engine/dbc/data_definitions.hh" \
    | grep "#define\s*MAX_ITEM_EFFECT" \
    >> "$OUTFILE"

extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/data_definitions.hh" item_data_t >> "$OUTFILE"
extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/data_definitions.hh" item_name_description_t >> "$OUTFILE"
extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/data_definitions.hh" item_child_equipment_t >> "$OUTFILE"
extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/data_definitions.hh" item_scale_data_t >> "$OUTFILE"
extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/data_definitions.hh" item_upgrade_t >> "$OUTFILE"
extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/data_definitions.hh" item_upgrade_rule_t >> "$OUTFILE"
extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/data_definitions.hh" item_armor_type_data_t >> "$OUTFILE"
extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/data_definitions.hh" item_bonus_tree_entry_t >> "$OUTFILE"
extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/data_definitions.hh" item_bonus_node_entry_t >> "$OUTFILE"
extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/data_definitions.hh" item_bonus_entry_t >> "$OUTFILE"
extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/data_definitions.hh" scaling_stat_distribution_t >> "$OUTFILE"
extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/data_definitions.hh" item_enchantment_data_t >> "$OUTFILE"
extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/data_definitions.hh" gem_property_data_t >> "$OUTFILE"
extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/data_definitions.hh" curve_point_t >> "$OUTFILE"
extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/data_definitions.hh" random_prop_data_t >> "$OUTFILE"
extract_struct "${SCRIPT_DIR}/../../simc/engine/dbc/data_definitions.hh" random_suffix_data_t >> "$OUTFILE"
