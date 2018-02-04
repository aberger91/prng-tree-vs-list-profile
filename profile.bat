
gcc -c -pg -O0 src\main.c -o bin\main.o
objdump -d bin\main.o > data\objdump-main.O0.o

gcc -c -pg -O2 src\main.c -o bin\main.o
objdump -d bin\main.o > data\objdump-main.O2.o

cd bin
more ..\tests\tree.txt | assign1-0.exe 
gprof assign1-0.exe gmon.out > ..\data\gprof-assign1-0-tree.txt

more ..\tests\list.txt | assign1-0.exe 
gprof assign1-0.exe gmon.out > ..\data\gprof-assign1-0-list.txt

more ..\tests\tree.txt | assign1-2.exe 
gprof assign1-2.exe gmon.out > ..\data\gprof-assign1-2-tree.txt

more ..\tests\list.txt | assign1-2.exe 
gprof assign1-2.exe gmon.out > ..\data\gprof-assign1-2-list.txt

