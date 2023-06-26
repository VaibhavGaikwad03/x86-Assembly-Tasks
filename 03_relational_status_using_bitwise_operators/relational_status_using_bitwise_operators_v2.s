.section .rodata
    msg_main_print_first_operand:
    .string "\nEnter first oprand : "

    msg_main_print_second_operand:
    .string "\nEnter second operand : "

    msg_main_scan:
    .string "%d"

    msg_main_print_less_than:
    .string "\n%d is less than %d\n"

    msg_main_print_not_less_than:
    .string "\n%d is not less than %d\n"

    msg_main_print_less_than_equal:
    .string "\n%d is less than or equal to %d\n"

    msg_main_print_not_less_than_equal:
    .string "\n%d is not less than or equal to %d\n"

    msg_main_print_equal_to:
    .string "\n%d is equal to %d\n"

    msg_main_print_not_equal_to:
    .string "\n%d is not equal to %d\n"

    msg_main_print_greater_than_equal:
    .string "\n%d is greater than or equal to %d\n"

    msg_main_print_not_greater_than_equal:
    .string "\n%d is not greater than or equal to %d\n"

    msg_main_print_greater_than:
    .string "\n%d is greater than %d\n"

    msg_main_print_not_greater_than:
    .string "\n%d is not greater than %d\n"

.section .text
.globl  main 
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $9, %esp

    pushl   $msg_main_print_first_operand
    call    printf
    addl    $4, %esp

    leal    -4(%ebp), %ebx
    pushl   %ebx
    pushl   $msg_main_scan
    call    scanf
    addl    $8, %esp

    pushl   $msg_main_print_second_operand
    call    printf
    addl    $4, %esp

    leal    -8(%ebp), %ebx
    pushl   %ebx
    pushl   $msg_main_scan
    call    scanf
    addl    $8, %esp

    movl    -4(%ebp), %eax
    movl    -8(%ebp), %edx
    leal    -9(%ebp), %ecx

    pushl   %ecx
    pushl   %edx
    pushl   %eax
    call    compare
    addl    $12, %esp    

# if 1
    movb    -9(%ebp), %al
    andb    $1, %al
    cmpb    $0, %al 
    movl    -4(%ebp), %eax
    movl    -8(%ebp), %edx
    je     label_not_less_than
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_less_than
    call    printf
    addl    $12, %esp
    jmp     label_if_2

label_not_less_than:
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_not_less_than
    call    printf
    addl    $12, %esp

label_if_2:
    movb    -9(%ebp), %al
    andb    $2, %al
    cmpb    $0, %al
    movl    -4(%ebp), %eax
    movl    -8(%ebp), %edx
    je     label_not_less_than_or_equal
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_less_than_equal
    call    printf
    addl    $12, %esp
    jmp     label_if_3

label_not_less_than_or_equal:
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_not_less_than_equal
    call    printf
    addl    $12, %esp

label_if_3:
    movb    -9(%ebp), %al
    andb    $4, %al
    cmpb    $0, %al
    movl    -4(%ebp), %eax
    movl    -8(%ebp), %edx
    je     label_not_equal
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_equal_to
    call    printf
    addl    $12, %esp
    jmp     label_if_4

label_not_equal:
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_not_equal_to
    call    printf
    addl    $12, %esp

label_if_4:
    movb    -9(%ebp), %al
    andb    $8, %al
    cmpb    $0, %al
    movl    -4(%ebp), %eax
    movl    -8(%ebp), %edx
    je     label_not_greater_than_or_equal
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_greater_than_equal
    call    printf
    addl    $12, %esp
    jmp     label_if_5

label_not_greater_than_or_equal:
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_not_greater_than_equal
    call    printf
    addl    $12, %esp

label_if_5:
    movb    -9(%ebp), %al
    andb    $16, %al
    cmpb    $0, %al
    movl    -4(%ebp), %eax
    movl    -8(%ebp), %edx
    je     label_not_greater_than
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_greater_than
    call    printf
    addl    $12, %esp
    jmp     label_exit

label_not_greater_than:
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_not_greater_than
    call    printf
    addl    $12, %esp

label_exit:
    pushl   $0
    call    exit

.globl  compare
.type   compare, @function
compare:
    pushl   %ebp
    movl    %esp, %ebp

    movl    8(%ebp), %eax
    movl    12(%ebp), %edx
    movl    16(%ebp), %ecx

    movb    $0, (%ecx)

    cmpl    %edx, %eax
    jge     label_else_if
    orb     $3, (%ecx)
    jmp     label_if_out

label_else_if:
    cmpl    %edx, %eax
    je      label_else
    orb     $24, (%ecx)
    jmp label_if_out

label_else:
    orb     $14, (%ecx)

label_if_out:
    movl    %ebp, %esp
    popl    %ebp
    ret 

