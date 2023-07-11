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
        ppPtr[iCounter1] = (int *)malloc(iColumns * sizeof(int));
        if (ppPtr[iCounter1] == NULL)
        {
            puts("Memory allocation FAILED");
            exit(-1);
        }

        for (iCounter2 = 0; iCounter2 < iColumns; iCounter2++)
        {
            printf("Enter [%d][%d] value:\t", iCounter1, iCounter2);
            scanf("%d", &ppPtr[iCounter1][iCounter2]);
        }
    }

    printf("Entered elements are:\n");

    for (iCounter1 = 0; iCounter1 < iRows; iCounter1++)
    {
        for (iCounter2 = 0; iCounter2 < iColumns; iCounter2++)
            printf("[%d][%d] value is:\t%d\n", iCounter1, iCounter2, ppPtr[iCounter1][iCounter2]);
    }

    for (iCounter1 = 0; iCounter1 < iRows; iCounter1++)
    {
        free(ppPtr[iCounter1]);
        ppPtr[iCounter1] = NULL;
    }

    free(ppPtr);
    ppPtr = NULL;

    exit(0);
}
