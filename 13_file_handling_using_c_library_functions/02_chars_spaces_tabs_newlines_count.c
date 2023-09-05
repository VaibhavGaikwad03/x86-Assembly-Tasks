#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    FILE *fp = NULL;
    int iNoOfChars = 0;
    int iNoOfSpaces = 0;
    int iNoOfTabs = 0;
    int iNoOfLines = 0;
    char chChar;

    fp = fopen("chars_spaces_tabs_newlines_count.txt", "r");

    if (NULL == fp)
    {
        printf("Can't open the file\n");
        exit(-1);
    }

    while (1)
    {
        chChar = fgetc(fp);
        
        if (chChar == EOF)
            break;

        iNoOfChars++;

        if (chChar == ' ')
            iNoOfSpaces++;

        else if (chChar == '\t')
            iNoOfTabs++;
        else if(chChar == '\n')
            iNoOfLines++;
    }

    fclose(fp);
    fp = NULL;

    printf("\nNo of characters are %d\n", iNoOfChars);
    printf("No of spaces are %d\n", iNoOfSpaces);
    printf("No of tabs are %d\n", iNoOfTabs);
    printf("No of lines are %d\n", iNoOfLines);

    exit(0);
}