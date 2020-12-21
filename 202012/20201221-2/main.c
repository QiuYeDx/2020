#include <stdio.h>  //OJ谭浩强11.8 先输入后排序版（极差）(未学习数据结构……一个失败的案例）
struct SP{
    int id;
    int cj;
    struct SP *pt_last,*pt_next;
};
int main() {
    int N,M;
    struct SP a[500];

    scanf("%d %d",&N,&M);
    for(int i=0;i<N;i++)
    {
        if(i==0) {
            a[i].pt_last = NULL;
            a[i].pt_next = &a[i+1];
        }
        else if(i==N-1) {
            a[i].pt_next = NULL;
            a[i].pt_last = &a[i-1];
        }
        else
        {
            a[i].pt_last=&a[i-1];
            a[i].pt_next=&a[i+1];
        }
        scanf("%d %d",&a[i].id,&a[i].cj);
    }
    for(int i=0;i<M;i++) {
        if (i == 0)
        {
            a[N + i].pt_last = NULL;
            a[N+i].pt_next = &a[N+i+1];
        }
        else if(i==M-1)
        {
            a[N+i].pt_next=NULL;
            a[N+i].pt_last=&a[N+i-1];
        }
        else
        {
            a[N+i].pt_last=&a[N+i-1];
            a[N+i].pt_next=&a[N+i+1];
        }
        scanf("%d %d",&a[N+i].id,&a[N+i].cj);
    }
    struct SP rep;
    for(int i=0,k=0;k<N+M;)
        for(int j=i+1;j<N+M;j++)
        {
            k++;
            if(a[i].id>a[j].id)
            {
                rep.id=a[i].id;
                rep.cj=a[i].cj;
                rep.pt_last=a[i].pt_last;
                rep.pt_next=a[j].pt_next;
                a[i].pt_next=rep.pt_next;
                a[j].pt_last=rep.pt_last;
                a[i].pt_last=&a[j];
                a[j].pt_next=&a[i];
                a[i-1].pt_next=&a[j];
                a[j+1].pt_last=&a[i];
            }
            else
                i=j;
        }
    struct SP *pt=&a[0];
    while(pt->pt_last!=NULL)
        pt=pt->pt_last;
    while(pt->pt_next!=NULL)
        printf("%d %d\n",pt->id,pt->cj);
    return 0;
}
