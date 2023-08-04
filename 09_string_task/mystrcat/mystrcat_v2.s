.section .rodata
    msg_main_print_enter_destination_string:
    .string "\n\nEnter Destination String:\t"

    msg_main_print_enter_source_string:
    .string "\n\nEnter Source String:\t"

    msg_main_print_concatenated_string_is:
    .string "\n\nConcatenated String Is:\t"

    msg_test:
    .string "Address : %d\n"

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

    leal    -60(%ebp), %eax
    leal    -20(%ebp), %edx

    movl    %eax, (%esp)
    movl    %edx, 4(%esp)
    call    mystrcat

    movl    $msg_main_print_concatenated_string_is, (%esp)
    call    printf

    leal    -60(%ebp), %ebx
    movl    %ebx, (%esp)
    call    puts 

    movl    $0, (%esp)
    call    exit

.globl  mystrcat
.type   mystrcat, @function
mystrcat:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    movl    8(%ebp), %esi
    movl    $50, %ecx
    cld
loop_label_mystrcat_1:
    lodsb   
    cmpb    $0, %al
    je      loop_label_mystrcat_1_out
    loop    loop_label_mystrcat_1

loop_label_mystrcat_1_out:
    subl    $1, %esi
    movl    %esi, -4(%ebp)

    movl    12(%ebp), %ebx
    movl    %ebx, (%esp)
    call    mystrlen

    movl    %eax, %ecx
    movl    -4(%ebp), %edi
    movl    12(%ebp), %esi
    rep     movsb

    movl    $0, (%edi)

    movl    8(%ebp), %eax

    movl    %ebp, %esp
    popl    %ebp
    ret
