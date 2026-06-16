# CS 330 – Computer Organization & Assembly Programming  
### University of Alabama at Birmingham (UAB)

This repository contains my coursework, labs, and projects for **CS 330**, focusing on low‑level programming, x86‑64 assembly, CPU architecture concepts, and systems‑level problem solving.  
Assignments include algorithm implementations in assembly, stack‑frame manipulation, recursion, memory layout, and a full Sokoban‑style game using **ncurses**.

---

## 🧠 Course Overview

CS 330 explores how computers actually execute programs at the machine level.  
Topics include:

- x86‑64 assembly language  
- Registers, addressing modes, and calling conventions  
- Stack frames (`push`, `pop`, `rbp`, `rsp`)  
- Function calls and parameter passing  
- Recursion in assembly  
- Control flow (`cmp`, `jmp`, `je`, `jg`, etc.)  
- Arithmetic and logic instructions  
- Memory layout: `.data`, `.rodata`, `.text`  
- Using `gcc` and `gdb` to compile and debug assembly  
- Linking C and assembly together  
- Building programs with Makefiles  
- Terminal graphics using **ncurses**  
- Structs, pointers, and game‑state management in C  

---

## 🧩 Major Programming Components

### **1. Prime Factorization (Assembly)**  
Implemented a full prime‑factorization routine in x86‑64 using:

- Division via `idiv`
- Remainder checking
- Looping with conditional jumps
- Printing factors using `printf`

### **2. Recursive Fibonacci (Assembly)**  
A complete recursive implementation demonstrating:

- Stack frame setup/teardown  
- Saving registers (`rbx`)  
- Multiple recursive calls  
- Returning values in `eax`  

### **3. Linear Search (Assembly)**  
Sequential search implemented using:

- Pointer arithmetic (`(%rdi, %rcx, 4)`)  
- Looping and comparison  
- Returning index or `-1`  

### **4. Binary Search (Assembly)**  
Divide‑and‑conquer search using:

- Midpoint calculation  
- Branching logic  
- Efficient memory access  
- Returning index or `-1`  

---

## 🎮 Sokoban / Star‑Pusher Game Project (C + ncurses)

A full interactive terminal game built using:

- **ncurses** for graphics  
- Window creation, borders, color pairs  
- Player movement and collision logic  
- Map loading from external files  
- Struct‑based player state  
- Valid move checking  
- Pushing stars, goals, and win detection  
- Step counter and score window  
- Makefile‑based build system  

Key files include:

- `cs330_sokoban_game.c` — main game logic  
- `sok_header.h` — struct definitions and extern variables  
- `Makefile` — build, run, and debug targets  
- `maps.txt` — level data  

---

## 🛠️ Tools & Skills Used

- **x86‑64 Assembly (AT&T syntax)**  
- **GCC** for compiling C and assembly  
- **GDB** for debugging  
- **Makefiles** for automation  
- **ncurses** for terminal UI  
- **Linux command‑line environment**  
- Understanding of CPU registers, stack, memory, and calling conventions  

---

## 📂 Repository Contents

- `*.s` — assembly implementations (prime factors, Fibonacci, searches)  
- `cs330_sokoban_game.c` — Sokoban game source  
- `sok_header.h` — shared header  
- `Makefile` — build/run/debug automation  
- `maps.txt` — game level data  
- Additional helper files and test programs  

---

## 🚀 How to Build & Run (Sokoban)

```bash
make
./cs330_sokoban_game
