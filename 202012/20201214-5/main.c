#include <stdio.h>  //C语言第二次作业T5
#include <string.h>
struct CUSTOMER              //客户信息
{
    char ID[10];             //客户号
    char name[20];           //姓名
    char cellphone[12];      //手机号码
};

int main() {
    struct CUSTOMER customer[5];
    int k;

    for(int i=0;i<5;i++)
        scanf("%s%s%s",customer[i].ID,customer[i].name,customer[i].cellphone);
    for(int i=0;i<4;i++)
        if(strcmp(customer[i].cellphone,customer[i+1].cellphone)>=0)
            k=i;
        printf("%s %s %s",customer[k].ID,customer[k].name,customer[k].cellphone);
    return 0;
}
