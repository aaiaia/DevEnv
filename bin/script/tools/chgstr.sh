#!/bin/bash 
 
if [ $# -lt 3 ]; then
echo
echo "Global REplace: replace string in files globally"
echo "usage) greplace [PATH] ['source STRING'] ['replace STRING'] (ex, 'STRING' => 'I want find this string, The string can has space character.')"
echo
exit 1
fi 
 
search_string=$2
replace_string=$3
 
 
find -L $1 -type f \( -iname "*.c" -o -iname "*.cpp" -o -iname "*.h" -o -iname "*.java" -o -iname "*.v" -o -iname "*.vhd" ! -iname ".svn" ! -iname "*.bak" \) -exec egrep -l -n "$search_string" {} \; | xargs -i perl -pi -e "s/$search_string/$replace_string/g" {}


sleep 0.1

#ctags -R --exclude={.metadata,.svn}

