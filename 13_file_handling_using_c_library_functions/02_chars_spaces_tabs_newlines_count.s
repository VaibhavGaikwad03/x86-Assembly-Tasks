.section .rodata
    msg_main_file_name:
    .string "chars_spaces_tabs_newlines_count.txt"

    msg_main_opening_mode:
    .string "r"

    msg_main_print_cant_open_file:
    .string "Can't open the file\n"

    msg_main_print_no_of_characters:
    .string "\nNo of characters are %d\n"

    msg_main_print_no_of_spaces:
    .string "No of spaces are %d\n"

    msg_main_print_no_of_tabs:
    .string "No of tabs are %d\n"

    msg_main_print_no_of_line:
    .string "No of lines are %d\n"

.section .text
.globl  main 
.type   main, @function
main:
    andl    $-16, %esp
    pushl   %ebp
    movl    %esp, %ebp

    subl    $32, %esp
    movl    $0, -4(%ebp)
    movl    $0, -8(%ebp)
    movl    $0, -12(%ebp)
    movl    $0, -16(%ebp)
    movl    $0, -20(%ebp)

    movl    $msg_main_file_name, (%esp)
    movl    $msg_main_opening_mode, 4(%esp)
    call    fopen
    movl    %eax, -4(%ebp)

    cmpl    $0, %eax
    jne     label_if_1_out
    
    movl    $msg_main_print_cant_open_file, (%esp)
    call    printf

    movl    $-1, (%esp)
    call    exit

label_if_1_out:
label_while_body:

    movl    -4(%ebp), %ebx
    movl    %ebx, (%esp)
    call    fgetc
    movb    %al, -21(%ebp)

    cmpb    $-1, %al
    jne     label_if_2_out
    jmp     label_break_while_loop

label_if_2_out:
    addl    $1, -8(%ebp)
    
    cmpb    $' ', %al
    jne     label_else_if_1
    addl    $1, -12(%ebp)
    jmp     label_if_else_out

label_else_if_1:
    cmpb    $'\t', %al
    jne     label_else_if_2
    addl    $1, -16(%ebp)
    jmp     label_if_else_out

label_else_if_2:
    cmpb    $'\n', %al
    jne     label_if_else_out
    addl    $1, -20(%ebp)

label_if_else_out:
    jmp     label_while_body
label_break_while_loop:

    movl    -4(%ebp), %ebx
    movl    %ebx, (%esp)
    call    fclose

    movl    $0, -4(%ebp)

    movl    $msg_main_print_no_of_characters, (%esp)
    movl    -8(%ebp), %eax
    movl    %eax, 4(%esp)
    call    printf

    movl    $msg_main_print_no_of_spaces, (%esp)
    movl    -12(%ebp), %eax
    movl    %eax, 4(%esp)
    call    printf

    movl    $msg_main_print_no_of_tabs, (%esp)
    movl    -16(%ebp), %eax
    movl    %eax, 4(%esp)
    call    printf

    movl    $msg_main_print_no_of_line, (%esp)
    movl    -20(%ebp), %eax
    movl    %eax, 4(%esp)
    call    printf

    movl    $0, (%esp)
    call    exit

