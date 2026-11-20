deflate_direct:
.LFB4055:
	.cfi_startproc
	stp	x29, x30, [sp, -160]!
	.cfi_def_cfa_offset 160
	.cfi_offset 29, -160
	.cfi_offset 30, -152
	mov	x18, x3
	mov	w3, -1
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -128
	.cfi_offset 22, -120
	mov	x21, x0
	add	x0, x0, 65536
	stp	x27, x28, [sp, 80]
	.cfi_offset 27, -80
	.cfi_offset 28, -72
	mov	x27, x1
	ldr	w28, [x21, 1104]
	ldrb	w1, [x0, 2481]
	and	w4, w4, 255
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -144
	.cfi_offset 20, -136
	and	w19, w28, 7
	stp	x23, x24, [sp, 48]
	lsl	w3, w3, w19
	.cfi_offset 23, -112
	.cfi_offset 24, -104
	lsr	w24, w28, 3
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -96
	.cfi_offset 26, -88
	mov	x25, x2
	lsr	w26, w28, 3
	ldrb	w2, [x0, 2480]
	add	x22, x27, x25
	add	x20, x18, x26
	mvn	w28, w3
	tbz	x1, 0, .L50
	add	x23, x21, 73728
	add	x24, x21, 56
	add	x23, x23, 352
	tbz	x4, 0, .L51
	mov	x0, 5316
	cmp	w2, 13
	add	x1, x21, x0
	mov	x2, x26
	mov	x0, x18
	beq	.L764
	bl	memcpy
	mov	x18, x0
	add	x1, x21, x26
	ldr	w0, [x21, 32]
	add	x1, x1, 4096
	mov	x4, 32768
	uxtw	x9, w0
	sub	x5, x4, x9
	ldrb	w2, [x1, 1220]
	str	wzr, [x21, 1124]
	and	w2, w2, w28
	cmp	x25, x5
	bcs	.L765
	mrs	x1, tpidr_el0
	ldr	w4, [x21, 36]
	add	x1, x1, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x1, x1, #:tprel_lo12_nc:.LANCHOR1
	sub	w6, w0, #1
	add	w0, w0, w25
	str	w0, [x21, 32]
	sub	x3, x27, x9
	str	w6, [x1]
	cmp	w4, 14
	bls	.L766
.L94:
	cmp	x25, 9
	mov	x0, 9
	csel	x0, x25, x0, cs
	sub	x0, x0, #9
	add	x11, x0, x9
	cmp	x11, x9
	bls	.L495
	cmp	x25, 12
	mov	x10, 12
	csel	x10, x25, x10, cs
	adrp	x25, .LANCHOR0
	add	x25, x25, :lo12:.LANCHOR0
	add	x0, x27, x0
	add	x1, x25, 464
	sub	x10, x10, #12
	mov	x4, 2264924160
	add	x10, x10, x9
	movk	x4, 0xebca, lsl 32
	add	x26, x0, 1
	add	x5, x21, 2420
	stp	x0, x1, [sp, 96]
	add	x1, x25, 720
	mov	w15, 0
	movk	x4, 0xb185, lsl 48
	str	x1, [sp, 112]
	add	x1, x25, 432
	str	x1, [sp, 120]
.L97:
	ldr	x13, [x3, x9]
	mul	x16, x13, x4
	lsr	x16, x16, 48
	cmp	x10, x9
	bls	.L98
	add	x14, x9, 2
	add	x27, x9, 3
	add	x1, x3, x14
	add	x28, x9, 1
	mov	w8, w16
	.p2align 3,,7
.L105:
	ubfiz	x8, x8, 1, 16
	mov	x7, x1
	ldr	x12, [x1, -1]
	mov	w17, w13
	ldrsh	x0, [x23, x8]
	strh	w9, [x23, x8]
	cmp	w0, w6
	ble	.L99
	ldr	w8, [x3, w0, sxtw]
	add	x16, x3, x0
	cmp	w8, w13
	beq	.L100
.L99:
	add	x0, x21, w17, uxtb 2
	mul	x8, x12, x4
	add	x0, x0, 65536
	and	x17, x17, 255
	lsr	x8, x8, 48
	ldr	w13, [x0, 2496]
	ldr	w16, [x24, x17, lsl 2]
	add	w13, w13, 1
	str	w13, [x0, 2496]
	and	x13, x16, 65535
	ldrsh	x0, [x23, x8, lsl 1]
	strh	w28, [x23, x8, lsl 1]
	lsl	x8, x13, x19
	ldr	x13, [x1]
	add	w19, w19, w16, lsr 16
	orr	x2, x2, x8
	cmp	w0, w6
	ble	.L101
	ldr	w8, [x3, w0, sxtw]
	add	x16, x3, x0
	cmp	w8, w12
	beq	.L767
.L101:
	add	x8, x21, w12, uxtb 2
	and	x0, x12, 255
	add	x8, x8, 65536
	mul	x7, x13, x4
	add	x17, x1, 1
	ldr	w12, [x24, x0, lsl 2]
	ldr	w0, [x8, 2496]
	lsr	x7, x7, 48
	add	w0, w0, 1
	str	w0, [x8, 2496]
	and	x8, x12, 65535
	ldrsh	x0, [x23, x7, lsl 1]
	strh	w14, [x23, x7, lsl 1]
	lsl	x7, x8, x19
	add	w19, w19, w12, lsr 16
	orr	x2, x2, x7
	ldr	x7, [x1, 1]
	cmp	w0, w6
	ble	.L103
	ldr	w8, [x3, w0, sxtw]
	add	x16, x3, x0
	cmp	w8, w13
	beq	.L768
.L103:
	add	x12, x21, w13, uxtb 2
	and	x0, x13, 255
	add	x12, x12, 65536
	mul	x8, x7, x4
	add	x9, x9, 4
	ldr	w13, [x24, x0, lsl 2]
	ldr	w0, [x12, 2496]
	lsr	x8, x8, 48
	add	w0, w0, 1
	str	w0, [x12, 2496]
	and	x12, x13, 65535
	ldrsh	x0, [x23, x8, lsl 1]
	strh	w27, [x23, x8, lsl 1]
	lsl	x8, x12, x19
	add	w19, w19, w13, lsr 16
	orr	x2, x2, x8
	ldr	x13, [x1, 2]
	cmp	w0, w6
	ble	.L104
	ldr	w8, [x3, w0, sxtw]
	add	x16, x3, x0
	cmp	w8, w7
	beq	.L769
.L104:
	and	x0, x7, 255
	add	x7, x21, w7, uxtb 2
	add	x7, x7, 65536
	mul	x8, x13, x4
	add	x27, x27, 4
	add	x14, x14, 4
	ldr	w0, [x24, x0, lsl 2]
	add	x1, x1, 4
	ldr	w16, [x7, 2496]
	add	x28, x28, 4
	and	x12, x0, 65535
	lsr	x8, x8, 48
	add	w0, w19, w0, lsr 16
	add	w16, w16, 1
	lsl	x12, x12, x19
	orr	x12, x12, x2
	and	w2, w0, 56
	str	w16, [x7, 2496]
	ubfx	x7, x0, 3, 3
	str	x12, [x20]
	orr	w15, w15, w0
	and	w19, w0, 7
	add	x20, x20, x7
	lsr	x2, x12, x2
	cmp	x10, x9
	bhi	.L105
	mov	w16, w8
.L98:
	cmp	x11, x9
	bls	.L770
	add	x7, x9, 1
	mov	w0, w16
	add	x7, x3, x7
	.p2align 3,,7
.L108:
	ubfiz	x0, x0, 1, 16
	add	x14, x21, w13, uxtb 2
	mov	x12, x13
	and	x17, x13, 255
	ldr	x13, [x7]
	mov	x1, x7
	ldrsh	x8, [x23, x0]
	add	x14, x14, 65536
	strh	w9, [x23, x0]
	cmp	w8, w6
	ble	.L107
	ldr	w0, [x3, w8, sxtw]
	add	x16, x3, x8
	cmp	w0, w12
	beq	.L747
.L107:
	ldr	w8, [x24, x17, lsl 2]
	mul	x0, x13, x4
	ldr	w16, [x14, 2496]
	add	x9, x9, 1
	and	x12, x8, 65535
	add	x7, x7, 1
	add	w8, w19, w8, lsr 16
	add	w16, w16, 1
	lsl	x12, x12, x19
	orr	x2, x12, x2
	str	w16, [x14, 2496]
	and	w14, w8, 56
	ubfx	x12, x8, 3, 3
	str	x2, [x20]
	orr	w15, w15, w8
	and	w19, w8, 7
	lsr	x0, x0, 48
	add	x20, x20, x12
	lsr	x2, x2, x14
	cmp	x11, x9
	bhi	.L108
.L714:
	orr	w15, w15, w19
	mov	x27, x1
.L96:
	sub	x0, x22, x27
	str	x2, [x20]
	cmp	x0, 3
	bls	.L498
	sub	x0, x0, #4
	lsr	x1, x0, 2
	add	x7, x1, 1
	add	x7, x27, x7, lsl 2
	.p2align 3,,7
.L125:
	ldrb	w3, [x27]
	add	x27, x27, 4
	ldrb	w9, [x27, -3]
	ldrb	w14, [x27, -2]
	add	x4, x21, x3, lsl 2
	ldrb	w12, [x27, -1]
	add	x4, x4, 65536
	add	x6, x21, x9, lsl 2
	ldr	w3, [x24, x3, lsl 2]
	add	x6, x6, 65536
	add	x11, x21, x14, lsl 2
	add	x10, x21, x12, lsl 2
	ldr	w8, [x4, 2496]
	add	x11, x11, 65536
	add	w13, w19, w3, lsr 16
	and	x3, x3, 65535
	add	w8, w8, 1
	str	w8, [x4, 2496]
	lsl	x4, x3, x19
	add	x10, x10, 65536
	ldr	w8, [x6, 2496]
	ldr	w9, [x24, x9, lsl 2]
	add	w3, w8, 1
	str	w3, [x6, 2496]
	and	x6, x9, 65535
	ldr	w3, [x11, 2496]
	add	w9, w13, w9, lsr 16
	ldr	w8, [x24, x14, lsl 2]
	lsl	x6, x6, x13
	add	w3, w3, 1
	str	w3, [x11, 2496]
	orr	x6, x6, x4
	and	x3, x8, 65535
	ldr	w4, [x24, x12, lsl 2]
	add	w8, w9, w8, lsr 16
	ldr	w11, [x10, 2496]
	lsl	x3, x3, x9
	and	x12, x4, 65535
	add	w4, w8, w4, lsr 16
	add	w9, w11, 1
	lsl	x8, x12, x8
	orr	x3, x3, x8
	orr	x3, x3, x6
	and	w6, w4, 56
	orr	x2, x3, x2
	str	w9, [x10, 2496]
	ubfx	x3, x4, 3, 3
	str	x2, [x20]
	orr	w15, w15, w4
	and	w19, w4, 7
	add	x20, x20, x3
	lsr	x2, x2, x6
	cmp	x27, x7
	bne	.L125
	sub	x0, x0, x1, lsl 2
.L124:
	cbz	x0, .L87
	add	x22, x7, x0
.L127:
	ldrb	w0, [x7], 1
	add	x3, x21, x0, lsl 2
	add	x3, x3, 65536
	ldr	w0, [x24, x0, lsl 2]
	and	x1, x0, 65535
	ldr	w4, [x3, 2496]
	add	w0, w19, w0, lsr 16
	lsl	x1, x1, x19
	and	w6, w0, 56
	orr	x1, x1, x2
	add	w4, w4, 1
	str	w4, [x3, 2496]
	ubfx	x3, x0, 3, 3
	str	x1, [x20]
	orr	w15, w15, w0
	and	w19, w0, 7
	add	x20, x20, x3
	lsr	x2, x1, x6
	cmp	x7, x22
	bne	.L127
.L87:
	ldrb	w1, [x5, 1536]
	ldr	w0, [x5, 1024]
	add	w1, w1, w19
	orr	w15, w1, w15
	lsl	x0, x0, x19
	orr	x2, x0, x2
	str	x2, [x20]
	cmp	w15, 63
	bhi	.L128
.L755:
	ubfx	x0, x1, 3, 3
	ands	w3, w1, 7
	mov	x4, x0
	add	x0, x20, x0
	beq	.L276
	and	w1, w1, 56
	lsr	x2, x2, x1
	strb	w2, [x20, w4, uxtw]
.L276:
	sub	x0, x0, x18
	uxtw	x1, w3
	ldp	x19, x20, [sp, 16]
	add	x0, x1, x0, lsl 3
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L50:
	.cfi_restore_state
	ldr	w0, [x0, 2492]
	mov	w1, 258
	cmp	w0, w1
	csel	w0, w0, w1, ls
	str	w0, [sp, 96]
	tbnz	x4, 0, .L771
	cmp	w2, 13
	mov	x1, 5316
	mov	x2, x26
	add	x1, x21, x1
	mov	x0, x18
	beq	.L772
	bl	memcpy
	mov	x18, x0
	add	x0, x21, x26
	ldr	w1, [x21, 32]
	add	x0, x0, 4096
	mov	x2, 32768
	uxtw	x6, w1
	sub	x4, x2, x6
	ldrb	w0, [x0, 1220]
	str	wzr, [x21, 1124]
	and	w3, w0, w28
	cmp	x25, x4
	bcs	.L773
	mrs	x0, tpidr_el0
	ldr	w2, [x21, 36]
	add	x0, x0, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x0, x0, #:tprel_lo12_nc:.LANCHOR1
	sub	w16, w1, #1
	add	w1, w1, w25
	str	w1, [x21, 32]
	sub	x6, x27, x6
	str	w16, [x0]
	cmp	w2, 14
	bhi	.L418
	add	x0, x21, 73728
	add	x0, x0, 352
	cbz	w2, .L542
	mov	x4, 4
	mov	x1, 131072
	lsl	x2, x4, x2
	add	x0, x0, x2
	sub	x1, x1, x2
.L417:
	movi	v0.8h, 0x80, lsl 8
	add	x1, x0, x1
	.p2align 3,,7
.L419:
	stp	q0, q0, [x0]
	stp	q0, q0, [x0, 32]
	add	x0, x0, 64
	cmp	x0, x1
	bne	.L419
	mov	w0, 15
	str	w0, [x21, 36]
.L418:
	cbz	x25, .L420
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	add	x1, x0, 464
	add	x13, x21, 73728
	add	x30, x0, 848
	add	x13, x13, 352
	add	x7, x21, 204800
	mov	w8, 42941
	str	x1, [sp, 104]
	add	x1, x0, 720
	add	x0, x0, 432
	ldr	w23, [sp, 96]
	movi	v0.8h, 0x80, lsl 8
	add	x5, x21, 2420
	add	x7, x7, 352
	sxth	w26, w16
	mov	x9, x13
	mov	x28, x30
	mov	w12, 0
	mov	w10, 0
	movk	w8, 0x1e35, lsl 16
	stp	x1, x0, [sp, 112]
	mov	w0, 0
	mov	w4, w0
	str	x18, [sp, 128]
	b	.L483
	.p2align 2,,3
.L778:
	mov	w0, -32767
	add	w1, w11, w0
	sxth	w11, w11
.L427:
	ldr	w0, [x27, 1]
	ubfiz	x4, x4, 2, 32
	cmp	w16, w1
	add	x18, x21, x4
	add	x18, x18, 73728
	sub	w2, w2, #32768
	ldr	w17, [x27]
	mul	w0, w0, w8
	sxth	w2, w2
	ldrsh	w14, [x18, 352]
	csel	w2, w26, w2, ge
	lsr	w1, w0, 17
	lsr	w0, w0, 17
	add	x25, x13, x1, lsl 2
	prfm	PSTL1KEEP, [x25]
	str	w0, [sp, 96]
	strh	w11, [x18, 352]
	cmp	w14, w2
	ble	.L431
	add	x11, x9, x4
	ldr	w25, [x6, w14, sxtw]
	add	x18, x6, w14, sxtw
	ldrsh	w4, [x11, 2]
	strh	w14, [x11, 2]
	cmp	w17, w25
	beq	.L774
	cmp	w2, w4
	bge	.L431
	ldr	w2, [x6, w4, sxtw]
	add	x4, x6, w4, sxtw
	cmp	w17, w2
	beq	.L775
.L431:
	mov	x2, x27
	add	w12, w12, 1
	ldrb	w1, [x2], 1
	add	x4, x5, x1
	ldr	w1, [x5, x1, lsl 2]
	ldrb	w4, [x4, 1280]
	add	w11, w4, w19
	lsl	x1, x1, x19
	orr	x1, x1, x3
	and	w3, w11, -8
	sub	w4, w4, #1
	lsr	w14, w11, 3
	str	x1, [x20]
	orr	w10, w10, w4
	and	w19, w11, 7
	add	x20, x20, x14
	lsr	x3, x1, x3
	tst	x12, 15
	beq	.L776
.L474:
	cmp	x2, x22
	beq	.L744
.L479:
	ldr	w4, [sp, 96]
	mov	x27, x2
.L483:
	sub	x1, x22, x27
	mov	w24, w23
	mov	w15, 258
	cmp	x1, 257
	bls	.L777
.L421:
	sub	x11, x27, x6
	mov	w2, w11
	cmp	w11, 32768
	bne	.L778
	mov	x0, x13
	.p2align 3,,7
.L428:
	ldp	q4, q3, [x0]
	ldp	q2, q1, [x0, 32]
	sqadd	v4.8h, v4.8h, v0.8h
	sqadd	v3.8h, v3.8h, v0.8h
	sqadd	v2.8h, v2.8h, v0.8h
	sqadd	v1.8h, v1.8h, v0.8h
	stp	q4, q3, [x0]
	stp	q2, q1, [x0, 32]
	add	x0, x0, 64
	cmp	x0, x7
	bne	.L428
	add	x6, x6, 32768
	mov	w11, 0
	mov	w1, -32767
	mov	w2, 0
	b	.L427
	.p2align 2,,3
.L51:
	cmp	w2, 13
	mov	x30, 5316
	mov	x2, x26
	add	x1, x21, x30
	mov	x0, x18
	beq	.L779
	bl	memcpy
	mov	x18, x0
	add	x0, x21, x26
	ldr	w1, [x21, 32]
	add	x0, x0, 4096
	mov	x2, 32768
	uxtw	x4, w1
	sub	x5, x2, x4
	ldrb	w0, [x0, 1220]
	str	wzr, [x21, 1124]
	and	w0, w0, w28
	cmp	x25, x5
	bcs	.L780
	mrs	x2, tpidr_el0
	ldr	w3, [x21, 36]
	add	x2, x2, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x2, x2, #:tprel_lo12_nc:.LANCHOR1
	sub	w13, w1, #1
	add	w1, w1, w25
	str	w1, [x21, 32]
	sub	x12, x27, x4
	str	w13, [x2]
	cmp	w3, 14
	bls	.L781
.L170:
	cmp	x25, 9
	mov	x1, 9
	csel	x1, x25, x1, cs
	sub	x1, x1, #9
	add	x9, x1, x4
	cmp	x9, x4
	bls	.L505
	cmp	x25, 12
	mov	x28, 12
	csel	x28, x25, x28, cs
	add	x26, x27, x1
	sub	x28, x28, #12
	mov	x7, 2264924160
	adrp	x1, .LANCHOR0
	movk	x7, 0xebca, lsl 32
	add	x1, x1, :lo12:.LANCHOR0
	add	x28, x28, x4
	add	x17, x26, 1
	add	x5, x21, 2420
	mov	x14, x18
	mov	x27, x26
	add	x2, x1, 720
	add	x10, x1, 464
	mov	w11, 0
	add	x1, x1, 432
	movk	x7, 0xb185, lsl 48
	stp	x2, x1, [sp, 128]
.L173:
	ldr	x6, [x12, x4]
	mul	x3, x6, x7
	lsr	x3, x3, 48
	cmp	x28, x4
	bls	.L174
	add	x16, x4, 2
	add	x25, x4, 3
	add	x2, x12, x16
	add	x18, x4, 1
	stp	x9, x22, [sp, 96]
	stp	x21, x14, [sp, 112]
	.p2align 3,,7
.L181:
	ubfiz	x3, x3, 1, 16
	ldr	x9, [x2, -1]
	mov	x15, x2
	ldrsh	w1, [x23, x3]
	add	x26, x2, 1
	strh	w4, [x23, x3]
	and	x14, x6, 255
	mul	x21, x9, x7
	and	x22, x9, 255
	sxtw	x3, w1
	cmp	w13, w1
	bge	.L175
	ldr	w1, [x12, w1, sxtw]
	add	x8, x12, x3
	cmp	w1, w6
	beq	.L176
