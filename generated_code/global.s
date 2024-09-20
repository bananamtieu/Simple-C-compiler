foo:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$foo.size, %eax
	subq	%rax, %rsp
# Generating add
	movl	x, %eax
	addl	$1, %eax
	movl	%eax, %edi
	movl	%edi, x
# Generating return
# Generating add
	movl	x, %eax
	addl	$1, %eax
	jmp	foo.exit

foo.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	foo.size, 0
	.globl	foo

main:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$main.size, %eax
	subq	%rax, %rsp
	movl	$65, %eax
	movl	%eax, x
	movl	x, %edi
	movl	$0, %eax
	call	putchar
	call	foo
	movl	%eax, %edi
	movl	$0, %eax
	call	putchar
	movl	x, %edi
	movl	$0, %eax
	call	putchar
	movl	$10, %edi
	movl	$0, %eax
	call	putchar

main.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	main.size, 0
	.globl	main

	.comm	x, 4
	.data	
