#!/bin/bash

# Run the resulting simulationcraft binary with:
# ./datagenerator

set -e
umask 022

# Check if we want to perform an update
unset perform_update
unset no_patch
unset no_unpatch
while [[ -n "$1" ]] ; do
    case "$1" in
        -u)
            perform_update=1
            shift
            ;;
        -n)
            no_patch=1
            shift
            ;;
        -x)
            no_unpatch=1
            shift
            ;;
        *)
            shift
            ;;
    esac
done

simc_branch="bfa-dev"

this_script=$(readlink -f "${BASH_SOURCE[0]}")
script_dir=$(readlink -f "$(dirname "$this_script")")

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
	# Clean up...
	pushd "$simc_dir" >/dev/null 2>&1
	if [[ -f code.patch ]] && [[ -z $no_unpatch ]] ; then
		patch -Rp1 < code.patch
		rm code.patch engine/tj_* engine/wow_version_def.h
	fi
	popd >/dev/null 2>&1
	exit $script_rc
}
trap _internal_cleanup EXIT HUP INT

update_simc() {
    # Update the simulationcraft sources
    if [[ -d "$simc_dir/.git" ]] ; then
        if [[ -n "$perform_update" ]] ; then
            { cd "$simc_dir" ; git checkout -- . ; git checkout "$simc_branch" ; git reset --hard "origin/$simc_branch" ; git fetch --depth=1 ; git reset --hard "origin/$simc_branch" ; }
        fi
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
    if [[ -n "$perform_update" ]] ; then
        pushd "$simc_dir/casc_extract" >/dev/null 2>&1
        python3 casc_extract.py --dbfile dbfile --cdn --output "$dbfiles_location" --mode batch --cache "$dbfiles_cache" || true # --beta
        find "$simc_dir/engine/dbc/generated" -type f -name '*.inc' -exec unix2dos '{}' \;
        popd >/dev/null 2>&1
    fi
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

    # Convert all the DB2 files to simulationcraft-usable data
    if [[ -n "$perform_update" ]] ; then
        pushd "$simc_dir/dbc_extract3" >/dev/null 2>&1
        python3 dbc_extract.py  --path "$casc_output_dir/DBFilesClient" --build $build_id --type output live.conf || true
        popd >/dev/null 2>&1
    fi
}

build_generator() {
    # Copy the source file..
    cp "$script_dir/"tj_*.cpp "$simc_dir/engine"
    cp "$script_dir/code.patch" "$simc_dir/code.patch"

    # Apply the patch...
    pushd "$simc_dir" >/dev/null 2>&1
    if [[ -z $no_patch ]] ; then
        patch -p1 < code.patch
    fi
    popd >/dev/null 2>&1

    # Build a new copy of simulationcraft
    pushd "$simc_dir/engine" >/dev/null 2>&1
    make -j$(cat /proc/cpuinfo | grep rocessor | wc -l) CC=clang CXX=clang++ CPP=clang || true # If the build fails, continue and reverse the patch
    popd >/dev/null 2>&1

    # Copy the new binary over
    cp "$simc_dir/engine/simc" "$script_dir/datagenerator" && chmod 755 "$script_dir/datagenerator"
}

generate_all() {
    "$script_dir/datagenerator" tj
}

update_simc
update_dbfiles
extract_dbcs
build_generator
generate_all

# If we got this far... we're okay.
script_rc=0
