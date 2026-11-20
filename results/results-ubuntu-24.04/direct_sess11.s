deflate_direct:
.LFB6549:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14
	movq	%rcx, %rsi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$168, %rsp
	.cfi_def_cfa_offset 224
	movzbl	68016(%rdi), %eax
	movq	%rcx, 96(%rsp)
	movl	1104(%rbx), %ecx
	movq	%rdi, 56(%rsp)
	leaq	(%r14,%rdx), %rdi
	movl	%ecx, %edx
	movq	%rdi, 24(%rsp)
	andl	$7, %ecx
	shrl	$3, %edx
	movl	%ecx, %r15d
	leaq	(%rsi,%rdx), %rdi
	movl	$-1, %esi
	sall	%cl, %esi
	cmpb	$0, 68017(%rbx)
	movq	%rdi, 8(%rsp)
	movl	%esi, %ecx
	notl	%ecx
	movl	%ecx, %r13d
	je	.L81
	testb	%r8b, %r8b
	je	.L82
	cmpb	$13, %al
	je	.L821
	movq	56(%rsp), %rdi
	movq	%rdx, 16(%rsp)
	leaq	5316(%rdi), %rsi
	leaq	56(%rdi), %rbx
	leaq	74080(%rdi), %rbp
	movq	96(%rsp), %rdi
	call	memcpy@PLT
	movq	56(%rsp), %rdi
	movq	16(%rsp), %rdx
	movl	%r13d, %eax
	movl	$32768, %ecx
	andb	5316(%rdi,%rdx), %al
	movl	$0, 1124(%rdi)
	movl	32(%rdi), %edi
	movzbl	%al, %eax
	subq	%rdi, %rcx
	movq	%rdi, %rdx
	cmpq	%rcx, %r12
	jnb	.L822
	movq	56(%rsp), %r10
	movq	%r14, %r11
	leal	-1(%rdi), %esi
	addl	%r12d, %edx
	subq	%rdi, %r11
	movl	%esi, %r9d
	movl	36(%r10), %ecx
	movq	%r11, 32(%rsp)
	movl	%edx, 32(%r10)
	movl	%esi, %fs:mf_stale_cutoff@tpoff
	cmpl	$14, %ecx
	jbe	.L823
.L124:
	movl	$9, %edx
	movl	%r15d, %r8d
	cmpq	%rdx, %r12
	cmovnb	%r12, %rdx
	subq	$9, %rdx
	leaq	(%rdx,%rdi), %rsi
	movq	%rsi, 80(%rsp)
	cmpq	%rsi, %rdi
	jnb	.L126
	movl	$12, %ecx
	movq	%rbp, 16(%rsp)
	movabsq	$-5654854502012944384, %r10
	cmpq	%rcx, %r12
	movl	$0, 64(%rsp)
	cmovnb	%r12, %rcx
	leaq	-12(%rdi,%rcx), %rsi
	movl	%r15d, %ecx
	movl	%r9d, %r15d
	movq	%rsi, 72(%rsp)
	leaq	(%r14,%rdx), %rsi
	movq	8(%rsp), %r14
	movq	%rsi, 88(%rsp)
	addq	$1, %rsi
	movq	%rsi, 104(%rsp)
	movq	56(%rsp), %rsi
.L127:
	movq	32(%rsp), %r11
	movq	72(%rsp), %r8
	movq	(%r11,%rdi), %r12
	movq	%r12, %rdx
	imulq	%r10, %rdx
	shrq	$48, %rdx
	cmpq	%r8, %rdi
	jnb	.L526
	movq	%r14, 8(%rsp)
	leaq	2(%r11,%rdi), %r11
	jmp	.L135
	.p2align 4,,10
	.p2align 3
.L527:
	movq	%r9, %rdi
.L135:
	movq	16(%rsp), %r14
	movl	%edx, %edx
	movq	%r11, 48(%rsp)
	movl	%edi, %r13d
	movq	-1(%r11), %r9
	leaq	(%r14,%rdx,2), %rbp
	movswq	0(%rbp), %r8
	movw	%di, 0(%rbp)
	movl	%r12d, %ebp
	movq	%r8, %rdx
	cmpl	%r15d, %r8d
	jle	.L129
	movq	32(%rsp), %r14
	addq	%r14, %rdx
	cmpl	%r12d, (%rdx)
	je	.L130
.L129:
	movzbl	%bpl, %edx
	movq	16(%rsp), %r14
	movl	(%rbx,%rdx,4), %r8d
	addl	$1, 68032(%rsi,%rdx,4)
	movq	%r9, %rdx
	imulq	%r10, %rdx
	movzwl	%r8w, %ebp
	shrl	$16, %r8d
	salq	%cl, %rbp
	addl	%r8d, %ecx
	shrq	$48, %rdx
	orq	%rbp, %rax
	movq	(%r11), %rbp
	leaq	(%r14,%rdx,2), %r12
	leal	1(%r13), %r14d
	movswq	(%r12), %r8
	movw	%r14w, (%r12)
	movq	%r8, %rdx
	cmpl	%r15d, %r8d
	jle	.L131
	movq	32(%rsp), %r14
	addq	%r14, %rdx
	cmpl	%r9d, (%rdx)
	je	.L824
.L131:
	movzbl	%r9b, %r9d
	addl	$2, %r13d
	movq	1(%r11), %r14
	movl	(%rbx,%r9,4), %edx
	addl	$1, 68032(%rsi,%r9,4)
	movzwl	%dx, %r8d
	shrl	$16, %edx
	salq	%cl, %r8
	addl	%edx, %ecx
	leaq	1(%r11), %rdx
	movq	%rdx, 40(%rsp)
	movq	%rbp, %rdx
	orq	%r8, %rax
	movq	16(%rsp), %r8
	imulq	%r10, %rdx
	shrq	$48, %rdx
	leaq	(%r8,%rdx,2), %r9
	movswq	(%r9), %r8
	movw	%r13w, (%r9)
	movq	%r8, %rdx
	cmpl	%r15d, %r8d
	jle	.L133
	movq	32(%rsp), %r9
	addq	%r9, %rdx
	cmpl	%ebp, (%rdx)
	je	.L825
.L133:
	movzbl	%bpl, %ebp
	leal	3(%rdi), %r13d
	movq	2(%r11), %r12
	leaq	4(%rdi), %r9
	movl	(%rbx,%rbp,4), %edx
	addl	$1, 68032(%rsi,%rbp,4)
	movzwl	%dx, %r8d
	shrl	$16, %edx
	salq	%cl, %r8
	addl	%edx, %ecx
	movq	%r14, %rdx
	imulq	%r10, %rdx
	orq	%r8, %rax
	movq	16(%rsp), %r8
	shrq	$48, %rdx
	leaq	(%r8,%rdx,2), %rbp
	movswq	0(%rbp), %r8
	movw	%r13w, 0(%rbp)
	movq	%r8, %rdx
	cmpl	%r15d, %r8d
	jle	.L134
	movq	32(%rsp), %rbp
	addq	%rbp, %rdx
	cmpl	%r14d, (%rdx)
	je	.L826
.L134:
	movzbl	%r14b, %r14d
	movq	%r12, %rdx
	addq	$4, %r11
	movl	(%rbx,%r14,4), %edi
	imulq	%r10, %rdx
	addl	$1, 68032(%rsi,%r14,4)
	movzwl	%di, %r8d
	shrl	$16, %edi
	salq	%cl, %r8
	addl	%ecx, %edi
	movq	8(%rsp), %rcx
	orl	%edi, 64(%rsp)
	orq	%rax, %r8
	movl	%edi, %eax
	shrq	$48, %rdx
	shrl	$3, %eax
	movq	%r8, (%rcx)
	andl	$7, %eax
	addq	%rax, %rcx
	movq	%r8, %rax
	movq	%rcx, 8(%rsp)
	movl	%edi, %ecx
	andl	$7, %edi
	andl	$56, %ecx
	shrq	%cl, %rax
	movl	%edi, %ecx
	movq	72(%rsp), %rdi
	cmpq	%rdi, %r9
	jb	.L527
	movq	8(%rsp), %r14
.L128:
	movq	80(%rsp), %rdi
	cmpq	%rdi, %r9
	jnb	.L827
	movl	%r15d, 8(%rsp)
	movl	64(%rsp), %ebp
	movq	32(%rsp), %r15
	.p2align 4,,10
	.p2align 3
.L136:
	movq	16(%rsp), %r8
	movl	%edx, %edx
	movq	%r9, %rdi
	movq	%r12, %r11
	leaq	1(%r9), %r9
	movq	1(%r15,%rdi), %r12
	leaq	(%r8,%rdx,2), %r13
	movswq	0(%r13), %r8
	movw	%di, 0(%r13)
	movl	8(%rsp), %r13d
	movq	%r8, %rdx
	cmpl	%r13d, %r8d
	jle	.L137
	addq	%r15, %rdx
	cmpl	%r11d, (%rdx)
	je	.L828
.L137:
	movzbl	%r11b, %r11d
	movq	%r12, %rdx
	movl	(%rbx,%r11,4), %edi
	imulq	%r10, %rdx
	addl	$1, 68032(%rsi,%r11,4)
	movzwl	%di, %r8d
	shrl	$16, %edi
	salq	%cl, %r8
	addl	%ecx, %edi
	shrq	$48, %rdx
	orq	%rax, %r8
	movl	%edi, %eax
	movl	%edi, %ecx
	orl	%edi, %ebp
	shrl	$3, %eax
	andl	$56, %ecx
	andl	$7, %edi
	movq	%r8, (%r14)
	andl	$7, %eax
	addq	%rax, %r14
	movq	%r8, %rax
	shrq	%cl, %rax
	movl	%edi, %ecx
	movq	80(%rsp), %rdi
	cmpq	%rdi, %r9
	jb	.L136
	movq	%r14, 8(%rsp)
	movq	32(%rsp), %r14
	movl	%ebp, %r8d
	movl	%ecx, %r15d
	orl	%ecx, %r8d
	addq	%r9, %r14
.L126:
	movq	24(%rsp), %rsi
	movq	8(%rsp), %r13
	subq	%r14, %rsi
	movq	%rax, 0(%r13)
	cmpq	$3, %rsi
	jbe	.L530
	leaq	-4(%rsi), %rdi
	movq	%rdi, %r9
	movq	%rdi, 16(%rsp)
	shrq	$2, %r9
	movq	%r9, 24(%rsp)
	leaq	4(%r14,%r9,4), %r12
	movq	56(%rsp), %r9
	.p2align 4,,10
	.p2align 3
.L154:
	movzbl	(%r14), %ecx
	movzbl	1(%r14), %esi
	addq	$4, %r14
	movl	(%rbx,%rcx,4), %edi
	movq	%rcx, %rdx
	addl	$1, 68032(%r9,%rdx,4)
	movzbl	-2(%r14), %edx
	movl	(%rbx,%rsi,4), %r10d
	movl	%edi, %ecx
	movzwl	%di, %edi
	addl	$1, 68032(%r9,%rsi,4)
	shrl	$16, %ecx
	movq	%rdx, %rsi
	movl	(%rbx,%rdx,4), %edx
	addl	$1, 68032(%r9,%rsi,4)
	movl	%r10d, %ebp
	addl	%r15d, %ecx
	movzbl	-1(%r14), %esi
	shrl	$16, %ebp
	movzwl	%r10w, %r10d
	movl	%edx, %r11d
	movzwl	%dx, %edx
	salq	%cl, %r10
	addl	%ecx, %ebp
	movl	%r15d, %ecx
	movl	(%rbx,%rsi,4), %esi
	salq	%cl, %rdi
	shrl	$16, %r11d
	movl	%ebp, %ecx
	addl	%ebp, %r11d
	orq	%r10, %rdi
	salq	%cl, %rdx
	orq	%rdi, %rdx
	movl	%r11d, %ecx
	movzwl	%si, %edi
	shrl	$16, %esi
	salq	%cl, %rdi
	addl	%r11d, %esi
	orq	%rdi, %rdx
	movl	%esi, %ecx
	orl	%esi, %r8d
	orq	%rax, %rdx
	movzbl	-1(%r14), %eax
	andl	$56, %ecx
	addl	$1, 68032(%r9,%rax,4)
	movl	%esi, %eax
	andl	$7, %esi
	shrl	$3, %eax
	movq	%rdx, 0(%r13)
	movl	%esi, %r15d
	andl	$7, %eax
	addq	%rax, %r13
	movq	%rdx, %rax
	shrq	%cl, %rax
	cmpq	%r12, %r14
	jne	.L154
	movq	24(%rsp), %r9
	movq	16(%rsp), %rdi
	movq	%r13, 8(%rsp)
	negq	%r9
	leaq	(%rdi,%r9,4), %rsi
.L153:
	testq	%rsi, %rsi
	je	.L229
	movq	8(%rsp), %r9
	movq	56(%rsp), %r10
	addq	%r12, %rsi
.L156:
	movzbl	(%r12), %ecx
	addq	$1, %r12
	movl	(%rbx,%rcx,4), %edi
	movq	%rcx, %rdx
	movl	%r15d, %ecx
	addl	$1, 68032(%r10,%rdx,4)
	movzwl	%di, %r11d
	shrl	$16, %edi
	addl	%edi, %r15d
	salq	%cl, %r11
	movl	%r15d, %edx
	movl	%r15d, %ecx
	orq	%r11, %rax
	orl	%r15d, %r8d
	shrl	$3, %edx
	andl	$56, %ecx
	movq	%rax, (%r9)
	andl	$7, %r15d
	andl	$7, %edx
	shrq	%cl, %rax
	addq	%rdx, %r9
	cmpq	%rsi, %r12
	jne	.L156
.L816:
	movq	%r9, 8(%rsp)
.L229:
	movq	56(%rsp), %rbx
	movl	%r15d, %ecx
	movl	3444(%rbx), %edx
	salq	%cl, %rdx
	movzbl	3956(%rbx), %ecx
	movq	8(%rsp), %rbx
	orq	%rdx, %rax
	addl	%r15d, %ecx
	movq	%rax, (%rbx)
	orl	%ecx, %r8d
	cmpl	$63, %r8d
	ja	.L157
.L807:
	movl	%ecx, %edx
	shrl	$3, %edx
	andl	$7, %edx
.L810:
	addq	%rdx, %rbx
	movl	%ecx, %esi
	movq	%rbx, %rdx
	andl	$7, %esi
	je	.L512
	andl	$56, %ecx
	shrq	%cl, %rax
	movb	%al, (%rbx)
.L512:
	movq	96(%rsp), %rax
	movl	%esi, %esi
	subq	%rax, %rdx
	leaq	(%rsi,%rdx,8), %rax
.L80:
	addq	$168, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L81:
	.cfi_restore_state
	movq	56(%rsp), %rbx
	movl	$258, %ecx
	movl	68028(%rbx), %esi
	cmpl	%ecx, %esi
	cmovbe	%esi, %ecx
	movl	%ecx, 16(%rsp)
	testb	%r8b, %r8b
	jne	.L829
	movq	56(%rsp), %rbx
	movq	96(%rsp), %rdi
	movq	%rdx, 32(%rsp)
	leaq	5316(%rbx), %rsi
	cmpb	$13, %al
	je	.L830
	call	memcpy@PLT
	movq	32(%rsp), %rdx
	movl	32(%rbx), %esi
	movl	%r13d, %eax
	andb	5316(%rbx,%rdx), %al
	movl	$32768, %edx
	movzbl	%al, %eax
	subq	%rsi, %rdx
	movq	%rax, 32(%rsp)
	movq	%rsi, %rax
	movl	$0, 1124(%rbx)
	cmpq	%rdx, %r12
	jnb	.L831
	movq	56(%rsp), %rbx
	movq	%r14, %rdx
	leal	-1(%rsi), %edi
	addl	%r12d, %eax
	subq	%rsi, %rdx
	movl	%edi, 88(%rsp)
	movl	36(%rbx), %ecx
	movl	%eax, 32(%rbx)
	movq	%rdx, %rsi
	movl	%edi, %fs:mf_stale_cutoff@tpoff
	cmpl	$14, %ecx
	ja	.L446
	leaq	74080(%rbx), %rax
	testl	%ecx, %ecx
	je	.L578
	movl	$4, %edx
	salq	%cl, %rdx
	movq	%rdx, %rcx
	movl	$131072, %edx
	subq	%rcx, %rdx
	addq	%rcx, %rax
.L445:
	movdqa	.LC4(%rip), %xmm0
	addq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L447:
	movaps	%xmm0, (%rax)
	addq	$64, %rax
	movaps	%xmm0, -48(%rax)
	movaps	%xmm0, -32(%rax)
	movaps	%xmm0, -16(%rax)
	cmpq	%rdx, %rax
	jne	.L447
	movq	56(%rsp), %rax
	movl	$15, 36(%rax)
.L446:
	testq	%r12, %r12
	je	.L448
	movq	56(%rsp), %rdx
	xorl	%r11d, %r11d
	movl	%r15d, 48(%rsp)
	xorl	%r9d, %r9d
	movl	$0, 80(%rsp)
	movdqa	.LC5(%rip), %xmm0
	movl	%r11d, %r12d
	movq	%rsi, %r15
	leaq	74080(%rdx), %rax
	leaq	205152(%rdx), %r13
	movq	%rax, 64(%rsp)
	jmp	.L511
	.p2align 4,,10
	.p2align 3
.L455:
	movl	88(%rsp), %esi
	addw	$-32768, %cx
	movl	(%r14), %ebp
	movzwl	74080(%rdx,%r9,4), %r10d
	cmpl	%esi, %eax
	cmovle	%esi, %ecx
	imull	$506832829, 1(%r14), %eax
	shrl	$17, %eax
	movl	%eax, %esi
	movl	%eax, 40(%rsp)
	movq	64(%rsp), %rax
	prefetcht0	(%rax,%rsi,4)
	movw	%di, 74080(%rdx,%r9,4)
	cmpw	%cx, %r10w
	jle	.L459
	movswq	74082(%rdx,%r9,4), %r8
	movswq	%r10w, %rdi
	movw	%r10w, 74082(%rdx,%r9,4)
	addq	%r15, %rdi
	cmpl	(%rdi), %ebp
	je	.L832
	cmpw	%r8w, %cx
	jge	.L459
	addq	%r15, %r8
	cmpl	(%r8), %ebp
	je	.L833
.L459:
	movzbl	(%r14), %ecx
	movl	48(%rsp), %eax
	addl	$1, %r12d
	leaq	1(%r14), %rbp
	movq	32(%rsp), %rbx
	movzbl	3700(%rdx,%rcx), %edi
	movl	2420(%rdx,%rcx,4), %esi
	movl	%eax, %ecx
	addl	%edi, %eax
	salq	%cl, %rsi
	subl	$1, %edi
	orl	%edi, 80(%rsp)
	movl	%eax, %r8d
	movq	8(%rsp), %rax
	orq	%rbx, %rsi
	movl	%r8d, %ecx
	shrl	$3, %ecx
	movq	%rsi, (%rax)
	addq	%rcx, %rax
	movl	%r8d, %ecx
	andl	$7, %r8d
	andl	$-8, %ecx
	movq	%rax, 8(%rsp)
	shrq	%cl, %rsi
	movl	%r8d, 48(%rsp)
	movq	%rsi, 32(%rsp)
	testb	$15, %r12b
	je	.L834
.L502:
	movq	24(%rsp), %rax
	cmpq	%rax, %rbp
	je	.L796
.L507:
	movl	40(%rsp), %r9d
	movq	%rbp, %r14
.L511:
	movq	24(%rsp), %rax
	movl	16(%rsp), %ebx
	movl	$258, 72(%rsp)
	subq	%r14, %rax
	cmpq	$257, %rax
	jbe	.L835
.L449:
	movq	%r14, %rdi
	subq	%r15, %rdi
	movl	%edi, %ecx
	leal	-32767(%rdi), %eax
	cmpl	$32768, %edi
	jne	.L455
	movq	64(%rsp), %rax
	.p2align 4,,10
	.p2align 3
.L456:
	movdqa	%xmm0, %xmm1
	paddsw	(%rax), %xmm1
	addq	$64, %rax
	movaps	%xmm1, -64(%rax)
	movdqa	%xmm0, %xmm1
	paddsw	-48(%rax), %xmm1
	movaps	%xmm1, -48(%rax)
	movdqa	%xmm0, %xmm1
	paddsw	-32(%rax), %xmm1
	movaps	%xmm1, -32(%rax)
	movdqa	%xmm0, %xmm1
	paddsw	-16(%rax), %xmm1
	movaps	%xmm1, -16(%rax)
	cmpq	%r13, %rax
	jne	.L456
	addq	$32768, %r15
	xorl	%edi, %edi
	movl	$-32767, %eax
	xorl	%ecx, %ecx
	jmp	.L455
	.p2align 4,,10
	.p2align 3
.L82:
	cmpb	$13, %al
	je	.L836
	movq	56(%rsp), %rdi
	movq	%rdx, 16(%rsp)
	leaq	5316(%rdi), %rsi
	leaq	56(%rdi), %rbx
	leaq	74080(%rdi), %rbp
	movq	96(%rsp), %rdi
	call	memcpy@PLT
	movq	56(%rsp), %rdi
	movq	16(%rsp), %rdx
	movl	%r13d, %eax
	movl	$32768, %ecx
	andb	5316(%rdi,%rdx), %al
	movl	$0, 1124(%rdi)
	movl	32(%rdi), %edi
	movzbl	%al, %eax
	subq	%rdi, %rcx
	movq	%rdi, %rdx
	cmpq	%rcx, %r12
	jnb	.L837
	movq	56(%rsp), %r10
	movq	%r14, %r11
	leal	-1(%rdi), %esi
	addl	%r12d, %edx
	subq	%rdi, %r11
	movl	%esi, %r9d
	movl	36(%r10), %ecx
	movq	%r11, 16(%rsp)
	movl	%edx, 32(%r10)
	movl	%esi, %fs:mf_stale_cutoff@tpoff
	cmpl	$14, %ecx
	jbe	.L838
.L198:
	movl	$9, %edx
	movl	%r15d, %r8d
	cmpq	%rdx, %r12
	cmovnb	%r12, %rdx
	subq	$9, %rdx
	leaq	(%rdi,%rdx), %rsi
	movq	%rsi, 64(%rsp)
	cmpq	%rsi, %rdi
	jnb	.L200
	movl	$12, %ecx
	movl	$0, 40(%rsp)
	movabsq	$-5654854502012944384, %r8
	cmpq	%rcx, %r12
	cmovnb	%r12, %rcx
	leaq	-12(%rdi,%rcx), %rsi
	movl	%r15d, %ecx
	movl	%r9d, %r15d
	movq	%rsi, 48(%rsp)
	leaq	(%r14,%rdx), %rsi
	movq	8(%rsp), %r14
	movq	%rsi, 72(%rsp)
	addq	$1, %rsi
	movq	%rsi, 80(%rsp)
.L201:
	movq	16(%rsp), %rsi
	movq	48(%rsp), %r10
	movq	(%rsi,%rdi), %r12
	movq	%r12, %rdx
	imulq	%r8, %rdx
	shrq	$48, %rdx
	cmpq	%r10, %rdi
	jnb	.L540
	movq	%r14, 8(%rsp)
	leaq	2(%rsi,%rdi), %r9
	jmp	.L209
	.p2align 4,,10
	.p2align 3
.L541:
	movq	%r10, %rdi
.L209:
	movl	%edx, %edx
	movq	%r9, 32(%rsp)
	movq	-1(%r9), %r10
	movl	%edi, %r13d
	leaq	0(%rbp,%rdx,2), %r11
	movswq	(%r11), %rsi
	movw	%di, (%r11)
	movl	%r12d, %r11d
	movq	%rsi, %rdx
	cmpl	%r15d, %esi
	jle	.L203
	movq	16(%rsp), %r14
	addq	%r14, %rdx
	cmpl	%r12d, (%rdx)
	je	.L204
.L203:
	movzbl	%r11b, %r11d
	leal	1(%r13), %r14d
	movl	(%rbx,%r11,4), %edx
	movq	(%r9), %r11
	movzwl	%dx, %esi
	shrl	$16, %edx
	salq	%cl, %rsi
	addl	%edx, %ecx
	movq	%r10, %rdx
	imulq	%r8, %rdx
	orq	%rsi, %rax
	shrq	$48, %rdx
	leaq	0(%rbp,%rdx,2), %r12
	movswq	(%r12), %rsi
	movw	%r14w, (%r12)
	movq	%rsi, %rdx
	cmpl	%r15d, %esi
	jle	.L205
	movq	16(%rsp), %r14
	addq	%r14, %rdx
	cmpl	%r10d, (%rdx)
	je	.L839
.L205:
	movzbl	%r10b, %r10d
	addl	$2, %r13d
	movq	1(%r9), %r14
	movl	(%rbx,%r10,4), %edx
	movzwl	%dx, %esi
	shrl	$16, %edx
	salq	%cl, %rsi
	addl	%edx, %ecx
	movq	%r11, %rdx
	imulq	%r8, %rdx
	orq	%rsi, %rax
	leaq	1(%r9), %rsi
	movq	%rsi, 32(%rsp)
	shrq	$48, %rdx
	leaq	0(%rbp,%rdx,2), %r10
	movswq	(%r10), %rsi
	movw	%r13w, (%r10)
	movq	%rsi, %rdx
	cmpl	%r15d, %esi
	jle	.L207
	movq	16(%rsp), %r10
	addq	%r10, %rdx
	cmpl	%r11d, (%rdx)
	je	.L840
