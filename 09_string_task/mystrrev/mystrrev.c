#include <stdio.h>

char *mystrrev(char *str);

int main()
{
    char string[20];

    printf("\n\nEnter The String:\t");
    gets(string);

    mystrrev(string);

    printf("\n\nReverse String Is:\t");
    puts(string);

    return 0;
}

char *mystrrev(char *str)
{
    int counter1 = 0;
    int counter2 = 0;

    while (str[counter2] != '\0')
        counter2++;
    counter2--;

    while (counter1 < counter2)
    {
        str[counter1] = str[counter1] + str[counter2];
        str[counter2] = str[counter1] - str[counter2];
        str[counter1] = str[counter1] - str[counter2];

        counter1++;
        counter2--;
    }
    return str;
}