.section __TEXT, __text
.global start

start:
	movl $0x2000001, %eax
	mov $0, %ebx
	syscall
