#include<iostream>
#include<cmath>
#include<string>
#include<cstring>
#include<cstdio>
using namespace std;
int main() {
    //freopen("C:\\Users\\AXIS5\\Documents\\Visual Studio 2010\\Projects\\not so easy\\test.txt","r",stdin);
    //freopen("C:\\Users\\AXIS5\\Documents\\Visual Studio 2010\\Projects\\not so easy\\outt.txt","w",stdout);
    string cmd;
    char sub[1000][1000]= {""};
    int l,k,p,flag[1000]= {0},ls,mode;
    long long ans[1000],num,sum;
    while(getline(cin,cmd)) {
        if(cmd=="")continue;
        memset(sub,0,sizeof(sub));
        memset(flag,0,sizeof(flag));
        memset(ans,0,sizeof(ans));
        flag[0]=1;
        l=cmd.length();
        k=0;
        p=0;
        sum=0;
        for(int i=0; i<l-1; i++) {
            if(cmd[i]=='+'||cmd[i]=='-') {                //separate the expresion while encounter + and -
                sub[k][p]='\0';
                p=0;
                k++;
                flag[k]=(cmd[i]=='+')?1:-1;
            } else {
                sub[k][p]=cmd[i];
                p++;
            }
        }
        sub[k][p]='\0';
        for(int i=0; i<=k; i++) {                            //calculate each part
            ls=strlen(sub[i]);
            num=0;
            mode=0;                                        //0=* 1=/
            ans[i]=1;
            for(int j=0; j<ls; j++) {
                if(sub[i][j]=='*') {                        //encounter *
                    if(mode==0) {
                        ans[i]*=num;
                        num=0;
                        mode=0;
                    } else {
                        ans[i]/=num;
                        num=0;
                        mode=0;
                    }
                } else if(sub[i][j]=='/') {                //encounter /
                    if(mode==0) {
                        ans[i]*=num;
                        num=0;
                        mode=1;
                    } else {
                        ans[i]/=num;
                        num=0;
                        mode=1;
                    }
                } else {
                    num*=10;
                    num+=sub[i][j]-48;
                }
            }
            if(mode==0) {                                //last one
                ans[i]*=num;
                num=0;
                mode=0;
            } else {
                ans[i]/=num;
                num=0;
                mode=0;
            }
        }
        for(int i=0; i<=k; i++) {
            sum+=flag[i]*ans[i];
        }
        cout<<sum<<endl;
    }
    //fclose(stdin);
    //fclose(stdout);
    return 0;
}