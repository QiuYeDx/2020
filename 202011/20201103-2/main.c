#include <stdio.h>

int main() {
    int m,n,min,max,max_in,min_in,x,y,p,q;

    scanf("%d%d",&m,&n);
    max_in = m > n? m : n;
    min_in = m > n? n : m;
    max = min_in;
    while(1) {
        x = max_in % max;
        y = min_in % max;
    if(x == 0 && y == 0)
        break;
    max--;
    }

    min = max_in;
    while(1)
    {
        p = min % max_in;
        q = min % min_in;
        if(p == 0 && q == 0)
            break;
        min++;
    }
        printf("%d %d",max,min);

    return 0;
}
