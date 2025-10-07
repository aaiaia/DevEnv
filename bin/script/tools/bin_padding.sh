#!/bin/bash
DEFAULT_FILE_BINARY="binary.bin"
DEFAULT_FILE_PADDED="binary_padded.bin"
DEFAULT_PAD_VALUE="0x00"
DEFAULT_MOD_SIZE=8

file_binary=$DEFAULT_FILE_BINARY
file_padded=$DEFAULT_FILE_PADDED
pad_value=$DEFAULT_PAD_VALUE
mod_size=$DEFAULT_MOD_SIZE

echo $0" [BIN_FILE:(.bin)] [PADDED_BIN_FILE:(.bin)] [MODULO:8/0x8]"

if [ $# -lt 1 ]; then
    echo default params
fi
if [ $# -ge 1 ]; then
    file_binary=$1
    file_padded=${file_binary%.*}"_padded.bin"
fi
if [ $# -ge 2 ]; then
    file_padded=$2
fi
if [ $# -ge 3 ]; then
    __input=$3
    if [[ "$__input" =~ ^0x[0-9a-fA-F]+$ ]]; then
        # hex
        __input="${__input#0x}"
        __input=$((16#"$__input"))
    elif [[ ! "$__input" =~ ^[0-9]+$ ]]; then
        echo Invalid decimal: $__input
    fi
    mod_size=$__input
fi
if [ $# -gt 3 ]; then
    echo "arguments has too long!!!"
    exit 1
fi

echo "[Params]"
echo "Input :" $file_binary
echo "Output:" $file_padded
echo "Modulo:" $mod_size

if [ ! -f $file_binary ]; then
    echo "File Not Found: "$file_binary
    exit 1
fi
if [ -f $file_padded ]; then
    echo "Remove Previous File: "$file_padded
    echo rm $file_padded
    rm $file_padded
fi

file_size=$(stat -c%s "$file_binary")
rem_size=$((10#"$file_size" % 10#"$mod_size"))
if [ ! $rem_size -eq 0 ]; then
    pad_size=$((10#"$mod_size" - 10#"$rem_size"))
else
    pad_size=0

    echo Has No Remainder, Just use it: $file_binary
    echo hexdump -C $file_binary
    hexdump -C $file_binary
    exit 0
fi
end_size=$((10#"$file_size" + 10#"$pad_size"))

pad_offset=$(printf "0x%x" "$file_size")
end_offset=$(printf "0x%x" "$end_size")

echo file_size : $file_size Bytes
echo rem_size  : $rem_size Bytes
echo pad_size  : $pad_size Bytes
echo end_size  : $end_size Bytes
echo pad_offset: $pad_offset
echo end_offset: $end_offset

srec_cat "$file_binary" -Binary \
    -fill "$pad_value" "$pad_offset" "$end_offset" \
    -o "$file_padded" -Binary

echo hexdump -C $file_binary
hexdump -C $file_binary

echo hexdump -C $file_padded
hexdump -C $file_padded

echo "[Result]"
echo "Input :" $file_binary
echo "Output:" $file_padded
echo "Modulo:" $mod_size

