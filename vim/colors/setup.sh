#!/bin/bash
if [ ! -d ~/.vim ]; then
mkdir ~/.vim
fi

CURRENT_TIME=$(date +%Y)-$(date +%m)-$(date +%d)_$(date +%H)$(date +%M)$(date +%S)
if [ -d ~/.vim/colors ]; then    # Directory is exist
# Backup previous one
echo "Directory is exist, backup to ~/.vim/color_bak_$CURRENT_TIME"
mv ~/.vim/colors ~/.vim/colors_bak_$CURRENT_TIME
elif [ -L ~/.vim/colors ]; then  # Symbolic Links is exist
# Backup previous one
echo "Symbolic link is exist, backup to ~/.vim/color_bak_$CURRENT_TIME"
mv ~/.vim/colors ~/.vim/colors_bak_$CURRENT_TIME
else                            # No file and link
echo "Not exist previous file and symbolic link"
fi
ln -fs  ~/DevEnv/vim/colors ~/.vim