.L207:
	movzbl	%r11b, %r11d
	leal	3(%rdi), %r13d
	movq	2(%r9), %r12
	leaq	4(%rdi), %r10
	movl	(%rbx,%r11,4), %edx
	movzwl	%dx, %esi
	shrl	$16, %edx
	salq	%cl, %rsi
	addl	%edx, %ecx
	movq	%r14, %rdx
	imulq	%r8, %rdx
	orq	%rsi, %rax
	shrq	$48, %rdx
	leaq	0(%rbp,%rdx,2), %r11
	movswq	(%r11), %rsi
	movw	%r13w, (%r11)
	movq	%rsi, %rdx
	cmpl	%r15d, %esi
	jle	.L208
	movq	16(%rsp), %r11
	addq	%r11, %rdx
	cmpl	%r14d, (%rdx)
	je	.L841
.L208:
	movzbl	%r14b, %r14d
	movq	%r12, %rdx
	addq	$4, %r9
	movl	(%rbx,%r14,4), %esi
	imulq	%r8, %rdx
	movzwl	%si, %edi
	shrl	$16, %esi
	salq	%cl, %rdi
	addl	%ecx, %esi
	movq	8(%rsp), %rcx
	orl	%esi, 40(%rsp)
	orq	%rax, %rdi
	movl	%esi, %eax
	shrq	$48, %rdx
	shrl	$3, %eax
	movq	%rdi, (%rcx)
	andl	$7, %eax
	addq	%rax, %rcx
	movq	%rdi, %rax
	movq	48(%rsp), %rdi
	movq	%rcx, 8(%rsp)
	movl	%esi, %ecx
	andl	$7, %esi
	andl	$56, %ecx
	shrq	%cl, %rax
	movl	%esi, %ecx
	cmpq	%rdi, %r10
	jb	.L541
	movq	8(%rsp), %r14
.L202:
	movq	64(%rsp), %rdi
	cmpq	%rdi, %r10
	jnb	.L842
	movq	%rbp, 8(%rsp)
	movq	16(%rsp), %r13
	movl	40(%rsp), %ebp
	.p2align 4,,10
	.p2align 3
.L210:
	movq	8(%rsp), %rsi
	movl	%edx, %edx
	movq	%r10, %rdi
	movq	%r12, %r9
	leaq	1(%r10), %r10
	movq	1(%r13,%rdi), %r12
	leaq	(%rsi,%rdx,2), %r11
	movswq	(%r11), %rsi
	movw	%di, (%r11)
	movq	%rsi, %rdx
	cmpl	%r15d, %esi
	jle	.L211
	addq	%r13, %rdx
	cmpl	%r9d, (%rdx)
	je	.L843
.L211:
	movzbl	%r9b, %r9d
	movq	%r12, %rdx
	movl	(%rbx,%r9,4), %esi
	imulq	%r8, %rdx
	movzwl	%si, %edi
	shrl	$16, %esi
	salq	%cl, %rdi
	addl	%ecx, %esi
	shrq	$48, %rdx
	orq	%rax, %rdi
	movl	%esi, %eax
	movl	%esi, %ecx
	orl	%esi, %ebp
	shrl	$3, %eax
	movq	%rdi, (%r14)
	andl	$56, %ecx
	andl	$7, %esi
	andl	$7, %eax
	addq	%rax, %r14
	movq	%rdi, %rax
	movq	64(%rsp), %rdi
	shrq	%cl, %rax
	movl	%esi, %ecx
	cmpq	%rdi, %r10
	jb	.L210
	movq	%r14, 8(%rsp)
	movq	16(%rsp), %r14
	movl	%ebp, %r8d
	movl	%esi, %r15d
	orl	%esi, %r8d
	addq	%r10, %r14
.L200:
	movq	24(%rsp), %rsi
	movq	8(%rsp), %r13
	subq	%r14, %rsi
	movq	%rax, 0(%r13)
	cmpq	$3, %rsi
	jbe	.L544
	leaq	-4(%rsi), %r9
	movq	%r9, %r12
	movq	%r9, 16(%rsp)
	shrq	$2, %r12
	leaq	4(%r14,%r12,4), %rbp
	.p2align 4,,10
	.p2align 3
.L228:
	movzbl	(%r14), %edx
	movzbl	1(%r14), %esi
	addq	$4, %r14
	movl	(%rbx,%rdx,4), %edx
	movl	(%rbx,%rsi,4), %r9d
	movzbl	-2(%r14), %esi
	movl	%edx, %ecx
	movl	%r9d, %r11d
	movzwl	%r9w, %r9d
	movzwl	%dx, %edx
	movl	(%rbx,%rsi,4), %edi
	shrl	$16, %ecx
	movzbl	-1(%r14), %esi
	shrl	$16, %r11d
	addl	%r15d, %ecx
	addl	%ecx, %r11d
	movl	%edi, %r10d
	salq	%cl, %r9
	movl	%r15d, %ecx
	movl	(%rbx,%rsi,4), %esi
	salq	%cl, %rdx
	shrl	$16, %r10d
	movl	%r11d, %ecx
	movzwl	%di, %edi
	addl	%r11d, %r10d
	orq	%r9, %rdx
	salq	%cl, %rdi
	movl	%r10d, %ecx
	orq	%rdi, %rdx
	movzwl	%si, %edi
	shrl	$16, %esi
	salq	%cl, %rdi
	addl	%r10d, %esi
	orq	%rdi, %rdx
	movl	%esi, %ecx
	orl	%esi, %r8d
	orq	%rdx, %rax
	movl	%esi, %edx
	andl	$56, %ecx
	andl	$7, %esi
	shrl	$3, %edx
	movq	%rax, 0(%r13)
	movl	%esi, %r15d
	shrq	%cl, %rax
	andl	$7, %edx
	addq	%rdx, %r13
	cmpq	%rbp, %r14
	jne	.L228
	movq	16(%rsp), %r9
	movq	%r13, 8(%rsp)
	negq	%r12
	leaq	(%r9,%r12,4), %rsi
.L227:
	testq	%rsi, %rsi
	je	.L229
	movq	8(%rsp), %r9
	addq	%rbp, %rsi
.L230:
	movzbl	0(%rbp), %edx
	movl	%r15d, %ecx
	addq	$1, %rbp
	movl	(%rbx,%rdx,4), %edx
	movzwl	%dx, %edi
	shrl	$16, %edx
	addl	%edx, %r15d
	salq	%cl, %rdi
	movl	%r15d, %edx
	movl	%r15d, %ecx
	orq	%rdi, %rax
	orl	%r15d, %r8d
	shrl	$3, %edx
	andl	$56, %ecx
	movq	%rax, (%r9)
	andl	$7, %r15d
	andl	$7, %edx
	shrq	%cl, %rax
	addq	%rdx, %r9
	cmpq	%rsi, %rbp
	jne	.L230
	jmp	.L816
	.p2align 4,,10
	.p2align 3
.L829:
	cmpb	$13, %al
	je	.L844
	movq	56(%rsp), %rbx
	movq	96(%rsp), %rdi
	movq	%rdx, 32(%rsp)
	leaq	5316(%rbx), %rsi
	call	memcpy@PLT
	movq	32(%rsp), %rdx
	movl	32(%rbx), %esi
	movl	%r13d, %eax
	andb	5316(%rbx,%rdx), %al
	movl	$32768, %edx
	movl	$0, 1124(%rbx)
	movzbl	%al, %eax
	subq	%rsi, %rdx
	movq	%rax, 48(%rsp)
	movq	%rsi, %rax
	cmpq	%rdx, %r12
	jnb	.L845
	movq	56(%rsp), %rbx
	leal	-1(%rsi), %edi
	movq	%r14, %rbp
	addl	%r12d, %eax
	movl	%edi, 80(%rsp)
	subq	%rsi, %rbp
	movl	36(%rbx), %ecx
	movl	%eax, 32(%rbx)
	movl	%edi, %fs:mf_stale_cutoff@tpoff
	cmpl	$14, %ecx
	jbe	.L846
.L307:
	movq	24(%rsp), %rax
	cmpq	%rax, %r14
	je	.L309
	movq	56(%rsp), %rdx
	movl	%r15d, 64(%rsp)
	xorl	%r13d, %r13d
	xorl	%r8d, %r8d
	movl	$0, 72(%rsp)
	movdqa	.LC5(%rip), %xmm0
	movq	%rbp, %r15
	leaq	74080(%rdx), %r12
	jmp	.L372
	.p2align 4,,10
	.p2align 3
.L316:
	movl	80(%rsp), %edi
	addw	$-32768, %cx
	movl	(%r14), %ebp
	cmpl	%eax, %edi
	cmovge	%edi, %ecx
	imull	$506832829, 1(%r14), %eax
	movl	%r8d, %edi
	movzwl	74080(%rdx,%rdi,4), %r9d
	shrl	$17, %eax
	movl	%eax, %esi
	movl	%eax, 40(%rsp)
	prefetcht0	(%r12,%rsi,4)
	movw	%r10w, 74080(%rdx,%rdi,4)
	cmpw	%cx, %r9w
	jle	.L320
	movswq	74082(%rdx,%rdi,4), %r8
	movswq	%r9w, %r10
	movw	%r9w, 74082(%rdx,%rdi,4)
	addq	%r15, %r10
	cmpl	(%r10), %ebp
	je	.L847
	cmpw	%r8w, %cx
	jge	.L320
	leaq	(%r15,%r8), %rcx
	cmpl	(%rcx), %ebp
	je	.L848
.L320:
	movzbl	(%r14), %esi
	leaq	1(%r14), %rax
	movq	48(%rsp), %rbx
	addl	$1, %r13d
	movq	%rax, 32(%rsp)
	movl	64(%rsp), %eax
	movzbl	3700(%rdx,%rsi), %r8d
	leaq	(%rdx,%rsi,4), %r9
	movl	%eax, %ecx
	movl	2420(%r9), %esi
	addl	$1, 68032(%r9)
	addl	%r8d, %eax
	subl	$1, %r8d
	orl	%r8d, 72(%rsp)
	movl	%eax, %r10d
	salq	%cl, %rsi
	movq	8(%rsp), %rax
	movl	%r10d, %ecx
	orq	%rbx, %rsi
	shrl	$3, %ecx
	movq	%rsi, (%rax)
	addq	%rcx, %rax
	movl	%r10d, %ecx
	andl	$7, %r10d
	andl	$-8, %ecx
	movq	%rax, 8(%rsp)
	shrq	%cl, %rsi
	movl	%r10d, 64(%rsp)
	movq	%rsi, 48(%rsp)
	testb	$15, %r13b
	je	.L849
.L363:
	movq	24(%rsp), %rbx
	cmpq	%rbx, 32(%rsp)
	je	.L790
.L368:
	movl	40(%rsp), %r8d
	movq	32(%rsp), %r14
.L372:
	movq	24(%rsp), %rax
	movl	16(%rsp), %ebx
	subq	%r14, %rax
	movl	%ebx, 32(%rsp)
	movl	$258, %ebx
	cmpq	$257, %rax
	jbe	.L850
.L310:
	movq	%r14, %r10
	subq	%r15, %r10
	movl	%r10d, %ecx
	leal	-32767(%r10), %eax
	cmpl	$32768, %r10d
	jne	.L316
	leaq	205152(%rdx), %rcx
	movq	%r12, %rax
	.p2align 4,,10
	.p2align 3
.L317:
	movdqa	%xmm0, %xmm1
	paddsw	(%rax), %xmm1
	addq	$64, %rax
	movaps	%xmm1, -64(%rax)
	movdqa	%xmm0, %xmm1
	paddsw	-48(%rax), %xmm1
	movaps	%xmm1, -48(%rax)
	movdqa	%xmm0, %xmm1
	paddsw	-32(%rax), %xmm1
	movaps	%xmm1, -32(%rax)
	movdqa	%xmm0, %xmm1
	paddsw	-16(%rax), %xmm1
	movaps	%xmm1, -16(%rax)
	cmpq	%rcx, %rax
	jne	.L317
	addq	$32768, %r15
	xorl	%r10d, %r10d
	movl	$-32767, %eax
	xorl	%ecx, %ecx
	jmp	.L316
.L821:
	movq	%rbx, %rbp
	movq	96(%rsp), %rdi
	movq	%rdx, 16(%rsp)
	leaq	56(%rbx), %rbx
	leaq	74080(%rbp), %rax
	leaq	5316(%rbp), %rsi
	movq	%rax, 40(%rsp)
	call	memcpy@PLT
	movq	16(%rsp), %rdx
	movl	32(%rbp), %edi
	movl	%r13d, %eax
	movl	$32768, %esi
	movq	%rsi, %rcx
	andb	5316(%rbp,%rdx), %al
	movq	%rdi, %rdx
	movl	$0, 1124(%rbp)
	subq	%rdi, %rcx
	movzbl	%al, %eax
	cmpq	%rcx, %r12
	jnb	.L851
	movq	56(%rsp), %r11
	movq	%r14, %r8
	leal	-1(%rdi), %r10d
	addl	%r12d, %edx
	subq	%rdi, %r8
	movl	%r10d, 16(%rsp)
	movl	36(%r11), %ecx
	movq	%r8, 32(%rsp)
	movl	%edx, 32(%r11)
	movl	%r10d, %fs:mf_stale_cutoff@tpoff
	cmpl	$12, %ecx
	jbe	.L852
.L86:
	movl	$9, %edx
	movl	%r15d, %r9d
	cmpq	%rdx, %r12
	cmovnb	%r12, %rdx
	subq	$9, %rdx
	leaq	(%rdx,%rdi), %rsi
	movq	%rsi, 72(%rsp)
	cmpq	%rsi, %rdi
	jnb	.L88
	movl	$12, %ecx
	movl	$0, 48(%rsp)
	movabsq	$-5654854502012944384, %r8
	cmpq	%rcx, %r12
	cmovnb	%r12, %rcx
	leaq	-12(%rdi,%rcx), %rsi
	movl	%r15d, %ecx
	movq	40(%rsp), %r15
	movq	%rsi, 64(%rsp)
	leaq	(%r14,%rdx), %rsi
	movq	%rsi, 88(%rsp)
	addq	$1, %rsi
	movq	%rsi, 104(%rsp)
	movq	56(%rsp), %rsi
.L89:
	movq	32(%rsp), %r10
	movq	64(%rsp), %r14
	movq	(%r10,%rdi), %rbp
	movq	%rbp, %rdx
	imulq	%r8, %rdx
	shrq	$50, %rdx
	cmpq	%r14, %rdi
	jnb	.L519
	leaq	2(%r10,%rdi), %r10
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L520:
	movq	%r14, %rdi
.L97:
	movl	%edx, %edx
	movl	16(%rsp), %r14d
	movq	%r10, 40(%rsp)
	movl	%edi, %r12d
	leaq	(%r15,%rdx,2), %r13
	movq	-1(%r10), %r11
	movswq	0(%r13), %r9
	movw	%di, 0(%r13)
	movl	%ebp, %r13d
	movq	%r9, %rdx
	cmpl	%r14d, %r9d
	jle	.L91
	movq	32(%rsp), %r14
	addq	%r14, %rdx
	cmpl	%ebp, (%rdx)
	je	.L92
.L91:
	movzbl	%r13b, %edx
	leal	1(%r12), %r14d
	movl	(%rbx,%rdx,4), %r9d
	addl	$1, 68032(%rsi,%rdx,4)
	movq	%r11, %rdx
	imulq	%r8, %rdx
	movzwl	%r9w, %ebp
	shrl	$16, %r9d
	salq	%cl, %rbp
	addl	%r9d, %ecx
	shrq	$50, %rdx
	orq	%rbp, %rax
	movq	(%r10), %rbp
	leaq	(%r15,%rdx,2), %r13
	movswq	0(%r13), %r9
	movw	%r14w, 0(%r13)
	movl	16(%rsp), %r14d
	movq	%r9, %rdx
	cmpl	%r14d, %r9d
	jle	.L93
	movq	32(%rsp), %r14
	addq	%r14, %rdx
	cmpl	%r11d, (%rdx)
	je	.L853
.L93:
	movzbl	%r11b, %r11d
	movl	16(%rsp), %r14d
	addl	$2, %r12d
	movl	(%rbx,%r11,4), %edx
	addl	$1, 68032(%rsi,%r11,4)
	movq	1(%r10), %r11
	movzwl	%dx, %r9d
	shrl	$16, %edx
	salq	%cl, %r9
	addl	%edx, %ecx
	leaq	1(%r10), %rdx
	movq	%rdx, 40(%rsp)
	movq	%rbp, %rdx
	orq	%r9, %rax
	imulq	%r8, %rdx
	shrq	$50, %rdx
	leaq	(%r15,%rdx,2), %r13
	movswq	0(%r13), %r9
	movw	%r12w, 0(%r13)
	movq	%r9, %rdx
	cmpl	%r14d, %r9d
	jle	.L95
	movq	32(%rsp), %r14
	addq	%r14, %rdx
	cmpl	%ebp, (%rdx)
	je	.L854
.L95:
	movzbl	%bpl, %ebp
	leal	3(%rdi), %r13d
	leaq	4(%rdi), %r14
	movl	(%rbx,%rbp,4), %edx
	addl	$1, 68032(%rsi,%rbp,4)
	movq	2(%r10), %rbp
	movzwl	%dx, %r9d
	shrl	$16, %edx
	salq	%cl, %r9
	addl	%edx, %ecx
	movq	%r11, %rdx
	imulq	%r8, %rdx
	orq	%r9, %rax
	shrq	$50, %rdx
	leaq	(%r15,%rdx,2), %r12
	movswq	(%r12), %r9
	movw	%r13w, (%r12)
	movl	16(%rsp), %r13d
	movq	%r9, %rdx
	cmpl	%r13d, %r9d
	jle	.L96
	movq	32(%rsp), %r12
	addq	%r12, %rdx
	cmpl	%r11d, (%rdx)
	je	.L855
.L96:
	movzbl	%r11b, %r11d
	movq	%rbp, %rdx
	addq	$4, %r10
	movl	(%rbx,%r11,4), %edi
	imulq	%r8, %rdx
	addl	$1, 68032(%rsi,%r11,4)
	movzwl	%di, %r9d
	shrl	$16, %edi
	salq	%cl, %r9
	addl	%ecx, %edi
	movq	8(%rsp), %rcx
	orl	%edi, 48(%rsp)
	orq	%rax, %r9
	movl	%edi, %eax
	shrq	$50, %rdx
	shrl	$3, %eax
	movq	%r9, (%rcx)
	andl	$7, %eax
	addq	%rax, %rcx
	movq	%r9, %rax
	movq	%rcx, 8(%rsp)
	movl	%edi, %ecx
	andl	$7, %edi
	andl	$56, %ecx
	shrq	%cl, %rax
	movl	%edi, %ecx
	movq	64(%rsp), %rdi
	cmpq	%rdi, %r14
	jb	.L520
.L90:
	movq	72(%rsp), %rdi
	cmpq	%rdi, %r14
	jnb	.L856
	movq	8(%rsp), %r11
	movq	32(%rsp), %r12
	movq	%r15, 40(%rsp)
	movl	48(%rsp), %r15d
	.p2align 4,,10
	.p2align 3
.L98:
	movq	40(%rsp), %r9
	movl	%edx, %edx
	movq	%r14, %rdi
	movq	%rbp, %r10
	leaq	1(%r14), %r14
	movq	1(%r12,%rdi), %rbp
	leaq	(%r9,%rdx,2), %r13
	movswq	0(%r13), %r9
	movw	%di, 0(%r13)
	movl	16(%rsp), %r13d
	movq	%r9, %rdx
	cmpl	%r13d, %r9d
	jle	.L99
	addq	%r12, %rdx
	cmpl	%r10d, (%rdx)
	je	.L857
.L99:
	movzbl	%r10b, %r10d
	movq	%rbp, %rdx
	movl	(%rbx,%r10,4), %edi
	imulq	%r8, %rdx
	addl	$1, 68032(%rsi,%r10,4)
	movzwl	%di, %r9d
	shrl	$16, %edi
	salq	%cl, %r9
	addl	%ecx, %edi
	shrq	$50, %rdx
	orq	%rax, %r9
	movl	%edi, %eax
	movl	%edi, %ecx
	orl	%edi, %r15d
	shrl	$3, %eax
	andl	$56, %ecx
	andl	$7, %edi
	movq	%r9, (%r11)
	andl	$7, %eax
	addq	%rax, %r11
	movq	%r9, %rax
	shrq	%cl, %rax
	movl	%edi, %ecx
	movq	72(%rsp), %rdi
	cmpq	%rdi, %r14
	jb	.L98
	movq	32(%rsp), %rdi
	movl	%r15d, %esi
	movq	%r11, 8(%rsp)
	movl	%ecx, %r15d
	orl	%ecx, %esi
	addq	%r14, %rdi
	movl	%esi, %r9d
	movq	%rdi, %r14
.L88:
	movq	24(%rsp), %rsi
	movq	8(%rsp), %r13
	subq	%r14, %rsi
	movq	%rax, 0(%r13)
	cmpq	$3, %rsi
	jbe	.L523
	leaq	-4(%rsi), %rdi
	movq	%rdi, %r8
	movq	%rdi, 16(%rsp)
	shrq	$2, %r8
	movq	%r8, 24(%rsp)
	leaq	4(%r14,%r8,4), %r12
	movq	56(%rsp), %r8
	.p2align 4,,10
	.p2align 3
.L116:
	movzbl	(%r14), %ecx
	movzbl	1(%r14), %esi
	addq	$4, %r14
	movl	(%rbx,%rcx,4), %edi
	movq	%rcx, %rdx
	addl	$1, 68032(%r8,%rdx,4)
	movzbl	-2(%r14), %edx
	movl	(%rbx,%rsi,4), %r10d
	movl	%edi, %ecx
	movzwl	%di, %edi
	addl	$1, 68032(%r8,%rsi,4)
	shrl	$16, %ecx
	movq	%rdx, %rsi
	movl	(%rbx,%rdx,4), %edx
	addl	$1, 68032(%r8,%rsi,4)
	movl	%r10d, %ebp
	addl	%r15d, %ecx
	movzbl	-1(%r14), %esi
	shrl	$16, %ebp
	movzwl	%r10w, %r10d
	movl	%edx, %r11d
	movzwl	%dx, %edx
	salq	%cl, %r10
	addl	%ecx, %ebp
	movl	%r15d, %ecx
	movl	(%rbx,%rsi,4), %esi
	salq	%cl, %rdi
	shrl	$16, %r11d
	movl	%ebp, %ecx
	addl	%ebp, %r11d
	orq	%r10, %rdi
	salq	%cl, %rdx
	orq	%rdi, %rdx
	movl	%r11d, %ecx
	movzwl	%si, %edi
	shrl	$16, %esi
	salq	%cl, %rdi
	addl	%r11d, %esi
	orq	%rdi, %rdx
	movl	%esi, %ecx
	orl	%esi, %r9d
	orq	%rax, %rdx
	movzbl	-1(%r14), %eax
	andl	$56, %ecx
	addl	$1, 68032(%r8,%rax,4)
	movl	%esi, %eax
	andl	$7, %esi
	shrl	$3, %eax
	movq	%rdx, 0(%r13)
	movl	%esi, %r15d
	andl	$7, %eax
	addq	%rax, %r13
	movq	%rdx, %rax
	shrq	%cl, %rax
	cmpq	%r12, %r14
	jne	.L116
	movq	24(%rsp), %r8
	movq	16(%rsp), %rdi
	movq	%r13, 8(%rsp)
	negq	%r8
	leaq	(%rdi,%r8,4), %rsi
.L115:
	testq	%rsi, %rsi
	je	.L117
	movq	8(%rsp), %r8
	movq	56(%rsp), %r10
	addq	%r12, %rsi
.L118:
	movzbl	(%r12), %ecx
	addq	$1, %r12
	movl	(%rbx,%rcx,4), %edi
	movq	%rcx, %rdx
	movl	%r15d, %ecx
	addl	$1, 68032(%r10,%rdx,4)
	movzwl	%di, %r11d
	shrl	$16, %edi
	addl	%edi, %r15d
	salq	%cl, %r11
	movl	%r15d, %edx
	movl	%r15d, %ecx
	orq	%r11, %rax
	orl	%r15d, %r9d
	shrl	$3, %edx
	andl	$56, %ecx
	movq	%rax, (%r8)
	andl	$7, %r15d
	andl	$7, %edx
	shrq	%cl, %rax
	addq	%rdx, %r8
	cmpq	%rsi, %r12
	jne	.L118
	movq	%r8, 8(%rsp)
.L117:
	movq	56(%rsp), %rbx
	movl	%r15d, %ecx
	movl	3444(%rbx), %edx
	salq	%cl, %rdx
	movzbl	3956(%rbx), %ecx
	movq	8(%rsp), %rbx
	orq	%rdx, %rax
	addl	%r15d, %ecx
	movq	%rax, (%rbx)
	orl	%ecx, %r9d
	cmpl	$63, %r9d
	ja	.L157
	movl	%ecx, %edx
	movq	8(%rsp), %rbx
	shrl	$3, %edx
	andl	$7, %edx
	jmp	.L810
