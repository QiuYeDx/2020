//2016年上机考试试题T1
//编写函数 long fun(long x)，它的功能是：将长整型参数 x 中的每一位上为偶数的数依次取出，构成一个新数返回。高位仍在高位，低位仍在低位。
//例如：下面程序运行时输入：124578902，程序输出：24802

#include <stdio.h>
#include <math.h>
long fun(long x)
{
    int i,j,num=0;

    for(i=0,j=0;x>0;i++)
    {
        if((x%10)%2)
        {
            x/=10;
        }
        else
        {
            num=num+(x%10)*pow(10,j);
            j++;
            x/=10;
        }
    }
    return num;
}
int main() {
    long a,b;

    printf("Enter a number");
    scanf("%ld",&a);
    b=fun(a);
    printf("b=%ld\n",b);
    return 0;
}
