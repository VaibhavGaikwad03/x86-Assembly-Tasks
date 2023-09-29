#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

int main(void)
{
    int fd;
    char c;
    int iBytesRead;
    int iCounter;
    char buffer[4096];
    int iNoOfChars = 0;
    int iNoOfSpaces = 0;
    int iNoOfTabs = 0;
    int iNoOfLines = 0;

    fd = open("chars_spaces_tabs_newlines_count.txt", O_RDONLY);

    if (fd == -1)
    {
        write(1, "Can't open the file\n", 21);
        exit(-1);
    }

    while (iBytesRead = read(fd, buffer, sizeof(buffer)))
    {
        for (iCounter = 0; iCounter < iBytesRead; iCounter++)
        {
            iNoOfChars++;
            c = buffer[iCounter];

            if (c == ' ')
                iNoOfSpaces++;

            else if (c == '\t')
                iNoOfTabs++;

            else if (c == '\n')
                iNoOfLines++;
        }
    }

    close(fd);

    printf("\nNo of characters are %d\n", iNoOfChars);
    printf("No of spaces are %d\n", iNoOfSpaces);
    printf("No of tabs are %d\n", iNoOfTabs);
    printf("No of lines are %d\n", iNoOfLines);

    exit(0);
}