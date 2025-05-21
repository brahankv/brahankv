#ifndef ___DEBUG_H___
# define ___DEBUG_H___

#include <iostream>
#include <string>

std::string timestamp();

#define __FILENAME__ (__builtin_strrchr(__FILE__, '/') ? __builtin_strrchr(__FILE__, '/') + 1 : __FILE__)    // only show filename and not it's path (less clutter)
#define INFO std::cout << "[INFO] [" << timestamp().c_str() << "] " << __FILENAME__ << "(" << __FUNCTION__ << ":" << __LINE__ << ") >> "
#define WARN std::cout << "[WARN] [" << timestamp().c_str() << "] " << __FILENAME__ << "(" << __FUNCTION__ << ":" << __LINE__ << ") >> "
#define ERR std::cout << "[ERROR] [" << timestamp().c_str() << "] " << __FILENAME__ << "(" << __FUNCTION__ << ":" << __LINE__ << ") >> "

void printStackTrace();

#define STACK_TRACE printStackTrace();

void printLoadedSharedLibraries();

void __attribute__((constructor)) calledFirst(); 
void __attribute__((destructor)) calledLast();

#endif // ___DEBUG_H___
