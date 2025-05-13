cmake_minimum_required(VERSION 3.20)
project(Gale LANGUAGES CXX)

# Set global C++ standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Set output directories per configuration
foreach(OUTPUTCONFIG IN ITEMS Debug Release Dist)
    string(TOUPPER ${OUTPUTCONFIG} OUTPUTCONFIG_UPPER)

    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_${OUTPUTCONFIG_UPPER} 
        ${CMAKE_BINARY_DIR}/${CMAKE_SYSTEM_NAME}/${OUTPUTCONFIG}/bin)

    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_${OUTPUTCONFIG_UPPER} 
        ${CMAKE_BINARY_DIR}/${CMAKE_SYSTEM_NAME}/${OUTPUTCONFIG}/bin)

    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_${OUTPUTCONFIG_UPPER} 
        ${CMAKE_BINARY_DIR}/${CMAKE_SYSTEM_NAME}/${OUTPUTCONFIG}/lib)
endforeach()

# Add subprojects
add_subdirectory(GaleCore)
add_subdirectory(GaleApp)
