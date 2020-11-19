#include <stdio.h>
#include <math.h>

int main() {
    int num;
    int n[4];

    scanf("%d",&num);
    for(int i=0;i<=3;i++)
    {
        n[i]=num%10;
        if(num<10)
            break;
        num/=10;
    }
    for(int j=0;j<=3;j++)
    {
        printf("%d",n[3-j]);
        if(j<=2)
            printf(" ");
    }
    return 0;
}
