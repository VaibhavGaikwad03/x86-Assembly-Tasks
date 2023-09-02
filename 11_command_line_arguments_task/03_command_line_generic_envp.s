.section .rodata
    msg_main_print_argc_is:
    .string "argc is %d\n\n"

    msg_main_print_invalid_arguments:
    .string "Invalid arguments:prog_name arg1 arg2"

    msg_main_print_values_are:
    .string "Values are: "

    msg_main_print_envp_values_are:
    .string "Envp values are: "

    msg_main_print_sum_is:
    .string "\nSum is %d\n"

    msg_main_print_new_line:
    .string "\n"

.section .text
.globl  main
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    movl    $0, -8(%ebp) 

    movl    $msg_main_print_argc_is, (%esp)
    movl    4(%ebp), %eax
    movl    %eax, 4(%esp)
    call    printf

    movl    4(%ebp), %eax
    cmpl    $3, %eax
    je      label_if_out

    movl    $msg_main_print_invalid_arguments, (%esp)
    call    puts 

    jmp     label_goto
label_if_out:
    movl    $msg_main_print_values_are, (%esp)
    call    puts

    movl    $0, -4(%ebp)
    jmp     label_for_1_condition

label_for_1_body:
    movl    8(%ebp, %eax, 4), %ebx
    movl    %ebx, (%esp)
    call    puts

    addl    $1, -4(%ebp)

label_for_1_condition:
    movl    -4(%ebp), %eax
    movl    4(%ebp), %edx

    cmpl    %edx, %eax
    jl      label_for_1_body

    movl    $msg_main_print_new_line, (%esp)
    call    printf

    movl    12(%ebp), %eax
    movl    %eax, (%esp)
    call    atoi
    movl    %eax, -8(%ebp)

    movl    16(%ebp), %eax
    movl    %eax, (%esp)
    call    atoi
    addl    %eax, -8(%ebp)

label_goto:
    movl    $msg_main_print_envp_values_are, (%esp)
    call    puts

    movl    $0, -4(%ebp)
    jmp     label_for_2_condition

label_for_2_body:
    movl    %ebx, (%esp)
    call    puts

    addl    $1, -4(%ebp)

label_for_2_condition:
    movl    4(%ebp), %eax
    leal    12(%ebp, %eax, 4), %ebx

    movl    -4(%ebp), %eax
    movl    (%ebx, %eax, 4), %ebx

    cmpl    $0, %ebx
    jne     label_for_2_body

    movl    $msg_main_print_sum_is, (%esp)
    movl    -8(%ebp), %eax
    movl    %eax, 4(%esp)
    call    printf

    movl    $0, (%esp)
    call    exit
