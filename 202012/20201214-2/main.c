#include <stdio.h>  //C语言第二次作业T2  AckMan函数

int yn(int, int);

int fc1(int m, int n)
{
    return n+1;
}

int fc2(int m, int n)
{
    int rep;
    rep=yn(m-1,1);
    return rep;
}

int fc3(int m, int n)
{
    int rep;
    rep=yn(m-1,yn(m,n-1));
    return rep;
}
int main() {
    int m,n;

    scanf("%d%d",&m,&n);
    printf("%d",yn(m,n));
    return 0;
}

int yn(int m, int n)
{
    int rep;
    if(m==0)
        rep=fc1(m,n);
    if(m>0 && n==0)
        rep=fc2(m,n);
    if(m>0 && n>0)
        rep=fc3(m,n);
    return rep;
}