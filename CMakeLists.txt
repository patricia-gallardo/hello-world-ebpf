cmake_minimum_required(VERSION 3.23.2)
project(hello-world-ebpf LANGUAGES C CXX)

set(CMAKE_C_STANDARD 17)
set(CMAKE_CXX_STANDARD 17)

# Set the CMake module path
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

# Set up Conan and find dependencies
include(setup_conan)
find_package(libbpf REQUIRED CONFIG)

# Create vmlinux.h
# bpftool btf dump file /sys/kernel/btf/vmlinux format c > vmlinux.h

# Build kernel eBPF program
# clang -g -O3 -target bpf -D__TARGET_ARCH_x86_64 -c exec.bpf.c -o exec.bpf.o

add_library(bpf_object OBJECT exec.bpf.c)
target_compile_definitions(bpf_object PUBLIC __TARGET_ARCH_x86_64)
target_compile_options(bpf_object PRIVATE -target bpf -Wno-unknown-attributes)
target_link_libraries(bpf_object PRIVATE libbpf::libbpf)

# Generate skeleton
# bpftool gen skeleton exec.bpf.o name exec > exec.skel.h
# bpftool gen skeleton ./cmake-build-debug-clang/CMakeFiles/bpf_object.dir/exec.bpf.c.o name exec > exec.skel.h

# Build userspace C program
# clang exec.c -lbpf -lelf -o ${PROJECT_NAME}

add_executable(${PROJECT_NAME} exec.c)
target_link_libraries(${PROJECT_NAME} PRIVATE libbpf::libbpf)

#enable_testing()
#add_test(NAME ${PROJECT_NAME} COMMAND $<TARGET_FILE:${PROJECT_NAME}>)
