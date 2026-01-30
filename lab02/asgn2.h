#ifndef __asgn2__
#define __asgn2__

// price after discount
float calculateDiscount(float price, float discount);

// how many is greater than its index
int greaterThanIndex(int arrayOfNumbers[], int size);

// sum of its digits
int sumOfDigits(int n);

// Prints PASS or FAIL based on criteria.
void grader (float avg_exams, float avg_hw, int attendance);

/* Monthly payment found by using a formula to calculate
    the fixed-rate mortgage payment. Since it is in years,
    I convert it to months by multiplying and dividing by 12.
*/
float monthlyPayment(float principal, float rate, float years);

#endif