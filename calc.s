lexan:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$lexan.size, %eax
	subq	%rax, %rsp
# Generating if
# Generating ==
	movl	c, %eax
	cmpl	$0, %eax
	sete	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L0
	movl	$0, %eax
	call	getchar
	movl	%eax, %edi
	movl	%edi, c
.L0:
# Generating while
.L2:
# Generating &&
	movl	c, %edi
	movl	$0, %eax
	call	isspace
	cmpl	$0, %eax
	je	.L4
# Generating !=
# Generating cast
	movl	c, %eax
	movslq	%eax, %rax
	movq	%rax, %rdi
	cmpq	$10, %rdi
	setne	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L4
	jmp	.L5
.L4:
	movl	$0, %eax
.L5:
	cmpl	$0, %eax
	je	.L3
	movl	$0, %eax
	call	getchar
	movl	%eax, %edi
	movl	%edi, c
	jmp	.L2
.L3:
# Generating if
# Generating !
	movl	c, %edi
	movl	$0, %eax
	call	isdigit
	movl	%eax, %edi
	cmpl	$0, %edi
	sete	%dil
	movzbl	%dil, %edi
	cmpl	$0, %edi
	je	.L6
	movl	c, %eax
	movl	%eax, -8(%rbp)
	movl	$0, %eax
	movl	%eax, c
# Generating return
	movl	-8(%rbp), %eax
	jmp	lexan.exit
.L6:
	movl	$0, %eax
	movl	%eax, -4(%rbp)
# Generating while
.L8:
	movl	c, %edi
	movl	$0, %eax
	call	isdigit
	cmpl	$0, %eax
	je	.L9
# Generating sub
# Generating add
# Generating mul
	movl	-4(%rbp), %eax
	imull	$10, %eax
	addl	c, %eax
	subl	$48, %eax
	movl	%eax, %edi
	movl	%edi, -4(%rbp)
	movl	c, %edi
	movl	$0, %eax
	call	getchar
	movl	%eax, %edi
	movl	%edi, c
	jmp	.L8
.L9:
	movl	-4(%rbp), %eax
	movl	%eax, lexval
# Generating return
	movl	NUM, %eax
	jmp	lexan.exit

lexan.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	lexan.size, 16
	.globl	lexan

match:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$match.size, %eax
	subq	%rax, %rsp
	movl	%edi, -4(%rbp)
# Generating if
# Generating !=
	movl	lookahead, %eax
	cmpl	-4(%rbp), %eax
	setne	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L10
# Generating addr (&)
	leaq	.L12, %rax
	movl	lookahead, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	$1, %edi
	movl	$0, %eax
	call	exit
.L10:
	call	lexan
	movl	%eax, %edi
	movl	%edi, lookahead

match.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	match.size, 16
	.globl	match

factor:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$factor.size, %eax
	subq	%rax, %rsp
# Generating if
# Generating ==
# Generating cast
	movl	lookahead, %eax
	movslq	%eax, %rax
	movq	%rax, %rdi
	cmpq	$40, %rdi
	sete	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L14
# Generating cast
	movq	$40, %rax
	movl	%eax, %edi
	call	match
	movl	$0, %eax
	call	expr
	movl	%eax, %edi
	movl	%edi, -4(%rbp)
# Generating cast
	movq	$41, %rax
	movl	%eax, %edi
	call	match
# Generating return
	movl	-4(%rbp), %eax
	jmp	factor.exit
.L14:
	movl	lexval, %eax
	movl	%eax, -4(%rbp)
	movl	NUM, %edi
	call	match
# Generating return
	movl	-4(%rbp), %eax
	jmp	factor.exit

factor.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	factor.size, 16
	.globl	factor

term:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$term.size, %eax
	subq	%rax, %rsp
	call	factor
	movl	%eax, %edi
	movl	%edi, -4(%rbp)
# Generating while
.L16:
# Generating ||
# Generating ==
# Generating cast
	movl	lookahead, %eax
	movslq	%eax, %rax
	movq	%rax, %rdi
	cmpq	$42, %rdi
	sete	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	jne	.L18
# Generating ==
# Generating cast
	movl	lookahead, %eax
	movslq	%eax, %rax
	movq	%rax, %rdi
	cmpq	$47, %rdi
	sete	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	jne	.L18
	jmp	.L19
