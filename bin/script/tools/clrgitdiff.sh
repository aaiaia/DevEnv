#!/bin/bash
echo "clrgitdiff(v2)"

patch_file="patch.diff"
if    [ $# -eq 1 ] ; then
    patch_file="$1"
fi

echo "\033[33m"========== Before Applying Path =========="\033[0m"
git diff
# -R: Remove, Revert or Remove?
# -p0: Remove parent path, ex: -p0 a/b/c/d, -p1 b/c/d, -p2 c/d, ...
patch -R -p0 < $patch_file
echo "\033[36m"=========== After Applying Path =========="\033[0m"
git diff
