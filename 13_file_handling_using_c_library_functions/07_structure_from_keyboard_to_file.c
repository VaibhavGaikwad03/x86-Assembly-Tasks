#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    FILE *fp = NULL;
    char chChar = 'Y';

    struct student 
    {
        char szName[40];
        int iRollNo;
        float fPerc;
    };

    struct student s;
    char chTemp;

    fp = fopen("student_structure_from_keyboard_to_file.txt", "w");

    if (fp == NULL)
    {
        printf("\nCan't open file\n");
        exit(-1);
    }

    while (chChar == 'Y' || chChar == 'y')
    {
        printf("\n\nEnter name, roll no. and percentage:\n");
        scanf("%s %d %f", s.szName, &s.iRollNo, &s.fPerc);
        fprintf(fp, "%s %d %f\n", s.szName, s.iRollNo, s.fPerc);

        printf("\nAdd another record (Y/N): ");
        scanf("%c%c", &chTemp, &chChar);
    }

    fclose(fp);
    fp = NULL;

    exit(0);
}