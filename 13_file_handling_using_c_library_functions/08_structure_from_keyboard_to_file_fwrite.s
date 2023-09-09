.section .rodata
    msg_main_file_name:
    .string "student_structure_from_keyboard_to_file.txt"

    msg_main_opening_mode:
    .string "w"

    msg_main_print_enter_name_rollno_perc:
    .string "\n\nEnter name, roll no. and percentage:\n"

    msg_main_print_add_another_rec:
    .string "\nAdd another record (Y/N): "

    msg_main_print_cant_open_file:
    .string "\nCan't open file\n"

    msg_main_scan_structure:
    .string "%s %d %f"

    msg_main_print_structure:
    .string "%s %d %f\n"

    msg_main_scan_character:
    .string "%c%c"

.section .text
.globl  main 
.type   main, @function
main:
    andl    $-16, %esp
    pushl   %ebp
    movl    %esp, %ebp

    subl    $80, %esp

    movl    $0, -4(%ebp)
    movl    $'Y', -8(%ebp)

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
    movl    $msg_main_print_enter_name_rollno_perc, (%esp)
    call    printf

    movl    $msg_main_scan_structure, (%esp)
    leal    -53(%ebp), %ebx
    movl    %ebx, 4(%esp)
    leal    40(%ebx), %eax
    movl    %eax, 8(%esp)
    leal    44(%ebx), %eax
    movl    %eax, 12(%esp)
    call    scanf

    leal    -53(%ebp), %ebx
    movl    %ebx, (%esp)
    movl    $48, 4(%esp)
    movl    $1, 8(%esp)
    movl    -4(%ebp), %ebx
    movl    %ebx, 12(%esp)
    call    fwrite

    movl    $msg_main_print_add_another_rec, (%esp)
    call    printf

    movl    $msg_main_scan_character, (%esp)
    leal    -54(%ebp), %ebx
    movl    %ebx, 4(%esp)
    leal    -8(%ebp), %ebx
    movl    %ebx, 8(%esp)
    call    scanf
label_while_condition:
    movb    -8(%ebp), %al
    cmpb    $'Y', %al
    je      label_while_body
    cmpb    $'y', %al
    je      label_while_body

    movl    -4(%ebp), %ebx
    movl    %ebx, (%esp)
    call    fclose

    movl    $0, -4(%ebp)

    movl    $0, (%esp)
    call    exit
