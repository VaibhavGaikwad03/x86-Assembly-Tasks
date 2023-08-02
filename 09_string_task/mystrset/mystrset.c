#include <stdio.h>

char *mystrset(char *str, const char c);

int main()
{
    char str[20], ch;

    printf("\n\nEnter The String:\t");
    gets(str);

    printf("\n\nEnter The Character To Set:\t");
    scanf("%c", &ch);

    mystrset(str, ch);

    printf("\n\nNow String Is:\t");
    puts(str);
    
    return 0;
}

char *mystrset(char *str, const char c)
{
    int counter = 0;

    while (str[counter] != '\0')
    {
        str[counter] = c;
        counter++;
    }

    return str;
}