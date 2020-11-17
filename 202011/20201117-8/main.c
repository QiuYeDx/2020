#include <stdio.h>   //矩阵平移

int main() {
    int num[5][5]={0};
    int i,j;
    int rep;
    for(i=0;i<=4;i++)
        for (j = 0; j <= 4; j++)
            scanf("%d",&num[i][j]);
    for(i=0;i<=4;i++)
        for(j=0;j<=3;j++)
        {
            rep = num[i][j];
            num[i][j] = num[i][j + 1];
            num[i][j + 1] = rep;
        }
    for(i=0;i<=4;i++)
    {
        for(j=0;j<=4;j++)
        {
            printf("%5d",num[i][j]);
        }
        printf("\n");
    }
    return 0;
}
