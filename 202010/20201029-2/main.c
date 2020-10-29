#include <stdio.h>

int main() {
    int y = 1,n,N,K,i,x = 1;  //n是二进制数的位数,x shi chu shu
    int number[65];
    int remain[65];

    scanf("%d%d",&N,&K);
    remain[1] = N;
    for(n=0;!N/y==0;n++){
        y*=2;
    }

    for(i=1;i<=n;i++,x*=2) {
        number[i] = remain[i] % x;
        remain[i+1] = remain[i] - x;
    }

    for(i=1;i<=n;i++)
        printf("%d",number[i]);
    return i;
}
