#include <stdio.h>

double min();

int num[11]={0};
double div[11]={0};

int main() {
    int i;
    int yn[11]={0};
    double average;

    scanf("%d%d%d%d%d%d%d%d%d%d",&num[1],&num[2],&num[3],&num[4],&num[5],&num[6],&num[7],&num[8],&num[9],&num[10]);
    average=(num[1]+num[2]+num[3]+num[4]+num[5]+num[6]+num[7]+num[8]+num[9]+num[10])/10.0;
    for(i=1;i<=10;i++)
        div[i]=num[i]-average;
    for(i=1;i<=10;i++)
    {
        if(div[i]==min())
        {
            yn[i]=1;
            break;
        }
    }
    for(i=1;i<=10;i++)
        if(yn[i]==1)
        {
            printf("%6d%6d",num[i],i);
            break;
        }
    return 0;
}

double min()
{
    int i;
    double m;

    for(i=1;i<=10;i++)
        if(div[i]>0)
        {
            m=div[i];
            break;
        }
    i=1;
    while(i<=10)
    {
        if(div[i]<m && div[i]>0)
        {
            m=div[i];
        }
        i++;
    }
    return m;
}