#include <stdio.h>
#define BASE_PAY_1 10.00
#define OVER_STANDARD 40
#define over_MULTIPLE 1.5
#define TAX_1 300
#define TAX_2 450
#define RATE_TAX_1 0.15
#define RATE_TAX_2 0.2
#define RATE_TAX_3 0.25
#define TIME_S 40

int main() {
    int N;
    float time_total,time_effect;
    float payment_total,tax,inpay;

    printf("Please input your worktime in a week:\n");
    scanf("%f",&time_total);
    if(time_total<=TIME_S)
        time_effect=time_total;
    else
        time_effect=40+(time_total-40)*1.5;

    if(payment_total<=TAX_1)
        N=1;
    else
        if(payment_total<=TAX_2)
            N=2;
        else
            N=3;

        switch(N)
        {
            case 1:inpay=f_case1(payment_total)
        }

    return 0;
}

float f_case1(float)
{
    float _payment_total,inpay;


}