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

BUILD_TARGET="Release"
while [[ ! -z "$1" ]] ; do
	case "$1" in
		-d) BUILD_TARGET="Debug" ;;
		*) ;;
	esac
	shift
done

# Exit code handling
export script_rc=1
_internal_cleanup() {
	exit $script_rc
}
trap _internal_cleanup EXIT HUP INT

build_generator() {
    mkdir -p "$script_dir/compile"
    cd "$script_dir/compile"
    cmake -DCMAKE_BUILD_TYPE=$BUILD_TARGET ..
    cmake --build . -- -j $(nproc)
}

build_generator
script_rc=0
