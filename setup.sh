#!/bin/bash
BASIC_ENV=./.setup/env/sh/setup_env

source $BASIC_ENV

CURRENT_DIR=$PWD
if	[ -e $BASIC_ENV ]; then
	chmod 700 $ENV_HOME
	echo "chmod 700 $ENV_HOME"

	# Config vim colors
	CURRENT_DIR=$PWD
	echo "Backup loaction: $CURRENT_DIR"
	cd ./vim/colors
	echo "Move directory: $PWD"
	echo "Run vim setup script..."
	./setup.sh
	cd $CURRENT_DIR
	echo "Back dirrectory: $PWD"

else
	echo "Error!!! basic shell environments file is not exist"
fi
