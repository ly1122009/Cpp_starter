if(ENABLE_TESTING)
    set(TEST_MAIN "unit-test")
    set(TEST_SOURCES "main.unit_test.cpp")
    set(TEST_INCLUDES "./")

    add_executable(${TEST_MAIN} ${TEST_SOURCES})
    target_include_directories(${TEST_MAIN} PUBLIC ${TEST_INCLUDES})
    target_link_libraries(${TEST_MAIN} PUBLIC ${LIBRARY_NAME} GTest::gtest GTest::gtest_main GTest::gmock GTest::gmock_main)
    # target_link_libraries(${TEST_MAIN} PUBLIC ${LIBRARY_NAME} GTest::GTest GTest::Main)
    
    
endif(ENABLE_TESTING)