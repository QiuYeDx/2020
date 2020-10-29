#include <stdio.h>

int main() {
    int N,K,yu,buy_cups = 0;

    printf("Please input N and K:\n");
    scanf("%d %d",&N,&K);
    yu = N / 2;
    if((N - K) / 2 == 0 && yu == 1)
    {
        N++;
        buy_cups++;
        while(1)
        {
            N/=2;
            if(N <= K)
                break;
            if((N - K) / 2 == 0 && N % 2 == 1)
            {
                N++;
                buy_cups++;
            }
        }
    }
    else
        while(1)
        {
            N/=2;
            if(N <= K)
                break;
            if((N - K) / 2 == 0 && N % 2 == 1)
            {
                N++;
                buy_cups++;
            }
        }

        printf("%d",buy_cups);
    return 0;
}
