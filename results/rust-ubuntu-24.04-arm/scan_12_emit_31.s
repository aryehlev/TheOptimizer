000000000001fdb0 <gzhot::enc::scan::<12, true, false>>:
   1fdb0:	stp	x29, x30, [sp, #-96]!
   1fdb4:	stp	x28, x27, [sp, #16]
   1fdb8:	stp	x26, x25, [sp, #32]
   1fdbc:	stp	x24, x23, [sp, #48]
   1fdc0:	stp	x22, x21, [sp, #64]
   1fdc4:	stp	x20, x19, [sp, #80]
   1fdc8:	mov	x29, sp
   1fdcc:	ldr	w25, [x0, #2192]
   1fdd0:	mov	x19, x6
   1fdd4:	mov	x23, x5
   1fdd8:	mov	x22, x4
   1fddc:	mov	x21, x0
   1fde0:	mov	x24, x1
   1fde4:	lsr	x20, x25, #3
   1fde8:	cmp	w25, #0x3ff
   1fdec:	add	x27, x0, #0x894
   1fdf0:	b.hi	1fe18 <gzhot::enc::scan::<12, true, false>+0x68>  // b.pmore
   1fdf4:	ldp	q0, q1, [x27, #64]
   1fdf8:	stp	q0, q1, [x19, #64]
   1fdfc:	ldp	q0, q2, [x27, #96]
   1fe00:	stp	q0, q2, [x19, #96]
   1fe04:	ldp	q1, q0, [x27]
   1fe08:	stp	q1, q0, [x19]
   1fe0c:	ldp	q2, q0, [x27, #32]
   1fe10:	stp	q2, q0, [x19, #32]
   1fe14:	b	1fe34 <gzhot::enc::scan::<12, true, false>+0x84>
   1fe18:	add	x1, x21, #0x894
   1fe1c:	mov	x0, x19
   1fe20:	mov	x2, x20
   1fe24:	bl	6e00 <memcpy@plt>
   1fe28:	lsr	w8, w25, #9
   1fe2c:	cmp	w8, #0x8
   1fe30:	b.hi	20674 <gzhot::enc::scan::<12, true, false>+0x8c4>  // b.pmore
   1fe34:	and	x26, x25, #0x7
   1fe38:	mov	x8, #0xffffffffffffffff    	// #-1
   1fe3c:	ldrb	w10, [x27, x20]
   1fe40:	lsl	x8, x8, x26
   1fe44:	ldrb	w9, [x29, #96]
   1fe48:	bic	x25, x10, x8
   1fe4c:	tbnz	w9, #0, 1fe68 <gzhot::enc::scan::<12, true, false>+0xb8>
   1fe50:	cbz	x20, 1fe64 <gzhot::enc::scan::<12, true, false>+0xb4>
   1fe54:	ldrb	w8, [x19]
   1fe58:	and	w8, w8, #0xfe
   1fe5c:	strb	w8, [x19]
   1fe60:	b	1fe68 <gzhot::enc::scan::<12, true, false>+0xb8>
   1fe64:	and	x25, x25, #0x7e
   1fe68:	mov	x0, x24
   1fe6c:	mov	w1, wzr
   1fe70:	mov	w2, #0x2000                	// #8192
   1fe74:	bl	71c0 <memset@plt>
   1fe78:	subs	x8, x23, #0x9
   1fe7c:	csel	x9, xzr, x8, cc	// cc = lo, ul, last
   1fe80:	subs	x8, x23, #0xc
   1fe84:	csel	x10, xzr, x8, cc	// cc = lo, ul, last
   1fe88:	cmp	x9, #0x1
   1fe8c:	b.hi	1fea8 <gzhot::enc::scan::<12, true, false>+0xf8>  // b.pmore
   1fe90:	mov	x8, xzr
   1fe94:	mov	w0, w26
   1fe98:	add	x9, x8, #0x4
   1fe9c:	cmp	x9, x23
   1fea0:	b.ls	20544 <gzhot::enc::scan::<12, true, false>+0x794>  // b.plast
   1fea4:	b	205d4 <gzhot::enc::scan::<12, true, false>+0x824>
   1fea8:	ldrb	w8, [x22]
   1feac:	subs	x12, x23, #0x10
   1feb0:	mov	w15, #0x102                 	// #258
   1feb4:	csel	x12, xzr, x12, cc	// cc = lo, ul, last
   1feb8:	mov	w16, #0x1e                  	// #30
   1febc:	mov	w17, #0xffffffff            	// #-1
   1fec0:	ldr	w8, [x21, x8, lsl #2]
   1fec4:	and	x11, x8, #0xffff
   1fec8:	add	w3, w26, w8, lsr #16
   1fecc:	lsl	x8, x11, x26
   1fed0:	mov	x11, #0x87000000            	// #2264924160
   1fed4:	ubfx	w13, w3, #3, #3
   1fed8:	and	w14, w3, #0x38
   1fedc:	movk	x11, #0xebca, lsl #32
   1fee0:	orr	x8, x8, x25
   1fee4:	movk	x11, #0xb185, lsl #48
   1fee8:	str	x8, [x19, x20]
   1feec:	lsr	x25, x8, x14
   1fef0:	add	x20, x20, x13
   1fef4:	add	x13, x21, #0x400
   1fef8:	add	x14, x21, #0x810
   1fefc:	mov	w8, #0x1                   	// #1
   1ff00:	cmp	x8, x12
   1ff04:	and	w0, w3, #0xffff8007
   1ff08:	b.cs	2015c <gzhot::enc::scan::<12, true, false>+0x3ac>  // b.hs, b.nlast
   1ff0c:	ldr	x18, [x22, x8]
   1ff10:	mul	x1, x18, x11
   1ff14:	lsr	x1, x1, #51
   1ff18:	and	x4, x1, #0x1ffe
   1ff1c:	ldrh	w1, [x24, x4]
   1ff20:	strh	w8, [x24, x4]
   1ff24:	ldr	x2, [x22, x1]
   1ff28:	eor	x2, x2, x18
   1ff2c:	cbz	w2, 203c0 <gzhot::enc::scan::<12, true, false>+0x610>
   1ff30:	add	x4, x22, x8
   1ff34:	and	x1, x18, #0xff
   1ff38:	and	w3, w3, #0x7
   1ff3c:	ldur	x18, [x4, #1]
   1ff40:	mul	x2, x18, x11
   1ff44:	lsr	x2, x2, #51
   1ff48:	and	x5, x2, #0x1ffe
   1ff4c:	ldr	w2, [x21, x1, lsl #2]
   1ff50:	ldrh	w1, [x24, x5]
   1ff54:	and	x6, x2, #0xffff
   1ff58:	add	w0, w0, w2, lsr #16
   1ff5c:	ldr	x7, [x22, x1]
   1ff60:	lsl	x3, x6, x3
   1ff64:	add	w6, w8, #0x1
   1ff68:	strh	w6, [x24, x5]
   1ff6c:	eor	x2, x7, x18
   1ff70:	orr	x25, x3, x25
   1ff74:	cbz	w2, 202fc <gzhot::enc::scan::<12, true, false>+0x54c>
   1ff78:	and	x1, x18, #0xff
   1ff7c:	ldur	x18, [x4, #2]
   1ff80:	ldr	w2, [x21, x1, lsl #2]
   1ff84:	mul	x1, x18, x11
   1ff88:	and	x3, x2, #0xffff
   1ff8c:	lsl	x3, x3, x0
   1ff90:	add	w0, w0, w2, lsr #16
   1ff94:	orr	x25, x3, x25
   1ff98:	add	w3, w8, #0x2
   1ff9c:	lsr	x1, x1, #51
   1ffa0:	and	x4, x1, #0x1ffe
   1ffa4:	ldrh	w1, [x24, x4]
   1ffa8:	strh	w3, [x24, x4]
   1ffac:	ldr	x5, [x22, x1]
   1ffb0:	eor	x2, x5, x18
   1ffb4:	cbz	w2, 20304 <gzhot::enc::scan::<12, true, false>+0x554>
   1ffb8:	add	x3, x22, x8
   1ffbc:	and	x1, x18, #0xff
   1ffc0:	ldur	x18, [x3, #3]
   1ffc4:	mul	x2, x18, x11
   1ffc8:	lsr	x2, x2, #51
   1ffcc:	and	x4, x2, #0x1ffe
   1ffd0:	ldr	w2, [x21, x1, lsl #2]
   1ffd4:	ldrh	w1, [x24, x4]
   1ffd8:	and	x5, x2, #0xffff
   1ffdc:	ldr	x6, [x22, x1]
   1ffe0:	lsl	x5, x5, x0
   1ffe4:	add	w0, w0, w2, lsr #16
   1ffe8:	eor	x2, x6, x18
   1ffec:	orr	x25, x5, x25
   1fff0:	add	w6, w8, #0x3
   1fff4:	strh	w6, [x24, x4]
   1fff8:	cbz	w2, 2030c <gzhot::enc::scan::<12, true, false>+0x55c>
   1fffc:	and	x1, x18, #0xff
   20000:	ldur	x18, [x3, #4]
   20004:	ldr	w1, [x21, x1, lsl #2]
   20008:	mul	x2, x18, x11
   2000c:	add	w3, w0, w1, lsr #16
   20010:	and	w6, w3, #0x38
   20014:	lsr	x2, x2, #51
   20018:	and	x4, x2, #0x1ffe
   2001c:	and	x2, x1, #0xffff
   20020:	ldrh	w1, [x24, x4]
   20024:	lsl	x0, x2, x0
   20028:	ubfx	w2, w3, #3, #3
   2002c:	ldr	x5, [x22, x1]
   20030:	orr	x0, x0, x25
   20034:	str	x0, [x19, x20]
   20038:	lsr	x25, x0, x6
   2003c:	add	w0, w8, #0x4
   20040:	add	x20, x20, x2
   20044:	eor	x2, x5, x18
   20048:	strh	w0, [x24, x4]
   2004c:	and	w0, w3, #0xffff8007
   20050:	cbz	w2, 20314 <gzhot::enc::scan::<12, true, false>+0x564>
   20054:	add	x4, x22, x8
   20058:	and	x1, x18, #0xff
   2005c:	and	w3, w3, #0x7
   20060:	ldur	x18, [x4, #5]
   20064:	mul	x2, x18, x11
   20068:	lsr	x2, x2, #51
   2006c:	and	x5, x2, #0x1ffe
   20070:	ldr	w2, [x21, x1, lsl #2]
   20074:	ldrh	w1, [x24, x5]
   20078:	and	x6, x2, #0xffff
   2007c:	add	w0, w0, w2, lsr #16
   20080:	ldr	x7, [x22, x1]
   20084:	lsl	x3, x6, x3
   20088:	add	w6, w8, #0x5
   2008c:	strh	w6, [x24, x5]
   20090:	eor	x2, x7, x18
   20094:	orr	x25, x3, x25
   20098:	cbz	w2, 2031c <gzhot::enc::scan::<12, true, false>+0x56c>
   2009c:	and	x1, x18, #0xff
   200a0:	ldur	x18, [x4, #6]
   200a4:	ldr	w2, [x21, x1, lsl #2]
   200a8:	mul	x1, x18, x11
   200ac:	and	x3, x2, #0xffff
   200b0:	lsl	x3, x3, x0
   200b4:	add	w0, w0, w2, lsr #16
   200b8:	orr	x25, x3, x25
   200bc:	add	w3, w8, #0x6
   200c0:	lsr	x1, x1, #51
   200c4:	and	x4, x1, #0x1ffe
   200c8:	ldrh	w1, [x24, x4]
   200cc:	strh	w3, [x24, x4]
   200d0:	ldr	x5, [x22, x1]
   200d4:	eor	x2, x5, x18
   200d8:	cbz	w2, 20324 <gzhot::enc::scan::<12, true, false>+0x574>
   200dc:	add	x1, x22, x8
   200e0:	and	x2, x18, #0xff
   200e4:	ldur	x18, [x1, #7]
   200e8:	ldr	w2, [x21, x2, lsl #2]
   200ec:	mul	x1, x18, x11
   200f0:	and	x4, x2, #0xffff
   200f4:	lsl	x4, x4, x0
   200f8:	add	w0, w0, w2, lsr #16
   200fc:	orr	x25, x4, x25
   20100:	lsr	x1, x1, #51
   20104:	and	x3, x1, #0x1ffe
   20108:	ldrh	w1, [x24, x3]
   2010c:	ldr	x5, [x22, x1]
   20110:	eor	x2, x5, x18
   20114:	add	w5, w8, #0x7
   20118:	strh	w5, [x24, x3]
   2011c:	cbz	w2, 2032c <gzhot::enc::scan::<12, true, false>+0x57c>
   20120:	and	x18, x18, #0xff
   20124:	add	x8, x8, #0x8
   20128:	ldr	w18, [x21, x18, lsl #2]
   2012c:	cmp	x8, x12
   20130:	and	x1, x18, #0xffff
   20134:	add	w3, w0, w18, lsr #16
   20138:	lsl	x1, x1, x0
   2013c:	ubfx	w0, w3, #3, #3
   20140:	orr	x18, x1, x25
   20144:	and	w1, w3, #0x38
   20148:	str	x18, [x19, x20]
   2014c:	lsr	x25, x18, x1
   20150:	add	x20, x20, x0
   20154:	and	w0, w3, #0xffff8007
   20158:	b.cc	1ff0c <gzhot::enc::scan::<12, true, false>+0x15c>  // b.lo, b.ul, b.last
   2015c:	cmp	x8, x10
   20160:	b.cs	20290 <gzhot::enc::scan::<12, true, false>+0x4e0>  // b.hs, b.nlast
   20164:	ldr	x18, [x22, x8]
   20168:	mul	x1, x18, x11
   2016c:	lsr	x1, x1, #51
   20170:	and	x3, x1, #0x1ffe
   20174:	ldrh	w1, [x24, x3]
   20178:	strh	w8, [x24, x3]
   2017c:	ldr	x2, [x22, x1]
   20180:	eor	x2, x2, x18
   20184:	cbz	w2, 203c0 <gzhot::enc::scan::<12, true, false>+0x610>
   20188:	add	x3, x22, x8
   2018c:	and	x1, x18, #0xff
   20190:	and	w6, w0, #0x7
   20194:	ldur	x18, [x3, #1]
   20198:	mul	x2, x18, x11
   2019c:	lsr	x2, x2, #51
   201a0:	and	x4, x2, #0x1ffe
   201a4:	ldr	w2, [x21, x1, lsl #2]
   201a8:	ldrh	w1, [x24, x4]
   201ac:	and	x5, x2, #0xffff
   201b0:	add	w0, w0, w2, lsr #16
   201b4:	ldr	x7, [x22, x1]
   201b8:	lsl	x5, x5, x6
   201bc:	add	w6, w8, #0x1
   201c0:	strh	w6, [x24, x4]
   201c4:	eor	x2, x7, x18
   201c8:	orr	x25, x5, x25
   201cc:	cbz	w2, 202fc <gzhot::enc::scan::<12, true, false>+0x54c>
   201d0:	and	x1, x18, #0xff
   201d4:	ldur	x18, [x3, #2]
   201d8:	ldr	w2, [x21, x1, lsl #2]
   201dc:	mul	x1, x18, x11
   201e0:	and	x3, x2, #0xffff
   201e4:	lsl	x3, x3, x0
   201e8:	add	w0, w0, w2, lsr #16
   201ec:	orr	x25, x3, x25
   201f0:	add	w3, w8, #0x2
   201f4:	lsr	x1, x1, #51
   201f8:	and	x4, x1, #0x1ffe
   201fc:	ldrh	w1, [x24, x4]
   20200:	strh	w3, [x24, x4]
   20204:	ldr	x5, [x22, x1]
   20208:	eor	x2, x5, x18
   2020c:	cbz	w2, 20304 <gzhot::enc::scan::<12, true, false>+0x554>
   20210:	add	x1, x22, x8
   20214:	and	x2, x18, #0xff
   20218:	ldur	x18, [x1, #3]
   2021c:	ldr	w2, [x21, x2, lsl #2]
   20220:	mul	x1, x18, x11
   20224:	and	x4, x2, #0xffff
   20228:	lsl	x4, x4, x0
   2022c:	add	w0, w0, w2, lsr #16
   20230:	orr	x25, x4, x25
   20234:	lsr	x1, x1, #51
   20238:	and	x3, x1, #0x1ffe
   2023c:	ldrh	w1, [x24, x3]
   20240:	ldr	x5, [x22, x1]
   20244:	eor	x2, x5, x18
   20248:	add	w5, w8, #0x3
   2024c:	strh	w5, [x24, x3]
   20250:	cbz	w2, 2030c <gzhot::enc::scan::<12, true, false>+0x55c>
   20254:	and	x18, x18, #0xff
   20258:	add	x8, x8, #0x4
   2025c:	ldr	w18, [x21, x18, lsl #2]
   20260:	cmp	x8, x10
   20264:	and	x1, x18, #0xffff
   20268:	add	w18, w0, w18, lsr #16
   2026c:	lsl	x1, x1, x0
   20270:	and	w2, w18, #0x38
   20274:	orr	x0, x1, x25
   20278:	ubfx	w1, w18, #3, #3
   2027c:	str	x0, [x19, x20]
   20280:	lsr	x25, x0, x2
   20284:	and	w0, w18, #0xffff8007
   20288:	add	x20, x20, x1
   2028c:	b.cc	20164 <gzhot::enc::scan::<12, true, false>+0x3b4>  // b.lo, b.ul, b.last
   20290:	cmp	x8, x9
   20294:	b.cs	1fe98 <gzhot::enc::scan::<12, true, false>+0xe8>  // b.hs, b.nlast
   20298:	ldr	x18, [x22, x8]
   2029c:	mul	x1, x18, x11
   202a0:	lsr	x1, x1, #51
   202a4:	and	x3, x1, #0x1ffe
   202a8:	ldrh	w1, [x24, x3]
   202ac:	strh	w8, [x24, x3]
   202b0:	ldr	x2, [x22, x1]
   202b4:	eor	x2, x2, x18
   202b8:	cbz	w2, 203c0 <gzhot::enc::scan::<12, true, false>+0x610>
   202bc:	and	x18, x18, #0xff
   202c0:	add	x8, x8, #0x1
   202c4:	ldr	w18, [x21, x18, lsl #2]
   202c8:	cmp	x8, x9
   202cc:	and	x1, x18, #0xffff
   202d0:	add	w18, w0, w18, lsr #16
   202d4:	lsl	x1, x1, x0
   202d8:	and	w2, w18, #0x38
   202dc:	orr	x0, x1, x25
   202e0:	ubfx	w1, w18, #3, #3
   202e4:	str	x0, [x19, x20]
   202e8:	lsr	x25, x0, x2
   202ec:	and	w0, w18, #0xffff8007
   202f0:	add	x20, x20, x1
   202f4:	b.cc	20298 <gzhot::enc::scan::<12, true, false>+0x4e8>  // b.lo, b.ul, b.last
   202f8:	b	1fe98 <gzhot::enc::scan::<12, true, false>+0xe8>
   202fc:	add	x8, x8, #0x1
   20300:	b	203c0 <gzhot::enc::scan::<12, true, false>+0x610>
   20304:	add	x8, x8, #0x2
   20308:	b	203c0 <gzhot::enc::scan::<12, true, false>+0x610>
   2030c:	add	x8, x8, #0x3
   20310:	b	203c0 <gzhot::enc::scan::<12, true, false>+0x610>
   20314:	add	x8, x8, #0x4
   20318:	b	203c0 <gzhot::enc::scan::<12, true, false>+0x610>
   2031c:	add	x8, x8, #0x5
   20320:	b	203c0 <gzhot::enc::scan::<12, true, false>+0x610>
   20324:	add	x8, x8, #0x6
   20328:	b	203c0 <gzhot::enc::scan::<12, true, false>+0x610>
   2032c:	add	x8, x8, #0x7
   20330:	b	203c0 <gzhot::enc::scan::<12, true, false>+0x610>
   20334:	sub	x2, x23, x8
   20338:	add	x4, x22, x8
   2033c:	add	x5, x22, x1
   20340:	cmp	x2, #0x102
   20344:	csel	x3, x2, x15, cc	// cc = lo, ul, last
   20348:	cmp	x2, #0x10
   2034c:	b.cs	20358 <gzhot::enc::scan::<12, true, false>+0x5a8>  // b.hs, b.nlast
   20350:	mov	w2, #0x8                   	// #8
   20354:	b	20380 <gzhot::enc::scan::<12, true, false>+0x5d0>
   20358:	mov	w6, #0x8                   	// #8
   2035c:	ldr	x2, [x4, x6]
   20360:	ldr	x7, [x5, x6]
   20364:	cmp	x2, x7
   20368:	b.ne	203ac <gzhot::enc::scan::<12, true, false>+0x5fc>  // b.any
   2036c:	add	x7, x6, #0x10
   20370:	add	x2, x6, #0x8
   20374:	cmp	x7, x3
   20378:	mov	x6, x2
   2037c:	b.ls	2035c <gzhot::enc::scan::<12, true, false>+0x5ac>  // b.plast
   20380:	cmp	x2, x3
   20384:	b.cs	203d0 <gzhot::enc::scan::<12, true, false>+0x620>  // b.hs, b.nlast
   20388:	ldrb	w6, [x4, x2]
   2038c:	ldrb	w7, [x5, x2]
   20390:	cmp	w6, w7
   20394:	b.ne	203d0 <gzhot::enc::scan::<12, true, false>+0x620>  // b.any
   20398:	add	x2, x2, #0x1
   2039c:	cmp	x3, x2
   203a0:	b.ne	20388 <gzhot::enc::scan::<12, true, false>+0x5d8>  // b.any
   203a4:	mov	x2, x3
   203a8:	b	203d0 <gzhot::enc::scan::<12, true, false>+0x620>
   203ac:	eor	x2, x7, x2
   203b0:	rbit	x2, x2
   203b4:	clz	x2, x2
   203b8:	add	x2, x6, x2, lsr #3
   203bc:	b	203d0 <gzhot::enc::scan::<12, true, false>+0x620>
   203c0:	cbz	x2, 20334 <gzhot::enc::scan::<12, true, false>+0x584>
   203c4:	rbit	x2, x2
   203c8:	clz	x2, x2
   203cc:	lsr	x2, x2, #3
   203d0:	mvn	w1, w1
   203d4:	add	w1, w1, w8
   203d8:	clz	w4, w1
   203dc:	mov	w5, w1
   203e0:	subs	w6, w16, w4
   203e4:	csel	w3, wzr, w6, cc	// cc = lo, ul, last
   203e8:	cmp	w1, #0x2
   203ec:	b.cc	20400 <gzhot::enc::scan::<12, true, false>+0x650>  // b.lo, b.ul, b.last
   203f0:	lsr	w5, w1, w6
   203f4:	and	w5, w5, #0x1
   203f8:	sub	w4, w5, w4, lsl #1
   203fc:	add	w5, w4, #0x3e
   20400:	ldr	w4, [x13, x2, lsl #2]
   20404:	ldr	w5, [x14, w5, uxtw #2]
   20408:	and	w27, w0, #0x3f
   2040c:	ubfx	x26, x4, #19, #5
   20410:	add	w6, w26, w5, lsr #16
   20414:	add	w7, w6, w3
   20418:	add	w28, w7, w27
   2041c:	cmp	w28, #0x3f
   20420:	b.ls	20444 <gzhot::enc::scan::<12, true, false>+0x694>  // b.plast
   20424:	ubfx	w28, w0, #3, #3
   20428:	and	w27, w0, #0x38
   2042c:	and	w30, w0, #0xffff8007
   20430:	str	x25, [x19, x20]
   20434:	lsr	x25, x25, x27
   20438:	and	w27, w0, #0x7
   2043c:	add	x20, x20, x28
   20440:	mov	w0, w30
   20444:	lsr	x28, x18, #8
   20448:	lsl	w3, w17, w3
   2044c:	lsr	x18, x18, #16
   20450:	and	x5, x5, #0xffff
   20454:	and	x4, x4, #0x7ffff
   20458:	mul	x28, x28, x11
   2045c:	lsl	x5, x5, x26
   20460:	bic	w1, w1, w3
   20464:	lsl	x1, x1, x6
   20468:	add	w3, w0, w7
   2046c:	add	w0, w8, #0x1
   20470:	mul	x18, x18, x11
   20474:	orr	x4, x5, x4
   20478:	add	w5, w8, #0x2
   2047c:	orr	x1, x4, x1
   20480:	add	x8, x2, x8
   20484:	ubfx	w2, w3, #3, #3
   20488:	lsl	x1, x1, x27
   2048c:	and	w6, w3, #0x38
   20490:	cmp	x8, x9
   20494:	lsr	x4, x28, #51
   20498:	orr	x1, x1, x25
   2049c:	str	x1, [x19, x20]
   204a0:	add	x20, x20, x2
   204a4:	lsr	x18, x18, #51
   204a8:	and	x4, x4, #0x1ffe
   204ac:	lsr	x25, x1, x6
   204b0:	strh	w0, [x24, x4]
   204b4:	and	w0, w3, #0xffff8007
   204b8:	and	x18, x18, #0x1ffe
   204bc:	strh	w5, [x24, x18]
   204c0:	b.cs	1fe98 <gzhot::enc::scan::<12, true, false>+0xe8>  // b.hs, b.nlast
   204c4:	sub	x1, x8, #0x1
   204c8:	ldr	x18, [x22, x8]
   204cc:	ldr	x2, [x22, x1]
   204d0:	mul	x4, x18, x11
   204d4:	mul	x2, x2, x11
   204d8:	lsr	x4, x4, #51
   204dc:	lsr	x2, x2, #51
   204e0:	and	x4, x4, #0x1ffe
   204e4:	and	x2, x2, #0x1ffe
   204e8:	strh	w1, [x24, x2]
   204ec:	ldrh	w1, [x24, x4]
   204f0:	strh	w8, [x24, x4]
   204f4:	ldr	x2, [x22, x1]
   204f8:	eor	x2, x2, x18
   204fc:	cbz	w2, 203c0 <gzhot::enc::scan::<12, true, false>+0x610>
   20500:	and	x18, x18, #0xff
   20504:	and	w2, w3, #0x7
   20508:	add	x8, x8, #0x1
   2050c:	ldr	w18, [x21, x18, lsl #2]
   20510:	and	x1, x18, #0xffff
   20514:	add	w3, w0, w18, lsr #16
   20518:	lsl	x1, x1, x2
   2051c:	ubfx	w0, w3, #3, #3
   20520:	orr	x18, x1, x25
   20524:	and	w1, w3, #0x38
   20528:	str	x18, [x19, x20]
   2052c:	lsr	x25, x18, x1
   20530:	add	x20, x20, x0
   20534:	cmp	x8, x12
   20538:	and	w0, w3, #0xffff8007
   2053c:	b.cc	1ff0c <gzhot::enc::scan::<12, true, false>+0x15c>  // b.lo, b.ul, b.last
   20540:	b	2015c <gzhot::enc::scan::<12, true, false>+0x3ac>
   20544:	add	x9, x22, #0x1
   20548:	add	x10, x9, x8
   2054c:	ldurb	w11, [x10, #-1]
   20550:	ldrb	w12, [x10]
   20554:	ldrb	w13, [x10, #1]
   20558:	ldrb	w10, [x10, #2]
   2055c:	ldr	w11, [x21, x11, lsl #2]
   20560:	ldr	w12, [x21, x12, lsl #2]
   20564:	ldr	w13, [x21, x13, lsl #2]
   20568:	ldr	w10, [x21, x10, lsl #2]
   2056c:	add	w14, w0, w11, lsr #16
   20570:	and	x11, x11, #0xffff
   20574:	lsl	x11, x11, x0
   20578:	and	x16, x10, #0xffff
   2057c:	add	w15, w14, w12, lsr #16
   20580:	and	x12, x12, #0xffff
   20584:	lsl	x12, x12, x14
   20588:	and	x14, x13, #0xffff
   2058c:	orr	x11, x11, x25
   20590:	add	w13, w15, w13, lsr #16
   20594:	lsl	x14, x14, x15
   20598:	orr	x11, x11, x12
   2059c:	lsl	x12, x16, x13
   205a0:	add	w10, w13, w10, lsr #16
   205a4:	orr	x11, x11, x14
   205a8:	add	x14, x8, #0x8
   205ac:	add	x8, x8, #0x4
   205b0:	orr	x11, x11, x12
   205b4:	ubfx	w12, w10, #3, #3
   205b8:	and	w13, w10, #0x38
   205bc:	lsr	x25, x11, x13
   205c0:	str	x11, [x19, x20]
   205c4:	cmp	x14, x23
   205c8:	add	x20, x20, x12
   205cc:	and	w0, w10, #0xffff8007
   205d0:	b.ls	20548 <gzhot::enc::scan::<12, true, false>+0x798>  // b.plast
   205d4:	subs	x9, x23, x8
   205d8:	b.ls	20604 <gzhot::enc::scan::<12, true, false>+0x854>  // b.plast
   205dc:	add	x8, x22, x8
   205e0:	ldrb	w10, [x8], #1
   205e4:	subs	x9, x9, #0x1
   205e8:	ldr	w10, [x21, x10, lsl #2]
   205ec:	and	x11, x10, #0xffff
   205f0:	lsl	x11, x11, x0
   205f4:	add	w0, w0, w10, lsr #16
   205f8:	orr	x25, x11, x25
   205fc:	b.ne	205e0 <gzhot::enc::scan::<12, true, false>+0x830>  // b.any
   20600:	b	20604 <gzhot::enc::scan::<12, true, false>+0x854>
   20604:	ldr	w9, [x21, #2060]
   20608:	and	w8, w0, #0xffff8007
   2060c:	ubfx	w10, w0, #3, #3
   20610:	and	w11, w0, #0x38
   20614:	and	w12, w0, #0x7
   20618:	str	x25, [x19, x20]
   2061c:	add	w8, w8, w9, lsr #16
   20620:	and	x9, x9, #0xffff
   20624:	lsr	x11, x25, x11
   20628:	lsl	x12, x9, x12
   2062c:	add	x10, x20, x10
   20630:	and	w9, w8, #0xffff8007
   20634:	cmp	w9, #0x3f
   20638:	orr	x11, x12, x11
   2063c:	str	x11, [x19, x10]
   20640:	b.ls	2064c <gzhot::enc::scan::<12, true, false>+0x89c>  // b.plast
   20644:	mov	x0, xzr
   20648:	b	20658 <gzhot::enc::scan::<12, true, false>+0x8a8>
   2064c:	ubfx	w8, w8, #3, #3
   20650:	add	x8, x10, x8
   20654:	orr	x0, x9, x8, lsl #3
   20658:	ldp	x20, x19, [sp, #80]
   2065c:	ldp	x22, x21, [sp, #64]
   20660:	ldp	x24, x23, [sp, #48]
   20664:	ldp	x26, x25, [sp, #32]
   20668:	ldp	x28, x27, [sp, #16]
   2066c:	ldp	x29, x30, [sp], #96
   20670:	ret
   20674:	adrp	x2, bc000 <anon.d12d701ec82cade226dab3f33ffca366.13.llvm.3122205982755605208+0x48>
   20678:	add	x2, x2, #0x398
   2067c:	mov	x0, x20
   20680:	mov	w1, #0x240                 	// #576
   20684:	bl	dc84 <core::panicking::panic_bounds_check>
