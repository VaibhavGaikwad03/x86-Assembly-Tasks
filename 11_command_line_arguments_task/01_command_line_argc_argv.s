.section .rodata
    msg_main_print_argc_is:
    .string "argc is: %d\n"

    msg_main_print_invaild_arguments:
    .string "Invalid arguments:prog_name arg1 arg2"

    msg_main_print_values_are:
    .string "Values are: "

    msg_main_print_sum_is:
    .string "Sum is: %d\n"

    msg_main_print_new_line:
    .string "\n"

    msg_test:
    .string "Hello\n"

.section .text
.globl  main 
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    movl    $msg_main_print_argc_is, (%esp)
    movl    4(%ebp), %eax
    movl    %eax, 4(%esp)
    call    printf

    movl    4(%ebp), %eax
    cmpl    $3, %eax
    je      label_if_out
    movl    $msg_main_print_invaild_arguments, (%esp)
    call    puts 
    
    movl    $-1, (%esp)
    call    exit

label_if_out:
    movl    $msg_main_print_values_are, (%esp)
    call    puts

    movl    $0, -4(%ebp)
    jmp     label_for_condition
label_for_body:
    movl    8(%ebp, %eax, 4), %ebx
    movl    %ebx, (%esp)
    call    puts

    addl    $1, -4(%ebp)

label_for_condition:
    movl    -4(%ebp), %eax
    movl    4(%ebp), %edx

    cmpl    %edx, %eax
    jl      label_for_body

    movl    $msg_main_print_new_line, (%esp)
    call    printf

    movl    $1, %eax
    movl    12(%ebp), %eax
    movl    %eax, (%esp)
    call    atoi
    movl    %eax, -8(%ebp)

    movl    $2, %eax
    movl    16(%ebp), %eax
    movl    %eax, (%esp)
    call    atoi
    
    movl    -8(%ebp), %edx
    addl    %edx, %eax
    movl    %eax, -8(%ebp)

    movl    $msg_main_print_sum_is, (%esp)
    movl    %eax, 4(%esp)
    call    printf

    movl    $0, (%esp)
    call    exit
