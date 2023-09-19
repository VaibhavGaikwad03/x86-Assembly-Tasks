#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

int main(void)
{
    int fd;
    int iReadBytes;
    char buffer[1024];
    
    fd = open("print_characters.txt", O_RDONLY);

    if (fd == -1)
    {
        write(1, "\nCan't Open File\n", 18);
        exit(-1);
    }

    while (iReadBytes = read(fd, buffer, sizeof(buffer)))
        write(1, buffer, iReadBytes);

    close(fd);

    exit(0);
}