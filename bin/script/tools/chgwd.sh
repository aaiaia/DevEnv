#!/bin/bash 
 
if [ $# -lt 3 ]; then
echo
echo "Global REplace: replace string in files globally"
echo "usage) greplace [PATH] [source_WORD] [replace_WORD]"
echo
exit 1
fi 
 
search_string=$2
replace_string=$3
 
 
find -L $1 -type f \( -iname "*.c" -o -iname "*.cpp" -o -iname "*.h" -o -iname "*.java" -o -iname "*.v" -o -iname "*.vhd" ! -iname ".svn" ! -iname "*.bak" \) -exec egrep -l -n "$search_string" {} \; | xargs -i perl -pi -e "s/\b$search_string\b/$replace_string/g" {}
#ctags -R --exclude={.metadata,.svn}

