#!/bin/bash
SYMBOLIC_LINK_LIST=()
# Find and Change
SYMBOLIC_LINK_LIST+=("../script/tools/findstr.sh"           "findstr")
SYMBOLIC_LINK_LIST+=("../script/tools/findstringconcat.sh"  "findstrcc")
SYMBOLIC_LINK_LIST+=("../script/tools/findwd.sh"            "findwd")
SYMBOLIC_LINK_LIST+=("../script/tools/findwordconcat.sh"    "findwdcc")
SYMBOLIC_LINK_LIST+=("../script/tools/chgstr.sh"            "chgstr")
SYMBOLIC_LINK_LIST+=("../script/tools/chgwd.sh"             "chgwd")

# viewing sources
SYMBOLIC_LINK_LIST+=("../script/tools/mkcscope.sh"          "mkcscope")
SYMBOLIC_LINK_LIST+=("../script/tools/mkctag.sh"            "mkctag")
SYMBOLIC_LINK_LIST+=("../script/tools/mkpumltags.sh"        "mkptag")
SYMBOLIC_LINK_LIST+=("../java/plantuml/plantuml.sh"         "mkpuml")

# diffs
SYMBOLIC_LINK_LIST+=("../script/tools/diffhex.sh"           "diffhex")

# git for additional
SYMBOLIC_LINK_LIST+=("../script/tools/gitpatch.sh"          "gitpatch")
SYMBOLIC_LINK_LIST+=("../script/tools/mkgitdiff.sh"         "mkgitdiff")
SYMBOLIC_LINK_LIST+=("../script/tools/clrgitdiff.sh"        "clrgitdiff")
SYMBOLIC_LINK_LIST+=("../script/tools/setgitdiff.sh"        "setgitdiff")

# Binary
SYMBOLIC_LINK_LIST+=("../script/tools/bin2srec.sh"          "bin2srec")
SYMBOLIC_LINK_LIST+=("../script/tools/bin_padding.sh"       "bin_padding")
SYMBOLIC_LINK_LIST+=("../script/tools/srec2bin.sh"          "srec2bin")

SYMBOLIC_LINK_LEN=${#SYMBOLIC_LINK_LIST[@]}

#ln -s [ORIG] [LINK]
for ((i=0; i<SYMBOLIC_LINK_LEN; i+=2)); do
    ORIG="${SYMBOLIC_LINK_LIST[i+0]}"
    LINK="${SYMBOLIC_LINK_LIST[i+1]}"
    if [ -f "$LINK" ]; then
        rm $LINK
        echo "re-link: $ORIG to  $LINK"
    else
        echo "new-link, $ORIG to  $LINK"
    fi
    ln -s $ORIG $LINK
done
