deflate_direct:
.LFB4055:
	.cfi_startproc
	stp	x29, x30, [sp, -160]!
	.cfi_def_cfa_offset 160
	.cfi_offset 29, -160
	.cfi_offset 30, -152
	mov	w5, -1
	and	w4, w4, 255
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -128
	.cfi_offset 22, -120
	mov	x21, x0
	add	x0, x0, 65536
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -112
	.cfi_offset 24, -104
	ldr	w23, [x21, 1104]
	stp	x27, x28, [sp, 80]
	.cfi_offset 27, -80
	.cfi_offset 28, -72
	mov	x27, x1
	ldrb	w1, [x0, 2481]
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -144
	.cfi_offset 20, -136
	and	w19, w23, 7
	mov	x28, x2
	str	x3, [sp, 96]
	add	x22, x27, x2
	lsr	w2, w23, 3
	lsl	w5, w5, w19
	add	x20, x3, x2
	mvn	w5, w5
	ldrb	w3, [x0, 2480]
	tbz	x1, 0, .L50
	stp	x25, x26, [sp, 64]
	.cfi_offset 26, -88
	.cfi_offset 25, -96
	add	x24, x21, 73728
	add	x23, x21, 56
	add	x24, x24, 352
	tbz	x4, 0, .L51
	cmp	w3, 13
	beq	.L781
	cmp	x28, 9
	bls	.L498
	cmp	x28, 12
	sub	x26, x22, #12
	csel	x26, x26, x27, hi
	sub	x25, x22, #9
.L92:
	ldr	x0, [sp, 96]
	mov	x17, 5316
	add	x1, x21, x17
	str	x2, [sp, 104]
	str	w5, [sp, 112]
	bl	memcpy
	ldr	x2, [sp, 104]
	mov	x1, 32768
	ldr	w6, [x21, 32]
	add	x0, x21, x2
	ldr	w5, [sp, 112]
	add	x0, x0, 4096
	uxtw	x3, w6
	sub	x2, x1, x3
	ldrb	w0, [x0, 1220]
	str	wzr, [x21, 1124]
	and	w0, w0, w5
	cmp	x28, x2
	bcs	.L782
	mrs	x1, tpidr_el0
	ldr	w4, [x21, 36]
	add	x1, x1, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x1, x1, #:tprel_lo12_nc:.LANCHOR1
	add	w28, w6, w28
	sub	w6, w6, #1
	str	w28, [x21, 32]
	sub	x3, x27, x3
	str	w6, [x1]
	cmp	w4, 14
	bls	.L783
.L95:
	cmp	x27, x25
	bcs	.L501
	ldr	x1, [x27]
	mov	x7, 2264924160
	movk	x7, 0xebca, lsl 32
	adrp	x10, .LANCHOR0
	movk	x7, 0xb185, lsl 48
	add	x10, x10, :lo12:.LANCHOR0
	add	x17, x10, 432
	mov	w13, w19
	mul	x1, x1, x7
	mov	x19, x17
	add	x28, x10, 464
	add	x18, x10, 720
	add	x5, x21, 2420
	add	x14, x25, 1
	mov	x17, x10
	lsr	x1, x1, 48
	mov	w9, 0
.L98:
	cmp	x27, x26
	bcs	.L784
.L104:
	ldr	x2, [x27]
	ubfiz	x1, x1, 1, 16
	sub	x8, x27, x3
	lsr	x4, x2, 8
	ldrsh	w16, [x24, x1]
	strh	w8, [x24, x1]
	mul	x4, x4, x7
	lsr	x4, x4, 48
	cmp	w16, w6
	ble	.L99
	ldr	w1, [x3, w16, sxtw]
	add	x16, x3, w16, sxtw
	cmp	w1, w2
	beq	.L503
.L99:
	ldr	x10, [x27, 1]
	add	x8, x21, w2, uxtb 2
	add	x8, x8, 65536
	and	x1, x2, 255
	add	x2, x27, 1
	lsr	x11, x10, 8
	ldr	w15, [x8, 2496]
	ldr	w12, [x23, x1, lsl 2]
	add	w1, w15, 1
	str	w1, [x8, 2496]
	mul	x8, x11, x7
	and	x1, x12, 65535
	ldrsh	w16, [x24, x4, lsl 1]
	sub	x11, x2, x3
	strh	w11, [x24, x4, lsl 1]
	lsl	x1, x1, x13
	lsr	x4, x8, 48
	orr	x0, x0, x1
	add	w13, w13, w12, lsr 16
	cmp	w16, w6
	ble	.L101
	ldr	w1, [x3, w16, sxtw]
	add	x16, x3, w16, sxtw
	cmp	w1, w10
	beq	.L765
.L101:
	ldr	x8, [x27, 2]
	add	x11, x21, w10, uxtb 2
	add	x11, x11, 65536
	and	x1, x10, 255
	add	x2, x27, 2
	lsr	x10, x8, 8
	ldr	w15, [x11, 2496]
	ldr	w12, [x23, x1, lsl 2]
	add	w1, w15, 1
	str	w1, [x11, 2496]
	mul	x10, x10, x7
	and	x1, x12, 65535
	ldrsh	w16, [x24, x4, lsl 1]
	sub	x11, x2, x3
	strh	w11, [x24, x4, lsl 1]
	lsl	x1, x1, x13
	lsr	x10, x10, 48
	orr	x0, x0, x1
	add	w13, w13, w12, lsr 16
	cmp	w16, w6
	ble	.L102
	ldr	w1, [x3, w16, sxtw]
	add	x16, x3, w16, sxtw
	cmp	w1, w8
	beq	.L765
.L102:
	ldr	x4, [x27, 3]
	add	x11, x21, w8, uxtb 2
	add	x11, x11, 65536
	and	x8, x8, 255
	add	x2, x27, 3
	lsr	x1, x4, 8
	ldr	w15, [x11, 2496]
	ldr	w12, [x23, x8, lsl 2]
	add	w8, w15, 1
	str	w8, [x11, 2496]
	mul	x1, x1, x7
	and	x8, x12, 65535
	ldrsh	w16, [x24, x10, lsl 1]
	sub	x11, x2, x3
	strh	w11, [x24, x10, lsl 1]
	lsl	x8, x8, x13
	lsr	x1, x1, 48
	orr	x0, x0, x8
	add	w13, w13, w12, lsr 16
	cmp	w16, w6
	ble	.L103
	ldr	w8, [x3, w16, sxtw]
	add	x16, x3, w16, sxtw
	cmp	w8, w4
	beq	.L765
.L103:
	and	x2, x4, 255
	add	x4, x21, w4, uxtb 2
	add	x4, x4, 65536
	add	x27, x27, 4
	ldr	w2, [x23, x2, lsl 2]
	ldr	w10, [x4, 2496]
	and	x8, x2, 65535
	add	w2, w13, w2, lsr 16
	add	w10, w10, 1
	lsl	x8, x8, x13
	orr	x8, x8, x0
	and	w0, w2, 56
	str	w10, [x4, 2496]
	ubfx	x4, x2, 3, 3
	str	x8, [x20]
	orr	w9, w9, w2
	and	w13, w2, 7
	add	x20, x20, x4
	lsr	x0, x8, x0
	cmp	x27, x26
	bcc	.L104
.L784:
	cmp	x25, x27
	bls	.L767
	.p2align 3,,7
.L105:
	ldr	x2, [x27]
	ubfiz	x11, x1, 1, 16
	sub	x4, x27, x3
	and	x12, x2, 255
	lsr	x1, x2, 8
	ldrsh	w10, [x24, x11]
	add	x8, x21, w2, uxtb 2
	strh	w4, [x24, x11]
	add	x8, x8, 65536
	mul	x1, x1, x7
	add	x16, x3, w10, sxtw
	lsr	x1, x1, 48
	cmp	w10, w6
	ble	.L106
	ldr	w4, [x3, w10, sxtw]
	cmp	w4, w2
	beq	.L503
.L106:
	ldr	w2, [x23, x12, lsl 2]
	add	x27, x27, 1
	ldr	w10, [x8, 2496]
	and	x4, x2, 65535
	add	w2, w13, w2, lsr 16
	add	w10, w10, 1
	lsl	x4, x4, x13
	and	w11, w2, 56
	orr	x0, x4, x0
	str	w10, [x8, 2496]
	ubfx	x4, x2, 3, 3
	str	x0, [x20]
	orr	w9, w9, w2
	and	w13, w2, 7
	add	x20, x20, x4
	lsr	x0, x0, x11
	cmp	x25, x27
	bne	.L105
.L767:
	mov	w19, w13
	orr	w9, w9, w13
.L97:
	sub	x1, x22, x27
	str	x0, [x20]
	cmp	x1, 3
	bls	.L506
	sub	x1, x1, #4
	lsr	x2, x1, 2
	add	x7, x2, 1
	add	x7, x27, x7, lsl 2
	.p2align 3,,7
.L125:
	ldrb	w3, [x27]
	add	x27, x27, 4
	ldrb	w12, [x27, -3]
	ldrb	w14, [x27, -2]
	add	x8, x21, x3, lsl 2
	ldrb	w13, [x27, -1]
	add	x8, x8, 65536
	add	x6, x21, x12, lsl 2
	add	x6, x6, 65536
	ldr	w3, [x23, x3, lsl 2]
	add	x4, x21, x14, lsl 2
	add	x11, x21, x13, lsl 2
	ldr	w10, [x8, 2496]
	add	x4, x4, 65536
	add	w15, w19, w3, lsr 16
	and	x3, x3, 65535
	add	w10, w10, 1
	str	w10, [x8, 2496]
	lsl	x3, x3, x19
	add	x11, x11, 65536
	ldr	w8, [x6, 2496]
	ldr	w10, [x23, x12, lsl 2]
	add	w8, w8, 1
	str	w8, [x6, 2496]
	and	x6, x10, 65535
	ldr	w12, [x4, 2496]
	add	w10, w15, w10, lsr 16
	ldr	w8, [x23, x14, lsl 2]
	lsl	x6, x6, x15
	add	w12, w12, 1
	str	w12, [x4, 2496]
	orr	x6, x6, x3
	and	x4, x8, 65535
	ldr	w3, [x23, x13, lsl 2]
	add	w8, w10, w8, lsr 16
	ldr	w12, [x11, 2496]
	lsl	x4, x4, x10
	and	x13, x3, 65535
	add	w3, w8, w3, lsr 16
	add	w10, w12, 1
	lsl	x8, x13, x8
	orr	x4, x4, x8
	orr	x4, x4, x6
	and	w6, w3, 56
	orr	x0, x4, x0
	str	w10, [x11, 2496]
	ubfx	x4, x3, 3, 3
	str	x0, [x20]
	orr	w9, w9, w3
	and	w19, w3, 7
	add	x20, x20, x4
	lsr	x0, x0, x6
	cmp	x27, x7
	bne	.L125
	sub	x1, x1, x2, lsl 2
.L124:
	cbz	x1, .L126
	add	x22, x7, x1
.L127:
	ldrb	w1, [x7], 1
	add	x2, x21, x1, lsl 2
	add	x2, x2, 65536
	ldr	w1, [x23, x1, lsl 2]
	and	x4, x1, 65535
	ldr	w3, [x2, 2496]
	add	w1, w19, w1, lsr 16
	lsl	x4, x4, x19
	and	w6, w1, 56
	orr	x0, x4, x0
	add	w3, w3, 1
	str	w3, [x2, 2496]
	ubfx	x2, x1, 3, 3
	str	x0, [x20]
	orr	w9, w9, w1
	and	w19, w1, 7
	add	x20, x20, x2
	lsr	x0, x0, x6
	cmp	x7, x22
	bne	.L127
.L126:
	ldrb	w1, [x5, 1536]
	ldr	w2, [x5, 1024]
	add	w1, w1, w19
	orr	w9, w1, w9
	lsl	x2, x2, x19
	orr	x2, x2, x0
	str	x2, [x20]
	cmp	w9, 63
	bls	.L775
.L128:
	ldp	x19, x20, [sp, 16]
	mov	x0, 0
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	.cfi_restore 26
	.cfi_restore 25
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
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
	.cfi_def_cfa_offset 160
	.cfi_offset 19, -144
	.cfi_offset 20, -136
	.cfi_offset 21, -128
	.cfi_offset 22, -120
	.cfi_offset 23, -112
	.cfi_offset 24, -104
	.cfi_offset 27, -80
	.cfi_offset 28, -72
	.cfi_offset 29, -160
	.cfi_offset 30, -152
	ldr	w0, [x0, 2492]
	mov	w1, 258
	str	x2, [sp, 104]
	mov	x14, 5316
	cmp	w0, w1
	str	w5, [sp, 112]
	csel	w0, w0, w1, ls
	str	w0, [sp, 128]
	ldr	x0, [sp, 96]
	lsr	w23, w23, 3
	add	x1, x21, x14
	tbnz	x4, 0, .L785
	cmp	w3, 13
	beq	.L786
	bl	memcpy
	ldr	x2, [sp, 104]
	ldr	w1, [x21, 32]
	add	x0, x21, x2
	ldr	w5, [sp, 112]
	add	x0, x0, 4096
	uxtw	x6, w1
	mov	x2, 32768
	sub	x3, x2, x6
	ldrb	w0, [x0, 1220]
	str	wzr, [x21, 1124]
	and	w0, w0, w5
	cmp	x28, x3
	bcs	.L787
	mrs	x2, tpidr_el0
	ldr	w3, [x21, 36]
	add	x2, x2, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x2, x2, #:tprel_lo12_nc:.LANCHOR1
	sub	w16, w1, #1
	add	w1, w1, w28
	str	w1, [x21, 32]
	sub	x6, x27, x6
	str	w16, [x2]
	cmp	w3, 14
	bls	.L788
.L418:
	cbz	x28, .L420
	adrp	x1, .LANCHOR0
	add	x1, x1, :lo12:.LANCHOR0
	add	x2, x1, 464
	add	x13, x21, 73728
	add	x30, x1, 848
	add	x13, x13, 352
	add	x7, x21, 204800
	mov	w8, 42941
	str	x2, [sp, 104]
	add	x2, x1, 720
	movi	v0.8h, 0x80, lsl 8
	add	x1, x1, 432
	ldr	w23, [sp, 128]
	add	x5, x21, 2420
	add	x7, x7, 352
	mov	x9, x13
	mov	x28, x30
	mov	w12, 0
	mov	w10, 0
	movk	w8, 0x1e35, lsl 16
	stp	x25, x26, [sp, 64]
	.cfi_offset 26, -88
	.cfi_offset 25, -96
	sxth	w26, w16
	stp	x2, x1, [sp, 112]
	mov	w2, 0
	mov	w4, w2
	b	.L483
	.p2align 2,,3
.L793:
	mov	w1, -32767
	add	w1, w11, w1
	sxth	w11, w11
.L427:
	ldr	w2, [x27, 1]
	ubfiz	x4, x4, 2, 32
	cmp	w16, w1
	add	x18, x21, x4
	add	x18, x18, 73728
	sub	w3, w3, #32768
	ldr	w17, [x27]
	mul	w2, w2, w8
	sxth	w3, w3
	ldrsh	w14, [x18, 352]
	csel	w3, w26, w3, ge
	lsr	w1, w2, 17
	lsr	w2, w2, 17
	add	x25, x13, x1, lsl 2
	prfm	PSTL1KEEP, [x25]
	strh	w11, [x18, 352]
	cmp	w14, w3
	ble	.L431
	add	x11, x9, x4
	ldr	w25, [x6, w14, sxtw]
	add	x18, x6, w14, sxtw
	ldrsh	w4, [x11, 2]
	strh	w14, [x11, 2]
	cmp	w17, w25
	beq	.L789
	cmp	w3, w4
	bge	.L431
	ldr	w3, [x6, w4, sxtw]
	add	x4, x6, w4, sxtw
	cmp	w17, w3
	beq	.L790
.L431:
	mov	x3, x27
	add	w12, w12, 1
	ldrb	w1, [x3], 1
	add	x4, x5, x1
	ldr	w1, [x5, x1, lsl 2]
	ldrb	w4, [x4, 1280]
	add	w11, w4, w19
	lsl	x1, x1, x19
	orr	x1, x1, x0
	and	w0, w11, -8
	sub	w4, w4, #1
	lsr	w14, w11, 3
	str	x1, [x20]
	orr	w10, w10, w4
	and	w19, w11, 7
	add	x20, x20, x14
	lsr	x0, x1, x0
	tst	x12, 15
	beq	.L791
.L474:
	cmp	x3, x22
	beq	.L425
.L479:
	mov	w4, w2
	mov	x27, x3
.L483:
	sub	x1, x22, x27
	mov	w24, w23
	mov	w15, 258
	cmp	x1, 257
	bls	.L792
.L421:
	sub	x11, x27, x6
	mov	w3, w11
	cmp	w11, 32768
	bne	.L793
	mov	x1, x13
	.p2align 3,,7
.L428:
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
	bne	.L428
	add	x6, x6, 32768
	mov	w11, 0
	mov	w1, -32767
	mov	w3, 0
	b	.L427
	.p2align 2,,3
.L51:
	cmp	w3, 13
	beq	.L794
	cmp	x28, 9
	bls	.L516
	cmp	x28, 12
	sub	x26, x22, #12
	csel	x26, x26, x27, hi
	sub	x25, x22, #9
.L168:
	ldr	x0, [sp, 96]
	mov	x15, 5316
	add	x1, x21, x15
	str	x2, [sp, 104]
	str	w5, [sp, 112]
	bl	memcpy
	ldr	x2, [sp, 104]
	mov	x1, 32768
	ldr	w4, [x21, 32]
	add	x0, x21, x2
	ldr	w5, [sp, 112]
	add	x0, x0, 4096
	uxtw	x3, w4
	sub	x2, x1, x3
	ldrb	w10, [x0, 1220]
	str	wzr, [x21, 1124]
	and	w10, w10, w5
	cmp	x28, x2
	bcs	.L795
	mrs	x0, tpidr_el0
	ldr	w2, [x21, 36]
	add	x0, x0, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x0, x0, #:tprel_lo12_nc:.LANCHOR1
	add	w28, w4, w28
	sub	w4, w4, #1
	str	w28, [x21, 32]
	sub	x3, x27, x3
	str	w4, [x0]
	cmp	w2, 14
	bls	.L796
.L171:
	cmp	x27, x25
	bcs	.L519
	ldr	x1, [x27]
	mov	x6, 2264924160
	movk	x6, 0xebca, lsl 32
	adrp	x8, .LANCHOR0
	movk	x6, 0xb185, lsl 48
	add	x8, x8, :lo12:.LANCHOR0
	add	x30, x8, 464
	add	x28, x8, 720
	mul	x1, x1, x6
	add	x8, x8, 432
	add	x5, x21, 2420
	add	x14, x25, 1
	mov	w11, 0
	mov	x18, 258
	lsr	x1, x1, 48
	mov	w17, 256
