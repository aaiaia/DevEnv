#!/bin/bash
echo "clrgitdiff(v2)"

patch_file="patch.diff"
if    [ $# -eq 1 ] ; then
    patch_file="$1"
fi

echo -e "\033[33m"========== Before Applying Patch "(Below)" =========="\033[0m"
echo -e Base Path: "\033[36m"$(pwd)"\033[0m"
# --no-pager: No Scroll
# --relative: Base of path is set to current location
git --no-pager diff --relative .
echo -e Base Path: "\033[36m"$(pwd)"\033[0m"
echo -e "\033[33m"========== Before Applying Patch "(Above)" =========="\033[0m"
# -R: Remove, Revert or Remove?
# -p0: Remove parent path, ex: -p0 a/b/c/d, -p1 b/c/d, -p2 c/d, ...
patch -R -p0 < $patch_file
echo -e "\033[36m"=========== After Applying Patch "(Below)" =========="\033[0m"
echo -e Base Path: "\033[36m"$(pwd)"\033[0m"
# --relative: Base of path is set to current location
git diff --relative .
echo -e Base Path: "\033[36m"$(pwd)"\033[0m"
echo -e "\033[36m"=========== After Applying Patch "(Above)" =========="\033[0m"
