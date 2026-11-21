000000000001bd7c <fastgzip_u2::enc::scan::<13, true, false>>:
   1bd7c:	sub	sp, sp, #0x70
   1bd80:	stp	x29, x30, [sp, #16]
   1bd84:	stp	x28, x27, [sp, #32]
   1bd88:	stp	x26, x25, [sp, #48]
   1bd8c:	stp	x24, x23, [sp, #64]
   1bd90:	stp	x22, x21, [sp, #80]
   1bd94:	stp	x20, x19, [sp, #96]
   1bd98:	add	x29, sp, #0x10
   1bd9c:	ldr	x30, [x29, #112]
   1bda0:	ldr	x19, [x29, #96]
   1bda4:	mov	x24, x6
   1bda8:	mov	x23, x5
   1bdac:	mov	x22, x4
   1bdb0:	mov	x25, x1
   1bdb4:	mov	x20, x0
   1bdb8:	tbnz	x30, #32, 1bddc <fastgzip_u2::enc::scan::<13, true, false>+0x60>
   1bdbc:	mov	x8, #0xffffffffffffffff    	// #-1
   1bdc0:	ldrb	w9, [x19]
   1bdc4:	mov	x21, xzr
   1bdc8:	lsl	x8, x8, x30
   1bdcc:	mov	x28, x30
   1bdd0:	bic	x27, x9, x8
   1bdd4:	tbz	w7, #0, 1be5c <fastgzip_u2::enc::scan::<13, true, false>+0xe0>
   1bdd8:	b	1bea0 <fastgzip_u2::enc::scan::<13, true, false>+0x124>
   1bddc:	ldr	w27, [x20, #2576]
   1bde0:	add	x26, x20, #0xa14
   1bde4:	lsr	x21, x27, #3
   1bde8:	cmp	w27, #0x3ff
   1bdec:	b.hi	1be14 <fastgzip_u2::enc::scan::<13, true, false>+0x98>  // b.pmore
   1bdf0:	ldp	q0, q1, [x26, #64]
   1bdf4:	stp	q0, q1, [x19, #64]
   1bdf8:	ldp	q0, q2, [x26, #96]
   1bdfc:	stp	q0, q2, [x19, #96]
   1be00:	ldp	q1, q0, [x26]
   1be04:	stp	q1, q0, [x19]
   1be08:	ldp	q2, q0, [x26, #32]
   1be0c:	stp	q2, q0, [x19, #32]
   1be10:	b	1be40 <fastgzip_u2::enc::scan::<13, true, false>+0xc4>
   1be14:	add	x1, x20, #0xa14
   1be18:	mov	x0, x19
   1be1c:	mov	x2, x21
   1be20:	stur	w7, [x29, #-4]
   1be24:	mov	x28, x30
   1be28:	bl	5f20 <memcpy@plt>
   1be2c:	lsr	w8, w27, #9
   1be30:	ldur	w7, [x29, #-4]
   1be34:	mov	x30, x28
   1be38:	cmp	w8, #0x8
   1be3c:	b.hi	1c3ec <fastgzip_u2::enc::scan::<13, true, false>+0x670>  // b.pmore
   1be40:	and	x28, x27, #0x7
   1be44:	mov	x8, #0xffffffffffffffff    	// #-1
   1be48:	ldrb	w9, [x26, x21]
   1be4c:	lsl	x8, x8, x28
   1be50:	bic	x27, x9, x8
   1be54:	tbz	x30, #40, 1be80 <fastgzip_u2::enc::scan::<13, true, false>+0x104>
   1be58:	tbnz	w7, #0, 1bea0 <fastgzip_u2::enc::scan::<13, true, false>+0x124>
   1be5c:	subs	x8, x23, #0x9
   1be60:	csel	x8, xzr, x8, cc	// cc = lo, ul, last
   1be64:	subs	x9, x23, #0xc
   1be68:	csel	x9, xzr, x9, cc	// cc = lo, ul, last
   1be6c:	cbz	x24, 1becc <fastgzip_u2::enc::scan::<13, true, false>+0x150>
   1be70:	cmp	x24, x8
   1be74:	mov	w17, w28
   1be78:	b.cs	1bedc <fastgzip_u2::enc::scan::<13, true, false>+0x160>  // b.hs, b.nlast
   1be7c:	b	1c068 <fastgzip_u2::enc::scan::<13, true, false>+0x2ec>
   1be80:	cbz	x21, 1be98 <fastgzip_u2::enc::scan::<13, true, false>+0x11c>
   1be84:	ldrb	w8, [x19]
   1be88:	and	w8, w8, #0xfe
   1be8c:	strb	w8, [x19]
   1be90:	tbz	w7, #0, 1be5c <fastgzip_u2::enc::scan::<13, true, false>+0xe0>
   1be94:	b	1bea0 <fastgzip_u2::enc::scan::<13, true, false>+0x124>
   1be98:	and	x27, x27, #0x7e
   1be9c:	tbz	w7, #0, 1be5c <fastgzip_u2::enc::scan::<13, true, false>+0xe0>
   1bea0:	mov	x0, x25
   1bea4:	mov	w1, wzr
   1bea8:	mov	w2, #0x4000                	// #16384
   1beac:	mov	x26, x30
   1beb0:	bl	60e0 <memset@plt>
   1beb4:	mov	x30, x26
   1beb8:	subs	x8, x23, #0x9
   1bebc:	csel	x8, xzr, x8, cc	// cc = lo, ul, last
   1bec0:	subs	x9, x23, #0xc
   1bec4:	csel	x9, xzr, x9, cc	// cc = lo, ul, last
   1bec8:	cbnz	x24, 1be70 <fastgzip_u2::enc::scan::<13, true, false>+0xf4>
   1becc:	cmp	x8, #0x2
   1bed0:	b.cs	1c034 <fastgzip_u2::enc::scan::<13, true, false>+0x2b8>  // b.hs, b.nlast
   1bed4:	mov	x24, xzr
   1bed8:	mov	w17, w28
   1bedc:	add	x8, x24, #0x4
   1bee0:	cmp	x8, x23
   1bee4:	b.ls	1beec <fastgzip_u2::enc::scan::<13, true, false>+0x170>  // b.plast
   1bee8:	b	1bf7c <fastgzip_u2::enc::scan::<13, true, false>+0x200>
   1beec:	add	x8, x22, #0x1
   1bef0:	add	x9, x8, x24
   1bef4:	ldurb	w10, [x9, #-1]
   1bef8:	ldrb	w11, [x9]
   1befc:	ldrb	w12, [x9, #1]
   1bf00:	ldrb	w9, [x9, #2]
   1bf04:	ldr	w10, [x20, x10, lsl #2]
   1bf08:	ldr	w11, [x20, x11, lsl #2]
   1bf0c:	ldr	w12, [x20, x12, lsl #2]
   1bf10:	ldr	w9, [x20, x9, lsl #2]
   1bf14:	add	w13, w17, w10, lsr #16
   1bf18:	and	x10, x10, #0xffff
   1bf1c:	lsl	x10, x10, x17
   1bf20:	and	x15, x9, #0xffff
   1bf24:	add	w14, w13, w11, lsr #16
   1bf28:	and	x11, x11, #0xffff
   1bf2c:	lsl	x11, x11, x13
   1bf30:	and	x13, x12, #0xffff
   1bf34:	orr	x10, x10, x27
   1bf38:	add	w12, w14, w12, lsr #16
   1bf3c:	lsl	x13, x13, x14
   1bf40:	orr	x10, x10, x11
   1bf44:	lsl	x11, x15, x12
   1bf48:	add	w9, w12, w9, lsr #16
   1bf4c:	orr	x10, x10, x13
   1bf50:	add	x13, x24, #0x8
   1bf54:	add	x24, x24, #0x4
   1bf58:	orr	x10, x10, x11
   1bf5c:	ubfx	w11, w9, #3, #3
   1bf60:	and	w12, w9, #0x38
   1bf64:	lsr	x27, x10, x12
   1bf68:	str	x10, [x19, x21]
   1bf6c:	cmp	x13, x23
   1bf70:	add	x21, x21, x11
   1bf74:	and	w17, w9, #0xffff8007
   1bf78:	b.ls	1bef0 <fastgzip_u2::enc::scan::<13, true, false>+0x174>  // b.plast
   1bf7c:	subs	x8, x23, x24
   1bf80:	b.ls	1c01c <fastgzip_u2::enc::scan::<13, true, false>+0x2a0>  // b.plast
   1bf84:	add	x9, x22, x24
   1bf88:	ldrb	w10, [x9], #1
   1bf8c:	subs	x8, x8, #0x1
   1bf90:	ldr	w10, [x20, x10, lsl #2]
   1bf94:	and	x11, x10, #0xffff
   1bf98:	lsl	x11, x11, x17
   1bf9c:	add	w17, w17, w10, lsr #16
   1bfa0:	orr	x27, x11, x27
   1bfa4:	b.ne	1bf88 <fastgzip_u2::enc::scan::<13, true, false>+0x20c>  // b.any
   1bfa8:	ubfx	w8, w17, #3, #3
   1bfac:	and	w9, w17, #0xffff8007
   1bfb0:	str	x27, [x19, x21]
   1bfb4:	add	x8, x21, x8
   1bfb8:	tbz	x30, #48, 1bfec <fastgzip_u2::enc::scan::<13, true, false>+0x270>
   1bfbc:	ldr	w10, [x20, #2060]
   1bfc0:	and	w11, w17, #0x38
   1bfc4:	and	w13, w17, #0x7
   1bfc8:	add	w9, w9, w10, lsr #16
   1bfcc:	and	x12, x10, #0xffff
   1bfd0:	lsr	x10, x27, x11
   1bfd4:	lsl	x11, x12, x13
   1bfd8:	ubfx	w12, w9, #3, #3
   1bfdc:	and	w9, w9, #0xffff8007
   1bfe0:	orr	x10, x11, x10
   1bfe4:	str	x10, [x19, x8]
   1bfe8:	add	x8, x8, x12
   1bfec:	lsl	x8, x8, #3
   1bff0:	cmp	w9, #0x7
   1bff4:	add	x8, x8, w9, uxtw
   1bff8:	csel	x0, xzr, x8, hi	// hi = pmore
   1bffc:	ldp	x20, x19, [sp, #96]
   1c000:	ldp	x22, x21, [sp, #80]
   1c004:	ldp	x24, x23, [sp, #64]
   1c008:	ldp	x26, x25, [sp, #48]
   1c00c:	ldp	x28, x27, [sp, #32]
   1c010:	ldp	x29, x30, [sp, #16]
   1c014:	add	sp, sp, #0x70
   1c018:	ret
   1c01c:	ubfx	w8, w17, #3, #3
   1c020:	and	w9, w17, #0xffff8007
   1c024:	str	x27, [x19, x21]
   1c028:	add	x8, x21, x8
   1c02c:	tbnz	x30, #48, 1bfbc <fastgzip_u2::enc::scan::<13, true, false>+0x240>
   1c030:	b	1bfec <fastgzip_u2::enc::scan::<13, true, false>+0x270>
   1c034:	ldrb	w10, [x22]
   1c038:	mov	w24, #0x1                   	// #1
   1c03c:	ldr	w10, [x20, x10, lsl #2]
   1c040:	and	x11, x10, #0xffff
   1c044:	add	w10, w28, w10, lsr #16
   1c048:	lsl	x11, x11, x28
   1c04c:	ubfx	w12, w10, #3, #3
   1c050:	and	w13, w10, #0x38
   1c054:	and	w28, w10, #0xffff8007
   1c058:	orr	x11, x11, x27
   1c05c:	str	x11, [x19, x21]
   1c060:	lsr	x27, x11, x13
   1c064:	add	x21, x21, x12
   1c068:	mov	x10, #0x87000000            	// #2264924160
   1c06c:	ldr	x16, [x22, x24]
   1c070:	add	x11, x20, #0x400
   1c074:	movk	x10, #0xebca, lsl #32
   1c078:	add	x12, x20, #0x810
   1c07c:	mov	w13, #0x102                 	// #258
   1c080:	movk	x10, #0xb185, lsl #48
   1c084:	mov	w14, #0x1e                  	// #30
   1c088:	mov	w15, #0xffffffff            	// #-1
   1c08c:	mov	w17, w28
   1c090:	mul	x16, x16, x10
   1c094:	cmp	x24, x9
   1c098:	lsr	x16, x16, #51
   1c09c:	b.cs	1c1c8 <fastgzip_u2::enc::scan::<13, true, false>+0x44c>  // b.hs, b.nlast
   1c0a0:	ldr	x18, [x22, x24]
   1c0a4:	lsr	x0, x18, #8
   1c0a8:	mul	x1, x0, x10
   1c0ac:	ldrh	w0, [x25, x16, lsl #1]
   1c0b0:	strh	w24, [x25, x16, lsl #1]
   1c0b4:	ldr	x2, [x22, x0]
   1c0b8:	lsr	x16, x1, #51
   1c0bc:	eor	x1, x2, x18
   1c0c0:	cbz	w1, 1c240 <fastgzip_u2::enc::scan::<13, true, false>+0x4c4>
   1c0c4:	add	x2, x22, x24
   1c0c8:	and	x0, x18, #0xff
   1c0cc:	add	w6, w24, #0x1
   1c0d0:	ldur	x18, [x2, #1]
   1c0d4:	ldr	w3, [x20, x0, lsl #2]
   1c0d8:	ldrh	w0, [x25, x16, lsl #1]
   1c0dc:	strh	w6, [x25, x16, lsl #1]
   1c0e0:	lsr	x1, x18, #8
   1c0e4:	and	x4, x3, #0xffff
   1c0e8:	ldr	x5, [x22, x0]
   1c0ec:	lsl	x4, x4, x17
   1c0f0:	add	w17, w17, w3, lsr #16
   1c0f4:	mul	x1, x1, x10
   1c0f8:	orr	x27, x4, x27
   1c0fc:	lsr	x16, x1, #51
   1c100:	eor	x1, x5, x18
   1c104:	cbz	w1, 1c254 <fastgzip_u2::enc::scan::<13, true, false>+0x4d8>
   1c108:	and	x0, x18, #0xff
   1c10c:	ldur	x18, [x2, #2]
   1c110:	ldr	w2, [x20, x0, lsl #2]
   1c114:	ldrh	w0, [x25, x16, lsl #1]
   1c118:	lsr	x1, x18, #8
   1c11c:	and	x3, x2, #0xffff
   1c120:	ldr	x4, [x22, x0]
   1c124:	mul	x1, x1, x10
   1c128:	lsl	x3, x3, x17
   1c12c:	add	w17, w17, w2, lsr #16
   1c130:	add	w2, w24, #0x2
   1c134:	strh	w2, [x25, x16, lsl #1]
   1c138:	orr	x27, x3, x27
   1c13c:	lsr	x16, x1, #51
   1c140:	eor	x1, x4, x18
   1c144:	cbz	w1, 1c260 <fastgzip_u2::enc::scan::<13, true, false>+0x4e4>
   1c148:	add	x0, x22, x24
   1c14c:	and	x1, x18, #0xff
   1c150:	add	w5, w24, #0x3
   1c154:	ldur	x18, [x0, #3]
   1c158:	ldr	w1, [x20, x1, lsl #2]
   1c15c:	lsr	x0, x18, #8
   1c160:	and	x3, x1, #0xffff
   1c164:	lsl	x3, x3, x17
   1c168:	add	w17, w17, w1, lsr #16
   1c16c:	mul	x2, x0, x10
   1c170:	ldrh	w0, [x25, x16, lsl #1]
   1c174:	strh	w5, [x25, x16, lsl #1]
   1c178:	orr	x27, x3, x27
   1c17c:	ldr	x4, [x22, x0]
   1c180:	eor	x1, x4, x18
   1c184:	lsr	x16, x2, #51
   1c188:	cbz	w1, 1c26c <fastgzip_u2::enc::scan::<13, true, false>+0x4f0>
   1c18c:	and	x18, x18, #0xff
   1c190:	add	x24, x24, #0x4
   1c194:	ldr	w18, [x20, x18, lsl #2]
   1c198:	cmp	x24, x9
   1c19c:	and	x0, x18, #0xffff
   1c1a0:	lsl	x0, x0, x17
   1c1a4:	add	w17, w17, w18, lsr #16
   1c1a8:	orr	x18, x0, x27
   1c1ac:	ubfx	w0, w17, #3, #3
   1c1b0:	and	w1, w17, #0x38
   1c1b4:	lsr	x27, x18, x1
   1c1b8:	str	x18, [x19, x21]
   1c1bc:	and	w17, w17, #0xffff8007
   1c1c0:	add	x21, x21, x0
   1c1c4:	b.cc	1c0a0 <fastgzip_u2::enc::scan::<13, true, false>+0x324>  // b.lo, b.ul, b.last
   1c1c8:	cmp	x24, x8
   1c1cc:	mov	w2, w17
   1c1d0:	b.cs	1bedc <fastgzip_u2::enc::scan::<13, true, false>+0x160>  // b.hs, b.nlast
   1c1d4:	ldr	x18, [x22, x24]
   1c1d8:	ldrh	w0, [x25, x16, lsl #1]
   1c1dc:	strh	w24, [x25, x16, lsl #1]
   1c1e0:	lsr	x17, x18, #8
   1c1e4:	ldr	x1, [x22, x0]
   1c1e8:	mul	x17, x17, x10
   1c1ec:	eor	x1, x1, x18
   1c1f0:	lsr	x16, x17, #51
   1c1f4:	cbz	w1, 1c23c <fastgzip_u2::enc::scan::<13, true, false>+0x4c0>
   1c1f8:	and	x17, x18, #0xff
   1c1fc:	add	x24, x24, #0x1
   1c200:	ldr	w17, [x20, x17, lsl #2]
   1c204:	cmp	x24, x8
   1c208:	and	x18, x17, #0xffff
   1c20c:	add	w17, w2, w17, lsr #16
   1c210:	lsl	x18, x18, x2
   1c214:	ubfx	w0, w17, #3, #3
   1c218:	and	w1, w17, #0x38
   1c21c:	and	w17, w17, #0xffff8007
   1c220:	orr	x18, x18, x27
   1c224:	str	x18, [x19, x21]
   1c228:	lsr	x27, x18, x1
   1c22c:	add	x21, x21, x0
   1c230:	mov	w2, w17
   1c234:	b.cc	1c1d4 <fastgzip_u2::enc::scan::<13, true, false>+0x458>  // b.lo, b.ul, b.last
   1c238:	b	1bedc <fastgzip_u2::enc::scan::<13, true, false>+0x160>
   1c23c:	mov	w17, w2
   1c240:	cbz	x1, 1c274 <fastgzip_u2::enc::scan::<13, true, false>+0x4f8>
   1c244:	rbit	x1, x1
   1c248:	clz	x1, x1
   1c24c:	lsr	x1, x1, #3
   1c250:	b	1c2f4 <fastgzip_u2::enc::scan::<13, true, false>+0x578>
   1c254:	add	x24, x24, #0x1
   1c258:	cbnz	x1, 1c244 <fastgzip_u2::enc::scan::<13, true, false>+0x4c8>
   1c25c:	b	1c274 <fastgzip_u2::enc::scan::<13, true, false>+0x4f8>
   1c260:	add	x24, x24, #0x2
   1c264:	cbnz	x1, 1c244 <fastgzip_u2::enc::scan::<13, true, false>+0x4c8>
   1c268:	b	1c274 <fastgzip_u2::enc::scan::<13, true, false>+0x4f8>
   1c26c:	add	x24, x24, #0x3
   1c270:	cbnz	x1, 1c244 <fastgzip_u2::enc::scan::<13, true, false>+0x4c8>
   1c274:	sub	x2, x23, x24
   1c278:	add	x3, x22, x0
   1c27c:	cmp	x2, #0x102
   1c280:	csel	x1, x2, x13, cc	// cc = lo, ul, last
   1c284:	cmp	x2, #0x10
   1c288:	add	x2, x22, x24
   1c28c:	b.cs	1c298 <fastgzip_u2::enc::scan::<13, true, false>+0x51c>  // b.hs, b.nlast
   1c290:	mov	w5, #0x8                   	// #8
   1c294:	b	1c2c0 <fastgzip_u2::enc::scan::<13, true, false>+0x544>
   1c298:	mov	w4, #0x8                   	// #8
   1c29c:	ldr	x5, [x2, x4]
   1c2a0:	ldr	x6, [x3, x4]
   1c2a4:	cmp	x5, x6
   1c2a8:	b.ne	1c2e4 <fastgzip_u2::enc::scan::<13, true, false>+0x568>  // b.any
   1c2ac:	add	x6, x4, #0x10
   1c2b0:	add	x5, x4, #0x8
   1c2b4:	cmp	x6, x1
   1c2b8:	mov	x4, x5
   1c2bc:	b.ls	1c29c <fastgzip_u2::enc::scan::<13, true, false>+0x520>  // b.plast
   1c2c0:	cmp	x5, x1
   1c2c4:	b.cs	1c2f4 <fastgzip_u2::enc::scan::<13, true, false>+0x578>  // b.hs, b.nlast
   1c2c8:	sub	x4, x1, #0x8
   1c2cc:	ldr	x2, [x2, x4]
   1c2d0:	ldr	x3, [x3, x4]
   1c2d4:	cmp	x2, x3
   1c2d8:	b.eq	1c2f4 <fastgzip_u2::enc::scan::<13, true, false>+0x578>  // b.none
   1c2dc:	eor	x1, x3, x2
   1c2e0:	b	1c2e8 <fastgzip_u2::enc::scan::<13, true, false>+0x56c>
   1c2e4:	eor	x1, x6, x5
   1c2e8:	rbit	x1, x1
   1c2ec:	clz	x1, x1
   1c2f0:	add	x1, x4, x1, lsr #3
   1c2f4:	mvn	w2, w0
   1c2f8:	ldr	w5, [x11, x1, lsl #2]
   1c2fc:	lsr	x18, x18, #16
   1c300:	add	w2, w2, w24
   1c304:	and	w7, w17, #0x38
   1c308:	str	x27, [x19, x21]
   1c30c:	clz	w3, w2
   1c310:	mul	x18, x18, x10
   1c314:	lsr	x7, x27, x7
   1c318:	subs	w4, w14, w3
   1c31c:	lsr	w2, w2, w4
   1c320:	and	w2, w2, #0x1
   1c324:	orr	w2, w2, w3, lsl #1
   1c328:	sub	w3, w0, w24
   1c32c:	csel	w0, wzr, w4, cc	// cc = lo, ul, last
   1c330:	ubfx	x4, x5, #19, #5
   1c334:	lsl	w6, w15, w0
   1c338:	and	x5, x5, #0x7ffff
   1c33c:	ldr	w2, [x12, w2, uxtw #2]
   1c340:	lsr	x18, x18, #50
   1c344:	mvn	w6, w6
   1c348:	and	x26, x2, #0xffff
   1c34c:	add	w2, w4, w2, lsr #16
   1c350:	bic	w3, w6, w3
   1c354:	lsl	x4, x26, x4
   1c358:	ubfx	w6, w17, #3, #3
   1c35c:	lsl	x3, x3, x2
   1c360:	orr	x4, x4, x5
   1c364:	and	w5, w17, #0xffff8007
   1c368:	and	w17, w17, #0x7
   1c36c:	orr	x3, x4, x3
   1c370:	add	w0, w0, w5
   1c374:	add	w4, w24, #0x1
   1c378:	lsl	x17, x3, x17
   1c37c:	add	w0, w0, w2
   1c380:	add	w5, w24, #0x2
   1c384:	and	w2, w0, #0x38
   1c388:	ubfx	w3, w0, #3, #3
   1c38c:	add	x24, x1, x24
   1c390:	orr	x17, x17, x7
   1c394:	add	x1, x21, x6
   1c398:	strh	w4, [x25, x16, lsl #1]
   1c39c:	lsr	x27, x17, x2
   1c3a0:	str	x17, [x19, x1]
   1c3a4:	and	x16, x18, #0x3ffe
   1c3a8:	cmp	x24, x8
   1c3ac:	add	x21, x1, x3
   1c3b0:	and	w17, w0, #0xffff8007
   1c3b4:	strh	w5, [x25, x16]
   1c3b8:	b.cs	1bedc <fastgzip_u2::enc::scan::<13, true, false>+0x160>  // b.hs, b.nlast
   1c3bc:	sub	x18, x24, #0x1
   1c3c0:	ldr	x16, [x22, x18]
   1c3c4:	mul	x0, x16, x10
   1c3c8:	lsr	x16, x16, #8
   1c3cc:	lsr	x0, x0, #50
   1c3d0:	and	x0, x0, #0x3ffe
   1c3d4:	strh	w18, [x25, x0]
   1c3d8:	mul	x16, x16, x10
   1c3dc:	cmp	x24, x9
   1c3e0:	lsr	x16, x16, #51
   1c3e4:	b.cc	1c0a0 <fastgzip_u2::enc::scan::<13, true, false>+0x324>  // b.lo, b.ul, b.last
   1c3e8:	b	1c1c8 <fastgzip_u2::enc::scan::<13, true, false>+0x44c>
   1c3ec:	adrp	x2, bc000 <GCC_except_table0+0xcf78>
   1c3f0:	add	x2, x2, #0x930
   1c3f4:	mov	x0, x21
   1c3f8:	mov	w1, #0x240                 	// #576
   1c3fc:	bl	dd98 <core::panicking::panic_bounds_check>
