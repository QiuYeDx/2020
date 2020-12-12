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
    int n=0;

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



//开始条件输出
    int yn=0;
    for(i4=0;i4<N;i4++)
    {
        for(j4=0;j4<pyq.K[i4];j4++)
            if(pyq.id_yn[i4][j4]==1)
            {
                printf("%ld",pyq.id[i4][j4]);
                yn=1;
                break;
            }
        if(yn==1)
            break;
    }
    for(i3=i4;i3<N;i3++)
    {
        for(j3=j4+1;j3<pyq.K[i3];j3++)
            if(pyq.id_yn[i3][j3]==1)
                printf(" %ld",pyq.id[i3][j3]);
        j4=-1;
    }
    return 0;
}
