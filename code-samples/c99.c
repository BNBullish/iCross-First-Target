#include<stdio.h>

int main(){
    int x;
    scanf("%d", &x);
    int a[x];
    for (int i = 0; i < x; ++i)
        a[i] = i * i;
    for (int i = 0; i < x; ++i)
        printf("%d\n", a[i]);
}
