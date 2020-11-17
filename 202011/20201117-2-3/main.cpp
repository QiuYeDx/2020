#include<cstdio>
#include<algorithm>

int i_js=1;
int i_os=1;
int n_js=0;
int n_os=0;
char js[32]={0};
char os[32]={0};
int i_output_js=1;
int i_output_os=1;

int main()
{
    int j_yn=1;
    char ch;

    while(scanf("%c",&ch),ch>32&&ch<127)
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

    std::sort(js[1],js[n_js]);
    std::sort(os[1],os[n_os]);

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

