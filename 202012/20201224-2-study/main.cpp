/* NEU ACM So easy！！！ */
#include<iostream>
#include<cstdio>
#include<cstring>
#include<cmath>
#include<algorithm>
#include<stack>
using namespace std;
typedef long long LL;
char s[1000010];
bool is_diget(int x)
{
    if(x >= '0' && x <= '9')return true;
    else return false;
}
int main()
{
    while(~scanf("%s", s))
    {
        stack<LL>S;
        LL temp, temp1;
        for(int i = 0; s[i];)
        {
            if(is_diget(s[i]))
            {
                temp = 0;
                while(is_diget(s[i]))
                {
                    temp = temp * 10 + s[i] - '0';
                    i++;
                }
                S.push(temp);
            }
            else
            {
                switch(s[i])
                {
                    case '+':
                        i++;
                        break;
                    case '-':
                        i++;
                        temp = 0;
                        while(is_diget(s[i]))
                        {
                            temp = temp * 10 + s[i] - '0';
                            i++;
                        }
                        temp = -temp;
                        S.push(temp);
                        break;
                    case '*':
                        i++;
                        temp = 0;
                        while(is_diget(s[i]))
                        {
                            temp = temp * 10 + s[i] - '0';
                            i++;
                        }
                        temp1 = S.top();
                        S.pop();
                        S.push(temp1 * temp);
                        break;
                    case '/':
                        i++;
                        temp = 0;
                        while(is_diget(s[i]))
                        {
                            temp = temp * 10 + s[i] - '0';
                            i++;
                        }
                        temp1 = S.top();
                        S.pop();
                        S.push(temp1 / temp);
                        break;
                }
            }
        }
        temp = 0;
        while(!S.empty())
        {
            temp += S.top();
            S.pop();
        }
        printf("%lld\n",temp);
    }
    return 0;
}