#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
 
int main(void)
{
    int fd;
    int iReadBytes;

    struct student
    {
        char szName[40];
        int iRollNo;
        float fPerc;
    };

    struct student s;

    fd = open("student_structure_from_keyboard_to_file.txt", O_RDONLY);

    if (fd == -1)
    {
        write(1, "\nCan't open file\n", 18);
        exit(-1);
    }

    while(iReadBytes = read(fd, &s, sizeof(s)))
        printf("%s %d %f\n", s.szName, s.iRollNo, s.fPerc);
    
    close(fd);

    exit(0);
}
