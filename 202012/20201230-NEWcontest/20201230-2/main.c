#include <stdio.h>  //666666
#include <string.h>

typedef struct STU{
    char name[12];
    int id;
    int score;
}Stu;
int main() {
    Stu stu[120] = {0}, rep;
    int n, yn;

    scanf("%d", &n);
    for (int i = 0; i < n; i++)
        scanf("%s%d%d", stu[i].name, &stu[i].id, &stu[i].score);
    for (int i = 0; i < n - 1; i++)
        for (int j = i + 1; j < n; j++) {
            if (stu[j].score > stu[i].score) {
                rep = stu[j];
                stu[j] = stu[i];
                stu[i] = rep;
            }
        }
    for (int k = 1; k<10000;k++)
        for (int i = 0; i < n - 1; i++) {
            for (int j = i+1;j<n; j++) {
                if (stu[j].score == stu[i].score && strcmp(stu[i].name, stu[j].name)>0)
                {
                    rep = stu[j];
                    stu[j] = stu[i];
                    stu[i] = rep;
                }

            }
        }

    for (int k=1; k<10000;k++)
        for (int i = 0; i < n; i++)
        {
            for (int j = i; j<n-1 ; j++)
            {
                if(strcmp(stu[j].name,stu[j+1].name)==0  && (stu[j].score == stu[j + 1].score) && stu[j].id > stu[j + 1].id)
                {
                    rep = stu[j];
                    stu[j] = stu[j + 1];
                    stu[j + 1] = rep;
                }
            }
        }

    for(int j=0;j<n;j++)
    {
        printf("%s %d %d",stu[j].name,stu[j].id,stu[j].score);
        if(j<n-1)
        {
            printf("\n");
        }
    }
    return 0;
}
