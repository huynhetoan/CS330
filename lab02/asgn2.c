#include <stdio.h>
#include "asgn2.h"

// Function 1
/*This function will calculate the price of an item that is on sale.
The function will return the final price after the discount is applied.*/
float calculateDiscount(float price, float discount){
    float percent = discount/100; // converts from percent to decimal
    float off = price * percent; // how much you save / how much is taken off
    float result = price - off; // final price after the discount

    return result;
}

// Function 2
/*This function counts how many numbers in the array that are greater
than its index. Since it is only a counter, the return type is an integer.*/
int greaterThanIndex(int arrayofNumbers[], int size){
    int count = 0; // initial count value
    for (int i = 0; i < size; i++){ // loops throught the whole array
        if (arrayofNumbers[i] > i){ //compares the number with its index
            count++; // increments count if the statement is true
        }
    }
    return count;
}

// Function 3
/*This function will add up all the digits of a number.
The return type is the sum of all digits thus making it an integer.*/
int sumOfDigits(int n){
    int sum = 0; // initial sum value
    while (n != 0){ // loops until n is 0
        sum = n % 10 + sum; // adds the last digit to the sum. n % 10 is the last digit of n.
        n = n / 10; // removes the last digit from n.
    }               /* the division and modulus work because the variables are integers,
                    meaning it can not have decimal places.*/
    return sum;
}
    
// Function 4
/*This function determines if a student passes or failes based on
the attendance, homework, and exam grades. The return type is void.*/
void grader (float avg_exams, float avg_hw, int attendance){
    if (attendance < 22) { // attendance must be greater than 22
        printf("FAIL\n"); // fails if not met
    }
    else if (avg_exams > 75 && avg_hw > 75) { // both exam and hw avg must be greater than 75
            if (avg_exams > 80 || avg_hw > 80) { // at least one must be greater than 80
                printf("PASS\n"); // if true, student passes
            }
            else {
                printf("FAIL\n"); // fails if not met
            }
    }
    else {
        printf("FAIL\n"); // fails if not met
    }
}

// Function 5
/*This function calculates the monthly payment for a loan.
The return type is a float since it returns a decimal value.*/
float monthlyPayment(float principal, float rate, float years){
    float p = principal; // principal
    float r = rate / 100 / 12; // monthly interest rate in decimal
    float n = years * 12; // number of payments in months
    
    // compute (1 + r)^n using a loop
    float onePlusRPowern = 1;
    for (int i = 0; i < n; i++) { // loops n times
        onePlusRPowern = (1 + r) * onePlusRPowern; // (1 + r) to the nth power.
    }
    float m = (p * r * onePlusRPowern) / (onePlusRPowern - 1); // calculates monthly payment.
    return m;
}


int main(){
    // Function 1
    printf("calculateDiscount\n");
    float d = calculateDiscount(100, 20);
    printf("%.1f\n", d);
    float d1 = calculateDiscount(50, 15);
    printf("%.1f\n", d1);
    float d2 = calculateDiscount(200, 10);
    printf("%.1f\n", d2);
 
    // Function 2
    printf("\ngreaterThanIndex\n");
    int arr[] = {10,20,1,2,30};
    int g = greaterThanIndex(arr, 5);
    int arr1[] = {1,2,0,44,29,309};
    int g1 = greaterThanIndex(arr1, 6);
    int arr2[] = {0,1,2,3};
    int g2 = greaterThanIndex(arr2, 4);
    printf("%d\n", g);
    printf("%d\n", g1);    
    printf("%d\n", g2);
    
    // Function 3
    printf("\nsumOfDigits\n");
    int s = sumOfDigits(1234);
    int s1 = sumOfDigits(29000000);
    int s2 = sumOfDigits(10001);
    printf("%d\n", s);
    printf("%d\n", s1);
    printf("%d\n", s2);
    
    // Function 4
    printf("\ngrader\n");
    grader(76,88,25);
    grader(66,100,24);
    grader(100,90,18);

    // Function 5
    printf("\nmonthlyPayment\n");
    float m = monthlyPayment(100000, 3.5, 30);
    float m1 = monthlyPayment(250000, 4.0, 15);
    float m2 = monthlyPayment(50000, 5.0, 10);
    printf("%.2f\n", m);
    printf("%.2f\n", m1);
    printf("%.2f\n", m2);

    return 0;
}