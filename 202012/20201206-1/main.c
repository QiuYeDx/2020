#include <stdio.h>  //hard A-B  字符串A减去字符串B（多组输入版）

int main() {
    char ch_a[10020]={0};
    char ch_b[10020]={0};
    int i1,i2;
    int yn;

    while(scanf("%c",ch_a)!=EOF)
    {
        i1=1;
        i2=0;

        while(scanf("%c",ch_a+i1),ch_a[i1]!='\n')
            i1++;     //ch_a里有i1个非换行符的字符 0~i1-1
        while(scanf("%c",ch_b+i2),ch_b[i2]!='\n')
            i2++;     //ch_b里有i2个非换行符的字符 0~i2-1
        for(int j1 = 0; j1 < i1; j1++)
        {
            yn = 1;
            for (int j2 = 0; j2 < i2; j2++)
            {
                if (ch_a[j1] == ch_b[j2])
                    yn = 0;
            }
            if(yn!=0)
                printf("%c",ch_a[j1]);
        }
    }

    return 0;
}
