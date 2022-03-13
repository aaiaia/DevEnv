#!/bin/bash
BASIC_ENV=../../.setup/env/sh/setup_env
source $BASIC_ENV

# Print Arguments
args=("$@")
for((i=0; i<$#; i++))
do
    echo "args[$i]: \"${args[$i]}\""
done

# Check number of arguments
if [ ! $# -eq 3 ] ; then
    echo "\"$0\" needs two arguments"
    echo "[CMD] [FILE_PATH] ['LABEL_STRINT_START'] ['LABEL_STRING_END']"
    echo "$0 ~/target_file '# target index, start' '# target index, end'"
    exit 1
fi

#TARGET_FILE=~/_testDir/testFile
TARGET_FILE=$1
if [ ! -e $TARGET_FILE ] ; then
    echo "File is not exist: \"$TARGET_FILE\""
    exit 1
fi

#LABEL_S="# Updates PleYa Development Enviromnets auto setup, start"
#LABEL_E="# Updates PleYa Development Enviromnets auto setup, end"
LABEL_S=$2
LABEL_E=$3
if [ -z "$LABEL_S" ] || [ -z "$LABEL_E" ] ; then
    echo "One or more labels are blank, Check label: "
    echo "	=> \"$LABEL_S\""
    echo "	=> \"$LABEL_E\""
    exit 1
fi

LINE_S=`grep -n "$LABEL_S" $TARGET_FILE | cut -d':' -f1`
LINE_E=`grep -n "$LABEL_E" $TARGET_FILE | cut -d':' -f1`
if [ ! -z $LINE_S ] && [ -z $LINE_E ] || [ -z $LINE_S ] && [ ! -z $LINE_E ] ; then
    echo "Context is broken!!! Check label: "
    echo "	=> \"$LABEL_S\""
    echo "	=> \"$LABEL_E\""
    exit 1
elif [ ! -z $LINE_S ] && [ ! -z $LINE_E ] ; then
    sed -i "${LINE_S},${LINE_E}d" $TARGET_FILE
    echo "Remove line: ${LINE_S}~${LINE_E}"
    exit 0
elif [ -z $LINE_S ] &&[ -z $LINE_E ] ; then
    echo "\"$TARGET_FILE\" already removed contexts"
    exit 0
fi

