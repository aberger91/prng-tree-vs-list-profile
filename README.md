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
gprof -b bin/assign1-2 bin/gmon.out | less
```

### Examples
> _Run the program twice timing it both times, and answer the following:_
<br>
> __How for 3 million numbers how many self seconds did generateList() take?__

     %   cumulative   self              self     total           
    time   seconds   seconds    calls   s/call   s/call  name    
    100.45    267.01   267.01        1   267.01   267.01  generateList

> __How for 3 million numbers how many self seconds did generateTree() take?__

     %   cumulative   self              self     total           
     time   seconds   seconds    calls  ms/call  ms/call  name    
     93.42      0.71     0.71        1   710.00   730.00  generateTree

> _Run the program twice timing it both times, and answer the following:_
<br>
> __How for 3 million numbers how many self seconds did generateList() take?__

     %   cumulative   self              self     total           
     time   seconds   seconds    calls   s/call   s/call  name    
     99.88    267.07   267.07        1   267.07   267.09  generateList

> __How for 3 million numbers how many self seconds did generateTree() take?__

     %   cumulative   self              self     total           
     time   seconds   seconds    calls  ms/call  ms/call  name    
     83.64      0.46     0.46        1   460.00   470.00  generateTree

***
> __Please find the following inside of assign1-0 by using objdump.__
-  A) __Integer entry in obtainNumberBetween__
-  B) __The string "What would you like to do?\n..." in main()__
-  C) __The code for getNextNumber()__
-  D) __The global variable low__

 Question | Command                                     | Results | Comment                                                 
----------|---------------------------------------------|---------|---------------------------------------------------------
 __A__    | ```objdump -t -j .bss bin/assign1-0```     | N       | Integer entry in obtainNumberBetween lives on the stack 
 __B__    | ```objdump -s -j .rodata bin/assign1-0```   | Y       | Constants are in the .rodata section                                                        
 __C__    | ```objdump -d -j .text bin/assign1-0```     | Y       | Code is stored in the .text section                                                         
 __D__    | ```objdump -t -j .bss bin/assign1-0 ```     | Y       | Uninitialized variables are in .bss                                                        

### Optimizations from the Compiler

- __objdump-main.00.txt__
<br>

```
00000000000000a5 <main>:
 a5:	55                   	push   %rbp
 a6:	48 89 e5             	mov    %rsp,%rbp
 a9:	48 83 ec 30          	sub    $0x30,%rsp
 ad:	e8 00 00 00 00       	callq  b2 <main+0xd>
 b2:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
 b9:	00 
 ba:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 be:	ba ff 7f 00 00       	mov    $0x7fff,%edx
 c3:	be 00 00 00 00       	mov    $0x0,%esi
 c8:	48 89 c7             	mov    %rax,%rdi
 cb:	e8 00 00 00 00       	callq  d0 <main+0x2b>
 d0:	89 05 00 00 00 00    	mov    %eax,0x0(%rip)        # d6 <main+0x31>
 d6:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
 dd:	00 
 ```

- __objdump-main.02.txt__
<br>

```
0000000000000000 <main>:
  0:	55                   	push   %rbp
  1:	48 89 e5             	mov    %rsp,%rbp
  4:	53                   	push   %rbx
  5:	48 83 ec 08          	sub    $0x8,%rsp
  9:	e8 00 00 00 00       	callq  e <main+0xe>
  e:	ba ff 7f 00 00       	mov    $0x7fff,%edx
 13:	31 f6                	xor    %esi,%esi
 15:	bf 00 00 00 00       	mov    $0x0,%edi
 1a:	e8 00 00 00 00       	callq  1f <main+0x1f>
 1f:	ba ff 7f 00 00       	mov    $0x7fff,%edx
 24:	89 c6                	mov    %eax,%esi
 26:	bf 00 00 00 00       	mov    $0x0,%edi
 2b:	89 05 00 00 00 00    	mov    %eax,0x0(%rip)        # 31 <main+0x31>
 31:	e8 00 00 00 00       	callq  36 <main+0x36>
 36:	ba 00 00 00 40       	mov    $0x40000000,%edx
 ```


