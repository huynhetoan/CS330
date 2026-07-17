# Algorithm Suite in x86‑64 Assembly

This project implements several classic algorithms entirely in **x86‑64 assembly**, demonstrating stack‑frame management, recursion, pointer arithmetic, and integration with C library functions.

## Features
- **Prime Factorization**
  - Uses `idiv` and `cdq` for signed division  
  - Loops through divisors and prints each prime factor  

- **Recursive Fibonacci**
  - Full recursive implementation  
  - Manual stack frame setup/teardown  
  - Register preservation (`rbx`)  

- **Linear Search**
  - Sequential search using pointer arithmetic  
  - Indexed addressing: `(%rdi, %rcx, 4)`  

- **Binary Search**
  - Divide‑and‑conquer algorithm  
  - Midpoint calculation and branching logic  
  - Efficient memory access  

## Concepts Demonstrated
- System V AMD64 calling conventions  
- Stack frame construction (`pushq`, `leave`)  
- Register management  
- `.data`, `.rodata`, `.text` memory sections  
- Calling `printf` from assembly  

## Build & Run
```bash
make
./asgn6
