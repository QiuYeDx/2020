#include <stdio.h>
struct fs{
    long long fz;
    long long fm;
};

long long max_gys(long long a, long long b)
{
    return b==0?a:max_gys(b,a%b);
}

long long min_gbs(long long a, long long b)
{
    long long maxgys;
    maxgys=max_gys(a,b);
    return a/maxgys*b;
}

int main( )
{
    int N;
    struct fs num[100];
    long long n_zs=0;
    struct fs sum;

    while(scanf("%d",&N)!=EOF)
    {
        n_zs=0;
        for(int i=0;i<N;i++)
        {
            scanf("%lld/%lld",&num[i].fz,&num[i].fm);
            n_zs+=num[i].fz/num[i].fm;
            num[i].fz=num[i].fz%num[i].fm;
        }
        sum.fm=num[0].fm;
        sum.fz=num[0].fz;

    for(int i=1;i<N;i++)   //对真分数求和
    {
        long long mingbs;

        mingbs=min_gbs(sum.fm,num[i].fm);
        sum.fz=sum.fz*(mingbs/sum.fm)+num[i].fz*(mingbs/num[i].fm);
        sum.fm=mingbs;
    }
    long long k;
    k=max_gys((sum.fz>0?sum.fz:0-sum.fz)>sum.fm?sum.fz:sum.fm,(sum.fz>0?sum.fz:0-sum.fz)>sum.fm?sum.fm:sum.fz);
    k=k>0?k:0-k;
    sum.fz/=k;
    sum.fm/=k;

    n_zs+=sum.fz/sum.fm;
    sum.fz%=sum.fm;

    if(n_zs>0 && sum.fz<0)
    {
        sum.fz=sum.fm-(sum.fz>0?sum.fz:0-sum.fz);
        n_zs-=1;
    }

    if(n_zs<0 && sum.fz>0)
    {
        sum.fz=0-(sum.fm-(sum.fz>0?sum.fz:0-sum.fz));
        n_zs+=1;
    }

    if(n_zs!=0)
        printf("%lld ",n_zs);
    if(sum.fz!=0)
        printf("%lld/%lld\n",sum.fz,sum.fm);
    }
    return 0;
}
