#!/bin/bash
echo "mkgitdiff(v2)"

patch_file="patch.diff"
if    [ $# -eq 1 ] ; then
    patch_file="$1"
fi

echo -e "\033[36m"=========== Made Patch Context "(Below)" ============"\033[0m"
echo -e Base Path: "\033[36m"$(pwd)"\033[0m"
# --no-pager: No Scroll
# --no-prefix: Remove prefix on path, ex: a/Directory/... , b/Directory/...
# --relative: Base of path is set to current location
git --no-pager diff --no-prefix --relative .
echo -e Base Path: "\033[36m"$(pwd)"\033[0m"
echo -e "\033[36m"=========== Made Patch Context "(Above)" ============"\033[0m"
# --no-prefix: Remove prefix on path, ex: a/Directory/... , b/Directory/...
# --relative: Base of path is set to current location
git diff --no-prefix --relative . > $patch_file
