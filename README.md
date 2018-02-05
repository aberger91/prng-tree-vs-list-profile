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

### Timing Performance & Call Graph
```bash
gprof -b bin/assign1-2 bin/gmon.out | less
```

### Examples
> _Run the program twice timing it both times, and answer the following:_
<br>
> __How for 3 million numbers how many self seconds did generateList() take assign1-0?__

     %   cumulative   self              self     total           
    time   seconds   seconds    calls   s/call   s/call  name    
    100.45    267.01   267.01        1   267.01   267.01  generateList

> __How for 3 million numbers how many self seconds did generateTree() take for assign1-0?__


      %   cumulative   self              self     total           
     time   seconds   seconds    calls  ms/call  ms/call  name    
     87.50      0.70     0.70        1   700.00   720.00  generateTree

> _Run the program twice timing it both times, and answer the following:_
<br>
> __How for 3 million numbers how many self seconds did generateList() take for assign1-2?__

      %   cumulative   self              self     total           
     time   seconds   seconds    calls   s/call   s/call  name    
     99.87    246.70   246.70        1   246.70   246.75  generateList

> __How for 3 million numbers how many self seconds did generateTree() take for assign1-2?__

      %   cumulative   self              self     total           
     time   seconds   seconds    calls  ms/call  ms/call  name    
     88.68      0.47     0.47        1   470.00   490.00  generateTree

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
<br>

- __getNextNumber__
>  getNextNumber has a reduction in the number of memory lookups when switching the compiler flag from -O0 to -O2. 
   Variables are kept in registers versus RAM (the stack) for performance. Instead of using ```lea```  to compute the
   address of high and low into registers before moving their values to %rax, the optimized code uses ```mov``` 
   to read the values directly.

```
  # objdump-assign1-0.txt

  401585:	48 8d 05 44 74 00 00 	lea    0x7444(%rip),%rax        # 4089d0 <high>
  40158c:	8b 10                	mov    (%rax),%edx
  40158e:	48 8d 05 3f 74 00 00 	lea    0x743f(%rip),%rax        # 4089d4 <low>
  401595:	8b 00                	mov    (%rax),%eax
  401597:	29 c2                	sub    %eax,%edx
  401599:	89 d0                	mov    %edx,%eax
  40159b:	8d 48 01             	lea    0x1(%rax),%ecx
  40159e:	44 89 c0             	mov    %r8d,%eax
  4015a1:	99                   	cltd   
```

```
  # objdump-assign1-2.txt

  40157e:	44 8b 05 4f 74 00 00 	mov    0x744f(%rip),%r8d        # 4089d4 <low>
  401585:	8b 0d 45 74 00 00    	mov    0x7445(%rip),%ecx        # 4089d0 <high>
  40158b:	99                   	cltd   
  40158c:	44 29 c1             	sub    %r8d,%ecx
  40158f:	83 c1 01             	add    $0x1,%ecx
```

- __main__
> The if-then in the while loop in main is optimized after the -O2 is applied. The optimized code
  makes a straightforward ```cmp``` for the ``` if ( choice==1) ``` expression instead of using
  memory lookups and an extra jump.

```
  # objdump-assign1-0.txt

  4016c0:	e8 f0 fe ff ff       	callq  4015b5 <obtainNumberBetween>
  4016c5:	89 45 dc             	mov    %eax,-0x24(%rbp)
  4016c8:	48 8d 05 c9 39 00 00 	lea    0x39c9(%rip),%rax        # 405098 <.rdata+0x98>
  4016cf:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  4016d3:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  4016da:	eb 3c                	jmp    401718 <main+0xea>
  ...

  401718:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  40171c:	75 be                	jne    4016dc <main+0xae>
```

```
  # objdump-assign1-2.txt

  403e5b:	e8 40 d7 ff ff       	callq  4015a0 <obtainNumberBetween>
  403e60:	83 f8 01             	cmp    $0x1,%eax
  403e63:	74 10                	je     403e75 <main+0x95>
```
