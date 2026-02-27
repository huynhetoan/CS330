#ifndef __asgn4__
#define __asgn4__

//checks if the bit at "position" is 1 by using the bitwise AND operator and a left shift
int isBitSet(int number, int position) {
    //makes sure position is not a negative and not over the number of bits in an int
    if (position < 0 || position >= sizeof(int)*8) {
        return -1;
    }
    //1 << 4 holds a 1 at position 4
    //& is a bitwise operator
    //AND (10111 & 10000) if it is not 0 then bit is set
    return (number & (1 << position)) != 0;
}

//sets the bit at "position" to 1
//bitwise OR and a left shift
int setBit(int number, int position) {
    //checks
    if (position < 0 || position >= sizeof(int)*8) {
        return -1;
    }
    //OR (0101 | 1000) = 1101
    return number | (1 << position);
}

//clears the bit at "position" to 0
//bitwise AND, NOT, and left shift
int clearBit(int number, int position) {
    //checks
    if (position < 0 || position >= sizeof(int)*8) {
        return -1;
    }
    //AND (1111 & 1101) = 1101
    return number & ~(1 << position);
}

//flips the bit at "position"
//XOR and left shift
int toggleBit(int number, int position) {
    //checks
    if (position < 0 || position >= sizeof(int)*8) {
        return -1;
    }
    //XOR (1000 ^ 1000) = 0000
    return number ^ (1 << position);
}

//multiplies a number by 2
//left shift
int multiplyBy2(int number) {
    //left shift (111 << 1) = 1110
    return number << 1;
}

//divides a number by 2
//arithmetic right shift
int divideBy2(int number) {
    //arithmetic right shift (10010 >> 1) = 1001
    return number >> 1;
}

//counts the number of bits that are set to 1 by using a loop and a counter
int countSetBits(int number) {
    int count = 0;
    while (number) {
        //10111  & 00001 = 1
        //LSB is 1 so increment count
        //right shift (10111 >> 1) = 1011
        //ect...
        count += number & 1; //increment count if the LSB is 1
        number >>= 1; //right shift to see next bit
    }
    return count;
}

#endif