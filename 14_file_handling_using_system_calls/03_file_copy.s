.section .rodata
    msg_main_source_file_name:
    .string "file_copy_source.txt"

    msg_main_destination_file_name:
    .string "file_copy_destination.txt"

    msg_main_print_source_error:
    .string "\nCan't Open Source File\n"

    msg_main_print_destination_error:
    .string "\nCan't Open Destination File\n"

    msg_main_print_copied_successfully:
    .string "\nCopied Successfully\n"

.section .text
.globl  main 
.type   main, @function
main:
    andl    $-16, %esp
    pushl   %ebp
    movl    %esp, %ebp

    subl    $1056, %esp

    movl    $msg_main_source_file_name, (%esp)
    movl    $00, 4(%esp)
    call    open
    movl    %eax, -4(%ebp)

    cmpl    $-1, %eax
    jne     label_if_1_out

    movl    $1, (%esp)
    movl    $msg_main_print_source_error, 4(%esp)
    movl    $25, 8(%esp)
    call    write

    movl    $-1, (%esp)
    call    exit

label_if_1_out:

    movl    $msg_main_destination_file_name, (%esp)
    movl    $01101, 4(%esp)
    movl    $0666, 8(%esp)
    call    open
    movl    %eax, -8(%ebp)

    cmpl    $-1, %eax
    jne     label_if_2_out

    movl    $1, (%esp)
    movl    $msg_main_print_destination_error, 4(%esp)
    movl    $30, 8(%esp)
    call    write

    movl    -4(%ebp), %eax
    movl    %eax, (%esp)
    call    close

    movl    $-1, (%esp)
    call    exit

label_if_2_out:

    jmp     label_while_condition
label_while_body:
    movl    -8(%ebp), %eax
    movl    %eax, (%esp)
    leal    -1036(%ebp), %ebx
    movl    %ebx, 4(%esp)
    movl    -12(%ebp), %eax
    movl    %eax, 8(%esp)
    call    write 

label_while_condition:
    movl    -4(%ebp), %eax
    movl    %eax, (%esp)
    leal    -1036(%ebp), %ebx
    movl    %ebx, 4(%esp)
    movl    $1024, 8(%esp)
    call    read
    movl    %eax, -12(%ebp)

    cmpl    $0, %eax
    jne     label_while_body

    movl    -4(%ebp), %eax
    movl    %eax, (%esp)
    call    close

    movl    -8(%ebp), %eax
    movl    %eax, (%esp)
    call    close

    movl    $1, (%esp)
    movl    $msg_main_print_copied_successfully, 4(%esp)
    movl    $22, 8(%esp)
    call    write

    movl    $0, (%esp)
    call    exit
