.section .rodata
	msg_main_print1:
	.string "Enter two numbers : \t"

	msg_main_scan:
	.string "%d %d"

	msg_main_print2:
	.string "In main, %d %d %d\n"

.section .data			#initialized global variable (external linkage)
.globl 	iNo1
.type 	iNo1, @object
.size 	iNo1, 4
.align	4
iNo1:
.int 10

.section .bss
	.comm iNo2, 4, 4	#uninitialized global variable (external linkage)

.section .text
.globl main
.type main, @function
main:
	pushl	%ebp
	movl 	%esp, %ebp

	subl	$4, %esp	#allocating memory for local variable

	pushl	$msg_main_print1
	call 	printf
	addl	$4, %esp

	leal	iNo2, %eax	#moving address of iNo2 into the register
	leal	-4(%ebp), %edx	#moving address of local variable into the register

	pushl 	%edx
	pushl	%eax
	pushl	$msg_main_scan
	call	scanf
	addl	$12, %esp

	movl	iNo1, %eax
	movl	iNo2, %edx
	movl	-4(%ebp), %ecx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print2
	call 	printf
	addl	$16, %esp

	call fun1		#calling fun1 defined in two.s file

	pushl	$0
	call	exit
	









