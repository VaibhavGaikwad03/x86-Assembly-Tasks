.section .rodata
    msg_main_print_enter_string:
    .string "\n\nEnter The String:\t"

    msg_main_print_enter_character:
    .string "\n\nEnter The Character To Set:\t"

    msg_main_scan_character:
    .string "%c"

    msg_main_print_string_is:
    .string "\n\nNow String Is:\t"

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

    movl    $msg_main_print_enter_character, (%esp)
    call    printf

    leal    -21(%ebp), %ebx
    movl    $msg_main_scan_character, (%esp)
    movl    %ebx, 4(%esp)
    call    scanf

    leal    -20(%ebp), %ebx
    movb    -21(%ebp), %al
    movl    %ebx, (%esp)
    movb    %al, 4(%esp)
    call    mystrset

    movl    $msg_main_print_string_is, (%esp)
    call    printf

    leal    -20(%ebp), %ebx
    movl    %ebx, (%esp)
    call    puts

    movl    $0, (%esp)
    call    exit

.globl  mystrset
.type   mystrset, @function
mystrset:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    movl    8(%ebp), %ebx
    movl    %ebx, (%esp)
    call    mystrlen
    movl    %eax, %ecx

    movl    8(%ebp), %edi
    movb    12(%ebp), %al

    rep     stosb

    movl    %ebp, %esp
    popl    %ebp
    ret