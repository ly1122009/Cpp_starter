# Define version CMake
cmake_minimum_required(VERSION 3.22)

# Define project
project(TemplateProjectCpp VERSION 1.0.0 LANGUAGES C CXX)

# Default variables
set(CMAKE_CXX_STANDARD          20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS        OFF)
set(LIBRARY_NAME    Library)
set(EXECUTABLE_NAME Executable)
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")

# Option type
option(COMPILE_EXECUTABLE "whether to compile the executable file" OFF)
option(ENABLE_TESTING "Enable Testing with gtest" ON)
option(ENABLE_WARNINGS "Enable to add warnings to a target" ON)
option(ENABLE_WARNINGS_AS_ERRORS "Enable to treat warning as errors" ON)
option(ENABLE_SANITIZER_ADDRESS "Enable Sanitizer address" OFF)
option(ENABLE_SANITIZER_UNDEFINED "Enable Sanitizer Undefined" OFF)
option(ENABLE_DOXYGEN_DOCS "Enable auto generate doxygen documents" OFF)

# Warning and Sanitizer
if(ENABLE_WARNINGS OR ENABLE_WARNINGS_AS_ERRORS)
    include(Warnings)
endif(ENABLE_WARNINGS OR ENABLE_WARNINGS_AS_ERRORS)
if (ENABLE_SANITIZER_ADDRESS OR ENABLE_SANITIZER_UNDEFINED)
    include(Sanitizer)
    add_sanitizer_flags(ENABLE_SANITIZER_ADDRESS ENABLE_SANITIZER_UNDEFINED)
endif()

# Doxygen
if (ENABLE_DOXYGEN_DOCS)
    include(Docs)
    message("Enable generate doxygen documents")
# Without Testing runner
else ()
    message("W/O generate doxygen documents")
endif()

# Algorithm With application runner
if (COMPILE_EXECUTABLE)
    add_subdirectory(app)
    message("Compiling with exe.")
# Without Runner
else ()
    message("W/O exe. compiling")
endif()

add_subdirectory(src)
add_subdirectory(inc)

# Algorithm With Testing runner
if (ENABLE_TESTING)
    set(CMAKE_TOOLCHAIN_FILE "${PROJECT_SOURCE_DIR}/vcpkg/vcpkg/scripts/buildsystems/vcpkg.cmake" CACHE STRING "Path to vcpkg toolchain file")
    # Import gtest from vcpkg
    find_package(GTest CONFIG REQUIRED)
    add_subdirectory(tests)
    message("Enable Testing")
# Without Testing runner
else ()
    message("W/O Testing")
endif()


