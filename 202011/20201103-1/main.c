//0-100000           0.1      10000                           10000
//100001-200000      0.075    10000+7500                      17500
//200001-400000      0.05     10000+7500+10000                27500
//400001-600000      0.03     10000+7500+10000+6000           33500
//600001-1000000     0.015    10000+7500+10000+6000+6000      39500
//1000001---         0.01     10000+7500+10000+6000+6000+...
#include<stdio.h>

int main()
{
    long int money=0,m_2=0,m_3=0,m_4=0,m_5=0,m_6=0,profit=0;

    scanf("%ld",&money);

    if(money>1000000) {
        m_6 = (money - 1000000) * 0.01;
        profit = m_6 + 39500;
    }
    else
    if(money>600000) {
        m_5 = (money - 600000) * 0.015;
        profit = m_5 + 33500;
    }
    else
    if(money>400000) {
        m_4 = (money - 400000) * 0.03;
        profit = m_4 + 27500;
    }
    else
    if(money>200000) {
        m_3 = (money - 200000) * 0.05;
        profit = m_3 + 17500;
    }
    else
    if(money>100000) {
        m_2 = (money - 100000) * 0.075;
        profit = m_2 + 10000;
    }
    else
        profit = money * 0.1;
    printf("%d",profit);
    return 0;
}
