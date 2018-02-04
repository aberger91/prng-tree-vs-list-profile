#!/bin/bash

if [ ! -d data ]; then
    mkdir data
fi

for prog in bin/*; do
    for testfile in tests/*; do
        cat $testfile | $prog
        gprof $prog gmon.out > data/$("$prog" + ".txt")
    done
done

