#!/bin/bash
BASIC_ENV=../../.setup/env/sh/setup_env

source $BASIC_ENV

LABEL_S="# Updates PleYa Development Enviromnets auto setup, start"
LABEL_E="# Updates PleYa Development Enviromnets auto setup, end"

TARGET_FILE=~/_testDir/testFile

LINE_S=`grep -n "$LABEL_S" $TARGET_FILE | cut -d':' -f1`
LINE_E=`grep -n "$LABEL_E" $TARGET_FILE | cut -d':' -f1`

echo "LINE_S: \"$LINE_S\""
echo "LINE_E: \"$LINE_E\""

sed -i "${LINE_S},${LINE_E}d" $TARGET_FILE

