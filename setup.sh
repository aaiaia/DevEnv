#!/bin/bash
BASIC_ENV=./.setup/env/sh/setup_env

source $BASIC_ENV

if	[ -e $BASIC_ENV ]; then
	chmod 700 $ENV_HOME
	echo "chmod 700 $ENV_HOME"

    echo "Configuring shell env."
    cd ./rc/sh
	echo "Move directory: $PWD"
	echo "Run setup script..."
	./setup.sh
	cd $ENV_HOME
	echo "Back dirrectory: $PWD"

    echo "Configuring vim env."
	cd ./vim/colors
	echo "Move directory: $PWD"
	echo "Run setup script..."
	./setup.sh
	cd $ENV_HOME
	echo "Back dirrectory: $PWD"

	cd ./rc/vim
	echo "Move directory: $PWD"
	echo "Run setup script..."
	./setup.sh
	cd $ENV_HOME
	echo "Back dirrectory: $PWD"

	cd ./rc/nvim
	echo "Move directory: $PWD"
	echo "Run setup script..."
	./setup.sh
	cd $ENV_HOME
	echo "Back dirrectory: $PWD"

else
	echo "Error!!! basic shell environments file is not exist"
fi
