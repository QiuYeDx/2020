#include<stdio.h>

int main()
{
	printf("%u\n",sizeof("\"x\34\b\xab\\\ab\n"));
	printf("%u",sizeof("\\\\"));
	return 0;
 } 
