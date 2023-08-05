.section .rodata
    msg_main_print_enter_first_string:
    .string "\n\nEnter String1:\t"

    msg_main_print_enter_second_string:
    .string "\n\nEnter String2:\t"

    msg_main_print_strings_are_same:
    .string "\n\nBoth Strings Are Same\n"

    msg_main_print_strings_are_different:
    .string "\n\nBoth Strings Are Diffrent\n"

.section .text
.globl  main 
.type   main, @function
main:
    andl    $-16, %esp
    pushl   %ebp
    movl    %esp, %ebp

    subl    $64, %esp

    movl    $msg_main_print_enter_first_string, (%esp)
    call    printf

    leal    -20(%ebp), %ebx
    movl    %ebx, (%esp)
    call    gets

    movl    $msg_main_print_enter_second_string, (%esp)
    call    printf

    leal    -40(%ebp), %ebx
    movl    %ebx, (%esp)
    call    gets

    leal    -20(%ebp), %eax
    leal    -40(%ebp), %edx
    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    call    mystrcmp
    movl    %eax, -44(%ebp)

    cmpl    $0, %eax
    jne     label_else
    movl    $msg_main_print_strings_are_same, (%esp)
    call    printf
    jmp     label_out
label_else:
    movl    $msg_main_print_strings_are_different, (%esp)
    call    printf

label_out:
    movl    $0, (%esp)
    call    exit

.globl  mystrcmp
.type   mystrcmp, @function
mystrcmp:
    pushl   %ebp
    movl    %esp, %ebp

    movl    8(%ebp), %esi
    movl    12(%ebp), %edi

    cld
label_loop:
    movb    (%esi), %al
    movb    (%edi), %dl
    cmpb    $0, %al
    je      label_loop_out
    cmpb    $0, %dl
    je      label_loop_out    
    cmpsb
    je      label_loop
label_loop_out:
    dec     %esi
    dec     %edi

    movb    (%esi), %dl
    movb    (%edi), %al

    subb    %al, %dl

    cmpb    $0, %dl
    jl      label_if_less_than
    cmpb    $0, %dl
    jge     label_if_greater_than

label_if_less_than:
    movsx   %dl, %eax
    jmp     label_mystrcmp_exit
label_if_greater_than:
    movzx   %dl, %eax

label_mystrcmp_exit:
    movl    %ebp, %esp
    popl    %ebp
    ret
