#include <stdio.h>

char *mystrchr(char *str, char c);

int main()
{
    char str[20];
    char c;
    char *ret;

    printf("Enter the string : ");
    scanf("%s", str);

    printf("Enter character : ");
    scanf(" %c", &c);

    ret = mystrchr(str, c);

    if (ret != NULL)
        puts(ret);

    return 0;
}

char *mystrchr(char *str, char c)
{
    int counter = 0;

    while (str[counter] != '\0')
    {
        if (str[counter] == c)
            return &str[counter];
        counter++;
    }
    return NULL;
}