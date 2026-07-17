# Terminal-Based Sokoban Engine (C + ncurses)

A full interactive Sokoban‑style puzzle game built in C using the **ncurses** graphics library.  
Features real‑time movement, collision detection, star‑pushing logic, and dynamic rendering.

## Game Features
- Real‑time movement using arrow keys  
- Collision detection for walls, stars, and goals  
- Star‑pushing mechanics (onto/off goals)  
- Win detection when all stars reach goal tiles  
- Step counter and score window  
- Map loading from external file (`maps.txt`)  
- Colorized terminal graphics  

## Technical Highlights
- Pointer arithmetic for 2D grid stored in 1D memory  
- Struct‑based player state (`Player`)  
- State machine for tile transitions  
- Modular functions: `validMove()`, `movePlayer()`, `drawScreen()`  
- ncurses window creation, borders, color pairs  
- Makefile‑based build system  

## Build & Run
```bash
make
./cs330_sokoban_game
