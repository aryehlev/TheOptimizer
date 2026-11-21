000000000003be38 <fastgzip::enc::scan::<13, true, false>>:
   3be38:	sub	sp, sp, #0x70
   3be3c:	stp	x29, x30, [sp, #16]
   3be40:	stp	x28, x27, [sp, #32]
   3be44:	stp	x26, x25, [sp, #48]
   3be48:	stp	x24, x23, [sp, #64]
   3be4c:	stp	x22, x21, [sp, #80]
   3be50:	stp	x20, x19, [sp, #96]
   3be54:	add	x29, sp, #0x10
   3be58:	ldr	x30, [x29, #112]
   3be5c:	ldr	x19, [x29, #96]
   3be60:	mov	x24, x6
   3be64:	mov	x23, x5
   3be68:	mov	x22, x4
   3be6c:	mov	x25, x1
   3be70:	mov	x20, x0
   3be74:	tbnz	x30, #32, 3be98 <fastgzip::enc::scan::<13, true, false>+0x60>
   3be78:	mov	x8, #0xffffffffffffffff    	// #-1
   3be7c:	ldrb	w9, [x19]
   3be80:	mov	x21, xzr
   3be84:	lsl	x8, x8, x30
   3be88:	mov	x28, x30
   3be8c:	bic	x27, x9, x8
   3be90:	tbz	w7, #0, 3bf18 <fastgzip::enc::scan::<13, true, false>+0xe0>
   3be94:	b	3bf5c <fastgzip::enc::scan::<13, true, false>+0x124>
   3be98:	ldr	w27, [x20, #2192]
   3be9c:	add	x26, x20, #0x894
   3bea0:	lsr	x21, x27, #3
   3bea4:	cmp	w27, #0x3ff
   3bea8:	b.hi	3bed0 <fastgzip::enc::scan::<13, true, false>+0x98>  // b.pmore
   3beac:	ldp	q0, q1, [x26, #64]
   3beb0:	stp	q0, q1, [x19, #64]
   3beb4:	ldp	q0, q2, [x26, #96]
   3beb8:	stp	q0, q2, [x19, #96]
   3bebc:	ldp	q1, q0, [x26]
   3bec0:	stp	q1, q0, [x19]
   3bec4:	ldp	q2, q0, [x26, #32]
   3bec8:	stp	q2, q0, [x19, #32]
   3becc:	b	3befc <fastgzip::enc::scan::<13, true, false>+0xc4>
   3bed0:	add	x1, x20, #0x894
   3bed4:	mov	x0, x19
   3bed8:	mov	x2, x21
   3bedc:	stur	w7, [x29, #-4]
   3bee0:	mov	x28, x30
   3bee4:	bl	5f20 <memcpy@plt>
   3bee8:	lsr	w8, w27, #9
   3beec:	ldur	w7, [x29, #-4]
   3bef0:	mov	x30, x28
   3bef4:	cmp	w8, #0x8
   3bef8:	b.hi	3c4bc <fastgzip::enc::scan::<13, true, false>+0x684>  // b.pmore
   3befc:	and	x28, x27, #0x7
   3bf00:	mov	x8, #0xffffffffffffffff    	// #-1
   3bf04:	ldrb	w9, [x26, x21]
   3bf08:	lsl	x8, x8, x28
   3bf0c:	bic	x27, x9, x8
   3bf10:	tbz	x30, #40, 3bf3c <fastgzip::enc::scan::<13, true, false>+0x104>
   3bf14:	tbnz	w7, #0, 3bf5c <fastgzip::enc::scan::<13, true, false>+0x124>
   3bf18:	subs	x8, x23, #0x9
   3bf1c:	csel	x8, xzr, x8, cc	// cc = lo, ul, last
   3bf20:	subs	x9, x23, #0xc
   3bf24:	csel	x9, xzr, x9, cc	// cc = lo, ul, last
   3bf28:	cbz	x24, 3bf88 <fastgzip::enc::scan::<13, true, false>+0x150>
   3bf2c:	cmp	x24, x8
   3bf30:	mov	w17, w28
   3bf34:	b.cs	3bf98 <fastgzip::enc::scan::<13, true, false>+0x160>  // b.hs, b.nlast
   3bf38:	b	3c124 <fastgzip::enc::scan::<13, true, false>+0x2ec>
   3bf3c:	cbz	x21, 3bf54 <fastgzip::enc::scan::<13, true, false>+0x11c>
   3bf40:	ldrb	w8, [x19]
   3bf44:	and	w8, w8, #0xfe
   3bf48:	strb	w8, [x19]
   3bf4c:	tbz	w7, #0, 3bf18 <fastgzip::enc::scan::<13, true, false>+0xe0>
   3bf50:	b	3bf5c <fastgzip::enc::scan::<13, true, false>+0x124>
   3bf54:	and	x27, x27, #0x7e
   3bf58:	tbz	w7, #0, 3bf18 <fastgzip::enc::scan::<13, true, false>+0xe0>
   3bf5c:	mov	x0, x25
   3bf60:	mov	w1, wzr
   3bf64:	mov	w2, #0x4000                	// #16384
   3bf68:	mov	x26, x30
   3bf6c:	bl	60e0 <memset@plt>
   3bf70:	mov	x30, x26
   3bf74:	subs	x8, x23, #0x9
   3bf78:	csel	x8, xzr, x8, cc	// cc = lo, ul, last
   3bf7c:	subs	x9, x23, #0xc
   3bf80:	csel	x9, xzr, x9, cc	// cc = lo, ul, last
   3bf84:	cbnz	x24, 3bf2c <fastgzip::enc::scan::<13, true, false>+0xf4>
   3bf88:	cmp	x8, #0x2
   3bf8c:	b.cs	3c0f0 <fastgzip::enc::scan::<13, true, false>+0x2b8>  // b.hs, b.nlast
   3bf90:	mov	x24, xzr
   3bf94:	mov	w17, w28
   3bf98:	add	x8, x24, #0x4
   3bf9c:	cmp	x8, x23
   3bfa0:	b.ls	3bfa8 <fastgzip::enc::scan::<13, true, false>+0x170>  // b.plast
   3bfa4:	b	3c038 <fastgzip::enc::scan::<13, true, false>+0x200>
   3bfa8:	add	x8, x22, #0x1
   3bfac:	add	x9, x8, x24
   3bfb0:	ldurb	w10, [x9, #-1]
   3bfb4:	ldrb	w11, [x9]
   3bfb8:	ldrb	w12, [x9, #1]
   3bfbc:	ldrb	w9, [x9, #2]
   3bfc0:	ldr	w10, [x20, x10, lsl #2]
   3bfc4:	ldr	w11, [x20, x11, lsl #2]
   3bfc8:	ldr	w12, [x20, x12, lsl #2]
   3bfcc:	ldr	w9, [x20, x9, lsl #2]
   3bfd0:	add	w13, w17, w10, lsr #16
   3bfd4:	and	x10, x10, #0xffff
   3bfd8:	lsl	x10, x10, x17
   3bfdc:	and	x15, x9, #0xffff
   3bfe0:	add	w14, w13, w11, lsr #16
   3bfe4:	and	x11, x11, #0xffff
   3bfe8:	lsl	x11, x11, x13
   3bfec:	and	x13, x12, #0xffff
   3bff0:	orr	x10, x10, x27
   3bff4:	add	w12, w14, w12, lsr #16
   3bff8:	lsl	x13, x13, x14
   3bffc:	orr	x10, x10, x11
   3c000:	lsl	x11, x15, x12
   3c004:	add	w9, w12, w9, lsr #16
   3c008:	orr	x10, x10, x13
   3c00c:	add	x13, x24, #0x8
   3c010:	add	x24, x24, #0x4
   3c014:	orr	x10, x10, x11
   3c018:	ubfx	w11, w9, #3, #3
   3c01c:	and	w12, w9, #0x38
   3c020:	lsr	x27, x10, x12
   3c024:	str	x10, [x19, x21]
   3c028:	cmp	x13, x23
   3c02c:	add	x21, x21, x11
   3c030:	and	w17, w9, #0xffff8007
   3c034:	b.ls	3bfac <fastgzip::enc::scan::<13, true, false>+0x174>  // b.plast
   3c038:	subs	x8, x23, x24
   3c03c:	b.ls	3c0d8 <fastgzip::enc::scan::<13, true, false>+0x2a0>  // b.plast
   3c040:	add	x9, x22, x24
   3c044:	ldrb	w10, [x9], #1
   3c048:	subs	x8, x8, #0x1
   3c04c:	ldr	w10, [x20, x10, lsl #2]
   3c050:	and	x11, x10, #0xffff
   3c054:	lsl	x11, x11, x17
   3c058:	add	w17, w17, w10, lsr #16
   3c05c:	orr	x27, x11, x27
   3c060:	b.ne	3c044 <fastgzip::enc::scan::<13, true, false>+0x20c>  // b.any
   3c064:	ubfx	w8, w17, #3, #3
   3c068:	and	w9, w17, #0xffff8007
   3c06c:	str	x27, [x19, x21]
   3c070:	add	x8, x21, x8
   3c074:	tbz	x30, #48, 3c0a8 <fastgzip::enc::scan::<13, true, false>+0x270>
   3c078:	ldr	w10, [x20, #2060]
   3c07c:	and	w11, w17, #0x38
   3c080:	and	w13, w17, #0x7
   3c084:	add	w9, w9, w10, lsr #16
   3c088:	and	x12, x10, #0xffff
   3c08c:	lsr	x10, x27, x11
   3c090:	lsl	x11, x12, x13
   3c094:	ubfx	w12, w9, #3, #3
   3c098:	and	w9, w9, #0xffff8007
   3c09c:	orr	x10, x11, x10
   3c0a0:	str	x10, [x19, x8]
   3c0a4:	add	x8, x8, x12
   3c0a8:	lsl	x8, x8, #3
   3c0ac:	cmp	w9, #0x7
   3c0b0:	add	x8, x8, w9, uxtw
   3c0b4:	csel	x0, xzr, x8, hi	// hi = pmore
   3c0b8:	ldp	x20, x19, [sp, #96]
   3c0bc:	ldp	x22, x21, [sp, #80]
   3c0c0:	ldp	x24, x23, [sp, #64]
   3c0c4:	ldp	x26, x25, [sp, #48]
   3c0c8:	ldp	x28, x27, [sp, #32]
   3c0cc:	ldp	x29, x30, [sp, #16]
   3c0d0:	add	sp, sp, #0x70
   3c0d4:	ret
   3c0d8:	ubfx	w8, w17, #3, #3
   3c0dc:	and	w9, w17, #0xffff8007
   3c0e0:	str	x27, [x19, x21]
   3c0e4:	add	x8, x21, x8
   3c0e8:	tbnz	x30, #48, 3c078 <fastgzip::enc::scan::<13, true, false>+0x240>
   3c0ec:	b	3c0a8 <fastgzip::enc::scan::<13, true, false>+0x270>
   3c0f0:	ldrb	w10, [x22]
   3c0f4:	mov	w24, #0x1                   	// #1
   3c0f8:	ldr	w10, [x20, x10, lsl #2]
   3c0fc:	and	x11, x10, #0xffff
   3c100:	add	w10, w28, w10, lsr #16
   3c104:	lsl	x11, x11, x28
   3c108:	ubfx	w12, w10, #3, #3
   3c10c:	and	w13, w10, #0x38
   3c110:	and	w28, w10, #0xffff8007
   3c114:	orr	x11, x11, x27
   3c118:	str	x11, [x19, x21]
   3c11c:	lsr	x27, x11, x13
   3c120:	add	x21, x21, x12
   3c124:	mov	x10, #0x87000000            	// #2264924160
   3c128:	ldr	x16, [x22, x24]
   3c12c:	add	x11, x20, #0x400
   3c130:	movk	x10, #0xebca, lsl #32
   3c134:	add	x12, x20, #0x810
   3c138:	mov	w13, #0x102                 	// #258
   3c13c:	movk	x10, #0xb185, lsl #48
   3c140:	mov	w14, #0x1e                  	// #30
   3c144:	mov	w15, #0xffffffff            	// #-1
   3c148:	mov	w17, w28
   3c14c:	mul	x16, x16, x10
   3c150:	cmp	x24, x9
   3c154:	lsr	x16, x16, #51
   3c158:	b.cs	3c284 <fastgzip::enc::scan::<13, true, false>+0x44c>  // b.hs, b.nlast
   3c15c:	ldr	x18, [x22, x24]
   3c160:	lsr	x0, x18, #8
   3c164:	mul	x1, x0, x10
   3c168:	ldrh	w0, [x25, x16, lsl #1]
   3c16c:	strh	w24, [x25, x16, lsl #1]
   3c170:	ldr	x2, [x22, x0]
   3c174:	lsr	x16, x1, #51
   3c178:	eor	x1, x2, x18
   3c17c:	cbz	w1, 3c2fc <fastgzip::enc::scan::<13, true, false>+0x4c4>
   3c180:	add	x2, x22, x24
   3c184:	and	x0, x18, #0xff
   3c188:	add	w6, w24, #0x1
   3c18c:	ldur	x18, [x2, #1]
   3c190:	ldr	w3, [x20, x0, lsl #2]
   3c194:	ldrh	w0, [x25, x16, lsl #1]
   3c198:	strh	w6, [x25, x16, lsl #1]
   3c19c:	lsr	x1, x18, #8
   3c1a0:	and	x4, x3, #0xffff
   3c1a4:	ldr	x5, [x22, x0]
   3c1a8:	lsl	x4, x4, x17
   3c1ac:	add	w17, w17, w3, lsr #16
   3c1b0:	mul	x1, x1, x10
   3c1b4:	orr	x27, x4, x27
   3c1b8:	lsr	x16, x1, #51
   3c1bc:	eor	x1, x5, x18
   3c1c0:	cbz	w1, 3c410 <fastgzip::enc::scan::<13, true, false>+0x5d8>
   3c1c4:	and	x0, x18, #0xff
   3c1c8:	ldur	x18, [x2, #2]
   3c1cc:	ldr	w2, [x20, x0, lsl #2]
   3c1d0:	ldrh	w0, [x25, x16, lsl #1]
   3c1d4:	lsr	x1, x18, #8
   3c1d8:	and	x3, x2, #0xffff
   3c1dc:	ldr	x4, [x22, x0]
   3c1e0:	mul	x1, x1, x10
   3c1e4:	lsl	x3, x3, x17
   3c1e8:	add	w17, w17, w2, lsr #16
   3c1ec:	add	w2, w24, #0x2
   3c1f0:	strh	w2, [x25, x16, lsl #1]
   3c1f4:	orr	x27, x3, x27
   3c1f8:	lsr	x16, x1, #51
   3c1fc:	eor	x1, x4, x18
   3c200:	cbz	w1, 3c41c <fastgzip::enc::scan::<13, true, false>+0x5e4>
   3c204:	add	x0, x22, x24
   3c208:	and	x1, x18, #0xff
   3c20c:	add	w5, w24, #0x3
   3c210:	ldur	x18, [x0, #3]
   3c214:	ldr	w1, [x20, x1, lsl #2]
   3c218:	lsr	x0, x18, #8
   3c21c:	and	x3, x1, #0xffff
   3c220:	lsl	x3, x3, x17
   3c224:	add	w17, w17, w1, lsr #16
   3c228:	mul	x2, x0, x10
   3c22c:	ldrh	w0, [x25, x16, lsl #1]
   3c230:	strh	w5, [x25, x16, lsl #1]
   3c234:	orr	x27, x3, x27
   3c238:	ldr	x4, [x22, x0]
   3c23c:	eor	x1, x4, x18
   3c240:	lsr	x16, x2, #51
   3c244:	cbz	w1, 3c428 <fastgzip::enc::scan::<13, true, false>+0x5f0>
   3c248:	and	x18, x18, #0xff
   3c24c:	add	x24, x24, #0x4
   3c250:	ldr	w18, [x20, x18, lsl #2]
   3c254:	cmp	x24, x9
   3c258:	and	x0, x18, #0xffff
   3c25c:	lsl	x0, x0, x17
   3c260:	add	w17, w17, w18, lsr #16
   3c264:	orr	x18, x0, x27
   3c268:	ubfx	w0, w17, #3, #3
   3c26c:	and	w1, w17, #0x38
   3c270:	lsr	x27, x18, x1
   3c274:	str	x18, [x19, x21]
   3c278:	and	w17, w17, #0xffff8007
   3c27c:	add	x21, x21, x0
   3c280:	b.cc	3c15c <fastgzip::enc::scan::<13, true, false>+0x324>  // b.lo, b.ul, b.last
   3c284:	cmp	x24, x8
   3c288:	mov	w2, w17
   3c28c:	b.cs	3bf98 <fastgzip::enc::scan::<13, true, false>+0x160>  // b.hs, b.nlast
   3c290:	ldr	x18, [x22, x24]
   3c294:	ldrh	w0, [x25, x16, lsl #1]
   3c298:	strh	w24, [x25, x16, lsl #1]
   3c29c:	lsr	x17, x18, #8
   3c2a0:	ldr	x1, [x22, x0]
   3c2a4:	mul	x17, x17, x10
   3c2a8:	eor	x1, x1, x18
   3c2ac:	lsr	x16, x17, #51
   3c2b0:	cbz	w1, 3c2f8 <fastgzip::enc::scan::<13, true, false>+0x4c0>
   3c2b4:	and	x17, x18, #0xff
   3c2b8:	add	x24, x24, #0x1
   3c2bc:	ldr	w17, [x20, x17, lsl #2]
   3c2c0:	cmp	x24, x8
   3c2c4:	and	x18, x17, #0xffff
   3c2c8:	add	w17, w2, w17, lsr #16
   3c2cc:	lsl	x18, x18, x2
   3c2d0:	ubfx	w0, w17, #3, #3
   3c2d4:	and	w1, w17, #0x38
   3c2d8:	and	w17, w17, #0xffff8007
   3c2dc:	orr	x18, x18, x27
   3c2e0:	str	x18, [x19, x21]
   3c2e4:	lsr	x27, x18, x1
   3c2e8:	add	x21, x21, x0
   3c2ec:	mov	w2, w17
   3c2f0:	b.cc	3c290 <fastgzip::enc::scan::<13, true, false>+0x458>  // b.lo, b.ul, b.last
   3c2f4:	b	3bf98 <fastgzip::enc::scan::<13, true, false>+0x160>
   3c2f8:	mov	w17, w2
   3c2fc:	cbz	x1, 3c430 <fastgzip::enc::scan::<13, true, false>+0x5f8>
   3c300:	rbit	x1, x1
   3c304:	clz	x1, x1
   3c308:	lsr	x1, x1, #3
   3c30c:	mvn	w0, w0
   3c310:	add	w0, w0, w24
   3c314:	cmp	w0, #0x2
   3c318:	clz	w2, w0
   3c31c:	mov	w3, w0
   3c320:	b.cc	3c338 <fastgzip::enc::scan::<13, true, false>+0x500>  // b.lo, b.ul, b.last
   3c324:	sub	w3, w14, w2
   3c328:	lsr	w3, w0, w3
   3c32c:	and	w3, w3, #0x1
   3c330:	sub	w3, w3, w2, lsl #1
   3c334:	add	w3, w3, #0x3e
   3c338:	ldr	w4, [x11, x1, lsl #2]
   3c33c:	subs	w2, w14, w2
   3c340:	ldr	w3, [x12, w3, uxtw #2]
   3c344:	csel	w2, wzr, w2, cc	// cc = lo, ul, last
   3c348:	lsr	x18, x18, #16
   3c34c:	and	w6, w17, #0x38
   3c350:	ubfx	x5, x4, #19, #5
   3c354:	lsl	w7, w15, w2
   3c358:	and	x26, x3, #0xffff
   3c35c:	and	x4, x4, #0x7ffff
   3c360:	mul	x18, x18, x10
   3c364:	lsr	x6, x27, x6
   3c368:	add	w3, w5, w3, lsr #16
   3c36c:	bic	w0, w0, w7
   3c370:	lsl	x5, x26, x5
   3c374:	ubfx	w7, w17, #3, #3
   3c378:	str	x27, [x19, x21]
   3c37c:	lsl	x0, x0, x3
   3c380:	orr	x4, x5, x4
   3c384:	and	w5, w17, #0xffff8007
   3c388:	and	w17, w17, #0x7
   3c38c:	add	w2, w2, w5
   3c390:	add	w5, w24, #0x2
   3c394:	orr	x0, x4, x0
   3c398:	add	w4, w24, #0x1
   3c39c:	add	x24, x1, x24
   3c3a0:	lsl	x17, x0, x17
   3c3a4:	add	w1, w2, w3
   3c3a8:	lsr	x18, x18, #50
   3c3ac:	and	w2, w1, #0x38
   3c3b0:	ubfx	w3, w1, #3, #3
   3c3b4:	add	x0, x21, x7
   3c3b8:	orr	x17, x17, x6
   3c3bc:	str	x17, [x19, x0]
   3c3c0:	cmp	x24, x8
   3c3c4:	lsr	x27, x17, x2
   3c3c8:	strh	w4, [x25, x16, lsl #1]
   3c3cc:	and	x16, x18, #0x3ffe
   3c3d0:	add	x21, x0, x3
   3c3d4:	and	w17, w1, #0xffff8007
   3c3d8:	strh	w5, [x25, x16]
   3c3dc:	b.cs	3bf98 <fastgzip::enc::scan::<13, true, false>+0x160>  // b.hs, b.nlast
   3c3e0:	sub	x18, x24, #0x1
   3c3e4:	ldr	x16, [x22, x18]
   3c3e8:	mul	x0, x16, x10
   3c3ec:	lsr	x16, x16, #8
   3c3f0:	lsr	x0, x0, #50
   3c3f4:	and	x0, x0, #0x3ffe
   3c3f8:	strh	w18, [x25, x0]
   3c3fc:	mul	x16, x16, x10
   3c400:	cmp	x24, x9
   3c404:	lsr	x16, x16, #51
   3c408:	b.cc	3c15c <fastgzip::enc::scan::<13, true, false>+0x324>  // b.lo, b.ul, b.last
   3c40c:	b	3c284 <fastgzip::enc::scan::<13, true, false>+0x44c>
   3c410:	add	x24, x24, #0x1
   3c414:	cbnz	x1, 3c300 <fastgzip::enc::scan::<13, true, false>+0x4c8>
   3c418:	b	3c430 <fastgzip::enc::scan::<13, true, false>+0x5f8>
   3c41c:	add	x24, x24, #0x2
   3c420:	cbnz	x1, 3c300 <fastgzip::enc::scan::<13, true, false>+0x4c8>
   3c424:	b	3c430 <fastgzip::enc::scan::<13, true, false>+0x5f8>
   3c428:	add	x24, x24, #0x3
   3c42c:	cbnz	x1, 3c300 <fastgzip::enc::scan::<13, true, false>+0x4c8>
   3c430:	sub	x1, x23, x24
   3c434:	add	x3, x22, x24
   3c438:	add	x4, x22, x0
   3c43c:	cmp	x1, #0x102
   3c440:	csel	x2, x1, x13, cc	// cc = lo, ul, last
   3c444:	cmp	x1, #0x10
   3c448:	b.cs	3c454 <fastgzip::enc::scan::<13, true, false>+0x61c>  // b.hs, b.nlast
   3c44c:	mov	w1, #0x8                   	// #8
   3c450:	b	3c47c <fastgzip::enc::scan::<13, true, false>+0x644>
   3c454:	mov	w5, #0x8                   	// #8
   3c458:	ldr	x1, [x3, x5]
   3c45c:	ldr	x6, [x4, x5]
   3c460:	cmp	x1, x6
   3c464:	b.ne	3c4a8 <fastgzip::enc::scan::<13, true, false>+0x670>  // b.any
   3c468:	add	x6, x5, #0x10
   3c46c:	add	x1, x5, #0x8
   3c470:	cmp	x6, x2
   3c474:	mov	x5, x1
   3c478:	b.ls	3c458 <fastgzip::enc::scan::<13, true, false>+0x620>  // b.plast
   3c47c:	cmp	x1, x2
   3c480:	b.cs	3c30c <fastgzip::enc::scan::<13, true, false>+0x4d4>  // b.hs, b.nlast
   3c484:	ldrb	w5, [x3, x1]
   3c488:	ldrb	w6, [x4, x1]
   3c48c:	cmp	w5, w6
   3c490:	b.ne	3c30c <fastgzip::enc::scan::<13, true, false>+0x4d4>  // b.any
   3c494:	add	x1, x1, #0x1
   3c498:	cmp	x2, x1
   3c49c:	b.ne	3c484 <fastgzip::enc::scan::<13, true, false>+0x64c>  // b.any
   3c4a0:	mov	x1, x2
   3c4a4:	b	3c30c <fastgzip::enc::scan::<13, true, false>+0x4d4>
   3c4a8:	eor	x1, x6, x1
   3c4ac:	rbit	x1, x1
   3c4b0:	clz	x1, x1
   3c4b4:	add	x1, x5, x1, lsr #3
   3c4b8:	b	3c30c <fastgzip::enc::scan::<13, true, false>+0x4d4>
   3c4bc:	adrp	x2, bd000 <anon.7a263ad2a3e00f1d3c23c4bfb0e9541b.29.llvm.2438094699631020562+0x58>
   3c4c0:	add	x2, x2, #0x638
   3c4c4:	mov	x0, x21
   3c4c8:	mov	w1, #0x240                 	// #576
   3c4cc:	bl	dd98 <core::panicking::panic_bounds_check>