.L174:
	cmp	x27, x26
	bcs	.L797
.L180:
	ldr	x9, [x27]
	ubfiz	x1, x1, 1, 16
	sub	x2, x27, x3
	lsr	x7, x9, 8
	ldrsh	w0, [x24, x1]
	strh	w2, [x24, x1]
	mul	x7, x7, x6
	lsr	x7, x7, 48
	cmp	w0, w4
	ble	.L175
	ldr	w1, [x3, w0, sxtw]
	add	x0, x3, w0, sxtw
	cmp	w1, w9
	beq	.L521
.L175:
	ldr	x13, [x27, 1]
	and	x9, x9, 255
	add	x2, x27, 1
	ldrsh	w0, [x24, x7, lsl 1]
	sub	x15, x2, x3
	lsr	x12, x13, 8
	ldr	w1, [x23, x9, lsl 2]
	strh	w15, [x24, x7, lsl 1]
	and	x9, x1, 65535
	mul	x7, x12, x6
	lsl	x9, x9, x19
	add	w19, w19, w1, lsr 16
	orr	x10, x10, x9
	lsr	x7, x7, 48
	cmp	w0, w4
	ble	.L177
	ldr	w1, [x3, w0, sxtw]
	add	x0, x3, w0, sxtw
	cmp	w1, w13
	beq	.L770
.L177:
	ldr	x15, [x27, 2]
	and	x9, x13, 255
	add	x2, x27, 2
	ldrsh	w0, [x24, x7, lsl 1]
	sub	x13, x2, x3
	lsr	x12, x15, 8
	ldr	w1, [x23, x9, lsl 2]
	strh	w13, [x24, x7, lsl 1]
	and	x9, x1, 65535
	mul	x7, x12, x6
	lsl	x9, x9, x19
	add	w19, w19, w1, lsr 16
	orr	x10, x10, x9
	lsr	x7, x7, 48
	cmp	w0, w4
	ble	.L178
	ldr	w1, [x3, w0, sxtw]
	add	x0, x3, w0, sxtw
	cmp	w1, w15
	beq	.L770
.L178:
	ldr	x12, [x27, 3]
	and	x9, x15, 255
	add	x2, x27, 3
	ldrsh	w0, [x24, x7, lsl 1]
	sub	x13, x2, x3
	lsr	x1, x12, 8
	ldr	w9, [x23, x9, lsl 2]
	strh	w13, [x24, x7, lsl 1]
	and	x7, x9, 65535
	mul	x1, x1, x6
	lsl	x7, x7, x19
	add	w19, w19, w9, lsr 16
	orr	x10, x10, x7
	lsr	x1, x1, 48
	cmp	w0, w4
	ble	.L179
	ldr	w7, [x3, w0, sxtw]
	add	x0, x3, w0, sxtw
	cmp	w7, w12
	beq	.L770
.L179:
	and	x0, x12, 255
	add	x27, x27, 4
	ldr	w0, [x23, x0, lsl 2]
	and	x2, x0, 65535
	add	w0, w19, w0, lsr 16
	lsl	x2, x2, x19
	and	w7, w0, 56
	orr	x2, x2, x10
	ubfx	x9, x0, 3, 3
	str	x2, [x20]
	orr	w11, w11, w0
	and	w19, w0, 7
	add	x20, x20, x9
	lsr	x10, x2, x7
	cmp	x27, x26
	bcc	.L180
.L797:
	cmp	x25, x27
	bls	.L728
	mov	w9, w1
	.p2align 3,,7
.L181:
	ldr	x2, [x27]
	ubfiz	x9, x9, 1, 16
	sub	x0, x27, x3
	and	x12, x2, 255
	lsr	x1, x2, 8
	ldrsh	w7, [x24, x9]
	strh	w0, [x24, x9]
	mul	x1, x1, x6
	add	x0, x3, w7, sxtw
	lsr	x9, x1, 48
	cmp	w7, w4
	ble	.L182
	ldr	w1, [x3, w7, sxtw]
	cmp	w1, w2
	beq	.L521
.L182:
	ldr	w0, [x23, x12, lsl 2]
	add	x27, x27, 1
	and	x2, x0, 65535
	add	w0, w19, w0, lsr 16
	lsl	x2, x2, x19
	and	w7, w0, 56
	orr	x2, x2, x10
	ubfx	x1, x0, 3, 3
	str	x2, [x20]
	orr	w11, w11, w0
	and	w19, w0, 7
	add	x20, x20, x1
	lsr	x10, x2, x7
	cmp	x25, x27
	bne	.L181
.L728:
	orr	w11, w11, w19
.L173:
	sub	x0, x22, x27
	str	x10, [x20]
	cmp	x0, 3
	bls	.L524
	sub	x0, x0, #4
	lsr	x1, x0, 2
	add	x8, x1, 1
	add	x8, x27, x8, lsl 2
	.p2align 3,,7
.L201:
	ldrb	w6, [x27]
	add	x27, x27, 4
	ldrb	w3, [x27, -3]
	ldrb	w2, [x27, -2]
	ldrb	w4, [x27, -1]
	ldr	w6, [x23, x6, lsl 2]
	ldr	w3, [x23, x3, lsl 2]
	ldr	w2, [x23, x2, lsl 2]
	and	x9, x6, 65535
	ldr	w4, [x23, x4, lsl 2]
	add	w6, w19, w6, lsr 16
	add	w13, w6, w3, lsr 16
	and	x3, x3, 65535
	add	w12, w13, w2, lsr 16
	and	x7, x4, 65535
	and	x2, x2, 65535
	lsl	x9, x9, x19
	lsl	x3, x3, x6
	orr	x3, x3, x9
	lsl	x6, x7, x12
	add	w4, w12, w4, lsr 16
	lsl	x2, x2, x13
	orr	x2, x2, x6
	orr	x2, x2, x3
	and	w6, w4, 56
	orr	x2, x2, x10
	ubfx	x3, x4, 3, 3
	str	x2, [x20]
	orr	w11, w11, w4
	and	w19, w4, 7
	add	x20, x20, x3
	lsr	x10, x2, x6
	cmp	x27, x8
	bne	.L201
	sub	x0, x0, x1, lsl 2
.L200:
	cbz	x0, .L202
	add	x22, x8, x0
.L203:
	ldrb	w0, [x8], 1
	ldr	w0, [x23, x0, lsl 2]
	and	x1, x0, 65535
	add	w0, w19, w0, lsr 16
	lsl	x1, x1, x19
	and	w3, w0, 56
	orr	x1, x1, x10
	ubfx	x2, x0, 3, 3
	str	x1, [x20]
	orr	w11, w11, w0
	and	w19, w0, 7
	add	x20, x20, x2
	lsr	x10, x1, x3
	cmp	x8, x22
	bne	.L203
.L202:
	ldrb	w1, [x5, 1536]
	ldr	w2, [x5, 1024]
	add	w1, w1, w19
	orr	w11, w1, w11
	lsl	x2, x2, x19
	orr	x2, x2, x10
	str	x2, [x20]
	cmp	w11, 63
	bhi	.L128
.L775:
	ubfx	x0, x1, 3, 3
	ands	w3, w1, 7
	mov	x4, x0
	add	x0, x20, x0
	beq	.L204
	and	w1, w1, 56
	lsr	x2, x2, x1
	strb	w2, [x20, w4, uxtw]
.L204:
	ldr	x1, [sp, 96]
	ldp	x25, x26, [sp, 64]
	.cfi_restore 26
	.cfi_restore 25
	sub	x0, x0, x1
	uxtw	x1, w3
	add	x0, x1, x0, lsl 3
.L49:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L785:
	.cfi_restore_state
	cmp	w3, 13
	beq	.L798
	bl	memcpy
	ldr	x2, [sp, 104]
	mov	x3, 32768
	ldr	w1, [x21, 32]
	add	x0, x21, x2
	ldr	w5, [sp, 112]
	add	x0, x0, 4096
	uxtw	x4, w1
	sub	x6, x3, x4
	ldrb	w2, [x0, 1220]
	str	wzr, [x21, 1124]
	and	w2, w2, w5
	cmp	x28, x6
	bcs	.L799
	mrs	x0, tpidr_el0
	ldr	w3, [x21, 36]
	add	x0, x0, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x0, x0, #:tprel_lo12_nc:.LANCHOR1
	add	w28, w1, w28
	sub	w16, w1, #1
	str	w28, [x21, 32]
	sub	x4, x27, x4
	str	w16, [x0]
	cmp	w3, 14
	bls	.L800
.L279:
	cmp	x27, x22
	beq	.L281
	adrp	x0, .LANCHOR0
	add	x28, x0, :lo12:.LANCHOR0
	add	x0, x28, 464
	add	x12, x21, 73728
	add	x24, x28, 432
	add	x12, x12, 352
	add	x6, x21, 204800
	mov	w7, 42941
	stp	x25, x26, [sp, 64]
	.cfi_offset 26, -88
	.cfi_offset 25, -96
	add	x26, x28, 848
	add	x5, x21, 2420
	str	x0, [sp, 104]
	add	x0, x28, 720
	movi	v0.8h, 0x80, lsl 8
	add	x6, x6, 352
	sxth	w30, w16
	mov	x8, x12
	mov	w11, 0
	mov	w9, 0
	movk	w7, 0x1e35, lsl 16
	str	x0, [sp, 112]
	mov	w0, 0
	mov	w14, w0
	str	x28, [sp, 120]
	mov	x28, x26
	str	x24, [sp, 136]
	ldr	w24, [sp, 128]
	b	.L344
	.p2align 2,,3
.L805:
	mov	w10, -32767
	add	w1, w13, w10
	sxth	w13, w13
.L288:
	ldr	w0, [x27, 1]
	ubfiz	x10, x14, 2, 32
	cmp	w16, w1
	add	x18, x21, x10
	add	x18, x18, 73728
	sub	w3, w3, #32768
	ldr	w17, [x27]
	mul	w0, w0, w7
	sxth	w3, w3
	ldrsh	w14, [x18, 352]
	csel	w3, w30, w3, ge
	lsr	w1, w0, 17
	lsr	w0, w0, 17
	add	x25, x12, x1, lsl 2
	prfm	PSTL1KEEP, [x25]
	strh	w13, [x18, 352]
	cmp	w14, w3
	ble	.L292
	add	x10, x8, x10
	ldr	w25, [x4, w14, sxtw]
	add	x18, x4, w14, sxtw
	ldrsh	w13, [x10, 2]
	strh	w14, [x10, 2]
	cmp	w17, w25
	beq	.L801
	cmp	w3, w13
	bge	.L292
	ldr	w3, [x4, w13, sxtw]
	add	x13, x4, w13, sxtw
	cmp	w17, w3
	beq	.L802
.L292:
	mov	x10, x27
	add	w11, w11, 1
	ldrb	w1, [x10], 1
	add	x3, x5, x1
	add	x1, x21, x1, lsl 2
	add	x13, x1, 65536
	ldrb	w3, [x3, 1280]
	ldr	w1, [x1, 2420]
	ldr	w15, [x13, 2496]
	add	w14, w19, w3
	sub	w3, w3, #1
	lsl	x1, x1, x19
	add	w15, w15, 1
	orr	x1, x1, x2
	and	w2, w14, -8
	str	w15, [x13, 2496]
	lsr	w13, w14, 3
	str	x1, [x20]
	orr	w9, w9, w3
	and	w19, w14, 7
	add	x20, x20, x13
	lsr	x2, x1, x2
	tst	x11, 15
	beq	.L803
.L335:
	cmp	x10, x22
	beq	.L286
.L340:
	mov	w14, w0
	mov	x27, x10
.L344:
	sub	x1, x22, x27
	mov	w23, w24
	mov	w15, 258
	cmp	x1, 257
	bls	.L804
.L282:
	sub	x13, x27, x4
	mov	w3, w13
	cmp	w13, 32768
	bne	.L805
	mov	x0, x12
	.p2align 3,,7
.L289:
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
	bne	.L289
	add	x4, x4, 32768
	mov	w13, 0
	mov	w1, -32767
	mov	w3, 0
	b	.L288
.L781:
	cmp	x28, 9
	bhi	.L806
	mov	x25, x27
	mov	x26, x27
.L53:
	ldr	x0, [sp, 96]
	mov	x18, 5316
	add	x1, x21, x18
	str	x2, [sp, 104]
	str	w5, [sp, 112]
	bl	memcpy
	ldr	x2, [sp, 104]
	mov	x3, 32768
	ldr	w6, [x21, 32]
	add	x0, x21, x2
	ldr	w5, [sp, 112]
	add	x0, x0, 4096
	uxtw	x2, w6
	sub	x1, x3, x2
	ldrb	w0, [x0, 1220]
	str	wzr, [x21, 1124]
	and	w0, w0, w5
	cmp	x28, x1
	bcs	.L807
	mrs	x1, tpidr_el0
	ldr	w4, [x21, 36]
	add	x1, x1, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x1, x1, #:tprel_lo12_nc:.LANCHOR1
	add	w28, w6, w28
	sub	w6, w6, #1
	str	w28, [x21, 32]
	sub	x2, x27, x2
	str	w6, [x1]
	cmp	w4, 12
	bls	.L808
.L56:
	cmp	x27, x25
	bcs	.L492
	ldr	x1, [x27]
	mov	x7, 2264924160
	movk	x7, 0xebca, lsl 32
	adrp	x9, .LANCHOR0
	movk	x7, 0xb185, lsl 48
	add	x9, x9, :lo12:.LANCHOR0
	add	x15, x9, 720
	add	x30, x9, 432
	mul	x1, x1, x7
	mov	w13, w19
	add	x16, x9, 464
	mov	x19, x30
	add	x5, x21, 2420
	mov	x30, x15
	add	x14, x25, 1
	mov	x15, x9
	lsr	x1, x1, 50
	mov	w10, 0
.L59:
	cmp	x27, x26
	bcs	.L809
.L65:
	ldr	x3, [x27]
	ubfiz	x1, x1, 1, 14
	sub	x8, x27, x2
	lsr	x4, x3, 8
	ldrsh	w18, [x24, x1]
	strh	w8, [x24, x1]
	mul	x4, x4, x7
	lsr	x4, x4, 50
	cmp	w18, w6
	ble	.L60
	ldr	w1, [x2, w18, sxtw]
	add	x18, x2, w18, sxtw
	cmp	w1, w3
	beq	.L494
.L60:
	ldr	x8, [x27, 1]
	add	x9, x21, w3, uxtb 2
	add	x9, x9, 65536
	and	x1, x3, 255
	add	x3, x27, 1
	lsr	x11, x8, 8
	ldr	w17, [x9, 2496]
	ldr	w12, [x23, x1, lsl 2]
	add	w1, w17, 1
	str	w1, [x9, 2496]
	mul	x9, x11, x7
	and	x1, x12, 65535
	ldrsh	w18, [x24, x4, lsl 1]
	sub	x11, x3, x2
	strh	w11, [x24, x4, lsl 1]
	lsl	x1, x1, x13
	lsr	x4, x9, 50
	orr	x0, x0, x1
	add	w13, w13, w12, lsr 16
	cmp	w18, w6
	ble	.L62
	ldr	w1, [x2, w18, sxtw]
	add	x18, x2, w18, sxtw
	cmp	w1, w8
	beq	.L762
.L62:
	ldr	x9, [x27, 2]
	add	x11, x21, w8, uxtb 2
	add	x11, x11, 65536
	and	x1, x8, 255
	add	x3, x27, 2
	lsr	x8, x9, 8
	ldr	w17, [x11, 2496]
	ldr	w12, [x23, x1, lsl 2]
	add	w1, w17, 1
	str	w1, [x11, 2496]
	mul	x8, x8, x7
	and	x1, x12, 65535
	ldrsh	w18, [x24, x4, lsl 1]
	sub	x11, x3, x2
	strh	w11, [x24, x4, lsl 1]
	lsl	x1, x1, x13
	lsr	x8, x8, 50
	orr	x0, x0, x1
	add	w13, w13, w12, lsr 16
	cmp	w18, w6
	ble	.L63
	ldr	w1, [x2, w18, sxtw]
	add	x18, x2, w18, sxtw
	cmp	w1, w9
	beq	.L762
.L63:
	ldr	x4, [x27, 3]
	add	x11, x21, w9, uxtb 2
	add	x11, x11, 65536
	and	x1, x9, 255
	add	x3, x27, 3
	lsr	x9, x4, 8
	ldr	w17, [x11, 2496]
	ldr	w12, [x23, x1, lsl 2]
	add	w1, w17, 1
	str	w1, [x11, 2496]
	mul	x1, x9, x7
	and	x9, x12, 65535
	ldrsh	w18, [x24, x8, lsl 1]
	sub	x11, x3, x2
	strh	w11, [x24, x8, lsl 1]
	lsl	x8, x9, x13
	lsr	x1, x1, 50
	orr	x0, x0, x8
	add	w13, w13, w12, lsr 16
	cmp	w18, w6
	ble	.L64
	ldr	w8, [x2, w18, sxtw]
	add	x18, x2, w18, sxtw
	cmp	w8, w4
	beq	.L762
.L64:
	and	x8, x4, 255
	add	x3, x21, w4, uxtb 2
	add	x3, x3, 65536
	add	x27, x27, 4
	ldr	w4, [x23, x8, lsl 2]
	ldr	w9, [x3, 2496]
	and	x8, x4, 65535
	add	w4, w13, w4, lsr 16
	add	w9, w9, 1
	lsl	x8, x8, x13
	orr	x8, x8, x0
	and	w0, w4, 56
	str	w9, [x3, 2496]
	ubfx	x3, x4, 3, 3
	str	x8, [x20]
	orr	w10, w10, w4
	and	w13, w4, 7
	add	x20, x20, x3
	lsr	x0, x8, x0
	cmp	x27, x26
	bcc	.L65
.L809:
	cmp	x25, x27
	bls	.L764
	.p2align 3,,7
.L66:
	ldr	x3, [x27]
	ubfiz	x11, x1, 1, 14
	sub	x4, x27, x2
	and	x12, x3, 255
	lsr	x1, x3, 8
	ldrsh	w9, [x24, x11]
	add	x8, x21, w3, uxtb 2
	strh	w4, [x24, x11]
	add	x8, x8, 65536
	mul	x1, x1, x7
	add	x18, x2, w9, sxtw
	lsr	x1, x1, 50
	cmp	w9, w6
	ble	.L67
	ldr	w4, [x2, w9, sxtw]
	cmp	w4, w3
	beq	.L494
