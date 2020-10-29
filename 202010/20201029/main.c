#include <stdio.h>

int main() {
    int N,K,buy_cups = 0;

    printf("Please input N and K:\n");
    scanf("%d %d",&N,&K);
    if(N % 2 == 1)
    {
        N++;
        buy_cups++;

        while(1)
        {
            N/=2;
            if(N <= K)
                break;

            if((N - K) / 2 > 0)
            {
                if(N % 2 == 0)
                    continue;
                else
                {
                    N = N
                }
            }
        }
    }
    else
        while(1)
        {
            N/=2;
            if(N <= K)
                break;
            if((N - K) / 2 > 0 && N % 2 == 1)
            {
                N++;
                buy_cups++;
            }
        }

        printf("%d",buy_cups);
    return 0;
}
