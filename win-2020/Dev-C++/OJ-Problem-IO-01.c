#include<stdio.h>

void main(void){
	long double number[64],sum=0.00;
	int i=1,i2=1;
	
	while(scanf("%lf",&number[i])!=EOF)
	i++;
	while(1)
	{
		sum  += number[i2];
		if(i2 == i - 1)
		break;
		i2++;
	}
	printf("%lf",sum);
} 
