#!/bin/bash

version="find variables for project folder"

usage="
Usage: [CMD] [keyword1] [keyword2] [keyword3] [keyword4] ...
"

echo "Numer of arguments : $#"

if		[ $# -lt 1 ]; then
	echo "!!! Check Syntax"
	echo $usage
	echo "$0 [keyword1] [keyword2] [keyword3] [keyword4] ... "
	exit 1
else
	for i in $*
	do
		concat_str+=$i"\|"
	done

	concat_str=${concat_str/%\\\|/}

	echo "concatened keyword is $concat_str"

	find -L ./ -type f \( -iname "*" ! -iname "*.swp" ! -iname ".svn" ! -iname "*.bak" ! -iname "tags" \) | xargs grep -n -w --text --color=auto "$concat_str"

fi

