cmake_minimum_required(VERSION 3.14)
project(GTestStandalone)


# 런타임 충돌 방지 (MSVC에서는 꼭 필요)
if (MSVC)
    foreach (flag_var
        CMAKE_CXX_FLAGS CMAKE_CXX_FLAGS_DEBUG CMAKE_CXX_FLAGS_RELEASE
        CMAKE_C_FLAGS CMAKE_C_FLAGS_DEBUG CMAKE_C_FLAGS_RELEASE)
        string (REPLACE "/MD" "/MT" ${flag_var} "${${flag_var}}")
        string (REPLACE "/MDd" "/MTd" ${flag_var} "${${flag_var}}")
    endforeach()
endif()

# GoogleTest 추가 (build는 따로 했다고 가정)
add_subdirectory(../tools/googletest googletest_build)

enable_testing()

# 테스트 소스 자동 탐색
file(GLOB TEST_SOURCES "*.cpp")

add_executable(test_runner ${TEST_SOURCES})

target_include_directories(test_runner PRIVATE
    ../tools/googletest/googletest/include
)

target_link_libraries(test_runner
    gtest
    gtest_main
)

add_test(NAME AllTests COMMAND test_runner)
