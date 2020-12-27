#include <stdio.h>
struct TEST{
    char name[20];
    int no;
    char sex;
    struct{
        int year;
        int month;
        int day;
    }birth;
};
int main() {
    struct TEST test={0};
    printf("%s\n%c\n%d",test.name,test.sex,test.no);
    return 0;
}