.L175:
	lsr	x3, x21, 48
	ldr	w21, [x24, x14, lsl 2]
	ldr	x14, [x2]
	and	x8, x21, 65535
	ldrsh	w1, [x23, x3, lsl 1]
	add	x4, x4, 4
	strh	w18, [x23, x3, lsl 1]
	lsl	x8, x8, x19
	mul	x6, x14, x7
	orr	x0, x0, x8
	sxtw	x3, w1
	add	w19, w19, w21, lsr 16
	and	x30, x14, 255
	cmp	w13, w1
	bge	.L177
	ldr	w1, [x12, w1, sxtw]
	add	x8, x12, x3
	cmp	w1, w9
	beq	.L782
.L177:
	lsr	x6, x6, 48
	ldr	w8, [x24, x22, lsl 2]
	ldr	x9, [x2, 1]
	and	x3, x8, 65535
	ldrsh	w1, [x23, x6, lsl 1]
	add	x18, x18, 4
	lsl	x3, x3, x19
	strh	w16, [x23, x6, lsl 1]
	orr	x0, x0, x3
	add	w19, w19, w8, lsr 16
	sxtw	x3, w1
	cmp	w13, w1
	bge	.L179
	ldr	w1, [x12, w1, sxtw]
	add	x8, x12, x3
	cmp	w1, w14
	beq	.L783
.L179:
	mul	x3, x9, x7
	ldr	w6, [x24, x30, lsl 2]
	and	x14, x9, 255
	add	x16, x16, 4
	and	x1, x6, 65535
	lsr	x3, x3, 48
	lsl	x1, x1, x19
	orr	x0, x0, x1
	add	w19, w19, w6, lsr 16
	ldrsh	w1, [x23, x3, lsl 1]
	strh	w25, [x23, x3, lsl 1]
	ldr	x6, [x2, 2]
	sxtw	x3, w1
	cmp	w13, w1
	bge	.L180
	ldr	w1, [x12, w1, sxtw]
	add	x8, x12, x3
	cmp	w1, w9
	beq	.L784
.L180:
	ldr	w1, [x24, x14, lsl 2]
	mul	x3, x6, x7
	add	x25, x25, 4
	add	x2, x2, 4
	and	x8, x1, 65535
	add	w1, w19, w1, lsr 16
	lsr	x3, x3, 48
	lsl	x8, x8, x19
	orr	x8, x8, x0
	and	w0, w1, 56
	ubfx	x9, x1, 3, 3
	str	x8, [x20]
	orr	w11, w11, w1
	and	w19, w1, 7
	add	x20, x20, x9
	lsr	x0, x8, x0
	cmp	x28, x4
	bhi	.L181
	ldp	x9, x22, [sp, 96]
	ldp	x21, x14, [sp, 112]
.L174:
	cmp	x9, x4
	bls	.L785
	add	x2, x4, 1
	add	x2, x12, x2
	.p2align 3,,7
.L184:
	ubfiz	x3, x3, 1, 16
	mov	x15, x6
	and	x16, x6, 255
	mov	x1, x2
	ldr	x6, [x2]
	ldrsh	w8, [x23, x3]
	strh	w4, [x23, x3]
	sxtw	x3, w8
	cmp	w13, w8
	bge	.L183
	ldr	w18, [x12, w8, sxtw]
	add	x8, x12, x3
	cmp	w18, w15
	beq	.L750
.L183:
	ldr	w8, [x24, x16, lsl 2]
	mul	x3, x6, x7
	add	x4, x4, 1
	add	x2, x2, 1
	and	x15, x8, 65535
	add	w8, w19, w8, lsr 16
	lsr	x3, x3, 48
	lsl	x15, x15, x19
	and	w16, w8, 56
	orr	x0, x15, x0
	ubfx	x15, x8, 3, 3
	str	x0, [x20]
	orr	w11, w11, w8
	and	w19, w8, 7
	add	x20, x20, x15
	lsr	x0, x0, x16
	cmp	x9, x4
	bhi	.L184
.L751:
	mov	x18, x14
	orr	w11, w11, w19
	mov	x27, x1
.L172:
	sub	x1, x22, x27
	str	x0, [x20]
	cmp	x1, 3
	bls	.L508
	sub	x1, x1, #4
	lsr	x2, x1, 2
	add	x9, x2, 1
	add	x9, x27, x9, lsl 2
	.p2align 3,,7
.L201:
	ldrb	w7, [x27]
	add	x27, x27, 4
	ldrb	w4, [x27, -3]
	ldrb	w3, [x27, -2]
	ldrb	w6, [x27, -1]
	ldr	w7, [x24, x7, lsl 2]
	ldr	w4, [x24, x4, lsl 2]
	ldr	w3, [x24, x3, lsl 2]
	and	x10, x7, 65535
	ldr	w6, [x24, x6, lsl 2]
	add	w7, w19, w7, lsr 16
	add	w13, w7, w4, lsr 16
	and	x4, x4, 65535
	add	w12, w13, w3, lsr 16
	and	x8, x6, 65535
	and	x3, x3, 65535
	lsl	x10, x10, x19
	lsl	x4, x4, x7
	orr	x4, x4, x10
	lsl	x3, x3, x13
	add	w6, w12, w6, lsr 16
	lsl	x7, x8, x12
	orr	x3, x3, x7
	orr	x3, x3, x4
	and	w4, w6, 56
	orr	x0, x3, x0
	ubfx	x3, x6, 3, 3
	str	x0, [x20]
	orr	w11, w11, w6
	and	w19, w6, 7
	add	x20, x20, x3
	lsr	x0, x0, x4
	cmp	x27, x9
	bne	.L201
	sub	x1, x1, x2, lsl 2
.L200:
	cbz	x1, .L202
	add	x22, x9, x1
.L203:
	ldrb	w1, [x9], 1
	ldr	w1, [x24, x1, lsl 2]
	and	x2, x1, 65535
	add	w1, w19, w1, lsr 16
	lsl	x2, x2, x19
	and	w3, w1, 56
	orr	x0, x2, x0
	ubfx	x2, x1, 3, 3
	str	x0, [x20]
	orr	w11, w11, w1
	and	w19, w1, 7
	add	x20, x20, x2
	lsr	x0, x0, x3
	cmp	x9, x22
	bne	.L203
.L202:
	ldrb	w1, [x5, 1536]
	ldr	w2, [x5, 1024]
	add	w1, w1, w19
	orr	w11, w1, w11
	lsl	x2, x2, x19
	orr	x2, x2, x0
	str	x2, [x20]
	cmp	w11, 63
	bls	.L755
.L128:
	mov	x0, 0
.L801:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L771:
	.cfi_restore_state
	cmp	w2, 13
	mov	x17, 5316
	mov	x2, x26
	add	x1, x21, x17
	mov	x0, x18
	beq	.L786
	bl	memcpy
	mov	x18, x0
	add	x0, x21, x26
	ldr	w1, [x21, 32]
	add	x0, x0, 4096
	mov	x2, 32768
	uxtw	x4, w1
	sub	x5, x2, x4
	ldrb	w0, [x0, 1220]
	str	wzr, [x21, 1124]
	and	w3, w0, w28
	cmp	x25, x5
	bcs	.L787
	mrs	x0, tpidr_el0
	ldr	w2, [x21, 36]
	add	x0, x0, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x0, x0, #:tprel_lo12_nc:.LANCHOR1
	add	w25, w1, w25
	sub	w16, w1, #1
	str	w25, [x21, 32]
	sub	x4, x27, x4
	str	w16, [x0]
	cmp	w2, 14
	bls	.L788
.L279:
	cmp	x27, x22
	beq	.L420
	adrp	x0, .LANCHOR0
	add	x24, x0, :lo12:.LANCHOR0
	add	x0, x24, 464
	str	x0, [sp, 104]
	add	x0, x24, 720
	add	x28, x24, 848
	add	x12, x21, 73728
	str	x0, [sp, 112]
	add	x0, x24, 432
	stp	x24, x18, [sp, 128]
	ldr	w24, [sp, 96]
	add	x12, x12, 352
	add	x6, x21, 204800
	mov	w7, 42941
	sub	x1, x22, x27
	str	x0, [sp, 120]
	add	x5, x21, 2420
	movi	v0.8h, 0x80, lsl 8
	add	x6, x6, 352
	sxth	w30, w16
	mov	x8, x12
	mov	w23, w24
	mov	w11, 0
	mov	w9, 0
	movk	w7, 0x1e35, lsl 16
	mov	w0, 0
	mov	w15, 258
	cmp	x1, 257
	bls	.L789
	.p2align 3,,7
.L282:
	sub	x10, x27, x4
	mov	w2, w10
	cmp	w10, 32768
	beq	.L287
.L794:
	mov	w13, -32767
	add	w1, w10, w13
	sxth	w10, w10
.L288:
	ldr	w14, [x27, 1]
	ubfiz	x18, x0, 2, 32
	cmp	w16, w1
	add	x13, x21, x18
	add	x13, x13, 73728
	sub	w2, w2, #32768
	ldr	w17, [x27]
	mul	w0, w14, w7
	sxth	w2, w2
	ldrsh	w14, [x13, 352]
	csel	w2, w30, w2, ge
	lsr	w1, w0, 17
	lsr	w0, w0, 17
	add	x25, x12, x1, lsl 2
	prfm	PSTL1KEEP, [x25]
	strh	w10, [x13, 352]
	cmp	w14, w2
	ble	.L292
	add	x10, x8, x18
	ldr	w25, [x4, w14, sxtw]
	add	x18, x4, w14, sxtw
	ldrsh	w13, [x10, 2]
	strh	w14, [x10, 2]
	cmp	w17, w25
	beq	.L790
	cmp	w2, w13
	bge	.L292
	ldr	w2, [x4, w13, sxtw]
	add	x13, x4, w13, sxtw
	cmp	w17, w2
	beq	.L791
.L292:
	mov	x10, x27
	add	w11, w11, 1
	ldrb	w1, [x10], 1
	add	x2, x5, x1
	add	x1, x21, x1, lsl 2
	add	x14, x1, 65536
	ldrb	w2, [x2, 1280]
	ldr	w1, [x1, 2420]
	ldr	w15, [x14, 2496]
	add	w13, w19, w2
	sub	w2, w2, #1
	lsl	x1, x1, x19
	add	w15, w15, 1
	orr	x1, x1, x3
	and	w3, w13, -8
	str	w15, [x14, 2496]
	lsr	w14, w13, 3
	str	x1, [x20]
	orr	w9, w9, w2
	and	w19, w13, 7
	add	x20, x20, x14
	lsr	x3, x1, x3
	tst	x11, 15
	beq	.L792
.L335:
	cmp	x10, x22
	beq	.L738
.L340:
	mov	x27, x10
	mov	w23, w24
	sub	x1, x22, x27
	mov	w15, 258
	cmp	x1, 257
	bhi	.L282
.L789:
	mov	w15, w1
	cmp	w1, 4
	bls	.L793
	cmp	w1, w24
	sub	x10, x27, x4
	csel	w23, w1, w24, ls
	mov	w2, w10
	cmp	w10, 32768
	bne	.L794
	.p2align 3,,7
.L287:
	mov	x1, x12
	.p2align 3,,7
.L289:
	ldp	q4, q3, [x1]
	ldp	q2, q1, [x1, 32]
	sqadd	v4.8h, v4.8h, v0.8h
	sqadd	v3.8h, v3.8h, v0.8h
	sqadd	v2.8h, v2.8h, v0.8h
	sqadd	v1.8h, v1.8h, v0.8h
	stp	q4, q3, [x1]
	stp	q2, q1, [x1, 32]
	add	x1, x1, 64
	cmp	x1, x6
	bne	.L289
	add	x4, x4, 32768
	mov	w10, 0
	mov	w1, -32767
	mov	w2, 0
	b	.L288
.L779:
	bl	memcpy
	mov	x18, x0
	add	x0, x21, x26
	ldr	w1, [x21, 32]
	add	x0, x0, 4096
	mov	x2, 32768
	uxtw	x4, w1
	mrs	x3, tpidr_el0
	sub	x5, x2, x4
	ldrb	w0, [x0, 1220]
	str	wzr, [x21, 1124]
	and	w0, w0, w28
	cmp	x25, x5
	bcs	.L795
	add	x3, x3, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x3, x3, #:tprel_lo12_nc:.LANCHOR1
	ldr	w5, [x21, 36]
	sub	w9, w1, #1
	add	w1, w1, w25
	str	w1, [x21, 32]
	sub	x7, x27, x4
	str	w9, [x3]
	cmp	w5, 12
	bls	.L796
.L133:
	cmp	x25, 9
	mov	x1, 9
	csel	x1, x25, x1, cs
	sub	x1, x1, #9
	add	x11, x1, x4
	cmp	x11, x4
	bls	.L500
	cmp	x25, 12
	mov	x28, 12
	csel	x28, x25, x28, cs
	add	x26, x27, x1
	sub	x28, x28, #12
	mov	x8, 2264924160
	adrp	x1, .LANCHOR0
	movk	x8, 0xebca, lsl 32
	add	x1, x1, :lo12:.LANCHOR0
	add	x28, x28, x4
	add	x17, x26, 1
	add	x5, x21, 2420
	mov	x14, x18
	mov	x27, x26
	add	x2, x1, 720
	add	x12, x1, 464
	mov	w13, 0
	add	x1, x1, 432
	movk	x8, 0xb185, lsl 48
	stp	x2, x1, [sp, 128]
.L136:
	ldr	x6, [x7, x4]
	mul	x3, x6, x8
	lsr	x3, x3, 50
	cmp	x28, x4
	bls	.L137
	add	x16, x4, 2
	add	x25, x4, 3
	add	x2, x7, x16
	add	x18, x4, 1
	stp	x11, x22, [sp, 96]
	stp	x21, x14, [sp, 112]
	.p2align 3,,7
.L144:
	ubfiz	x3, x3, 1, 14
	ldr	x11, [x2, -1]
	mov	x15, x2
	ldrsh	w1, [x23, x3]
	add	x26, x2, 1
	strh	w4, [x23, x3]
	and	x14, x6, 255
	mul	x21, x11, x8
	and	x22, x11, 255
	sxtw	x3, w1
	cmp	w1, w9
	ble	.L138
	ldr	w1, [x7, w1, sxtw]
	add	x10, x7, x3
	cmp	w1, w6
	beq	.L139
.L138:
	lsr	x3, x21, 50
	ldr	w21, [x24, x14, lsl 2]
	ldr	x14, [x2]
	and	x10, x21, 65535
	ldrsh	w1, [x23, x3, lsl 1]
	add	x4, x4, 4
	strh	w18, [x23, x3, lsl 1]
	lsl	x10, x10, x19
	mul	x6, x14, x8
	orr	x0, x0, x10
	sxtw	x3, w1
	add	w19, w19, w21, lsr 16
	and	x30, x14, 255
	cmp	w1, w9
	ble	.L140
	ldr	w1, [x7, w1, sxtw]
	add	x10, x7, x3
	cmp	w1, w11
	beq	.L797
.L140:
	lsr	x6, x6, 50
	ldr	w10, [x24, x22, lsl 2]
	ldr	x11, [x2, 1]
	and	x3, x10, 65535
	ldrsh	w1, [x23, x6, lsl 1]
	add	x18, x18, 4
	lsl	x3, x3, x19
	strh	w16, [x23, x6, lsl 1]
	orr	x0, x0, x3
	add	w19, w19, w10, lsr 16
	sxtw	x3, w1
	cmp	w1, w9
	ble	.L142
	ldr	w1, [x7, w1, sxtw]
	add	x10, x7, x3
	cmp	w1, w14
	beq	.L798
.L142:
	mul	x3, x11, x8
	ldr	w6, [x24, x30, lsl 2]
	and	x14, x11, 255
	add	x16, x16, 4
	and	x1, x6, 65535
	lsr	x3, x3, 50
	lsl	x1, x1, x19
	orr	x0, x0, x1
	add	w19, w19, w6, lsr 16
	ldrsh	w1, [x23, x3, lsl 1]
	strh	w25, [x23, x3, lsl 1]
	ldr	x6, [x2, 2]
	sxtw	x3, w1
	cmp	w1, w9
	ble	.L143
	ldr	w1, [x7, w1, sxtw]
	add	x10, x7, x3
	cmp	w1, w11
	beq	.L799
.L143:
	ldr	w1, [x24, x14, lsl 2]
	mul	x3, x6, x8
	add	x25, x25, 4
	add	x2, x2, 4
	and	x10, x1, 65535
	add	w1, w19, w1, lsr 16
	lsr	x3, x3, 50
	lsl	x10, x10, x19
	orr	x10, x10, x0
	and	w0, w1, 56
	ubfx	x11, x1, 3, 3
	str	x10, [x20]
	orr	w13, w13, w1
	and	w19, w1, 7
	add	x20, x20, x11
	lsr	x0, x10, x0
	cmp	x28, x4
	bhi	.L144
	ldp	x11, x22, [sp, 96]
	ldp	x21, x14, [sp, 112]
.L137:
	cmp	x11, x4
	bls	.L800
	add	x2, x4, 1
	add	x2, x7, x2
	.p2align 3,,7
.L147:
	ubfiz	x3, x3, 1, 14
	mov	x15, x6
	and	x16, x6, 255
	mov	x1, x2
	ldr	x6, [x2]
	ldrsh	w10, [x23, x3]
	strh	w4, [x23, x3]
	sxtw	x3, w10
	cmp	w10, w9
	ble	.L146
	ldr	w18, [x7, w10, sxtw]
	add	x10, x7, x3
	cmp	w18, w15
	beq	.L748
.L146:
	ldr	w10, [x24, x16, lsl 2]
	mul	x3, x6, x8
	add	x4, x4, 1
	add	x2, x2, 1
	and	x15, x10, 65535
	add	w10, w19, w10, lsr 16
	lsr	x3, x3, 50
	lsl	x15, x15, x19
	and	w16, w10, 56
	orr	x0, x15, x0
	ubfx	x15, x10, 3, 3
	str	x0, [x20]
	orr	w13, w13, w10
	and	w19, w10, 7
	add	x20, x20, x15
	lsr	x0, x0, x16
	cmp	x11, x4
	bhi	.L147
.L749:
	mov	x18, x14
	orr	w13, w13, w19
	mov	x27, x1
.L135:
	sub	x1, x22, x27
	str	x0, [x20]
	cmp	x1, 3
	bls	.L503
	sub	x1, x1, #4
	lsr	x2, x1, 2
	add	x9, x2, 1
	add	x9, x27, x9, lsl 2
	.p2align 3,,7
.L164:
	ldrb	w7, [x27]
	add	x27, x27, 4
	ldrb	w4, [x27, -3]
	ldrb	w3, [x27, -2]
	ldrb	w6, [x27, -1]
	ldr	w7, [x24, x7, lsl 2]
	ldr	w4, [x24, x4, lsl 2]
	ldr	w3, [x24, x3, lsl 2]
	and	x10, x7, 65535
	ldr	w6, [x24, x6, lsl 2]
	add	w7, w19, w7, lsr 16
	add	w12, w7, w4, lsr 16
	and	x4, x4, 65535
	add	w11, w12, w3, lsr 16
	and	x8, x6, 65535
	and	x3, x3, 65535
	lsl	x10, x10, x19
	lsl	x4, x4, x7
	orr	x4, x4, x10
	lsl	x3, x3, x12
	add	w6, w11, w6, lsr 16
	lsl	x7, x8, x11
	orr	x3, x3, x7
	orr	x3, x3, x4
	and	w4, w6, 56
	orr	x0, x3, x0
	ubfx	x3, x6, 3, 3
	str	x0, [x20]
	orr	w13, w13, w6
	and	w19, w6, 7
	add	x20, x20, x3
	lsr	x0, x0, x4
	cmp	x27, x9
	bne	.L164
	sub	x1, x1, x2, lsl 2
.L163:
	cbz	x1, .L165
	add	x22, x9, x1
.L166:
	ldrb	w1, [x9], 1
	ldr	w1, [x24, x1, lsl 2]
	and	x2, x1, 65535
	add	w1, w19, w1, lsr 16
	lsl	x2, x2, x19
	and	w3, w1, 56
	orr	x0, x2, x0
	ubfx	x2, x1, 3, 3
	str	x0, [x20]
	orr	w13, w13, w1
	and	w19, w1, 7
	add	x20, x20, x2
	lsr	x0, x0, x3
	cmp	x9, x22
	bne	.L166
.L165:
	ldrb	w1, [x5, 1536]
	ldr	w2, [x5, 1024]
	add	w1, w1, w19
	orr	w13, w1, w13
	lsl	x2, x2, x19
	orr	x2, x2, x0
	str	x2, [x20]
	cmp	w13, 63
	bls	.L755
	mov	x0, 0
	b	.L801
