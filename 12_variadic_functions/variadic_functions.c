#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

int myprintf(const char *, ...);
int Addition(int, ...);

int main(void)
{
    int iRet;

    iRet = myprintf("Hello\n");
    myprintf("printf returned %d\n", iRet);

    myprintf("%d\n", 10);
    myprintf("%d\t%c\n", 10, 'A');
    myprintf("%c\t%d\n", 'A', 10);
    myprintf("%c\t%d\t%f\t%lf\n", 'A', 10, 57.33f, 69.33);

    iRet = Addition(2, 10, 20);
    myprintf("Answer is %d\n", iRet);

    iRet = Addition(3, 10, 20, 30);
    myprintf("Answer is %d\n", iRet);

    iRet = Addition(4, 10, 20, 30, 40);
    myprintf("Answer is %d\n", iRet);

    exit(0);
}

int myprintf(const char *pszFormat, ...)
{
    int iRet;
    va_list pArgs;           // char *

    //'pArgs' will point to memory present after 'pszFormat'.

    va_start(pArgs, pszFormat);

    iRet = vprintf(pszFormat, pArgs);

    va_end(pArgs);                  // pArgs = NULL

    return iRet;
}

int Addition(int iNoOfParam, ...)
{
    int iAns;
    int iCounter;
    va_list pArgs;

    va_start(pArgs, iNoOfParam);

    // 'va_arg' returns value pointed by 'pArgs' w.r.t. 'int' and
    // does pointer arithmatic w.r.t. sizeof(int) for pointing
    // to next argument

    iAns = 0;

    for (iCounter = 0; iCounter < iNoOfParam; iCounter++)
        iAns = iAns + va_arg(pArgs, int);

    va_end(pArgs);

    return iAns;
}