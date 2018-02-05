#!/bin/bash

if [ ! -d data ]; then
    mkdir data
fi

objdump -d bin/assign1-0 > data/objdump-assign1-0.txt
objdump -d bin/assign1-2 > data/objdump-assign1-2.txt

for prog in bin/*; do
    for testfile in tests/*; do
        #cat $testfile | $prog
        ls -lt data/$("$prog" + ".txt")
    done
done

