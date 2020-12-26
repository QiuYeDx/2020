#include <stdio.h>  //谭浩强11.8  后排序版
#include <stdlib.h>
struct LinkList{
    int id;
    int data;
    struct LinkList *next;
};

void Sort(struct LinkList * SL)   //链表排序(内容替换版)
{
    struct LinkList *p,*q;
    int temp1,temp2;

    for(p=SL;p!=NULL;p=p->next)
    {
        for(q=p->next;q!=NULL;q=q->next)
        {
            if(p->id>q->id)
            {
                temp1=q->id;
                temp2=q->data;
                q->id=p->id;
                q->data=p->data;
                p->id=temp1;
                p->data=temp2;
            }
        }
    }
}
int main() {
    struct LinkList *first,*pt,*now,*p,*rep,*min,*pl,*ml;
    int N,M;

    scanf("%d %d",&N,&M);    //输入
    first=(struct LinkList *)malloc(sizeof(struct LinkList));
    now=first;
    for(int i=1;i<N+M;i++)
    {
        scanf("%d %d",&now->id,&now->data);
        pt=(struct LinkList *)malloc(sizeof(struct LinkList));
        now->next=pt;
        now=pt;
    }
    scanf("%d %d",&pt->id,&pt->data);
    pt->next=NULL;

    Sort(first);  //链表排序

    p=first;     //简化版---链表的输出
    for(;p!=NULL;p=p->next)
        printf("%d %d\n",p->id,p->data);
    return 0;
}
