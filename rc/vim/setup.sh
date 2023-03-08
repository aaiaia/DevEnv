#!/bin/bash
BASIC_ENV=../../.setup/env/sh/setup_env

source $BASIC_ENV

# check modified self
$ENV_HOME/.setup/bin/calHash.sh $0 .setup_info # cal hash self

VIMRC_FILE=$HOME/.vimrc
if	[ ! -e $VIMRC_FILE ]; then
	touch $VIMRC_FILE
	echo "touch $VIMRC_FILE"
fi

VIMRC_LABEL_COMMON_START="\" PleYa Development Enviromnets auto setup, start"
VIMRC_LABEL_COMMON_END="\" PleYa Development Enviromnets auto setup, end"
VIMRC_COTENTS=`cat $HOME/.vimrc`

if ! grep -q "$VIMRC_LABEL_COMMON_START" <<< "$VIMRC_COTENTS"; then
    echo $VIMRC_LABEL_COMMON_START >> $VIMRC_FILE
    echo "source $ENV_HOME/rc/vim/vimrc_common" >> $VIMRC_FILE
    echo $VIMRC_LABEL_COMMON_END >> $VIMRC_FILE
    echo "Configured to \"$VIMRC_FILE\""
else
    echo "Already configured to \"$VIMRC_FILE\""
fi

VIMRC_LABEL_VUNDLE_START="\" Vundle PlugIn auto setup, start"
VIMRC_LABEL_VUNDLE_END="\" Vundle PlugIn auto setup, end"
VIMRC_COTENTS=`cat $HOME/.vimrc`

if ! grep -q "$VIMRC_LABEL_VUNDLE_START" <<< "$VIMRC_COTENTS"; then
    echo $VIMRC_LABEL_VUNDLE_START >> $VIMRC_FILE
    echo "source $ENV_HOME/rc/vim/vimrc_vundle" >> $VIMRC_FILE
    echo $VIMRC_LABEL_VUNDLE_END >> $VIMRC_FILE
    echo "Configured to \"$VIMRC_FILE\""
else
    echo "Already configured to \"$VIMRC_FILE\""
fi
