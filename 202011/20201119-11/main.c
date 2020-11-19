#include <stdio.h>

int main() {
    int a,b,c;
    int s_1,s_2,s_3;

    scanf("%d%d%d",&a,&b,&c);
    if(a>b)
        if(b>c)
        {
            s_1=a;
            s_2=b;
            s_3=c;
        }
        else if(a>c)
        {
            s_1=a;
            s_2=c;
            s_3=b;
        }
        else
        {
            s_1=c;
            s_2=a;
            s_3=b;
        }
    else
    {
        if(a>c)
        {
            s_1=b;
            s_2=a;
            s_3=c;
        }
        else if(b>c)
        {
            s_1=b;
            s_2=c;
            s_3=a;
        }
        else
        {
            s_1=c;
            s_2=b;
            s_3=a;
        }
    }
    printf("%d %d %d",s_3,s_2,s_1);
    return 0;
}
