#!/bin/bash

set -e
umask 022

this_script=$(readlink -f "${BASH_SOURCE[0]}")
script_dir=$(readlink -f "$(dirname "$this_script")")

if [[ -d "$script_dir/DBFilesClient" ]] ; then
	rm -rf "$script_dir/DBFilesClient"
fi

declare -a versions_list=( live ptr beta alpha )
declare -a files_list=( spell talent spec_enum spec_list class_list spec_spell_list set_list2 racial_list artifact item item_child )

for ver in ${versions_list[@]} ; do
	[[ "$ver" == "live" ]]  && extra_arg="" || extra_arg="--${ver}"

	if [[ -d "$script_dir/Support/DataGenerator/generated/$ver" ]] ; then
		rm -rf "$script_dir/Support/DataGenerator/generated/$ver"
	fi
	mkdir -p "$script_dir/Support/DataGenerator/generated/$ver"

	pushd "$script_dir/simc/casc_extract" >/dev/null 2>&1
	python3 casc_extract.py -dbfile dbfile --cdn --output "$script_dir/DBFilesClient/$ver" --mode batch $extra_arg || true
	popd >/dev/null 2>&1

	output_dir=$(ls -1d "$script_dir/DBFilesClient/$ver/"* || true)
	if [[ ! -z "$output_dir" ]] ; then
		build_version=$(basename "$output_dir")
		build_id=$(basename "$output_dir" | cut -d '.' -f4)
		echo "Output directory: $output_dir"

		pushd "$script_dir/simc/dbc_extract3" >/dev/null 2>&1

		for type in ${files_list[@]} ; do
			echo "Extracting $type list..."
			output_file="$script_dir/Support/DataGenerator/generated/$ver/$type.inl"
			python3 dbc_extract.py --type $type --prefix=$ver --build $build_id --path "$output_dir/DBFilesClient" -o "$output_file" || true
			if [[ "$type" == "spell" ]] || [[ "$type" == "item" ]] ; then
				{ cat "$output_file" | sed -e 's#  # #g' -e 's#  # #g' -e 's#  # #g' -e 's#  # #g' -e 's#  # #g' -e 's#  # #g' -e 's#  # #g' | column -t -s ',' > "$output_file.columns" ; } || true
			fi
		done

		popd >/dev/null 2>&1
	fi

	check_file="$script_dir/Support/DataGenerator/generated/$ver/all.inl"

	unset any_files_missing
	for type in ${files_list[@]} ; do
		output_file="$script_dir/Support/DataGenerator/generated/$ver/$type.inl"
		if [[ ! -f "$output_file" ]] || [[ ! -s "$output_file" ]] ; then
			any_files_missing=1
		fi
	done

	echo "#pragma once" >> "$check_file"
	if [[ ! -z "$any_files_missing" ]] ; then
		echo "#define NO_${ver}_DATA 1" >> "$check_file"
	else
		echo "#define ALL_${ver}_DATA 1" >> "$check_file"
	fi

done
