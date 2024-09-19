insert:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$insert.size, %eax
	subq	%rax, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
# Generating if
# Generating !
	movq	-8(%rbp), %rax
	cmpq	$0, %rax
	sete	%al
	movzbl	%al, %rax
	cmpl	$0, %eax
	je	.L0
# Generating mul
	movq	$3, %rax
	imulq	$8, %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	malloc
	movq	%rax, %rdi
	movq	%rdi, -8(%rbp)
# Generating add
	movq	-8(%rbp), %rax
	addq	$0, %rax
	movq	%rax, %rdi
	movq	-16(%rbp), %rax
	movq	%rax, (%rdi)
# Generating add
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	movq	null, %rax
	movq	%rax, (%rdi)
# Generating add
	movq	-8(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	movq	null, %rax
	movq	%rax, (%rdi)
	jmp	.L1
.L0:
# Generating if
# Generating <
# Generating deference (*)
# Generating add
	movq	-8(%rbp), %rax
	addq	$0, %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdi
	cmpq	%rax, %rdi
	setl	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L2
# Generating deference (*)
# Generating add
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rsi
	movq	%rax, %rdi
	call	insert
# Generating add
	movq	-8(%rbp), %rdi
	addq	$8, %rdi
	movq	%rdi, %rsi
	movq	%rax, %rdi
	movq	%rdi, (%rsi)
	jmp	.L3
.L2:
# Generating if
# Generating >
# Generating deference (*)
# Generating add
	movq	-8(%rbp), %rax
	addq	$0, %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdi
	cmpq	%rax, %rdi
	setg	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L4
# Generating deference (*)
# Generating add
	movq	-8(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rsi
	movq	%rax, %rdi
	call	insert
# Generating add
	movq	-8(%rbp), %rdi
	addq	$16, %rdi
	movq	%rdi, %rsi
	movq	%rax, %rdi
	movq	%rdi, (%rsi)
.L4:
.L3:
.L1:
# Generating return
	movq	-8(%rbp), %rax
	jmp	insert.exit

insert.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	insert.size, 16
	.globl	insert

search:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$search.size, %eax
	subq	%rax, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
# Generating if
# Generating !
	movq	-8(%rbp), %rax
	cmpq	$0, %rax
	sete	%al
	movzbl	%al, %rax
	cmpl	$0, %eax
	je	.L6
# Generating return
	movl	$0, %eax
	jmp	search.exit
.L6:
# Generating if
# Generating <
# Generating deference (*)
# Generating add
	movq	-8(%rbp), %rax
	addq	$0, %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdi
	cmpq	%rax, %rdi
	setl	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L8
# Generating return
# Generating deference (*)
# Generating add
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rsi
	movq	%rax, %rdi
	call	search
	jmp	search.exit
.L8:
# Generating if
# Generating >
# Generating deference (*)
# Generating add
	movq	-8(%rbp), %rax
	addq	$0, %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdi
	cmpq	%rax, %rdi
	setg	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L10
# Generating return
# Generating deference (*)
# Generating add
	movq	-8(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rsi
	movq	%rax, %rdi
	call	search
	jmp	search.exit
.L10:
# Generating return
	movl	$1, %eax
	jmp	search.exit

search.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	search.size, 16
	.globl	search

preorder:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$preorder.size, %eax
	subq	%rax, %rsp
	movq	%rdi, -8(%rbp)
# Generating if
	movq	-8(%rbp), %rax
	cmpq	$0, %rax
	je	.L12
# Generating deference (*)
# Generating add
	movq	-8(%rbp), %rax
	addq	$0, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	%rdi, -16(%rbp)
# Generating deference (*)
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
# Generating addr (&)
	leaq	.L14, %rdi
	movl	%eax, %esi
	movl	$0, %eax
	call	printf
# Generating deference (*)
# Generating add
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	preorder
# Generating deference (*)
# Generating add
	movq	-8(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	preorder
.L12:

preorder.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	preorder.size, 16
	.globl	preorder

inorder:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$inorder.size, %eax
	subq	%rax, %rsp
	movq	%rdi, -8(%rbp)
# Generating if
	movq	-8(%rbp), %rax
	cmpq	$0, %rax
	je	.L16
# Generating deference (*)
# Generating add
	movq	-8(%rbp), %rax
	addq	$0, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movq	%rdi, -16(%rbp)
# Generating deference (*)
# Generating add
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	inorder
# Generating deference (*)
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
# Generating addr (&)
	leaq	.L14, %rdi
	movl	%eax, %esi
	movl	$0, %eax
	call	printf
# Generating deference (*)
# Generating add
	movq	-8(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	inorder
.L16:

inorder.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	inorder.size, 16
	.globl	inorder

main:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$main.size, %eax
	subq	%rax, %rsp
	movl	$0, %eax
	movl	%eax, -52(%rbp)
# Generating while
.L18:
# Generating <
	movl	-52(%rbp), %eax
	cmpl	$8, %eax
	setl	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L19
# Generating add
# Generating addr (&)
	leaq	-48(%rbp), %rax
# Generating mul
# Generating cast
	movl	-52(%rbp), %edi
	movslq	%edi, %rdi
	imulq	$4, %rdi
	addq	%rdi, %rax
	movq	%rax, %rdi
	movl	-52(%rbp), %eax
	movl	%eax, (%rdi)
# Generating add
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %edi
	movl	%edi, -52(%rbp)
	jmp	.L18
.L19:
	movq	null, %rax
	movq	%rax, -8(%rbp)
# Generating addr (&)
# Generating add
# Generating addr (&)
	leaq	-48(%rbp), %rax
	addq	$28, %rax
	movq	%rax, %rsi
	movq	-8(%rbp), %rdi
	call	insert
	movq	%rax, %rdi
	movq	%rdi, -8(%rbp)
# Generating addr (&)
# Generating add
# Generating addr (&)
	leaq	-48(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rsi
	movq	-8(%rbp), %rdi
	call	insert
	movq	%rax, %rdi
	movq	%rdi, -8(%rbp)
# Generating addr (&)
# Generating add
# Generating addr (&)
	leaq	-48(%rbp), %rax
	addq	$4, %rax
	movq	%rax, %rsi
	movq	-8(%rbp), %rdi
	call	insert
	movq	%rax, %rdi
	movq	%rdi, -8(%rbp)
# Generating addr (&)
# Generating add
# Generating addr (&)
	leaq	-48(%rbp), %rax
	addq	$0, %rax
	movq	%rax, %rsi
	movq	-8(%rbp), %rdi
	call	insert
	movq	%rax, %rdi
	movq	%rdi, -8(%rbp)
# Generating addr (&)
# Generating add
# Generating addr (&)
	leaq	-48(%rbp), %rax
	addq	$20, %rax
	movq	%rax, %rsi
	movq	-8(%rbp), %rdi
	call	insert
	movq	%rax, %rdi
	movq	%rdi, -8(%rbp)
# Generating addr (&)
# Generating add
# Generating addr (&)
	leaq	-48(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rsi
	movq	-8(%rbp), %rdi
	call	insert
	movq	%rax, %rdi
	movq	%rdi, -8(%rbp)
# Generating addr (&)
# Generating add
# Generating addr (&)
	leaq	-48(%rbp), %rax
	addq	$12, %rax
	movq	%rax, %rsi
	movq	-8(%rbp), %rdi
	call	insert
	movq	%rax, %rdi
	movq	%rdi, -8(%rbp)
# Generating addr (&)
# Generating add
# Generating addr (&)
	leaq	-48(%rbp), %rax
	addq	$24, %rax
	movq	%rax, %rsi
	movq	-8(%rbp), %rdi
	call	insert
	movq	%rax, %rdi
	movq	%rdi, -8(%rbp)
# Generating addr (&)
	leaq	.L20, %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movq	-8(%rbp), %rdi
	call	preorder
# Generating addr (&)
	leaq	.L22, %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movq	-8(%rbp), %rdi
	call	inorder

main.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	main.size, 64
	.globl	main

	.comm	null, 8
	.data	
.L14:	.asciz	"%d\012"
.L22:	.asciz	"inorder traversal:\012"
.L20:	.asciz	"preorder traversal:\012"
