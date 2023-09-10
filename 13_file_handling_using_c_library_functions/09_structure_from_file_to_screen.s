.section .rodata
    msg_main_file_name:
    .string "student_structure_from_keyboard_to_file.txt"

    msg_main_opening_mode:
    .string "r"

    msg_main_print_cant_open_file:
    .string "\nCan't open file\n"

    msg_main_scan_structure:
    .string "%s %d %f"

    msg_main_print_structure:
    .string "%s %d %f\n"

.section .text
.globl  main 
.type   main, @function
main:
    andl    $-16, %esp
    pushl   %ebp
    movl    %esp, %ebp
    
    subl    $80, %esp

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
    movl    $msg_main_print_structure, (%esp)
    leal    -52(%ebp), %ebx
    movl    %ebx, 4(%esp)
    movl    40(%ebx), %eax
    movl    %eax, 8(%esp)
    flds    44(%ebx)
    fstpl   12(%esp)
    call    printf

label_while_condition:
    leal    -52(%ebp), %ebx
    movl    %ebx, (%esp)
    movl    $48, 4(%esp)
    movl    $1, 8(%esp)
    movl    -4(%ebp), %ebx
    movl    %ebx, 12(%esp)
    call    fread 
    
    cmpl    $1, %eax
    je     label_while_body

    movl    -4(%ebp), %ebx
    movl    %ebx, (%esp)
    call    fclose

    movl    $0, -4(%ebp)

    movl    $0, (%esp)
    call    exit
