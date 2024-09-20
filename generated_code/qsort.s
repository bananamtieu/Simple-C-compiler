readarray:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$readarray.size, %eax
	subq	%rax, %rsp
	movl	$0, %eax
	movl	%eax, -4(%rbp)
# Generating while
.L0:
# Generating <
	movl	-4(%rbp), %eax
	cmpl	n, %eax
	setl	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L1
# Generating addr (&)
# Generating add
# Generating mul
# Generating cast
	movl	-4(%rbp), %eax
	movslq	%eax, %rax
	imulq	$4, %rax
	movq	a, %rdi
	addq	%rax, %rdi
# Generating addr (&)
	leaq	.L2, %rax
	movq	%rdi, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	scanf
# Generating add
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %edi
	movl	%edi, -4(%rbp)
	jmp	.L0
.L1:

readarray.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	readarray.size, 16
	.globl	readarray

writearray:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$writearray.size, %eax
	subq	%rax, %rsp
	movl	$0, %eax
	movl	%eax, -4(%rbp)
# Generating while
.L4:
# Generating <
	movl	-4(%rbp), %eax
	cmpl	n, %eax
	setl	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L5
# Generating deference (*)
# Generating add
# Generating mul
# Generating cast
	movl	-4(%rbp), %eax
	movslq	%eax, %rax
	imulq	$4, %rax
	movq	a, %rdi
	addq	%rax, %rdi
	movl	(%rdi), %edi
# Generating addr (&)
	leaq	.L6, %rax
	movl	%edi, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
# Generating add
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %edi
	movl	%edi, -4(%rbp)
	jmp	.L4
.L5:
# Generating addr (&)
	leaq	.L8, %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf

writearray.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	writearray.size, 16
	.globl	writearray

exchange:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$exchange.size, %eax
	subq	%rax, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
# Generating deference (*)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	movl	%edi, -20(%rbp)
# Generating deference (*)
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	movq	-8(%rbp), %rdi
	movl	%eax, %esi
	movl	%esi, (%rdi)
	movq	-16(%rbp), %rax
	movl	-20(%rbp), %edi
	movl	%edi, (%rax)

exchange.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	exchange.size, 32
	.globl	exchange

partition:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$partition.size, %eax
	subq	%rax, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
# Generating deference (*)
# Generating add
# Generating mul
# Generating cast
	movl	-12(%rbp), %eax
	movslq	%eax, %rax
	imulq	$4, %rax
	movq	-8(%rbp), %rdi
	addq	%rax, %rdi
	movl	(%rdi), %edi
	movl	%edi, %eax
	movl	%eax, -28(%rbp)
# Generating sub
	movl	-12(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	movl	%edi, -20(%rbp)
# Generating add
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %edi
	movl	%edi, -24(%rbp)
# Generating while
.L10:
# Generating <
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	setl	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L11
# Generating sub
	movl	-24(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	movl	%edi, -24(%rbp)
# Generating while
.L12:
# Generating >
# Generating deference (*)
# Generating add
# Generating mul
# Generating cast
	movl	-24(%rbp), %eax
	movslq	%eax, %rax
	imulq	$4, %rax
	movq	-8(%rbp), %rdi
	addq	%rax, %rdi
	movl	(%rdi), %edi
	movl	%edi, %eax
	cmpl	-28(%rbp), %eax
	setg	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L13
# Generating sub
	movl	-24(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	movl	%edi, -24(%rbp)
	jmp	.L12
.L13:
# Generating add
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %edi
	movl	%edi, -20(%rbp)
# Generating while
.L14:
# Generating <
# Generating deference (*)
# Generating add
# Generating mul
# Generating cast
	movl	-20(%rbp), %eax
	movslq	%eax, %rax
	imulq	$4, %rax
	movq	-8(%rbp), %rdi
	addq	%rax, %rdi
	movl	(%rdi), %edi
	movl	%edi, %eax
	cmpl	-28(%rbp), %eax
	setl	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L15
# Generating add
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %edi
	movl	%edi, -20(%rbp)
	jmp	.L14
.L15:
# Generating if
# Generating <
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	setl	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L16
# Generating addr (&)
# Generating add
# Generating mul
# Generating cast
	movl	-24(%rbp), %eax
	movslq	%eax, %rax
	imulq	$4, %rax
	movq	-8(%rbp), %rdi
	addq	%rax, %rdi
# Generating addr (&)
# Generating add
# Generating mul
# Generating cast
	movl	-20(%rbp), %eax
	movslq	%eax, %rax
	imulq	$4, %rax
	movq	-8(%rbp), %rsi
	addq	%rax, %rsi
	movq	%rsi, -36(%rbp)
	movq	%rdi, %rsi
	movq	-36(%rbp), %rdi
	call	exchange
.L16:
	jmp	.L10
.L11:
# Generating return
	movl	-24(%rbp), %eax
	jmp	partition.exit

partition.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	partition.size, 48
	.globl	partition

quicksort:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$quicksort.size, %eax
	subq	%rax, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
# Generating if
# Generating >
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	setg	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L18
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %esi
	movq	-8(%rbp), %rdi
	call	partition
	movl	%eax, %edi
	movl	%edi, -20(%rbp)
	movl	-20(%rbp), %edx
	movl	-12(%rbp), %esi
	movq	-8(%rbp), %rdi
	call	quicksort
# Generating add
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	-16(%rbp), %edx
	movl	%eax, %esi
	movq	-8(%rbp), %rdi
	call	quicksort
.L18:

quicksort.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	quicksort.size, 32
	.globl	quicksort

main:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$main.size, %eax
	subq	%rax, %rsp
	movl	$8, %eax
	movl	%eax, n
# Generating mul
# Generating cast
	movl	n, %eax
	movslq	%eax, %rax
	imulq	$4, %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	malloc
	movq	%rax, %rdi
	movq	%rdi, a
	call	readarray
# Generating sub
	movl	n, %eax
	subl	$1, %eax
	movl	%eax, %edx
	movl	$0, %esi
	movq	a, %rdi
	call	quicksort
	call	writearray

main.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	main.size, 0
	.globl	main

	.comm	n, 4
	.comm	a, 8
	.data	
.L8:	.asciz	"\012"
.L2:	.asciz	"%d"
.L6:	.asciz	"%d "
