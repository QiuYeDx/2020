#include <stdio.h>  //最大公约数&最小公倍数

void maxgys(int a,int b);
void mingbs(int a,int b);

int min;

int main() {
    int a,b;

    scanf("%d%d",&a,&b);
    maxgys(a,b);
    mingbs(a,b);

    return 0;
}

void maxgys(int a,int b)
{
    for(min=a>b?b:a;min>=1;min--)
    {
        if(a%min==0 &&b%min==0)
        {
            printf("%d ",min);
            break;
        }
    }
}

void mingbs(int a,int b)
{
    printf("%d",a*b/min);
}