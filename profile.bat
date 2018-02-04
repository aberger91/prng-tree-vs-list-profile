
cd bin
more ..\tests\tree.txt | assign1-0.exe 
gprof assign1-0.exe gmon.out > ..\data\gprof-assign1-0-tree.txt

more ..\tests\list.txt | assign1-0.exe 
gprof assign1-0.exe gmon.out > ..\data\gprof-assign1-0-list.txt

more ..\tests\tree.txt | assign1-2.exe 
gprof assign1-2.exe gmon.out > ..\data\gprof-assign1-2-tree.txt

more ..\tests\list.txt | assign1-2.exe 
gprof assign1-2.exe gmon.out > ..\data\gprof-assign1-2-list.txt

