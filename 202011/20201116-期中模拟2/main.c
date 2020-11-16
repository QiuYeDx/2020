#include <stdio.h> //求1^2+2^2+……+n^的和

int main() {
    int n;
    long sum_1=0,sum_2=1;
    int i=1,k=1;

    scanf("%d",&n);
    while(i<=n)
    {
        k=1;
        sum_2=1;
        while(k<=i)
        {
            sum_2*=k;
            k++;
        }
        sum_1+=sum_2;
        i++;
    }
    printf("%ld",sum_1);
    return 0;
}
