#include <stdio.h>

int main() {
    int a,b;

    while(scanf("%d",&a)!=EOF)
        printf("%.1f\n",(a-100)*1.8);
    return 0;
}
