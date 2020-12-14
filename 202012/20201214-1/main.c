#include <stdio.h>  //C语言第二次作业T1
#define MAX 5

struct LINE{
    int num[MAX];
    int max;
};

int main() {
    struct LINE line[MAX];
    int min;

    for(int i=0;i<MAX;i++)
    {
        scanf("%d",&line[i].num[0]);
        line[i].max=line[i].num[0];
        for(int j=1;j<MAX;j++)
        {
            scanf("%d",&line[i].num[j]);
            line[i].max=line[i].num[j]>line[i].max?line[i].num[j]:line[i].max;
        }
    }
    min=line[0].max;
    for(int i=0;i<MAX;i++)
        min=min<=line[i].max?min:line[i].max;
    printf("%d",min);
    return 0;
}
