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

> Run the program twice timing it both times, and answer the following:
> How for 3 million numbers how many self seconds did generateList() take?

     %   cumulative   self              self     total           
    time   seconds   seconds    calls   s/call   s/call  name    
    100.45    267.01   267.01        1   267.01   267.01  generateList

> How for 3 million numbers how many self seconds did generateTree() take?

     %   cumulative   self              self     total           
     time   seconds   seconds    calls  ms/call  ms/call  name    
     93.42      0.71     0.71        1   710.00   730.00  generateTree

> Run the program twice timing it both times, and answer the following:
> How for 3 million numbers how many self seconds did generateList() take?

     %   cumulative   self              self     total           
     time   seconds   seconds    calls   s/call   s/call  name    
     99.88    267.07   267.07        1   267.07   267.09  generateList

> How for 3 million numbers how many self seconds did generateTree() take?

     %   cumulative   self              self     total           
     time   seconds   seconds    calls  ms/call  ms/call  name    
     83.64      0.46     0.46        1   460.00   470.00  generateTree

> Please find the following inside of assign1-0 by using objdump.
1. A) Integer entry in obtainNumberBetween
2. B) The string "What would you like to do?\n..." in main()
3. C) The code for getNextNumber()
4. D) The global variable low

| Question | Command                             | Results | Comment                                                 |
|----------+-------------------------------------+---------+---------------------------------------------------------|
| A        | objdump -d -j .text bin/assign1-0   | N       | Integer entry in obtainNumberBetween lives on the stack |
| B        | objdump -s -j .rodata bin/assign1-0 | Y       |                                                         |
| C        | objdump -d -j .text bin/assign1-0   | Y       |                                                         |
| D        | objdump -t -j .bss bin/assign1-0    | Y       |                                                         |

