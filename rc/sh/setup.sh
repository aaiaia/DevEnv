#!/bin/bash
BASIC_ENV=../../.setup/env/sh/setup_env

source $BASIC_ENV

LABEL_S="# Updates PleYa Development Enviromnets auto setup, start"
LABEL_E="# Updates PleYa Development Enviromnets auto setup, end"

# To set bash(linux)
BASHRC_FILE=$HOME/.bashrc
if	[ -e $BASHRC_FILE ]; then
    VIMRC_COTENTS=`cat $HOME/.bashrc`

    if ! grep -q "$LABEL_S" <<< "$VIMRC_COTENTS"; then
        echo $LABEL_S >> $BASHRC_FILE
        echo "source $ENV_HOME/rc/sh/.dev_env_updates_rc" >> $BASHRC_FILE
        echo "source $ENV_HOME/rc/sh/.bashrc_linux" >> $BASHRC_FILE
        echo "source $ENV_HOME/rc/sh/.rust_lang_rc" >> $BASHRC_FILE
        echo $LABEL_E >> $BASHRC_FILE
        echo "Configured to \"$BASHRC_FILE\" for linux"
    else
        echo "Already configured to \"$BASHRC_FILE\""
    fi
fi

# To set zsh(MacOS)
ZSHRC_FILE=$HOME/.zshrc
if	[ -e $ZSHRC_FILE ]; then
    VIMRC_COTENTS=`cat $HOME/.zshrc`

    if ! grep -q "$LABEL_S" <<< "$VIMRC_COTENTS"; then
        echo $LABEL_S >> $ZSHRC_FILE
        echo "source $ENV_HOME/rc/sh/.dev_env_updates_rc" >> $ZSHRC_FILE
        echo "source $ENV_HOME/rc/sh/.zshrc_mac" >> $ZSHRC_FILE
        echo "source $ENV_HOME/rc/sh/.rust_lang_rc" >> $BASHRC_FILE
        echo $LABEL_E >> $ZSHRC_FILE
        echo "Configured to \"$ZSHRC_FILE\" for MaxOS"
    else
        echo "Already configured to \"$ZSHRC_FILE\""
    fi
fi

