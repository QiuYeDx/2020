#include <stdio.h>

int main() {
    int a,b,i_1=1,i_2=1;
    long sum_1=0,sum_2=0;
    double sum_3=0.00,c,i_3=1;

    scanf("%d%d%lf",&a,&b,&c);
    while(i_1<=a)
    {
        sum_1 += i_1;
        i_1++;
    }
    while(i_2<=b)
    {
        sum_2 += i_2*i_2;
        i_2++;
    }
    while(i_3<=c)
    {
        sum_3 += 1.00f / i_3;
        i_3++;
    }
    printf("%.2lf",(double)sum_1+(double)sum_2+sum_3);

    return 0;
}
