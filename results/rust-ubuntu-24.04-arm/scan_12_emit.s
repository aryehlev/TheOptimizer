000000000001e1f0 <gzhot::enc::scan::<12, true, false>>:
   1e1f0:	sub	sp, sp, #0x70
   1e1f4:	stp	x29, x30, [sp, #16]
   1e1f8:	stp	x28, x27, [sp, #32]
   1e1fc:	stp	x26, x25, [sp, #48]
   1e200:	stp	x24, x23, [sp, #64]
   1e204:	stp	x22, x21, [sp, #80]
   1e208:	stp	x20, x19, [sp, #96]
   1e20c:	add	x29, sp, #0x10
   1e210:	ldr	x30, [x29, #112]
   1e214:	ldr	x19, [x29, #96]
   1e218:	mov	x24, x6
   1e21c:	mov	x23, x5
   1e220:	mov	x22, x4
   1e224:	mov	x25, x1
   1e228:	mov	x20, x0
   1e22c:	tbnz	x30, #32, 1e250 <gzhot::enc::scan::<12, true, false>+0x60>
   1e230:	mov	x8, #0xffffffffffffffff    	// #-1
   1e234:	ldrb	w9, [x19]
   1e238:	mov	x21, xzr
   1e23c:	lsl	x8, x8, x30
   1e240:	mov	x28, x30
   1e244:	bic	x27, x9, x8
   1e248:	tbz	w7, #0, 1e2d0 <gzhot::enc::scan::<12, true, false>+0xe0>
   1e24c:	b	1e314 <gzhot::enc::scan::<12, true, false>+0x124>
   1e250:	ldr	w27, [x20, #2192]
   1e254:	add	x26, x20, #0x894
   1e258:	lsr	x21, x27, #3
   1e25c:	cmp	w27, #0x3ff
   1e260:	b.hi	1e288 <gzhot::enc::scan::<12, true, false>+0x98>  // b.pmore
   1e264:	ldp	q0, q1, [x26, #64]
   1e268:	stp	q0, q1, [x19, #64]
   1e26c:	ldp	q0, q2, [x26, #96]
   1e270:	stp	q0, q2, [x19, #96]
   1e274:	ldp	q1, q0, [x26]
   1e278:	stp	q1, q0, [x19]
   1e27c:	ldp	q2, q0, [x26, #32]
   1e280:	stp	q2, q0, [x19, #32]
   1e284:	b	1e2b4 <gzhot::enc::scan::<12, true, false>+0xc4>
   1e288:	add	x1, x20, #0x894
   1e28c:	mov	x0, x19
   1e290:	mov	x2, x21
   1e294:	stur	w7, [x29, #-4]
   1e298:	mov	x28, x30
   1e29c:	bl	6e60 <memcpy@plt>
   1e2a0:	lsr	w8, w27, #9
   1e2a4:	ldur	w7, [x29, #-4]
   1e2a8:	mov	x30, x28
   1e2ac:	cmp	w8, #0x8
   1e2b0:	b.hi	1e874 <gzhot::enc::scan::<12, true, false>+0x684>  // b.pmore
   1e2b4:	and	x28, x27, #0x7
   1e2b8:	mov	x8, #0xffffffffffffffff    	// #-1
   1e2bc:	ldrb	w9, [x26, x21]
   1e2c0:	lsl	x8, x8, x28
   1e2c4:	bic	x27, x9, x8
   1e2c8:	tbz	x30, #40, 1e2f4 <gzhot::enc::scan::<12, true, false>+0x104>
   1e2cc:	tbnz	w7, #0, 1e314 <gzhot::enc::scan::<12, true, false>+0x124>
   1e2d0:	subs	x8, x23, #0x9
   1e2d4:	csel	x8, xzr, x8, cc	// cc = lo, ul, last
   1e2d8:	subs	x9, x23, #0xc
   1e2dc:	csel	x9, xzr, x9, cc	// cc = lo, ul, last
   1e2e0:	cbz	x24, 1e340 <gzhot::enc::scan::<12, true, false>+0x150>
   1e2e4:	cmp	x24, x8
   1e2e8:	mov	w17, w28
   1e2ec:	b.cs	1e350 <gzhot::enc::scan::<12, true, false>+0x160>  // b.hs, b.nlast
   1e2f0:	b	1e4dc <gzhot::enc::scan::<12, true, false>+0x2ec>
   1e2f4:	cbz	x21, 1e30c <gzhot::enc::scan::<12, true, false>+0x11c>
   1e2f8:	ldrb	w8, [x19]
   1e2fc:	and	w8, w8, #0xfe
   1e300:	strb	w8, [x19]
   1e304:	tbz	w7, #0, 1e2d0 <gzhot::enc::scan::<12, true, false>+0xe0>
   1e308:	b	1e314 <gzhot::enc::scan::<12, true, false>+0x124>
   1e30c:	and	x27, x27, #0x7e
   1e310:	tbz	w7, #0, 1e2d0 <gzhot::enc::scan::<12, true, false>+0xe0>
   1e314:	mov	x0, x25
   1e318:	mov	w1, wzr
   1e31c:	mov	w2, #0x2000                	// #8192
   1e320:	mov	x26, x30
   1e324:	bl	7220 <memset@plt>
   1e328:	mov	x30, x26
   1e32c:	subs	x8, x23, #0x9
   1e330:	csel	x8, xzr, x8, cc	// cc = lo, ul, last
   1e334:	subs	x9, x23, #0xc
   1e338:	csel	x9, xzr, x9, cc	// cc = lo, ul, last
   1e33c:	cbnz	x24, 1e2e4 <gzhot::enc::scan::<12, true, false>+0xf4>
   1e340:	cmp	x8, #0x2
   1e344:	b.cs	1e4a8 <gzhot::enc::scan::<12, true, false>+0x2b8>  // b.hs, b.nlast
   1e348:	mov	x24, xzr
   1e34c:	mov	w17, w28
   1e350:	add	x8, x24, #0x4
   1e354:	cmp	x8, x23
   1e358:	b.ls	1e360 <gzhot::enc::scan::<12, true, false>+0x170>  // b.plast
   1e35c:	b	1e3f0 <gzhot::enc::scan::<12, true, false>+0x200>
   1e360:	add	x8, x22, #0x1
   1e364:	add	x9, x8, x24
   1e368:	ldurb	w10, [x9, #-1]
   1e36c:	ldrb	w11, [x9]
   1e370:	ldrb	w12, [x9, #1]
   1e374:	ldrb	w9, [x9, #2]
   1e378:	ldr	w10, [x20, x10, lsl #2]
   1e37c:	ldr	w11, [x20, x11, lsl #2]
   1e380:	ldr	w12, [x20, x12, lsl #2]
   1e384:	ldr	w9, [x20, x9, lsl #2]
   1e388:	add	w13, w17, w10, lsr #16
   1e38c:	and	x10, x10, #0xffff
   1e390:	lsl	x10, x10, x17
   1e394:	and	x15, x9, #0xffff
   1e398:	add	w14, w13, w11, lsr #16
   1e39c:	and	x11, x11, #0xffff
   1e3a0:	lsl	x11, x11, x13
   1e3a4:	and	x13, x12, #0xffff
   1e3a8:	orr	x10, x10, x27
   1e3ac:	add	w12, w14, w12, lsr #16
   1e3b0:	lsl	x13, x13, x14
   1e3b4:	orr	x10, x10, x11
   1e3b8:	lsl	x11, x15, x12
   1e3bc:	add	w9, w12, w9, lsr #16
   1e3c0:	orr	x10, x10, x13
   1e3c4:	add	x13, x24, #0x8
   1e3c8:	add	x24, x24, #0x4
   1e3cc:	orr	x10, x10, x11
   1e3d0:	ubfx	w11, w9, #3, #3
   1e3d4:	and	w12, w9, #0x38
   1e3d8:	lsr	x27, x10, x12
   1e3dc:	str	x10, [x19, x21]
   1e3e0:	cmp	x13, x23
   1e3e4:	add	x21, x21, x11
   1e3e8:	and	w17, w9, #0xffff8007
   1e3ec:	b.ls	1e364 <gzhot::enc::scan::<12, true, false>+0x174>  // b.plast
   1e3f0:	subs	x8, x23, x24
   1e3f4:	b.ls	1e490 <gzhot::enc::scan::<12, true, false>+0x2a0>  // b.plast
   1e3f8:	add	x9, x22, x24
   1e3fc:	ldrb	w10, [x9], #1
   1e400:	subs	x8, x8, #0x1
   1e404:	ldr	w10, [x20, x10, lsl #2]
   1e408:	and	x11, x10, #0xffff
   1e40c:	lsl	x11, x11, x17
   1e410:	add	w17, w17, w10, lsr #16
   1e414:	orr	x27, x11, x27
   1e418:	b.ne	1e3fc <gzhot::enc::scan::<12, true, false>+0x20c>  // b.any
   1e41c:	ubfx	w8, w17, #3, #3
   1e420:	and	w9, w17, #0xffff8007
   1e424:	str	x27, [x19, x21]
   1e428:	add	x8, x21, x8
   1e42c:	tbz	x30, #48, 1e460 <gzhot::enc::scan::<12, true, false>+0x270>
   1e430:	ldr	w10, [x20, #2060]
   1e434:	and	w11, w17, #0x38
   1e438:	and	w13, w17, #0x7
   1e43c:	add	w9, w9, w10, lsr #16
   1e440:	and	x12, x10, #0xffff
   1e444:	lsr	x10, x27, x11
   1e448:	lsl	x11, x12, x13
   1e44c:	ubfx	w12, w9, #3, #3
   1e450:	and	w9, w9, #0xffff8007
   1e454:	orr	x10, x11, x10
   1e458:	str	x10, [x19, x8]
   1e45c:	add	x8, x8, x12
   1e460:	lsl	x8, x8, #3
   1e464:	cmp	w9, #0x7
   1e468:	add	x8, x8, w9, uxtw
   1e46c:	csel	x0, xzr, x8, hi	// hi = pmore
   1e470:	ldp	x20, x19, [sp, #96]
   1e474:	ldp	x22, x21, [sp, #80]
   1e478:	ldp	x24, x23, [sp, #64]
   1e47c:	ldp	x26, x25, [sp, #48]
   1e480:	ldp	x28, x27, [sp, #32]
   1e484:	ldp	x29, x30, [sp, #16]
   1e488:	add	sp, sp, #0x70
   1e48c:	ret
   1e490:	ubfx	w8, w17, #3, #3
   1e494:	and	w9, w17, #0xffff8007
   1e498:	str	x27, [x19, x21]
   1e49c:	add	x8, x21, x8
   1e4a0:	tbnz	x30, #48, 1e430 <gzhot::enc::scan::<12, true, false>+0x240>
   1e4a4:	b	1e460 <gzhot::enc::scan::<12, true, false>+0x270>
   1e4a8:	ldrb	w10, [x22]
   1e4ac:	mov	w24, #0x1                   	// #1
   1e4b0:	ldr	w10, [x20, x10, lsl #2]
   1e4b4:	and	x11, x10, #0xffff
   1e4b8:	add	w10, w28, w10, lsr #16
   1e4bc:	lsl	x11, x11, x28
   1e4c0:	ubfx	w12, w10, #3, #3
   1e4c4:	and	w13, w10, #0x38
   1e4c8:	and	w28, w10, #0xffff8007
   1e4cc:	orr	x11, x11, x27
   1e4d0:	str	x11, [x19, x21]
   1e4d4:	lsr	x27, x11, x13
   1e4d8:	add	x21, x21, x12
   1e4dc:	mov	x10, #0x87000000            	// #2264924160
   1e4e0:	ldr	x16, [x22, x24]
   1e4e4:	add	x11, x20, #0x400
   1e4e8:	movk	x10, #0xebca, lsl #32
   1e4ec:	add	x12, x20, #0x810
   1e4f0:	mov	w13, #0x102                 	// #258
   1e4f4:	movk	x10, #0xb185, lsl #48
   1e4f8:	mov	w14, #0x1e                  	// #30
   1e4fc:	mov	w15, #0xffffffff            	// #-1
   1e500:	mov	w17, w28
   1e504:	mul	x16, x16, x10
   1e508:	cmp	x24, x9
   1e50c:	lsr	x16, x16, #52
   1e510:	b.cs	1e63c <gzhot::enc::scan::<12, true, false>+0x44c>  // b.hs, b.nlast
   1e514:	ldr	x18, [x22, x24]
   1e518:	lsr	x0, x18, #8
   1e51c:	mul	x1, x0, x10
   1e520:	ldrh	w0, [x25, x16, lsl #1]
   1e524:	strh	w24, [x25, x16, lsl #1]
   1e528:	ldr	x2, [x22, x0]
   1e52c:	lsr	x16, x1, #52
   1e530:	eor	x1, x2, x18
   1e534:	cbz	w1, 1e6b4 <gzhot::enc::scan::<12, true, false>+0x4c4>
   1e538:	add	x2, x22, x24
   1e53c:	and	x0, x18, #0xff
   1e540:	add	w6, w24, #0x1
   1e544:	ldur	x18, [x2, #1]
   1e548:	ldr	w3, [x20, x0, lsl #2]
   1e54c:	ldrh	w0, [x25, x16, lsl #1]
   1e550:	strh	w6, [x25, x16, lsl #1]
   1e554:	lsr	x1, x18, #8
   1e558:	and	x4, x3, #0xffff
   1e55c:	ldr	x5, [x22, x0]
   1e560:	lsl	x4, x4, x17
   1e564:	add	w17, w17, w3, lsr #16
   1e568:	mul	x1, x1, x10
   1e56c:	orr	x27, x4, x27
   1e570:	lsr	x16, x1, #52
   1e574:	eor	x1, x5, x18
   1e578:	cbz	w1, 1e7c8 <gzhot::enc::scan::<12, true, false>+0x5d8>
   1e57c:	and	x0, x18, #0xff
   1e580:	ldur	x18, [x2, #2]
   1e584:	ldr	w2, [x20, x0, lsl #2]
   1e588:	ldrh	w0, [x25, x16, lsl #1]
   1e58c:	lsr	x1, x18, #8
   1e590:	and	x3, x2, #0xffff
   1e594:	ldr	x4, [x22, x0]
   1e598:	mul	x1, x1, x10
   1e59c:	lsl	x3, x3, x17
   1e5a0:	add	w17, w17, w2, lsr #16
   1e5a4:	add	w2, w24, #0x2
   1e5a8:	strh	w2, [x25, x16, lsl #1]
   1e5ac:	orr	x27, x3, x27
   1e5b0:	lsr	x16, x1, #52
   1e5b4:	eor	x1, x4, x18
   1e5b8:	cbz	w1, 1e7d4 <gzhot::enc::scan::<12, true, false>+0x5e4>
   1e5bc:	add	x0, x22, x24
   1e5c0:	and	x1, x18, #0xff
   1e5c4:	add	w5, w24, #0x3
   1e5c8:	ldur	x18, [x0, #3]
   1e5cc:	ldr	w1, [x20, x1, lsl #2]
   1e5d0:	lsr	x0, x18, #8
   1e5d4:	and	x3, x1, #0xffff
   1e5d8:	lsl	x3, x3, x17
   1e5dc:	add	w17, w17, w1, lsr #16
   1e5e0:	mul	x2, x0, x10
   1e5e4:	ldrh	w0, [x25, x16, lsl #1]
   1e5e8:	strh	w5, [x25, x16, lsl #1]
   1e5ec:	orr	x27, x3, x27
   1e5f0:	ldr	x4, [x22, x0]
   1e5f4:	eor	x1, x4, x18
   1e5f8:	lsr	x16, x2, #52
   1e5fc:	cbz	w1, 1e7e0 <gzhot::enc::scan::<12, true, false>+0x5f0>
   1e600:	and	x18, x18, #0xff
   1e604:	add	x24, x24, #0x4
   1e608:	ldr	w18, [x20, x18, lsl #2]
   1e60c:	cmp	x24, x9
   1e610:	and	x0, x18, #0xffff
   1e614:	lsl	x0, x0, x17
   1e618:	add	w17, w17, w18, lsr #16
   1e61c:	orr	x18, x0, x27
   1e620:	ubfx	w0, w17, #3, #3
   1e624:	and	w1, w17, #0x38
   1e628:	lsr	x27, x18, x1
   1e62c:	str	x18, [x19, x21]
   1e630:	and	w17, w17, #0xffff8007
   1e634:	add	x21, x21, x0
   1e638:	b.cc	1e514 <gzhot::enc::scan::<12, true, false>+0x324>  // b.lo, b.ul, b.last
   1e63c:	cmp	x24, x8
   1e640:	mov	w2, w17
   1e644:	b.cs	1e350 <gzhot::enc::scan::<12, true, false>+0x160>  // b.hs, b.nlast
   1e648:	ldr	x18, [x22, x24]
   1e64c:	ldrh	w0, [x25, x16, lsl #1]
   1e650:	strh	w24, [x25, x16, lsl #1]
   1e654:	lsr	x17, x18, #8
   1e658:	ldr	x1, [x22, x0]
   1e65c:	mul	x17, x17, x10
   1e660:	eor	x1, x1, x18
   1e664:	lsr	x16, x17, #52
   1e668:	cbz	w1, 1e6b0 <gzhot::enc::scan::<12, true, false>+0x4c0>
   1e66c:	and	x17, x18, #0xff
   1e670:	add	x24, x24, #0x1
   1e674:	ldr	w17, [x20, x17, lsl #2]
   1e678:	cmp	x24, x8
   1e67c:	and	x18, x17, #0xffff
   1e680:	add	w17, w2, w17, lsr #16
   1e684:	lsl	x18, x18, x2
   1e688:	ubfx	w0, w17, #3, #3
   1e68c:	and	w1, w17, #0x38
   1e690:	and	w17, w17, #0xffff8007
   1e694:	orr	x18, x18, x27
   1e698:	str	x18, [x19, x21]
   1e69c:	lsr	x27, x18, x1
   1e6a0:	add	x21, x21, x0
   1e6a4:	mov	w2, w17
   1e6a8:	b.cc	1e648 <gzhot::enc::scan::<12, true, false>+0x458>  // b.lo, b.ul, b.last
   1e6ac:	b	1e350 <gzhot::enc::scan::<12, true, false>+0x160>
   1e6b0:	mov	w17, w2
   1e6b4:	cbz	x1, 1e7e8 <gzhot::enc::scan::<12, true, false>+0x5f8>
   1e6b8:	rbit	x1, x1
   1e6bc:	clz	x1, x1
   1e6c0:	lsr	x1, x1, #3
   1e6c4:	mvn	w0, w0
   1e6c8:	add	w0, w0, w24
   1e6cc:	cmp	w0, #0x2
   1e6d0:	clz	w2, w0
   1e6d4:	mov	w3, w0
   1e6d8:	b.cc	1e6f0 <gzhot::enc::scan::<12, true, false>+0x500>  // b.lo, b.ul, b.last
   1e6dc:	sub	w3, w14, w2
   1e6e0:	lsr	w3, w0, w3
   1e6e4:	and	w3, w3, #0x1
   1e6e8:	sub	w3, w3, w2, lsl #1
   1e6ec:	add	w3, w3, #0x3e
   1e6f0:	ldr	w4, [x11, x1, lsl #2]
   1e6f4:	subs	w2, w14, w2
   1e6f8:	ldr	w3, [x12, w3, uxtw #2]
   1e6fc:	csel	w2, wzr, w2, cc	// cc = lo, ul, last
   1e700:	lsr	x18, x18, #16
   1e704:	and	w6, w17, #0x38
   1e708:	ubfx	x5, x4, #19, #5
   1e70c:	lsl	w7, w15, w2
   1e710:	and	x26, x3, #0xffff
   1e714:	and	x4, x4, #0x7ffff
   1e718:	mul	x18, x18, x10
   1e71c:	lsr	x6, x27, x6
   1e720:	add	w3, w5, w3, lsr #16
   1e724:	bic	w0, w0, w7
   1e728:	lsl	x5, x26, x5
   1e72c:	ubfx	w7, w17, #3, #3
   1e730:	str	x27, [x19, x21]
   1e734:	lsl	x0, x0, x3
   1e738:	orr	x4, x5, x4
   1e73c:	and	w5, w17, #0xffff8007
   1e740:	and	w17, w17, #0x7
   1e744:	add	w2, w2, w5
   1e748:	add	w5, w24, #0x2
   1e74c:	orr	x0, x4, x0
   1e750:	add	w4, w24, #0x1
   1e754:	add	x24, x1, x24
   1e758:	lsl	x17, x0, x17
   1e75c:	add	w1, w2, w3
   1e760:	lsr	x18, x18, #51
   1e764:	and	w2, w1, #0x38
   1e768:	ubfx	w3, w1, #3, #3
   1e76c:	add	x0, x21, x7
   1e770:	orr	x17, x17, x6
   1e774:	str	x17, [x19, x0]
   1e778:	cmp	x24, x8
   1e77c:	lsr	x27, x17, x2
   1e780:	strh	w4, [x25, x16, lsl #1]
   1e784:	and	x16, x18, #0x1ffe
   1e788:	add	x21, x0, x3
   1e78c:	and	w17, w1, #0xffff8007
   1e790:	strh	w5, [x25, x16]
   1e794:	b.cs	1e350 <gzhot::enc::scan::<12, true, false>+0x160>  // b.hs, b.nlast
   1e798:	sub	x18, x24, #0x1
   1e79c:	ldr	x16, [x22, x18]
   1e7a0:	mul	x0, x16, x10
   1e7a4:	lsr	x16, x16, #8
   1e7a8:	lsr	x0, x0, #51
   1e7ac:	and	x0, x0, #0x1ffe
   1e7b0:	strh	w18, [x25, x0]
   1e7b4:	mul	x16, x16, x10
   1e7b8:	cmp	x24, x9
   1e7bc:	lsr	x16, x16, #52
   1e7c0:	b.cc	1e514 <gzhot::enc::scan::<12, true, false>+0x324>  // b.lo, b.ul, b.last
   1e7c4:	b	1e63c <gzhot::enc::scan::<12, true, false>+0x44c>
   1e7c8:	add	x24, x24, #0x1
   1e7cc:	cbnz	x1, 1e6b8 <gzhot::enc::scan::<12, true, false>+0x4c8>
   1e7d0:	b	1e7e8 <gzhot::enc::scan::<12, true, false>+0x5f8>
   1e7d4:	add	x24, x24, #0x2
   1e7d8:	cbnz	x1, 1e6b8 <gzhot::enc::scan::<12, true, false>+0x4c8>
   1e7dc:	b	1e7e8 <gzhot::enc::scan::<12, true, false>+0x5f8>
   1e7e0:	add	x24, x24, #0x3
   1e7e4:	cbnz	x1, 1e6b8 <gzhot::enc::scan::<12, true, false>+0x4c8>
   1e7e8:	sub	x1, x23, x24
   1e7ec:	add	x3, x22, x24
   1e7f0:	add	x4, x22, x0
   1e7f4:	cmp	x1, #0x102
   1e7f8:	csel	x2, x1, x13, cc	// cc = lo, ul, last
   1e7fc:	cmp	x1, #0x10
   1e800:	b.cs	1e80c <gzhot::enc::scan::<12, true, false>+0x61c>  // b.hs, b.nlast
   1e804:	mov	w1, #0x8                   	// #8
   1e808:	b	1e834 <gzhot::enc::scan::<12, true, false>+0x644>
   1e80c:	mov	w5, #0x8                   	// #8
   1e810:	ldr	x1, [x3, x5]
   1e814:	ldr	x6, [x4, x5]
   1e818:	cmp	x1, x6
   1e81c:	b.ne	1e860 <gzhot::enc::scan::<12, true, false>+0x670>  // b.any
   1e820:	add	x6, x5, #0x10
   1e824:	add	x1, x5, #0x8
   1e828:	cmp	x6, x2
   1e82c:	mov	x5, x1
   1e830:	b.ls	1e810 <gzhot::enc::scan::<12, true, false>+0x620>  // b.plast
   1e834:	cmp	x1, x2
   1e838:	b.cs	1e6c4 <gzhot::enc::scan::<12, true, false>+0x4d4>  // b.hs, b.nlast
   1e83c:	ldrb	w5, [x3, x1]
   1e840:	ldrb	w6, [x4, x1]
   1e844:	cmp	w5, w6
   1e848:	b.ne	1e6c4 <gzhot::enc::scan::<12, true, false>+0x4d4>  // b.any
   1e84c:	add	x1, x1, #0x1
   1e850:	cmp	x2, x1
   1e854:	b.ne	1e83c <gzhot::enc::scan::<12, true, false>+0x64c>  // b.any
   1e858:	mov	x1, x2
   1e85c:	b	1e6c4 <gzhot::enc::scan::<12, true, false>+0x4d4>
   1e860:	eor	x1, x6, x1
   1e864:	rbit	x1, x1
   1e868:	clz	x1, x1
   1e86c:	add	x1, x5, x1, lsr #3
   1e870:	b	1e6c4 <gzhot::enc::scan::<12, true, false>+0x4d4>
   1e874:	adrp	x2, bc000 <anon.d12d701ec82cade226dab3f33ffca366.19.llvm.3122205982755605208+0x8>
   1e878:	add	x2, x2, #0x140
   1e87c:	mov	x0, x21
   1e880:	mov	w1, #0x240                 	// #576
   1e884:	bl	dcd0 <core::panicking::panic_bounds_check>
