.section .rodata
    msg_main_file_name:
    .string "file_to_screen.txt"

    msg_main_opening_mode:
    .string "r"

    msg_main_print_cant_open_file:
    .string "\nCan't open file\n"

    msg_main_print_string:
    .string "%s"

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

    jmp     label_while_condition
label_while_body:
    movl    $msg_main_print_string, (%esp)
    leal    -54(%ebp), %ebx
    movl    %ebx, 4(%esp)
    call    printf

label_while_condition:
    leal    -54(%ebp), %ebx
    movl    $49, %eax
    movl    -4(%ebp), %edx

    movl    %ebx, (%esp)
    movl    %eax, 4(%esp)
    movl    %edx, 8(%esp)
    call    fgets

    cmpl    $0, %eax
    jne     label_while_body

    movl    -4(%ebp), %ebx
    movl    %ebx, (%esp)
    call    fclose

    movl    $0, -4(%ebp)

    movl    $0, (%esp)
    call    exit
    