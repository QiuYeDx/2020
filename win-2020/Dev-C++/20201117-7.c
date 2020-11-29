#include <stdio.h>
#include <math.h>

int main()
{
	char ch[11]={0};
	int num[11]={0};
	int i=1;
	int k,j;
	int rep;
	int max_ch,min_ch;
	int max_num=0,min_num=0;
	
	while(scanf("%c",&ch[i])!=EOF)
	{
		num[i]=(int)(ch[i]-48);
		i++;
	}
	i--;
	for(k=1;k<i;k++)           //将数字从小到大排列 
		for(j=k+1;j<=i;j++)
			if(num[k]>num[j])
			{
				rep=num[k];
				num[k]=num[j];
				num[j]=rep;
			}
	for(j=1;j<=i;j++)
	{
		max_num+=num[j]*pow(10,j-1);
	}
	for(j=i,k=1;j>=1;j--,k++)
	{
		min_num+=num[j]*pow(10,k-1);
	}
	printf("%10ld%10ld",max_num,min_num);
	return 0;
}
