cmake_minimum_required(VERSION 3.16)
project(template LANGUAGES NONE)

# Binaries land next to the checkout, as they do for the compiler.
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin")

# `build test` is `cmake --build build --target test`. That target builds
# the program first, then CTest runs the suite.
set(CMAKE_SKIP_TEST_ALL_DEPENDENCY FALSE)
enable_testing()

# `scpp` on PATH wins. The default install prefix is $HOME/opt/smallcpp.
set(SMALLCPP_DEFAULT_BIN "")
if(IS_ABSOLUTE "$ENV{HOME}")
    set(SMALLCPP_DEFAULT_BIN "$ENV{HOME}/opt/smallcpp/bin")
endif()
if(SCPP AND NOT EXISTS "${SCPP}")
    unset(SCPP CACHE)
endif()
find_program(SCPP NAMES scpp PATHS ${SMALLCPP_DEFAULT_BIN})
if(NOT SCPP)
    unset(SCPP CACHE)
    message(FATAL_ERROR
        "scpp was not found on PATH or in \$HOME/opt/smallcpp/bin. "
        "Install smallcpp and run scripts/setup again.")
endif()

# Header and library search is scpp's. When ~/.config/smallcpp/config.ini
# exists, scpp reads include, library, and runtime from it. This program
# includes no header. A later #include uses that file.
set(HELLO_SOURCE "${CMAKE_SOURCE_DIR}/src/hello.scpp")
set(HELLO_PROGRAM "${CMAKE_SOURCE_DIR}/bin/hello")

set(SCPP_FLAGS "")
if(CMAKE_BUILD_TYPE STREQUAL "Debug" OR CMAKE_BUILD_TYPE STREQUAL "RelWithDebInfo")
    list(APPEND SCPP_FLAGS "-g")
endif()

add_custom_command(
    OUTPUT "${HELLO_PROGRAM}"
    COMMAND "${CMAKE_COMMAND}" -E make_directory "${CMAKE_SOURCE_DIR}/bin"
    COMMAND "${SCPP}" ${SCPP_FLAGS} -o "${HELLO_PROGRAM}" "${HELLO_SOURCE}"
    WORKING_DIRECTORY "${CMAKE_BINARY_DIR}"
    DEPENDS "${HELLO_SOURCE}" "${SCPP}"
    COMMENT "Compiling src/hello.scpp"
    VERBATIM)
add_custom_target(hello ALL DEPENDS "${HELLO_PROGRAM}")

add_subdirectory(tests)
