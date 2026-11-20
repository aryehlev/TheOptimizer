deflate_direct:
.LFB6549:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %r15
	movq	%rcx, %rdi
	movq	%rdx, %r9
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	$-1, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	addq	%rdx, %rsi
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	movzbl	68016(%r15), %eax
	movq	%rcx, 80(%rsp)
	movl	1104(%r15), %ecx
	movq	%rsi, (%rsp)
	movl	%ecx, %edx
	andl	$7, %ecx
	shrl	$3, %edx
	sall	%cl, %r12d
	cmpb	$0, 68017(%r15)
	movl	%ecx, %r14d
	leaq	(%rdi,%rdx), %r13
	notl	%r12d
	je	.L81
	testb	%r8b, %r8b
	je	.L82
	leaq	56(%r15), %rbp
	cmpb	$13, %al
	je	.L837
	leaq	74080(%r15), %r11
	cmpq	$9, %r9
	jbe	.L530
	movq	(%rsp), %rax
	leaq	-9(%rax), %rdi
	subq	$12, %rax
	cmpq	$12, %r9
	cmovbe	%rbx, %rax
	movq	%rdi, 8(%rsp)
	movq	%rax, 32(%rsp)
.L123:
	movq	80(%rsp), %rdi
	leaq	5316(%r15), %rsi
	movq	%r9, 40(%rsp)
	movq	%r11, 24(%rsp)
	movq	%rdx, 16(%rsp)
	call	memcpy@PLT
	movl	32(%r15), %esi
	movq	16(%rsp), %rdx
	movl	$32768, %ecx
	movq	40(%rsp), %r9
	movq	24(%rsp), %r11
	subq	%rsi, %rcx
	andb	5316(%r15,%rdx), %r12b
	movq	%rsi, %rdx
	movl	$0, 1124(%r15)
	cmpq	%rcx, %r9
	movzbl	%r12b, %eax
	jnb	.L838
	movl	36(%r15), %ecx
	leal	-1(%rsi), %r10d
	movq	%rbx, %rdi
	addl	%r9d, %edx
	movl	%r10d, 16(%rsp)
	subq	%rsi, %rdi
	movl	%edx, 32(%r15)
	movl	%r10d, %fs:mf_stale_cutoff@tpoff
	cmpl	$14, %ecx
	jbe	.L839
.L126:
	movq	8(%rsp), %rsi
	movl	%r14d, %r9d
	cmpq	%rsi, %rbx
	jnb	.L128
	movq	(%rbx), %r8
	xorl	%r12d, %r12d
	addq	$1, %rsi
	movl	%r14d, %ecx
	movabsq	$-5654854502012944384, %r10
	movq	%rsi, 48(%rsp)
	imulq	%r10, %r8
	movl	%r12d, 24(%rsp)
	shrq	$48, %r8
.L129:
	movq	32(%rsp), %rsi
	cmpq	%rsi, %rbx
	jnb	.L840
.L135:
	movq	(%rbx), %rsi
	movl	%r8d, %r8d
	movq	%rbx, %r9
	movl	16(%rsp), %r14d
	leaq	(%r11,%r8,2), %r8
	subq	%rdi, %r9
	movswq	(%r8), %rdx
	movw	%r9w, (%r8)
	movq	%rsi, %r8
	shrq	$8, %r8
	imulq	%r10, %r8
	movswl	%dx, %r9d
	shrq	$48, %r8
	cmpl	%r14d, %r9d
	jle	.L130
	addq	%rdi, %rdx
	cmpl	%esi, (%rdx)
	je	.L811
.L130:
	movzbl	%sil, %edx
	leaq	(%r11,%r8,2), %r8
	movl	16(%rsp), %r12d
	movl	0(%rbp,%rdx,4), %esi
	addl	$1, 68032(%r15,%rdx,4)
	movswq	(%r8), %rdx
	movzwl	%si, %r9d
	shrl	$16, %esi
	salq	%cl, %r9
	addl	%esi, %ecx
	leaq	1(%rbx), %rsi
	orq	%r9, %rax
	movq	%rsi, %r14
	movq	1(%rbx), %r9
	subq	%rdi, %r14
	movw	%r14w, (%r8)
	movq	%r9, %r8
	movswl	%dx, %r14d
	shrq	$8, %r8
	imulq	%r10, %r8
	shrq	$48, %r8
	cmpl	%r12d, %r14d
	jle	.L132
	addq	%rdi, %rdx
	cmpl	%r9d, (%rdx)
	je	.L810
.L132:
	movzbl	%r9b, %edx
	leaq	(%r11,%r8,2), %r8
	movl	16(%rsp), %r12d
	movl	0(%rbp,%rdx,4), %esi
	addl	$1, 68032(%r15,%rdx,4)
	movswq	(%r8), %rdx
	movzwl	%si, %r9d
	shrl	$16, %esi
	salq	%cl, %r9
	addl	%esi, %ecx
	leaq	2(%rbx), %rsi
	orq	%r9, %rax
	movq	%rsi, %r14
	movq	2(%rbx), %r9
	subq	%rdi, %r14
	movw	%r14w, (%r8)
	movq	%r9, %r8
	movswl	%dx, %r14d
	shrq	$8, %r8
	imulq	%r10, %r8
	shrq	$48, %r8
	cmpl	%r12d, %r14d
	jle	.L133
	addq	%rdi, %rdx
	cmpl	%r9d, (%rdx)
	je	.L810
.L133:
	movzbl	%r9b, %edx
	leaq	(%r11,%r8,2), %r8
	movl	16(%rsp), %r12d
	movl	0(%rbp,%rdx,4), %esi
	addl	$1, 68032(%r15,%rdx,4)
	movswq	(%r8), %rdx
	movzwl	%si, %r9d
	shrl	$16, %esi
	salq	%cl, %r9
	addl	%esi, %ecx
	leaq	3(%rbx), %rsi
	orq	%r9, %rax
	movq	%rsi, %r14
	movq	3(%rbx), %r9
	subq	%rdi, %r14
	movw	%r14w, (%r8)
	movq	%r9, %r8
	movswl	%dx, %r14d
	shrq	$8, %r8
	imulq	%r10, %r8
	shrq	$48, %r8
	cmpl	%r12d, %r14d
	jle	.L134
	addq	%rdi, %rdx
	cmpl	%r9d, (%rdx)
	je	.L810
.L134:
	movzbl	%r9b, %esi
	addq	$4, %rbx
	movl	0(%rbp,%rsi,4), %edx
	addl	$1, 68032(%r15,%rsi,4)
	movq	32(%rsp), %rsi
	movzwl	%dx, %r9d
	shrl	$16, %edx
	addl	%ecx, %edx
	salq	%cl, %r9
	orl	%edx, 24(%rsp)
	orq	%rax, %r9
	movl	%edx, %eax
	movl	%edx, %ecx
	andl	$7, %edx
	shrl	$3, %eax
	andl	$56, %ecx
	movq	%r9, 0(%r13)
	andl	$7, %eax
	addq	%rax, %r13
	movq	%r9, %rax
	shrq	%cl, %rax
	movl	%edx, %ecx
	cmpq	%rsi, %rbx
	jb	.L135
.L840:
	movq	8(%rsp), %rsi
	movl	24(%rsp), %r12d
	cmpq	%rsi, %rbx
	jnb	.L813
	movl	16(%rsp), %r9d
	movq	%rax, %r14
	.p2align 4,,10
	.p2align 3
.L136:
	movl	%r8d, %r8d
	movq	(%rbx), %rsi
	leaq	(%r11,%r8,2), %rdx
	movq	%rbx, %r8
	subq	%rdi, %r8
	movswq	(%rdx), %rax
	movw	%r8w, (%rdx)
	movq	%rsi, %r8
	shrq	$8, %r8
	movswl	%ax, %edx
	imulq	%r10, %r8
	shrq	$48, %r8
	cmpl	%r9d, %edx
	jle	.L137
	leaq	(%rdi,%rax), %rdx
	cmpl	%esi, (%rdx)
	je	.L535
.L137:
	movzbl	%sil, %esi
	addq	$1, %rbx
	movl	0(%rbp,%rsi,4), %edx
	addl	$1, 68032(%r15,%rsi,4)
	movzwl	%dx, %eax
	shrl	$16, %edx
	addl	%ecx, %edx
	salq	%cl, %rax
	movl	%edx, %ecx
	orq	%r14, %rax
	orl	%edx, %r12d
	shrl	$3, %ecx
	movq	%rax, 0(%r13)
	andl	$7, %ecx
	addq	%rcx, %r13
	movl	%edx, %ecx
	andl	$56, %ecx
	shrq	%cl, %rax
	movl	%edx, %ecx
	movq	%rax, %r14
	andl	$7, %ecx
	cmpq	%rbx, 8(%rsp)
	jne	.L136
.L813:
	orl	%ecx, %r12d
	movl	%ecx, %r14d
	movl	%r12d, %r9d
.L128:
	movq	(%rsp), %rsi
	movq	%rax, 0(%r13)
	subq	%rbx, %rsi
	cmpq	$3, %rsi
	jbe	.L538
	leaq	-4(%rsi), %r10
	movq	%r10, %r8
	movq	%r10, 8(%rsp)
	shrq	$2, %r8
	movq	%r8, 16(%rsp)
	leaq	4(%rbx,%r8,4), %r12
	movq	%r12, (%rsp)
	movl	%r9d, %r12d
	.p2align 4,,10
	.p2align 3
.L156:
	movzbl	(%rbx), %ecx
	movzbl	1(%rbx), %esi
	addq	$4, %rbx
	movl	0(%rbp,%rcx,4), %edi
	movq	%rcx, %rdx
	addl	$1, 68032(%r15,%rdx,4)
	movzbl	-2(%rbx), %edx
	movl	0(%rbp,%rsi,4), %r8d
	movl	%edi, %ecx
	movzwl	%di, %edi
	addl	$1, 68032(%r15,%rsi,4)
	shrl	$16, %ecx
	movq	%rdx, %rsi
	movl	0(%rbp,%rdx,4), %edx
	addl	$1, 68032(%r15,%rsi,4)
	movl	%r8d, %r11d
	addl	%r14d, %ecx
	movzbl	-1(%rbx), %esi
	shrl	$16, %r11d
	movzwl	%r8w, %r8d
	movl	%edx, %r10d
	movzwl	%dx, %edx
	salq	%cl, %r8
	addl	%ecx, %r11d
	movl	%r14d, %ecx
	movq	%rsi, %r9
	salq	%cl, %rdi
	movl	0(%rbp,%rsi,4), %esi
	movl	%r11d, %ecx
	shrl	$16, %r10d
	addl	%r11d, %r10d
	orq	%r8, %rdi
	salq	%cl, %rdx
	addl	$1, 68032(%r15,%r9,4)
	orq	%rdi, %rdx
	movl	%r10d, %ecx
	movzwl	%si, %edi
	shrl	$16, %esi
	salq	%cl, %rdi
	addl	%r10d, %esi
	orq	%rdi, %rdx
	movl	%esi, %ecx
	movq	(%rsp), %rdi
	orl	%esi, %r12d
	orq	%rax, %rdx
	movl	%esi, %eax
	andl	$56, %ecx
	andl	$7, %esi
	shrl	$3, %eax
	movq	%rdx, 0(%r13)
	movl	%esi, %r14d
	andl	$7, %eax
	addq	%rax, %r13
	movq	%rdx, %rax
	shrq	%cl, %rax
	cmpq	%rdi, %rbx
	jne	.L156
	movq	16(%rsp), %r8
	movq	8(%rsp), %r10
	movl	%r12d, %r9d
	movq	%rdi, %r12
	negq	%r8
	leaq	(%r10,%r8,4), %rsi
.L155:
	testq	%rsi, %rsi
	je	.L157
	addq	%r12, %rsi
	movl	%r9d, %r8d
.L158:
	movzbl	(%r12), %ecx
	addq	$1, %r12
	movl	0(%rbp,%rcx,4), %edi
	movq	%rcx, %rdx
	movl	%r14d, %ecx
	addl	$1, 68032(%r15,%rdx,4)
	movzwl	%di, %r9d
	shrl	$16, %edi
	addl	%edi, %r14d
	salq	%cl, %r9
	movl	%r14d, %edx
	movl	%r14d, %ecx
	orq	%r9, %rax
	orl	%r14d, %r8d
	shrl	$3, %edx
	andl	$56, %ecx
	movq	%rax, 0(%r13)
	andl	$7, %r14d
	andl	$7, %edx
	shrq	%cl, %rax
	addq	%rdx, %r13
	cmpq	%rsi, %r12
	jne	.L158
	movl	%r8d, %r9d
.L157:
	movl	3444(%r15), %edx
	movl	%r14d, %ecx
	movl	%r9d, %r12d
	salq	%cl, %rdx
	movzbl	3956(%r15), %ecx
	orq	%rdx, %rax
	addl	%r14d, %ecx
	movq	%rax, 0(%r13)
	orl	%ecx, %r12d
	cmpl	$63, %r12d
	jbe	.L825
.L159:
	xorl	%eax, %eax
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L81:
	movl	68028(%r15), %esi
	movl	$258, %ecx
	cmpl	%ecx, %esi
	cmovbe	%esi, %ecx
	movl	%ecx, 16(%rsp)
	testb	%r8b, %r8b
	jne	.L841
	movq	%r9, 32(%rsp)
	movq	80(%rsp), %rdi
	leaq	5316(%r15), %rsi
	movq	%rdx, 8(%rsp)
	cmpb	$13, %al
	je	.L842
	call	memcpy@PLT
	movq	8(%rsp), %rdx
	movl	32(%r15), %esi
	movq	32(%rsp), %r9
	andb	5316(%r15,%rdx), %r12b
	movl	$32768, %edx
	movzbl	%r12b, %eax
	subq	%rsi, %rdx
	movq	%rax, 24(%rsp)
	movq	%rsi, %rax
	movl	$0, 1124(%r15)
	cmpq	%rdx, %r9
	jnb	.L843
	movl	36(%r15), %ecx
	movq	%rbx, %rdx
	leal	-1(%rsi), %edi
	addl	%r9d, %eax
	subq	%rsi, %rdx
	movl	%edi, 72(%rsp)
	movq	%rdx, 8(%rsp)
	movl	%eax, 32(%r15)
	movl	%edi, %fs:mf_stale_cutoff@tpoff
	cmpl	$14, %ecx
	jbe	.L844
.L450:
	testq	%r9, %r9
	je	.L452
	xorl	%r9d, %r9d
	movl	%r14d, 48(%rsp)
	xorl	%r11d, %r11d
	leaq	74080(%r15), %rax
	movl	$0, 56(%rsp)
	movl	%r9d, %r8d
	movq	%rax, %r14
	movdqa	.LC5(%rip), %xmm0
	movq	%r13, 40(%rsp)
	leaq	205152(%r15), %r12
	jmp	.L515
	.p2align 4,,10
	.p2align 3
.L459:
	movl	72(%rsp), %edi
	addw	$-32768, %cx
	movl	(%rbx), %r13d
	movzwl	74080(%r15,%r8,4), %r9d
	cmpl	%eax, %edi
	cmovge	%edi, %ecx
	imull	$506832829, 1(%rbx), %eax
	shrl	$17, %eax
	movl	%eax, %edx
	movl	%eax, 32(%rsp)
	prefetcht0	(%r14,%rdx,4)
	movw	%si, 74080(%r15,%r8,4)
	cmpw	%cx, %r9w
	jle	.L463
	movq	8(%rsp), %rax
	movswq	%r9w, %rsi
	movswq	74082(%r15,%r8,4), %rdi
	movw	%r9w, 74082(%r15,%r8,4)
	addq	%rax, %rsi
	cmpl	(%rsi), %r13d
	je	.L845
	cmpw	%di, %cx
	jge	.L463
	movq	8(%rsp), %rax
	addq	%rax, %rdi
	cmpl	(%rdi), %r13d
	je	.L846
.L463:
	movzbl	(%rbx), %edx
	movl	48(%rsp), %eax
	addl	$1, %r11d
	leaq	1(%rbx), %rbp
	movq	24(%rsp), %rdi
	movzbl	3700(%r15,%rdx), %esi
	movl	%eax, %ecx
	movl	2420(%r15,%rdx,4), %edx
	addl	%esi, %eax
	salq	%cl, %rdx
	subl	$1, %esi
	orl	%esi, 56(%rsp)
	orq	%rdi, %rdx
	movl	%eax, %edi
	movq	40(%rsp), %rax
	movl	%edi, %ecx
	shrl	$3, %ecx
	movq	%rdx, (%rax)
	addq	%rcx, %rax
	movl	%edi, %ecx
	andl	$7, %edi
	andl	$-8, %ecx
	movq	%rax, 40(%rsp)
	shrq	%cl, %rdx
	movl	%edi, 48(%rsp)
	movq	%rdx, 24(%rsp)
	testb	$15, %r11b
	je	.L847
.L506:
	movq	(%rsp), %rax
	cmpq	%rax, %rbp
	je	.L804
.L511:
	movl	32(%rsp), %r8d
	movq	%rbp, %rbx
.L515:
	movq	(%rsp), %rax
	movl	16(%rsp), %edi
	movl	$258, %ebp
	subq	%rbx, %rax
	movl	%edi, 64(%rsp)
	cmpq	$257, %rax
	jbe	.L848
.L453:
	movq	8(%rsp), %rax
	movq	%rbx, %rsi
	subq	%rax, %rsi
	movl	%esi, %ecx
	leal	-32767(%rsi), %eax
	cmpl	$32768, %esi
	jne	.L459
	movq	%r14, %rax
	.p2align 4,,10
	.p2align 3
.L460:
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
	cmpq	%r12, %rax
	jne	.L460
	addq	$32768, 8(%rsp)
	xorl	%esi, %esi
	movl	$-32767, %eax
	xorl	%ecx, %ecx
	jmp	.L459
	.p2align 4,,10
	.p2align 3
.L82:
	cmpb	$13, %al
	je	.L849
	leaq	56(%r15), %rbp
	leaq	74080(%r15), %r10
	cmpq	$9, %r9
	jbe	.L548
	movq	(%rsp), %rax
	leaq	-9(%rax), %rdi
	subq	$12, %rax
	cmpq	$12, %r9
	cmovbe	%rbx, %rax
	movq	%rdi, 8(%rsp)
	movq	%rax, 16(%rsp)
.L199:
	movq	80(%rsp), %rdi
	leaq	5316(%r15), %rsi
	movq	%r9, 40(%rsp)
	movq	%r10, 32(%rsp)
	movq	%rdx, 24(%rsp)
	call	memcpy@PLT
	movl	32(%r15), %esi
	movq	24(%rsp), %rdx
	movl	$32768, %ecx
	movq	40(%rsp), %r9
	movq	32(%rsp), %r10
	subq	%rsi, %rcx
	andb	5316(%r15,%rdx), %r12b
	movq	%rsi, %rdx
	movl	$0, 1124(%r15)
	cmpq	%rcx, %r9
	movzbl	%r12b, %eax
	jnb	.L850
	movl	36(%r15), %ecx
	leal	-1(%rsi), %r11d
	movq	%rbx, %rdi
	addl	%r9d, %edx
	movl	%r11d, 32(%rsp)
	subq	%rsi, %rdi
	movl	%edx, 32(%r15)
	movl	%r11d, %fs:mf_stale_cutoff@tpoff
	cmpl	$14, %ecx
	jbe	.L851
.L202:
	movq	8(%rsp), %rsi
	movl	%r14d, %r11d
	cmpq	%rsi, %rbx
	jnb	.L204
	movq	(%rbx), %r8
	addq	$1, %rsi
	movq	%r15, 24(%rsp)
	xorl	%r12d, %r12d
	movq	%rsi, 48(%rsp)
	movl	32(%rsp), %r15d
	movl	%r14d, %ecx
	movabsq	$-5654854502012944384, %r11
	imulq	%r11, %r8
	shrq	$48, %r8
.L205:
	movq	16(%rsp), %rsi
	cmpq	%rsi, %rbx
	jnb	.L852
.L211:
	movq	(%rbx), %rsi
	movl	%r8d, %r8d
	movq	%rbx, %r9
	leaq	(%r10,%r8,2), %r8
	subq	%rdi, %r9
	movswq	(%r8), %rdx
	movw	%r9w, (%r8)
	movq	%rsi, %r8
	shrq	$8, %r8
	imulq	%r11, %r8
	movswl	%dx, %r9d
	shrq	$48, %r8
	cmpl	%r15d, %r9d
	jle	.L206
	addq	%rdi, %rdx
	cmpl	%esi, (%rdx)
	je	.L818
.L206:
	movzbl	%sil, %esi
	movq	1(%rbx), %r9
	leaq	(%r10,%r8,2), %r8
	movl	0(%rbp,%rsi,4), %edx
	movzwl	%dx, %esi
	shrl	$16, %edx
	salq	%cl, %rsi
	addl	%edx, %ecx
	movswq	(%r8), %rdx
	orq	%rsi, %rax
	leaq	1(%rbx), %rsi
	movq	%rsi, %r14
	subq	%rdi, %r14
	movw	%r14w, (%r8)
	movq	%r9, %r8
	movswl	%dx, %r14d
	shrq	$8, %r8
	imulq	%r11, %r8
	shrq	$48, %r8
	cmpl	%r15d, %r14d
	jle	.L208
	addq	%rdi, %rdx
	cmpl	%r9d, (%rdx)
	je	.L817
.L208:
	movzbl	%r9b, %r9d
	leaq	(%r10,%r8,2), %r8
	movl	0(%rbp,%r9,4), %edx
	movq	2(%rbx), %r9
	movzwl	%dx, %esi
	shrl	$16, %edx
	salq	%cl, %rsi
	addl	%edx, %ecx
	movswq	(%r8), %rdx
	orq	%rsi, %rax
	leaq	2(%rbx), %rsi
	movq	%rsi, %r14
	subq	%rdi, %r14
	movw	%r14w, (%r8)
	movq	%r9, %r8
	movswl	%dx, %r14d
	shrq	$8, %r8
	imulq	%r11, %r8
	shrq	$48, %r8
	cmpl	%r15d, %r14d
	jle	.L209
	addq	%rdi, %rdx
	cmpl	%r9d, (%rdx)
	je	.L817
.L209:
	movzbl	%r9b, %r9d
	leaq	(%r10,%r8,2), %r8
	movl	0(%rbp,%r9,4), %edx
	movq	3(%rbx), %r9
	movzwl	%dx, %esi
	shrl	$16, %edx
	salq	%cl, %rsi
	addl	%edx, %ecx
	movswq	(%r8), %rdx
	orq	%rsi, %rax
	leaq	3(%rbx), %rsi
	movq	%rsi, %r14
	subq	%rdi, %r14
	movw	%r14w, (%r8)
	movq	%r9, %r8
	movswl	%dx, %r14d
	shrq	$8, %r8
	imulq	%r11, %r8
	shrq	$48, %r8
	cmpl	%r15d, %r14d
	jle	.L210
	addq	%rdi, %rdx
	cmpl	%r9d, (%rdx)
	je	.L817
