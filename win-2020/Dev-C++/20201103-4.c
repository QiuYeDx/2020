#include<stdio.h>
#include<math.h>

int main() {
    int n,i,sum=0;

    scanf("%d",&n);
    for(;n>0;n--)
    	for(i=1;i<=n;i++)
   		{
        	sum+=2 * (int)pow(10,i-1);
        	
    	}
    printf("%d",sum);

    return 0;
}

