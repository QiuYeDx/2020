/*  ACM选修课5-1 TIME
`Problem Description

Digital clock use 4 digits to express time, each digit is described by 3*3 characters (including”|”,”_”and” “).
now given the current time, please tell us how can it be expressed by the digital clock.

`Input

There are several test cases.
Each case contains 4 integers in a line, separated by space.
Proceed to the end of file.

`Output

For each test case, output the time expressed by the digital clock such as Sample Output.

`Sample Input

1 2 5 6
2 3 4 2

`Sample Output
    _  _  _
  | _||_ |_
  ||_  _||_|
 _  _     _
 _| _||_| _|
|_  _|  ||_
 */

#include <stdio.h>
void prf1(int num)
{
    if(num==1 || num==4)
        printf("   ");
    else
        printf(" _ ");
}
void prf2(int num)
{
    if(num==1 || num==7)
    {
        printf("  |");
        return;
    }
    if(num==4 || num==8 || num==9)
    {
        printf("|_|");
        return;
    }
    if(num==2 || num==3)
    {
        printf(" _|");
        return;
    }
    if(num==5 || num==6)
    {
        printf("|_ ");
        return;
    }
    if(num==0)
        printf("| |");
}
void prf3(int num)
{
    if(num==1 || num==4 || num==7)
    {
        printf("  |");
        return;
    }
    if(num==3 || num==5 || num==9)
    {
        printf(" _|");
        return;
    }
    if(num==2)
        printf("|_ ");
    else
        printf("|_|");
}
int main() {
    int n[4]={0};

    while(scanf("%d %d %d %d",&n[0],&n[1],&n[2],&n[3])!=EOF)
    {
        prf1(n[0]);
        prf1(n[1]);
        prf1(n[2]);
        prf1(n[3]);
        printf("\n");
        prf2(n[0]);
        prf2(n[1]);
        prf2(n[2]);
        prf2(n[3]);
        printf("\n");
        prf3(n[0]);
        prf3(n[1]);
        prf3(n[2]);
        prf3(n[3]);
        printf("\n");
        getchar();
    }
    return 0;
}