.L210:
	movzbl	%r9b, %r9d
	addq	$4, %rbx
	movl	0(%rbp,%r9,4), %edx
	movzwl	%dx, %esi
	shrl	$16, %edx
	addl	%ecx, %edx
	salq	%cl, %rsi
	orq	%rax, %rsi
	movl	%edx, %eax
	movl	%edx, %ecx
	orl	%edx, %r12d
	shrl	$3, %eax
	movq	%rsi, 0(%r13)
	andl	$56, %ecx
	andl	$7, %edx
	andl	$7, %eax
	addq	%rax, %r13
	movq	%rsi, %rax
	movq	16(%rsp), %rsi
	shrq	%cl, %rax
	movl	%edx, %ecx
	cmpq	%rsi, %rbx
	jb	.L211
.L852:
	movq	8(%rsp), %rsi
	cmpq	%rsi, %rbx
	jnb	.L820
	movq	8(%rsp), %rsi
	movq	%rax, %r9
	.p2align 4,,10
	.p2align 3
.L212:
	movq	(%rbx), %rdx
	movl	%r8d, %r8d
	movq	%rbx, %r14
	leaq	(%r10,%r8,2), %r8
	subq	%rdi, %r14
	movswq	(%r8), %rax
	movw	%r14w, (%r8)
	movq	%rdx, %r8
	shrq	$8, %r8
	imulq	%r11, %r8
	movswl	%ax, %r14d
	shrq	$48, %r8
	cmpl	%r15d, %r14d
	jle	.L213
	addq	%rdi, %rax
	cmpl	%edx, (%rax)
	je	.L553
.L213:
	movzbl	%dl, %edx
	addq	$1, %rbx
	movl	0(%rbp,%rdx,4), %edx
	movzwl	%dx, %eax
	shrl	$16, %edx
	addl	%ecx, %edx
	salq	%cl, %rax
	movl	%edx, %ecx
	orq	%r9, %rax
	orl	%edx, %r12d
	shrl	$3, %ecx
	movq	%rax, 0(%r13)
	andl	$7, %ecx
	addq	%rcx, %r13
	movl	%edx, %ecx
	andl	$56, %ecx
	shrq	%cl, %rax
	movl	%edx, %ecx
	movq	%rax, %r9
	andl	$7, %ecx
	cmpq	%rbx, %rsi
	jne	.L212
.L820:
	movl	%r12d, %r11d
	movq	24(%rsp), %r15
	movl	%ecx, %r14d
	orl	%ecx, %r11d
.L204:
	movq	(%rsp), %rsi
	movq	%rax, 0(%r13)
	subq	%rbx, %rsi
	cmpq	$3, %rsi
	jbe	.L556
	leaq	-4(%rsi), %rdi
	movq	%rdi, %rdx
	movq	%rdi, (%rsp)
	shrq	$2, %rdx
	movq	%rdx, 8(%rsp)
	leaq	4(%rbx,%rdx,4), %r12
	.p2align 4,,10
	.p2align 3
.L232:
	movzbl	(%rbx), %edx
	movzbl	1(%rbx), %esi
	addq	$4, %rbx
	movl	0(%rbp,%rdx,4), %edx
	movl	0(%rbp,%rsi,4), %r8d
	movzbl	-2(%rbx), %esi
	movl	%edx, %ecx
	movl	%r8d, %r10d
	movzwl	%r8w, %r8d
	movzwl	%dx, %edx
	movl	0(%rbp,%rsi,4), %edi
	shrl	$16, %ecx
	movzbl	-1(%rbx), %esi
	shrl	$16, %r10d
	addl	%r14d, %ecx
	addl	%ecx, %r10d
	movl	%edi, %r9d
	salq	%cl, %r8
	movl	%r14d, %ecx
	movl	0(%rbp,%rsi,4), %esi
	salq	%cl, %rdx
	shrl	$16, %r9d
	movl	%r10d, %ecx
	movzwl	%di, %edi
	addl	%r10d, %r9d
	orq	%r8, %rdx
	salq	%cl, %rdi
	movl	%r9d, %ecx
	orq	%rdi, %rdx
	movzwl	%si, %edi
	shrl	$16, %esi
	salq	%cl, %rdi
	addl	%r9d, %esi
	orq	%rdi, %rdx
	movl	%esi, %ecx
	orl	%esi, %r11d
	orq	%rdx, %rax
	movl	%esi, %edx
	andl	$56, %ecx
	andl	$7, %esi
	shrl	$3, %edx
	movq	%rax, 0(%r13)
	movl	%esi, %r14d
	shrq	%cl, %rax
	andl	$7, %edx
	addq	%rdx, %r13
	cmpq	%r12, %rbx
	jne	.L232
	movq	8(%rsp), %rdx
	movq	(%rsp), %rdi
	negq	%rdx
	leaq	(%rdi,%rdx,4), %rsi
.L231:
	testq	%rsi, %rsi
	je	.L233
	addq	%r12, %rsi
.L234:
	movzbl	(%r12), %edx
	movl	%r14d, %ecx
	addq	$1, %r12
	movl	0(%rbp,%rdx,4), %edx
	movzwl	%dx, %edi
	shrl	$16, %edx
	addl	%edx, %r14d
	salq	%cl, %rdi
	movl	%r14d, %edx
	movl	%r14d, %ecx
	orq	%rdi, %rax
	orl	%r14d, %r11d
	shrl	$3, %edx
	andl	$56, %ecx
	movq	%rax, 0(%r13)
	andl	$7, %r14d
	andl	$7, %edx
	shrq	%cl, %rax
	addq	%rdx, %r13
	cmpq	%rsi, %r12
	jne	.L234
.L233:
	movl	3444(%r15), %edx
	movl	%r14d, %ecx
	salq	%cl, %rdx
	movzbl	3956(%r15), %ecx
	orq	%rdx, %rax
	addl	%r14d, %ecx
	movq	%rax, 0(%r13)
	orl	%ecx, %r11d
	cmpl	$63, %r11d
	ja	.L159
.L825:
	movl	%ecx, %edx
	movl	%ecx, %esi
	shrl	$3, %edx
	andl	$7, %edx
	addq	%r13, %rdx
	andl	$7, %esi
	je	.L516
	andl	$56, %ecx
	shrq	%cl, %rax
	movb	%al, (%rdx)
.L516:
	movq	80(%rsp), %rax
	movl	%esi, %esi
	subq	%rax, %rdx
	leaq	(%rsi,%rdx,8), %rax
.L80:
	addq	$152, %rsp
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
.L841:
	.cfi_restore_state
	movq	%r9, 24(%rsp)
	movq	80(%rsp), %rdi
	leaq	5316(%r15), %rsi
	movq	%rdx, 8(%rsp)
	cmpb	$13, %al
	je	.L853
	call	memcpy@PLT
	movq	8(%rsp), %rdx
	movl	32(%r15), %esi
	movq	24(%rsp), %r9
	andb	5316(%r15,%rdx), %r12b
	movl	$32768, %edx
	movzbl	%r12b, %eax
	subq	%rsi, %rdx
	movq	%rax, 32(%rsp)
	movq	%rsi, %rax
	movl	$0, 1124(%r15)
	cmpq	%rdx, %r9
	jnb	.L854
	movl	36(%r15), %ecx
	movq	%rbx, %rdx
	leal	-1(%rsi), %edi
	addl	%r9d, %eax
	subq	%rsi, %rdx
	movl	%edi, 56(%rsp)
	movl	%eax, 32(%r15)
	movq	%rdx, %rsi
	movl	%edi, %fs:mf_stale_cutoff@tpoff
	cmpl	$14, %ecx
	jbe	.L855
.L311:
	movq	(%rsp), %rax
	cmpq	%rax, %rbx
	je	.L313
	movl	%r14d, 40(%rsp)
	xorl	%r10d, %r10d
	movq	%r13, %r14
	xorl	%r9d, %r9d
	movl	$0, 48(%rsp)
	movdqa	.LC5(%rip), %xmm0
	leaq	74080(%r15), %r12
	movq	%rsi, %r13
	jmp	.L376
	.p2align 4,,10
	.p2align 3
.L320:
	movl	56(%rsp), %esi
	addw	$-32768, %cx
	movl	(%rbx), %ebp
	cmpl	%eax, %esi
	cmovge	%esi, %ecx
	imull	$506832829, 1(%rbx), %eax
	movl	%r9d, %esi
	movzwl	74080(%r15,%rsi,4), %r8d
	shrl	$17, %eax
	movl	%eax, %edx
	movl	%eax, 24(%rsp)
	prefetcht0	(%r12,%rdx,4)
	movw	%di, 74080(%r15,%rsi,4)
	cmpw	%cx, %r8w
	jle	.L324
	movswq	74082(%r15,%rsi,4), %rdi
	movswq	%r8w, %r9
	movw	%r8w, 74082(%r15,%rsi,4)
	addq	%r13, %r9
	cmpl	(%r9), %ebp
	je	.L856
	cmpw	%di, %cx
	jge	.L324
	leaq	0(%r13,%rdi), %rcx
	cmpl	(%rcx), %ebp
	je	.L857
.L324:
	movzbl	(%rbx), %ecx
	leaq	1(%rbx), %rax
	movq	32(%rsp), %rsi
	addl	$1, %r10d
	movq	%rax, 8(%rsp)
	movl	40(%rsp), %eax
	movzbl	3700(%r15,%rcx), %edi
	leaq	(%r15,%rcx,4), %r8
	movl	2420(%r8), %edx
	movl	%eax, %ecx
	addl	$1, 68032(%r8)
	addl	%edi, %eax
	subl	$1, %edi
	orl	%edi, 48(%rsp)
	salq	%cl, %rdx
	movl	%eax, %ecx
	movl	%eax, %r9d
	orq	%rsi, %rdx
	shrl	$3, %ecx
	andl	$7, %r9d
	movq	%rdx, (%r14)
	addq	%rcx, %r14
	movl	%eax, %ecx
	andl	$-8, %ecx
	movl	%r9d, 40(%rsp)
	shrq	%cl, %rdx
	movq	%rdx, 32(%rsp)
	testb	$15, %r10b
	je	.L858
.L367:
	movq	(%rsp), %rbx
	cmpq	%rbx, 8(%rsp)
	je	.L798
.L372:
	movl	24(%rsp), %r9d
	movq	8(%rsp), %rbx
.L376:
	movq	(%rsp), %rax
	movl	16(%rsp), %edi
	movl	$258, %r11d
	subq	%rbx, %rax
	movl	%edi, 8(%rsp)
	cmpq	$257, %rax
	jbe	.L859
.L314:
	movq	%rbx, %rdi
	subq	%r13, %rdi
	movl	%edi, %ecx
	leal	-32767(%rdi), %eax
	cmpl	$32768, %edi
	jne	.L320
	leaq	205152(%r15), %rdx
	movq	%r12, %rax
	.p2align 4,,10
	.p2align 3
.L321:
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
	cmpq	%rdx, %rax
	jne	.L321
	addq	$32768, %r13
	xorl	%edi, %edi
	movl	$-32767, %eax
	xorl	%ecx, %ecx
	jmp	.L320
.L849:
	leaq	56(%r15), %r10
	leaq	74080(%r15), %r11
	cmpq	$9, %r9
	ja	.L860
	movq	%rbx, 8(%rsp)
	movq	%rbx, 16(%rsp)
.L162:
	movq	80(%rsp), %rdi
	leaq	5316(%r15), %rsi
	movq	%r9, 48(%rsp)
	movq	%r11, 40(%rsp)
	movq	%r10, 32(%rsp)
	movq	%rdx, 24(%rsp)
	call	memcpy@PLT
	movq	24(%rsp), %rdx
	movl	32(%r15), %edi
	movq	48(%rsp), %r9
	movq	32(%rsp), %r10
	andb	5316(%r15,%rdx), %r12b
	movl	$32768, %edx
	movq	40(%rsp), %r11
	movl	$0, 1124(%r15)
	movq	%rdx, %rcx
	movzbl	%r12b, %r12d
	movq	%rdi, %rax
	subq	%rdi, %rcx
	cmpq	%rcx, %r9
	jnb	.L861
	movl	36(%r15), %ecx
	leal	-1(%rdi), %r8d
	movq	%rbx, %rsi
	addl	%r9d, %eax
	movl	%eax, 32(%r15)
	subq	%rdi, %rsi
	movl	%r8d, %fs:mf_stale_cutoff@tpoff
	cmpl	$12, %ecx
	jbe	.L862
.L165:
	movq	8(%rsp), %rax
	movl	%r14d, %edi
	cmpq	%rax, %rbx
	jnb	.L167
	movq	(%rbx), %rdi
	addq	$1, %rax
	movq	%r15, 24(%rsp)
	xorl	%ebp, %ebp
	movabsq	$-5654854502012944384, %r9
	movq	%rax, 48(%rsp)
	movl	%r14d, %ecx
	imulq	%r9, %rdi
	shrq	$50, %rdi
.L168:
	movq	16(%rsp), %rax
	cmpq	%rax, %rbx
	jnb	.L863
.L174:
	movq	(%rbx), %rdx
	movl	%edi, %edi
	movq	%rbx, %r14
	leaq	(%r11,%rdi,2), %rdi
	subq	%rsi, %r14
	movswq	(%rdi), %rax
	movw	%r14w, (%rdi)
	movq	%rdx, %rdi
	shrq	$8, %rdi
	imulq	%r9, %rdi
	movswl	%ax, %r14d
	shrq	$50, %rdi
	cmpl	%r8d, %r14d
	jle	.L169
	addq	%rsi, %rax
	cmpl	%edx, (%rax)
	je	.L815
.L169:
	movzbl	%dl, %edx
	movq	1(%rbx), %r14
	leaq	(%r11,%rdi,2), %rdi
	movl	(%r10,%rdx,4), %eax
	movzwl	%ax, %edx
	shrl	$16, %eax
	salq	%cl, %rdx
	addl	%eax, %ecx
	movswq	(%rdi), %rax
	orq	%rdx, %r12
	leaq	1(%rbx), %rdx
	movq	%rdx, %r15
	subq	%rsi, %r15
	movw	%r15w, (%rdi)
	movq	%r14, %rdi
	movswl	%ax, %r15d
	shrq	$8, %rdi
	imulq	%r9, %rdi
	shrq	$50, %rdi
	cmpl	%r8d, %r15d
	jle	.L171
	addq	%rsi, %rax
	cmpl	%r14d, (%rax)
	je	.L814
.L171:
	movzbl	%r14b, %r14d
	leaq	(%r11,%rdi,2), %rdi
	movl	(%r10,%r14,4), %eax
	movq	2(%rbx), %r14
	movzwl	%ax, %edx
	shrl	$16, %eax
	salq	%cl, %rdx
	addl	%eax, %ecx
	movswq	(%rdi), %rax
	orq	%rdx, %r12
	leaq	2(%rbx), %rdx
	movq	%rdx, %r15
	subq	%rsi, %r15
	movw	%r15w, (%rdi)
	movq	%r14, %rdi
	movswl	%ax, %r15d
	shrq	$8, %rdi
	imulq	%r9, %rdi
	shrq	$50, %rdi
	cmpl	%r8d, %r15d
	jle	.L172
	addq	%rsi, %rax
	cmpl	%r14d, (%rax)
	je	.L814
.L172:
	movzbl	%r14b, %r14d
	leaq	(%r11,%rdi,2), %rdi
	movl	(%r10,%r14,4), %eax
	movq	3(%rbx), %r14
	movzwl	%ax, %edx
	shrl	$16, %eax
	salq	%cl, %rdx
	addl	%eax, %ecx
	movswq	(%rdi), %rax
	orq	%rdx, %r12
	leaq	3(%rbx), %rdx
	movq	%rdx, %r15
	subq	%rsi, %r15
	movw	%r15w, (%rdi)
	movq	%r14, %rdi
	movswl	%ax, %r15d
	shrq	$8, %rdi
	imulq	%r9, %rdi
	shrq	$50, %rdi
	cmpl	%r8d, %r15d
	jle	.L173
	addq	%rsi, %rax
	cmpl	%r14d, (%rax)
	je	.L814
.L173:
	movzbl	%r14b, %r14d
	addq	$4, %rbx
	movl	(%r10,%r14,4), %eax
	movzwl	%ax, %edx
	shrl	$16, %eax
	addl	%ecx, %eax
	salq	%cl, %rdx
	movl	%eax, %ecx
	orq	%r12, %rdx
	orl	%eax, %ebp
	shrl	$3, %ecx
	movq	%rdx, 0(%r13)
	andl	$7, %ecx
	addq	%rcx, %r13
	movl	%eax, %ecx
	andl	$7, %eax
	andl	$56, %ecx
	shrq	%cl, %rdx
	movl	%eax, %ecx
	movq	16(%rsp), %rax
	movq	%rdx, %r12
	cmpq	%rax, %rbx
	jb	.L174
.L863:
	movq	8(%rsp), %rax
	cmpq	%rax, %rbx
	jnb	.L816
	movq	8(%rsp), %rdx
	movq	%r12, %r14
	.p2align 4,,10
	.p2align 3
.L175:
	movq	(%rbx), %rax
	movl	%edi, %edi
	movq	%rbx, %r15
	leaq	(%r11,%rdi,2), %rdi
	subq	%rsi, %r15
	movswq	(%rdi), %r12
	movw	%r15w, (%rdi)
	movq	%rax, %rdi
	shrq	$8, %rdi
	imulq	%r9, %rdi
	movswl	%r12w, %r15d
	shrq	$50, %rdi
	cmpl	%r8d, %r15d
	jle	.L176
	addq	%rsi, %r12
	cmpl	%eax, (%r12)
	je	.L544
.L176:
	movzbl	%al, %eax
	addq	$1, %rbx
	movl	(%r10,%rax,4), %eax
	movzwl	%ax, %r12d
	shrl	$16, %eax
	addl	%ecx, %eax
	salq	%cl, %r12
	movl	%eax, %ecx
	orq	%r14, %r12
	orl	%eax, %ebp
	shrl	$3, %ecx
	movq	%r12, 0(%r13)
	movq	%r12, %r14
	andl	$7, %ecx
	addq	%rcx, %r13
	movl	%eax, %ecx
	andl	$7, %eax
	andl	$56, %ecx
	shrq	%cl, %r14
	movl	%eax, %ecx
	cmpq	%rbx, %rdx
	jne	.L175
	movq	%r14, %r12
.L816:
	orl	%ecx, %ebp
	movq	24(%rsp), %r15
	movl	%ecx, %r14d
	movl	%ebp, %edi
.L167:
	movq	(%rsp), %rsi
	movq	%r12, 0(%r13)
	subq	%rbx, %rsi
	cmpq	$3, %rsi
	jbe	.L547
	subq	$4, %rsi
	movl	%edi, %ebp
	movq	%rsi, %rax
	movq	%rsi, (%rsp)
	shrq	$2, %rax
	movq	%rax, 8(%rsp)
	leaq	4(%rbx,%rax,4), %r11
	.p2align 4,,10
	.p2align 3
.L195:
	movzbl	(%rbx), %eax
	movzbl	1(%rbx), %edx
	addq	$4, %rbx
	movl	(%r10,%rax,4), %eax
	movl	(%r10,%rdx,4), %edi
	movzbl	-2(%rbx), %edx
	movl	%eax, %ecx
	movl	%edi, %r9d
	movzwl	%di, %edi
	movzwl	%ax, %eax
	shrl	$16, %ecx
	movl	(%r10,%rdx,4), %esi
	shrl	$16, %r9d
	movzbl	-1(%rbx), %edx
	addl	%r14d, %ecx
	addl	%ecx, %r9d
	salq	%cl, %rdi
	movl	%r14d, %ecx
	movl	(%r10,%rdx,4), %edx
	movl	%esi, %r8d
	salq	%cl, %rax
	movzwl	%si, %esi
	movl	%r9d, %ecx
	salq	%cl, %rsi
	shrl	$16, %r8d
	orq	%rdi, %rax
	addl	%r9d, %r8d
	orq	%rsi, %rax
	movzwl	%dx, %esi
	shrl	$16, %edx
	addl	%r8d, %edx
	movl	%r8d, %ecx
	salq	%cl, %rsi
	movl	%edx, %ecx
	orl	%edx, %ebp
	orq	%rsi, %rax
	shrl	$3, %ecx
	orq	%r12, %rax
	andl	$7, %ecx
	movq	%rax, 0(%r13)
	addq	%rcx, %r13
	movl	%edx, %ecx
	andl	$7, %edx
	andl	$56, %ecx
	movl	%edx, %r14d
	shrq	%cl, %rax
	movq	%rax, %r12
	cmpq	%r11, %rbx
	jne	.L195
	movq	8(%rsp), %rax
	movq	(%rsp), %rsi
	movl	%ebp, %edi
	negq	%rax
	leaq	(%rsi,%rax,4), %rsi
.L194:
	testq	%rsi, %rsi
	je	.L196
	addq	%r11, %rsi
	movl	%edi, %edx
.L197:
	movzbl	(%r11), %eax
	movl	%r14d, %ecx
	addq	$1, %r11
	movl	(%r10,%rax,4), %eax
	movzwl	%ax, %edi
	shrl	$16, %eax
	addl	%eax, %r14d
	salq	%cl, %rdi
	movl	%r14d, %eax
	movl	%r14d, %ecx
	orq	%rdi, %r12
	orl	%r14d, %edx
	shrl	$3, %eax
	andl	$56, %ecx
	movq	%r12, 0(%r13)
	andl	$7, %r14d
	andl	$7, %eax
	shrq	%cl, %r12
	addq	%rax, %r13
	cmpq	%rsi, %r11
	jne	.L197
	movl	%edx, %edi
.L196:
	movl	3444(%r15), %eax
	movl	%r14d, %ecx
	movl	%edi, %r10d
	salq	%cl, %rax
	movzbl	3956(%r15), %ecx
	orq	%r12, %rax
	addl	%r14d, %ecx
	movq	%rax, 0(%r13)
	orl	%ecx, %r10d
	cmpl	$63, %r10d
	jbe	.L825
	xorl	%eax, %eax
	jmp	.L80
.L837:
	leaq	74080(%r15), %r10
	cmpq	$9, %r9
	ja	.L864
	movq	%rbx, 8(%rsp)
	movq	%rbx, 32(%rsp)
.L84:
	movq	80(%rsp), %rdi
	leaq	5316(%r15), %rsi
	movq	%r9, 40(%rsp)
	movq	%r10, 24(%rsp)
	movq	%rdx, 16(%rsp)
	call	memcpy@PLT
	movq	16(%rsp), %rdx
	movl	32(%r15), %edi
	movq	40(%rsp), %r9
	movq	24(%rsp), %r10
	andb	5316(%r15,%rdx), %r12b
	movl	$32768, %edx
	movq	%rdi, %rax
	movl	$0, 1124(%r15)
	movq	%rdx, %rcx
	movzbl	%r12b, %r11d
	subq	%rdi, %rcx
	cmpq	%rcx, %r9
	jnb	.L865
	movl	36(%r15), %ecx
	leal	-1(%rdi), %r8d
	movq	%rbx, %rsi
	addl	%r9d, %eax
	movl	%r8d, 16(%rsp)
	subq	%rdi, %rsi
	movl	%eax, 32(%r15)
	movl	%r8d, %fs:mf_stale_cutoff@tpoff
	cmpl	$12, %ecx
	jbe	.L866
.L87:
	movq	8(%rsp), %rax
	movl	%r14d, %edx
	cmpq	%rax, %rbx
	jnb	.L89
	movq	(%rbx), %rdi
	xorl	%r12d, %r12d
	addq	$1, %rax
	movl	%r14d, %ecx
	movabsq	$-5654854502012944384, %r9
	movq	%rax, 56(%rsp)
	imulq	%r9, %rdi
	movl	%r12d, 24(%rsp)
	shrq	$50, %rdi
