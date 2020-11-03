#include <stdio.h>
int pow(int x,int y)
{
        int _i=1,_sum=0;
        while(_i<=y) {
            _sum *= x;
            _i++;
        }
        return _sum;
}

int main() {
    int n,i,sum=0;

    scanf("%d",&n);
    for(i=1;i<=n;i++)
    {
        sum+=2 * pow(10,i-1);
    }
    printf("%d",sum);

    return 0;
}