.L836:
	movq	56(%rsp), %rbp
	movq	96(%rsp), %rdi
	movq	%rdx, 16(%rsp)
	leaq	74080(%rbp), %rax
	leaq	5316(%rbp), %rsi
	movq	%rax, 32(%rsp)
	leaq	56(%rbp), %rbx
	call	memcpy@PLT
	movq	16(%rsp), %rdx
	movl	32(%rbp), %edi
	movl	%r13d, %eax
	movl	$32768, %esi
	movq	%rsi, %rcx
	andb	5316(%rbp,%rdx), %al
	movq	%rdi, %rdx
	movl	$0, 1124(%rbp)
	subq	%rdi, %rcx
	movzbl	%al, %eax
	cmpq	%rcx, %r12
	jnb	.L858
	movq	56(%rsp), %r11
	movq	%r14, %r8
	leal	-1(%rdi), %r10d
	addl	%r12d, %edx
	subq	%rdi, %r8
	movl	36(%r11), %ecx
	movq	%r8, 16(%rsp)
	movl	%edx, 32(%r11)
	movl	%r10d, %fs:mf_stale_cutoff@tpoff
	cmpl	$12, %ecx
	jbe	.L859
.L162:
	movl	$9, %edx
	cmpq	%rdx, %r12
	cmovnb	%r12, %rdx
	subq	$9, %rdx
	leaq	(%rdx,%rdi), %rsi
	movq	%rsi, %rcx
	movq	%rsi, 64(%rsp)
	movl	%r15d, %esi
	cmpq	%rcx, %rdi
	jnb	.L164
	movl	$12, %ecx
	movq	32(%rsp), %r13
	movl	$0, 40(%rsp)
	movabsq	$-5654854502012944384, %r8
	cmpq	%rcx, %r12
	cmovnb	%r12, %rcx
	leaq	-12(%rdi,%rcx), %rsi
	movl	%r15d, %ecx
	movl	%r10d, %r15d
	movq	%rsi, 48(%rsp)
	leaq	(%r14,%rdx), %rsi
	movq	%rsi, 80(%rsp)
	addq	$1, %rsi
	movq	%rsi, 88(%rsp)
.L165:
	movq	16(%rsp), %rsi
	movq	48(%rsp), %r10
	movq	(%rsi,%rdi), %rbp
	movq	%rbp, %rdx
	imulq	%r8, %rdx
	shrq	$50, %rdx
	cmpq	%r10, %rdi
	jnb	.L533
	leaq	2(%rsi,%rdi), %r9
	jmp	.L173
	.p2align 4,,10
	.p2align 3
.L534:
	movq	%r14, %rdi
.L173:
	movl	%edx, %edx
	movq	%r9, 32(%rsp)
	movq	-1(%r9), %r10
	movl	%edi, %r12d
	leaq	0(%r13,%rdx,2), %r11
	movswq	(%r11), %rsi
	movw	%di, (%r11)
	movl	%ebp, %r11d
	movq	%rsi, %rdx
	cmpl	%r15d, %esi
	jle	.L167
	movq	16(%rsp), %r14
	addq	%r14, %rdx
	cmpl	%ebp, (%rdx)
	je	.L168
.L167:
	movzbl	%r11b, %r11d
	leal	1(%r12), %r14d
	movl	(%rbx,%r11,4), %edx
	movq	(%r9), %r11
	movzwl	%dx, %esi
	shrl	$16, %edx
	salq	%cl, %rsi
	addl	%edx, %ecx
	movq	%r10, %rdx
	imulq	%r8, %rdx
	orq	%rsi, %rax
	shrq	$50, %rdx
	leaq	0(%r13,%rdx,2), %rbp
	movswq	0(%rbp), %rsi
	movw	%r14w, 0(%rbp)
	movq	%rsi, %rdx
	cmpl	%r15d, %esi
	jle	.L169
	movq	16(%rsp), %r14
	addq	%r14, %rdx
	cmpl	%r10d, (%rdx)
	je	.L860
.L169:
	movzbl	%r10b, %r10d
	addl	$2, %r12d
	movl	(%rbx,%r10,4), %edx
	movq	1(%r9), %r10
	movzwl	%dx, %esi
	shrl	$16, %edx
	salq	%cl, %rsi
	addl	%edx, %ecx
	movq	%r11, %rdx
	imulq	%r8, %rdx
	orq	%rsi, %rax
	leaq	1(%r9), %rsi
	movq	%rsi, 32(%rsp)
	shrq	$50, %rdx
	leaq	0(%r13,%rdx,2), %rbp
	movswq	0(%rbp), %rsi
	movw	%r12w, 0(%rbp)
	movq	%rsi, %rdx
	cmpl	%r15d, %esi
	jle	.L171
	movq	16(%rsp), %r14
	addq	%r14, %rdx
	cmpl	%r11d, (%rdx)
	je	.L861
.L171:
	movzbl	%r11b, %r11d
	leal	3(%rdi), %r12d
	movq	2(%r9), %rbp
	leaq	4(%rdi), %r14
	movl	(%rbx,%r11,4), %edx
	movzwl	%dx, %esi
	shrl	$16, %edx
	salq	%cl, %rsi
	addl	%edx, %ecx
	movq	%r10, %rdx
	imulq	%r8, %rdx
	orq	%rsi, %rax
	shrq	$50, %rdx
	leaq	0(%r13,%rdx,2), %r11
	movswq	(%r11), %rsi
	movw	%r12w, (%r11)
	movq	%rsi, %rdx
	cmpl	%r15d, %esi
	jle	.L172
	movq	16(%rsp), %r11
	addq	%r11, %rdx
	cmpl	%r10d, (%rdx)
	je	.L862
.L172:
	movzbl	%r10b, %r10d
	movq	%rbp, %rdx
	addq	$4, %r9
	movl	(%rbx,%r10,4), %esi
	imulq	%r8, %rdx
	movzwl	%si, %edi
	shrl	$16, %esi
	salq	%cl, %rdi
	addl	%ecx, %esi
	movq	8(%rsp), %rcx
	orl	%esi, 40(%rsp)
	orq	%rax, %rdi
	movl	%esi, %eax
	shrq	$50, %rdx
	shrl	$3, %eax
	movq	%rdi, (%rcx)
	andl	$7, %eax
	addq	%rax, %rcx
	movq	%rdi, %rax
	movq	48(%rsp), %rdi
	movq	%rcx, 8(%rsp)
	movl	%esi, %ecx
	andl	$7, %esi
	andl	$56, %ecx
	shrq	%cl, %rax
	movl	%esi, %ecx
	cmpq	%rdi, %r14
	jb	.L534
.L166:
	movq	64(%rsp), %rdi
	cmpq	%rdi, %r14
	jnb	.L863
	movq	8(%rsp), %r11
	movq	16(%rsp), %r12
	movq	%r13, 32(%rsp)
	movl	40(%rsp), %r13d
	.p2align 4,,10
	.p2align 3
.L174:
	movq	32(%rsp), %rsi
	movl	%edx, %edx
	movq	%r14, %rdi
	movq	%rbp, %r9
	leaq	1(%r14), %r14
	movq	1(%r12,%rdi), %rbp
	leaq	(%rsi,%rdx,2), %r10
	movswq	(%r10), %rsi
	movw	%di, (%r10)
	movq	%rsi, %rdx
	cmpl	%r15d, %esi
	jle	.L175
	addq	%r12, %rdx
	cmpl	%r9d, (%rdx)
	je	.L864
.L175:
	movzbl	%r9b, %r9d
	movq	%rbp, %rdx
	movl	(%rbx,%r9,4), %esi
	imulq	%r8, %rdx
	movzwl	%si, %edi
	shrl	$16, %esi
	salq	%cl, %rdi
	addl	%ecx, %esi
	shrq	$50, %rdx
	orq	%rax, %rdi
	movl	%esi, %eax
	movl	%esi, %ecx
	orl	%esi, %r13d
	shrl	$3, %eax
	movq	%rdi, (%r11)
	andl	$56, %ecx
	andl	$7, %esi
	andl	$7, %eax
	addq	%rax, %r11
	movq	%rdi, %rax
	movq	64(%rsp), %rdi
	shrq	%cl, %rax
	movl	%esi, %ecx
	cmpq	%rdi, %r14
	jb	.L174
	movq	16(%rsp), %rdi
	movq	%r11, 8(%rsp)
	movl	%esi, %r15d
	movl	%r13d, %esi
	orl	%ecx, %esi
	addq	%r14, %rdi
	movq	%rdi, %r14
.L164:
	movq	24(%rsp), %rdi
	movq	8(%rsp), %r13
	subq	%r14, %rdi
	movq	%rax, 0(%r13)
	cmpq	$3, %rdi
	jbe	.L537
	leaq	-4(%rdi), %r12
	movq	%r12, %r9
	movq	%r12, 16(%rsp)
	shrq	$2, %r9
	leaq	4(%r14,%r9,4), %rbp
	.p2align 4,,10
	.p2align 3
.L192:
	movzbl	(%r14), %edx
	movzbl	1(%r14), %edi
	addq	$4, %r14
	movl	(%rbx,%rdx,4), %edx
	movl	(%rbx,%rdi,4), %r10d
	movzbl	-2(%r14), %edi
	movl	%edx, %ecx
	movl	%r10d, %r12d
	movzwl	%r10w, %r10d
	movzwl	%dx, %edx
	movl	(%rbx,%rdi,4), %r8d
	shrl	$16, %ecx
	movzbl	-1(%r14), %edi
	shrl	$16, %r12d
	addl	%r15d, %ecx
	addl	%ecx, %r12d
	movl	%r8d, %r11d
	salq	%cl, %r10
	movl	%r15d, %ecx
	movl	(%rbx,%rdi,4), %edi
	salq	%cl, %rdx
	shrl	$16, %r11d
	movl	%r12d, %ecx
	movzwl	%r8w, %r8d
	addl	%r12d, %r11d
	orq	%r10, %rdx
	salq	%cl, %r8
	movl	%r11d, %ecx
	orq	%r8, %rdx
	movzwl	%di, %r8d
	shrl	$16, %edi
	salq	%cl, %r8
	addl	%r11d, %edi
	orq	%r8, %rdx
	movl	%edi, %ecx
	orl	%edi, %esi
	orq	%rdx, %rax
	movl	%edi, %edx
	andl	$56, %ecx
	andl	$7, %edi
	shrl	$3, %edx
	movq	%rax, 0(%r13)
	movl	%edi, %r15d
	shrq	%cl, %rax
	andl	$7, %edx
	addq	%rdx, %r13
	cmpq	%rbp, %r14
	jne	.L192
	movq	16(%rsp), %r12
	movq	%r13, 8(%rsp)
	negq	%r9
	leaq	(%r12,%r9,4), %rdi
.L191:
	testq	%rdi, %rdi
	je	.L193
	movq	8(%rsp), %r9
	addq	%rbp, %rdi
.L194:
	movzbl	0(%rbp), %edx
	movl	%r15d, %ecx
	addq	$1, %rbp
	movl	(%rbx,%rdx,4), %edx
	movzwl	%dx, %r8d
	shrl	$16, %edx
	addl	%edx, %r15d
	salq	%cl, %r8
	movl	%r15d, %edx
	movl	%r15d, %ecx
	orq	%r8, %rax
	orl	%r15d, %esi
	shrl	$3, %edx
	andl	$56, %ecx
	movq	%rax, (%r9)
	andl	$7, %r15d
	andl	$7, %edx
	shrq	%cl, %rax
	addq	%rdx, %r9
	cmpq	%rdi, %rbp
	jne	.L194
	movq	%r9, 8(%rsp)
.L193:
	movq	56(%rsp), %rbx
	movl	%r15d, %ecx
	movl	3444(%rbx), %edx
	salq	%cl, %rdx
	movzbl	3956(%rbx), %ecx
	movq	8(%rsp), %rbx
	orq	%rdx, %rax
	addl	%r15d, %ecx
	movq	%rax, (%rbx)
	orl	%ecx, %esi
	cmpl	$63, %esi
	jbe	.L807
	.p2align 4,,10
	.p2align 3
.L157:
	xorl	%eax, %eax
	jmp	.L80
.L831:
	movl	$32768, %eax
	movq	56(%rsp), %rbx
	movq	%r14, %rsi
	movl	$131072, %edx
	cmpq	%rax, %r12
	cmovbe	%r12, %rax
	movl	%eax, 32(%rbx)
	leaq	74080(%rbx), %rax
	movl	$-32768, %fs:mf_stale_cutoff@tpoff
	movl	$-32768, 88(%rsp)
	jmp	.L445
	.p2align 4,,10
	.p2align 3
.L832:
	movl	72(%rsp), %eax
	subl	$4, %eax
	movl	%eax, 104(%rsp)
	cmpl	$31, %eax
	jbe	.L580
	movq	4(%rdi), %r9
	movq	4(%r14), %r11
	cmpq	%r11, %r9
	jne	.L462
	movq	12(%rdi), %r9
	movq	12(%r14), %r11
	cmpq	%r11, %r9
	je	.L463
	xorq	%r9, %r11
	movl	$12, %r10d
.L464:
	rep bsfq	%r11, %r11
	shrl	$3, %r11d
	leal	(%r10,%r11), %r9d
	movq	%r9, %r10
.L469:
	cmpw	%r8w, %cx
	jge	.L472
	cmpl	%ebx, %r10d
	jnb	.L472
	leaq	(%r15,%r8), %r12
	cmpl	(%r12), %ebp
	je	.L865
.L472:
	movl	%r14d, %r11d
	leal	-1(%r10), %ebx
	leaq	(%r14,%r9), %rbp
	movl	%r10d, %r12d
	subl	%edi, %r11d
.L496:
	movl	$256, %ecx
	leal	-1(%r11), %edi
	leaq	deflate_offset_slot(%rip), %rax
	movl	4020(%rdx,%r12,4), %r8d
	subl	%r11d, %ecx
	shrl	$29, %ecx
	shrl	%cl, %edi
	movzbl	(%rax,%rdi), %edi
	movl	48(%rsp), %eax
	leal	(%rdi,%rcx,2), %edi
	movl	%eax, %ecx
	movzbl	3988(%rdx,%rdi), %r9d
	salq	%cl, %r8
	movq	32(%rsp), %rcx
	orq	%rcx, %r8
	movzbl	5056(%rdx,%r12), %ecx
	movl	3572(%rdx,%rdi,4), %r12d
	addl	%eax, %ecx
	leaq	deflate_offset_slot_base(%rip), %rax
	subl	(%rax,%rdi,4), %r11d
	leaq	deflate_extra_offset_bits(%rip), %rax
	salq	%cl, %r12
	addl	%r9d, %ecx
	movzbl	(%rax,%rdi), %edi
	orq	%r8, %r12
	movq	8(%rsp), %rax
	salq	%cl, %r11
	orq	%r12, %r11
	movq	24(%rsp), %r8
	subl	$1, %r9d
	orl	%r9d, 80(%rsp)
	addl	%ecx, %edi
	movq	%r11, (%rax)
	leal	4(%r10), %r9d
	movl	%edi, %ecx
	shrl	$3, %ecx
	addq	%rcx, %rax
	movl	%edi, %ecx
	andl	$7, %edi
	andl	$-8, %ecx
	movl	%edi, 48(%rsp)
	shrq	%cl, %r11
	leaq	1(%r14), %rcx
	movq	%rax, 8(%rsp)
	movq	%rcx, %rdi
	subq	%rcx, %r8
	movq	%r11, 32(%rsp)
	subq	%r15, %rdi
	cmpq	%r8, %r9
	jg	.L497
	leal	-1(%rbx,%rdi), %eax
	cmpl	$32767, %eax
	jbe	.L499
	movq	64(%rsp), %rax
	.p2align 4,,10
	.p2align 3
.L500:
	movdqa	%xmm0, %xmm1
	paddsw	(%rax), %xmm1
	addq	$64, %rax
	movaps	%xmm1, -64(%rax)
	movdqa	%xmm0, %xmm1
	paddsw	-48(%rax), %xmm1
	movaps	%xmm1, -48(%rax)
	movdqa	%xmm0, %xmm1
	paddsw	-32(%rax), %xmm1
	movaps	%xmm1, -32(%rax)
	movdqa	%xmm0, %xmm1
	paddsw	-16(%rax), %xmm1
	movaps	%xmm1, -16(%rax)
	cmpq	%r13, %rax
	jne	.L500
	addq	$32768, %r15
	subl	$32768, %edi
.L499:
	leal	1(%rbx), %r8d
	movq	64(%rsp), %r10
	subl	%ecx, %edi
	addq	%r14, %r8
	.p2align 4,,10
	.p2align 3
.L501:
	movzwl	74080(%rdx,%rsi,4), %eax
	leal	(%rdi,%rcx), %r9d
	addq	$1, %rcx
	movzwl	%r9w, %r9d
	sall	$16, %eax
	orl	%r9d, %eax
	movl	%eax, (%r10,%rsi,4)
	imull	$506832829, (%rcx), %esi
	shrl	$17, %esi
	cmpq	%r8, %rcx
	jne	.L501
	movl	%esi, 40(%rsp)
	movq	64(%rsp), %rax
	movl	%esi, %ecx
	prefetcht0	(%rax,%rcx,4)
.L497:
	movq	24(%rsp), %rax
	xorl	%r12d, %r12d
	cmpq	%rax, %rbp
	jne	.L507
.L796:
	movl	48(%rsp), %r15d
.L453:
	movq	56(%rsp), %rbx
	movq	32(%rsp), %rdi
	movl	%r15d, %ecx
	movl	3444(%rbx), %eax
	movzbl	3956(%rbx), %edx
	movq	8(%rsp), %rbx
	salq	%cl, %rax
	orq	%rdi, %rax
	movq	%rax, (%rbx)
	movl	80(%rsp), %ecx
	testl	%ecx, %ecx
	js	.L157
.L516:
	leal	(%rdx,%r15), %ecx
	movq	8(%rsp), %rbx
	movl	%ecx, %edx
	movl	%ecx, %esi
	shrl	$3, %edx
	addq	%rdx, %rbx
	movq	%rbx, %rdx
	andl	$7, %esi
	je	.L512
	andl	$-8, %ecx
	shrq	%cl, %rax
	movb	%al, (%rbx)
	jmp	.L512
	.p2align 4,,10
	.p2align 3
.L847:
	leal	-4(%rbx), %eax
	movl	%eax, 88(%rsp)
	cmpl	$31, %eax
	jbe	.L558
	movq	4(%r10), %rdi
	movq	4(%r14), %r11
	cmpq	%r11, %rdi
	jne	.L323
	movq	12(%r10), %rdi
	movq	12(%r14), %r11
	cmpq	%r11, %rdi
	je	.L324
	xorq	%rdi, %r11
	movl	$12, %r9d
.L325:
	rep bsfq	%r11, %r11
	shrl	$3, %r11d
	leal	(%r9,%r11), %edi
	movq	%rdi, %r9
.L330:
	cmpw	%r8w, %cx
	jge	.L333
	movl	32(%rsp), %eax
	cmpl	%eax, %r9d
	jnb	.L333
	leaq	(%r15,%r8), %rax
	cmpl	(%rax), %ebp
	je	.L866
.L333:
	leal	-1(%r9), %eax
	movl	%r14d, %r8d
	movl	%eax, %r13d
	leaq	(%r14,%rdi), %rax
	subl	%r10d, %r8d
	movl	%r9d, %edi
	movq	%rax, 32(%rsp)
.L357:
	movl	$256, %ecx
	leal	-1(%r8), %r10d
	leaq	deflate_offset_slot(%rip), %rax
	movl	4020(%rdx,%rdi,4), %ebx
	subl	%r8d, %ecx
	shrl	$29, %ecx
	shrl	%cl, %r10d
	movzbl	(%rax,%r10), %r10d
	movl	64(%rsp), %eax
	leal	(%r10,%rcx,2), %r10d
	movl	%eax, %ecx
	movzbl	3988(%rdx,%r10), %ebp
	salq	%cl, %rbx
	movq	48(%rsp), %rcx
	orq	%rcx, %rbx
	movzbl	5056(%rdx,%rdi), %ecx
	addl	%eax, %ecx
	leaq	(%rdx,%r10,4), %rax
	movl	3572(%rax), %r11d
	salq	%cl, %r11
	addl	%ebp, %ecx
	subl	$1, %ebp
	orl	%ebp, 72(%rsp)
	orq	%rbx, %r11
	leaq	deflate_offset_slot_base(%rip), %rbx
	subl	(%rbx,%r10,4), %r8d
	leaq	deflate_extra_offset_bits(%rip), %rbx
	movzbl	(%rbx,%r10), %r10d
	salq	%cl, %r8
	movq	8(%rsp), %rbx
	orq	%r11, %r8
	addl	%ecx, %r10d
	movq	%r8, (%rbx)
	movl	%r10d, %ecx
	shrl	$3, %ecx
	addq	%rcx, %rbx
	movl	%r10d, %ecx
	andl	$7, %r10d
	andl	$-8, %ecx
	movq	%rbx, 8(%rsp)
	leaq	deflate_length_slot(%rip), %rbx
	shrq	%cl, %r8
	movzbl	(%rbx,%rdi), %ecx
	movl	%r10d, 64(%rsp)
	leal	4(%r9), %r10d
	movq	24(%rsp), %r9
	movq	%r8, 48(%rsp)
	addl	$1, 69060(%rdx,%rcx,4)
	leaq	1(%r14), %rcx
	movq	%rcx, %r8
	subq	%rcx, %r9
	addl	$1, 69184(%rax)
	subq	%r15, %r8
	cmpq	%r9, %r10
	jg	.L358
	leal	-1(%r13,%r8), %eax
	cmpl	$32767, %eax
	jbe	.L360
	leaq	205152(%rdx), %r9
	movq	%r12, %rax
	.p2align 4,,10
	.p2align 3
.L361:
	movdqa	%xmm0, %xmm1
	paddsw	(%rax), %xmm1
	addq	$64, %rax
	movaps	%xmm1, -64(%rax)
	movdqa	%xmm0, %xmm1
	paddsw	-48(%rax), %xmm1
	movaps	%xmm1, -48(%rax)
	movdqa	%xmm0, %xmm1
	paddsw	-32(%rax), %xmm1
	movaps	%xmm1, -32(%rax)
	movdqa	%xmm0, %xmm1
	paddsw	-16(%rax), %xmm1
	movaps	%xmm1, -16(%rax)
	cmpq	%r9, %rax
	jne	.L361
	addq	$32768, %r15
	subl	$32768, %r8d
.L360:
	leal	1(%r13), %r9d
	subl	%ecx, %r8d
	addq	%r14, %r9
	.p2align 4,,10
	.p2align 3
.L362:
	movzwl	74080(%rdx,%rsi,4), %eax
	leal	(%r8,%rcx), %edi
	addq	$1, %rcx
	movzwl	%di, %edi
	sall	$16, %eax
	orl	%edi, %eax
	movl	%eax, (%r12,%rsi,4)
	imull	$506832829, (%rcx), %esi
	shrl	$17, %esi
	cmpq	%r9, %rcx
	jne	.L362
	movl	%esi, 40(%rsp)
	movl	%esi, %ecx
	prefetcht0	(%r12,%rcx,4)
.L358:
	xorl	%r13d, %r13d
	jmp	.L363
	.p2align 4,,10
	.p2align 3
.L462:
	xorq	%r9, %r11
	movl	$4, %r10d
	jmp	.L464
	.p2align 4,,10
	.p2align 3
.L835:
	movl	%eax, 72(%rsp)
	cmpl	$4, %eax
	jbe	.L867
	movl	16(%rsp), %edi
	cmpl	%eax, %edi
	cmovbe	%edi, %eax
	movl	%eax, %ebx
	jmp	.L449
	.p2align 4,,10
	.p2align 3
.L833:
	movl	72(%rsp), %eax
	leal	-4(%rax), %ecx
	cmpl	$31, %ecx
	jbe	.L584
	movq	4(%r8), %rcx
	movq	4(%r14), %rdi
	cmpq	%rdi, %rcx
	jne	.L485
	movq	12(%r8), %rcx
	movq	12(%r14), %rdi
	cmpq	%rdi, %rcx
	je	.L486
	xorq	%rdi, %rcx
	movl	$12, %r10d
.L487:
	rep bsfq	%rcx, %rcx
	movl	%r14d, %r11d
	shrl	$3, %ecx
	subl	%r8d, %r11d
	leal	(%r10,%rcx), %r12d
	movq	%r12, %r10
	leal	-1(%r12), %ebx
	leaq	(%r14,%r12), %rbp
	jmp	.L496
	.p2align 4,,10
	.p2align 3
.L834:
	movq	24(%rsp), %rax
	cmpq	%rax, %rbp
	je	.L817
	movq	24(%rsp), %rsi
	movq	%rbp, %rcx
	jmp	.L503
	.p2align 4,,10
	.p2align 3
.L506:
	addq	$1, %rcx
	cmpq	%rsi, %rcx
	je	.L505
.L503:
	movzbl	(%rcx), %eax
	leaq	deflate_token_char(%rip), %rbx
	testb	$3, (%rbx,%rax)
	jne	.L506
.L505:
	movq	%rcx, %rsi
	subq	%rbp, %rsi
	cmpq	$15, %rsi
	jle	.L507
	leaq	-4(%rsi), %rcx
	movl	%r12d, 112(%rsp)
	movq	%rbp, %rdi
	movq	%rcx, %r10
	andq	$-4, %rcx
	movq	%r15, 120(%rsp)
	movq	%rcx, %r9
	leaq	5(%r14,%rcx), %rax
	shrq	$2, %r10
	movq	%rsi, 128(%rsp)
	movq	%rax, 72(%rsp)
	movl	48(%rsp), %ecx
	movq	%r9, 136(%rsp)
	movq	%r10, 144(%rsp)
	movq	%r13, 152(%rsp)
	movq	%rbp, 104(%rsp)
	movq	8(%rsp), %rbp
	.p2align 4,,10
	.p2align 3
