
#include<stdio.h>
#define  LEAP_YEAR(y) (y%4==0&&y%100!=0)||(y%400==0)?'L':'N'

int main()
{
    int year,leap;
    scanf("%d",&year);
    leap=LEAP_YEAR(year);
    printf("%c",leap);
    return 0;
}