.L764:
	bl	memcpy
	mov	x18, x0
	add	x2, x21, x26
	ldr	w0, [x21, 32]
	add	x2, x2, 4096
	mov	x1, 32768
	uxtw	x9, w0
	sub	x4, x1, x9
	ldrb	w2, [x2, 1220]
	cmp	x25, x4
	str	wzr, [x21, 1124]
	mrs	x4, tpidr_el0
	and	w2, w2, w28
	bcs	.L802
	add	x4, x4, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x4, x4, #:tprel_lo12_nc:.LANCHOR1
	ldr	w5, [x21, 36]
	sub	w6, w0, #1
	add	w0, w0, w25
	str	w0, [x21, 32]
	sub	x3, x27, x9
	str	w6, [x4]
	cmp	w5, 12
	bls	.L803
.L55:
	cmp	x25, 9
	mov	x0, 9
	csel	x0, x25, x0, cs
	sub	x0, x0, #9
	add	x11, x0, x9
	cmp	x11, x9
	bls	.L490
	cmp	x25, 12
	mov	x10, 12
	csel	x10, x25, x10, cs
	adrp	x25, .LANCHOR0
	add	x25, x25, :lo12:.LANCHOR0
	add	x0, x27, x0
	add	x1, x25, 464
	sub	x10, x10, #12
	mov	x4, 2264924160
	add	x10, x10, x9
	movk	x4, 0xebca, lsl 32
	add	x26, x0, 1
	add	x5, x21, 2420
	stp	x0, x1, [sp, 96]
	add	x1, x25, 720
	mov	w15, 0
	movk	x4, 0xb185, lsl 48
	str	x1, [sp, 112]
	add	x1, x25, 432
	str	x1, [sp, 120]
.L58:
	ldr	x13, [x3, x9]
	mul	x16, x13, x4
	lsr	x16, x16, 50
	cmp	x10, x9
	bls	.L59
	add	x14, x9, 2
	add	x27, x9, 3
	add	x1, x3, x14
	add	x28, x9, 1
	mov	w8, w16
	.p2align 3,,7
.L66:
	ubfiz	x8, x8, 1, 14
	mov	x7, x1
	ldr	x12, [x1, -1]
	mov	w17, w13
	ldrsh	x0, [x23, x8]
	strh	w9, [x23, x8]
	cmp	w0, w6
	ble	.L60
	ldr	w8, [x3, w0, sxtw]
	add	x16, x3, x0
	cmp	w8, w13
	beq	.L61
.L60:
	add	x0, x21, w17, uxtb 2
	mul	x8, x12, x4
	add	x0, x0, 65536
	and	x17, x17, 255
	lsr	x8, x8, 50
	ldr	w13, [x0, 2496]
	ldr	w16, [x24, x17, lsl 2]
	add	w13, w13, 1
	str	w13, [x0, 2496]
	and	x13, x16, 65535
	ldrsh	x0, [x23, x8, lsl 1]
	strh	w28, [x23, x8, lsl 1]
	lsl	x8, x13, x19
	ldr	x13, [x1]
	add	w19, w19, w16, lsr 16
	orr	x2, x2, x8
	cmp	w0, w6
	ble	.L62
	ldr	w8, [x3, w0, sxtw]
	add	x16, x3, x0
	cmp	w8, w12
	beq	.L804
.L62:
	add	x8, x21, w12, uxtb 2
	and	x0, x12, 255
	add	x8, x8, 65536
	mul	x7, x13, x4
	add	x17, x1, 1
	ldr	w12, [x24, x0, lsl 2]
	ldr	w0, [x8, 2496]
	lsr	x7, x7, 50
	add	w0, w0, 1
	str	w0, [x8, 2496]
	and	x8, x12, 65535
	ldrsh	x0, [x23, x7, lsl 1]
	strh	w14, [x23, x7, lsl 1]
	lsl	x7, x8, x19
	add	w19, w19, w12, lsr 16
	orr	x2, x2, x7
	ldr	x7, [x1, 1]
	cmp	w0, w6
	ble	.L64
	ldr	w8, [x3, w0, sxtw]
	add	x16, x3, x0
	cmp	w8, w13
	beq	.L805
.L64:
	add	x12, x21, w13, uxtb 2
	and	x0, x13, 255
	add	x12, x12, 65536
	mul	x8, x7, x4
	add	x9, x9, 4
	ldr	w13, [x24, x0, lsl 2]
	ldr	w0, [x12, 2496]
	lsr	x8, x8, 50
	add	w0, w0, 1
	str	w0, [x12, 2496]
	and	x12, x13, 65535
	ldrsh	x0, [x23, x8, lsl 1]
	strh	w27, [x23, x8, lsl 1]
	lsl	x8, x12, x19
	add	w19, w19, w13, lsr 16
	orr	x2, x2, x8
	ldr	x13, [x1, 2]
	cmp	w0, w6
	ble	.L65
	ldr	w8, [x3, w0, sxtw]
	add	x16, x3, x0
	cmp	w8, w7
	beq	.L806
.L65:
	and	x0, x7, 255
	add	x7, x21, w7, uxtb 2
	add	x7, x7, 65536
	mul	x8, x13, x4
	add	x27, x27, 4
	add	x14, x14, 4
	ldr	w0, [x24, x0, lsl 2]
	add	x1, x1, 4
	ldr	w16, [x7, 2496]
	add	x28, x28, 4
	and	x12, x0, 65535
	lsr	x8, x8, 50
	add	w0, w19, w0, lsr 16
	add	w16, w16, 1
	lsl	x12, x12, x19
	orr	x12, x12, x2
	and	w2, w0, 56
	str	w16, [x7, 2496]
	ubfx	x7, x0, 3, 3
	str	x12, [x20]
	orr	w15, w15, w0
	and	w19, w0, 7
	add	x20, x20, x7
	lsr	x2, x12, x2
	cmp	x10, x9
	bhi	.L66
	mov	w16, w8
.L59:
	cmp	x11, x9
	bls	.L807
	add	x7, x9, 1
	mov	w0, w16
	add	x7, x3, x7
	.p2align 3,,7
.L69:
	ubfiz	x0, x0, 1, 14
	add	x14, x21, w13, uxtb 2
	mov	x12, x13
	and	x17, x13, 255
	ldr	x13, [x7]
	mov	x1, x7
	ldrsh	x8, [x23, x0]
	add	x14, x14, 65536
	strh	w9, [x23, x0]
	cmp	w8, w6
	ble	.L68
	ldr	w0, [x3, w8, sxtw]
	add	x16, x3, x8
	cmp	w0, w12
	beq	.L746
.L68:
	ldr	w8, [x24, x17, lsl 2]
	mul	x0, x13, x4
	ldr	w16, [x14, 2496]
	add	x9, x9, 1
	and	x12, x8, 65535
	add	x7, x7, 1
	add	w8, w19, w8, lsr 16
	add	w16, w16, 1
	lsl	x12, x12, x19
	orr	x2, x12, x2
	str	w16, [x14, 2496]
	and	w14, w8, 56
	ubfx	x12, x8, 3, 3
	str	x2, [x20]
	orr	w15, w15, w8
	and	w19, w8, 7
	lsr	x0, x0, 50
	add	x20, x20, x12
	lsr	x2, x2, x14
	cmp	x11, x9
	bhi	.L69
.L713:
	orr	w15, w15, w19
	mov	x27, x1
.L57:
	sub	x0, x22, x27
	str	x2, [x20]
	cmp	x0, 3
	bls	.L493
	sub	x0, x0, #4
	lsr	x1, x0, 2
	add	x7, x1, 1
	add	x7, x27, x7, lsl 2
	.p2align 3,,7
.L86:
	ldrb	w3, [x27]
	add	x27, x27, 4
	ldrb	w9, [x27, -3]
	ldrb	w13, [x27, -2]
	add	x6, x21, x3, lsl 2
	ldrb	w12, [x27, -1]
	add	x6, x6, 65536
	add	x4, x21, x9, lsl 2
	add	x4, x4, 65536
	ldr	w3, [x24, x3, lsl 2]
	add	x11, x21, x13, lsl 2
	add	x10, x21, x12, lsl 2
	ldr	w8, [x6, 2496]
	add	x11, x11, 65536
	add	w14, w19, w3, lsr 16
	and	x3, x3, 65535
	add	w8, w8, 1
	str	w8, [x6, 2496]
	add	x10, x10, 65536
	ldr	w6, [x4, 2496]
	ldr	w9, [x24, x9, lsl 2]
	add	w6, w6, 1
	str	w6, [x4, 2496]
	lsl	x4, x3, x19
	and	x6, x9, 65535
	ldr	w3, [x11, 2496]
	add	w9, w14, w9, lsr 16
	ldr	w8, [x24, x13, lsl 2]
	lsl	x6, x6, x14
	add	w3, w3, 1
	str	w3, [x11, 2496]
	orr	x6, x6, x4
	and	x3, x8, 65535
	ldr	w4, [x24, x12, lsl 2]
	add	w8, w9, w8, lsr 16
	ldr	w11, [x10, 2496]
	lsl	x3, x3, x9
	and	x12, x4, 65535
	add	w4, w8, w4, lsr 16
	add	w9, w11, 1
	lsl	x8, x12, x8
	orr	x3, x3, x8
	orr	x3, x3, x6
	and	w6, w4, 56
	orr	x2, x3, x2
	str	w9, [x10, 2496]
	ubfx	x3, x4, 3, 3
	str	x2, [x20]
	orr	w15, w15, w4
	and	w19, w4, 7
	add	x20, x20, x3
	lsr	x2, x2, x6
	cmp	x27, x7
	bne	.L86
	sub	x0, x0, x1, lsl 2
.L85:
	cbz	x0, .L87
	add	x22, x7, x0
.L88:
	ldrb	w0, [x7], 1
	add	x3, x21, x0, lsl 2
	add	x3, x3, 65536
	ldr	w0, [x24, x0, lsl 2]
	and	x1, x0, 65535
	ldr	w4, [x3, 2496]
	add	w0, w19, w0, lsr 16
	lsl	x1, x1, x19
	and	w6, w0, 56
	orr	x1, x1, x2
	add	w4, w4, 1
	str	w4, [x3, 2496]
	ubfx	x3, x0, 3, 3
	str	x1, [x20]
	orr	w15, w15, w0
	and	w19, w0, 7
	add	x20, x20, x3
	lsr	x2, x1, x6
	cmp	x7, x22
	bne	.L88
	b	.L87
.L773:
	mrs	x4, tpidr_el0
	cmp	x25, x2
	add	x4, x4, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x4, x4, #:tprel_lo12_nc:.LANCHOR1
	add	x0, x21, 73728
	mov	w5, -32768
	csel	x2, x25, x2, ls
	add	x0, x0, 352
	mov	w16, w5
	mov	x6, x27
	mov	x1, 131072
	str	w5, [x4]
	str	w2, [x21, 32]
	b	.L417
.L738:
	ldr	x18, [sp, 136]
.L286:
	ldr	w0, [x5, 1024]
	ldrb	w1, [x5, 1536]
	lsl	x0, x0, x19
	orr	x3, x0, x3
	str	x3, [x20]
	tbnz	w9, #31, .L128
.L488:
	add	w1, w1, w19
	ands	w2, w1, 7
	lsr	w0, w1, 3
	lsr	w4, w1, 3
	add	x0, x20, x0
	beq	.L484
	and	w1, w1, -8
	lsr	x3, x3, x1
	strb	w3, [x20, w4, uxtw]
.L484:
	sub	x0, x0, x18
	uxtw	x1, w2
	ldp	x19, x20, [sp, 16]
	add	x0, x1, x0, lsl 3
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L774:
	.cfi_restore_state
	sub	w30, w15, #4
	cmp	w30, 31
	bls	.L544
	ldr	x11, [x18, 4]
	ldr	x14, [x27, 4]
	cmp	x11, x14
	bne	.L434
	ldr	x11, [x18, 12]
	ldr	x12, [x27, 12]
	cmp	x11, x12
	beq	.L435
	eor	x12, x11, x12
	mov	w11, 12
.L436:
	rbit	x12, x12
	clz	x12, x12
	lsr	w12, w12, 3
	add	w12, w11, w12
	mov	x11, x12
.L441:
	cmp	w2, w4
	ccmp	w24, w11, 0, lt
	bls	.L444
	ldr	w2, [x6, w4, sxtw]
	add	x4, x6, w4, sxtw
	cmp	w17, w2
	beq	.L808
.L444:
	sub	w4, w27, w18
	add	x2, x27, x12
	sub	w14, w11, #1
	uxtw	x15, w11
.L468:
	mov	w0, 256
	sub	w24, w0, w4
	ldr	x0, [sp, 104]
	lsr	w24, w24, 29
	sub	w18, w4, #1
	add	x17, x21, x15
	add	x15, x21, x15, lsl 2
	add	x17, x17, 4096
	lsr	w18, w18, w24
	add	x12, x27, 1
	add	w11, w11, 4
	ldrb	w25, [x0, w18, uxtw]
	sub	x18, x22, x12
	ldr	w15, [x15, 4020]
	ldr	x0, [sp, 120]
	lsl	x15, x15, x19
	orr	x15, x15, x3
	add	w3, w25, w24, lsl 1
	ldrb	w17, [x17, 960]
	add	x24, x5, x3
	add	x25, x3, 288
	add	w17, w17, w19
	ldrb	w19, [x0, w3, uxtw]
	ldr	x0, [sp, 112]
	ldrb	w24, [x24, 1568]
	ldr	w25, [x5, x25, lsl 2]
	ldr	w3, [x0, x3, lsl 2]
	sub	w3, w4, w3
	add	w4, w24, w17
	add	w19, w19, w4
	lsl	x25, x25, x17
	lsl	x3, x3, x4
	orr	x3, x3, x25
	and	w4, w19, -8
	orr	x3, x3, x15
	sub	w24, w24, #1
	lsr	w15, w19, 3
	str	x3, [x20]
	orr	w10, w10, w24
	lsr	x3, x3, x4
	and	w19, w19, 7
	add	x20, x20, x15
	sub	x4, x12, x6
	cmp	x11, x18
	bgt	.L469
	sub	w0, w4, #1
	mov	w11, 32767
	add	w0, w0, w14
	cmp	w0, w11
	bls	.L471
	mov	x0, x13
	.p2align 3,,7
.L472:
	ldp	q4, q3, [x0]
	ldp	q2, q1, [x0, 32]
	sqadd	v4.8h, v4.8h, v0.8h
	sqadd	v3.8h, v3.8h, v0.8h
	sqadd	v2.8h, v2.8h, v0.8h
	sqadd	v1.8h, v1.8h, v0.8h
	stp	q4, q3, [x0]
	stp	q2, q1, [x0, 32]
	add	x0, x0, 64
	cmp	x0, x7
	bne	.L472
	add	x6, x6, 32768
	sub	w4, w4, #32768
.L471:
	add	w14, w14, 1
	sub	w11, w4, w12
	add	x14, x27, x14
	b	.L473
	.p2align 2,,3
.L809:
	uxtw	x1, w0
.L473:
	lsl	x1, x1, 2
	add	w15, w11, w12
	add	x4, x21, x1
	ldr	w0, [x12, 1]!
	add	x4, x4, 73728
	add	x1, x9, x1
	ldrsh	w17, [x4, 352]
	mul	w0, w0, w8
	strh	w17, [x1, 2]
	strh	w15, [x4, 352]
	lsr	w0, w0, 17
	cmp	x12, x14
	bne	.L809
	ubfiz	x1, x0, 2, 15
	prfm	PSTL1KEEP, [x13, x1]
	str	w0, [sp, 96]
.L469:
	mov	w12, 0
	cmp	x2, x22
	bne	.L479
.L744:
	ldr	x18, [sp, 128]
.L425:
	ldr	w0, [x5, 1024]
	ldrb	w1, [x5, 1536]
	lsl	x0, x0, x19
	orr	x3, x0, x3
	str	x3, [x20]
	tbz	w10, #31, .L488
	mov	x0, 0
	b	.L801
	.p2align 2,,3
.L790:
	sub	w26, w15, #4
	cmp	w26, 31
	bls	.L522
	ldr	x11, [x18, 4]
	ldr	x10, [x27, 4]
	cmp	x11, x10
	bne	.L295
	ldr	x11, [x18, 12]
	ldr	x10, [x27, 12]
	cmp	x11, x10
	beq	.L296
	eor	x10, x11, x10
	mov	w11, 12
.L297:
	rbit	x10, x10
	clz	x10, x10
	lsr	w10, w10, 3
	add	w10, w11, w10
	mov	x11, x10
.L302:
	cmp	w2, w13
	ccmp	w23, w11, 0, lt
	bls	.L305
	ldr	w2, [x4, w13, sxtw]
	add	x13, x4, w13, sxtw
	cmp	w17, w2
	beq	.L810
.L305:
	sub	w14, w27, w18
	add	x10, x27, x10
	sub	w2, w11, #1
	uxtw	x13, w11
.L329:
	ldr	x18, [sp, 128]
	mov	w15, 256
	sub	w26, w15, w14
	add	x15, x21, x13
	add	x15, x15, 4096
	add	x23, x21, x13, lsl 2
	sub	w17, w14, #1
	ldrb	w13, [x18, x13]
	ldr	x18, [sp, 104]
	lsr	w26, w26, 29
	ldrb	w15, [x15, 960]
	add	x13, x21, x13, lsl 2
	lsr	w17, w17, w26
	add	x13, x13, 65536
	add	w11, w11, 4
	ldrb	w18, [x18, w17, uxtw]
	add	w17, w15, w19
	ldr	w15, [x23, 4020]
	add	w18, w18, w26, lsl 1
	lsl	x15, x15, x19
	orr	x15, x15, x3
	ldr	x3, [sp, 120]
	add	x23, x5, x18
	add	x25, x21, x18, lsl 2
	ldrb	w19, [x3, w18, uxtw]
	ldr	x3, [sp, 112]
	ldrb	w23, [x23, 1568]
	ldr	w3, [x3, x18, lsl 2]
	add	x18, x25, 65536
	ldr	w25, [x25, 3572]
	sub	w3, w14, w3
	add	w14, w23, w17
	add	w19, w19, w14
	sub	w23, w23, #1
	lsl	x25, x25, x17
	orr	w9, w9, w23
	lsl	x3, x3, x14
	orr	x3, x3, x25
	orr	x3, x3, x15
	str	x3, [x20]
	lsr	w17, w19, 3
	and	w23, w19, -8
	ldr	w25, [x13, 3524]
	add	x20, x20, x17
	add	x14, x27, 1
	and	w19, w19, 7
	add	w17, w25, 1
	str	w17, [x13, 3524]
	sub	x15, x22, x14
	sub	x13, x14, x4
	ldr	w17, [x18, 3648]
	lsr	x3, x3, x23
	add	w17, w17, 1
	str	w17, [x18, 3648]
	cmp	x11, x15
	bgt	.L330
	sub	w0, w13, #1
	mov	w11, 32767
	add	w0, w0, w2
	cmp	w0, w11
	bls	.L332
	mov	x0, x12
	.p2align 3,,7
.L333:
	ldp	q4, q3, [x0]
	ldp	q2, q1, [x0, 32]
	sqadd	v4.8h, v4.8h, v0.8h
	sqadd	v3.8h, v3.8h, v0.8h
	sqadd	v2.8h, v2.8h, v0.8h
	sqadd	v1.8h, v1.8h, v0.8h
	stp	q4, q3, [x0]
	stp	q2, q1, [x0, 32]
	add	x0, x0, 64
	cmp	x0, x6
	bne	.L333
	add	x4, x4, 32768
	sub	w13, w13, #32768
.L332:
	add	w2, w2, 1
	sub	w13, w13, w14
	add	x2, x27, x2
	mov	x0, x1
	b	.L334
	.p2align 2,,3
.L811:
	uxtw	x0, w1
.L334:
	lsl	x0, x0, 2
	add	w15, w13, w14
	add	x11, x21, x0
	ldr	w1, [x14, 1]!
	add	x11, x11, 73728
	add	x0, x8, x0
	ldrsh	w17, [x11, 352]
	mul	w1, w1, w7
	strh	w17, [x0, 2]
	strh	w15, [x11, 352]
	lsr	w1, w1, 17
	cmp	x14, x2
	bne	.L811
	mov	w0, w1
	ubfiz	x1, x0, 2, 15
	prfm	PSTL1KEEP, [x12, x1]
.L330:
	mov	w11, 0
	b	.L335
	.p2align 2,,3
.L434:
	eor	x12, x11, x14
	mov	w11, 4
	b	.L436
	.p2align 2,,3
.L777:
	mov	w15, w1
	cmp	w1, 4
	bls	.L812
	cmp	w1, w23
	csel	w24, w1, w23, ls
	b	.L421
	.p2align 2,,3
