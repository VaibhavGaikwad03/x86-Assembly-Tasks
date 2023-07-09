.section .rodata
    msg_main_print_enter_rows_columns:
    .string "Enter value of rows & columns (< %d):\t"

    msg_main_scan_one_number:
    .string "%d"

    msg_main_scan_two_numbers:
    .string "%d%d"

    msg_main_print_enter_value:
    .string "Enter [%d][%d] value:\t"

    msg_main_print_entered_elements_are:
    .string "Entered elements are :\n"

    msg_main_print_array_values:
    .string "[%d][%d] value is:\t%d\n"

.section .text
.globl  main 
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $10016, %esp

    pushl   $50
    pushl   $msg_main_print_enter_rows_columns
    call    printf
    addl    $8, %esp

    leal    -4(%ebp), %eax  # iRows
    leal    -8(%ebp), %edx  # iColumns

    pushl   %edx
    pushl   %eax
    pushl   $msg_main_scan_two_numbers
    call    scanf
    addl    $12, %esp

# outer for loop starts
    movl    $0, -12(%ebp)   # iCounter1 = 0
    jmp     label_scan_for1_condition

label_scan_for1_body:

    # inner for loop starts
    movl    $0, -16(%ebp)   # iCounter2 = 0
    jmp     label_scan_for2_condition

label_scan_for2_body:
    movl    -12(%ebp), %edx # iCounter1 kadhun ghetla push karnyasathi

    pushl   %eax
    pushl   %edx
    pushl   $msg_main_print_enter_value
    call    printf
    addl    $12, %esp

    movl    $4, %eax    # size of element
    movl    $50, %ecx   # no of elements
    mull    %ecx
    movl    -12(%ebp), %ecx # index (iCounter1)
    mull    %ecx
    leal    -10016(%ebp), %ebx
    addl    %eax, %ebx
    movl    -16(%ebp), %eax # index (iCounter2)
    leal    (%ebx, %eax, 4), %ebx
    pushl   %ebx
    pushl   $msg_main_scan_one_number
    call    scanf
    addl    $8, %esp

    addl    $1, -16(%ebp)   # iCounter2++

label_scan_for2_condition:
    movl    -16(%ebp), %eax # iCounter2
    movl    -8(%ebp), %edx  # iColumns
    cmpl    %edx, %eax
    jl      label_scan_for2_body
    # inner for loop ends

    addl    $1, -12(%ebp)   # iCounter1++

label_scan_for1_condition:
    movl    -12(%ebp), %eax # iCounter1
    movl    -4(%ebp), %edx  # iRows
    cmpl    %edx, %eax
    jl      label_scan_for1_body
# outer for loop ends

    pushl   $msg_main_print_entered_elements_are
    call    printf
    addl    $4, %esp

# outer for loop starts

    movl    $0, -12(%ebp)   # iCounter1 = 0
    jmp     label_print_for1_condition

label_print_for1_body:
    # inner for loop starts
    movl    $0, -16(%ebp)   # iCounter2 = 0
    jmp     label_print_for2_condition

label_print_for2_body:

    movl    $4, %eax    # size of element
    movl    $50, %ecx   # no of elements
    mull    %ecx
    movl    -12(%ebp), %ecx # index (iCounter1)
    mull    %ecx
    leal    -10016(%ebp), %ebx
    addl    %eax, %ebx
    movl    -16(%ebp), %eax # index (iCounter2)
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

label_print_for2_condition:
    movl    -16(%ebp), %eax # iCounter2
    movl    -8(%ebp), %edx  # iColumns
    cmpl    %edx, %eax
    jl      label_print_for2_body
    # inner for loop ends

    addl    $1, -12(%ebp)   # iCounter1++

label_print_for1_condition:
    movl    -12(%ebp), %eax # iCounter1
    movl    -4(%ebp), %edx  # iRows
    cmpl    %edx, %eax
    jl      label_print_for1_body

# outer for loop ends
    pushl   $0
    call    exit

