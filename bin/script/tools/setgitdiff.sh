#!/bin/bash
echo "setgitdiff(v2)"

patch_file="patch.diff"
if    [ $# -eq 1 ] ; then
    patch_file="$1"
fi

echo "\033[33m"========== Before Applying Path =========="\033[0m"
git diff
patch -p0 < $patch_file
echo "\033[36m"=========== After Applying Path =========="\033[0m"
git diff
