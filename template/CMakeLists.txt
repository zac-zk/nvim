cmake_minimum_required(VERSION 3.8)

project((project))

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_EXPORT_COMPILE_COMMANDS 1)
add_definitions("-Wall -g")

# include(FetchContent)
# FetchContent_Declare(
#         googletest
#         URL https://github.com/google/googletest/archive/609281088cfefc76f9d0ce82e1ff6c30cc3591e5.zip
# )
# FetchContent_MakeAvailable(googletest)
#
# enable_testing()

include_directories("${PROJECT_SOURCE_DIR}/include/")

file(GLOB_RECURSE SRCS "${PROJECT_SOURCE_DIR}/src/*.cc" "${PROJECT_SOURCE_DIR}/*.cc")

add_executable(${PROJECT_NAME} ${SRCS})

# target_link_libraries(
#     (project)
#     gtest_main
# )
#
# include(GoogleTest)
# gtest_discover_tests((project))
