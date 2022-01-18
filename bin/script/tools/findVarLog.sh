#!/bin/bash

version="find variables for project folder"

usage="Usage: $0 [VARIABLE NAME]
    [CMD] [VARIABLE_NAME] [EXTENSIONS_FILE, e.g *.c, default is *.c]"

if		[ $# -lt 1 ]; then
	echo "$usage"
	exit 1
elif	[ $# -eq 1 ] ; then
find -L ./ -name "*.c" | xargs grep -n --color=always $1 | tee -a findVar.log
elif	[ $# -eq 2 ]; then
find -L ./ -name "$2" | xargs grep -n --color=always $1 | tee -a findVar.log
else
	echo $0 "!!! Check Syntax"
	echo "$usage"
fi
