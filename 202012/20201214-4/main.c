#include <stdio.h>
#include <math.h>

long sum(int a, int n)
{
    long sum=0;

    for(int i=1;i<=n;i++)
        for(int j=0;j<i;j++)
            sum+=pow(10,j)*a;
    return sum;
}

int main() {
    int a,n;
    long sum_all=0;

    scanf("%d%d",&a,&n);
    sum_all=sum(a-1,n-1)+sum(a,n)+sum(a+1,n+1);
    printf("%ld",sum_all);
    return 0;
}
