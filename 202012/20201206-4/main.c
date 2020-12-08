#include <stdlib.h>
#include <stdio.h>
int main()
{
    int i,t,n,x,sum,z,k,num;
    char c[100][19],m;

    scanf("%d",&n);
        num = 0;
        getchar();
        for(int i2=0;i2<n;i2++)
            gets(c[i2]);
        for(x = 0;x < n;x++)
        {
            sum = -4800 + c[x][0] * 7 + c[x][1] * 9 + c[x][2] * 10 + c[x][3] * 5 + c[x][4] * 8 + c[x][5] * 4 + c[x][6] * 2 + c[x][7] * 1 + c[x][8] * 6 + c[x][9] * 3 + c[x][10] * 7 + c[x][11] * 9 + c[x][12] * 10 + c[x][13] * 5 + c[x][14] * 8 + c[x][15] * 4 + c[x][16] * 2;
            z = sum % 11;
            switch(z)
            {
                case 1:	m = '0';break;
                case 2:	m = 'X';break;
                case 3:	m = '9';break;
                case 4:	m = '8';break;
                case 5:	m = '7';break;
                case 6:	m = '6';break;
                case 7:	m = '5';break;
                case 8:	m = '4';break;
                case 9:	m = '3';break;
                case 0:	m = '1';break;
                case 10:m = '2';break;
                default: break;
            }
            t = 0;
            for(i = 0;i < 17;i++)
                if(c[x][i] == 'X')
                {
                    fputs(c[x],stdout);
                    t++;
                    break;
                }
            if(c[x][17] != m&&t == 0)
            {
                fputs(c[x],stdout);
                t++;
            }
            if(t == 0) num++;

            else printf("\n");

        }
        if(num == n)    printf("All passed\n");
    return 0;
}
