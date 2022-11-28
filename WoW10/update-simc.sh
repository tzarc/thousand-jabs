#!/usr/bin/env bash

set -eEuo pipefail
set -x

target_branch="dragonflight"

this_script=$(realpath "${BASH_SOURCE[0]}")
script_dir=$(realpath "$(dirname "$this_script")")

simc_dir="$script_dir/../simc"
build_dir="$script_dir/../simc-build"

if [[ ! -e "$simc_dir" ]] ; then
    git clone -b $target_branch git@github.com:tzarc/simulationcraft-simc.git "$simc_dir"
fi

cd "$simc_dir"
if [[ -z "$(git remote -v | grep upstream)" ]] ; then
    git remote add upstream https://github.com/simulationcraft/simc.git
fi

git fetch --all
git fetch --tags
git fetch --prune

git merge upstream/$target_branch

if [[ ! -d "$build_dir" ]] ; then
    mkdir -p "$build_dir"
fi

cd "$build_dir"
cmake -G Ninja "$simc_dir" -DBUILD_GUI=OFF
cmake --build "$build_dir" --config RelWithDebInfo --target all

CLASSES=(warrior hunter monk paladin rogue shaman mage warlock druid deathknight priest demonhunter evoker)

./simc ptr=0 spell_query="spell" spell_query_xml_output_file=spells_live.xml
./simc ptr=1 spell_query="spell" spell_query_xml_output_file=spells_ptr.xml
./simc ptr=0 spell_query="spell" >spells_live.txt
./simc ptr=1 spell_query="spell" >spells_ptr.txt

for class_name in "${CLASSES[@]}" ; do
    ./simc ptr=0 spell_query="class_spell.class=$class_name" spell_query_xml_output_file=class_spells_${class_name}_live.xml
    ./simc ptr=1 spell_query="class_spell.class=$class_name" spell_query_xml_output_file=class_spells_${class_name}_ptr.xml
    ./simc ptr=0 spell_query="class_spell.class=$class_name" >class_spells_${class_name}_live.txt
    ./simc ptr=1 spell_query="class_spell.class=$class_name" >class_spells_${class_name}_ptr.txt
done