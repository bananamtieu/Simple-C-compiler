fib:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$fib.size, %eax
	subq	%rax, %rsp
	movl	%edi, -4(%rbp)
# Generating if
# Generating ||
# Generating ==
	movl	-4(%rbp), %eax
	cmpl	$0, %eax
	sete	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	jne	.L2
# Generating ==
	movl	-4(%rbp), %eax
	cmpl	$1, %eax
	sete	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	jne	.L2
	jmp	.L3
.L2:
	movl	$1, %eax
.L3:
	cmpl	$0, %eax
	je	.L0
# Generating return
	movl	$1, %eax
	jmp	fib.exit
.L0:
# Generating return
# Generating add
# Generating sub
	movl	-4(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	fib
# Generating sub
	movl	-4(%rbp), %edi
	subl	$2, %edi
	movl	%eax, -8(%rbp)
	call	fib
	movl	-8(%rbp), %edi
	addl	%eax, %edi
	movl	%edi, %eax
	jmp	fib.exit

fib.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	fib.size, 16
	.globl	fib

main:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$main.size, %eax
	subq	%rax, %rsp
# Generating addr (&)
	leaq	-4(%rbp), %rax
# Generating addr (&)
	leaq	.L4, %rdi
	movq	%rax, %rsi
	movl	$0, %eax
	call	scanf
	movl	-4(%rbp), %edi
	call	fib
# Generating addr (&)
	leaq	.L6, %rdi
	movl	%eax, %esi
	movl	$0, %eax
	call	printf

main.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	main.size, 16
	.globl	main

	.data	
.L4:	.asciz	"%d"
.L6:	.asciz	"%d\012"
