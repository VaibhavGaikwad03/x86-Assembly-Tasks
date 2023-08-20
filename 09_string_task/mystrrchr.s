.section .rodata
    msg_main_print_enter_string:
    .string "Enter the string : "

    msg_main_print_enter_character:
    .string "Enter the character : "

    msg_main_scan_string:
    .string "%s"

    msg_main_scan_character:
    .string " %c"

    msg_test:
    .string "Hello\n"

.section  .text
.globl  main 
.type   main, @function
main:
    andl    $-16, %esp
    pushl   %ebp
    movl    %esp, %ebp

    subl    $48, %esp

    movl    $msg_main_print_enter_string, (%esp)
    call    printf

    leal    -20(%ebp), %ebx
    movl    %ebx, 4(%esp)
    movl    $msg_main_scan_string, (%esp)
    call    scanf

    movl    $msg_main_print_enter_character, (%esp)
    call    printf

    leal    -21(%ebp), %ebx
    movl    %ebx, 4(%esp)
    movl    $msg_main_scan_character, (%esp)
    call    scanf

    leal    -20(%ebp), %ebx
    xorl    %eax, %eax
    movb    -21(%ebp), %al

    movl    %ebx, (%esp)
    movb    %al, 4(%esp)
    call    mystrrchr

    cmpl    $0, %eax
    je      label_exit
    movl    $msg_main_scan_string, (%esp)
    movl    %eax, 4(%esp)
    call    printf

label_exit:
    movl    $0, (%esp)
    call    exit

.globl  mystrrchr
.type   mystrrchr, @function
mystrrchr:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    movl    8(%ebp), %ebx
    movl    %ebx, (%esp)
    call    mystrlen
    movl    %eax, -4(%ebp)

    movl    8(%ebp), %edi
    movb    12(%ebp), %al

    movl    -4(%ebp), %ecx
    addl    %ecx, %edi
    dec     %edi

    std
    repne   scasb

    cmpl    $0, %ecx
    jne     label_return_address
    movl    $0, %edi
    jmp     label_return_null

label_return_address:
    inc     %edi
label_return_null:
    movl    %edi, %eax

    movl    %ebp, %esp
    popl    %ebp
    ret
    