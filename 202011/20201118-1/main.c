#include <stdio.h>

int main() {
    int num[10]={0};
    int i;

    for(i=0;i<=9;i++)
        scanf("%d",&num[i]);
    for(i=9;i>=0;i--)
    {
        printf("%d", num[i]);
        if(i!=0)
            printf(" ");
    }
    return 0;
}
