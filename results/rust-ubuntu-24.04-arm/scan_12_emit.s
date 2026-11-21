000000000001e200 <gzhot::enc::scan::<12, true, false>>:
   1e200:	sub	sp, sp, #0x70
   1e204:	stp	x29, x30, [sp, #16]
   1e208:	stp	x28, x27, [sp, #32]
   1e20c:	stp	x26, x25, [sp, #48]
   1e210:	stp	x24, x23, [sp, #64]
   1e214:	stp	x22, x21, [sp, #80]
   1e218:	stp	x20, x19, [sp, #96]
   1e21c:	add	x29, sp, #0x10
   1e220:	ldr	x30, [x29, #112]
   1e224:	ldr	x19, [x29, #96]
   1e228:	mov	x24, x6
   1e22c:	mov	x23, x5
   1e230:	mov	x22, x4
   1e234:	mov	x25, x1
   1e238:	mov	x20, x0
   1e23c:	tbnz	x30, #32, 1e260 <gzhot::enc::scan::<12, true, false>+0x60>
   1e240:	mov	x8, #0xffffffffffffffff    	// #-1
   1e244:	ldrb	w9, [x19]
   1e248:	mov	x21, xzr
   1e24c:	lsl	x8, x8, x30
   1e250:	mov	x28, x30
   1e254:	bic	x27, x9, x8
   1e258:	tbz	w7, #0, 1e2e0 <gzhot::enc::scan::<12, true, false>+0xe0>
   1e25c:	b	1e324 <gzhot::enc::scan::<12, true, false>+0x124>
   1e260:	ldr	w27, [x20, #2192]
   1e264:	add	x26, x20, #0x894
   1e268:	lsr	x21, x27, #3
   1e26c:	cmp	w27, #0x3ff
   1e270:	b.hi	1e298 <gzhot::enc::scan::<12, true, false>+0x98>  // b.pmore
   1e274:	ldp	q0, q1, [x26, #64]
   1e278:	stp	q0, q1, [x19, #64]
   1e27c:	ldp	q0, q2, [x26, #96]
   1e280:	stp	q0, q2, [x19, #96]
   1e284:	ldp	q1, q0, [x26]
   1e288:	stp	q1, q0, [x19]
   1e28c:	ldp	q2, q0, [x26, #32]
   1e290:	stp	q2, q0, [x19, #32]
   1e294:	b	1e2c4 <gzhot::enc::scan::<12, true, false>+0xc4>
   1e298:	add	x1, x20, #0x894
   1e29c:	mov	x0, x19
   1e2a0:	mov	x2, x21
   1e2a4:	stur	w7, [x29, #-4]
   1e2a8:	mov	x28, x30
   1e2ac:	bl	6e60 <memcpy@plt>
   1e2b0:	lsr	w8, w27, #9
   1e2b4:	ldur	w7, [x29, #-4]
   1e2b8:	mov	x30, x28
   1e2bc:	cmp	w8, #0x8
   1e2c0:	b.hi	1e884 <gzhot::enc::scan::<12, true, false>+0x684>  // b.pmore
   1e2c4:	and	x28, x27, #0x7
   1e2c8:	mov	x8, #0xffffffffffffffff    	// #-1
   1e2cc:	ldrb	w9, [x26, x21]
   1e2d0:	lsl	x8, x8, x28
   1e2d4:	bic	x27, x9, x8
   1e2d8:	tbz	x30, #40, 1e304 <gzhot::enc::scan::<12, true, false>+0x104>
   1e2dc:	tbnz	w7, #0, 1e324 <gzhot::enc::scan::<12, true, false>+0x124>
   1e2e0:	subs	x8, x23, #0x9
   1e2e4:	csel	x8, xzr, x8, cc	// cc = lo, ul, last
   1e2e8:	subs	x9, x23, #0xc
   1e2ec:	csel	x9, xzr, x9, cc	// cc = lo, ul, last
   1e2f0:	cbz	x24, 1e350 <gzhot::enc::scan::<12, true, false>+0x150>
   1e2f4:	cmp	x24, x8
   1e2f8:	mov	w17, w28
   1e2fc:	b.cs	1e360 <gzhot::enc::scan::<12, true, false>+0x160>  // b.hs, b.nlast
   1e300:	b	1e4ec <gzhot::enc::scan::<12, true, false>+0x2ec>
   1e304:	cbz	x21, 1e31c <gzhot::enc::scan::<12, true, false>+0x11c>
   1e308:	ldrb	w8, [x19]
   1e30c:	and	w8, w8, #0xfe
   1e310:	strb	w8, [x19]
   1e314:	tbz	w7, #0, 1e2e0 <gzhot::enc::scan::<12, true, false>+0xe0>
   1e318:	b	1e324 <gzhot::enc::scan::<12, true, false>+0x124>
   1e31c:	and	x27, x27, #0x7e
   1e320:	tbz	w7, #0, 1e2e0 <gzhot::enc::scan::<12, true, false>+0xe0>
   1e324:	mov	x0, x25
   1e328:	mov	w1, wzr
   1e32c:	mov	w2, #0x2000                	// #8192
   1e330:	mov	x26, x30
   1e334:	bl	7220 <memset@plt>
   1e338:	mov	x30, x26
   1e33c:	subs	x8, x23, #0x9
   1e340:	csel	x8, xzr, x8, cc	// cc = lo, ul, last
   1e344:	subs	x9, x23, #0xc
   1e348:	csel	x9, xzr, x9, cc	// cc = lo, ul, last
   1e34c:	cbnz	x24, 1e2f4 <gzhot::enc::scan::<12, true, false>+0xf4>
   1e350:	cmp	x8, #0x2
   1e354:	b.cs	1e4b8 <gzhot::enc::scan::<12, true, false>+0x2b8>  // b.hs, b.nlast
   1e358:	mov	x24, xzr
   1e35c:	mov	w17, w28
   1e360:	add	x8, x24, #0x4
   1e364:	cmp	x8, x23
   1e368:	b.ls	1e370 <gzhot::enc::scan::<12, true, false>+0x170>  // b.plast
   1e36c:	b	1e400 <gzhot::enc::scan::<12, true, false>+0x200>
   1e370:	add	x8, x22, #0x1
   1e374:	add	x9, x8, x24
   1e378:	ldurb	w10, [x9, #-1]
   1e37c:	ldrb	w11, [x9]
   1e380:	ldrb	w12, [x9, #1]
   1e384:	ldrb	w9, [x9, #2]
   1e388:	ldr	w10, [x20, x10, lsl #2]
   1e38c:	ldr	w11, [x20, x11, lsl #2]
   1e390:	ldr	w12, [x20, x12, lsl #2]
   1e394:	ldr	w9, [x20, x9, lsl #2]
   1e398:	add	w13, w17, w10, lsr #16
   1e39c:	and	x10, x10, #0xffff
   1e3a0:	lsl	x10, x10, x17
   1e3a4:	and	x15, x9, #0xffff
   1e3a8:	add	w14, w13, w11, lsr #16
   1e3ac:	and	x11, x11, #0xffff
   1e3b0:	lsl	x11, x11, x13
   1e3b4:	and	x13, x12, #0xffff
   1e3b8:	orr	x10, x10, x27
   1e3bc:	add	w12, w14, w12, lsr #16
   1e3c0:	lsl	x13, x13, x14
   1e3c4:	orr	x10, x10, x11
   1e3c8:	lsl	x11, x15, x12
   1e3cc:	add	w9, w12, w9, lsr #16
   1e3d0:	orr	x10, x10, x13
   1e3d4:	add	x13, x24, #0x8
   1e3d8:	add	x24, x24, #0x4
   1e3dc:	orr	x10, x10, x11
   1e3e0:	ubfx	w11, w9, #3, #3
   1e3e4:	and	w12, w9, #0x38
   1e3e8:	lsr	x27, x10, x12
   1e3ec:	str	x10, [x19, x21]
   1e3f0:	cmp	x13, x23
   1e3f4:	add	x21, x21, x11
   1e3f8:	and	w17, w9, #0xffff8007
   1e3fc:	b.ls	1e374 <gzhot::enc::scan::<12, true, false>+0x174>  // b.plast
   1e400:	subs	x8, x23, x24
   1e404:	b.ls	1e4a0 <gzhot::enc::scan::<12, true, false>+0x2a0>  // b.plast
   1e408:	add	x9, x22, x24
   1e40c:	ldrb	w10, [x9], #1
   1e410:	subs	x8, x8, #0x1
   1e414:	ldr	w10, [x20, x10, lsl #2]
   1e418:	and	x11, x10, #0xffff
   1e41c:	lsl	x11, x11, x17
   1e420:	add	w17, w17, w10, lsr #16
   1e424:	orr	x27, x11, x27
   1e428:	b.ne	1e40c <gzhot::enc::scan::<12, true, false>+0x20c>  // b.any
   1e42c:	ubfx	w8, w17, #3, #3
   1e430:	and	w9, w17, #0xffff8007
   1e434:	str	x27, [x19, x21]
   1e438:	add	x8, x21, x8
   1e43c:	tbz	x30, #48, 1e470 <gzhot::enc::scan::<12, true, false>+0x270>
   1e440:	ldr	w10, [x20, #2060]
   1e444:	and	w11, w17, #0x38
   1e448:	and	w13, w17, #0x7
   1e44c:	add	w9, w9, w10, lsr #16
   1e450:	and	x12, x10, #0xffff
   1e454:	lsr	x10, x27, x11
   1e458:	lsl	x11, x12, x13
   1e45c:	ubfx	w12, w9, #3, #3
   1e460:	and	w9, w9, #0xffff8007
   1e464:	orr	x10, x11, x10
   1e468:	str	x10, [x19, x8]
   1e46c:	add	x8, x8, x12
   1e470:	lsl	x8, x8, #3
   1e474:	cmp	w9, #0x7
   1e478:	add	x8, x8, w9, uxtw
   1e47c:	csel	x0, xzr, x8, hi	// hi = pmore
   1e480:	ldp	x20, x19, [sp, #96]
   1e484:	ldp	x22, x21, [sp, #80]
   1e488:	ldp	x24, x23, [sp, #64]
   1e48c:	ldp	x26, x25, [sp, #48]
   1e490:	ldp	x28, x27, [sp, #32]
   1e494:	ldp	x29, x30, [sp, #16]
   1e498:	add	sp, sp, #0x70
   1e49c:	ret
   1e4a0:	ubfx	w8, w17, #3, #3
   1e4a4:	and	w9, w17, #0xffff8007
   1e4a8:	str	x27, [x19, x21]
   1e4ac:	add	x8, x21, x8
   1e4b0:	tbnz	x30, #48, 1e440 <gzhot::enc::scan::<12, true, false>+0x240>
   1e4b4:	b	1e470 <gzhot::enc::scan::<12, true, false>+0x270>
   1e4b8:	ldrb	w10, [x22]
   1e4bc:	mov	w24, #0x1                   	// #1
   1e4c0:	ldr	w10, [x20, x10, lsl #2]
   1e4c4:	and	x11, x10, #0xffff
   1e4c8:	add	w10, w28, w10, lsr #16
   1e4cc:	lsl	x11, x11, x28
   1e4d0:	ubfx	w12, w10, #3, #3
   1e4d4:	and	w13, w10, #0x38
   1e4d8:	and	w28, w10, #0xffff8007
   1e4dc:	orr	x11, x11, x27
   1e4e0:	str	x11, [x19, x21]
   1e4e4:	lsr	x27, x11, x13
   1e4e8:	add	x21, x21, x12
   1e4ec:	mov	x10, #0x87000000            	// #2264924160
   1e4f0:	ldr	x16, [x22, x24]
   1e4f4:	add	x11, x20, #0x400
   1e4f8:	movk	x10, #0xebca, lsl #32
   1e4fc:	add	x12, x20, #0x810
   1e500:	mov	w13, #0x102                 	// #258
   1e504:	movk	x10, #0xb185, lsl #48
   1e508:	mov	w14, #0x1e                  	// #30
   1e50c:	mov	w15, #0xffffffff            	// #-1
   1e510:	mov	w17, w28
   1e514:	mul	x16, x16, x10
   1e518:	cmp	x24, x9
   1e51c:	lsr	x16, x16, #52
   1e520:	b.cs	1e64c <gzhot::enc::scan::<12, true, false>+0x44c>  // b.hs, b.nlast
   1e524:	ldr	x18, [x22, x24]
   1e528:	lsr	x0, x18, #8
   1e52c:	mul	x1, x0, x10
   1e530:	ldrh	w0, [x25, x16, lsl #1]
   1e534:	strh	w24, [x25, x16, lsl #1]
   1e538:	ldr	x2, [x22, x0]
   1e53c:	lsr	x16, x1, #52
   1e540:	eor	x1, x2, x18
   1e544:	cbz	w1, 1e6c4 <gzhot::enc::scan::<12, true, false>+0x4c4>
   1e548:	add	x2, x22, x24
   1e54c:	and	x0, x18, #0xff
   1e550:	add	w6, w24, #0x1
   1e554:	ldur	x18, [x2, #1]
   1e558:	ldr	w3, [x20, x0, lsl #2]
   1e55c:	ldrh	w0, [x25, x16, lsl #1]
   1e560:	strh	w6, [x25, x16, lsl #1]
   1e564:	lsr	x1, x18, #8
   1e568:	and	x4, x3, #0xffff
   1e56c:	ldr	x5, [x22, x0]
   1e570:	lsl	x4, x4, x17
   1e574:	add	w17, w17, w3, lsr #16
   1e578:	mul	x1, x1, x10
   1e57c:	orr	x27, x4, x27
   1e580:	lsr	x16, x1, #52
   1e584:	eor	x1, x5, x18
   1e588:	cbz	w1, 1e7d8 <gzhot::enc::scan::<12, true, false>+0x5d8>
   1e58c:	and	x0, x18, #0xff
   1e590:	ldur	x18, [x2, #2]
   1e594:	ldr	w2, [x20, x0, lsl #2]
   1e598:	ldrh	w0, [x25, x16, lsl #1]
   1e59c:	lsr	x1, x18, #8
   1e5a0:	and	x3, x2, #0xffff
   1e5a4:	ldr	x4, [x22, x0]
   1e5a8:	mul	x1, x1, x10
   1e5ac:	lsl	x3, x3, x17
   1e5b0:	add	w17, w17, w2, lsr #16
   1e5b4:	add	w2, w24, #0x2
   1e5b8:	strh	w2, [x25, x16, lsl #1]
   1e5bc:	orr	x27, x3, x27
   1e5c0:	lsr	x16, x1, #52
   1e5c4:	eor	x1, x4, x18
   1e5c8:	cbz	w1, 1e7e4 <gzhot::enc::scan::<12, true, false>+0x5e4>
   1e5cc:	add	x0, x22, x24
   1e5d0:	and	x1, x18, #0xff
   1e5d4:	add	w5, w24, #0x3
   1e5d8:	ldur	x18, [x0, #3]
   1e5dc:	ldr	w1, [x20, x1, lsl #2]
   1e5e0:	lsr	x0, x18, #8
   1e5e4:	and	x3, x1, #0xffff
   1e5e8:	lsl	x3, x3, x17
   1e5ec:	add	w17, w17, w1, lsr #16
   1e5f0:	mul	x2, x0, x10
   1e5f4:	ldrh	w0, [x25, x16, lsl #1]
   1e5f8:	strh	w5, [x25, x16, lsl #1]
   1e5fc:	orr	x27, x3, x27
   1e600:	ldr	x4, [x22, x0]
   1e604:	eor	x1, x4, x18
   1e608:	lsr	x16, x2, #52
   1e60c:	cbz	w1, 1e7f0 <gzhot::enc::scan::<12, true, false>+0x5f0>
   1e610:	and	x18, x18, #0xff
   1e614:	add	x24, x24, #0x4
   1e618:	ldr	w18, [x20, x18, lsl #2]
   1e61c:	cmp	x24, x9
   1e620:	and	x0, x18, #0xffff
   1e624:	lsl	x0, x0, x17
   1e628:	add	w17, w17, w18, lsr #16
   1e62c:	orr	x18, x0, x27
   1e630:	ubfx	w0, w17, #3, #3
   1e634:	and	w1, w17, #0x38
   1e638:	lsr	x27, x18, x1
   1e63c:	str	x18, [x19, x21]
   1e640:	and	w17, w17, #0xffff8007
   1e644:	add	x21, x21, x0
   1e648:	b.cc	1e524 <gzhot::enc::scan::<12, true, false>+0x324>  // b.lo, b.ul, b.last
   1e64c:	cmp	x24, x8
   1e650:	mov	w2, w17
   1e654:	b.cs	1e360 <gzhot::enc::scan::<12, true, false>+0x160>  // b.hs, b.nlast
   1e658:	ldr	x18, [x22, x24]
   1e65c:	ldrh	w0, [x25, x16, lsl #1]
   1e660:	strh	w24, [x25, x16, lsl #1]
   1e664:	lsr	x17, x18, #8
   1e668:	ldr	x1, [x22, x0]
   1e66c:	mul	x17, x17, x10
   1e670:	eor	x1, x1, x18
   1e674:	lsr	x16, x17, #52
   1e678:	cbz	w1, 1e6c0 <gzhot::enc::scan::<12, true, false>+0x4c0>
   1e67c:	and	x17, x18, #0xff
   1e680:	add	x24, x24, #0x1
   1e684:	ldr	w17, [x20, x17, lsl #2]
   1e688:	cmp	x24, x8
   1e68c:	and	x18, x17, #0xffff
   1e690:	add	w17, w2, w17, lsr #16
   1e694:	lsl	x18, x18, x2
   1e698:	ubfx	w0, w17, #3, #3
   1e69c:	and	w1, w17, #0x38
   1e6a0:	and	w17, w17, #0xffff8007
   1e6a4:	orr	x18, x18, x27
   1e6a8:	str	x18, [x19, x21]
   1e6ac:	lsr	x27, x18, x1
   1e6b0:	add	x21, x21, x0
   1e6b4:	mov	w2, w17
   1e6b8:	b.cc	1e658 <gzhot::enc::scan::<12, true, false>+0x458>  // b.lo, b.ul, b.last
   1e6bc:	b	1e360 <gzhot::enc::scan::<12, true, false>+0x160>
   1e6c0:	mov	w17, w2
   1e6c4:	cbz	x1, 1e7f8 <gzhot::enc::scan::<12, true, false>+0x5f8>
   1e6c8:	rbit	x1, x1
   1e6cc:	clz	x1, x1
   1e6d0:	lsr	x1, x1, #3
   1e6d4:	mvn	w0, w0
   1e6d8:	add	w0, w0, w24
   1e6dc:	cmp	w0, #0x2
   1e6e0:	clz	w2, w0
   1e6e4:	mov	w3, w0
   1e6e8:	b.cc	1e700 <gzhot::enc::scan::<12, true, false>+0x500>  // b.lo, b.ul, b.last
   1e6ec:	sub	w3, w14, w2
   1e6f0:	lsr	w3, w0, w3
   1e6f4:	and	w3, w3, #0x1
   1e6f8:	sub	w3, w3, w2, lsl #1
   1e6fc:	add	w3, w3, #0x3e
   1e700:	ldr	w4, [x11, x1, lsl #2]
   1e704:	subs	w2, w14, w2
   1e708:	ldr	w3, [x12, w3, uxtw #2]
   1e70c:	csel	w2, wzr, w2, cc	// cc = lo, ul, last
   1e710:	lsr	x18, x18, #16
   1e714:	and	w6, w17, #0x38
   1e718:	ubfx	x5, x4, #19, #5
   1e71c:	lsl	w7, w15, w2
   1e720:	and	x26, x3, #0xffff
   1e724:	and	x4, x4, #0x7ffff
   1e728:	mul	x18, x18, x10
   1e72c:	lsr	x6, x27, x6
   1e730:	add	w3, w5, w3, lsr #16
   1e734:	bic	w0, w0, w7
   1e738:	lsl	x5, x26, x5
   1e73c:	ubfx	w7, w17, #3, #3
   1e740:	str	x27, [x19, x21]
   1e744:	lsl	x0, x0, x3
   1e748:	orr	x4, x5, x4
   1e74c:	and	w5, w17, #0xffff8007
   1e750:	and	w17, w17, #0x7
   1e754:	add	w2, w2, w5
   1e758:	add	w5, w24, #0x2
   1e75c:	orr	x0, x4, x0
   1e760:	add	w4, w24, #0x1
   1e764:	add	x24, x1, x24
   1e768:	lsl	x17, x0, x17
   1e76c:	add	w1, w2, w3
   1e770:	lsr	x18, x18, #51
   1e774:	and	w2, w1, #0x38
   1e778:	ubfx	w3, w1, #3, #3
   1e77c:	add	x0, x21, x7
   1e780:	orr	x17, x17, x6
   1e784:	str	x17, [x19, x0]
   1e788:	cmp	x24, x8
   1e78c:	lsr	x27, x17, x2
   1e790:	strh	w4, [x25, x16, lsl #1]
   1e794:	and	x16, x18, #0x1ffe
   1e798:	add	x21, x0, x3
   1e79c:	and	w17, w1, #0xffff8007
   1e7a0:	strh	w5, [x25, x16]
   1e7a4:	b.cs	1e360 <gzhot::enc::scan::<12, true, false>+0x160>  // b.hs, b.nlast
   1e7a8:	sub	x18, x24, #0x1
   1e7ac:	ldr	x16, [x22, x18]
   1e7b0:	mul	x0, x16, x10
   1e7b4:	lsr	x16, x16, #8
   1e7b8:	lsr	x0, x0, #51
   1e7bc:	and	x0, x0, #0x1ffe
   1e7c0:	strh	w18, [x25, x0]
   1e7c4:	mul	x16, x16, x10
   1e7c8:	cmp	x24, x9
   1e7cc:	lsr	x16, x16, #52
   1e7d0:	b.cc	1e524 <gzhot::enc::scan::<12, true, false>+0x324>  // b.lo, b.ul, b.last
   1e7d4:	b	1e64c <gzhot::enc::scan::<12, true, false>+0x44c>
   1e7d8:	add	x24, x24, #0x1
   1e7dc:	cbnz	x1, 1e6c8 <gzhot::enc::scan::<12, true, false>+0x4c8>
   1e7e0:	b	1e7f8 <gzhot::enc::scan::<12, true, false>+0x5f8>
   1e7e4:	add	x24, x24, #0x2
   1e7e8:	cbnz	x1, 1e6c8 <gzhot::enc::scan::<12, true, false>+0x4c8>
   1e7ec:	b	1e7f8 <gzhot::enc::scan::<12, true, false>+0x5f8>
   1e7f0:	add	x24, x24, #0x3
   1e7f4:	cbnz	x1, 1e6c8 <gzhot::enc::scan::<12, true, false>+0x4c8>
   1e7f8:	sub	x1, x23, x24
   1e7fc:	add	x3, x22, x24
   1e800:	add	x4, x22, x0
   1e804:	cmp	x1, #0x102
   1e808:	csel	x2, x1, x13, cc	// cc = lo, ul, last
   1e80c:	cmp	x1, #0x10
   1e810:	b.cs	1e81c <gzhot::enc::scan::<12, true, false>+0x61c>  // b.hs, b.nlast
   1e814:	mov	w1, #0x8                   	// #8
   1e818:	b	1e844 <gzhot::enc::scan::<12, true, false>+0x644>
   1e81c:	mov	w5, #0x8                   	// #8
   1e820:	ldr	x1, [x3, x5]
   1e824:	ldr	x6, [x4, x5]
   1e828:	cmp	x1, x6
   1e82c:	b.ne	1e870 <gzhot::enc::scan::<12, true, false>+0x670>  // b.any
   1e830:	add	x6, x5, #0x10
   1e834:	add	x1, x5, #0x8
   1e838:	cmp	x6, x2
   1e83c:	mov	x5, x1
   1e840:	b.ls	1e820 <gzhot::enc::scan::<12, true, false>+0x620>  // b.plast
   1e844:	cmp	x1, x2
   1e848:	b.cs	1e6d4 <gzhot::enc::scan::<12, true, false>+0x4d4>  // b.hs, b.nlast
   1e84c:	ldrb	w5, [x3, x1]
   1e850:	ldrb	w6, [x4, x1]
   1e854:	cmp	w5, w6
   1e858:	b.ne	1e6d4 <gzhot::enc::scan::<12, true, false>+0x4d4>  // b.any
   1e85c:	add	x1, x1, #0x1
   1e860:	cmp	x2, x1
   1e864:	b.ne	1e84c <gzhot::enc::scan::<12, true, false>+0x64c>  // b.any
   1e868:	mov	x1, x2
   1e86c:	b	1e6d4 <gzhot::enc::scan::<12, true, false>+0x4d4>
   1e870:	eor	x1, x6, x1
   1e874:	rbit	x1, x1
   1e878:	clz	x1, x1
   1e87c:	add	x1, x5, x1, lsr #3
   1e880:	b	1e6d4 <gzhot::enc::scan::<12, true, false>+0x4d4>
   1e884:	adrp	x2, bc000 <anon.d12d701ec82cade226dab3f33ffca366.19.llvm.3122205982755605208+0x8>
   1e888:	add	x2, x2, #0x140
   1e88c:	mov	x0, x21
   1e890:	mov	w1, #0x240                 	// #576
   1e894:	bl	dcd0 <core::panicking::panic_bounds_check>
