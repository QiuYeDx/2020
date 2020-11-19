#include <stdio.h>
#include <math.h>

#define get_s(a,b,c,s) s=(a+b+c)/2;
#define get_area(a,b,c,s,area) area=sqrt(s*(s-a)*(s-b)*(s-c));

int main() {
    double a,b,c;
    double s,area;

    scanf("%lf%lf%lf",&a,&b,&c);
    get_s(a,b,c,s)
    get_area(a,b,c,s,area)
    printf("%.3lf",area);
    return 0;
}
