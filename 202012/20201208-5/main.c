#include <stdio.h>    //立方的相邻奇数和表示

int main() {
    int n,j=0,k=0;

    while(scanf("%d",&n)!=EOF)
    {
        if(n%2)  //n为奇数
            for (j = 0; j < n; j++)
                printf("%d,%d\n", j, n);
        else     //n为偶数
            for (k = 0; k < n; k++)
                printf("%5d", n * n + 1 - (n - 2 - k) * 2);
        printf("\n");
        getchar();
    }
    return 0;
}