.L67:
	ldr	w3, [x23, x12, lsl 2]
	add	x27, x27, 1
	ldr	w9, [x8, 2496]
	and	x4, x3, 65535
	add	w3, w13, w3, lsr 16
	add	w9, w9, 1
	lsl	x4, x4, x13
	and	w11, w3, 56
	orr	x0, x4, x0
	str	w9, [x8, 2496]
	ubfx	x4, x3, 3, 3
	str	x0, [x20]
	orr	w10, w10, w3
	and	w13, w3, 7
	add	x20, x20, x4
	lsr	x0, x0, x11
	cmp	x25, x27
	bne	.L66
.L764:
	mov	w19, w13
	orr	w10, w10, w13
.L58:
	sub	x1, x22, x27
	str	x0, [x20]
	cmp	x1, 3
	bls	.L497
	sub	x1, x1, #4
	lsr	x2, x1, 2
	add	x7, x2, 1
	add	x7, x27, x7, lsl 2
	.p2align 3,,7
.L86:
	ldrb	w3, [x27]
	add	x27, x27, 4
	ldrb	w9, [x27, -3]
	ldrb	w14, [x27, -2]
	add	x6, x21, x3, lsl 2
	ldrb	w13, [x27, -1]
	add	x6, x6, 65536
	add	x4, x21, x9, lsl 2
	add	x4, x4, 65536
	ldr	w3, [x23, x3, lsl 2]
	add	x12, x21, x14, lsl 2
	add	x11, x21, x13, lsl 2
	ldr	w8, [x6, 2496]
	add	x12, x12, 65536
	add	w15, w19, w3, lsr 16
	and	x3, x3, 65535
	add	w8, w8, 1
	str	w8, [x6, 2496]
	add	x11, x11, 65536
	ldr	w6, [x4, 2496]
	ldr	w9, [x23, x9, lsl 2]
	add	w6, w6, 1
	str	w6, [x4, 2496]
	lsl	x4, x3, x19
	and	x6, x9, 65535
	ldr	w3, [x12, 2496]
	add	w9, w15, w9, lsr 16
	ldr	w8, [x23, x14, lsl 2]
	lsl	x6, x6, x15
	add	w3, w3, 1
	str	w3, [x12, 2496]
	orr	x6, x6, x4
	and	x3, x8, 65535
	ldr	w4, [x23, x13, lsl 2]
	add	w8, w9, w8, lsr 16
	ldr	w12, [x11, 2496]
	lsl	x3, x3, x9
	and	x13, x4, 65535
	add	w4, w8, w4, lsr 16
	add	w9, w12, 1
	lsl	x8, x13, x8
	orr	x3, x3, x8
	orr	x3, x3, x6
	and	w6, w4, 56
	orr	x0, x3, x0
	str	w9, [x11, 2496]
	ubfx	x3, x4, 3, 3
	str	x0, [x20]
	orr	w10, w10, w4
	and	w19, w4, 7
	add	x20, x20, x3
	lsr	x0, x0, x6
	cmp	x27, x7
	bne	.L86
	sub	x1, x1, x2, lsl 2
.L85:
	cbz	x1, .L87
	add	x22, x7, x1
.L88:
	ldrb	w1, [x7], 1
	add	x2, x21, x1, lsl 2
	add	x2, x2, 65536
	ldr	w1, [x23, x1, lsl 2]
	and	x4, x1, 65535
	ldr	w3, [x2, 2496]
	add	w1, w19, w1, lsr 16
	lsl	x4, x4, x19
	and	w6, w1, 56
	orr	x0, x4, x0
	add	w3, w3, 1
	str	w3, [x2, 2496]
	ubfx	x2, x1, 3, 3
	str	x0, [x20]
	orr	w10, w10, w1
	and	w19, w1, 7
	add	x20, x20, x2
	lsr	x0, x0, x6
	cmp	x7, x22
	bne	.L88
.L87:
	ldrb	w1, [x5, 1536]
	ldr	w2, [x5, 1024]
	add	w1, w1, w19
	orr	w10, w1, w10
	lsl	x2, x2, x19
	orr	x2, x2, x0
	str	x2, [x20]
	cmp	w10, 63
	bls	.L775
	b	.L128
.L794:
	cmp	x28, 9
	bhi	.L810
	mov	x25, x27
	mov	x26, x27
.L131:
	ldr	x0, [sp, 96]
	mov	x16, 5316
	add	x1, x21, x16
	str	x2, [sp, 104]
	str	w5, [sp, 112]
	bl	memcpy
	ldr	x2, [sp, 104]
	mov	x1, 32768
	ldr	w4, [x21, 32]
	add	x0, x21, x2
	ldr	w5, [sp, 112]
	add	x0, x0, 4096
	uxtw	x2, w4
	sub	x3, x1, x2
	ldrb	w10, [x0, 1220]
	str	wzr, [x21, 1124]
	and	w10, w10, w5
	cmp	x28, x3
	bcs	.L811
	mrs	x0, tpidr_el0
	ldr	w3, [x21, 36]
	add	x0, x0, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x0, x0, #:tprel_lo12_nc:.LANCHOR1
	add	w28, w4, w28
	sub	w4, w4, #1
	str	w28, [x21, 32]
	sub	x2, x27, x2
	str	w4, [x0]
	cmp	w3, 12
	bls	.L812
.L134:
	cmp	x27, x25
	bcs	.L510
	ldr	x7, [x27]
	mov	x6, 2264924160
	movk	x6, 0xebca, lsl 32
	adrp	x8, .LANCHOR0
	movk	x6, 0xb185, lsl 48
	add	x8, x8, :lo12:.LANCHOR0
	add	x18, x8, 464
	add	x17, x8, 720
	mul	x7, x7, x6
	add	x8, x8, 432
	add	x5, x21, 2420
	add	x14, x25, 1
	mov	w1, 0
	mov	x16, 258
	lsr	x7, x7, 50
	mov	w15, 256
.L137:
	cmp	x27, x26
	bcs	.L813
.L143:
	ldr	x9, [x27]
	ubfiz	x11, x7, 1, 14
	sub	x3, x27, x2
	lsr	x7, x9, 8
	ldrsh	w0, [x24, x11]
	strh	w3, [x24, x11]
	mul	x7, x7, x6
	lsr	x7, x7, 50
	cmp	w0, w4
	ble	.L138
	ldr	w3, [x2, w0, sxtw]
	add	x0, x2, w0, sxtw
	cmp	w3, w9
	beq	.L512
.L138:
	ldr	x12, [x27, 1]
	and	x9, x9, 255
	add	x3, x27, 1
	ldrsh	w0, [x24, x7, lsl 1]
	sub	x28, x3, x2
	lsr	x11, x12, 8
	ldr	w13, [x23, x9, lsl 2]
	strh	w28, [x24, x7, lsl 1]
	and	x9, x13, 65535
	mul	x7, x11, x6
	lsl	x9, x9, x19
	add	w19, w19, w13, lsr 16
	orr	x10, x10, x9
	lsr	x7, x7, 50
	cmp	w0, w4
	ble	.L140
	ldr	w9, [x2, w0, sxtw]
	add	x0, x2, w0, sxtw
	cmp	w9, w12
	beq	.L768
.L140:
	ldr	x13, [x27, 2]
	and	x9, x12, 255
	add	x3, x27, 2
	ldrsh	w0, [x24, x7, lsl 1]
	sub	x28, x3, x2
	lsr	x11, x13, 8
	ldr	w12, [x23, x9, lsl 2]
	strh	w28, [x24, x7, lsl 1]
	and	x9, x12, 65535
	mul	x7, x11, x6
	lsl	x9, x9, x19
	add	w19, w19, w12, lsr 16
	orr	x10, x10, x9
	lsr	x7, x7, 50
	cmp	w0, w4
	ble	.L141
	ldr	w9, [x2, w0, sxtw]
	add	x0, x2, w0, sxtw
	cmp	w9, w13
	beq	.L768
.L141:
	ldr	x11, [x27, 3]
	and	x9, x13, 255
	add	x3, x27, 3
	ldrsh	w0, [x24, x7, lsl 1]
	sub	x28, x3, x2
	lsr	x12, x11, 8
	ldr	w13, [x23, x9, lsl 2]
	strh	w28, [x24, x7, lsl 1]
	and	x9, x13, 65535
	mul	x7, x12, x6
	lsl	x9, x9, x19
	add	w19, w19, w13, lsr 16
	orr	x10, x10, x9
	lsr	x7, x7, 50
	cmp	w0, w4
	ble	.L142
	ldr	w9, [x2, w0, sxtw]
	add	x0, x2, w0, sxtw
	cmp	w9, w11
	beq	.L768
.L142:
	and	x0, x11, 255
	add	x27, x27, 4
	ldr	w0, [x23, x0, lsl 2]
	and	x3, x0, 65535
	add	w0, w19, w0, lsr 16
	lsl	x3, x3, x19
	and	w9, w0, 56
	orr	x3, x3, x10
	ubfx	x10, x0, 3, 3
	str	x3, [x20]
	orr	w1, w1, w0
	add	x20, x20, x10
	and	w19, w0, 7
	lsr	x10, x3, x9
	cmp	x27, x26
	bcc	.L143
.L813:
	cmp	x25, x27
	bls	.L727
	.p2align 3,,7
.L144:
	ldr	x9, [x27]
	ubfiz	x7, x7, 1, 14
	sub	x0, x27, x2
	and	x12, x9, 255
	lsr	x3, x9, 8
	ldrsh	w11, [x24, x7]
	strh	w0, [x24, x7]
	mul	x3, x3, x6
	add	x0, x2, w11, sxtw
	lsr	x7, x3, 50
	cmp	w11, w4
	ble	.L145
	ldr	w3, [x2, w11, sxtw]
	cmp	w3, w9
	beq	.L512
.L145:
	ldr	w0, [x23, x12, lsl 2]
	add	x27, x27, 1
	and	x3, x0, 65535
	add	w0, w19, w0, lsr 16
	lsl	x3, x3, x19
	and	w11, w0, 56
	orr	x3, x3, x10
	ubfx	x9, x0, 3, 3
	str	x3, [x20]
	orr	w1, w1, w0
	and	w19, w0, 7
	add	x20, x20, x9
	lsr	x10, x3, x11
	cmp	x25, x27
	bne	.L144
.L727:
	orr	w7, w1, w19
.L136:
	sub	x0, x22, x27
	str	x10, [x20]
	cmp	x0, 3
	bls	.L515
	sub	x0, x0, #4
	lsr	x1, x0, 2
	add	x9, x1, 1
	add	x9, x27, x9, lsl 2
	.p2align 3,,7
.L164:
	ldrb	w6, [x27]
	add	x27, x27, 4
	ldrb	w3, [x27, -3]
	ldrb	w2, [x27, -2]
	ldrb	w4, [x27, -1]
	ldr	w6, [x23, x6, lsl 2]
	ldr	w3, [x23, x3, lsl 2]
	ldr	w2, [x23, x2, lsl 2]
	and	x11, x6, 65535
	ldr	w4, [x23, x4, lsl 2]
	add	w6, w19, w6, lsr 16
	add	w13, w6, w3, lsr 16
	and	x3, x3, 65535
	add	w12, w13, w2, lsr 16
	and	x8, x4, 65535
	and	x2, x2, 65535
	lsl	x11, x11, x19
	lsl	x3, x3, x6
	orr	x3, x3, x11
	lsl	x6, x8, x12
	add	w4, w12, w4, lsr 16
	lsl	x2, x2, x13
	orr	x2, x2, x6
	orr	x2, x2, x3
	and	w6, w4, 56
	orr	x2, x2, x10
	ubfx	x3, x4, 3, 3
	str	x2, [x20]
	orr	w7, w7, w4
	and	w19, w4, 7
	add	x20, x20, x3
	lsr	x10, x2, x6
	cmp	x27, x9
	bne	.L164
	sub	x0, x0, x1, lsl 2
.L163:
	cbz	x0, .L165
	add	x22, x9, x0
.L166:
	ldrb	w0, [x9], 1
	ldr	w0, [x23, x0, lsl 2]
	and	x1, x0, 65535
	add	w0, w19, w0, lsr 16
	lsl	x1, x1, x19
	and	w3, w0, 56
	orr	x1, x1, x10
	ubfx	x2, x0, 3, 3
	str	x1, [x20]
	orr	w7, w7, w0
	and	w19, w0, 7
	add	x20, x20, x2
	lsr	x10, x1, x3
	cmp	x9, x22
	bne	.L166
.L165:
	ldrb	w1, [x5, 1536]
	ldr	w2, [x5, 1024]
	add	w1, w1, w19
	orr	w0, w1, w7
	lsl	x2, x2, x19
	orr	x2, x2, x10
	str	x2, [x20]
	cmp	w0, 63
	bls	.L775
	b	.L128
.L787:
	.cfi_restore 25
	.cfi_restore 26
	mrs	x4, tpidr_el0
	add	x1, x21, 73728
	add	x4, x4, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x4, x4, #:tprel_lo12_nc:.LANCHOR1
	cmp	x28, x2
	mov	w5, -32768
	add	x1, x1, 352
	mov	w16, w5
	mov	x6, x27
	csel	x3, x28, x2, ls
	mov	x2, 131072
	str	w5, [x4]
	str	w3, [x21, 32]
.L417:
	movi	v0.8h, 0x80, lsl 8
	add	x2, x1, x2
	.p2align 3,,7
.L419:
	stp	q0, q0, [x1]
	stp	q0, q0, [x1, 32]
	add	x1, x1, 64
	cmp	x1, x2
	bne	.L419
	mov	w1, 15
	str	w1, [x21, 36]
	b	.L418
.L788:
	add	x1, x21, 73728
	add	x1, x1, 352
	cbz	w3, .L558
	mov	x4, 4
	mov	x2, 131072
	lsl	x3, x4, x3
	add	x1, x1, x3
	sub	x2, x2, x3
	b	.L417
	.p2align 2,,3
.L789:
	.cfi_offset 25, -96
	.cfi_offset 26, -88
	sub	w30, w15, #4
	cmp	w30, 31
	bls	.L560
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
	cmp	w3, w4
	ccmp	w24, w11, 0, lt
	bls	.L444
	ldr	w3, [x6, w4, sxtw]
	add	x4, x6, w4, sxtw
	cmp	w17, w3
	beq	.L814
.L444:
	sub	w4, w27, w18
	add	x3, x27, x12
	sub	w14, w11, #1
	uxtw	x15, w11
.L468:
	mov	w12, 256
	sub	w24, w12, w4
	ldr	x25, [sp, 104]
	lsr	w24, w24, 29
	sub	w18, w4, #1
	add	x17, x21, x15
	add	x15, x21, x15, lsl 2
	add	x17, x17, 4096
	lsr	w18, w18, w24
	add	x12, x27, 1
	ldr	x30, [sp, 120]
	add	w11, w11, 4
	ldrb	w25, [x25, w18, uxtw]
	sub	x18, x22, x12
	ldr	w15, [x15, 4020]
	ldrb	w17, [x17, 960]
	lsl	x15, x15, x19
	orr	x15, x15, x0
	add	w0, w25, w24, lsl 1
	add	w17, w17, w19
	add	x24, x5, x0
	add	x25, x0, 288
	ldrb	w19, [x30, w0, uxtw]
	ldr	x30, [sp, 112]
	ldrb	w24, [x24, 1568]
	ldr	w25, [x5, x25, lsl 2]
	ldr	w0, [x30, x0, lsl 2]
	sub	w0, w4, w0
	add	w4, w24, w17
	add	w19, w19, w4
	lsl	x25, x25, x17
	lsl	x0, x0, x4
	orr	x0, x0, x25
	and	w4, w19, -8
	orr	x0, x0, x15
	sub	w24, w24, #1
	lsr	w15, w19, 3
	str	x0, [x20]
	orr	w10, w10, w24
	lsr	x0, x0, x4
	and	w19, w19, 7
	add	x20, x20, x15
	sub	x4, x12, x6
	cmp	x11, x18
	bgt	.L469
	sub	w2, w4, #1
	mov	w11, 32767
	add	w2, w2, w14
	cmp	w2, w11
	bls	.L471
	mov	x2, x13
	.p2align 3,,7
.L472:
	ldp	q4, q3, [x2]
	ldp	q2, q1, [x2, 32]
	sqadd	v4.8h, v4.8h, v0.8h
	sqadd	v3.8h, v3.8h, v0.8h
	sqadd	v2.8h, v2.8h, v0.8h
	sqadd	v1.8h, v1.8h, v0.8h
	stp	q4, q3, [x2]
	stp	q2, q1, [x2, 32]
	add	x2, x2, 64
	cmp	x2, x7
	bne	.L472
	add	x6, x6, 32768
	sub	w4, w4, #32768
.L471:
	add	w14, w14, 1
	sub	w11, w4, w12
	add	x14, x27, x14
	b	.L473
	.p2align 2,,3
.L815:
	uxtw	x1, w2
.L473:
	lsl	x1, x1, 2
	add	w15, w11, w12
	add	x4, x21, x1
	ldr	w2, [x12, 1]!
	add	x4, x4, 73728
	add	x1, x9, x1
	ldrsh	w17, [x4, 352]
	mul	w2, w2, w8
	strh	w17, [x1, 2]
	strh	w15, [x4, 352]
	lsr	w2, w2, 17
	cmp	x12, x14
	bne	.L815
	ubfiz	x1, x2, 2, 15
	prfm	PSTL1KEEP, [x13, x1]
.L469:
	mov	w12, 0
	cmp	x3, x22
	bne	.L479
.L425:
	ldr	w1, [x5, 1024]
	ldrb	w2, [x5, 1536]
	lsl	x1, x1, x19
	orr	x0, x1, x0
	str	x0, [x20]
	tbnz	w10, #31, .L128
	ldp	x25, x26, [sp, 64]
	.cfi_restore 26
	.cfi_restore 25
.L488:
	add	w2, w2, w19
	ands	w3, w2, 7
	lsr	w1, w2, 3
	lsr	w4, w2, 3
	add	x1, x20, x1
	beq	.L484
	and	w2, w2, -8
	lsr	x0, x0, x2
	strb	w0, [x20, w4, uxtw]
.L484:
	ldr	x0, [sp, 96]
	ldp	x19, x20, [sp, 16]
	sub	x0, x1, x0
	uxtw	x1, w3
	ldp	x21, x22, [sp, 32]
	add	x0, x1, x0, lsl 3
	ldp	x23, x24, [sp, 48]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L801:
	.cfi_def_cfa_offset 160
	.cfi_offset 19, -144
	.cfi_offset 20, -136
	.cfi_offset 21, -128
	.cfi_offset 22, -120
	.cfi_offset 23, -112
	.cfi_offset 24, -104
	.cfi_offset 25, -96
	.cfi_offset 26, -88
	.cfi_offset 27, -80
	.cfi_offset 28, -72
	.cfi_offset 29, -160
	.cfi_offset 30, -152
	sub	w26, w15, #4
	cmp	w26, 31
	bls	.L538
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
	cmp	w3, w13
	ccmp	w23, w11, 0, lt
	bls	.L305
	ldr	w3, [x4, w13, sxtw]
	add	x13, x4, w13, sxtw
	cmp	w17, w3
	beq	.L816
