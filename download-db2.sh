#!/bin/bash

set -e
umask 022

this_script=$(readlink -f "${BASH_SOURCE[0]}")
script_dir=$(readlink -f "$(dirname "$this_script")")

dbfiles_location="$script_dir/Temp/DBFilesClient"
if [[ -d "$dbfiles_location" ]] ; then
	rm -rf "$dbfiles_location"
fi

declare -a versions_list=( live ptr beta alpha )

for ver in ${versions_list[@]} ; do
	[[ "$ver" == "live" ]]  && extra_arg="" || extra_arg="--${ver}"

	code_output_dir="$script_dir/WoW8/DataGenerator/generated/$ver"
	if [[ -d "$code_output_dir" ]] ; then
		rm -rf "$code_output_dir"
	fi
	mkdir -p "$code_output_dir"

	pushd "$script_dir/simc/casc_extract" >/dev/null 2>&1
	python3 casc_extract.py -dbfile dbfile --cdn --output "$dbfiles_location/$ver" --mode batch $extra_arg || true
	popd >/dev/null 2>&1
	casc_output_dir=$(ls -1d "$dbfiles_location/$ver/"* || true)

	if [[ ! -z "$casc_output_dir" ]] ; then
		build_version=$(basename "$casc_output_dir")
		build_id=$(basename "$casc_output_dir" | cut -d '.' -f4)
		echo "CASC Output directory: $casc_output_dir"

		pushd "$script_dir/simc/dbc_extract3" >/dev/null 2>&1
		cat live.conf | sed -e "s#^output_base.*#output_base = $code_output_dir#g" -e "s#\.inc]#.$ver.h]#g" > tj.conf
		./dbc_extract.py  --path "$casc_output_dir/DBFilesClient" --build $build_id --type output tj.conf || true
		rm tj.conf
		popd >/dev/null 2>&1
	fi
done
