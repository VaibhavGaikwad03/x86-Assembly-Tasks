.section .rodata
    msg_main_print_enter_obj2_values:
    .string "Enter obj2 values,\n"

    msg_main_print_enter_char:
    .string "Enter chChar\t:"

    msg_main_scan_char:
    .string "%c"

    msg_main_print_enter_int:
    .string "Enter iNo\t:"

    msg_main_scan_int:
    .string "%d"

    msg_main_print_enter_short_int:
    .string "Enter shiNo\t:"

    msg_main_scan_shot_int:
    .string "%hd"

    msg_main_print_obj2_is:
    .string "obj2 is\n"

    msg_main_print_values:
    .string "chChar = %c, iNo = %d, shiNo = %hd\n"

    msg_main_print_obj1_is:
    .string "\nobj1 is\n"

    msg_main_print_obj3_is:
    .string "obj3 is\n"

.section .bss
    .comm   obj1, 12, 4

.section .text
.globl  main 
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $24, %esp

    pushl   $msg_main_print_enter_obj2_values
    call    printf
    addl    $4, %esp

    pushl   $msg_main_print_enter_char
    call    printf
    addl    $4, %esp

    # scan obj2.chChar
    leal    -12(%ebp), %ebx
    pushl   %ebx
    pushl   $msg_main_scan_char
    call    scanf
    addl    $8, %esp

    pushl   $msg_main_print_enter_int
    call    printf
    addl    $4, %esp

    # scan obj2.iNo
    leal    -12(%ebp), %ebx
    leal    4(%ebx), %ebx
    pushl   %ebx
    pushl   $msg_main_scan_int
    call    scanf
    addl    $8 ,%esp

    pushl   $msg_main_print_enter_short_int
    call    printf
    addl    $4, %esp

    # scan obj2.shiNo
    leal    -12(%ebp), %ebx
    leal    8(%ebx), %ebx
    pushl   %ebx
    pushl   $msg_main_scan_shot_int
    call    scanf
    addl    $8, %esp

    # print obj2 values
    pushl   $msg_main_print_obj2_is
    call    printf
    addl    $4, %esp

    leal    -12(%ebp), %ebx
    movl    (%ebx), %ecx    # chChar
    movl    4(%ebx), %eax   # iNo
    movl    8(%ebx), %edx   # shiNo

    pushl   %edx
    pushl   %eax
    pushl   %ecx
    pushl   $msg_main_print_values
    call    printf
    addl    $16, %esp

    # obj1 = obj2

    leal    -12(%ebp), %ebx
    movl    (%ebx), %eax
    movl    $obj1, %ebx
    movl    %eax, (%ebx)

    leal    -12(%ebp), %ebx
    movl    4(%ebx), %eax
    movl    $obj1, %ebx
    movl    %eax, 4(%ebx)

    leal    -12(%ebp), %ebx
    movl    8(%ebx), %eax
    movl    $obj1, %ebx
    movl    %eax, 8(%ebx)

    # obj3 = obj2

    leal    -12(%ebp), %ebx
    movl    (%ebx), %eax
    leal    -24(%ebp), %ebx
    movl    %eax, (%ebx)

    leal    -12(%ebp), %ebx
    movl    4(%ebx), %eax
    leal    -24(%ebp), %ebx
    movl    %eax, 4(%ebx)

    leal    -12(%ebp), %ebx
    movl    8(%ebx), %eax
    leal    -24(%ebp), %ebx
    movl    %eax, 8(%ebx)

    # print obj1 values
    pushl   $msg_main_print_obj1_is
    call    printf
    addl    $4, %esp

    movl    $obj1, %ebx
    movl    (%ebx), %eax
    movl    4(%ebx), %edx
    movl    8(%ebx), %ecx

    pushl   %ecx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_values
    call    printf
    addl    $16, %esp

    # print obj3 values
    pushl   $msg_main_print_obj3_is
    call    printf
    addl    $4, %esp

    leal    -24(%ebp), %ebx
    movl    (%ebx), %eax
    movl    4(%ebx), %edx
    movl    8(%ebx), %ecx

    pushl   %ecx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_values
    call    printf
    addl    $16, %esp

    pushl   $0
    call    exit

