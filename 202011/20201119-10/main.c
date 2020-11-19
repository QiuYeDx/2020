#include <stdio.h>
#include <string.h>

#define jiami(n) n+=1;

int main() {
    char ch[200]={0};
    int length;
    int j=0;
    while(scanf("%c",&ch[j]),ch[j]!='\n')
        j++;
    length=(int)strlen(ch);
    for(int i=0;i<length;i++) {
        if (ch[i]!='Z' && ch[i] != 'z' && ((ch[i] >= 'A' && ch[i] <= 'Z') || (ch[i] >= 'a' && ch[i] <= 'z')))
        {
            jiami(ch[i])
            continue;
        }
        if(ch[i]=='z')
            ch[i]='a';
        if(ch[i]=='Z')
            ch[i]='A';
    }
    printf("%s",ch);
    return 0;
}
