#!/usr/bin/env bash

set -eEuo pipefail

target_branch="dragonflight"

this_script=$(realpath "${BASH_SOURCE[0]}")
script_dir=$(realpath "$(dirname "$this_script")")

function rcmd() {
    echo -e "\e[38;5;208mExecuting: \e[38;5;226m$@\e[0m" >&2
    "$@"
}

function f_info() {
    echo -e "\e[38;5;196m$@\e[0m" >&2
}

simc_dir="$script_dir/simc"
build_dir="$script_dir/simc-build"
output_dir="$script_dir/Support/Generated"

if [[ ! -e "$simc_dir" ]]; then
    rcmd git clone -b $target_branch git@github.com:tzarc/simulationcraft-simc.git "$simc_dir"
fi

cd "$simc_dir"
if [[ -z "$(git remote -v | grep upstream)" ]]; then
    rcmd git remote add upstream https://github.com/simulationcraft/simc.git
fi

f_info "Updating"
rcmd git fetch --all
rcmd git fetch --tags
rcmd git fetch --prune

f_info "Merging"
rcmd git merge upstream/$target_branch

if [[ ! -d "$build_dir" ]]; then
    mkdir -p "$build_dir"
fi

if [[ ! -d "$output_dir" ]]; then
    mkdir -p "$output_dir"
fi

cd "$build_dir"
if [[ ! -f "$build_dir/CMakeCache.txt" ]] || [[ "${1:-}" == "-f" ]]; then
    f_info "Configuring"
    rcmd cmake -G Ninja "$simc_dir" -DBUILD_GUI=OFF
fi

f_info "Building"
rcmd cmake --build "$build_dir" --config RelWithDebInfo --target all

f_info "Exporting all spells"
rcmd ./simc ptr=0 spell_query="spell" spell_query_xml_output_file=${output_dir}/spells_live.xml
rcmd ./simc ptr=1 spell_query="spell" spell_query_xml_output_file=${output_dir}/spells_ptr.xml
rcmd ./simc ptr=0 spell_query="spell" >${output_dir}/spells_live.txt
rcmd ./simc ptr=1 spell_query="spell" >${output_dir}/spells_ptr.txt

CLASSES=(warrior hunter monk paladin rogue shaman mage warlock druid deathknight priest demonhunter evoker)
for class_name in "${CLASSES[@]}"; do
    f_info "Exporting $class_name"
    rcmd ./simc ptr=0 spell_query="class_spell.class=$class_name" spell_query_xml_output_file=${output_dir}/class_spells_${class_name}_live.xml
    rcmd ./simc ptr=1 spell_query="class_spell.class=$class_name" spell_query_xml_output_file=${output_dir}/class_spells_${class_name}_ptr.xml
    rcmd ./simc ptr=0 spell_query="class_spell.class=$class_name" >${output_dir}/class_spells_${class_name}_live.txt
    rcmd ./simc ptr=1 spell_query="class_spell.class=$class_name" >${output_dir}/class_spells_${class_name}_ptr.txt
done
