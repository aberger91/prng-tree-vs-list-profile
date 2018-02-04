all:	assign1-0 assign1-2 clean

assign1-0:
	gcc -c -pg -O0 src/main.c
	gcc -c -pg -O0 src/tree.c
	gcc -c -pg -O0 src/list.c
	gcc -pg -O0 main.o tree.o list.o -o bin/assign1-0

assign1-2:
	gcc -c -pg -O2 src/main.c
	gcc -c -pg -O2 src/tree.c
	gcc -c -pg -O2 src/list.c
	gcc -pg -O2 main.o tree.o list.o -o bin/assign1-2

clean:
	-rm -f *.o

reset:
	-rm -f bin/assign1-0
	-rm -f bin/assign1-2
