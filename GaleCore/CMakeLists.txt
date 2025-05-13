project(GaleCore LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(PROJECT_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})

file(GLOB_RECURSE SOURCES CONFIGURE_DEPENDS
    "${PROJECT_SOURCE_DIR}/Source/*.h"
    "${PROJECT_SOURCE_DIR}/Source/*.cpp"
)

add_library(${PROJECT_NAME} STATIC ${SOURCES})
target_include_directories(${PROJECT_NAME} PRIVATE "${PROJECT_SOURCE_DIR}/Source")

# Use generator expressions for output dirs
set_target_properties(${PROJECT_NAME} PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/../Binaries/$<CONFIG>/${PROJECT_NAME}"
    LIBRARY_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/../Binaries/$<CONFIG>/${PROJECT_NAME}"
    RUNTIME_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/../Binaries/$<CONFIG>/${PROJECT_NAME}"
)

# Per-config compile definitions and flags
target_compile_definitions(${PROJECT_NAME} PRIVATE
    $<$<CONFIG:Debug>:DEBUG>
    $<$<CONFIG:Release>:RELEASE>
    $<$<CONFIG:Dist>:DIST>
)

target_compile_options(${PROJECT_NAME} PRIVATE
    $<$<CONFIG:Debug>:-g>
    $<$<CONFIG:Release>:-O2>
    $<$<CONFIG:Dist>:-O3>
)
