0000000000031fe8 <fastgzip_safe::enc::scan::<13, true, false>>:
   31fe8:	sub	sp, sp, #0x70
   31fec:	stp	x29, x30, [sp, #16]
   31ff0:	stp	x28, x27, [sp, #32]
   31ff4:	stp	x26, x25, [sp, #48]
   31ff8:	stp	x24, x23, [sp, #64]
   31ffc:	stp	x22, x21, [sp, #80]
   32000:	stp	x20, x19, [sp, #96]
   32004:	add	x29, sp, #0x10
   32008:	ldp	x26, x8, [x29, #96]
   3200c:	and	w9, w6, #0xffff
   32010:	subs	w10, w9, #0x9
   32014:	ldr	w11, [x29, #112]
   32018:	mov	x21, x4
   3201c:	csel	w27, wzr, w10, cc	// cc = lo, ul, last
   32020:	subs	w9, w9, #0xc
   32024:	mov	x22, x1
   32028:	ubfx	x20, x8, #3, #16
   3202c:	mov	x19, x0
   32030:	csel	w9, wzr, w9, cc	// cc = lo, ul, last
   32034:	str	x9, [sp, #8]
   32038:	str	w11, [sp, #4]
   3203c:	tbz	w11, #0, 3207c <fastgzip_safe::enc::scan::<13, true, false>+0x94>
   32040:	ldr	w28, [x19, #2192]
   32044:	lsr	x24, x28, #3
   32048:	cmp	w28, #0x400
   3204c:	b.cs	32118 <fastgzip_safe::enc::scan::<13, true, false>+0x130>  // b.hs, b.nlast
   32050:	add	x8, x19, #0x894
   32054:	add	x9, x26, x20
   32058:	ldp	q0, q1, [x8, #64]
   3205c:	stp	q0, q1, [x9, #64]
   32060:	ldp	q0, q2, [x8, #96]
   32064:	stp	q0, q2, [x9, #96]
   32068:	ldp	q1, q0, [x8]
   3206c:	stp	q1, q0, [x9]
   32070:	ldp	q2, q0, [x8, #32]
   32074:	stp	q2, q0, [x9, #32]
   32078:	b	32170 <fastgzip_safe::enc::scan::<13, true, false>+0x188>
   3207c:	and	x9, x8, #0x7
   32080:	mov	x10, #0xffffffffffffffff    	// #-1
   32084:	ldrb	w11, [x26, x20]
   32088:	lsl	x9, x10, x9
   3208c:	and	w25, w8, #0x7
   32090:	bic	x28, x11, x9
   32094:	tbz	w7, #0, 320b8 <fastgzip_safe::enc::scan::<13, true, false>+0xd0>
   32098:	mov	x0, x22
   3209c:	mov	w1, wzr
   320a0:	mov	w2, #0x4000                	// #16384
   320a4:	mov	x24, x5
   320a8:	mov	x23, x6
   320ac:	bl	60e0 <memset@plt>
   320b0:	mov	x6, x23
   320b4:	mov	x5, x24
   320b8:	tst	w5, #0xffff
   320bc:	and	x1, x6, #0xffff
   320c0:	b.eq	320f4 <fastgzip_safe::enc::scan::<13, true, false>+0x10c>  // b.none
   320c4:	and	w8, w5, #0xffff
   320c8:	and	x0, x5, #0xffff
   320cc:	cmp	w8, w27, uxth
   320d0:	b.cc	321e8 <fastgzip_safe::enc::scan::<13, true, false>+0x200>  // b.lo, b.ul, b.last
   320d4:	cmp	x0, x1
   320d8:	b.hi	32748 <fastgzip_safe::enc::scan::<13, true, false>+0x760>  // b.pmore
   320dc:	sub	x11, x1, x0
   320e0:	add	x10, x21, x0
   320e4:	ands	x9, x11, #0xfffc
   320e8:	and	x8, x11, #0x3
   320ec:	b.ne	325bc <fastgzip_safe::enc::scan::<13, true, false>+0x5d4>  // b.any
   320f0:	b	32650 <fastgzip_safe::enc::scan::<13, true, false>+0x668>
   320f4:	and	w8, w27, #0xffff
   320f8:	cmp	w8, #0x2
   320fc:	b.cs	321b0 <fastgzip_safe::enc::scan::<13, true, false>+0x1c8>  // b.hs, b.nlast
   32100:	sub	x11, x1, xzr
   32104:	add	x10, x21, xzr
   32108:	ands	x9, x11, #0xfffc
   3210c:	and	x8, x11, #0x3
   32110:	b.ne	325bc <fastgzip_safe::enc::scan::<13, true, false>+0x5d4>  // b.any
   32114:	b	320f0 <fastgzip_safe::enc::scan::<13, true, false>+0x108>
   32118:	mov	w8, #0x80                  	// #128
   3211c:	add	x1, x24, x20
   32120:	movk	w8, #0x1, lsl #16
   32124:	orr	x8, x8, #0x1
   32128:	cmp	x1, x8
   3212c:	b.cs	32778 <fastgzip_safe::enc::scan::<13, true, false>+0x790>  // b.hs, b.nlast
   32130:	lsr	w8, w28, #3
   32134:	cmp	w8, #0x241
   32138:	b.cs	32760 <fastgzip_safe::enc::scan::<13, true, false>+0x778>  // b.hs, b.nlast
   3213c:	add	x0, x26, x20
   32140:	add	x1, x19, #0x894
   32144:	mov	x2, x24
   32148:	str	w7, [sp]
   3214c:	mov	x23, x5
   32150:	mov	x25, x6
   32154:	bl	5f20 <memcpy@plt>
   32158:	lsr	w8, w28, #9
   3215c:	ldr	w7, [sp]
   32160:	mov	x6, x25
   32164:	mov	x5, x23
   32168:	cmp	w8, #0x9
   3216c:	b.cs	327a4 <fastgzip_safe::enc::scan::<13, true, false>+0x7bc>  // b.hs, b.nlast
   32170:	add	x9, x19, x24
   32174:	and	x8, x28, #0x7
   32178:	mov	x10, #0xffffffffffffffff    	// #-1
   3217c:	ldrb	w9, [x9, #2196]
   32180:	lsl	x10, x10, x8
   32184:	bic	x28, x9, x10
   32188:	ldr	w9, [sp, #4]
   3218c:	tbnz	w9, #8, 321a0 <fastgzip_safe::enc::scan::<13, true, false>+0x1b8>
   32190:	cbz	x24, 32734 <fastgzip_safe::enc::scan::<13, true, false>+0x74c>
   32194:	ldrb	w9, [x26, x20]
   32198:	and	w9, w9, #0xfe
   3219c:	strb	w9, [x26, x20]
   321a0:	add	x20, x24, x20
   321a4:	mov	w25, w8
   321a8:	tbnz	w7, #0, 32098 <fastgzip_safe::enc::scan::<13, true, false>+0xb0>
   321ac:	b	320b8 <fastgzip_safe::enc::scan::<13, true, false>+0xd0>
   321b0:	ldrb	w8, [x21]
   321b4:	and	x10, x20, #0xffff
   321b8:	mov	w0, #0x1                   	// #1
   321bc:	ldr	w8, [x19, x8, lsl #2]
   321c0:	and	x9, x8, #0xffff
   321c4:	add	w8, w25, w8, lsr #16
   321c8:	lsl	x9, x9, x25
   321cc:	ubfx	w11, w8, #3, #3
   321d0:	and	w12, w8, #0x38
   321d4:	and	w25, w8, #0xffff8007
   321d8:	orr	x9, x9, x28
   321dc:	str	x9, [x26, x10]
   321e0:	lsr	x28, x9, x12
   321e4:	add	x20, x20, x11
   321e8:	mov	x9, #0x87000000            	// #2264924160
   321ec:	ldr	x8, [x21, x0]
   321f0:	add	x10, x19, #0x400
   321f4:	movk	x9, #0xebca, lsl #32
   321f8:	add	x11, x19, #0x810
   321fc:	mov	w12, #0x102                 	// #258
   32200:	movk	x9, #0xb185, lsl #48
   32204:	mov	w13, #0x1e                  	// #30
   32208:	mov	w14, #0xffffffff            	// #-1
   3220c:	mul	x8, x8, x9
   32210:	lsr	x15, x8, #51
   32214:	ldr	x8, [sp, #8]
   32218:	cmp	x0, x8
   3221c:	b.cs	323fc <fastgzip_safe::enc::scan::<13, true, false>+0x414>  // b.hs, b.nlast
   32220:	ldr	x16, [x21, x0]
   32224:	ldrh	w17, [x22, x15, lsl #1]
   32228:	strh	w0, [x22, x15, lsl #1]
   3222c:	lsr	x8, x16, #8
   32230:	ldr	x18, [x21, x17]
   32234:	mul	x8, x8, x9
   32238:	lsr	x15, x8, #51
   3223c:	eor	x8, x18, x16
   32240:	cbz	w8, 32474 <fastgzip_safe::enc::scan::<13, true, false>+0x48c>
   32244:	add	x18, x21, x0
   32248:	and	x8, x16, #0xff
   3224c:	add	w5, w0, #0x1
   32250:	ldur	x16, [x18, #1]
   32254:	ldr	w8, [x19, x8, lsl #2]
   32258:	lsr	x17, x16, #8
   3225c:	and	x3, x8, #0xffff
   32260:	lsl	x3, x3, x25
   32264:	add	w25, w25, w8, lsr #16
   32268:	mul	x2, x17, x9
   3226c:	ldrh	w17, [x22, x15, lsl #1]
   32270:	strh	w5, [x22, x15, lsl #1]
   32274:	orr	x28, x3, x28
   32278:	ldr	x4, [x21, x17]
   3227c:	eor	x8, x4, x16
   32280:	lsr	x15, x2, #51
   32284:	cbz	w8, 32354 <fastgzip_safe::enc::scan::<13, true, false>+0x36c>
   32288:	and	x8, x16, #0xff
   3228c:	ldur	x16, [x18, #2]
   32290:	ldr	w8, [x19, x8, lsl #2]
   32294:	lsr	x17, x16, #8
   32298:	and	x2, x8, #0xffff
   3229c:	mul	x18, x17, x9
   322a0:	ldrh	w17, [x22, x15, lsl #1]
   322a4:	lsl	x2, x2, x25
   322a8:	add	w25, w25, w8, lsr #16
   322ac:	add	w8, w0, #0x2
   322b0:	strh	w8, [x22, x15, lsl #1]
   322b4:	ldr	x3, [x21, x17]
   322b8:	orr	x28, x2, x28
   322bc:	eor	x8, x3, x16
   322c0:	lsr	x15, x18, #51
   322c4:	cbz	w8, 323d0 <fastgzip_safe::enc::scan::<13, true, false>+0x3e8>
   322c8:	add	x8, x21, x0
   322cc:	and	x17, x16, #0xff
   322d0:	add	w4, w0, #0x3
   322d4:	ldur	x16, [x8, #3]
   322d8:	ldr	w18, [x19, x17, lsl #2]
   322dc:	ldrh	w17, [x22, x15, lsl #1]
   322e0:	strh	w4, [x22, x15, lsl #1]
   322e4:	lsr	x8, x16, #8
   322e8:	and	x2, x18, #0xffff
   322ec:	ldr	x3, [x21, x17]
   322f0:	lsl	x2, x2, x25
   322f4:	add	w25, w25, w18, lsr #16
   322f8:	mul	x8, x8, x9
   322fc:	orr	x28, x2, x28
   32300:	lsr	x15, x8, #51
   32304:	eor	x8, x3, x16
   32308:	cbz	w8, 323dc <fastgzip_safe::enc::scan::<13, true, false>+0x3f4>
   3230c:	and	x8, x16, #0xff
   32310:	add	x0, x0, #0x4
   32314:	and	x2, x20, #0xffff
   32318:	ldr	w8, [x19, x8, lsl #2]
   3231c:	and	x16, x8, #0xffff
   32320:	add	w8, w25, w8, lsr #16
   32324:	lsl	x16, x16, x25
   32328:	and	w18, w8, #0x38
   3232c:	ubfx	w17, w8, #3, #3
   32330:	and	w25, w8, #0xffff8007
   32334:	orr	x16, x16, x28
   32338:	str	x16, [x26, x2]
   3233c:	lsr	x28, x16, x18
   32340:	ldr	x18, [sp, #8]
   32344:	add	x20, x20, x17
   32348:	cmp	x0, x18
   3234c:	b.cc	32220 <fastgzip_safe::enc::scan::<13, true, false>+0x238>  // b.lo, b.ul, b.last
   32350:	b	323fc <fastgzip_safe::enc::scan::<13, true, false>+0x414>
   32354:	add	x0, x0, #0x1
   32358:	cbnz	x8, 32478 <fastgzip_safe::enc::scan::<13, true, false>+0x490>
   3235c:	sub	x18, x1, x0
   32360:	add	x2, x21, x17
   32364:	cmp	x18, #0x102
   32368:	csel	x8, x18, x12, cc	// cc = lo, ul, last
   3236c:	cmp	x18, #0x10
   32370:	add	x18, x21, x0
   32374:	b.cs	32380 <fastgzip_safe::enc::scan::<13, true, false>+0x398>  // b.hs, b.nlast
   32378:	mov	w4, #0x8                   	// #8
   3237c:	b	323a8 <fastgzip_safe::enc::scan::<13, true, false>+0x3c0>
   32380:	mov	w3, #0x8                   	// #8
   32384:	ldr	x4, [x18, x3]
   32388:	ldr	x5, [x2, x3]
   3238c:	cmp	x4, x5
   32390:	b.ne	323e8 <fastgzip_safe::enc::scan::<13, true, false>+0x400>  // b.any
   32394:	add	x5, x3, #0x10
   32398:	add	x4, x3, #0x8
   3239c:	cmp	x5, x8
   323a0:	mov	x3, x4
   323a4:	b.ls	32384 <fastgzip_safe::enc::scan::<13, true, false>+0x39c>  // b.plast
   323a8:	cmp	x4, x8
   323ac:	b.cs	32484 <fastgzip_safe::enc::scan::<13, true, false>+0x49c>  // b.hs, b.nlast
   323b0:	subs	x3, x8, #0x8
   323b4:	csel	x3, xzr, x3, cc	// cc = lo, ul, last
   323b8:	ldr	x18, [x18, x3]
   323bc:	ldr	x2, [x2, x3]
   323c0:	cmp	x18, x2
   323c4:	b.eq	32484 <fastgzip_safe::enc::scan::<13, true, false>+0x49c>  // b.none
   323c8:	eor	x8, x2, x18
   323cc:	b	323ec <fastgzip_safe::enc::scan::<13, true, false>+0x404>
   323d0:	add	x0, x0, #0x2
   323d4:	cbnz	x8, 32478 <fastgzip_safe::enc::scan::<13, true, false>+0x490>
   323d8:	b	3235c <fastgzip_safe::enc::scan::<13, true, false>+0x374>
   323dc:	add	x0, x0, #0x3
   323e0:	cbnz	x8, 32478 <fastgzip_safe::enc::scan::<13, true, false>+0x490>
   323e4:	b	3235c <fastgzip_safe::enc::scan::<13, true, false>+0x374>
   323e8:	eor	x8, x5, x4
   323ec:	rbit	x8, x8
   323f0:	clz	x8, x8
   323f4:	add	x8, x3, x8, lsr #3
   323f8:	b	32484 <fastgzip_safe::enc::scan::<13, true, false>+0x49c>
   323fc:	cmp	x0, x27
   32400:	mov	w18, w25
   32404:	b.cs	320d4 <fastgzip_safe::enc::scan::<13, true, false>+0xec>  // b.hs, b.nlast
   32408:	ldr	x16, [x21, x0]
   3240c:	ldrh	w17, [x22, x15, lsl #1]
   32410:	strh	w0, [x22, x15, lsl #1]
   32414:	lsr	x8, x16, #8
   32418:	ldr	x2, [x21, x17]
   3241c:	mul	x8, x8, x9
   32420:	lsr	x15, x8, #51
   32424:	eor	x8, x2, x16
   32428:	cbz	w8, 32470 <fastgzip_safe::enc::scan::<13, true, false>+0x488>
   3242c:	and	x8, x16, #0xff
   32430:	add	x0, x0, #0x1
   32434:	and	x2, x20, #0xffff
   32438:	ldr	w8, [x19, x8, lsl #2]
   3243c:	cmp	x27, x0
   32440:	and	x16, x8, #0xffff
   32444:	add	w8, w18, w8, lsr #16
   32448:	lsl	x16, x16, x18
   3244c:	ubfx	w17, w8, #3, #3
   32450:	and	w18, w8, #0x38
   32454:	orr	x16, x16, x28
   32458:	str	x16, [x26, x2]
   3245c:	lsr	x28, x16, x18
   32460:	add	x20, x20, x17
   32464:	and	w18, w8, #0xffff8007
   32468:	b.ne	32408 <fastgzip_safe::enc::scan::<13, true, false>+0x420>  // b.any
   3246c:	b	325a4 <fastgzip_safe::enc::scan::<13, true, false>+0x5bc>
   32470:	mov	w25, w18
   32474:	cbz	x8, 3235c <fastgzip_safe::enc::scan::<13, true, false>+0x374>
   32478:	rbit	x8, x8
   3247c:	clz	x8, x8
   32480:	lsr	x8, x8, #3
   32484:	mvn	w17, w17
   32488:	add	w18, w17, w0
   3248c:	cmp	w18, #0x2
   32490:	clz	w17, w18
   32494:	mov	w2, w18
   32498:	b.cc	324b0 <fastgzip_safe::enc::scan::<13, true, false>+0x4c8>  // b.lo, b.ul, b.last
   3249c:	sub	w2, w13, w17
   324a0:	lsr	w2, w18, w2
   324a4:	and	w2, w2, #0x1
   324a8:	sub	w2, w2, w17, lsl #1
   324ac:	add	w2, w2, #0x3e
   324b0:	cmp	x8, #0x103
   324b4:	b.cs	32790 <fastgzip_safe::enc::scan::<13, true, false>+0x7a8>  // b.hs, b.nlast
   324b8:	ldr	w3, [x10, x8, lsl #2]
   324bc:	subs	w17, w13, w17
   324c0:	and	w2, w2, #0x1f
   324c4:	csel	w17, wzr, w17, cc	// cc = lo, ul, last
   324c8:	ldr	w2, [x11, w2, uxtw #2]
   324cc:	lsr	x16, x16, #16
   324d0:	ubfx	x5, x3, #19, #5
   324d4:	lsl	w4, w14, w17
   324d8:	and	x3, x3, #0x7ffff
   324dc:	and	x7, x2, #0xffff
   324e0:	mul	x16, x16, x9
   324e4:	ubfx	w6, w25, #3, #3
   324e8:	add	w2, w5, w2, lsr #16
   324ec:	bic	w18, w18, w4
   324f0:	lsl	x5, x7, x5
   324f4:	and	w4, w25, #0xffff8007
   324f8:	add	w7, w0, #0x1
   324fc:	strh	w7, [x22, x15, lsl #1]
   32500:	lsl	x18, x18, x2
   32504:	orr	x3, x5, x3
   32508:	add	w5, w0, #0x2
   3250c:	add	x0, x8, x0
   32510:	add	w8, w17, w4
   32514:	add	x4, x20, x6
   32518:	orr	x17, x3, x18
   3251c:	and	w18, w25, #0x38
   32520:	and	w3, w25, #0x7
   32524:	lsr	x18, x28, x18
   32528:	lsl	x17, x17, x3
   3252c:	add	w8, w8, w2
   32530:	and	x6, x20, #0xffff
   32534:	and	w2, w8, #0x38
   32538:	lsr	x16, x16, #50
   3253c:	orr	x17, x17, x18
   32540:	ubfx	w18, w8, #3, #3
   32544:	str	x28, [x26, x6]
   32548:	lsr	x28, x17, x2
   3254c:	and	x3, x4, #0xffff
   32550:	and	x15, x16, #0x3ffe
   32554:	cmp	x0, x27
   32558:	add	x20, x4, x18
   3255c:	and	w25, w8, #0xffff8007
   32560:	str	x17, [x26, x3]
   32564:	strh	w5, [x22, x15]
   32568:	b.cs	320d4 <fastgzip_safe::enc::scan::<13, true, false>+0xec>  // b.hs, b.nlast
   3256c:	sub	w15, w0, #0x1
   32570:	and	x8, x15, #0xffff
   32574:	ldr	x8, [x21, x8]
   32578:	mul	x16, x8, x9
   3257c:	lsr	x8, x8, #8
   32580:	lsr	x16, x16, #50
   32584:	and	x16, x16, #0x3ffe
   32588:	strh	w15, [x22, x16]
   3258c:	mul	x8, x8, x9
   32590:	lsr	x15, x8, #51
   32594:	ldr	x8, [sp, #8]
   32598:	cmp	x0, x8
   3259c:	b.cc	32220 <fastgzip_safe::enc::scan::<13, true, false>+0x238>  // b.lo, b.ul, b.last
   325a0:	b	323fc <fastgzip_safe::enc::scan::<13, true, false>+0x414>
   325a4:	mov	w25, w18
   325a8:	sub	x11, x1, x27
   325ac:	add	x10, x21, x27
   325b0:	ands	x9, x11, #0xfffc
   325b4:	and	x8, x11, #0x3
   325b8:	b.eq	320f0 <fastgzip_safe::enc::scan::<13, true, false>+0x108>  // b.none
   325bc:	and	x11, x11, #0xfffc
   325c0:	mov	x12, x10
   325c4:	neg	x11, x11
   325c8:	ldrb	w13, [x12]
   325cc:	ldrb	w14, [x12, #1]
   325d0:	adds	x11, x11, #0x4
   325d4:	ldrb	w15, [x12, #2]
   325d8:	ldrb	w17, [x12, #3]
   325dc:	add	x12, x12, #0x4
   325e0:	ldr	w13, [x19, x13, lsl #2]
   325e4:	ldr	w14, [x19, x14, lsl #2]
   325e8:	ldr	w15, [x19, x15, lsl #2]
   325ec:	ldr	w17, [x19, x17, lsl #2]
   325f0:	add	w16, w25, w13, lsr #16
   325f4:	and	x13, x13, #0xffff
   325f8:	lsl	x13, x13, x25
   325fc:	and	x0, x17, #0xffff
   32600:	add	w18, w16, w14, lsr #16
   32604:	and	x14, x14, #0xffff
   32608:	lsl	x14, x14, x16
   3260c:	and	x16, x15, #0xffff
   32610:	orr	x13, x13, x28
   32614:	add	w15, w18, w15, lsr #16
   32618:	lsl	x16, x16, x18
   3261c:	orr	x13, x13, x14
   32620:	lsl	x14, x0, x15
   32624:	add	w15, w15, w17, lsr #16
   32628:	orr	x13, x13, x16
   3262c:	orr	x13, x13, x14
   32630:	ubfx	w16, w15, #3, #3
   32634:	and	w17, w15, #0x38
   32638:	lsr	x28, x13, x17
   3263c:	and	x14, x20, #0xffff
   32640:	and	w25, w15, #0xffff8007
   32644:	add	x20, x20, x16
   32648:	str	x13, [x26, x14]
   3264c:	b.ne	325c8 <fastgzip_safe::enc::scan::<13, true, false>+0x5e0>  // b.any
   32650:	cbz	x8, 326b4 <fastgzip_safe::enc::scan::<13, true, false>+0x6cc>
   32654:	add	x9, x10, x9
   32658:	cmp	x8, #0x1
   3265c:	ldrb	w10, [x9]
   32660:	ldr	w10, [x19, x10, lsl #2]
   32664:	and	x11, x10, #0xffff
   32668:	lsl	x11, x11, x25
   3266c:	add	w25, w25, w10, lsr #16
   32670:	orr	x28, x11, x28
   32674:	b.eq	32698 <fastgzip_safe::enc::scan::<13, true, false>+0x6b0>  // b.none
   32678:	ldrb	w10, [x9, #1]
   3267c:	cmp	x8, #0x2
   32680:	ldr	w10, [x19, x10, lsl #2]
   32684:	and	x11, x10, #0xffff
   32688:	lsl	x11, x11, x25
   3268c:	add	w25, w25, w10, lsr #16
   32690:	orr	x28, x11, x28
   32694:	b.ne	3269c <fastgzip_safe::enc::scan::<13, true, false>+0x6b4>  // b.any
   32698:	b	326b4 <fastgzip_safe::enc::scan::<13, true, false>+0x6cc>
   3269c:	ldrb	w8, [x9, #2]
   326a0:	ldr	w8, [x19, x8, lsl #2]
   326a4:	and	x9, x8, #0xffff
   326a8:	lsl	x9, x9, x25
   326ac:	add	w25, w25, w8, lsr #16
   326b0:	orr	x28, x9, x28
   326b4:	ubfx	w8, w25, #3, #3
   326b8:	and	x9, x20, #0xffff
   326bc:	ldr	w10, [sp, #4]
   326c0:	str	x28, [x26, x9]
   326c4:	and	w9, w25, #0xffff8007
   326c8:	add	x8, x20, x8
   326cc:	tbz	w10, #16, 32704 <fastgzip_safe::enc::scan::<13, true, false>+0x71c>
   326d0:	ldr	w10, [x19, #2060]
   326d4:	and	w11, w25, #0x38
   326d8:	and	w13, w25, #0x7
   326dc:	add	w9, w9, w10, lsr #16
   326e0:	and	x12, x10, #0xffff
   326e4:	lsr	x10, x28, x11
   326e8:	lsl	x11, x12, x13
   326ec:	ubfx	w12, w9, #3, #3
   326f0:	and	w9, w9, #0xffff8007
   326f4:	orr	x10, x11, x10
   326f8:	and	x11, x8, #0xffff
   326fc:	add	x8, x8, x12
   32700:	str	x10, [x26, x11]
   32704:	lsl	x8, x8, #3
   32708:	cmp	w9, #0x7
   3270c:	add	x8, x8, w9, uxtw
   32710:	csel	x0, xzr, x8, hi	// hi = pmore
   32714:	ldp	x20, x19, [sp, #96]
   32718:	ldp	x22, x21, [sp, #80]
   3271c:	ldp	x24, x23, [sp, #64]
   32720:	ldp	x26, x25, [sp, #48]
   32724:	ldp	x28, x27, [sp, #32]
   32728:	ldp	x29, x30, [sp, #16]
   3272c:	add	sp, sp, #0x70
   32730:	ret
   32734:	and	x28, x28, #0x7e
   32738:	add	x20, x24, x20
   3273c:	mov	w25, w8
   32740:	tbnz	w7, #0, 32098 <fastgzip_safe::enc::scan::<13, true, false>+0xb0>
   32744:	b	320b8 <fastgzip_safe::enc::scan::<13, true, false>+0xd0>
   32748:	mov	w8, #0x80                  	// #128
   3274c:	adrp	x3, bd000 <anon.7a263ad2a3e00f1d3c23c4bfb0e9541b.29.llvm.2438094699631020562+0x58>
   32750:	add	x3, x3, #0x350
   32754:	movk	w8, #0x1, lsl #16
   32758:	add	x2, x8, #0x88
   3275c:	bl	dd20 <core::slice::index::slice_index_fail>
   32760:	adrp	x3, bd000 <anon.7a263ad2a3e00f1d3c23c4bfb0e9541b.29.llvm.2438094699631020562+0x58>
   32764:	add	x3, x3, #0x3c8
   32768:	mov	x0, xzr
   3276c:	mov	x1, x24
   32770:	mov	w2, #0x240                 	// #576
   32774:	bl	dd20 <core::slice::index::slice_index_fail>
   32778:	mov	w2, #0x80                  	// #128
   3277c:	adrp	x3, bd000 <anon.7a263ad2a3e00f1d3c23c4bfb0e9541b.29.llvm.2438094699631020562+0x58>
   32780:	add	x3, x3, #0x3e0
   32784:	mov	x0, x20
   32788:	movk	w2, #0x1, lsl #16
   3278c:	bl	dd20 <core::slice::index::slice_index_fail>
   32790:	adrp	x2, bd000 <anon.7a263ad2a3e00f1d3c23c4bfb0e9541b.29.llvm.2438094699631020562+0x58>
   32794:	add	x2, x2, #0x380
   32798:	mov	x0, x8
   3279c:	mov	w1, #0x103                 	// #259
   327a0:	bl	db84 <core::panicking::panic_bounds_check>
   327a4:	adrp	x2, bd000 <anon.7a263ad2a3e00f1d3c23c4bfb0e9541b.29.llvm.2438094699631020562+0x58>
   327a8:	add	x2, x2, #0x3f8
   327ac:	mov	x0, x24
   327b0:	mov	w1, #0x240                 	// #576
   327b4:	bl	db84 <core::panicking::panic_bounds_check>
