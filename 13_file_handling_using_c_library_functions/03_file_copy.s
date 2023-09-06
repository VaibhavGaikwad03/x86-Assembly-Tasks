.section .rodata
    msg_main_source_file_name:
    .string "file_copy_source.txt"

    msg_main_destination_file_name:
    .string "file_copy_destination.txt"

    msg_main_print_cant_open_source_file:
    .string "\nCan't Open Source File\n"

    msg_main_print_cant_open_destination_file:
    .string "\nCan't Open Destination File\n"

    msg_main_print_copied_successfully:
    .string "\nCopied Successfully\n"

    msg_main_read_mode:
    .string "r"

    msg_main_write_mode:
    .string "w"

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

    movl    $msg_main_source_file_name, (%esp)
    movl    $msg_main_read_mode, 4(%esp)
    call    fopen
    movl    %eax, -4(%ebp)

    cmpl    $0, %eax
    jne     label_if_1_out
    movl    $msg_main_print_cant_open_source_file, (%esp)
    call    printf 

    movl    $-1, (%esp)
    call    exit

label_if_1_out:
    movl    $msg_main_destination_file_name, (%esp)
    movl    $msg_main_write_mode, 4(%esp)
    call    fopen 
    movl    %eax, -8(%ebp)

    cmpl    $0, %eax
    jne     label_if_2_out
    movl    $msg_main_print_cant_open_destination_file, (%esp)
    call    printf

    movl    -4(%ebp), %ebx
    movl    %ebx, (%esp)
    call    fclose 
    movl    $0, -4(%ebp)

    movl    $-1, (%esp)
    call    exit 
label_if_2_out:
label_while_body:
    movl    -4(%ebp), %ebx
    movl    %ebx, (%esp)
    call    fgetc
    movb    %al, -9(%ebp)

    cmpb    $-1, %al
    jne     label_if_3_out
    jmp     label_break_while_loop
label_if_3_out:
    movb    -9(%ebp), %al
    movl    -8(%ebp), %edx

    movb    %al, (%esp)
    movl    %edx, 4(%esp)
    call    fputc

    jmp     label_while_body
label_break_while_loop:

    movl    -4(%ebp), %ebx
    movl    %ebx, (%esp)
    call    fclose
    
    movl    $0, -4(%ebp)

    movl    -8(%ebp), %ebx
    movl    %ebx, (%esp)
    call    fclose

    movl    $0, -8(%ebp)

    movl    $msg_main_print_copied_successfully, (%esp)
    call    printf

    movl    $0, (%esp)
    call    exit
