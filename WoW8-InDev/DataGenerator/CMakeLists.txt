cmake_minimum_required(VERSION 3.10)
project(DataGenerator)

OPTION(UPDATE_SIMC "Update the simulationcraft sources and generated DBCs before building" OFF)

set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -D_DEBUG -DDEBUG")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -D_NDEBUG -DNDEBUG")

set(BUILD_GUI OFF CACHE BOOL "disable gui build by default")
add_subdirectory(../../simc-bfa-dev simc)
