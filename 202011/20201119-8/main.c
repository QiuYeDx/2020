#include <stdio.h>
#define pr_1(num) printf("%6.2f",num);
#define pr_2(num) printf("%6.2f",num);printf("%6.2f",num);
#define pr_3(num) printf("%6.2f",num);printf("%6.2f",num);printf("%6.2f",num);

int main() {
    float num;

    scanf("%f",&num);
    pr_1(num)
    printf("\n");
    pr_2(num)
    printf("\n");
    pr_3(num)
    return 0;
}
