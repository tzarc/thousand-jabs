#!/bin/bash
lua Profile-APLParser.lua 2>&1 | tee test-parser-output.txt
echo "Parser output generated in file: test-parser-output.txt"
