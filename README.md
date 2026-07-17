# CS 330 – Systems & Assembly Portfolio  
University of Alabama at Birmingham (UAB)

This repository contains my systems‑level programming work from CS 330, focused on x86‑64 assembly, low‑level memory manipulation, CPU architecture concepts, and terminal‑based game development.  
Below are the **three major projects** that demonstrate real embedded/systems engineering skills.

---

## 🔧 Projects

### **1. Algorithm Suite in x86‑64 Assembly**  
Classic algorithms implemented entirely in assembly, demonstrating stack‑frame management, recursion, pointer arithmetic, and ABI‑compliant function calls.  
**Project folder:** [`lab06`](lab06/README.md)

### **2. Terminal-Based Sokoban Engine (C + ncurses)**  
A full interactive Sokoban‑style puzzle game with real‑time movement, collision detection, star‑pushing logic, and dynamic terminal rendering.  
**Project folder:** [`lab07`](lab07/README.md)

### **3. Stack-Based Array Manipulation (x86‑64 Assembly)**  
Low‑level array manipulation directly on the stack using register arithmetic, explicit memory addressing, and manual control flow.  
**Project folder:** [`lab08`](lab08/README.md)

---

## 🧠 Skills Demonstrated
- x86‑64 Assembly (AT&T syntax)  
- System V AMD64 calling conventions  
- Stack frames, recursion, register preservation  
- Pointer arithmetic & memory layout  
- Terminal graphics with ncurses  
- Makefile‑based build automation  
- Integration of C and assembly  
- CPU architecture fundamentals  

---

## ▶️ Build & Run (Examples)

### Assembly Projects
```bash
make
./asgn6
./asgn8
```

### Sokoban Game
```bash
make
./cs330_sokoban_game
```

