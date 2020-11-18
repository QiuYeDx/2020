#include <stdio.h>  //逆序存放并输出字符串

void reverse();

char ch[100]={0};
char ch_re[100]={0};
int i=0;

int main() {
    reverse();
    for(int j=0;j<=i;j++)
        printf("%c",ch_re[j]);
    return 0;
}

void reverse()
{
    int k;
    while(scanf("%c",&ch[i])!=EOF)
        i++;
    i--;
    for(k=0;k<=i;k++)
        ch_re[k]=ch[i-k];
}

//128KB 2ms