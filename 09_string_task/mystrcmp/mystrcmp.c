#include <stdio.h>

int mystrcmp(char *str1, char *str2);

int main()
{
    char string1[20], string2[20];
    int ch;

    printf("\n\nEnter String1:\t");
    gets(string1);

    printf("\n\nEnter String2:\t");
    gets(string2);

    ch = mystrcmp(string1, string2);

    if (ch == 0)
        printf("\n\nBoth Strings Are Same\n");
    else
        printf("\n\nBoth Strings Are Diffrent\n");

    return 0;
}

int mystrcmp(char *str1, char *str2)
{
    int counter = 0;

    while (str1[counter] == str2[counter] && str1[counter] != '\0' && str2[counter] != '\0')
        counter++;

    return str1[counter] - str2[counter];
}