#include<stdio.h>
int count_number(int);

void main(void)
{
	int in_N,in_K,o_K,main_i=0;
	
	scanf("%d%d",&in_N,&in_K);
	while(1)
	{
		o_K = count_number(in_N);
		if(o_K<=in_K)
		break;
		main_i++;
		in_N++;
	}
	printf("%d",main_i);
}




int count_number(int _N)
{
	int y = 2,n,N=_N,K,i,x = 2;  //n是二进制数的位数,x是除数。
    int number[65];
    int remain[65];

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


 int _num_1=0,_i=1;

    while(1){
        if(number[_i] == 1)
            _num_1++;
        if(_i == n)
            break;
        _i++;
    }

    return _num_1;   
}
