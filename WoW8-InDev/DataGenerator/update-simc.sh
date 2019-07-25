#!/usr/bin/env bash

set -eEuo pipefail

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

dbfiles_cache="$temp_dir/DBFilesCache"
dbfiles_location="$temp_dir/DBFilesClient"

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
    [[ ! -d "$dbfiles_location" ]] && mkdir -p "$dbfiles_location" || true

    # Download all the DB2 files from the CDN
    pushd "$simc_dir/casc_extract" >/dev/null 2>&1
    python3 casc_extract.py --dbfile dbfile --cdn --output "${dbfiles_location}" --mode batch --cache "${dbfiles_cache}" || true # --alpha --beta --ptr
    popd >/dev/null 2>&1
}

extract_dbcs() {
    local casc_output_dir=$(ls -1d "$dbfiles_location/"* || true)
    local build_version=$(basename "$casc_output_dir")
    local base_version=$(basename "$casc_output_dir" | cut -d'.' -f1-3)
    local build_id=$(basename "$casc_output_dir" | cut -d '.' -f4)
    local generated_output_dir="$script_dir/generated"
    echo
    echo "casc_output_dir=$casc_output_dir"
    echo "  build_version=$build_version"
    echo "   base_version=$base_version"
    echo "       build_id=$build_id"
    echo

    if [[ ! -d "$generated_output_dir" ]] ; then
        mkdir -p "$generated_output_dir"
    fi

    pushd "$simc_dir/dbc_extract3" >/dev/null 2>&1

    # Extract raw data to json
    local format_file=$(find "$simc_dir/dbc_extract3/formats" -name '*.json' | sort | uniq | tail -n1)
    for t in $(cat $format_file | grep -P '^  "' | cut -d'"' -f2 | xargs echo) ; do
        echo "========================"
        echo "====> $t"
        python3 dbc_extract.py  --path "$casc_output_dir/DBFilesClient" --build $build_version --type csv --delim $'\x1F' ${t}.db2 > "$generated_output_dir/${t}.txt" \
            && python3 "$script_dir/generate.py" -i "$generated_output_dir/${t}.txt" -o data.sqlite \
            || true
    done

    popd >/dev/null 2>&1
}

#update_simc
#update_dbfiles
extract_dbcs
script_rc=0