.L90:
	movq	32(%rsp), %rax
	cmpq	%rax, %rbx
	jnb	.L867
.L96:
	movq	(%rbx), %rdx
	movl	%edi, %edi
	movq	%rbx, %r8
	movl	16(%rsp), %r14d
	leaq	(%r10,%rdi,2), %rdi
	subq	%rsi, %r8
	movswq	(%rdi), %rax
	movw	%r8w, (%rdi)
	movq	%rdx, %rdi
	shrq	$8, %rdi
	imulq	%r9, %rdi
	movswl	%ax, %r8d
	shrq	$50, %rdi
	cmpl	%r14d, %r8d
	jle	.L91
	addq	%rsi, %rax
	cmpl	%edx, (%rax)
	je	.L807
.L91:
	movzbl	%dl, %eax
	leaq	(%r10,%rdi,2), %rdi
	movl	16(%rsp), %r12d
	movl	0(%rbp,%rax,4), %edx
	addl	$1, 68032(%r15,%rax,4)
	movswq	(%rdi), %rax
	movzwl	%dx, %r8d
	shrl	$16, %edx
	salq	%cl, %r8
	addl	%edx, %ecx
	leaq	1(%rbx), %rdx
	orq	%r8, %r11
	movq	%rdx, %r14
	movq	1(%rbx), %r8
	subq	%rsi, %r14
	movw	%r14w, (%rdi)
	movq	%r8, %rdi
	movswl	%ax, %r14d
	shrq	$8, %rdi
	imulq	%r9, %rdi
	shrq	$50, %rdi
	cmpl	%r12d, %r14d
	jle	.L93
	addq	%rsi, %rax
	cmpl	%r8d, (%rax)
	je	.L806
.L93:
	movzbl	%r8b, %eax
	leaq	(%r10,%rdi,2), %rdi
	movl	16(%rsp), %r12d
	movl	0(%rbp,%rax,4), %edx
	addl	$1, 68032(%r15,%rax,4)
	movswq	(%rdi), %rax
	movzwl	%dx, %r8d
	shrl	$16, %edx
	salq	%cl, %r8
	addl	%edx, %ecx
	leaq	2(%rbx), %rdx
	orq	%r8, %r11
	movq	%rdx, %r14
	movq	2(%rbx), %r8
	subq	%rsi, %r14
	movw	%r14w, (%rdi)
	movq	%r8, %rdi
	movswl	%ax, %r14d
	shrq	$8, %rdi
	imulq	%r9, %rdi
	shrq	$50, %rdi
	cmpl	%r12d, %r14d
	jle	.L94
	addq	%rsi, %rax
	cmpl	%r8d, (%rax)
	je	.L806
.L94:
	movzbl	%r8b, %eax
	leaq	(%r10,%rdi,2), %rdi
	movl	16(%rsp), %r12d
	movl	0(%rbp,%rax,4), %edx
	addl	$1, 68032(%r15,%rax,4)
	movswq	(%rdi), %rax
	movzwl	%dx, %r8d
	shrl	$16, %edx
	salq	%cl, %r8
	addl	%edx, %ecx
	leaq	3(%rbx), %rdx
	orq	%r8, %r11
	movq	%rdx, %r14
	movq	3(%rbx), %r8
	subq	%rsi, %r14
	movw	%r14w, (%rdi)
	movq	%r8, %rdi
	movswl	%ax, %r14d
	shrq	$8, %rdi
	imulq	%r9, %rdi
	shrq	$50, %rdi
	cmpl	%r12d, %r14d
	jle	.L95
	addq	%rsi, %rax
	cmpl	%r8d, (%rax)
	je	.L806
.L95:
	movzbl	%r8b, %edx
	addq	$4, %rbx
	movl	0(%rbp,%rdx,4), %eax
	addl	$1, 68032(%r15,%rdx,4)
	movzwl	%ax, %r8d
	shrl	$16, %eax
	addl	%ecx, %eax
	salq	%cl, %r8
	orl	%eax, 24(%rsp)
	orq	%r11, %r8
	movl	%eax, %ecx
	movl	%eax, %edx
	andl	$7, %eax
	andl	$56, %ecx
	movq	%r8, %r11
	shrl	$3, %edx
	movq	%r8, 0(%r13)
	shrq	%cl, %r11
	movl	%eax, %ecx
	movq	32(%rsp), %rax
	andl	$7, %edx
	addq	%rdx, %r13
	cmpq	%rax, %rbx
	jb	.L96
.L867:
	movq	8(%rsp), %rax
	cmpq	%rax, %rbx
	jnb	.L808
	movl	16(%rsp), %r8d
	movl	24(%rsp), %r12d
	movq	%r11, %r14
	.p2align 4,,10
	.p2align 3
.L97:
	movq	(%rbx), %rdx
	movl	%edi, %edi
	movq	%rbx, %r11
	leaq	(%r10,%rdi,2), %rdi
	subq	%rsi, %r11
	movswq	(%rdi), %rax
	movw	%r11w, (%rdi)
	movq	%rdx, %rdi
	shrq	$8, %rdi
	imulq	%r9, %rdi
	movswl	%ax, %r11d
	shrq	$50, %rdi
	cmpl	%r8d, %r11d
	jle	.L98
	addq	%rsi, %rax
	cmpl	%edx, (%rax)
	je	.L526
.L98:
	movzbl	%dl, %edx
	addq	$1, %rbx
	movl	0(%rbp,%rdx,4), %eax
	addl	$1, 68032(%r15,%rdx,4)
	movzwl	%ax, %r11d
	shrl	$16, %eax
	addl	%ecx, %eax
	salq	%cl, %r11
	movl	%eax, %edx
	movl	%eax, %ecx
	orq	%r14, %r11
	orl	%eax, %r12d
	andl	$56, %ecx
	shrl	$3, %edx
	movq	%r11, 0(%r13)
	andl	$7, %eax
	shrq	%cl, %r11
	andl	$7, %edx
	movl	%eax, %ecx
	addq	%rdx, %r13
	movq	%r11, %r14
	cmpq	%rbx, 8(%rsp)
	jne	.L97
.L809:
	orl	%ecx, %r12d
	movl	%ecx, %r14d
	movl	%r12d, %edx
.L89:
	movq	(%rsp), %rsi
	movq	%r11, 0(%r13)
	subq	%rbx, %rsi
	cmpq	$3, %rsi
	jbe	.L529
	subq	$4, %rsi
	movq	%rsi, %rdi
	movq	%rsi, 8(%rsp)
	shrq	$2, %rdi
	movq	%rdi, 16(%rsp)
	leaq	4(%rbx,%rdi,4), %r12
	movq	%r12, (%rsp)
	movl	%edx, %r12d
	.p2align 4,,10
	.p2align 3
.L117:
	movzbl	(%rbx), %edx
	movzbl	2(%rbx), %eax
	addq	$4, %rbx
	movl	0(%rbp,%rdx,4), %esi
	addl	$1, 68032(%r15,%rdx,4)
	movzbl	-3(%rbx), %edx
	movl	%esi, %ecx
	movzwl	%si, %esi
	movl	0(%rbp,%rdx,4), %edi
	shrl	$16, %ecx
	addl	$1, 68032(%r15,%rdx,4)
	movq	%rax, %rdx
	addl	%r14d, %ecx
	movl	0(%rbp,%rax,4), %eax
	addl	$1, 68032(%r15,%rdx,4)
	movl	%edi, %r10d
	movzbl	-1(%rbx), %edx
	movzwl	%di, %edi
	shrl	$16, %r10d
	salq	%cl, %rdi
	movl	%eax, %r9d
	movzwl	%ax, %eax
	addl	%ecx, %r10d
	movl	%r14d, %ecx
	movq	%rdx, %r8
	movl	0(%rbp,%rdx,4), %edx
	salq	%cl, %rsi
	movl	%r10d, %ecx
	shrl	$16, %r9d
	addl	$1, 68032(%r15,%r8,4)
	orq	%rdi, %rsi
	salq	%cl, %rax
	addl	%r10d, %r9d
	orq	%rsi, %rax
	movzwl	%dx, %esi
	shrl	$16, %edx
	movl	%r9d, %ecx
	addl	%r9d, %edx
	salq	%cl, %rsi
	movl	%edx, %ecx
	orq	%rsi, %rax
	orl	%edx, %r12d
	shrl	$3, %ecx
	orq	%r11, %rax
	andl	$7, %ecx
	movq	%rax, 0(%r13)
	addq	%rcx, %r13
	movl	%edx, %ecx
	andl	$7, %edx
	andl	$56, %ecx
	movl	%edx, %r14d
	shrq	%cl, %rax
	movq	%rax, %r11
	movq	(%rsp), %rax
	cmpq	%rax, %rbx
	jne	.L117
	movq	16(%rsp), %rdi
	movq	8(%rsp), %rsi
	movl	%r12d, %edx
	movq	%rax, %r12
	negq	%rdi
	leaq	(%rsi,%rdi,4), %rsi
.L116:
	testq	%rsi, %rsi
	je	.L118
	leaq	(%r12,%rsi), %rdi
	movl	%edx, %esi
.L119:
	movzbl	(%r12), %edx
	movl	%r14d, %ecx
	addq	$1, %r12
	movq	%rdx, %rax
	movl	0(%rbp,%rdx,4), %edx
	addl	$1, 68032(%r15,%rax,4)
	movzwl	%dx, %r8d
	shrl	$16, %edx
	addl	%edx, %r14d
	salq	%cl, %r8
	movl	%r14d, %eax
	movl	%r14d, %ecx
	orq	%r8, %r11
	orl	%r14d, %esi
	shrl	$3, %eax
	andl	$56, %ecx
	movq	%r11, 0(%r13)
	andl	$7, %r14d
	andl	$7, %eax
	shrq	%cl, %r11
	addq	%rax, %r13
	cmpq	%rdi, %r12
	jne	.L119
	movl	%esi, %edx
.L118:
	movl	3444(%r15), %eax
	movl	%r14d, %ecx
	salq	%cl, %rax
	movzbl	3956(%r15), %ecx
	orq	%r11, %rax
	movl	%edx, %r11d
	addl	%r14d, %ecx
	movq	%rax, 0(%r13)
	orl	%ecx, %r11d
	cmpl	$63, %r11d
	jbe	.L825
	xorl	%eax, %eax
	jmp	.L80
.L843:
	movl	$32768, %eax
	movl	$131072, %edx
	cmpq	%rax, %r9
	cmovbe	%r9, %rax
	movl	%eax, 32(%r15)
	leaq	74080(%r15), %rax
	movl	$-32768, %fs:mf_stale_cutoff@tpoff
	movq	%rbx, 8(%rsp)
	movl	$-32768, 72(%rsp)
.L449:
	movdqa	.LC4(%rip), %xmm0
	addq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L451:
	movaps	%xmm0, (%rax)
	addq	$64, %rax
	movaps	%xmm0, -48(%rax)
	movaps	%xmm0, -32(%rax)
	movaps	%xmm0, -16(%rax)
	cmpq	%rdx, %rax
	jne	.L451
	movl	$15, 36(%r15)
	jmp	.L450
	.p2align 4,,10
	.p2align 3
.L845:
	leal	-4(%rbp), %eax
	movl	%eax, 88(%rsp)
	cmpl	$31, %eax
	jbe	.L592
	movq	4(%rsi), %r8
	movq	4(%rbx), %r10
	cmpq	%r10, %r8
	jne	.L466
	movq	12(%rsi), %r8
	movq	12(%rbx), %r10
	cmpq	%r10, %r8
	je	.L467
	xorq	%r8, %r10
	movl	$12, %r9d
.L468:
	rep bsfq	%r10, %r10
	shrl	$3, %r10d
	leal	(%r9,%r10), %r8d
	movq	%r8, %r9
.L473:
	cmpw	%di, %cx
	jge	.L476
	movl	64(%rsp), %eax
	cmpl	%eax, %r9d
	jnb	.L476
	movq	8(%rsp), %rax
	leaq	(%rax,%rdi), %r11
	cmpl	(%r11), %r13d
	je	.L868
.L476:
	movl	%ebx, %r10d
	leal	-1(%r9), %r11d
	leaq	(%rbx,%r8), %rbp
	movl	%r9d, %r13d
	subl	%esi, %r10d
.L500:
	movl	$256, %ecx
	leal	-1(%r10), %esi
	leaq	deflate_offset_slot(%rip), %rax
	movl	4020(%r15,%r13,4), %edi
	subl	%r10d, %ecx
	shrl	$29, %ecx
	shrl	%cl, %esi
	movzbl	(%rax,%rsi), %esi
	movl	48(%rsp), %eax
	leal	(%rsi,%rcx,2), %esi
	movl	%eax, %ecx
	movzbl	3988(%r15,%rsi), %r8d
	salq	%cl, %rdi
	movq	24(%rsp), %rcx
	orq	%rcx, %rdi
	movzbl	5056(%r15,%r13), %ecx
	movl	3572(%r15,%rsi,4), %r13d
	addl	%eax, %ecx
	leaq	deflate_offset_slot_base(%rip), %rax
	subl	(%rax,%rsi,4), %r10d
	leaq	deflate_extra_offset_bits(%rip), %rax
	salq	%cl, %r13
	addl	%r8d, %ecx
	movzbl	(%rax,%rsi), %esi
	orq	%rdi, %r13
	movq	40(%rsp), %rax
	salq	%cl, %r10
	orq	%r13, %r10
	movq	(%rsp), %rdi
	subl	$1, %r8d
	orl	%r8d, 56(%rsp)
	addl	%ecx, %esi
	movq	%r10, (%rax)
	leal	4(%r9), %r8d
	movl	%esi, %ecx
	shrl	$3, %ecx
	addq	%rcx, %rax
	movl	%esi, %ecx
	andl	$7, %esi
	andl	$-8, %ecx
	movq	%rax, 40(%rsp)
	movq	8(%rsp), %rax
	shrq	%cl, %r10
	leaq	1(%rbx), %rcx
	movl	%esi, 48(%rsp)
	subq	%rcx, %rdi
	movq	%rcx, %rsi
	movq	%r10, 24(%rsp)
	subq	%rax, %rsi
	cmpq	%rdi, %r8
	jg	.L501
	leal	-1(%r11,%rsi), %eax
	cmpl	$32767, %eax
	jbe	.L503
	movq	%r14, %rax
	.p2align 4,,10
	.p2align 3
.L504:
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
	cmpq	%r12, %rax
	jne	.L504
	addq	$32768, 8(%rsp)
	subl	$32768, %esi
.L503:
	leal	1(%r11), %edi
	subl	%ecx, %esi
	addq	%rbx, %rdi
	.p2align 4,,10
	.p2align 3
.L505:
	movzwl	74080(%r15,%rdx,4), %eax
	leal	(%rsi,%rcx), %r8d
	addq	$1, %rcx
	movzwl	%r8w, %r8d
	sall	$16, %eax
	orl	%r8d, %eax
	movl	%eax, (%r14,%rdx,4)
	imull	$506832829, (%rcx), %edx
	shrl	$17, %edx
	cmpq	%rdi, %rcx
	jne	.L505
	movl	%edx, 32(%rsp)
	prefetcht0	(%r14,%rdx,4)
.L501:
	movq	(%rsp), %rax
	xorl	%r11d, %r11d
	cmpq	%rax, %rbp
	jne	.L511
.L804:
	movq	40(%rsp), %r13
	movl	48(%rsp), %r14d
.L457:
	movl	3444(%r15), %eax
	movl	%r14d, %ecx
	movq	24(%rsp), %rbx
	movzbl	3956(%r15), %edx
	salq	%cl, %rax
	movl	56(%rsp), %ecx
	orq	%rbx, %rax
	movq	%rax, 0(%r13)
	testl	%ecx, %ecx
	js	.L159
.L520:
	leal	(%rdx,%r14), %ecx
	movl	%ecx, %edx
	movl	%ecx, %esi
	shrl	$3, %edx
	addq	%r13, %rdx
	andl	$7, %esi
	je	.L516
	andl	$-8, %ecx
	shrq	%cl, %rax
	movb	%al, (%rdx)
	jmp	.L516
	.p2align 4,,10
	.p2align 3
.L856:
	leal	-4(%r11), %eax
	cmpl	$31, %eax
	jbe	.L570
	movq	4(%r9), %rsi
	movq	4(%rbx), %r10
	cmpq	%r10, %rsi
	jne	.L327
	movq	12(%r9), %rsi
	movq	12(%rbx), %r10
	cmpq	%r10, %rsi
	je	.L328
	xorq	%rsi, %r10
	movl	$12, %r8d
.L329:
	rep bsfq	%r10, %r10
	shrl	$3, %r10d
	leal	(%r8,%r10), %esi
	movq	%rsi, %r8
.L334:
	cmpw	%di, %cx
	jge	.L337
	movl	8(%rsp), %ecx
	cmpl	%ecx, %r8d
	jnb	.L337
	leaq	0(%r13,%rdi), %r10
	cmpl	(%r10), %ebp
	je	.L869
.L337:
	leal	-1(%r8), %eax
	movl	%ebx, %edi
	movl	%eax, 64(%rsp)
	leaq	(%rbx,%rsi), %rax
	subl	%r9d, %edi
	movq	%rax, 8(%rsp)
	movl	%r8d, %eax
	movq	%rax, %rsi
.L361:
	movl	$256, %ecx
	leal	-1(%rdi), %r9d
	leaq	deflate_offset_slot(%rip), %rax
	movl	40(%rsp), %r10d
	subl	%edi, %ecx
	movl	4020(%r15,%rsi,4), %r11d
	shrl	$29, %ecx
	shrl	%cl, %r9d
	movzbl	(%rax,%r9), %r9d
	movq	32(%rsp), %rax
	leal	(%r9,%rcx,2), %r9d
	movl	%r10d, %ecx
	movzbl	3988(%r15,%r9), %ebp
	salq	%cl, %r11
	movzbl	5056(%r15,%rsi), %ecx
	orq	%r11, %rax
	movq	%rsi, %r11
	leaq	(%r15,%r9,4), %rsi
	addl	%r10d, %ecx
	movl	3572(%rsi), %r10d
	salq	%cl, %r10
	addl	%ebp, %ecx
	subl	$1, %ebp
	orl	%ebp, 48(%rsp)
	orq	%rax, %r10
	leaq	deflate_offset_slot_base(%rip), %rax
	subl	(%rax,%r9,4), %edi
	leaq	deflate_extra_offset_bits(%rip), %rax
	movzbl	(%rax,%r9), %r9d
	salq	%cl, %rdi
	leaq	deflate_length_slot(%rip), %rax
	orq	%r10, %rdi
	addl	%ecx, %r9d
	movq	%rdi, (%r14)
	movl	%r9d, %ecx
	shrl	$3, %ecx
	addq	%rcx, %r14
	movl	%r9d, %ecx
	andl	$7, %r9d
	andl	$-8, %ecx
	movl	%r9d, 40(%rsp)
	leal	4(%r8), %r9d
	movq	(%rsp), %r8
	shrq	%cl, %rdi
	movzbl	(%rax,%r11), %ecx
	movq	%rdi, 32(%rsp)
	addl	$1, 69060(%r15,%rcx,4)
	leaq	1(%rbx), %rcx
	movq	%rcx, %rdi
	subq	%rcx, %r8
	addl	$1, 69184(%rsi)
	subq	%r13, %rdi
	cmpq	%r8, %r9
	jg	.L362
	movl	64(%rsp), %eax
	leal	-1(%rax,%rdi), %eax
	cmpl	$32767, %eax
	jbe	.L364
	leaq	205152(%r15), %r8
	movq	%r12, %rax
	.p2align 4,,10
	.p2align 3
.L365:
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
	cmpq	%r8, %rax
	jne	.L365
	addq	$32768, %r13
	subl	$32768, %edi
.L364:
	movl	64(%rsp), %eax
	subl	%ecx, %edi
	leal	1(%rax), %r8d
	addq	%rbx, %r8
	.p2align 4,,10
	.p2align 3
.L366:
	movzwl	74080(%r15,%rdx,4), %eax
	leal	(%rdi,%rcx), %esi
	addq	$1, %rcx
	movzwl	%si, %esi
	sall	$16, %eax
	orl	%esi, %eax
	movl	%eax, (%r12,%rdx,4)
	imull	$506832829, (%rcx), %edx
	shrl	$17, %edx
	cmpq	%r8, %rcx
	jne	.L366
	movl	%edx, 24(%rsp)
	prefetcht0	(%r12,%rdx,4)
.L362:
	xorl	%r10d, %r10d
	jmp	.L367
	.p2align 4,,10
	.p2align 3
.L466:
	xorq	%r8, %r10
	movl	$4, %r9d
	jmp	.L468
	.p2align 4,,10
	.p2align 3
.L848:
	movl	%eax, %ebp
	cmpl	$4, %eax
	jbe	.L870
	movl	16(%rsp), %edi
	cmpl	%eax, %edi
	cmovbe	%edi, %eax
	movl	%eax, 64(%rsp)
	jmp	.L453
	.p2align 4,,10
	.p2align 3
.L846:
	leal	-4(%rbp), %ecx
	cmpl	$31, %ecx
	jbe	.L596
	movq	4(%rdi), %rcx
	movq	4(%rbx), %rsi
	cmpq	%rsi, %rcx
	jne	.L489
	movq	12(%rdi), %rcx
	movq	12(%rbx), %rsi
	cmpq	%rsi, %rcx
	je	.L490
	xorq	%rsi, %rcx
	movl	$12, %r9d
.L491:
	rep bsfq	%rcx, %rcx
	movl	%ebx, %r10d
	shrl	$3, %ecx
	subl	%edi, %r10d
	leal	(%r9,%rcx), %r13d
	movq	%r13, %r9
	leal	-1(%r13), %r11d
	leaq	(%rbx,%r13), %rbp
	jmp	.L500
	.p2align 4,,10
	.p2align 3
.L847:
	movq	(%rsp), %rax
	cmpq	%rax, %rbp
	je	.L871
	movq	(%rsp), %rcx
	movq	%rbp, %rdx
	jmp	.L507
	.p2align 4,,10
	.p2align 3
.L510:
	addq	$1, %rdx
	cmpq	%rcx, %rdx
	je	.L509
.L507:
	movzbl	(%rdx), %eax
	leaq	deflate_token_char(%rip), %rdi
	testb	$3, (%rdi,%rax)
	jne	.L510
.L509:
	subq	%rbp, %rdx
	movq	%rdx, %r8
	cmpq	$15, %rdx
	jle	.L511
	leaq	-4(%rdx), %rdx
	movq	%rbp, 88(%rsp)
	movl	48(%rsp), %ecx
	movq	%rbp, %rsi
	movq	%rdx, %r10
	andq	$-4, %rdx
	movl	%r11d, 96(%rsp)
	leaq	5(%rbx,%rdx), %rax
	shrq	$2, %r10
	movq	%r8, 104(%rsp)
	movq	40(%rsp), %rbx
	movq	%rax, 64(%rsp)
	movq	%r10, 112(%rsp)
	movq	%rdx, 120(%rsp)
	movq	%r14, 128(%rsp)
	movq	%r12, 136(%rsp)
	.p2align 4,,10
	.p2align 3
