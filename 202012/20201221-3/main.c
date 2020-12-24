#include <stdio.h>
struct Node{
    int test;
};
typedef struct Node *LinkList;  //LinkList声明一个指针
typedef struct Node Nametwo;    //Nametwo声明一个Node类型的结构体
int main() {
    LinkList L;
    L->test;

    Nametwo L2;
    L2.test;
    return 0;
}
