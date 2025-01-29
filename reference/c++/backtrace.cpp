#include <execinfo.h>
#include <stdio.h>
#include <stdlib.h>

        void *array[10];
        size_t size;

        size = backtrace(array, 10);

        fprintf(stdout, "Exception: stacktrace :\n");
        backtrace_symbols_fd(array, size, STDOUT_FILENO);