.L512:
	movzbl	(%rsi), %r11d
	movzbl	1(%rsi), %r8d
	addq	$4, %rsi
	movzbl	-2(%rsi), %r13d
	movzbl	-1(%rsi), %ebp
	movzbl	3700(%r15,%r11), %r10d
	movl	2420(%r15,%r11,4), %r11d
	movzbl	3700(%r15,%r8), %edi
	movl	2420(%r15,%r8,4), %r8d
	movzbl	3700(%r15,%r13), %eax
	leal	(%r10,%rcx), %r14d
	salq	%cl, %r11
	movzbl	3700(%r15,%rbp), %r9d
	movl	%r14d, %ecx
	leal	(%r14,%rdi), %r12d
	subl	$1, %r10d
	subl	$1, %edi
	salq	%cl, %r8
	movl	%r12d, %ecx
	leal	(%r12,%rax), %edx
	orl	%r10d, %edi
	orq	%r11, %r8
	movl	2420(%r15,%r13,4), %r11d
	subl	$1, %eax
	orl	%edi, %eax
	salq	%cl, %r11
	movl	%edx, %ecx
	addl	%r9d, %edx
	subl	$1, %r9d
	orq	%r8, %r11
	movl	2420(%r15,%rbp,4), %r8d
	orl	%r9d, %eax
	orl	%eax, 56(%rsp)
	movl	%edx, %eax
	salq	%cl, %r8
	movq	24(%rsp), %rcx
	shrl	$3, %eax
	orq	%r8, %r11
	orq	%rcx, %r11
	movl	%edx, %ecx
	andl	$7, %edx
	movq	%r11, (%rbx)
	andl	$-8, %ecx
	addq	%rax, %rbx
	movq	64(%rsp), %rax
	shrq	%cl, %r11
	movl	%edx, %ecx
	movq	%r11, 24(%rsp)
	cmpq	%rax, %rsi
	jne	.L512
	movq	104(%rsp), %r8
	movq	88(%rsp), %rbp
	movl	%edx, 48(%rsp)
	movq	112(%rsp), %r10
	movq	120(%rsp), %r9
	movq	%rbx, 40(%rsp)
	movq	%r8, %rdx
	movl	96(%rsp), %r11d
	movq	128(%rsp), %r14
	leaq	4(%rbp,%r10,4), %r8
	subq	%r9, %rdx
	movq	136(%rsp), %r12
	movq	%r8, %rbp
	subq	$4, %rdx
	je	.L513
	addq	%rdx, %rbp
	movl	56(%rsp), %r9d
	movq	24(%rsp), %rdx
	movq	%rbx, %rdi
.L514:
	movzbl	(%r8), %eax
	addq	$1, %r8
	movzbl	3700(%r15,%rax), %esi
	movl	2420(%r15,%rax,4), %eax
	salq	%cl, %rax
	orq	%rax, %rdx
	leal	(%rsi,%rcx), %eax
	subl	$1, %esi
	movl	%eax, %ecx
	movq	%rdx, (%rdi)
	orl	%esi, %r9d
	shrl	$3, %ecx
	addq	%rcx, %rdi
	movl	%eax, %ecx
	andl	$7, %eax
	andl	$-8, %ecx
	shrq	%cl, %rdx
	movl	%eax, %ecx
	cmpq	%rbp, %r8
	jne	.L514
	movl	%r9d, 56(%rsp)
	movq	%rdx, 24(%rsp)
	movq	%rdi, 40(%rsp)
	movl	%eax, 48(%rsp)
.L513:
	movq	(%rsp), %rdx
	subq	%rbp, %rdx
	cmpq	$3, %rdx
	jle	.L506
	imull	$506832829, 0(%rbp), %eax
	shrl	$17, %eax
	movl	%eax, 32(%rsp)
	jmp	.L506
	.p2align 4,,10
	.p2align 3
.L859:
	movl	%eax, %r11d
	cmpl	$4, %eax
	jbe	.L872
	movl	16(%rsp), %edi
	cmpl	%eax, %edi
	cmovbe	%edi, %eax
	movl	%eax, 8(%rsp)
	jmp	.L314
	.p2align 4,,10
	.p2align 3
.L327:
	xorq	%rsi, %r10
	movl	$4, %r8d
	jmp	.L329
	.p2align 4,,10
	.p2align 3
.L857:
	leal	-4(%r11), %esi
	cmpl	$31, %esi
	jbe	.L574
	movq	4(%rcx), %rdi
	movq	4(%rbx), %rsi
	cmpq	%rsi, %rdi
	jne	.L350
	movq	12(%rcx), %rdi
	movq	12(%rbx), %rsi
	cmpq	%rsi, %rdi
	jne	.L873
	movq	20(%rcx), %rsi
	movq	20(%rbx), %rdi
	cmpq	%rdi, %rsi
	je	.L353
	xorq	%rsi, %rdi
	movl	$20, %r8d
	jmp	.L352
	.p2align 4,,10
	.p2align 3
.L868:
	movl	-3(%rbx,%r8), %eax
	cmpl	%eax, -3(%r11,%r8)
	jne	.L476
	cmpl	$31, 88(%rsp)
	jbe	.L594
	movq	4(%r11), %rdi
	movq	4(%rbx), %rcx
	cmpq	%rcx, %rdi
	jne	.L478
	movq	12(%r11), %rdi
	movq	12(%rbx), %rcx
	cmpq	%rcx, %rdi
	je	.L479
	xorq	%rdi, %rcx
	movl	$12, %r13d
.L480:
	rep bsfq	%rcx, %rcx
	shrl	$3, %ecx
	addl	%ecx, %r13d
.L484:
	cmpl	%r13d, %r9d
	jnb	.L476
	movl	%r13d, %eax
	movl	%ebx, %r10d
	movl	%r13d, %r9d
	subl	%r11d, %r10d
	leaq	(%rbx,%rax), %rbp
	leal	-1(%r13), %r11d
	movq	%rax, %r13
	jmp	.L500
	.p2align 4,,10
	.p2align 3
.L467:
	movq	20(%rsi), %r8
	movq	20(%rbx), %r10
	cmpq	%r10, %r8
	je	.L469
	xorq	%r8, %r10
	movl	$20, %r9d
	jmp	.L468
	.p2align 4,,10
	.p2align 3
.L489:
	xorq	%rsi, %rcx
	movl	$4, %r9d
	jmp	.L491
	.p2align 4,,10
	.p2align 3
.L798:
	movq	%r14, %r13
	movl	40(%rsp), %r14d
.L318:
	movl	3444(%r15), %eax
	movl	%r14d, %ecx
	movq	32(%rsp), %rbx
	salq	%cl, %rax
.L832:
	orq	%rbx, %rax
	movzbl	3956(%r15), %edx
	movq	%rax, 0(%r13)
	movl	48(%rsp), %esi
	testl	%esi, %esi
	jns	.L520
	xorl	%eax, %eax
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L858:
	movq	(%rsp), %rdi
	cmpq	%rdi, 8(%rsp)
	je	.L834
	movq	8(%rsp), %rdx
	movq	(%rsp), %rcx
	jmp	.L368
	.p2align 4,,10
	.p2align 3
.L371:
	addq	$1, %rdx
	cmpq	%rcx, %rdx
	je	.L370
.L368:
	movzbl	(%rdx), %eax
	leaq	deflate_token_char(%rip), %rdi
	testb	$3, (%rdi,%rax)
	jne	.L371
.L370:
	movq	8(%rsp), %rdi
	movq	%rdx, %rax
	subq	%rdi, %rax
	cmpq	$15, %rax
	jle	.L372
	leaq	-4(%rax), %rdx
	movq	%rax, 64(%rsp)
	movq	8(%rsp), %r9
	movq	%rdx, %r11
	andq	$-4, %rdx
	movl	%r10d, 72(%rsp)
	movl	40(%rsp), %ecx
	shrq	$2, %r11
	movq	%rdx, 104(%rsp)
	leaq	5(%rbx,%rdx), %rdi
	movl	48(%rsp), %ebp
	movq	%r11, 96(%rsp)
	movq	32(%rsp), %rbx
	movq	%r13, 88(%rsp)
	movq	%rdi, %r13
	.p2align 4,,10
	.p2align 3
.L373:
	movzbl	(%r9), %edx
	addq	$4, %r9
	movzbl	3700(%r15,%rdx), %r10d
	leaq	(%r15,%rdx,4), %rdx
	addl	$1, 68032(%rdx)
	movl	2420(%rdx), %esi
	movzbl	-3(%r9), %edx
	salq	%cl, %rsi
	addl	%r10d, %ecx
	subl	$1, %r10d
	movzbl	3700(%r15,%rdx), %edi
	leaq	(%r15,%rdx,4), %rdx
	movl	2420(%rdx), %r8d
	addl	$1, 68032(%rdx)
	movzbl	-2(%r9), %edx
	salq	%cl, %r8
	addl	%edi, %ecx
	subl	$1, %edi
	orq	%rsi, %r8
	orl	%r10d, %edi
	movzbl	3700(%r15,%rdx), %esi
	leaq	(%r15,%rdx,4), %rdx
	movl	2420(%rdx), %eax
	addl	$1, 68032(%rdx)
	salq	%cl, %rax
	addl	%esi, %ecx
	subl	$1, %esi
	orq	%r8, %rax
	movzbl	-1(%r9), %r8d
	orl	%edi, %esi
	movq	%r8, %rdx
	movzbl	3700(%r15,%r8), %r8d
	leaq	(%r15,%rdx,4), %r11
	movl	2420(%r11), %edx
	addl	$1, 68032(%r11)
	salq	%cl, %rdx
	orq	%rax, %rdx
	leal	(%rcx,%r8), %eax
	subl	$1, %r8d
	movl	%eax, %ecx
	orq	%rbx, %rdx
	orl	%r8d, %esi
	shrl	$3, %ecx
	movq	%rdx, (%r14)
	movq	%rdx, %rbx
	orl	%esi, %ebp
	addq	%rcx, %r14
	movl	%eax, %ecx
	andl	$7, %eax
	andl	$-8, %ecx
	shrq	%cl, %rbx
	movl	%eax, %ecx
	cmpq	%r13, %r9
	jne	.L373
	movq	96(%rsp), %r11
	movq	104(%rsp), %r8
	movl	%eax, 40(%rsp)
	movq	64(%rsp), %rax
	movl	72(%rsp), %r10d
	movq	%rbx, 32(%rsp)
	movl	%ebp, 48(%rsp)
	movq	88(%rsp), %r13
	movq	%rax, %rdi
	movq	8(%rsp), %rax
	subq	%r8, %rdi
	leaq	4(%rax,%r11,4), %r11
	movq	%r11, 8(%rsp)
	movq	%r11, %r9
	subq	$4, %rdi
	je	.L374
	addq	%rdi, %r9
	movl	%ecx, %eax
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	movq	%r9, 8(%rsp)
.L375:
	movzbl	(%r11), %ecx
	addq	$1, %r11
	movzbl	3700(%r15,%rcx), %esi
	leaq	(%r15,%rcx,4), %rdi
	movl	%eax, %ecx
	movl	2420(%rdi), %ebx
	addl	$1, 68032(%rdi)
	addl	%esi, %eax
	subl	$1, %esi
	salq	%cl, %rbx
	movl	%eax, %ecx
	orl	%esi, %r8d
	orq	%rbx, %rdx
	shrl	$3, %ecx
	movq	%rdx, (%r14)
	addq	%rcx, %r14
	movl	%eax, %ecx
	andl	$7, %eax
	andl	$-8, %ecx
	shrq	%cl, %rdx
	cmpq	%r9, %r11
	jne	.L375
	movl	%eax, 40(%rsp)
	movq	%rdx, 32(%rsp)
	movl	%r8d, 48(%rsp)
.L374:
	movq	(%rsp), %rdx
	movq	8(%rsp), %rax
	subq	%rax, %rdx
	cmpq	$3, %rdx
	jle	.L367
	imull	$506832829, (%rax), %eax
	shrl	$17, %eax
	movl	%eax, 24(%rsp)
	jmp	.L367
	.p2align 4,,10
	.p2align 3
.L842:
	call	memcpy@PLT
	movq	8(%rsp), %rdx
	movl	32(%r15), %esi
	movq	32(%rsp), %r9
	andb	5316(%r15,%rdx), %r12b
	movl	$32768, %edx
	movq	%rdx, %rcx
	movzbl	%r12b, %eax
	subq	%rsi, %rcx
	movq	%rax, 24(%rsp)
	movq	%rsi, %rax
	movl	$0, 1124(%r15)
	cmpq	%rcx, %r9
	jnb	.L874
	movl	36(%r15), %ecx
	movq	%rbx, %r11
	leal	-1(%rsi), %edi
	addl	%r9d, %eax
	subq	%rsi, %r11
	movl	%edi, 64(%rsp)
	movq	%r11, 8(%rsp)
	movl	%eax, 32(%r15)
	movl	%edi, %fs:mf_stale_cutoff@tpoff
	cmpl	$12, %ecx
	jbe	.L875
.L381:
	movq	(%rsp), %rax
	cmpq	%rax, %rbx
	je	.L452
	xorl	%r9d, %r9d
	movl	%r14d, 32(%rsp)
	xorl	%r11d, %r11d
	leaq	74080(%r15), %rax
	movl	$0, 48(%rsp)
	movl	%r9d, %r8d
	movq	%rax, %r14
	movdqa	.LC5(%rip), %xmm0
	movq	%r13, 40(%rsp)
	leaq	205152(%r15), %r12
	jmp	.L446
	.p2align 4,,10
	.p2align 3
.L390:
	movl	64(%rsp), %edi
	addw	$-32768, %cx
	movl	(%rbx), %r13d
	movzwl	74080(%r15,%r8,4), %r9d
	cmpl	%eax, %edi
	cmovge	%edi, %ecx
	imull	$506832829, 1(%rbx), %eax
	shrl	$19, %eax
	movl	%eax, %edx
	prefetcht0	(%r14,%rdx,4)
	movw	%si, 74080(%r15,%r8,4)
	cmpw	%cx, %r9w
	jle	.L394
	movq	8(%rsp), %rdi
	movswq	%r9w, %rsi
	addq	%rdi, %rsi
	movswq	74082(%r15,%r8,4), %rdi
	movw	%r9w, 74082(%r15,%r8,4)
	cmpl	(%rsi), %r13d
	je	.L876
	cmpw	%di, %cx
	jge	.L394
	movq	8(%rsp), %rsi
	addq	%rsi, %rdi
	cmpl	(%rdi), %r13d
	je	.L877
.L394:
	movzbl	(%rbx), %edx
	movl	32(%rsp), %edi
	addl	$1, %r11d
	leaq	1(%rbx), %rbp
	movzbl	3700(%r15,%rdx), %esi
	movl	%edi, %ecx
	movl	2420(%r15,%rdx,4), %edx
	salq	%cl, %rdx
	movq	24(%rsp), %rcx
	addl	%esi, %edi
	subl	$1, %esi
	orl	%esi, 48(%rsp)
	movq	40(%rsp), %rsi
	orq	%rcx, %rdx
	movl	%edi, %ecx
	shrl	$3, %ecx
	movq	%rdx, (%rsi)
	addq	%rcx, %rsi
	movl	%edi, %ecx
	andl	$7, %edi
	andl	$-8, %ecx
	movq	%rsi, 40(%rsp)
	shrq	%cl, %rdx
	movl	%edi, 32(%rsp)
	movq	%rdx, 24(%rsp)
	testb	$15, %r11b
	je	.L878
.L437:
	movq	(%rsp), %rbx
	cmpq	%rbx, %rbp
	je	.L801
.L442:
	movl	%eax, %r8d
	movq	%rbp, %rbx
.L446:
	movq	(%rsp), %rax
	movl	16(%rsp), %edi
	movl	$258, %ebp
	subq	%rbx, %rax
	movl	%edi, 56(%rsp)
	cmpq	$257, %rax
	jbe	.L879
.L384:
	movq	8(%rsp), %rax
	movq	%rbx, %rsi
	subq	%rax, %rsi
	movl	%esi, %ecx
	leal	-32767(%rsi), %eax
	cmpl	$32768, %esi
	jne	.L390
	movq	%r14, %rax
	.p2align 4,,10
	.p2align 3
.L391:
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
	cmpq	%r12, %rax
	jne	.L391
	addq	$32768, 8(%rsp)
	xorl	%esi, %esi
	movl	$-32767, %eax
	xorl	%ecx, %ecx
	jmp	.L390
	.p2align 4,,10
	.p2align 3
.L876:
	leal	-4(%rbp), %r11d
	movl	%r11d, 72(%rsp)
	cmpl	$31, %r11d
	jbe	.L581
	movq	4(%rsi), %r8
	movq	4(%rbx), %r10
	cmpq	%r10, %r8
	jne	.L397
	movq	12(%rsi), %r8
	movq	12(%rbx), %r10
	cmpq	%r10, %r8
	je	.L398
	xorq	%r8, %r10
	movl	$12, %r9d
.L399:
	rep bsfq	%r10, %r10
	shrl	$3, %r10d
	leal	(%r9,%r10), %r8d
	movq	%r8, %r9
.L404:
	cmpw	%di, %cx
	jge	.L407
	movl	56(%rsp), %ecx
	cmpl	%ecx, %r9d
	jnb	.L407
	movq	8(%rsp), %rcx
	leaq	(%rcx,%rdi), %r11
	cmpl	(%r11), %r13d
	je	.L880
.L407:
	movl	%ebx, %r10d
	leal	-1(%r9), %r11d
	leaq	(%rbx,%r8), %rbp
	movl	%r9d, %edi
	subl	%esi, %r10d
.L431:
	movl	$256, %ecx
	leal	-1(%r10), %esi
	leaq	deflate_offset_slot(%rip), %r8
	subl	%r10d, %ecx
	shrl	$29, %ecx
	shrl	%cl, %esi
	movzbl	(%r8,%rsi), %esi
	movl	4020(%r15,%rdi,4), %r8d
	leal	(%rsi,%rcx,2), %esi
	movzbl	32(%rsp), %ecx
	movzbl	3988(%r15,%rsi), %r13d
	salq	%cl, %r8
	movq	24(%rsp), %rcx
	orq	%rcx, %r8
	movzbl	5056(%r15,%rdi), %ecx
	movl	32(%rsp), %edi
	addl	%edi, %ecx
	movl	3572(%r15,%rsi,4), %edi
	salq	%cl, %rdi
	addl	%r13d, %ecx
	subl	$1, %r13d
	orl	%r13d, 48(%rsp)
	orq	%r8, %rdi
	leaq	deflate_offset_slot_base(%rip), %r8
	subl	(%r8,%rsi,4), %r10d
	leal	4(%r9), %r8d
	salq	%cl, %r10
	orq	%rdi, %r10
	leaq	deflate_extra_offset_bits(%rip), %rdi
	movzbl	(%rdi,%rsi), %esi
	movq	40(%rsp), %rdi
	addl	%ecx, %esi
	movq	%r10, (%rdi)
	movl	%esi, %ecx
	shrl	$3, %ecx
	addq	%rcx, %rdi
	movl	%esi, %ecx
	andl	$7, %esi
	andl	$-8, %ecx
	movq	%rdi, 40(%rsp)
	movq	8(%rsp), %rdi
	shrq	%cl, %r10
	leaq	1(%rbx), %rcx
	movl	%esi, 32(%rsp)
	movq	%rcx, %rsi
	movq	%r10, 24(%rsp)
	subq	%rdi, %rsi
	movq	(%rsp), %rdi
	subq	%rcx, %rdi
	cmpq	%rdi, %r8
	jg	.L432
	leal	-1(%r11,%rsi), %eax
	cmpl	$32767, %eax
	jbe	.L434
	movq	%r14, %rax
	.p2align 4,,10
	.p2align 3
.L435:
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
	cmpq	%r12, %rax
	jne	.L435
	addq	$32768, 8(%rsp)
	subl	$32768, %esi
.L434:
	leal	1(%r11), %edi
	subl	%ecx, %esi
	addq	%rbx, %rdi
	.p2align 4,,10
	.p2align 3
.L436:
	movzwl	74080(%r15,%rdx,4), %eax
	leal	(%rsi,%rcx), %r8d
	addq	$1, %rcx
	movzwl	%r8w, %r8d
	sall	$16, %eax
	orl	%r8d, %eax
	movl	%eax, (%r14,%rdx,4)
	imull	$506832829, (%rcx), %edx
	shrl	$19, %edx
	cmpq	%rdi, %rcx
	jne	.L436
	movl	%edx, %edx
	movq	%rdx, %rax
	prefetcht0	(%r14,%rdx,4)
.L432:
	xorl	%r11d, %r11d
	jmp	.L437
	.p2align 4,,10
	.p2align 3
.L397:
	xorq	%r8, %r10
	movl	$4, %r9d
	jmp	.L399
	.p2align 4,,10
	.p2align 3
.L879:
	movl	%eax, %ebp
	cmpl	$4, %eax
	jbe	.L881
	movl	16(%rsp), %edi
	cmpl	%eax, %edi
	cmovbe	%edi, %eax
	movl	%eax, 56(%rsp)
	jmp	.L384
	.p2align 4,,10
	.p2align 3
.L877:
	leal	-4(%rbp), %ecx
	cmpl	$31, %ecx
	jbe	.L585
	movq	4(%rdi), %rcx
	movq	4(%rbx), %rsi
	cmpq	%rsi, %rcx
	jne	.L420
	movq	12(%rdi), %rcx
	movq	12(%rbx), %rsi
	cmpq	%rsi, %rcx
	jne	.L882
	movq	20(%rdi), %rcx
	movq	20(%rbx), %rsi
	cmpq	%rsi, %rcx
	je	.L423
	xorq	%rsi, %rcx
	movl	$20, %r9d
	jmp	.L422
	.p2align 4,,10
	.p2align 3
.L878:
	movq	(%rsp), %rdi
	cmpq	%rdi, %rbp
	je	.L883
	movq	(%rsp), %rsi
	movq	%rbp, %rdx
	jmp	.L438
	.p2align 4,,10
	.p2align 3
.L441:
	addq	$1, %rdx
	cmpq	%rsi, %rdx
	je	.L440
.L438:
	movzbl	(%rdx), %ecx
	leaq	deflate_token_char(%rip), %rdi
	testb	$3, (%rdi,%rcx)
	jne	.L441
