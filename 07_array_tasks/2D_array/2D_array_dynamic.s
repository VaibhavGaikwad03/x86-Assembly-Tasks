.section .rodata
    msg_main_print_enter_rows_columns:
    .string "Enter value of rows & columns:\t"

    msg_main_scan_one_num:
    .string "%d"

    msg_main_scan_two_nums:
    .string "%d%d"

    msg_main_print_error_msg:
    .string "Memory allocation FAILED"

    msg_main_print_enter_array_values:
    .string "Enter [%d][%d] value:\t"

    msg_main_print_entered_elements_are:
    .string "Entered elements are:\n"

    msg_main_print_array_values:
    .string "[%d][%d] value is:\t%d\n"

.section .text
.globl  main
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $20, %esp
    movl    $0, -20(%ebp)

    pushl   $msg_main_print_enter_rows_columns
    call    printf
    addl    $4, %esp

    leal    -4(%ebp), %eax  # &iRows
    leal    -8(%ebp), %edx  # &iColumns

    pushl   %edx
    pushl   %eax
    pushl   $msg_main_scan_two_nums
    call    scanf
    addl    $12, %esp

    movl    -4(%ebp), %eax  # iRows
    movl    $4, %ecx    
    mull    %ecx

    pushl   %eax
    call    malloc
    addl    $4, %esp
    movl    %eax, -20(%ebp) 

    cmpl    $0, %eax
    je      label_error_code

# outer for loop 1 starts
    movl    $0, -12(%ebp)
    jmp     label_outer_for1_condition

label_outer_for1_body:
    movl    -8(%ebp), %eax  # iColumns
    movl    $4, %edx
    mull    %ecx
    pushl   %eax
    call    malloc
    addl    $4, %esp
    movl    -12(%ebp), %edx
    movl    -20(%ebp), %ebx
    movl    %eax, (%ebx, %edx, 4)

    cmpl    $0, %eax
    je      label_error_code

    # inner for loop 1 starts
    movl    $0, -16(%ebp)
    jmp     label_inner_for1_condition
label_inner_for1_body:
    movl    -12(%ebp), %edx
    pushl   %eax
    pushl   %edx
    pushl   $msg_main_print_enter_array_values
    call    printf
    addl    $12, %esp

    movl    -12(%ebp), %eax
    movl    -20(%ebp), %ebx
    movl    (%ebx, %eax, 4), %ebx
    movl    -16(%ebp), %eax
    leal    (%ebx, %eax, 4), %ebx

    pushl   %ebx
    pushl   $msg_main_scan_one_num
    call    scanf
    addl    $8, %esp

    addl    $1, -16(%ebp)   # iCounter2++

label_inner_for1_condition:
    movl    -16(%ebp), %eax # iCounter2
    movl    -8(%ebp), %edx  # iColumns
    cmpl    %edx, %eax
    jl      label_inner_for1_body
    # inner for loop 1 ends

    addl    $1, -12(%ebp)   # iCounter1++

label_outer_for1_condition:
    movl    -12(%ebp), %eax # iCounter1
    movl    -4(%ebp), %edx  # iRows
    cmpl    %edx, %eax
    jl      label_outer_for1_body
# outer for loop 2 ends

    pushl   $msg_main_print_entered_elements_are
    call    printf
    addl    $4, %esp

# outer for loop 2 starts
    movl    $0, -12(%ebp)
    jmp     label_outer_for2_condition

label_outer_for2_body:
    # inner for loop 2 starts
    movl    $0, -16(%ebp)
    jmp     label_inner_for2_condition
label_inner_for2_body:
    movl    -12(%ebp), %eax
    movl    -20(%ebp), %ebx
    movl    (%ebx, %eax, 4), %ebx
    movl    -16(%ebp), %eax
    movl    (%ebx, %eax, 4), %eax

    movl    -12(%ebp), %edx # iCounter1
    movl    -16(%ebp), %ecx # iCounter2

    pushl   %eax
    pushl   %ecx
    pushl   %edx
    pushl   $msg_main_print_array_values
    call    printf
    addl    $16, %esp

    addl    $1, -16(%ebp)   # iCounter2++

label_inner_for2_condition:
    movl    -16(%ebp), %eax
    movl    -8(%ebp), %edx
    cmpl    %edx, %eax
    jl      label_inner_for2_body
    # inner for loop 2 ends

    addl    $1, -12(%ebp)   # iCounter1++

label_outer_for2_condition:
    movl    -12(%ebp), %eax
    movl    -4(%ebp), %edx
    cmpl    %edx, %eax
    jl      label_outer_for2_body
# outer for loop 2 ends

# for loop starts
    movl    $0, -12(%ebp)
    jmp     label_for_condition 

label_for_body:
    movl    -20(%ebp), %ebx # ppPtr
    movl    (%ebx, %eax, 4), %ebx
    
    pushl   %ebx
    call    free 
    addl    $4, %esp

    movl    -12(%ebp), %eax
    movl    -20(%ebp), %ebx
    movl    $0, (%ebx, %eax, 4)

    addl    $1, -12(%ebp)   # iCounter1++

label_for_condition:    
    movl    -12(%ebp), %eax
    movl    -4(%ebp), %edx
    cmpl    %edx, %eax
    jl      label_for_body 
# for loop ends

    movl    -20(%ebp), %ebx

    pushl   %ebx
    call    free
    addl    $4, %esp
    movl    $0, -20(%ebp)

    pushl   $0
    call    exit

label_error_code:
    pushl   $msg_main_print_error_msg
    call    puts
    addl    $4, %esp

    pushl   $-1
    call    exit
