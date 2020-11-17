#include<stdio.h>

void j_turn();
void o_turn();

int i_js=1;
int i_os=1;
int n_js=0;
int n_os=0;
char js[64]={0};
char os[64]={0};
int i_output_js=1;
int i_output_os=1;

int main()
{
    int j_yn=1;
    char ch;

    scanf("%c",&ch);
    while((ch=getchar())!=EOF)
    {
        if(j_yn==1)
        {
            js[i_js]=ch;
            i_js++;
            j_yn=0;
        }
        else
        {
            os[i_os]=ch;
            i_os++;
            j_yn=1;
        }
    }

    n_js=i_js-1;
    n_os=i_os-1;

    j_turn();
    o_turn();

    while(i_output_js<=n_js || i_output_os<=n_os)
    {
        if(i_output_js<=n_js)
        {
            printf("%c",js[i_output_js]);
            i_output_js++;
        }
        if(i_output_os<=n_os)
        {
            printf("%c",os[i_output_os]);
            i_output_os++;
        }
    }
    return 0;
}

void j_turn()      //奇数项排序
{
    int i,j;
    char k;

    for(i=1;i<n_js;i++)
        for(j=i+1;j<=n_js;j++)
        {
            if(js[i]<js[j])
            {
                k=js[i];
                js[i]=js[j];
                js[j]=k;
            }
        }
}

void o_turn()      //偶数项排序
{
    int i,j;
    char k=0;

    for(i=1;i<n_os;i++)
        for(j=i+1;j<=n_os;j++)
        {
            if(os[i]>os[j])
            {
                k=os[i];
                os[i]=os[j];
                os[j]=k;
            }
        }
}
