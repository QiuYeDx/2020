#include <stdio.h> //矩阵转换

int main() {
    int num_a[3][3]={0};
    int num_b[3][3]={0};
    int i,j;

    for(i = 0;i <= 2;i++)
        for (j = 0; j <= 2;j++) {
            scanf("%d", &num_a[i][j]);
            num_b[j][i]=num_a[i][j];
        }
    for(i=0;i<=2;i++)
    {
        for(j=0;j<=2;j++)
            printf("%d ",num_b[i][j]);
        if(i==2)
            break;
        printf("\n");
    }
    return 0;
}

//252KB 1ms