.L775:
	sub	w2, w15, #4
	cmp	w2, 31
	bls	.L548
	ldr	x2, [x4, 4]
	ldr	x11, [x27, 4]
	cmp	x2, x11
	bne	.L457
	ldr	x2, [x4, 12]
	ldr	x11, [x27, 12]
	cmp	x2, x11
	beq	.L458
	eor	x2, x2, x11
	mov	w11, 12
.L459:
	rbit	x2, x2
	sub	w4, w27, w4
	clz	x2, x2
	lsr	w2, w2, 3
	add	w15, w11, w2
	mov	x11, x15
	sub	w14, w15, #1
	add	x2, x27, x15
	b	.L468
	.p2align 2,,3
.L776:
	cmp	x2, x22
	beq	.L744
	mov	x1, x2
	b	.L475
	.p2align 2,,3
.L478:
	add	x1, x1, 1
	cmp	x1, x22
	beq	.L477
.L475:
	ldrb	w0, [x1]
	ldrb	w0, [x28, w0, sxtw]
	tst	x0, 3
	bne	.L478
.L477:
	sub	x1, x1, x2
	cmp	x1, 15
	ble	.L479
	sub	x4, x1, #4
	mov	x15, x2
	and	x17, x4, -4
	str	x2, [sp, 136]
	add	x30, x17, 5
	lsr	x4, x4, 2
	add	x30, x27, x30
	str	w12, [sp, 144]
	.p2align 3,,7
.L480:
	ldrb	w24, [x15]
	add	x15, x15, 4
	ldrb	w14, [x15, -3]
	add	x12, x5, x24
	ldrb	w2, [x15, -2]
	add	x18, x5, x14
	ldrb	w0, [x15, -1]
	ldr	w25, [x5, x24, lsl 2]
	add	x11, x5, x2
	ldrb	w12, [x12, 1280]
	ldrb	w24, [x18, 1280]
	add	x18, x5, x0
	add	w27, w12, w19
	ldr	w2, [x5, x2, lsl 2]
	ldrb	w11, [x11, 1280]
	lsl	x25, x25, x19
	ldr	w19, [x5, x0, lsl 2]
	add	w0, w27, w24
	ldr	w14, [x5, x14, lsl 2]
	sub	w12, w12, #1
	lsl	x2, x2, x0
	add	w0, w0, w11
	ldrb	w18, [x18, 1280]
	sub	w11, w11, #1
	lsl	x19, x19, x0
	orr	x2, x2, x19
	lsl	x14, x14, x27
	orr	x14, x25, x14
	add	w0, w0, w18
	orr	x14, x14, x2
	sub	w24, w24, #1
	sub	w18, w18, #1
	orr	x14, x14, x3
	orr	w2, w11, w18
	orr	w12, w12, w24
	and	w3, w0, -8
	orr	w2, w2, w12
	lsr	w11, w0, 3
	str	x14, [x20]
	orr	w10, w10, w2
	and	w19, w0, 7
	add	x20, x20, x11
	lsr	x3, x14, x3
	cmp	x15, x30
	bne	.L480
	ldr	x2, [sp, 136]
	add	x4, x4, 1
	sub	x1, x1, x17
	ldr	w12, [sp, 144]
	subs	x1, x1, #4
	add	x2, x2, x4, lsl 2
	mov	x11, x2
	beq	.L481
	add	x2, x2, x1
.L482:
	ldrb	w0, [x11], 1
	add	x1, x5, x0
	ldr	w0, [x5, x0, lsl 2]
	ldrb	w1, [x1, 1280]
	add	w4, w1, w19
	lsl	x0, x0, x19
	orr	x0, x0, x3
	and	w3, w4, -8
	sub	w1, w1, #1
	lsr	w14, w4, 3
	str	x0, [x20]
	orr	w10, w10, w1
	and	w19, w4, 7
	add	x20, x20, x14
	lsr	x3, x0, x3
	cmp	x11, x2
	bne	.L482
.L481:
	sub	x1, x22, x2
	cmp	x1, 3
	ble	.L474
	ldr	w0, [x2]
	mov	w1, 42941
	movk	w1, 0x1e35, lsl 16
	mul	w0, w0, w1
	lsr	w0, w0, 17
	str	w0, [sp, 96]
	b	.L474
	.p2align 2,,3
.L295:
	eor	x10, x11, x10
	mov	w11, 4
	b	.L297
	.p2align 2,,3
.L435:
	ldr	x11, [x18, 20]
	ldr	x12, [x27, 20]
	cmp	x11, x12
	beq	.L437
	eor	x12, x11, x12
	mov	w11, 20
	b	.L436
	.p2align 2,,3
.L808:
	sub	x2, x12, #3
	ldr	w14, [x4, x2]
	ldr	w2, [x27, x2]
	cmp	w14, w2
	bne	.L444
	cmp	w30, 31
	bls	.L546
	ldr	x2, [x4, 4]
	ldr	x14, [x27, 4]
	cmp	x2, x14
	bne	.L446
	ldr	x2, [x4, 12]
	ldr	x14, [x27, 12]
	cmp	x2, x14
	beq	.L447
	eor	x2, x2, x14
	mov	w17, 12
.L448:
	rbit	x2, x2
	clz	x2, x2
	lsr	w2, w2, 3
	add	w17, w17, w2
.L452:
	cmp	w11, w17
	bcs	.L444
	uxtw	x15, w17
	sub	w4, w27, w4
	add	x2, x27, x15
	sub	w14, w17, #1
	mov	w11, w17
	b	.L468
	.p2align 2,,3
.L791:
	sub	w2, w15, #4
	cmp	w2, 31
	bls	.L526
	ldr	x2, [x13, 4]
	ldr	x10, [x27, 4]
	cmp	x2, x10
	bne	.L318
	ldr	x2, [x13, 12]
	ldr	x10, [x27, 12]
	cmp	x2, x10
	bne	.L813
	ldr	x2, [x13, 20]
	ldr	x10, [x27, 20]
	cmp	x2, x10
	beq	.L321
	eor	x2, x2, x10
	mov	w11, 20
	b	.L320
	.p2align 2,,3
.L457:
	eor	x2, x2, x11
	mov	w11, 4
	b	.L459
	.p2align 2,,3
.L792:
	cmp	x10, x22
	beq	.L738
	mov	x1, x10
	b	.L336
	.p2align 2,,3
.L339:
	add	x1, x1, 1
	cmp	x1, x22
	beq	.L338
.L336:
	ldrb	w2, [x1]
	ldrb	w2, [x28, w2, sxtw]
	tst	x2, 3
	bne	.L339
.L338:
	sub	x13, x1, x10
	cmp	x13, 15
	ble	.L340
	sub	x14, x13, #4
	mov	x2, x10
	and	x1, x14, -4
	str	x4, [sp, 96]
	add	x15, x1, 5
	lsr	x14, x14, 2
	add	x27, x27, x15
	str	x10, [sp, 144]
	str	w11, [sp, 152]
	.p2align 3,,7
.L341:
	ldrb	w4, [x2]
	add	x2, x2, 4
	ldrb	w15, [x2, -3]
	add	x17, x5, x4
	ldrb	w11, [x2, -2]
	add	x4, x21, x4, lsl 2
	add	x10, x5, x15
	add	x25, x4, 65536
	add	x15, x21, x15, lsl 2
	add	x18, x15, 65536
	ldrb	w17, [x17, 1280]
	ldr	w23, [x4, 2420]
	add	x26, x21, x11, lsl 2
	ldr	w4, [x25, 2496]
	add	x11, x5, x11
	add	w4, w4, 1
	str	w4, [x25, 2496]
	lsl	x23, x23, x19
	add	w4, w17, w19
	ldr	w19, [x18, 2496]
	add	x25, x26, 65536
	ldr	w15, [x15, 2420]
	sub	w17, w17, #1
	ldrb	w10, [x10, 1280]
	add	w19, w19, 1
	str	w19, [x18, 2496]
	ldrb	w18, [x2, -1]
	lsl	x15, x15, x4
	orr	x15, x15, x23
	ldr	w23, [x26, 2420]
	ldr	w26, [x25, 2496]
	add	w19, w4, w10
	add	x4, x21, x18, lsl 2
	ldrb	w11, [x11, 1280]
	add	w26, w26, 1
	str	w26, [x25, 2496]
	add	x18, x5, x18
	add	x25, x4, 65536
	ldr	w4, [x4, 2420]
	add	w26, w19, w11
	sub	w10, w10, #1
	lsl	x23, x23, x19
	ldrb	w18, [x18, 1280]
	orr	w10, w17, w10
	lsl	x4, x4, x26
	ldr	w17, [x25, 2496]
	orr	x4, x4, x23
	add	w19, w26, w18
	sub	w11, w11, #1
	sub	w18, w18, #1
	orr	x4, x4, x15
	orr	w11, w11, w18
	orr	x4, x4, x3
	add	w17, w17, 1
	and	w3, w19, -8
	str	w17, [x25, 2496]
	orr	w10, w10, w11
	lsr	w11, w19, 3
	str	x4, [x20]
	orr	w9, w9, w10
	and	w19, w19, 7
	add	x20, x20, x11
	lsr	x3, x4, x3
	cmp	x2, x27
	bne	.L341
	ldr	x10, [sp, 144]
	add	x14, x14, 1
	sub	x13, x13, x1
	ldr	w11, [sp, 152]
	ldr	x4, [sp, 96]
	add	x10, x10, x14, lsl 2
	subs	x13, x13, #4
	mov	x14, x10
	beq	.L342
	add	x10, x10, x13
.L343:
	ldrb	w1, [x14], 1
	add	x2, x5, x1
	add	x1, x21, x1, lsl 2
	add	x17, x1, 65536
	ldrb	w2, [x2, 1280]
	ldr	w1, [x1, 2420]
	ldr	w15, [x17, 2496]
	add	w13, w2, w19
	sub	w2, w2, #1
	add	w15, w15, 1
	lsl	x1, x1, x19
	orr	x1, x1, x3
	and	w3, w13, -8
	str	w15, [x17, 2496]
	lsr	w15, w13, 3
	str	x1, [x20]
	orr	w9, w9, w2
	and	w19, w13, 7
	add	x20, x20, x15
	lsr	x3, x1, x3
	cmp	x14, x10
	bne	.L343
.L342:
	sub	x1, x22, x10
	cmp	x1, 3
	ble	.L335
	ldr	w0, [x10]
	mov	w1, 42941
	movk	w1, 0x1e35, lsl 16
	mul	w0, w0, w1
	lsr	w0, w0, 17
	b	.L335
	.p2align 2,,3
.L772:
	bl	memcpy
	mov	x18, x0
	add	x0, x21, x26
	ldr	w2, [x21, 32]
	add	x0, x0, 4096
	mov	x1, 32768
	uxtw	x6, w2
	sub	x4, x1, x6
	ldrb	w0, [x0, 1220]
	str	wzr, [x21, 1124]
	and	w3, w0, w28
	cmp	x25, x4
	bcs	.L814
	mrs	x0, tpidr_el0
	ldr	w4, [x21, 36]
	add	x0, x0, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x0, x0, #:tprel_lo12_nc:.LANCHOR1
	add	w25, w2, w25
	sub	w14, w2, #1
	str	w25, [x21, 32]
	sub	x6, x27, x6
	str	w14, [x0]
	cmp	w4, 12
	bls	.L815
.L349:
	cmp	x27, x22
	beq	.L420
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	add	x1, x0, 848
	str	x1, [sp, 128]
	add	x1, x0, 464
	ldr	w24, [sp, 96]
	add	x13, x21, 73728
	str	x1, [sp, 104]
	add	x1, x0, 720
	add	x13, x13, 352
	add	x0, x0, 432
	add	x7, x21, 204800
	mov	w8, 42941
	str	x18, [sp, 96]
	stp	x1, x0, [sp, 112]
	sub	x1, x22, x27
	add	x5, x21, 2420
	movi	v0.8h, 0x80, lsl 8
	add	x7, x7, 352
	sxth	w25, w14
	mov	x9, x13
	mov	w23, w24
	mov	w12, 0
	mov	w10, 0
	mov	w30, -32767
	movk	w8, 0x1e35, lsl 16
	mov	w0, 0
	mov	w16, 258
	cmp	x1, 257
	bls	.L816
	.p2align 3,,7
.L352:
	sub	x4, x27, x6
	mov	w2, w4
	cmp	w4, 32768
	beq	.L357
.L821:
	add	w1, w4, w30
	sxth	w4, w4
.L358:
	ldr	w15, [x27, 1]
	ubfiz	x18, x0, 2, 32
	cmp	w14, w1
	add	x11, x21, x18
	add	x11, x11, 73728
	sub	w2, w2, #32768
	ldr	w17, [x27]
	mul	w0, w15, w8
	sxth	w2, w2
	ldrsh	w15, [x11, 352]
	csel	w2, w25, w2, ge
	lsr	w1, w0, 19
	lsr	w0, w0, 19
	add	x26, x13, x1, lsl 2
	prfm	PSTL1KEEP, [x26]
	strh	w4, [x11, 352]
	cmp	w15, w2
	ble	.L362
	add	x4, x9, x18
	ldr	w26, [x6, w15, sxtw]
	add	x18, x6, w15, sxtw
	ldrsh	w11, [x4, 2]
	strh	w15, [x4, 2]
	cmp	w17, w26
	beq	.L817
	cmp	w2, w11
	bge	.L362
	ldr	w2, [x6, w11, sxtw]
	add	x11, x6, w11, sxtw
	cmp	w17, w2
	beq	.L818
.L362:
	mov	x4, x27
	add	w12, w12, 1
	ldrb	w1, [x4], 1
	add	x2, x5, x1
	ldr	w1, [x5, x1, lsl 2]
	ldrb	w2, [x2, 1280]
	add	w11, w2, w19
	lsl	x1, x1, x19
	orr	x1, x1, x3
	and	w3, w11, -8
	sub	w2, w2, #1
	lsr	w15, w11, 3
	str	x1, [x20]
	orr	w10, w10, w2
	and	w19, w11, 7
	add	x20, x20, x15
	lsr	x3, x1, x3
	tst	x12, 15
	beq	.L819
.L405:
	cmp	x4, x22
	beq	.L741
.L410:
	mov	x27, x4
	mov	w23, w24
	sub	x1, x22, x27
	mov	w16, 258
	cmp	x1, 257
	bhi	.L352
.L816:
	mov	w16, w1
	cmp	w1, 4
	bls	.L820
	cmp	w1, w24
	sub	x4, x27, x6
	csel	w23, w1, w24, ls
	mov	w2, w4
	cmp	w4, 32768
	bne	.L821
	.p2align 3,,7
.L357:
	mov	x1, x13
	.p2align 3,,7
.L359:
	ldp	q4, q3, [x1]
	ldp	q2, q1, [x1, 32]
	sqadd	v4.8h, v4.8h, v0.8h
	sqadd	v3.8h, v3.8h, v0.8h
	sqadd	v2.8h, v2.8h, v0.8h
	sqadd	v1.8h, v1.8h, v0.8h
	stp	q4, q3, [x1]
	stp	q2, q1, [x1, 32]
	add	x1, x1, 64
	cmp	x1, x7
	bne	.L359
	add	x6, x6, 32768
	mov	w4, 0
	mov	w1, -32767
	mov	w2, 0
	b	.L358
.L741:
	ldr	x18, [sp, 96]
	b	.L425
	.p2align 2,,3
.L817:
	sub	w28, w16, #4
	cmp	w28, 31
	bls	.L533
	ldr	x12, [x18, 4]
	ldr	x4, [x27, 4]
	cmp	x12, x4
	bne	.L365
	ldr	x12, [x18, 12]
	ldr	x4, [x27, 12]
	cmp	x12, x4
	beq	.L366
	eor	x4, x12, x4
	mov	w12, 12
.L367:
	rbit	x4, x4
	clz	x4, x4
	lsr	w4, w4, 3
	add	w4, w12, w4
	mov	x12, x4
.L372:
	cmp	w2, w11
	ccmp	w23, w12, 0, lt
	bls	.L375
	ldr	w2, [x6, w11, sxtw]
	add	x11, x6, w11, sxtw
	cmp	w17, w2
	beq	.L822
.L375:
	sub	w11, w27, w18
	add	x4, x27, x4
	sub	w15, w12, #1
	uxtw	x16, w12
.L399:
	mov	w2, 256
	sub	w23, w2, w11
	ldr	x26, [sp, 104]
	lsr	w23, w23, 29
	sub	w18, w11, #1
	add	x17, x21, x16
	add	x16, x21, x16, lsl 2
	add	x17, x17, 4096
	lsr	w18, w18, w23
	add	x2, x27, 1
	ldr	x28, [sp, 120]
	add	w12, w12, 4
	ldrb	w26, [x26, w18, uxtw]
	sub	x18, x22, x2
	ldr	w16, [x16, 4020]
	ldrb	w17, [x17, 960]
	lsl	x16, x16, x19
	orr	x16, x16, x3
	add	w3, w26, w23, lsl 1
	add	w17, w17, w19
	add	x23, x5, x3
	add	x26, x3, 288
	ldrb	w19, [x28, w3, uxtw]
	ldr	x28, [sp, 112]
	ldrb	w23, [x23, 1568]
	ldr	w26, [x5, x26, lsl 2]
	ldr	w3, [x28, x3, lsl 2]
	sub	w3, w11, w3
	add	w11, w23, w17
	add	w19, w19, w11
	lsl	x26, x26, x17
	lsl	x3, x3, x11
	orr	x3, x3, x26
	and	w11, w19, -8
	orr	x3, x3, x16
	sub	w23, w23, #1
	lsr	w16, w19, 3
	str	x3, [x20]
	orr	w10, w10, w23
	lsr	x3, x3, x11
	and	w19, w19, 7
	add	x20, x20, x16
	sub	x11, x2, x6
	cmp	x12, x18
	bgt	.L400
	sub	w0, w11, #1
	mov	w12, 32767
	add	w0, w0, w15
	cmp	w0, w12
	bls	.L402
	mov	x0, x13
	.p2align 3,,7
.L403:
	ldp	q4, q3, [x0]
	ldp	q2, q1, [x0, 32]
	sqadd	v4.8h, v4.8h, v0.8h
	sqadd	v3.8h, v3.8h, v0.8h
	sqadd	v2.8h, v2.8h, v0.8h
	sqadd	v1.8h, v1.8h, v0.8h
	stp	q4, q3, [x0]
	stp	q2, q1, [x0, 32]
	add	x0, x0, 64
	cmp	x0, x7
	bne	.L403
	add	x6, x6, 32768
	sub	w11, w11, #32768
.L402:
	add	w15, w15, 1
	sub	w11, w11, w2
	add	x15, x27, x15
	mov	x0, x1
	b	.L404
	.p2align 2,,3
.L823:
	uxtw	x0, w1
.L404:
	lsl	x0, x0, 2
	add	w16, w11, w2
	add	x12, x21, x0
	ldr	w1, [x2, 1]!
	add	x12, x12, 73728
	add	x0, x9, x0
	ldrsh	w17, [x12, 352]
	mul	w1, w1, w8
	strh	w17, [x0, 2]
	strh	w16, [x12, 352]
	lsr	w1, w1, 19
	cmp	x2, x15
	bne	.L823
	mov	w0, w1
	ubfiz	x1, x0, 2, 13
	prfm	PSTL1KEEP, [x13, x1]
.L400:
	mov	w12, 0
	b	.L405
	.p2align 2,,3
.L365:
	eor	x4, x12, x4
	mov	w12, 4
	b	.L367
	.p2align 2,,3
.L818:
	sub	w2, w16, #4
	cmp	w2, 31
	bls	.L537
	ldr	x2, [x11, 4]
	ldr	x4, [x27, 4]
	cmp	x2, x4
	bne	.L388
	ldr	x2, [x11, 12]
	ldr	x4, [x27, 12]
	cmp	x2, x4
	bne	.L824
	ldr	x2, [x11, 20]
	ldr	x4, [x27, 20]
	cmp	x2, x4
	beq	.L391
	eor	x2, x2, x4
	mov	w12, 20
	b	.L390
	.p2align 2,,3
.L819:
	cmp	x4, x22
	beq	.L741
	ldr	x11, [sp, 128]
	mov	x1, x4
	b	.L406
	.p2align 2,,3
.L409:
	add	x1, x1, 1
	cmp	x1, x22
	beq	.L408
.L406:
	ldrb	w2, [x1]
	ldrb	w2, [x11, w2, sxtw]
	tst	x2, 3
	bne	.L409
.L408:
	sub	x1, x1, x4
	cmp	x1, 15
	ble	.L410
	sub	x11, x1, #4
	mov	x15, x4
	and	x2, x11, -4
	str	w12, [sp, 136]
	add	x28, x2, 5
	lsr	x16, x11, 2
	add	x28, x27, x28
	str	w0, [sp, 144]
	str	x6, [sp, 152]
	.p2align 3,,7
