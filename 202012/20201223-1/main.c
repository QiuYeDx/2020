#include <stdio.h>//Problem: You Lose!
//Source
//NEUACM Christmas Nova Contest

//Problem Description
// Asm.Def is watching Kuro/Neko playing games. This is an online turn-based two-player game.
// In the center position of the game screen,
// there is a bottle into which can be put into a special element called "Estus".
// Each round, the current player can choose one action from two actions.
// One is to put a number of units of "Estus" into the bottle
// (requires that the capacity cannot be exceeded).
// The other is to divide the existing "Estus" in the bottle into equal parts
// (requires the number of parts is more than 1, and each part cannot be 1 unit).
// The player who performs the division operation successfully can win the game immediately.
// If one player is unable to perform any kind of operation, the other wins.
// Noted that there are no "Estus" in the bottle when the game begins.
// As Kuro/Neko doesn't know the trick of this game,
// Asm.Def keeps taunting him "You Lose!".
// Kuro/Neko feels very upset, so he wants you to help him win the game.
// Kuro/Neko is always the first hand, he wants to know if he can win.
// And if so, what is the maximum number of "Estus" that he should put into the bottle for the first time.

//Input
// The input contains several test cases,
// and the first line contains a positive integer T indicating the number of test cases which is up to 500000.
// For each test case,
// there is one line contains a positive integer n indicating the capacity of the bottle, where 2<=n<=7000000

//Output
// For each test case, output a line containing whether Kuro/Neko can win this game ("YES" or "NO").
// And if he can win, output another line containing the maximum number of "Estus"
// that he should put into the bottle for the first time.

int main() {
    long T;
    scanf("%ld",&T);
    for(int i=0;i<T;i++)
    {
        long n;

        scanf("%ld",&n);
        if(n==2)
        {
            printf("YES\n2\n");
            continue;
        }
        if(n%2==1)
        {
            printf("YES\n%ld\n",n);
            continue;
        }
        else
        {
            printf("YES\n%ld\n",n-1);
        }
    }
    return 0;
}
