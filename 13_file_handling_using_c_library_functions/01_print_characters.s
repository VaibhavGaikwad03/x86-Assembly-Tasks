.section .rodata
    msg_main_print_cant_open_file:
    .string "\nCan't Open File\n"

    msg_main_print_character:
    .string "%c"

    msg_main_file_name:
    .string "print_characters.txt"

    msg_main_opening_mode:
    .string "r"

.section .text
.globl  main
.type   main, @function
main:
    andl    $-16, %esp
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

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
label_while_body:
    movl    -4(%ebp), %ebx
    movl    %ebx, (%esp)
    call    fgetc
    movb    %al, -5(%ebp)

    cmpb    $-1, %al
    jne     label_else
    jmp     label_break_while_loop
label_else:
    movl    $msg_main_print_character, (%esp)
    movb    -5(%ebp), %al
    movb    %al, 4(%esp)
    call    printf

    jmp     label_while_body

label_break_while_loop: 
    movl    -4(%ebp), %ebx
    movl    %ebx, (%esp)
    call    fclose
    movl    $0, -4(%ebp) 

    movl    $0, (%esp)
    call    exit
    