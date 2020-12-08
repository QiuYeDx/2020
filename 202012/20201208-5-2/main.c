#include <stdio.h>

int main() {
    int n;

    while(scanf("%d",&n)!=EOF) {
        if (n == 1) {
            printf("%5d", 1);
            continue;
        }
        if (n % 2)
            for (int j = 0; j < n; j++)
                printf("%5d", n * n - (n - 1) + j * 2);
        else
            for (int k = 0; k < n; k++)
                printf("%5d", n * n + 1 - n + k * 2);
            printf("\n");
    }
    return 0;
}
