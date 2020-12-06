#include <stdio.h>    //同20201206-1，本篇为fgets()多组输入版。
#include <string.h>

int main() {
    char ch_a[10010]={0};
    char ch_b[10010]={0};
    int i1,i2;

    while(scanf("%c",ch_a)!=EOF)
    {
        fgets(ch_a + 1, 10009, stdin);
        fgets(ch_b, 10009, stdin);
        i1 = (int) strlen(ch_a) - 1;     //ch_a有i1个非换行符字符  0~i1-1
        i2 = (int) strlen(ch_b) - 1;     //ch_b有i2个非换行符字符  0~i2-1
        for (int j1 = 0; j1 < i1; j1++) {
            int yn = 1;
            for (int j2 = 0; j2 < i2; j2++)
                if (ch_a[j1] == ch_b[j2]) {
                    yn = 0;
                    break;
                }
            if (yn)
                printf("%c", ch_a[j1]);
        }
    }
    return 0;
}
