#include <stdio.h>

int main() {
    int i_G = 0, i_P = 0, i_L = 0, i_T = 0;
    char ch;

    while(scanf("%c",&ch)!=EOF)
    {
        if (ch == 'G' || ch=='g')
            i_G++;
        if (ch == 'P' || ch=='p')
            i_P++;
        if (ch == 'L' || ch=='l')
            i_L++;
        if (ch == 'T' || ch=='t')
            i_T++;
        while (scanf("%c", &ch),ch!='\n')
        {
            if (ch == 'G' || ch=='g') {
                i_G++;
                continue;
            }
            if (ch == 'P' || ch=='p') {
                i_P++;
                continue;
            }
            if (ch == 'L' || ch=='l') {
                i_L++;
                continue;
            }
            if (ch == 'T' || ch=='t') {
                i_T++;
                continue;
            }
        }
        while (1) {
            if (i_G > 0) {
                putchar('G');
                i_G--;
            }
            if (i_P > 0) {
                putchar('P');
                i_P--;
            }
            if (i_L > 0) {
                putchar('L');
                i_L--;
            }
            if (i_T > 0) {
                putchar('T');
                i_T--;
            }
            if (i_G == 0 && i_P == 0 && i_L == 0 && i_T == 0)
                break;
        }
        printf("\n");
    }
    return 0;
}
