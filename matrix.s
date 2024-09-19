allocate:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$allocate.size, %eax
	subq	%rax, %rsp
	movl	%edi, -4(%rbp)
# Generating mul
# Generating cast
	movl	-4(%rbp), %eax
	movslq	%eax, %rax
	imulq	$8, %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	malloc
	movq	%rax, %rdi
	movq	%rdi, -16(%rbp)
# Generating for
	movl	$0, %eax
	movl	%eax, -8(%rbp)
.L0:
# Generating <
	movl	-8(%rbp), %eax
	cmpl	-4(%rbp), %eax
	setl	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L1
# Generating mul
# Generating cast
	movl	-4(%rbp), %eax
	movslq	%eax, %rax
	imulq	$4, %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	malloc
# Generating add
# Generating mul
# Generating cast
	movl	-8(%rbp), %edi
	movslq	%edi, %rdi
	imulq	$8, %rdi
	movq	-16(%rbp), %rsi
	addq	%rdi, %rsi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	movq	%rsi, (%rdi)
# Generating add
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %edi
	movl	%edi, -8(%rbp)
	jmp	.L0
.L1:
# Generating return
	movq	-16(%rbp), %rax
	jmp	allocate.exit

allocate.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	allocate.size, 16
	.globl	allocate

initialize:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$initialize.size, %eax
	subq	%rax, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
# Generating for
	movl	$0, %eax
	movl	%eax, -16(%rbp)
.L2:
# Generating <
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	setl	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L3
# Generating for
	movl	$0, %eax
	movl	%eax, -20(%rbp)
.L4:
# Generating <
	movl	-20(%rbp), %eax
	cmpl	-12(%rbp), %eax
	setl	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L5
# Generating add
	movl	-16(%rbp), %eax
	addl	-20(%rbp), %eax
# Generating add
# Generating deference (*)
# Generating add
# Generating mul
# Generating cast
	movl	-16(%rbp), %edi
	movslq	%edi, %rdi
	imulq	$8, %rdi
	movq	-8(%rbp), %rsi
	addq	%rdi, %rsi
	movq	(%rsi), %rsi
# Generating mul
# Generating cast
	movl	-20(%rbp), %edi
	movslq	%edi, %rdi
	imulq	$4, %rdi
	addq	%rdi, %rsi
	movq	%rsi, %rdi
	movl	%eax, %esi
	movl	%esi, (%rdi)
# Generating add
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %edi
	movl	%edi, -20(%rbp)
	jmp	.L4
.L5:
# Generating add
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %edi
	movl	%edi, -16(%rbp)
	jmp	.L2
.L3:

initialize.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	initialize.size, 32
	.globl	initialize

display:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$display.size, %eax
	subq	%rax, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	$0, %eax
	movl	%eax, -16(%rbp)
# Generating while
.L6:
# Generating <
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	setl	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L7
	movl	$0, %eax
	movl	%eax, -20(%rbp)
# Generating while
.L8:
# Generating <
	movl	-20(%rbp), %eax
	cmpl	-12(%rbp), %eax
	setl	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L9
# Generating deference (*)
# Generating add
# Generating mul
# Generating cast
	movl	-16(%rbp), %eax
	movslq	%eax, %rax
	imulq	$8, %rax
	movq	-8(%rbp), %rdi
	addq	%rax, %rdi
	movq	(%rdi), %rdi
	movq	%rdi, %rax
	movq	%rax, -28(%rbp)
# Generating deference (*)
# Generating add
# Generating mul
# Generating cast
	movl	-20(%rbp), %eax
	movslq	%eax, %rax
	imulq	$4, %rax
	movq	-28(%rbp), %rdi
	addq	%rax, %rdi
	movl	(%rdi), %edi
# Generating addr (&)
	leaq	.L10, %rax
	movl	%edi, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
# Generating add
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %edi
	movl	%edi, -20(%rbp)
	jmp	.L8
.L9:
# Generating add
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %edi
	movl	%edi, -16(%rbp)
# Generating addr (&)
	leaq	.L12, %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	jmp	.L6
.L7:

display.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	display.size, 32
	.globl	display

deallocate:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$deallocate.size, %eax
	subq	%rax, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	$0, %eax
	movl	%eax, -16(%rbp)
# Generating while
.L14:
# Generating <
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	setl	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L15
# Generating deference (*)
# Generating add
# Generating mul
# Generating cast
	movl	-16(%rbp), %eax
	movslq	%eax, %rax
	imulq	$8, %rax
	movq	-8(%rbp), %rdi
	addq	%rax, %rdi
	movq	(%rdi), %rdi
	movl	$0, %eax
	call	free
# Generating add
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %edi
	movl	%edi, -16(%rbp)
	jmp	.L14
.L15:
	movq	-8(%rbp), %rdi
	movl	$0, %eax
	call	free

deallocate.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	deallocate.size, 16
	.globl	deallocate

main:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$main.size, %eax
	subq	%rax, %rsp
# Generating addr (&)
	leaq	-12(%rbp), %rax
# Generating addr (&)
	leaq	.L16, %rdi
	movq	%rax, %rsi
	movl	$0, %eax
	call	scanf
	movl	-12(%rbp), %edi
	call	allocate
	movq	%rax, %rdi
	movq	%rdi, -8(%rbp)
	movl	-12(%rbp), %esi
	movq	-8(%rbp), %rdi
	call	initialize
	movl	-12(%rbp), %esi
	movq	-8(%rbp), %rdi
	call	display
	movl	-12(%rbp), %esi
	movq	-8(%rbp), %rdi
	call	deallocate

main.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	main.size, 16
	.globl	main

	.data	
.L12:	.asciz	"\012"
.L16:	.asciz	"%d"
.L10:	.asciz	"%d "
