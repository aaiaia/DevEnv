#!/bin/bash
usage="Usage:\tCMD [-u|-y] HEX(BIN)_FILE HEX(BIN)FILE"
if [ $# -lt 2 ]; then
	echo "$usage"
exit 1
elif    [ $# -eq 2 ] ; then
    colordiff <(xxd $1) <(xxd $2)
elif    [ $# -eq 3 ] ; then
    colordiff $1 <(xxd $2) <(xxd $3)
else
	echo "$usage"
	echo $0 "!!! Check Syntax"
fi


