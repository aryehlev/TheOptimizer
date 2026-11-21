000000000001e28c <fastgzip::enc::scan::<12, true, false>>:
   1e28c:	sub	sp, sp, #0x70
   1e290:	stp	x29, x30, [sp, #16]
   1e294:	stp	x28, x27, [sp, #32]
   1e298:	stp	x26, x25, [sp, #48]
   1e29c:	stp	x24, x23, [sp, #64]
   1e2a0:	stp	x22, x21, [sp, #80]
   1e2a4:	stp	x20, x19, [sp, #96]
   1e2a8:	add	x29, sp, #0x10
   1e2ac:	ldr	x30, [x29, #112]
   1e2b0:	ldr	x19, [x29, #96]
   1e2b4:	mov	x24, x6
   1e2b8:	mov	x23, x5
   1e2bc:	mov	x22, x4
   1e2c0:	mov	x25, x1
   1e2c4:	mov	x20, x0
   1e2c8:	tbnz	x30, #32, 1e2ec <fastgzip::enc::scan::<12, true, false>+0x60>
   1e2cc:	mov	x8, #0xffffffffffffffff    	// #-1
   1e2d0:	ldrb	w9, [x19]
   1e2d4:	mov	x21, xzr
   1e2d8:	lsl	x8, x8, x30
   1e2dc:	mov	x28, x30
   1e2e0:	bic	x27, x9, x8
   1e2e4:	tbz	w7, #0, 1e36c <fastgzip::enc::scan::<12, true, false>+0xe0>
   1e2e8:	b	1e3b0 <fastgzip::enc::scan::<12, true, false>+0x124>
   1e2ec:	ldr	w27, [x20, #2192]
   1e2f0:	add	x26, x20, #0x894
   1e2f4:	lsr	x21, x27, #3
   1e2f8:	cmp	w27, #0x3ff
   1e2fc:	b.hi	1e324 <fastgzip::enc::scan::<12, true, false>+0x98>  // b.pmore
   1e300:	ldp	q0, q1, [x26, #64]
   1e304:	stp	q0, q1, [x19, #64]
   1e308:	ldp	q0, q2, [x26, #96]
   1e30c:	stp	q0, q2, [x19, #96]
   1e310:	ldp	q1, q0, [x26]
   1e314:	stp	q1, q0, [x19]
   1e318:	ldp	q2, q0, [x26, #32]
   1e31c:	stp	q2, q0, [x19, #32]
   1e320:	b	1e350 <fastgzip::enc::scan::<12, true, false>+0xc4>
   1e324:	add	x1, x20, #0x894
   1e328:	mov	x0, x19
   1e32c:	mov	x2, x21
   1e330:	stur	w7, [x29, #-4]
   1e334:	mov	x28, x30
   1e338:	bl	6e60 <memcpy@plt>
   1e33c:	lsr	w8, w27, #9
   1e340:	ldur	w7, [x29, #-4]
   1e344:	mov	x30, x28
   1e348:	cmp	w8, #0x8
   1e34c:	b.hi	1e910 <fastgzip::enc::scan::<12, true, false>+0x684>  // b.pmore
   1e350:	and	x28, x27, #0x7
   1e354:	mov	x8, #0xffffffffffffffff    	// #-1
   1e358:	ldrb	w9, [x26, x21]
   1e35c:	lsl	x8, x8, x28
   1e360:	bic	x27, x9, x8
   1e364:	tbz	x30, #40, 1e390 <fastgzip::enc::scan::<12, true, false>+0x104>
   1e368:	tbnz	w7, #0, 1e3b0 <fastgzip::enc::scan::<12, true, false>+0x124>
   1e36c:	subs	x8, x23, #0x9
   1e370:	csel	x8, xzr, x8, cc	// cc = lo, ul, last
   1e374:	subs	x9, x23, #0xc
   1e378:	csel	x9, xzr, x9, cc	// cc = lo, ul, last
   1e37c:	cbz	x24, 1e3dc <fastgzip::enc::scan::<12, true, false>+0x150>
   1e380:	cmp	x24, x8
   1e384:	mov	w17, w28
   1e388:	b.cs	1e3ec <fastgzip::enc::scan::<12, true, false>+0x160>  // b.hs, b.nlast
   1e38c:	b	1e578 <fastgzip::enc::scan::<12, true, false>+0x2ec>
   1e390:	cbz	x21, 1e3a8 <fastgzip::enc::scan::<12, true, false>+0x11c>
   1e394:	ldrb	w8, [x19]
   1e398:	and	w8, w8, #0xfe
   1e39c:	strb	w8, [x19]
   1e3a0:	tbz	w7, #0, 1e36c <fastgzip::enc::scan::<12, true, false>+0xe0>
   1e3a4:	b	1e3b0 <fastgzip::enc::scan::<12, true, false>+0x124>
   1e3a8:	and	x27, x27, #0x7e
   1e3ac:	tbz	w7, #0, 1e36c <fastgzip::enc::scan::<12, true, false>+0xe0>
   1e3b0:	mov	x0, x25
   1e3b4:	mov	w1, wzr
   1e3b8:	mov	w2, #0x2000                	// #8192
   1e3bc:	mov	x26, x30
   1e3c0:	bl	7220 <memset@plt>
   1e3c4:	mov	x30, x26
   1e3c8:	subs	x8, x23, #0x9
   1e3cc:	csel	x8, xzr, x8, cc	// cc = lo, ul, last
   1e3d0:	subs	x9, x23, #0xc
   1e3d4:	csel	x9, xzr, x9, cc	// cc = lo, ul, last
   1e3d8:	cbnz	x24, 1e380 <fastgzip::enc::scan::<12, true, false>+0xf4>
   1e3dc:	cmp	x8, #0x2
   1e3e0:	b.cs	1e544 <fastgzip::enc::scan::<12, true, false>+0x2b8>  // b.hs, b.nlast
   1e3e4:	mov	x24, xzr
   1e3e8:	mov	w17, w28
   1e3ec:	add	x8, x24, #0x4
   1e3f0:	cmp	x8, x23
   1e3f4:	b.ls	1e3fc <fastgzip::enc::scan::<12, true, false>+0x170>  // b.plast
   1e3f8:	b	1e48c <fastgzip::enc::scan::<12, true, false>+0x200>
   1e3fc:	add	x8, x22, #0x1
   1e400:	add	x9, x8, x24
   1e404:	ldurb	w10, [x9, #-1]
   1e408:	ldrb	w11, [x9]
   1e40c:	ldrb	w12, [x9, #1]
   1e410:	ldrb	w9, [x9, #2]
   1e414:	ldr	w10, [x20, x10, lsl #2]
   1e418:	ldr	w11, [x20, x11, lsl #2]
   1e41c:	ldr	w12, [x20, x12, lsl #2]
   1e420:	ldr	w9, [x20, x9, lsl #2]
   1e424:	add	w13, w17, w10, lsr #16
   1e428:	and	x10, x10, #0xffff
   1e42c:	lsl	x10, x10, x17
   1e430:	and	x15, x9, #0xffff
   1e434:	add	w14, w13, w11, lsr #16
   1e438:	and	x11, x11, #0xffff
   1e43c:	lsl	x11, x11, x13
   1e440:	and	x13, x12, #0xffff
   1e444:	orr	x10, x10, x27
   1e448:	add	w12, w14, w12, lsr #16
   1e44c:	lsl	x13, x13, x14
   1e450:	orr	x10, x10, x11
   1e454:	lsl	x11, x15, x12
   1e458:	add	w9, w12, w9, lsr #16
   1e45c:	orr	x10, x10, x13
   1e460:	add	x13, x24, #0x8
   1e464:	add	x24, x24, #0x4
   1e468:	orr	x10, x10, x11
   1e46c:	ubfx	w11, w9, #3, #3
   1e470:	and	w12, w9, #0x38
   1e474:	lsr	x27, x10, x12
   1e478:	str	x10, [x19, x21]
   1e47c:	cmp	x13, x23
   1e480:	add	x21, x21, x11
   1e484:	and	w17, w9, #0xffff8007
   1e488:	b.ls	1e400 <fastgzip::enc::scan::<12, true, false>+0x174>  // b.plast
   1e48c:	subs	x8, x23, x24
   1e490:	b.ls	1e52c <fastgzip::enc::scan::<12, true, false>+0x2a0>  // b.plast
   1e494:	add	x9, x22, x24
   1e498:	ldrb	w10, [x9], #1
   1e49c:	subs	x8, x8, #0x1
   1e4a0:	ldr	w10, [x20, x10, lsl #2]
   1e4a4:	and	x11, x10, #0xffff
   1e4a8:	lsl	x11, x11, x17
   1e4ac:	add	w17, w17, w10, lsr #16
   1e4b0:	orr	x27, x11, x27
   1e4b4:	b.ne	1e498 <fastgzip::enc::scan::<12, true, false>+0x20c>  // b.any
   1e4b8:	ubfx	w8, w17, #3, #3
   1e4bc:	and	w9, w17, #0xffff8007
   1e4c0:	str	x27, [x19, x21]
   1e4c4:	add	x8, x21, x8
   1e4c8:	tbz	x30, #48, 1e4fc <fastgzip::enc::scan::<12, true, false>+0x270>
   1e4cc:	ldr	w10, [x20, #2060]
   1e4d0:	and	w11, w17, #0x38
   1e4d4:	and	w13, w17, #0x7
   1e4d8:	add	w9, w9, w10, lsr #16
   1e4dc:	and	x12, x10, #0xffff
   1e4e0:	lsr	x10, x27, x11
   1e4e4:	lsl	x11, x12, x13
   1e4e8:	ubfx	w12, w9, #3, #3
   1e4ec:	and	w9, w9, #0xffff8007
   1e4f0:	orr	x10, x11, x10
   1e4f4:	str	x10, [x19, x8]
   1e4f8:	add	x8, x8, x12
   1e4fc:	lsl	x8, x8, #3
   1e500:	cmp	w9, #0x7
   1e504:	add	x8, x8, w9, uxtw
   1e508:	csel	x0, xzr, x8, hi	// hi = pmore
   1e50c:	ldp	x20, x19, [sp, #96]
   1e510:	ldp	x22, x21, [sp, #80]
   1e514:	ldp	x24, x23, [sp, #64]
   1e518:	ldp	x26, x25, [sp, #48]
   1e51c:	ldp	x28, x27, [sp, #32]
   1e520:	ldp	x29, x30, [sp, #16]
   1e524:	add	sp, sp, #0x70
   1e528:	ret
   1e52c:	ubfx	w8, w17, #3, #3
   1e530:	and	w9, w17, #0xffff8007
   1e534:	str	x27, [x19, x21]
   1e538:	add	x8, x21, x8
   1e53c:	tbnz	x30, #48, 1e4cc <fastgzip::enc::scan::<12, true, false>+0x240>
   1e540:	b	1e4fc <fastgzip::enc::scan::<12, true, false>+0x270>
   1e544:	ldrb	w10, [x22]
   1e548:	mov	w24, #0x1                   	// #1
   1e54c:	ldr	w10, [x20, x10, lsl #2]
   1e550:	and	x11, x10, #0xffff
   1e554:	add	w10, w28, w10, lsr #16
   1e558:	lsl	x11, x11, x28
   1e55c:	ubfx	w12, w10, #3, #3
   1e560:	and	w13, w10, #0x38
   1e564:	and	w28, w10, #0xffff8007
   1e568:	orr	x11, x11, x27
   1e56c:	str	x11, [x19, x21]
   1e570:	lsr	x27, x11, x13
   1e574:	add	x21, x21, x12
   1e578:	mov	x10, #0x87000000            	// #2264924160
   1e57c:	ldr	x16, [x22, x24]
   1e580:	add	x11, x20, #0x400
   1e584:	movk	x10, #0xebca, lsl #32
   1e588:	add	x12, x20, #0x810
   1e58c:	mov	w13, #0x102                 	// #258
   1e590:	movk	x10, #0xb185, lsl #48
   1e594:	mov	w14, #0x1e                  	// #30
   1e598:	mov	w15, #0xffffffff            	// #-1
   1e59c:	mov	w17, w28
   1e5a0:	mul	x16, x16, x10
   1e5a4:	cmp	x24, x9
   1e5a8:	lsr	x16, x16, #52
   1e5ac:	b.cs	1e6d8 <fastgzip::enc::scan::<12, true, false>+0x44c>  // b.hs, b.nlast
   1e5b0:	ldr	x18, [x22, x24]
   1e5b4:	lsr	x0, x18, #8
   1e5b8:	mul	x1, x0, x10
   1e5bc:	ldrh	w0, [x25, x16, lsl #1]
   1e5c0:	strh	w24, [x25, x16, lsl #1]
   1e5c4:	ldr	x2, [x22, x0]
   1e5c8:	lsr	x16, x1, #52
   1e5cc:	eor	x1, x2, x18
   1e5d0:	cbz	w1, 1e750 <fastgzip::enc::scan::<12, true, false>+0x4c4>
   1e5d4:	add	x2, x22, x24
   1e5d8:	and	x0, x18, #0xff
   1e5dc:	add	w6, w24, #0x1
   1e5e0:	ldur	x18, [x2, #1]
   1e5e4:	ldr	w3, [x20, x0, lsl #2]
   1e5e8:	ldrh	w0, [x25, x16, lsl #1]
   1e5ec:	strh	w6, [x25, x16, lsl #1]
   1e5f0:	lsr	x1, x18, #8
   1e5f4:	and	x4, x3, #0xffff
   1e5f8:	ldr	x5, [x22, x0]
   1e5fc:	lsl	x4, x4, x17
   1e600:	add	w17, w17, w3, lsr #16
   1e604:	mul	x1, x1, x10
   1e608:	orr	x27, x4, x27
   1e60c:	lsr	x16, x1, #52
   1e610:	eor	x1, x5, x18
   1e614:	cbz	w1, 1e864 <fastgzip::enc::scan::<12, true, false>+0x5d8>
   1e618:	and	x0, x18, #0xff
   1e61c:	ldur	x18, [x2, #2]
   1e620:	ldr	w2, [x20, x0, lsl #2]
   1e624:	ldrh	w0, [x25, x16, lsl #1]
   1e628:	lsr	x1, x18, #8
   1e62c:	and	x3, x2, #0xffff
   1e630:	ldr	x4, [x22, x0]
   1e634:	mul	x1, x1, x10
   1e638:	lsl	x3, x3, x17
   1e63c:	add	w17, w17, w2, lsr #16
   1e640:	add	w2, w24, #0x2
   1e644:	strh	w2, [x25, x16, lsl #1]
   1e648:	orr	x27, x3, x27
   1e64c:	lsr	x16, x1, #52
   1e650:	eor	x1, x4, x18
   1e654:	cbz	w1, 1e870 <fastgzip::enc::scan::<12, true, false>+0x5e4>
   1e658:	add	x0, x22, x24
   1e65c:	and	x1, x18, #0xff
   1e660:	add	w5, w24, #0x3
   1e664:	ldur	x18, [x0, #3]
   1e668:	ldr	w1, [x20, x1, lsl #2]
   1e66c:	lsr	x0, x18, #8
   1e670:	and	x3, x1, #0xffff
   1e674:	lsl	x3, x3, x17
   1e678:	add	w17, w17, w1, lsr #16
   1e67c:	mul	x2, x0, x10
   1e680:	ldrh	w0, [x25, x16, lsl #1]
   1e684:	strh	w5, [x25, x16, lsl #1]
   1e688:	orr	x27, x3, x27
   1e68c:	ldr	x4, [x22, x0]
   1e690:	eor	x1, x4, x18
   1e694:	lsr	x16, x2, #52
   1e698:	cbz	w1, 1e87c <fastgzip::enc::scan::<12, true, false>+0x5f0>
   1e69c:	and	x18, x18, #0xff
   1e6a0:	add	x24, x24, #0x4
   1e6a4:	ldr	w18, [x20, x18, lsl #2]
   1e6a8:	cmp	x24, x9
   1e6ac:	and	x0, x18, #0xffff
   1e6b0:	lsl	x0, x0, x17
   1e6b4:	add	w17, w17, w18, lsr #16
   1e6b8:	orr	x18, x0, x27
   1e6bc:	ubfx	w0, w17, #3, #3
   1e6c0:	and	w1, w17, #0x38
   1e6c4:	lsr	x27, x18, x1
   1e6c8:	str	x18, [x19, x21]
   1e6cc:	and	w17, w17, #0xffff8007
   1e6d0:	add	x21, x21, x0
   1e6d4:	b.cc	1e5b0 <fastgzip::enc::scan::<12, true, false>+0x324>  // b.lo, b.ul, b.last
   1e6d8:	cmp	x24, x8
   1e6dc:	mov	w2, w17
   1e6e0:	b.cs	1e3ec <fastgzip::enc::scan::<12, true, false>+0x160>  // b.hs, b.nlast
   1e6e4:	ldr	x18, [x22, x24]
   1e6e8:	ldrh	w0, [x25, x16, lsl #1]
   1e6ec:	strh	w24, [x25, x16, lsl #1]
   1e6f0:	lsr	x17, x18, #8
   1e6f4:	ldr	x1, [x22, x0]
   1e6f8:	mul	x17, x17, x10
   1e6fc:	eor	x1, x1, x18
   1e700:	lsr	x16, x17, #52
   1e704:	cbz	w1, 1e74c <fastgzip::enc::scan::<12, true, false>+0x4c0>
   1e708:	and	x17, x18, #0xff
   1e70c:	add	x24, x24, #0x1
   1e710:	ldr	w17, [x20, x17, lsl #2]
   1e714:	cmp	x24, x8
   1e718:	and	x18, x17, #0xffff
   1e71c:	add	w17, w2, w17, lsr #16
   1e720:	lsl	x18, x18, x2
   1e724:	ubfx	w0, w17, #3, #3
   1e728:	and	w1, w17, #0x38
   1e72c:	and	w17, w17, #0xffff8007
   1e730:	orr	x18, x18, x27
   1e734:	str	x18, [x19, x21]
   1e738:	lsr	x27, x18, x1
   1e73c:	add	x21, x21, x0
   1e740:	mov	w2, w17
   1e744:	b.cc	1e6e4 <fastgzip::enc::scan::<12, true, false>+0x458>  // b.lo, b.ul, b.last
   1e748:	b	1e3ec <fastgzip::enc::scan::<12, true, false>+0x160>
   1e74c:	mov	w17, w2
   1e750:	cbz	x1, 1e884 <fastgzip::enc::scan::<12, true, false>+0x5f8>
   1e754:	rbit	x1, x1
   1e758:	clz	x1, x1
   1e75c:	lsr	x1, x1, #3
   1e760:	mvn	w0, w0
   1e764:	add	w0, w0, w24
   1e768:	cmp	w0, #0x2
   1e76c:	clz	w2, w0
   1e770:	mov	w3, w0
   1e774:	b.cc	1e78c <fastgzip::enc::scan::<12, true, false>+0x500>  // b.lo, b.ul, b.last
   1e778:	sub	w3, w14, w2
   1e77c:	lsr	w3, w0, w3
   1e780:	and	w3, w3, #0x1
   1e784:	sub	w3, w3, w2, lsl #1
   1e788:	add	w3, w3, #0x3e
   1e78c:	ldr	w4, [x11, x1, lsl #2]
   1e790:	subs	w2, w14, w2
   1e794:	ldr	w3, [x12, w3, uxtw #2]
   1e798:	csel	w2, wzr, w2, cc	// cc = lo, ul, last
   1e79c:	lsr	x18, x18, #16
   1e7a0:	and	w6, w17, #0x38
   1e7a4:	ubfx	x5, x4, #19, #5
   1e7a8:	lsl	w7, w15, w2
   1e7ac:	and	x26, x3, #0xffff
   1e7b0:	and	x4, x4, #0x7ffff
   1e7b4:	mul	x18, x18, x10
   1e7b8:	lsr	x6, x27, x6
   1e7bc:	add	w3, w5, w3, lsr #16
   1e7c0:	bic	w0, w0, w7
   1e7c4:	lsl	x5, x26, x5
   1e7c8:	ubfx	w7, w17, #3, #3
   1e7cc:	str	x27, [x19, x21]
   1e7d0:	lsl	x0, x0, x3
   1e7d4:	orr	x4, x5, x4
   1e7d8:	and	w5, w17, #0xffff8007
   1e7dc:	and	w17, w17, #0x7
   1e7e0:	add	w2, w2, w5
   1e7e4:	add	w5, w24, #0x2
   1e7e8:	orr	x0, x4, x0
   1e7ec:	add	w4, w24, #0x1
   1e7f0:	add	x24, x1, x24
   1e7f4:	lsl	x17, x0, x17
   1e7f8:	add	w1, w2, w3
   1e7fc:	lsr	x18, x18, #51
   1e800:	and	w2, w1, #0x38
   1e804:	ubfx	w3, w1, #3, #3
   1e808:	add	x0, x21, x7
   1e80c:	orr	x17, x17, x6
   1e810:	str	x17, [x19, x0]
   1e814:	cmp	x24, x8
   1e818:	lsr	x27, x17, x2
   1e81c:	strh	w4, [x25, x16, lsl #1]
   1e820:	and	x16, x18, #0x1ffe
   1e824:	add	x21, x0, x3
   1e828:	and	w17, w1, #0xffff8007
   1e82c:	strh	w5, [x25, x16]
   1e830:	b.cs	1e3ec <fastgzip::enc::scan::<12, true, false>+0x160>  // b.hs, b.nlast
   1e834:	sub	x18, x24, #0x1
   1e838:	ldr	x16, [x22, x18]
   1e83c:	mul	x0, x16, x10
   1e840:	lsr	x16, x16, #8
   1e844:	lsr	x0, x0, #51
   1e848:	and	x0, x0, #0x1ffe
   1e84c:	strh	w18, [x25, x0]
   1e850:	mul	x16, x16, x10
   1e854:	cmp	x24, x9
   1e858:	lsr	x16, x16, #52
   1e85c:	b.cc	1e5b0 <fastgzip::enc::scan::<12, true, false>+0x324>  // b.lo, b.ul, b.last
   1e860:	b	1e6d8 <fastgzip::enc::scan::<12, true, false>+0x44c>
   1e864:	add	x24, x24, #0x1
   1e868:	cbnz	x1, 1e754 <fastgzip::enc::scan::<12, true, false>+0x4c8>
   1e86c:	b	1e884 <fastgzip::enc::scan::<12, true, false>+0x5f8>
   1e870:	add	x24, x24, #0x2
   1e874:	cbnz	x1, 1e754 <fastgzip::enc::scan::<12, true, false>+0x4c8>
   1e878:	b	1e884 <fastgzip::enc::scan::<12, true, false>+0x5f8>
   1e87c:	add	x24, x24, #0x3
   1e880:	cbnz	x1, 1e754 <fastgzip::enc::scan::<12, true, false>+0x4c8>
   1e884:	sub	x1, x23, x24
   1e888:	add	x3, x22, x24
   1e88c:	add	x4, x22, x0
   1e890:	cmp	x1, #0x102
   1e894:	csel	x2, x1, x13, cc	// cc = lo, ul, last
   1e898:	cmp	x1, #0x10
   1e89c:	b.cs	1e8a8 <fastgzip::enc::scan::<12, true, false>+0x61c>  // b.hs, b.nlast
   1e8a0:	mov	w1, #0x8                   	// #8
   1e8a4:	b	1e8d0 <fastgzip::enc::scan::<12, true, false>+0x644>
   1e8a8:	mov	w5, #0x8                   	// #8
   1e8ac:	ldr	x1, [x3, x5]
   1e8b0:	ldr	x6, [x4, x5]
   1e8b4:	cmp	x1, x6
   1e8b8:	b.ne	1e8fc <fastgzip::enc::scan::<12, true, false>+0x670>  // b.any
   1e8bc:	add	x6, x5, #0x10
   1e8c0:	add	x1, x5, #0x8
   1e8c4:	cmp	x6, x2
   1e8c8:	mov	x5, x1
   1e8cc:	b.ls	1e8ac <fastgzip::enc::scan::<12, true, false>+0x620>  // b.plast
   1e8d0:	cmp	x1, x2
   1e8d4:	b.cs	1e760 <fastgzip::enc::scan::<12, true, false>+0x4d4>  // b.hs, b.nlast
   1e8d8:	ldrb	w5, [x3, x1]
   1e8dc:	ldrb	w6, [x4, x1]
   1e8e0:	cmp	w5, w6
   1e8e4:	b.ne	1e760 <fastgzip::enc::scan::<12, true, false>+0x4d4>  // b.any
   1e8e8:	add	x1, x1, #0x1
   1e8ec:	cmp	x2, x1
   1e8f0:	b.ne	1e8d8 <fastgzip::enc::scan::<12, true, false>+0x64c>  // b.any
   1e8f4:	mov	x1, x2
   1e8f8:	b	1e760 <fastgzip::enc::scan::<12, true, false>+0x4d4>
   1e8fc:	eor	x1, x6, x1
   1e900:	rbit	x1, x1
   1e904:	clz	x1, x1
   1e908:	add	x1, x5, x1, lsr #3
   1e90c:	b	1e760 <fastgzip::enc::scan::<12, true, false>+0x4d4>
   1e910:	adrp	x2, bc000 <anon.02463b4e5bcdc859ab4d5b570b603b99.19.llvm.14395592185925608577+0x8>
   1e914:	add	x2, x2, #0x140
   1e918:	mov	x0, x21
   1e91c:	mov	w1, #0x240                 	// #576
   1e920:	bl	dcd0 <core::panicking::panic_bounds_check>
