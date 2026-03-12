#!/bin/bash
echo "mkgitdiff(v2)"

patch_file="patch.diff"
if    [ $# -eq 1 ] ; then
    patch_file="$1"
fi

echo "\033[36m"=========== Made Path Context ============"\033[0m"
# --no-prefix: Remove prefix on path, ex: a/Directory/... , b/Directory/...
# --relative: Base of path is set to current location
git diff --no-prefix --relative
git diff --no-prefix --relative > $patch_file
