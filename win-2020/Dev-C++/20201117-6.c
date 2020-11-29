#include<stdio.h>

int main()
{
	int num[11]={0};
	int i,j,rep;
	int i_1,i_2;
	int yn=0;
	
	for(i_1=1;i_1<=10;i_1++)
		scanf("%d",&num[i_1]);
	for(i=1;i<=9;i++)
		for(j=i+1;j<=10;j++)
			if(num[j]<num[i])
			{
				rep=num[i];
				num[i]=num[j];
				num[j]=rep; 
			}
	i_2=1;
	while(i_2<=9)
	{
		if(num[i_2]==num[i_2+1] && num[i_2]!=num[i_2+2] && num[i_2]!=num[i_2-1])
			{
				printf("%6d",num[i_2]);
				yn=1;
				i_2+=2;
				continue;
			}
		if(num[i_2]==num[i_2+1] && num[i_2]==num[i_2+2])
		{
			while(num[i_2]==num[i_2+1])
			{
				i_2++;
			}
			continue;
		}
		if(num[i_2]!=num[i_2+1])
			i_2++;
	}
	if(yn==0)
		printf("None");
	return 0;
}
