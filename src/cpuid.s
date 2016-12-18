.data
desc:
.ascii "CPUID Vendor: 123456789ABC\n"
len = . - desc

.text
.globl _main

_main:
	movl $0, %eax
	cpuid
	movl desc@GOTPCREL(%rip), %edi
	movl %ebx, 14(%edi)
	movl %edx, 18(%edi)
	movl %ecx, 22(%edi)

	movl $0x2000004, %eax	# syscall, write
	movl $1,  %edi			# stdout
	movq desc@GOTPCREL(%rip), %rsi
	movq $len, %rdx
	syscall

	movl $0x2000001, %eax
	movl $0, %ebx
	syscall
	
	leave
	ret