.L305:
	sub	w14, w27, w18
	add	x10, x27, x10
	sub	w3, w11, #1
	uxtw	x13, w11
.L329:
	ldr	x18, [sp, 120]
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
	orr	x15, x15, x2
	ldr	x2, [sp, 136]
	add	x23, x5, x18
	add	x25, x21, x18, lsl 2
	ldrb	w19, [x2, w18, uxtw]
	ldr	x2, [sp, 112]
	ldrb	w23, [x23, 1568]
	ldr	w2, [x2, x18, lsl 2]
	add	x18, x25, 65536
	ldr	w25, [x25, 3572]
	sub	w2, w14, w2
	add	w14, w23, w17
	add	w19, w19, w14
	sub	w23, w23, #1
	lsl	x25, x25, x17
	orr	w9, w9, w23
	lsl	x2, x2, x14
	orr	x2, x2, x25
	orr	x2, x2, x15
	str	x2, [x20]
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
	lsr	x2, x2, x23
	add	w17, w17, 1
	str	w17, [x18, 3648]
	cmp	x11, x15
	bgt	.L330
	sub	w0, w13, #1
	mov	w11, 32767
	add	w0, w0, w3
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
	add	w3, w3, 1
	sub	w13, w13, w14
	add	x3, x27, x3
	mov	x0, x1
	b	.L334
	.p2align 2,,3
.L817:
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
	cmp	x14, x3
	bne	.L817
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
.L792:
	mov	w15, w1
	cmp	w1, 4
	bls	.L818
	cmp	w1, w23
	csel	w24, w1, w23, ls
	b	.L421
	.p2align 2,,3
.L790:
	sub	w3, w15, #4
	cmp	w3, 31
	bls	.L564
	ldr	x3, [x4, 4]
	ldr	x11, [x27, 4]
	cmp	x3, x11
	bne	.L457
	ldr	x3, [x4, 12]
	ldr	x11, [x27, 12]
	cmp	x3, x11
	beq	.L458
	eor	x3, x3, x11
	mov	w11, 12
.L459:
	rbit	x3, x3
	sub	w4, w27, w4
	clz	x3, x3
	lsr	w3, w3, 3
	add	w15, w11, w3
	mov	x11, x15
	sub	w14, w15, #1
	add	x3, x27, x15
	b	.L468
	.p2align 2,,3
.L791:
	cmp	x3, x22
	beq	.L425
	mov	x1, x3
	b	.L475
	.p2align 2,,3
.L478:
	add	x1, x1, 1
	cmp	x1, x22
	beq	.L477
.L475:
	ldrb	w4, [x1]
	ldrb	w4, [x28, w4, sxtw]
	tst	x4, 3
	bne	.L478
.L477:
	sub	x1, x1, x3
	cmp	x1, 15
	ble	.L479
	sub	x4, x1, #4
	mov	x15, x3
	and	x18, x4, -4
	str	x3, [sp, 128]
	add	x30, x18, 5
	lsr	x17, x4, 2
	add	x30, x27, x30
	str	w12, [sp, 136]
	str	w16, [sp, 144]
	.p2align 3,,7
.L480:
	ldrb	w16, [x15]
	add	x15, x15, 4
	ldrb	w14, [x15, -3]
	add	x4, x5, x16
	ldrb	w24, [x15, -2]
	add	x12, x5, x14
	ldrb	w3, [x15, -1]
	ldr	w25, [x5, x16, lsl 2]
	add	x11, x5, x24
	ldrb	w4, [x4, 1280]
	add	x16, x5, x3
	ldrb	w12, [x12, 1280]
	add	w27, w4, w19
	ldr	w24, [x5, x24, lsl 2]
	ldrb	w11, [x11, 1280]
	lsl	x25, x25, x19
	sub	w19, w4, #1
	ldr	w4, [x5, x3, lsl 2]
	add	w3, w27, w12
	ldr	w14, [x5, x14, lsl 2]
	ldrb	w16, [x16, 1280]
	sub	w12, w12, #1
	lsl	x24, x24, x3
	add	w3, w3, w11
	lsl	x14, x14, x27
	orr	x14, x25, x14
	lsl	x4, x4, x3
	orr	x4, x24, x4
	add	w3, w3, w16
	sub	w11, w11, #1
	orr	x4, x14, x4
	sub	w16, w16, #1
	orr	w12, w19, w12
	orr	x4, x4, x0
	orr	w11, w11, w16
	and	w0, w3, -8
	orr	w11, w11, w12
	lsr	w12, w3, 3
	str	x4, [x20]
	orr	w10, w10, w11
	and	w19, w3, 7
	add	x20, x20, x12
	lsr	x0, x4, x0
	cmp	x15, x30
	bne	.L480
	ldr	x3, [sp, 128]
	add	x17, x17, 1
	sub	x1, x1, x18
	ldr	w12, [sp, 136]
	ldr	w16, [sp, 144]
	subs	x1, x1, #4
	add	x3, x3, x17, lsl 2
	mov	x14, x3
	beq	.L481
	add	x3, x3, x1
.L482:
	ldrb	w1, [x14], 1
	add	x4, x5, x1
	ldr	w11, [x5, x1, lsl 2]
	ldrb	w1, [x4, 1280]
	add	w4, w1, w19
	lsl	x11, x11, x19
	and	w15, w4, -8
	orr	x0, x11, x0
	sub	w1, w1, #1
	lsr	w11, w4, 3
	str	x0, [x20]
	orr	w10, w10, w1
	and	w19, w4, 7
	add	x20, x20, x11
	lsr	x0, x0, x15
	cmp	x14, x3
	bne	.L482
.L481:
	sub	x1, x22, x3
	cmp	x1, 3
	ble	.L474
	ldr	w2, [x3]
	mov	w1, 42941
	movk	w1, 0x1e35, lsl 16
	mul	w2, w2, w1
	lsr	w2, w2, 17
	b	.L474
	.p2align 2,,3
.L295:
	eor	x10, x11, x10
	mov	w11, 4
	b	.L297
	.p2align 2,,3
.L804:
	mov	w15, w1
	cmp	w1, 4
	bls	.L819
	cmp	w1, w24
	csel	w23, w1, w24, ls
	b	.L282
	.p2align 2,,3
.L814:
	sub	x3, x12, #3
	ldr	w14, [x4, x3]
	ldr	w3, [x27, x3]
	cmp	w14, w3
	bne	.L444
	cmp	w30, 31
	bls	.L562
	ldr	x3, [x4, 4]
	ldr	x14, [x27, 4]
	cmp	x3, x14
	bne	.L446
	ldr	x3, [x4, 12]
	ldr	x14, [x27, 12]
	cmp	x3, x14
	beq	.L447
	eor	x3, x3, x14
	mov	w17, 12
.L448:
	rbit	x3, x3
	clz	x3, x3
	lsr	w3, w3, 3
	add	w17, w17, w3
.L452:
	cmp	w11, w17
	bcs	.L444
	uxtw	x15, w17
	sub	w4, w27, w4
	add	x3, x27, x15
	sub	w14, w17, #1
	mov	w11, w17
	b	.L468
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
.L802:
	sub	w3, w15, #4
	cmp	w3, 31
	bls	.L542
	ldr	x3, [x13, 4]
	ldr	x10, [x27, 4]
	cmp	x3, x10
	bne	.L318
	ldr	x3, [x13, 12]
	ldr	x10, [x27, 12]
	cmp	x3, x10
	bne	.L820
	ldr	x3, [x13, 20]
	ldr	x10, [x27, 20]
	cmp	x3, x10
	beq	.L321
	eor	x3, x3, x10
	mov	w11, 20
	b	.L320
.L819:
	cmp	x1, 4
	bne	.L284
	mov	x1, x27
	add	x8, x27, 4
.L285:
	ldrb	w3, [x1]
	add	x1, x1, 4
	ldrb	w0, [x1, -3]
	add	x4, x5, x3
	ldrb	w11, [x1, -2]
	add	x3, x21, x3, lsl 2
	add	x15, x5, x0
	add	x7, x3, 65536
	add	x0, x21, x0, lsl 2
	ldrb	w6, [x4, 1280]
	add	x12, x0, 65536
	ldr	w13, [x3, 2420]
	add	x17, x21, x11, lsl 2
	ldr	w4, [x7, 2496]
	add	x3, x5, x11
	add	x16, x17, 65536
	ldrb	w10, [x1, -1]
	add	w4, w4, 1
	str	w4, [x7, 2496]
	add	w18, w6, w19
	lsl	x13, x13, x19
	ldr	w11, [x12, 2496]
	add	x14, x5, x10
	ldrb	w4, [x15, 1280]
	add	x10, x21, x10, lsl 2
	ldr	w7, [x0, 2420]
	add	w0, w11, 1
	str	w0, [x12, 2496]
	add	w15, w18, w4
	add	x12, x10, 65536
	sub	w6, w6, #1
	ldr	w11, [x16, 2496]
	lsl	x7, x7, x18
	ldrb	w0, [x3, 1280]
	orr	x7, x7, x13
	add	w3, w11, 1
	ldr	w13, [x17, 2420]
	str	w3, [x16, 2496]
	sub	w11, w4, #1
	add	w3, w15, w0
	sub	w4, w0, #1
	ldr	w0, [x10, 2420]
	orr	w6, w6, w11
	ldrb	w10, [x14, 1280]
	lsl	x13, x13, x15
	ldr	w11, [x12, 2496]
	lsl	x0, x0, x3
	orr	x0, x0, x13
	add	w3, w3, w10
	orr	x0, x0, x7
	sub	w10, w10, #1
	orr	x0, x0, x2
	and	w7, w3, -8
	orr	w2, w4, w10
	add	w4, w11, 1
	str	w4, [x12, 2496]
	orr	w2, w6, w2
	sub	x4, x8, x1
	lsr	w6, w3, 3
	str	x0, [x20]
	orr	w9, w9, w2
	and	w19, w3, 7
	add	x20, x20, x6
	lsr	x2, x0, x7
	cmp	x4, 3
	bhi	.L285
	.p2align 3,,7
.L286:
	ldr	w0, [x5, 1024]
	ldrb	w1, [x5, 1536]
	lsl	x0, x0, x19
	orr	x2, x0, x2
	str	x2, [x20]
	tbnz	w9, #31, .L128
	ldp	x25, x26, [sp, 64]
	.cfi_restore 26
	.cfi_restore 25
.L486:
	add	w1, w1, w19
	ands	w3, w1, 7
	lsr	w0, w1, 3
	lsr	w4, w1, 3
	add	x0, x20, x0
	beq	.L345
	and	w1, w1, -8
	lsr	x2, x2, x1
	strb	w2, [x20, w4, uxtw]
.L345:
	ldr	x1, [sp, 96]
	ldp	x19, x20, [sp, 16]
	sub	x0, x0, x1
	uxtw	x1, w3
	ldp	x21, x22, [sp, 32]
	add	x0, x1, x0, lsl 3
	ldp	x23, x24, [sp, 48]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L457:
	.cfi_def_cfa_offset 160
	.cfi_offset 19, -144
	.cfi_offset 20, -136
	.cfi_offset 21, -128
	.cfi_offset 22, -120
	.cfi_offset 23, -112
	.cfi_offset 24, -104
	.cfi_offset 25, -96
	.cfi_offset 26, -88
	.cfi_offset 27, -80
	.cfi_offset 28, -72
	.cfi_offset 29, -160
	.cfi_offset 30, -152
	eor	x3, x3, x11
	mov	w11, 4
	b	.L459
	.p2align 2,,3
.L803:
	cmp	x10, x22
	beq	.L286
	mov	x1, x10
	b	.L336
	.p2align 2,,3
.L339:
	add	x1, x1, 1
	cmp	x1, x22
	beq	.L338
.L336:
	ldrb	w3, [x1]
	ldrb	w3, [x28, w3, sxtw]
	tst	x3, 3
	bne	.L339
.L338:
	sub	x13, x1, x10
	cmp	x13, 15
	ble	.L340
	sub	x1, x13, #4
	mov	x3, x10
	and	x14, x1, -4
	str	w0, [sp, 128]
	add	x15, x14, 5
	lsr	x1, x1, 2
	add	x27, x27, x15
	str	x10, [sp, 144]
	str	w16, [sp, 152]
	.p2align 3,,7
.L341:
	ldrb	w0, [x3]
	add	x3, x3, 4
	ldrb	w16, [x3, -3]
	add	x17, x5, x0
	ldrb	w15, [x3, -2]
	add	x0, x21, x0, lsl 2
	add	x10, x5, x16
	add	x25, x0, 65536
	add	x16, x21, x16, lsl 2
	add	x18, x16, 65536
	ldrb	w17, [x17, 1280]
	ldr	w23, [x0, 2420]
	add	x26, x21, x15, lsl 2
	ldr	w0, [x25, 2496]
	add	x15, x5, x15
	add	w0, w0, 1
	str	w0, [x25, 2496]
	lsl	x23, x23, x19
	add	w0, w17, w19
	ldr	w19, [x18, 2496]
	add	x25, x26, 65536
	ldr	w16, [x16, 2420]
	sub	w17, w17, #1
	ldrb	w10, [x10, 1280]
	add	w19, w19, 1
	str	w19, [x18, 2496]
	ldrb	w18, [x3, -1]
	lsl	x16, x16, x0
	orr	x16, x16, x23
	ldr	w23, [x26, 2420]
	ldr	w26, [x25, 2496]
	add	w19, w0, w10
	add	x0, x21, x18, lsl 2
	ldrb	w15, [x15, 1280]
	add	w26, w26, 1
	str	w26, [x25, 2496]
	add	x18, x5, x18
	add	x25, x0, 65536
	ldr	w0, [x0, 2420]
	add	w26, w19, w15
	sub	w10, w10, #1
	lsl	x23, x23, x19
	ldrb	w18, [x18, 1280]
	orr	w10, w17, w10
	lsl	x0, x0, x26
	ldr	w17, [x25, 2496]
	orr	x0, x0, x23
	add	w19, w26, w18
	sub	w15, w15, #1
	sub	w18, w18, #1
	orr	x0, x0, x16
	orr	w15, w15, w18
	orr	x0, x0, x2
	add	w17, w17, 1
	and	w2, w19, -8
	str	w17, [x25, 2496]
	orr	w10, w10, w15
	lsr	w15, w19, 3
	str	x0, [x20]
	orr	w9, w9, w10
	and	w19, w19, 7
	add	x20, x20, x15
	lsr	x2, x0, x2
	cmp	x3, x27
	bne	.L341
	ldr	x10, [sp, 144]
	add	x1, x1, 1
	sub	x13, x13, x14
	ldr	w0, [sp, 128]
	ldr	w16, [sp, 152]
	subs	x13, x13, #4
	add	x10, x10, x1, lsl 2
	mov	x14, x10
	beq	.L342
	add	x10, x10, x13
.L343:
	ldrb	w1, [x14], 1
	add	x3, x5, x1
	add	x1, x21, x1, lsl 2
	add	x17, x1, 65536
	ldrb	w3, [x3, 1280]
	ldr	w1, [x1, 2420]
	ldr	w15, [x17, 2496]
	add	w13, w19, w3
	sub	w3, w3, #1
	add	w15, w15, 1
	lsl	x1, x1, x19
	orr	x1, x1, x2
	and	w2, w13, -8
	str	w15, [x17, 2496]
	lsr	w15, w13, 3
	str	x1, [x20]
	orr	w9, w9, w3
	and	w19, w13, 7
	add	x20, x20, x15
	lsr	x2, x1, x2
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
.L786:
	.cfi_restore 25
	.cfi_restore 26
	bl	memcpy
	ldr	x2, [sp, 104]
	mov	x1, 32768
	ldr	w5, [sp, 112]
	add	x0, x21, x2
	ldr	w2, [x21, 32]
	add	x0, x0, 4096
	uxtw	x6, w2
	sub	x4, x1, x6
	ldrb	w3, [x0, 1220]
	str	wzr, [x21, 1124]
	and	w3, w3, w5
	cmp	x28, x4
	bcs	.L821
	mrs	x0, tpidr_el0
	ldr	w4, [x21, 36]
	add	x0, x0, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x0, x0, #:tprel_lo12_nc:.LANCHOR1
	add	w28, w2, w28
	sub	w14, w2, #1
	str	w28, [x21, 32]
	sub	x6, x27, x6
	str	w14, [x0]
	cmp	w4, 12
	bls	.L822
.L349:
	cmp	x27, x22
	beq	.L351
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	add	x1, x0, 464
	add	x13, x21, 73728
	add	x28, x0, 848
	add	x13, x13, 352
	add	x7, x21, 204800
	mov	w8, 42941
	str	x1, [sp, 112]
	add	x1, x0, 720
	add	x0, x0, 432
	ldr	w24, [sp, 128]
	movi	v0.8h, 0x80, lsl 8
	add	x5, x21, 2420
	add	x7, x7, 352
	mov	x9, x13
	mov	w12, 0
	mov	w10, 0
	mov	w30, -32767
	movk	w8, 0x1e35, lsl 16
	stp	x25, x26, [sp, 64]
	.cfi_offset 26, -88
	.cfi_offset 25, -96
	sxth	w25, w14
	str	x1, [sp, 120]
	str	x0, [sp, 136]
	mov	w0, 0
	mov	w15, w0
	b	.L414
	.p2align 2,,3
.L827:
	add	w1, w11, w30
	sxth	w11, w11
.L358:
	ldr	w0, [x27, 1]
	ubfiz	x4, x15, 2, 32
	cmp	w14, w1
	add	x18, x21, x4
	add	x18, x18, 73728
	sub	w2, w2, #32768
	ldr	w17, [x27]
	mul	w0, w0, w8
	sxth	w2, w2
	ldrsh	w15, [x18, 352]
	csel	w2, w25, w2, ge
	lsr	w1, w0, 19
	lsr	w0, w0, 19
	add	x26, x13, x1, lsl 2
	prfm	PSTL1KEEP, [x26]
	strh	w11, [x18, 352]
	cmp	w15, w2
	ble	.L362
	add	x4, x9, x4
	ldr	w26, [x6, w15, sxtw]
	add	x18, x6, w15, sxtw
	ldrsh	w11, [x4, 2]
	strh	w15, [x4, 2]
	cmp	w17, w26
	beq	.L823
	cmp	w2, w11
	bge	.L362
	ldr	w2, [x6, w11, sxtw]
	add	x11, x6, w11, sxtw
	cmp	w17, w2
	beq	.L824
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
	beq	.L825