.L411:
	ldrb	w18, [x15]
	add	x15, x15, 4
	ldrb	w17, [x15, -3]
	add	x6, x5, x18
	ldrb	w23, [x15, -2]
	add	x11, x5, x17
	ldrb	w0, [x15, -1]
	ldr	w26, [x5, x18, lsl 2]
	add	x12, x5, x23
	ldrb	w6, [x6, 1280]
	add	x18, x5, x0
	ldrb	w11, [x11, 1280]
	add	w27, w6, w19
	ldr	w23, [x5, x23, lsl 2]
	ldrb	w12, [x12, 1280]
	lsl	x26, x26, x19
	sub	w19, w6, #1
	ldr	w6, [x5, x0, lsl 2]
	add	w0, w27, w11
	ldr	w17, [x5, x17, lsl 2]
	ldrb	w18, [x18, 1280]
	sub	w11, w11, #1
	lsl	x23, x23, x0
	add	w0, w0, w12
	lsl	x17, x17, x27
	orr	x17, x26, x17
	lsl	x6, x6, x0
	orr	x6, x23, x6
	add	w0, w0, w18
	sub	w12, w12, #1
	orr	x6, x17, x6
	sub	w18, w18, #1
	orr	x6, x6, x3
	orr	w11, w19, w11
	orr	w12, w12, w18
	and	w3, w0, -8
	orr	w11, w11, w12
	lsr	w12, w0, 3
	str	x6, [x20]
	orr	w10, w10, w11
	and	w19, w0, 7
	add	x20, x20, x12
	lsr	x3, x6, x3
	cmp	x15, x28
	bne	.L411
	add	x16, x16, 1
	sub	x1, x1, x2
	ldr	x6, [sp, 152]
	add	x4, x4, x16, lsl 2
	ldr	w12, [sp, 136]
	subs	x1, x1, #4
	ldr	w0, [sp, 144]
	mov	x15, x4
	beq	.L412
	add	x4, x4, x1
.L413:
	ldrb	w1, [x15], 1
	add	x2, x5, x1
	ldr	w1, [x5, x1, lsl 2]
	ldrb	w2, [x2, 1280]
	add	w11, w2, w19
	lsl	x1, x1, x19
	orr	x1, x1, x3
	and	w3, w11, -8
	sub	w2, w2, #1
	lsr	w16, w11, 3
	str	x1, [x20]
	orr	w10, w10, w2
	and	w19, w11, 7
	add	x20, x20, x16
	lsr	x3, x1, x3
	cmp	x15, x4
	bne	.L413
.L412:
	sub	x1, x22, x4
	cmp	x1, 3
	ble	.L405
	ldr	w0, [x4]
	mov	w1, 42941
	movk	w1, 0x1e35, lsl 16
	mul	w0, w0, w1
	lsr	w0, w0, 19
	b	.L405
.L100:
	mov	x8, x0
.L747:
	add	x17, x3, x9
	mov	w14, w19
	add	x7, x17, 1
.L102:
	sub	x12, x22, x17
	mov	x0, 258
	cmp	x12, 258
	orr	w28, w15, w19
	csel	x12, x12, x0, ls
	sub	w0, w12, #4
	cmp	w0, 31
	bls	.L496
	ldr	x0, [x16, 4]
	ldr	x1, [x17, 4]
	cmp	x0, x1
	bne	.L110
	ldr	x0, [x16, 12]
	ldr	x1, [x17, 12]
	cmp	x0, x1
	beq	.L111
	eor	x13, x0, x1
	mov	w15, 12
.L112:
	rbit	x13, x13
	clz	x13, x13
	lsr	w13, w13, 3
	add	w13, w15, w13
	add	x1, x17, x13
.L117:
	sub	x0, x9, x8
	mov	w8, 256
	sub	w12, w8, w0
	add	x9, x17, 3
	ldr	x17, [sp, 104]
	lsr	w12, w12, 29
	sub	w8, w0, #1
	add	x15, x21, x13, lsl 2
	ldr	x30, [sp, 120]
	lsr	w8, w8, w12
	add	x16, x21, x13
	str	x2, [x20]
	ldrb	w8, [x17, w8, uxtw]
	add	x16, x16, 4096
	ldr	w27, [x15, 4020]
	and	w15, w19, 56
	ldrb	w13, [x25, x13]
	cmp	x26, x9
	add	w17, w8, w12, lsl 1
	ldrb	w16, [x16, 960]
	add	x8, x5, x17
	lsl	x27, x27, x14
	add	w16, w16, w14
	add	x14, x21, x17, lsl 2
	ldrb	w12, [x30, w17, uxtw]
	lsr	x15, x2, x15
	ldr	x30, [sp, 112]
	add	x13, x21, x13, lsl 2
	ldrb	w8, [x8, 1568]
	add	x13, x13, 65536
	orr	x15, x15, x27
	csel	x9, x26, x9, ls
	ldr	w17, [x30, x17, lsl 2]
	ubfx	x30, x19, 3, 3
	cmp	x1, x9
	sub	w2, w0, w17
	ldr	w17, [x14, 3572]
	add	w0, w8, w16
	add	x14, x14, 65536
	add	w12, w12, w0
	csel	x9, x1, x9, cc
	lsl	x17, x17, x16
	sub	w8, w8, #1
	lsl	x0, x2, x0
	orr	x0, x0, x17
	orr	x2, x0, x15
	str	x2, [x20, w30, uxtw]
	sub	x0, x1, #1
	and	w17, w12, 56
	ldr	w15, [x13, 3524]
	add	x16, x20, x30
	orr	w8, w8, w12
	ubfx	x20, x12, 3, 3
	add	w15, w15, 1
	str	w15, [x13, 3524]
	ldr	x13, [sp, 96]
	and	w19, w12, 7
	add	x20, x16, x20
	orr	w15, w8, w28
	cmp	x13, x0
	ldr	w13, [x14, 3648]
	ccmp	x9, x0, 2, cs
	lsr	x2, x2, x17
	add	w13, w13, 1
	str	w13, [x14, 3648]
	bls	.L825
.L120:
	cmp	x9, x7
	bls	.L123
	.p2align 3,,7
.L121:
	ldr	x0, [x7]
	sub	x8, x7, x3
	add	x7, x7, 1
	mul	x0, x0, x4
	lsr	x0, x0, 48
	strh	w8, [x23, x0, lsl 1]
	cmp	x9, x7
	bne	.L121
.L123:
	sub	x9, x1, x3
	cmp	x11, x9
	bhi	.L97
	b	.L714
	.p2align 2,,3
.L110:
	eor	x13, x0, x1
	mov	w15, 4
	b	.L112
.L176:
	ldp	x9, x22, [sp, 96]
	ldp	x21, x14, [sp, 112]
.L750:
	add	x26, x12, x4
	mov	w16, w19
	add	x15, x26, 1
.L178:
	sub	x2, x22, x26
	mov	x1, 258
	cmp	x2, 258
	orr	w11, w11, w19
	csel	x2, x2, x1, ls
	sub	w1, w2, #4
	cmp	w1, 31
	bls	.L506
	ldr	x1, [x8, 4]
	ldr	x6, [x26, 4]
	cmp	x1, x6
	bne	.L186
	ldr	x1, [x8, 12]
	ldr	x6, [x26, 12]
	cmp	x1, x6
	beq	.L187
	eor	x2, x1, x6
	mov	w18, 12
.L188:
	rbit	x2, x2
	clz	x2, x2
	lsr	w2, w2, 3
	add	w2, w18, w2
	add	x1, x26, x2
.L193:
	sub	x25, x4, x3
	mov	w3, 256
	sub	w4, w3, w25
	sub	w18, w25, #1
	add	x3, x21, x2, lsl 2
	str	x0, [x20]
	lsr	w4, w4, 29
	add	x8, x21, x2
	add	x8, x8, 4096
	and	w6, w19, 56
	lsr	w18, w18, w4
	ldr	w3, [x3, 4020]
	add	x2, x26, 3
	lsr	x6, x0, x6
	ldrb	w18, [x10, w18, uxtw]
	ubfx	x26, x19, 3, 3
	ldr	x19, [sp, 128]
	lsl	x3, x3, x16
	add	w0, w18, w4, lsl 1
	ldrb	w8, [x8, 960]
	orr	x6, x6, x3
	add	x3, x5, x0
	add	w8, w8, w16
	add	x18, x0, 288
	ldr	x16, [sp, 136]
	mov	x4, x0
	ldrb	w3, [x3, 1568]
	cmp	x17, x2
	ldr	w0, [x19, x0, lsl 2]
	csel	x2, x17, x2, ls
	ldr	w18, [x5, x18, lsl 2]
	add	w19, w3, w8
	ldrb	w4, [x16, w4, uxtw]
	sub	w0, w25, w0
	cmp	x1, x2
	sub	x25, x1, #1
	add	w4, w4, w19
	lsl	x0, x0, x19
	lsl	x18, x18, x8
	orr	x0, x0, x18
	orr	x0, x0, x6
	sub	w3, w3, #1
	and	w6, w4, 56
	str	x0, [x20, w26, uxtw]
	csel	x2, x1, x2, cc
	add	x16, x20, x26
	cmp	x27, x25
	orr	w3, w3, w4
	ubfx	x20, x4, 3, 3
	ccmp	x2, x25, 2, cs
	orr	w11, w3, w11
	add	x20, x16, x20
	and	w19, w4, 7
	lsr	x0, x0, x6
	bls	.L826
.L196:
	cmp	x2, x15
	bls	.L199
	.p2align 3,,7
.L197:
	ldr	x3, [x15]
	sub	x4, x15, x12
	add	x15, x15, 1
	mul	x3, x3, x7
	lsr	x3, x3, 48
	strh	w4, [x23, x3, lsl 1]
	cmp	x2, x15
	bne	.L197
.L199:
	sub	x4, x1, x12
	cmp	x9, x4
	bhi	.L173
	b	.L751
	.p2align 2,,3
.L186:
	eor	x2, x1, x6
	mov	w18, 4
	b	.L188
.L810:
	sub	x2, x10, #3
	ldr	w14, [x13, x2]
	ldr	w2, [x27, x2]
	cmp	w14, w2
	bne	.L305
	cmp	w26, 31
	bls	.L524
	ldr	x2, [x13, 4]
	ldr	x14, [x27, 4]
	cmp	x2, x14
	bne	.L307
	ldr	x2, [x13, 12]
	ldr	x14, [x27, 12]
	cmp	x2, x14
	beq	.L308
	eor	x2, x2, x14
	mov	w17, 12
.L309:
	rbit	x2, x2
	clz	x2, x2
	lsr	w2, w2, 3
	add	w17, w17, w2
.L313:
	cmp	w11, w17
	bcs	.L305
	uxtw	x2, w17
	sub	w14, w27, w13
	add	x10, x27, x2
	mov	x13, x2
	mov	w11, w17
	sub	w2, w17, #1
	b	.L329
.L296:
	ldr	x11, [x18, 20]
	ldr	x10, [x27, 20]
	cmp	x11, x10
	bne	.L827
	ldr	x11, [x18, 28]
	ldr	x10, [x27, 28]
	cmp	x11, x10
	beq	.L523
	eor	x10, x11, x10
	mov	w11, 28
	b	.L297
.L366:
	ldr	x12, [x18, 20]
	ldr	x4, [x27, 20]
	cmp	x12, x4
	bne	.L828
	ldr	x12, [x18, 28]
	ldr	x4, [x27, 28]
	cmp	x12, x4
	beq	.L534
	eor	x4, x12, x4
	mov	w12, 28
	b	.L367
.L822:
	sub	x2, x4, #3
	ldr	w15, [x11, x2]
	ldr	w2, [x27, x2]
	cmp	w15, w2
	bne	.L375
	cmp	w28, 31
	bls	.L535
	ldr	x2, [x11, 4]
	ldr	x15, [x27, 4]
	cmp	x2, x15
	bne	.L377
	ldr	x2, [x11, 12]
	ldr	x15, [x27, 12]
	cmp	x2, x15
	beq	.L378
	eor	x17, x2, x15
	mov	w2, 12
.L379:
	rbit	x17, x17
	clz	x17, x17
	lsr	w15, w17, 3
	add	w2, w2, w15
.L383:
	cmp	w12, w2
	bcs	.L375
	uxtw	x16, w2
	sub	w11, w27, w11
	add	x4, x27, x16
	sub	w15, w2, #1
	mov	w12, w2
	b	.L399
.L437:
	ldr	x11, [x18, 28]
	ldr	x12, [x27, 28]
	cmp	x11, x12
	beq	.L545
	eor	x12, x11, x12
	mov	w11, 28
	b	.L436
.L544:
	mov	x12, 4
.L433:
	sub	x0, x27, #8
	b	.L438
	.p2align 2,,3
.L439:
	ldr	x14, [x18, x12]
	add	x12, x12, 8
	ldr	x25, [x0, x12]
	cmp	x14, x25
	bne	.L829
.L438:
	add	w14, w12, 8
	mov	w11, w12
	cmp	w15, w14
	bcs	.L439
	cmp	w15, w12
	bls	.L441
	and	x12, x12, 4294967295
	.p2align 3,,7
.L442:
	ldrb	w14, [x18, x12]
	mov	w11, w12
	ldrb	w0, [x27, x12]
	cmp	w14, w0
	bne	.L441
	add	x12, x12, 1
	cmp	w15, w12
	bhi	.L442
	add	w11, w11, 1
	b	.L441
.L318:
	eor	x2, x2, x10
	mov	w11, 4
.L320:
	rbit	x2, x2
	sub	w14, w27, w13
	clz	x2, x2
	lsr	w2, w2, 3
	add	w11, w11, w2
	uxtw	x13, w11
	sub	w2, w11, #1
	add	x10, x27, x13
	b	.L329
.L388:
	eor	x2, x2, x4
	mov	w12, 4
.L390:
	rbit	x2, x2
	sub	w11, w27, w11
	clz	x2, x2
	lsr	w2, w2, 3
	add	w16, w12, w2
	mov	x12, x16
	sub	w15, w16, #1
	add	x4, x27, x16
	b	.L399
.L826:
	ldr	x3, [x1, -1]
	mov	x4, 2264924160
	movk	x4, 0xebca, lsl 32
	sub	x25, x25, x12
	movk	x4, 0xb185, lsl 48
	mul	x3, x3, x4
	lsr	x3, x3, 48
	strh	w25, [x23, x3, lsl 1]
	b	.L196
.L825:
	ldr	x8, [x1, -1]
	mov	x12, 2264924160
	movk	x12, 0xebca, lsl 32
	sub	x0, x0, x3
	movk	x12, 0xb185, lsl 48
	mul	x8, x8, x12
	lsr	x8, x8, 48
	strh	w0, [x23, x8, lsl 1]
	b	.L120
.L458:
	ldr	x2, [x4, 20]
	ldr	x11, [x27, 20]
	cmp	x2, x11
	bne	.L830
	ldr	x2, [x4, 28]
	ldr	x11, [x27, 28]
	cmp	x2, x11
	beq	.L549
	eor	x2, x2, x11
	mov	w11, 28
	b	.L459
.L187:
	ldr	x1, [x8, 20]
	ldr	x6, [x26, 20]
	cmp	x1, x6
	bne	.L831
	ldr	x1, [x8, 28]
	ldr	x6, [x26, 28]
	cmp	x1, x6
	beq	.L507
	eor	x2, x1, x6
	mov	w18, 28
	b	.L188
.L111:
	ldr	x0, [x16, 20]
	ldr	x1, [x17, 20]
	cmp	x0, x1
	bne	.L832
	ldr	x0, [x16, 28]
	ldr	x1, [x17, 28]
	cmp	x0, x1
	beq	.L497
	eor	x13, x0, x1
	mov	w15, 28
	b	.L112
.L767:
	mov	x8, x0
	sub	x17, x1, #1
	mov	x9, x28
	and	w14, w19, 7
	b	.L102
.L768:
	mov	x9, x14
	mov	x7, x17
	mov	x8, x0
	mov	x17, x1
	and	w14, w19, 7
	b	.L102
.L782:
	ldp	x9, x22, [sp, 96]
	sub	x26, x2, #1
	ldp	x21, x14, [sp, 112]
	mov	x4, x18
	and	w16, w19, 7
	b	.L178
.L783:
	ldp	x9, x22, [sp, 96]
	mov	x15, x26
	ldp	x21, x14, [sp, 112]
	mov	x4, x16
	mov	x26, x2
	and	w16, w19, 7
	b	.L178
.L784:
	ldp	x9, x22, [sp, 96]
	add	x15, x12, x4
	ldp	x21, x14, [sp, 112]
	and	w16, w19, 7
	mov	x4, x25
	b	.L178
.L769:
	add	x7, x3, x9
	mov	x8, x0
	and	w14, w19, 7
	mov	x9, x27
	b	.L102
.L786:
	bl	memcpy
	mov	x18, x0
	add	x0, x21, x26
	ldr	w5, [x21, 32]
	add	x0, x0, 4096
	mov	x1, 32768
	uxtw	x4, w5
	sub	x6, x1, x4
	ldrb	w2, [x0, 1220]
	str	wzr, [x21, 1124]
	and	w2, w2, w28
	cmp	x25, x6
	bcs	.L833
	mrs	x0, tpidr_el0
	ldr	w3, [x21, 36]
	add	x0, x0, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x0, x0, #:tprel_lo12_nc:.LANCHOR1
	add	w25, w5, w25
	sub	w23, w5, #1
	str	w25, [x21, 32]
	sub	x4, x27, x4
	str	w23, [x0]
	cmp	w3, 12
	bhi	.L209
	add	x0, x21, 73728
	add	x0, x0, 352
	cbz	w3, .L208
	mov	x5, 4
	lsl	x3, x5, x3
	add	x0, x0, x3
	sub	x1, x1, x3
.L208:
	movi	v0.8h, 0x80, lsl 8
	add	x1, x0, x1
	.p2align 3,,7
.L210:
	stp	q0, q0, [x0]
	stp	q0, q0, [x0, 32]
	add	x0, x0, 64
	cmp	x0, x1
	bne	.L210
	mov	w0, 13
	str	w0, [x21, 36]
.L209:
	cmp	x27, x22
	beq	.L211
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	add	x1, x0, 464
	add	x15, x21, 73728
	ldr	w24, [sp, 96]
	add	x28, x0, 848
	add	x15, x15, 352
	add	x6, x21, 204800
	movi	v0.8h, 0x80, lsl 8
	stp	x18, x0, [sp, 96]
	mov	w7, 42941
	str	x1, [sp, 112]
	add	x1, x0, 720
	add	x0, x0, 432
	add	x5, x21, 2420
	add	x6, x6, 352
	sxth	w30, w23
	mov	x8, x15
	stp	x1, x0, [sp, 120]
	mov	w0, 0
	mov	w1, w0
	mov	w11, 0
	mov	w9, 0
	movk	w7, 0x1e35, lsl 16
	.p2align 3,,7
.L275:
	sub	x0, x22, x27
	mov	w18, w24
	mov	w14, 258
	cmp	x0, 257
	bls	.L834
.L212:
	sub	x10, x27, x4
	mov	w3, w10
	cmp	w10, 32768
	beq	.L217
	mov	w16, -32767
	add	w13, w10, w16
	sxth	w10, w10
.L218:
	ldr	w0, [x27, 1]
	ubfiz	x17, x1, 2, 32
	add	x12, x21, x17
	sub	w3, w3, #32768
	add	x12, x12, 73728
	cmp	w23, w13
	sxth	w3, w3
	ldr	w16, [x27]
	mul	w1, w0, w7
	csel	w3, w30, w3, ge
	ldrsh	w13, [x12, 352]
	lsr	w0, w1, 19
	lsr	w1, w1, 19
	add	x25, x15, x0, lsl 2
	prfm	PSTL1KEEP, [x25]
	strh	w10, [x12, 352]
	cmp	w13, w3
	ble	.L222
	add	x10, x8, x17
	ldr	w25, [x4, w13, sxtw]
	add	x17, x4, w13, sxtw
	ldrsh	w12, [x10, 2]
	strh	w13, [x10, 2]
	cmp	w16, w25
	beq	.L835
	cmp	w3, w12
	bge	.L222
	ldr	w3, [x4, w12, sxtw]
	add	x12, x4, w12, sxtw
	cmp	w16, w3
	beq	.L836
