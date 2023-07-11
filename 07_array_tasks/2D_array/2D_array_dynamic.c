#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    int iRows;
    int iColumns;
    int iCounter1;
    int iCounter2;
    int **ppPtr = NULL;

    printf("Enter value of rows & columns:\t");
    scanf("%d%d", &iRows, &iColumns);

    // Error wala code kashit lihaycha ahe.
    ppPtr = (int **)malloc(iRows * sizeof(int *));
    if (ppPtr == NULL)
    {
        puts("Memory allocation FAILED");
        exit(-1);
    }

    for (iCounter1 = 0; iCounter1 < iRows; iCounter1++)
    {
        ppPtr[iCounter]
    }

    exit(0);
}