.L405:
	cmp	x4, x22
	beq	.L356
.L410:
	mov	w15, w0
	mov	x27, x4
.L414:
	sub	x1, x22, x27
	mov	w23, w24
	mov	w16, 258
	cmp	x1, 257
	bls	.L826
.L352:
	sub	x11, x27, x6
	mov	w2, w11
	cmp	w11, 32768
	bne	.L827
	mov	x0, x13
	.p2align 3,,7
.L359:
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
	bne	.L359
	add	x6, x6, 32768
	mov	w11, 0
	mov	w1, -32767
	mov	w2, 0
	b	.L358
	.p2align 2,,3
.L823:
	sub	w4, w16, #4
	str	w4, [sp, 104]
	cmp	w4, 31
	bls	.L549
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
	beq	.L828
.L375:
	sub	w11, w27, w18
	add	x4, x27, x4
	sub	w15, w12, #1
	uxtw	x16, w12
.L399:
	mov	w2, 256
	sub	w23, w2, w11
	ldr	x26, [sp, 112]
	lsr	w23, w23, 29
	sub	w18, w11, #1
	add	x17, x21, x16
	add	x16, x21, x16, lsl 2
	add	w12, w12, 4
	lsr	w18, w18, w23
	add	x17, x17, 4096
	str	x12, [sp, 104]
	add	x2, x27, 1
	ldrb	w26, [x26, w18, uxtw]
	sub	x18, x22, x2
	ldr	w16, [x16, 4020]
	ldr	x12, [sp, 136]
	lsl	x16, x16, x19
	orr	x16, x16, x3
	add	w3, w26, w23, lsl 1
	ldrb	w17, [x17, 960]
	add	x23, x5, x3
	add	x26, x3, 288
	add	w17, w17, w19
	ldrb	w19, [x12, w3, uxtw]
	ldr	x12, [sp, 120]
	ldrb	w23, [x23, 1568]
	ldr	w26, [x5, x26, lsl 2]
	ldr	w3, [x12, x3, lsl 2]
	ldr	x12, [sp, 104]
	sub	w3, w11, w3
	add	w11, w23, w17
	lsl	x26, x26, x17
	add	w19, w19, w11
	sub	w23, w23, #1
	lsl	x3, x3, x11
	orr	x3, x3, x26
	and	w11, w19, -8
	orr	x3, x3, x16
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
	sub	w12, w11, w2
	add	x15, x27, x15
	mov	x0, x1
	b	.L404
	.p2align 2,,3
.L829:
	uxtw	x0, w1
.L404:
	lsl	x0, x0, 2
	add	w16, w12, w2
	add	x11, x21, x0
	ldr	w1, [x2, 1]!
	add	x11, x11, 73728
	add	x0, x9, x0
	ldrsh	w17, [x11, 352]
	mul	w1, w1, w8
	strh	w17, [x0, 2]
	strh	w16, [x11, 352]
	lsr	w1, w1, 19
	cmp	x2, x15
	bne	.L829
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
.L826:
	mov	w16, w1
	cmp	w1, 4
	bls	.L830
	cmp	w1, w24
	csel	w23, w1, w24, ls
	b	.L352
	.p2align 2,,3
.L824:
	sub	w2, w16, #4
	cmp	w2, 31
	bls	.L553
	ldr	x2, [x11, 4]
	ldr	x4, [x27, 4]
	cmp	x2, x4
	bne	.L388
	ldr	x2, [x11, 12]
	ldr	x4, [x27, 12]
	cmp	x2, x4
	bne	.L831
	ldr	x2, [x11, 20]
	ldr	x4, [x27, 20]
	cmp	x2, x4
	beq	.L391
	eor	x2, x2, x4
	mov	w12, 20
	b	.L390
	.p2align 2,,3
.L825:
	cmp	x4, x22
	beq	.L356
	mov	x1, x4
	b	.L406
	.p2align 2,,3
.L409:
	add	x1, x1, 1
	cmp	x1, x22
	beq	.L408
.L406:
	ldrb	w2, [x1]
	ldrb	w2, [x28, w2, sxtw]
	tst	x2, 3
	bne	.L409
.L408:
	sub	x1, x1, x4
	cmp	x1, 15
	ble	.L410
	sub	x2, x1, #4
	mov	x15, x4
	and	x16, x2, -4
	str	w12, [sp, 104]
	add	x11, x16, 5
	lsr	x2, x2, 2
	add	x27, x27, x11
	str	x4, [sp, 128]
	str	x6, [sp, 144]
	str	w0, [sp, 152]
	.p2align 3,,7
.L411:
	ldrb	w18, [x15]
	add	x15, x15, 4
	ldrb	w12, [x15, -3]
	add	x17, x5, x18
	ldrb	w4, [x15, -2]
	add	x6, x5, x12
	ldrb	w0, [x15, -1]
	ldr	w23, [x5, x18, lsl 2]
	add	x11, x5, x4
	ldrb	w18, [x17, 1280]
	add	x17, x5, x0
	ldrb	w6, [x6, 1280]
	add	w26, w18, w19
	lsl	x23, x23, x19
	ldr	w19, [x5, x4, lsl 2]
	sub	w18, w18, #1
	ldrb	w11, [x11, 1280]
	ldr	w4, [x5, x0, lsl 2]
	add	w0, w26, w6
	ldr	w12, [x5, x12, lsl 2]
	sub	w6, w6, #1
	lsl	x19, x19, x0
	add	w0, w0, w11
	ldrb	w17, [x17, 1280]
	sub	w11, w11, #1
	lsl	x4, x4, x0
	orr	x4, x19, x4
	lsl	x12, x12, x26
	orr	x12, x23, x12
	add	w0, w0, w17
	orr	x4, x12, x4
	sub	w17, w17, #1
	orr	x4, x4, x3
	orr	w11, w11, w17
	orr	w6, w18, w6
	and	w3, w0, -8
	orr	w6, w6, w11
	lsr	w11, w0, 3
	str	x4, [x20]
	orr	w10, w10, w6
	and	w19, w0, 7
	add	x20, x20, x11
	lsr	x3, x4, x3
	cmp	x15, x27
	bne	.L411
	ldr	x4, [sp, 128]
	add	x2, x2, 1
	sub	x1, x1, x16
	ldr	w12, [sp, 104]
	ldr	x6, [sp, 144]
	add	x4, x4, x2, lsl 2
	ldr	w0, [sp, 152]
	subs	x1, x1, #4
	mov	x11, x4
	beq	.L412
	add	x4, x4, x1
.L413:
	ldrb	w1, [x11], 1
	add	x2, x5, x1
	ldr	w1, [x5, x1, lsl 2]
	ldrb	w2, [x2, 1280]
	add	w15, w2, w19
	lsl	x1, x1, x19
	orr	x1, x1, x3
	and	w3, w15, -8
	sub	w2, w2, #1
	lsr	w16, w15, 3
	str	x1, [x20]
	orr	w10, w10, w2
	and	w19, w15, 7
	add	x20, x20, x16
	lsr	x3, x1, x3
	cmp	x11, x4
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
.L830:
	cmp	x1, 4
	bne	.L755
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
	add	w15, w19, w2
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
	.p2align 3,,7
.L356:
	ldr	w0, [x5, 1024]
	ldrb	w1, [x5, 1536]
	lsl	x0, x0, x19
	orr	x3, x0, x3
	str	x3, [x20]
	tbnz	w10, #31, .L128
	ldp	x25, x26, [sp, 64]
	.cfi_restore 26
	.cfi_restore 25
.L487:
	add	w1, w1, w19
	ands	w2, w1, 7
	lsr	w0, w1, 3
	lsr	w4, w1, 3
	add	x0, x20, x0
	beq	.L415
	and	w1, w1, -8
	lsr	x3, x3, x1
	strb	w3, [x20, w4, uxtw]
.L415:
	ldr	x1, [sp, 96]
	sub	x0, x0, x1
	uxtw	x1, w2
	add	x0, x1, x0, lsl 3
	b	.L49
.L296:
	.cfi_offset 25, -96
	.cfi_offset 26, -88
	ldr	x11, [x18, 20]
	ldr	x10, [x27, 20]
	cmp	x11, x10
	bne	.L832
	ldr	x11, [x18, 28]
	ldr	x10, [x27, 28]
	cmp	x11, x10
	beq	.L539
	eor	x10, x11, x10
	mov	w11, 28
	b	.L297
.L828:
	sub	x2, x4, #3
	ldr	w15, [x11, x2]
	ldr	w2, [x27, x2]
	cmp	w15, w2
	bne	.L375
	ldr	w2, [sp, 104]
	cmp	w2, 31
	bls	.L551
	ldr	x17, [x11, 4]
	ldr	x2, [x27, 4]
	cmp	x17, x2
	bne	.L377
	ldr	x17, [x11, 12]
	ldr	x2, [x27, 12]
	cmp	x17, x2
	beq	.L378
	eor	x17, x17, x2
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
.L366:
	ldr	x12, [x18, 20]
	ldr	x4, [x27, 20]
	cmp	x12, x4
	bne	.L833
	ldr	x12, [x18, 28]
	ldr	x4, [x27, 28]
	cmp	x12, x4
	beq	.L550
	eor	x4, x12, x4
	mov	w12, 28
	b	.L367
.L816:
	sub	x3, x10, #3
	ldr	w14, [x13, x3]
	ldr	w3, [x27, x3]
	cmp	w14, w3
	bne	.L305
	cmp	w26, 31
	bls	.L540
	ldr	x14, [x13, 4]
	ldr	x3, [x27, 4]
	cmp	x14, x3
	bne	.L307
	ldr	x14, [x13, 12]
	ldr	x3, [x27, 12]
	cmp	x14, x3
	beq	.L308
	eor	x14, x14, x3
	mov	w17, 12
.L309:
	rbit	x14, x14
	clz	x14, x14
	lsr	w3, w14, 3
	add	w17, w17, w3
.L313:
	cmp	w11, w17
	bcs	.L305
	uxtw	x3, w17
	sub	w14, w27, w13
	add	x10, x27, x3
	mov	x13, x3
	mov	w11, w17
	sub	w3, w17, #1
	b	.L329
.L437:
	ldr	x11, [x18, 28]
	ldr	x12, [x27, 28]
	cmp	x11, x12
	beq	.L561
	eor	x12, x11, x12
	mov	w11, 28
	b	.L436
.L516:
	mov	x25, x27
	mov	x26, x27
	b	.L168
.L498:
	mov	x25, x27
	mov	x26, x27
	b	.L92
.L560:
	mov	x12, 4
.L433:
	sub	x11, x27, #8
	str	w10, [sp, 128]
	mov	x10, x11
	b	.L438
	.p2align 2,,3
.L439:
	ldr	x14, [x18, x12]
	add	x12, x12, 8
	ldr	x25, [x10, x12]
	cmp	x14, x25
	bne	.L834
.L438:
	add	w14, w12, 8
	mov	w11, w12
	cmp	w15, w14
	bcs	.L439
	ldr	w10, [sp, 128]
	cmp	w15, w12
	bls	.L441
	and	x12, x12, 4294967295
	.p2align 3,,7
.L442:
	ldrb	w25, [x18, x12]
	mov	w11, w12
	ldrb	w14, [x27, x12]
	cmp	w25, w14
	bne	.L441
	add	x12, x12, 1
	cmp	w15, w12
	bhi	.L442
	add	w11, w11, 1
	b	.L441
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
.L318:
	eor	x3, x3, x10
	mov	w11, 4
.L320:
	rbit	x3, x3
	sub	w14, w27, w13
	clz	x3, x3
	lsr	w3, w3, 3
	add	w11, w11, w3
	uxtw	x13, w11
	sub	w3, w11, #1
	add	x10, x27, x13
	b	.L329
.L458:
	ldr	x3, [x4, 20]
	ldr	x11, [x27, 20]
	cmp	x3, x11
	bne	.L835
	ldr	x3, [x4, 28]
	ldr	x11, [x27, 28]
	cmp	x3, x11
	beq	.L565
	eor	x3, x3, x11
	mov	w11, 28
	b	.L459
.L521:
	mov	x2, x27
	mov	w9, w19
.L176:
	sub	x7, x22, x2
	orr	w15, w11, w19
	cmp	x7, 258
	csel	x7, x7, x18, ls
	sub	w1, w7, #4
	cmp	w1, 31
	bls	.L522
	ldr	x1, [x0, 4]
	ldr	x11, [x2, 4]
	cmp	x1, x11
	bne	.L184
	ldr	x1, [x0, 12]
	ldr	x11, [x2, 12]
	cmp	x1, x11
	bne	.L836
	ldr	x1, [x0, 20]
	ldr	x11, [x2, 20]
	cmp	x1, x11
	beq	.L187
	eor	x1, x1, x11
	mov	w11, 20
	b	.L186
.L503:
	mov	x2, x27
	mov	w10, w13
.L100:
	sub	x1, x22, x2
	mov	x4, 258
	cmp	x1, 258
	orr	w30, w9, w13
	csel	x1, x1, x4, ls
	sub	w4, w1, #4
	mov	w8, w1
	cmp	w4, 31
	bls	.L504
	ldr	x4, [x2, 4]
	ldr	x1, [x16, 4]
	cmp	x1, x4
	bne	.L108
	ldr	x4, [x2, 12]
	ldr	x1, [x16, 12]
	cmp	x1, x4
	bne	.L837
	ldr	x4, [x2, 20]
	ldr	x1, [x16, 20]
	cmp	x1, x4
	beq	.L111
	eor	x1, x1, x4
	mov	w9, 20
	b	.L110
.L798:
	.cfi_restore 25
	.cfi_restore 26
	bl	memcpy
	ldr	x2, [sp, 104]
	mov	x1, 32768
	ldr	w3, [x21, 32]
	add	x0, x21, x2
	ldr	w5, [sp, 112]
	add	x0, x0, 4096
	uxtw	x4, w3
	sub	x6, x1, x4
	ldrb	w2, [x0, 1220]
	str	wzr, [x21, 1124]
	and	w2, w2, w5
	cmp	x28, x6
	bcs	.L838
	mrs	x0, tpidr_el0
	ldr	w5, [x21, 36]
	add	x0, x0, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x0, x0, #:tprel_lo12_nc:.LANCHOR1
	add	w6, w3, w28
	sub	w28, w3, #1
	str	w6, [x21, 32]
	sub	x4, x27, x4
	str	w28, [x0]
	cmp	w5, 12
	bls	.L839
.L209:
	cmp	x27, x22
	beq	.L281
	adrp	x0, .LANCHOR0
	add	x24, x0, :lo12:.LANCHOR0
	add	x0, x24, 464
	add	x15, x21, 73728
	str	x0, [sp, 104]
	add	x0, x24, 720
	add	x15, x15, 352
	add	x6, x21, 204800
	mov	w7, 42941
	str	x0, [sp, 112]
	add	x0, x24, 432
	ldr	w14, [sp, 128]
	movi	v0.8h, 0x80, lsl 8
	add	x5, x21, 2420
	add	x6, x6, 352
	sxth	w30, w28
	mov	x8, x15
	mov	w11, 0
	mov	w9, 0
	movk	w7, 0x1e35, lsl 16
	stp	x25, x26, [sp, 64]
	.cfi_offset 26, -88
	.cfi_offset 25, -96
	add	x26, x24, 848
	str	x0, [sp, 120]
	mov	w0, 0
	mov	w10, w0
	str	x24, [sp, 128]
	b	.L275
	.p2align 2,,3
.L844:
	mov	w13, -32767
	add	w1, w12, w13
	sxth	w12, w12
.L218:
	ldr	w0, [x27, 1]
	ubfiz	x10, x10, 2, 32
	cmp	w28, w1
	add	x23, x21, x10
	add	x23, x23, 73728
	sub	w3, w3, #32768
	ldr	w18, [x27]
	mul	w0, w0, w7
	sxth	w3, w3
	ldrsh	w13, [x23, 352]
	csel	w3, w30, w3, ge
	lsr	w1, w0, 19
	lsr	w0, w0, 19
	add	x24, x15, x1, lsl 2
	prfm	PSTL1KEEP, [x24]
	strh	w12, [x23, 352]
	cmp	w13, w3
	ble	.L222
	add	x10, x8, x10
	ldr	w24, [x4, w13, sxtw]
	add	x23, x4, w13, sxtw
	ldrsh	w12, [x10, 2]
	strh	w13, [x10, 2]
	cmp	w18, w24
	beq	.L840
	cmp	w3, w12
	bge	.L222
	ldr	w3, [x4, w12, sxtw]
	add	x12, x4, w12, sxtw
	cmp	w18, w3
	beq	.L841
.L222:
	mov	x3, x27
	add	w11, w11, 1
	ldrb	w1, [x3], 1
	add	x10, x5, x1
	add	x1, x21, x1, lsl 2
	add	x12, x1, 65536
	ldrb	w10, [x10, 1280]
	ldr	w1, [x1, 2420]
	ldr	w16, [x12, 2496]
	add	w13, w10, w19
	sub	w10, w10, #1
	lsl	x1, x1, x19
	add	w16, w16, 1
	orr	x1, x1, x2
	and	w2, w13, -8
	str	w16, [x12, 2496]
	lsr	w12, w13, 3
	str	x1, [x20]
	orr	w9, w9, w10
	and	w19, w13, 7
	add	x20, x20, x12
	lsr	x2, x1, x2
	tst	x11, 15
	beq	.L842
.L266:
	cmp	x3, x22
	beq	.L286
.L271:
	mov	w10, w0
	mov	x27, x3
.L275:
	sub	x1, x22, x27
	mov	w16, w14
	mov	w17, 258
	cmp	x1, 257
	bls	.L843
.L212:
	sub	x12, x27, x4
	mov	w3, w12
	cmp	w12, 32768
	bne	.L844
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
	mov	w12, 0
	mov	w1, -32767
	mov	w3, 0
	b	.L218
.L834:
	ldr	w10, [sp, 128]
	eor	x12, x14, x25
	b	.L436
.L519:
	add	x5, x21, 2420
	mov	w11, w19
	b	.L173
.L795:
	mrs	x5, tpidr_el0
	cmp	x28, x1
	add	x5, x5, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x5, x5, #:tprel_lo12_nc:.LANCHOR1
	mov	w6, -32768
	mov	x3, x27
	mov	w4, w6
	mov	x0, x24
	csel	x2, x28, x1, ls
	mov	x1, 131072
	str	w6, [x5]
	str	w2, [x21, 32]
.L170:
	movi	v0.8h, 0x80, lsl 8
	add	x1, x0, x1
	.p2align 3,,7
.L172:
	stp	q0, q0, [x0]
	stp	q0, q0, [x0, 32]
	add	x0, x0, 64
	cmp	x0, x1
	bne	.L172
	mov	w0, 15
	str	w0, [x21, 36]
	b	.L171
