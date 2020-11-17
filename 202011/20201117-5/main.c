#include <stdio.h>

int main() {
    char ch;
    int length=0;
    int max_length=0;
    int in_word=0;

    while(scanf("%c",&ch)!=EOF)
    {
        if(ch==' ')
            in_word=0;
        if(ch!=' ' && in_word==0)
        {
            if(length>max_length)
                max_length=length;
            in_word=1;
            length=1;
        }
        if(ch!=' ' && in_word==1)
            length++;
    }
    printf("%d",max_length);
    return 0;
}
