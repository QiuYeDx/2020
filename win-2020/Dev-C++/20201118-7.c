#include<stdio.h>
void main(void)
{
	char a[10]="12345678";
	char b[5]="abc";
	strcpy(a,b);
	printf("%s%c",a,a[6]);
}