.L501:
	mov	w9, w19
	add	x5, x21, 2420
	b	.L97
.L782:
	mrs	x5, tpidr_el0
	cmp	x28, x1
	add	x5, x5, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x5, x5, #:tprel_lo12_nc:.LANCHOR1
	csel	x4, x28, x1, ls
	mov	w7, -32768
	mov	x3, x27
	mov	w6, w7
	mov	x1, x24
	mov	x2, 131072
	str	w7, [x5]
	str	w4, [x21, 32]
.L94:
	movi	v0.8h, 0x80, lsl 8
	add	x2, x1, x2
	.p2align 3,,7
.L96:
	stp	q0, q0, [x1]
	stp	q0, q0, [x1, 32]
	add	x1, x1, 64
	cmp	x1, x2
	bne	.L96
	mov	w1, 15
	str	w1, [x21, 36]
	b	.L95
.L108:
	eor	x1, x1, x4
	mov	w9, 4
.L110:
	rbit	x4, x1
	clz	x4, x4
	lsr	w4, w4, 3
	add	w4, w9, w4
	add	x27, x2, x4
.L115:
	sub	x16, x2, x16
	mov	w1, 256
	sub	w1, w1, w16
	sub	w9, w16, #1
	add	x11, x21, x4
	add	x15, x21, x4, lsl 2
	lsr	w1, w1, 29
	ldrb	w8, [x17, x4]
	add	x11, x11, 4096
	str	x0, [x20]
	lsr	w4, w9, w1
	ldr	w15, [x15, 4020]
	add	x8, x21, x8, lsl 2
	ldrb	w4, [x28, w4, uxtw]
	add	x8, x8, 65536
	ldrb	w12, [x11, 960]
	and	w11, w13, 56
	lsl	x15, x15, x10
	add	w12, w12, w10
	add	w10, w4, w1, lsl 1
	add	x4, x5, x10
	lsr	x11, x0, x11
	add	x9, x21, x10, lsl 2
	orr	x11, x11, x15
	ldr	w0, [x18, x10, lsl 2]
	mov	x1, x10
	ldrb	w4, [x4, 1568]
	ubfx	x10, x13, 3, 3
	ldr	w15, [x9, 3572]
	sub	w0, w16, w0
	add	w16, w4, w12
	add	x9, x9, 65536
	add	x13, x20, x10
	ldrb	w1, [x19, w1, uxtw]
	lsl	x15, x15, x12
	sub	w4, w4, #1
	lsl	x0, x0, x16
	orr	x0, x0, x15
	orr	x0, x0, x11
	str	x0, [x20, w10, uxtw]
	add	x10, x2, 3
	add	w1, w1, w16
	ldr	w11, [x8, 3524]
	cmp	x14, x10
	csel	x10, x14, x10, ls
	and	w12, w1, 56
	add	w11, w11, 1
	str	w11, [x8, 3524]
	cmp	x27, x10
	sub	x11, x27, #1
	ldr	w15, [x9, 3648]
	csel	x8, x27, x10, cc
	orr	w4, w4, w1
	ubfx	x20, x1, 3, 3
	add	w10, w15, 1
	str	w10, [x9, 3648]
	cmp	x25, x11
	add	x20, x13, x20
	ccmp	x8, x11, 2, cs
	and	w13, w1, 7
	orr	w9, w4, w30
	lsr	x0, x0, x12
	bls	.L845
.L118:
	mov	x10, 2264924160
	add	x2, x2, 1
	movk	x10, 0xebca, lsl 32
	movk	x10, 0xb185, lsl 48
	cmp	x8, x2
	bls	.L122
	.p2align 3,,7
.L119:
	ldr	x1, [x2]
	sub	x4, x2, x3
	add	x2, x2, 1
	mul	x1, x1, x10
	lsr	x1, x1, 48
	strh	w4, [x24, x1, lsl 1]
	cmp	x8, x2
	bne	.L119
.L122:
	cmp	x25, x27
	bls	.L767
	ldr	x1, [x27]
	mul	x1, x1, x7
	lsr	x1, x1, 48
	b	.L98
.L184:
	eor	x1, x1, x11
	mov	w11, 4
.L186:
	rbit	x7, x1
	clz	x7, x7
	lsr	w7, w7, 3
	add	w7, w11, w7
	add	x27, x2, x7
.L191:
	sub	x1, x2, x0
	add	x11, x21, x7
	sub	w12, w17, w1
	sub	w0, w1, #1
	add	x7, x21, x7, lsl 2
	str	x10, [x20]
	lsr	w12, w12, 29
	and	w16, w19, 56
	add	x11, x11, 4096
	lsr	w0, w0, w12
	ldr	w13, [x7, 4020]
	lsr	x10, x10, x16
	ubfx	x16, x19, 3, 3
	ldrb	w7, [x30, w0, uxtw]
	add	x0, x20, x16
	lsl	x13, x13, x9
	orr	x10, x10, x13
	ldrb	w11, [x11, 960]
	add	w19, w7, w12, lsl 1
	add	x7, x5, x19
	add	x13, x19, 288
	add	w11, w11, w9
	add	x9, x2, 3
	ldrb	w12, [x8, w19, uxtw]
	cmp	x14, x9
	ldrb	w7, [x7, 1568]
	csel	x9, x14, x9, ls
	ldr	w19, [x28, x19, lsl 2]
	cmp	x27, x9
	ldr	w13, [x5, x13, lsl 2]
	csel	x9, x27, x9, cc
	sub	w1, w1, w19
	add	w19, w7, w11
	add	w12, w12, w19
	sub	w7, w7, #1
	lsl	x13, x13, x11
	orr	w7, w7, w12
	lsl	x1, x1, x19
	orr	x1, x1, x13
	orr	x10, x1, x10
	and	w13, w12, 56
	sub	x1, x27, #1
	str	x10, [x20, w16, uxtw]
	cmp	x25, x1
	ubfx	x20, x12, 3, 3
	orr	w11, w7, w15
	add	x20, x0, x20
	and	w19, w12, 7
	ccmp	x9, x1, 2, cs
	lsr	x10, x10, x13
	bls	.L846
.L194:
	mov	x7, 2264924160
	add	x2, x2, 1
	movk	x7, 0xebca, lsl 32
	movk	x7, 0xb185, lsl 48
	cmp	x9, x2
	bls	.L198
	.p2align 3,,7
.L195:
	ldr	x0, [x2]
	sub	x1, x2, x3
	add	x2, x2, 1
	mul	x0, x0, x7
	lsr	x0, x0, 48
	strh	w1, [x24, x0, lsl 1]
	cmp	x9, x2
	bne	.L195
.L198:
	cmp	x25, x27
	bls	.L728
	ldr	x1, [x27]
	mul	x1, x1, x6
	lsr	x1, x1, 48
	b	.L174
.L833:
	eor	x4, x12, x4
	mov	w12, 20
	b	.L367
.L832:
	eor	x10, x11, x10
	mov	w11, 20
	b	.L297
.L561:
	mov	x12, 36
	b	.L433
.L810:
	cmp	x28, 12
	sub	x26, x22, #12
	csel	x26, x26, x27, hi
	sub	x25, x22, #9
	b	.L131
.L806:
	cmp	x28, 12
	sub	x26, x22, #12
	csel	x26, x26, x27, hi
	sub	x25, x22, #9
	b	.L53
.L831:
	eor	x2, x2, x4
	mov	w12, 12
	b	.L390
.L820:
	eor	x3, x3, x10
	mov	w11, 12
	b	.L320
.L835:
	eor	x3, x3, x11
	mov	w11, 20
	b	.L459
.L837:
	eor	x1, x1, x4
	mov	w9, 12
	b	.L110
.L836:
	eor	x1, x1, x11
	mov	w11, 12
	b	.L186
.L446:
	eor	x3, x3, x14
	mov	w17, 4
	b	.L448
.L838:
	.cfi_restore 25
	.cfi_restore 26
	mrs	x3, tpidr_el0
	cmp	x28, x1
	add	x3, x3, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x3, x3, #:tprel_lo12_nc:.LANCHOR1
	add	x0, x21, 73728
	csel	x6, x28, x1, ls
	mov	w5, -32768
	add	x0, x0, 352
	mov	w28, w5
	mov	x4, x27
	str	w5, [x3]
	str	w6, [x21, 32]
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
	b	.L209
	.p2align 2,,3
.L840:
	.cfi_offset 25, -96
	.cfi_offset 26, -88
	sub	w25, w17, #4
	cmp	w25, 31
	bls	.L527
	ldr	x11, [x23, 4]
	ldr	x10, [x27, 4]
	cmp	x11, x10
	bne	.L225
	ldr	x11, [x23, 12]
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
	ccmp	w16, w11, 0, lt
	bls	.L237
	ldr	w3, [x4, w12, sxtw]
	add	x12, x4, w12, sxtw
	cmp	w18, w3
	beq	.L847
.L237:
	add	x3, x27, x10
	sub	w16, w27, w23
	sub	w13, w11, #1
	uxtw	x10, w11
.L236:
	ldr	x23, [sp, 128]
	add	x17, x21, x10
	mov	w12, 256
	sub	w12, w12, w16
	add	x17, x17, 4096
	add	x24, x21, x10, lsl 2
	lsr	w12, w12, 29
	ldrb	w10, [x23, x10]
	ldr	x23, [sp, 104]
	sub	w18, w16, #1
	ldrb	w17, [x17, 960]
	add	x10, x21, x10, lsl 2
	lsr	w18, w18, w12
	add	x10, x10, 65536
	add	w11, w11, 4
	ldrb	w23, [x23, w18, uxtw]
	add	w18, w17, w19
	ldr	w17, [x24, 4020]
	add	w23, w23, w12, lsl 1
	lsl	x17, x17, x19
	orr	x17, x17, x2
	ldr	x2, [sp, 120]
	add	x19, x5, x23
	add	x24, x21, x23, lsl 2
	ldrb	w12, [x2, w23, uxtw]
	ldr	x2, [sp, 112]
	ldrb	w19, [x19, 1568]
	ldr	w2, [x2, x23, lsl 2]
	add	x23, x24, 65536
	ldr	w24, [x24, 3572]
	sub	w2, w16, w2
	add	w16, w19, w18
	add	w12, w12, w16
	sub	w19, w19, #1
	lsl	x24, x24, x18
	orr	w9, w9, w19
	lsl	x2, x2, x16
	orr	x2, x2, x24
	orr	x2, x2, x17
	str	x2, [x20]
	lsr	w18, w12, 3
	and	w19, w12, -8
	ldr	w24, [x10, 3524]
	add	x20, x20, x18
	lsr	x2, x2, x19
	and	w19, w12, 7
	add	w18, w24, 1
	str	w18, [x10, 3524]
	add	x16, x27, 1
	ldr	w12, [x23, 3648]
	sub	x17, x22, x16
	sub	x10, x16, x4
	add	w12, w12, 1
	str	w12, [x23, 3648]
	cmp	x11, x17
	bgt	.L261
	sub	w0, w10, #1
	mov	w11, 32767
	add	w0, w0, w13
	cmp	w0, w11
	bls	.L263
	mov	x0, x15
	.p2align 3,,7
.L264:
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
	bne	.L264
	add	x4, x4, 32768
	sub	w10, w10, #32768
.L263:
	add	w11, w13, 1
	sub	w12, w10, w16
	add	x11, x27, x11
	mov	x0, x1
	b	.L265
	.p2align 2,,3
.L848:
	uxtw	x0, w1
.L265:
	lsl	x0, x0, 2
	add	w13, w12, w16
	add	x10, x21, x0
	ldr	w1, [x16, 1]!
	add	x10, x10, 73728
	add	x0, x8, x0
	ldrsh	w17, [x10, 352]
	mul	w1, w1, w7
	strh	w17, [x0, 2]
	strh	w13, [x10, 352]
	lsr	w1, w1, 19
	cmp	x16, x11
	bne	.L848
	mov	w0, w1
	ubfiz	x1, x0, 2, 13
	prfm	PSTL1KEEP, [x15, x1]
.L261:
	mov	w11, 0
	b	.L266
.L225:
	eor	x10, x11, x10
	mov	w11, 4
	b	.L227
.L843:
	mov	w17, w1
	cmp	w1, 4
	bls	.L849
	cmp	w1, w14
	csel	w16, w1, w14, ls
	b	.L212
.L841:
	sub	w3, w17, #4
	cmp	w3, 31
	bls	.L531
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
	sub	w16, w27, w12
	clz	x3, x3
	lsr	w3, w3, 3
	add	w10, w11, w3
	mov	x11, x10
	sub	w13, w10, #1
	add	x3, x27, x10
	b	.L236
.L842:
	cmp	x3, x22
	beq	.L286
	mov	x1, x3
	b	.L267
	.p2align 2,,3
.L270:
	add	x1, x1, 1
	cmp	x1, x22
	beq	.L269
.L267:
	ldrb	w10, [x1]
	ldrb	w10, [x26, w10, sxtw]
	tst	x10, 3
	bne	.L270
.L269:
	sub	x12, x1, x3
	cmp	x12, 15
	ble	.L271
	sub	x1, x12, #4
	mov	x10, x3
	and	x13, x1, -4
	str	w0, [sp, 136]
	add	x16, x13, 5
	lsr	x1, x1, 2
	add	x27, x27, x16
	stp	x4, x3, [sp, 144]
	.p2align 3,,7
.L272:
	ldrb	w0, [x10]
	ldrb	w16, [x10, 1]
	add	x10, x10, 4
	add	x17, x5, x0
	ldrb	w4, [x10, -2]
	add	x0, x21, x0, lsl 2
	add	x3, x5, x16
	add	x24, x0, 65536
	add	x16, x21, x16, lsl 2
	add	x18, x16, 65536
	ldrb	w17, [x17, 1280]
	ldr	w23, [x0, 2420]
	add	x25, x21, x4, lsl 2
	ldr	w0, [x24, 2496]
	add	x4, x5, x4
	add	w0, w0, 1
	str	w0, [x24, 2496]
	lsl	x23, x23, x19
	add	w0, w17, w19
	ldr	w19, [x18, 2496]
	add	x24, x25, 65536
	ldr	w16, [x16, 2420]
	sub	w17, w17, #1
	ldrb	w3, [x3, 1280]
	add	w19, w19, 1
	str	w19, [x18, 2496]
	ldrb	w18, [x10, -1]
	lsl	x16, x16, x0
	orr	x16, x16, x23
	ldr	w23, [x25, 2420]
	ldr	w25, [x24, 2496]
	add	w19, w0, w3
	add	x0, x21, x18, lsl 2
	ldrb	w4, [x4, 1280]
	add	w25, w25, 1
	str	w25, [x24, 2496]
	add	x18, x5, x18
	add	x24, x0, 65536
	ldr	w0, [x0, 2420]
	add	w25, w19, w4
	sub	w3, w3, #1
	lsl	x23, x23, x19
	ldrb	w18, [x18, 1280]
	orr	w3, w17, w3
	lsl	x0, x0, x25
	ldr	w17, [x24, 2496]
	orr	x0, x0, x23
	add	w19, w25, w18
	sub	w4, w4, #1
	sub	w18, w18, #1
	orr	x0, x0, x16
	orr	w4, w4, w18
	orr	x0, x0, x2
	add	w17, w17, 1
	and	w2, w19, -8
	str	w17, [x24, 2496]
	orr	w3, w3, w4
	lsr	w4, w19, 3
	str	x0, [x20]
	orr	w9, w9, w3
	and	w19, w19, 7
	add	x20, x20, x4
	lsr	x2, x0, x2
	cmp	x10, x27
	bne	.L272
	ldp	x4, x3, [sp, 144]
	add	x1, x1, 1
	sub	x12, x12, x13
	ldr	w0, [sp, 136]
	subs	x12, x12, #4
	add	x3, x3, x1, lsl 2
	mov	x13, x3
	beq	.L273
	add	x3, x3, x12
.L274:
	ldrb	w1, [x13], 1
	add	x10, x5, x1
	add	x1, x21, x1, lsl 2
	add	x17, x1, 65536
	ldrb	w10, [x10, 1280]
	ldr	w1, [x1, 2420]
	ldr	w16, [x17, 2496]
	add	w12, w19, w10
	sub	w10, w10, #1
	add	w16, w16, 1
	lsl	x1, x1, x19
	orr	x1, x1, x2
	and	w2, w12, -8
	str	w16, [x17, 2496]
	lsr	w16, w12, 3
	str	x1, [x20]
	orr	w9, w9, w10
	and	w19, w12, 7
	add	x20, x20, x16
	lsr	x2, x1, x2
	cmp	x13, x3
	bne	.L274
.L273:
	sub	x1, x22, x3
	cmp	x1, 3
	ble	.L266
	ldr	w0, [x3]
	mov	w1, 42941
	movk	w1, 0x1e35, lsl 16
	mul	w0, w0, w1
	lsr	w0, w0, 19
	b	.L266
.L770:
	and	w9, w19, 7
	b	.L176
.L765:
	and	w10, w13, 7
	b	.L100
.L226:
	ldr	x11, [x23, 20]
	ldr	x10, [x27, 20]
	cmp	x11, x10
	beq	.L228
	eor	x10, x11, x10
	mov	w11, 20
	b	.L227
.L847:
	sub	x3, x10, #3
	ldr	w13, [x12, x3]
	ldr	w3, [x27, x3]
	cmp	w13, w3
	bne	.L237
	cmp	w25, 31
	bls	.L529
	ldr	x3, [x12, 4]
	ldr	x13, [x27, 4]
	cmp	x3, x13
	bne	.L239
	ldr	x3, [x12, 12]
	ldr	x13, [x27, 12]
	cmp	x3, x13
	beq	.L240
	eor	x3, x3, x13
	mov	w18, 12
.L241:
	rbit	x3, x3
	clz	x3, x3
	lsr	w3, w3, 3
	add	w18, w18, w3
.L245:
	cmp	w11, w18
	bcs	.L237
	uxtw	x10, w18
	sub	w16, w27, w12
	add	x3, x27, x10
	sub	w13, w18, #1
	mov	w11, w18
	b	.L236
.L783:
	cbz	w4, .L500
	mov	x1, 4
	mov	x2, 131072
	lsl	x4, x1, x4
	add	x1, x24, x4
	sub	x2, x2, x4
	b	.L94
.L796:
	cbz	w2, .L518
	mov	x0, 4
	mov	x1, 131072
	lsl	x2, x0, x2
	add	x0, x24, x2
	sub	x1, x1, x2
	b	.L170
.L250:
	eor	x3, x3, x10
	mov	w11, 4
	b	.L252
.L538:
	mov	x10, 4
.L294:
	sub	x11, x27, #8
	str	w0, [sp, 128]
	mov	x0, x11
	b	.L299
	.p2align 2,,3
