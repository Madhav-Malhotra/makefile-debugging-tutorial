#include <stdio.h>
#include <stdlib.h>
#include "calculations.h"

int main(int argc, char *argv[]) {
    // Read two numbers
    int a, b;

    if (argc == 3) {
        a = atoi(argv[1]);
        b = atoi(argv[2]);
    } else {
        printf("Enter two numbers: ");
        scanf("%d %d", &a, &b);
    }

    // Find difference of squares
    int sd = squared_difference(a, b);
    printf("Difference of squares of %d and %d is %d\n", a, b, sd);
    
    return 0;
}