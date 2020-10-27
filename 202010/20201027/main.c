#include <stdio.h>
#define BASE_PAY_1 10.00
#define OVER_STANDARD 40
#define OVER_MULTIPLE 1.5
#define TAX_1 300
#define TAX_2 450
#define RATE_TAX_1 0.15
#define RATE_TAX_2 0.20
#define RATE_TAX_3 0.25
#define TIME_S 40.0

float f_case1(float);
float f_case2(float);
float f_case3(float);

int main() {
    int N;
    float time_total,time_effect;
    float payment_total,tax,inpay;

    printf("Please input your worktime in a week:\n");
    while((scanf("%f",&time_total)) != 1 )
        printf("Please input your worktime in a week:\n");

    if(time_total <= TIME_S)
        time_effect = time_total;
    else
        time_effect = TIME_S + (time_total - OVER_STANDARD) * OVER_MULTIPLE;

    payment_total = time_effect * BASE_PAY_1;

    if(payment_total <= TAX_1)
        N = 1;
    else
        if(payment_total <= TAX_2)
            N = 2;
        else
            N = 3;

        switch(N)
        {
            case 1:inpay = f_case1(payment_total);
                   tax = payment_total - inpay;
                   break;
            case 2:inpay = f_case2(payment_total);
                   tax = payment_total - inpay;
                   break;
            case 3:inpay = f_case3(payment_total);
                   tax = payment_total - inpay;
            default : break;
        }

        printf("\nYour inpayment is $%.2f.\nAnd your tax is $%.2f.\n",inpay,tax);
        getchar();
        getchar();

    return 0;
}

float f_case1(float _payment_total)
{
    float _inpay;

    _inpay = _payment_total * (1-RATE_TAX_1);

    return _inpay;
}

float f_case2(float _payment_total)
{
    float _inpay;

    _inpay = _payment_total - TAX_1 * RATE_TAX_1 - (_payment_total - TAX_1) * RATE_TAX_2;

    return _inpay;
}

float f_case3(float _payment_total)
{
    float _inpay;

    _inpay = _payment_total - TAX_1 * RATE_TAX_1 - (TAX_2 - TAX_1) * RATE_TAX_2 - (_payment_total - TAX_2) * RATE_TAX_3;

    return _inpay;
}