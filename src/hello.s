.section __DATA, __data
_msg: .asciz "Hello, world\n"
len = . - _msg

.section __TEXT, __text
.globl _main
_main:

	movl $0x2000004, %eax 	# SYSCALL_CLASS_UNIX(2) << SYSCALL_CLASS_SHIFT(24) | 4 (write)
	movl $1, %edi 			# STDOUT
	leaq _msg(%rip), %rsi
	mov $13, %rdx
	syscall

	movl $0x2000001, %eax 	# SYSCALL_CLASS_UNIX(2) << SYSCALL_CLASS_SHIFT(24) | 1 (exit)
	movl $0, %ebx 			# EXIT_SUCCESS
	syscall


