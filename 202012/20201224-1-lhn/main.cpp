#include<bits/stdc++.h>
using namespace std;
int main()
{
    int a[10];
    while(scanf("%d",&a[0])!=EOF)
    {
        string ans[4]={"","","",""};
        for(int i=1;i<4;i++)
        {
            cin>>a[i];
        }
        for(int i=0;i<4;i++)
        {
            if(a[i]==1)
            {

                ans[1]+="   ";
                ans[2]+="  |";
                ans[3]+="  |";
            }
            if(a[i]==2)
            {
                ans[1]+=" _ ";
                ans[2]+=" _|";
                ans[3]+="|_ ";
            }
            if(a[i]==3)
            {
                ans[1]+=" _ ";
                ans[2]+=" _|";
                ans[3]+=" _|";
            }
            if(a[i]==4)
            {
                ans[1]+="   ";
                ans[2]+="|_|";
                ans[3]+="  |";
            }
            if(a[i]==5)
            {
                ans[1]+=" _ ";
                ans[2]+="|_ ";
                ans[3]+=" _|";
            }
            if(a[i]==6)
            {
                ans[1]+=" _ ";
                ans[2]+="|_ ";
                ans[3]+="|_|";
            }
            if(a[i]==7)
            {
                ans[1]+=" _ ";
                ans[2]+="  |";
                ans[3]+="  |";
            }
            if(a[i]==8)
            {
                ans[1]+=" _ ";
                ans[2]+="|_|";
                ans[3]+="|_|";
            }
            if(a[i]==9)
            {
                ans[1]+=" _ ";
                ans[2]+="|_|";
                ans[3]+=" _|";
            }
            if(a[i]==0)
            {
                ans[1]+=" _ ";
                ans[2]+="| |";
                ans[3]+="|_|";
            }
        }
        for(int i=1;i<4;i++)
        {
            cout<<ans[i]<<endl;
        }
    }
    return 0;
}