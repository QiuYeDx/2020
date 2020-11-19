#include<stdio.h>

#define swap(a,b) t=a;a=b;b=t;

int main()
{
    int x,y,t;
    scanf("%d%d",&x,&y);
    swap(x,y);
    printf("%d %d",x,y);
    return 0;
}