.L508:
	movzbl	(%rdi), %ebx
	movzbl	1(%rdi), %r9d
	addq	$4, %rdi
	movzbl	-2(%rdi), %r14d
	movzbl	-1(%rdi), %r12d
	movzbl	3700(%rdx,%rbx), %r11d
	movl	2420(%rdx,%rbx,4), %ebx
	movzbl	3700(%rdx,%r9), %r8d
	movl	2420(%rdx,%r9,4), %r9d
	movzbl	3700(%rdx,%r14), %eax
	leal	(%r11,%rcx), %r15d
	salq	%cl, %rbx
	movzbl	3700(%rdx,%r12), %r10d
	movl	%r15d, %ecx
	leal	(%r15,%r8), %r13d
	subl	$1, %r11d
	subl	$1, %r8d
	salq	%cl, %r9
	movl	%r13d, %ecx
	leal	0(%r13,%rax), %esi
	orl	%r11d, %r8d
	orq	%rbx, %r9
	movl	2420(%rdx,%r14,4), %ebx
	subl	$1, %eax
	orl	%r8d, %eax
	salq	%cl, %rbx
	movl	%esi, %ecx
	addl	%r10d, %esi
	subl	$1, %r10d
	orq	%r9, %rbx
	movl	2420(%rdx,%r12,4), %r9d
	orl	%r10d, %eax
	orl	%eax, 80(%rsp)
	movl	%esi, %eax
	salq	%cl, %r9
	movq	32(%rsp), %rcx
	shrl	$3, %eax
	orq	%r9, %rbx
	orq	%rcx, %rbx
	movl	%esi, %ecx
	andl	$7, %esi
	movq	%rbx, 0(%rbp)
	andl	$-8, %ecx
	addq	%rax, %rbp
	movq	72(%rsp), %rax
	shrq	%cl, %rbx
	movl	%esi, %ecx
	movq	%rbx, 32(%rsp)
	cmpq	%rax, %rdi
	jne	.L508
	movq	136(%rsp), %r9
	movl	%esi, 48(%rsp)
	movq	%rbp, %r8
	movl	112(%rsp), %r12d
	movq	120(%rsp), %r15
	movq	%rbp, 8(%rsp)
	movq	128(%rsp), %rsi
	movq	104(%rsp), %rbp
	movq	144(%rsp), %r10
	movq	152(%rsp), %r13
	subq	%r9, %rsi
	leaq	4(%rbp,%r10,4), %r9
	movq	%r9, %rbp
	subq	$4, %rsi
	je	.L509
	movl	80(%rsp), %r10d
	addq	%rsi, %rbp
	movq	%rbx, %rsi
.L510:
	movzbl	(%r9), %eax
	addq	$1, %r9
	movzbl	3700(%rdx,%rax), %edi
	movl	2420(%rdx,%rax,4), %eax
	salq	%cl, %rax
	orq	%rax, %rsi
	leal	(%rdi,%rcx), %eax
	subl	$1, %edi
	movl	%eax, %ecx
	movq	%rsi, (%r8)
	orl	%edi, %r10d
	shrl	$3, %ecx
	addq	%rcx, %r8
	movl	%eax, %ecx
	andl	$7, %eax
	andl	$-8, %ecx
	shrq	%cl, %rsi
	movl	%eax, %ecx
	cmpq	%rbp, %r9
	jne	.L510
	movl	%r10d, 80(%rsp)
	movl	%eax, 48(%rsp)
	movq	%r8, 8(%rsp)
	movq	%rsi, 32(%rsp)
.L509:
	movq	24(%rsp), %rcx
	subq	%rbp, %rcx
	cmpq	$3, %rcx
	jle	.L502
	imull	$506832829, 0(%rbp), %eax
	shrl	$17, %eax
	movl	%eax, 40(%rsp)
	jmp	.L502
	.p2align 4,,10
	.p2align 3
.L323:
	xorq	%rdi, %r11
	movl	$4, %r9d
	jmp	.L325
	.p2align 4,,10
	.p2align 3
.L850:
	movl	%eax, %ebx
	cmpl	$4, %eax
	jbe	.L868
	movl	16(%rsp), %edi
	cmpl	%eax, %edi
	cmovbe	%edi, %eax
	movl	%eax, 32(%rsp)
	jmp	.L310
	.p2align 4,,10
	.p2align 3
.L848:
	leal	-4(%rbx), %edi
	cmpl	$31, %edi
	jbe	.L562
	movq	4(%rcx), %r8
	movq	4(%r14), %rdi
	cmpq	%rdi, %r8
	jne	.L346
	movq	12(%rcx), %r8
	movq	12(%r14), %rdi
	cmpq	%rdi, %r8
	jne	.L869
	movq	20(%rcx), %rdi
	movq	20(%r14), %r8
	cmpq	%r8, %rdi
	je	.L349
	xorq	%rdi, %r8
	movl	$20, %r9d
	jmp	.L348
	.p2align 4,,10
	.p2align 3
.L865:
	movl	-3(%r14,%r9), %eax
	cmpl	%eax, -3(%r12,%r9)
	jne	.L472
	cmpl	$31, 104(%rsp)
	jbe	.L582
	movq	4(%r12), %r8
	movq	4(%r14), %rcx
	cmpq	%rcx, %r8
	jne	.L474
	movq	12(%r12), %r8
	movq	12(%r14), %rcx
	cmpq	%rcx, %r8
	je	.L475
	xorq	%r8, %rcx
	movl	$12, %r8d
.L476:
	rep bsfq	%rcx, %rcx
	shrl	$3, %ecx
	addl	%ecx, %r8d
.L480:
	cmpl	%r8d, %r10d
	jnb	.L472
	movl	%r14d, %r11d
	leal	-1(%r8), %ebx
	movl	%r8d, %r10d
	subl	%r12d, %r11d
	movl	%r8d, %r12d
	leaq	(%r14,%r12), %rbp
	jmp	.L496
	.p2align 4,,10
	.p2align 3
.L463:
	movq	20(%rdi), %r9
	movq	20(%r14), %r11
	cmpq	%r11, %r9
	je	.L465
	xorq	%r9, %r11
	movl	$20, %r10d
	jmp	.L464
	.p2align 4,,10
	.p2align 3
.L485:
	xorq	%rdi, %rcx
	movl	$4, %r10d
	jmp	.L487
	.p2align 4,,10
	.p2align 3
.L849:
	movq	24(%rsp), %rbx
	cmpq	%rbx, 32(%rsp)
	je	.L870
	movq	32(%rsp), %rcx
	movq	24(%rsp), %rsi
	jmp	.L364
	.p2align 4,,10
	.p2align 3
.L367:
	addq	$1, %rcx
	cmpq	%rsi, %rcx
	je	.L366
.L364:
	movzbl	(%rcx), %eax
	leaq	deflate_token_char(%rip), %rbx
	testb	$3, (%rbx,%rax)
	jne	.L367
.L366:
	movq	32(%rsp), %rax
	subq	%rax, %rcx
	movq	%rcx, %r8
	cmpq	$15, %rcx
	jle	.L368
	leaq	-4(%rcx), %rcx
	movq	%r8, 112(%rsp)
	movq	32(%rsp), %r10
	movq	%rcx, %r11
	andq	$-4, %rcx
	movl	%r13d, 104(%rsp)
	movq	8(%rsp), %rbp
	movq	%rcx, %r9
	shrq	$2, %r11
	leaq	5(%r14,%rcx), %rax
	movq	48(%rsp), %r13
	movl	72(%rsp), %r14d
	movl	64(%rsp), %ecx
	movq	%r11, 120(%rsp)
	movq	%r9, 128(%rsp)
	movq	%r15, 88(%rsp)
	movq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L369:
	movzbl	(%r10), %esi
	addq	$4, %r10
	movzbl	3700(%rdx,%rsi), %r11d
	leaq	(%rdx,%rsi,4), %rsi
	addl	$1, 68032(%rsi)
	movl	2420(%rsi), %edi
	movzbl	-3(%r10), %esi
	salq	%cl, %rdi
	addl	%r11d, %ecx
	subl	$1, %r11d
	movzbl	3700(%rdx,%rsi), %r8d
	leaq	(%rdx,%rsi,4), %rsi
	movl	2420(%rsi), %r9d
	addl	$1, 68032(%rsi)
	movzbl	-2(%r10), %esi
	salq	%cl, %r9
	addl	%r8d, %ecx
	subl	$1, %r8d
	orq	%rdi, %r9
	movzbl	3700(%rdx,%rsi), %edi
	leaq	(%rdx,%rsi,4), %rsi
	orl	%r11d, %r8d
	movl	2420(%rsi), %eax
	addl	$1, 68032(%rsi)
	salq	%cl, %rax
	addl	%edi, %ecx
	subl	$1, %edi
	orq	%r9, %rax
	movzbl	-1(%r10), %r9d
	orl	%r8d, %edi
	movq	%r9, %rsi
	movzbl	3700(%rdx,%r9), %r9d
	leaq	(%rdx,%rsi,4), %rbx
	movl	2420(%rbx), %esi
	addl	$1, 68032(%rbx)
	salq	%cl, %rsi
	orq	%rax, %rsi
	leal	(%rcx,%r9), %eax
	subl	$1, %r9d
	movl	%eax, %ecx
	orq	%r13, %rsi
	orl	%r9d, %edi
	shrl	$3, %ecx
	movq	%rsi, 0(%rbp)
	orl	%edi, %r14d
	addq	%rcx, %rbp
	movl	%eax, %ecx
	andl	$7, %eax
	andl	$-8, %ecx
	shrq	%cl, %rsi
	movl	%eax, %ecx
	movq	%rsi, %r13
	cmpq	%r15, %r10
	jne	.L369
	movq	112(%rsp), %r8
	movl	%eax, 64(%rsp)
	movq	120(%rsp), %r11
	movq	32(%rsp), %rax
	movq	%rsi, 48(%rsp)
	movq	88(%rsp), %r15
	movl	104(%rsp), %r13d
	movl	%r14d, 72(%rsp)
	movq	128(%rsp), %r9
	leaq	4(%rax,%r11,4), %r11
	movq	%rbp, 8(%rsp)
	movq	%r11, 32(%rsp)
	movq	%r11, %rbx
	subq	%r9, %r8
	subq	$4, %r8
	je	.L370
	addq	%r8, %rbx
	movl	%r14d, %r10d
	movl	%ecx, %eax
	movq	%rbp, %r9
	movq	%rbx, 32(%rsp)
.L371:
	movzbl	(%r11), %ecx
	addq	$1, %r11
	movzbl	3700(%rdx,%rcx), %edi
	leaq	(%rdx,%rcx,4), %r8
	movl	%eax, %ecx
	movl	2420(%r8), %ebp
	addl	$1, 68032(%r8)
	addl	%edi, %eax
	subl	$1, %edi
	salq	%cl, %rbp
	movl	%eax, %ecx
	orl	%edi, %r10d
	orq	%rbp, %rsi
	shrl	$3, %ecx
	movq	%rsi, (%r9)
	addq	%rcx, %r9
	movl	%eax, %ecx
	andl	$7, %eax
	andl	$-8, %ecx
	shrq	%cl, %rsi
	cmpq	%rbx, %r11
	jne	.L371
	movq	%rsi, 48(%rsp)
	movl	%r10d, 72(%rsp)
	movl	%eax, 64(%rsp)
	movq	%r9, 8(%rsp)
.L370:
	movq	24(%rsp), %rcx
	movq	32(%rsp), %rax
	subq	%rax, %rcx
	cmpq	$3, %rcx
	jle	.L363
	imull	$506832829, (%rax), %eax
	shrl	$17, %eax
	movl	%eax, 40(%rsp)
	jmp	.L363
	.p2align 4,,10
	.p2align 3
.L830:
	call	memcpy@PLT
	movq	32(%rsp), %rdx
	movl	32(%rbx), %esi
	movl	%r13d, %eax
	andb	5316(%rbx,%rdx), %al
	movl	$32768, %edx
	movq	%rdx, %rcx
	movzbl	%al, %eax
	subq	%rsi, %rcx
	movq	%rax, 32(%rsp)
	movq	%rsi, %rax
	movl	$0, 1124(%rbx)
	cmpq	%rcx, %r12
	jnb	.L871
	movq	56(%rsp), %rbx
	leal	-1(%rsi), %edi
	movq	%r14, %r10
	addl	%r12d, %eax
	movl	%edi, 88(%rsp)
	subq	%rsi, %r10
	movl	36(%rbx), %ecx
	movl	%eax, 32(%rbx)
	movl	%edi, %fs:mf_stale_cutoff@tpoff
	cmpl	$12, %ecx
	jbe	.L872
.L377:
	movq	24(%rsp), %rax
	cmpq	%rax, %r14
	je	.L448
	movq	56(%rsp), %rdx
	xorl	%r11d, %r11d
	movl	%r15d, 48(%rsp)
	xorl	%r9d, %r9d
	movl	$0, 80(%rsp)
	movdqa	.LC5(%rip), %xmm0
	movl	%r11d, %r12d
	movq	%r10, %r15
	leaq	74080(%rdx), %rax
	leaq	205152(%rdx), %r13
	movq	%rax, 64(%rsp)
	jmp	.L442
	.p2align 4,,10
	.p2align 3
.L386:
	movl	88(%rsp), %esi
	addw	$-32768, %cx
	movl	(%r14), %ebp
	movzwl	74080(%rdx,%r9,4), %r10d
	cmpl	%esi, %eax
	cmovle	%esi, %ecx
	imull	$506832829, 1(%r14), %eax
	shrl	$19, %eax
	movl	%eax, %esi
	movl	%eax, 40(%rsp)
	movq	64(%rsp), %rax
	prefetcht0	(%rax,%rsi,4)
	movw	%di, 74080(%rdx,%r9,4)
	cmpw	%cx, %r10w
	jle	.L390
	movswq	74082(%rdx,%r9,4), %r8
	movswq	%r10w, %rdi
	movw	%r10w, 74082(%rdx,%r9,4)
	addq	%r15, %rdi
	cmpl	(%rdi), %ebp
	je	.L873
	cmpw	%r8w, %cx
	jge	.L390
	addq	%r15, %r8
	cmpl	(%r8), %ebp
	je	.L874
.L390:
	movzbl	(%r14), %ecx
	movl	48(%rsp), %eax
	addl	$1, %r12d
	leaq	1(%r14), %rbp
	movq	32(%rsp), %rbx
	movzbl	3700(%rdx,%rcx), %edi
	movl	2420(%rdx,%rcx,4), %esi
	movl	%eax, %ecx
	addl	%edi, %eax
	salq	%cl, %rsi
	subl	$1, %edi
	orl	%edi, 80(%rsp)
	movl	%eax, %r8d
	movq	8(%rsp), %rax
	orq	%rbx, %rsi
	movl	%r8d, %ecx
	shrl	$3, %ecx
	movq	%rsi, (%rax)
	addq	%rcx, %rax
	movl	%r8d, %ecx
	andl	$7, %r8d
	andl	$-8, %ecx
	movq	%rax, 8(%rsp)
	shrq	%cl, %rsi
	movl	%r8d, 48(%rsp)
	movq	%rsi, 32(%rsp)
	testb	$15, %r12b
	je	.L875
.L433:
	movq	24(%rsp), %rax
	cmpq	%rax, %rbp
	je	.L796
.L438:
	movl	40(%rsp), %r9d
	movq	%rbp, %r14
.L442:
	movq	24(%rsp), %rax
	movl	16(%rsp), %ebx
	movl	$258, 72(%rsp)
	subq	%r14, %rax
	cmpq	$257, %rax
	jbe	.L876
.L380:
	movq	%r14, %rdi
	subq	%r15, %rdi
	movl	%edi, %ecx
	leal	-32767(%rdi), %eax
	cmpl	$32768, %edi
	jne	.L386
	movq	64(%rsp), %rax
	.p2align 4,,10
	.p2align 3
.L387:
	movdqa	%xmm0, %xmm1
	paddsw	(%rax), %xmm1
	addq	$64, %rax
	movaps	%xmm1, -64(%rax)
	movdqa	%xmm0, %xmm1
	paddsw	-48(%rax), %xmm1
	movaps	%xmm1, -48(%rax)
	movdqa	%xmm0, %xmm1
	paddsw	-32(%rax), %xmm1
	movaps	%xmm1, -32(%rax)
	movdqa	%xmm0, %xmm1
	paddsw	-16(%rax), %xmm1
	movaps	%xmm1, -16(%rax)
	cmpq	%r13, %rax
	jne	.L387
	addq	$32768, %r15
	xorl	%edi, %edi
	movl	$-32767, %eax
	xorl	%ecx, %ecx
	jmp	.L386
	.p2align 4,,10
	.p2align 3
.L873:
	movl	72(%rsp), %eax
	subl	$4, %eax
	movl	%eax, 104(%rsp)
	cmpl	$31, %eax
	jbe	.L569
	movq	4(%rdi), %r9
	movq	4(%r14), %r11
	cmpq	%r11, %r9
	jne	.L393
	movq	12(%rdi), %r9
	movq	12(%r14), %r11
	cmpq	%r11, %r9
	je	.L394
	xorq	%r9, %r11
	movl	$12, %r10d
.L395:
	rep bsfq	%r11, %r11
	shrl	$3, %r11d
	leal	(%r10,%r11), %r9d
	movq	%r9, %r10
.L400:
	cmpw	%r8w, %cx
	jge	.L403
	cmpl	%ebx, %r10d
	jnb	.L403
	leaq	(%r15,%r8), %r12
	cmpl	(%r12), %ebp
	je	.L877
.L403:
	movl	%r14d, %r11d
	leal	-1(%r10), %ebx
	leaq	(%r14,%r9), %rbp
	movl	%r10d, %r12d
	subl	%edi, %r11d
.L427:
	movl	$256, %ecx
	leal	-1(%r11), %edi
	leaq	deflate_offset_slot(%rip), %rax
	movl	4020(%rdx,%r12,4), %r8d
	subl	%r11d, %ecx
	shrl	$29, %ecx
	shrl	%cl, %edi
	movzbl	(%rax,%rdi), %edi
	movl	48(%rsp), %eax
	leal	(%rdi,%rcx,2), %edi
	movl	%eax, %ecx
	movzbl	3988(%rdx,%rdi), %r9d
	salq	%cl, %r8
	movq	32(%rsp), %rcx
	orq	%rcx, %r8
	movzbl	5056(%rdx,%r12), %ecx
	movl	3572(%rdx,%rdi,4), %r12d
	addl	%eax, %ecx
	leaq	deflate_offset_slot_base(%rip), %rax
	subl	(%rax,%rdi,4), %r11d
	leaq	deflate_extra_offset_bits(%rip), %rax
	salq	%cl, %r12
	addl	%r9d, %ecx
	movzbl	(%rax,%rdi), %edi
	orq	%r8, %r12
	movq	8(%rsp), %rax
	salq	%cl, %r11
	orq	%r12, %r11
	movq	24(%rsp), %r8
	subl	$1, %r9d
	orl	%r9d, 80(%rsp)
	addl	%ecx, %edi
	movq	%r11, (%rax)
	leal	4(%r10), %r9d
	movl	%edi, %ecx
	shrl	$3, %ecx
	addq	%rcx, %rax
	movl	%edi, %ecx
	andl	$7, %edi
	andl	$-8, %ecx
	movl	%edi, 48(%rsp)
	shrq	%cl, %r11
	leaq	1(%r14), %rcx
	movq	%rax, 8(%rsp)
	movq	%rcx, %rdi
	subq	%rcx, %r8
	movq	%r11, 32(%rsp)
	subq	%r15, %rdi
	cmpq	%r8, %r9
	jg	.L428
	leal	-1(%rbx,%rdi), %eax
	cmpl	$32767, %eax
	jbe	.L430
	movq	64(%rsp), %rax
	.p2align 4,,10
	.p2align 3
.L431:
	movdqa	%xmm0, %xmm1
	paddsw	(%rax), %xmm1
	addq	$64, %rax
	movaps	%xmm1, -64(%rax)
	movdqa	%xmm0, %xmm1
	paddsw	-48(%rax), %xmm1
	movaps	%xmm1, -48(%rax)
	movdqa	%xmm0, %xmm1
	paddsw	-32(%rax), %xmm1
	movaps	%xmm1, -32(%rax)
	movdqa	%xmm0, %xmm1
	paddsw	-16(%rax), %xmm1
	movaps	%xmm1, -16(%rax)
	cmpq	%r13, %rax
	jne	.L431
	addq	$32768, %r15
	subl	$32768, %edi
.L430:
	leal	1(%rbx), %r8d
	movq	64(%rsp), %r10
	subl	%ecx, %edi
	addq	%r14, %r8
	.p2align 4,,10
	.p2align 3
.L432:
	movzwl	74080(%rdx,%rsi,4), %eax
	leal	(%rdi,%rcx), %r9d
	addq	$1, %rcx
	movzwl	%r9w, %r9d
	sall	$16, %eax
	orl	%r9d, %eax
	movl	%eax, (%r10,%rsi,4)
	imull	$506832829, (%rcx), %esi
	shrl	$19, %esi
	cmpq	%r8, %rcx
	jne	.L432
	movl	%esi, 40(%rsp)
	movq	64(%rsp), %rax
	movl	%esi, %ecx
	prefetcht0	(%rax,%rcx,4)
.L428:
	xorl	%r12d, %r12d
	jmp	.L433
	.p2align 4,,10
	.p2align 3
.L393:
	xorq	%r9, %r11
	movl	$4, %r10d
	jmp	.L395
	.p2align 4,,10
	.p2align 3
.L876:
	movl	%eax, 72(%rsp)
	cmpl	$4, %eax
	jbe	.L878
	movl	16(%rsp), %edi
	cmpl	%eax, %edi
	cmovbe	%edi, %eax
	movl	%eax, %ebx
	jmp	.L380
	.p2align 4,,10
	.p2align 3
.L874:
	movl	72(%rsp), %eax
	leal	-4(%rax), %ecx
	cmpl	$31, %ecx
	jbe	.L573
	movq	4(%r8), %rcx
	movq	4(%r14), %rdi
	cmpq	%rdi, %rcx
	jne	.L416
	movq	12(%r8), %rcx
	movq	12(%r14), %rdi
	cmpq	%rdi, %rcx
	jne	.L879
	movq	20(%r8), %rcx
	movq	20(%r14), %rdi
	cmpq	%rdi, %rcx
	je	.L419
	xorq	%rdi, %rcx
	movl	$20, %r10d
	jmp	.L418
	.p2align 4,,10
	.p2align 3
.L875:
	movq	24(%rsp), %rax
	cmpq	%rax, %rbp
	je	.L817
	movq	24(%rsp), %rsi
	movq	%rbp, %rcx
	jmp	.L434
	.p2align 4,,10
	.p2align 3
.L437:
	addq	$1, %rcx
	cmpq	%rsi, %rcx
	je	.L436
.L434:
	movzbl	(%rcx), %eax
	leaq	deflate_token_char(%rip), %rbx
	testb	$3, (%rbx,%rax)
	jne	.L437
.L436:
	movq	%rcx, %rsi
	subq	%rbp, %rsi
	cmpq	$15, %rsi
	jle	.L438
	leaq	-4(%rsi), %rcx
	movl	%r12d, 104(%rsp)
	movq	%rbp, %rdi
	movq	%rcx, %r10
	andq	$-4, %rcx
	movq	%r15, 112(%rsp)
	movq	%rcx, %r9
	leaq	5(%r14,%rcx), %rax
	shrq	$2, %r10
	movq	%rsi, 120(%rsp)
	movq	%rax, 72(%rsp)
	movl	48(%rsp), %ecx
	movq	%r9, 136(%rsp)
	movq	%r10, 144(%rsp)
	movq	%r13, 152(%rsp)
	movq	%rbp, 128(%rsp)
	movq	8(%rsp), %rbp
	.p2align 4,,10
	.p2align 3
.L439:
	movzbl	(%rdi), %ebx
	movzbl	1(%rdi), %r9d
	addq	$4, %rdi
	movzbl	-2(%rdi), %r14d
	movzbl	-1(%rdi), %r12d
	movzbl	3700(%rdx,%rbx), %r11d
	movl	2420(%rdx,%rbx,4), %ebx
	movzbl	3700(%rdx,%r9), %r8d
	movl	2420(%rdx,%r9,4), %r9d
	movzbl	3700(%rdx,%r14), %eax
	leal	(%r11,%rcx), %r15d
	salq	%cl, %rbx
	movzbl	3700(%rdx,%r12), %r10d
	movl	%r15d, %ecx
	leal	(%r15,%r8), %r13d
	subl	$1, %r11d
	subl	$1, %r8d
	salq	%cl, %r9
	movl	%r13d, %ecx
	leal	0(%r13,%rax), %esi
	orl	%r11d, %r8d
	orq	%rbx, %r9
	movl	2420(%rdx,%r14,4), %ebx
	subl	$1, %eax
	orl	%r8d, %eax
	salq	%cl, %rbx
	movl	%esi, %ecx
	addl	%r10d, %esi
	subl	$1, %r10d
	orq	%r9, %rbx
	movl	2420(%rdx,%r12,4), %r9d
	orl	%r10d, %eax
	orl	%eax, 80(%rsp)
	movl	%esi, %eax
	salq	%cl, %r9
	movq	32(%rsp), %rcx
	shrl	$3, %eax
	orq	%r9, %rbx
	orq	%rcx, %rbx
	movl	%esi, %ecx
	andl	$7, %esi
	movq	%rbx, 0(%rbp)
	andl	$-8, %ecx
	addq	%rax, %rbp
	movq	72(%rsp), %rax
	shrq	%cl, %rbx
	movl	%esi, %ecx
	movq	%rbx, 32(%rsp)
	cmpq	%rax, %rdi
	jne	.L439
	movq	136(%rsp), %r9
	movl	%esi, 48(%rsp)
	movq	%rbp, %r8
	movq	120(%rsp), %rsi
	movl	104(%rsp), %r12d
	movq	%rbp, 8(%rsp)
	movq	144(%rsp), %r10
	movq	128(%rsp), %rbp
	subq	%r9, %rsi
	movq	112(%rsp), %r15
	movq	152(%rsp), %r13
	leaq	4(%rbp,%r10,4), %r9
	movq	%r9, %rbp
	subq	$4, %rsi
	je	.L440
	movl	80(%rsp), %r10d
	addq	%rsi, %rbp
	movq	%rbx, %rsi
