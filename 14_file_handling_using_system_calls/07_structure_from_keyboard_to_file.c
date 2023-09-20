#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

int main(void)
{
    int fd;
    char chChar = 'Y';

    struct student
    {
        char szName[40];
        int iRollNo;
        float fPerc;
    };

    struct student s;
    char chTemp;

    fd = open("student_structure_from_keyboard_to_file.txt", O_WRONLY | O_CREAT | O_TRUNC);

    if (fd == -1)
    {
        write(1, "\nCan't open file\n", 18);
        exit(-1);
    }

    while (chChar == 'Y' || chChar == 'y')
    {
        write(1, "\n\nEnter name, roll no. and percentage:\n", 40);
        scanf("%s %d %f", s.szName, &s.iRollNo, &s.fPerc);
        write(fd, &s, sizeof(s));

        write(1, "\nAdd another record (Y/N): ", 28);
        scanf("%c%c", &chTemp, &chChar);
    }

    close(fd);

    exit(0);
}