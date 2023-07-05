.section .rodata
    msg_main_print_enter_value_of_n:
    .string "Enter value of n(< %d):\t"

    msg_main_scan:
    .string "%d"

    msg_main_print_enter_array_value:
    .string "Enter %d value:\t"

    msg_main_print_entered_elements:
    .string "Entered elements are:\n"

    msg_main_print_array_elements:
    .string "%d value is:\t%d\n"

.section .text
.globl  main
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $48, %esp

    pushl   $10
    pushl    $msg_main_print_enter_value_of_n
    call    printf
    addl    $8, %esp

    leal    -4(%ebp), %ebx
    pushl   %ebx
    pushl   $msg_main_scan
    call    scanf
    addl    $8, %esp

# first for loop starts
    movl    $0, -8(%ebp)
    jmp     label_first_for_condition

label_first_for_body:
    pushl   %eax
    pushl   $msg_main_print_enter_array_value
    call    printf
    addl    $8, %esp

    movl    -8(%ebp), %eax
    leal    -48(%ebp, %eax, 4), %ebx
    pushl   %ebx
    pushl   $msg_main_scan
    call    scanf
    addl    $8, %esp

    addl    $1, -8(%ebp)

label_first_for_condition:
    movl    -8(%ebp), %eax
    movl    -4(%ebp), %edx
    cmpl    %edx, %eax
    jl      label_first_for_body
# first for loop ends

    pushl   $msg_main_print_entered_elements
    call    printf
    addl    $4, %esp

# second for loop starts
    movl    $0, -8(%ebp)
    jmp     label_second_for_condition

label_second_for_body:
    movl    -48(%ebp, %eax, 4), %edx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_array_elements
    call    printf
    addl    $12, %esp

    addl    $1, -8(%ebp)

label_second_for_condition:
    movl    -8(%ebp), %eax
    movl    -4(%ebp), %edx
    cmpl    %edx, %eax
    jl      label_second_for_body
# second for loop ends

    pushl    $0
    call    exit
