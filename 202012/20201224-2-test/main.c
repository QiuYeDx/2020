#include <stdio.h>//no
long long math_go(long long a,char ch)
{
    long long b=0,sum=0;
    char ch_next;

    if(ch=='+'||ch=='-')
    {
        scanf("%lld",&b);
        scanf("%c",&ch_next);

        if(ch_next==' '||ch_next=='\n')
        {
            if(ch=='+')
            {
                sum=a+b;
                return sum;
            }
            else
            {
                sum=a-b;
                return sum;
            }
        }

        if(ch_next=='+'||ch_next=='-')
        {
            if(ch=='+')
                sum=a+b;
            else
                sum=a-b;
        }
        else
        {
            if(ch=='+')
                sum=a+math_go(b,ch_next);
            else
                sum=a-math_go(b,ch_next);
        }
    }
    else
    {
        scanf("%lld",&b);
        scanf("%c",&ch_next);

        if(ch_next==' '||ch_next=='\n')
        {
            if(ch=='*')
            {
                sum=a*b;
                return sum;
            }
            else
            {
                sum=a/b;
                return sum;
            }
        }
        if (ch == '*' || ch == '/')
        {
            if (ch == '*')
                sum = a * math_go(b,ch_next);
            else
                sum = a / math_go(b,ch_next);
        }
    }
    return sum;
}

int main() {
    long long a=0;


        long long sum_all,b;
        char ch0;

        scanf("%c",&ch0);
        scanf("%lld",&b);
        sum_all=math_go(b,ch0);
        printf("%lld\n",sum_all);

    return 0;
}
