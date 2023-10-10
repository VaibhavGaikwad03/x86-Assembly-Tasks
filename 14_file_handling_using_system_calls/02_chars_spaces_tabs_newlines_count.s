.section .rodata
    msg_main_file_name:
    .string "chars_spaces_tabs_newlines_count.txt"

    msg_main_print_error:
    .string "Can't open the file\n"

    msg_main_print_no_of_chars:
    .string "\nNo of characters are %d\n"

    msg_main_print_no_of_spaces:
    .string "No of spaces are %d\n"

    msg_main_print_no_of_tabs:
    .string "No of tabs are %d\n"

    msg_main_print_no_of_lines:
    .string "No of lines are %d\n"

.section .text
.globl  main 
.type   main, @function
main:
    andl    $-16, %esp
    pushl   %ebp
    movl    %esp, %ebp

    subl    $1072, %esp
    movl    $0, -12(%ebp)
    movl    $0, -16(%ebp)
    movl    $0, -20(%ebp)
    movl    $0, -24(%ebp)

    movl    $msg_main_file_name, (%esp)
    movl    $00, 4(%esp)
    call    open
    movl    %eax, -4(%ebp)

    cmpl    $-1, %eax
    jne     label_if_out

    movl    $1, (%esp)
    movl    $msg_main_print_error, 4(%esp)
    movl    $21, 8(%esp)
    call    write

    movl    $-1, (%esp)
    call    exit

label_if_out:

    jmp     label_while_condition

label_while_body:
    movl    -28(%ebp), %eax
    addl    %eax, -12(%ebp)

    movl    $0, -8(%ebp)
    jmp     label_for_condition
label_for_body:
    movb    -1052(%ebp, %eax, 1), %al

    cmpb    $' ', %al 
    jne     label_else_if_1
    addl    $1, -16(%ebp)
    jmp     label_ladder_out

label_else_if_1:
    cmpb    $'\t', %al
    jne     label_else_if_2
    addl    $1, -20(%ebp)
    jmp label_ladder_out

label_else_if_2:
    cmpb    $'\n', %al
    jne     label_ladder_out
    addl    $1, -24(%ebp)

label_ladder_out:
    addl    $1, -8(%ebp)
label_for_condition:
    movl    -8(%ebp), %eax
    movl    -28(%ebp), %edx

    cmpl    %edx, %eax
    jl      label_for_body

label_while_condition:
    movl    -4(%ebp), %eax
    movl    %eax, (%esp)
    leal    -1052(%ebp), %ebx
    movl    %ebx, 4(%esp)
    movl    $1024, 8(%esp)
    call    read
    movl    %eax, -28(%ebp)

    cmpl    $0, %eax
    jne     label_while_body

    movl    -4(%ebp), %eax
    movl    %eax, (%esp)
    call    close

    movl    $msg_main_print_no_of_chars, (%esp)
    movl    -12(%ebp), %eax
    movl    %eax, 4(%esp)
    call    printf 

    movl    $msg_main_print_no_of_spaces, (%esp)
    movl    -16(%ebp), %eax
    movl    %eax, 4(%esp)
    call    printf

    movl    $msg_main_print_no_of_tabs, (%esp)
    movl    -20(%ebp), %eax
    movl    %eax, 4(%esp)
    call    printf 

    movl    $msg_main_print_no_of_lines, (%esp)
    movl    -24(%ebp), %eax
    movl    %eax, 4(%esp)
    call    printf

    movl    $0, (%esp)
    call    exit
