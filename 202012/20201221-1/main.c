/* 2017期末 输出6位数以内的，各位数字之和为16的所有整数，并统计符合条件的正整数的个数。
 * 例如：三位数826，8+2+6=16；六位数123811，1+2+3+8+1+1=16。 */
#include <stdio.h>

int main() {
    int n=0;

    for(int i=1;i<10;i++)
        for(int j=0;j<10;j++)
            if(i+j>16)
                break;
            else
                if(i+j==16)
                {
                    n++;
                    printf("%d ",i*10+j);
                }
    for(int i3=1;i3<10;i3++)
    {
        for(int i2=0;i2<10;i2++)
        {
            if(i3+i2>16)
                break;
            for(int i1=0;i1<10;i1++)
                if(i1+i2+i3>16)
                    break;
                else
                    if(i1+i2+i3==16)
                    {
                        n++;
                        printf("%d ",i1+i2*10+i3*100);
                    }
        }
    }
    for(int i4=1;i4<10;i4++)
    {
        for(int i3=0;i3<10;i3++)
        {
            if(i4+i3>16)
                break;
            for(int i2=0;i2<10;i2++)
            {
                if(i4+i3+i2>16)
                    break;
                for(int i1=0;i1<10;i1++)
                    if(i1+i2+i3+i4>16)
                        break;
                    else
                        if(i1+i2+i3+i4==16)
                        {
                            n++;
                            printf("%d ",i1+i2*10+i3*100+i4*1000);
                        }
            }
        }
    }
    for(int i5=1;i5<10;i5++)
    {
        for(int i4=0;i4<10;i4++)
        {
            if(i4+i5>16)
                break;
            for(int i3=0;i3<10;i3++)
            {
                if(i5+i4+i3>16)
                    break;
                for(int i2=0;i2<10;i2++)
                {
                    if(i2+i3+i4+i5>16)
                        break;
                    for(int i1=0;i1<10;i1++)
                        if(i1+i2+i3+i4+i5>16)
                            break;
                        else
                            if(i1+i2+i3+i4+i5==16)
                            {
                                n++;
                                printf("%d ",i1+i2*10+i3*100+i4*1000+i5*10000);
                            }
                }
            }
        }
    }
    for(int i6=1;i6<10;i6++)
    {
        for(int i5=0;i5<10;i5++)
        {
            if(i5+i6>16)
                break;
            for(int i4=0;i4<10;i4++)
            {
                if(i4+i5+i6>16)
                    break;
                for(int i3=0;i3<10;i3++)
                {
                    if(i3+i4+i5+i6>16)
                        break;
                    for(int i2=0;i2<10;i2++)
                    {
                        if(i2+i3+i4+i5+i6>16)
                            break;
                        for(int i1=0;i1<10;i1++)
                            if(i1+i2+i3+i4+i5+i6>16)
                                break;
                            else
                                if(i1+i2+i3+i4+i5+i6==16)
                                {
                                    n++;
                                    printf("%d ",i1+i2*10+i3*100+i4*1000+i5*10000+i6*100000);
                                }
                    }
                }
            }
        }
    }
    printf("\n%d",n);
    return 0;
}
