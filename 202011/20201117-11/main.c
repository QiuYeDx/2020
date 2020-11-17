#include <stdio.h>

int main() {
    int num[10]={0};
    int i=0,k;
    int ins_num;
    int rep[11]={0};

    while(i<=8)
    {
        scanf("%d",&num[i]);
        i++;
    }
    getchar();
    scanf("%d",&num[9]);

    ins_num=num[9];
    i=0;
    while(i<=8)
    {
        if(num[i]>num[9])
            break;
        i++;
    }
    for(k=9;k>i;k--)
    {
        num[k]=num[k-1];
    }
    num[i]=ins_num;
    for(k=0;k<=9;k++)
        printf("%d\n",num[k]);
    return 0;
}
