#include <stdio.h>
#include <string.h>

int main() {
    char s1[1002]={0};
    char s2[1002]={0};
    char * pt=NULL;
    char * p[200];
    int length,i=1,k;

    gets(s1);
    gets(s2);
    length=(int)strlen(s2);

    pt=s1;
    while(strstr(pt,s2)!=NULL)
    {
        p[i]=pt;
        pt=strstr(pt,s2);
        pt=pt+length;
        i++;
    }
    i--;
    p[0]=s1;     //从p[0]开始打印字符，直到遇到p[1],然后从p[1]+length开始打印……
    char * pr=p[0];
    for(k=1;(*pr)!='\0';pr++)
    {
        if(pr==p[k])
        {
            putchar('#');
            pr+=length;
            k++;
            continue;
        }
        scanf("%c",pr);
    }
    return 0;
}
