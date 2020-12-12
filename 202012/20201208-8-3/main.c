#include <stdio.h>  //ACM Problem6-4 找出帅到没朋友的人
struct FRINEDS
{
    int K[100];
    long id[100][1001];
    int id_yn[100][1001];
}static pyq;

int main() {
    int N;
    int M;
    int i1,i2,i3,i4;
    int k1,k2,k3;
    int j1,j2,j3,j4;
    long ids[10000] = {0};
    long handsome[10000]={0};
    long nohandsome[10000]={0};
    long fanally[10000]={0};
    scanf("%d", &N);
    for (i1 = 0; i1 < N; i1++)
    {
        scanf("%d", &pyq.K[i1]);
        for (j1 = 0; j1 < pyq.K[i1]; j1++)
            scanf("%ld", &pyq.id[i1][j1]);
    }
    scanf("%d", &M);
    for (k1 = 0; k1 < M; k1++)
        scanf("%ld", &ids[k1]);

    int n_no=0;
    int n=1;

    for(k2=0;k2<M;k2++)   //逐行初筛
        for(i2=0;i2<N;i2++)
            for(j2=0;j2<pyq.K[i2];j2++)
                if(pyq.id[i2][j2]==ids[k2])  //找到目标，开始判断
                {
                    if(pyq.K[i2]>1)
                    {
                        nohandsome[n_no]=pyq.id[i2][j2];
                        n_no++;
                        continue;
                    }
                    else
                    {
                        handsome[n]=pyq.id[i2][j2];
                        n++;
                        continue;
                    }
                }

    //开始二筛
    int i5,j5;
    for(i5=1;i5<n;i5++)
        for(j5=0;j5<n_no;j5++)
            if(handsome[i5]==nohandsome[j5])
                handsome[i5]=0;

    //开始排序
    int i6,j6;
    long rep;

    for(i6=1;i6<=n;i6++)
        for(j6=i6+1;j6<=n+1;j6++)
            if(handsome[i6]==handsome[j6])
            {
                rep=handsome[i6];
                handsome[i6]=handsome[j6];
                handsome[j6]=rep;
            }

    //开始三筛

    int i7,j7=0;
    for(i7=1;i7<=n;i7++)
        if(handsome[i7]!=0 && handsome[i7]!=handsome[i7+1] && handsome[i7]!=handsome[i7-1])
        {
            fanally[j7]=handsome[i7];
            j7++;
        }

    //开始输出

    int i8=0;
        printf("%ld",fanally[i8]);
        for(i8=1;i8<j7;i8++)
            printf(" %ld",fanally[i8]);
    return 0;
}
