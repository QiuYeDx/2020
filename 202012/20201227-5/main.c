#include <stdio.h> //20201227-5 公司员工简化数据库 AC~
#include <stdlib.h>  //重点复习了s_gets()字符串输入函数的码写、链表的输入与输出
#include <string.h>
#define LEN sizeof(struct STAFF)
#define LEN_NAME 25

struct STAFF{
    char name[25];
    int sex;
    int year;
    long money;
    struct{
        int m100;
        int m50;
        int m20;
        int m10;
        int m5;
        int m1;
    }salary;
    struct STAFF * next;
};
struct STAFF *input(struct STAFF *);
void output(struct STAFF *);
void cal_salary(struct STAFF *pt)
{
    pt->salary.m100=pt->money/100;
    pt->salary.m50=pt->money%100/50;
    pt->salary.m20=pt->money%50/20;
    pt->salary.m10=pt->money%20/10;
    pt->salary.m5=pt->money%10/5;
    pt->salary.m1=pt->money%5;
}
char *s_gets(char * ch)
{
    int i=0;
    char * ret_val=NULL;

    ret_val=fgets(ch,LEN_NAME,stdin);
    if(ret_val && ch[0]!='\n')
    {
        while(ch[i]!='\n' && ch[i]!='\0')
            i++;
        if(ch[i]=='\n')
            ch[i]='\0';
        else
            while(getchar()!='\n')
                continue;
    }
    else
        ret_val=NULL;
    return ret_val;
}
int main() {
    struct STAFF staff={0},*head;
    printf("\\*Name,sex,work time(years),salary.*\\\n"
           "(Input the name in a line.)\n"
           "(0:female\t1:male)\n");
    printf("Please input the information:(Input [enter] in a new line to quit)\n");
    head=input(&staff);
    output(head);
    return 0;
}

struct STAFF * input(struct STAFF *head)
{
    struct STAFF *pt,*now;
    char names[LEN_NAME];

    head->next=NULL;
    if(s_gets(names)!=NULL)
    {
        pt=(struct STAFF *)malloc(LEN);
        pt->next=NULL;
        strcpy(pt->name,names);
        scanf("%d %d %ld",&(pt->sex),&(pt->year),&(pt->money));
        getchar();
        cal_salary(pt);
        head->next=pt;
    }
    else return head;
    now=pt;
    while(s_gets(names)!=NULL)
    {
        pt=(struct STAFF *)malloc(LEN);
        pt->next=NULL;
        strcpy(pt->name,names);
        scanf("%d %d %ld",&(pt->sex),&(pt->year),&(pt->money));
        getchar();
        cal_salary(pt);
        now->next=pt;
    }

    return head;
}

void output(struct STAFF * head)
{
    int i=1;
    if(head->next==NULL)
    {
        printf("No input.");
        return;
    }
    head=head->next;
    while(head!=NULL)
    {
        printf("\nNo.%d:\n"
               "\tName:%s\n"
               "\tSex: %s\n"
               "\tLength Of Service: %d years\n"
               "\tSalary: %ld RMB\n",i,head->name,head->sex==1?"male":"female",head->year,head->money);
        printf("\tAnd the number of 100r: %d\n",head->salary.m100);
        printf("\t    the number of 50r:  %d\n",head->salary.m50);
        printf("\t    the number of 20r:  %d\n",head->salary.m20);
        printf("\t    the number of 10r:  %d\n",head->salary.m10);
        printf("\t    the number of 5r:   %d\n",head->salary.m5);
        printf("\t    the number of 1r:   %d\n",head->salary.m1);
        head=head->next;
        i++;
    }
}