#include <stdio.h>

int main() {
    char s1[1002]={0};
    char s2[1002]={0};

    gets(s1);
    gets(s2);

    for(int i=0;s1[i]!='\0';i++)
    {
        int yn=1;
        for(int j=0;s2[j]!='\0';j++)
            if(s1[i]==s2[j])
            {
                yn=0;
                break;
            }
        if(yn==0)
            putchar('#');
        else
            putchar(s1[i]);
    }
    return 0;
}
