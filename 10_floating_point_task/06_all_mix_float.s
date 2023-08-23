.section .rodata
    msg_main_print:
    .string "Calculation is : %f\n"

    float_43_65:
    .float  43.65

    int_22:
    .int    22

    float_76_34:
    .float  76.34

    float_3_1:
    .float  3.1

    float_12_43:
    .float  12.43

    int_6:
    .int    6

    float_140_2:
    .float  140.2

    float_94_21:
    .float  94.21

.section .text
.globl  main 
.type   main, @function
main:
    andl    $-16, %esp
    pushl   %ebp
    movl    %esp, %ebp

    subl    $32 , %esp

    flds    float_43_65

    fidivs  int_22

    flds    float_76_34
    flds    float_3_1

    fmulp   %st(0), %st(1)

    faddp   %st(0), %st(1)

    flds    float_12_43
    
    fimuls  int_6

    flds    float_94_21
    flds    float_140_2

    fdivp   %st(0), %st(1)

    fsubrp

    fdivrp  

    movl    $msg_main_print, (%esp)
    fstpl   4(%esp)
    call    printf

    movl    $0, (%esp)
    call    exit
