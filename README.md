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

                  | %time | cumulative seconds | self  seconds | self calls | total s/call         | s/call | name   |
                  |-------+--------------------+---------------+------------+----------------------+--------+--------+---------------------|
                  | 99.59 | 259.06             | 259.06        | 1          | 259.06        259.13 |        |        | generateList        |
                  | 0.19  | 259.55             | 0.49          | 1          | 0.49     0.56        |        |        | generateTree        |
                  | 0.15  | 259.94             | 0.39          |            |                      |        |        | _mcount_private     |
                  | 0.01  | 260.10             | 0.03          |            |                      |        |        | __fentry__          |
                  | 0.00  | 260.11             | 0.01          | 1          |                      | 0.01   | 259.13 | countWithList       |
                  | 0.00  | 260.12             | 0.01          | 1          |                      | 0.01   | 0.01   | printTree           |
                  | 0.00  | 260.12             | 0.00          | 6          |                      | 0.00   | 0.00   | obtainNumberBetween |
                  | 0.00  | 260.12             | 0.00          | 2          |                      | 0.00   | 0.00   | freeTree            |
                  | 0.00  | 260.12             | 0.00          | 1          |                      | 0.00   | 0.56   | countWithTree       |

