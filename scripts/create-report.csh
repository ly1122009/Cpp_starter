#!/bin/csh
# Tool auto convert xml to html
# To use this tool, ../docs/analysis_result/result.xml must be exist. (That mean do the static-check.csh at first)
python cppcheck-htmlreport.py --file=../docs/analysis_result/result.xml --report-dir=../docs/analysis_result --source-dir=.

#remove redundant file
rm -rf 1 analysis_result
exit