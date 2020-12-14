//C语言第二次作业T3
//终于过了。。。犯了一些低级错误（s1写成s2、pr++的位置不对等）
//另外。。算是第一次实践指针的应用吧！这道题用数组写更不容易错，也省的debug了……啊嘞啊嘞~
#include <stdio.h>
#include <string.h>   //C

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
        pt=strstr(pt,s2);
        p[i]=pt;
        pt=pt+length;
        i++;
    }
    i--;
    p[0]=s1;     //从p[0]开始打印字符，直到遇到p[1],然后从p[1]+length开始打印……
    char * pr=p[0];
    for(k=1;(*pr)!='\0';)
    {
        if(k<=i && pr==p[k])
        {
            putchar('#');
            pr+=length;
            k++;
            continue;
        }
        putchar(*pr);
        pr++;
    }
    return 0;
}
