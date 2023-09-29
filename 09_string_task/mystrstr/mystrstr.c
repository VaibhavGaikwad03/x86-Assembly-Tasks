#include <stdio.h>

char *mystrstr(char *str1, char *str2);

int main()
{
    char str1[20];
    char str2[20];

    printf("Enter first string : \n");
    scanf("%[^'\n']s", str1);

    printf("Enter second string : \n");
    scanf(" %s", str2);

    printf("%s\n", mystrstr(str1, str2));
    
    return 0;
}

char *mystrstr(char *str1, char *str2)
{
    int counter1 = 0;
    int counter2 = 0;
    int counter3 = 0;

    while (str1[counter1] != '\0')
    {
        counter3 = counter1;

        while (str2[counter2] != '\0')
        {
            if (str1[counter3] != str2[counter2])
                break;
            counter2++;
            counter3++;
        }
        
        if (str2[counter2] == '\0')
            return &str1[counter1];
        counter1++;
        counter2 = 0;
    }
    return NULL;
}