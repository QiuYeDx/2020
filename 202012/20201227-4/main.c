#include <stdio.h>
struct TEST{
    int n;
    int *t;
}*p;
int main() {
    static struct TEST s[3]={5,'\0',7,'\0',9,'\0'};
    p=s;
    printf("%d\n",(*p).n++);
    return 0;
}
