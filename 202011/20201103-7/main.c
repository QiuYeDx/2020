#include <stdio.h>

int main() {
    int i_1,i_2,i_3,num=0;
    for(i_1=1;i_1<=9;i_1++)
        for(i_2=0;i_2<=9;i_2++)
            for(i_3=0;i_3<=9;i_3++)
            {
                num = i_1 * 100 + i_2 * 10 + i_3;
                if(num == i_1*i_1*i_1 + i_2*i_2*i_2 + i_3*i_3*i_3)
                    printf("%d\n",num);
            }
    return 0;
}
