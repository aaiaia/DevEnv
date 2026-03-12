#!/bin/bash
patch_file="patch.diff"
mode=""
key_none=""
key_mk="mk"
key_set="set"
key_clr="clr"
cmd_mk="mkgitdiff"
cmd_set="setgitdiff"
cmd_clr="clrgitdiff"
# mode selection
if [ $# -ge 1 ] ; then
    mode="$1"
fi
# diff file set
if [ $# -ge 2 ] ; then
    patch_file="$2"
fi

echo "Mode: ""$mode"
echo "Patch: ""$patch_file"

if [[ "$mode" == "$key_none" ]] ; then
    echo "Mode is not selected(support: "$key_mk", "$key_set", "$key_clr")"
    exit 1
fi

if [[ "$mode" == "$key_mk" ]] ; then
    if [[ "$(command -v $cmd_mk)" != "" ]] ; then
        $cmd_mk $patch_file
    else
        ./$cmd_mk.sh $patch_file #current path
    fi
elif [[ "$mode" == "$key_set" ]] ; then
    if [[ "$(command -v $cmd_set)" != "" ]] ; then
        $cmd_set $patch_file
    else
        ./$cmd_set.sh $patch_file #current path
    fi
elif [[ "$mode" == "$key_clr" ]] ; then
    if [[ "$(command -v $cmd_clr)" != "" ]] ; then
        $cmd_clr $patch_file
    else
        ./$cmd_clr.sh $patch_file #current path
    fi
else
    echo "Mode is wroong: ""$mode"
fi
