//C程序设计第五版（谭浩强）
//章节：第八章 善于利用指针
// 所有练习均要求用指针方法处理
//练习8.5 有n个人围成一圈，顺序排号。从第一个人开始报数(从1到3报数)，凡是报到3的人退出圈子，问最后留下来的是原来的第几位。
#include <stdio.h>

int main()
{
    void number_off(int *p, int n);
    int num[100],*p=num,n,i;

    scanf("%d", &n);
    for(i=1;p<num+n;p++){  // 用顺序数来保存位数 ,最后那一位还有数，那么就是它留下来了
        *p=i++;
    }
    number_off(num, n);
    for(p=num;p<num+n;p++){
        if(*p){
            printf("%d",*p);
            break;
        }
    }
    return 0;
}

void number_off(int *p, int n)
{
    int *first=p, count=0, i=0, k=0, rest=n;
    while(rest!=1){  // 当还剩下一位时
        if(*(first+i)!=0){  // 说明这个数还没退出圈
            k++;  //报数
            if(k==3){
                count++;  // 退出人数
                *(first+i) = 0;  // 退出
                k=0;
            }
        }
        i++;
        if(i==n){  // 这就形成一个圈了呀！
            i=0;
        }
        rest = n-count;
    }
}

//128KB 1ms