#include <stdio.h>

int main() {
    int in_number=0;
    char ch;
    int n=0;

    while(scanf("%c",&ch)!=EOF)
    {
        if(ch>=48 && ch<=57)
        {
            if (in_number == 0)
                in_number = 1;
        }
        else
            if(in_number==1)
            {
                in_number=0;
                n++;
            }
    }
    if(in_number==1)
        n++;
    printf("%d",n);
    return 0;
}
