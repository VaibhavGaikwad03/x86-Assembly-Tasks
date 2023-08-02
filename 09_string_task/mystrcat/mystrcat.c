#include <stdio.h>

char *mystrcat(char *dest, const char *src);

int main()
{
    char source[20], destination[40];

    printf("\n\nEnter Destination String:\t");
    gets(destination);

    printf("\n\nEnter Source String:\t");
    gets(source);

    mystrcat(destination, source);

    printf("\n\nConcatenated String Is:\t");
    puts(destination);

    return 0;
}

char *mystrcat(char *dest, const char *src)
{
    int counter1 = 0;
    int counter2 = 0;

    while (dest[counter1] != '\0')
        counter1++;
    
    while (src[counter2] != '\0')
    {
        dest[counter1] = src[counter2];
        counter1++;
        counter2++;
    }
    dest[counter1] = '\0';

    return dest;
}