.L441:
	movzbl	(%r9), %eax
	addq	$1, %r9
	movzbl	3700(%rdx,%rax), %edi
	movl	2420(%rdx,%rax,4), %eax
	salq	%cl, %rax
	orq	%rax, %rsi
	leal	(%rdi,%rcx), %eax
	subl	$1, %edi
	movl	%eax, %ecx
	movq	%rsi, (%r8)
	orl	%edi, %r10d
	shrl	$3, %ecx
	addq	%rcx, %r8
	movl	%eax, %ecx
	andl	$7, %eax
	andl	$-8, %ecx
	shrq	%cl, %rsi
	movl	%eax, %ecx
	cmpq	%rbp, %r9
	jne	.L441
	movq	%rsi, 32(%rsp)
	movl	%r10d, 80(%rsp)
	movl	%eax, 48(%rsp)
	movq	%r8, 8(%rsp)
.L440:
	movq	24(%rsp), %rcx
	subq	%rbp, %rcx
	cmpq	$3, %rcx
	jle	.L433
	imull	$506832829, 0(%rbp), %eax
	shrl	$19, %eax
	movl	%eax, 40(%rsp)
	jmp	.L433
.L790:
	movl	64(%rsp), %r15d
.L314:
	movq	56(%rsp), %rbx
	movq	48(%rsp), %rdi
	movl	%r15d, %ecx
	movl	72(%rsp), %esi
	movl	3444(%rbx), %eax
	movzbl	3956(%rbx), %edx
	movq	8(%rsp), %rbx
	salq	%cl, %rax
	orq	%rdi, %rax
	movq	%rax, (%rbx)
	testl	%esi, %esi
	jns	.L516
	xorl	%eax, %eax
	jmp	.L80
.L394:
	movq	20(%rdi), %r9
	movq	20(%r14), %r11
	cmpq	%r11, %r9
	jne	.L880
	movq	28(%rdi), %r9
	movq	28(%r14), %r11
	cmpq	%r11, %r9
	je	.L570
	xorq	%r9, %r11
	movl	$28, %r10d
	jmp	.L395
.L877:
	movl	-3(%r14,%r9), %eax
	cmpl	%eax, -3(%r12,%r9)
	jne	.L403
	cmpl	$31, 104(%rsp)
	jbe	.L571
	movq	4(%r12), %r8
	movq	4(%r14), %rcx
	cmpq	%rcx, %r8
	jne	.L405
	movq	12(%r12), %r8
	movq	12(%r14), %rcx
	cmpq	%rcx, %r8
	je	.L406
	xorq	%r8, %rcx
	movl	$12, %r8d
.L407:
	rep bsfq	%rcx, %rcx
	shrl	$3, %ecx
	addl	%ecx, %r8d
.L411:
	cmpl	%r8d, %r10d
	jnb	.L403
	movl	%r14d, %r11d
	leal	-1(%r8), %ebx
	movl	%r8d, %r10d
	subl	%r12d, %r11d
	movl	%r8d, %r12d
	leaq	(%r14,%r12), %rbp
	jmp	.L427
.L866:
	movl	-3(%r14,%rdi), %ecx
	cmpl	%ecx, -3(%rax,%rdi)
	jne	.L333
	cmpl	$31, 88(%rsp)
	jbe	.L560
	movq	4(%rax), %r8
	movq	4(%r14), %rcx
	cmpq	%rcx, %r8
	jne	.L335
	movq	12(%rax), %r8
	movq	12(%r14), %rcx
	cmpq	%rcx, %r8
	je	.L336
	xorq	%r8, %rcx
	movl	$12, %ebp
.L337:
	rep bsfq	%rcx, %rcx
	shrl	$3, %ecx
	addl	%ecx, %ebp
.L341:
	cmpl	%ebp, %r9d
	jnb	.L333
	movl	%r14d, %r8d
	movl	%ebp, %r9d
	subl	%eax, %r8d
	leal	-1(%rbp), %eax
	movl	%eax, %r13d
	movl	%ebp, %eax
	leaq	(%r14,%rax), %rbx
	movq	%rax, %rdi
	movq	%rbx, 32(%rsp)
	jmp	.L357
.L324:
	movq	20(%r10), %rdi
	movq	20(%r14), %r11
	cmpq	%r11, %rdi
	jne	.L881
	movq	28(%r10), %rdi
	movq	28(%r14), %r11
	cmpq	%r11, %rdi
	je	.L559
	xorq	%rdi, %r11
	movl	$28, %r9d
	jmp	.L325
.L465:
	movq	28(%rdi), %r9
	movq	28(%r14), %r11
	cmpq	%r11, %r9
	je	.L581
	xorq	%r9, %r11
	movl	$28, %r10d
	jmp	.L464
.L580:
	movl	$4, %r9d
.L461:
	movl	72(%rsp), %r12d
	jmp	.L466
	.p2align 4,,10
	.p2align 3
.L467:
	movq	(%rdi,%r9), %r11
	addq	$8, %r9
	movq	-8(%r14,%r9), %rax
	cmpq	%rax, %r11
	jne	.L882
.L466:
	leal	8(%r9), %eax
	movl	%r9d, %r10d
	cmpl	%eax, %r12d
	jnb	.L467
	movl	72(%rsp), %eax
	cmpl	%eax, %r9d
	jnb	.L469
	movl	72(%rsp), %eax
	movl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L470:
	movzbl	(%r14,%r9), %r11d
	movl	%r9d, %r10d
	cmpb	%r11b, (%rdi,%r9)
	jne	.L469
	addq	$1, %r9
	cmpl	%eax, %r9d
	jb	.L470
	addl	$1, %r10d
	jmp	.L469
.L346:
	xorq	%rdi, %r8
	movl	$4, %r9d
.L348:
	xorl	%edi, %edi
	rep bsfq	%r8, %rdi
	movl	%r14d, %r8d
	shrl	$3, %edi
	subl	%ecx, %r8d
	addl	%r9d, %edi
	leal	-1(%rdi), %eax
	movq	%rdi, %r9
	movl	%eax, %r13d
	leaq	(%r14,%rdi), %rax
	movq	%rax, 32(%rsp)
	jmp	.L357
.L416:
	xorq	%rdi, %rcx
	movl	$4, %r10d
.L418:
	rep bsfq	%rcx, %rcx
	movl	%r14d, %r11d
	shrl	$3, %ecx
	subl	%r8d, %r11d
	leal	(%r10,%rcx), %r12d
	movq	%r12, %r10
	leal	-1(%r12), %ebx
	leaq	(%r14,%r12), %rbp
	jmp	.L427
.L486:
	movq	20(%r8), %rcx
	movq	20(%r14), %rdi
	cmpq	%rdi, %rcx
	jne	.L883
	movq	28(%r8), %rcx
	movq	28(%r14), %rdi
	cmpq	%rdi, %rcx
	je	.L585
	xorq	%rdi, %rcx
	movl	$28, %r10d
	jmp	.L487
.L130:
	movq	8(%rsp), %r14
.L802:
	movq	32(%rsp), %r11
	movl	%ecx, 8(%rsp)
	addq	%rdi, %r11
	movq	%r11, 40(%rsp)
	addq	$1, %r11
	movq	%r11, 48(%rsp)
.L132:
	movq	24(%rsp), %r9
	movq	40(%rsp), %rbp
	movl	$258, %r11d
	subq	%rbp, %r9
	cmpq	%r11, %r9
	cmova	%r11, %r9
	movl	%r9d, %r12d
	subl	$4, %r9d
	cmpl	$31, %r9d
	jbe	.L528
	movq	4(%rdx), %r9
	movq	4(%rbp), %r11
	cmpq	%r11, %r9
	jne	.L139
	movq	12(%rdx), %r9
	movq	12(%rbp), %r11
	cmpq	%r11, %r9
	je	.L140
	xorq	%r11, %r9
	movl	$12, %r13d
.L141:
	rep bsfq	%r9, %r9
	movq	40(%rsp), %r11
	shrl	$3, %r9d
	leal	0(%r13,%r9), %edx
	leaq	(%r11,%rdx), %r12
.L146:
	movl	64(%rsp), %ebp
	movl	%ecx, %r9d
	movslq	%r8d, %r8
	movq	%rax, (%r14)
	subq	%r8, %rdi
	shrl	$3, %r9d
	orl	%ecx, %ebp
	andl	$56, %ecx
	movq	%rdi, %r13
	andl	$7, %r9d
	shrq	%cl, %rax
	movl	$256, %ecx
	addq	%r9, %r14
	subl	%edi, %ecx
	movq	%rax, %r11
	leal	-1(%rdi), %eax
	shrl	$29, %ecx
	leaq	deflate_offset_slot(%rip), %rdi
	shrl	%cl, %eax
	movzbl	(%rdi,%rax), %eax
	movl	8(%rsp), %edi
	leal	(%rax,%rcx,2), %r8d
	movl	4020(%rsi,%rdx,4), %eax
	movl	%edi, %ecx
	movzbl	3988(%rsi,%r8), %r9d
	salq	%cl, %rax
	movzbl	5056(%rsi,%rdx), %ecx
	orq	%r11, %rax
	addl	%edi, %ecx
	leaq	(%rsi,%r8,4), %rdi
	movl	3572(%rdi), %r11d
	salq	%cl, %r11
	addl	%r9d, %ecx
	subl	$1, %r9d
	orl	%ebp, %r9d
	leaq	deflate_offset_slot_base(%rip), %rbp
	orq	%rax, %r11
	movl	%r13d, %eax
	subl	0(%rbp,%r8,4), %eax
	salq	%cl, %rax
	orq	%r11, %rax
	leaq	deflate_extra_offset_bits(%rip), %r11
	movzbl	(%r11,%r8), %r8d
	leaq	deflate_length_slot(%rip), %r11
	movq	%rax, (%r14)
	movzbl	(%r11,%rdx), %edx
	addl	%ecx, %r8d
	movl	%r8d, %ecx
	addl	$1, 69060(%rsi,%rdx,4)
	movq	40(%rsp), %rdx
	orl	%r8d, %r9d
	shrl	$3, %ecx
	addl	$1, 69184(%rdi)
	movq	104(%rsp), %rdi
	andl	$7, %ecx
	addq	$3, %rdx
	movl	%r9d, 64(%rsp)
	addq	%rcx, %r14
	movl	%r8d, %ecx
	andl	$56, %ecx
	shrq	%cl, %rax
	movl	%r8d, %ecx
	andl	$7, %ecx
	cmpq	%rdx, %rdi
	cmovbe	%rdi, %rdx
	leaq	-1(%r12), %rdi
	cmpq	%rdx, %r12
	cmovbe	%r12, %rdx
	cmpq	%rdi, 88(%rsp)
	jb	.L149
	cmpq	%rdx, %rdi
	jb	.L149
	movabsq	$-5654854502012944384, %r8
	movq	32(%rsp), %r11
	imulq	-1(%r12), %r8
	subq	%r11, %rdi
	movq	16(%rsp), %r11
	shrq	$48, %r8
	movw	%di, (%r11,%r8,2)
.L149:
	cmpq	%rdx, 48(%rsp)
	jnb	.L152
	movq	16(%rsp), %rbp
	movq	48(%rsp), %rdi
	movq	32(%rsp), %r11
	.p2align 4,,10
	.p2align 3
.L150:
	movq	(%rdi), %r8
	movq	%rdi, %r9
	addq	$1, %rdi
	subq	%r11, %r9
	imulq	%r10, %r8
	shrq	$48, %r8
	movw	%r9w, 0(%rbp,%r8,2)
	cmpq	%rdi, %rdx
	jne	.L150
.L152:
	movq	32(%rsp), %rdx
	movq	%r12, %rdi
	subq	%rdx, %rdi
	movq	80(%rsp), %rdx
	cmpq	%rdx, %rdi
	jb	.L127
	movl	64(%rsp), %r8d
	movq	%r14, 8(%rsp)
	movl	%ecx, %r15d
	movq	%r12, %r14
	orl	%ecx, %r8d
	jmp	.L126
	.p2align 4,,10
	.p2align 3
.L139:
	xorq	%r11, %r9
	movl	$4, %r13d
	jmp	.L141
.L140:
	movq	40(%rsp), %r11
	movq	20(%rdx), %r9
	movq	20(%r11), %r11
	cmpq	%r11, %r9
	jne	.L884
	movq	40(%rsp), %r11
	movq	28(%rdx), %r9
	movq	28(%r11), %r11
	cmpq	%r11, %r9
	je	.L529
	xorq	%r11, %r9
	movl	$28, %r13d
	jmp	.L141
.L204:
	movq	8(%rsp), %r14
.L803:
	movq	16(%rsp), %r10
	movl	%ecx, 8(%rsp)
	addq	%rdi, %r10
	movq	%r10, 32(%rsp)
	addq	$1, %r10
.L206:
	movq	24(%rsp), %r9
	movq	32(%rsp), %r13
	movl	$258, %r11d
	subq	%r13, %r9
	cmpq	%r11, %r9
	cmova	%r11, %r9
	movl	%r9d, %r12d
	subl	$4, %r9d
	cmpl	$31, %r9d
	jbe	.L542
	movq	4(%rdx), %r9
	movq	4(%r13), %r11
	cmpq	%r11, %r9
	jne	.L213
	movq	12(%rdx), %r9
	movq	12(%r13), %r11
	cmpq	%r11, %r9
	je	.L214
	xorq	%r11, %r9
	movl	$12, %r13d
.L215:
	rep bsfq	%r9, %r9
	movq	32(%rsp), %r11
	shrl	$3, %r9d
	leal	0(%r13,%r9), %edx
	leaq	(%r11,%rdx), %r12
.L220:
	movl	40(%rsp), %r11d
	movl	%ecx, %r9d
	movslq	%esi, %rsi
	movq	%rax, (%r14)
	subq	%rsi, %rdi
	shrl	$3, %r9d
	orl	%ecx, %r11d
	andl	$56, %ecx
	leal	-1(%rdi), %esi
	andl	$7, %r9d
	shrq	%cl, %rax
	movl	$256, %ecx
	movq	%rdi, %r13
	addq	%r14, %r9
	subl	%edi, %ecx
	leaq	deflate_offset_slot(%rip), %rdi
	movq	56(%rsp), %r14
	movl	%r11d, 40(%rsp)
	shrl	$29, %ecx
	shrl	%cl, %esi
	movl	4020(%r14,%rdx,4), %r11d
	movzbl	(%rdi,%rsi), %esi
	leal	(%rsi,%rcx,2), %edi
	movzbl	8(%rsp), %ecx
	movzbl	3988(%r14,%rdi), %esi
	salq	%cl, %r11
	movzbl	5056(%r14,%rdx), %ecx
	movl	8(%rsp), %edx
	orq	%r11, %rax
	movl	3572(%r14,%rdi,4), %r11d
	addl	%edx, %ecx
	salq	%cl, %r11
	addl	%esi, %ecx
	subl	$1, %esi
	orq	%rax, %r11
	movl	40(%rsp), %eax
	orl	%eax, %esi
	leaq	deflate_offset_slot_base(%rip), %rax
	subl	(%rax,%rdi,4), %r13d
	leaq	deflate_extra_offset_bits(%rip), %rax
	movzbl	(%rax,%rdi), %edx
	salq	%cl, %r13
	movq	80(%rsp), %rdi
	orq	%r11, %r13
	addl	%ecx, %edx
	movq	%r13, (%r9)
	movl	%edx, %eax
	movl	%edx, %ecx
	orl	%edx, %esi
	shrl	$3, %eax
	andl	$56, %ecx
	movl	%esi, 40(%rsp)
	leaq	-1(%r12), %rsi
	andl	$7, %eax
	leaq	(%r9,%rax), %r14
	movq	%r13, %rax
	shrq	%cl, %rax
	movl	%edx, %ecx
	movq	32(%rsp), %rdx
	andl	$7, %ecx
	addq	$3, %rdx
	cmpq	%rdx, %rdi
	cmovbe	%rdi, %rdx
	cmpq	%rdx, %r12
	cmovbe	%r12, %rdx
	cmpq	%rsi, 72(%rsp)
	jb	.L223
	cmpq	%rdx, %rsi
	jb	.L223
	movabsq	$-5654854502012944384, %rdi
	imulq	-1(%r12), %rdi
	movq	16(%rsp), %r11
	subq	%r11, %rsi
	shrq	$48, %rdi
	movw	%si, 0(%rbp,%rdi,2)
.L223:
	movq	16(%rsp), %r9
	cmpq	%rdx, %r10
	jnb	.L226
	.p2align 4,,10
	.p2align 3
.L224:
	movq	(%r10), %rsi
	movq	%r10, %rdi
	addq	$1, %r10
	subq	%r9, %rdi
	imulq	%r8, %rsi
	shrq	$48, %rsi
	movw	%di, 0(%rbp,%rsi,2)
	cmpq	%r10, %rdx
	jne	.L224
.L226:
	movq	16(%rsp), %rsi
	movq	%r12, %rdi
	subq	%rsi, %rdi
	movq	64(%rsp), %rsi
	cmpq	%rsi, %rdi
	jb	.L201
	movl	40(%rsp), %r8d
	movq	%r14, 8(%rsp)
	movl	%ecx, %r15d
	movq	%r12, %r14
	orl	%ecx, %r8d
	jmp	.L200
	.p2align 4,,10
	.p2align 3
.L213:
	xorq	%r11, %r9
	movl	$4, %r13d
	jmp	.L215
.L214:
	movq	32(%rsp), %r11
	movq	20(%rdx), %r9
	movq	20(%r11), %r11
	cmpq	%r11, %r9
	jne	.L885
	movq	32(%rsp), %r11
	movq	28(%rdx), %r9
	movq	28(%r11), %r11
	cmpq	%r11, %r9
	je	.L543
	xorq	%r11, %r9
	movl	$28, %r13d
	jmp	.L215
.L825:
	movl	%ecx, %r9d
	movq	8(%rsp), %r14
	addq	$2, %rdi
	andl	$7, %r9d
	movl	%r9d, 8(%rsp)
	movq	40(%rsp), %r9
	movq	%r11, 40(%rsp)
	movq	%r9, 48(%rsp)
	jmp	.L132
.L824:
	subq	$1, %r11
	movq	8(%rsp), %r14
	addq	$1, %rdi
	movq	%r11, 40(%rsp)
	movl	%ecx, %r11d
	andl	$7, %r11d
	movl	%r11d, 8(%rsp)
	jmp	.L132
.L840:
	movl	%ecx, %r10d
	movq	8(%rsp), %r14
	addq	$2, %rdi
	andl	$7, %r10d
	movl	%r10d, 8(%rsp)
	movq	32(%rsp), %r10
	movq	%r9, 32(%rsp)
	jmp	.L206
.L839:
	leaq	-1(%r9), %r11
	movq	32(%rsp), %r10
	movq	8(%rsp), %r14
	addq	$1, %rdi
	movq	%r11, 32(%rsp)
	movl	%ecx, %r11d
	andl	$7, %r11d
	movl	%r11d, 8(%rsp)
	jmp	.L206
.L841:
	addq	%r11, %r10
	movl	%ecx, %r11d
	movq	8(%rsp), %r14
	addq	$3, %rdi
	andl	$7, %r11d
	movl	%r11d, 8(%rsp)
	jmp	.L206
.L826:
	movq	%rbp, %r11
	movq	8(%rsp), %r14
	addq	$3, %rdi
	addq	%r9, %r11
	movq	%r11, 48(%rsp)
	movl	%ecx, %r11d
	andl	$7, %r11d
	movl	%r11d, 8(%rsp)
	jmp	.L132
.L882:
	xorq	%rax, %r11
	jmp	.L464
.L844:
	movq	96(%rsp), %rdi
	leaq	5316(%rbx), %rsi
	movq	%rdx, 32(%rsp)
	call	memcpy@PLT
	movq	32(%rsp), %rdx
	movl	32(%rbx), %esi
	movl	%r13d, %eax
	andb	5316(%rbx,%rdx), %al
	movl	$32768, %edx
	movl	$0, 1124(%rbx)
	movq	%rdx, %rcx
	movzbl	%al, %eax
	subq	%rsi, %rcx
	movq	%rax, 48(%rsp)
	movq	%rsi, %rax
	cmpq	%rcx, %r12
	jnb	.L886
	movq	56(%rsp), %rbx
	leal	-1(%rsi), %edi
	movq	%r14, %rbp
	addl	%r12d, %eax
	movl	%edi, 72(%rsp)
	subq	%rsi, %rbp
	movl	36(%rbx), %ecx
	movl	%eax, 32(%rbx)
	movl	%edi, %fs:mf_stale_cutoff@tpoff
	cmpl	$12, %ecx
	ja	.L236
	leaq	74080(%rbx), %rax
	testl	%ecx, %ecx
	je	.L545
	movl	$4, %esi
	salq	%cl, %rsi
	subq	%rsi, %rdx
	addq	%rsi, %rax
.L235:
	movdqa	.LC4(%rip), %xmm0
	addq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L237:
	movaps	%xmm0, (%rax)
	addq	$64, %rax
	movaps	%xmm0, -48(%rax)
	movaps	%xmm0, -32(%rax)
	movaps	%xmm0, -16(%rax)
	cmpq	%rdx, %rax
	jne	.L237
	movq	56(%rsp), %rax
	movl	$13, 36(%rax)
.L236:
	movq	24(%rsp), %rax
	cmpq	%rax, %r14
	je	.L309
	movq	56(%rsp), %rdx
	movl	%r15d, %r11d
	xorl	%r13d, %r13d
	xorl	%ecx, %ecx
	movl	$0, 64(%rsp)
	movdqa	.LC5(%rip), %xmm0
	movq	%rbp, %r15
	leaq	74080(%rdx), %r12
	jmp	.L303
	.p2align 4,,10
	.p2align 3
.L245:
	movl	72(%rsp), %edi
	addw	$-32768, %r8w
	movl	(%r14), %ebp
	cmpl	%eax, %edi
	cmovge	%edi, %r8d
	imull	$506832829, 1(%r14), %eax
	movl	%ecx, %edi
	movzwl	74080(%rdx,%rdi,4), %r9d
	shrl	$19, %eax
	movl	%eax, %esi
	movl	%eax, 40(%rsp)
	prefetcht0	(%r12,%rsi,4)
	movw	%r10w, 74080(%rdx,%rdi,4)
	cmpw	%r8w, %r9w
	jle	.L249
	movswq	74082(%rdx,%rdi,4), %r10
	movswq	%r9w, %rcx
	movw	%r9w, 74082(%rdx,%rdi,4)
	addq	%r15, %rcx
	cmpl	(%rcx), %ebp
	je	.L887
	cmpw	%r10w, %r8w
	jge	.L249
	addq	%r15, %r10
	cmpl	(%r10), %ebp
	je	.L888
.L249:
	movzbl	(%r14), %esi
	leaq	1(%r14), %rax
	movl	%r11d, %ecx
	addl	$1, %r13d
	movq	%rax, 32(%rsp)
	movq	48(%rsp), %rax
	movzbl	3700(%rdx,%rsi), %r8d
	leaq	(%rdx,%rsi,4), %r9
	movl	2420(%r9), %esi
	addl	$1, 68032(%r9)
	leal	(%r8,%r11), %r10d
	subl	$1, %r8d
	orl	%r8d, 64(%rsp)
	salq	%cl, %rsi
	movl	%r10d, %ecx
	orq	%rax, %rsi
	movq	8(%rsp), %rax
	shrl	$3, %ecx
	movq	%rsi, (%rax)
	addq	%rcx, %rax
	movl	%r10d, %ecx
	andl	$7, %r10d
	andl	$-8, %ecx
	movq	%rax, 8(%rsp)
	movl	%r10d, %r11d
	shrq	%cl, %rsi
	movq	%rsi, 48(%rsp)
	testb	$15, %r13b
	je	.L889
.L294:
	movq	24(%rsp), %rbx
	cmpq	%rbx, 32(%rsp)
	je	.L787
.L299:
	movl	40(%rsp), %ecx
	movq	32(%rsp), %r14
.L303:
	movq	24(%rsp), %rax
	movl	16(%rsp), %ebx
	subq	%r14, %rax
	movl	%ebx, 32(%rsp)
	movl	$258, %ebx
	cmpq	$257, %rax
	jbe	.L890
.L239:
	movq	%r14, %r10
	subq	%r15, %r10
	movl	%r10d, %r8d
	leal	-32767(%r10), %eax
	cmpl	$32768, %r10d
	jne	.L245
	leaq	205152(%rdx), %rsi
	movq	%r12, %rax
	.p2align 4,,10
	.p2align 3
.L246:
	movdqa	%xmm0, %xmm1
	paddsw	(%rax), %xmm1
	addq	$64, %rax
	movaps	%xmm1, -64(%rax)
	movdqa	%xmm0, %xmm1
	paddsw	-48(%rax), %xmm1
	movaps	%xmm1, -48(%rax)
	movdqa	%xmm0, %xmm1
	paddsw	-32(%rax), %xmm1
	movaps	%xmm1, -32(%rax)
	movdqa	%xmm0, %xmm1
	paddsw	-16(%rax), %xmm1
	movaps	%xmm1, -16(%rax)
	cmpq	%rsi, %rax
	jne	.L246
	addq	$32768, %r15
	xorl	%r10d, %r10d
	movl	$-32767, %eax
	xorl	%r8d, %r8d
	jmp	.L245
