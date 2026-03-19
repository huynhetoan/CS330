#include <stdio.h>

int main() {
    int arr[] = {1, 2, 3, 4, 5}; // 5 elements, 4 bytes each. Total = 20 bytes
    int size = sizeof(arr) / sizeof(arr[0]); // 20/4 = 5

    for (int i = 0; i < size; i++) {
        *(arr + i) = (*(arr + i)) * (*(arr + i)); // sqares each element
    }

    for (int i = 0; i < size; i++) {
        printf("%d ", *(arr + i)); // prints the new values
    }

    printf("\n"); // new line
    return 0;
}
