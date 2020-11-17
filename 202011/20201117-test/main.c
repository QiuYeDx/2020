#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main()
{
    int i,t,n = 1,x,b[9],c[9],y,max = 0,min = 0;
    long a;

    scanf("%ld",&a);
    for(i = 0;i < 10;i++,n = n * 10)
        if(a / n == 0)  break;
    b[0] = a % 10;
    b[1] = a % 100 / 10;
    b[2] = a % 1000 / 100;
    b[3] = a % 10000 / 1000;
    b[4] = a % 100000 / 10000;
    b[5] = a % 1000000 / 100000;
    b[6] = a % 10000000 / 1000000;
    b[7] = a % 100000000 / 10000000;
    b[8] = a % 1000000000 / 100000000;
    n = 0;
    for(t = 0;t < i;t++,n = t){
        for(x = t + 1;x < i;x++)
            if(b[n] < b[x]) n = x;
        c[t] = b[n];
        y = b[t];
        b[t] = b[n];
        b[n] = y;
    }
    for(t = 0;t < i;t++)
        printf("%d\n",c[t]);
    x = i - 1;
    for(t = 0;t < i;t++,x--){
        max = max + c[t] * pow(10,x);
        printf("%d\n",max);}
    //printf("%10d",max);

    /*for(t = i - 1;t >= 0;t--)
        if(c[t] != 0)   printf("%d",c[t]);*/

    return 0;
}