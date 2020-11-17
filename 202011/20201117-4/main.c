#include <stdio.h>

int main() {
    char word[24][32]={0};
    int length[24]={0};
    int i=1,j=1;
    char g;
    while(scanf("%c",&g)!=EOF)
    {
        if(g==' ')
        {
            j=1;
            i++;
        }
        else
        {
            word[i][j]=g;
            length[i]++;
            j++;
        }
    }
    for(int k=i;k>=1;k--)
    {
        for(int n=1;n<=length[k];n++)
            printf("%c", word[k][n]);
        if(k>=2)
            printf("\n");
    }
    return 0;
}
