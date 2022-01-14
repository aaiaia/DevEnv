#!/bin/sh
rm -rf cscope.files cscope.files

find -L . \( -name '*.c' -o -name '*.cpp' -o -name '*.h' -o -iname "*.java" -o -name '*.v' -o -name '*.vhd' ! -iname ".svn" ! -iname "*.bak" \) -print > cscope.files
cscope -i cscope.files
