.section .rodata
    msg_main_print_hello:
    .string "Hello\n"

    msg_main_print_printf_returned:
    .string "printf returned %d\n"

    msg_main_print_int:
    .string "%d\n"

    msg_main_print_int_char:
    .string "%d\t%c\n"

    msg_main_print_char_int:
    .string "%c\t%d\n"

    msg_main_print_char_int_float_double:
    .string "%c\t%d\t%f\t%lf\n"

    msg_main_print_answer_is:
    .string "Answer is %d\n"

    float_57_33:
    .float  57.33

    double_69_33:
    .double 69.33

.section .text
.globl  main 
.type   main, @function
main:
    andl    $-16, %esp
    pushl   %ebp
    movl    %esp, %ebp

    subl    $32, %esp

    movl    $msg_main_print_hello, (%esp)
    call    myprintf
    movl    %eax, -4(%ebp)

    movl    $msg_main_print_printf_returned, (%esp)
    movl    %eax, 4(%esp)
    call    myprintf

    movl    $msg_main_print_int, (%esp)
    movl    $10, 4(%esp)
    call    myprintf

    movl    $msg_main_print_int_char, (%esp)
    movl    $10, 4(%esp)
    movl    $'A', 8(%esp)
    call    myprintf

    movl    $msg_main_print_char_int, (%esp)
    movl    $'A', 4(%esp)
    movl    $10, 8(%esp)
    call    myprintf

    movl    $msg_main_print_char_int_float_double, (%esp)
    movl    $'A', 4(%esp)
    movl    $10, 8(%esp)
    flds    float_57_33
    fstpl   12(%esp)
    fldl    double_69_33
    fstpl   20(%esp)
    call    myprintf

    movl    $2, (%esp)
    movl    $10, 4(%esp)
    movl    $20, 8(%esp)
    call    Addition
    movl    %eax, -4(%ebp)

    movl    $msg_main_print_answer_is, (%esp)
    movl    %eax, 4(%esp)
    call    myprintf

    movl    $3, (%esp)
    movl    $10, 4(%esp)
    movl    $20, 8(%esp)
    movl    $30, 12(%esp)
    call    Addition
    movl    %eax, -4(%ebp)

    movl    $msg_main_print_answer_is, (%esp)
    movl    %eax, 4(%esp)
    call    myprintf

    movl    $4, (%esp)
    movl    $10, 4(%esp)
    movl    $20, 8(%esp)
    movl    $30, 12(%esp)
    movl    $40, 16(%esp)
    call    Addition
    movl    %eax, -4(%ebp)

    movl    $msg_main_print_answer_is, (%esp)
    movl    %eax, 4(%esp)
    call    myprintf

    movl    $0, (%esp)
    call    exit

.globl  myprintf
.type   myprintf, @function
myprintf:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    leal    12(%ebp), %ebx
    movl    %ebx, -8(%ebp)
    
    movl    8(%ebp), %eax
    movl    -8(%ebp), %edx
    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    call    vprintf
    movl    %eax, -4(%ebp)

    movl    $0, -8(%ebp)

    movl    %ebp, %esp
    popl    %ebp
    ret 

.globl  Addition
.type   Addition, @function
Addition:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $32, %esp

    leal    12(%ebp), %ebx
    movl    %ebx, -12(%ebp)

    movl    $0, -4(%ebp)

    movl    $0, -8(%ebp)
    jmp     label_for_condition
label_for_body:
    movl    12(%ebp, %eax, 4), %eax
    addl    %eax, -4(%ebp)

    addl    $1, -8(%ebp)

label_for_condition:
    movl    -8(%ebp), %eax
    movl    8(%ebp), %edx
    cmpl    %edx, %eax
    jl      label_for_body

    movl    $0, -12(%ebp)

    movl    -4(%ebp), %eax

    movl    %ebp, %esp
    popl    %ebp
    ret
