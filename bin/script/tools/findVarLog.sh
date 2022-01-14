#!/bin/bash

version="find variables for project folder"

usage="Usage: $0 [VARIABLE NAME]"

find -L ./ -name "*.c" | xargs grep -n --color=always $1 | tee -a findVar.log
