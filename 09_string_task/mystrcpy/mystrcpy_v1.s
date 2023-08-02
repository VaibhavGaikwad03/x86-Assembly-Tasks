.section .rodata
    msg_main_print_enter_source_string:
    .string "\n\nEnter Source String:\t"

    msg_main_print_source_string_is:
    .string "\n\nSource String Is:\t"

    msg_main_print_destination_string_is:
    .string "\n\nDestination String Is:\t"

    msg_test:
    .string "Hello\n"

.section .text
.globl  main
.type   main, @function
main:
    andl    $-16, %esp
    pushl   %ebp
    movl    %esp, %ebp

    subl    $48, %esp

    movl    $20, %ecx
    movl    $0, %eax
    leal    -20(%ebp), %ebx
loop_label_main_1:
    movl    $0, (%ebx, %eax, 1)
    addl    $1, %eax
    loop    loop_label_main_1

    movl    $20, %ecx
    movl    $0, %eax
    leal    -40(%ebp), %ebx
loop_label_main_2:
    movl    $0, (%ebx, %eax, 1)
    addl    $1, %eax
    loop    loop_label_main_2

    movl    $msg_main_print_enter_source_string, (%esp)
    call    printf

    leal    -20(%ebp), %ebx
    movl    %ebx, (%esp)
    call    gets

    movl    $msg_main_print_source_string_is, (%esp)
    call    printf

    leal    -20(%ebp), %ebx
    movl    %ebx, (%esp)
    call    puts 

    leal    -40(%ebp), %eax
    leal    -20(%ebp), %edx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    call    mystrcpy

    movl    $msg_main_print_destination_string_is, (%esp)
    call    printf

    leal    -40(%ebp), %ebx
    movl    %ebx, (%esp)
    call    puts

    movl    $0, (%esp)
    call    exit

.globl  mystrcpy
.type   mystrcpy, @function
mystrcpy:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    movl    $20, %ecx       # loop instruction counter

    movl    12(%ebp), %esi  # source string address 
    movl    8(%ebp), %edi   # destination string address

    cld                     # by default direction bit off aste pn 
                            # movs use karaychya aadhi tila clear karne is good programming practice
loop_label_mystrcpy:
    movl    %esi, %ebx  
    cmpb    $0, (%ebx)      # condition
    je      label_loop_out
    movsb                   # moves value from source address to destination address
    loop    loop_label_mystrcpy
label_loop_out: 
    movl    8(%ebp), %eax

    movl    %ebp, %esp
    popl    %ebp
    ret
