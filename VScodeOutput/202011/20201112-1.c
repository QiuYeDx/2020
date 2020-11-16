#include <stdio.h>

void test(int _n)
{
    int _i,_k=1,_kk;
    int ys[128]={0};
    int _sum=0;

    for(_i=1;_i<_n;_i++)
    {
        if(_n % _i == 0)
        {
            ys[_k] = _i;
            _k++;
        }
    }
    _k--;
    for(_kk=1;_kk<=_k;_kk++)
        _sum += ys[_kk];
    if(_sum == _n)
    {
        printf("%d its factors are", _sum);
        for(_kk=1;_kk<=_k;_kk++)
            printf(" %d",ys[_kk]);
        printf("\n");
    }
}

int main() {
    int N,n;

    scanf("%d",&N);
    for(n=6;n<=N;n+=2)
        test(n);
    return 0;
}