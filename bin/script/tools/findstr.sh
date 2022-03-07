#!/bin/bash

version="find variables for project folder"

usage="
Usage:  [CMD] [WORD or 'STRING'] (ex, WORD => keyword, 'STRING' => 'I want find this string, The string can has space character.')
        [CMD] [PATH] [WORD or 'STRING']
        [CMD] [PATH] [WORD or 'STRING'] ['FILE_EXTENSIONS',e.g='*.json',\'*'(=all file),'*.*'(all file has ext)]
"
echo "Numer of arguments : $#"

args=("$@")
for((i=0; i<$#; i++))
do
	echo "$i-th param = ${args[$i]}"
done

if		[ $# -lt 1 ]; then
	echo "$usage"
	exit 1
elif	[ $# -eq 1 ] ; then
	find -L ./ -type f \(																					\
							-iname "*.c"	-o	-iname "*.cpp"	-o	-iname "*.h"	-o	-iname "*.v"		\
						-o	-iname "*.vhd"	-o	-iname "*.py"	-o	-iname "*.java"							\
						!	-iname "*.cfg"	!	-iname "*.exe"	!	-iname "*.swp"	!	-iname "tags"		\
						!	-iname ".svn"	!	-iname "_*"		!	-iname "Debug"	!	-iname "Release"	\
						!	-iname "*.bak"	!	-iname "*.log"	!	-iname "*.ncd"	!	-iname "*.ng**"		\
						!	-iname "*.bit"	!	-iname "*."		!	-iname "*."								\
						\) | xargs grep -n --text --color=auto "$1"
	exit 1
elif	[ $# -eq 2 ]; then
	find -L $1 -type f \(																					\
							-iname "*.c"	-o	-iname "*.cpp"	-o	-iname "*.h"	-o	-iname "*.v"		\
						-o	-iname "*.vhd"	-o	-iname "*.py"	-o	-iname "*.java"							\
						!	-iname "*.cfg"	!	-iname "*.exe"	!	-iname "*.swp"	!	-iname "tags"		\
						!	-iname ".svn"	!	-iname "_*"		!	-iname "Debug"	!	-iname "Release"	\
						!	-iname "*.bak"	!	-iname "*.log"	!	-iname "*.ncd"	!	-iname "*.ng**"		\
						!	-iname "*.bit"	!	-iname "*."		!	-iname "*."								\
						\) | xargs grep -n --color=auto "$2"
	exit 1
elif	[ $# -eq 3 ]; then
	find -L $1 -type f \(	-iname "$3" -o																	\
						!	-iname "*.cfg"	!	-iname "*.exe"	!	-iname "*.swp"	!	-iname "tags"		\
						!	-iname ".svn"	!	-iname "_*"		!	-iname "Debug"	!	-iname "Release"	\
						!	-iname "*.bak"	!	-iname "*.log"	!	-iname "*.ncd"	!	-iname "*.ng**"		\
						!	-iname "*.bit"	!	-iname "*."		!	-iname "*."								\
						\) | xargs grep -n --color=auto "$2"
	exit 1
else
	echo $0 "!!! Check Syntax"
fi

