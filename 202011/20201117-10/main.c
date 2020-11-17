#include <stdio.h>

int main() {
    int num[3][3]={0};
    int i,j;
    int sum_m=0,sum_f=0;

    for(i=0;i<=2;i++)
        for(j=0;j<=2;j++)
            scanf("%d",&num[i][j]);

        for(i=0;i<=2;i++)
            for(j=0;j<=2;j++) {
                if(i + j == 2)
                    sum_f += num[i][j];
                if(i == j)
                    sum_m += num[i][j];
            }
                printf("%d %d",sum_m,sum_f);
    return 0;
}
