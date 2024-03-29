#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[], char *envp[])
{
    int iCounter;
    int iSum = 0;

    printf("argc is %d\n\n", argc);

    if (argc != 3)
    {
        puts("Invalid arguments:prog_name arg1 arg2");

        goto label;
        //exit(-1);
    }
    
    puts("Values are: ");
    for (iCounter = 0; iCounter < argc; iCounter++)
        puts(argv[iCounter]);
    printf("\n");

    iSum = atoi(argv[1]) + atoi(argv[2]);

label:
    puts("Envp values are: ");
    for (iCounter = 0; envp[iCounter] != NULL; iCounter++)
        puts(envp[iCounter]);

    printf("\nSum is %d\n", iSum);

    exit(0);
}