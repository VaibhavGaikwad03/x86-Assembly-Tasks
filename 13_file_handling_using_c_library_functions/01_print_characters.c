#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    FILE *fp = NULL;
    char chChar;

    fp = fopen("print_characters.txt", "r");

    if (NULL == fp)
    {
        printf("\nCan't Open File\n");
        exit(-1);
    }

    while (1)
    {
        if ((chChar = fgetc(fp)) == EOF)
            break;
        else    
            printf("%c", chChar);
    }

    fclose(fp);
    fp = NULL;

    exit(0);
}