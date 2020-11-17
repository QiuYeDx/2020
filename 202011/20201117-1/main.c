#include <stdio.h>

void j_go(int);
void o_go(int);

int main() {
    int n=0;

    scanf("%d",&n);
    if(n%2==1 && n!=1)
        j_go(n);
    else if(n==1)
        printf("%5d",n);
    else
        o_go(n);
    return 0;
}

void j_go(int n)
{
    int a=n*n-n+1-2;
    int i=1;

    while(i<=n)
    {
        printf("%5d",a+=2);
        i++;
    }
}

void o_go(int n)
{
    int a=n*n-1-n+2-2;
    int i=1;

    while(i<=n)
    {
        printf("%5d",a+=2);
        i++;
    }
}