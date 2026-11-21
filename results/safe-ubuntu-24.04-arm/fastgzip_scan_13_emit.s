000000000003b804 <fastgzip::enc::scan::<13, true, false>>:
   3b804:	sub	sp, sp, #0x70
   3b808:	stp	x29, x30, [sp, #16]
   3b80c:	stp	x28, x27, [sp, #32]
   3b810:	stp	x26, x25, [sp, #48]
   3b814:	stp	x24, x23, [sp, #64]
   3b818:	stp	x22, x21, [sp, #80]
   3b81c:	stp	x20, x19, [sp, #96]
   3b820:	add	x29, sp, #0x10
   3b824:	ldr	x30, [x29, #112]
   3b828:	ldr	x19, [x29, #96]
   3b82c:	mov	x24, x6
   3b830:	mov	x23, x5
   3b834:	mov	x22, x4
   3b838:	mov	x25, x1
   3b83c:	mov	x20, x0
   3b840:	tbnz	x30, #32, 3b864 <fastgzip::enc::scan::<13, true, false>+0x60>
   3b844:	mov	x8, #0xffffffffffffffff    	// #-1
   3b848:	ldrb	w9, [x19]
   3b84c:	mov	x21, xzr
   3b850:	lsl	x8, x8, x30
   3b854:	mov	x28, x30
   3b858:	bic	x27, x9, x8
   3b85c:	tbz	w7, #0, 3b8e4 <fastgzip::enc::scan::<13, true, false>+0xe0>
   3b860:	b	3b928 <fastgzip::enc::scan::<13, true, false>+0x124>
   3b864:	ldr	w27, [x20, #2192]
   3b868:	add	x26, x20, #0x894
   3b86c:	lsr	x21, x27, #3
   3b870:	cmp	w27, #0x3ff
   3b874:	b.hi	3b89c <fastgzip::enc::scan::<13, true, false>+0x98>  // b.pmore
   3b878:	ldp	q0, q1, [x26, #64]
   3b87c:	stp	q0, q1, [x19, #64]
   3b880:	ldp	q0, q2, [x26, #96]
   3b884:	stp	q0, q2, [x19, #96]
   3b888:	ldp	q1, q0, [x26]
   3b88c:	stp	q1, q0, [x19]
   3b890:	ldp	q2, q0, [x26, #32]
   3b894:	stp	q2, q0, [x19, #32]
   3b898:	b	3b8c8 <fastgzip::enc::scan::<13, true, false>+0xc4>
   3b89c:	add	x1, x20, #0x894
   3b8a0:	mov	x0, x19
   3b8a4:	mov	x2, x21
   3b8a8:	stur	w7, [x29, #-4]
   3b8ac:	mov	x28, x30
   3b8b0:	bl	5f20 <memcpy@plt>
   3b8b4:	lsr	w8, w27, #9
   3b8b8:	ldur	w7, [x29, #-4]
   3b8bc:	mov	x30, x28
   3b8c0:	cmp	w8, #0x8
   3b8c4:	b.hi	3be88 <fastgzip::enc::scan::<13, true, false>+0x684>  // b.pmore
   3b8c8:	and	x28, x27, #0x7
   3b8cc:	mov	x8, #0xffffffffffffffff    	// #-1
   3b8d0:	ldrb	w9, [x26, x21]
   3b8d4:	lsl	x8, x8, x28
   3b8d8:	bic	x27, x9, x8
   3b8dc:	tbz	x30, #40, 3b908 <fastgzip::enc::scan::<13, true, false>+0x104>
   3b8e0:	tbnz	w7, #0, 3b928 <fastgzip::enc::scan::<13, true, false>+0x124>
   3b8e4:	subs	x8, x23, #0x9
   3b8e8:	csel	x8, xzr, x8, cc	// cc = lo, ul, last
   3b8ec:	subs	x9, x23, #0xc
   3b8f0:	csel	x9, xzr, x9, cc	// cc = lo, ul, last
   3b8f4:	cbz	x24, 3b954 <fastgzip::enc::scan::<13, true, false>+0x150>
   3b8f8:	cmp	x24, x8
   3b8fc:	mov	w17, w28
   3b900:	b.cs	3b964 <fastgzip::enc::scan::<13, true, false>+0x160>  // b.hs, b.nlast
   3b904:	b	3baf0 <fastgzip::enc::scan::<13, true, false>+0x2ec>
   3b908:	cbz	x21, 3b920 <fastgzip::enc::scan::<13, true, false>+0x11c>
   3b90c:	ldrb	w8, [x19]
   3b910:	and	w8, w8, #0xfe
   3b914:	strb	w8, [x19]
   3b918:	tbz	w7, #0, 3b8e4 <fastgzip::enc::scan::<13, true, false>+0xe0>
   3b91c:	b	3b928 <fastgzip::enc::scan::<13, true, false>+0x124>
   3b920:	and	x27, x27, #0x7e
   3b924:	tbz	w7, #0, 3b8e4 <fastgzip::enc::scan::<13, true, false>+0xe0>
   3b928:	mov	x0, x25
   3b92c:	mov	w1, wzr
   3b930:	mov	w2, #0x4000                	// #16384
   3b934:	mov	x26, x30
   3b938:	bl	60e0 <memset@plt>
   3b93c:	mov	x30, x26
   3b940:	subs	x8, x23, #0x9
   3b944:	csel	x8, xzr, x8, cc	// cc = lo, ul, last
   3b948:	subs	x9, x23, #0xc
   3b94c:	csel	x9, xzr, x9, cc	// cc = lo, ul, last
   3b950:	cbnz	x24, 3b8f8 <fastgzip::enc::scan::<13, true, false>+0xf4>
   3b954:	cmp	x8, #0x2
   3b958:	b.cs	3babc <fastgzip::enc::scan::<13, true, false>+0x2b8>  // b.hs, b.nlast
   3b95c:	mov	x24, xzr
   3b960:	mov	w17, w28
   3b964:	add	x8, x24, #0x4
   3b968:	cmp	x8, x23
   3b96c:	b.ls	3b974 <fastgzip::enc::scan::<13, true, false>+0x170>  // b.plast
   3b970:	b	3ba04 <fastgzip::enc::scan::<13, true, false>+0x200>
   3b974:	add	x8, x22, #0x1
   3b978:	add	x9, x8, x24
   3b97c:	ldurb	w10, [x9, #-1]
   3b980:	ldrb	w11, [x9]
   3b984:	ldrb	w12, [x9, #1]
   3b988:	ldrb	w9, [x9, #2]
   3b98c:	ldr	w10, [x20, x10, lsl #2]
   3b990:	ldr	w11, [x20, x11, lsl #2]
   3b994:	ldr	w12, [x20, x12, lsl #2]
   3b998:	ldr	w9, [x20, x9, lsl #2]
   3b99c:	add	w13, w17, w10, lsr #16
   3b9a0:	and	x10, x10, #0xffff
   3b9a4:	lsl	x10, x10, x17
   3b9a8:	and	x15, x9, #0xffff
   3b9ac:	add	w14, w13, w11, lsr #16
   3b9b0:	and	x11, x11, #0xffff
   3b9b4:	lsl	x11, x11, x13
   3b9b8:	and	x13, x12, #0xffff
   3b9bc:	orr	x10, x10, x27
   3b9c0:	add	w12, w14, w12, lsr #16
   3b9c4:	lsl	x13, x13, x14
   3b9c8:	orr	x10, x10, x11
   3b9cc:	lsl	x11, x15, x12
   3b9d0:	add	w9, w12, w9, lsr #16
   3b9d4:	orr	x10, x10, x13
   3b9d8:	add	x13, x24, #0x8
   3b9dc:	add	x24, x24, #0x4
   3b9e0:	orr	x10, x10, x11
   3b9e4:	ubfx	w11, w9, #3, #3
   3b9e8:	and	w12, w9, #0x38
   3b9ec:	lsr	x27, x10, x12
   3b9f0:	str	x10, [x19, x21]
   3b9f4:	cmp	x13, x23
   3b9f8:	add	x21, x21, x11
   3b9fc:	and	w17, w9, #0xffff8007
   3ba00:	b.ls	3b978 <fastgzip::enc::scan::<13, true, false>+0x174>  // b.plast
   3ba04:	subs	x8, x23, x24
   3ba08:	b.ls	3baa4 <fastgzip::enc::scan::<13, true, false>+0x2a0>  // b.plast
   3ba0c:	add	x9, x22, x24
   3ba10:	ldrb	w10, [x9], #1
   3ba14:	subs	x8, x8, #0x1
   3ba18:	ldr	w10, [x20, x10, lsl #2]
   3ba1c:	and	x11, x10, #0xffff
   3ba20:	lsl	x11, x11, x17
   3ba24:	add	w17, w17, w10, lsr #16
   3ba28:	orr	x27, x11, x27
   3ba2c:	b.ne	3ba10 <fastgzip::enc::scan::<13, true, false>+0x20c>  // b.any
   3ba30:	ubfx	w8, w17, #3, #3
   3ba34:	and	w9, w17, #0xffff8007
   3ba38:	str	x27, [x19, x21]
   3ba3c:	add	x8, x21, x8
   3ba40:	tbz	x30, #48, 3ba74 <fastgzip::enc::scan::<13, true, false>+0x270>
   3ba44:	ldr	w10, [x20, #2060]
   3ba48:	and	w11, w17, #0x38
   3ba4c:	and	w13, w17, #0x7
   3ba50:	add	w9, w9, w10, lsr #16
   3ba54:	and	x12, x10, #0xffff
   3ba58:	lsr	x10, x27, x11
   3ba5c:	lsl	x11, x12, x13
   3ba60:	ubfx	w12, w9, #3, #3
   3ba64:	and	w9, w9, #0xffff8007
   3ba68:	orr	x10, x11, x10
   3ba6c:	str	x10, [x19, x8]
   3ba70:	add	x8, x8, x12
   3ba74:	lsl	x8, x8, #3
   3ba78:	cmp	w9, #0x7
   3ba7c:	add	x8, x8, w9, uxtw
   3ba80:	csel	x0, xzr, x8, hi	// hi = pmore
   3ba84:	ldp	x20, x19, [sp, #96]
   3ba88:	ldp	x22, x21, [sp, #80]
   3ba8c:	ldp	x24, x23, [sp, #64]
   3ba90:	ldp	x26, x25, [sp, #48]
   3ba94:	ldp	x28, x27, [sp, #32]
   3ba98:	ldp	x29, x30, [sp, #16]
   3ba9c:	add	sp, sp, #0x70
   3baa0:	ret
   3baa4:	ubfx	w8, w17, #3, #3
   3baa8:	and	w9, w17, #0xffff8007
   3baac:	str	x27, [x19, x21]
   3bab0:	add	x8, x21, x8
   3bab4:	tbnz	x30, #48, 3ba44 <fastgzip::enc::scan::<13, true, false>+0x240>
   3bab8:	b	3ba74 <fastgzip::enc::scan::<13, true, false>+0x270>
   3babc:	ldrb	w10, [x22]
   3bac0:	mov	w24, #0x1                   	// #1
   3bac4:	ldr	w10, [x20, x10, lsl #2]
   3bac8:	and	x11, x10, #0xffff
   3bacc:	add	w10, w28, w10, lsr #16
   3bad0:	lsl	x11, x11, x28
   3bad4:	ubfx	w12, w10, #3, #3
   3bad8:	and	w13, w10, #0x38
   3badc:	and	w28, w10, #0xffff8007
   3bae0:	orr	x11, x11, x27
   3bae4:	str	x11, [x19, x21]
   3bae8:	lsr	x27, x11, x13
   3baec:	add	x21, x21, x12
   3baf0:	mov	x10, #0x87000000            	// #2264924160
   3baf4:	ldr	x16, [x22, x24]
   3baf8:	add	x11, x20, #0x400
   3bafc:	movk	x10, #0xebca, lsl #32
   3bb00:	add	x12, x20, #0x810
   3bb04:	mov	w13, #0x102                 	// #258
   3bb08:	movk	x10, #0xb185, lsl #48
   3bb0c:	mov	w14, #0x1e                  	// #30
   3bb10:	mov	w15, #0xffffffff            	// #-1
   3bb14:	mov	w17, w28
   3bb18:	mul	x16, x16, x10
   3bb1c:	cmp	x24, x9
   3bb20:	lsr	x16, x16, #51
   3bb24:	b.cs	3bc50 <fastgzip::enc::scan::<13, true, false>+0x44c>  // b.hs, b.nlast
   3bb28:	ldr	x18, [x22, x24]
   3bb2c:	lsr	x0, x18, #8
   3bb30:	mul	x1, x0, x10
   3bb34:	ldrh	w0, [x25, x16, lsl #1]
   3bb38:	strh	w24, [x25, x16, lsl #1]
   3bb3c:	ldr	x2, [x22, x0]
   3bb40:	lsr	x16, x1, #51
   3bb44:	eor	x1, x2, x18
   3bb48:	cbz	w1, 3bcc8 <fastgzip::enc::scan::<13, true, false>+0x4c4>
   3bb4c:	add	x2, x22, x24
   3bb50:	and	x0, x18, #0xff
   3bb54:	add	w6, w24, #0x1
   3bb58:	ldur	x18, [x2, #1]
   3bb5c:	ldr	w3, [x20, x0, lsl #2]
   3bb60:	ldrh	w0, [x25, x16, lsl #1]
   3bb64:	strh	w6, [x25, x16, lsl #1]
   3bb68:	lsr	x1, x18, #8
   3bb6c:	and	x4, x3, #0xffff
   3bb70:	ldr	x5, [x22, x0]
   3bb74:	lsl	x4, x4, x17
   3bb78:	add	w17, w17, w3, lsr #16
   3bb7c:	mul	x1, x1, x10
   3bb80:	orr	x27, x4, x27
   3bb84:	lsr	x16, x1, #51
   3bb88:	eor	x1, x5, x18
   3bb8c:	cbz	w1, 3bddc <fastgzip::enc::scan::<13, true, false>+0x5d8>
   3bb90:	and	x0, x18, #0xff
   3bb94:	ldur	x18, [x2, #2]
   3bb98:	ldr	w2, [x20, x0, lsl #2]
   3bb9c:	ldrh	w0, [x25, x16, lsl #1]
   3bba0:	lsr	x1, x18, #8
   3bba4:	and	x3, x2, #0xffff
   3bba8:	ldr	x4, [x22, x0]
   3bbac:	mul	x1, x1, x10
   3bbb0:	lsl	x3, x3, x17
   3bbb4:	add	w17, w17, w2, lsr #16
   3bbb8:	add	w2, w24, #0x2
   3bbbc:	strh	w2, [x25, x16, lsl #1]
   3bbc0:	orr	x27, x3, x27
   3bbc4:	lsr	x16, x1, #51
   3bbc8:	eor	x1, x4, x18
   3bbcc:	cbz	w1, 3bde8 <fastgzip::enc::scan::<13, true, false>+0x5e4>
   3bbd0:	add	x0, x22, x24
   3bbd4:	and	x1, x18, #0xff
   3bbd8:	add	w5, w24, #0x3
   3bbdc:	ldur	x18, [x0, #3]
   3bbe0:	ldr	w1, [x20, x1, lsl #2]
   3bbe4:	lsr	x0, x18, #8
   3bbe8:	and	x3, x1, #0xffff
   3bbec:	lsl	x3, x3, x17
   3bbf0:	add	w17, w17, w1, lsr #16
   3bbf4:	mul	x2, x0, x10
   3bbf8:	ldrh	w0, [x25, x16, lsl #1]
   3bbfc:	strh	w5, [x25, x16, lsl #1]
   3bc00:	orr	x27, x3, x27
   3bc04:	ldr	x4, [x22, x0]
   3bc08:	eor	x1, x4, x18
   3bc0c:	lsr	x16, x2, #51
   3bc10:	cbz	w1, 3bdf4 <fastgzip::enc::scan::<13, true, false>+0x5f0>
   3bc14:	and	x18, x18, #0xff
   3bc18:	add	x24, x24, #0x4
   3bc1c:	ldr	w18, [x20, x18, lsl #2]
   3bc20:	cmp	x24, x9
   3bc24:	and	x0, x18, #0xffff
   3bc28:	lsl	x0, x0, x17
   3bc2c:	add	w17, w17, w18, lsr #16
   3bc30:	orr	x18, x0, x27
   3bc34:	ubfx	w0, w17, #3, #3
   3bc38:	and	w1, w17, #0x38
   3bc3c:	lsr	x27, x18, x1
   3bc40:	str	x18, [x19, x21]
   3bc44:	and	w17, w17, #0xffff8007
   3bc48:	add	x21, x21, x0
   3bc4c:	b.cc	3bb28 <fastgzip::enc::scan::<13, true, false>+0x324>  // b.lo, b.ul, b.last
   3bc50:	cmp	x24, x8
   3bc54:	mov	w2, w17
   3bc58:	b.cs	3b964 <fastgzip::enc::scan::<13, true, false>+0x160>  // b.hs, b.nlast
   3bc5c:	ldr	x18, [x22, x24]
   3bc60:	ldrh	w0, [x25, x16, lsl #1]
   3bc64:	strh	w24, [x25, x16, lsl #1]
   3bc68:	lsr	x17, x18, #8
   3bc6c:	ldr	x1, [x22, x0]
   3bc70:	mul	x17, x17, x10
   3bc74:	eor	x1, x1, x18
   3bc78:	lsr	x16, x17, #51
   3bc7c:	cbz	w1, 3bcc4 <fastgzip::enc::scan::<13, true, false>+0x4c0>
   3bc80:	and	x17, x18, #0xff
   3bc84:	add	x24, x24, #0x1
   3bc88:	ldr	w17, [x20, x17, lsl #2]
   3bc8c:	cmp	x24, x8
   3bc90:	and	x18, x17, #0xffff
   3bc94:	add	w17, w2, w17, lsr #16
   3bc98:	lsl	x18, x18, x2
   3bc9c:	ubfx	w0, w17, #3, #3
   3bca0:	and	w1, w17, #0x38
   3bca4:	and	w17, w17, #0xffff8007
   3bca8:	orr	x18, x18, x27
   3bcac:	str	x18, [x19, x21]
   3bcb0:	lsr	x27, x18, x1
   3bcb4:	add	x21, x21, x0
   3bcb8:	mov	w2, w17
   3bcbc:	b.cc	3bc5c <fastgzip::enc::scan::<13, true, false>+0x458>  // b.lo, b.ul, b.last
   3bcc0:	b	3b964 <fastgzip::enc::scan::<13, true, false>+0x160>
   3bcc4:	mov	w17, w2
   3bcc8:	cbz	x1, 3bdfc <fastgzip::enc::scan::<13, true, false>+0x5f8>
   3bccc:	rbit	x1, x1
   3bcd0:	clz	x1, x1
   3bcd4:	lsr	x1, x1, #3
   3bcd8:	mvn	w0, w0
   3bcdc:	add	w0, w0, w24
   3bce0:	cmp	w0, #0x2
   3bce4:	clz	w2, w0
   3bce8:	mov	w3, w0
   3bcec:	b.cc	3bd04 <fastgzip::enc::scan::<13, true, false>+0x500>  // b.lo, b.ul, b.last
   3bcf0:	sub	w3, w14, w2
   3bcf4:	lsr	w3, w0, w3
   3bcf8:	and	w3, w3, #0x1
   3bcfc:	sub	w3, w3, w2, lsl #1
   3bd00:	add	w3, w3, #0x3e
   3bd04:	ldr	w4, [x11, x1, lsl #2]
   3bd08:	subs	w2, w14, w2
   3bd0c:	ldr	w3, [x12, w3, uxtw #2]
   3bd10:	csel	w2, wzr, w2, cc	// cc = lo, ul, last
   3bd14:	lsr	x18, x18, #16
   3bd18:	and	w6, w17, #0x38
   3bd1c:	ubfx	x5, x4, #19, #5
   3bd20:	lsl	w7, w15, w2
   3bd24:	and	x26, x3, #0xffff
   3bd28:	and	x4, x4, #0x7ffff
   3bd2c:	mul	x18, x18, x10
   3bd30:	lsr	x6, x27, x6
   3bd34:	add	w3, w5, w3, lsr #16
   3bd38:	bic	w0, w0, w7
   3bd3c:	lsl	x5, x26, x5
   3bd40:	ubfx	w7, w17, #3, #3
   3bd44:	str	x27, [x19, x21]
   3bd48:	lsl	x0, x0, x3
   3bd4c:	orr	x4, x5, x4
   3bd50:	and	w5, w17, #0xffff8007
   3bd54:	and	w17, w17, #0x7
   3bd58:	add	w2, w2, w5
   3bd5c:	add	w5, w24, #0x2
   3bd60:	orr	x0, x4, x0
   3bd64:	add	w4, w24, #0x1
   3bd68:	add	x24, x1, x24
   3bd6c:	lsl	x17, x0, x17
   3bd70:	add	w1, w2, w3
   3bd74:	lsr	x18, x18, #50
   3bd78:	and	w2, w1, #0x38
   3bd7c:	ubfx	w3, w1, #3, #3
   3bd80:	add	x0, x21, x7
   3bd84:	orr	x17, x17, x6
   3bd88:	str	x17, [x19, x0]
   3bd8c:	cmp	x24, x8
   3bd90:	lsr	x27, x17, x2
   3bd94:	strh	w4, [x25, x16, lsl #1]
   3bd98:	and	x16, x18, #0x3ffe
   3bd9c:	add	x21, x0, x3
   3bda0:	and	w17, w1, #0xffff8007
   3bda4:	strh	w5, [x25, x16]
   3bda8:	b.cs	3b964 <fastgzip::enc::scan::<13, true, false>+0x160>  // b.hs, b.nlast
   3bdac:	sub	x18, x24, #0x1
   3bdb0:	ldr	x16, [x22, x18]
   3bdb4:	mul	x0, x16, x10
   3bdb8:	lsr	x16, x16, #8
   3bdbc:	lsr	x0, x0, #50
   3bdc0:	and	x0, x0, #0x3ffe
   3bdc4:	strh	w18, [x25, x0]
   3bdc8:	mul	x16, x16, x10
   3bdcc:	cmp	x24, x9
   3bdd0:	lsr	x16, x16, #51
   3bdd4:	b.cc	3bb28 <fastgzip::enc::scan::<13, true, false>+0x324>  // b.lo, b.ul, b.last
   3bdd8:	b	3bc50 <fastgzip::enc::scan::<13, true, false>+0x44c>
   3bddc:	add	x24, x24, #0x1
   3bde0:	cbnz	x1, 3bccc <fastgzip::enc::scan::<13, true, false>+0x4c8>
   3bde4:	b	3bdfc <fastgzip::enc::scan::<13, true, false>+0x5f8>
   3bde8:	add	x24, x24, #0x2
   3bdec:	cbnz	x1, 3bccc <fastgzip::enc::scan::<13, true, false>+0x4c8>
   3bdf0:	b	3bdfc <fastgzip::enc::scan::<13, true, false>+0x5f8>
   3bdf4:	add	x24, x24, #0x3
   3bdf8:	cbnz	x1, 3bccc <fastgzip::enc::scan::<13, true, false>+0x4c8>
   3bdfc:	sub	x1, x23, x24
   3be00:	add	x3, x22, x24
   3be04:	add	x4, x22, x0
   3be08:	cmp	x1, #0x102
   3be0c:	csel	x2, x1, x13, cc	// cc = lo, ul, last
   3be10:	cmp	x1, #0x10
   3be14:	b.cs	3be20 <fastgzip::enc::scan::<13, true, false>+0x61c>  // b.hs, b.nlast
   3be18:	mov	w1, #0x8                   	// #8
   3be1c:	b	3be48 <fastgzip::enc::scan::<13, true, false>+0x644>
   3be20:	mov	w5, #0x8                   	// #8
   3be24:	ldr	x1, [x3, x5]
   3be28:	ldr	x6, [x4, x5]
   3be2c:	cmp	x1, x6
   3be30:	b.ne	3be74 <fastgzip::enc::scan::<13, true, false>+0x670>  // b.any
   3be34:	add	x6, x5, #0x10
   3be38:	add	x1, x5, #0x8
   3be3c:	cmp	x6, x2
   3be40:	mov	x5, x1
   3be44:	b.ls	3be24 <fastgzip::enc::scan::<13, true, false>+0x620>  // b.plast
   3be48:	cmp	x1, x2
   3be4c:	b.cs	3bcd8 <fastgzip::enc::scan::<13, true, false>+0x4d4>  // b.hs, b.nlast
   3be50:	ldrb	w5, [x3, x1]
   3be54:	ldrb	w6, [x4, x1]
   3be58:	cmp	w5, w6
   3be5c:	b.ne	3bcd8 <fastgzip::enc::scan::<13, true, false>+0x4d4>  // b.any
   3be60:	add	x1, x1, #0x1
   3be64:	cmp	x2, x1
   3be68:	b.ne	3be50 <fastgzip::enc::scan::<13, true, false>+0x64c>  // b.any
   3be6c:	mov	x1, x2
   3be70:	b	3bcd8 <fastgzip::enc::scan::<13, true, false>+0x4d4>
   3be74:	eor	x1, x6, x1
   3be78:	rbit	x1, x1
   3be7c:	clz	x1, x1
   3be80:	add	x1, x5, x1, lsr #3
   3be84:	b	3bcd8 <fastgzip::enc::scan::<13, true, false>+0x4d4>
   3be88:	adrp	x2, bd000 <anon.7a263ad2a3e00f1d3c23c4bfb0e9541b.29.llvm.2438094699631020562+0x58>
   3be8c:	add	x2, x2, #0x638
   3be90:	mov	x0, x21
   3be94:	mov	w1, #0x240                 	// #576
   3be98:	bl	db84 <core::panicking::panic_bounds_check>
