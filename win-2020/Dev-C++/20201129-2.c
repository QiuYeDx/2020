#include<stdio.h>

int main()
{
	char line[81];
	while(fgets(line,81,stdin))
		fputs(line,stdout);
	return 0;
}
