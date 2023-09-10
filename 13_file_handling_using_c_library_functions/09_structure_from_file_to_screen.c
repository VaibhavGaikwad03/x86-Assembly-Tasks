#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    FILE *fp = NULL;

    struct student
    {
        char szName[40];
        int iRollNo;
        float fPerc;
    };

    struct student s;

    fp = fopen("student_structure_from_keyboard_to_file.txt", "r");

    if (fp == NULL)
    {
        printf("\nCan't open file\n");
        exit(-1);
    }

    // while (fscanf(fp,"%s %d %f", s.szName, &s.iRollNo, &s.fPerc) != EOF)  
    while (fread(&s, sizeof(s), 1, fp) == 1)
        printf("%s %d %f\n", s.szName, s.iRollNo, s.fPerc);

    fclose(fp);
    fp = NULL;

    exit(0);
}