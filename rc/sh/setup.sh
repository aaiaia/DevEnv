#!/bin/bash
BASIC_ENV=../../.setup/env/sh/setup_env

source $BASIC_ENV

LABAL_START="# Updates PleYa Development Enviromnets auto setup, start"
LABAL_END="# Updates PleYa Development Enviromnets auto setup, end"

# To set bash(linux)
BASHRC_FILE=$HOME/.bashrc
if	[ -e $BASHRC_FILE ]; then
    VIMRC_COTENTS=`cat $HOME/.bashrc`

    if ! grep -q "$LABAL_START" <<< "$VIMRC_COTENTS"; then
        echo $LABAL_START >> $BASHRC_FILE
        echo "source $ENV_HOME/rc/sh/.dev_env_updates_rc" >> $BASHRC_FILE
        echo "source $ENV_HOME/rc/sh/.bashrc_linux" >> $BASHRC_FILE
        echo $LABAL_END >> $BASHRC_FILE
        echo "Configured to \"$BASHRC_FILE\" for linux"
    else
        echo "Already configured to \"$BASHRC_FILE\""
    fi
fi

# To set zsh(MacOS)
ZSHRC_FILE=$HOME/.zshrc
if	[ -e $ZSHRC_FILE ]; then
    VIMRC_COTENTS=`cat $HOME/.zshrc`

    if ! grep -q "$LABAL_START" <<< "$VIMRC_COTENTS"; then
        echo $LABAL_START >> $ZSHRC_FILE
        echo "source $ENV_HOME/rc/sh/.dev_env_updates_rc" >> $ZSHRC_FILE
        echo "source $ENV_HOME/rc/sh/.zshrc_mac" >> $ZSHRC_FILE
        echo $LABAL_END >> $ZSHRC_FILE
        echo "Configured to \"$ZSHRC_FILE\" for MaxOS"
    else
        echo "Already configured to \"$ZSHRC_FILE\""
    fi
fi

