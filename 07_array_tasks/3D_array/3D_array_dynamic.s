.section .rodata
    msg_main_print_enter_planes_rows_columns:
    .string "Enter value of planes, rows & columns:\t"

    msg_main_scan_three_elements:
    .string "%d%d%d"

    msg_main_print_error_code:
    .string "Memory allocation FAILED"

    msg_main_print_enter_values:
    .string "Enter [%d][%d][%d] value:\t"

    msg_main_scan_one_element:
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

    subl    $48, %esp

    movl    $msg_main_print_enter_planes_rows_columns, (%esp)
    call    printf

    leal    -4(%ebp), %eax  # &iPlanes
    leal    -8(%ebp), %edx  # &iRows
    leal    -12(%ebp), %ecx # &iColumns

    movl    $msg_main_scan_three_elements, (%esp)
    movl    %eax, 4(%esp)
    movl    %edx, 8(%esp)
    movl    %ecx, 12(%esp)
    call    scanf

    movl    -4(%ebp), %eax
    movl    $4, %ecx
    mull    %ecx

    movl    %eax, (%esp)
    call    malloc
    movl    %eax, -28(%ebp)

    cmpl    $0, %eax
    je      label_error_code

    movl    $0, -16(%ebp)
    jmp     label_scan_for1_condition

label_scan_for1_body:
    movl    -8(%ebp), %eax
    movl    $4, %ecx
    mull    %ecx

    movl    %eax, (%esp)
    call    malloc
    movl    -28(%ebp), %ebx
    movl    -16(%ebp), %edx
    movl    %eax, (%ebx, %edx, 4)
    cmpl    $0, %eax
    je      label_error_code

    movl    $0, -20(%ebp)
    jmp     label_scan_for2_condition

label_scan_for2_body:
    movl    -12(%ebp), %eax
    movl    $4, %ecx
    mull    %ecx

    movl    %eax, (%esp)
    call    malloc
    movl    -28(%ebp), %ebx
    movl    -16(%ebp), %edx
    movl    (%ebx, %edx, 4), %ebx
    movl    -20(%ebp), %edx
    movl    %eax, (%ebx, %edx, 4)
    cmpl    $0, %eax
    je      label_error_code

    movl    $0, -24(%ebp)
    jmp     label_scan_for3_condition

label_scan_for3_body:
    movl    -16(%ebp), %edx
    movl    -20(%ebp), %ecx

    movl    $msg_main_print_enter_values, (%esp)
    movl    %edx, 4(%esp)
    movl    %ecx, 8(%esp)
    movl    %eax, 12(%esp)
    call    printf

    movl    -28(%ebp), %ebx
    movl    -16(%ebp), %eax
    movl    (%ebx, %eax, 4), %ebx
    movl    -20(%ebp), %eax
    movl    (%ebx, %eax, 4), %ebx
    movl    -24(%ebp), %eax
    leal    (%ebx, %eax, 4), %ebx

    movl    $msg_main_scan_one_element, (%esp)
    movl    %ebx, 4(%esp)
    call    scanf

    addl    $1, -24(%ebp)   # iCounter3++

label_scan_for3_condition:
    movl    -24(%ebp), %eax
    movl    -12(%ebp), %edx
    cmpl    %edx, %eax
    jl      label_scan_for3_body

    addl    $1, -20(%ebp)   # iCounter2++

label_scan_for2_condition:
    movl    -20(%ebp), %eax
    movl    -8(%ebp), %edx
    cmpl    %edx, %eax
    jl      label_scan_for2_body

    addl    $1, -16(%ebp)    # iCounter1++

label_scan_for1_condition:
    movl    -16(%ebp), %eax
    movl    -4(%ebp), %edx
    cmpl    %edx, %eax
    jl      label_scan_for1_body

    movl    $msg_main_print_entered_elements_are, (%esp)
    call    printf

    movl    $0, -16(%ebp)
    jmp     label_print_for1_condition

label_print_for1_body:
    movl    $0, -20(%ebp)
    jmp     label_print_for2_condition

label_print_for2_body:
    movl    $0, -24(%ebp)
    jmp     label_print_for3_condition

label_print_for3_body:
    movl    -16(%ebp), %eax
    movl    -20(%ebp), %edx
    movl    -24(%ebp), %ecx
    movl    -28(%ebp), %ebx

    movl    $msg_main_print_array_values, (%esp)
    movl    %eax, 4(%esp)
    movl    %edx, 8(%esp)
    movl    %ecx, 12(%esp)

    movl    (%ebx, %eax, 4), %ebx
    movl    (%ebx, %edx, 4), %ebx
    movl    (%ebx, %ecx, 4), %eax

    movl    %eax, 16(%esp)
    call    printf

    addl    $1, -24(%ebp)

label_print_for3_condition:
    movl    -24(%ebp), %eax
    movl    -12(%ebp), %edx
    cmpl    %edx, %eax
    jl      label_print_for3_body

    addl    $1, -20(%ebp)

label_print_for2_condition:
    movl    -20(%ebp), %eax
    movl    -8(%ebp), %edx
    cmpl    %edx, %eax
    jl      label_print_for2_body

    addl    $1, -16(%ebp)

label_print_for1_condition:
    movl    -16(%ebp), %eax
    movl    -4(%ebp), %edx
    cmpl    %edx, %eax
    jl      label_print_for1_body

    movl    $0, -16(%ebp)
    jmp     label_free_for1_condition


label_free_for1_body:
    movl    $0, -20(%ebp)
    jmp     label_free_for2_condition

label_free_for2_body:
    movl    -16(%ebp), %edx
    movl    -28(%ebp), %ebx
    movl    (%ebx, %edx, 4), %ebx
    movl    (%ebx, %eax, 4), %ebx
    
    movl    %ebx, (%esp)
    call    free

    movl    -16(%ebp), %eax
    movl    -28(%ebp), %ebx
    movl    (%ebx, %eax, 4), %ebx
    movl    -20(%ebp), %eax
    movl    $0, (%ebx, %eax, 4)

    addl    $1, -20(%ebp)

label_free_for2_condition:
    movl    -20(%ebp), %eax
    movl    -8(%ebp), %edx
    cmpl    %edx, %eax
    jl      label_free_for2_body

    movl    -16(%ebp), %eax
    movl    -28(%ebp), %ebx
    movl    (%ebx, %eax, 4), %ebx

    movl    %ebx, (%esp)
    call    free

    addl    $1, -16(%ebp)

label_free_for1_condition:
    movl    -16(%ebp), %eax
    movl    -4(%ebp), %edx
    cmpl    %edx, %eax
    jl      label_free_for1_body

    movl    -28(%ebp), %ebx
    movl    %ebx, (%esp)
    call    free

    movl    $0, -28(%ebp)

    movl    $0, (%esp)
    call    exit

label_error_code:
    movl    $msg_main_print_error_code, (%esp)
    call    puts

    movl    $-1, (%esp)
    call    exit
