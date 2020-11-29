#include<stdio.h>

void main(void){
	long number[64],i=1,i2=1,sum=0;
	
	while(scanf("%ld",&number[i])!=EOF)
	i++;
	while(1)
	{
		sum  += number[i2];
		if(i2 == i - 1)
		break;
		i2++;
	}
	printf("%ld",sum);
}
