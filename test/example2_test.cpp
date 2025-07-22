#include <gtest/gtest.h>

// example dummy function
int dummy_mul(int a, int b) { return a * b; }
int dummy_div(int a, int b) { return a / b; }

TEST(ExampleTest, AddWorks) {
    EXPECT_EQ(dummy_mul(2, 3), 6);
    EXPECT_EQ(dummy_div(5, 1), 5);
}