.L222:
	mov	x10, x27
	add	w11, w11, 1
	ldrb	w0, [x10], 1
	add	x3, x5, x0
	add	x0, x21, x0, lsl 2
	add	x13, x0, 65536
	ldrb	w3, [x3, 1280]
	ldr	w0, [x0, 2420]
	ldr	w14, [x13, 2496]
	add	w12, w3, w19
	sub	w3, w3, #1
	lsl	x0, x0, x19
	add	w14, w14, 1
	orr	x0, x0, x2
	and	w2, w12, -8
	str	w14, [x13, 2496]
	lsr	w13, w12, 3
	str	x0, [x20]
	orr	w9, w9, w3
	and	w19, w12, 7
	add	x20, x20, x13
	lsr	x2, x0, x2
	tst	x11, 15
	beq	.L837
.L266:
	cmp	x10, x22
	beq	.L735
.L271:
	mov	x27, x10
	b	.L275
.L829:
	eor	x12, x14, x25
	b	.L436
.L139:
	ldp	x11, x22, [sp, 96]
	ldp	x21, x14, [sp, 112]
.L748:
	add	x26, x7, x4
	mov	w16, w19
	add	x15, x26, 1
.L141:
	sub	x6, x22, x26
	mov	x1, 258
	cmp	x6, 258
	orr	w13, w13, w19
	csel	x6, x6, x1, ls
	sub	w1, w6, #4
	cmp	w1, 31
	bls	.L501
	ldr	x1, [x10, 4]
	ldr	x2, [x26, 4]
	cmp	x1, x2
	bne	.L149
	ldr	x1, [x10, 12]
	ldr	x2, [x26, 12]
	cmp	x1, x2
	bne	.L838
	ldr	x1, [x10, 20]
	ldr	x2, [x26, 20]
	cmp	x1, x2
	beq	.L152
	eor	x1, x1, x2
	mov	w18, 20
	b	.L151
.L149:
	eor	x1, x1, x2
	mov	w18, 4
.L151:
	rbit	x2, x1
	clz	x2, x2
	lsr	w2, w2, 3
	add	w2, w18, w2
	add	x1, x26, x2
.L156:
	sub	x25, x4, x3
	mov	w3, 256
	sub	w4, w3, w25
	sub	w18, w25, #1
	add	x3, x21, x2, lsl 2
	str	x0, [x20]
	lsr	w4, w4, 29
	add	x10, x21, x2
	add	x10, x10, 4096
	and	w6, w19, 56
	lsr	w18, w18, w4
	ldr	w3, [x3, 4020]
	add	x2, x26, 3
	lsr	x6, x0, x6
	ldrb	w18, [x12, w18, uxtw]
	ubfx	x26, x19, 3, 3
	ldr	x19, [sp, 128]
	lsl	x3, x3, x16
	add	w0, w18, w4, lsl 1
	ldrb	w10, [x10, 960]
	orr	x6, x6, x3
	add	x3, x5, x0
	add	w10, w10, w16
	add	x18, x0, 288
	ldr	x16, [sp, 136]
	mov	x4, x0
	ldrb	w3, [x3, 1568]
	cmp	x17, x2
	ldr	w0, [x19, x0, lsl 2]
	csel	x2, x17, x2, ls
	ldr	w18, [x5, x18, lsl 2]
	add	w19, w3, w10
	ldrb	w4, [x16, w4, uxtw]
	sub	w0, w25, w0
	cmp	x1, x2
	sub	x25, x1, #1
	add	w4, w4, w19
	lsl	x0, x0, x19
	lsl	x18, x18, x10
	orr	x0, x0, x18
	orr	x0, x0, x6
	sub	w3, w3, #1
	and	w6, w4, 56
	str	x0, [x20, w26, uxtw]
	csel	x2, x1, x2, cc
	add	x16, x20, x26
	cmp	x27, x25
	orr	w3, w3, w4
	ubfx	x20, x4, 3, 3
	ccmp	x2, x25, 2, cs
	orr	w13, w3, w13
	add	x20, x16, x20
	and	w19, w4, 7
	lsr	x0, x0, x6
	bls	.L839
.L159:
	cmp	x2, x15
	bls	.L162
	.p2align 3,,7
.L160:
	ldr	x3, [x15]
	sub	x4, x15, x7
	add	x15, x15, 1
	mul	x3, x3, x8
	lsr	x3, x3, 50
	strh	w4, [x23, x3, lsl 1]
	cmp	x2, x15
	bne	.L160
.L162:
	sub	x4, x1, x7
	cmp	x11, x4
	bhi	.L136
	b	.L749
.L61:
	mov	x8, x0
.L746:
	add	x17, x3, x9
	mov	w14, w19
	add	x7, x17, 1
.L63:
	sub	x13, x22, x17
	mov	x0, 258
	cmp	x13, 258
	orr	w28, w15, w19
	csel	x13, x13, x0, ls
	sub	w0, w13, #4
	cmp	w0, 31
	bls	.L491
	ldr	x0, [x16, 4]
	ldr	x1, [x17, 4]
	cmp	x0, x1
	bne	.L71
	ldr	x0, [x16, 12]
	ldr	x1, [x17, 12]
	cmp	x0, x1
	bne	.L840
	ldr	x0, [x16, 20]
	ldr	x1, [x17, 20]
	cmp	x0, x1
	beq	.L74
	eor	x0, x0, x1
	mov	w15, 20
	b	.L73
.L71:
	eor	x0, x0, x1
	mov	w15, 4
.L73:
	rbit	x13, x0
	clz	x13, x13
	lsr	w13, w13, 3
	add	w13, w15, w13
	add	x1, x17, x13
.L78:
	sub	x0, x9, x8
	mov	w8, 256
	sub	w12, w8, w0
	add	x9, x17, 3
	ldr	x17, [sp, 104]
	lsr	w12, w12, 29
	sub	w8, w0, #1
	add	x15, x21, x13, lsl 2
	ldr	x30, [sp, 120]
	lsr	w8, w8, w12
	add	x16, x21, x13
	str	x2, [x20]
	ldrb	w8, [x17, w8, uxtw]
	add	x16, x16, 4096
	ldr	w27, [x15, 4020]
	and	w15, w19, 56
	ldrb	w13, [x25, x13]
	cmp	x26, x9
	add	w17, w8, w12, lsl 1
	ldrb	w16, [x16, 960]
	add	x8, x5, x17
	lsl	x27, x27, x14
	add	w16, w16, w14
	add	x14, x21, x17, lsl 2
	ldrb	w12, [x30, w17, uxtw]
	lsr	x15, x2, x15
	ldr	x30, [sp, 112]
	add	x13, x21, x13, lsl 2
	ldrb	w8, [x8, 1568]
	add	x13, x13, 65536
	orr	x15, x15, x27
	csel	x9, x26, x9, ls
	ldr	w17, [x30, x17, lsl 2]
	ubfx	x30, x19, 3, 3
	cmp	x1, x9
	sub	w2, w0, w17
	ldr	w17, [x14, 3572]
	add	w0, w8, w16
	add	x14, x14, 65536
	add	w12, w12, w0
	csel	x9, x1, x9, cc
	lsl	x17, x17, x16
	sub	w8, w8, #1
	lsl	x0, x2, x0
	orr	x0, x0, x17
	orr	x2, x0, x15
	str	x2, [x20, w30, uxtw]
	sub	x0, x1, #1
	and	w17, w12, 56
	ldr	w15, [x13, 3524]
	add	x16, x20, x30
	orr	w8, w8, w12
	ubfx	x20, x12, 3, 3
	add	w15, w15, 1
	str	w15, [x13, 3524]
	ldr	x13, [sp, 96]
	and	w19, w12, 7
	add	x20, x16, x20
	orr	w15, w8, w28
	cmp	x13, x0
	ldr	w13, [x14, 3648]
	ccmp	x9, x0, 2, cs
	lsr	x2, x2, x17
	add	w13, w13, 1
	str	w13, [x14, 3648]
	bls	.L841
.L81:
	cmp	x9, x7
	bls	.L84
	.p2align 3,,7
.L82:
	ldr	x0, [x7]
	sub	x8, x7, x3
	add	x7, x7, 1
	mul	x0, x0, x4
	lsr	x0, x0, 50
	strh	w8, [x23, x0, lsl 1]
	cmp	x9, x7
	bne	.L82
.L84:
	sub	x9, x1, x3
	cmp	x11, x9
	bhi	.L58
	b	.L713
.L495:
	mov	w15, w19
	add	x5, x21, 2420
	b	.L96
.L765:
	mrs	x5, tpidr_el0
	mov	w7, -32768
	add	x5, x5, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x5, x5, #:tprel_lo12_nc:.LANCHOR1
	cmp	x25, x4
	mov	x3, x27
	mov	w6, w7
	mov	x0, x23
	csel	x4, x25, x4, ls
	mov	x9, 0
	mov	x1, 131072
	str	w7, [x5]
	str	w4, [x21, 32]
.L93:
	movi	v0.8h, 0x80, lsl 8
	add	x1, x0, x1
	.p2align 3,,7
.L95:
	stp	q0, q0, [x0]
	stp	q0, q0, [x0, 32]
	add	x0, x0, 64
	cmp	x0, x1
	bne	.L95
	mov	w0, 15
	str	w0, [x21, 36]
	b	.L94
.L505:
	add	x5, x21, 2420
	mov	w11, w19
	b	.L172
.L780:
	mrs	x5, tpidr_el0
	cmp	x25, x2
	add	x5, x5, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x5, x5, #:tprel_lo12_nc:.LANCHOR1
	mov	w6, -32768
	mov	x12, x27
	mov	w13, w6
	mov	x1, x23
	csel	x3, x25, x2, ls
	mov	x4, 0
	mov	x2, 131072
	str	w6, [x5]
	str	w3, [x21, 32]
.L169:
	movi	v0.8h, 0x80, lsl 8
	add	x2, x1, x2
	.p2align 3,,7
.L171:
	stp	q0, q0, [x1]
	stp	q0, q0, [x1, 32]
	add	x1, x1, 64
	cmp	x1, x2
	bne	.L171
	mov	w1, 15
	str	w1, [x21, 36]
	b	.L170
.L828:
	eor	x4, x12, x4
	mov	w12, 20
	b	.L367
.L827:
	eor	x10, x11, x10
	mov	w11, 20
	b	.L297
.L545:
	mov	x12, 36
	b	.L433
.L824:
	eor	x2, x2, x4
	mov	w12, 12
	b	.L390
.L813:
	eor	x2, x2, x10
	mov	w11, 12
	b	.L320
.L830:
	eor	x2, x2, x11
	mov	w11, 20
	b	.L459
.L788:
	add	x0, x21, 73728
	add	x0, x0, 352
	cbz	w2, .L520
	mov	x5, 4
	mov	x1, 131072
	lsl	x2, x5, x2
	add	x0, x0, x2
	sub	x1, x1, x2
.L278:
	movi	v0.8h, 0x80, lsl 8
	add	x1, x0, x1
	.p2align 3,,7
.L280:
	stp	q0, q0, [x0]
	stp	q0, q0, [x0, 32]
	add	x0, x0, 64
	cmp	x0, x1
	bne	.L280
	mov	w0, 15
	str	w0, [x21, 36]
	b	.L279
.L815:
	add	x0, x21, 73728
	add	x0, x0, 352
	cbz	w4, .L348
	mov	x2, 4
	lsl	x2, x2, x4
	add	x0, x0, x2
	sub	x1, x1, x2
.L348:
	movi	v0.8h, 0x80, lsl 8
	add	x1, x0, x1
	.p2align 3,,7
.L350:
	stp	q0, q0, [x0]
	stp	q0, q0, [x0, 32]
	add	x0, x0, 64
	cmp	x0, x1
	bne	.L350
	mov	w0, 13
	str	w0, [x21, 36]
	b	.L349
.L838:
	eor	x1, x1, x2
	mov	w18, 12
	b	.L151
.L840:
	eor	x0, x0, x1
	mov	w15, 12
	b	.L73
.L832:
	eor	x13, x0, x1
	mov	w15, 20
	b	.L112
.L831:
	eor	x2, x1, x6
	mov	w18, 20
	b	.L188
.L735:
	ldr	x18, [sp, 96]
.L216:
	ldr	w0, [x5, 1024]
	ldrb	w1, [x5, 1536]
	lsl	x0, x0, x19
	orr	x2, x0, x2
	str	x2, [x20]
	tbnz	w9, #31, .L128
.L485:
	add	w1, w1, w19
	ands	w3, w1, 7
	lsr	w0, w1, 3
	lsr	w4, w1, 3
	add	x0, x20, x0
	beq	.L276
	and	w1, w1, -8
	lsr	x2, x2, x1
	strb	w2, [x20, w4, uxtw]
	b	.L276
.L446:
	eor	x2, x2, x14
	mov	w17, 4
	b	.L448
.L833:
	mrs	x3, tpidr_el0
	cmp	x25, x1
	add	x3, x3, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x3, x3, #:tprel_lo12_nc:.LANCHOR1
	add	x0, x21, 73728
	mov	w5, -32768
	csel	x25, x25, x1, ls
	add	x0, x0, 352
	mov	w23, w5
	mov	x4, x27
	str	w5, [x3]
	str	w25, [x21, 32]
	b	.L208
.L803:
	cbz	w5, .L489
	mov	x0, 4
	lsl	x0, x0, x5
	sub	x1, x1, x0
	add	x0, x23, x0
.L54:
	movi	v0.8h, 0x80, lsl 8
	add	x1, x0, x1
	.p2align 3,,7
.L56:
	stp	q0, q0, [x0]
	stp	q0, q0, [x0, 32]
	add	x0, x0, 64
	cmp	x0, x1
	bne	.L56
	mov	w0, 13
	str	w0, [x21, 36]
	b	.L55
.L796:
	cbz	w5, .L499
	mov	x1, 4
	lsl	x1, x1, x5
	sub	x2, x2, x1
	add	x1, x23, x1
.L132:
	movi	v0.8h, 0x80, lsl 8
	add	x2, x1, x2
	.p2align 3,,7
.L134:
	stp	q0, q0, [x1]
	stp	q0, q0, [x1, 32]
	add	x1, x1, 64
	cmp	x1, x2
	bne	.L134
	mov	w1, 13
	str	w1, [x21, 36]
	b	.L133
	.p2align 2,,3
.L217:
	mov	x0, x15
	.p2align 3,,7
.L219:
	ldp	q4, q3, [x0]
	ldp	q2, q1, [x0, 32]
	sqadd	v4.8h, v4.8h, v0.8h
	sqadd	v3.8h, v3.8h, v0.8h
	sqadd	v2.8h, v2.8h, v0.8h
	sqadd	v1.8h, v1.8h, v0.8h
	stp	q4, q3, [x0]
	stp	q2, q1, [x0, 32]
	add	x0, x0, 64
	cmp	x0, x6
	bne	.L219
	add	x4, x4, 32768
	mov	w10, 0
	mov	w13, -32767
	mov	w3, 0
	b	.L218
	.p2align 2,,3
.L835:
	sub	w26, w14, #4
	cmp	w26, 31
	bls	.L511
	ldr	x11, [x17, 4]
	ldr	x10, [x27, 4]
	cmp	x11, x10
	bne	.L225
	ldr	x11, [x17, 12]
	ldr	x10, [x27, 12]
	cmp	x11, x10
	beq	.L226
	eor	x10, x11, x10
	mov	w11, 12
.L227:
	rbit	x10, x10
	clz	x10, x10
	lsr	w10, w10, 3
	add	w10, w11, w10
	mov	x11, x10
.L232:
	cmp	w3, w12
	ccmp	w18, w11, 0, lt
	bls	.L237
	ldr	w3, [x4, w12, sxtw]
	add	x13, x4, w12, sxtw
	cmp	w16, w3
	beq	.L842
.L237:
	sub	w13, w27, w17
	add	x10, x27, x10
	sub	w3, w11, #1
	uxtw	x12, w11
.L236:
	ldr	x18, [sp, 104]
	add	x16, x21, x12
	mov	w14, 256
	sub	w14, w14, w13
	add	x16, x16, 4096
	add	x25, x21, x12, lsl 2
	lsr	w14, w14, 29
	ldrb	w12, [x18, x12]
	ldr	x18, [sp, 112]
	sub	w17, w13, #1
	ldrb	w16, [x16, 960]
	add	x12, x21, x12, lsl 2
	lsr	w17, w17, w14
	add	x12, x12, 65536
	add	w11, w11, 4
	ldrb	w18, [x18, w17, uxtw]
	add	w17, w16, w19
	ldr	w16, [x25, 4020]
	add	w18, w18, w14, lsl 1
	lsl	x16, x16, x19
	orr	x16, x16, x2
	ldr	x2, [sp, 128]
	add	x19, x5, x18
	add	x25, x21, x18, lsl 2
	ldrb	w14, [x2, w18, uxtw]
	ldr	x2, [sp, 120]
	ldrb	w19, [x19, 1568]
	ldr	w2, [x2, x18, lsl 2]
	add	x18, x25, 65536
	ldr	w25, [x25, 3572]
	sub	w2, w13, w2
	add	w13, w19, w17
	add	w14, w14, w13
	sub	w19, w19, #1
	lsl	x25, x25, x17
	orr	w9, w9, w19
	lsl	x2, x2, x13
	orr	x2, x2, x25
	orr	x2, x2, x16
	str	x2, [x20]
	lsr	w17, w14, 3
	and	w19, w14, -8
	ldr	w25, [x12, 3524]
	add	x20, x20, x17
	lsr	x2, x2, x19
	and	w19, w14, 7
	add	w17, w25, 1
	str	w17, [x12, 3524]
	add	x13, x27, 1
	ldr	w14, [x18, 3648]
	sub	x16, x22, x13
	sub	x12, x13, x4
	add	w14, w14, 1
	str	w14, [x18, 3648]
	cmp	x11, x16
	bgt	.L261
	sub	w1, w12, #1
	mov	w11, 32767
	add	w1, w1, w3
	cmp	w1, w11
	bls	.L263
	mov	x1, x15
	.p2align 3,,7
.L264:
	ldp	q4, q3, [x1]
	ldp	q2, q1, [x1, 32]
	sqadd	v4.8h, v4.8h, v0.8h
	sqadd	v3.8h, v3.8h, v0.8h
	sqadd	v2.8h, v2.8h, v0.8h
	sqadd	v1.8h, v1.8h, v0.8h
	stp	q4, q3, [x1]
	stp	q2, q1, [x1, 32]
	add	x1, x1, 64
	cmp	x1, x6
	bne	.L264
	add	x4, x4, 32768
	sub	w12, w12, #32768
.L263:
	add	w3, w3, 1
	sub	w12, w12, w13
	add	x11, x27, x3
	b	.L265
	.p2align 2,,3
.L843:
	uxtw	x0, w1
.L265:
	lsl	x0, x0, 2
	add	w14, w12, w13
	add	x3, x21, x0
	ldr	w1, [x13, 1]!
	add	x3, x3, 73728
	add	x0, x8, x0
	ldrsh	w16, [x3, 352]
	mul	w1, w1, w7
	strh	w16, [x0, 2]
	strh	w14, [x3, 352]
	lsr	w1, w1, 19
	cmp	x13, x11
	bne	.L843
	ubfiz	x0, x1, 2, 13
	prfm	PSTL1KEEP, [x15, x0]
.L261:
	mov	w11, 0
	b	.L266
.L225:
	eor	x10, x11, x10
	mov	w11, 4
	b	.L227
.L834:
	mov	w14, w0
	cmp	w0, 4
	bls	.L844
	cmp	w0, w24
	csel	w18, w0, w24, ls
	b	.L212
.L836:
	sub	w3, w14, #4
	cmp	w3, 31
	bls	.L515
	ldr	x3, [x12, 4]
	ldr	x10, [x27, 4]
	cmp	x3, x10
	bne	.L250
	ldr	x3, [x12, 12]
	ldr	x10, [x27, 12]
	cmp	x3, x10
	beq	.L251
	eor	x3, x3, x10
	mov	w11, 12
.L252:
	rbit	x3, x3
	sub	w13, w27, w12
	clz	x3, x3
	lsr	w3, w3, 3
	add	w11, w11, w3
	uxtw	x12, w11
	sub	w3, w11, #1
	add	x10, x27, x12
	b	.L236
.L837:
	cmp	x10, x22
	beq	.L735
	mov	x0, x10
	b	.L267
	.p2align 2,,3
.L270:
	add	x0, x0, 1
	cmp	x0, x22
	beq	.L269
.L267:
	ldrb	w3, [x0]
	ldrb	w3, [x28, w3, sxtw]
	tst	x3, 3
	bne	.L270
.L269:
	sub	x12, x0, x10
	cmp	x12, 15
	ble	.L271
	sub	x13, x12, #4
	mov	x3, x10
	and	x0, x13, -4
	str	w1, [sp, 136]
	add	x14, x0, 5
	lsr	x13, x13, 2
	add	x27, x27, x14
	str	x4, [sp, 144]
	str	w23, [sp, 152]
	.p2align 3,,7
