#!/bin/bash
DEFAULT_FILE_BIN="binary.bin"
DEFAULT_FILE_SREC="srecord.s19"
DEFAULT_SREC_BASE="0000"
DEFAULT_SREC_SIZE="0100"

file_bin=$DEFAULT_FILE_BIN
file_srec=$DEFAULT_FILE_SREC
base=$DEFAULT_SREC_BASE
size=$DEFAULT_SREC_SIZE

echo $0" [FILE:S-RECORED] [BASE:HEX(0xF000)] [SIZE:HEX(0xF0)]"

if [ $# -lt 1 ]; then
    echo default param
fi
if [ $# -ge 1 ]; then
    file_srec=$1
    file_bin=${file_srec%.*}".bin"
fi
if [ $# -ge 2 ]; then
    __input=$2
    if [[ "$__input" =~ ^0x[0-9a-fA-F]+$ ]]; then
        base="${__input#0x}"
    elif [[ "$__input" =~ ^[0-9]+$ ]]; then
        base=$(printf "%x" $__input)
    else
        echo "Invalid hex(dec) input: $__input"
        exit 1
    fi
fi
if [ $# -ge 3 ]; then
    __input=$3
    if [[ "$__input" =~ ^0x[0-9a-fA-F]+$ ]]; then
        size="${__input#0x}"
    elif [[ "$__input" =~ ^[0-9]+$ ]]; then
        size=$(printf "%x" $__input)
    else
        echo "Invalid hex(dec) input: $__input"
        exit 1
    fi
fi
if [ $# -gt 3 ]; then
    echo "arguments has too long!!!"
    exit 1
fi

#hex to decimal
size=$((16#"$size"))
#remove "0x"
base="${base#0x}"

echo [PARAM]
echo file: $file_srec
echo base: 0x$base
echo size: $size Bytes

if [ ! -f $file_srec ]; then
    echo File Not Found: $file_srec
    exit 1
fi
if [ -f $file_bin ]; then
    echo remove previous bin file: $file_bin
    rm $file_bin
fi

srec_to_bin_file="_tmp_pleya_srec.bin"
cut_out_tail_bin_file="_tmp_pleya_cut_out_tail.bin"
cut_out_head_bin_file="_tmp_pleya_cut_out_head.bin"

echo "Print S-Record Info"
srec_info $file_srec

echo "Convert $file_srec to $srec_to_bin_file, using \"srec_cat\""
srec_cat $file_srec -Motorola -o "$srec_to_bin_file" -Binary

echo hexdump all of srec
hexdump -C $srec_to_bin_file

file_size=$(stat -c%s "$srec_to_bin_file")
echo "file_size:$file_size bytes"
if [ $((16#"$base")) -ge $file_size ]; then
    echo Base \'0x$base\($((16#"$base"))\)\' can\'t be exceed binary $file_size Bytes!!!
    exit 1
fi

parsable_size=$((10#"$file_size" - 16#"$base"))
echo "parsable_size:$parsable_size bytes"
if [ $size -gt $parsable_size ]; then
    echo Size $size Bytes can\'t be greater then $parsable_size Bytes!!!
    exit 1
fi

head_size=$((16#"$base" + 10#"$size"))
tail_size=$size

echo "head_size:$head_size bytes"
echo "tail_size:$tail_size bytes"

echo "Cut out tail from \"$srec_to_bin_file\" to \"$cut_out_tail_bin_file\", head size:$head_size bytes"
head -c "$head_size" "$srec_to_bin_file" > "$cut_out_tail_bin_file"

echo "Cut out head from \"$cut_out_tail_bin_file\" to \"$cut_out_head_bin_file\", tail size:$tail_size bytes"
tail -c "$tail_size" "$cut_out_tail_bin_file" > "$cut_out_head_bin_file"

cp $cut_out_head_bin_file $file_bin

echo hexdump -C $file_bin
hexdump -C $file_bin

echo [Output]
echo Binary: $file_bin
#remove temp file
rm _tmp_pleya_*.bin

