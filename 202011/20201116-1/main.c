#include <stdio.h>
#include <math.h>

int sum_div(int); //求因子的和（不包括自身）
int get_output(int);

int num[5]={0};
int sum[5]={0};
int output[5]={0};

int main() {
    int i_1=1;

    while(i_1<=5)
    {
        scanf("%d",&num[i_1-1]);
        sum[i_1-1]=sum_div(num[i_1-1]);
        i_1++;
    }

    return 0;
}

int get_output(int _i)
{
    int y_n=0;
    int _k=0;
    while(_k<=5)
    {
        if(_k==_i)
        {
            _k++;
            continue;
        }
        if(sum[_i]==sum[_k])
            y_n=1;
        _k++;
    }
}

int sum_div(int _num)
{
    int _div[64]={0};
    int _i;
    int _k=0;
    int _sum=0;

    for(_i=2;_i<=sqrt(_num);_i++)
    {
        if(_num%_i == 0)
        {
            _div[_k]=_i;
            _div[_k+1]=_num/_i;
            _k+=2;
        }
    }
    _k-=2;
    while(_k>=0)
    {
        _sum += _div[_k];
        _k--;
    }
    return _sum+1;
}
