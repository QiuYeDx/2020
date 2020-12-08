#include <stdio.h>  //ACM第六套 Problem 7:后天

int main() {
    int D;

    while(scanf("%d",&D) != EOF)
    {
        for(int i=0;i<2;i++)
        {
            D++;
            if(D==8)
                D=1;
        }
        printf("%d\n",D);
    }
    return 0;
}