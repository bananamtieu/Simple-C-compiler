main:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$main.size, %eax
	subq	%rax, %rsp
	movl	$100, %eax
	movl	%eax, -12(%rbp)
# Generating cast
	movl	$30, %eax
	movb	%al, %dil
	movb	%dil, -30(%rbp)
# Generating cast
	movl	$2, %eax
	movb	%al, %dil
	movb	%dil, -31(%rbp)
# Generating add
# Generating add
# Generating cast
	movb	-30(%rbp), %al
	movsbl	%al, %eax
	movl	-12(%rbp), %edi
	addl	%eax, %edi
# Generating cast
	movb	-31(%rbp), %al
	movsbl	%al, %eax
	addl	%eax, %edi
	movl	%edi, %eax
	movl	%eax, -4(%rbp)
# Generating cast
# Generating sub
# Generating sub
# Generating cast
	movb	-30(%rbp), %al
	movsbl	%al, %eax
	movl	-12(%rbp), %edi
	subl	%eax, %edi
# Generating cast
	movb	-31(%rbp), %al
	movsbl	%al, %eax
	subl	%eax, %edi
	movslq	%edi, %rdi
	movq	%rdi, %rax
	movq	%rax, -20(%rbp)
# Generating cast
# Generating mul
# Generating mul
# Generating cast
	movb	-30(%rbp), %al
	movsbl	%al, %eax
	movl	-12(%rbp), %edi
	imull	%eax, %edi
# Generating cast
	movb	-31(%rbp), %al
	movsbl	%al, %eax
	imull	%eax, %edi
	movslq	%edi, %rdi
	movq	%rdi, %rax
	movq	%rax, -28(%rbp)
# Generating add
# Generating div
# Generating cast
	movb	-30(%rbp), %al
	movsbl	%al, %eax
	movl	%eax, -35(%rbp)
	movl	-12(%rbp), %eax
	movl	-35(%rbp), %ecx
	cltd
	idivl	%ecx
# Generating cast
	movb	-31(%rbp), %dil
	movsbl	%dil, %edi
	addl	%edi, %eax
	movl	%eax, %edi
	movl	%edi, -8(%rbp)
# Generating cast
# Generating sub
# Generating remainder
# Generating cast
	movb	-30(%rbp), %al
	movsbl	%al, %eax
	movl	%eax, -39(%rbp)
	movl	-12(%rbp), %eax
	movl	-39(%rbp), %ecx
	cltd
	idivl	%ecx
# Generating cast
	movb	-31(%rbp), %al
	movsbl	%al, %eax
	subl	%eax, %edx
	movb	%dl, %al
	movb	%al, -29(%rbp)
# Generating addr (&)
	leaq	.L0, %rax
	movl	-4(%rbp), %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
# Generating addr (&)
	leaq	.L2, %rax
	movq	-20(%rbp), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
# Generating addr (&)
	leaq	.L2, %rax
	movq	-28(%rbp), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
# Generating addr (&)
	leaq	.L0, %rax
	movl	-8(%rbp), %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
# Generating cast
	movb	-29(%rbp), %al
	movsbl	%al, %eax
# Generating addr (&)
	leaq	.L0, %rdi
	movl	%eax, %esi
	movl	$0, %eax
	call	printf

main.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	main.size, 48
	.globl	main

	.data	
.L0:	.asciz	"%d\012"
.L2:	.asciz	"%ld\012"
