cmake_minimum_required(VERSION 3.10)
project(DataGenerator)

OPTION(UPDATE_SIMC "Update the simulationcraft sources and generated DBCs before building" OFF)

set(BUILD_GUI OFF CACHE BOOL "disable gui build by default")
add_subdirectory(../../simc-bfa-dev simc)
