#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(void)
{
    FILE *fp = NULL;
    char szText[50];

    fp = fopen("keyboard_to_file.txt", "w");

    if (fp == NULL)
    {
        printf("\nCan't open file\n");
        exit(-1);
    }

    printf("\nEnter strings:\n");
    while (strlen(gets(szText)) > 0)
    {
        fputs(szText, fp);
        fputs("\n", fp);
    }

    fclose(fp);
    fp = NULL;

    exit(0);
}