.section .rodata
    msg_main_print_enter_string:
    .string "\n\nEnter The String:\t"

    msg_main_print_reverse_string_is:
    .string "\n\nReverse String Is:\t"

.section .text
.globl  main 
.type   main, @function
main:
    andl    $-16, %esp
    pushl   %ebp
    movl    %esp, %ebp

    subl    $32, %esp

    movl    $msg_main_print_enter_string, (%esp)
    call    printf

    leal    -20(%ebp), %ebx
    movl    %ebx, (%esp)
    call    gets

    leal    -20(%ebp), %ebx
    movl    %ebx, (%esp)
    call    mystrrev

    movl    $msg_main_print_reverse_string_is, (%esp)
    call    printf

    leal    -20(%ebp), %ebx
    movl    %ebx, (%esp)
    call    puts

    movl    $0, (%esp)
    call    exit

.section .text
.globl  mystrrev
.type   mystrrev, @function
mystrrev:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp
    movl    $0, -4(%ebp)
    movl    $0, -8(%ebp)

    movl    8(%ebp), %esi
    movl    $50, %ecx
    cld
loop_label_mystrrev_1:
    lodsb
    cmpb    $0, %al
    je      loop_label_mystrrev_1_out
    addl    $1, -8(%ebp)
    loop    loop_label_mystrrev_1
loop_label_mystrrev_1_out:
    subl    $1, -8(%ebp)

    movl    8(%ebp), %ebx
loop_label_mystrrev_2:
    movl    -4(%ebp), %eax
    movl    -8(%ebp), %edx
    cmpl    %edx, %eax
    jge      loop_label_mystrrev_2_out

    movb    (%ebx, %eax, 1), %al
    movb    (%ebx, %edx, 1), %dl
    addb    %dl, %al
    movl    -4(%ebp), %edx
    movb    %al, (%ebx, %edx, 1)

    movl    -4(%ebp), %eax
    movl    -8(%ebp), %edx
    movb    (%ebx, %eax, 1), %al
    movb    (%ebx, %edx, 1), %dl
    subb    %dl, %al
    movl    -8(%ebp), %edx
    movb    %al, (%ebx, %edx, 1)

    movl    -4(%ebp), %eax
    movl    -8(%ebp), %edx
    movb    (%ebx, %eax, 1), %al
    movb    (%ebx, %edx, 1), %dl
    subb    %dl, %al
    movl    -4(%ebp), %edx
    movb    %al, (%ebx, %edx, 1)

    addl    $1, -4(%ebp)
    subl    $1, -8(%ebp)

    loop    loop_label_mystrrev_2

loop_label_mystrrev_2_out:
    movl    8(%ebp), %eax

    movl    %ebp, %esp
    popl    %ebp
    ret