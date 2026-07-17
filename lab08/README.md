# Stack-Based Array Manipulation in x86‑64 Assembly

This project demonstrates low‑level array manipulation directly on the stack using register arithmetic, pointer computation, and manual memory addressing.

## Features
- Manual stack frame setup  
- Array stored on the stack  
- Indexing via register arithmetic (`i * 4` offsets)  
- Looping and control flow using jumps  
- Arithmetic operations (`imull`, shifts, adds`)  
- Printing values using `printf`  

## Concepts Demonstrated
- System V AMD64 ABI  
- Passing arguments in registers  
- Returning values in `eax`  
- Memory layout and stack organization  
- Explicit address computation with `leaq`  

## Build & Run
```bash
make
./asgn8
