#include <stdio.h>

int main() {
    int N,num;

    while(scanf("%d",&N)!=EOF)
    {
        int n_1=0,n_2=0;

        getchar();
        for(int j=0;j<N;j++)
        {
            scanf("%d",&num);
            if(num%2)
                n_1++;
            else
                n_2++;
        }
        printf("%d %d\n",n_1,n_2);
    }
    return 0;
}
