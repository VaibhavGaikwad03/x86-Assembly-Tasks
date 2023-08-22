.section .rodata
    msg_main_print_fNo1_fNo2:
    .string "fNo1 = %f\nfNo2 = %f\n"

    msg_main_print_fAns1:
    .string "fAns1 = %f\n"

    msg_main_print_fAns2:
    .string "fAns2 = %f\n"

    int_3:
    .int    3

.section .data
.globl  fNo1
.type   fNo1, @object
.size   fNo1, 4
.align  4
fNo1:
    .float  10.22

.globl  fNo2
.type   fNo2, @object
.size   fNo2, 4
.align  4
fNo2:
    .float  20.22

.section .bss
    .comm   fAns1, 4, 4
    .comm   fAns2, 4, 4

.section .text
.globl  main
.type   main, @function
main:
    andl    $-16, %esp
    pushl   %ebp
    movl    %esp, %ebp

    finit

    flds    fNo2
    flds    fNo1

    movl    $msg_main_print_fNo1_fNo2, (%esp)
    fstpl   4(%esp)
    fstpl   12(%esp)
    call    printf

    flds    fNo2
    flds    fNo1

    fmul    %st(1), %st(0)

    fstps   fAns1

    flds    fNo1

    fimuls  int_3

    fstps   fAns2

    flds    fAns1
    movl    $msg_main_print_fAns1, (%esp)
    fstpl   4(%esp)
    call    printf

    flds    fAns2
    movl    $msg_main_print_fAns2, (%esp)
    fstpl   4(%esp)
    call    printf

    movl    $0, (%esp)
    call    exit