.L272:
	ldrb	w1, [x3]
	add	x3, x3, 4
	ldrb	w16, [x3, -3]
	add	x17, x5, x1
	ldrb	w14, [x3, -2]
	add	x1, x21, x1, lsl 2
	add	x4, x5, x16
	add	x25, x1, 65536
	add	x16, x21, x16, lsl 2
	add	x18, x16, 65536
	ldrb	w17, [x17, 1280]
	ldr	w23, [x1, 2420]
	add	x26, x21, x14, lsl 2
	ldr	w1, [x25, 2496]
	add	x14, x5, x14
	add	w1, w1, 1
	str	w1, [x25, 2496]
	lsl	x23, x23, x19
	add	w1, w19, w17
	ldr	w19, [x18, 2496]
	add	x25, x26, 65536
	ldr	w16, [x16, 2420]
	sub	w17, w17, #1
	ldrb	w4, [x4, 1280]
	add	w19, w19, 1
	str	w19, [x18, 2496]
	ldrb	w18, [x3, -1]
	lsl	x16, x16, x1
	orr	x16, x16, x23
	ldr	w23, [x26, 2420]
	ldr	w26, [x25, 2496]
	add	w19, w1, w4
	add	x1, x21, x18, lsl 2
	ldrb	w14, [x14, 1280]
	add	w26, w26, 1
	str	w26, [x25, 2496]
	add	x18, x5, x18
	add	x25, x1, 65536
	ldr	w1, [x1, 2420]
	add	w26, w19, w14
	sub	w4, w4, #1
	lsl	x23, x23, x19
	ldrb	w18, [x18, 1280]
	orr	w4, w17, w4
	lsl	x1, x1, x26
	ldr	w17, [x25, 2496]
	orr	x1, x1, x23
	add	w19, w26, w18
	sub	w14, w14, #1
	sub	w18, w18, #1
	orr	x1, x1, x16
	orr	w14, w14, w18
	orr	x1, x1, x2
	add	w17, w17, 1
	and	w2, w19, -8
	str	w17, [x25, 2496]
	orr	w4, w4, w14
	lsr	w14, w19, 3
	str	x1, [x20]
	orr	w9, w9, w4
	and	w19, w19, 7
	add	x20, x20, x14
	lsr	x2, x1, x2
	cmp	x3, x27
	bne	.L272
	add	x13, x13, 1
	sub	x12, x12, x0
	ldr	x4, [sp, 144]
	add	x10, x10, x13, lsl 2
	ldr	w1, [sp, 136]
	subs	x12, x12, #4
	ldr	w23, [sp, 152]
	mov	x13, x10
	beq	.L273
	add	x10, x10, x12
.L274:
	ldrb	w0, [x13], 1
	add	x3, x5, x0
	add	x0, x21, x0, lsl 2
	add	x16, x0, 65536
	ldrb	w3, [x3, 1280]
	ldr	w0, [x0, 2420]
	ldr	w14, [x16, 2496]
	add	w12, w3, w19
	sub	w3, w3, #1
	add	w14, w14, 1
	lsl	x0, x0, x19
	orr	x0, x0, x2
	and	w2, w12, -8
	str	w14, [x16, 2496]
	lsr	w14, w12, 3
	str	x0, [x20]
	orr	w9, w9, w3
	and	w19, w12, 7
	add	x20, x20, x14
	lsr	x2, x0, x2
	cmp	x13, x10
	bne	.L274
.L273:
	sub	x0, x22, x10
	cmp	x0, 3
	ble	.L266
	ldr	w1, [x10]
	mov	w0, 42941
	movk	w0, 0x1e35, lsl 16
	mul	w1, w1, w0
	lsr	w1, w1, 19
	b	.L266
.L842:
	sub	x3, x10, #3
	ldr	w12, [x13, x3]
	ldr	w3, [x27, x3]
	cmp	w12, w3
	bne	.L237
	cmp	w26, 31
	bls	.L513
	ldr	x3, [x13, 4]
	ldr	x12, [x27, 4]
	cmp	x3, x12
	bne	.L239
	ldr	x3, [x13, 12]
	ldr	x12, [x27, 12]
	cmp	x3, x12
	beq	.L240
	eor	x3, x3, x12
	mov	w18, 12
.L241:
	rbit	x3, x3
	clz	x3, x3
	lsr	w3, w3, 3
	add	w18, w18, w3
.L245:
	cmp	w11, w18
	bcs	.L237
	uxtw	x12, w18
	sub	w13, w27, w13
	add	x10, x27, x12
	sub	w3, w18, #1
	mov	w11, w18
	b	.L236
.L226:
	ldr	x11, [x17, 20]
	ldr	x10, [x27, 20]
	cmp	x11, x10
	beq	.L228
	eor	x10, x11, x10
	mov	w11, 20
	b	.L227
.L781:
	cbz	w3, .L504
	mov	x1, 4
	mov	x2, 131072
	lsl	x3, x1, x3
	add	x1, x23, x3
	sub	x2, x2, x3
	b	.L169
.L766:
	cbz	w4, .L494
	mov	x0, 4
	mov	x1, 131072
	lsl	x4, x0, x4
	add	x0, x23, x4
	sub	x1, x1, x4
	b	.L93
.L250:
	eor	x3, x3, x10
	mov	w11, 4
	b	.L252
.L839:
	ldr	x3, [x1, -1]
	mov	x4, 2264924160
	movk	x4, 0xebca, lsl 32
	sub	x25, x25, x7
	movk	x4, 0xb185, lsl 48
	mul	x3, x3, x4
	lsr	x3, x3, 50
	strh	w25, [x23, x3, lsl 1]
	b	.L159
.L841:
	ldr	x8, [x1, -1]
	mov	x12, 2264924160
	movk	x12, 0xebca, lsl 32
	sub	x0, x0, x3
	movk	x12, 0xb185, lsl 48
	mul	x8, x8, x12
	lsr	x8, x8, 50
	strh	w0, [x23, x8, lsl 1]
	b	.L81
.L522:
	mov	x10, 4
.L294:
	sub	x11, x27, #8
	str	x3, [sp, 96]
	mov	x3, x11
	b	.L299
	.p2align 2,,3
.L300:
	ldr	x14, [x18, x10]
	add	x10, x10, 8
	ldr	x25, [x3, x10]
	cmp	x14, x25
	bne	.L845
.L299:
	add	w14, w10, 8
	mov	w11, w10
	cmp	w15, w14
	bcs	.L300
	ldr	x3, [sp, 96]
	cmp	w15, w10
	bls	.L302
	and	x10, x10, 4294967295
	.p2align 3,,7
.L303:
	ldrb	w25, [x18, x10]
	mov	w11, w10
	ldrb	w14, [x27, x10]
	cmp	w25, w14
	bne	.L302
	add	x10, x10, 1
	cmp	w15, w10
	bhi	.L303
	add	w11, w11, 1
	b	.L302
.L533:
	mov	x4, 4
.L364:
	sub	x12, x27, #8
	str	x3, [sp, 136]
	mov	x3, x12
	b	.L369
	.p2align 2,,3
.L370:
	ldr	x15, [x18, x4]
	add	x4, x4, 8
	ldr	x26, [x3, x4]
	cmp	x15, x26
	bne	.L846
.L369:
	add	w15, w4, 8
	mov	w12, w4
	cmp	w16, w15
	bcs	.L370
	ldr	x3, [sp, 136]
	cmp	w16, w4
	bls	.L372
	and	x4, x4, 4294967295
	.p2align 3,,7
.L373:
	ldrb	w26, [x18, x4]
	mov	w12, w4
	ldrb	w15, [x27, x4]
	cmp	w26, w15
	bne	.L372
	add	x4, x4, 1
	cmp	w16, w4
	bhi	.L373
	add	w12, w12, 1
	b	.L372
.L787:
	mrs	x5, tpidr_el0
	cmp	x25, x2
	add	x5, x5, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x5, x5, #:tprel_lo12_nc:.LANCHOR1
	add	x0, x21, 73728
	mov	w6, -32768
	csel	x2, x25, x2, ls
	add	x0, x0, 352
	mov	w16, w6
	mov	x4, x27
	mov	x1, 131072
	str	w6, [x5]
	str	w2, [x21, 32]
	b	.L278
.L814:
	mrs	x2, tpidr_el0
	cmp	x25, x1
	add	x2, x2, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x2, x2, #:tprel_lo12_nc:.LANCHOR1
	add	x0, x21, 73728
	mov	w4, -32768
	csel	x25, x25, x1, ls
	add	x0, x0, 352
	mov	w14, w4
	mov	x6, x27
	str	w4, [x2]
	str	w25, [x21, 32]
	b	.L348
.L805:
	mov	x9, x14
	mov	x7, x17
	mov	x8, x0
	mov	x17, x1
	and	w14, w19, 7
	b	.L63
.L804:
	mov	x8, x0
	sub	x17, x1, #1
	mov	x9, x28
	and	w14, w19, 7
	b	.L63
.L548:
	mov	x2, 4
.L456:
	sub	x14, x27, #8
	b	.L461
	.p2align 2,,3
.L462:
	ldr	x12, [x4, x2]
	add	x2, x2, 8
	ldr	x17, [x14, x2]
	cmp	x12, x17
	bne	.L847
.L461:
	add	w0, w2, 8
	mov	w11, w2
	cmp	w15, w0
	bcs	.L462
	and	x12, x2, 4294967295
	cmp	w15, w2
	bhi	.L465
	b	.L848
	.p2align 2,,3
.L467:
	add	x12, x12, 1
	cmp	w15, w12
	bls	.L849
.L465:
	ldrb	w2, [x4, x12]
	mov	w14, w12
	ldrb	w0, [x27, x12]
	cmp	w2, w0
	beq	.L467
	add	x2, x27, x12
	sub	w14, w12, #1
	mov	w11, w12
.L466:
	sub	w4, w27, w4
	uxtw	x15, w11
	b	.L468
.L798:
	ldp	x11, x22, [sp, 96]
	mov	x15, x26
	ldp	x21, x14, [sp, 112]
	mov	x4, x16
	mov	x26, x2
	and	w16, w19, 7
	b	.L141
.L797:
	ldp	x11, x22, [sp, 96]
	sub	x26, x2, #1
	ldp	x21, x14, [sp, 112]
	mov	x4, x18
	and	w16, w19, 7
	b	.L141
.L806:
	add	x7, x3, x9
	mov	x8, x0
	and	w14, w19, 7
	mov	x9, x27
	b	.L63
.L799:
	ldp	x11, x22, [sp, 96]
	add	x15, x7, x4
	ldp	x21, x14, [sp, 112]
	and	w16, w19, 7
	mov	x4, x25
	b	.L141
.L496:
	mov	x13, 4
.L109:
	sub	x27, x17, #8
	b	.L114
	.p2align 2,,3
.L115:
	ldr	x0, [x16, x13]
	add	x13, x13, 8
	ldr	x1, [x27, x13]
	cmp	x0, x1
	bne	.L850
.L114:
	add	w0, w13, 8
	mov	w15, w13
	cmp	w12, w0
	bcs	.L115
	and	x1, x13, 4294967295
	cmp	w12, w13
	bhi	.L118
	b	.L851
	.p2align 2,,3
.L119:
	add	x1, x1, 1
	cmp	w12, w1
	bls	.L852
.L118:
	ldrb	w13, [x16, x1]
	mov	w15, w1
	ldrb	w0, [x17, x1]
	cmp	w13, w0
	beq	.L119
	add	x1, x17, x1
	uxtw	x13, w15
	b	.L117
.L506:
	mov	x6, 4
.L185:
	sub	x30, x26, #8
	b	.L190
	.p2align 2,,3
.L191:
	ldr	x1, [x8, x6]
	add	x6, x6, 8
	ldr	x25, [x30, x6]
	cmp	x1, x25
	bne	.L853
.L190:
	add	w1, w6, 8
	mov	w18, w6
	cmp	w2, w1
	bcs	.L191
	and	x1, x6, 4294967295
	cmp	w2, w6
	bhi	.L194
	b	.L854
	.p2align 2,,3
.L195:
	add	x1, x1, 1
	cmp	w2, w1
	bls	.L855
.L194:
	ldrb	w25, [x8, x1]
	mov	w18, w1
	ldrb	w6, [x26, x1]
	cmp	w25, w6
	beq	.L195
	add	x1, x26, x1
	uxtw	x2, w18
	b	.L193
.L846:
	ldr	x3, [sp, 136]
	eor	x4, x15, x26
	b	.L367
.L845:
	ldr	x3, [sp, 96]
	eor	x10, x14, x25
	b	.L297
.L490:
	mov	w15, w19
	add	x5, x21, 2420
	b	.L57
.L500:
	add	x5, x21, 2420
	mov	w13, w19
	b	.L135
.L802:
	add	x4, x4, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x4, x4, #:tprel_lo12_nc:.LANCHOR1
	cmp	x25, x1
	mov	w5, -32768
	csel	x7, x25, x1, ls
	mov	x3, x27
	mov	w6, w5
	mov	x0, x23
	mov	x9, 0
	str	w5, [x4]
	str	w7, [x21, 32]
	b	.L54
.L795:
	add	x3, x3, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x3, x3, #:tprel_lo12_nc:.LANCHOR1
	cmp	x25, x2
	mov	w5, -32768
	csel	x6, x25, x2, ls
	mov	x7, x27
	mov	w9, w5
	mov	x1, x23
	mov	x4, 0
	str	w5, [x3]
	str	w6, [x21, 32]
	b	.L132
.L847:
	eor	x2, x12, x17
	b	.L459
.L420:
	ldr	w0, [x21, 3444]
	ldrb	w1, [x21, 3956]
	lsl	x0, x0, x19
	orr	x3, x0, x3
	str	x3, [x18, w24, uxtw]
	b	.L488
.L853:
	eor	x2, x1, x25
	b	.L188
.L850:
	eor	x13, x0, x1
	b	.L112
.L228:
	ldr	x11, [x17, 28]
	ldr	x10, [x27, 28]
	cmp	x11, x10
	beq	.L512
	eor	x10, x11, x10
	mov	w11, 28
	b	.L227
.L523:
	mov	x10, 36
	b	.L294
.L534:
	mov	x4, 36
	b	.L364
.L511:
	mov	x10, 4
.L224:
	sub	x11, x27, #8
	str	x2, [sp, 136]
	mov	x2, x11
	b	.L229
	.p2align 2,,3
.L230:
	ldr	x13, [x17, x10]
	add	x10, x10, 8
	ldr	x25, [x2, x10]
	cmp	x13, x25
	bne	.L856
.L229:
	add	w13, w10, 8
	mov	w11, w10
	cmp	w14, w13
	bcs	.L230
	ldr	x2, [sp, 136]
	cmp	w14, w10
	bls	.L232
	and	x10, x10, 4294967295
	.p2align 3,,7
.L233:
	ldrb	w25, [x17, x10]
	mov	w11, w10
	ldrb	w13, [x27, x10]
	cmp	w25, w13
	bne	.L232
	add	x10, x10, 1
	cmp	w14, w10
	bhi	.L233
	add	w11, w11, 1
	b	.L232
.L251:
	ldr	x3, [x12, 20]
	ldr	x10, [x27, 20]
	cmp	x3, x10
	beq	.L253
	eor	x3, x3, x10
	mov	w11, 20
	b	.L252
.L812:
	ldr	x18, [sp, 128]
	cmp	x1, 4
	bne	.L742
	mov	x1, x27
	add	x8, x27, 4
	.p2align 3,,7
.L424:
	ldrb	w2, [x1]
	add	x1, x1, 4
	ldrb	w4, [x1, -3]
	ldrb	w0, [x1, -2]
	add	x12, x5, x2
	add	x11, x5, x4
	ldrb	w9, [x1, -1]
	add	x6, x5, x0
	ldr	w7, [x5, x2, lsl 2]
	ldrb	w2, [x12, 1280]
	add	x16, x5, x9
	ldrb	w11, [x11, 1280]
	add	w15, w2, w19
	ldrb	w6, [x6, 1280]
	ldr	w13, [x5, x4, lsl 2]
	add	w14, w15, w11
	ldr	w12, [x5, x9, lsl 2]
	add	w4, w14, w6
	ldr	w0, [x5, x0, lsl 2]
	lsl	x7, x7, x19
	ldrb	w9, [x16, 1280]
	lsl	x13, x13, x15
	lsl	x12, x12, x4
	orr	x7, x7, x13
	lsl	x0, x0, x14
	orr	x0, x0, x12
	add	w4, w4, w9
	sub	w6, w6, #1
	orr	x0, x0, x7
	sub	w9, w9, #1
	sub	w2, w2, #1
	sub	w11, w11, #1
	orr	x0, x0, x3
	orr	w2, w2, w11
	orr	w3, w6, w9
	and	w9, w4, -8
	orr	w2, w2, w3
	lsr	w7, w4, 3
	sub	x6, x8, x1
	str	x0, [x20]
	orr	w10, w10, w2
	and	w19, w4, 7
	add	x20, x20, x7
	lsr	x3, x0, x9
	cmp	x6, 3
	bhi	.L424
	b	.L425
.L391:
	ldr	x2, [x11, 28]
	ldr	x4, [x27, 28]
	cmp	x2, x4
	beq	.L538
	eor	x2, x2, x4
	mov	w12, 28
	b	.L390
.L321:
	ldr	x2, [x13, 28]
	ldr	x10, [x27, 28]
	cmp	x2, x10
	beq	.L527
	eor	x2, x2, x10
	mov	w11, 28
	b	.L320
.L549:
	mov	x2, 36
	b	.L456
.L508:
	mov	x9, x27
	b	.L200
.L498:
	mov	x7, x27
	b	.L124
.L152:
	ldr	x1, [x10, 28]
	ldr	x2, [x26, 28]
	cmp	x1, x2
	beq	.L502
	eor	x1, x1, x2
	mov	w18, 28
	b	.L151
.L74:
	ldr	x0, [x16, 28]
	ldr	x1, [x17, 28]
	cmp	x0, x1
	beq	.L492
	eor	x0, x0, x1
	mov	w15, 28
	b	.L73
.L497:
	mov	x13, 36
	b	.L109
.L507:
	mov	x6, 36
	b	.L185
.L526:
	mov	x10, 4
.L317:
	sub	x17, x27, #8
	b	.L322
	.p2align 2,,3
.L323:
	ldr	x2, [x13, x10]
	add	x10, x10, 8
	ldr	x14, [x17, x10]
	cmp	x2, x14
	bne	.L857
.L322:
	add	w2, w10, 8
	mov	w11, w10
	cmp	w15, w2
	bcs	.L323
	and	x14, x10, 4294967295
	cmp	w15, w10
	bhi	.L326
	b	.L858
	.p2align 2,,3
.L328:
	add	x14, x14, 1
	cmp	w15, w14
	bls	.L859
.L326:
	ldrb	w11, [x13, x14]
	mov	w2, w14
	ldrb	w10, [x27, x14]
	cmp	w11, w10
	beq	.L328
	add	x10, x27, x14
	mov	w11, w14
	sub	w2, w14, #1
.L327:
	sub	w14, w27, w13
	uxtw	x13, w11
	b	.L329
.L537:
	mov	x4, 4
.L387:
	sub	x17, x27, #8
	b	.L392
	.p2align 2,,3
.L393:
	ldr	x2, [x11, x4]
	add	x4, x4, 8
	ldr	x15, [x17, x4]
	cmp	x2, x15
	bne	.L860
.L392:
	add	w2, w4, 8
	mov	w12, w4
	cmp	w16, w2
	bcs	.L393
	and	x2, x4, 4294967295
	cmp	w16, w4
	bhi	.L396
	b	.L861
	.p2align 2,,3
.L398:
	add	x2, x2, 1
	cmp	w16, w2
	bls	.L862
.L396:
	ldrb	w12, [x11, x2]
	mov	w15, w2
	ldrb	w4, [x27, x2]
	cmp	w12, w4
	beq	.L398
	add	x4, x27, x2
	sub	w15, w2, #1
	mov	w12, w2
.L397:
	sub	w11, w27, w11
	uxtw	x16, w12
	b	.L399
.L856:
	ldr	x2, [sp, 136]
	eor	x10, x13, x25
	b	.L227
.L501:
	mov	x2, 4
.L148:
	sub	x30, x26, #8
	b	.L153
	.p2align 2,,3
.L154:
	ldr	x1, [x10, x2]
	add	x2, x2, 8
	ldr	x25, [x30, x2]
	cmp	x1, x25
	bne	.L863
.L153:
	add	w1, w2, 8
	mov	w18, w2
	cmp	w6, w1
	bcs	.L154
	and	x1, x2, 4294967295
	cmp	w6, w2
	bhi	.L157
	b	.L864
	.p2align 2,,3
