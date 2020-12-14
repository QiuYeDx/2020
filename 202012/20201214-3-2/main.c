#include <stdio.h>
#include <string.h>

int main() {
    char s1[1002]={0};
    char s2[1002]={0};
    char * pt=NULL;
    char * p[1000]={NULL};
    int length,i=1,k;

    gets(s1);
    gets(s2);
    length=(int)strlen(s2);

    pt=s2-length;
    while(1)
    {
        if((pt=strstr(pt+length,s2))!=NULL)
            p[i]=pt;
        else
            break;
        i++;
    }
    i--;
    p[0]=s2;     //从p[0]开始打印字符，直到遇到p[1],然后从p[1]+length开始打印……
    char * pr=p[0];
    for(k=1;k<=i;k++)
    {
        while(1)
        {
            if(pr==p[k])
            {
                putchar('#');
                pr=pr+length;
                break;
            }
            putchar('^');
            if((*pr)!='\0')
            {
                scanf("%c",pr);
                pr++;
            }
            else
                break;
        }

    }

    return 0;
}
