#!/bin/sh

usage="Usage:\t[CMD] [TARGET_FILE_1] [TARGET_FILE_2] [TARGET_FILE_3] ... [TARGET_FILE_n]"

echo "Numer of arguments : $#"

if		[ $# -lt 1 ]; then
	echo "$usage"
	exit 1
else
	java -jar ~/DevEnv/bin/java/plantuml/plantuml.jar -verbose $@
fi

