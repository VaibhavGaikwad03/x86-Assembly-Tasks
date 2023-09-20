#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

int main(void)
{
    int fd;
    int iReadBytes;
    char buffer[1024];
    
    fd = open("file_to_screen.txt", O_RDONLY);

    if (fd == -1)
    {
        write(1, "\nCan't open file\n", 18);
        exit(-1);
    }

    while (iReadBytes = read(fd, buffer, sizeof(buffer)))
        write(1, buffer, iReadBytes);

    close(fd);

    exit(0);
}