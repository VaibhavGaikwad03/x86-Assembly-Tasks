#include <stdio.h>

char *mystrcpy(char *dest, const char *src);    

int main()
{
    char source[20];
    char destination[20];

    printf("\n\nEnter Source String:\t");
    gets(source);

    printf("\n\nSource String Is:\t");
    puts(source);

    mystrcpy(destination, source); 

    printf("\n\nDestination String Is:\t");
    puts(destination);

    return 0;
}

char *mystrcpy(char *dest, const char *src)
{
    int counter = 0;

    while (src[counter] != '\0')
    {
        dest[counter] = src[counter];
        counter++;
    }
    dest[counter] = '\0';
    
    return dest;
}