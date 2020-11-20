#include <stdio.h>  //C谭浩强-10.4

int main() {
    int num_in[200]={0};
    int n,i,m,j;

    scanf("%d",&n);
    i=1;
    while(i<=n)
    {
        scanf("%d",&num_in[i]);
        i++;
    }
    scanf("%d",&m);
    for(j=1;j<=m;j++)
        printf("%d ",num_in[n-m+j]);
    for(j=1;j<=n-m;j++)
        printf("%d ",num_in[j]);
    return 0;
}

//252KB 1ms no.1 AC