#include <stdio.h> //a e i o u 97 101 105 111 117

int main() {
    char ch[100]={0};

    scanf("%s",ch);
    for(int i=0;i<=99;i++)
    {
        if(ch[i]!='0') {
            if(ch[i]==97||ch[i]==101||ch[i]==105||ch[i]==111||ch[i]==117)
                printf("%c", ch[i]);
        }
        else
            break;
    }
    return 0;
}