.L300:
	ldr	x14, [x18, x10]
	add	x10, x10, 8
	ldr	x25, [x0, x10]
	cmp	x14, x25
	bne	.L850
.L299:
	add	w14, w10, 8
	mov	w11, w10
	cmp	w15, w14
	bcs	.L300
	ldr	w0, [sp, 128]
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
.L549:
	mov	x4, 4
.L364:
	sub	x12, x27, #8
	str	x3, [sp, 128]
	mov	x3, x12
	b	.L369
	.p2align 2,,3
.L370:
	ldr	x15, [x18, x4]
	add	x4, x4, 8
	ldr	x26, [x3, x4]
	cmp	x15, x26
	bne	.L851
.L369:
	add	w15, w4, 8
	mov	w12, w4
	cmp	w16, w15
	bcs	.L370
	ldr	x3, [sp, 128]
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
.L799:
	.cfi_restore 25
	.cfi_restore 26
	mrs	x5, tpidr_el0
	add	x0, x21, 73728
	add	x5, x5, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x5, x5, #:tprel_lo12_nc:.LANCHOR1
	mov	w6, -32768
	cmp	x28, x3
	add	x0, x0, 352
	mov	w16, w6
	mov	x4, x27
	csel	x3, x28, x3, ls
	mov	x1, 131072
	str	w6, [x5]
	str	w3, [x21, 32]
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
.L821:
	mrs	x2, tpidr_el0
	add	x0, x21, 73728
	add	x2, x2, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x2, x2, #:tprel_lo12_nc:.LANCHOR1
	mov	w4, -32768
	cmp	x28, x1
	add	x0, x0, 352
	mov	w14, w4
	mov	x6, x27
	csel	x28, x28, x1, ls
	str	w4, [x2]
	str	w28, [x21, 32]
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
.L512:
	.cfi_offset 25, -96
	.cfi_offset 26, -88
	mov	x3, x27
	mov	w9, w19
.L139:
	sub	x7, x22, x3
	orr	w28, w1, w19
	cmp	x7, 258
	csel	x7, x7, x16, ls
	sub	w1, w7, #4
	cmp	w1, 31
	bls	.L513
	ldr	x1, [x0, 4]
	ldr	x11, [x3, 4]
	cmp	x1, x11
	bne	.L147
	ldr	x1, [x0, 12]
	ldr	x11, [x3, 12]
	cmp	x1, x11
	beq	.L148
	eor	x1, x1, x11
	mov	w11, 12
.L149:
	rbit	x1, x1
	clz	x1, x1
	lsr	w7, w1, 3
	add	w7, w11, w7
	add	x27, x3, x7
.L154:
	sub	x1, x3, x0
	add	x12, x21, x7
	sub	w11, w15, w1
	sub	w0, w1, #1
	add	x7, x21, x7, lsl 2
	str	x10, [x20]
	lsr	w11, w11, 29
	and	w30, w19, 56
	add	x12, x12, 4096
	lsr	w0, w0, w11
	ldr	w13, [x7, 4020]
	lsr	x10, x10, x30
	ubfx	x30, x19, 3, 3
	ldrb	w7, [x18, w0, uxtw]
	add	x0, x20, x30
	lsl	x13, x13, x9
	orr	x10, x10, x13
	ldrb	w12, [x12, 960]
	add	w19, w7, w11, lsl 1
	add	x7, x5, x19
	add	x13, x19, 288
	add	w12, w12, w9
	add	x9, x3, 3
	ldrb	w11, [x8, w19, uxtw]
	cmp	x14, x9
	ldrb	w7, [x7, 1568]
	csel	x9, x14, x9, ls
	ldr	w19, [x17, x19, lsl 2]
	cmp	x27, x9
	ldr	w13, [x5, x13, lsl 2]
	csel	x9, x27, x9, cc
	sub	w1, w1, w19
	add	w19, w7, w12
	add	w11, w11, w19
	sub	w7, w7, #1
	lsl	x1, x1, x19
	orr	w7, w7, w11
	lsl	x13, x13, x12
	orr	x12, x1, x13
	orr	x10, x12, x10
	and	w13, w11, 56
	sub	x12, x27, #1
	str	x10, [x20, w30, uxtw]
	cmp	x25, x12
	ubfx	x20, x11, 3, 3
	orr	w1, w7, w28
	add	x20, x0, x20
	and	w19, w11, 7
	ccmp	x9, x12, 2, cs
	lsr	x10, x10, x13
	bls	.L852
.L157:
	mov	x11, 2264924160
	add	x3, x3, 1
	movk	x11, 0xebca, lsl 32
	movk	x11, 0xb185, lsl 48
	cmp	x9, x3
	bls	.L161
	.p2align 3,,7
.L158:
	ldr	x0, [x3]
	sub	x7, x3, x2
	add	x3, x3, 1
	mul	x0, x0, x11
	lsr	x0, x0, 50
	strh	w7, [x24, x0, lsl 1]
	cmp	x9, x3
	bne	.L158
.L161:
	cmp	x25, x27
	bls	.L727
	ldr	x7, [x27]
	mul	x7, x7, x6
	lsr	x7, x7, 50
	b	.L137
.L494:
	mov	x3, x27
	mov	w9, w13
.L61:
	sub	x8, x22, x3
	mov	x1, 258
	cmp	x8, 258
	orr	w28, w10, w13
	csel	x8, x8, x1, ls
	sub	w1, w8, #4
	cmp	w1, 31
	bls	.L495
	ldr	x4, [x3, 4]
	ldr	x1, [x18, 4]
	cmp	x1, x4
	bne	.L69
	ldr	x4, [x3, 12]
	ldr	x1, [x18, 12]
	cmp	x1, x4
	beq	.L70
	eor	x1, x1, x4
	mov	w10, 12
.L71:
	rbit	x1, x1
	clz	x1, x1
	lsr	w4, w1, 3
	add	w4, w10, w4
	add	x27, x3, x4
.L76:
	sub	x18, x3, x18
	mov	w1, 256
	sub	w1, w1, w18
	sub	w10, w18, #1
	add	x11, x21, x4
	add	x17, x21, x4, lsl 2
	lsr	w1, w1, 29
	ldrb	w8, [x15, x4]
	add	x11, x11, 4096
	str	x0, [x20]
	lsr	w4, w10, w1
	ldr	w17, [x17, 4020]
	add	x8, x21, x8, lsl 2
	ldrb	w4, [x16, w4, uxtw]
	add	x8, x8, 65536
	ldrb	w12, [x11, 960]
	and	w11, w13, 56
	lsl	x17, x17, x9
	add	w12, w12, w9
	add	w9, w4, w1, lsl 1
	add	x4, x5, x9
	lsr	x11, x0, x11
	add	x10, x21, x9, lsl 2
	orr	x11, x11, x17
	ldr	w0, [x30, x9, lsl 2]
	mov	x1, x9
	ldrb	w4, [x4, 1568]
	ubfx	x9, x13, 3, 3
	ldr	w17, [x10, 3572]
	sub	w0, w18, w0
	add	w18, w4, w12
	add	x10, x10, 65536
	add	x13, x20, x9
	ldrb	w1, [x19, w1, uxtw]
	lsl	x17, x17, x12
	sub	w4, w4, #1
	lsl	x0, x0, x18
	orr	x0, x0, x17
	orr	x0, x0, x11
	str	x0, [x20, w9, uxtw]
	add	x9, x3, 3
	add	w1, w1, w18
	ldr	w11, [x8, 3524]
	cmp	x14, x9
	csel	x9, x14, x9, ls
	and	w12, w1, 56
	add	w11, w11, 1
	str	w11, [x8, 3524]
	cmp	x27, x9
	sub	x11, x27, #1
	ldr	w17, [x10, 3648]
	csel	x8, x27, x9, cc
	orr	w4, w4, w1
	ubfx	x20, x1, 3, 3
	add	w9, w17, 1
	str	w9, [x10, 3648]
	cmp	x25, x11
	add	x20, x13, x20
	ccmp	x8, x11, 2, cs
	and	w13, w1, 7
	orr	w10, w4, w28
	lsr	x0, x0, x12
	bls	.L853
.L79:
	mov	x9, 2264924160
	add	x3, x3, 1
	movk	x9, 0xebca, lsl 32
	movk	x9, 0xb185, lsl 48
	cmp	x8, x3
	bls	.L83
	.p2align 3,,7
.L80:
	ldr	x1, [x3]
	sub	x4, x3, x2
	add	x3, x3, 1
	mul	x1, x1, x9
	lsr	x1, x1, 50
	strh	w4, [x24, x1, lsl 1]
	cmp	x8, x3
	bne	.L80
.L83:
	cmp	x25, x27
	bls	.L764
	ldr	x1, [x27]
	mul	x1, x1, x7
	lsr	x1, x1, 50
	b	.L59
.L564:
	mov	x3, 4
.L456:
	sub	x14, x27, #8
	b	.L461
	.p2align 2,,3
.L462:
	ldr	x12, [x4, x3]
	add	x3, x3, 8
	ldr	x17, [x14, x3]
	cmp	x12, x17
	bne	.L854
.L461:
	add	w12, w3, 8
	mov	w11, w3
	cmp	w15, w12
	bcs	.L462
	and	x12, x3, 4294967295
	cmp	w15, w3
	bhi	.L465
	b	.L855
	.p2align 2,,3
.L467:
	add	x12, x12, 1
	cmp	w15, w12
	bls	.L856
.L465:
	ldrb	w11, [x4, x12]
	mov	w14, w12
	ldrb	w3, [x27, x12]
	cmp	w11, w3
	beq	.L467
	add	x3, x27, x12
	sub	w14, w12, #1
	mov	w11, w12
.L466:
	sub	w4, w27, w4
	uxtw	x15, w11
	b	.L468
.L850:
	ldr	w0, [sp, 128]
	eor	x10, x14, x25
	b	.L297
.L851:
	ldr	x3, [sp, 128]
	eor	x4, x15, x26
	b	.L367
.L846:
	ldr	x0, [x27, -1]
	mov	x7, 2264924160
	movk	x7, 0xebca, lsl 32
	sub	x1, x1, x3
	movk	x7, 0xb185, lsl 48
	mul	x0, x0, x7
	lsr	x0, x0, 48
	strh	w1, [x24, x0, lsl 1]
	b	.L194
.L845:
	ldr	x1, [x27, -1]
	mov	x4, 2264924160
	movk	x4, 0xebca, lsl 32
	sub	x11, x11, x3
	movk	x4, 0xb185, lsl 48
	mul	x1, x1, x4
	lsr	x1, x1, 48
	strh	w11, [x24, x1, lsl 1]
	b	.L118
.L811:
	mrs	x3, tpidr_el0
	mov	w5, -32768
	add	x3, x3, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x3, x3, #:tprel_lo12_nc:.LANCHOR1
	cmp	x28, x1
	mov	x2, x27
	mov	w4, w5
	mov	x0, x24
	csel	x28, x28, x1, ls
	str	w5, [x3]
	str	w28, [x21, 32]
.L133:
	movi	v0.8h, 0x80, lsl 8
	add	x1, x0, x1
	.p2align 3,,7
.L135:
	stp	q0, q0, [x0]
	stp	q0, q0, [x0, 32]
	add	x0, x0, 64
	cmp	x0, x1
	bne	.L135
	mov	w0, 13
	str	w0, [x21, 36]
	b	.L134
.L822:
	.cfi_restore 25
	.cfi_restore 26
	add	x0, x21, 73728
	add	x0, x0, 352
	cbz	w4, .L348
	mov	x2, 4
	lsl	x2, x2, x4
	add	x0, x0, x2
	sub	x1, x1, x2
	b	.L348
.L800:
	add	x0, x21, 73728
	add	x0, x0, 352
	cbz	w3, .L536
	mov	x5, 4
	mov	x1, 131072
	lsl	x3, x5, x3
	add	x0, x0, x3
	sub	x1, x1, x3
	b	.L278
.L807:
	.cfi_offset 25, -96
	.cfi_offset 26, -88
	mrs	x4, tpidr_el0
	mov	w5, -32768
	add	x4, x4, #:tprel_hi12:.LANCHOR1, lsl #12
	add	x4, x4, #:tprel_lo12_nc:.LANCHOR1
	cmp	x28, x3
	mov	x2, x27
	mov	w6, w5
	mov	x1, x24
	csel	x28, x28, x3, ls
	str	w5, [x4]
	str	w28, [x21, 32]
.L55:
	movi	v0.8h, 0x80, lsl 8
	add	x3, x1, x3
	.p2align 3,,7
.L57:
	stp	q0, q0, [x1]
	stp	q0, q0, [x1, 32]
	add	x1, x1, 64
	cmp	x1, x3
	bne	.L57
	mov	w1, 13
	str	w1, [x21, 36]
	b	.L56
.L510:
	add	x5, x21, 2420
	mov	w7, w19
	b	.L136
.L492:
	mov	w10, w19
	add	x5, x21, 2420
	b	.L58
.L69:
	eor	x1, x1, x4
	mov	w10, 4
	b	.L71
.L147:
	eor	x1, x1, x11
	mov	w11, 4
	b	.L149
.L762:
	and	w9, w13, 7
	b	.L61
.L854:
	eor	x3, x12, x17
	b	.L459
.L768:
	and	w9, w19, 7
	b	.L139
.L228:
	ldr	x11, [x23, 28]
	ldr	x10, [x27, 28]
	cmp	x11, x10
	beq	.L528
	eor	x10, x11, x10
	mov	w11, 28
	b	.L227
.L539:
	mov	x10, 36
	b	.L294
.L550:
	mov	x4, 36
	b	.L364
.L812:
	cbz	w3, .L509
	mov	x0, 4
	lsl	x0, x0, x3
	sub	x1, x1, x0
	add	x0, x24, x0
	b	.L133
.L808:
	cbz	w4, .L491
	mov	x1, 4
	lsl	x1, x1, x4
	sub	x3, x3, x1
	add	x1, x24, x1
	b	.L55
.L527:
	mov	x10, 4
.L224:
	sub	x11, x27, #8
	str	w0, [sp, 136]
	mov	x0, x11
	b	.L229
	.p2align 2,,3
.L230:
	ldr	x13, [x23, x10]
	add	x10, x10, 8
	ldr	x24, [x0, x10]
	cmp	x13, x24
	bne	.L857
.L229:
	add	w13, w10, 8
	mov	w11, w10
	cmp	w17, w13
	bcs	.L230
	ldr	w0, [sp, 136]
	cmp	w17, w10
	bls	.L232
	and	x10, x10, 4294967295
	.p2align 3,,7
.L233:
	ldrb	w24, [x23, x10]
	mov	w11, w10
	ldrb	w13, [x27, x10]
	cmp	w24, w13
	bne	.L232
	add	x10, x10, 1
	cmp	w17, w10
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
.L321:
	ldr	x3, [x13, 28]
	ldr	x10, [x27, 28]
	cmp	x3, x10
	beq	.L543
	eor	x3, x3, x10
	mov	w11, 28
	b	.L320
.L565:
	mov	x3, 36
	b	.L456
.L818:
	cmp	x1, 4
	bne	.L423
	mov	x1, x27
	add	x8, x27, 4
	.p2align 3,,7
.L424:
	ldrb	w3, [x1]
	add	x1, x1, 4
	ldrb	w4, [x1, -3]
	ldrb	w2, [x1, -2]
	add	x12, x5, x3
	add	x11, x5, x4
	ldrb	w9, [x1, -1]
	add	x6, x5, x2
	ldr	w7, [x5, x3, lsl 2]
	ldrb	w3, [x12, 1280]
	add	x16, x5, x9
	ldrb	w11, [x11, 1280]
	add	w15, w3, w19
	ldrb	w6, [x6, 1280]
	ldr	w13, [x5, x4, lsl 2]
	add	w14, w15, w11
	ldr	w12, [x5, x9, lsl 2]
	add	w4, w14, w6
	ldr	w2, [x5, x2, lsl 2]
	lsl	x7, x7, x19
	ldrb	w9, [x16, 1280]
	lsl	x13, x13, x15
	lsl	x12, x12, x4
	orr	x7, x7, x13
	lsl	x2, x2, x14
	orr	x2, x2, x12
	add	w4, w4, w9
	orr	x2, x2, x7
	sub	w6, w6, #1
	sub	w3, w3, #1
	sub	w11, w11, #1
	sub	w9, w9, #1
	orr	x0, x2, x0
	orr	w3, w3, w11
	orr	w2, w6, w9
	and	w7, w4, -8
	orr	w2, w3, w2
	lsr	w6, w4, 3
	sub	x3, x8, x1
	str	x0, [x20]
	orr	w10, w10, w2
	and	w19, w4, 7
	add	x20, x20, x6
	lsr	x0, x0, x7
	cmp	x3, 3
	bhi	.L424
	b	.L425
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
	b	.L425
.L391:
	ldr	x2, [x11, 28]
	ldr	x4, [x27, 28]
	cmp	x2, x4
	beq	.L554
	eor	x2, x2, x4
	mov	w12, 28
	b	.L390
.L506:
	mov	x7, x27
	b	.L124
.L524:
	mov	x8, x27
	b	.L200
.L553:
	mov	x4, 4
.L387:
	sub	x15, x27, #8
	b	.L392
	.p2align 2,,3
.L393:
	ldr	x2, [x11, x4]
	add	x4, x4, 8
	ldr	x17, [x15, x4]
	cmp	x2, x17
	bne	.L858
.L392:
	add	w2, w4, 8
	mov	w12, w4
	cmp	w16, w2
	bcs	.L393
	and	x2, x4, 4294967295
	cmp	w16, w4
	bhi	.L396
	b	.L859
	.p2align 2,,3
.L398:
	add	x2, x2, 1
	cmp	w16, w2
	bls	.L860
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
.L542:
	mov	x10, 4
.L317:
	sub	x14, x27, #8
	b	.L322
	.p2align 2,,3
.L323:
	ldr	x3, [x13, x10]
	add	x10, x10, 8
	ldr	x17, [x14, x10]
	cmp	x3, x17
	bne	.L861
.L322:
	add	w3, w10, 8
	mov	w11, w10
	cmp	w15, w3
	bcs	.L323
	and	x14, x10, 4294967295
	cmp	w15, w10
	bhi	.L326
	b	.L862
	.p2align 2,,3
.L328:
	add	x14, x14, 1
	cmp	w15, w14
	bls	.L863
.L326:
	ldrb	w11, [x13, x14]
	mov	w3, w14
	ldrb	w10, [x27, x14]
	cmp	w11, w10
	beq	.L328
	add	x10, x27, x14
	mov	w11, w14
	sub	w3, w14, #1
.L327:
	sub	w14, w27, w13
	uxtw	x13, w11
	b	.L329
.L857:
	ldr	w0, [sp, 136]
	eor	x10, x13, x24
	b	.L227
