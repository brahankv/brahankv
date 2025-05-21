#include "debug.h"

#include <iomanip> 
#include <execinfo.h>
#include <stdio.h>
#include <stdlib.h>
#include <ctime>
#include <sstream>
#include <link.h>

extern const char *__progname;

std::string timestamp() {
    std::time_t now = std::time(nullptr);
    std::stringstream ss;
    ss << std::put_time(std::localtime(&now), "%y-%m-%d %OH:%OM:%OS");
    return ss.str();
}

void printStackTrace()
{
    void *array[10];
    size_t size;
    char **strings;
    size_t i;

    size = backtrace(array, 10);
    strings = backtrace_symbols(array, size);

    std::cout << "------------------------ STACK TRACE START --------------------" << std::endl;
    for (i = 0; i < size; i++)
        std::cout << strings[i] << std::endl;
    std::cout << "------------------------ STACK TRACE END --------------------" << std::endl;

    free(strings);
}

int printSharedLibrary(struct dl_phdr_info *info, size_t size, void *data)
{
    std::cout << info->dlpi_name << std::endl;
    return 0;
}

void printLoadedSharedLibraries()
{
    std::cout << "------------------------ LOADED LIBRARIES --------------------" << std::endl;
    dl_iterate_phdr(printSharedLibrary, NULL);
    std::cout << "------------------------ END ---------------------------------" << std::endl;
}

void calledFirst() {
    std::string executable = "java";
    INFO << "Executable:" << __progname << std::endl;
    if(executable.compare(__progname) == 0) {
        INFO << "Java process, Call isExit" << std::endl;
        INFO << "Test" << std::endl;
    }
}

void calledLast() {
    INFO << "Unload" << std::endl;
    printLoadedSharedLibraries();
}
