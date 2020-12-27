#include <stdio.h>  //20201227-2 结构体的声明与初始化相关问题
struct TEST{
    int data1,data2;
}test1={1,2},test2={.data2=2};  //初始化器の初始化
int main() {
    test1=test2;
    test2=(struct TEST){1,2};
    return 0;
}
