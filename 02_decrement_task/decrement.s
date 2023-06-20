.section .rodata
    msg_main_print:
    .string     "iNo1 is %d\niNo2 is %d\niAns1 is %d\niAns2 is %d\n"

.section .text
.globl  main
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    movl    $10, -4(%ebp)
    movl    $20, -8(%ebp)

    movl    -4(%ebp), %eax      #iNo1
    movl    %eax, -12(%ebp)     #iAns1
    subl    $1, -4(%ebp)        

    subl    $1, -8(%ebp)        
    movl    -8(%ebp), %edx      #iNo2
    movl    %edx, -16(%ebp)     #iAns2

    movl    -4(%ebp), %ecx

    pushl   %edx
    pushl   %eax
    pushl   %edx
    pushl   %ecx
    pushl   $msg_main_print
    call    printf
    addl    $20, %esp

    pushl   $0
    call    exit
