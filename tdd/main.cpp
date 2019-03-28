#include <iostream>
#include "CppUTest/CommandLineTestRunner.h"
#include "CppUTest/TestHarness.h"

int main(int ac, char** av)
{
	std::cout << "welcome to tdd" << std::endl;
    return CommandLineTestRunner::RunAllTests(ac, av);
}
