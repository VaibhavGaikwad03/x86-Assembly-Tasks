#include <stdio.h>

char *mystrrchr(char *str, char c);

int main()
{
    char str[20];
    char c;
    char *ret;

    printf("Enter the string : ");
    scanf("%s", str);

    printf("Enter character : ");
    scanf(" %c", &c);

    ret = mystrrchr(str, c);

    if (ret != NULL)
        puts(ret);

    return 0;
}

char *mystrrchr(char *str, char c)
{
    int counter = 0;
    char *temp = NULL;

    while (str[counter] != '\0')
    {
        if (str[counter] == c)
            temp = &str[counter];
        counter++;
    }
    return temp;
}