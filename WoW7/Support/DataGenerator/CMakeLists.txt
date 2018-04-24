cmake_minimum_required(VERSION 3.5)
set(CMAKE_CXX_STANDARD 14)

project(datagenerator)
add_executable(datagenerator main.cpp util.cpp simc_provider_live.cpp simc_provider_ptr.cpp simc_provider_beta.cpp simc_provider_alpha.cpp 3rdparty/fmtlib/fmt/format.cc 3rdparty/fmtlib/fmt/ostream.cc)
target_include_directories(datagenerator PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/../../simc/engine ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/fmtlib ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/nlohmann-json ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/vietjtnguyen-argagg)
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -D_DEBUG")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -D_NDEBUG")
