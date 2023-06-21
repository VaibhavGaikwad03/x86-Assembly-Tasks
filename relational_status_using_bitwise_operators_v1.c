#include <stdio.h>
#define LESS_THAN 1
#define LESS_THAN_OR_EQUAL 2
#define EQUAL_TO 4
#define GREATER_THAN_OR_EQUAL 8
#define GREATER_THAN 16

char compare(int iNo1, int iNo2)
{
    char chStatus = chStatus ^ chStatus;

    if (iNo1 < iNo2)
        chStatus |= (LESS_THAN | LESS_THAN_OR_EQUAL);
    else if (iNo1 > iNo2)
        chStatus |= (GREATER_THAN | GREATER_THAN_OR_EQUAL);
    else
        chStatus |= (EQUAL_TO | GREATER_THAN_OR_EQUAL | LESS_THAN_OR_EQUAL);

    return chStatus;
}

int main(void)
{
    int iNo1;
    int iNo2;
    char chResult;

    printf("\nEnter first operand : ");
    scanf("%d", &iNo1);

    printf("\nEnter second operand : ");
    scanf("%d", &iNo2);

    chResult = compare(iNo1, iNo2);

    if (chResult & LESS_THAN)
        printf("\n%d is less than %d\n", iNo1, iNo2);
    else
        printf("\n%d is not less than %d\n", iNo1, iNo2);

    if (chResult & LESS_THAN_OR_EQUAL)
        printf("\n%d is less than or equal to %d\n", iNo1, iNo2);
    else
        printf("\n%d is not less than or equal to %d\n", iNo1, iNo2);

    if (chResult & EQUAL_TO)
        printf("\n%d is equal to %d\n", iNo1, iNo2);
    else
        printf("\n%d is not equal to %d\n", iNo1, iNo2);

    if (chResult & GREATER_THAN_OR_EQUAL)
        printf("\n%d is greater than or equal to %d\n", iNo1, iNo2);
    else
        printf("\n%d is not greater than or equal to %d\n", iNo1, iNo2);

    if (chResult & GREATER_THAN)
        printf("\n%d is greater than %d\n", iNo1, iNo2);
    else
        printf("\n%d is not greater than %d\n", iNo1, iNo2);

    return 0;
}