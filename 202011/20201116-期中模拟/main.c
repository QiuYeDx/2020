#include <stdio.h>

int main() {
    float sum=13;
    int i=1;
    while(i<=10)
    {
        sum*=1.02;
        i++;
    }
    printf("%f",sum);
    return 0;
}
