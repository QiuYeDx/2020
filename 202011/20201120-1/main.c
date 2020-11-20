#include <stdio.h>
void get_in();
void get_out();
void conduct();
int num[10]={0};

int main() {
    get_in();
    conduct();
    get_out();
    return 0;
}

void get_in()
{
    for(int i=0;i<=9;i++)
        scanf("%d",&num[i]);
}

void get_out()
{
    for(int i=0;i<=9;i++)
        printf("%d ",num[i]);
}

void conduct()
{
    int min,max,rep;
    int i_min,i_max;
    min=num[0];
    max=num[0];
    for(int i=0;i<=9;i++) {
        min = min > num[i] ? num[i] : min;
        max = max < num[i] ? num[i] : max;
    }
    for(i_min=0;i_min<=9;i_min++)
        if(num[i_min] == min)
            break;
    for(i_max=0;i_max<=9;i_max++)
        if(num[i_max] == max)
            break;

    rep=num[9];
    num[9]=num[i_max];
    num[i_max]=rep;

    rep=num[0];
    num[0]=num[i_min];
    num[i_min]=rep;
}