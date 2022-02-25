#!/bin/bash
BASIC_ENV=../../.setup/env/sh/setup_env

source $BASIC_ENV

VIMRC_FILE=$HOME/.vimrc
if	[ ! -e $VIMRC_FILE ]; then
	touch $VIMRC_FILE
	echo "touch $VIMRC_FILE"
fi


VIMRC_LABEL="##########\ VIMRC_AUTO_ADD\ ##########"
VIMRC_COTENTS=`cat $HOME/.vimrc`
if	[[! "$VIMRC_CONTENS" =~ "$VIMRC_LABEL"]]; then
fi

