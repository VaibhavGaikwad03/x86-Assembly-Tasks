#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    FILE *fpSource = NULL;
    FILE *fpDestination = NULL;
    char chChar;

    fpSource = fopen(argv[1], "r");
    if (fpSource == NULL)
    {
        printf("\nCan't Open Source File\n");
        exit (-1);
    }

    fpDestination = fopen(argv[2], "w");
    if (fpDestination == NULL)
    {
        printf("\nCan't Open Destination File\n");
        fclose(fpSource);
        fpSource = NULL;

        exit (-1);
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