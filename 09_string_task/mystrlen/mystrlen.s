.section .rodata
    msg_main_print_length_of_hello:
    .string "\nThe Length Of Hello Is %d\n"

    msg_main_print_length_of_good:
    .string "The Length Of Good Is %d\n"

    msg_main_print_length_of_morning:
    .string "The Length Of Morning Is %d\n"

    msg_main_string_morning:
    .string "Morning"

    msg_main_string_hello:
    .string "Hello"

    msg_test:
    .string "%d\n"

.section .text
.globl  main 
.type   main, @function
main:
    andl    $-16, %esp
    pushl   %ebp
    movl    %esp, %ebp

    subl    $32, %esp

    movl    $msg_main_string_hello, -4(%ebp)

    movb    $'G', -9(%ebp)
    movb    $'o', -8(%ebp)
    movb    $'o', -7(%ebp)
    movb    $'d', -6(%ebp)
    movb    $0, -5(%ebp)

    movl    -4(%ebp), %ebx
    movl    %ebx, (%esp)
    call    mystrlen
    movl    %eax, 4(%esp)
    movl    $msg_main_print_length_of_hello, (%esp)
    call    printf

    leal    -9(%ebp), %ebx
    movl    %ebx, (%esp)
    call    mystrlen
    movl    %eax, 4(%esp)
    movl    $msg_main_print_length_of_good, (%esp)
    call    printf

    movl    $msg_main_string_morning, %ebx
    movl    %ebx, (%esp)
    call    mystrlen
    movl    %eax, 4(%esp)
    movl    $msg_main_print_length_of_morning, (%esp)    
    call    printf

    movl    $0, (%esp)
    call    exit

.globl  mystrlen
.type   mystrlen, @function
mystrlen:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp
    movl    $0, -4(%ebp)

    movl    8(%ebp), %esi   # string address
    movl    $50, %ecx       # loop counter (any value)
    cld                     # clearing direction flag
loop_label_mystrlen:
    lodsb                   # %esi value to al
    cmpb    $0, %al
    je      loop_label_mystrlen_out
    addl    $1, -4(%ebp)
    loop    loop_label_mystrlen

loop_label_mystrlen_out:
    movl    -4(%ebp), %eax

    movl    %ebp, %esp
    popl    %ebp
    ret

