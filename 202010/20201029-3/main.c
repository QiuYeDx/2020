#include <stdio.h>
int count_number(int[65],int);

int main()
{
    int y = 2,n,N,K,i,x = 2;  //n是二进制数的位数,x是除数。
    int number[65];
    int remain[65];

    scanf("%d%d",&N,&K);
    remain[1] = N;
    for(n=1;N/y>0;n++)
    {
        y*=2;
    }

    for(i=1;i<=n;i++,x*=2)
    {
        number[i] = (remain[i] % x) * 2 / x;
        remain[i+1] = remain[i] - number[i]*x/2;
    }

    printf("%d",count_number(number[65],n));

    return 0;
}


int count_number(int _number[65],int _n)
{
    int _num_1=0,_i=1;

    while(1){
        if(_number[_i] == 1)
            _num_1++;
        if(_i == _n)
            break;
        _i++;
    }

    return _num_1;
}