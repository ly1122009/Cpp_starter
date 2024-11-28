find_package(Doxygen)

if (DOXYGEN_FOUND)
    add_custom_target(docs_doxygen
        COMMAND ${DOXYGEN_EXECUTABLE}
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/docs_doxygen
        COMMENT "Generating HTML documentation with Doxygen"
    )
endif()