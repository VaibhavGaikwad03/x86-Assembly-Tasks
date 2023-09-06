#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    FILE *fpSource = NULL;
    FILE *fpDestination = NULL;
    char chChar;

    fpSource = fopen("file_copy_source.txt", "r");
    if (fpSource == NULL)
    {
        printf("\nCan't Open Source File\n");
        exit(-1);
    }

    fpDestination = fopen("file_copy_destination.txt", "w");

    if (fpDestination == NULL)
    {
        printf("\nCan't Open Destination File\n");
        fclose(fpSource);
        fpSource = NULL;
        exit(-1);
    }

    while (1)
    {
        chChar = fgetc(fpSource);
        if (chChar == EOF)
            break;
        fputc(chChar, fpDestination);
    }

    fclose(fpSource);
    fpSource = NULL;
    fclose(fpDestination);
    fpDestination = NULL;

    printf("\nCopied Successfully\n");

    exit(0);
}