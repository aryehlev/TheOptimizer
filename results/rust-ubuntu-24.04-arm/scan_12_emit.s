000000000001efc8 <gzhot::enc::scan::<12, true, false>>:
   1efc8:	stp	x29, x30, [sp, #-96]!
   1efcc:	str	x27, [sp, #16]
   1efd0:	stp	x26, x25, [sp, #32]
   1efd4:	stp	x24, x23, [sp, #48]
   1efd8:	stp	x22, x21, [sp, #64]
   1efdc:	stp	x20, x19, [sp, #80]
   1efe0:	mov	x29, sp
   1efe4:	ldr	w25, [x0, #2192]
   1efe8:	mov	x19, x6
   1efec:	mov	x23, x5
   1eff0:	mov	x22, x4
   1eff4:	mov	x21, x0
   1eff8:	mov	x24, x1
   1effc:	lsr	x20, x25, #3
   1f000:	cmp	w25, #0x3ff
   1f004:	add	x27, x0, #0x894
   1f008:	b.hi	1f030 <gzhot::enc::scan::<12, true, false>+0x68>  // b.pmore
   1f00c:	ldp	q0, q1, [x27, #64]
   1f010:	stp	q0, q1, [x19, #64]
   1f014:	ldp	q0, q2, [x27, #96]
   1f018:	stp	q0, q2, [x19, #96]
   1f01c:	ldp	q1, q0, [x27]
   1f020:	stp	q1, q0, [x19]
   1f024:	ldp	q2, q0, [x27, #32]
   1f028:	stp	q2, q0, [x19, #32]
   1f02c:	b	1f04c <gzhot::enc::scan::<12, true, false>+0x84>
   1f030:	add	x1, x21, #0x894
   1f034:	mov	x0, x19
   1f038:	mov	x2, x20
   1f03c:	bl	6e00 <memcpy@plt>
   1f040:	lsr	w8, w25, #9
   1f044:	cmp	w8, #0x8
   1f048:	b.hi	1f5cc <gzhot::enc::scan::<12, true, false>+0x604>  // b.pmore
   1f04c:	and	x26, x25, #0x7
   1f050:	mov	x8, #0xffffffffffffffff    	// #-1
   1f054:	ldrb	w10, [x27, x20]
   1f058:	lsl	x8, x8, x26
   1f05c:	ldrb	w9, [x29, #96]
   1f060:	bic	x25, x10, x8
   1f064:	tbnz	w9, #0, 1f080 <gzhot::enc::scan::<12, true, false>+0xb8>
   1f068:	cbz	x20, 1f07c <gzhot::enc::scan::<12, true, false>+0xb4>
   1f06c:	ldrb	w8, [x19]
   1f070:	and	w8, w8, #0xfe
   1f074:	strb	w8, [x19]
   1f078:	b	1f080 <gzhot::enc::scan::<12, true, false>+0xb8>
   1f07c:	and	x25, x25, #0x7e
   1f080:	mov	x0, x24
   1f084:	mov	w1, wzr
   1f088:	mov	w2, #0x2000                	// #8192
   1f08c:	bl	71c0 <memset@plt>
   1f090:	subs	x8, x23, #0x9
   1f094:	csel	x10, xzr, x8, cc	// cc = lo, ul, last
   1f098:	subs	x8, x23, #0xc
   1f09c:	csel	x11, xzr, x8, cc	// cc = lo, ul, last
   1f0a0:	cmp	x10, #0x1
   1f0a4:	b.hi	1f0c4 <gzhot::enc::scan::<12, true, false>+0xfc>  // b.pmore
   1f0a8:	mov	x9, xzr
   1f0ac:	mov	w8, wzr
   1f0b0:	mov	w0, w26
   1f0b4:	add	x10, x9, #0x4
   1f0b8:	cmp	x10, x23
   1f0bc:	b.ls	1f494 <gzhot::enc::scan::<12, true, false>+0x4cc>  // b.plast
   1f0c0:	b	1f528 <gzhot::enc::scan::<12, true, false>+0x560>
   1f0c4:	ldrb	w8, [x22]
   1f0c8:	mov	x12, #0x87000000            	// #2264924160
   1f0cc:	ldur	x18, [x22, #1]
   1f0d0:	movk	x12, #0xebca, lsl #32
   1f0d4:	mov	w15, #0x102                 	// #258
   1f0d8:	mov	w16, #0x1e                  	// #30
   1f0dc:	ldr	w8, [x21, x8, lsl #2]
   1f0e0:	movk	x12, #0xb185, lsl #48
   1f0e4:	mov	w17, #0xffffffff            	// #-1
   1f0e8:	and	x9, x8, #0xffff
   1f0ec:	add	w8, w26, w8, lsr #16
   1f0f0:	lsl	x9, x9, x26
   1f0f4:	ubfx	w13, w8, #3, #3
   1f0f8:	and	w14, w8, #0x38
   1f0fc:	and	w0, w8, #0x7
   1f100:	orr	x9, x9, x25
   1f104:	str	x9, [x19, x20]
   1f108:	lsr	x25, x9, x14
   1f10c:	add	x20, x20, x13
   1f110:	add	x13, x21, #0x400
   1f114:	add	x14, x21, #0x810
   1f118:	mov	w9, #0x1                   	// #1
   1f11c:	mul	x18, x18, x12
   1f120:	cmp	x9, x11
   1f124:	lsr	x18, x18, #52
   1f128:	b.cs	1f258 <gzhot::enc::scan::<12, true, false>+0x290>  // b.hs, b.nlast
   1f12c:	ldr	x1, [x22, x9]
   1f130:	lsr	x2, x1, #8
   1f134:	mul	x3, x2, x12
   1f138:	ldrh	w2, [x24, x18, lsl #1]
   1f13c:	strh	w9, [x24, x18, lsl #1]
   1f140:	ldr	x4, [x22, x2]
   1f144:	lsr	x18, x3, #52
   1f148:	eor	x3, x4, x1
   1f14c:	cbz	w3, 1f2d4 <gzhot::enc::scan::<12, true, false>+0x30c>
   1f150:	add	x4, x22, x9
   1f154:	and	x2, x1, #0xff
   1f158:	add	w26, w9, #0x1
   1f15c:	ldur	x1, [x4, #1]
   1f160:	ldr	w5, [x21, x2, lsl #2]
   1f164:	ldrh	w2, [x24, x18, lsl #1]
   1f168:	strh	w26, [x24, x18, lsl #1]
   1f16c:	lsr	x3, x1, #8
   1f170:	and	x6, x5, #0xffff
   1f174:	ldr	x7, [x22, x2]
   1f178:	lsl	x6, x6, x0
   1f17c:	add	w0, w0, w5, lsr #16
   1f180:	mul	x3, x3, x12
   1f184:	orr	x25, x6, x25
   1f188:	lsr	x18, x3, #52
   1f18c:	eor	x3, x7, x1
   1f190:	cbz	w3, 1f3e8 <gzhot::enc::scan::<12, true, false>+0x420>
   1f194:	and	x2, x1, #0xff
   1f198:	ldur	x1, [x4, #2]
   1f19c:	ldr	w4, [x21, x2, lsl #2]
   1f1a0:	ldrh	w2, [x24, x18, lsl #1]
   1f1a4:	lsr	x3, x1, #8
   1f1a8:	and	x5, x4, #0xffff
   1f1ac:	ldr	x6, [x22, x2]
   1f1b0:	mul	x3, x3, x12
   1f1b4:	lsl	x5, x5, x0
   1f1b8:	add	w0, w0, w4, lsr #16
   1f1bc:	add	w4, w9, #0x2
   1f1c0:	strh	w4, [x24, x18, lsl #1]
   1f1c4:	orr	x25, x5, x25
   1f1c8:	lsr	x18, x3, #52
   1f1cc:	eor	x3, x6, x1
   1f1d0:	cbz	w3, 1f3f4 <gzhot::enc::scan::<12, true, false>+0x42c>
   1f1d4:	add	x2, x22, x9
   1f1d8:	and	x3, x1, #0xff
   1f1dc:	add	w7, w9, #0x3
   1f1e0:	ldur	x1, [x2, #3]
   1f1e4:	ldr	w3, [x21, x3, lsl #2]
   1f1e8:	lsr	x2, x1, #8
   1f1ec:	and	x5, x3, #0xffff
   1f1f0:	lsl	x5, x5, x0
   1f1f4:	add	w0, w0, w3, lsr #16
   1f1f8:	mul	x4, x2, x12
   1f1fc:	ldrh	w2, [x24, x18, lsl #1]
   1f200:	strh	w7, [x24, x18, lsl #1]
   1f204:	orr	x25, x5, x25
   1f208:	ldr	x6, [x22, x2]
   1f20c:	eor	x3, x6, x1
   1f210:	lsr	x18, x4, #52
   1f214:	cbz	w3, 1f400 <gzhot::enc::scan::<12, true, false>+0x438>
   1f218:	and	x1, x1, #0xff
   1f21c:	add	x9, x9, #0x4
   1f220:	ldr	w1, [x21, x1, lsl #2]
   1f224:	cmp	x9, x11
   1f228:	and	x2, x1, #0xffff
   1f22c:	lsl	x2, x2, x0
   1f230:	add	w0, w0, w1, lsr #16
   1f234:	orr	x1, x2, x25
   1f238:	ubfx	w2, w0, #3, #3
   1f23c:	and	w3, w0, #0x38
   1f240:	lsr	x25, x1, x3
   1f244:	str	x1, [x19, x20]
   1f248:	orr	w8, w0, w8
   1f24c:	add	x20, x20, x2
   1f250:	and	w0, w0, #0x7
   1f254:	b.cc	1f12c <gzhot::enc::scan::<12, true, false>+0x164>  // b.lo, b.ul, b.last
   1f258:	cmp	x9, x10
   1f25c:	mov	w4, w0
   1f260:	b.cs	1f0b4 <gzhot::enc::scan::<12, true, false>+0xec>  // b.hs, b.nlast
   1f264:	ldr	x1, [x22, x9]
   1f268:	ldrh	w2, [x24, x18, lsl #1]
   1f26c:	strh	w9, [x24, x18, lsl #1]
   1f270:	lsr	x0, x1, #8
   1f274:	ldr	x3, [x22, x2]
   1f278:	mul	x0, x0, x12
   1f27c:	eor	x3, x3, x1
   1f280:	lsr	x18, x0, #52
   1f284:	cbz	w3, 1f2d0 <gzhot::enc::scan::<12, true, false>+0x308>
   1f288:	and	x0, x1, #0xff
   1f28c:	add	x9, x9, #0x1
   1f290:	ldr	w0, [x21, x0, lsl #2]
   1f294:	cmp	x9, x10
   1f298:	and	x1, x0, #0xffff
   1f29c:	add	w2, w4, w0, lsr #16
   1f2a0:	lsl	x1, x1, x4
   1f2a4:	and	w3, w2, #0x38
   1f2a8:	orr	w8, w2, w8
   1f2ac:	orr	x0, x1, x25
   1f2b0:	ubfx	w1, w2, #3, #3
   1f2b4:	str	x0, [x19, x20]
   1f2b8:	lsr	x25, x0, x3
   1f2bc:	and	w0, w2, #0x7
   1f2c0:	add	x20, x20, x1
   1f2c4:	mov	w4, w0
   1f2c8:	b.cc	1f264 <gzhot::enc::scan::<12, true, false>+0x29c>  // b.lo, b.ul, b.last
   1f2cc:	b	1f0b4 <gzhot::enc::scan::<12, true, false>+0xec>
   1f2d0:	mov	w0, w4
   1f2d4:	cbz	x3, 1f408 <gzhot::enc::scan::<12, true, false>+0x440>
   1f2d8:	rbit	x3, x3
   1f2dc:	clz	x3, x3
   1f2e0:	lsr	x3, x3, #3
   1f2e4:	mvn	w2, w2
   1f2e8:	add	w4, w2, w9
   1f2ec:	clz	w6, w4
   1f2f0:	mov	w5, w4
   1f2f4:	subs	w7, w16, w6
   1f2f8:	csel	w2, wzr, w7, cc	// cc = lo, ul, last
   1f2fc:	cmp	w4, #0x2
   1f300:	b.cc	1f314 <gzhot::enc::scan::<12, true, false>+0x34c>  // b.lo, b.ul, b.last
   1f304:	lsr	w5, w4, w7
   1f308:	and	w5, w5, #0x1
   1f30c:	sub	w5, w5, w6, lsl #1
   1f310:	add	w5, w5, #0x3e
   1f314:	ldr	w6, [x13, x3, lsl #2]
   1f318:	ldr	w5, [x14, w5, uxtw #2]
   1f31c:	lsl	w7, w17, w2
   1f320:	and	w27, w0, #0x38
   1f324:	str	x25, [x19, x20]
   1f328:	lsr	x1, x1, #16
   1f32c:	ubfx	x26, x6, #19, #5
   1f330:	lsr	x25, x25, x27
   1f334:	and	x27, x5, #0xffff
   1f338:	bic	w4, w4, w7
   1f33c:	and	x6, x6, #0x7ffff
   1f340:	mul	x1, x1, x12
   1f344:	add	w5, w26, w5, lsr #16
   1f348:	lsl	x7, x27, x26
   1f34c:	orr	w8, w0, w8
   1f350:	ubfx	w26, w0, #3, #3
   1f354:	and	w0, w0, #0x7
   1f358:	lsl	x4, x4, x5
   1f35c:	orr	x6, x7, x6
   1f360:	add	w2, w2, w0
   1f364:	add	w2, w2, w5
   1f368:	add	w7, w9, #0x1
   1f36c:	strh	w7, [x24, x18, lsl #1]
   1f370:	orr	x4, x6, x4
   1f374:	lsr	x1, x1, #51
   1f378:	ubfx	w5, w2, #3, #3
   1f37c:	lsl	x0, x4, x0
   1f380:	and	w4, w2, #0x38
   1f384:	add	w6, w9, #0x2
   1f388:	add	x9, x3, x9
   1f38c:	add	x3, x20, x26
   1f390:	orr	w8, w8, w2
   1f394:	orr	x0, x0, x25
   1f398:	str	x0, [x19, x3]
   1f39c:	and	x18, x1, #0x1ffe
   1f3a0:	lsr	x25, x0, x4
   1f3a4:	cmp	x9, x10
   1f3a8:	add	x20, x3, x5
   1f3ac:	and	w0, w2, #0x7
   1f3b0:	strh	w6, [x24, x18]
   1f3b4:	b.cs	1f0b4 <gzhot::enc::scan::<12, true, false>+0xec>  // b.hs, b.nlast
   1f3b8:	sub	x1, x9, #0x1
   1f3bc:	ldr	x18, [x22, x1]
   1f3c0:	mul	x2, x18, x12
   1f3c4:	lsr	x18, x18, #8
   1f3c8:	lsr	x2, x2, #51
   1f3cc:	and	x2, x2, #0x1ffe
   1f3d0:	strh	w1, [x24, x2]
   1f3d4:	mul	x18, x18, x12
   1f3d8:	cmp	x9, x11
   1f3dc:	lsr	x18, x18, #52
   1f3e0:	b.cc	1f12c <gzhot::enc::scan::<12, true, false>+0x164>  // b.lo, b.ul, b.last
   1f3e4:	b	1f258 <gzhot::enc::scan::<12, true, false>+0x290>
   1f3e8:	add	x9, x9, #0x1
   1f3ec:	cbnz	x3, 1f2d8 <gzhot::enc::scan::<12, true, false>+0x310>
   1f3f0:	b	1f408 <gzhot::enc::scan::<12, true, false>+0x440>
   1f3f4:	add	x9, x9, #0x2
   1f3f8:	cbnz	x3, 1f2d8 <gzhot::enc::scan::<12, true, false>+0x310>
   1f3fc:	b	1f408 <gzhot::enc::scan::<12, true, false>+0x440>
   1f400:	add	x9, x9, #0x3
   1f404:	cbnz	x3, 1f2d8 <gzhot::enc::scan::<12, true, false>+0x310>
   1f408:	sub	x3, x23, x9
   1f40c:	add	x5, x22, x9
   1f410:	add	x6, x22, x2
   1f414:	cmp	x3, #0x102
   1f418:	csel	x4, x3, x15, cc	// cc = lo, ul, last
   1f41c:	cmp	x3, #0x10
   1f420:	b.cs	1f42c <gzhot::enc::scan::<12, true, false>+0x464>  // b.hs, b.nlast
   1f424:	mov	w3, #0x8                   	// #8
   1f428:	b	1f454 <gzhot::enc::scan::<12, true, false>+0x48c>
   1f42c:	mov	w7, #0x8                   	// #8
   1f430:	ldr	x3, [x5, x7]
   1f434:	ldr	x26, [x6, x7]
   1f438:	cmp	x3, x26
   1f43c:	b.ne	1f480 <gzhot::enc::scan::<12, true, false>+0x4b8>  // b.any
   1f440:	add	x26, x7, #0x10
   1f444:	add	x3, x7, #0x8
   1f448:	cmp	x26, x4
   1f44c:	mov	x7, x3
   1f450:	b.ls	1f430 <gzhot::enc::scan::<12, true, false>+0x468>  // b.plast
   1f454:	cmp	x3, x4
   1f458:	b.cs	1f2e4 <gzhot::enc::scan::<12, true, false>+0x31c>  // b.hs, b.nlast
   1f45c:	ldrb	w7, [x5, x3]
   1f460:	ldrb	w26, [x6, x3]
   1f464:	cmp	w7, w26
   1f468:	b.ne	1f2e4 <gzhot::enc::scan::<12, true, false>+0x31c>  // b.any
   1f46c:	add	x3, x3, #0x1
   1f470:	cmp	x4, x3
   1f474:	b.ne	1f45c <gzhot::enc::scan::<12, true, false>+0x494>  // b.any
   1f478:	mov	x3, x4
   1f47c:	b	1f2e4 <gzhot::enc::scan::<12, true, false>+0x31c>
   1f480:	eor	x3, x26, x3
   1f484:	rbit	x3, x3
   1f488:	clz	x3, x3
   1f48c:	add	x3, x7, x3, lsr #3
   1f490:	b	1f2e4 <gzhot::enc::scan::<12, true, false>+0x31c>
   1f494:	add	x10, x22, #0x1
   1f498:	add	x11, x10, x9
   1f49c:	ldurb	w12, [x11, #-1]
   1f4a0:	ldrb	w13, [x11]
   1f4a4:	ldrb	w14, [x11, #1]
   1f4a8:	ldrb	w11, [x11, #2]
   1f4ac:	ldr	w12, [x21, x12, lsl #2]
   1f4b0:	ldr	w13, [x21, x13, lsl #2]
   1f4b4:	ldr	w14, [x21, x14, lsl #2]
   1f4b8:	ldr	w11, [x21, x11, lsl #2]
   1f4bc:	add	w15, w0, w12, lsr #16
   1f4c0:	and	x12, x12, #0xffff
   1f4c4:	lsl	x12, x12, x0
   1f4c8:	and	x17, x11, #0xffff
   1f4cc:	add	w16, w15, w13, lsr #16
   1f4d0:	and	x13, x13, #0xffff
   1f4d4:	lsl	x13, x13, x15
   1f4d8:	and	x15, x14, #0xffff
   1f4dc:	orr	x12, x12, x25
   1f4e0:	add	w14, w16, w14, lsr #16
   1f4e4:	lsl	x15, x15, x16
   1f4e8:	orr	x12, x12, x13
   1f4ec:	lsl	x13, x17, x14
   1f4f0:	add	w11, w14, w11, lsr #16
   1f4f4:	orr	x12, x12, x15
   1f4f8:	add	x15, x9, #0x8
   1f4fc:	add	x9, x9, #0x4
   1f500:	orr	x12, x12, x13
   1f504:	ubfx	w13, w11, #3, #3
   1f508:	and	w14, w11, #0x38
   1f50c:	lsr	x25, x12, x14
   1f510:	str	x12, [x19, x20]
   1f514:	orr	w8, w11, w8
   1f518:	cmp	x15, x23
   1f51c:	add	x20, x20, x13
   1f520:	and	w0, w11, #0x7
   1f524:	b.ls	1f498 <gzhot::enc::scan::<12, true, false>+0x4d0>  // b.plast
   1f528:	subs	x10, x23, x9
   1f52c:	b.ls	1f558 <gzhot::enc::scan::<12, true, false>+0x590>  // b.plast
   1f530:	add	x9, x22, x9
   1f534:	ldrb	w11, [x9], #1
   1f538:	subs	x10, x10, #0x1
   1f53c:	ldr	w11, [x21, x11, lsl #2]
   1f540:	and	x12, x11, #0xffff
   1f544:	lsl	x12, x12, x0
   1f548:	add	w0, w0, w11, lsr #16
   1f54c:	orr	x25, x12, x25
   1f550:	b.ne	1f534 <gzhot::enc::scan::<12, true, false>+0x56c>  // b.any
   1f554:	b	1f558 <gzhot::enc::scan::<12, true, false>+0x590>
   1f558:	ldr	w9, [x21, #2060]
   1f55c:	and	w10, w0, #0x7
   1f560:	orr	w11, w0, w8
   1f564:	ubfx	w12, w0, #3, #3
   1f568:	and	w13, w0, #0x38
   1f56c:	str	x25, [x19, x20]
   1f570:	add	w8, w10, w9, lsr #16
   1f574:	and	x9, x9, #0xffff
   1f578:	lsr	x13, x25, x13
   1f57c:	lsl	x10, x9, x10
   1f580:	add	x9, x20, x12
   1f584:	orr	w11, w11, w8
   1f588:	cmp	w11, #0x3f
   1f58c:	orr	x10, x10, x13
   1f590:	str	x10, [x19, x9]
   1f594:	b.ls	1f5a0 <gzhot::enc::scan::<12, true, false>+0x5d8>  // b.plast
   1f598:	mov	x0, xzr
   1f59c:	b	1f5b0 <gzhot::enc::scan::<12, true, false>+0x5e8>
   1f5a0:	lsr	w10, w8, #3
   1f5a4:	and	w8, w8, #0x7
   1f5a8:	add	x9, x9, x10
   1f5ac:	orr	x0, x8, x9, lsl #3
   1f5b0:	ldp	x20, x19, [sp, #80]
   1f5b4:	ldr	x27, [sp, #16]
   1f5b8:	ldp	x22, x21, [sp, #64]
   1f5bc:	ldp	x24, x23, [sp, #48]
   1f5c0:	ldp	x26, x25, [sp, #32]
   1f5c4:	ldp	x29, x30, [sp], #96
   1f5c8:	ret
   1f5cc:	adrp	x2, bc000 <anon.d12d701ec82cade226dab3f33ffca366.13.llvm.3122205982755605208+0x48>
   1f5d0:	add	x2, x2, #0x398
   1f5d4:	mov	x0, x20
   1f5d8:	mov	w1, #0x240                 	// #576
   1f5dc:	bl	dc84 <core::panicking::panic_bounds_check>
