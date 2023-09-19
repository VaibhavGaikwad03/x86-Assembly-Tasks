#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

int main(void)
{
    int fd;
    int iReadBytes;
    char buffer[1024];

    fd = open("keyboard_to_file.txt", O_WRONLY | O_CREAT | O_TRUNC);

    if (fd == -1)
    {
        write(1, "\nCan't open file\n", 18);
        exit(-1);
    }

    write(1, "\nEnter strings:\n", 17);
    
    while (iReadBytes = read(0, buffer, sizeof(buffer)))
        write(fd, buffer, iReadBytes);

    close(fd);

    exit(0);
}