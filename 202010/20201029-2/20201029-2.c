#include <stdio.h>

int main() {
    int y = 2,n,N,K,i,x = 2;  //n是二进制数的位数,x是除数。 
    int number[65];
    int remain[65];

    scanf("%d",&N);
    remain[1] = N;
    for(n=1;N/y>0;n++){
        y*=2;
    }

    for(i=1;i<=n;i++,x*=2) {
        number[i] = (remain[i] % x) * 2 / x;
        remain[i+1] = remain[i] - number[i]*x/2;
    }

    for(i=n;i>=1;i--)
        printf("%d",number[i]);
    return 0;
}