.L853:
	ldr	x1, [x27, -1]
	mov	x4, 2264924160
	movk	x4, 0xebca, lsl 32
	sub	x11, x11, x2
	movk	x4, 0xb185, lsl 48
	mul	x1, x1, x4
	lsr	x1, x1, 50
	strh	w11, [x24, x1, lsl 1]
	b	.L79
.L852:
	ldr	x0, [x27, -1]
	mov	x7, 2264924160
	movk	x7, 0xebca, lsl 32
	sub	x12, x12, x2
	movk	x7, 0xb185, lsl 48
	mul	x0, x0, x7
	lsr	x0, x0, 50
	strh	w12, [x24, x0, lsl 1]
	b	.L157
.L839:
	.cfi_restore 25
	.cfi_restore 26
	add	x0, x21, 73728
	add	x0, x0, 352
	cbz	w5, .L208
	mov	x3, 4
	lsl	x3, x3, x5
	add	x0, x0, x3
	sub	x1, x1, x3
	b	.L208
.L377:
	.cfi_offset 25, -96
	.cfi_offset 26, -88
	eor	x17, x17, x2
	mov	w2, 4
	b	.L379
.L70:
	ldr	x4, [x3, 20]
	ldr	x1, [x18, 20]
	cmp	x1, x4
	beq	.L72
	eor	x1, x1, x4
	mov	w10, 20
	b	.L71
.L148:
	ldr	x1, [x0, 20]
	ldr	x11, [x3, 20]
	cmp	x1, x11
	beq	.L150
	eor	x1, x1, x11
	mov	w11, 20
	b	.L149
.L307:
	eor	x14, x14, x3
	mov	w17, 4
	b	.L309
.L858:
	eor	x2, x2, x17
	b	.L390
.L861:
	eor	x3, x3, x17
	b	.L320
.L111:
	ldr	x4, [x2, 28]
	ldr	x1, [x16, 28]
	cmp	x1, x4
	beq	.L505
	eor	x1, x1, x4
	mov	w9, 28
	b	.L110
.L447:
	ldr	x3, [x4, 20]
	ldr	x14, [x27, 20]
	cmp	x3, x14
	beq	.L449
	eor	x3, x3, x14
	mov	w17, 20
	b	.L448
.L856:
	add	x3, x27, w12, uxtw
	add	w11, w14, 1
	b	.L466
.L187:
	ldr	x1, [x0, 28]
	ldr	x11, [x2, 28]
	cmp	x1, x11
	beq	.L523
	eor	x1, x1, x11
	mov	w11, 28
	b	.L186
.L504:
	mov	x4, 4
.L107:
	sub	x12, x2, #8
	b	.L112
	.p2align 2,,3
.L113:
	ldr	x1, [x16, x4]
	add	x4, x4, 8
	ldr	x11, [x12, x4]
	cmp	x1, x11
	bne	.L864
.L112:
	add	w1, w4, 8
	mov	w9, w4
	cmp	w8, w1
	bcs	.L113
	and	x27, x4, 4294967295
	cmp	w8, w4
	bhi	.L116
	b	.L865
	.p2align 2,,3
.L117:
	add	x27, x27, 1
	cmp	w8, w27
	bls	.L866
.L116:
	ldrb	w4, [x16, x27]
	mov	w9, w27
	ldrb	w1, [x2, x27]
	cmp	w4, w1
	beq	.L117
	add	x27, x2, x27
	uxtw	x4, w9
	b	.L115
.L522:
	mov	x12, 4
.L183:
	sub	x13, x2, #8
	b	.L188
	.p2align 2,,3
.L189:
	ldr	x1, [x0, x12]
	add	x12, x12, 8
	ldr	x16, [x13, x12]
	cmp	x1, x16
	bne	.L867
.L188:
	add	w1, w12, 8
	mov	w11, w12
	cmp	w7, w1
	bcs	.L189
	and	x27, x12, 4294967295
	cmp	w7, w12
	bhi	.L192
	b	.L868
	.p2align 2,,3
.L193:
	add	x27, x27, 1
	cmp	w7, w27
	bls	.L869
.L192:
	ldrb	w12, [x0, x27]
	mov	w11, w27
	ldrb	w1, [x2, x27]
	cmp	w12, w1
	beq	.L193
	add	x27, x2, x27
	uxtw	x7, w11
	b	.L191
.L528:
	mov	x10, 36
	b	.L224
.L420:
	.cfi_restore 25
	.cfi_restore 26
	ldr	w1, [x21, 3444]
	ldrb	w2, [x21, 3956]
	lsl	x1, x1, x19
	orr	x0, x1, x0
	ldr	x1, [sp, 96]
	str	x0, [x1, w23, uxtw]
	b	.L488
.L497:
	.cfi_offset 25, -96
	.cfi_offset 26, -88
	mov	x7, x27
	b	.L85
.L284:
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
	bne	.L284
	b	.L286
.L554:
	mov	x4, 36
	b	.L387
.L253:
	ldr	x3, [x12, 28]
	ldr	x10, [x27, 28]
	cmp	x3, x10
	beq	.L532
	eor	x3, x3, x10
	mov	w11, 28
	b	.L252
.L543:
	mov	x10, 36
	b	.L317
.L515:
	mov	x9, x27
	b	.L163
.L281:
	.cfi_restore 25
	.cfi_restore 26
	ldr	w0, [x21, 3444]
	ldrb	w1, [x21, 3956]
	lsl	x0, x0, x19
	orr	x2, x0, x2
	ldr	x0, [sp, 96]
	str	x2, [x0, w23, uxtw]
	b	.L486
.L531:
	.cfi_offset 25, -96
	.cfi_offset 26, -88
	mov	x3, 4
.L249:
	sub	x13, x27, #8
	b	.L254
	.p2align 2,,3
.L255:
	ldr	x10, [x12, x3]
	add	x3, x3, 8
	ldr	x16, [x13, x3]
	cmp	x10, x16
	bne	.L870
.L254:
	add	w10, w3, 8
	mov	w11, w3
	cmp	w17, w10
	bcs	.L255
	and	x10, x3, 4294967295
	cmp	w17, w3
	bhi	.L258
	b	.L871
	.p2align 2,,3
.L260:
	add	x10, x10, 1
	cmp	w17, w10
	bls	.L872
.L258:
	ldrb	w11, [x12, x10]
	mov	w13, w10
	ldrb	w3, [x27, x10]
	cmp	w11, w3
	beq	.L260
	add	x3, x27, x10
	sub	w13, w10, #1
	mov	w11, w10
.L259:
	sub	w16, w27, w12
	uxtw	x10, w11
	b	.L236
.L864:
	eor	x1, x1, x11
	b	.L110
.L867:
	eor	x1, x1, x16
	b	.L186
.L239:
	eor	x3, x3, x13
	mov	w18, 4
	b	.L241
.L513:
	mov	x12, 4
.L146:
	sub	x13, x3, #8
	b	.L151
.L152:
	ldr	x1, [x0, x12]
	add	x12, x12, 8
	ldr	x27, [x13, x12]
	cmp	x1, x27
	bne	.L873
.L151:
	add	w1, w12, 8
	mov	w11, w12
	cmp	w7, w1
	bcs	.L152
	and	x27, x12, 4294967295
	cmp	w7, w12
	bhi	.L155
	b	.L874
	.p2align 2,,3
.L156:
	add	x27, x27, 1
	cmp	w7, w27
	bls	.L875
.L155:
	ldrb	w12, [x0, x27]
	mov	w11, w27
	ldrb	w1, [x3, x27]
	cmp	w12, w1
	beq	.L156
	add	x27, x3, x27
	uxtw	x7, w11
	b	.L154
.L863:
	add	x10, x27, w14, uxtw
	add	w11, w3, 1
	b	.L327
.L351:
	.cfi_restore 25
	.cfi_restore 26
	ldr	w0, [x21, 3444]
	ldrb	w1, [x21, 3956]
	lsl	x0, x0, x19
	orr	x3, x0, x3
	ldr	x0, [sp, 96]
	str	x3, [x0, w23, uxtw]
	b	.L487
.L495:
	.cfi_offset 25, -96
	.cfi_offset 26, -88
	mov	x4, 4
.L68:
	sub	x12, x3, #8
	b	.L73
.L74:
	ldr	x1, [x18, x4]
	add	x4, x4, 8
	ldr	x11, [x12, x4]
	cmp	x1, x11
	bne	.L876
.L73:
	add	w1, w4, 8
	mov	w10, w4
	cmp	w8, w1
	bcs	.L74
	and	x27, x4, 4294967295
	cmp	w8, w4
	bhi	.L77
	b	.L877
	.p2align 2,,3
.L78:
	add	x27, x27, 1
	cmp	w8, w27
	bls	.L878
.L77:
	ldrb	w4, [x18, x27]
	mov	w10, w27
	ldrb	w1, [x3, x27]
	cmp	w4, w1
	beq	.L78
	add	x27, x3, x27
	uxtw	x4, w10
	b	.L76
.L72:
	ldr	x4, [x3, 28]
	ldr	x1, [x18, 28]
	cmp	x1, x4
	beq	.L496
	eor	x1, x1, x4
	mov	w10, 28
	b	.L71
.L378:
	ldr	x17, [x11, 20]
	ldr	x2, [x27, 20]
	cmp	x17, x2
	beq	.L380
	eor	x17, x17, x2
	mov	w2, 20
	b	.L379
.L870:
	eor	x3, x10, x16
	b	.L252
.L562:
	mov	x14, 4
.L445:
	sub	x25, x27, #8
	b	.L450
.L451:
	ldr	x3, [x4, x14]
	add	x14, x14, 8
	ldr	x24, [x25, x14]
	cmp	x3, x24
	bne	.L879
.L450:
	add	w3, w14, 8
	mov	w17, w14
	cmp	w15, w3
	bcs	.L451
	cmp	w15, w14
	bls	.L452
	and	x14, x14, 4294967295
.L453:
	ldrb	w24, [x4, x14]
	mov	w17, w14
	ldrb	w3, [x27, x14]
	add	x14, x14, 1
	cmp	w24, w3
	bne	.L452
	cmp	w15, w14
	bhi	.L453
	add	w17, w17, 1
	b	.L452
.L449:
	ldr	x3, [x4, 28]
	ldr	x14, [x27, 28]
	cmp	x3, x14
	beq	.L563
	eor	x3, x3, x14
	mov	w17, 28
	b	.L448
.L308:
	ldr	x14, [x13, 20]
	ldr	x3, [x27, 20]
	cmp	x14, x3
	beq	.L310
	eor	x14, x14, x3
	mov	w17, 20
	b	.L309
.L860:
	add	x4, x27, w2, uxtw
	add	w12, w15, 1
	b	.L397
.L150:
	ldr	x1, [x0, 28]
	ldr	x11, [x3, 28]
	cmp	x1, x11
	beq	.L514
	eor	x1, x1, x11
	mov	w11, 28
	b	.L149
.L505:
	mov	x4, 36
	b	.L107
.L523:
	mov	x12, 36
	b	.L183
.L849:
	cmp	x1, 4
	bne	.L214
	mov	x1, x27
	add	x8, x27, 4
	mov	x11, x2
.L215:
	ldrb	w3, [x1]
	add	x1, x1, 4
	ldrb	w0, [x1, -3]
	add	x2, x5, x3
	ldrb	w12, [x1, -2]
	add	x3, x21, x3, lsl 2
	add	x15, x5, x0
	add	x4, x3, 65536
	add	x0, x21, x0, lsl 2
	ldrb	w7, [x2, 1280]
	add	x10, x0, 65536
	ldr	w13, [x3, 2420]
	add	x17, x21, x12, lsl 2
	ldr	w2, [x4, 2496]
	add	x3, x5, x12
	add	x16, x17, 65536
	ldrb	w6, [x1, -1]
	add	w2, w2, 1
	str	w2, [x4, 2496]
	add	w18, w7, w19
	lsl	x13, x13, x19
	ldr	w12, [x10, 2496]
	add	x14, x5, x6
	ldrb	w2, [x15, 1280]
	add	x6, x21, x6, lsl 2
	ldr	w4, [x0, 2420]
	add	w0, w12, 1
	str	w0, [x10, 2496]
	sub	w10, w7, #1
	add	w15, w18, w2
	add	x12, x6, 65536
	ldr	w7, [x16, 2496]
	lsl	x4, x4, x18
	ldrb	w0, [x3, 1280]
	orr	x4, x4, x13
	add	w3, w7, 1
	ldr	w13, [x17, 2420]
	str	w3, [x16, 2496]
	sub	w7, w2, #1
	add	w3, w15, w0
	sub	w2, w0, #1
	ldr	w0, [x6, 2420]
	orr	w7, w10, w7
	ldrb	w6, [x14, 1280]
	lsl	x13, x13, x15
	ldr	w10, [x12, 2496]
	lsl	x0, x0, x3
	orr	x0, x0, x13
	add	w3, w3, w6
	orr	x0, x0, x4
	sub	w6, w6, #1
	orr	x0, x0, x11
	orr	w2, w2, w6
	add	w4, w10, 1
	and	w11, w3, -8
	str	w4, [x12, 2496]
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
	b	.L286
.L214:
	ldrb	w0, [x27], 1
	add	x1, x5, x0
	add	x0, x21, x0, lsl 2
	add	x6, x0, 65536
	ldrb	w1, [x1, 1280]
	ldr	w0, [x0, 2420]
	ldr	w4, [x6, 2496]
	add	w3, w1, w19
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
	b	.L286
.L532:
	mov	x3, 36
	b	.L249
.L873:
	eor	x1, x1, x27
	b	.L149
.L869:
	add	x27, x2, w27, uxtw
	add	w7, w11, 1
	b	.L191
.L866:
	add	x27, x2, w27, uxtw
	add	w4, w9, 1
	b	.L115
.L879:
	eor	x3, x3, x24
	b	.L448
.L876:
	eor	x1, x1, x11
	b	.L71
.L563:
	mov	x14, 36
	b	.L445
.L240:
	ldr	x3, [x12, 20]
	ldr	x13, [x27, 20]
	cmp	x3, x13
	beq	.L242
	eor	x3, x3, x13
	mov	w18, 20
	b	.L241
.L496:
	mov	x4, 36
	b	.L68
.L872:
	add	x3, x27, w10, uxtw
	add	w11, w13, 1
	b	.L259
.L380:
	ldr	x17, [x11, 28]
	ldr	x2, [x27, 28]
	cmp	x17, x2
	beq	.L552
	eor	x17, x17, x2
	mov	w2, 28
	b	.L379
.L540:
	mov	x3, 4
.L306:
	sub	x25, x27, #8
	b	.L311
.L312:
	ldr	x14, [x13, x3]
	add	x3, x3, 8
	ldr	x23, [x25, x3]
	cmp	x14, x23
	bne	.L880
.L311:
	add	w14, w3, 8
	mov	w17, w3
	cmp	w15, w14
	bcs	.L312
	cmp	w15, w3
	bls	.L313
	and	x3, x3, 4294967295
.L314:
	ldrb	w23, [x13, x3]
	mov	w17, w3
	ldrb	w14, [x27, x3]
	add	x3, x3, 1
	cmp	w23, w14
	bne	.L313
	cmp	w15, w3
	bhi	.L314
	add	w17, w17, 1
	b	.L313
.L310:
	ldr	x14, [x13, 28]
	ldr	x3, [x27, 28]
	cmp	x14, x3
	beq	.L541
	eor	x14, x14, x3
	mov	w17, 28
	b	.L309
.L514:
	mov	x12, 36
	b	.L146
.L551:
	mov	x15, 4
.L376:
	sub	x26, x27, #8
	b	.L381
.L382:
	ldr	x17, [x11, x15]
	add	x15, x15, 8
	ldr	x23, [x26, x15]
	cmp	x17, x23
	bne	.L881
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
.L881:
	eor	x17, x17, x23
	b	.L379
.L552:
	mov	x15, 36
	b	.L376
.L541:
	mov	x3, 36
	b	.L306
.L875:
	add	x27, x3, w27, uxtw
	add	w7, w11, 1
	b	.L154
.L880:
	eor	x14, x14, x23
	b	.L309
.L878:
	add	x27, x3, w27, uxtw
	add	w4, w10, 1
	b	.L76
.L242:
	ldr	x3, [x12, 28]
	ldr	x13, [x27, 28]
	cmp	x3, x13
	beq	.L530
	eor	x3, x3, x13
	mov	w18, 28
	b	.L241
.L755:
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
	b	.L356
.L855:
	add	x3, x3, x27
	sub	w14, w11, #1
	b	.L466
.L529:
	mov	x13, 4
.L238:
	sub	x24, x27, #8
	b	.L243
.L244:
	ldr	x3, [x12, x13]
	add	x13, x13, 8
	ldr	x16, [x24, x13]
	cmp	x3, x16
	bne	.L882
.L243:
	add	w3, w13, 8
	mov	w18, w13
	cmp	w17, w3
	bcs	.L244
	cmp	w17, w13
	bls	.L245
	and	x13, x13, 4294967295
.L246:
	ldrb	w16, [x12, x13]
	mov	w18, w13
	ldrb	w3, [x27, x13]
	add	x13, x13, 1
	cmp	w16, w3
	bne	.L245
	cmp	w17, w13
	bhi	.L246
	add	w18, w18, 1
	b	.L245
.L882:
	eor	x3, x3, x16
	b	.L241
.L859:
	add	x4, x4, x27
	sub	w15, w12, #1
	b	.L397
.L862:
	add	x10, x10, x27
	sub	w3, w11, #1
	b	.L327
.L530:
	mov	x13, 36
	b	.L238
.L877:
	add	x27, x4, x3
	uxtw	x4, w4
	b	.L76
.L536:
	.cfi_restore 25
	.cfi_restore 26
	mov	x1, 131072
	b	.L278
.L509:
	.cfi_offset 25, -96
	.cfi_offset 26, -88
	mov	x0, x24
	b	.L133
.L871:
	add	x3, x3, x27
	sub	w13, w11, #1
	b	.L259
.L868:
	add	x27, x12, x2
	uxtw	x7, w12
	b	.L191
.L558:
	.cfi_restore 25
	.cfi_restore 26
	mov	x2, 131072
	b	.L417
.L865:
	.cfi_offset 25, -96
	.cfi_offset 26, -88
	add	x27, x4, x2
	uxtw	x4, w4
	b	.L115
.L500:
	mov	x1, x24
	mov	x2, 131072
	b	.L94
.L491:
	mov	x1, x24
	b	.L55
.L874:
	add	x27, x12, x3
	uxtw	x7, w12
	b	.L154
.L518:
	mov	x0, x24
	mov	x1, 131072
	b	.L170
	.cfi_endproc
.LFE4055:
	.size	deflate_direct, .-deflate_direct
