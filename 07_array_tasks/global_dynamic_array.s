.section .rodata
    msg_main_print_enter_value_of_n:
    .string "Enter value of n:\t"

    msg_main_scan:
    .string "%d"

    msg_main_print_memory_allocation_failed:
    .string "Memory allocation FAILED"

    msg_main_print_enter_array_values:
    .string "Enter %d value:\t"

    msg_main_print_elements_are:
    .string "Entered elements are:\n"

    msg_main_print_array_values:
    .string "%d value is:\t%d\n"

.section .data
.globl  pPtr
.type   pPtr, @object
.size   pPtr, 4
.align  4
pPtr:
    .int 0

.section .text
.globl  main
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $8, %esp

    pushl   $msg_main_print_enter_value_of_n
    call    printf
    addl    $4, %esp

    leal    -4(%ebp), %ebx
    pushl   %ebx
    pushl   $msg_main_scan
    call    scanf
    addl    $8, %esp

    movl    -4(%ebp), %eax
    movl    $4, %ecx
    mull    %ecx

    pushl   %eax
    call    malloc
    addl    $4, %esp
    movl    %eax, pPtr
    cmpl    $0, pPtr
    jne     label_if_out
    pushl   $msg_main_print_memory_allocation_failed
    call    puts
    addl    $4, %esp

    pushl   $-1
    call    exit
    addl    $4, %esp

label_if_out:

# first for loop starts
    movl    $0, -8(%ebp)
    jmp     label_first_for_condition

label_first_for_body:
    pushl   %eax
    pushl   $msg_main_print_enter_array_values
    call    printf
    addl    $8, %esp

    movl    -8(%ebp), %eax
    movl    (pPtr), %ebx
    leal    (%ebx, %eax, 4), %ebx
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

    pushl   $msg_main_print_elements_are
    call    printf
    addl    $4, %esp

# second for loop starts
    movl    $0, -8(%ebp)
    jmp     label_second_for_condition

label_second_for_body:
    movl    (pPtr), %ebx
    movl    (%ebx, %eax, 4), %edx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_array_values
    call    printf
    addl    $12, %esp

    addl    $1, -8(%ebp)

label_second_for_condition:
    movl    -8(%ebp), %eax
    movl    -4(%ebp), %edx
    cmpl    %edx, %eax
    jl      label_second_for_body
# second for loop ends

    movl    pPtr, %ebx
    pushl   %ebx
    call    free
    addl    $4, %esp

    movl    $0, pPtr

    pushl   $0
    call    exit