.L857:
	movq	%r11, 8(%rsp)
	movl	%r15d, 48(%rsp)
	movq	40(%rsp), %r15
.L92:
	movq	32(%rsp), %r10
	movl	%ecx, 80(%rsp)
	addq	%rdi, %r10
	movq	%r10, 40(%rsp)
	leaq	1(%r10), %r12
.L94:
	movq	24(%rsp), %r10
	movq	40(%rsp), %rbp
	movl	$258, %r11d
	subq	%rbp, %r10
	cmpq	%r11, %r10
	cmova	%r11, %r10
	movl	%r10d, %r14d
	subl	$4, %r10d
	cmpl	$31, %r10d
	jbe	.L521
	movq	4(%rdx), %r10
	movq	4(%rbp), %r11
	cmpq	%r11, %r10
	jne	.L101
	movq	12(%rdx), %r10
	movq	12(%rbp), %r11
	cmpq	%r11, %r10
	jne	.L891
	movq	40(%rsp), %r11
	movq	20(%rdx), %r10
	movq	20(%r11), %r11
	cmpq	%r11, %r10
	je	.L104
	xorq	%r11, %r10
	movl	$20, %r13d
	jmp	.L103
.L101:
	xorq	%r11, %r10
	movl	$4, %r13d
.L103:
	xorl	%edx, %edx
	rep bsfq	%r10, %rdx
	movq	40(%rsp), %r10
	shrl	$3, %edx
	addl	%r13d, %edx
	movl	%edx, %edx
	leaq	(%r10,%rdx), %r14
.L108:
	movl	48(%rsp), %r10d
	movq	8(%rsp), %r11
	movslq	%r9d, %r9
	subq	%r9, %rdi
	orl	%ecx, %r10d
	movq	%rax, (%r11)
	movq	%rdi, %r13
	movl	%r10d, %ebp
	movl	%ecx, %r10d
	andl	$56, %ecx
	shrl	$3, %r10d
	andl	$7, %r10d
	addq	%r10, %r11
	movq	%r11, 8(%rsp)
	movq	%rax, %r11
	leal	-1(%rdi), %eax
	shrq	%cl, %r11
	movl	$256, %ecx
	subl	%edi, %ecx
	leaq	deflate_offset_slot(%rip), %rdi
	shrl	$29, %ecx
	shrl	%cl, %eax
	movzbl	(%rdi,%rax), %eax
	movl	80(%rsp), %edi
	leal	(%rax,%rcx,2), %r9d
	movl	4020(%rsi,%rdx,4), %eax
	movl	%edi, %ecx
	movzbl	3988(%rsi,%r9), %r10d
	salq	%cl, %rax
	movzbl	5056(%rsi,%rdx), %ecx
	orq	%r11, %rax
	addl	%edi, %ecx
	leaq	(%rsi,%r9,4), %rdi
	movl	3572(%rdi), %r11d
	salq	%cl, %r11
	addl	%r10d, %ecx
	subl	$1, %r10d
	orl	%ebp, %r10d
	leaq	deflate_offset_slot_base(%rip), %rbp
	orq	%rax, %r11
	movl	%r13d, %eax
	subl	0(%rbp,%r9,4), %eax
	salq	%cl, %rax
	orq	%r11, %rax
	leaq	deflate_extra_offset_bits(%rip), %r11
	movzbl	(%r11,%r9), %r9d
	movq	8(%rsp), %r11
	addl	%ecx, %r9d
	movq	%rax, (%r11)
	orl	%r9d, %r10d
	movl	%r9d, %ecx
	movl	%r10d, 48(%rsp)
	leaq	deflate_length_slot(%rip), %r10
	shrl	$3, %ecx
	movzbl	(%r10,%rdx), %edx
	andl	$7, %ecx
	addq	%rcx, %r11
	movl	%r9d, %ecx
	addl	$1, 69060(%rsi,%rdx,4)
	movq	40(%rsp), %rdx
	andl	$56, %ecx
	addl	$1, 69184(%rdi)
	movq	104(%rsp), %rdi
	shrq	%cl, %rax
	movl	%r9d, %ecx
	addq	$3, %rdx
	andl	$7, %ecx
	movq	%r11, 8(%rsp)
	cmpq	%rdx, %rdi
	cmovbe	%rdi, %rdx
	leaq	-1(%r14), %rdi
	cmpq	%rdx, %r14
	cmovbe	%r14, %rdx
	cmpq	%rdi, 88(%rsp)
	jb	.L111
	cmpq	%rdx, %rdi
	jb	.L111
	movabsq	$-5654854502012944384, %r9
	imulq	-1(%r14), %r9
	movq	32(%rsp), %r10
	subq	%r10, %rdi
	shrq	$50, %r9
	movw	%di, (%r15,%r9,2)
.L111:
	movq	32(%rsp), %r10
	cmpq	%rdx, %r12
	jnb	.L114
	.p2align 4,,10
	.p2align 3
.L112:
	movq	(%r12), %rdi
	movq	%r12, %r9
	addq	$1, %r12
	subq	%r10, %r9
	imulq	%r8, %rdi
	shrq	$50, %rdi
	movw	%r9w, (%r15,%rdi,2)
	cmpq	%r12, %rdx
	jne	.L112
.L114:
	movq	32(%rsp), %rdx
	movq	%r14, %rdi
	subq	%rdx, %rdi
	movq	72(%rsp), %rdx
	cmpq	%rdx, %rdi
	jb	.L89
	movl	48(%rsp), %r9d
	movl	%ecx, %r15d
	orl	%ecx, %r9d
	jmp	.L88
.L864:
	movq	%r11, 8(%rsp)
	movl	%r13d, 40(%rsp)
	movq	32(%rsp), %r13
.L168:
	movq	16(%rsp), %r10
	movl	%ecx, 72(%rsp)
	addq	%rdi, %r10
	movq	%r10, 32(%rsp)
	addq	$1, %r10
.L170:
	movq	24(%rsp), %r9
	movq	32(%rsp), %rbp
	movl	$258, %r11d
	subq	%rbp, %r9
	cmpq	%r11, %r9
	cmova	%r11, %r9
	movl	%r9d, %r14d
	subl	$4, %r9d
	cmpl	$31, %r9d
	jbe	.L535
	movq	4(%rdx), %r9
	movq	4(%rbp), %r11
	cmpq	%r11, %r9
	jne	.L177
	movq	12(%rdx), %r9
	movq	12(%rbp), %r11
	cmpq	%r11, %r9
	jne	.L892
	movq	32(%rsp), %r11
	movq	20(%rdx), %r9
	movq	20(%r11), %r11
	cmpq	%r11, %r9
	je	.L180
	xorq	%r11, %r9
	movl	$20, %r12d
	jmp	.L179
.L177:
	xorq	%r11, %r9
	movl	$4, %r12d
.L179:
	xorl	%edx, %edx
	movq	32(%rsp), %r14
	rep bsfq	%r9, %rdx
	shrl	$3, %edx
	addl	%r12d, %edx
	movl	%edx, %edx
	leaq	(%r14,%rdx), %rbp
.L184:
	movl	40(%rsp), %r14d
	movq	8(%rsp), %r11
	movl	%ecx, %r9d
	movslq	%esi, %rsi
	subq	%rsi, %rdi
	shrl	$3, %r9d
	orl	%ecx, %r14d
	andl	$56, %ecx
	movq	%rax, (%r11)
	leal	-1(%rdi), %esi
	shrq	%cl, %rax
	movl	$256, %ecx
	movq	%rdi, %r12
	andl	$7, %r9d
	subl	%edi, %ecx
	leaq	deflate_offset_slot(%rip), %rdi
	addq	%r11, %r9
	shrl	$29, %ecx
	shrl	%cl, %esi
	movzbl	(%rdi,%rsi), %esi
	leal	(%rsi,%rcx,2), %edi
	movq	56(%rsp), %rcx
	movzbl	3988(%rcx,%rdi), %esi
	movl	4020(%rcx,%rdx,4), %r11d
	movzbl	72(%rsp), %ecx
	salq	%cl, %r11
	orq	%rax, %r11
	movq	56(%rsp), %rax
	movzbl	5056(%rax,%rdx), %ecx
	movl	72(%rsp), %edx
	addl	%edx, %ecx
	movl	3572(%rax,%rdi,4), %edx
	movl	%r12d, %eax
	salq	%cl, %rdx
	addl	%esi, %ecx
	subl	$1, %esi
	orl	%r14d, %esi
	leaq	deflate_offset_slot_base(%rip), %r14
	orq	%r11, %rdx
	subl	(%r14,%rdi,4), %eax
	salq	%cl, %rax
	orq	%rdx, %rax
	leaq	deflate_extra_offset_bits(%rip), %rdx
	movzbl	(%rdx,%rdi), %edx
	movq	%rax, (%r9)
	addl	%ecx, %edx
	movl	%edx, %ecx
	orl	%edx, %esi
	shrl	$3, %ecx
	movl	%esi, 40(%rsp)
	leaq	-1(%rbp), %rsi
	andl	$7, %ecx
	leaq	(%r9,%rcx), %rdi
	movl	%edx, %ecx
	andl	$56, %ecx
	movq	%rdi, 8(%rsp)
	movq	88(%rsp), %rdi
	shrq	%cl, %rax
	movl	%edx, %ecx
	movq	32(%rsp), %rdx
	andl	$7, %ecx
	addq	$3, %rdx
	cmpq	%rdx, %rdi
	cmovbe	%rdi, %rdx
	cmpq	%rdx, %rbp
	cmovbe	%rbp, %rdx
	cmpq	%rsi, 80(%rsp)
	jb	.L187
	cmpq	%rdx, %rsi
	jb	.L187
	movabsq	$-5654854502012944384, %rdi
	imulq	-1(%rbp), %rdi
	movq	16(%rsp), %r14
	subq	%r14, %rsi
	shrq	$50, %rdi
	movw	%si, 0(%r13,%rdi,2)
.L187:
	movq	16(%rsp), %r9
	cmpq	%rdx, %r10
	jnb	.L190
	.p2align 4,,10
	.p2align 3
.L188:
	movq	(%r10), %rsi
	movq	%r10, %rdi
	addq	$1, %r10
	subq	%r9, %rdi
	imulq	%r8, %rsi
	shrq	$50, %rsi
	movw	%di, 0(%r13,%rsi,2)
	cmpq	%r10, %rdx
	jne	.L188
.L190:
	movq	16(%rsp), %rsi
	movq	%rbp, %rdi
	subq	%rsi, %rdi
	movq	64(%rsp), %rsi
	cmpq	%rsi, %rdi
	jb	.L165
	movl	40(%rsp), %esi
	movl	%ecx, %r15d
	movq	%rbp, %r14
	orl	%ecx, %esi
	jmp	.L164
.L822:
	movl	$32768, %edx
	movq	56(%rsp), %rdi
	movl	$-32768, %r9d
	movl	$131072, %ecx
	cmpq	%rdx, %r12
	cmovbe	%r12, %rdx
	movl	%edx, 32(%rdi)
	movq	%rbp, %rdx
	xorl	%edi, %edi
	movl	$-32768, %fs:mf_stale_cutoff@tpoff
	movq	%r14, 32(%rsp)
.L123:
	movdqa	.LC4(%rip), %xmm0
	addq	%rdx, %rcx
	.p2align 4,,10
	.p2align 3
.L125:
	movaps	%xmm0, (%rdx)
	addq	$64, %rdx
	movaps	%xmm0, -48(%rdx)
	movaps	%xmm0, -32(%rdx)
	movaps	%xmm0, -16(%rdx)
	cmpq	%rcx, %rdx
	jne	.L125
	movq	56(%rsp), %rsi
	movl	$15, 36(%rsi)
	jmp	.L124
.L837:
	movl	$32768, %edx
	movq	56(%rsp), %rdi
	movl	$-32768, %r9d
	movl	$131072, %ecx
	cmpq	%rdx, %r12
	cmovbe	%r12, %rdx
	movl	%edx, 32(%rdi)
	movq	%rbp, %rdx
	xorl	%edi, %edi
	movl	$-32768, %fs:mf_stale_cutoff@tpoff
	movq	%r14, 16(%rsp)
.L197:
	movdqa	.LC4(%rip), %xmm0
	addq	%rdx, %rcx
	.p2align 4,,10
	.p2align 3
.L199:
	movaps	%xmm0, (%rdx)
	addq	$64, %rdx
	movaps	%xmm0, -48(%rdx)
	movaps	%xmm0, -32(%rdx)
	movaps	%xmm0, -16(%rdx)
	cmpq	%rcx, %rdx
	jne	.L199
	movq	56(%rsp), %rsi
	movl	$15, 36(%rsi)
	jmp	.L198
.L881:
	xorq	%rdi, %r11
	movl	$20, %r9d
	jmp	.L325
.L880:
	xorq	%r9, %r11
	movl	$20, %r10d
	jmp	.L395
.L581:
	movl	$36, %r9d
	jmp	.L461
.L869:
	xorq	%rdi, %r8
	movl	$12, %r9d
	jmp	.L348
.L879:
	xorq	%rdi, %rcx
	movl	$12, %r10d
	jmp	.L418
.L883:
	xorq	%rdi, %rcx
	movl	$20, %r10d
	jmp	.L487
.L846:
	leaq	74080(%rbx), %rax
	testl	%ecx, %ecx
	je	.L556
	movl	$4, %edx
	salq	%cl, %rdx
	movq	%rdx, %rcx
	movl	$131072, %edx
	subq	%rcx, %rdx
	addq	%rcx, %rax
.L306:
	movdqa	.LC4(%rip), %xmm0
	addq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L308:
	movaps	%xmm0, (%rax)
	addq	$64, %rax
	movaps	%xmm0, -48(%rax)
	movaps	%xmm0, -32(%rax)
	movaps	%xmm0, -16(%rax)
	cmpq	%rdx, %rax
	jne	.L308
	movq	56(%rsp), %rax
	movl	$15, 36(%rax)
	jmp	.L307
.L872:
	leaq	74080(%rbx), %rax
	testl	%ecx, %ecx
	je	.L567
	movl	$4, %esi
	salq	%cl, %rsi
	subq	%rsi, %rdx
	addq	%rsi, %rax
.L376:
	movdqa	.LC4(%rip), %xmm0
	addq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L378:
	movaps	%xmm0, (%rax)
	addq	$64, %rax
	movaps	%xmm0, -48(%rax)
	movaps	%xmm0, -32(%rax)
	movaps	%xmm0, -16(%rax)
	cmpq	%rdx, %rax
	jne	.L378
	movq	56(%rsp), %rax
	movl	$13, 36(%rax)
	jmp	.L377
.L891:
	xorq	%r11, %r10
	movl	$12, %r13d
	jmp	.L103
.L892:
	xorq	%r11, %r9
	movl	$12, %r12d
	jmp	.L179
.L884:
	xorq	%r11, %r9
	movl	$20, %r13d
	jmp	.L141
.L885:
	xorq	%r11, %r9
	movl	$20, %r13d
	jmp	.L215
.L474:
	xorq	%r8, %rcx
	movl	$4, %r8d
	jmp	.L476
.L886:
	movl	$32768, %eax
	movq	56(%rsp), %rbx
	movq	%r14, %rbp
	cmpq	%rax, %r12
	cmovbe	%r12, %rax
	movl	%eax, 32(%rbx)
	leaq	74080(%rbx), %rax
	movl	$-32768, %fs:mf_stale_cutoff@tpoff
	movl	$-32768, 72(%rsp)
	jmp	.L235
.L859:
	testl	%ecx, %ecx
	je	.L531
	movl	$4, %edx
	salq	%cl, %rdx
	movq	32(%rsp), %rcx
	subq	%rdx, %rsi
	addq	%rcx, %rdx
.L161:
	movdqa	.LC4(%rip), %xmm0
	leaq	(%rdx,%rsi), %rcx
	.p2align 4,,10
	.p2align 3
.L163:
	movaps	%xmm0, (%rdx)
	addq	$64, %rdx
	movaps	%xmm0, -48(%rdx)
	movaps	%xmm0, -32(%rdx)
	movaps	%xmm0, -16(%rdx)
	cmpq	%rcx, %rdx
	jne	.L163
	movq	56(%rsp), %rsi
	movl	$13, 36(%rsi)
	jmp	.L162
.L852:
	testl	%ecx, %ecx
	je	.L517
	movl	$4, %edx
	salq	%cl, %rdx
	movq	40(%rsp), %rcx
	subq	%rdx, %rsi
	addq	%rcx, %rdx
.L85:
	movdqa	.LC4(%rip), %xmm0
	leaq	(%rdx,%rsi), %rcx
	.p2align 4,,10
	.p2align 3
.L87:
	movaps	%xmm0, (%rdx)
	addq	$64, %rdx
	movaps	%xmm0, -48(%rdx)
	movaps	%xmm0, -32(%rdx)
	movaps	%xmm0, -16(%rdx)
	cmpq	%rcx, %rdx
	jne	.L87
	movq	56(%rsp), %rsi
	movl	$13, 36(%rsi)
	jmp	.L86
	.p2align 4,,10
	.p2align 3
.L887:
	leal	-4(%rbx), %eax
	movl	%eax, 80(%rsp)
	cmpl	$31, %eax
	jbe	.L547
	movq	4(%rcx), %rdi
	movq	4(%r14), %rax
	cmpq	%rax, %rdi
	jne	.L252
	movq	12(%rcx), %rdi
	movq	12(%r14), %rax
	cmpq	%rax, %rdi
	je	.L253
	xorq	%rdi, %rax
	movl	$12, %r9d
.L254:
	rep bsfq	%rax, %rax
	shrl	$3, %eax
	leal	(%r9,%rax), %edi
	movq	%rdi, %r9
.L259:
	cmpw	%r10w, %r8w
	jge	.L265
	movl	32(%rsp), %eax
	cmpl	%eax, %r9d
	jnb	.L265
	leaq	(%r15,%r10), %r13
	cmpl	0(%r13), %ebp
	je	.L893
.L265:
	leal	-1(%r9), %eax
	movl	%r14d, %r8d
	movl	%r9d, %r13d
	movl	%eax, 80(%rsp)
	leaq	(%r14,%rdi), %rax
	subl	%ecx, %r8d
	movq	%rax, 32(%rsp)
.L264:
	movl	$256, %ecx
	leal	-1(%r8), %r10d
	leaq	deflate_offset_slot(%rip), %rax
	movl	4020(%rdx,%r13,4), %ebx
	subl	%r8d, %ecx
	shrl	$29, %ecx
	shrl	%cl, %r10d
	movzbl	(%rax,%r10), %r10d
	movq	48(%rsp), %rax
	leal	(%r10,%rcx,2), %r10d
	movl	%r11d, %ecx
	movzbl	3988(%rdx,%r10), %ebp
	salq	%cl, %rbx
	leaq	(%rdx,%r10,4), %rdi
	movzbl	5056(%rdx,%r13), %ecx
	orq	%rbx, %rax
	addl	%r11d, %ecx
	movl	3572(%rdi), %r11d
	salq	%cl, %r11
	addl	%ebp, %ecx
	subl	$1, %ebp
	orl	%ebp, 64(%rsp)
	orq	%rax, %r11
	leaq	deflate_offset_slot_base(%rip), %rax
	subl	(%rax,%r10,4), %r8d
	leaq	deflate_extra_offset_bits(%rip), %rax
	movzbl	(%rax,%r10), %r10d
	salq	%cl, %r8
	movq	8(%rsp), %rax
	orq	%r11, %r8
	addl	%ecx, %r10d
	movq	%r8, (%rax)
	movl	%r10d, %ecx
	shrl	$3, %ecx
	addq	%rcx, %rax
	movl	%r10d, %ecx
	andl	$7, %r10d
	andl	$-8, %ecx
	movq	%rax, 8(%rsp)
	leaq	deflate_length_slot(%rip), %rax
	movl	%r10d, %r11d
	shrq	%cl, %r8
	movzbl	(%rax,%r13), %ecx
	leal	4(%r9), %r10d
	movq	24(%rsp), %r9
	movq	%r8, 48(%rsp)
	addl	$1, 69060(%rdx,%rcx,4)
	leaq	1(%r14), %rcx
	movq	%rcx, %r8
	subq	%rcx, %r9
	addl	$1, 69184(%rdi)
	subq	%r15, %r8
	cmpq	%r9, %r10
	jg	.L289
	movl	80(%rsp), %eax
	leal	-1(%rax,%r8), %eax
	cmpl	$32767, %eax
	jbe	.L291
	leaq	205152(%rdx), %r9
	movq	%r12, %rax
	.p2align 4,,10
	.p2align 3
.L292:
	movdqa	%xmm0, %xmm1
	paddsw	(%rax), %xmm1
	addq	$64, %rax
	movaps	%xmm1, -64(%rax)
	movdqa	%xmm0, %xmm1
	paddsw	-48(%rax), %xmm1
	movaps	%xmm1, -48(%rax)
	movdqa	%xmm0, %xmm1
	paddsw	-32(%rax), %xmm1
	movaps	%xmm1, -32(%rax)
	movdqa	%xmm0, %xmm1
	paddsw	-16(%rax), %xmm1
	movaps	%xmm1, -16(%rax)
	cmpq	%r9, %rax
	jne	.L292
	addq	$32768, %r15
	subl	$32768, %r8d
.L291:
	movl	80(%rsp), %eax
	subl	%ecx, %r8d
	leal	1(%rax), %r9d
	addq	%r14, %r9
	.p2align 4,,10
	.p2align 3
.L293:
	movzwl	74080(%rdx,%rsi,4), %eax
	leal	(%r8,%rcx), %edi
	addq	$1, %rcx
	movzwl	%di, %edi
	sall	$16, %eax
	orl	%edi, %eax
	movl	%eax, (%r12,%rsi,4)
	imull	$506832829, (%rcx), %esi
	shrl	$19, %esi
	cmpq	%r9, %rcx
	jne	.L293
	movl	%esi, 40(%rsp)
	movl	%esi, %ecx
	prefetcht0	(%r12,%rcx,4)
.L289:
	xorl	%r13d, %r13d
	jmp	.L294
.L252:
	xorq	%rdi, %rax
	movl	$4, %r9d
	jmp	.L254
.L890:
	movl	%eax, %ebx
	cmpl	$4, %eax
	jbe	.L894
	movl	16(%rsp), %edi
	cmpl	%eax, %edi
	cmovbe	%edi, %eax
	movl	%eax, 32(%rsp)
	jmp	.L239
.L888:
	leal	-4(%rbx), %ecx
	cmpl	$31, %ecx
	jbe	.L551
	movq	4(%r10), %rcx
	movq	4(%r14), %rdi
	cmpq	%rdi, %rcx
	jne	.L278
	movq	12(%r10), %rcx
	movq	12(%r14), %rdi
	cmpq	%rdi, %rcx
	je	.L279
	xorq	%rdi, %rcx
	movl	$12, %r9d
.L280:
	rep bsfq	%rcx, %rcx
	movl	%r14d, %r8d
	shrl	$3, %ecx
	subl	%r10d, %r8d
	leal	(%r9,%rcx), %r13d
	leal	-1(%r13), %eax
	movq	%r13, %r9
	movl	%eax, 80(%rsp)
	leaq	(%r14,%r13), %rax
	movq	%rax, 32(%rsp)
	jmp	.L264
.L889:
	movq	24(%rsp), %rbx
	cmpq	%rbx, 32(%rsp)
	je	.L787
	movq	32(%rsp), %rcx
	movq	24(%rsp), %rsi
	jmp	.L295
	.p2align 4,,10
	.p2align 3
.L298:
	addq	$1, %rcx
	cmpq	%rsi, %rcx
	je	.L297
.L295:
	movzbl	(%rcx), %eax
	leaq	deflate_token_char(%rip), %rbx
	testb	$3, (%rbx,%rax)
	jne	.L298
.L297:
	movq	32(%rsp), %rax
	subq	%rax, %rcx
	movq	%rcx, %r8
	cmpq	$15, %rcx
	jle	.L299
	leaq	-4(%rcx), %rcx
	movq	%r8, 88(%rsp)
	movq	32(%rsp), %r10
	movq	%rcx, %rax
	andq	$-4, %rcx
	movq	%r15, 80(%rsp)
	movl	64(%rsp), %r15d
	movq	%rcx, %r9
	shrq	$2, %rax
	leaq	5(%r14,%rcx), %rbx
	movl	%r13d, 104(%rsp)
	movq	%rax, 112(%rsp)
	movq	48(%rsp), %r14
	movl	%r11d, %ecx
	movq	%r9, 120(%rsp)
	movq	8(%rsp), %r13
	.p2align 4,,10
	.p2align 3
