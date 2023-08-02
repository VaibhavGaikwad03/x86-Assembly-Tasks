.section .rodata
    msg_main_print_enter_destination_string:
    .string "\n\nEnter Destination String:\t"

    msg_main_print_enter_source_string:
    .string "\n\nEnter Source String:\t"

    msg_main_print_enter_value_of_n:
    .string "\n\nEnter Value Of n:\t"

    msg_main_scan:
    .string "%d"

    msg_main_print_concatenated_string_is:
    .string "\n\nConcatenated String Is:\t"

.section .text
.globl  main 
.type   main, @function
main:
    andl    $-16, %esp
    pushl   %ebp
    movl    %esp, %ebp

    subl    $80, %esp

    movl    $msg_main_print_enter_destination_string, (%esp)
    call    printf 

    leal    -60(%ebp), %ebx
    movl    %ebx, (%esp)
    call    gets

    movl    $msg_main_print_enter_source_string, (%esp)
    call    printf

    leal    -20(%ebp), %ebx
    movl    %ebx, (%esp)
    call    gets

    movl    $msg_main_print_enter_value_of_n, (%esp)
    call    printf

    leal    -64(%ebp), %ebx
    movl    $msg_main_scan, (%esp)
    movl    %ebx, 4(%esp)
    call    scanf

    leal    -60(%ebp), %eax
    leal    -20(%ebp), %edx
    movl    -64(%ebp), %ecx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    movl    %ecx, 8(%esp)
    call    mystrncat

    movl    $msg_main_print_concatenated_string_is, (%esp)
    call    printf

    leal    -60(%ebp), %ebx
    movl    %ebx, (%esp)
    call    puts

    movl    $0, (%esp)
    call    exit

.globl  mystrncat
.type   mystrncat, @function
mystrncat:
    pushl   %ebp
    movl    %esp, %ebp

    movl    $0, %eax
    movl    $50, %ecx
loop_label_mystrncat_1:
    movl    8(%ebp), %ebx
    leal    (%ebx, %eax, 1), %ebx
    movb    (%ebx), %dl
    cmpb    $0, %dl
    je      loop_label_mystrncat_1_out
    addl    $1, %eax
    loop    loop_label_mystrncat_1
loop_label_mystrncat_1_out:

    movl    16(%ebp), %ecx
    movl    %ebx, %edi
    movl    12(%ebp), %esi

    rep     movsb

    movl    $0, (%edi)

    movl    8(%ebp), %eax

    movl    %ebp, %esp
    popl    %ebp
    ret
    