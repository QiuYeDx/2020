#include <stdio.h>  //谭浩强11.8  后排序版
#include <stdlib.h>
struct LinkList{
    int id;
    int data;
    struct LinkList *next;
};
int main() {
    struct LinkList *first,*pt,*now,*p,*rep,*min,*pl,*ml;
    int N,M;

    scanf("%d %d",&N,&M);    //输入
    first=(struct LinkList *)malloc(sizeof(struct LinkList));
    now=first;
    for(int i=1;i<N+M;i++)
    {
        int id,data;
        scanf("%d %d",&id,&data);
        now->id=id;
        now->data=data;
        pt=(struct LinkList *)malloc(sizeof(struct LinkList));
        now->next=pt;
        now=pt;
    }
    scanf("%d %d",&pt->id,&pt->data);
    pt->next=NULL;

    for(int i=1;i<N+M;i++)     //排序
    {
        pt=first;
        for(int j=1;j<i;j++)
        {
            if(j==i-1)
                pl=pt;
            pt=pt->next;
        }

        now=pt;
        min=pt;
        for(;now->next!=NULL;)
        {
            if(now->id<min->id)
            {
                min=now;
            }
            now=now->next;
        }
        //开始替换min与pt
        pl->next=min;
        rep=pt->next;
        pt->next=min->next;
        min->next=rep;
        p=first;
        while(p->next!=min)
            p=p->next;
        p->next=pt;
    }

    p=first;     //输出
    while(p->next!=NULL)
    {
        printf("%d %d\n",p->id,p->data);
        p=p->next;
    }
    printf("%d %d\nover!",p->id,p->data);
    return 0;
}
