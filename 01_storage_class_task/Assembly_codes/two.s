.section .rodata
	msg_fun1_print1:
	.string "Enter number : \t"

	msg_fun1_scan:
	.string "%d"
	
	msg_fun1_print2:
	.string "In fun, iNo1 is %d & iNo2 is %d\n"

	msg_fun2_print:
	.string "In static fun2\n"

.section .bss
	.lcomm	iNo1, 4		#uninitialized global variable (internal linkage)

.section .data		
.type	iNo2, @object		#initialized global variable (internal linkage)
.size 	iNo2, 4
.align 	4
iNo2:
.int 40

.section .text
.globl	fun1
.type	fun1, @function
fun1:
	pushl	%ebp
	movl	%esp, %ebp

	pushl	$msg_fun1_print1
	call	printf
	addl	$4, %esp

	leal	iNo1, %eax
	pushl	%eax
	pushl	$msg_fun1_scan
	call	scanf
	addl	$8, %esp
	
	movl	iNo1, %eax
	movl	iNo2, %edx
	pushl	%edx
	pushl	%eax
	pushl	$msg_fun1_print2
	call 	printf
	addl	$12, %esp

	call 	fun2

	movl	%ebp, %esp
	popl	%ebp
	ret
	
.type	fun2, @function
fun2:
	pushl	%ebp
	movl	%esp, %ebp

	pushl	$msg_fun2_print
	call 	printf
	addl	$4, %esp

	movl	%ebp, %esp
	popl	%ebp
	ret










