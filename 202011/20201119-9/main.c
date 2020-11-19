#include <stdio.h>

#define get_max(a,b,c,max) max=a>b?(a>c?a:c):(b>c?b:c);printf("%.3lf",max);

int main() {
    double a,b,c,max;

    scanf("%lf%lf%lf",&a,&b,&c);
    max=a>b?(a>c?a:c):(b>c?b:c);
    printf("%.3lf\n",max);
    get_max(a,b,c,max)
    return 0;
}
