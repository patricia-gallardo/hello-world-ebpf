cmake_minimum_required(VERSION 3.1)
project(test_package LANGUAGES C)

include(cmake/setup_conan.cmake)

find_package(libbpf REQUIRED CONFIG)

add_executable(${PROJECT_NAME} main.c)
target_link_libraries(${PROJECT_NAME} PRIVATE libbpf::libbpf)
