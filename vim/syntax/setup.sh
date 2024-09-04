#!/bin/bash
BASIC_ENV=../../.setup/env/sh/setup_env

source $BASIC_ENV

VIM_DIR=$HOME/.vim
if [ ! -d $VIM_DIR ]; then
	mkdir $VIM_DIR
	echo "mkdir $VIM_DIR"
fi

CURRENT_TIME=$(date +%Y)-$(date +%m)-$(date +%d)_$(date +%H)$(date +%M)$(date +%S)
if [ -d $VIM_DIR/syntax ]; then    # Directory is exist
# Backup previous one
echo "Directory is exist, backup to ~/.vim/color_bak_$CURRENT_TIME"
mv $VIM_DIR/syntax $VIM_DIR/syntax_bak_$CURRENT_TIME
elif [ -L $VIM_DIR/syntax ]; then  # Symbolic Links is exist
# Backup previous one
echo "Symbolic link is exist, backup to ~/.vim/color_bak_$CURRENT_TIME"
mv $VIM_DIR/syntax $VIM_DIR/syntax_bak_$CURRENT_TIME
else                            # No file and link
echo "Not exist previous file and symbolic link"
fi
ln -fs  $ENV_HOME/vim/syntax ~/.vim
