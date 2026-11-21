0000000000032638 <fastgzip_safe::enc::scan::<13, true, false>>:
   32638:	sub	sp, sp, #0x80
   3263c:	stp	x29, x30, [sp, #32]
   32640:	stp	x28, x27, [sp, #48]
   32644:	stp	x26, x25, [sp, #64]
   32648:	stp	x24, x23, [sp, #80]
   3264c:	stp	x22, x21, [sp, #96]
   32650:	stp	x20, x19, [sp, #112]
   32654:	add	x29, sp, #0x20
   32658:	ldp	x26, x8, [x29, #96]
   3265c:	and	w9, w6, #0xffff
   32660:	subs	w10, w9, #0x9
   32664:	ldr	w30, [x29, #112]
   32668:	mov	x21, x4
   3266c:	csel	w27, wzr, w10, cc	// cc = lo, ul, last
   32670:	subs	w9, w9, #0xc
   32674:	mov	x22, x1
   32678:	ubfx	x20, x8, #3, #16
   3267c:	mov	x19, x0
   32680:	csel	w23, wzr, w9, cc	// cc = lo, ul, last
   32684:	stur	x23, [x29, #-8]
   32688:	tbz	w30, #0, 326c8 <fastgzip_safe::enc::scan::<13, true, false>+0x90>
   3268c:	ldr	w28, [x19, #3588]
   32690:	lsr	x24, x28, #3
   32694:	cmp	w28, #0x400
   32698:	b.cs	32778 <fastgzip_safe::enc::scan::<13, true, false>+0x140>  // b.hs, b.nlast
   3269c:	add	x8, x19, #0xe08
   326a0:	add	x9, x26, x20
   326a4:	ldp	q0, q1, [x8, #64]
   326a8:	stp	q0, q1, [x9, #64]
   326ac:	ldp	q0, q2, [x8, #96]
   326b0:	stp	q0, q2, [x9, #96]
   326b4:	ldp	q1, q0, [x8]
   326b8:	stp	q1, q0, [x9]
   326bc:	ldp	q2, q0, [x8, #32]
   326c0:	stp	q2, q0, [x9, #32]
   326c4:	b	327dc <fastgzip_safe::enc::scan::<13, true, false>+0x1a4>
   326c8:	and	x9, x8, #0x7
   326cc:	mov	x10, #0xffffffffffffffff    	// #-1
   326d0:	ldrb	w11, [x26, x20]
   326d4:	lsl	x9, x10, x9
   326d8:	and	w25, w8, #0x7
   326dc:	bic	x28, x11, x9
   326e0:	tbz	w7, #0, 32718 <fastgzip_safe::enc::scan::<13, true, false>+0xe0>
   326e4:	mov	x0, x22
   326e8:	mov	w1, wzr
   326ec:	mov	w2, #0x4000                	// #16384
   326f0:	mov	w24, w30
   326f4:	str	x27, [sp, #16]
   326f8:	mov	x23, x5
   326fc:	mov	x27, x6
   32700:	bl	60e0 <memset@plt>
   32704:	mov	x6, x27
   32708:	mov	x5, x23
   3270c:	ldur	x23, [x29, #-8]
   32710:	ldr	x27, [sp, #16]
   32714:	mov	w30, w24
   32718:	tst	w5, #0xffff
   3271c:	and	x1, x6, #0xffff
   32720:	b.eq	32754 <fastgzip_safe::enc::scan::<13, true, false>+0x11c>  // b.none
   32724:	and	w8, w5, #0xffff
   32728:	and	x0, x5, #0xffff
   3272c:	cmp	w8, w27, uxth
   32730:	b.cc	32850 <fastgzip_safe::enc::scan::<13, true, false>+0x218>  // b.lo, b.ul, b.last
   32734:	cmp	x0, x1
   32738:	b.hi	32dc8 <fastgzip_safe::enc::scan::<13, true, false>+0x790>  // b.pmore
   3273c:	sub	x11, x1, x0
   32740:	add	x10, x21, x0
   32744:	ands	x9, x11, #0xfffc
   32748:	and	x8, x11, #0x3
   3274c:	b.ne	32c0c <fastgzip_safe::enc::scan::<13, true, false>+0x5d4>  // b.any
   32750:	b	32774 <fastgzip_safe::enc::scan::<13, true, false>+0x13c>
   32754:	and	w8, w27, #0xffff
   32758:	cmp	w8, #0x2
   3275c:	b.cs	32818 <fastgzip_safe::enc::scan::<13, true, false>+0x1e0>  // b.hs, b.nlast
   32760:	sub	x11, x1, xzr
   32764:	add	x10, x21, xzr
   32768:	ands	x9, x11, #0xfffc
   3276c:	and	x8, x11, #0x3
   32770:	b.ne	32c0c <fastgzip_safe::enc::scan::<13, true, false>+0x5d4>  // b.any
   32774:	b	32ca0 <fastgzip_safe::enc::scan::<13, true, false>+0x668>
   32778:	mov	w8, #0x80                  	// #128
   3277c:	add	x1, x24, x20
   32780:	movk	w8, #0x1, lsl #16
   32784:	orr	x8, x8, #0x1
   32788:	cmp	x1, x8
   3278c:	b.cs	32df8 <fastgzip_safe::enc::scan::<13, true, false>+0x7c0>  // b.hs, b.nlast
   32790:	lsr	w8, w28, #3
   32794:	cmp	w8, #0x241
   32798:	b.cs	32de0 <fastgzip_safe::enc::scan::<13, true, false>+0x7a8>  // b.hs, b.nlast
   3279c:	add	x0, x26, x20
   327a0:	add	x1, x19, #0xe08
   327a4:	mov	x2, x24
   327a8:	str	w7, [sp, #12]
   327ac:	mov	w23, w30
   327b0:	mov	x25, x5
   327b4:	str	x6, [sp, #16]
   327b8:	bl	5f20 <memcpy@plt>
   327bc:	lsr	w8, w28, #9
   327c0:	ldr	x6, [sp, #16]
   327c4:	mov	w30, w23
   327c8:	ldur	x23, [x29, #-8]
   327cc:	ldr	w7, [sp, #12]
   327d0:	mov	x5, x25
   327d4:	cmp	w8, #0x9
   327d8:	b.cs	32e10 <fastgzip_safe::enc::scan::<13, true, false>+0x7d8>  // b.hs, b.nlast
   327dc:	add	x9, x19, x24
   327e0:	and	x8, x28, #0x7
   327e4:	mov	x10, #0xffffffffffffffff    	// #-1
   327e8:	ldrb	w9, [x9, #3592]
   327ec:	lsl	x10, x10, x8
   327f0:	bic	x28, x9, x10
   327f4:	tbnz	w30, #8, 32808 <fastgzip_safe::enc::scan::<13, true, false>+0x1d0>
   327f8:	cbz	x24, 32db4 <fastgzip_safe::enc::scan::<13, true, false>+0x77c>
   327fc:	ldrb	w9, [x26, x20]
   32800:	and	w9, w9, #0xfe
   32804:	strb	w9, [x26, x20]
   32808:	add	x20, x24, x20
   3280c:	mov	w25, w8
   32810:	tbnz	w7, #0, 326e4 <fastgzip_safe::enc::scan::<13, true, false>+0xac>
   32814:	b	32718 <fastgzip_safe::enc::scan::<13, true, false>+0xe0>
   32818:	ldrb	w8, [x21]
   3281c:	and	x10, x20, #0xffff
   32820:	mov	w0, #0x1                   	// #1
   32824:	ldr	w8, [x19, x8, lsl #2]
   32828:	and	x9, x8, #0xffff
   3282c:	add	w8, w25, w8, lsr #16
   32830:	lsl	x9, x9, x25
   32834:	ubfx	w11, w8, #3, #3
   32838:	and	w12, w8, #0x38
   3283c:	and	w25, w8, #0xffff8007
   32840:	orr	x9, x9, x28
   32844:	str	x9, [x26, x10]
   32848:	lsr	x28, x9, x12
   3284c:	add	x20, x20, x11
   32850:	mov	x8, #0x87000000            	// #2264924160
   32854:	ldr	x15, [x21, x0]
   32858:	add	x9, x19, #0x400
   3285c:	movk	x8, #0xebca, lsl #32
   32860:	add	x10, x27, #0x9
   32864:	add	x11, x19, #0xc04
   32868:	movk	x8, #0xb185, lsl #48
   3286c:	mov	w12, #0x102                 	// #258
   32870:	mov	w13, #0x1e                  	// #30
   32874:	mov	w14, #0xffffffff            	// #-1
   32878:	mul	x15, x15, x8
   3287c:	cmp	x0, x23
   32880:	lsr	x15, x15, #51
   32884:	b.cs	329b4 <fastgzip_safe::enc::scan::<13, true, false>+0x37c>  // b.hs, b.nlast
   32888:	ldr	x16, [x21, x0]
   3288c:	lsr	x17, x16, #8
   32890:	mul	x18, x17, x8
   32894:	ldrh	w17, [x22, x15, lsl #1]
   32898:	strh	w0, [x22, x15, lsl #1]
   3289c:	ldr	x2, [x21, x17]
   328a0:	lsr	x15, x18, #51
   328a4:	eor	x18, x2, x16
   328a8:	cbz	w18, 32a2c <fastgzip_safe::enc::scan::<13, true, false>+0x3f4>
   328ac:	add	x2, x21, x0
   328b0:	and	x17, x16, #0xff
   328b4:	add	w6, w0, #0x1
   328b8:	ldur	x16, [x2, #1]
   328bc:	ldr	w3, [x19, x17, lsl #2]
   328c0:	ldrh	w17, [x22, x15, lsl #1]
   328c4:	strh	w6, [x22, x15, lsl #1]
   328c8:	lsr	x18, x16, #8
   328cc:	and	x4, x3, #0xffff
   328d0:	ldr	x5, [x21, x17]
   328d4:	lsl	x4, x4, x25
   328d8:	add	w25, w25, w3, lsr #16
   328dc:	mul	x18, x18, x8
   328e0:	orr	x28, x4, x28
   328e4:	lsr	x15, x18, #51
   328e8:	eor	x18, x5, x16
   328ec:	cbz	w18, 32a44 <fastgzip_safe::enc::scan::<13, true, false>+0x40c>
   328f0:	and	x17, x16, #0xff
   328f4:	ldur	x16, [x2, #2]
   328f8:	ldr	w2, [x19, x17, lsl #2]
   328fc:	ldrh	w17, [x22, x15, lsl #1]
   32900:	lsr	x18, x16, #8
   32904:	and	x3, x2, #0xffff
   32908:	ldr	x4, [x21, x17]
   3290c:	mul	x18, x18, x8
   32910:	lsl	x3, x3, x25
   32914:	add	w25, w25, w2, lsr #16
   32918:	add	w2, w0, #0x2
   3291c:	strh	w2, [x22, x15, lsl #1]
   32920:	orr	x28, x3, x28
   32924:	lsr	x15, x18, #51
   32928:	eor	x18, x4, x16
   3292c:	cbz	w18, 32a50 <fastgzip_safe::enc::scan::<13, true, false>+0x418>
   32930:	add	x17, x21, x0
   32934:	and	x18, x16, #0xff
   32938:	add	w5, w0, #0x3
   3293c:	ldur	x16, [x17, #3]
   32940:	ldr	w18, [x19, x18, lsl #2]
   32944:	lsr	x17, x16, #8
   32948:	and	x3, x18, #0xffff
   3294c:	lsl	x3, x3, x25
   32950:	add	w25, w25, w18, lsr #16
   32954:	mul	x2, x17, x8
   32958:	ldrh	w17, [x22, x15, lsl #1]
   3295c:	strh	w5, [x22, x15, lsl #1]
   32960:	orr	x28, x3, x28
   32964:	ldr	x4, [x21, x17]
   32968:	eor	x18, x4, x16
   3296c:	lsr	x15, x2, #51
   32970:	cbz	w18, 32a5c <fastgzip_safe::enc::scan::<13, true, false>+0x424>
   32974:	and	x16, x16, #0xff
   32978:	add	x0, x0, #0x4
   3297c:	and	x3, x20, #0xffff
   32980:	ldr	w16, [x19, x16, lsl #2]
   32984:	cmp	x0, x23
   32988:	and	x17, x16, #0xffff
   3298c:	add	w16, w25, w16, lsr #16
   32990:	lsl	x17, x17, x25
   32994:	ubfx	w18, w16, #3, #3
   32998:	and	w2, w16, #0x38
   3299c:	and	w25, w16, #0xffff8007
   329a0:	orr	x17, x17, x28
   329a4:	str	x17, [x26, x3]
   329a8:	lsr	x28, x17, x2
   329ac:	add	x20, x20, x18
   329b0:	b.cc	32888 <fastgzip_safe::enc::scan::<13, true, false>+0x250>  // b.lo, b.ul, b.last
   329b4:	cmp	x0, x27
   329b8:	mov	w2, w25
   329bc:	b.cs	32734 <fastgzip_safe::enc::scan::<13, true, false>+0xfc>  // b.hs, b.nlast
   329c0:	ldr	x16, [x21, x0]
   329c4:	lsr	x17, x16, #8
   329c8:	mul	x18, x17, x8
   329cc:	ldrh	w17, [x22, x15, lsl #1]
   329d0:	strh	w0, [x22, x15, lsl #1]
   329d4:	ldr	x3, [x21, x17]
   329d8:	lsr	x15, x18, #51
   329dc:	eor	x18, x3, x16
   329e0:	cbz	w18, 32a28 <fastgzip_safe::enc::scan::<13, true, false>+0x3f0>
   329e4:	and	x16, x16, #0xff
   329e8:	add	x0, x0, #0x1
   329ec:	and	x3, x20, #0xffff
   329f0:	ldr	w16, [x19, x16, lsl #2]
   329f4:	cmp	x27, x0
   329f8:	and	x17, x16, #0xffff
   329fc:	add	w16, w2, w16, lsr #16
   32a00:	lsl	x17, x17, x2
   32a04:	ubfx	w18, w16, #3, #3
   32a08:	and	w2, w16, #0x38
   32a0c:	orr	x17, x17, x28
   32a10:	str	x17, [x26, x3]
   32a14:	lsr	x28, x17, x2
   32a18:	add	x20, x20, x18
   32a1c:	and	w2, w16, #0xffff8007
   32a20:	b.ne	329c0 <fastgzip_safe::enc::scan::<13, true, false>+0x388>  // b.any
   32a24:	b	32bf4 <fastgzip_safe::enc::scan::<13, true, false>+0x5bc>
   32a28:	mov	w25, w2
   32a2c:	cbz	x18, 32a64 <fastgzip_safe::enc::scan::<13, true, false>+0x42c>
   32a30:	rbit	x18, x18
   32a34:	clz	x18, x18
   32a38:	lsr	x18, x18, #3
   32a3c:	mov	x2, x18
   32a40:	b	32aec <fastgzip_safe::enc::scan::<13, true, false>+0x4b4>
   32a44:	add	x0, x0, #0x1
   32a48:	cbnz	x18, 32a30 <fastgzip_safe::enc::scan::<13, true, false>+0x3f8>
   32a4c:	b	32a64 <fastgzip_safe::enc::scan::<13, true, false>+0x42c>
   32a50:	add	x0, x0, #0x2
   32a54:	cbnz	x18, 32a30 <fastgzip_safe::enc::scan::<13, true, false>+0x3f8>
   32a58:	b	32a64 <fastgzip_safe::enc::scan::<13, true, false>+0x42c>
   32a5c:	add	x0, x0, #0x3
   32a60:	cbnz	x18, 32a30 <fastgzip_safe::enc::scan::<13, true, false>+0x3f8>
   32a64:	sub	x2, x10, x0
   32a68:	add	x3, x21, x17
   32a6c:	cmp	x2, #0x102
   32a70:	csel	x18, x2, x12, cc	// cc = lo, ul, last
   32a74:	cmp	x2, #0x10
   32a78:	add	x2, x21, x0
   32a7c:	b.cs	32a88 <fastgzip_safe::enc::scan::<13, true, false>+0x450>  // b.hs, b.nlast
   32a80:	mov	w5, #0x8                   	// #8
   32a84:	b	32ab0 <fastgzip_safe::enc::scan::<13, true, false>+0x478>
   32a88:	mov	w4, #0x8                   	// #8
   32a8c:	ldr	x5, [x2, x4]
   32a90:	ldr	x6, [x3, x4]
   32a94:	cmp	x5, x6
   32a98:	b.ne	32ad8 <fastgzip_safe::enc::scan::<13, true, false>+0x4a0>  // b.any
   32a9c:	add	x6, x4, #0x10
   32aa0:	add	x5, x4, #0x8
   32aa4:	cmp	x6, x18
   32aa8:	mov	x4, x5
   32aac:	b.ls	32a8c <fastgzip_safe::enc::scan::<13, true, false>+0x454>  // b.plast
   32ab0:	cmp	x5, x18
   32ab4:	b.cs	32ae8 <fastgzip_safe::enc::scan::<13, true, false>+0x4b0>  // b.hs, b.nlast
   32ab8:	subs	x4, x18, #0x8
   32abc:	csel	x4, xzr, x4, cc	// cc = lo, ul, last
   32ac0:	ldr	x2, [x2, x4]
   32ac4:	ldr	x3, [x3, x4]
   32ac8:	cmp	x2, x3
   32acc:	b.eq	32ae8 <fastgzip_safe::enc::scan::<13, true, false>+0x4b0>  // b.none
   32ad0:	eor	x18, x3, x2
   32ad4:	b	32adc <fastgzip_safe::enc::scan::<13, true, false>+0x4a4>
   32ad8:	eor	x18, x6, x5
   32adc:	rbit	x18, x18
   32ae0:	clz	x18, x18
   32ae4:	add	x18, x4, x18, lsr #3
   32ae8:	and	x2, x18, #0x1ff
   32aec:	mvn	w3, w17
   32af0:	ldr	w2, [x9, x2, lsl #2]
   32af4:	and	x6, x20, #0xffff
   32af8:	add	w3, w3, w0
   32afc:	str	x28, [x26, x6]
   32b00:	sub	w17, w17, w0
   32b04:	clz	w4, w3
   32b08:	ubfx	x6, x2, #19, #5
   32b0c:	lsr	x16, x16, #16
   32b10:	subs	w5, w13, w4
   32b14:	and	x2, x2, #0x7ffff
   32b18:	and	w24, w25, #0x7
   32b1c:	lsr	w3, w3, w5
   32b20:	csel	w5, wzr, w5, cc	// cc = lo, ul, last
   32b24:	mul	x16, x16, x8
   32b28:	lsl	w7, w14, w5
   32b2c:	and	w3, w3, #0x1
   32b30:	orr	w3, w3, w4, lsl #1
   32b34:	mvn	w7, w7
   32b38:	and	w4, w25, #0x38
   32b3c:	bic	w17, w7, w17
   32b40:	lsr	x4, x28, x4
   32b44:	ubfx	w7, w25, #3, #3
   32b48:	ldr	w3, [x11, w3, uxtw #2]
   32b4c:	lsr	x16, x16, #50
   32b50:	add	x7, x20, x7
   32b54:	and	x23, x3, #0xffff
   32b58:	add	w3, w6, w3, lsr #16
   32b5c:	lsl	x6, x23, x6
   32b60:	and	w23, w25, #0xffff8007
   32b64:	lsl	x17, x17, x3
   32b68:	add	w5, w5, w23
   32b6c:	orr	x2, x6, x2
   32b70:	add	w3, w5, w3
   32b74:	add	w6, w0, #0x1
   32b78:	orr	x17, x2, x17
   32b7c:	and	w5, w3, #0x38
   32b80:	add	w2, w0, #0x2
   32b84:	lsl	x17, x17, x24
   32b88:	add	x0, x18, x0
   32b8c:	and	x18, x7, #0xffff
   32b90:	strh	w6, [x22, x15, lsl #1]
   32b94:	and	x15, x16, #0x3ffe
   32b98:	cmp	x0, x27
   32b9c:	orr	x17, x17, x4
   32ba0:	ubfx	w4, w3, #3, #3
   32ba4:	and	w25, w3, #0xffff8007
   32ba8:	lsr	x28, x17, x5
   32bac:	str	x17, [x26, x18]
   32bb0:	add	x20, x7, x4
   32bb4:	strh	w2, [x22, x15]
   32bb8:	b.cs	32734 <fastgzip_safe::enc::scan::<13, true, false>+0xfc>  // b.hs, b.nlast
   32bbc:	sub	w16, w0, #0x1
   32bc0:	ldur	x23, [x29, #-8]
   32bc4:	and	x15, x16, #0xffff
   32bc8:	ldr	x15, [x21, x15]
   32bcc:	mul	x17, x15, x8
   32bd0:	lsr	x15, x15, #8
   32bd4:	lsr	x17, x17, #50
   32bd8:	and	x17, x17, #0x3ffe
   32bdc:	strh	w16, [x22, x17]
   32be0:	mul	x15, x15, x8
   32be4:	cmp	x0, x23
   32be8:	lsr	x15, x15, #51
   32bec:	b.cc	32888 <fastgzip_safe::enc::scan::<13, true, false>+0x250>  // b.lo, b.ul, b.last
   32bf0:	b	329b4 <fastgzip_safe::enc::scan::<13, true, false>+0x37c>
   32bf4:	mov	w25, w2
   32bf8:	sub	x11, x1, x27
   32bfc:	add	x10, x21, x27
   32c00:	ands	x9, x11, #0xfffc
   32c04:	and	x8, x11, #0x3
   32c08:	b.eq	32774 <fastgzip_safe::enc::scan::<13, true, false>+0x13c>  // b.none
   32c0c:	and	x11, x11, #0xfffc
   32c10:	mov	x12, x10
   32c14:	neg	x11, x11
   32c18:	ldrb	w13, [x12]
   32c1c:	ldrb	w14, [x12, #1]
   32c20:	adds	x11, x11, #0x4
   32c24:	ldrb	w15, [x12, #2]
   32c28:	ldrb	w17, [x12, #3]
   32c2c:	add	x12, x12, #0x4
   32c30:	ldr	w13, [x19, x13, lsl #2]
   32c34:	ldr	w14, [x19, x14, lsl #2]
   32c38:	ldr	w15, [x19, x15, lsl #2]
   32c3c:	ldr	w17, [x19, x17, lsl #2]
   32c40:	add	w16, w25, w13, lsr #16
   32c44:	and	x13, x13, #0xffff
   32c48:	lsl	x13, x13, x25
   32c4c:	and	x0, x17, #0xffff
   32c50:	add	w18, w16, w14, lsr #16
   32c54:	and	x14, x14, #0xffff
   32c58:	lsl	x14, x14, x16
   32c5c:	and	x16, x15, #0xffff
   32c60:	orr	x13, x13, x28
   32c64:	add	w15, w18, w15, lsr #16
   32c68:	lsl	x16, x16, x18
   32c6c:	orr	x13, x13, x14
   32c70:	lsl	x14, x0, x15
   32c74:	add	w15, w15, w17, lsr #16
   32c78:	orr	x13, x13, x16
   32c7c:	orr	x13, x13, x14
   32c80:	ubfx	w16, w15, #3, #3
   32c84:	and	w17, w15, #0x38
   32c88:	lsr	x28, x13, x17
   32c8c:	and	x14, x20, #0xffff
   32c90:	and	w25, w15, #0xffff8007
   32c94:	add	x20, x20, x16
   32c98:	str	x13, [x26, x14]
   32c9c:	b.ne	32c18 <fastgzip_safe::enc::scan::<13, true, false>+0x5e0>  // b.any
   32ca0:	cbz	x8, 32d04 <fastgzip_safe::enc::scan::<13, true, false>+0x6cc>
   32ca4:	add	x9, x10, x9
   32ca8:	cmp	x8, #0x1
   32cac:	ldrb	w10, [x9]
   32cb0:	ldr	w10, [x19, x10, lsl #2]
   32cb4:	and	x11, x10, #0xffff
   32cb8:	lsl	x11, x11, x25
   32cbc:	add	w25, w25, w10, lsr #16
   32cc0:	orr	x28, x11, x28
   32cc4:	b.ne	32ce4 <fastgzip_safe::enc::scan::<13, true, false>+0x6ac>  // b.any
   32cc8:	ubfx	w8, w25, #3, #3
   32ccc:	and	x9, x20, #0xffff
   32cd0:	str	x28, [x26, x9]
   32cd4:	and	w9, w25, #0xffff8007
   32cd8:	add	x8, x20, x8
   32cdc:	tbnz	w30, #16, 32d1c <fastgzip_safe::enc::scan::<13, true, false>+0x6e4>
   32ce0:	b	32d50 <fastgzip_safe::enc::scan::<13, true, false>+0x718>
   32ce4:	ldrb	w10, [x9, #1]
   32ce8:	cmp	x8, #0x2
   32cec:	ldr	w10, [x19, x10, lsl #2]
   32cf0:	and	x11, x10, #0xffff
   32cf4:	lsl	x11, x11, x25
   32cf8:	add	w25, w25, w10, lsr #16
   32cfc:	orr	x28, x11, x28
   32d00:	b.ne	32d80 <fastgzip_safe::enc::scan::<13, true, false>+0x748>  // b.any
   32d04:	ubfx	w8, w25, #3, #3
   32d08:	and	x9, x20, #0xffff
   32d0c:	str	x28, [x26, x9]
   32d10:	and	w9, w25, #0xffff8007
   32d14:	add	x8, x20, x8
   32d18:	tbz	w30, #16, 32d50 <fastgzip_safe::enc::scan::<13, true, false>+0x718>
   32d1c:	ldr	w10, [x19, #3072]
   32d20:	and	w11, w25, #0x38
   32d24:	and	w13, w25, #0x7
   32d28:	add	w9, w9, w10, lsr #16
   32d2c:	and	x12, x10, #0xffff
   32d30:	lsr	x10, x28, x11
   32d34:	lsl	x11, x12, x13
   32d38:	ubfx	w12, w9, #3, #3
   32d3c:	and	w9, w9, #0xffff8007
   32d40:	orr	x10, x11, x10
   32d44:	and	x11, x8, #0xffff
   32d48:	add	x8, x8, x12
   32d4c:	str	x10, [x26, x11]
   32d50:	lsl	x8, x8, #3
   32d54:	cmp	w9, #0x7
   32d58:	add	x8, x8, w9, uxtw
   32d5c:	csel	x0, xzr, x8, hi	// hi = pmore
   32d60:	ldp	x20, x19, [sp, #112]
   32d64:	ldp	x22, x21, [sp, #96]
   32d68:	ldp	x24, x23, [sp, #80]
   32d6c:	ldp	x26, x25, [sp, #64]
   32d70:	ldp	x28, x27, [sp, #48]
   32d74:	ldp	x29, x30, [sp, #32]
   32d78:	add	sp, sp, #0x80
   32d7c:	ret
   32d80:	ldrb	w8, [x9, #2]
   32d84:	ldr	w8, [x19, x8, lsl #2]
   32d88:	and	x9, x8, #0xffff
   32d8c:	lsl	x9, x9, x25
   32d90:	add	w25, w25, w8, lsr #16
   32d94:	orr	x28, x9, x28
   32d98:	ubfx	w8, w25, #3, #3
   32d9c:	and	x9, x20, #0xffff
   32da0:	str	x28, [x26, x9]
   32da4:	and	w9, w25, #0xffff8007
   32da8:	add	x8, x20, x8
   32dac:	tbnz	w30, #16, 32d1c <fastgzip_safe::enc::scan::<13, true, false>+0x6e4>
   32db0:	b	32d50 <fastgzip_safe::enc::scan::<13, true, false>+0x718>
   32db4:	and	x28, x28, #0x7e
   32db8:	add	x20, x24, x20
   32dbc:	mov	w25, w8
   32dc0:	tbnz	w7, #0, 326e4 <fastgzip_safe::enc::scan::<13, true, false>+0xac>
   32dc4:	b	32718 <fastgzip_safe::enc::scan::<13, true, false>+0xe0>
   32dc8:	mov	w8, #0x80                  	// #128
   32dcc:	adrp	x3, bd000 <anon.7a263ad2a3e00f1d3c23c4bfb0e9541b.29.llvm.2438094699631020562+0x58>
   32dd0:	add	x3, x3, #0x368
   32dd4:	movk	w8, #0x1, lsl #16
   32dd8:	add	x2, x8, #0x88
   32ddc:	bl	df34 <core::slice::index::slice_index_fail>
   32de0:	adrp	x3, bd000 <anon.7a263ad2a3e00f1d3c23c4bfb0e9541b.29.llvm.2438094699631020562+0x58>
   32de4:	add	x3, x3, #0x3c8
   32de8:	mov	x0, xzr
   32dec:	mov	x1, x24
   32df0:	mov	w2, #0x240                 	// #576
   32df4:	bl	df34 <core::slice::index::slice_index_fail>
   32df8:	mov	w2, #0x80                  	// #128
   32dfc:	adrp	x3, bd000 <anon.7a263ad2a3e00f1d3c23c4bfb0e9541b.29.llvm.2438094699631020562+0x58>
   32e00:	add	x3, x3, #0x3e0
   32e04:	mov	x0, x20
   32e08:	movk	w2, #0x1, lsl #16
   32e0c:	bl	df34 <core::slice::index::slice_index_fail>
   32e10:	adrp	x2, bd000 <anon.7a263ad2a3e00f1d3c23c4bfb0e9541b.29.llvm.2438094699631020562+0x58>
   32e14:	add	x2, x2, #0x3f8
   32e18:	mov	x0, x24
   32e1c:	mov	w1, #0x240                 	// #576
   32e20:	bl	dd98 <core::panicking::panic_bounds_check>
