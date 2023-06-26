.section .rodata
    msg_main_print_menu:
    .string "\n1.Addition\n2.Subtraction\n3.Multiplication\n4.Division\n5.Exit\n"

    msg_main_print_choice:
    .string "Enter your choice:\t"

    msg_main_scan_one_num:
    .string "%d"

    msg_main_print_two_numbers:
    .string "Enter two numbers:\t"

    msg_main_scan_two_num:
    .string "%d%d"

    msg_main_print_valid_choice:
    .string "Enter valid choice\n"

    msg_main_print_answer:
    .string "Answer is %d\n\n"

    msg_main_print_more_choice:
    .string "Are you want to enter more choices?(1/0):\t"

.section .text
# main function starts
.globl  main 
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

# do while starts
label_do_body:
    pushl   $msg_main_print_menu
    call    puts
    addl    $4, %esp

    pushl   $msg_main_print_choice
    call    puts
    addl    $4, %esp

    leal    -16(%ebp), %ebx
    pushl   %ebx
    pushl   $msg_main_scan_one_num
    call    scanf
    addl    $8, %esp

# if statement starts
    movl    -16(%ebp), %eax
    cmpl    $0, %eax
    jle     label_if_out
    cmpl    $5, %eax
    jge     label_if_out
    pushl   $msg_main_print_two_numbers
    call    puts
    addl    $4, %esp

    leal    -4(%ebp), %eax
    leal    -8(%ebp), %edx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_scan_two_num
    call    scanf
    addl    $12, %esp
# if statement ends
label_if_out:

# switch statement starts
    movl    -16(%ebp), %eax

    # case 1
    cmpl    $1, %eax
    je      label_case_1

    # case 2
    cmpl    $2, %eax
    je      label_case_2

    # case 3
    cmpl    $3, %eax
    je      label_case_3

    # case 4
    cmpl    $4, %eax
    je      label_case_4

    # case 5
    cmpl    $5, %eax
    je      label_case_5

    # default case
    jmp     label_default_case

label_case_1:
    movl    -4(%ebp), %eax
    movl    -8(%ebp), %edx
    pushl   %edx
    pushl   %eax
    call    Addition
    movl    %eax, -12(%ebp)
    addl    $8, %esp
    jmp     label_break

label_case_2:
    movl    -4(%ebp), %eax
    movl    -8(%ebp), %edx
    pushl   %edx
    pushl   %eax
    call    Subtraction
    movl    %eax, -12(%ebp)
    addl    $8, %esp
    jmp     label_break

label_case_3:
    movl    -4(%ebp), %eax
    movl    -8(%ebp), %edx
    pushl   %edx
    pushl   %eax
    call    Multiplication
    movl    %eax, -12(%ebp)
    addl    $8, %esp
    jmp     label_break

label_case_4:
    movl    -4(%ebp), %eax
    movl    -8(%ebp), %edx
    pushl   %edx
    pushl   %eax
    call    Division
    movl    %eax, -12(%ebp)
    addl    $8, %esp
    jmp     label_break

label_case_5:
    pushl   $0
    call    exit

label_default_case:
    pushl   $msg_main_print_valid_choice
    call    puts
    addl    $4 , %esp
    
    movl    $1, -16(%ebp)
    jmp     label_do_body
# switch statement ends

label_break:
    pushl   %eax
    pushl   $msg_main_print_answer
    call    printf
    addl    $8, %esp

    pushl   $msg_main_print_more_choice
    call    puts
    addl    $4, %esp

    leal    -16(%ebp), %ebx
    pushl   %ebx
    pushl   $msg_main_scan_one_num
    call    scanf
    addl    $8, %esp

    movl    -16(%ebp), %eax
    cmpl    $1, %eax
    je      label_do_body
# do while ends

    pushl   $0
    call    exit
# main function ends
 

# Addition function starts
.globl  Addition
.type   Addition, @function
Addition:
    pushl   %ebp
    movl    %esp, %ebp

    movl    8(%ebp), %eax
    movl    12(%ebp), %edx

    addl    %edx, %eax

    movl    %ebp, %esp
    popl    %ebp
    ret
# Addition function ends

# Subtraction function starts
.globl  Subtraction
.type   Subtraction, @function
Subtraction:
    pushl   %ebp
    movl    %esp, %ebp

    movl    8(%ebp), %eax
    movl    12(%ebp), %edx

    subl    %edx, %eax

    movl    %ebp, %esp
    popl    %ebp
    ret
# Subtraction function ends

# Multiplication function starts
.globl  Multiplication
.type   Multiplication, @function
Multiplication:
    pushl   %ebp
    movl    %esp, %ebp

    movl    8(%ebp), %eax
    movl    12(%ebp), %ecx

    mull    %ecx

    movl    %ebp, %esp
    popl    %ebp
    ret
# Multiplication function ends

# Division function starts
.globl  Division
.type   Division, @function
Division:
    pushl   %ebp
    movl    %esp, %ebp

    xorl    %edx, %edx

    movl    8(%ebp), %eax
    movl    12(%ebp), %ecx

    divl    %ecx

    movl    %ebp, %esp
    popl    %ebp
    ret
# Division function ends

