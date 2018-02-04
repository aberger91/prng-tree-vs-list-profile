#!/bin/bash

if [ ! -d data ]; then
    mkdir data
fi

gcc -c -pg -O0 src/main.c -o bin/main.o
objdump -d bin/main.o > data/objdump-main.O0.txt
rm bin/main.o

gcc -c -pg -O2 src/main.c -o bin/main.o
objdump -d bin/main.o > data/objdump-main.O2.txt
rm bin/main.o

for prog in bin/*; do
    for testfile in tests/*; do
        cat $testfile | $prog
        gprof $prog gmon.out > data/$("$prog" + ".txt")
    done
done

