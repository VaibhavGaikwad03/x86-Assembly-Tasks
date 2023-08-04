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

    movl    8(%ebp), %esi
    movl    $50, %ecx
    cld
loop_label_mystrncat_1:
    lodsb
    cmpb    $0, %al
    je      loop_label_mystrncat_1_out
    loop    loop_label_mystrncat_1
loop_label_mystrncat_1_out:
    subl    $1, %esi
    movl    %esi, %edi
    movl    16(%ebp), %ecx
    movl    12(%ebp), %esi
loop_label_mystrncat_2:
    movsb
    loop    loop_label_mystrncat_2

    movl    $0, (%edi)

    movl    8(%ebp), %eax

    movl    %ebp, %esp
    popl    %ebp
    ret