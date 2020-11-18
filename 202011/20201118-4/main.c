#include <stdio.h>  //判断素数
#include <math.h>

void judge_sushu(int);

int main() {
    int num;

    scanf("%d",&num);
    judge_sushu(num);
    return 0;
}

void judge_sushu(int num)
{
    int i;
    double std=sqrt(num);

    for(i=2;i<=std;i++)
    {
        if(num%i==0)
        {
            printf("not prime");
            break;
        }
        if(std-i<1 && num%i!=0)
        {
            printf("prime");
            break;
        }
    }
}

//252KB 1ms