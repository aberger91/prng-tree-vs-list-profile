***
##  Profiling in C
##### Comparing the performance of inserting random numbers into a linked list, binary tree  with compiler optimizations
***
### Install && Build
```bash
sudo apt-get install make
```
```bash
# run the program with no optimizations
bin/assign1-0

# use tests configs to pass output
cat tests/tree.txt | bin/assign1-0

# use tests configs to pass output
cat tests/list.txt | bin/assign1-2
```

### Timing Performance & Call Graph
```bash
gprof -b bin/assign0-2 bin/gmon.out | less
```

### Examples
Each sample counts as 0.01 seconds.

