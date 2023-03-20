#!/bin/bash
BASIC_ENV=../../.setup/env/sh/setup_env

source $BASIC_ENV

NVIMRC_PATH=$HOME/.config/nvim/
NVIMRC_FILE=init.vim
NVIMRC_TARGET=$NVIMRC_PATH/$NVIMRC_FILE
if  [ ! -d $NVIMRC_PATH ]; then
    mkdir -p $NVIMRC_PATH
    echo "mkdir -p $NVIMRC_PATH"
else
    echo "directory '$NVIMRC_PATH' is exist!!!"
fi
if	[ ! -f $NVIMRC_TARGET ]; then
	touch $NVIMRC_TARGET
	echo "touch $NVIMRC_TARGET"
else
    echo "file '$NVIMRC_TARGET' is exist!!!"
fi

NVIMRC_LABEL_COMMON_START="\" PleYa Development Enviromnets nvim auto setup, start"
NVIMRC_LABEL_COMMON_END="\" PleYa Development Enviromnets nvim auto setup, end"
NVIMRC_CONTEXT=`cat $NVIMRC_TARGET`
NVIMRC_ADDED_NEW=`cat $HOME/DevEnv/rc/nvim/nvimrc_common`

if ! grep -q "$NVIMRC_LABEL_COMMON_START" <<< "$NVIMRC_CONTEXT"; then
    echo $NVIMRC_LABEL_COMMON_START >> $NVIMRC_TARGET
    echo "$NVIMRC_ADDED_NEW" >> $NVIMRC_TARGET
    echo $NVIMRC_LABEL_COMMON_END >> $NVIMRC_TARGET
    echo "Configured to \"$NVIMRC_TARGET\""
else
    echo "Already configured to \"$NVIMRC_FILE\""
fi
