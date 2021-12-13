#!/bin/bash

version="find variables for project folder"

usage="Usage: $0 [VARIABLE NAME]"

args=("$@")
for((i=0; i<$#; i++))
do
	echo "$i-th param = ${args[$i]}"
done

if		[ $# -lt 1 ]; then
	echo "$usage"
	exit 1
elif	[ $# -eq 1 ] ; then
	find -L ./ -type f \( -iname "*" -o ! -iname ".svn" ! -iname ".git" ! -iname ".github" ! -iname "*.bak" ! -iname "tags" \) | xargs grep -n --text --color=auto $1
fi
