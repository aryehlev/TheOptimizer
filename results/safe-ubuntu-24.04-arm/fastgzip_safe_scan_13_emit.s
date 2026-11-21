00000000000321ac <fastgzip_safe::enc::scan::<13, true, false>>:
   321ac:	sub	sp, sp, #0x80
   321b0:	stp	x29, x30, [sp, #32]
   321b4:	stp	x28, x27, [sp, #48]
   321b8:	stp	x26, x25, [sp, #64]
   321bc:	stp	x24, x23, [sp, #80]
   321c0:	stp	x22, x21, [sp, #96]
   321c4:	stp	x20, x19, [sp, #112]
   321c8:	add	x29, sp, #0x20
   321cc:	ldp	x26, x8, [x29, #96]
   321d0:	and	w9, w6, #0xffff
   321d4:	subs	w10, w9, #0x9
   321d8:	ldr	w11, [x29, #112]
   321dc:	mov	w27, w6
   321e0:	csel	w24, wzr, w10, cc	// cc = lo, ul, last
   321e4:	subs	w9, w9, #0xc
   321e8:	mov	x21, x4
   321ec:	ubfx	x20, x8, #3, #16
   321f0:	mov	x22, x1
   321f4:	mov	x19, x0
   321f8:	csel	w30, wzr, w9, cc	// cc = lo, ul, last
   321fc:	stur	w11, [x29, #-4]
   32200:	tbz	w11, #0, 32240 <fastgzip_safe::enc::scan::<13, true, false>+0x94>
   32204:	ldr	w28, [x19, #3204]
   32208:	lsr	x23, x28, #3
   3220c:	cmp	w28, #0x400
   32210:	b.cs	322e4 <fastgzip_safe::enc::scan::<13, true, false>+0x138>  // b.hs, b.nlast
   32214:	add	x8, x19, #0xc88
   32218:	add	x9, x26, x20
   3221c:	ldp	q0, q1, [x8, #64]
   32220:	stp	q0, q1, [x9, #64]
   32224:	ldp	q0, q2, [x8, #96]
   32228:	stp	q0, q2, [x9, #96]
   3222c:	ldp	q1, q0, [x8]
   32230:	stp	q1, q0, [x9]
   32234:	ldp	q2, q0, [x8, #32]
   32238:	stp	q2, q0, [x9, #32]
   3223c:	b	3233c <fastgzip_safe::enc::scan::<13, true, false>+0x190>
   32240:	and	x9, x8, #0x7
   32244:	mov	x10, #0xffffffffffffffff    	// #-1
   32248:	ldrb	w11, [x26, x20]
   3224c:	lsl	x9, x10, x9
   32250:	and	w25, w8, #0x7
   32254:	bic	x28, x11, x9
   32258:	tbz	w7, #0, 32284 <fastgzip_safe::enc::scan::<13, true, false>+0xd8>
   3225c:	mov	x0, x22
   32260:	mov	w1, wzr
   32264:	mov	w2, #0x4000                	// #16384
   32268:	mov	x23, x30
   3226c:	str	x24, [sp, #16]
   32270:	mov	x24, x5
   32274:	bl	60d0 <memset@plt>
   32278:	mov	x5, x24
   3227c:	ldr	x24, [sp, #16]
   32280:	mov	x30, x23
   32284:	tst	w5, #0xffff
   32288:	and	x1, x27, #0xffff
   3228c:	b.eq	322c0 <fastgzip_safe::enc::scan::<13, true, false>+0x114>  // b.none
   32290:	and	w8, w5, #0xffff
   32294:	and	x0, x5, #0xffff
   32298:	cmp	w8, w24, uxth
   3229c:	b.cc	323b4 <fastgzip_safe::enc::scan::<13, true, false>+0x208>  // b.lo, b.ul, b.last
   322a0:	cmp	x0, x1
   322a4:	b.hi	32904 <fastgzip_safe::enc::scan::<13, true, false>+0x758>  // b.pmore
   322a8:	sub	x11, x1, x0
   322ac:	add	x10, x21, x0
   322b0:	ands	x9, x11, #0xfffc
   322b4:	and	x8, x11, #0x3
   322b8:	b.ne	32778 <fastgzip_safe::enc::scan::<13, true, false>+0x5cc>  // b.any
   322bc:	b	3280c <fastgzip_safe::enc::scan::<13, true, false>+0x660>
   322c0:	and	w8, w24, #0xffff
   322c4:	cmp	w8, #0x2
   322c8:	b.cs	3237c <fastgzip_safe::enc::scan::<13, true, false>+0x1d0>  // b.hs, b.nlast
   322cc:	sub	x11, x1, xzr
   322d0:	add	x10, x21, xzr
   322d4:	ands	x9, x11, #0xfffc
   322d8:	and	x8, x11, #0x3
   322dc:	b.ne	32778 <fastgzip_safe::enc::scan::<13, true, false>+0x5cc>  // b.any
   322e0:	b	322bc <fastgzip_safe::enc::scan::<13, true, false>+0x110>
   322e4:	mov	w8, #0x80                  	// #128
   322e8:	add	x1, x23, x20
   322ec:	movk	w8, #0x1, lsl #16
   322f0:	orr	x8, x8, #0x1
   322f4:	cmp	x1, x8
   322f8:	b.cs	32934 <fastgzip_safe::enc::scan::<13, true, false>+0x788>  // b.hs, b.nlast
   322fc:	lsr	w8, w28, #3
   32300:	cmp	w8, #0x241
   32304:	b.cs	3291c <fastgzip_safe::enc::scan::<13, true, false>+0x770>  // b.hs, b.nlast
   32308:	add	x0, x26, x20
   3230c:	add	x1, x19, #0xc88
   32310:	mov	x2, x23
   32314:	stp	x5, x24, [sp, #8]
   32318:	mov	w24, w7
   3231c:	mov	x25, x30
   32320:	bl	5f10 <memcpy@plt>
   32324:	mov	w7, w24
   32328:	ldp	x5, x24, [sp, #8]
   3232c:	lsr	w8, w28, #9
   32330:	mov	x30, x25
   32334:	cmp	w8, #0x9
   32338:	b.cs	3294c <fastgzip_safe::enc::scan::<13, true, false>+0x7a0>  // b.hs, b.nlast
   3233c:	add	x9, x19, x23
   32340:	and	x8, x28, #0x7
   32344:	mov	x10, #0xffffffffffffffff    	// #-1
   32348:	ldrb	w9, [x9, #3208]
   3234c:	lsl	x10, x10, x8
   32350:	bic	x28, x9, x10
   32354:	ldur	w9, [x29, #-4]
   32358:	tbnz	w9, #8, 3236c <fastgzip_safe::enc::scan::<13, true, false>+0x1c0>
   3235c:	cbz	x23, 328f0 <fastgzip_safe::enc::scan::<13, true, false>+0x744>
   32360:	ldrb	w9, [x26, x20]
   32364:	and	w9, w9, #0xfe
   32368:	strb	w9, [x26, x20]
   3236c:	add	x20, x23, x20
   32370:	mov	w25, w8
   32374:	tbnz	w7, #0, 3225c <fastgzip_safe::enc::scan::<13, true, false>+0xb0>
   32378:	b	32284 <fastgzip_safe::enc::scan::<13, true, false>+0xd8>
   3237c:	ldrb	w8, [x21]
   32380:	and	x10, x20, #0xffff
   32384:	mov	w0, #0x1                   	// #1
   32388:	ldr	w8, [x19, x8, lsl #2]
   3238c:	and	x9, x8, #0xffff
   32390:	add	w8, w25, w8, lsr #16
   32394:	lsl	x9, x9, x25
   32398:	ubfx	w11, w8, #3, #3
   3239c:	and	w12, w8, #0x38
   323a0:	and	w25, w8, #0xffff8007
   323a4:	orr	x9, x9, x28
   323a8:	str	x9, [x26, x10]
   323ac:	lsr	x28, x9, x12
   323b0:	add	x20, x20, x11
   323b4:	mov	x8, #0x87000000            	// #2264924160
   323b8:	ldr	x15, [x21, x0]
   323bc:	add	x9, x24, #0x9
   323c0:	movk	x8, #0xebca, lsl #32
   323c4:	add	x10, x19, #0x400
   323c8:	add	x11, x19, #0xc04
   323cc:	movk	x8, #0xb185, lsl #48
   323d0:	mov	w12, #0x102                 	// #258
   323d4:	mov	w13, #0x1e                  	// #30
   323d8:	mov	w14, #0xffffffff            	// #-1
   323dc:	mul	x15, x15, x8
   323e0:	cmp	x0, x30
   323e4:	lsr	x15, x15, #51
   323e8:	b.cs	325c4 <fastgzip_safe::enc::scan::<13, true, false>+0x418>  // b.hs, b.nlast
   323ec:	ldr	x16, [x21, x0]
   323f0:	lsr	x17, x16, #8
   323f4:	mul	x18, x17, x8
   323f8:	ldrh	w17, [x22, x15, lsl #1]
   323fc:	strh	w0, [x22, x15, lsl #1]
   32400:	ldr	x2, [x21, x17]
   32404:	lsr	x15, x18, #51
   32408:	eor	x18, x2, x16
   3240c:	cbz	w18, 3263c <fastgzip_safe::enc::scan::<13, true, false>+0x490>
   32410:	add	x2, x21, x0
   32414:	and	x17, x16, #0xff
   32418:	add	w6, w0, #0x1
   3241c:	ldur	x16, [x2, #1]
   32420:	ldr	w3, [x19, x17, lsl #2]
   32424:	ldrh	w17, [x22, x15, lsl #1]
   32428:	strh	w6, [x22, x15, lsl #1]
   3242c:	lsr	x18, x16, #8
   32430:	and	x4, x3, #0xffff
   32434:	ldr	x5, [x21, x17]
   32438:	lsl	x4, x4, x25
   3243c:	add	w25, w25, w3, lsr #16
   32440:	mul	x18, x18, x8
   32444:	orr	x28, x4, x28
   32448:	lsr	x15, x18, #51
   3244c:	eor	x18, x5, x16
   32450:	cbz	w18, 3251c <fastgzip_safe::enc::scan::<13, true, false>+0x370>
   32454:	and	x17, x16, #0xff
   32458:	ldur	x16, [x2, #2]
   3245c:	ldr	w2, [x19, x17, lsl #2]
   32460:	ldrh	w17, [x22, x15, lsl #1]
   32464:	lsr	x18, x16, #8
   32468:	and	x3, x2, #0xffff
   3246c:	ldr	x4, [x21, x17]
   32470:	mul	x18, x18, x8
   32474:	lsl	x3, x3, x25
   32478:	add	w25, w25, w2, lsr #16
   3247c:	add	w2, w0, #0x2
   32480:	strh	w2, [x22, x15, lsl #1]
   32484:	orr	x28, x3, x28
   32488:	lsr	x15, x18, #51
   3248c:	eor	x18, x4, x16
   32490:	cbz	w18, 32598 <fastgzip_safe::enc::scan::<13, true, false>+0x3ec>
   32494:	add	x17, x21, x0
   32498:	and	x18, x16, #0xff
   3249c:	add	w5, w0, #0x3
   324a0:	ldur	x16, [x17, #3]
   324a4:	ldr	w18, [x19, x18, lsl #2]
   324a8:	lsr	x17, x16, #8
   324ac:	and	x3, x18, #0xffff
   324b0:	lsl	x3, x3, x25
   324b4:	add	w25, w25, w18, lsr #16
   324b8:	mul	x2, x17, x8
   324bc:	ldrh	w17, [x22, x15, lsl #1]
   324c0:	strh	w5, [x22, x15, lsl #1]
   324c4:	orr	x28, x3, x28
   324c8:	ldr	x4, [x21, x17]
   324cc:	eor	x18, x4, x16
   324d0:	lsr	x15, x2, #51
   324d4:	cbz	w18, 325a4 <fastgzip_safe::enc::scan::<13, true, false>+0x3f8>
   324d8:	and	x16, x16, #0xff
   324dc:	add	x0, x0, #0x4
   324e0:	and	x3, x20, #0xffff
   324e4:	ldr	w16, [x19, x16, lsl #2]
   324e8:	cmp	x0, x30
   324ec:	and	x17, x16, #0xffff
   324f0:	add	w16, w25, w16, lsr #16
   324f4:	lsl	x17, x17, x25
   324f8:	ubfx	w18, w16, #3, #3
   324fc:	and	w2, w16, #0x38
   32500:	and	w25, w16, #0xffff8007
   32504:	orr	x17, x17, x28
   32508:	str	x17, [x26, x3]
   3250c:	lsr	x28, x17, x2
   32510:	add	x20, x20, x18
   32514:	b.cc	323ec <fastgzip_safe::enc::scan::<13, true, false>+0x240>  // b.lo, b.ul, b.last
   32518:	b	325c4 <fastgzip_safe::enc::scan::<13, true, false>+0x418>
   3251c:	add	x0, x0, #0x1
   32520:	cbnz	x18, 32640 <fastgzip_safe::enc::scan::<13, true, false>+0x494>
   32524:	sub	x2, x9, x0
   32528:	add	x3, x21, x17
   3252c:	cmp	x2, #0x102
   32530:	csel	x18, x2, x12, cc	// cc = lo, ul, last
   32534:	cmp	x2, #0x10
   32538:	add	x2, x21, x0
   3253c:	b.cs	32548 <fastgzip_safe::enc::scan::<13, true, false>+0x39c>  // b.hs, b.nlast
   32540:	mov	w5, #0x8                   	// #8
   32544:	b	32570 <fastgzip_safe::enc::scan::<13, true, false>+0x3c4>
   32548:	mov	w4, #0x8                   	// #8
   3254c:	ldr	x5, [x2, x4]
   32550:	ldr	x6, [x3, x4]
   32554:	cmp	x5, x6
   32558:	b.ne	325b0 <fastgzip_safe::enc::scan::<13, true, false>+0x404>  // b.any
   3255c:	add	x6, x4, #0x10
   32560:	add	x5, x4, #0x8
   32564:	cmp	x6, x18
   32568:	mov	x4, x5
   3256c:	b.ls	3254c <fastgzip_safe::enc::scan::<13, true, false>+0x3a0>  // b.plast
   32570:	cmp	x5, x18
   32574:	b.cs	3264c <fastgzip_safe::enc::scan::<13, true, false>+0x4a0>  // b.hs, b.nlast
   32578:	subs	x4, x18, #0x8
   3257c:	csel	x4, xzr, x4, cc	// cc = lo, ul, last
   32580:	ldr	x2, [x2, x4]
   32584:	ldr	x3, [x3, x4]
   32588:	cmp	x2, x3
   3258c:	b.eq	3264c <fastgzip_safe::enc::scan::<13, true, false>+0x4a0>  // b.none
   32590:	eor	x18, x3, x2
   32594:	b	325b4 <fastgzip_safe::enc::scan::<13, true, false>+0x408>
   32598:	add	x0, x0, #0x2
   3259c:	cbnz	x18, 32640 <fastgzip_safe::enc::scan::<13, true, false>+0x494>
   325a0:	b	32524 <fastgzip_safe::enc::scan::<13, true, false>+0x378>
   325a4:	add	x0, x0, #0x3
   325a8:	cbnz	x18, 32640 <fastgzip_safe::enc::scan::<13, true, false>+0x494>
   325ac:	b	32524 <fastgzip_safe::enc::scan::<13, true, false>+0x378>
   325b0:	eor	x18, x6, x5
   325b4:	rbit	x18, x18
   325b8:	clz	x18, x18
   325bc:	add	x18, x4, x18, lsr #3
   325c0:	b	3264c <fastgzip_safe::enc::scan::<13, true, false>+0x4a0>
   325c4:	cmp	x0, x24
   325c8:	mov	w2, w25
   325cc:	b.cs	322a0 <fastgzip_safe::enc::scan::<13, true, false>+0xf4>  // b.hs, b.nlast
   325d0:	ldr	x16, [x21, x0]
   325d4:	lsr	x17, x16, #8
   325d8:	mul	x18, x17, x8
   325dc:	ldrh	w17, [x22, x15, lsl #1]
   325e0:	strh	w0, [x22, x15, lsl #1]
   325e4:	ldr	x3, [x21, x17]
   325e8:	lsr	x15, x18, #51
   325ec:	eor	x18, x3, x16
   325f0:	cbz	w18, 32638 <fastgzip_safe::enc::scan::<13, true, false>+0x48c>
   325f4:	and	x16, x16, #0xff
   325f8:	add	x0, x0, #0x1
   325fc:	and	x3, x20, #0xffff
   32600:	ldr	w16, [x19, x16, lsl #2]
   32604:	cmp	x24, x0
   32608:	and	x17, x16, #0xffff
   3260c:	add	w16, w2, w16, lsr #16
   32610:	lsl	x17, x17, x2
   32614:	ubfx	w18, w16, #3, #3
   32618:	and	w2, w16, #0x38
   3261c:	orr	x17, x17, x28
   32620:	str	x17, [x26, x3]
   32624:	lsr	x28, x17, x2
   32628:	add	x20, x20, x18
   3262c:	and	w2, w16, #0xffff8007
   32630:	b.ne	325d0 <fastgzip_safe::enc::scan::<13, true, false>+0x424>  // b.any
   32634:	b	32760 <fastgzip_safe::enc::scan::<13, true, false>+0x5b4>
   32638:	mov	w25, w2
   3263c:	cbz	x18, 32524 <fastgzip_safe::enc::scan::<13, true, false>+0x378>
   32640:	rbit	x18, x18
   32644:	clz	x18, x18
   32648:	lsr	x18, x18, #3
   3264c:	mvn	w17, w17
   32650:	and	x4, x18, #0x1ff
   32654:	and	x5, x20, #0xffff
   32658:	add	w17, w17, w0
   3265c:	ldr	w4, [x10, x4, lsl #2]
   32660:	str	x28, [x26, x5]
   32664:	clz	w2, w17
   32668:	cmp	w17, #0x2
   3266c:	lsr	x16, x16, #16
   32670:	sub	w3, w13, w2
   32674:	ubfx	x7, x4, #19, #5
   32678:	and	x4, x4, #0x7ffff
   3267c:	lsr	w3, w17, w3
   32680:	mul	x16, x16, x8
   32684:	and	w6, w25, #0x38
   32688:	lsr	x6, x28, x6
   3268c:	and	w3, w3, #0x1
   32690:	sub	w3, w3, w2, lsl #1
   32694:	add	w3, w3, #0x3e
   32698:	lsr	x16, x16, #50
   3269c:	csel	w3, w17, w3, cc	// cc = lo, ul, last
   326a0:	subs	w2, w13, w2
   326a4:	and	w3, w3, #0x1f
   326a8:	csel	w2, wzr, w2, cc	// cc = lo, ul, last
   326ac:	ldr	w3, [x11, w3, uxtw #2]
   326b0:	lsl	w5, w14, w2
   326b4:	and	x23, x3, #0xffff
   326b8:	add	w3, w7, w3, lsr #16
   326bc:	bic	w17, w17, w5
   326c0:	lsl	x5, x23, x7
   326c4:	and	w23, w25, #0x7
   326c8:	ubfx	w7, w25, #3, #3
   326cc:	lsl	x17, x17, x3
   326d0:	orr	x4, x5, x4
   326d4:	and	w5, w25, #0xffff8007
   326d8:	add	x7, x20, x7
   326dc:	orr	x17, x4, x17
   326e0:	add	w2, w2, w5
   326e4:	add	w20, w0, #0x1
   326e8:	lsl	x17, x17, x23
   326ec:	add	w2, w2, w3
   326f0:	add	w4, w0, #0x2
   326f4:	and	w3, w2, #0x38
   326f8:	ubfx	w5, w2, #3, #3
   326fc:	add	x0, x18, x0
   32700:	orr	x17, x17, x6
   32704:	and	x18, x7, #0xffff
   32708:	strh	w20, [x22, x15, lsl #1]
   3270c:	lsr	x28, x17, x3
   32710:	and	x15, x16, #0x3ffe
   32714:	cmp	x0, x24
   32718:	add	x20, x7, x5
   3271c:	and	w25, w2, #0xffff8007
   32720:	str	x17, [x26, x18]
   32724:	strh	w4, [x22, x15]
   32728:	b.cs	322a0 <fastgzip_safe::enc::scan::<13, true, false>+0xf4>  // b.hs, b.nlast
   3272c:	sub	w16, w0, #0x1
   32730:	and	x15, x16, #0xffff
   32734:	ldr	x15, [x21, x15]
   32738:	mul	x17, x15, x8
   3273c:	lsr	x15, x15, #8
   32740:	lsr	x17, x17, #50
   32744:	and	x17, x17, #0x3ffe
   32748:	strh	w16, [x22, x17]
   3274c:	mul	x15, x15, x8
   32750:	cmp	x0, x30
   32754:	lsr	x15, x15, #51
   32758:	b.cc	323ec <fastgzip_safe::enc::scan::<13, true, false>+0x240>  // b.lo, b.ul, b.last
   3275c:	b	325c4 <fastgzip_safe::enc::scan::<13, true, false>+0x418>
   32760:	mov	w25, w2
   32764:	sub	x11, x1, x24
   32768:	add	x10, x21, x24
   3276c:	ands	x9, x11, #0xfffc
   32770:	and	x8, x11, #0x3
   32774:	b.eq	322bc <fastgzip_safe::enc::scan::<13, true, false>+0x110>  // b.none
   32778:	and	x11, x11, #0xfffc
   3277c:	mov	x12, x10
   32780:	neg	x11, x11
   32784:	ldrb	w13, [x12]
   32788:	ldrb	w14, [x12, #1]
   3278c:	adds	x11, x11, #0x4
   32790:	ldrb	w15, [x12, #2]
   32794:	ldrb	w17, [x12, #3]
   32798:	add	x12, x12, #0x4
   3279c:	ldr	w13, [x19, x13, lsl #2]
   327a0:	ldr	w14, [x19, x14, lsl #2]
   327a4:	ldr	w15, [x19, x15, lsl #2]
   327a8:	ldr	w17, [x19, x17, lsl #2]
   327ac:	add	w16, w25, w13, lsr #16
   327b0:	and	x13, x13, #0xffff
   327b4:	lsl	x13, x13, x25
   327b8:	and	x0, x17, #0xffff
   327bc:	add	w18, w16, w14, lsr #16
   327c0:	and	x14, x14, #0xffff
   327c4:	lsl	x14, x14, x16
   327c8:	and	x16, x15, #0xffff
   327cc:	orr	x13, x13, x28
   327d0:	add	w15, w18, w15, lsr #16
   327d4:	lsl	x16, x16, x18
   327d8:	orr	x13, x13, x14
   327dc:	lsl	x14, x0, x15
   327e0:	add	w15, w15, w17, lsr #16
   327e4:	orr	x13, x13, x16
   327e8:	orr	x13, x13, x14
   327ec:	ubfx	w16, w15, #3, #3
   327f0:	and	w17, w15, #0x38
   327f4:	lsr	x28, x13, x17
   327f8:	and	x14, x20, #0xffff
   327fc:	and	w25, w15, #0xffff8007
   32800:	add	x20, x20, x16
   32804:	str	x13, [x26, x14]
   32808:	b.ne	32784 <fastgzip_safe::enc::scan::<13, true, false>+0x5d8>  // b.any
   3280c:	cbz	x8, 32870 <fastgzip_safe::enc::scan::<13, true, false>+0x6c4>
   32810:	add	x9, x10, x9
   32814:	cmp	x8, #0x1
   32818:	ldrb	w10, [x9]
   3281c:	ldr	w10, [x19, x10, lsl #2]
   32820:	and	x11, x10, #0xffff
   32824:	lsl	x11, x11, x25
   32828:	add	w25, w25, w10, lsr #16
   3282c:	orr	x28, x11, x28
   32830:	b.eq	32854 <fastgzip_safe::enc::scan::<13, true, false>+0x6a8>  // b.none
   32834:	ldrb	w10, [x9, #1]
   32838:	cmp	x8, #0x2
   3283c:	ldr	w10, [x19, x10, lsl #2]
   32840:	and	x11, x10, #0xffff
   32844:	lsl	x11, x11, x25
   32848:	add	w25, w25, w10, lsr #16
   3284c:	orr	x28, x11, x28
   32850:	b.ne	32858 <fastgzip_safe::enc::scan::<13, true, false>+0x6ac>  // b.any
   32854:	b	32870 <fastgzip_safe::enc::scan::<13, true, false>+0x6c4>
   32858:	ldrb	w8, [x9, #2]
   3285c:	ldr	w8, [x19, x8, lsl #2]
   32860:	and	x9, x8, #0xffff
   32864:	lsl	x9, x9, x25
   32868:	add	w25, w25, w8, lsr #16
   3286c:	orr	x28, x9, x28
   32870:	ubfx	w8, w25, #3, #3
   32874:	and	x9, x20, #0xffff
   32878:	ldur	w10, [x29, #-4]
   3287c:	str	x28, [x26, x9]
   32880:	and	w9, w25, #0xffff8007
   32884:	add	x8, x20, x8
   32888:	tbz	w10, #16, 328c0 <fastgzip_safe::enc::scan::<13, true, false>+0x714>
   3288c:	ldr	w10, [x19, #3072]
   32890:	and	w11, w25, #0x38
   32894:	and	w13, w25, #0x7
   32898:	add	w9, w9, w10, lsr #16
   3289c:	and	x12, x10, #0xffff
   328a0:	lsr	x10, x28, x11
   328a4:	lsl	x11, x12, x13
   328a8:	ubfx	w12, w9, #3, #3
   328ac:	and	w9, w9, #0xffff8007
   328b0:	orr	x10, x11, x10
   328b4:	and	x11, x8, #0xffff
   328b8:	add	x8, x8, x12
   328bc:	str	x10, [x26, x11]
   328c0:	lsl	x8, x8, #3
   328c4:	cmp	w9, #0x7
   328c8:	add	x8, x8, w9, uxtw
   328cc:	csel	x0, xzr, x8, hi	// hi = pmore
   328d0:	ldp	x20, x19, [sp, #112]
   328d4:	ldp	x22, x21, [sp, #96]
   328d8:	ldp	x24, x23, [sp, #80]
   328dc:	ldp	x26, x25, [sp, #64]
   328e0:	ldp	x28, x27, [sp, #48]
   328e4:	ldp	x29, x30, [sp, #32]
   328e8:	add	sp, sp, #0x80
   328ec:	ret
   328f0:	and	x28, x28, #0x7e
   328f4:	add	x20, x23, x20
   328f8:	mov	w25, w8
   328fc:	tbnz	w7, #0, 3225c <fastgzip_safe::enc::scan::<13, true, false>+0xb0>
   32900:	b	32284 <fastgzip_safe::enc::scan::<13, true, false>+0xd8>
   32904:	mov	w8, #0x80                  	// #128
   32908:	adrp	x3, bd000 <anon.7a263ad2a3e00f1d3c23c4bfb0e9541b.29.llvm.2438094699631020562+0x40>
   3290c:	add	x3, x3, #0x368
   32910:	movk	w8, #0x1, lsl #16
   32914:	add	x2, x8, #0x88
   32918:	bl	dd60 <core::slice::index::slice_index_fail>
   3291c:	adrp	x3, bd000 <anon.7a263ad2a3e00f1d3c23c4bfb0e9541b.29.llvm.2438094699631020562+0x40>
   32920:	add	x3, x3, #0x3c8
   32924:	mov	x0, xzr
   32928:	mov	x1, x23
   3292c:	mov	w2, #0x240                 	// #576
   32930:	bl	dd60 <core::slice::index::slice_index_fail>
   32934:	mov	w2, #0x80                  	// #128
   32938:	adrp	x3, bd000 <anon.7a263ad2a3e00f1d3c23c4bfb0e9541b.29.llvm.2438094699631020562+0x40>
   3293c:	add	x3, x3, #0x3e0
   32940:	mov	x0, x20
   32944:	movk	w2, #0x1, lsl #16
   32948:	bl	dd60 <core::slice::index::slice_index_fail>
   3294c:	adrp	x2, bd000 <anon.7a263ad2a3e00f1d3c23c4bfb0e9541b.29.llvm.2438094699631020562+0x40>
   32950:	add	x2, x2, #0x3f8
   32954:	mov	x0, x23
   32958:	mov	w1, #0x240                 	// #576
   3295c:	bl	dbc4 <core::panicking::panic_bounds_check>
