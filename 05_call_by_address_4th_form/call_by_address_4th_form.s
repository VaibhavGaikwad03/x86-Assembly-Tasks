.section .rodata
    msg_main_print_enter_numbers:
    .string "Enter two numbers:\t"

    msg_main_scan:
    .string "%d%d"

    msg_main_print_sum:
    .string "Sum is %d\n"

    msg_main_print_diff:
    .string "Difference is %d\n"

.section .text
.globl  main
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    pushl   $msg_main_print_enter_numbers
    call    puts
    addl    $4, %esp

    leal    -4(%ebp), %eax
    leal    -8(%ebp), %edx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_scan
    call    scanf
    addl    $12, %esp

    movl    -4(%ebp), %eax      # iNo1
    movl    -8(%ebp), %edx      # iNo2
    leal    -12(%ebp), %ecx     # &iSum
    leal    -16(%ebp), %ebx     # &iDiff

    pushl   %ebx
    pushl   %ecx
    pushl   %edx
    pushl   %eax
    call    SumDiff
    addl    $16, %esp 

    movl    -12(%ebp), %eax
    pushl   %eax
    pushl   $msg_main_print_sum
    call    printf
    addl    $8, %esp

    movl    -16(%ebp), %eax
    pushl   %eax
    pushl   $msg_main_print_diff
    call    printf
    addl    $8, %esp

    pushl   $0
    call    exit

.globl  SumDiff
.type   SumDiff, @function
SumDiff:
    pushl   %ebp
    movl    %esp, %ebp

    movl    8(%ebp), %eax
    movl    12(%ebp), %edx
    movl    16(%ebp), %ecx
    movl    20(%ebp), %ebx

    addl    %edx, %eax      # iNo1 + iNo2
    movl    %eax, (%ecx)    # *piSum = iNo1 + iNo2  

    movl    8(%ebp), %eax
    movl    12(%ebp), %edx

    subl    %edx, %eax      # iNo1 - iNo2
    movl    %eax, (%ebx)    # *piDiff = iNo1 - iNo2 

    movl    %ebp, %esp
    popl    %ebp
    ret


