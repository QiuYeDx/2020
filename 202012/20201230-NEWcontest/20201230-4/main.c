#include <stdio.h>

int main() {
    long long a;
    long i=0,j;

    scanf("%lld",&a);
    while(a>0)
    {
        if(a==2)
        {
            printf("Second win\n");
            scanf("%lld",&a);
            continue;
        }
        j=0;
        while(a>3)
        {
            if(a%3>0)
            {
                a=a-a/3;
                j++;
            }
            else
            {

                a=a-a/3+1;
                j++;
            }
        }
        if(a==3 && j%2==1)
            printf("First win\n");
        else if(a==3 && j%2==0)
            printf("Second win\n");
        scanf("%lld",&a);
    }
    return 0;
}