.L158:
	add	x1, x1, 1
	cmp	w6, w1
	bls	.L865
.L157:
	ldrb	w25, [x10, x1]
	mov	w18, w1
	ldrb	w2, [x26, x1]
	cmp	w25, w2
	beq	.L158
	add	x1, x26, x1
	uxtw	x2, w18
	b	.L156
.L491:
	mov	x12, 4
.L70:
	sub	x27, x17, #8
	b	.L75
	.p2align 2,,3
.L76:
	ldr	x0, [x16, x12]
	add	x12, x12, 8
	ldr	x1, [x27, x12]
	cmp	x0, x1
	bne	.L866
.L75:
	add	w0, w12, 8
	mov	w15, w12
	cmp	w13, w0
	bcs	.L76
	and	x1, x12, 4294967295
	cmp	w13, w12
	bhi	.L79
	b	.L867
	.p2align 2,,3
.L80:
	add	x1, x1, 1
	cmp	w13, w1
	bls	.L868
.L79:
	ldrb	w12, [x16, x1]
	mov	w15, w1
	ldrb	w0, [x17, x1]
	cmp	w12, w0
	beq	.L80
	add	x1, x17, x1
	uxtw	x13, w15
	b	.L78
.L542:
	mov	x1, 131072
	b	.L417
.L307:
	eor	x2, x2, x14
	mov	w17, 4
	b	.L309
.L377:
	eor	x17, x2, x15
	mov	w2, 4
	b	.L379
.L447:
	ldr	x2, [x4, 20]
	ldr	x14, [x27, 20]
	cmp	x2, x14
	beq	.L449
	eor	x2, x2, x14
	mov	w17, 20
	b	.L448
.L860:
	eor	x2, x2, x15
	b	.L390
.L857:
	eor	x2, x2, x14
	b	.L320
.L849:
	add	x2, x27, w12, uxtw
	add	w11, w14, 1
	b	.L466
.L863:
	eor	x1, x1, x25
	b	.L151
.L866:
	eor	x0, x0, x1
	b	.L73
.L855:
	add	x1, x26, w1, uxtw
	add	w2, w18, 1
	b	.L193
.L512:
	mov	x10, 36
	b	.L224
.L852:
	add	x1, x17, w1, uxtw
	add	w13, w15, 1
	b	.L117
.L253:
	ldr	x3, [x12, 28]
	ldr	x10, [x27, 28]
	cmp	x3, x10
	beq	.L516
	eor	x3, x3, x10
	mov	w11, 28
	b	.L252
.L793:
	ldr	x18, [sp, 136]
	cmp	x1, 4
	bne	.L284
	mov	x1, x27
	add	x8, x27, 4
.L285:
	ldrb	w2, [x1]
	add	x1, x1, 4
	ldrb	w0, [x1, -3]
	add	x4, x5, x2
	ldrb	w11, [x1, -2]
	add	x2, x21, x2, lsl 2
	add	x17, x5, x0
	add	x7, x2, 65536
	add	x0, x21, x0, lsl 2
	ldrb	w6, [x4, 1280]
	add	x13, x0, 65536
	ldr	w10, [x2, 2420]
	add	x12, x21, x11, lsl 2
	ldr	w4, [x7, 2496]
	add	x16, x12, 65536
	ldrb	w14, [x1, -1]
	add	x2, x5, x11
	add	w4, w4, 1
	str	w4, [x7, 2496]
	add	x15, x5, x14
	add	w22, w19, w6
	ldr	w4, [x13, 2496]
	add	x14, x21, x14, lsl 2
	ldrb	w11, [x17, 1280]
	lsl	x10, x10, x19
	ldr	w7, [x0, 2420]
	add	w0, w4, 1
	str	w0, [x13, 2496]
	add	w17, w22, w11
	add	x13, x14, 65536
	sub	w11, w11, #1
	ldr	w4, [x16, 2496]
	sub	w6, w6, #1
	ldrb	w0, [x2, 1280]
	lsl	x7, x7, x22
	ldr	w12, [x12, 2420]
	add	w2, w4, 1
	str	w2, [x16, 2496]
	sub	w4, w0, #1
	add	w2, w17, w0
	orr	x7, x7, x10
	ldr	w0, [x14, 2420]
	orr	w6, w6, w11
	ldrb	w10, [x15, 1280]
	lsl	x12, x12, x17
	ldr	w11, [x13, 2496]
	lsl	x0, x0, x2
	orr	x0, x0, x12
	add	w2, w2, w10
	orr	x0, x0, x7
	sub	w10, w10, #1
	orr	x0, x0, x3
	and	w7, w2, -8
	orr	w3, w4, w10
	add	w4, w11, 1
	str	w4, [x13, 2496]
	orr	w3, w6, w3
	sub	x4, x8, x1
	lsr	w6, w2, 3
	str	x0, [x20]
	orr	w9, w9, w3
	and	w19, w2, 7
	add	x20, x20, x6
	lsr	x3, x0, x7
	cmp	x4, 3
	bhi	.L285
	b	.L286
.L284:
	ldrb	w0, [x27], 1
	add	x1, x5, x0
	add	x0, x21, x0, lsl 2
	add	x6, x0, 65536
	ldrb	w1, [x1, 1280]
	ldr	w0, [x0, 2420]
	ldr	w4, [x6, 2496]
	add	w2, w1, w19
	and	w7, w2, -8
	sub	w1, w1, #1
	add	w4, w4, 1
	lsl	x0, x0, x19
	orr	x0, x0, x3
	str	w4, [x6, 2496]
	lsr	w4, w2, 3
	str	x0, [x20]
	orr	w9, w9, w1
	and	w19, w2, 7
	add	x20, x20, x4
	lsr	x3, x0, x7
	cmp	x27, x22
	bne	.L284
	b	.L286
.L820:
	ldr	x18, [sp, 96]
	cmp	x1, 4
	bne	.L739
	mov	x1, x27
	add	x8, x27, 4
.L355:
	ldrb	w0, [x1]
	add	x1, x1, 4
	ldrb	w7, [x1, -3]
	ldrb	w4, [x1, -2]
	add	x2, x5, x0
	add	x11, x5, x7
	ldrb	w9, [x1, -1]
	add	x6, x5, x4
	ldr	w0, [x5, x0, lsl 2]
	ldrb	w2, [x2, 1280]
	add	x16, x5, x9
	ldrb	w11, [x11, 1280]
	add	w15, w2, w19
	ldrb	w6, [x6, 1280]
	ldr	w13, [x5, x7, lsl 2]
	add	w14, w15, w11
	ldr	w7, [x5, x4, lsl 2]
	add	w4, w14, w6
	ldr	w12, [x5, x9, lsl 2]
	lsl	x0, x0, x19
	ldrb	w9, [x16, 1280]
	lsl	x13, x13, x15
	lsl	x7, x7, x14
	orr	x0, x0, x13
	lsl	x12, x12, x4
	orr	x7, x7, x12
	add	w4, w4, w9
	sub	w6, w6, #1
	orr	x0, x0, x7
	sub	w9, w9, #1
	sub	w2, w2, #1
	sub	w11, w11, #1
	orr	x0, x0, x3
	orr	w2, w2, w11
	orr	w3, w6, w9
	and	w9, w4, -8
	orr	w2, w2, w3
	lsr	w7, w4, 3
	sub	x6, x8, x1
	str	x0, [x20]
	orr	w10, w10, w2
	and	w19, w4, 7
	add	x20, x20, x7
	lsr	x3, x0, x9
	cmp	x6, 3
	bhi	.L355
	b	.L425
.L503:
	mov	x9, x27
	b	.L163
.L538:
	mov	x4, 36
	b	.L387
.L527:
	mov	x10, 36
	b	.L317
.L493:
	mov	x7, x27
	b	.L85
.L492:
	mov	x12, 36
	b	.L70
.L502:
	mov	x2, 36
	b	.L148
.L515:
	mov	x10, 4
.L249:
	sub	x16, x27, #8
	b	.L254
	.p2align 2,,3
.L255:
	ldr	x3, [x12, x10]
	add	x10, x10, 8
	ldr	x13, [x16, x10]
	cmp	x3, x13
	bne	.L869
.L254:
	add	w3, w10, 8
	mov	w11, w10
	cmp	w14, w3
	bcs	.L255
	and	x13, x10, 4294967295
	cmp	w14, w10
	bhi	.L258
	b	.L870
	.p2align 2,,3
.L260:
	add	x13, x13, 1
	cmp	w14, w13
	bls	.L871
.L258:
	ldrb	w11, [x12, x13]
	mov	w3, w13
	ldrb	w10, [x27, x13]
	cmp	w11, w10
	beq	.L260
	add	x10, x27, x13
	mov	w11, w13
	sub	w3, w13, #1
.L259:
	sub	w13, w27, w12
	uxtw	x12, w11
	b	.L236
.L239:
	eor	x3, x3, x12
	mov	w18, 4
	b	.L241
.L520:
	mov	x1, 131072
	b	.L278
.L785:
	mov	x18, x14
	orr	w11, w11, w19
	add	x27, x12, x4
	b	.L172
.L770:
	orr	w15, w19, w15
	add	x27, x3, x9
	b	.L96
.L865:
	add	x1, x26, w1, uxtw
	add	w2, w18, 1
	b	.L156
.L859:
	add	x10, x27, w14, uxtw
	add	w11, w2, 1
	b	.L327
.L378:
	ldr	x2, [x11, 20]
	ldr	x15, [x27, 20]
	cmp	x2, x15
	beq	.L380
	eor	x17, x2, x15
	mov	w2, 20
	b	.L379
.L449:
	ldr	x2, [x4, 28]
	ldr	x14, [x27, 28]
	cmp	x2, x14
	beq	.L547
	eor	x2, x2, x14
	mov	w17, 28
	b	.L448
.L862:
	add	x4, x27, w2, uxtw
	add	w12, w15, 1
	b	.L397
.L546:
	mov	x14, 4
.L445:
	sub	x25, x27, #8
	b	.L450
.L451:
	ldr	x2, [x4, x14]
	add	x14, x14, 8
	ldr	x24, [x25, x14]
	cmp	x2, x24
	bne	.L872
.L450:
	add	w0, w14, 8
	mov	w17, w14
	cmp	w15, w0
	bcs	.L451
	cmp	w15, w14
	bls	.L452
	and	x14, x14, 4294967295
.L453:
	ldrb	w2, [x4, x14]
	mov	w17, w14
	ldrb	w0, [x27, x14]
	add	x14, x14, 1
	cmp	w2, w0
	bne	.L452
	cmp	w15, w14
	bhi	.L453
	add	w17, w17, 1
	b	.L452
.L869:
	eor	x3, x3, x13
	b	.L252
.L308:
	ldr	x2, [x13, 20]
	ldr	x14, [x27, 20]
	cmp	x2, x14
	beq	.L310
	eor	x2, x2, x14
	mov	w17, 20
	b	.L309
.L868:
	add	x1, x17, w1, uxtw
	add	w13, w15, 1
	b	.L78
.L516:
	mov	x10, 36
	b	.L249
.L844:
	ldr	x18, [sp, 96]
	cmp	x0, 4
	bne	.L214
	mov	x1, x27
	add	x8, x27, 4
	mov	x11, x2
.L215:
	ldrb	w3, [x1]
	add	x1, x1, 4
	ldrb	w0, [x1, -3]
	add	x2, x5, x3
	ldrb	w7, [x1, -2]
	add	x3, x21, x3, lsl 2
	add	x17, x5, x0
	add	x4, x3, 65536
	add	x0, x21, x0, lsl 2
	ldrb	w10, [x2, 1280]
	add	x13, x0, 65536
	ldr	w6, [x3, 2420]
	add	x12, x21, x7, lsl 2
	ldr	w2, [x4, 2496]
	add	x16, x12, 65536
	ldrb	w14, [x1, -1]
	add	x3, x5, x7
	add	w2, w2, 1
	str	w2, [x4, 2496]
	add	x15, x5, x14
	add	w22, w19, w10
	ldr	w2, [x13, 2496]
	add	x14, x21, x14, lsl 2
	ldrb	w7, [x17, 1280]
	lsl	x6, x6, x19
	ldr	w4, [x0, 2420]
	add	w0, w2, 1
	str	w0, [x13, 2496]
	add	w17, w22, w7
	add	x13, x14, 65536
	sub	w10, w10, #1
	ldr	w2, [x16, 2496]
	sub	w7, w7, #1
	ldrb	w0, [x3, 1280]
	lsl	x4, x4, x22
	ldr	w12, [x12, 2420]
	add	w2, w2, 1
	str	w2, [x16, 2496]
	add	w3, w17, w0
	sub	w2, w0, #1
	orr	x4, x4, x6
	ldr	w0, [x14, 2420]
	orr	w7, w10, w7
	ldrb	w6, [x15, 1280]
	lsl	x12, x12, x17
	ldr	w10, [x13, 2496]
	lsl	x0, x0, x3
	orr	x0, x0, x12
	add	w3, w3, w6
	orr	x0, x0, x4
	sub	w6, w6, #1
	orr	x0, x0, x11
	orr	w2, w2, w6
	add	w4, w10, 1
	and	w11, w3, -8
	str	w4, [x13, 2496]
	orr	w2, w2, w7
	lsr	w6, w3, 3
	sub	x4, x8, x1
	str	x0, [x20]
	orr	w9, w9, w2
	and	w19, w3, 7
	add	x20, x20, x6
	lsr	x11, x0, x11
	cmp	x4, 3
	bhi	.L215
	mov	x2, x11
	b	.L216
.L214:
	ldrb	w0, [x27], 1
	add	x1, x5, x0
	add	x0, x21, x0, lsl 2
	add	x6, x0, 65536
	ldrb	w1, [x1, 1280]
	ldr	w0, [x0, 2420]
	ldr	w4, [x6, 2496]
	add	w3, w19, w1
	and	w7, w3, -8
	sub	w1, w1, #1
	add	w4, w4, 1
	lsl	x0, x0, x19
	orr	x0, x0, x2
	str	w4, [x6, 2496]
	lsr	w4, w3, 3
	str	x0, [x20]
	orr	w9, w9, w1
	and	w19, w3, 7
	add	x20, x20, x4
	lsr	x2, x0, x7
	cmp	x27, x22
	bne	.L214
	b	.L216
.L807:
	orr	w15, w15, w19
	add	x27, x3, x9
	b	.L57
.L872:
	eor	x2, x2, x24
	b	.L448
.L800:
	mov	x18, x14
	orr	w13, w19, w13
	add	x27, x7, x4
	b	.L135
.L871:
	add	x10, x27, w13, uxtw
	add	w11, w3, 1
	b	.L259
.L380:
	ldr	x2, [x11, 28]
	ldr	x15, [x27, 28]
	cmp	x2, x15
	beq	.L536
	eor	x17, x2, x15
	mov	w2, 28
	b	.L379
.L310:
	ldr	x2, [x13, 28]
	ldr	x14, [x27, 28]
	cmp	x2, x14
	beq	.L525
	eor	x2, x2, x14
	mov	w17, 28
	b	.L309
.L524:
	mov	x2, 4
.L306:
	sub	x25, x27, #8
	b	.L311
.L312:
	ldr	x14, [x13, x2]
	add	x2, x2, 8
	ldr	x23, [x25, x2]
	cmp	x14, x23
	bne	.L873
.L311:
	add	w14, w2, 8
	mov	w17, w2
	cmp	w15, w14
	bcs	.L312
	cmp	w15, w2
	bls	.L313
	and	x2, x2, 4294967295
.L314:
	ldrb	w23, [x13, x2]
	mov	w17, w2
	ldrb	w14, [x27, x2]
	add	x2, x2, 1
	cmp	w23, w14
	bne	.L313
	cmp	w15, w2
	bhi	.L314
	add	w17, w17, 1
	b	.L313
.L211:
	ldr	w0, [x21, 3444]
	ldrb	w1, [x21, 3956]
	lsl	x0, x0, x19
	orr	x2, x0, x2
	str	x2, [x18, w24, uxtw]
	b	.L485
.L240:
	ldr	x3, [x13, 20]
	ldr	x12, [x27, 20]
	cmp	x3, x12
	beq	.L242
	eor	x3, x3, x12
	mov	w18, 20
	b	.L241
.L547:
	mov	x14, 36
	b	.L445
.L535:
	mov	x15, 4
.L376:
	sub	x26, x27, #8
	b	.L381
.L382:
	ldr	x17, [x11, x15]
	add	x15, x15, 8
	ldr	x23, [x26, x15]
	cmp	x17, x23
	bne	.L874
.L381:
	add	w17, w15, 8
	mov	w2, w15
	cmp	w16, w17
	bcs	.L382
	cmp	w16, w15
	bls	.L383
	and	x15, x15, 4294967295
.L384:
	ldrb	w23, [x11, x15]
	mov	w2, w15
	ldrb	w17, [x27, x15]
	add	x15, x15, 1
	cmp	w23, w17
	bne	.L383
	cmp	w16, w15
	bhi	.L384
	add	w2, w2, 1
	b	.L383
.L525:
	mov	x2, 36
	b	.L306
.L874:
	eor	x17, x17, x23
	b	.L379
.L742:
	mov	x0, x3
.L423:
	ldrb	w1, [x27], 1
	add	x2, x5, x1
	ldr	w3, [x5, x1, lsl 2]
	ldrb	w1, [x2, 1280]
	add	w2, w1, w19
	lsl	x3, x3, x19
	and	w4, w2, -8
	orr	x0, x3, x0
	sub	w1, w1, #1
	lsr	w3, w2, 3
	str	x0, [x20]
	orr	w10, w10, w1
	and	w19, w2, 7
	add	x20, x20, x3
	lsr	x0, x0, x4
	cmp	x27, x22
	bne	.L423
	mov	x3, x0
	b	.L425
.L536:
	mov	x15, 36
	b	.L376
.L873:
	eor	x2, x14, x23
	b	.L309
.L242:
	ldr	x3, [x13, 28]
	ldr	x12, [x27, 28]
	cmp	x3, x12
	beq	.L514
	eor	x3, x3, x12
	mov	w18, 28
	b	.L241
.L513:
	mov	x12, 4
.L238:
	sub	x25, x27, #8
	b	.L243
.L244:
	ldr	x3, [x13, x12]
	add	x12, x12, 8
	ldr	x16, [x25, x12]
	cmp	x3, x16
	bne	.L875
.L243:
	add	w3, w12, 8
	mov	w18, w12
	cmp	w14, w3
	bcs	.L244
	cmp	w14, w12
	bls	.L245
	and	x12, x12, 4294967295
.L246:
	ldrb	w16, [x13, x12]
	mov	w18, w12
	ldrb	w3, [x27, x12]
	add	x12, x12, 1
	cmp	w16, w3
	bne	.L245
	cmp	w14, w12
	bhi	.L246
	add	w18, w18, 1
	b	.L245
.L875:
	eor	x3, x3, x16
	b	.L241
.L514:
	mov	x12, 36
	b	.L238
.L854:
	add	x1, x6, x26
	uxtw	x2, w6
	b	.L193
.L861:
	add	x4, x4, x27
	sub	w15, w12, #1
	b	.L397
.L864:
	add	x1, x2, x26
	uxtw	x2, w2
	b	.L156
.L858:
	add	x10, x10, x27
	sub	w2, w11, #1
	b	.L327
.L739:
	mov	x0, x3
.L354:
	ldrb	w1, [x27], 1
	add	x2, x5, x1
	ldr	w3, [x5, x1, lsl 2]
	ldrb	w1, [x2, 1280]
	add	w2, w1, w19
	lsl	x3, x3, x19
	and	w4, w2, -8
	orr	x0, x3, x0
	sub	w1, w1, #1
	lsr	w3, w2, 3
	str	x0, [x20]
	orr	w10, w10, w1
	and	w19, w2, 7
	add	x20, x20, x3
	lsr	x0, x0, x4
	cmp	x27, x22
	bne	.L354
	mov	x3, x0
	b	.L425
.L867:
	add	x1, x12, x17
	uxtw	x13, w12
	b	.L78
.L848:
	add	x2, x2, x27
	sub	w14, w11, #1
	b	.L466
.L851:
	add	x1, x13, x17
	uxtw	x13, w13
	b	.L117
.L489:
	mov	x0, x23
	b	.L54
.L870:
	add	x10, x10, x27
	sub	w3, w11, #1
	b	.L259
.L494:
	mov	x0, x23
	mov	x1, 131072
	b	.L93
.L499:
	mov	x1, x23
	b	.L132
.L504:
	mov	x1, x23
	mov	x2, 131072
	b	.L169
	.cfi_endproc
.LFE4055:
	.size	deflate_direct, .-deflate_direct
