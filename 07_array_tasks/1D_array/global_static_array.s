.equ MAX, 10

.section .rodata
    msg_main_print_enter_values:
    .string "Enter value of n(< %d):\t"

    msg_main_scan:
    .string "%d"

    msg_main_print_enter_array_values:
    .string "Enter %d value:\t"

    msg_main_print_arr1_is:
    .string "arr1 is:\n"

    msg_main_print_arr2_is:
    .string "arr2 is:\n"

    msg_main_print_array_values:
    .string "%d value is:\t%d\n"

.section .data
.globl  arr1
.type   arr1, @object
.size   arr1, 12
.align  4
arr1:
    .int 10, 20, 30

.section .bss
    .comm   arr2, MAX,4

.section .text
.globl  main
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $8, %esp

    pushl   $MAX
    pushl   $msg_main_print_enter_values
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
    pushl   $msg_main_print_enter_array_values
    call    printf
    addl    $8, %esp

    movl    -8(%ebp), %eax
    leal    arr2(, %eax, 4), %ebx
    pushl   %ebx
    pushl   $msg_main_scan
    call    scanf
    addl    $8, %esp

    addl    $1, -8(%ebp)    # manipulation

label_first_for_condition:
    movl    -8(%ebp), %eax
    movl    -4(%ebp), %edx
    cmpl    %edx, %eax
    jl      label_first_for_body
# first for loop ends

    pushl   $msg_main_print_arr1_is
    call    printf
    addl    $4, %esp

# second for loop starts
    movl    $0, -8(%ebp)
    jmp     label_second_for_condition

label_second_for_body:
    movl    arr1(, %eax, 4), %edx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_array_values
    call    printf
    addl    $12, %esp

    addl    $1, -8(%ebp)    # manipulation

label_second_for_condition:
    movl    -8(%ebp), %eax
    cmpl    $3, %eax
    jl      label_second_for_body
# second for loop ends

    pushl   $msg_main_print_arr2_is
    call    printf
    addl    $4, %esp

# third for loop starts
    movl    $0, -8(%ebp)
    jmp     label_third_for_condition

label_third_for_body:
    movl    arr2(, %eax, 4), %edx

    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_array_values
    call    printf
    addl    $12, %esp

    addl    $1, -8(%ebp)    # manipulation

label_third_for_condition:
    movl    -8(%ebp), %eax
    cmpl    $MAX, %eax
    jl      label_third_for_body
# third for loop ends

    pushl   $0
    call    exit
