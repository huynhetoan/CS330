#include <stdio.h>
#include "asgn4.h"

int main(void) {

    printf("Task 1: isBitSet\n");
    printf("input(23, 4) = %d \n (expected 1)\n", isBitSet(23, 4));

    printf("\nTask 2: setBit\n");
    printf("input(5, 3) = %d \n (expected 13)\n", setBit(5, 3));

    printf("\nTask 3: clearBit\n");
    printf("input(15, 1) = %d \n (expected 13)\n", clearBit(15, 1));

    printf("\nTask 4: toggleBit\n");
    printf("input(8, 3) = %d \n (expected 0)\n", toggleBit(8, 3));

    printf("\nTask 5: multiplyBy2 and divideBy2\n");
    printf("input(7) = %d \n (expected 14)\n", multiplyBy2(7));
    printf("\ninput(18) = %d \n (expected 9)\n", divideBy2(18));

    printf("\nBonus: countSetBits\n");
    printf("input(23) = %d \n (expected 4)\n", countSetBits(23));
    return 0;
}