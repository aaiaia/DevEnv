#!/bin/bash
DEFAULT_FILE_BINARY="binary.bin"
DEFAULT_FILE_SREC="srecord.s19"
DEFAULT_SREC_OFFSET="0x0000"

file_binary=$DEFAULT_FILE_BINARY
file_srec=$DEFAULT_FILE_SREC
srec_offset=$DEFAULT_SREC_OFFSET

echo $0" [BIN_FILE:(.bin)] [SREC_FILE:(.s19)] [SREC_OFFSET:16bit Hex, 0x0000]"

if [ $# -lt 1 ]; then
    echo default params
fi
if [ $# -ge 1 ]; then
    file_binary=$1
    file_srec=${file_binary%.*}".s19"
fi
if [ $# -ge 2 ]; then
    file_srec=$2
fi
if [ $# -ge 3 ]; then
    srec_offset=$3
fi
if [ $# -gt 3 ]; then
    echo "arguments has too long!!!"
    exit 1
fi

echo "[Params]"
echo "Input :" $file_binary
echo "Output:" $file_srec
echo "Offset:" $srec_offset

if [ ! -f $file_binary ]; then
    echo "File Not Found: "$file_binary
    exit 1
fi
if [ -f $file_srec ]; then
    echo "Remove Previous File: "$file_srec
    echo rm $file_srec
    rm $file_srec
fi

srec_cat "$file_binary" -Binary -offset "$srec_offset" -o "$file_srec" -Motorola

echo hexdump -C $file_binary
hexdump -C $file_binary

echo "cat "$file_srec
cat $file_srec

echo "[Result]"
echo "Input :" $file_binary
echo "Output:" $file_srec
echo "Offset:" $srec_offset

