.section .text
.globl  mystrlen
.type   mystrlen, @function
mystrlen:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp
    movl    $0, -4(%ebp)

    movl    8(%ebp), %esi   # string address
    movl    $50, %ecx       # loop counter (any value)
    cld                     # clearing direction flag
loop_label_mystrlen:
    lodsb                   # %esi value to al
    cmpb    $0, %al
    je      loop_label_mystrlen_out
    addl    $1, -4(%ebp)
    loop    loop_label_mystrlen

loop_label_mystrlen_out:
    movl    -4(%ebp), %eax

    movl    %ebp, %esp
    popl    %ebp
    ret
    