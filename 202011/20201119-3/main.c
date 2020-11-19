#include <stdio.h>   //OJ is ok,here is not ok
#include <string.h>

int n_num=0;
int n_cha=0;
int n_bla=0;
int n_oth=0;
int i=0;

void conduct(char ch[200]);

int main() {
    char ch[200]={0};


    while(scanf("%c",&ch[i]),ch[i]!='\n')
        i++;
    conduct(ch);

    return 0;
}

void conduct(char ch[200])
{
    int length;

    length=(int)strlen(ch);
    for(int j=0;j<length;j++)
    {
        if(ch[j]>=48&&ch[j]<=57)
        {
            n_num++;
            continue;
        }
        if((ch[j]>=65&&ch[j]<=90)||(ch[j]>=97&&ch[j]<=122))
        {
            n_cha++;
            continue;
        }
        if(ch[j]==' ')
        {
            n_bla++;
            continue;
        }
            n_oth++;
    }
    printf("%d %d %d %d",n_cha,n_num,n_bla,n_oth); //here needs n_oth-1
}