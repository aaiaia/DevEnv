#!/bin/bash
BASIC_ENV=../../.setup/env/sh/setup_env

source $BASIC_ENV

VIMRC_FILE=$HOME/.vimrc
if	[ ! -e $VIMRC_FILE ]; then
	touch $VIMRC_FILE
	echo "touch $VIMRC_FILE"
fi

VIMRC_LABEL_START="\" PleYa Development Enviromnets auto setup, start"
VIMRC_LABEL_END="\" PleYa Development Enviromnets auto setup, end"
VIMRC_COTENTS=`cat $HOME/.vimrc`

if ! grep -q "$VIMRC_LABEL_START" <<< "$VIMRC_COTENTS"; then
    echo $VIMRC_LABEL_START >> $VIMRC_FILE
    echo "source $ENV_HOME/rc/vim/vimrc_common" >> $VIMRC_FILE
    echo $VIMRC_LABEL_END >> $VIMRC_FILE
    echo "Configured to \"$VIMRC_FILE\""
else
    echo "Already configured to \"$VIMRC_FILE\""
fi