.L300:
	movzbl	(%r10), %esi
	addq	$4, %r10
	leaq	(%rdx,%rsi,4), %rdi
	movzbl	3700(%rdx,%rsi), %ebp
	addl	$1, 68032(%rdi)
	movl	2420(%rdi), %esi
	movzbl	-3(%r10), %edi
	salq	%cl, %rsi
	addl	%ebp, %ecx
	subl	$1, %ebp
	movzbl	3700(%rdx,%rdi), %r8d
	leaq	(%rdx,%rdi,4), %rax
	movl	2420(%rax), %r9d
	addl	$1, 68032(%rax)
	salq	%cl, %r9
	addl	%r8d, %ecx
	subl	$1, %r8d
	orq	%rsi, %r9
	movzbl	-2(%r10), %esi
	orl	%ebp, %r8d
	movzbl	3700(%rdx,%rsi), %edi
	leaq	(%rdx,%rsi,4), %rsi
	movl	2420(%rsi), %eax
	addl	$1, 68032(%rsi)
	salq	%cl, %rax
	addl	%edi, %ecx
	subl	$1, %edi
	orq	%r9, %rax
	movzbl	-1(%r10), %r9d
	orl	%r8d, %edi
	movq	%r9, %rsi
	movzbl	3700(%rdx,%r9), %r9d
	leaq	(%rdx,%rsi,4), %r11
	movl	2420(%r11), %esi
	addl	$1, 68032(%r11)
	salq	%cl, %rsi
	orq	%rax, %rsi
	leal	(%rcx,%r9), %eax
	subl	$1, %r9d
	movl	%eax, %ecx
	orq	%r14, %rsi
	orl	%r9d, %edi
	shrl	$3, %ecx
	movq	%rsi, 0(%r13)
	orl	%edi, %r15d
	addq	%rcx, %r13
	movl	%eax, %ecx
	andl	$7, %eax
	andl	$-8, %ecx
	shrq	%cl, %rsi
	movl	%eax, %ecx
	movq	%rsi, %r14
	cmpq	%rbx, %r10
	jne	.L300
	movq	88(%rsp), %r8
	movq	120(%rsp), %r9
	movl	%eax, %r11d
	movl	%r15d, %ebx
	movq	32(%rsp), %rdi
	movq	112(%rsp), %rax
	movl	%r15d, 64(%rsp)
	movq	%r13, %r10
	movq	%r8, %rcx
	movq	%r13, 8(%rsp)
	movq	80(%rsp), %r15
	subq	%r9, %rcx
	leaq	4(%rdi,%rax,4), %r9
	movq	%rsi, 48(%rsp)
	movl	104(%rsp), %r13d
	movq	%r9, 32(%rsp)
	movq	%r9, %rbp
	subq	$4, %rcx
	je	.L301
	addq	%rcx, %rbp
	movl	%r11d, %eax
	movq	%rbp, 32(%rsp)
.L302:
	movzbl	(%r9), %ecx
	addq	$1, %r9
	movzbl	3700(%rdx,%rcx), %edi
	leaq	(%rdx,%rcx,4), %r8
	movl	%eax, %ecx
	movl	2420(%r8), %r11d
	addl	$1, 68032(%r8)
	addl	%edi, %eax
	subl	$1, %edi
	salq	%cl, %r11
	movl	%eax, %ecx
	orl	%edi, %ebx
	orq	%r11, %rsi
	shrl	$3, %ecx
	movq	%rsi, (%r10)
	addq	%rcx, %r10
	movl	%eax, %ecx
	andl	$7, %eax
	andl	$-8, %ecx
	shrq	%cl, %rsi
	cmpq	%rbp, %r9
	jne	.L302
	movq	%rsi, 48(%rsp)
	movl	%eax, %r11d
	movl	%ebx, 64(%rsp)
	movq	%r10, 8(%rsp)
.L301:
	movq	24(%rsp), %rcx
	movq	32(%rsp), %rax
	subq	%rax, %rcx
	cmpq	$3, %rcx
	jle	.L294
	imull	$506832829, (%rax), %eax
	shrl	$19, %eax
	movl	%eax, 40(%rsp)
	jmp	.L294
.L787:
	movl	%r11d, %r15d
.L243:
	movq	56(%rsp), %rbx
	movq	48(%rsp), %rdi
	movl	%r15d, %ecx
	movl	3444(%rbx), %eax
	movzbl	3956(%rbx), %edx
	movq	8(%rsp), %rbx
	salq	%cl, %rax
	orq	%rdi, %rax
	movl	64(%rsp), %edi
	movq	%rax, (%rbx)
	testl	%edi, %edi
	jns	.L516
	xorl	%eax, %eax
	jmp	.L80
.L893:
	movl	-3(%r14,%rdi), %eax
	cmpl	%eax, -3(%r13,%rdi)
	jne	.L265
	cmpl	$31, 80(%rsp)
	jbe	.L549
	movq	4(%r13), %r8
	movq	4(%r14), %r10
	cmpq	%r10, %r8
	jne	.L267
	movq	12(%r13), %r8
	movq	12(%r14), %r10
	cmpq	%r10, %r8
	je	.L268
	xorq	%r10, %r8
	movl	$12, %ebp
.L269:
	rep bsfq	%r8, %r8
	shrl	$3, %r8d
	addl	%r8d, %ebp
.L273:
	cmpl	%ebp, %r9d
	jnb	.L265
	movl	%r14d, %r8d
	leal	-1(%rbp), %eax
	movl	%ebp, %r9d
	subl	%r13d, %r8d
	movl	%ebp, %r13d
	movl	%eax, 80(%rsp)
	leaq	(%r14,%r13), %rax
	movq	%rax, 32(%rsp)
	jmp	.L264
.L253:
	movq	20(%rcx), %rdi
	movq	20(%r14), %rax
	cmpq	%rax, %rdi
	je	.L255
	xorq	%rdi, %rax
	movl	$20, %r9d
	jmp	.L254
.L843:
	movl	%ebp, 40(%rsp)
	movq	8(%rsp), %rbp
	jmp	.L803
.L828:
	movl	%ebp, 64(%rsp)
	movl	%r13d, %r15d
	jmp	.L802
.L823:
	testl	%ecx, %ecx
	je	.L524
	movl	$4, %edx
	salq	%cl, %rdx
	movl	$131072, %ecx
	subq	%rdx, %rcx
	addq	%rbp, %rdx
	jmp	.L123
.L838:
	testl	%ecx, %ecx
	je	.L538
	movl	$4, %edx
	salq	%cl, %rdx
	movl	$131072, %ecx
	subq	%rdx, %rcx
	addq	%rbp, %rdx
	jmp	.L197
.L278:
	xorq	%rdi, %rcx
	movl	$4, %r9d
	jmp	.L280
.L569:
	movl	$4, %r9d
.L392:
	movl	72(%rsp), %r12d
	jmp	.L397
	.p2align 4,,10
	.p2align 3
.L398:
	movq	(%rdi,%r9), %r11
	addq	$8, %r9
	movq	-8(%r14,%r9), %rax
	cmpq	%rax, %r11
	jne	.L895
.L397:
	leal	8(%r9), %eax
	movl	%r9d, %r10d
	cmpl	%eax, %r12d
	jnb	.L398
	movl	72(%rsp), %eax
	cmpl	%eax, %r9d
	jnb	.L400
	movl	72(%rsp), %eax
	movl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L401:
	movzbl	(%r14,%r9), %r11d
	movl	%r9d, %r10d
	cmpb	%r11b, (%rdi,%r9)
	jne	.L400
	addq	$1, %r9
	cmpl	%eax, %r9d
	jb	.L401
	addl	$1, %r10d
	jmp	.L400
.L558:
	movl	$4, %edi
	jmp	.L327
	.p2align 4,,10
	.p2align 3
.L328:
	movq	(%r10,%rdi), %r11
	addq	$8, %rdi
	movq	-8(%r14,%rdi), %r13
	cmpq	%r13, %r11
	jne	.L896
.L327:
	leal	8(%rdi), %eax
	movl	%edi, %r9d
	cmpl	%eax, %ebx
	jnb	.L328
	cmpl	%ebx, %edi
	jnb	.L330
	movl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L331:
	movzbl	(%r14,%rdi), %eax
	movl	%edi, %r9d
	cmpb	%al, (%r10,%rdi)
	jne	.L330
	addq	$1, %rdi
	cmpl	%ebx, %edi
	jb	.L331
	addl	$1, %r9d
	jmp	.L330
.L871:
	movl	$32768, %eax
	movq	56(%rsp), %rbx
	movq	%r14, %r10
	cmpq	%rax, %r12
	cmovbe	%r12, %rax
	movl	%eax, 32(%rbx)
	leaq	74080(%rbx), %rax
	movl	$-32768, %fs:mf_stale_cutoff@tpoff
	movl	$-32768, 88(%rsp)
	jmp	.L376
.L845:
	movl	$32768, %eax
	movq	56(%rsp), %rbx
	movq	%r14, %rbp
	movl	$131072, %edx
	cmpq	%rax, %r12
	cmovbe	%r12, %rax
	movl	%eax, 32(%rbx)
	leaq	74080(%rbx), %rax
	movl	$-32768, %fs:mf_stale_cutoff@tpoff
	movl	$-32768, 80(%rsp)
	jmp	.L306
.L861:
	movl	%ecx, %r10d
	addq	$2, %rdi
	andl	$7, %r10d
	movl	%r10d, 72(%rsp)
	movq	32(%rsp), %r10
	movq	%r9, 32(%rsp)
	jmp	.L170
.L860:
	leaq	-1(%r9), %r14
	movq	32(%rsp), %r10
	addq	$1, %rdi
	movq	%r14, 32(%rsp)
	movl	%ecx, %r14d
	andl	$7, %r14d
	movl	%r14d, 72(%rsp)
	jmp	.L170
.L854:
	movl	%ecx, %r14d
	movq	40(%rsp), %r12
	addq	$2, %rdi
	movq	%r10, 40(%rsp)
	andl	$7, %r14d
	movl	%r14d, 80(%rsp)
	jmp	.L94
.L853:
	subq	$1, %r10
	movq	40(%rsp), %r12
	addq	$1, %rdi
	movq	%r10, 40(%rsp)
	movl	%ecx, %r10d
	andl	$7, %r10d
	movl	%r10d, 80(%rsp)
	jmp	.L94
.L584:
	movl	$4, %edi
.L484:
	movl	72(%rsp), %r11d
	jmp	.L489
	.p2align 4,,10
	.p2align 3
.L490:
	movq	(%r8,%rdi), %rcx
	addq	$8, %rdi
	movq	-8(%r14,%rdi), %r9
	cmpq	%r9, %rcx
	jne	.L897
.L489:
	leal	8(%rdi), %eax
	movl	%edi, %r10d
	cmpl	%eax, %r11d
	jnb	.L490
	movl	72(%rsp), %eax
	movl	%edi, %ecx
	cmpl	%eax, %edi
	jnb	.L898
	movl	72(%rsp), %eax
	jmp	.L493
	.p2align 4,,10
	.p2align 3
.L495:
	addq	$1, %rcx
	cmpl	%eax, %ecx
	jnb	.L899
.L493:
	movzbl	(%r14,%rcx), %ebx
	movl	%ecx, %edi
	cmpb	%bl, (%r8,%rcx)
	je	.L495
	leaq	(%r14,%rcx), %rbp
	leal	-1(%rcx), %ebx
	movl	%ecx, %r10d
.L494:
	movl	%r14d, %r11d
	movl	%r10d, %r12d
	subl	%r8d, %r11d
	jmp	.L496
.L855:
	movl	%ecx, %r10d
	addq	$3, %rdi
	leaq	(%r12,%r14), %r12
	andl	$7, %r10d
	movl	%r10d, 80(%rsp)
	jmp	.L94
.L862:
	movq	%r11, %r10
	addq	$3, %rdi
	addq	%r14, %r10
	movl	%ecx, %r14d
	andl	$7, %r14d
	movl	%r14d, 72(%rsp)
	jmp	.L170
.L542:
	movl	$4, %r11d
.L212:
	movq	%rbp, 104(%rsp)
	movq	32(%rsp), %rbp
	movq	%rbx, 88(%rsp)
	jmp	.L217
	.p2align 4,,10
	.p2align 3
.L218:
	movq	(%rdx,%r11), %rbx
	addq	$8, %r11
	movq	-8(%rbp,%r11), %r9
	cmpq	%r9, %rbx
	jne	.L900
.L217:
	leal	8(%r11), %r9d
	movl	%r11d, %r13d
	cmpl	%r9d, %r12d
	jnb	.L218
	movq	88(%rsp), %rbx
	movq	104(%rsp), %rbp
	movl	%r11d, %r9d
	cmpl	%r12d, %r11d
	jnb	.L901
	movq	%rax, 88(%rsp)
	movq	32(%rsp), %r11
	jmp	.L221
	.p2align 4,,10
	.p2align 3
.L222:
	addq	$1, %r9
	cmpl	%r12d, %r9d
	jnb	.L902
.L221:
	movzbl	(%r11,%r9), %eax
	movl	%r9d, %r13d
	cmpb	%al, (%rdx,%r9)
	je	.L222
	movq	32(%rsp), %rdx
	movq	88(%rsp), %rax
	leaq	(%rdx,%r9), %r12
	movl	%r9d, %edx
	jmp	.L220
.L528:
	movl	$4, %r11d
.L138:
	movq	%rbx, 112(%rsp)
	movq	40(%rsp), %rbp
	jmp	.L143
	.p2align 4,,10
	.p2align 3
.L144:
	movq	(%rdx,%r11), %rbx
	addq	$8, %r11
	movq	-8(%rbp,%r11), %r9
	cmpq	%r9, %rbx
	jne	.L903
.L143:
	leal	8(%r11), %r9d
	movl	%r11d, %r13d
	cmpl	%r9d, %r12d
	jnb	.L144
	movq	112(%rsp), %rbx
	movl	%r11d, %r9d
	cmpl	%r12d, %r11d
	jnb	.L904
	movq	40(%rsp), %r11
	jmp	.L147
	.p2align 4,,10
	.p2align 3
.L148:
	addq	$1, %r9
	cmpl	%r12d, %r9d
	jnb	.L905
.L147:
	movzbl	(%r11,%r9), %ebp
	movl	%r9d, %r13d
	cmpb	%bpl, (%rdx,%r9)
	je	.L148
	movq	40(%rsp), %rdx
	leaq	(%rdx,%r9), %r12
	movl	%r9d, %edx
	jmp	.L146
.L895:
	xorq	%rax, %r11
	jmp	.L395
.L896:
	xorq	%r13, %r11
	jmp	.L325
.L851:
	movl	$32768, %edx
	movq	56(%rsp), %rdi
	cmpq	%rdx, %r12
	cmovbe	%r12, %rdx
	movl	%edx, 32(%rdi)
	xorl	%edi, %edi
	movl	$-32768, %fs:mf_stale_cutoff@tpoff
	movq	40(%rsp), %rdx
	movq	%r14, 32(%rsp)
	movl	$-32768, 16(%rsp)
	jmp	.L85
.L858:
	movl	$32768, %edx
	movq	56(%rsp), %rdi
	movl	$-32768, %r10d
	cmpq	%rdx, %r12
	cmovbe	%r12, %rdx
	movl	%edx, 32(%rdi)
	xorl	%edi, %edi
	movl	$-32768, %fs:mf_stale_cutoff@tpoff
	movq	32(%rsp), %rdx
	movq	%r14, 16(%rsp)
	jmp	.L161
.L897:
	xorq	%r9, %rcx
	jmp	.L487
.L900:
	movq	%rbx, %rdx
	movq	104(%rsp), %rbp
	movq	88(%rsp), %rbx
	xorq	%r9, %rdx
	movq	%rdx, %r9
	jmp	.L215
.L255:
	movq	28(%rcx), %rdi
	movq	28(%r14), %rax
	cmpq	%rax, %rdi
	je	.L548
	xorq	%rdi, %rax
	movl	$28, %r9d
	jmp	.L254
.L903:
	movq	%rbx, %rdx
	movq	112(%rsp), %rbx
	xorq	%r9, %rdx
	movq	%rdx, %r9
	jmp	.L141
.L559:
	movl	$36, %edi
	jmp	.L327
.L570:
	movl	$36, %r9d
	jmp	.L392
.L279:
	movq	20(%r10), %rcx
	movq	20(%r14), %rdi
	cmpq	%rdi, %rcx
	je	.L281
	xorq	%rdi, %rcx
	movl	$20, %r9d
	jmp	.L280
.L547:
	movl	$4, %edi
	jmp	.L256
	.p2align 4,,10
	.p2align 3
.L257:
	movq	(%rcx,%rdi), %rax
	addq	$8, %rdi
	movq	-8(%r14,%rdi), %r13
	cmpq	%r13, %rax
	jne	.L906
.L256:
	leal	8(%rdi), %eax
	movl	%edi, %r9d
	cmpl	%eax, %ebx
	jnb	.L257
	cmpl	%ebx, %edi
	jnb	.L259
	movl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L260:
	movzbl	(%r14,%rdi), %eax
	movl	%edi, %r9d
	cmpb	%al, (%rcx,%rdi)
	jne	.L259
	addq	$1, %rdi
	cmpl	%ebx, %edi
	jb	.L260
	addl	$1, %r9d
	jmp	.L259
.L585:
	movl	$36, %edi
	jmp	.L484
.L349:
	movq	28(%rcx), %rdi
	movq	28(%r14), %r8
	cmpq	%r8, %rdi
	je	.L563
	xorq	%rdi, %r8
	movl	$28, %r9d
	jmp	.L348
.L419:
	movq	28(%r8), %rcx
	movq	28(%r14), %rdi
	cmpq	%rdi, %rcx
	je	.L574
	xorq	%rdi, %rcx
	movl	$28, %r10d
	jmp	.L418
.L867:
	movl	48(%rsp), %r15d
	cmpq	$4, %rax
	jne	.L794
	movq	%r14, %rbp
	leaq	4(%r14), %r14
	movq	8(%rsp), %r10
	movl	%r15d, %ecx
	movq	%r14, 8(%rsp)
	movq	56(%rsp), %rdx
	.p2align 4,,10
	.p2align 3
.L452:
	movzbl	0(%rbp), %r9d
	movzbl	1(%rbp), %r15d
	addq	$4, %rbp
	movzbl	-2(%rbp), %r13d
	movzbl	-1(%rbp), %ebx
	movzbl	3700(%rdx,%r9), %eax
	movl	2420(%rdx,%r9,4), %r9d
	movzbl	3700(%rdx,%r15), %r8d
	movl	2420(%rdx,%r15,4), %r15d
	leal	(%rax,%rcx), %r14d
	salq	%cl, %r9
	subl	$1, %eax
	movzbl	3700(%rdx,%r13), %edi
	movl	%r14d, %ecx
	leal	(%r14,%r8), %r12d
	movzbl	3700(%rdx,%rbx), %esi
	subl	$1, %r8d
	salq	%cl, %r15
	leal	(%r12,%rdi), %r11d
	movl	%r12d, %ecx
	orl	%r8d, %eax
	orq	%r9, %r15
	movl	2420(%rdx,%r13,4), %r9d
	movl	2420(%rdx,%rbx,4), %ebx
	subl	$1, %edi
	orl	%edi, %eax
	salq	%cl, %r9
	movl	%r11d, %ecx
	addl	%esi, %r11d
	subl	$1, %esi
	salq	%cl, %rbx
	orq	%r15, %r9
	orl	%esi, %eax
	orl	%eax, 80(%rsp)
	orq	%rbx, %r9
	movq	32(%rsp), %rbx
	movl	%r11d, %eax
	movl	%r11d, %ecx
	shrl	$3, %eax
	andl	$-8, %ecx
	orq	%rbx, %r9
	movq	%r9, (%r10)
	addq	%rax, %r10
	movq	8(%rsp), %rax
	shrq	%cl, %r9
	movl	%r11d, %ecx
	movq	%r9, 32(%rsp)
	subq	%rbp, %rax
	andl	$7, %ecx
	cmpq	$3, %rax
	ja	.L452
.L818:
	movq	%r10, 8(%rsp)
	movl	%ecx, %r15d
	jmp	.L453
.L817:
	movl	%r8d, %r15d
	jmp	.L453
.L448:
	movq	56(%rsp), %rbx
	movq	32(%rsp), %rdi
	movl	%r15d, %ecx
	movl	3444(%rbx), %eax
	movzbl	3956(%rbx), %edx
	movq	8(%rsp), %rbx
	salq	%cl, %rax
	orq	%rdi, %rax
	movq	%rax, (%rbx)
	jmp	.L516
.L530:
	movq	%r14, %r12
	jmp	.L153
.L544:
	movq	%r14, %rbp
	jmp	.L227
.L180:
	movq	32(%rsp), %r11
	movq	28(%rdx), %r9
	movq	28(%r11), %r11
	cmpq	%r11, %r9
	je	.L536
	xorq	%r11, %r9
	movl	$28, %r12d
	jmp	.L179
.L104:
	movq	40(%rsp), %r11
	movq	28(%rdx), %r10
	movq	28(%r11), %r11
	cmpq	%r11, %r10
	je	.L522
	xorq	%r11, %r10
	movl	$28, %r13d
	jmp	.L103
.L543:
	movl	$36, %r11d
	jmp	.L212
.L562:
	movl	$4, %edi
	jmp	.L350
	.p2align 4,,10
	.p2align 3
.L351:
	movq	(%rcx,%rdi), %r8
	addq	$8, %rdi
	movq	-8(%r14,%rdi), %r10
	cmpq	%r10, %r8
	jne	.L907
.L350:
	leal	8(%rdi), %eax
	movl	%edi, %r9d
	cmpl	%eax, %ebx
	jnb	.L351
	movl	%edi, %r8d
	cmpl	%ebx, %edi
	jb	.L354
	jmp	.L908
	.p2align 4,,10
	.p2align 3
.L356:
	addq	$1, %r8
	cmpl	%ebx, %r8d
	jnb	.L909
.L354:
	movzbl	(%r14,%r8), %edi
	movl	%r8d, %eax
	cmpb	%dil, (%rcx,%r8)
	je	.L356
	leaq	(%r14,%r8), %rax
	movl	%r8d, %r9d
	movq	%rax, 32(%rsp)
	leal	-1(%r8), %eax
	movl	%eax, %r13d
.L355:
	movl	%r14d, %r8d
	movl	%r9d, %edi
	subl	%ecx, %r8d
	jmp	.L357
.L529:
	movl	$36, %r11d
	jmp	.L138
.L573:
	movl	$4, %edi
.L415:
	movl	72(%rsp), %r11d
	jmp	.L420
	.p2align 4,,10
	.p2align 3
.L421:
	movq	(%r8,%rdi), %rcx
	addq	$8, %rdi
	movq	-8(%r14,%rdi), %r9
	cmpq	%r9, %rcx
	jne	.L910
.L420:
	leal	8(%rdi), %eax
	movl	%edi, %r10d
	cmpl	%eax, %r11d
	jnb	.L421
	movl	72(%rsp), %eax
	movl	%edi, %ecx
	cmpl	%eax, %edi
	jnb	.L911
	movl	72(%rsp), %eax
	jmp	.L424
	.p2align 4,,10
	.p2align 3
.L426:
	addq	$1, %rcx
	cmpl	%eax, %ecx
	jnb	.L912
.L424:
	movzbl	(%r14,%rcx), %ebx
	movl	%ecx, %edi
	cmpb	%bl, (%r8,%rcx)
	je	.L426
	leaq	(%r14,%rcx), %rbp
	leal	-1(%rcx), %ebx
	movl	%ecx, %r10d
.L425:
	movl	%r14d, %r11d
	movl	%r10d, %r12d
	subl	%r8d, %r11d
	jmp	.L427
.L521:
	movl	$4, %r11d
.L100:
	movq	%rbx, 112(%rsp)
	movq	40(%rsp), %rbx
	jmp	.L105
	.p2align 4,,10
	.p2align 3
.L106:
	movq	(%rdx,%r11), %r10
	addq	$8, %r11
	movq	-8(%rbx,%r11), %rbp
	cmpq	%rbp, %r10
	jne	.L913
.L105:
	leal	8(%r11), %r10d
	movl	%r11d, %r13d
	cmpl	%r10d, %r14d
	jnb	.L106
	movq	112(%rsp), %rbx
	movl	%r11d, %r10d
	cmpl	%r14d, %r11d
	jnb	.L914
	movq	40(%rsp), %r11
	jmp	.L109
	.p2align 4,,10
	.p2align 3
.L110:
	addq	$1, %r10
	cmpl	%r14d, %r10d
	jnb	.L915
.L109:
	movzbl	(%r11,%r10), %ebp
	movl	%r10d, %r13d
	cmpb	%bpl, (%rdx,%r10)
	je	.L110
	movq	40(%rsp), %rdx
	leaq	(%rdx,%r10), %r14
	movl	%r10d, %edx
	jmp	.L108
.L906:
	xorq	%r13, %rax
	jmp	.L254
.L535:
	movl	$4, %r11d
.L176:
	movq	%rbx, 104(%rsp)
	movq	32(%rsp), %rbx
	jmp	.L181
	.p2align 4,,10
	.p2align 3
.L182:
	movq	(%rdx,%r11), %r9
	addq	$8, %r11
	movq	-8(%rbx,%r11), %rbp
	cmpq	%rbp, %r9
	jne	.L916
.L181:
	leal	8(%r11), %r9d
	movl	%r11d, %r12d
	cmpl	%r9d, %r14d
	jnb	.L182
	movq	104(%rsp), %rbx
	movl	%r11d, %r9d
	cmpl	%r14d, %r11d
	jnb	.L917
	movq	32(%rsp), %r11
	jmp	.L185
	.p2align 4,,10
	.p2align 3
.L186:
	addq	$1, %r9
	cmpl	%r14d, %r9d
	jnb	.L918
.L185:
	movzbl	(%r11,%r9), %ebp
	movl	%r9d, %r12d
	cmpb	%bpl, (%rdx,%r9)
	je	.L186
	movq	32(%rsp), %rdx
	leaq	(%rdx,%r9), %rbp
	movl	%r9d, %edx
	jmp	.L184
