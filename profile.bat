make clean && make reset
make

objdump -d bin\assign1-0.exe > data\objdump-assign1-0.txt
objdump -d bin\assign1-2.exe > data\objdump-assign1-2.txt

more tests\tree.txt | bin\assign1-0.exe 
gprof bin\assign1-0.exe gmon.out > data\gprof-assign1-0-tree.txt

more tests\list.txt | bin\assign1-0.exe 
gprof bin\assign1-0.exe gmon.out > data\gprof-assign1-0-list.txt

more tests\tree.txt | bin\assign1-2.exe 
gprof bin\assign1-2.exe gmon.out > data\gprof-assign1-2-tree.txt

more tests\list.txt | bin\assign1-2.exe 
gprof bin\assign1-2.exe gmon.out > data\gprof-assign1-2-list.txt

