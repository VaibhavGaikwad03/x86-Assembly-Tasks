#include <stdio.h>

char *mystrupr(char *str);

int main()
{
    char str[20];

    printf("\n\nEnter The String:\t");
    gets(str);

    mystrupr(str);

    printf("\nString In Upper Case Is:\t");
    puts(str);

    return 0;
}

char *mystrupr(char *str)
{
    int counter = 0;

    while (str[counter] != '\0')
    {
        if (str[counter] >= 'a' && str[counter] <= 'z')
            str[counter] = str[counter] - 32;
        counter++;
    }
}