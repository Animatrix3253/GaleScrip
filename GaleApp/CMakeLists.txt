project(Gale LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(PROJECT_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})

# Source files
file(GLOB_RECURSE SOURCES CONFIGURE_DEPENDS
    "${PROJECT_SOURCE_DIR}/Source/*.h"
    "${PROJECT_SOURCE_DIR}/Source/*.cpp"
)

# Define executable target
add_executable(${PROJECT_NAME} ${SOURCES})

# Include directories
target_include_directories(${PROJECT_NAME} PRIVATE
    "${PROJECT_SOURCE_DIR}/Source"
    "${PROJECT_SOURCE_DIR}/../GaleCore/Source"
)

# Link against Core static library (assumes Core is added via add_subdirectory)
target_link_libraries(${PROJECT_NAME} PRIVATE GaleCore)

# Output directories using generator expressions
set_target_properties(${PROJECT_NAME} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/../Binaries/$<CONFIG>/${PROJECT_NAME}"
    ARCHIVE_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/../Binaries/$<CONFIG>/${PROJECT_NAME}"
    LIBRARY_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/../Binaries/$<CONFIG>/${PROJECT_NAME}"
)

# Preprocessor definitions based on build type
target_compile_definitions(${PROJECT_NAME} PRIVATE
    $<$<CONFIG:Debug>:DEBUG>
    $<$<CONFIG:Release>:RELEASE>
    $<$<CONFIG:Dist>:DIST>
)

# Clang-friendly compile options
target_compile_options(${PROJECT_NAME} PRIVATE
    $<$<CONFIG:Debug>:-g>
    $<$<CONFIG:Release>:-O2>
    $<$<CONFIG:Dist>:-O3>
)

