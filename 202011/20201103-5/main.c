#include <stdio.h>

long op_jc(int _n)
{
    int _i=1;
    long _sum=1;
    while(_i <= _n) {
        _sum *= _i;
        _i++;
    }
    return _sum;
}

int main() {
    long sum=0;
    int n,i=1;

    scanf("%d",&n);
    while(i<=n)
    {
        sum += op_jc(i);
        i++;
    }
    printf("%ld",sum);

    return 0;
}
