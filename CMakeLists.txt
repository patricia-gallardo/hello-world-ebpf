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

# Generate skeleton
# bpftool gen skeleton exec.bpf.o name exec > exec.skel.h

# Build userspace C program
# clang exec.c -lbpf -lelf -o ${PROJECT_NAME}

add_executable(${PROJECT_NAME} main.c)
target_link_libraries(${PROJECT_NAME} PRIVATE libbpf::libbpf)

#enable_testing()
#add_test(NAME ${PROJECT_NAME} COMMAND $<TARGET_FILE:${PROJECT_NAME}>)
