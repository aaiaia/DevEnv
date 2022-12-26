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
if [ ! $# -eq 2 ] ; then
    echo "\"$0\" needs two arguments"
    echo "[CMD] [TARGET_FILE] [INFO_FILE]"
    echo "$0 ~/target_file ~/info_file"
    exit 1
fi

TARGET_FILE=$1
INFO_FILE=$2

HASH_VAL=($(sha256sum $1))

echo "file: $TARGET_FILE -> $HASH_VAL"
echo "$HASH_VAL" > $INFO_FILE
