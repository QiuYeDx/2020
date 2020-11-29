#include<stdio.h>
int main(void)
{
    int i=1;
    int n=0;
    do
    {
     printf("i is %d\n",i);
     i++;  
	 n++; 
    }
    while(i==100);
    return n;
}
