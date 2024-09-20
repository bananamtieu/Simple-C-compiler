main:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$main.size, %eax
	subq	%rax, %rsp
	movl	$100, %eax
	movl	%eax, -4(%rbp)
	movl	$30, %eax
	movl	%eax, -8(%rbp)
	movl	$2, %eax
	movl	%eax, -12(%rbp)
# Generating add
# Generating add
	movl	-4(%rbp), %eax
	addl	-8(%rbp), %eax
	addl	-12(%rbp), %eax
	movl	%eax, %edi
	movl	%edi, -16(%rbp)
# Generating sub
# Generating sub
	movl	-4(%rbp), %eax
	subl	-8(%rbp), %eax
	subl	-12(%rbp), %eax
	movl	%eax, %edi
	movl	%edi, -20(%rbp)
# Generating mul
# Generating mul
	movl	-4(%rbp), %eax
	imull	-8(%rbp), %eax
	imull	-12(%rbp), %eax
	movl	%eax, %edi
	movl	%edi, -24(%rbp)
# Generating add
# Generating div
	movl	-4(%rbp), %eax
	movl	-8(%rbp), %ecx
	cltd
	idivl	%ecx
	addl	-12(%rbp), %eax
	movl	%eax, %edi
	movl	%edi, -28(%rbp)
# Generating sub
# Generating remainder
	movl	-4(%rbp), %eax
	movl	-8(%rbp), %ecx
	cltd
	idivl	%ecx
	subl	-12(%rbp), %edx
	movl	%edx, %eax
	movl	%eax, -32(%rbp)
# Generating addr (&)
	leaq	.L0, %rax
	movl	-16(%rbp), %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
# Generating addr (&)
	leaq	.L0, %rax
	movl	-20(%rbp), %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
# Generating addr (&)
	leaq	.L0, %rax
	movl	-24(%rbp), %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
# Generating addr (&)
	leaq	.L0, %rax
	movl	-28(%rbp), %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
# Generating addr (&)
	leaq	.L0, %rax
	movl	-32(%rbp), %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf

main.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	main.size, 32
	.globl	main

	.data	
.L0:	.asciz	"%d\012"
