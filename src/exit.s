.section __TEXT, __text
.globl start

start:
	movl $0x2000001, %eax
	mov $0, %ebx
	syscall
