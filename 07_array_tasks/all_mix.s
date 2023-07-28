.section .rodata
    msg_main_print1:
    .string "arr = %-10d \t *arr = %-10d \t &arr = %-10d\n"

    msg_main_print2:
    .string "p = %-10d \t *p = %-10d \t **p = %-10d\n"

    msg_main_print3:
    .string "ptr = %-10d \t *ptr = %-10d \t **ptr = %-10d\n"

    msg_main_print4:
    .string "ptr - p = %d \t *ptr - arr = %d \t **ptr = %d\n"

.section .text
.globl  main 
.type   main, @function
main:
    andl    $-16, %esp
    pushl   %ebp
    movl    %esp, %ebp

    subl    $64, %esp

    movl    $10, -20(%ebp)
    movl    $20, -16(%ebp)
    movl    $30, -12(%ebp)
    movl    $40, -8(%ebp)
    movl    $50, -4(%ebp)

    leal    -20(%ebp), %ebx
    movl    %ebx, -40(%ebp)
    movl    $1, %eax
    leal    -20(%ebp, %eax, 4), %ebx
    movl    %ebx, -36(%ebp)
    movl    $2, %eax
    leal    -20(%ebp, %eax, 4), %ebx
    movl    %ebx, -32(%ebp)
    movl    $3, %eax
    leal    -20(%ebp, %eax, 4), %ebx
    movl    %ebx, -28(%ebp)
    movl    $4, %eax
    leal    -20(%ebp, %eax, 4), %ebx
    movl    %ebx, -24(%ebp)

    leal    -40(%ebp), %ebx
    movl    %ebx, -44(%ebp)

    movl    $msg_main_print1, (%esp)
    leal    -20(%ebp), %ebx
    movl    %ebx, 4(%esp)
    movl    -20(%ebp), %eax
    movl    %eax, 8(%esp)
    # leal    -20(%ebp), %ebx
    movl    %ebx, 12(%esp)
    call    printf

    movl    $msg_main_print2, (%esp)
    leal    -40(%ebp), %ebx
    movl    %ebx, 4(%esp)
    movl    -40(%ebp), %eax
    movl    %eax, 8(%esp)
    # movl    -40(%ebp), %ebx
    movl    (%ebx), %ebx
    movl    (%ebx), %eax
    movl    %eax, 12(%esp)
    call    printf

    movl    $msg_main_print3, (%esp)
    movl    -44(%ebp), %ebx
    movl    %ebx, 4(%esp)
    movl    (%ebx), %ebx
    movl    %ebx, 8(%esp)
    movl    (%ebx), %eax
    movl    %eax, 12(%esp)
    call    printf

    movl    $4, %eax    # size of element
    movl    $1, %ecx
    mull    %ecx
    movl    -44(%ebp), %ebx
    addl    %eax, %ebx
    movl    %ebx, -44(%ebp)

    movl    $msg_main_print4, (%esp)
    movl    -44(%ebp), %eax
    leal    -40(%ebp), %edx
    subl    %edx, %eax
    movl    $4, %ecx
    xorl    %edx, %edx
    divl    %ecx
    movl    %eax, 4(%esp)

    movl    -44(%ebp), %eax
    movl    (%eax), %eax
    leal    -20(%ebp), %edx
    subl    %edx, %eax
    movl    $4, %ecx
    xorl    %edx, %edx
    divl    %ecx
    movl    %eax, 8(%esp)

    movl    -44(%ebp), %ebx
    movl    (%ebx), %ebx
    movl    (%ebx), %eax
    movl    %eax, 12(%esp)
    call    printf

    movl    $4, %eax    # size of element
    movl    $1, %ecx
    mull    %ecx
    movl    -44(%ebp), %ebx
    addl    %eax, %ebx
    movl    %ebx, -44(%ebp)

    movl    $msg_main_print4, (%esp)
    movl    -44(%ebp), %eax
    leal    -40(%ebp), %edx
    subl    %edx, %eax
    movl    $4, %ecx
    xorl    %edx, %edx
    divl    %ecx
    movl    %eax, 4(%esp)

    movl    -44(%ebp), %eax
    movl    (%eax), %eax
    leal    -20(%ebp), %edx
    subl    %edx, %eax
    movl    $4, %ecx
    xorl    %edx, %edx
    divl    %ecx
    movl    %eax, 8(%esp)

    movl    -44(%ebp), %ebx
    movl    (%ebx), %ebx
    movl    (%ebx), %eax
    movl    %eax, 12(%esp)
    call    printf

    movl    -44(%ebp), %ebx
    movl    (%ebx), %ebx
    movl    $4, %eax
    movl    $1, %ecx
    mull    %ecx
    addl    %ebx, %eax
    movl    -44(%ebp), %ebx
    movl    %eax, (%ebx)

    movl    $msg_main_print4, (%esp)
    movl    -44(%ebp), %eax
    leal    -40(%ebp), %edx
    subl    %edx, %eax
    movl    $4, %ecx
    xorl    %edx, %edx
    divl    %ecx
    movl    %eax, 4(%esp)

    movl    -44(%ebp), %eax
    movl    (%eax), %eax
    leal    -20(%ebp), %edx
    subl    %edx, %eax
    movl    $4, %ecx
    xorl    %edx, %edx
    divl    %ecx
    movl    %eax, 8(%esp)

    movl    -44(%ebp), %ebx
    movl    (%ebx), %ebx
    movl    (%ebx), %eax
    movl    %eax, 12(%esp)
    call    printf

    movl    $0, (%esp)
    call    exit
