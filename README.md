# Cpp_Starter

This is a starting template for C++ projects that supports:
- [Vcpkg](https://github.com/Microsoft/vcpkg) as Package Manager
- [CPPCheck](http://cppcheck.sourceforge.net/) as Static Code Analyzer
- [Doxygen](http://www.stack.nl/~dimitri/doxygen/) as Code documentation  
- [Google Tests](https://github.com/google/googletest) as Testing-Framework

## Structure
```
.
├── CMakeLists.txt
├── app
│   ├── CMakeLists.txt
│   └── main.cpp
│
├── include
│   ├── CMakeLists.txt
│   └── func.h
├── src
│   ├── CMakeLists.txt
│   └── func.cpp
│   
└── tests
    ├── unit-test
    ├── integration-test
    └── CMakeLists.txt
```
## .gitignore

The [.gitignore](.gitignore) file is a copy of the [Github C++.gitignore file](https://github.com/github/gitignore/blob/master/C%2B%2B.gitignore),
with the addition of ignoring the build directory (`build/`).  

## Important to note 
That CMake needs the Vcpkg toolchain file to resolve the necessary dependencies
```
-DCMAKE_TOOLCHAIN_FILE={YOUR_PATH_TO_VCPKG}/vcpkg/scripts/buildsystems/vcpkg.cmake
```

## Acknowledgement 
This template is extended based on [Cpp-starter]([https://github.com/ly1122009/Cpp_starter]). 
