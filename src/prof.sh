#!/bin/bash

cat tree_input.txt | ./hw1
gprof hw1 gmon.out > gprof-hw1.tree.txt

cat list_input.txt | ./hw1
gprof hw1 gmon.out > gprof-hw1.list.txt

cat tree_input.txt | ./hw1.00
gprof hw1.00 gmon.out > gprof-hw1.00.tree.txt

cat list_input.txt | ./hw1.00
gprof hw1.00 gmon.out > gprof-hw1.00.list.txt

