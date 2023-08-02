.section .rodata
    msg_main_print_enter_the_string:
    .string "\n\nEnter The String:\t"

    msg_main_print_string_in_uppercase:
    .string "\nString In Upper Case Is:\t"

.section .text
.globl  main 
.type   main, @function
main:
    andl    $-16, %esp
    pushl   %ebp
    movl    %esp, %ebp

    subl    $32, %esp

    movl    $msg_main_print_enter_the_string, (%esp)
    call    printf

    leal    -20(%ebp), %ebx
    movl    %ebx, (%esp)
    call    gets

    leal    -20(%ebp), %ebx
    movl    %ebx, (%esp)
    call    mystrupr

    movl    $msg_main_print_string_in_uppercase, (%esp)
    call    printf

    leal    -20(%ebp), %ebx
    movl    %ebx, (%esp)
    call    puts

    movl    $0, (%esp)
    call    exit

.globl  mystrupr
.type   mystrupr, @function
mystrupr:
    pushl   %ebp
    movl    %esp, %ebp

    movl    8(%ebp), %esi
    movl    8(%ebp), %edi
    movl    $50, %ecx
    cld
loop_label_mystrupr:
    lodsb   
    cmpb    $0, %al
    je      loop_label_mystrupr_out
    cmpb    $'a', %al
    jl      loop_label_mystrupr_continue
    cmpb    $'z', %al
    jg      loop_label_mystrupr_continue

    subb    $32, %al
loop_label_mystrupr_continue:
    stosb
    loop    loop_label_mystrupr
loop_label_mystrupr_out:
    movl    8(%ebp), %eax

    movl    %ebp, %esp
    popl    %ebp
    ret
    