#include <stdio.h>

int main() {
    int num_ch=0,num_num=0,num_blank=0,num_other=0;
    char c;

    scanf("%c",&c);
    while(c != 10)
    {
        if(c<=57 && c>=48)
            num_num++;
        else
            if(c<=90 && c>=65 || c>=97 && c<=122)
                num_ch++;
            else
                if(c == 32)
                    num_blank++;
                else
                    num_other++;
                scanf("%c",&c);
    }
    printf("%d %d %d %d",num_ch,num_num,num_blank,num_other);

    return 0;
}