.L440:
	subq	%rbp, %rdx
	movq	%rdx, %r8
	cmpq	$15, %rdx
	jle	.L442
	leaq	-4(%rdx), %rdx
	movl	%r11d, 72(%rsp)
	movl	32(%rsp), %ecx
	movq	%rbp, %rsi
	movq	%rdx, %r10
	andq	$-4, %rdx
	movq	%rbp, 88(%rsp)
	shrq	$2, %r10
	leaq	5(%rbx,%rdx), %rbx
	movl	%eax, 96(%rsp)
	movq	%r8, 104(%rsp)
	movq	%r10, 112(%rsp)
	movq	%rdx, 120(%rsp)
	movq	%r14, 128(%rsp)
	movq	%r12, 136(%rsp)
	movq	%rbx, 56(%rsp)
	movq	40(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L443:
	movzbl	(%rsi), %r11d
	movzbl	1(%rsi), %r8d
	addq	$4, %rsi
	movzbl	-2(%rsi), %r13d
	movzbl	-1(%rsi), %ebp
	movzbl	3700(%r15,%r11), %r10d
	movl	2420(%r15,%r11,4), %r11d
	movzbl	3700(%r15,%r8), %edi
	movl	2420(%r15,%r8,4), %r8d
	movzbl	3700(%r15,%r13), %eax
	leal	(%r10,%rcx), %r14d
	salq	%cl, %r11
	movzbl	3700(%r15,%rbp), %r9d
	movl	%r14d, %ecx
	leal	(%r14,%rdi), %r12d
	subl	$1, %r10d
	subl	$1, %edi
	salq	%cl, %r8
	movl	%r12d, %ecx
	leal	(%r12,%rax), %edx
	orl	%r10d, %edi
	orq	%r11, %r8
	movl	2420(%r15,%r13,4), %r11d
	subl	$1, %eax
	orl	%edi, %eax
	salq	%cl, %r11
	movl	%edx, %ecx
	addl	%r9d, %edx
	subl	$1, %r9d
	orq	%r8, %r11
	movl	2420(%r15,%rbp,4), %r8d
	orl	%r9d, %eax
	orl	%eax, 48(%rsp)
	movl	%edx, %eax
	salq	%cl, %r8
	movq	24(%rsp), %rcx
	shrl	$3, %eax
	orq	%r8, %r11
	orq	%rcx, %r11
	movl	%edx, %ecx
	andl	$7, %edx
	movq	%r11, (%rbx)
	andl	$-8, %ecx
	addq	%rax, %rbx
	movq	56(%rsp), %rax
	shrq	%cl, %r11
	movl	%edx, %ecx
	movq	%r11, 24(%rsp)
	cmpq	%rax, %rsi
	jne	.L443
	movq	104(%rsp), %r8
	movq	120(%rsp), %r9
	movl	%edx, 32(%rsp)
	movq	88(%rsp), %rbp
	movq	112(%rsp), %r10
	movq	%rbx, 40(%rsp)
	subq	%r9, %r8
	movl	72(%rsp), %r11d
	movl	96(%rsp), %eax
	movq	%r8, %rdx
	leaq	4(%rbp,%r10,4), %r8
	movq	128(%rsp), %r14
	movq	136(%rsp), %r12
	movq	%r8, %rbp
	subq	$4, %rdx
	je	.L444
	movq	24(%rsp), %rsi
	movl	48(%rsp), %r10d
	addq	%rdx, %rbp
	movq	%rbx, %r9
	movl	%ecx, %edx
.L445:
	movzbl	(%r8), %ecx
	addq	$1, %r8
	movzbl	3700(%r15,%rcx), %edi
	movl	2420(%r15,%rcx,4), %ebx
	movl	%edx, %ecx
	addl	%edi, %edx
	salq	%cl, %rbx
	subl	$1, %edi
	movl	%edx, %ecx
	orq	%rbx, %rsi
	orl	%edi, %r10d
	shrl	$3, %ecx
	movq	%rsi, (%r9)
	addq	%rcx, %r9
	movl	%edx, %ecx
	andl	$7, %edx
	andl	$-8, %ecx
	shrq	%cl, %rsi
	cmpq	%rbp, %r8
	jne	.L445
	movq	%rsi, 24(%rsp)
	movq	%r9, 40(%rsp)
	movl	%edx, 32(%rsp)
	movl	%r10d, 48(%rsp)
.L444:
	movq	(%rsp), %rdx
	subq	%rbp, %rdx
	cmpq	$3, %rdx
	jle	.L437
	imull	$506832829, 0(%rbp), %eax
	shrl	$19, %eax
	jmp	.L437
.L801:
	movq	40(%rsp), %r13
	movl	32(%rsp), %r14d
.L388:
	movl	3444(%r15), %eax
	movl	%r14d, %ecx
	movq	24(%rsp), %rbx
	salq	%cl, %rax
	jmp	.L832
.L328:
	movq	20(%r9), %rsi
	movq	20(%rbx), %r10
	cmpq	%r10, %rsi
	jne	.L884
	movq	28(%r9), %rsi
	movq	28(%rbx), %r10
	cmpq	%r10, %rsi
	je	.L571
	xorq	%rsi, %r10
	movl	$28, %r8d
	jmp	.L329
.L869:
	movl	-3(%rbx,%rsi), %edi
	cmpl	%edi, -3(%r10,%rsi)
	jne	.L337
	cmpl	$31, %eax
	jbe	.L572
	movq	4(%r10), %rdi
	movq	4(%rbx), %rcx
	cmpq	%rcx, %rdi
	jne	.L339
	movq	12(%r10), %rdi
	movq	12(%rbx), %rcx
	cmpq	%rcx, %rdi
	je	.L340
	xorq	%rdi, %rcx
	movl	$12, %ebp
.L341:
	rep bsfq	%rcx, %rcx
	shrl	$3, %ecx
	addl	%ecx, %ebp
.L345:
	cmpl	%ebp, %r8d
	jnb	.L337
	leal	-1(%rbp), %eax
	movl	%ebx, %edi
	movl	%ebp, %r8d
	movl	%eax, 64(%rsp)
	movl	%ebp, %eax
	subl	%r10d, %edi
	leaq	(%rbx,%rax), %rsi
	movq	%rsi, 8(%rsp)
	movq	%rax, %rsi
	jmp	.L361
.L398:
	movq	20(%rsi), %r8
	movq	20(%rbx), %r10
	cmpq	%r10, %r8
	jne	.L885
	movq	28(%rsi), %r8
	movq	28(%rbx), %r10
	cmpq	%r10, %r8
	je	.L582
	xorq	%r8, %r10
	movl	$28, %r9d
	jmp	.L399
.L880:
	movl	-3(%rbx,%r8), %edi
	cmpl	%edi, -3(%r11,%r8)
	jne	.L407
	cmpl	$31, 72(%rsp)
	jbe	.L583
	movq	4(%r11), %rdi
	movq	4(%rbx), %rcx
	cmpq	%rcx, %rdi
	jne	.L409
	movq	12(%r11), %rdi
	movq	12(%rbx), %rcx
	cmpq	%rcx, %rdi
	je	.L410
	xorq	%rdi, %rcx
	movl	$12, %r13d
.L411:
	rep bsfq	%rcx, %rcx
	shrl	$3, %ecx
	addl	%ecx, %r13d
.L415:
	cmpl	%r13d, %r9d
	jnb	.L407
	movl	%ebx, %r10d
	movl	%r13d, %edi
	movl	%r13d, %r9d
	subl	%r11d, %r10d
	leaq	(%rbx,%rdi), %rbp
	leal	-1(%r13), %r11d
	jmp	.L431
.L469:
	movq	28(%rsi), %r8
	movq	28(%rbx), %r10
	cmpq	%r10, %r8
	je	.L593
	xorq	%r8, %r10
	movl	$28, %r9d
	jmp	.L468
.L530:
	movq	%rbx, 8(%rsp)
	movq	%rbx, 32(%rsp)
	jmp	.L123
.L548:
	movq	%rbx, 8(%rsp)
	movq	%rbx, 16(%rsp)
	jmp	.L199
.L420:
	xorq	%rsi, %rcx
	movl	$4, %r9d
.L422:
	rep bsfq	%rcx, %rcx
	movl	%ebx, %r10d
	shrl	$3, %ecx
	subl	%edi, %r10d
	addl	%ecx, %r9d
	movl	%r9d, %edi
	leal	-1(%r9), %r11d
	leaq	(%rbx,%rdi), %rbp
	jmp	.L431
.L592:
	movl	$4, %r8d
	jmp	.L470
	.p2align 4,,10
	.p2align 3
.L471:
	movq	(%rsi,%r8), %r10
	addq	$8, %r8
	movq	-8(%rbx,%r8), %r11
	cmpq	%r11, %r10
	jne	.L886
.L470:
	leal	8(%r8), %eax
	movl	%r8d, %r9d
	cmpl	%eax, %ebp
	jnb	.L471
	cmpl	%ebp, %r8d
	jnb	.L473
	movl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L474:
	movzbl	(%rbx,%r8), %eax
	movl	%r8d, %r9d
	cmpb	%al, (%rsi,%r8)
	jne	.L473
	addq	$1, %r8
	cmpl	%ebp, %r8d
	jb	.L474
	addl	$1, %r9d
	jmp	.L473
.L350:
	xorq	%rsi, %rdi
	movl	$4, %r8d
.L352:
	xorl	%esi, %esi
	rep bsfq	%rdi, %rsi
	movl	%ebx, %edi
	shrl	$3, %esi
	subl	%ecx, %edi
	addl	%esi, %r8d
	leal	-1(%r8), %eax
	movl	%eax, 64(%rsp)
	movl	%r8d, %eax
	movq	%rax, %rsi
	addq	%rbx, %rax
	movq	%rax, 8(%rsp)
	jmp	.L361
.L490:
	movq	20(%rdi), %rcx
	movq	20(%rbx), %rsi
	cmpq	%rsi, %rcx
	jne	.L887
	movq	28(%rdi), %rcx
	movq	28(%rbx), %rsi
	cmpq	%rsi, %rcx
	je	.L597
	xorq	%rsi, %rcx
	movl	$28, %r9d
	jmp	.L491
.L535:
	movl	%r12d, 24(%rsp)
	movq	%r14, %rax
.L811:
	movl	%ecx, 56(%rsp)
	movq	%rbx, %rsi
.L131:
	movq	(%rsp), %r8
	movl	$258, %r9d
	subq	%rsi, %r8
	cmpq	%r9, %r8
	cmova	%r9, %r8
	movl	%r8d, %r14d
	subl	$4, %r8d
	cmpl	$31, %r8d
	jbe	.L536
	movq	4(%rdx), %r8
	movq	4(%rsi), %r9
	cmpq	%r9, %r8
	jne	.L139
	movq	12(%rdx), %r8
	movq	12(%rsi), %r9
	cmpq	%r9, %r8
	jne	.L888
	movq	20(%rdx), %r8
	movq	20(%rsi), %r9
	cmpq	%r9, %r8
	je	.L142
	xorq	%r9, %r8
	movl	$20, %r9d
	jmp	.L141
.L553:
	movq	%rax, %rdx
	movq	%r9, %rax
.L818:
	movl	%ecx, 32(%rsp)
	movq	%rbx, %rsi
.L207:
	movq	(%rsp), %r8
	movl	$258, %r9d
	subq	%rsi, %r8
	cmpq	%r9, %r8
	cmova	%r9, %r8
	movl	%r8d, 40(%rsp)
	subl	$4, %r8d
	cmpl	$31, %r8d
	jbe	.L554
	movq	4(%rdx), %r8
	movq	4(%rsi), %r9
	cmpq	%r9, %r8
	jne	.L215
	movq	12(%rdx), %r8
	movq	12(%rsi), %r9
	cmpq	%r9, %r8
	jne	.L889
	movq	20(%rdx), %r8
	movq	20(%rsi), %r9
	cmpq	%r9, %r8
	je	.L218
	xorq	%r9, %r8
	movl	$20, %r14d
	jmp	.L217
.L853:
	call	memcpy@PLT
	movq	8(%rsp), %rdx
	movl	32(%r15), %esi
	movq	24(%rsp), %r9
	andb	5316(%r15,%rdx), %r12b
	movl	$32768, %edx
	movq	%rdx, %rcx
	movzbl	%r12b, %eax
	subq	%rsi, %rcx
	movq	%rax, 32(%rsp)
	movq	%rsi, %rax
	movl	$0, 1124(%r15)
	cmpq	%rcx, %r9
	jnb	.L890
	movl	36(%r15), %ecx
	movq	%rbx, %r11
	leal	-1(%rsi), %edi
	addl	%r9d, %eax
	subq	%rsi, %r11
	movl	%edi, 56(%rsp)
	movq	%r11, 8(%rsp)
	movl	%eax, 32(%r15)
	movl	%edi, %fs:mf_stale_cutoff@tpoff
	cmpl	$12, %ecx
	jbe	.L891
.L240:
	movq	(%rsp), %rax
	cmpq	%rax, %rbx
	je	.L313
	movl	%r14d, 40(%rsp)
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	leaq	74080(%r15), %r12
	movl	$0, 48(%rsp)
	movdqa	.LC5(%rip), %xmm0
	movq	%r13, %r14
	jmp	.L307
	.p2align 4,,10
	.p2align 3
.L249:
	movl	56(%rsp), %esi
	addw	$-32768, %cx
	movl	(%rbx), %ebp
	cmpl	%eax, %esi
	cmovge	%esi, %ecx
	imull	$506832829, 1(%rbx), %eax
	movl	%r9d, %esi
	movzwl	74080(%r15,%rsi,4), %r8d
	shrl	$19, %eax
	movl	%eax, %edx
	movl	%eax, 24(%rsp)
	prefetcht0	(%r12,%rdx,4)
	movw	%di, 74080(%r15,%rsi,4)
	cmpw	%cx, %r8w
	jle	.L253
	movq	8(%rsp), %rax
	movswq	%r8w, %r9
	movswq	74082(%r15,%rsi,4), %rdi
	movw	%r8w, 74082(%r15,%rsi,4)
	addq	%rax, %r9
	cmpl	(%r9), %ebp
	je	.L892
	cmpw	%di, %cx
	jge	.L253
	movq	8(%rsp), %rax
	leaq	(%rax,%rdi), %rcx
	cmpl	(%rcx), %ebp
	je	.L893
.L253:
	movzbl	(%rbx), %ecx
	movl	40(%rsp), %eax
	addl	$1, %r10d
	leaq	1(%rbx), %rsi
	movzbl	3700(%r15,%rcx), %edi
	leaq	(%r15,%rcx,4), %r8
	movl	%eax, %ecx
	movl	2420(%r8), %edx
	addl	$1, 68032(%r8)
	addl	%edi, %eax
	subl	$1, %edi
	orl	%edi, 48(%rsp)
	salq	%cl, %rdx
	movq	32(%rsp), %rcx
	movl	%eax, %r9d
	andl	$7, %r9d
	orq	%rcx, %rdx
	movl	%eax, %ecx
	movl	%r9d, 40(%rsp)
	shrl	$3, %ecx
	movq	%rdx, (%r14)
	addq	%rcx, %r14
	movl	%eax, %ecx
	andl	$-8, %ecx
	shrq	%cl, %rdx
	movq	%rdx, 32(%rsp)
	testb	$15, %r10b
	je	.L894
.L298:
	movq	(%rsp), %rax
	cmpq	%rax, %rsi
	je	.L798
.L303:
	movl	24(%rsp), %r9d
	movq	%rsi, %rbx
.L307:
	movq	(%rsp), %rax
	movl	16(%rsp), %r13d
	movl	$258, %r11d
	subq	%rbx, %rax
	cmpq	$257, %rax
	jbe	.L895
.L243:
	movq	8(%rsp), %rax
	movq	%rbx, %rdi
	subq	%rax, %rdi
	movl	%edi, %ecx
	leal	-32767(%rdi), %eax
	cmpl	$32768, %edi
	jne	.L249
	leaq	205152(%r15), %rdx
	movq	%r12, %rax
	.p2align 4,,10
	.p2align 3
.L250:
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
	cmpq	%rdx, %rax
	jne	.L250
	addq	$32768, 8(%rsp)
	xorl	%edi, %edi
	movl	$-32767, %eax
	xorl	%ecx, %ecx
	jmp	.L249
.L886:
	xorq	%r11, %r10
	jmp	.L468
.L838:
	movl	$32768, %edx
	movq	%rbx, %rdi
	movl	$131072, %ecx
	cmpq	%rdx, %r9
	cmovbe	%r9, %rdx
	movl	%edx, 32(%r15)
	movq	%r11, %rdx
	movl	$-32768, %fs:mf_stale_cutoff@tpoff
	movl	$-32768, 16(%rsp)
.L125:
	movdqa	.LC4(%rip), %xmm0
	addq	%rdx, %rcx
	.p2align 4,,10
	.p2align 3
.L127:
	movaps	%xmm0, (%rdx)
	addq	$64, %rdx
	movaps	%xmm0, -48(%rdx)
	movaps	%xmm0, -32(%rdx)
	movaps	%xmm0, -16(%rdx)
	cmpq	%rcx, %rdx
	jne	.L127
	movl	$15, 36(%r15)
	jmp	.L126
.L850:
	movl	$32768, %edx
	movq	%rbx, %rdi
	movl	$131072, %ecx
	cmpq	%rdx, %r9
	cmovbe	%r9, %rdx
	movl	%edx, 32(%r15)
	movq	%r10, %rdx
	movl	$-32768, %fs:mf_stale_cutoff@tpoff
	movl	$-32768, 32(%rsp)
.L201:
	movdqa	.LC4(%rip), %xmm0
	addq	%rdx, %rcx
	.p2align 4,,10
	.p2align 3
.L203:
	movaps	%xmm0, (%rdx)
	addq	$64, %rdx
	movaps	%xmm0, -48(%rdx)
	movaps	%xmm0, -32(%rdx)
	movaps	%xmm0, -16(%rdx)
	cmpq	%rcx, %rdx
	jne	.L203
	movl	$15, 36(%r15)
	jmp	.L202
.L844:
	leaq	74080(%r15), %rax
	testl	%ecx, %ecx
	je	.L590
	movl	$4, %edx
	salq	%cl, %rdx
	movq	%rdx, %rcx
	movl	$131072, %edx
	subq	%rcx, %rdx
	addq	%rcx, %rax
	jmp	.L449
.L139:
	xorq	%r9, %r8
	movl	$4, %r9d
.L141:
	rep bsfq	%r8, %r8
	shrl	$3, %r8d
	addl	%r8d, %r9d
	movl	%r9d, %r9d
	leaq	(%rsi,%r9), %rbx
.L146:
	movl	%ecx, %r8d
	movl	24(%rsp), %r12d
	movq	%rax, 0(%r13)
	shrl	$3, %r8d
	andl	$7, %r8d
	orl	%ecx, %r12d
	andl	$56, %ecx
	leaq	0(%r13,%r8), %r14
	movq	%rsi, %r8
	shrq	%cl, %rax
	movl	%r12d, 24(%rsp)
	subq	%rdx, %r8
	movl	$256, %edx
	movq	%r14, 40(%rsp)
	movq	%rax, %r14
	subl	%r8d, %edx
	leal	-1(%r8), %eax
	movl	%edx, %ecx
	leaq	deflate_offset_slot(%rip), %rdx
	shrl	$29, %ecx
	shrl	%cl, %eax
	movzbl	(%rdx,%rax), %eax
	movl	56(%rsp), %edx
	leal	(%rax,%rcx,2), %r13d
	movl	4020(%r15,%r9,4), %eax
	movl	%edx, %ecx
	movzbl	3988(%r15,%r13), %r12d
	salq	%cl, %rax
	movzbl	5056(%r15,%r9), %ecx
	orq	%r14, %rax
	addl	%edx, %ecx
	leaq	(%r15,%r13,4), %rdx
	movl	3572(%rdx), %r14d
	salq	%cl, %r14
	addl	%r12d, %ecx
	subl	$1, %r12d
	orq	%rax, %r14
	movl	24(%rsp), %eax
	orl	%eax, %r12d
	movl	%r8d, %eax
	leaq	deflate_extra_offset_bits(%rip), %r8
	movl	%r12d, 24(%rsp)
	leaq	deflate_offset_slot_base(%rip), %r12
	subl	(%r12,%r13,4), %eax
	salq	%cl, %rax
	orq	%r14, %rax
	movzbl	(%r8,%r13), %r14d
	movl	24(%rsp), %r8d
	addl	%ecx, %r14d
	movq	40(%rsp), %rcx
	movl	%r14d, %r13d
	orl	%r14d, %r8d
	shrl	$3, %r13d
	movq	%rax, (%rcx)
	andl	$7, %r13d
	movl	%r8d, 24(%rsp)
	addq	%rcx, %r13
	movl	%r14d, %ecx
	andl	$56, %ecx
	shrq	%cl, %rax
	movl	%r14d, %ecx
	leaq	deflate_length_slot(%rip), %r14
	movzbl	(%r14,%r9), %r8d
	andl	$7, %ecx
	addl	$1, 69060(%r15,%r8,4)
	leaq	3(%rsi), %r8
	addl	$1, 69184(%rdx)
	movq	48(%rsp), %rdx
	cmpq	%r8, %rdx
	cmovbe	%rdx, %r8
	leaq	-1(%rbx), %rdx
	cmpq	%r8, %rbx
	cmovbe	%rbx, %r8
	cmpq	%rdx, 8(%rsp)
	jb	.L149
	cmpq	%r8, %rdx
	jnb	.L896
.L149:
	addq	$1, %rsi
	movl	24(%rsp), %r12d
	movabsq	$-5654854502012944384, %r14
	cmpq	%r8, %rsi
	jnb	.L153
	.p2align 4,,10
	.p2align 3
.L150:
	movq	(%rsi), %rdx
	movq	%rsi, %r9
	addq	$1, %rsi
	subq	%rdi, %r9
	imulq	%r14, %rdx
	shrq	$48, %rdx
	movw	%r9w, (%r11,%rdx,2)
	cmpq	%rsi, %r8
	jne	.L150
	movl	%r12d, 24(%rsp)
.L153:
	movq	8(%rsp), %rsi
	cmpq	%rsi, %rbx
	jnb	.L897
	movq	(%rbx), %r8
	imulq	%r10, %r8
	shrq	$48, %r8
	jmp	.L129
.L215:
	xorq	%r9, %r8
	movl	$4, %r14d
.L217:
	rep bsfq	%r8, %r8
	shrl	$3, %r8d
	leal	(%r14,%r8), %r9d
	leaq	(%rsi,%r9), %rbx
.L222:
	orl	%ecx, %r12d
	movl	%ecx, %r14d
	movq	%rsi, %r8
	andl	$56, %ecx
	movq	%rax, 0(%r13)
	shrq	%cl, %rax
	subq	%rdx, %r8
	movl	$256, %ecx
	subl	%r8d, %ecx
	shrl	$3, %r14d
	leal	-1(%r8), %edx
	movl	%r12d, 40(%rsp)
	shrl	$29, %ecx
	andl	$7, %r14d
	addq	%r13, %r14
	shrl	%cl, %edx
	leaq	deflate_offset_slot(%rip), %r13
	movzbl	0(%r13,%rdx), %edx
	leal	(%rdx,%rcx,2), %r13d
	movq	24(%rsp), %rcx
	movzbl	3988(%rcx,%r13), %edx
	movl	4020(%rcx,%r9,4), %r12d
	movzbl	32(%rsp), %ecx
	salq	%cl, %r12
	orq	%rax, %r12
	movq	24(%rsp), %rax
	movzbl	5056(%rax,%r9), %ecx
	movl	32(%rsp), %r9d
	movl	3572(%rax,%r13,4), %eax
	addl	%r9d, %ecx
	movl	40(%rsp), %r9d
	salq	%cl, %rax
	addl	%edx, %ecx
	subl	$1, %edx
	orl	%r9d, %edx
	leaq	deflate_offset_slot_base(%rip), %r9
	orq	%r12, %rax
	subl	(%r9,%r13,4), %r8d
	salq	%cl, %r8
	orq	%rax, %r8
	leaq	deflate_extra_offset_bits(%rip), %rax
	movzbl	(%rax,%r13), %r9d
	movq	%r8, %rax
	movq	%r8, (%r14)
	leaq	3(%rsi), %r8
	addl	%ecx, %r9d
	orl	%r9d, %edx
	movl	%r9d, %r13d
	movl	%r9d, %ecx
	andl	$56, %ecx
	shrl	$3, %r13d
	movl	%edx, %r12d
	movq	48(%rsp), %rdx
	andl	$7, %r13d
	shrq	%cl, %rax
	movl	%r9d, %ecx
	addq	%r14, %r13
	andl	$7, %ecx
	cmpq	%r8, %rdx
	cmovbe	%rdx, %r8
	leaq	-1(%rbx), %rdx
	cmpq	%r8, %rbx
	cmovbe	%rbx, %r8
	cmpq	%rdx, 8(%rsp)
	jb	.L225
	cmpq	%r8, %rdx
	jnb	.L898
.L225:
	movabsq	$-5654854502012944384, %r14
	addq	$1, %rsi
	cmpq	%r8, %rsi
	jnb	.L229
	.p2align 4,,10
	.p2align 3
.L226:
	movq	(%rsi), %rdx
	movq	%rsi, %r9
	addq	$1, %rsi
	subq	%rdi, %r9
	imulq	%r14, %rdx
	shrq	$48, %rdx
	movw	%r9w, (%r10,%rdx,2)
	cmpq	%rsi, %r8
	jne	.L226
.L229:
	movq	8(%rsp), %rsi
	cmpq	%rsi, %rbx
	jnb	.L820
	movq	(%rbx), %r8
	imulq	%r11, %r8
	shrq	$48, %r8
	jmp	.L205
.L885:
	xorq	%r8, %r10
	movl	$20, %r9d
	jmp	.L399
.L884:
	xorq	%rsi, %r10
	movl	$20, %r8d
	jmp	.L329
.L593:
	movl	$36, %r8d
	jmp	.L470
.L860:
	movq	(%rsp), %rax
	leaq	-9(%rax), %rdi
	subq	$12, %rax
	cmpq	$12, %r9
	cmovbe	%rbx, %rax
	movq	%rdi, 8(%rsp)
	movq	%rax, 16(%rsp)
	jmp	.L162
.L864:
	movq	%rsi, %rax
	leaq	-9(%rsi), %rdi
	subq	$12, %rax
	cmpq	$12, %r9
	movq	%rdi, 8(%rsp)
	cmovbe	%rbx, %rax
	movq	%rax, 32(%rsp)
	jmp	.L84
.L882:
	xorq	%rsi, %rcx
	movl	$12, %r9d
	jmp	.L422
.L873:
	xorq	%rsi, %rdi
	movl	$12, %r8d
	jmp	.L352
.L887:
	xorq	%rsi, %rcx
	movl	$20, %r9d
	jmp	.L491
.L896:
	movabsq	$-5654854502012944384, %r9
	imulq	-1(%rbx), %r9
	subq	%rdi, %rdx
	shrq	$48, %r9
	movw	%dx, (%r11,%r9,2)
	jmp	.L149
.L898:
	movabsq	$-5654854502012944384, %r9
	imulq	-1(%rbx), %r9
	subq	%rdi, %rdx
	shrq	$48, %r9
	movw	%dx, (%r10,%r9,2)
	jmp	.L225
.L478:
	xorq	%rdi, %rcx
	movl	$4, %r13d
	jmp	.L480
.L888:
	xorq	%r9, %r8
	movl	$12, %r9d
	jmp	.L141
.L889:
	xorq	%r9, %r8
	movl	$12, %r14d
	jmp	.L217
.L890:
	movl	$32768, %eax
	cmpq	%rax, %r9
	cmovbe	%r9, %rax
	movl	%eax, 32(%r15)
	leaq	74080(%r15), %rax
	movl	$-32768, %fs:mf_stale_cutoff@tpoff
	movq	%rbx, 8(%rsp)
	movl	$-32768, 56(%rsp)
.L239:
	movdqa	.LC4(%rip), %xmm0
	addq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L241:
	movaps	%xmm0, (%rax)
	addq	$64, %rax
	movaps	%xmm0, -48(%rax)
	movaps	%xmm0, -32(%rax)
	movaps	%xmm0, -16(%rax)
	cmpq	%rdx, %rax
	jne	.L241
	movl	$13, 36(%r15)
	jmp	.L240
	.p2align 4,,10
	.p2align 3
.L892:
	leal	-4(%r11), %eax
	movl	%eax, 64(%rsp)
	cmpl	$31, %eax
	jbe	.L559
	movq	4(%r9), %rsi
	movq	4(%rbx), %r10
	cmpq	%r10, %rsi
	jne	.L256
	movq	12(%r9), %rsi
	movq	12(%rbx), %r10
	cmpq	%r10, %rsi
	je	.L257
	xorq	%rsi, %r10
	movl	$12, %r8d
.L258:
	rep bsfq	%r10, %r10
	shrl	$3, %r10d
	leal	(%r8,%r10), %esi
	movq	%rsi, %r8
.L263:
	cmpw	%di, %cx
	jge	.L269
	cmpl	%r13d, %r8d
	jnb	.L269
	movq	8(%rsp), %rax
	leaq	(%rax,%rdi), %r13
	cmpl	0(%r13), %ebp
	je	.L899
.L269:
	leal	-1(%r8), %eax
	movl	%ebx, %edi
	addq	%rbx, %rsi
	movl	%r8d, %r13d
	movl	%eax, 64(%rsp)
	subl	%r9d, %edi
.L268:
	movl	$256, %ecx
	leal	-1(%rdi), %r9d
	leaq	deflate_offset_slot(%rip), %rax
	movl	40(%rsp), %r10d
	subl	%edi, %ecx
	movl	4020(%r15,%r13,4), %r11d
	shrl	$29, %ecx
	shrl	%cl, %r9d
	movzbl	(%rax,%r9), %r9d
	movq	32(%rsp), %rax
	leal	(%r9,%rcx,2), %r9d
	movl	%r10d, %ecx
	movzbl	3988(%r15,%r9), %ebp
	salq	%cl, %r11
	movzbl	5056(%r15,%r13), %ecx
	orq	%r11, %rax
	leaq	(%r15,%r9,4), %r11
	addl	%r10d, %ecx
	movl	3572(%r11), %r10d
	salq	%cl, %r10
	addl	%ebp, %ecx
	subl	$1, %ebp
	orl	%ebp, 48(%rsp)
	orq	%rax, %r10
	leaq	deflate_offset_slot_base(%rip), %rax
	subl	(%rax,%r9,4), %edi
	leaq	deflate_extra_offset_bits(%rip), %rax
	movzbl	(%rax,%r9), %r9d
	salq	%cl, %rdi
	leaq	deflate_length_slot(%rip), %rax
	orq	%r10, %rdi
	addl	%ecx, %r9d
	movq	%rdi, (%r14)
	movl	%r9d, %ecx
	shrl	$3, %ecx
	addq	%rcx, %r14
	movl	%r9d, %ecx
	andl	$7, %r9d
	andl	$-8, %ecx
	movl	%r9d, 40(%rsp)
	leal	4(%r8), %r9d
	movq	(%rsp), %r8
	shrq	%cl, %rdi
	movzbl	(%rax,%r13), %ecx
	movq	8(%rsp), %rax
	movq	%rdi, 32(%rsp)
	addl	$1, 69060(%r15,%rcx,4)
	leaq	1(%rbx), %rcx
	movq	%rcx, %rdi
	subq	%rcx, %r8
	addl	$1, 69184(%r11)
	subq	%rax, %rdi
	cmpq	%r8, %r9
	jg	.L293
	movl	64(%rsp), %eax
	leal	-1(%rax,%rdi), %eax
	cmpl	$32767, %eax
	jbe	.L295
	leaq	205152(%r15), %r8
	movq	%r12, %rax
	.p2align 4,,10
	.p2align 3
.L296:
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
	cmpq	%r8, %rax
	jne	.L296
	addq	$32768, 8(%rsp)
	subl	$32768, %edi
.L295:
	movl	64(%rsp), %eax
	subl	%ecx, %edi
	leal	1(%rax), %r8d
	addq	%rbx, %r8
	.p2align 4,,10
	.p2align 3
.L297:
	movzwl	74080(%r15,%rdx,4), %eax
	leal	(%rdi,%rcx), %r9d
	addq	$1, %rcx
	movzwl	%r9w, %r9d
	sall	$16, %eax
	orl	%r9d, %eax
	movl	%eax, (%r12,%rdx,4)
	imull	$506832829, (%rcx), %edx
	shrl	$19, %edx
	cmpq	%r8, %rcx
	jne	.L297
	movl	%edx, 24(%rsp)
	prefetcht0	(%r12,%rdx,4)
.L293:
	xorl	%r10d, %r10d
	jmp	.L298
.L256:
	xorq	%rsi, %r10
	movl	$4, %r8d
	jmp	.L258
.L895:
	movl	%eax, %r11d
	cmpl	$4, %eax
	jbe	.L900
	movl	16(%rsp), %edi
	cmpl	%eax, %edi
	cmovbe	%edi, %eax
	movl	%eax, %r13d
	jmp	.L243
.L893:
	leal	-4(%r11), %esi
	cmpl	$31, %esi
	jbe	.L563
	movq	4(%rcx), %rdi
	movq	4(%rbx), %rsi
	cmpq	%rsi, %rdi
	jne	.L282
	movq	12(%rcx), %rsi
	movq	12(%rbx), %rdi
	cmpq	%rdi, %rsi
	je	.L283
	xorq	%rdi, %rsi
	movl	$12, %r8d
.L284:
	rep bsfq	%rsi, %rsi
	movl	%ebx, %edi
	shrl	$3, %esi
	subl	%ecx, %edi
	leal	(%r8,%rsi), %r13d
	leal	-1(%r13), %eax
	movq	%r13, %r8
	leaq	(%rbx,%r13), %rsi
	movl	%eax, 64(%rsp)
	jmp	.L268
.L894:
	movq	(%rsp), %rax
	cmpq	%rax, %rsi
	je	.L834
	movq	(%rsp), %rcx
	movq	%rsi, %rdx
	jmp	.L299
	.p2align 4,,10
	.p2align 3
.L302:
	addq	$1, %rdx
	cmpq	%rcx, %rdx
	je	.L301
.L299:
	movzbl	(%rdx), %eax
	leaq	deflate_token_char(%rip), %rdi
	testb	$3, (%rdi,%rax)
	jne	.L302
.L301:
	movq	%rdx, %rdi
	subq	%rsi, %rdi
	cmpq	$15, %rdi
	jle	.L303
	leaq	-4(%rdi), %rdx
	movq	%rsi, 64(%rsp)
	movl	40(%rsp), %ecx
	movq	%rsi, %r9
	movq	%rdx, %r11
	andq	$-4, %rdx
	movq	%rdi, 72(%rsp)
	movq	32(%rsp), %rbp
	shrq	$2, %r11
	movl	%r10d, 88(%rsp)
	leaq	5(%rbx,%rdx), %r13
	movl	48(%rsp), %ebx
	movq	%r11, 96(%rsp)
	movq	%rdx, 104(%rsp)
	.p2align 4,,10
	.p2align 3
.L304:
	movzbl	(%r9), %edx
	addq	$4, %r9
	movzbl	3700(%r15,%rdx), %r10d
	leaq	(%r15,%rdx,4), %rsi
	addl	$1, 68032(%rsi)
	movl	2420(%rsi), %edx
	movzbl	-3(%r9), %esi
	salq	%cl, %rdx
	addl	%r10d, %ecx
	subl	$1, %r10d
	movzbl	3700(%r15,%rsi), %edi
	leaq	(%r15,%rsi,4), %rax
	movl	2420(%rax), %r8d
	addl	$1, 68032(%rax)
	salq	%cl, %r8
	addl	%edi, %ecx
	subl	$1, %edi
	orq	%rdx, %r8
	movzbl	-2(%r9), %edx
	orl	%r10d, %edi
	movzbl	3700(%r15,%rdx), %esi
	leaq	(%r15,%rdx,4), %rdx
	movl	2420(%rdx), %eax
	addl	$1, 68032(%rdx)
	salq	%cl, %rax
	addl	%esi, %ecx
	subl	$1, %esi
	orq	%r8, %rax
	movzbl	-1(%r9), %r8d
	orl	%edi, %esi
	movq	%r8, %rdx
	movzbl	3700(%r15,%r8), %r8d
	leaq	(%r15,%rdx,4), %r11
	movl	2420(%r11), %edx
	addl	$1, 68032(%r11)
	salq	%cl, %rdx
	orq	%rax, %rdx
	leal	(%rcx,%r8), %eax
	subl	$1, %r8d
	movl	%eax, %ecx
	orq	%rbp, %rdx
	orl	%r8d, %esi
	shrl	$3, %ecx
	movq	%rdx, (%r14)
	orl	%esi, %ebx
	addq	%rcx, %r14
	movl	%eax, %ecx
	andl	$7, %eax
	andl	$-8, %ecx
	shrq	%cl, %rdx
	movl	%eax, %ecx
	movq	%rdx, %rbp
	cmpq	%r13, %r9
	jne	.L304
	movq	104(%rsp), %r8
	movq	72(%rsp), %rdi
	movq	%rdx, 32(%rsp)
	movq	64(%rsp), %rsi
	movq	96(%rsp), %r11
	movl	%ebx, 48(%rsp)
	subq	%r8, %rdi
	movl	%eax, 40(%rsp)
	movl	88(%rsp), %r10d
	leaq	4(%rsi,%r11,4), %r8
	movq	%rdi, %rdx
	movq	%r8, %rsi
	subq	$4, %rdx
	je	.L305
	addq	%rdx, %rsi
	movl	%ebx, %r9d
	movq	%rbp, %rdx
.L306:
	movzbl	(%r8), %ecx
	addq	$1, %r8
	movzbl	3700(%r15,%rcx), %r11d
	leaq	(%r15,%rcx,4), %rbx
	movl	%eax, %ecx
	movl	2420(%rbx), %edi
	addl	$1, 68032(%rbx)
	addl	%r11d, %eax
	salq	%cl, %rdi
	leal	-1(%r11), %ecx
	orl	%ecx, %r9d
	movl	%eax, %ecx
	orq	%rdi, %rdx
	shrl	$3, %ecx
	movq	%rdx, (%r14)
	addq	%rcx, %r14
	movl	%eax, %ecx
	andl	$7, %eax
	andl	$-8, %ecx
	shrq	%cl, %rdx
	cmpq	%rsi, %r8
	jne	.L306
	movl	%r9d, 48(%rsp)
	movq	%rdx, 32(%rsp)
	movl	%eax, 40(%rsp)
.L305:
	movq	(%rsp), %rdx
	subq	%rsi, %rdx
	cmpq	$3, %rdx
	jle	.L298
	imull	$506832829, (%rsi), %eax
	shrl	$19, %eax
	movl	%eax, 24(%rsp)
	jmp	.L298
.L810:
	movl	%ecx, %ebx
	andl	$7, %ebx
	movl	%ebx, 56(%rsp)
	jmp	.L131
.L817:
	movl	%ecx, %ebx
	andl	$7, %ebx
	movl	%ebx, 32(%rsp)
	jmp	.L207
.L257:
	movq	20(%r9), %rsi
	movq	20(%rbx), %r10
	cmpq	%r10, %rsi
	je	.L259
	xorq	%rsi, %r10
	movl	$20, %r8d
	jmp	.L258
.L899:
	movl	-3(%rbx,%rsi), %eax
	cmpl	%eax, -3(%r13,%rsi)
	jne	.L269
	cmpl	$31, 64(%rsp)
	jbe	.L561
	movq	4(%r13), %rcx
	movq	4(%rbx), %rdi
	cmpq	%rdi, %rcx
	jne	.L271
	movq	12(%r13), %rcx
	movq	12(%rbx), %rdi
	cmpq	%rdi, %rcx
	je	.L272
	xorq	%rdi, %rcx
	movl	$12, %ebp
.L273:
	rep bsfq	%rcx, %rcx
	shrl	$3, %ecx
	addl	%ecx, %ebp
.L277:
	cmpl	%ebp, %r8d
	jnb	.L269
	movl	%ebx, %edi
	leal	-1(%rbp), %eax
	movl	%ebp, %r8d
	subl	%r13d, %edi
	movl	%ebp, %r13d
	movl	%eax, 64(%rsp)
	leaq	(%rbx,%r13), %rsi
	jmp	.L268
.L851:
	testl	%ecx, %ecx
	je	.L550
	movl	$4, %edx
	salq	%cl, %rdx
	movl	$131072, %ecx
	subq	%rdx, %rcx
	addq	%r10, %rdx
	jmp	.L201
.L839:
	testl	%ecx, %ecx
	je	.L532
	movl	$4, %edx
	salq	%cl, %rdx
	movl	$131072, %ecx
	subq	%rdx, %rcx
	addq	%r11, %rdx
	jmp	.L125
.L282:
	xorq	%rdi, %rsi
	movl	$4, %r8d
	jmp	.L284
.L581:
	movl	$4, %r8d
	jmp	.L401
	.p2align 4,,10
	.p2align 3
.L402:
	movq	(%rsi,%r8), %r10
	addq	$8, %r8
	movq	-8(%rbx,%r8), %r11
	cmpq	%r11, %r10
	jne	.L901
.L401:
	leal	8(%r8), %r10d
	movl	%r8d, %r9d
	cmpl	%r10d, %ebp
	jnb	.L402
	cmpl	%ebp, %r8d
	jnb	.L404
	movl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L405:
	movzbl	(%rbx,%r8), %r11d
	movl	%r8d, %r9d
	cmpb	%r11b, (%rsi,%r8)
	jne	.L404
	addq	$1, %r8
	cmpl	%ebp, %r8d
	jb	.L405
	addl	$1, %r9d
	jmp	.L404
.L570:
	movl	$4, %esi
.L326:
	movq	%r14, 64(%rsp)
	jmp	.L331
	.p2align 4,,10
	.p2align 3
.L332:
	movq	(%r9,%rsi), %r14
	addq	$8, %rsi
	movq	-8(%rbx,%rsi), %r10
	cmpq	%r10, %r14
	jne	.L902
.L331:
	leal	8(%rsi), %r10d
	movl	%esi, %r8d
	cmpl	%r10d, %r11d
	jnb	.L332
	movq	64(%rsp), %r14
	cmpl	%r11d, %esi
	jnb	.L334
	movl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L335:
	movzbl	(%rbx,%rsi), %r10d
	movl	%esi, %r8d
	cmpb	%r10b, (%r9,%rsi)
	jne	.L334
	addq	$1, %rsi
	cmpl	%r11d, %esi
	jb	.L335
	addl	$1, %r8d
	jmp	.L334
.L874:
	movl	$32768, %eax
	cmpq	%rax, %r9
	cmovbe	%r9, %rax
	movl	%eax, 32(%r15)
	leaq	74080(%r15), %rax
	movl	$-32768, %fs:mf_stale_cutoff@tpoff
	movq	%rbx, 8(%rsp)
	movl	$-32768, 64(%rsp)
.L380:
	movdqa	.LC4(%rip), %xmm0
	addq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L382:
	movaps	%xmm0, (%rax)
	addq	$64, %rax
	movaps	%xmm0, -48(%rax)
	movaps	%xmm0, -32(%rax)
	movaps	%xmm0, -16(%rax)
	cmpq	%rdx, %rax
	jne	.L382
	movl	$13, 36(%r15)
	jmp	.L381
.L854:
	movl	$32768, %eax
	movq	%rbx, %rsi
	movl	$131072, %edx
	cmpq	%rax, %r9
	cmovbe	%r9, %rax
	movl	%eax, 32(%r15)
	leaq	74080(%r15), %rax
	movl	$-32768, %fs:mf_stale_cutoff@tpoff
	movl	$-32768, 56(%rsp)
.L310:
	movdqa	.LC4(%rip), %xmm0
	addq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L312:
	movaps	%xmm0, (%rax)
	addq	$64, %rax
	movaps	%xmm0, -48(%rax)
	movaps	%xmm0, -32(%rax)
	movaps	%xmm0, -16(%rax)
	cmpq	%rdx, %rax
	jne	.L312
	movl	$15, 36(%r15)
	jmp	.L311
.L544:
	movq	%r12, %rax
	movq	%r14, %r12
.L815:
	movl	%ecx, 32(%rsp)
	movq	%rbx, %rdx
.L170:
	movq	(%rsp), %rdi
	movl	$258, %ebx
	subq	%rdx, %rdi
	cmpq	%rbx, %rdi
	cmova	%rbx, %rdi
	movl	%edi, 40(%rsp)
	subl	$4, %edi
	cmpl	$31, %edi
	jbe	.L545
	movq	4(%rax), %rdi
	movq	4(%rdx), %rbx
	cmpq	%rbx, %rdi
	jne	.L178
	movq	12(%rax), %rdi
	movq	12(%rdx), %rbx
	cmpq	%rbx, %rdi
	je	.L179
	xorq	%rbx, %rdi
	movl	$12, %r15d
.L180:
	rep bsfq	%rdi, %rdi
	shrl	$3, %edi
	addl	%edi, %r15d
	movl	%r15d, %r15d
	leaq	(%rdx,%r15), %rbx
.L185:
	movq	%r12, 0(%r13)
	orl	%ecx, %ebp
	movl	%ecx, %edi
	movq	%r12, %r14
	andl	$56, %ecx
	movq	%rdx, %r12
	shrl	$3, %edi
	movl	%ebp, 40(%rsp)
	shrq	%cl, %r14
	subq	%rax, %r12
	movl	$256, %ecx
	andl	$7, %edi
	subl	%r12d, %ecx
	leal	-1(%r12), %eax
	addq	%r13, %rdi
	shrl	$29, %ecx
	leaq	deflate_offset_slot(%rip), %r13
	shrl	%cl, %eax
	movzbl	0(%r13,%rax), %eax
	leal	(%rax,%rcx,2), %r13d
	movq	24(%rsp), %rcx
	movzbl	3988(%rcx,%r13), %eax
	movl	4020(%rcx,%r15,4), %ebp
	movzbl	32(%rsp), %ecx
	salq	%cl, %rbp
	orq	%r14, %rbp
	movq	24(%rsp), %r14
	movzbl	5056(%r14,%r15), %ecx
	movl	32(%rsp), %r15d
	movl	3572(%r14,%r13,4), %r14d
	addl	%r15d, %ecx
	salq	%cl, %r14
	addl	%eax, %ecx
	orq	%rbp, %r14
	leal	-1(%rax), %ebp
	movl	40(%rsp), %eax
	orl	%eax, %ebp
	leaq	deflate_offset_slot_base(%rip), %rax
	subl	(%rax,%r13,4), %r12d
	leaq	deflate_extra_offset_bits(%rip), %rax
	movzbl	(%rax,%r13), %eax
	salq	%cl, %r12
	orq	%r14, %r12
	leaq	3(%rdx), %r14
	addl	%ecx, %eax
	movq	%r12, (%rdi)
	movl	%eax, %ecx
	orl	%eax, %ebp
	movl	%eax, %r13d
	andl	$7, %eax
	andl	$56, %ecx
	shrl	$3, %r13d
	shrq	%cl, %r12
	movl	%eax, %ecx
	movq	48(%rsp), %rax
	andl	$7, %r13d
	addq	%rdi, %r13
	cmpq	%r14, %rax
	cmovbe	%rax, %r14
	leaq	-1(%rbx), %rax
	cmpq	%r14, %rbx
	cmovbe	%rbx, %r14
	cmpq	%rax, 8(%rsp)
	jb	.L188
	cmpq	%r14, %rax
	jb	.L188
	movabsq	$-5654854502012944384, %rdi
	imulq	-1(%rbx), %rdi
	subq	%rsi, %rax
	shrq	$50, %rdi
	movw	%ax, (%r11,%rdi,2)
.L188:
	movabsq	$-5654854502012944384, %r15
	leaq	1(%rdx), %rax
	cmpq	%r14, %rax
	jnb	.L192
	.p2align 4,,10
	.p2align 3
.L189:
	movq	(%rax), %rdx
	movq	%rax, %rdi
	addq	$1, %rax
	subq	%rsi, %rdi
	imulq	%r15, %rdx
	shrq	$50, %rdx
	movw	%di, (%r11,%rdx,2)
	cmpq	%rax, %r14
	jne	.L189
.L192:
	movq	8(%rsp), %rax
	cmpq	%rax, %rbx
	jnb	.L816
	movq	(%rbx), %rdi
	imulq	%r9, %rdi
	shrq	$50, %rdi
	jmp	.L168
.L526:
	movl	%r12d, 24(%rsp)
	movq	%r14, %r11
.L807:
	movl	%ecx, 40(%rsp)
	movq	%rbx, %rdx
.L92:
	movq	(%rsp), %rdi
	movl	$258, %r8d
	subq	%rdx, %rdi
	cmpq	%r8, %rdi
	cmova	%r8, %rdi
	movl	%edi, 48(%rsp)
	subl	$4, %edi
	cmpl	$31, %edi
	jbe	.L527
	movq	4(%rax), %rdi
	movq	4(%rdx), %r8
	cmpq	%r8, %rdi
	jne	.L100
	movq	12(%rax), %rdi
	movq	12(%rdx), %r8
	cmpq	%r8, %rdi
	je	.L101
	xorq	%r8, %rdi
	movl	$12, %r14d
.L102:
	rep bsfq	%rdi, %rdi
	shrl	$3, %edi
	addl	%r14d, %edi
	movl	%edi, %edi
	leaq	(%rdx,%rdi), %rbx
.L107:
	movl	%ecx, %r8d
	movl	24(%rsp), %r12d
	movq	%r11, 0(%r13)
	shrl	$3, %r8d
	andl	$7, %r8d
	orl	%ecx, %r12d
	andl	$56, %ecx
	leaq	0(%r13,%r8), %r14
	movq	%rdx, %r8
	shrq	%cl, %r11
	movl	%r12d, 24(%rsp)
	subq	%rax, %r8
	movl	$256, %eax
	leaq	deflate_offset_slot(%rip), %r13
	movq	%r14, 48(%rsp)
	subl	%r8d, %eax
	movq	%r11, %r14
	movl	4020(%r15,%rdi,4), %r11d
	movl	%eax, %ecx
	leal	-1(%r8), %eax
	shrl	$29, %ecx
	shrl	%cl, %eax
	movzbl	0(%r13,%rax), %eax
	leal	(%rax,%rcx,2), %r13d
	movl	40(%rsp), %eax
	movzbl	3988(%r15,%r13), %r12d
	movl	%eax, %ecx
	salq	%cl, %r11
	movzbl	5056(%r15,%rdi), %ecx
	orq	%r14, %r11
	addl	%eax, %ecx
	leaq	(%r15,%r13,4), %rax
	movl	3572(%rax), %r14d
	salq	%cl, %r14
	addl	%r12d, %ecx
	subl	$1, %r12d
	orq	%r11, %r14
	movl	24(%rsp), %r11d
	orl	%r11d, %r12d
	movl	%r8d, %r11d
	leaq	deflate_extra_offset_bits(%rip), %r8
	movl	%r12d, 24(%rsp)
	leaq	deflate_offset_slot_base(%rip), %r12
	subl	(%r12,%r13,4), %r11d
	salq	%cl, %r11
	orq	%r14, %r11
	movzbl	(%r8,%r13), %r14d
	movl	24(%rsp), %r8d
	addl	%ecx, %r14d
	movq	48(%rsp), %rcx
	movl	%r14d, %r13d
	orl	%r14d, %r8d
	shrl	$3, %r13d
	movq	%r11, (%rcx)
	andl	$7, %r13d
	movl	%r8d, 24(%rsp)
	leaq	3(%rdx), %r8
	addq	%rcx, %r13
	movl	%r14d, %ecx
	andl	$56, %ecx
	shrq	%cl, %r11
	movl	%r14d, %ecx
	leaq	deflate_length_slot(%rip), %r14
	movzbl	(%r14,%rdi), %edi
	andl	$7, %ecx
	addl	$1, 69060(%r15,%rdi,4)
	addl	$1, 69184(%rax)
	movq	56(%rsp), %rax
	cmpq	%r8, %rax
	cmovbe	%rax, %r8
	leaq	-1(%rbx), %rax
	cmpq	%r8, %rbx
	cmovbe	%rbx, %r8
	cmpq	%rax, 8(%rsp)
	jb	.L110
	cmpq	%r8, %rax
	jb	.L110
	movabsq	$-5654854502012944384, %rdi
	imulq	-1(%rbx), %rdi
	subq	%rsi, %rax
	shrq	$50, %rdi
	movw	%ax, (%r10,%rdi,2)
.L110:
	leaq	1(%rdx), %rax
	movl	24(%rsp), %r12d
	movabsq	$-5654854502012944384, %r14
	cmpq	%r8, %rax
	jnb	.L114
	.p2align 4,,10
	.p2align 3
.L111:
	movq	(%rax), %rdx
	movq	%rax, %rdi
	addq	$1, %rax
	subq	%rsi, %rdi
	imulq	%r14, %rdx
	shrq	$50, %rdx
	movw	%di, (%r10,%rdx,2)
	cmpq	%rax, %r8
	jne	.L111
	movl	%r12d, 24(%rsp)
.L114:
	movq	8(%rsp), %rax
	cmpq	%rax, %rbx
	jnb	.L808
	movq	(%rbx), %rdi
	imulq	%r9, %rdi
	shrq	$50, %rdi
	jmp	.L90
.L596:
	movl	$4, %esi
	jmp	.L493
	.p2align 4,,10
	.p2align 3
.L494:
	movq	(%rdi,%rsi), %rcx
	addq	$8, %rsi
	movq	-8(%rbx,%rsi), %r8
	cmpq	%r8, %rcx
	jne	.L903
.L493:
	leal	8(%rsi), %eax
	movl	%esi, %r9d
	cmpl	%eax, %ebp
	jnb	.L494
	movl	%esi, %ecx
	cmpl	%ebp, %esi
	jb	.L497
	jmp	.L904
	.p2align 4,,10
	.p2align 3
.L499:
	addq	$1, %rcx
	cmpl	%ebp, %ecx
	jnb	.L905
.L497:
	movzbl	(%rbx,%rcx), %eax
	movl	%ecx, %r11d
	cmpb	%al, (%rdi,%rcx)
	je	.L499
	leaq	(%rbx,%rcx), %rbp
	leal	-1(%rcx), %r11d
	movl	%ecx, %r9d
.L498:
	movl	%ebx, %r10d
	movl	%r9d, %r13d
	subl	%edi, %r10d
	jmp	.L500
.L902:
	movq	%r14, %rsi
	movq	64(%rsp), %r14
	xorq	%r10, %rsi
	movq	%rsi, %r10
	jmp	.L329
.L901:
	xorq	%r11, %r10
	jmp	.L399
.L865:
	movl	$32768, %eax
	movq	%rbx, %rsi
	cmpq	%rax, %r9
	cmovbe	%r9, %rax
	movl	%eax, 32(%r15)
	movq	%r10, %rax
	movl	$-32768, %fs:mf_stale_cutoff@tpoff
	movl	$-32768, 16(%rsp)
.L86:
	movdqa	.LC4(%rip), %xmm0
	addq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L88:
	movaps	%xmm0, (%rax)
	addq	$64, %rax
	movaps	%xmm0, -48(%rax)
	movaps	%xmm0, -32(%rax)
	movaps	%xmm0, -16(%rax)
	cmpq	%rdx, %rax
	jne	.L88
	movl	$13, 36(%r15)
	jmp	.L87
.L875:
	leaq	74080(%r15), %rax
	testl	%ecx, %ecx
	je	.L579
	movl	$4, %esi
	salq	%cl, %rsi
	subq	%rsi, %rdx
	addq	%rsi, %rax
	jmp	.L380
.L855:
	leaq	74080(%r15), %rax
	testl	%ecx, %ecx
	je	.L568
	movl	$4, %edx
	salq	%cl, %rdx
	movq	%rdx, %rcx
	movl	$131072, %edx
	subq	%rcx, %rdx
	addq	%rcx, %rax
	jmp	.L310
.L861:
	movl	$32768, %eax
	movq	%rbx, %rsi
	movl	$-32768, %r8d
	cmpq	%rax, %r9
	cmovbe	%r9, %rax
	movl	%eax, 32(%r15)
	movq	%r11, %rax
	movl	$-32768, %fs:mf_stale_cutoff@tpoff
.L164:
	movdqa	.LC4(%rip), %xmm0
	addq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L166:
	movaps	%xmm0, (%rax)
	addq	$64, %rax
	movaps	%xmm0, -48(%rax)
	movaps	%xmm0, -32(%rax)
	movaps	%xmm0, -16(%rax)
	cmpq	%rdx, %rax
	jne	.L166
	movl	$13, 36(%r15)
	jmp	.L165
.L100:
	xorq	%r8, %rdi
	movl	$4, %r14d
	jmp	.L102
.L178:
	xorq	%rbx, %rdi
	movl	$4, %r15d
	jmp	.L180
.L903:
	xorq	%r8, %rcx
	jmp	.L491
.L806:
	movl	%ecx, %ebx
	andl	$7, %ebx
	movl	%ebx, 40(%rsp)
	jmp	.L92
.L814:
	movl	%ecx, %ebx
	andl	$7, %ebx
	movl	%ebx, 32(%rsp)
	jmp	.L170
.L259:
	movq	28(%r9), %rsi
	movq	28(%rbx), %r10
	cmpq	%r10, %rsi
	je	.L560
	xorq	%rsi, %r10
	movl	$28, %r8d
	jmp	.L258
.L582:
	movl	$36, %r8d
	jmp	.L401
.L571:
	movl	$36, %esi
	jmp	.L326
.L862:
	testl	%ecx, %ecx
	je	.L541
	movl	$4, %eax
	salq	%cl, %rax
	subq	%rax, %rdx
	addq	%r11, %rax
	jmp	.L164
.L866:
	testl	%ecx, %ecx
	je	.L523
	movl	$4, %eax
	salq	%cl, %rax
	subq	%rax, %rdx
	addq	%r10, %rax
	jmp	.L86
.L283:
	movq	20(%rcx), %rsi
	movq	20(%rbx), %rdi
	cmpq	%rdi, %rsi
	je	.L285
	xorq	%rdi, %rsi
	movl	$20, %r8d
	jmp	.L284
.L559:
	movl	$4, %esi
	jmp	.L260
	.p2align 4,,10
	.p2align 3
.L261:
	movq	(%r9,%rsi), %rax
	addq	$8, %rsi
	movq	-8(%rbx,%rsi), %r10
	cmpq	%r10, %rax
	jne	.L906
.L260:
	leal	8(%rsi), %eax
	movl	%esi, %r8d
	cmpl	%eax, %r11d
	jnb	.L261
	cmpl	%r11d, %esi
	jnb	.L263
	movl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L264:
	movzbl	(%rbx,%rsi), %eax
	movl	%esi, %r8d
	cmpb	%al, (%r9,%rsi)
	jne	.L263
	addq	$1, %rsi
	cmpl	%r11d, %esi
	jb	.L264
	addl	$1, %r8d
	jmp	.L263
.L870:
	movq	40(%rsp), %r13
	movl	48(%rsp), %r14d
	cmpq	$4, %rax
	jne	.L802
	leaq	4(%rbx), %rax
	movq	%rbx, %r11
	movl	%r14d, %ecx
	movq	%rax, (%rsp)
	.p2align 4,,10
	.p2align 3
.L456:
	movzbl	(%r11), %r8d
	movzbl	1(%r11), %r14d
	addq	$4, %r11
	movzbl	-2(%r11), %ebp
	movzbl	-1(%r11), %r10d
	movzbl	3700(%r15,%r8), %eax
	movl	2420(%r15,%r8,4), %r8d
	movzbl	3700(%r15,%r14), %edi
	movl	2420(%r15,%r14,4), %r14d
	movzbl	3700(%r15,%rbp), %esi
	leal	(%rax,%rcx), %r12d
	salq	%cl, %r8
	movzbl	3700(%r15,%r10), %edx
	movl	%r12d, %ecx
	leal	(%r12,%rdi), %ebx
	subl	$1, %eax
	movl	2420(%r15,%r10,4), %r10d
	salq	%cl, %r14
	leal	(%rbx,%rsi), %r9d
	movl	%ebx, %ecx
	subl	$1, %edi
	orq	%r8, %r14
	movl	2420(%r15,%rbp,4), %r8d
	orl	%edi, %eax
	subl	$1, %esi
	movq	24(%rsp), %rbx
	orl	%esi, %eax
	salq	%cl, %r8
	movl	%r9d, %ecx
	addl	%edx, %r9d
	subl	$1, %edx
	salq	%cl, %r10
	orq	%r14, %r8
	orl	%edx, %eax
	orl	%eax, 56(%rsp)
	orq	%r10, %r8
	movl	%r9d, %eax
	movl	%r9d, %ecx
	orq	%rbx, %r8
	shrl	$3, %eax
	andl	$-8, %ecx
	movq	%r8, 0(%r13)
	addq	%rax, %r13
	movq	(%rsp), %rax
	shrq	%cl, %r8
	movl	%r9d, %ecx
	movq	%r8, 24(%rsp)
	subq	%r11, %rax
	andl	$7, %ecx
	cmpq	$3, %rax
	ja	.L456
.L821:
	movl	%ecx, %r14d
	jmp	.L457
.L423:
	movq	28(%rdi), %rcx
	movq	28(%rbx), %rsi
	cmpq	%rsi, %rcx
	je	.L586
	xorq	%rsi, %rcx
	movl	$28, %r9d
	jmp	.L422
.L597:
	movl	$36, %esi
	jmp	.L493
.L353:
	movq	28(%rcx), %rsi
	movq	28(%rbx), %rdi
	cmpq	%rdi, %rsi
	je	.L575
	xorq	%rsi, %rdi
	movl	$28, %r8d
	jmp	.L352
.L452:
	movl	3444(%r15), %eax
	movq	24(%rsp), %rbx
	movl	%r14d, %ecx
	movzbl	3956(%r15), %edx
	salq	%cl, %rax
	orq	%rbx, %rax
	movq	%rax, 0(%r13)
	jmp	.L520
.L556:
	movq	%rbx, %r12
	jmp	.L231
.L538:
	movq	%rbx, %r12
	jmp	.L155
.L585:
	movl	$4, %esi
	jmp	.L424
	.p2align 4,,10
	.p2align 3
.L425:
	movq	(%rdi,%rsi), %rcx
	addq	$8, %rsi
	movq	-8(%rbx,%rsi), %r8
	cmpq	%r8, %rcx
	jne	.L907
.L424:
	leal	8(%rsi), %ecx
	movl	%esi, %r9d
	cmpl	%ecx, %ebp
	jnb	.L425
	movl	%esi, %ecx
	cmpl	%ebp, %esi
	jb	.L428
	jmp	.L908
	.p2align 4,,10
	.p2align 3
.L430:
	addq	$1, %rcx
	cmpl	%ebp, %ecx
	jnb	.L909
.L428:
	movzbl	(%rbx,%rcx), %esi
	movl	%ecx, %r11d
	cmpb	%sil, (%rdi,%rcx)
	je	.L430
	leaq	(%rbx,%rcx), %rbp
	leal	-1(%rcx), %r11d
	movl	%ecx, %r9d
.L429:
	movl	%ebx, %r10d
	subl	%edi, %r10d
	movl	%r9d, %edi
	jmp	.L431
.L574:
	movl	$4, %esi
	jmp	.L354
	.p2align 4,,10
	.p2align 3
.L355:
	movq	(%rcx,%rsi), %rdi
	addq	$8, %rsi
	movq	-8(%rbx,%rsi), %r9
	cmpq	%r9, %rdi
	jne	.L910
.L354:
	leal	8(%rsi), %eax
	movl	%esi, %r8d
	cmpl	%eax, %r11d
	jnb	.L355
	movl	%esi, %edi
	cmpl	%r11d, %esi
	jb	.L358
	jmp	.L911
	.p2align 4,,10
	.p2align 3
.L360:
	addq	$1, %rdi
	cmpl	%r11d, %edi
	jnb	.L912
.L358:
	movzbl	(%rbx,%rdi), %esi
	movl	%edi, %eax
	cmpb	%sil, (%rcx,%rdi)
	je	.L360
	leaq	(%rbx,%rdi), %rax
	movl	%edi, %r8d
	movq	%rax, 8(%rsp)
	leal	-1(%rdi), %eax
	movl	%eax, 64(%rsp)
.L359:
	movl	%ebx, %edi
	movl	%r8d, %eax
	subl	%ecx, %edi
	movq	%rax, %rsi
	jmp	.L361
.L906:
	xorq	%rax, %r10
	jmp	.L258
.L891:
	leaq	74080(%r15), %rax
	testl	%ecx, %ecx
	je	.L557
	movl	$4, %esi
	salq	%cl, %rsi
	subq	%rsi, %rdx
	addq	%rsi, %rax
	jmp	.L239
.L409:
	xorq	%rdi, %rcx
	movl	$4, %r13d
	jmp	.L411
.L339:
	xorq	%rdi, %rcx
	movl	$4, %ebp
	jmp	.L341
.L101:
	movq	20(%rax), %rdi
	movq	20(%rdx), %r8
	cmpq	%r8, %rdi
	je	.L103
	xorq	%r8, %rdi
	movl	$20, %r14d
	jmp	.L102
.L179:
	movq	20(%rax), %rdi
	movq	20(%rdx), %rbx
	cmpq	%rbx, %rdi
	je	.L181
	xorq	%rbx, %rdi
	movl	$20, %r15d
	jmp	.L180
.L218:
	movq	28(%rdx), %r8
	movq	28(%rsi), %r9
	cmpq	%r9, %r8
	je	.L555
	xorq	%r9, %r8
	movl	$28, %r14d
	jmp	.L217
.L479:
	movq	20(%r11), %rdi
	movq	20(%rbx), %rcx
	cmpq	%rcx, %rdi
	je	.L481
	xorq	%rdi, %rcx
	movl	$20, %r13d
	jmp	.L480
.L905:
	movl	%ecx, %ecx
	leal	1(%r11), %r9d
	leaq	(%rbx,%rcx), %rbp
	jmp	.L498
.L907:
	xorq	%r8, %rcx
	jmp	.L422
.L910:
	xorq	%r9, %rdi
	jmp	.L352
.L142:
	movq	28(%rdx), %r8
	movq	28(%rsi), %r9
	cmpq	%r9, %r8
	je	.L537
	xorq	%r9, %r8
	movl	$28, %r9d
	jmp	.L141
.L871:
	movq	40(%rsp), %r13
	movl	%edi, %r14d
	jmp	.L457
.L554:
	movl	$4, %r9d
.L214:
	movl	%r12d, 56(%rsp)
	movl	40(%rsp), %r12d
	jmp	.L219
	.p2align 4,,10
	.p2align 3
.L220:
	movq	(%rdx,%r9), %r8
	addq	$8, %r9
	movq	-8(%rsi,%r9), %rbx
	cmpq	%rbx, %r8
	jne	.L913
.L219:
	leal	8(%r9), %r8d
	movl	%r9d, %r14d
	cmpl	%r8d, %r12d
	jnb	.L220
	movl	40(%rsp), %r8d
	movl	56(%rsp), %r12d
	movl	%r9d, %ebx
	cmpl	%r8d, %r9d
	jnb	.L914
	movl	40(%rsp), %r8d
	jmp	.L223
.L224:
	addq	$1, %rbx
	cmpl	%r8d, %ebx
	jnb	.L915
.L223:
	movzbl	(%rsi,%rbx), %r9d
	movl	%ebx, %r14d
	cmpb	%r9b, (%rdx,%rbx)
	je	.L224
	addq	%rsi, %rbx
	movl	%r14d, %r9d
	jmp	.L222
.L536:
	movl	$4, %ebx
	jmp	.L143
	.p2align 4,,10
	.p2align 3
.L144:
	movq	(%rdx,%rbx), %r12
	addq	$8, %rbx
	movq	-8(%rsi,%rbx), %r8
	cmpq	%r8, %r12
	jne	.L916
.L143:
	leal	8(%rbx), %r8d
	movl	%ebx, %r9d
	cmpl	%r8d, %r14d
	jnb	.L144
	movl	24(%rsp), %r12d
	movl	%ebx, %r8d
	cmpl	%r14d, %ebx
	jb	.L147
	jmp	.L917
	.p2align 4,,10
	.p2align 3
.L148:
	addq	$1, %r8
	cmpl	%r14d, %r8d
	jnb	.L918
.L147:
	movzbl	(%rsi,%r8), %ebx
	movl	%r8d, %r9d
	cmpb	%bl, (%rdx,%r8)
	je	.L148
	movl	%r12d, 24(%rsp)
	leaq	(%rsi,%r8), %rbx
	jmp	.L146
.L560:
	movl	$36, %esi
	jmp	.L260
.L834:
	movq	%r14, %r13
	movl	%r9d, %r14d
	jmp	.L318
.L881:
	movq	40(%rsp), %r13
	movl	32(%rsp), %r14d
	cmpq	$4, %rax
	jne	.L799
	leaq	4(%rbx), %rax
	movq	%rbx, %r11
	movl	%r14d, %ecx
	movq	%rax, (%rsp)
.L387:
	movzbl	(%r11), %r8d
	movzbl	1(%r11), %r14d
	addq	$4, %r11
	movzbl	-2(%r11), %ebp
	movzbl	-1(%r11), %r10d
	movzbl	3700(%r15,%r8), %eax
	movl	2420(%r15,%r8,4), %r8d
	movzbl	3700(%r15,%r14), %edi
	movl	2420(%r15,%r14,4), %r14d
	movzbl	3700(%r15,%rbp), %esi
	leal	(%rcx,%rax), %r12d
	salq	%cl, %r8
	movzbl	3700(%r15,%r10), %edx
	movl	%r12d, %ecx
	leal	(%r12,%rdi), %ebx
	subl	$1, %eax
	movl	2420(%r15,%r10,4), %r10d
	salq	%cl, %r14
	leal	(%rbx,%rsi), %r9d
	movl	%ebx, %ecx
	subl	$1, %edi
	orq	%r8, %r14
	movl	2420(%r15,%rbp,4), %r8d
	orl	%edi, %eax
	subl	$1, %esi
	movq	24(%rsp), %rbx
	orl	%esi, %eax
	salq	%cl, %r8
	movl	%r9d, %ecx
	addl	%edx, %r9d
	subl	$1, %edx
	salq	%cl, %r10
	orq	%r14, %r8
	orl	%edx, %eax
	orl	%eax, 48(%rsp)
	orq	%r10, %r8
	movl	%r9d, %eax
	movl	%r9d, %ecx
	orq	%rbx, %r8
	shrl	$3, %eax
	andl	$-8, %ecx
	movq	%r8, 0(%r13)
	addq	%rax, %r13
	movq	(%rsp), %rax
	shrq	%cl, %r8
	movl	%r9d, %ecx
	movq	%r8, 24(%rsp)
	subq	%r11, %rax
	andl	$7, %ecx
	cmpq	$3, %rax
	ja	.L387
	movl	%ecx, %r14d
	jmp	.L388
.L575:
	movl	$36, %esi
	jmp	.L354
.L586:
	movl	$36, %esi
	jmp	.L424
.L872:
	movq	%r14, %r13
	movl	40(%rsp), %r14d
	cmpq	$4, %rax
	jne	.L796
	movq	32(%rsp), %rsi
	movl	48(%rsp), %edi
	leaq	4(%rbx), %r8
	movl	%r14d, %ecx
.L317:
	movzbl	(%rbx), %edx
	movzbl	1(%rbx), %r9d
	addq	$4, %rbx
	movq	%rdx, %rax
	movzbl	3700(%r15,%rdx), %edx
	leaq	(%r15,%rax,4), %rax
	addl	$1, 68032(%rax)
	movl	2420(%rax), %r10d
	leaq	(%r15,%r9,4), %rax
	movzbl	3700(%r15,%r9), %ebp
	movl	2420(%rax), %r9d
	salq	%cl, %r10
	addl	%edx, %ecx
	addl	$1, 68032(%rax)
	subl	$1, %edx
	salq	%cl, %r9
	addl	%ebp, %ecx
	subl	$1, %ebp
	orq	%r10, %r9
	movzbl	-2(%rbx), %r10d
	orl	%ebp, %edx
	movzbl	3700(%r15,%r10), %r11d
	leaq	(%r15,%r10,4), %r10
	movl	2420(%r10), %eax
	addl	$1, 68032(%r10)
	movzbl	-1(%rbx), %r10d
	salq	%cl, %rax
	addl	%r11d, %ecx
	subl	$1, %r11d
	orq	%r9, %rax
	movq	%r10, %r9
	orl	%r11d, %edx
	movzbl	3700(%r15,%r10), %r10d
	leaq	(%r15,%r9,4), %r9
	movl	2420(%r9), %r12d
	addl	$1, 68032(%r9)
	salq	%cl, %r12
	orq	%rax, %r12
	leal	(%rcx,%r10), %eax
	subl	$1, %r10d
	orl	%r10d, %edx
	movl	%eax, %ecx
	orq	%r12, %rsi
	andl	$-8, %ecx
	orl	%edx, %edi
	movl	%eax, %edx
	andl	$7, %eax
	movq	%rsi, 0(%r13)
	shrq	%cl, %rsi
	movl	%eax, %ecx
	movq	%r8, %rax
	shrl	$3, %edx
	subq	%rbx, %rax
	addq	%rdx, %r13
	cmpq	$3, %rax
	ja	.L317
	movq	%rsi, 32(%rsp)
	movl	%ecx, %r14d
	movl	%edi, 48(%rsp)
	jmp	.L318
.L529:
	movq	%rbx, %r12
	jmp	.L116
.L547:
	movq	%rbx, %r11
	jmp	.L194
.L285:
	movq	28(%rcx), %rsi
	movq	28(%rbx), %rdi
	cmpq	%rdi, %rsi
	je	.L564
	xorq	%rdi, %rsi
	movl	$28, %r8d
	jmp	.L284
.L313:
	movl	3444(%r15), %eax
	movq	32(%rsp), %rbx
	movl	%r14d, %ecx
	movzbl	3956(%r15), %edx
	salq	%cl, %rax
	orq	%rbx, %rax
	movq	%rax, 0(%r13)
	jmp	.L520
.L916:
	xorq	%r8, %r12
	movq	%r12, %r8
	jmp	.L141
.L913:
	movl	56(%rsp), %r12d
	xorq	%rbx, %r8
	jmp	.L217
.L563:
	movl	$4, %esi
	jmp	.L286
	.p2align 4,,10
	.p2align 3
.L287:
	movq	(%rcx,%rsi), %rdi
	addq	$8, %rsi
	movq	-8(%rbx,%rsi), %r9
	cmpq	%r9, %rdi
	jne	.L919
.L286:
	leal	8(%rsi), %eax
	movl	%esi, %r8d
	cmpl	%eax, %r11d
	jnb	.L287
	movl	%esi, %edi
	cmpl	%r11d, %esi
	jb	.L290
	jmp	.L920
	.p2align 4,,10
	.p2align 3
.L292:
	addq	$1, %rdi
	cmpl	%r11d, %edi
	jnb	.L921
.L290:
	movzbl	(%rbx,%rdi), %eax
	movl	%edi, %r9d
	cmpb	%al, (%rcx,%rdi)
	je	.L292
	leal	-1(%rdi), %eax
	leaq	(%rbx,%rdi), %rsi
	movl	%edi, %r8d
	movl	%eax, 64(%rsp)
.L291:
	movl	%ebx, %edi
	movl	%r8d, %r13d
	subl	%ecx, %edi
	jmp	.L268
.L808:
	movl	24(%rsp), %r12d
	jmp	.L809
.L271:
	xorq	%rdi, %rcx
	movl	$4, %ebp
	jmp	.L273
.L555:
	movl	$36, %r9d
	jmp	.L214
.L103:
	movq	28(%rax), %rdi
	movq	28(%rdx), %r8
	cmpq	%r8, %rdi
	je	.L528
	xorq	%r8, %rdi
	movl	$28, %r14d
	jmp	.L102
.L909:
	movl	%ecx, %ecx
	leal	1(%r11), %r9d
	leaq	(%rbx,%rcx), %rbp
	jmp	.L429
.L919:
	xorq	%r9, %rdi
	movq	%rdi, %rsi
	jmp	.L284
.L537:
	movl	$36, %ebx
	jmp	.L143
.L545:
	movl	$4, %r14d
.L177:
	movl	%ecx, 56(%rsp)
	movl	40(%rsp), %ecx
	jmp	.L182
.L183:
	movq	(%rax,%r14), %rdi
	addq	$8, %r14
	movq	-8(%rdx,%r14), %rbx
	cmpq	%rbx, %rdi
	jne	.L922
.L182:
	leal	8(%r14), %edi
	movl	%r14d, %r15d
	cmpl	%edi, %ecx
	jnb	.L183
	movl	40(%rsp), %edi
	movl	56(%rsp), %ecx
	movl	%r14d, %ebx
	cmpl	%edi, %r14d
	jnb	.L923
	movl	40(%rsp), %edi
	jmp	.L186
.L187:
	addq	$1, %rbx
	cmpl	%edi, %ebx
	jnb	.L924
.L186:
	movzbl	(%rdx,%rbx), %r14d
	movl	%ebx, %r15d
	cmpb	%r14b, (%rax,%rbx)
	je	.L187
	addq	%rdx, %rbx
	jmp	.L185
.L527:
	movl	$4, %r8d
.L99:
	movl	%ecx, 64(%rsp)
	movl	24(%rsp), %r12d
	movl	48(%rsp), %ecx
	jmp	.L104
.L105:
	movq	(%rax,%r8), %rdi
	addq	$8, %r8
	movq	-8(%rdx,%r8), %rbx
	cmpq	%rbx, %rdi
	jne	.L925
.L104:
	leal	8(%r8), %edi
	movl	%r8d, %r14d
	cmpl	%edi, %ecx
	jnb	.L105
	movl	48(%rsp), %edi
	movl	64(%rsp), %ecx
	movl	%r12d, 24(%rsp)
	movl	%r8d, %ebx
	cmpl	%edi, %r8d
	jnb	.L926
	movl	24(%rsp), %r12d
	movl	48(%rsp), %edi
	jmp	.L108
.L109:
	addq	$1, %rbx
	cmpl	%edi, %ebx
	jnb	.L927
.L108:
	movzbl	(%rdx,%rbx), %r8d
	movl	%ebx, %r14d
	cmpb	%r8b, (%rax,%rbx)
	je	.L109
	movl	%r12d, 24(%rsp)
	addq	%rdx, %rbx
	movl	%r14d, %edi
	jmp	.L107
.L883:
	movl	32(%rsp), %r14d
	movq	%rsi, %r13
	jmp	.L388
.L481:
	movq	28(%r11), %rdi
	movq	28(%rbx), %rcx
	cmpq	%rcx, %rdi
	je	.L595
	xorq	%rdi, %rcx
	movl	$28, %r13d
	jmp	.L480
.L410:
	movq	20(%r11), %rdi
	movq	20(%rbx), %rcx
	cmpq	%rcx, %rdi
	je	.L412
	xorq	%rdi, %rcx
	movl	$20, %r13d
	jmp	.L411
.L912:
	movl	%edi, %edi
	movl	%eax, 64(%rsp)
	leal	1(%rax), %r8d
	leaq	(%rbx,%rdi), %rax
	movq	%rax, 8(%rsp)
	jmp	.L359
.L340:
	movq	20(%r10), %rdi
	movq	20(%rbx), %rcx
	cmpq	%rcx, %rdi
	je	.L342
	xorq	%rdi, %rcx
	movl	$20, %ebp
	jmp	.L341
.L181:
	movq	28(%rax), %rdi
	movq	28(%rdx), %rbx
	cmpq	%rbx, %rdi
	je	.L546
	xorq	%rbx, %rdi
	movl	$28, %r15d
	jmp	.L180
.L594:
	movl	$4, %ecx
	jmp	.L482
	.p2align 4,,10
	.p2align 3
.L483:
	movq	(%r11,%rcx), %r10
	addq	$8, %rcx
	movq	-8(%rbx,%rcx), %rdi
	cmpq	%rdi, %r10
	jne	.L928
.L482:
	leal	8(%rcx), %eax
	movl	%ecx, %r13d
	cmpl	%eax, %ebp
	jnb	.L483
	cmpl	%ebp, %ecx
	jnb	.L484
	movl	%ecx, %ecx
.L485:
	movzbl	(%rbx,%rcx), %eax
	movl	%ecx, %r13d
	cmpb	%al, (%r11,%rcx)
	jne	.L484
	addq	$1, %rcx
	cmpl	%ebp, %ecx
	jb	.L485
	addl	$1, %r13d
	jmp	.L484
.L897:
	movl	24(%rsp), %r12d
	jmp	.L813
.L564:
	movl	$36, %esi
	jmp	.L286
.L900:
	movq	%r14, %r13
	movl	40(%rsp), %r14d
	cmpq	$4, %rax
	jne	.L793
	movl	48(%rsp), %edi
	movq	32(%rsp), %rsi
	leaq	4(%rbx), %r8
	movl	%r14d, %ecx
.L246:
	movzbl	(%rbx), %edx
	movzbl	1(%rbx), %r9d
	addq	$4, %rbx
	movq	%rdx, %rax
	movzbl	3700(%r15,%rdx), %edx
	leaq	(%r15,%rax,4), %rax
	addl	$1, 68032(%rax)
	movl	2420(%rax), %r10d
	leaq	(%r15,%r9,4), %rax
	movzbl	3700(%r15,%r9), %ebp
	movl	2420(%rax), %r9d
	salq	%cl, %r10
	addl	%edx, %ecx
	addl	$1, 68032(%rax)
	subl	$1, %edx
	salq	%cl, %r9
	addl	%ebp, %ecx
	subl	$1, %ebp
	orq	%r10, %r9
	movzbl	-2(%rbx), %r10d
	orl	%ebp, %edx
	movzbl	3700(%r15,%r10), %r11d
	leaq	(%r15,%r10,4), %r10
	movl	2420(%r10), %eax
	addl	$1, 68032(%r10)
	movzbl	-1(%rbx), %r10d
	salq	%cl, %rax
	addl	%r11d, %ecx
	subl	$1, %r11d
	orq	%r9, %rax
	movq	%r10, %r9
	orl	%r11d, %edx
	movzbl	3700(%r15,%r10), %r10d
	leaq	(%r15,%r9,4), %r9
	movl	2420(%r9), %r12d
	addl	$1, 68032(%r9)
	salq	%cl, %r12
	orq	%rax, %r12
	leal	(%rcx,%r10), %eax
	subl	$1, %r10d
	orl	%r10d, %edx
	movl	%eax, %ecx
	orq	%r12, %rsi
	andl	$-8, %ecx
	orl	%edx, %edi
	movl	%eax, %edx
	andl	$7, %eax
	movq	%rsi, 0(%r13)
	shrq	%cl, %rsi
	movl	%eax, %ecx
	movq	%r8, %rax
	shrl	$3, %edx
	subq	%rbx, %rax
	addq	%rdx, %r13
	cmpq	$3, %rax
	ja	.L246
	movl	%edi, 48(%rsp)
	movl	%ecx, %r14d
	movq	%rsi, 32(%rsp)
	jmp	.L318
.L915:
	movl	%ebx, %ebx
	leal	1(%r14), %r9d
	addq	%rsi, %rbx
	jmp	.L222
.L928:
	movq	%r10, %rcx
	xorq	%rdi, %rcx
	jmp	.L480
.L918:
	movl	%r8d, %ebx
	movl	%r12d, 24(%rsp)
	addl	$1, %r9d
	addq	%rsi, %rbx
	jmp	.L146
.L922:
	movl	56(%rsp), %ecx
	xorq	%rbx, %rdi
	jmp	.L180
.L925:
	movl	%r12d, 24(%rsp)
	movl	64(%rsp), %ecx
	xorq	%rbx, %rdi
	jmp	.L102
.L583:
	movl	$4, %ecx
	jmp	.L413
	.p2align 4,,10
	.p2align 3
.L414:
	movq	(%r11,%rcx), %r10
	addq	$8, %rcx
	movq	-8(%rbx,%rcx), %rdi
	cmpq	%rdi, %r10
	jne	.L929
.L413:
	leal	8(%rcx), %edi
	movl	%ecx, %r13d
	cmpl	%edi, %ebp
	jnb	.L414
	cmpl	%ebp, %ecx
	jnb	.L415
	movl	%ecx, %ecx
.L416:
	movzbl	(%rbx,%rcx), %edi
	movl	%ecx, %r13d
	cmpb	%dil, (%r11,%rcx)
	jne	.L415
	addq	$1, %rcx
	cmpl	%ebp, %ecx
	jb	.L416
	addl	$1, %r13d
	jmp	.L415
.L528:
	movl	$36, %r8d
	jmp	.L99
.L921:
	movl	%edi, %edi
	movl	%r9d, 64(%rsp)
	leal	1(%r9), %r8d
	leaq	(%rbx,%rdi), %rsi
	jmp	.L291
.L342:
	movq	28(%r10), %rdi
	movq	28(%rbx), %rcx
	cmpq	%rcx, %rdi
	je	.L573
	xorq	%rdi, %rcx
	movl	$28, %ebp
	jmp	.L341
.L412:
	movq	28(%r11), %rdi
	movq	28(%rbx), %rcx
	cmpq	%rcx, %rdi
	je	.L584
	xorq	%rdi, %rcx
	movl	$28, %r13d
	jmp	.L411
.L546:
	movl	$36, %r14d
	jmp	.L177
.L595:
	movl	$36, %ecx
	jmp	.L482
.L272:
	movq	20(%r13), %rcx
	movq	20(%rbx), %rdi
	cmpq	%rdi, %rcx
	je	.L274
	xorq	%rdi, %rcx
	movl	$20, %ebp
	jmp	.L273
.L572:
	movl	$4, %ecx
	jmp	.L343
	.p2align 4,,10
	.p2align 3
.L344:
	movq	(%r10,%rcx), %rax
	addq	$8, %rcx
	movq	-8(%rbx,%rcx), %rdi
	cmpq	%rdi, %rax
	jne	.L930
.L343:
	leal	8(%rcx), %eax
	movl	%ecx, %ebp
	cmpl	%eax, %r11d
	jnb	.L344
	cmpl	%r11d, %ecx
	jnb	.L345
	movl	%ecx, %ecx
.L346:
	movzbl	(%rbx,%rcx), %eax
	movl	%ecx, %ebp
	cmpb	%al, (%r10,%rcx)
	jne	.L345
	addq	$1, %rcx
	cmpl	%r11d, %ecx
	jb	.L346
	addl	$1, %ebp
	jmp	.L345
.L274:
	movq	28(%r13), %rcx
	movq	28(%rbx), %rdi
	cmpq	%rdi, %rcx
	je	.L562
	xorq	%rdi, %rcx
	movl	$28, %ebp
	jmp	.L273
.L930:
	xorq	%rdi, %rax
	movq	%rax, %rcx
	jmp	.L341
.L573:
	movl	$36, %ecx
	jmp	.L343
.L584:
	movl	$36, %ecx
	jmp	.L413
.L802:
	movl	56(%rsp), %edi
	movq	24(%rsp), %rdx
	movl	%r14d, %ecx
	movq	(%rsp), %r8
.L455:
	movzbl	(%rbx), %eax
	addq	$1, %rbx
	movzbl	3700(%r15,%rax), %esi
	movl	2420(%r15,%rax,4), %eax
	salq	%cl, %rax
	orq	%rax, %rdx
	leal	(%rsi,%rcx), %eax
	subl	$1, %esi
	movl	%eax, %ecx
	movq	%rdx, 0(%r13)
	orl	%esi, %edi
	shrl	$3, %ecx
	addq	%rcx, %r13
	movl	%eax, %ecx
	andl	$7, %eax
	andl	$-8, %ecx
	shrq	%cl, %rdx
	movl	%eax, %ecx
	cmpq	%r8, %rbx
	jne	.L455
	movl	%edi, 56(%rsp)
	movq	%rdx, 24(%rsp)
	jmp	.L821
.L924:
	movl	%ebx, %ebx
	addl	$1, %r15d
	addq	%rdx, %rbx
	jmp	.L185
.L927:
	movl	%ebx, %ebx
	movl	%r12d, 24(%rsp)
	leal	1(%r14), %edi
	addq	%rdx, %rbx
	jmp	.L107
.L929:
	movq	%r10, %rcx
	xorq	%rdi, %rcx
	jmp	.L411
.L799:
	movq	24(%rsp), %rdx
	movl	48(%rsp), %r8d
	movl	%r14d, %eax
	movq	(%rsp), %r9
.L386:
	movzbl	(%rbx), %ecx
	addq	$1, %rbx
	movzbl	3700(%r15,%rcx), %esi
	movl	2420(%r15,%rcx,4), %edi
	movl	%eax, %ecx
	addl	%esi, %eax
	salq	%cl, %rdi
	subl	$1, %esi
	movl	%eax, %ecx
	orq	%rdi, %rdx
	orl	%esi, %r8d
	shrl	$3, %ecx
	movq	%rdx, 0(%r13)
	addq	%rcx, %r13
	movl	%eax, %ecx
	andl	$7, %eax
	andl	$-8, %ecx
	shrq	%cl, %rdx
	cmpq	%r9, %rbx
	jne	.L386
	movq	%rdx, 24(%rsp)
	movl	%eax, %r14d
	movl	%r8d, 48(%rsp)
	jmp	.L388
.L911:
	leaq	(%rsi,%rbx), %rax
	movq	%rax, 8(%rsp)
	leal	-1(%rsi), %eax
	movl	%eax, 64(%rsp)
	jmp	.L359
.L904:
	leaq	(%rbx,%rsi), %rbp
	leal	-1(%rsi), %r11d
	jmp	.L498
.L793:
	movl	%r14d, %eax
.L245:
	movzbl	(%rbx), %ecx
	addq	$1, %rbx
	movzbl	3700(%r15,%rcx), %esi
	leaq	(%r15,%rcx,4), %rdi
	movl	%eax, %ecx
	movl	2420(%rdi), %edx
	addl	$1, 68032(%rdi)
	addl	%esi, %eax
	movq	(%rsp), %rdi
	subl	$1, %esi
	orl	%esi, 48(%rsp)
	salq	%cl, %rdx
	movq	32(%rsp), %rcx
	orq	%rcx, %rdx
	movl	%eax, %ecx
	shrl	$3, %ecx
	movq	%rdx, 0(%r13)
	addq	%rcx, %r13
	movl	%eax, %ecx
	andl	$7, %eax
	andl	$-8, %ecx
	shrq	%cl, %rdx
	movq	%rdx, 32(%rsp)
	cmpq	%rdi, %rbx
	jne	.L245
	movl	%eax, %r14d
	jmp	.L318
.L562:
	movl	$36, %edi
	jmp	.L275
	.p2align 4,,10
	.p2align 3
.L276:
	movq	0(%r13,%rdi), %rcx
	addq	$8, %rdi
	movq	-8(%rbx,%rdi), %r10
	cmpq	%r10, %rcx
	jne	.L931
.L275:
	leal	8(%rdi), %eax
	movl	%edi, %ebp
	cmpl	%eax, %r11d
	jnb	.L276
	cmpl	%r11d, %edi
	jnb	.L277
	movl	%edi, %edi
.L278:
	movzbl	(%rbx,%rdi), %eax
	movl	%edi, %ebp
	cmpb	%al, 0(%r13,%rdi)
	jne	.L277
	addq	$1, %rdi
	cmpl	%r11d, %edi
	jb	.L278
	addl	$1, %ebp
	jmp	.L277
.L931:
	xorq	%r10, %rcx
	jmp	.L273
.L561:
	movl	$4, %edi
	jmp	.L275
.L908:
	leaq	(%rbx,%rsi), %rbp
	leal	-1(%rsi), %r11d
	jmp	.L429
.L796:
	movq	32(%rsp), %r10
	movl	48(%rsp), %edi
	movl	%r14d, %eax
	movq	(%rsp), %r8
.L316:
	movzbl	(%rbx), %ecx
	addq	$1, %rbx
	movzbl	3700(%r15,%rcx), %esi
	leaq	(%r15,%rcx,4), %r9
	movl	%eax, %ecx
	movl	2420(%r9), %edx
	addl	$1, 68032(%r9)
	addl	%esi, %eax
	subl	$1, %esi
	salq	%cl, %rdx
	movl	%eax, %ecx
	orl	%esi, %edi
	orq	%r10, %rdx
	shrl	$3, %ecx
	movq	%rdx, 0(%r13)
	addq	%rcx, %r13
	movl	%eax, %ecx
	andl	$7, %eax
	andl	$-8, %ecx
	shrq	%cl, %rdx
	movq	%rdx, %r10
	cmpq	%r8, %rbx
	jne	.L316
	movq	%rdx, 32(%rsp)
	movl	%eax, %r14d
	movl	%edi, 48(%rsp)
	jmp	.L318
.L532:
	movq	%r11, %rdx
	movl	$131072, %ecx
	jmp	.L125
.L914:
	leaq	(%r9,%rsi), %rbx
	movl	%r9d, %r9d
	jmp	.L222
.L523:
	movq	%r10, %rax
	movl	$32768, %edx
	jmp	.L86
.L568:
	movl	$131072, %edx
	jmp	.L310
.L917:
	addq	%rsi, %rbx
	jmp	.L146
.L926:
	leaq	(%r8,%rdx), %rbx
	movl	%r8d, %edi
	jmp	.L107
.L923:
	leaq	(%r14,%rdx), %rbx
	jmp	.L185
.L550:
	movq	%r10, %rdx
	movl	$131072, %ecx
	jmp	.L201
.L920:
	leal	-1(%r8), %eax
	addq	%rbx, %rsi
	movl	%eax, 64(%rsp)
	jmp	.L291
.L557:
	movl	$32768, %edx
	jmp	.L239
.L590:
	movl	$131072, %edx
	jmp	.L449
.L579:
	movl	$32768, %edx
	jmp	.L380
.L541:
	movq	%r11, %rax
	movl	$32768, %edx
	jmp	.L164
	.cfi_endproc
.LFE6549:
	.size	deflate_direct, .-deflate_direct
