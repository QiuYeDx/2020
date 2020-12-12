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
    long ids[10000] = {0};

    scanf("%d", &N);
    for (int i = 0; i < N; i++)
    {
        scanf("%d", &pyq.K[i]);
        for (int j = 0; j < pyq.K[i]; j++)
            scanf("%ld", &pyq.id[i][j]);
    }
    scanf("%d", &M);
    for (int k = 0; k < M; k++)
        scanf("%ld", &ids[k]);

    for(int k=0;k<N;k++)
        for(int i=0;i<N;i++)
            for(int j=0;j<pyq.K[i];j++)
                if(pyq.id[i][j]==ids[k])
                    pyq.id_yn[i][j]=1;

    for(int i=0;i<N;i++)
        for(int j=0;j<pyq.K[i];j++)
            if(pyq.id_yn[i][j]==1)
                printf("%ld",pyq.id[i][j]);
    return 0;
}
