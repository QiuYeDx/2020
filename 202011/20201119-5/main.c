#include <stdio.h>
#define quyu(a,b,c) c=a%b;

int main() {
    int a,b,c;

    scanf("%d%d",&a,&b);
    quyu(a,b,c)
    printf("%d",c);
    return 0;
}
