.section .rodata
    msg_main_print_enter_planes_rows_columns:
    .string "Enter value of planes, rows & columns (< %d, %d, %d):\t"

    msg_main_scan_three_values:
    .string "%d%d%d"

    msg_main_print_enter_values:
    .string "Enter [%d][%d][%d] value:\t"

    msg_main_scan_one_value:
    .string "%d"

    msg_main_print_entered_elements_are:
    .string "Entered elements are:\n"

    msg_main_print_array_values:
    .string "[%d][%d][%d] value is:\t%d\n"
    
.section .text
.globl  main 
.type   main, @function
main:
    andl    $-16, %esp
    pushl   %ebp
    movl    %esp, %ebp

    subl    $50048, %esp

    movl    $msg_main_print_enter_planes_rows_columns, (%esp)
    movl    $5, 4(%esp)
    movl    $50, 8(%esp)
    movl    $50, 12(%esp)
    call    printf

    leal    -4(%ebp), %eax  # &iPlanes
    leal    -8(%ebp), %edx  # &iRows
    leal    -12(%ebp), %ecx # &iColumns

    movl    $msg_main_scan_three_values, (%esp)
    movl    %eax, 4(%esp)
    movl    %edx, 8(%esp)
    movl    %ecx, 12(%esp)
    call    scanf

# for1 starts
    movl    $0, -16(%ebp)
    jmp     label_scan_for1_condition

label_scan_for1_body:
# for2 starts
    movl    $0, -20(%ebp)
    jmp     label_scan_for2_condition

label_scan_for2_body:
# for3 starts
    movl    $0, -24(%ebp)
    jmp     label_scan_for3_condition

label_scan_for3_body:
    movl    -16(%ebp), %edx # iCounter1
    movl    -20(%ebp), %ecx # iCounter2

    movl    $msg_main_print_enter_values, (%esp)
    movl    %edx, 4(%esp)
    movl    %ecx, 8(%esp)
    movl    %eax, 12(%esp)
    call    printf

    movl    $4, %eax    # size of element
    movl    $2500, %ecx # size of 2D array
    mull    %ecx
    movl    -16(%ebp), %ecx
    mull    %ecx
    leal    -50024(%ebp), %ebx
    addl    %eax, %ebx

    movl    $4, %eax    # size of element
    movl    $50, %ecx   # size of 1D array
    mull    %ecx
    movl    -20(%ebp), %ecx
    mull    %ecx
    addl    %eax, %ebx

    movl    -24(%ebp), %eax
    leal    (%ebx, %eax, 4), %ebx

    movl    $msg_main_scan_one_value, (%esp)
    movl    %ebx, 4(%esp)
    call    scanf

    addl    $1, -24(%ebp)   # iCounter3++

label_scan_for3_condition:
    movl    -24(%ebp), %eax
    movl    -12(%ebp), %edx
    cmpl    %edx, %eax
    jl      label_scan_for3_body
# for3 ends
    addl    $1, -20(%ebp)   # iCounter2++

label_scan_for2_condition:
    movl    -20(%ebp), %eax
    movl    -8(%ebp), %edx
    cmpl    %edx, %eax
    jl      label_scan_for2_body
# for 2 ends
    addl    $1, -16(%ebp)   # iCounter1++

label_scan_for1_condition:
    movl    -16(%ebp), %eax
    movl    -4(%ebp), %edx
    cmpl    %edx, %eax
    jl      label_scan_for1_body
# for1 ends

    movl    $msg_main_print_entered_elements_are, (%esp)
    call    printf

    # for1 starts
    movl    $0, -16(%ebp)
    jmp     label_print_for1_condition

label_print_for1_body:
# for2 starts
    movl    $0, -20(%ebp)
    jmp     label_print_for2_condition

label_print_for2_body:
# for3 starts
    movl    $0, -24(%ebp)
    jmp     label_print_for3_condition

label_print_for3_body:

    movl    $4, %eax    # size of element
    movl    $2500, %ecx # size of 2D array
    mull    %ecx
    movl    -16(%ebp), %ecx
    mull    %ecx
    leal    -50024(%ebp), %ebx
    addl    %eax, %ebx

    movl    $4, %eax    # size of element
    movl    $50, %ecx   # size of 1D array
    mull    %ecx
    movl    -20(%ebp), %ecx
    mull    %ecx
    addl    %eax, %ebx

    movl    -24(%ebp), %eax
    movl    (%ebx, %eax, 4), %eax

    movl    -16(%ebp), %edx # iCounter1
    movl    -20(%ebp), %ecx # iCounter2
    movl    -24(%ebp), %ebx # iCounter3

    movl    $msg_main_print_array_values, (%esp)
    movl    %edx, 4(%esp)
    movl    %ecx, 8(%esp)
    movl    %ebx, 12(%esp)
    movl    %eax, 16(%esp)
    call    printf

    addl    $1, -24(%ebp)   # iCounter3++

label_print_for3_condition:
    movl    -24(%ebp), %eax
    movl    -12(%ebp), %edx
    cmpl    %edx, %eax
    jl      label_print_for3_body
# for3 ends
    addl    $1, -20(%ebp)   # iCounter2++

label_print_for2_condition:
    movl    -20(%ebp), %eax
    movl    -8(%ebp), %edx
    cmpl    %edx, %eax
    jl      label_print_for2_body
# for 2 ends
    addl    $1, -16(%ebp)   # iCounter1++

label_print_for1_condition:
    movl    -16(%ebp), %eax
    movl    -4(%ebp), %edx
    cmpl    %edx, %eax
    jl      label_print_for1_body
# for1 ends

    movl    $0, (%esp)
    call    exit
