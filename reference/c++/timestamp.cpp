
#include <iostream>
#include <sstream>
#include <string>
#include <ctime>
#include <iomanip> 

#include <sys/resource.h> // Linux specific

const char* timestamp() {
    std::time_t now = std::time(nullptr);
    std::stringstream ss;
    ss << std::put_time(std::localtime(&now), "%y-%m-%d %OH:%OM:%OS");
    return ss.str().c_str();
}

#define __FILENAME__ (__builtin_strrchr(__FILE__, '/') ? __builtin_strrchr(__FILE__, '/') + 1 : __FILE__)    // only show filename and not it's path (less clutter)
#define INFO std::cout << timestamp() << " [INFO] " << __FILENAME__ << "(" << __FUNCTION__ << ":" << __LINE__ << ") >> "

long get_mem_usage()
{
    struct rusage usage;
    int ret;
    ret = getrusage(RUSAGE_SELF, &usage);
    return usage.ru_maxrss; // in KB
}

int main(int argc, char *argv[]) {
  long memInK = get_mem_usage();
  INFO << "Memory Used : " << memInK << std::endl;
  return 0;
}
