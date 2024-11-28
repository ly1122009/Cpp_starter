#!/bin/csh
# Tool auto gen static check with cppcheck
mkdir ../docs/analysis_result
cppcheck --enable=all --suppress=syntaxError --suppress=missingIncludeSystem --suppress=missingInclude --quiet --xml --xml-version=2 --cppcheck-build-dir=../build ../src/ >& ../docs/analysis_result/result.xml
echo "Open ../docs/analysis_result/result.xml to see the result"
echo "Or use create-report.csh tool to convert from ../docs/analysis_result/result.xml to ../docs/analysis_result/index.html"
exit