.section .rodata
    msg_main_file_name:
    .string "keyboard_to_file.txt"

    msg_main_print_error:
    .string "\nCan't open file\n"

    msg_main_print_enter_strings:
    .string "\nEnter strings:\n"

.section .text
.globl  main 
.type   main, @function
main:
    andl    $-16, %esp
    pushl   %ebp
    movl    %esp, %ebp

    subl    $1056, %esp

    movl    $msg_main_file_name, (%esp)
    movl    $01101, 4(%esp)
    movl    $0666, 8(%esp)
    call    open
    movl    %eax, -4(%ebp)

    cmpl    $-1, %eax
    jne     label_if_out

    movl    $1, (%esp)
    movl    $msg_main_print_error, 4(%esp)
    movl    $18, 8(%esp)
    call    write

    movl    $-1, (%esp)
    call    exit

label_if_out:

    movl    $1, (%esp)
    movl    $msg_main_print_enter_strings, 4(%esp)
    movl    $17, 8(%esp)
    call    write

    jmp     label_while_condition
label_while_body:
    movl    -4(%ebp), %eax
    movl    %eax, (%esp)
    leal    -1032(%ebp), %ebx
    movl    %ebx, 4(%esp)
    movl    -8(%ebp), %eax
    movl    %eax, 8(%esp)
    call    write

label_while_condition:
    movl    $0, (%esp)
    leal    -1032(%ebp), %ebx
    movl    %ebx, 4(%esp)
    movl    $1024, 8(%esp)
    call    read
    movl    %eax, -8(%ebp)

    cmpl    $0, %eax
    jne     label_while_body

    movl    -4(%ebp), %eax
    movl    %eax, (%esp)
    call    close

    movl    $0, (%esp)
    call    exit

