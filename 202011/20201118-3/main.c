#include <stdio.h>
#include <math.h>

void go_1();
void go_2();

double a,b,c;
int dert;
double x1,x2;

int main(){

    scanf("%lf%lf%lf",&a,&b,&c);
    dert=b*b-4*a*c;
    if(dert>=0)
        go_1();

    if(dert<0)
        go_2();

    return 0;
}

void go_1()
{
    x1=(sqrt(dert)-b)/(2*a);
    x2=(0-sqrt(dert)-b)/(2*a);
    printf("x1=%.3lf x2=%.3lf",x1,x2);
}

void go_2()
{
    double i1,i2;
    x1=(0-b)/(2*a);
    x2=(0-b)/(2*a);
    i1=sqrt(0-dert)/(2*a);
    i2=(0-sqrt(0-dert))/(2*a);
    printf("x1=%.3lf%+.3lfi x2=%.3lf%+.3lfi",x1,i1,x2,i2);
}