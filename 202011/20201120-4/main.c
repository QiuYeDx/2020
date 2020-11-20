#include <stdio.h>  //C谭浩强-10.7

int main() {
    int n,m;
    char ch[200]={0};

    scanf("%d",&n);
    scanf("%s",ch);
    scanf("%d",&m);

    for(int i=m-1;i<=n-1;i++)
        printf("%c",ch[i]);
    return 0;
}
//252KB 5ms No.1 AC