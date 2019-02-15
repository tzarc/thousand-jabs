#!/usr/bin/env bash

this_script=$(readlink -f "${BASH_SOURCE[0]}")
script_dir=$(readlink -f "$(dirname "$this_script")")

simc_branch="bfa-dev"

simc_dir=$(readlink -f "$script_dir/../../simc-$simc_branch")
temp_dir=$(readlink -f "$script_dir/../../Temp")

echo
echo "this_script=$this_script"
echo " script_dir=$script_dir"
echo "   simc_dir=$simc_dir"
echo "   temp_dir=$temp_dir"
echo

# Exit code handling
export script_rc=1
_internal_cleanup() {
	exit $script_rc
}
trap _internal_cleanup EXIT HUP INT

update_simc() {
    # Update the simulationcraft sources
    if [[ -d "$simc_dir/.git" ]] ; then
        {
            cd "$simc_dir"
            git checkout -- .
            git checkout "$simc_branch"
            git reset --hard "origin/$simc_branch"
            git fetch --depth=1
            git reset --hard "origin/$simc_branch"
        }
    else
        git clone -b "$simc_branch" --depth=1 http://github.com/simulationcraft/simc "$simc_dir"
    fi
}

update_dbfiles() {
    # Set up output directory for the dbfiles
    dbfiles_cache="$temp_dir/DBFilesCache"
    dbfiles_location="$temp_dir/DBFilesClient"
    if [[ -d "$dbfiles_location" ]] ; then
        if [[ -n "$perform_update" ]] ; then
            rm -rf "$dbfiles_location"
        fi
    fi
    [[ ! -d "$dbfiles_location" ]] && mkdir -p "$dbfiles_location" || true

    # Download all the DB2 files from the CDN
    pushd "$simc_dir/casc_extract" >/dev/null 2>&1
    python3 casc_extract.py --dbfile dbfile --cdn --output "$dbfiles_location" --mode batch --cache "$dbfiles_cache" || true # --alpha --beta --ptr
    find "$simc_dir/engine/dbc/generated" -type f -name '*.inc' -exec unix2dos '{}' \;
    popd >/dev/null 2>&1
}

extract_dbcs() {
    casc_output_dir=$(ls -1d "$dbfiles_location/"* || true)
    build_version=$(basename "$casc_output_dir")
    base_version=$(basename "$casc_output_dir" | cut -d'.' -f1-3)
    build_id=$(basename "$casc_output_dir" | cut -d '.' -f4)
    echo
    echo "casc_output_dir=$casc_output_dir"
    echo "  build_version=$build_version"
    echo "   base_version=$base_version"
    echo "       build_id=$build_id"
    echo

    echo "#define WOW_BUILD_VERSION \"$build_version\"" > "$simc_dir/engine/wow_version_def.h"

    # Fix up (soon-to-be) duplicated data expressions
    sed -i 's#__armor_mitigation_constants_data#__armor_mitigation_constants_data_ORIG#' "$simc_dir/engine/dbc/generated/sc_scale_data.inc"
    sed -i 's#__npc_armor_data#__npc_armor_data_ORIG#' "$simc_dir/engine/dbc/generated/sc_scale_data.inc"

    # Convert all the DB2 files to simulationcraft-usable data
    pushd "$simc_dir/dbc_extract3" >/dev/null 2>&1
    python3 dbc_extract.py  --path "$casc_output_dir/DBFilesClient" --build $build_version --type output live.conf || true
    popd >/dev/null 2>&1
}

patch_simc() {
    local rel_path=$(realpath --relative-to="$(readlink -f "$simc_dir/CMakeFiles.txt")" "$(readlink -f $script_dir)")
    sed \
        -e "s^@@@tj_main@@@^$rel_path/tj_main.cpp^g" \
        -e "s^@@@tj_hook@@@^$rel_path/tj_hook.cpp^g" \
        "$script_dir/code.patch.in" > "$script_dir/code.patch"

    {
        cd "$simc_dir"
        patch -p1 < "$script_dir/code.patch"
    }
}

update_simc
update_dbfiles
extract_dbcs
patch_simc
script_rc=0
