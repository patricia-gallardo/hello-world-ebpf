cmake_minimum_required(VERSION 3.23.2)
project(hello-world-ebpf LANGUAGES C CXX)

include(cmake/setup_conan.cmake)

set(CMAKE_C_STANDARD 17)
set(CMAKE_CXX_STANDARD 17)

find_package(libbpf REQUIRED CONFIG)

add_executable(${PROJECT_NAME} main.c)
target_link_libraries(${PROJECT_NAME} PRIVATE libbpf::libbpf)
