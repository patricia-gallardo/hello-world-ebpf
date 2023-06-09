set(ENV{CONAN_SYSREQUIRES_MODE} enabled)

if (NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
    file(DOWNLOAD
         "https://github.com/conan-io/cmake-conan/raw/0.18.1/conan.cmake"
         "${CMAKE_BINARY_DIR}/conan.cmake")
endif ()

include(${CMAKE_BINARY_DIR}/conan.cmake)
conan_check(REQUIRED)
conan_cmake_autodetect(settings)
conan_cmake_install(PATH_OR_REFERENCE
                    ../../conanfile.txt
                    BUILD missing
                    SETTINGS ${settings})

set(CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR})
