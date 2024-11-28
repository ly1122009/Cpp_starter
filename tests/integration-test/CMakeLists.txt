if(ENABLE_TESTING)
    set(TEST_MAIN "integration-test")
    set(TEST_SOURCES "main.integration_test.cpp")
    set(TEST_INCLUDES "./")

    add_executable(${TEST_MAIN} ${TEST_SOURCES})
    target_include_directories(${TEST_MAIN} PUBLIC ${TEST_INCLUDES})
    target_link_libraries(${TEST_MAIN} PUBLIC ${LIBRARY_NAME} GTest::GTest GTest::Main)
endif(ENABLE_TESTING)