.L578:
	movl	$131072, %edx
	jmp	.L445
.L335:
	xorq	%r8, %rcx
	movl	$4, %ebp
	jmp	.L337
.L405:
	xorq	%r8, %rcx
	movl	$4, %r8d
	jmp	.L407
.L899:
	movl	%ecx, %ecx
	leal	1(%rdi), %r10d
	movl	%edi, %ebx
	leaq	(%r14,%rcx), %rbp
	jmp	.L494
.L910:
	xorq	%r9, %rcx
	jmp	.L418
.L907:
	xorq	%r10, %r8
	jmp	.L348
.L475:
	movq	20(%r12), %r8
	movq	20(%r14), %rcx
	cmpq	%rcx, %r8
	je	.L477
	xorq	%r8, %rcx
	movl	$20, %r8d
	jmp	.L476
.L905:
	movq	40(%rsp), %rdx
	movl	%r9d, %r9d
	leaq	(%rdx,%r9), %r12
	leal	1(%r13), %edx
	jmp	.L146
.L548:
	movl	$36, %edi
	jmp	.L256
.L916:
	movq	104(%rsp), %rbx
	xorq	%rbp, %r9
	jmp	.L179
.L902:
	movq	32(%rsp), %rdx
	movl	%r9d, %r9d
	movq	88(%rsp), %rax
	leaq	(%rdx,%r9), %r12
	leal	1(%r13), %edx
	jmp	.L220
.L913:
	movq	112(%rsp), %rbx
	xorq	%rbp, %r10
	jmp	.L103
.L878:
	movl	48(%rsp), %r15d
	cmpq	$4, %rax
	jne	.L791
	movq	%r14, %r11
	leaq	4(%r14), %r14
	movq	8(%rsp), %r10
	movl	%r15d, %ecx
	movq	%r14, 8(%rsp)
	movq	56(%rsp), %rdx
.L383:
	movzbl	(%r11), %r9d
	movzbl	1(%r11), %r15d
	addq	$4, %r11
	movzbl	-2(%r11), %r13d
	movzbl	-1(%r11), %ebp
	movzbl	3700(%rdx,%r9), %eax
	movl	2420(%rdx,%r9,4), %r9d
	movzbl	3700(%rdx,%r15), %r8d
	movl	2420(%rdx,%r15,4), %r15d
	leal	(%rax,%rcx), %r14d
	salq	%cl, %r9
	subl	$1, %eax
	movzbl	3700(%rdx,%r13), %edi
	movl	%r14d, %ecx
	leal	(%r14,%r8), %r12d
	movzbl	3700(%rdx,%rbp), %esi
	subl	$1, %r8d
	salq	%cl, %r15
	leal	(%r12,%rdi), %ebx
	movl	%r12d, %ecx
	orl	%r8d, %eax
	orq	%r9, %r15
	movl	2420(%rdx,%r13,4), %r9d
	movl	2420(%rdx,%rbp,4), %ebp
	subl	$1, %edi
	orl	%edi, %eax
	salq	%cl, %r9
	movl	%ebx, %ecx
	addl	%esi, %ebx
	subl	$1, %esi
	salq	%cl, %rbp
	orq	%r15, %r9
	movq	32(%rsp), %rcx
	orl	%esi, %eax
	orq	%rbp, %r9
	orl	%eax, 80(%rsp)
	movl	%ebx, %eax
	orq	%rcx, %r9
	shrl	$3, %eax
	movl	%ebx, %ecx
	andl	$7, %ebx
	movq	%r9, (%r10)
	addq	%rax, %r10
	movq	8(%rsp), %rax
	andl	$-8, %ecx
	shrq	%cl, %r9
	movl	%ebx, %ecx
	subq	%r11, %rax
	movq	%r9, 32(%rsp)
	cmpq	$3, %rax
	ja	.L383
	jmp	.L818
.L281:
	movq	28(%r10), %rcx
	movq	28(%r14), %rdi
	cmpq	%rdi, %rcx
	je	.L552
	xorq	%rdi, %rcx
	movl	$28, %r9d
	jmp	.L280
.L563:
	movl	$36, %edi
	jmp	.L350
.L868:
	movl	64(%rsp), %r15d
	cmpq	$4, %rax
	jne	.L788
	movq	48(%rsp), %r8
	movl	72(%rsp), %r10d
	movq	%r14, %rsi
	movl	%r15d, %ecx
	movq	8(%rsp), %r9
	movq	56(%rsp), %rdi
	leaq	4(%r14), %r14
.L313:
	movzbl	(%rsi), %edx
	movzbl	1(%rsi), %r11d
	addq	$4, %rsi
	movq	%rdx, %rax
	movzbl	3700(%rdi,%rdx), %edx
	leaq	(%rdi,%rax,4), %rax
	addl	$1, 68032(%rax)
	movl	2420(%rax), %ebx
	leaq	(%rdi,%r11,4), %rax
	movzbl	3700(%rdi,%r11), %r12d
	movl	2420(%rax), %r11d
	salq	%cl, %rbx
	addl	%edx, %ecx
	addl	$1, 68032(%rax)
	subl	$1, %edx
	salq	%cl, %r11
	addl	%r12d, %ecx
	subl	$1, %r12d
	orq	%rbx, %r11
	movzbl	-2(%rsi), %ebx
	orl	%r12d, %edx
	movzbl	3700(%rdi,%rbx), %ebp
	leaq	(%rdi,%rbx,4), %rbx
	movl	2420(%rbx), %eax
	addl	$1, 68032(%rbx)
	movzbl	-1(%rsi), %ebx
	salq	%cl, %rax
	addl	%ebp, %ecx
	subl	$1, %ebp
	orq	%r11, %rax
	movq	%rbx, %r11
	movzbl	3700(%rdi,%rbx), %ebx
	orl	%ebp, %edx
	leaq	(%rdi,%r11,4), %r11
	movl	2420(%r11), %r13d
	addl	$1, 68032(%r11)
	salq	%cl, %r13
	orq	%rax, %r13
	leal	(%rcx,%rbx), %eax
	subl	$1, %ebx
	orl	%ebx, %edx
	movl	%eax, %ecx
	orq	%r13, %r8
	andl	$-8, %ecx
	orl	%edx, %r10d
	movl	%eax, %edx
	andl	$7, %eax
	movq	%r8, (%r9)
	shrq	%cl, %r8
	movl	%eax, %ecx
	movq	%r14, %rax
	shrl	$3, %edx
	subq	%rsi, %rax
	addq	%rdx, %r9
	cmpq	$3, %rax
	ja	.L313
	movq	%r8, 48(%rsp)
	movl	%ecx, %r15d
	movl	%r10d, 72(%rsp)
	movq	%r9, 8(%rsp)
	jmp	.L314
.L309:
	movq	56(%rsp), %rbx
	movq	48(%rsp), %rdi
	movl	%r15d, %ecx
	movl	3444(%rbx), %eax
	movzbl	3956(%rbx), %edx
	movq	8(%rsp), %rbx
	salq	%cl, %rax
	orq	%rdi, %rax
	movq	%rax, (%rbx)
	jmp	.L516
.L574:
	movl	$36, %edi
	jmp	.L415
.L523:
	movq	%r14, %r12
	jmp	.L115
.L537:
	movq	%r14, %rbp
	jmp	.L191
.L540:
	movq	%rdi, %r10
	jmp	.L202
.L536:
	movl	$36, %r11d
	jmp	.L176
.L522:
	movl	$36, %r11d
	jmp	.L100
.L526:
	movq	%rdi, %r9
	jmp	.L128
.L551:
	movl	$4, %edi
	jmp	.L282
	.p2align 4,,10
	.p2align 3
.L283:
	movq	(%r10,%rdi), %rcx
	addq	$8, %rdi
	movq	-8(%r14,%rdi), %r8
	cmpq	%r8, %rcx
	jne	.L919
.L282:
	leal	8(%rdi), %eax
	movl	%edi, %r9d
	cmpl	%eax, %ebx
	jnb	.L283
	movl	%edi, %ecx
	cmpl	%ebx, %edi
	jb	.L286
	jmp	.L920
	.p2align 4,,10
	.p2align 3
.L288:
	addq	$1, %rcx
	cmpl	%ebx, %ecx
	jnb	.L921
.L286:
	movzbl	(%r14,%rcx), %edi
	movl	%ecx, %eax
	cmpb	%dil, (%r10,%rcx)
	je	.L288
	leaq	(%r14,%rcx), %rax
	movl	%ecx, %r9d
	movq	%rax, 32(%rsp)
	leal	-1(%rcx), %eax
	movl	%eax, 80(%rsp)
.L287:
	movl	%r14d, %r8d
	movl	%r9d, %r13d
	subl	%r10d, %r8d
	jmp	.L264
.L267:
	xorq	%r10, %r8
	movl	$4, %ebp
	jmp	.L269
.L842:
	movq	%r14, 8(%rsp)
	movl	40(%rsp), %r8d
	movl	%ecx, %r15d
	movq	16(%rsp), %r14
	orl	%ecx, %r8d
	addq	%r10, %r14
	jmp	.L200
.L827:
	movq	%r14, 8(%rsp)
	movl	64(%rsp), %r8d
	movl	%ecx, %r15d
	movq	32(%rsp), %r14
	orl	%ecx, %r8d
	addq	%r9, %r14
	jmp	.L126
.L556:
	movl	$131072, %edx
	jmp	.L306
.L567:
	movl	$32768, %edx
	jmp	.L376
.L336:
	movq	20(%rax), %r8
	movq	20(%r14), %rcx
	cmpq	%rcx, %r8
	je	.L338
	xorq	%r8, %rcx
	movl	$20, %ebp
	jmp	.L337
.L582:
	movl	$4, %ecx
.L473:
	movl	72(%rsp), %ebx
	jmp	.L478
.L479:
	movq	(%r12,%rcx), %r11
	addq	$8, %rcx
	movq	-8(%r14,%rcx), %rax
	cmpq	%rax, %r11
	jne	.L922
.L478:
	leal	8(%rcx), %eax
	movl	%ecx, %r8d
	cmpl	%eax, %ebx
	jnb	.L479
	movl	72(%rsp), %eax
	cmpl	%eax, %ecx
	jnb	.L480
	movl	%ecx, %ecx
.L481:
	movzbl	(%r14,%rcx), %ebx
	movl	%ecx, %r8d
	cmpb	%bl, (%r12,%rcx)
	jne	.L480
	addq	$1, %rcx
	cmpl	%eax, %ecx
	jb	.L481
	addl	$1, %r8d
	jmp	.L480
.L918:
	movq	32(%rsp), %rdx
	movl	%r9d, %r9d
	leaq	(%rdx,%r9), %rbp
	leal	1(%r12), %edx
	jmp	.L184
.L870:
	movl	%r10d, %r15d
	jmp	.L314
.L406:
	movq	20(%r12), %r8
	movq	20(%r14), %rcx
	cmpq	%rcx, %r8
	je	.L408
	xorq	%r8, %rcx
	movl	$20, %r8d
	jmp	.L407
.L912:
	movl	%ecx, %ecx
	leal	1(%rdi), %r10d
	movl	%edi, %ebx
	leaq	(%r14,%rcx), %rbp
	jmp	.L425
.L919:
	xorq	%r8, %rcx
	jmp	.L280
.L915:
	movq	40(%rsp), %rdx
	movl	%r10d, %r10d
	leaq	(%rdx,%r10), %r14
	leal	1(%r13), %edx
	jmp	.L108
.L477:
	movq	28(%r12), %r8
	movq	28(%r14), %rcx
	cmpq	%rcx, %r8
	je	.L583
	xorq	%r8, %rcx
	movl	$28, %r8d
	jmp	.L476
.L909:
	movl	%r8d, %r8d
	movl	%eax, %r13d
	leal	1(%rax), %r9d
	leaq	(%r14,%r8), %rax
	movq	%rax, 32(%rsp)
	jmp	.L355
.L552:
	movl	$36, %edi
	jmp	.L282
.L894:
	cmpq	$4, %rax
	jne	.L785
	movq	48(%rsp), %r8
	movl	64(%rsp), %r10d
	movq	%r14, %rsi
	movl	%r11d, %ecx
	movq	8(%rsp), %r9
	movq	56(%rsp), %rdi
	leaq	4(%r14), %r14
.L242:
	movzbl	(%rsi), %edx
	movzbl	1(%rsi), %r11d
	addq	$4, %rsi
	movq	%rdx, %rax
	movzbl	3700(%rdi,%rdx), %edx
	leaq	(%rdi,%rax,4), %rax
	addl	$1, 68032(%rax)
	movl	2420(%rax), %ebx
	leaq	(%rdi,%r11,4), %rax
	movzbl	3700(%rdi,%r11), %r12d
	movl	2420(%rax), %r11d
	salq	%cl, %rbx
	addl	%edx, %ecx
	addl	$1, 68032(%rax)
	subl	$1, %edx
	salq	%cl, %r11
	addl	%r12d, %ecx
	subl	$1, %r12d
	orq	%rbx, %r11
	movzbl	-2(%rsi), %ebx
	orl	%r12d, %edx
	movzbl	3700(%rdi,%rbx), %ebp
	leaq	(%rdi,%rbx,4), %rbx
	movl	2420(%rbx), %eax
	addl	$1, 68032(%rbx)
	movzbl	-1(%rsi), %ebx
	salq	%cl, %rax
	addl	%ebp, %ecx
	subl	$1, %ebp
	orq	%r11, %rax
	movq	%rbx, %r11
	movzbl	3700(%rdi,%rbx), %ebx
	orl	%ebp, %edx
	leaq	(%rdi,%r11,4), %r11
	movl	2420(%r11), %r13d
	addl	$1, 68032(%r11)
	salq	%cl, %r13
	orq	%rax, %r13
	leal	(%rcx,%rbx), %eax
	subl	$1, %ebx
	orl	%ebx, %edx
	movl	%eax, %ecx
	orq	%r13, %r8
	andl	$-8, %ecx
	orl	%edx, %r10d
	movl	%eax, %edx
	andl	$7, %eax
	movq	%r8, (%r9)
	shrq	%cl, %r8
	movl	%eax, %ecx
	movq	%r14, %rax
	shrl	$3, %edx
	subq	%rsi, %rax
	addq	%rdx, %r9
	cmpq	$3, %rax
	ja	.L242
	movq	%r8, 48(%rsp)
	movl	%ecx, %r15d
	movl	%r10d, 64(%rsp)
	movq	%r9, 8(%rsp)
	jmp	.L243
.L533:
	movq	%rdi, %r14
	jmp	.L166
.L856:
	movq	32(%rsp), %rdi
	movl	48(%rsp), %r9d
	movl	%ecx, %r15d
	addq	%r14, %rdi
	orl	%ecx, %r9d
	movq	%rdi, %r14
	jmp	.L88
.L519:
	movq	%rdi, %r14
	jmp	.L90
.L863:
	movq	16(%rsp), %rdi
	movl	40(%rsp), %esi
	movl	%ecx, %r15d
	addq	%r14, %rdi
	orl	%ecx, %esi
	movq	%rdi, %r14
	jmp	.L164
.L545:
	movl	$32768, %edx
	jmp	.L235
.L922:
	movq	%r11, %rcx
	xorq	%rax, %rcx
	jmp	.L476
.L408:
	movq	28(%r12), %r8
	movq	28(%r14), %rcx
	cmpq	%rcx, %r8
	je	.L572
	xorq	%r8, %rcx
	movl	$28, %r8d
	jmp	.L407
.L921:
	movl	%ecx, %ecx
	movl	%eax, 80(%rsp)
	leal	1(%rax), %r9d
	leaq	(%r14,%rcx), %rax
	movq	%rax, 32(%rsp)
	jmp	.L287
.L268:
	movq	20(%r13), %r8
	movq	20(%r14), %r10
	cmpq	%r10, %r8
	je	.L270
	xorq	%r10, %r8
	movl	$20, %ebp
	jmp	.L269
.L560:
	movl	$4, %ecx
	jmp	.L339
	.p2align 4,,10
	.p2align 3
.L340:
	movq	(%rax,%rcx), %r11
	addq	$8, %rcx
	movq	-8(%r14,%rcx), %r8
	cmpq	%r8, %r11
	jne	.L923
.L339:
	leal	8(%rcx), %r8d
	movl	%ecx, %ebp
	cmpl	%r8d, %ebx
	jnb	.L340
	cmpl	%ebx, %ecx
	jnb	.L341
	movl	%ecx, %ecx
.L342:
	movzbl	(%r14,%rcx), %r11d
	movl	%ecx, %ebp
	cmpb	%r11b, (%rax,%rcx)
	jne	.L341
	addq	$1, %rcx
	cmpl	%ebx, %ecx
	jb	.L342
	addl	$1, %ebp
	jmp	.L341
.L571:
	movl	$4, %ecx
.L404:
	movl	72(%rsp), %ebx
	jmp	.L409
.L410:
	movq	(%r12,%rcx), %r11
	addq	$8, %rcx
	movq	-8(%r14,%rcx), %rax
	cmpq	%rax, %r11
	jne	.L924
.L409:
	leal	8(%rcx), %eax
	movl	%ecx, %r8d
	cmpl	%eax, %ebx
	jnb	.L410
	movl	72(%rsp), %eax
	cmpl	%eax, %ecx
	jnb	.L411
	movl	%ecx, %ecx
.L412:
	movzbl	(%r14,%rcx), %eax
	movl	%ecx, %r8d
	cmpb	%al, (%r12,%rcx)
	jne	.L411
	movl	72(%rsp), %eax
	addq	$1, %rcx
	cmpl	%eax, %ecx
	jb	.L412
	addl	$1, %r8d
	jmp	.L411
.L583:
	movl	$36, %ecx
	jmp	.L473
.L338:
	movq	28(%rax), %r8
	movq	28(%r14), %rcx
	cmpq	%rcx, %r8
	je	.L561
	xorq	%r8, %rcx
	movl	$28, %ebp
	jmp	.L337
.L572:
	movl	$36, %ecx
	jmp	.L404
.L561:
	movl	$36, %ecx
	jmp	.L339
.L270:
	movq	28(%r13), %r8
	movq	28(%r14), %r10
	cmpq	%r10, %r8
	je	.L550
	xorq	%r10, %r8
	movl	$28, %ebp
	jmp	.L269
.L924:
	movq	%r11, %rcx
	xorq	%rax, %rcx
	jmp	.L407
.L923:
	movq	%r11, %rcx
	xorq	%r8, %rcx
	jmp	.L337
.L794:
	movl	80(%rsp), %r8d
	movq	8(%rsp), %rdi
	movl	%r15d, %ecx
	movq	32(%rsp), %rdx
	movq	24(%rsp), %r10
	movq	56(%rsp), %r9
.L451:
	movzbl	(%r14), %eax
	addq	$1, %r14
	movzbl	3700(%r9,%rax), %esi
	movl	2420(%r9,%rax,4), %eax
	salq	%cl, %rax
	orq	%rax, %rdx
	leal	(%rsi,%rcx), %eax
	subl	$1, %esi
	movl	%eax, %ecx
	movq	%rdx, (%rdi)
	orl	%esi, %r8d
	shrl	$3, %ecx
	addq	%rcx, %rdi
	movl	%eax, %ecx
	andl	$7, %eax
	andl	$-8, %ecx
	shrq	%cl, %rdx
	movl	%eax, %ecx
	cmpq	%r10, %r14
	jne	.L451
	movl	%r8d, 80(%rsp)
	movl	%eax, %r15d
	movq	%rdi, 8(%rsp)
	movq	%rdx, 32(%rsp)
	jmp	.L453
.L901:
	movq	32(%rsp), %rdx
	leaq	(%r11,%rdx), %r12
	movl	%r11d, %edx
	jmp	.L220
.L917:
	movq	32(%rsp), %rdx
	leaq	(%r11,%rdx), %rbp
	movl	%r11d, %edx
	jmp	.L184
.L908:
	leaq	(%r14,%rdi), %rax
	movq	%rax, 32(%rsp)
	leal	-1(%rdi), %eax
	movl	%eax, %r13d
	jmp	.L355
.L550:
	movl	$36, %r10d
	jmp	.L271
	.p2align 4,,10
	.p2align 3
.L272:
	movq	0(%r13,%r10), %rax
	addq	$8, %r10
	movq	-8(%r14,%r10), %r8
	cmpq	%r8, %rax
	jne	.L925
.L271:
	leal	8(%r10), %eax
	movl	%r10d, %ebp
	cmpl	%eax, %ebx
	jnb	.L272
	cmpl	%ebx, %r10d
	jnb	.L273
	movl	%r10d, %r10d
.L274:
	movzbl	(%r14,%r10), %eax
	movl	%r10d, %ebp
	cmpb	%al, 0(%r13,%r10)
	jne	.L273
	addq	$1, %r10
	cmpl	%ebx, %r10d
	jb	.L274
	addl	$1, %ebp
	jmp	.L273
.L925:
	xorq	%rax, %r8
	jmp	.L269
.L904:
	movq	40(%rsp), %rdx
	leaq	(%r11,%rdx), %r12
	movl	%r11d, %edx
	jmp	.L146
.L788:
	movq	48(%rsp), %rbx
	movl	72(%rsp), %r8d
	movl	%r15d, %eax
	movq	8(%rsp), %rdi
	movq	24(%rsp), %r10
	movq	56(%rsp), %r9
.L312:
	movzbl	(%r14), %ecx
	addq	$1, %r14
	movzbl	3700(%r9,%rcx), %esi
	leaq	(%r9,%rcx,4), %r11
	movl	%eax, %ecx
	movl	2420(%r11), %edx
	addl	$1, 68032(%r11)
	addl	%esi, %eax
	subl	$1, %esi
	salq	%cl, %rdx
	movl	%eax, %ecx
	orl	%esi, %r8d
	orq	%rbx, %rdx
	shrl	$3, %ecx
	movq	%rdx, (%rdi)
	addq	%rcx, %rdi
	movl	%eax, %ecx
	movq	%rdx, %rbx
	andl	$-8, %ecx
	andl	$7, %eax
	shrq	%cl, %rbx
	cmpq	%r10, %r14
	jne	.L312
	movq	%rbx, 48(%rsp)
	movl	%eax, %r15d
	movl	%r8d, 72(%rsp)
	movq	%rdi, 8(%rsp)
	jmp	.L314
.L785:
	movq	8(%rsp), %rdi
	movq	56(%rsp), %r8
	movl	%r11d, %eax
.L241:
	movzbl	(%r14), %ecx
	movq	48(%rsp), %rbx
	addq	$1, %r14
	movzbl	3700(%r8,%rcx), %esi
	leaq	(%r8,%rcx,4), %r9
	movl	%eax, %ecx
	movl	2420(%r9), %edx
	addl	$1, 68032(%r9)
	addl	%esi, %eax
	subl	$1, %esi
	orl	%esi, 64(%rsp)
	salq	%cl, %rdx
	movl	%eax, %ecx
	orq	%rbx, %rdx
	shrl	$3, %ecx
	movq	24(%rsp), %rbx
	movq	%rdx, (%rdi)
	addq	%rcx, %rdi
	movl	%eax, %ecx
	andl	$7, %eax
	andl	$-8, %ecx
	shrq	%cl, %rdx
	movq	%rdx, 48(%rsp)
	cmpq	%rbx, %r14
	jne	.L241
	movq	%rdi, 8(%rsp)
	movl	%eax, %r15d
	jmp	.L243
.L791:
	movq	32(%rsp), %rdx
	movl	80(%rsp), %r9d
	movl	%r15d, %eax
	movq	8(%rsp), %r8
	movq	24(%rsp), %r11
	movq	56(%rsp), %r10
.L382:
	movzbl	(%r14), %ecx
	addq	$1, %r14
	movzbl	3700(%r10,%rcx), %esi
	movl	2420(%r10,%rcx,4), %edi
	movl	%eax, %ecx
	addl	%esi, %eax
	salq	%cl, %rdi
	subl	$1, %esi
	movl	%eax, %ecx
	orq	%rdi, %rdx
	orl	%esi, %r9d
	shrl	$3, %ecx
	movq	%rdx, (%r8)
	addq	%rcx, %r8
	movl	%eax, %ecx
	andl	$7, %eax
	andl	$-8, %ecx
	shrq	%cl, %rdx
	cmpq	%r11, %r14
	jne	.L382
	movq	%rdx, 32(%rsp)
	movl	%eax, %r15d
	movl	%r9d, 80(%rsp)
	movq	%r8, 8(%rsp)
	jmp	.L453
.L911:
	leaq	(%r14,%rdi), %rbp
	leal	-1(%rdi), %ebx
	jmp	.L425
.L898:
	leaq	(%r14,%rdi), %rbp
	leal	-1(%rdi), %ebx
	jmp	.L494
.L549:
	movl	$4, %r10d
	jmp	.L271
.L914:
	movq	40(%rsp), %rdx
	leaq	(%r11,%rdx), %r14
	movl	%r11d, %edx
	jmp	.L108
.L538:
	movq	%rbp, %rdx
	movl	$131072, %ecx
	jmp	.L197
.L517:
	movq	40(%rsp), %rdx
	movl	$32768, %esi
	jmp	.L85
.L531:
	movq	32(%rsp), %rdx
	movl	$32768, %esi
	jmp	.L161
.L524:
	movq	%rbp, %rdx
	movl	$131072, %ecx
	jmp	.L123
.L920:
	leaq	(%rdi,%r14), %rax
	movq	%rax, 32(%rsp)
	leal	-1(%rdi), %eax
	movl	%eax, 80(%rsp)
	jmp	.L287
	.cfi_endproc
.LFE6549:
	.size	deflate_direct, .-deflate_direct
