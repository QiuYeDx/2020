#include<stdio.h>
#include<string.h>

int panduan(char a)
{
    if(a=='+'||a=='-')
    {
        return 1;
    }
    if(a=='*'||a=='/')
    {
        return 2;
    }
}
int main()
{
    long long int shu[10000],len,i,sum,flag;
    char fuhao[10000],cucun[1000000];
    long long int *s=shu+10;
    char *f=fuhao+10;
    while(gets(cucun)!=NULL)
    {
        if(cucun[0]=='\0')
        {
            continue;
        }
        else
        {
            flag=0;
            sum=0;
            len=strlen(cucun);
            for(i=0; i<len; i++)
            {
                if(cucun[i]>='0'&&cucun[i]<='9')
                {
                    sum=10*sum+(cucun[i]-'0');
                }
                else
                {
                    *(s++)=sum;
                    sum=0;
                    if(flag==0)
                    {
                        *(f++)=cucun[i];
                        flag=1;
                    }
                    else
                    {
                        if(panduan(cucun[i])>panduan(*(f-1)))
                        {
                            *(f++)=cucun[i];
                        }
                        else
                        {
                            if(*(f-1)=='+')
                            {
                                s--;
                                *(s-1)=*s+*(s-1);

                            }
                            if(*(f-1)=='-')
                            {
                                s--;
                                *(s-1)=*(s-1)-*s;

                            }
                            if(*(f-1)=='*')
                            {
                                s--;
                                *(s-1)=(*(s-1))*(*s);

                            }
                            if(*(f-1)=='/')
                            {
                                s--;
                                *(s-1)=(*(s-1))/(*s);

                            }
                            *(f-1)=cucun[i];
                            if(panduan(cucun[i])<=panduan(*(f-2)))
                            {
                                f--;
                                if(*(f-1)=='+')
                                {
                                    s--;
                                    *(s-1)=*s+*(s-1);

                                }
                                if(*(f-1)=='-')
                                {
                                    s--;
                                    *(s-1)=*(s-1)-*s;

                                }
                                if(*(f-1)=='*')
                                {
                                    s--;
                                    *(s-1)=(*(s-1))*(*s);

                                }
                                if(*(f-1)=='/')
                                {
                                    s--;
                                    *(s-1)=(*(s-1))/(*s);

                                }
                                *(f-1)=cucun[i];
                            }
                        }
                    }
                }
            }
            printf("%lld\n",*(s-1));
        }
    }
    return 0;
}