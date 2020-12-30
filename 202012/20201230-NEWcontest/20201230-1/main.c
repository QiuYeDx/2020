/* 题目背景

某天GJKGJKGJK突发奇想，想让LHNLHNLHN算222的nnn次方。

LHNLHNLHN怎么也无法在1s1s1s内给出答案，于是他的目光转向了你。
题目描述

请你帮助LHNLHNLHN，设计一个程序，计算222的nnn次方。

请注意数据范围！

小提示：可以开一个数组，每个空间存放一个数字，每次记得考虑一下进位。
输入格式

一个数，nnn。
输出格式

一个数，即222的nnn次方。
 */
#include <stdio.h>

int main() {
    long long sum=0;
    int n=0;
    int num[20000]={0};
    int jia[20000]={0};
    int n_ws=1;
    int i_ws;
    scanf("%d",&n);
    num[1]=1;
    for(int i=1;i<=n;i++)
    {
        for(i_ws=1;i_ws<=n_ws;i_ws++)
        {
            while(num[i_ws]>=10)
            {
                jia[i_ws+1]++;
                num[i_ws]-=10;
            }
            if(num[i_ws]*2>=10)
            {
                num[i_ws]=num[i_ws]*2%10;
                jia[i_ws+1]++;
                if(i_ws==n_ws)
                {
                    n_ws++;
                }
            }
            else
                num[i_ws]*=2;
            num[i_ws]+=jia[i_ws];
            jia[i_ws]=0;
            while(num[i_ws]>=10)
            {
                jia[i_ws+1]++;
                num[i_ws]-=10;
            }
        }
    }
    for(int i=n_ws;i>=1;i--)
        printf("%d",num[i]);
    return 0;
}
