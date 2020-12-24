#include <stdio.h>  //谭浩强11.8  后排序版
#include <stdlib.h>
struct LinkList{
    int id;
    int data;
    struct LinkList *next;
};
int main() {
    struct LinkList *first,*pt,*now,*p,*rep;
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

    now=first;
    p=now->next;
    for(int i=1;i<N+M;i++)     //排序
    {
        now=first;
        while(now!=NULL)
        {
            if(now->id>p->id)
            {
            now->next=p->next;
            p->next=now;
            if(now==first)
                first=p;
            }
            else
            {
                now=p;
                p=p->next;
            }
        }
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
