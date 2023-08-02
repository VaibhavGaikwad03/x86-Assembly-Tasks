#include <stdio.h>

char *mystrncat(char *dest, const char *src, int n);

int main()
{
    char source[20], destination[40];
    int n;

    printf("\n\nEnter Destination String:\t");
    gets(destination);
    
    printf("\n\nEnter Source String:\t");
    gets(source);

    printf("\n\nEnter Value Of n:\t");
    scanf("%d", &n);

    mystrncat(destination, source, n);

    printf("\n\nConcatenated String Is:\t");
    puts(destination);

    return 0;
}

char *mystrncat(char *dest, const char *src, int n)
{
    int counter1 = 0;
    int counter2 = 0;

    while (dest[counter1] != '\0')
        counter1++;
    
    for (counter2 = 0; counter2 < n && src[counter2] != '\0'; counter2++)
    {
        dest[counter1] = src[counter2];
        counter1++;
    }

    dest[counter1] = '\0'; 

    return dest;
}