.data
items:
.long 3,4,5,2,158,13,11,13,4,134,0
.text
.globl _main

# %edi - data index,
# %ebx - largest item so far
# %eax - current item

_main:
	pushq %rbp
	movq %rsp, %rbp

	movq $0, %rdi
	movq items@GOTPCREL(%rip), %rcx
	movl (%rcx, %rdi, 4), %eax
	movl %eax, %ebx

loop:
	cmpl $0, %eax
	je loop_exit
	incq %rdi
	movl (%rcx, %rdi, 4), %eax
	cmpl %ebx, %eax

	jle loop
	movl %eax, %ebx
	jmp loop

loop_exit:

	popq %rbp

	movl $0x2000001, %eax
	movl %ebx, %edi
	syscall



