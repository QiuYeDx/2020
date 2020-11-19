#include <stdio.h>  //字符串比较排序
#include <string.h>
#define cmp(ch_1,ch_2,ch_rep) if((strcmp(ch_1,ch_2)>0)){strcpy(ch_rep,ch_2);strcpy(ch_2,ch_1);strcpy(ch_1,ch_rep);}

int main() {
    char ch_1[100]={0};
    char ch_2[100]={0};
    char ch_3[100]={0};
    char ch_rep[100]={0};

    scanf("%s%s%s",ch_1,ch_2,ch_3);
    cmp(ch_1,ch_2,ch_rep)
    cmp(ch_1,ch_3,ch_rep)
    cmp(ch_2,ch_3,ch_rep)
    printf("%s\n%s\n%s",ch_1,ch_2,ch_3);
    return 0;
}

//128KB 2ms