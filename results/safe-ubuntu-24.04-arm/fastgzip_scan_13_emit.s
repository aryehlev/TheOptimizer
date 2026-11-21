000000000003b950 <fastgzip::enc::scan::<13, true, false>>:
   3b950:	sub	sp, sp, #0x70
   3b954:	stp	x29, x30, [sp, #16]
   3b958:	stp	x28, x27, [sp, #32]
   3b95c:	stp	x26, x25, [sp, #48]
   3b960:	stp	x24, x23, [sp, #64]
   3b964:	stp	x22, x21, [sp, #80]
   3b968:	stp	x20, x19, [sp, #96]
   3b96c:	add	x29, sp, #0x10
   3b970:	ldr	x30, [x29, #112]
   3b974:	ldr	x19, [x29, #96]
   3b978:	mov	x24, x6
   3b97c:	mov	x23, x5
   3b980:	mov	x22, x4
   3b984:	mov	x25, x1
   3b988:	mov	x20, x0
   3b98c:	tbnz	x30, #32, 3b9b0 <fastgzip::enc::scan::<13, true, false>+0x60>
   3b990:	mov	x8, #0xffffffffffffffff    	// #-1
   3b994:	ldrb	w9, [x19]
   3b998:	mov	x21, xzr
   3b99c:	lsl	x8, x8, x30
   3b9a0:	mov	x28, x30
   3b9a4:	bic	x27, x9, x8
   3b9a8:	tbz	w7, #0, 3ba30 <fastgzip::enc::scan::<13, true, false>+0xe0>
   3b9ac:	b	3ba74 <fastgzip::enc::scan::<13, true, false>+0x124>
   3b9b0:	ldr	w27, [x20, #2192]
   3b9b4:	add	x26, x20, #0x894
   3b9b8:	lsr	x21, x27, #3
   3b9bc:	cmp	w27, #0x3ff
   3b9c0:	b.hi	3b9e8 <fastgzip::enc::scan::<13, true, false>+0x98>  // b.pmore
   3b9c4:	ldp	q0, q1, [x26, #64]
   3b9c8:	stp	q0, q1, [x19, #64]
   3b9cc:	ldp	q0, q2, [x26, #96]
   3b9d0:	stp	q0, q2, [x19, #96]
   3b9d4:	ldp	q1, q0, [x26]
   3b9d8:	stp	q1, q0, [x19]
   3b9dc:	ldp	q2, q0, [x26, #32]
   3b9e0:	stp	q2, q0, [x19, #32]
   3b9e4:	b	3ba14 <fastgzip::enc::scan::<13, true, false>+0xc4>
   3b9e8:	add	x1, x20, #0x894
   3b9ec:	mov	x0, x19
   3b9f0:	mov	x2, x21
   3b9f4:	stur	w7, [x29, #-4]
   3b9f8:	mov	x28, x30
   3b9fc:	bl	5f10 <memcpy@plt>
   3ba00:	lsr	w8, w27, #9
   3ba04:	ldur	w7, [x29, #-4]
   3ba08:	mov	x30, x28
   3ba0c:	cmp	w8, #0x8
   3ba10:	b.hi	3bfd4 <fastgzip::enc::scan::<13, true, false>+0x684>  // b.pmore
   3ba14:	and	x28, x27, #0x7
   3ba18:	mov	x8, #0xffffffffffffffff    	// #-1
   3ba1c:	ldrb	w9, [x26, x21]
   3ba20:	lsl	x8, x8, x28
   3ba24:	bic	x27, x9, x8
   3ba28:	tbz	x30, #40, 3ba54 <fastgzip::enc::scan::<13, true, false>+0x104>
   3ba2c:	tbnz	w7, #0, 3ba74 <fastgzip::enc::scan::<13, true, false>+0x124>
   3ba30:	subs	x8, x23, #0x9
   3ba34:	csel	x8, xzr, x8, cc	// cc = lo, ul, last
   3ba38:	subs	x9, x23, #0xc
   3ba3c:	csel	x9, xzr, x9, cc	// cc = lo, ul, last
   3ba40:	cbz	x24, 3baa0 <fastgzip::enc::scan::<13, true, false>+0x150>
   3ba44:	cmp	x24, x8
   3ba48:	mov	w17, w28
   3ba4c:	b.cs	3bab0 <fastgzip::enc::scan::<13, true, false>+0x160>  // b.hs, b.nlast
   3ba50:	b	3bc3c <fastgzip::enc::scan::<13, true, false>+0x2ec>
   3ba54:	cbz	x21, 3ba6c <fastgzip::enc::scan::<13, true, false>+0x11c>
   3ba58:	ldrb	w8, [x19]
   3ba5c:	and	w8, w8, #0xfe
   3ba60:	strb	w8, [x19]
   3ba64:	tbz	w7, #0, 3ba30 <fastgzip::enc::scan::<13, true, false>+0xe0>
   3ba68:	b	3ba74 <fastgzip::enc::scan::<13, true, false>+0x124>
   3ba6c:	and	x27, x27, #0x7e
   3ba70:	tbz	w7, #0, 3ba30 <fastgzip::enc::scan::<13, true, false>+0xe0>
   3ba74:	mov	x0, x25
   3ba78:	mov	w1, wzr
   3ba7c:	mov	w2, #0x4000                	// #16384
   3ba80:	mov	x26, x30
   3ba84:	bl	60d0 <memset@plt>
   3ba88:	mov	x30, x26
   3ba8c:	subs	x8, x23, #0x9
   3ba90:	csel	x8, xzr, x8, cc	// cc = lo, ul, last
   3ba94:	subs	x9, x23, #0xc
   3ba98:	csel	x9, xzr, x9, cc	// cc = lo, ul, last
   3ba9c:	cbnz	x24, 3ba44 <fastgzip::enc::scan::<13, true, false>+0xf4>
   3baa0:	cmp	x8, #0x2
   3baa4:	b.cs	3bc08 <fastgzip::enc::scan::<13, true, false>+0x2b8>  // b.hs, b.nlast
   3baa8:	mov	x24, xzr
   3baac:	mov	w17, w28
   3bab0:	add	x8, x24, #0x4
   3bab4:	cmp	x8, x23
   3bab8:	b.ls	3bac0 <fastgzip::enc::scan::<13, true, false>+0x170>  // b.plast
   3babc:	b	3bb50 <fastgzip::enc::scan::<13, true, false>+0x200>
   3bac0:	add	x8, x22, #0x1
   3bac4:	add	x9, x8, x24
   3bac8:	ldurb	w10, [x9, #-1]
   3bacc:	ldrb	w11, [x9]
   3bad0:	ldrb	w12, [x9, #1]
   3bad4:	ldrb	w9, [x9, #2]
   3bad8:	ldr	w10, [x20, x10, lsl #2]
   3badc:	ldr	w11, [x20, x11, lsl #2]
   3bae0:	ldr	w12, [x20, x12, lsl #2]
   3bae4:	ldr	w9, [x20, x9, lsl #2]
   3bae8:	add	w13, w17, w10, lsr #16
   3baec:	and	x10, x10, #0xffff
   3baf0:	lsl	x10, x10, x17
   3baf4:	and	x15, x9, #0xffff
   3baf8:	add	w14, w13, w11, lsr #16
   3bafc:	and	x11, x11, #0xffff
   3bb00:	lsl	x11, x11, x13
   3bb04:	and	x13, x12, #0xffff
   3bb08:	orr	x10, x10, x27
   3bb0c:	add	w12, w14, w12, lsr #16
   3bb10:	lsl	x13, x13, x14
   3bb14:	orr	x10, x10, x11
   3bb18:	lsl	x11, x15, x12
   3bb1c:	add	w9, w12, w9, lsr #16
   3bb20:	orr	x10, x10, x13
   3bb24:	add	x13, x24, #0x8
   3bb28:	add	x24, x24, #0x4
   3bb2c:	orr	x10, x10, x11
   3bb30:	ubfx	w11, w9, #3, #3
   3bb34:	and	w12, w9, #0x38
   3bb38:	lsr	x27, x10, x12
   3bb3c:	str	x10, [x19, x21]
   3bb40:	cmp	x13, x23
   3bb44:	add	x21, x21, x11
   3bb48:	and	w17, w9, #0xffff8007
   3bb4c:	b.ls	3bac4 <fastgzip::enc::scan::<13, true, false>+0x174>  // b.plast
   3bb50:	subs	x8, x23, x24
   3bb54:	b.ls	3bbf0 <fastgzip::enc::scan::<13, true, false>+0x2a0>  // b.plast
   3bb58:	add	x9, x22, x24
   3bb5c:	ldrb	w10, [x9], #1
   3bb60:	subs	x8, x8, #0x1
   3bb64:	ldr	w10, [x20, x10, lsl #2]
   3bb68:	and	x11, x10, #0xffff
   3bb6c:	lsl	x11, x11, x17
   3bb70:	add	w17, w17, w10, lsr #16
   3bb74:	orr	x27, x11, x27
   3bb78:	b.ne	3bb5c <fastgzip::enc::scan::<13, true, false>+0x20c>  // b.any
   3bb7c:	ubfx	w8, w17, #3, #3
   3bb80:	and	w9, w17, #0xffff8007
   3bb84:	str	x27, [x19, x21]
   3bb88:	add	x8, x21, x8
   3bb8c:	tbz	x30, #48, 3bbc0 <fastgzip::enc::scan::<13, true, false>+0x270>
   3bb90:	ldr	w10, [x20, #2060]
   3bb94:	and	w11, w17, #0x38
   3bb98:	and	w13, w17, #0x7
   3bb9c:	add	w9, w9, w10, lsr #16
   3bba0:	and	x12, x10, #0xffff
   3bba4:	lsr	x10, x27, x11
   3bba8:	lsl	x11, x12, x13
   3bbac:	ubfx	w12, w9, #3, #3
   3bbb0:	and	w9, w9, #0xffff8007
   3bbb4:	orr	x10, x11, x10
   3bbb8:	str	x10, [x19, x8]
   3bbbc:	add	x8, x8, x12
   3bbc0:	lsl	x8, x8, #3
   3bbc4:	cmp	w9, #0x7
   3bbc8:	add	x8, x8, w9, uxtw
   3bbcc:	csel	x0, xzr, x8, hi	// hi = pmore
   3bbd0:	ldp	x20, x19, [sp, #96]
   3bbd4:	ldp	x22, x21, [sp, #80]
   3bbd8:	ldp	x24, x23, [sp, #64]
   3bbdc:	ldp	x26, x25, [sp, #48]
   3bbe0:	ldp	x28, x27, [sp, #32]
   3bbe4:	ldp	x29, x30, [sp, #16]
   3bbe8:	add	sp, sp, #0x70
   3bbec:	ret
   3bbf0:	ubfx	w8, w17, #3, #3
   3bbf4:	and	w9, w17, #0xffff8007
   3bbf8:	str	x27, [x19, x21]
   3bbfc:	add	x8, x21, x8
   3bc00:	tbnz	x30, #48, 3bb90 <fastgzip::enc::scan::<13, true, false>+0x240>
   3bc04:	b	3bbc0 <fastgzip::enc::scan::<13, true, false>+0x270>
   3bc08:	ldrb	w10, [x22]
   3bc0c:	mov	w24, #0x1                   	// #1
   3bc10:	ldr	w10, [x20, x10, lsl #2]
   3bc14:	and	x11, x10, #0xffff
   3bc18:	add	w10, w28, w10, lsr #16
   3bc1c:	lsl	x11, x11, x28
   3bc20:	ubfx	w12, w10, #3, #3
   3bc24:	and	w13, w10, #0x38
   3bc28:	and	w28, w10, #0xffff8007
   3bc2c:	orr	x11, x11, x27
   3bc30:	str	x11, [x19, x21]
   3bc34:	lsr	x27, x11, x13
   3bc38:	add	x21, x21, x12
   3bc3c:	mov	x10, #0x87000000            	// #2264924160
   3bc40:	ldr	x16, [x22, x24]
   3bc44:	add	x11, x20, #0x400
   3bc48:	movk	x10, #0xebca, lsl #32
   3bc4c:	add	x12, x20, #0x810
   3bc50:	mov	w13, #0x102                 	// #258
   3bc54:	movk	x10, #0xb185, lsl #48
   3bc58:	mov	w14, #0x1e                  	// #30
   3bc5c:	mov	w15, #0xffffffff            	// #-1
   3bc60:	mov	w17, w28
   3bc64:	mul	x16, x16, x10
   3bc68:	cmp	x24, x9
   3bc6c:	lsr	x16, x16, #51
   3bc70:	b.cs	3bd9c <fastgzip::enc::scan::<13, true, false>+0x44c>  // b.hs, b.nlast
   3bc74:	ldr	x18, [x22, x24]
   3bc78:	lsr	x0, x18, #8
   3bc7c:	mul	x1, x0, x10
   3bc80:	ldrh	w0, [x25, x16, lsl #1]
   3bc84:	strh	w24, [x25, x16, lsl #1]
   3bc88:	ldr	x2, [x22, x0]
   3bc8c:	lsr	x16, x1, #51
   3bc90:	eor	x1, x2, x18
   3bc94:	cbz	w1, 3be14 <fastgzip::enc::scan::<13, true, false>+0x4c4>
   3bc98:	add	x2, x22, x24
   3bc9c:	and	x0, x18, #0xff
   3bca0:	add	w6, w24, #0x1
   3bca4:	ldur	x18, [x2, #1]
   3bca8:	ldr	w3, [x20, x0, lsl #2]
   3bcac:	ldrh	w0, [x25, x16, lsl #1]
   3bcb0:	strh	w6, [x25, x16, lsl #1]
   3bcb4:	lsr	x1, x18, #8
   3bcb8:	and	x4, x3, #0xffff
   3bcbc:	ldr	x5, [x22, x0]
   3bcc0:	lsl	x4, x4, x17
   3bcc4:	add	w17, w17, w3, lsr #16
   3bcc8:	mul	x1, x1, x10
   3bccc:	orr	x27, x4, x27
   3bcd0:	lsr	x16, x1, #51
   3bcd4:	eor	x1, x5, x18
   3bcd8:	cbz	w1, 3bf28 <fastgzip::enc::scan::<13, true, false>+0x5d8>
   3bcdc:	and	x0, x18, #0xff
   3bce0:	ldur	x18, [x2, #2]
   3bce4:	ldr	w2, [x20, x0, lsl #2]
   3bce8:	ldrh	w0, [x25, x16, lsl #1]
   3bcec:	lsr	x1, x18, #8
   3bcf0:	and	x3, x2, #0xffff
   3bcf4:	ldr	x4, [x22, x0]
   3bcf8:	mul	x1, x1, x10
   3bcfc:	lsl	x3, x3, x17
   3bd00:	add	w17, w17, w2, lsr #16
   3bd04:	add	w2, w24, #0x2
   3bd08:	strh	w2, [x25, x16, lsl #1]
   3bd0c:	orr	x27, x3, x27
   3bd10:	lsr	x16, x1, #51
   3bd14:	eor	x1, x4, x18
   3bd18:	cbz	w1, 3bf34 <fastgzip::enc::scan::<13, true, false>+0x5e4>
   3bd1c:	add	x0, x22, x24
   3bd20:	and	x1, x18, #0xff
   3bd24:	add	w5, w24, #0x3
   3bd28:	ldur	x18, [x0, #3]
   3bd2c:	ldr	w1, [x20, x1, lsl #2]
   3bd30:	lsr	x0, x18, #8
   3bd34:	and	x3, x1, #0xffff
   3bd38:	lsl	x3, x3, x17
   3bd3c:	add	w17, w17, w1, lsr #16
   3bd40:	mul	x2, x0, x10
   3bd44:	ldrh	w0, [x25, x16, lsl #1]
   3bd48:	strh	w5, [x25, x16, lsl #1]
   3bd4c:	orr	x27, x3, x27
   3bd50:	ldr	x4, [x22, x0]
   3bd54:	eor	x1, x4, x18
   3bd58:	lsr	x16, x2, #51
   3bd5c:	cbz	w1, 3bf40 <fastgzip::enc::scan::<13, true, false>+0x5f0>
   3bd60:	and	x18, x18, #0xff
   3bd64:	add	x24, x24, #0x4
   3bd68:	ldr	w18, [x20, x18, lsl #2]
   3bd6c:	cmp	x24, x9
   3bd70:	and	x0, x18, #0xffff
   3bd74:	lsl	x0, x0, x17
   3bd78:	add	w17, w17, w18, lsr #16
   3bd7c:	orr	x18, x0, x27
   3bd80:	ubfx	w0, w17, #3, #3
   3bd84:	and	w1, w17, #0x38
   3bd88:	lsr	x27, x18, x1
   3bd8c:	str	x18, [x19, x21]
   3bd90:	and	w17, w17, #0xffff8007
   3bd94:	add	x21, x21, x0
   3bd98:	b.cc	3bc74 <fastgzip::enc::scan::<13, true, false>+0x324>  // b.lo, b.ul, b.last
   3bd9c:	cmp	x24, x8
   3bda0:	mov	w2, w17
   3bda4:	b.cs	3bab0 <fastgzip::enc::scan::<13, true, false>+0x160>  // b.hs, b.nlast
   3bda8:	ldr	x18, [x22, x24]
   3bdac:	ldrh	w0, [x25, x16, lsl #1]
   3bdb0:	strh	w24, [x25, x16, lsl #1]
   3bdb4:	lsr	x17, x18, #8
   3bdb8:	ldr	x1, [x22, x0]
   3bdbc:	mul	x17, x17, x10
   3bdc0:	eor	x1, x1, x18
   3bdc4:	lsr	x16, x17, #51
   3bdc8:	cbz	w1, 3be10 <fastgzip::enc::scan::<13, true, false>+0x4c0>
   3bdcc:	and	x17, x18, #0xff
   3bdd0:	add	x24, x24, #0x1
   3bdd4:	ldr	w17, [x20, x17, lsl #2]
   3bdd8:	cmp	x24, x8
   3bddc:	and	x18, x17, #0xffff
   3bde0:	add	w17, w2, w17, lsr #16
   3bde4:	lsl	x18, x18, x2
   3bde8:	ubfx	w0, w17, #3, #3
   3bdec:	and	w1, w17, #0x38
   3bdf0:	and	w17, w17, #0xffff8007
   3bdf4:	orr	x18, x18, x27
   3bdf8:	str	x18, [x19, x21]
   3bdfc:	lsr	x27, x18, x1
   3be00:	add	x21, x21, x0
   3be04:	mov	w2, w17
   3be08:	b.cc	3bda8 <fastgzip::enc::scan::<13, true, false>+0x458>  // b.lo, b.ul, b.last
   3be0c:	b	3bab0 <fastgzip::enc::scan::<13, true, false>+0x160>
   3be10:	mov	w17, w2
   3be14:	cbz	x1, 3bf48 <fastgzip::enc::scan::<13, true, false>+0x5f8>
   3be18:	rbit	x1, x1
   3be1c:	clz	x1, x1
   3be20:	lsr	x1, x1, #3
   3be24:	mvn	w0, w0
   3be28:	add	w0, w0, w24
   3be2c:	cmp	w0, #0x2
   3be30:	clz	w2, w0
   3be34:	mov	w3, w0
   3be38:	b.cc	3be50 <fastgzip::enc::scan::<13, true, false>+0x500>  // b.lo, b.ul, b.last
   3be3c:	sub	w3, w14, w2
   3be40:	lsr	w3, w0, w3
   3be44:	and	w3, w3, #0x1
   3be48:	sub	w3, w3, w2, lsl #1
   3be4c:	add	w3, w3, #0x3e
   3be50:	ldr	w4, [x11, x1, lsl #2]
   3be54:	subs	w2, w14, w2
   3be58:	ldr	w3, [x12, w3, uxtw #2]
   3be5c:	csel	w2, wzr, w2, cc	// cc = lo, ul, last
   3be60:	lsr	x18, x18, #16
   3be64:	and	w6, w17, #0x38
   3be68:	ubfx	x5, x4, #19, #5
   3be6c:	lsl	w7, w15, w2
   3be70:	and	x26, x3, #0xffff
   3be74:	and	x4, x4, #0x7ffff
   3be78:	mul	x18, x18, x10
   3be7c:	lsr	x6, x27, x6
   3be80:	add	w3, w5, w3, lsr #16
   3be84:	bic	w0, w0, w7
   3be88:	lsl	x5, x26, x5
   3be8c:	ubfx	w7, w17, #3, #3
   3be90:	str	x27, [x19, x21]
   3be94:	lsl	x0, x0, x3
   3be98:	orr	x4, x5, x4
   3be9c:	and	w5, w17, #0xffff8007
   3bea0:	and	w17, w17, #0x7
   3bea4:	add	w2, w2, w5
   3bea8:	add	w5, w24, #0x2
   3beac:	orr	x0, x4, x0
   3beb0:	add	w4, w24, #0x1
   3beb4:	add	x24, x1, x24
   3beb8:	lsl	x17, x0, x17
   3bebc:	add	w1, w2, w3
   3bec0:	lsr	x18, x18, #50
   3bec4:	and	w2, w1, #0x38
   3bec8:	ubfx	w3, w1, #3, #3
   3becc:	add	x0, x21, x7
   3bed0:	orr	x17, x17, x6
   3bed4:	str	x17, [x19, x0]
   3bed8:	cmp	x24, x8
   3bedc:	lsr	x27, x17, x2
   3bee0:	strh	w4, [x25, x16, lsl #1]
   3bee4:	and	x16, x18, #0x3ffe
   3bee8:	add	x21, x0, x3
   3beec:	and	w17, w1, #0xffff8007
   3bef0:	strh	w5, [x25, x16]
   3bef4:	b.cs	3bab0 <fastgzip::enc::scan::<13, true, false>+0x160>  // b.hs, b.nlast
   3bef8:	sub	x18, x24, #0x1
   3befc:	ldr	x16, [x22, x18]
   3bf00:	mul	x0, x16, x10
   3bf04:	lsr	x16, x16, #8
   3bf08:	lsr	x0, x0, #50
   3bf0c:	and	x0, x0, #0x3ffe
   3bf10:	strh	w18, [x25, x0]
   3bf14:	mul	x16, x16, x10
   3bf18:	cmp	x24, x9
   3bf1c:	lsr	x16, x16, #51
   3bf20:	b.cc	3bc74 <fastgzip::enc::scan::<13, true, false>+0x324>  // b.lo, b.ul, b.last
   3bf24:	b	3bd9c <fastgzip::enc::scan::<13, true, false>+0x44c>
   3bf28:	add	x24, x24, #0x1
   3bf2c:	cbnz	x1, 3be18 <fastgzip::enc::scan::<13, true, false>+0x4c8>
   3bf30:	b	3bf48 <fastgzip::enc::scan::<13, true, false>+0x5f8>
   3bf34:	add	x24, x24, #0x2
   3bf38:	cbnz	x1, 3be18 <fastgzip::enc::scan::<13, true, false>+0x4c8>
   3bf3c:	b	3bf48 <fastgzip::enc::scan::<13, true, false>+0x5f8>
   3bf40:	add	x24, x24, #0x3
   3bf44:	cbnz	x1, 3be18 <fastgzip::enc::scan::<13, true, false>+0x4c8>
   3bf48:	sub	x1, x23, x24
   3bf4c:	add	x3, x22, x24
   3bf50:	add	x4, x22, x0
   3bf54:	cmp	x1, #0x102
   3bf58:	csel	x2, x1, x13, cc	// cc = lo, ul, last
   3bf5c:	cmp	x1, #0x10
   3bf60:	b.cs	3bf6c <fastgzip::enc::scan::<13, true, false>+0x61c>  // b.hs, b.nlast
   3bf64:	mov	w1, #0x8                   	// #8
   3bf68:	b	3bf94 <fastgzip::enc::scan::<13, true, false>+0x644>
   3bf6c:	mov	w5, #0x8                   	// #8
   3bf70:	ldr	x1, [x3, x5]
   3bf74:	ldr	x6, [x4, x5]
   3bf78:	cmp	x1, x6
   3bf7c:	b.ne	3bfc0 <fastgzip::enc::scan::<13, true, false>+0x670>  // b.any
   3bf80:	add	x6, x5, #0x10
   3bf84:	add	x1, x5, #0x8
   3bf88:	cmp	x6, x2
   3bf8c:	mov	x5, x1
   3bf90:	b.ls	3bf70 <fastgzip::enc::scan::<13, true, false>+0x620>  // b.plast
   3bf94:	cmp	x1, x2
   3bf98:	b.cs	3be24 <fastgzip::enc::scan::<13, true, false>+0x4d4>  // b.hs, b.nlast
   3bf9c:	ldrb	w5, [x3, x1]
   3bfa0:	ldrb	w6, [x4, x1]
   3bfa4:	cmp	w5, w6
   3bfa8:	b.ne	3be24 <fastgzip::enc::scan::<13, true, false>+0x4d4>  // b.any
   3bfac:	add	x1, x1, #0x1
   3bfb0:	cmp	x2, x1
   3bfb4:	b.ne	3bf9c <fastgzip::enc::scan::<13, true, false>+0x64c>  // b.any
   3bfb8:	mov	x1, x2
   3bfbc:	b	3be24 <fastgzip::enc::scan::<13, true, false>+0x4d4>
   3bfc0:	eor	x1, x6, x1
   3bfc4:	rbit	x1, x1
   3bfc8:	clz	x1, x1
   3bfcc:	add	x1, x5, x1, lsr #3
   3bfd0:	b	3be24 <fastgzip::enc::scan::<13, true, false>+0x4d4>
   3bfd4:	adrp	x2, bd000 <anon.7a263ad2a3e00f1d3c23c4bfb0e9541b.29.llvm.2438094699631020562+0x40>
   3bfd8:	add	x2, x2, #0x638
   3bfdc:	mov	x0, x21
   3bfe0:	mov	w1, #0x240                 	// #576
   3bfe4:	bl	dbc4 <core::panicking::panic_bounds_check>
