.section .rodata
    msg_main_print_obj1_is:
    .string "obj1 is\n"

    msg_main_print_obj2_is:
    .string "obj2 is\n"

    msg_main_print_obj3_is:
    .string "obj3 is\n"

    msg_main_print_values:
    .string "chChar = %c, iNo = %d, shiNo = %hd\n\n"

    msg_main_compare_obj1_obj2:
    .string "obj1 & obj2 comparison is "

    msg_main_compare_obj2_obj3:
    .string "obj2 & obj3 comparison is "

    msg_main_print_equal:
    .string "equal\n"

    msg_main_print_not_equal:
    .string "not equal\n"

.section .data
.globl  obj1
.type   obj1, @object
.size   obj1, 12
.align  4
obj1:
    .ascii  "A"
    .zero   3
    .int    10
    .value  20

.section .text
.globl  main 
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $24, %esp

    leal    -12(%ebp), %ebx
    movl    $'B', (%ebx)
    movl    $30, 4(%ebx)
    movl    $40, 8(%ebx)

    leal    -24(%ebp), %ebx
    movl    $'B', (%ebx)
    movl    $30, 4(%ebx)
    movl    $40, 8(%ebx)

    pushl   $msg_main_print_obj1_is
    call    printf
    addl    $4, %esp

    movl    $obj1, %ebx
    movl    (%ebx), %eax
    movl    4(%ebx), %edx
    movl    8(%ebx), %ecx

    pushl   %ecx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_values
    call    printf
    addl    $16, %esp

    pushl   $msg_main_print_obj2_is
    call    printf
    addl    $4, %esp

    leal    -12(%ebp), %ebx
    movl    (%ebx), %eax
    movl    4(%ebx), %edx
    movl    8(%ebx), %ecx

    pushl   %ecx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_values
    call    printf
    addl    $16, %esp

    pushl   $msg_main_print_obj3_is
    call    printf
    addl    $4, %esp

    leal    -24(%ebp), %ebx
    movl    (%ebx), %eax
    movl    4(%ebx), %edx
    movl    8(%ebx), %ecx

    pushl   %ecx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_values
    call    printf
    addl    $16, %esp

    pushl   $msg_main_compare_obj1_obj2
    call    printf
    addl    $4, %esp

# first if else starts
    movl    $obj1, %ebx
    movl    (%ebx), %eax
    leal    -12(%ebp), %ebx
    movl    (%ebx), %edx
    cmpl    %edx, %eax
    jne     label_first_else

    movl    $obj1, %ebx
    movl    4(%ebx), %eax
    leal    -12(%ebp), %ebx
    movl    4(%ebx), %edx
    cmpl    %edx, %eax
    jne     label_first_else

    movl    $obj1, %ebx
    movl    8(%ebx), %eax
    leal    -12(%ebp), %ebx
    movl    8(%ebx), %edx
    cmpl    %edx, %eax
    jne     label_first_else

    pushl   $msg_main_print_equal
    call    printf
    addl    $4, %esp
    jmp     label_first_if_else_out

label_first_else:
    pushl   $msg_main_print_not_equal
    call    printf
    addl    $4, %esp

# first if else ends
label_first_if_else_out:
    pushl   $msg_main_compare_obj2_obj3
    call    printf
    addl    $4, %esp

# second if else starts
    leal    -24(%ebp), %ebx
    movl    (%ebx), %eax
    leal    -12(%ebp), %ebx
    movl    (%ebx), %edx
    cmpl    %edx, %eax
    jne     label_second_else

    leal    -24(%ebp), %ebx
    movl    4(%ebx), %eax
    leal    -12(%ebp), %ebx
    movl    4(%ebx), %edx
    cmpl    %edx, %eax
    jne     label_second_else

    leal    -24(%ebp), %ebx
    movl    8(%ebx), %eax
    leal    -12(%ebp), %ebx
    movl    8(%ebx), %edx
    cmpl    %edx, %eax
    jne     label_second_else

    pushl   $msg_main_print_equal
    call    printf
    addl    $4, %esp
    jmp     label_second_if_else_out

label_second_else:
    pushl   $msg_main_print_not_equal
    call    printf
    addl    $4, %esp

# second if else ends

label_second_if_else_out:
    pushl   $0
    call    exit

