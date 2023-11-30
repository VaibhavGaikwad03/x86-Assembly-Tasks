.section .rodata
    msg_main_file_name:
    .string "print_characters.txt"

    msg_main_print_error:
    .string "\nCan't Open File\n"

.section .text
.globl  main 
.type   main, @function
main:
    andl    $-16, %esp
    pushl   %ebp
    movl    %esp, %ebp

    subl    $1056, %esp

    movl    $5, %eax
    movl    $msg_main_file_name, %ebx
    movl    $00, %ecx
    int     $0x80
    movl    %eax, -4(%ebp)

    cmpl    $-2, %eax
    jne     label_if_out
    
    movl    $4, %eax
    movl    $1, %ebx
    movl    $msg_main_print_error, %ecx
    movl    $18, %edx
    int     $0x80

    movl    $1, %eax
    movl    $-1, %ebx
    int     $0x80

label_if_out:

    jmp     label_while_condition
label_while_body:
    movl    $4, %eax
    movl    $1, %ebx
    leal    -1032(%ebp), %ecx
    movl    -8(%ebp), %edx
    int     $0x80

label_while_condition:
    movl    $3, %eax
    movl    -4(%ebp), %ebx
    leal    -1032(%ebp), %ecx
    movl    $1024, %edx
    int     $0x80

    movl    %eax, -8(%ebp)

    cmpl    $0, %eax
    jne     label_while_body

    movl    $6, %eax
    movl    -4(%ebp), %ebx
    int     $0x80

    movl    $1, %eax
    movl    $0, %ebx
    int     $0x80
