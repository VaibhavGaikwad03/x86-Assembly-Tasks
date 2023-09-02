.section .rodata
    msg_main_print_invalid_arguments:
    .string "Invalid arguments:prog_name"

    msg_main_print_envp_values_are:
    .string "Envp values are: "

.section .text
.globl  main 
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    movl    4(%ebp), %eax

    cmpl    $1, %eax
    je      label_if_out

    movl    $msg_main_print_invalid_arguments, (%esp)
    call    puts

    movl    $-1, (%esp)
    call    exit

label_if_out:
    movl    $msg_main_print_envp_values_are, (%esp)
    call    puts

    movl    $0, -4(%ebp)
    jmp     label_for_condition

label_for_body:
    movl    %ebx, (%esp)
    call    puts

    addl    $1, -4(%ebp)

label_for_condition:
    movl    -4(%ebp), %eax
    movl    16(%ebp, %eax, 4), %ebx

    cmpl    $0, %ebx
    jne     label_for_body 

    movl    $0, (%esp)
    call    exit
