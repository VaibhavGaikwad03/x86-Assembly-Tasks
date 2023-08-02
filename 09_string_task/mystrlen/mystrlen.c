#include <stdio.h>

int mystrlen(const char *str);

int main()
{
    char *ptr = "Hello";
    char str[] = "Good";

    printf("\nThe Length Of Hello Is %d\n", mystrlen(ptr));
    printf("The Length Of Good Is %d\n", mystrlen(str));
    printf("The Length Of Morning Is %d\n", mystrlen("Morning"));
    
    return 0;
}

int mystrlen(const char *str)
{
    int counter = 0;

    while (str[counter] != '\0')
        counter++;
    return counter;
}