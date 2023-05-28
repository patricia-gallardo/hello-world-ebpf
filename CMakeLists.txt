cmake_minimum_required(VERSION 3.23.2)
project(hello-world-ebpf LANGUAGES C)

set(CMAKE_C_STANDARD 17)

include(cmake/setup_conan.cmake)

find_package(libbpf REQUIRED CONFIG)

add_executable(${PROJECT_NAME} main.c)
target_link_libraries(${PROJECT_NAME} PRIVATE libbpf::libbpf)