.L18:
	movl	$1, %eax
.L19:
	cmpl	$0, %eax
	je	.L17
# Generating if
# Generating ==
# Generating cast
	movl	lookahead, %eax
	movslq	%eax, %rax
	movq	%rax, %rdi
	cmpq	$42, %rdi
	sete	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L20
# Generating cast
	movq	$42, %rax
	movl	%eax, %edi
	call	match
# Generating mul
	call	factor
	movl	-4(%rbp), %edi
	imull	%eax, %edi
	movl	%edi, %eax
	movl	%eax, -4(%rbp)
	jmp	.L21
.L20:
# Generating cast
	movq	$47, %rax
	movl	%eax, %edi
	call	match
# Generating div
	call	factor
	movl	%eax, -8(%rbp)
	movl	-4(%rbp), %eax
	movl	-8(%rbp), %ecx
	cltd
	idivl	%ecx
	movl	%eax, %edi
	movl	%edi, -4(%rbp)
.L21:
	jmp	.L16
.L17:
# Generating return
	movl	-4(%rbp), %eax
	jmp	term.exit

term.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	term.size, 16
	.globl	term

expr:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$expr.size, %eax
	subq	%rax, %rsp
	call	term
	movl	%eax, %edi
	movl	%edi, -4(%rbp)
# Generating while
.L22:
# Generating ||
# Generating ==
# Generating cast
	movl	lookahead, %eax
	movslq	%eax, %rax
	movq	%rax, %rdi
	cmpq	$43, %rdi
	sete	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	jne	.L24
# Generating ==
# Generating cast
	movl	lookahead, %eax
	movslq	%eax, %rax
	movq	%rax, %rdi
	cmpq	$45, %rdi
	sete	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	jne	.L24
	jmp	.L25
.L24:
	movl	$1, %eax
.L25:
	cmpl	$0, %eax
	je	.L23
# Generating if
# Generating ==
# Generating cast
	movl	lookahead, %eax
	movslq	%eax, %rax
	movq	%rax, %rdi
	cmpq	$43, %rdi
	sete	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L26
# Generating cast
	movq	$43, %rax
	movl	%eax, %edi
	call	match
# Generating add
	call	term
	movl	-4(%rbp), %edi
	addl	%eax, %edi
	movl	%edi, %eax
	movl	%eax, -4(%rbp)
	jmp	.L27
.L26:
# Generating cast
	movq	$45, %rax
	movl	%eax, %edi
	call	match
# Generating sub
	call	term
	movl	-4(%rbp), %edi
	subl	%eax, %edi
	movl	%edi, %eax
	movl	%eax, -4(%rbp)
.L27:
	jmp	.L22
.L23:
# Generating return
	movl	-4(%rbp), %eax
	jmp	expr.exit

expr.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	expr.size, 16
	.globl	expr

main:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$main.size, %eax
	subq	%rax, %rsp
	movl	$256, %eax
	movl	%eax, NUM
	call	lexan
	movl	%eax, %edi
	movl	%edi, lookahead
# Generating while
.L28:
# Generating !=
# Generating negate (-)
	movl	$1, %eax
	negl	%eax
	movl	lookahead, %edi
	cmpl	%eax, %edi
	setne	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L29
	call	expr
	movl	%eax, %edi
	movl	%edi, -4(%rbp)
# Generating addr (&)
	leaq	.L30, %rax
	movl	-4(%rbp), %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
# Generating while
.L32:
# Generating ==
# Generating cast
	movl	lookahead, %eax
	movslq	%eax, %rax
	movq	%rax, %rdi
	cmpq	$10, %rdi
	sete	%al
	movzbl %al, %eax
	cmpl	$0, %eax
	je	.L33
# Generating cast
	movq	$10, %rax
	movl	%eax, %edi
	call	match
	jmp	.L32
.L33:
	jmp	.L28
.L29:

main.exit:
	movq	%rbp, %rsp
	popq	%rbp
	ret

	.set	main.size, 16
	.globl	main

	.comm	NUM, 4
	.comm	lookahead, 4
	.comm	c, 4
	.comm	lexval, 4
	.data	
.L30:	.asciz	"%d\012"
.L12:	.asciz	"syntax error at %d\012"
