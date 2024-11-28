#!/bin/bash
cd ..
rmdir -rf build
mkdir build
cd build
cmake ..
cmake --build .

# Run by git bash
# Command: bash buildProject.csh