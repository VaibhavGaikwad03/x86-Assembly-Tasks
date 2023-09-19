#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
    int fdSource;
    int iReadBytes;
    int fdDestination;
    char buffer[1024];

    fdSource = open(argv[1], O_RDONLY);

    if (fdSource == -1)
    {
        write(1, "\nCan't Open Source File\n", 25);
        exit(-1);
    }

    fdDestination = open(argv[2], O_WRONLY | O_CREAT | O_TRUNC);

    if (fdDestination == -1)
    {
        write(1, "\nCan't Open Destination File\n", 30);
        close(fdSource);
        exit(-1);
    }

    while (iReadBytes = read(fdSource, buffer, sizeof(buffer)))
        write(fdDestination, buffer, iReadBytes);

    close(fdSource);
    close(fdDestination);

    write(1, "\nCopied Successfully\n", 22);

    exit(0);
}