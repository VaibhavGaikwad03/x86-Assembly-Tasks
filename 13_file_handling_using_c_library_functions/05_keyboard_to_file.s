.section .rodata
    msg_main_file_name:
    .string "keyboard_to_file.txt"

    msg_main_opening_mode:
    .string "w"

    msg_main_print_cant_open_file:
    .string "\nCan't open file\n"

    msg_main_print_enter_strings:
    .string "\nEnter strings:\n"

    msg_main_print_new_line:
    .string "\n"

.section .text
.globl  main 
.type   main, @function
main:
    andl    $-16, %esp
    pushl   %ebp
    movl    %esp, %ebp

    subl    $64, %esp

    movl    $0, -4(%ebp)

    movl    $msg_main_file_name, (%esp)
    movl    $msg_main_opening_mode, 4(%esp)
    call    fopen
    movl    %eax, -4(%ebp)

    cmpl    $0, %eax
    jne     label_if_out
    movl    $msg_main_print_cant_open_file, (%esp)
    call    printf 
    movl    $-1, (%esp)
    call    exit

label_if_out:

    movl    $msg_main_print_enter_strings, (%esp)
    call    printf

    jmp     label_while_condition

label_while_body:
    leal    -54(%ebp), %eax
    movl    -4(%ebp), %edx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    call    fputs

    movl    $msg_main_print_new_line, (%esp)
    movl    -4(%ebp), %ebx
    movl    %ebx, 4(%esp)
    call    fputs


label_while_condition:
    leal    -54(%ebp), %ebx
    movl    %ebx, (%esp)
    call    gets
    movl    %eax, (%esp)
    call    strlen

    cmpl    $0, %eax
    jg      label_while_body

    movl    -4(%ebp), %ebx
    movl    %ebx, (%esp)
    call    fclose

    movl    $0, -4(%ebp)

    movl    $0, (%esp)
    call    exit
    