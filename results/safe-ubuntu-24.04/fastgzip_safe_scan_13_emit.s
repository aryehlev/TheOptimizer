0000000000055c30 <fastgzip_safe::enc::scan::<13, true, false>>:
   55c30:	push   %rbp
   55c31:	push   %r15
   55c33:	push   %r14
   55c35:	push   %r13
   55c37:	push   %r12
   55c39:	push   %rbx
   55c3a:	sub    $0x48,%rsp
   55c3e:	mov    %r9d,%r15d
   55c41:	mov    %r8,0x20(%rsp)
   55c46:	movzwl 0x80(%rsp),%r8d
   55c4f:	mov    0xa0(%rsp),%edx
   55c56:	mov    0x98(%rsp),%rcx
   55c5e:	mov    0x90(%rsp),%r11
   55c66:	xor    %eax,%eax
   55c68:	mov    %r8d,%r14d
   55c6b:	sub    $0x9,%r14w
   55c70:	cmovb  %eax,%r14d
   55c74:	mov    %r8d,%ebx
   55c77:	sub    $0xc,%bx
   55c7b:	cmovb  %eax,%ebx
   55c7e:	mov    %ecx,%eax
   55c80:	shr    $0x3,%eax
   55c83:	movzwl %ax,%r12d
   55c87:	test   $0x1,%dl
   55c8a:	mov    %rsi,0x10(%rsp)
   55c8f:	mov    %rdi,0x8(%rsp)
   55c94:	je     55d20 <fastgzip_safe::enc::scan::<13, true, false>+0xf0>
   55c9a:	mov    0xc84(%rdi),%ebp
   55ca0:	mov    %ebp,%r9d
   55ca3:	shr    $0x3,%r9d
   55ca7:	cmp    $0x400,%rbp
   55cae:	jae    55d41 <fastgzip_safe::enc::scan::<13, true, false>+0x111>
   55cb4:	movups 0xcf8(%rdi),%xmm0
   55cbb:	movups %xmm0,0x70(%r11,%r12,1)
   55cc1:	movups 0xce8(%rdi),%xmm0
   55cc8:	movups %xmm0,0x60(%r11,%r12,1)
   55cce:	movups 0xcd8(%rdi),%xmm0
   55cd5:	movups %xmm0,0x50(%r11,%r12,1)
   55cdb:	movups 0xcc8(%rdi),%xmm0
   55ce2:	movups %xmm0,0x40(%r11,%r12,1)
   55ce8:	movups 0xc88(%rdi),%xmm0
   55cef:	movups 0xc98(%rdi),%xmm1
   55cf6:	movups 0xca8(%rdi),%xmm2
   55cfd:	movups 0xcb8(%rdi),%xmm3
   55d04:	movups %xmm3,0x30(%r11,%r12,1)
   55d0a:	movups %xmm2,0x20(%r11,%r12,1)
   55d10:	movups %xmm1,0x10(%r11,%r12,1)
   55d16:	movups %xmm0,(%r11,%r12,1)
   55d1b:	jmp    55da6 <fastgzip_safe::enc::scan::<13, true, false>+0x176>
   55d20:	mov    %ecx,%ebp
   55d22:	and    $0x7,%cl
   55d25:	mov    $0xffffffff,%r13d
   55d2b:	shl    %cl,%r13d
   55d2e:	and    $0x7,%ebp
   55d31:	movzbl (%r11,%r12,1),%eax
   55d36:	not    %r13d
   55d39:	and    %eax,%r13d
   55d3c:	jmp    55de3 <fastgzip_safe::enc::scan::<13, true, false>+0x1b3>
   55d41:	lea    (%r9,%r12,1),%rsi
   55d45:	cmp    $0x10081,%rsi
   55d4c:	jae    56573 <fastgzip_safe::enc::scan::<13, true, false>+0x943>
   55d52:	cmp    $0x1208,%ebp
   55d58:	jae    5655c <fastgzip_safe::enc::scan::<13, true, false>+0x92c>
   55d5e:	lea    0xc88(%rdi),%rsi
   55d65:	lea    (%r11,%r12,1),%rdi
   55d69:	mov    %r9,%rdx
   55d6c:	mov    %r8,%r13
   55d6f:	mov    %r15d,0x18(%rsp)
   55d74:	mov    %r9,%r15
   55d77:	call   *0x6bf13(%rip)        # c1c90 <memcpy@GLIBC_2.14>
   55d7d:	mov    %r15,%r9
   55d80:	mov    0x18(%rsp),%r15d
   55d85:	mov    0x8(%rsp),%rdi
   55d8a:	mov    0x10(%rsp),%rsi
   55d8f:	mov    %r13,%r8
   55d92:	mov    0x90(%rsp),%r11
   55d9a:	cmp    $0x1200,%ebp
   55da0:	jae    56588 <fastgzip_safe::enc::scan::<13, true, false>+0x958>
   55da6:	and    $0x7,%ebp
   55da9:	mov    $0xffffffff,%r13d
   55daf:	mov    %ebp,%ecx
   55db1:	shl    %cl,%r13d
   55db4:	movzbl 0xc88(%rdi,%r9,1),%eax
   55dbd:	not    %r13d
   55dc0:	and    %eax,%r13d
   55dc3:	testl  $0x100,0xa0(%rsp)
   55dce:	jne    55de0 <fastgzip_safe::enc::scan::<13, true, false>+0x1b0>
   55dd0:	test   %r9,%r9
   55dd3:	je     55ddc <fastgzip_safe::enc::scan::<13, true, false>+0x1ac>
   55dd5:	andb   $0xfe,(%r11,%r12,1)
   55dda:	jmp    55de0 <fastgzip_safe::enc::scan::<13, true, false>+0x1b0>
   55ddc:	and    $0xfffffffe,%r13d
   55de0:	add    %r9,%r12
   55de3:	mov    %r8,0x28(%rsp)
   55de8:	movzwl %r14w,%r8d
   55dec:	cmpb   $0x0,0x88(%rsp)
   55df4:	mov    %r8,0x30(%rsp)
   55df9:	je     55e22 <fastgzip_safe::enc::scan::<13, true, false>+0x1f2>
   55dfb:	mov    $0x4000,%edx
   55e00:	mov    %rsi,%rdi
   55e03:	xor    %esi,%esi
   55e05:	call   *0x6c02d(%rip)        # c1e38 <memset@GLIBC_2.2.5>
   55e0b:	mov    0x30(%rsp),%r8
   55e10:	mov    0x8(%rsp),%rdi
   55e15:	mov    0x10(%rsp),%rsi
   55e1a:	mov    0x90(%rsp),%r11
   55e22:	test   %r15w,%r15w
   55e26:	mov    0x20(%rsp),%r14
   55e2b:	je     55e4d <fastgzip_safe::enc::scan::<13, true, false>+0x21d>
   55e2d:	movzwl %r15w,%ecx
   55e31:	cmp    %r8w,%r15w
   55e35:	jb     55e9d <fastgzip_safe::enc::scan::<13, true, false>+0x26d>
   55e37:	mov    0x28(%rsp),%rsi
   55e3c:	cmp    %rsi,%rcx
   55e3f:	ja     56547 <fastgzip_safe::enc::scan::<13, true, false>+0x917>
   55e45:	mov    %rcx,%r9
   55e48:	jmp    56382 <fastgzip_safe::enc::scan::<13, true, false>+0x752>
   55e4d:	cmp    $0x2,%r8w
   55e52:	jae    55e5c <fastgzip_safe::enc::scan::<13, true, false>+0x22c>
   55e54:	xor    %r9d,%r9d
   55e57:	jmp    5637d <fastgzip_safe::enc::scan::<13, true, false>+0x74d>
   55e5c:	movzbl (%r14),%eax
   55e60:	mov    (%rdi,%rax,4),%eax
   55e63:	movzwl %ax,%edx
   55e66:	mov    %ebp,%ecx
   55e68:	shl    %cl,%rdx
   55e6b:	or     %r13,%rdx
   55e6e:	shr    $0x10,%eax
   55e71:	add    %ebp,%eax
   55e73:	movzwl %r12w,%ecx
   55e77:	mov    %rdx,(%r11,%rcx,1)
   55e7b:	mov    %eax,%ecx
   55e7d:	shr    $0x3,%ecx
   55e80:	and    $0x7,%ecx
   55e83:	add    %rcx,%r12
   55e86:	mov    %eax,%ecx
   55e88:	and    $0x38,%cl
   55e8b:	shr    %cl,%rdx
   55e8e:	and    $0x18007,%eax
   55e93:	mov    $0x1,%ecx
   55e98:	mov    %eax,%ebp
   55e9a:	mov    %rdx,%r13
   55e9d:	movzwl %bx,%eax
   55ea0:	mov    %rax,0x18(%rsp)
   55ea5:	movabs $0xb185ebca87000000,%rdx
   55eaf:	mov    (%r14,%rcx,1),%rbx
   55eb3:	lea    0x9(%r8),%rax
   55eb7:	mov    %rax,0x38(%rsp)
   55ebc:	imul   %rdx,%rbx
   55ec0:	shr    $0x33,%rbx
   55ec4:	mov    %rcx,%r15
   55ec7:	mov    %rcx,%r14
   55eca:	cmp    0x18(%rsp),%rcx
   55ecf:	jae    56050 <fastgzip_safe::enc::scan::<13, true, false>+0x420>
   55ed5:	data16 cs nopw 0x0(%rax,%rax,1)
   55ee0:	mov    %r15,%r14
   55ee3:	mov    0x20(%rsp),%r9
   55ee8:	mov    (%r9,%r15,1),%r8
   55eec:	movzwl (%rsi,%rbx,2),%r11d
   55ef1:	mov    %r14w,(%rsi,%rbx,2)
   55ef6:	mov    %r8,%rbx
   55ef9:	shr    $0x8,%rbx
   55efd:	imul   %rdx,%rbx
   55f01:	shr    $0x33,%rbx
   55f05:	mov    (%r9,%r11,1),%rcx
   55f09:	xor    %r8,%rcx
   55f0c:	test   %ecx,%ecx
   55f0e:	je     560f3 <fastgzip_safe::enc::scan::<13, true, false>+0x4c3>
   55f14:	movzbl %r8b,%eax
   55f18:	mov    (%rdi,%rax,4),%eax
   55f1b:	movzwl %ax,%r10d
   55f1f:	mov    %ebp,%ecx
   55f21:	shl    %cl,%r10
   55f24:	or     %r13,%r10
   55f27:	shr    $0x10,%eax
   55f2a:	add    %ebp,%eax
   55f2c:	mov    0x1(%r9,%r14,1),%r8
   55f31:	movzwl (%rsi,%rbx,2),%r11d
   55f36:	lea    0x1(%r14),%r15
   55f3a:	mov    %r15w,(%rsi,%rbx,2)
   55f3f:	mov    %r8,%rbx
   55f42:	shr    $0x8,%rbx
   55f46:	imul   %rdx,%rbx
   55f4a:	shr    $0x33,%rbx
   55f4e:	mov    (%r9,%r11,1),%rcx
   55f52:	xor    %r8,%rcx
   55f55:	test   %ecx,%ecx
   55f57:	je     560fb <fastgzip_safe::enc::scan::<13, true, false>+0x4cb>
   55f5d:	movzbl %r8b,%ecx
   55f61:	mov    %rdx,%r13
   55f64:	mov    (%rdi,%rcx,4),%edx
   55f67:	movzwl %dx,%r8d
   55f6b:	mov    %eax,%ecx
   55f6d:	shl    %cl,%r8
   55f70:	or     %r8,%r10
   55f73:	shr    $0x10,%edx
   55f76:	add    %eax,%edx
   55f78:	mov    0x2(%r9,%r14,1),%r8
   55f7d:	movzwl (%rsi,%rbx,2),%r11d
   55f82:	inc    %r15
   55f85:	mov    %r15w,(%rsi,%rbx,2)
   55f8a:	mov    %r8,%rbx
   55f8d:	shr    $0x8,%rbx
   55f91:	imul   %r13,%rbx
   55f95:	shr    $0x33,%rbx
   55f99:	mov    (%r9,%r11,1),%rcx
   55f9d:	xor    %r8,%rcx
   55fa0:	test   %ecx,%ecx
   55fa2:	je     561a1 <fastgzip_safe::enc::scan::<13, true, false>+0x571>
   55fa8:	movzbl %r8b,%eax
   55fac:	mov    (%rdi,%rax,4),%eax
   55faf:	movzwl %ax,%r8d
   55fb3:	mov    %edx,%ecx
   55fb5:	shl    %cl,%r8
   55fb8:	or     %r8,%r10
   55fbb:	shr    $0x10,%eax
   55fbe:	add    %edx,%eax
   55fc0:	mov    0x3(%r9,%r14,1),%r8
   55fc5:	movzwl (%rsi,%rbx,2),%r11d
   55fca:	inc    %r15
   55fcd:	mov    %r15w,(%rsi,%rbx,2)
   55fd2:	mov    %r8,%rbx
   55fd5:	shr    $0x8,%rbx
   55fd9:	imul   %r13,%rbx
   55fdd:	shr    $0x33,%rbx
   55fe1:	mov    (%r9,%r11,1),%rcx
   55fe5:	xor    %r8,%rcx
   55fe8:	test   %ecx,%ecx
   55fea:	je     56341 <fastgzip_safe::enc::scan::<13, true, false>+0x711>
   55ff0:	mov    %r13,%rdx
   55ff3:	movzbl %r8b,%ecx
   55ff7:	mov    (%rdi,%rcx,4),%ebp
   55ffa:	movzwl %bp,%r13d
   55ffe:	mov    %eax,%ecx
   56000:	shl    %cl,%r13
   56003:	or     %r10,%r13
   56006:	shr    $0x10,%ebp
   56009:	add    %eax,%ebp
   5600b:	movzwl %r12w,%eax
   5600f:	mov    0x90(%rsp),%r11
   56017:	mov    %r13,(%r11,%rax,1)
   5601b:	mov    %ebp,%eax
   5601d:	shr    $0x3,%eax
   56020:	and    $0x7,%eax
   56023:	mov    %ebp,%ecx
   56025:	and    $0x38,%cl
   56028:	shr    %cl,%r13
   5602b:	add    %rax,%r12
   5602e:	and    $0xffff8007,%ebp
   56034:	inc    %r15
   56037:	cmp    0x18(%rsp),%r15
   5603c:	jb     55ee0 <fastgzip_safe::enc::scan::<13, true, false>+0x2b0>
   56042:	add    $0x4,%r14
   56046:	cs nopw 0x0(%rax,%rax,1)
   56050:	mov    %r13,%r10
   56053:	mov    %ebp,%eax
   56055:	mov    %r14,%rcx
   56058:	mov    %r14,%r15
   5605b:	mov    0x30(%rsp),%r9
   56060:	cmp    %r9,%r14
   56063:	mov    0x20(%rsp),%r14
   56068:	jae    55e37 <fastgzip_safe::enc::scan::<13, true, false>+0x207>
   5606e:	xchg   %ax,%ax
   56070:	mov    (%r14,%r15,1),%r8
   56074:	movzwl (%rsi,%rbx,2),%r11d
   56079:	mov    %r15w,(%rsi,%rbx,2)
   5607e:	mov    %r8,%rbx
   56081:	shr    $0x8,%rbx
   56085:	imul   %rdx,%rbx
   56089:	shr    $0x33,%rbx
   5608d:	mov    (%r14,%r11,1),%rcx
   56091:	xor    %r8,%rcx
   56094:	test   %ecx,%ecx
   56096:	je     561b0 <fastgzip_safe::enc::scan::<13, true, false>+0x580>
   5609c:	movzbl %r8b,%ecx
   560a0:	mov    (%rdi,%rcx,4),%edx
   560a3:	movzwl %dx,%r8d
   560a7:	mov    %eax,%ecx
   560a9:	shl    %cl,%r8
   560ac:	or     %r8,%r10
   560af:	shr    $0x10,%edx
   560b2:	add    %eax,%edx
   560b4:	inc    %r15
   560b7:	movzwl %r12w,%eax
   560bb:	mov    0x90(%rsp),%r11
   560c3:	mov    %r10,(%r11,%rax,1)
   560c7:	mov    %edx,%ecx
   560c9:	mov    %edx,%eax
   560cb:	shr    $0x3,%edx
   560ce:	and    $0x38,%cl
   560d1:	shr    %cl,%r10
   560d4:	and    $0x7,%edx
   560d7:	add    %rdx,%r12
   560da:	movabs $0xb185ebca87000000,%rdx
   560e4:	and    $0xffff8007,%eax
   560e9:	cmp    %r15,%r9
   560ec:	jne    56070 <fastgzip_safe::enc::scan::<13, true, false>+0x440>
   560ee:	jmp    56378 <fastgzip_safe::enc::scan::<13, true, false>+0x748>
   560f3:	mov    %r14,%r15
   560f6:	mov    %ebp,%eax
   560f8:	mov    %r13,%r10
   560fb:	mov    %r9,%r14
   560fe:	test   %rcx,%rcx
   56101:	jne    561b9 <fastgzip_safe::enc::scan::<13, true, false>+0x589>
   56107:	mov    0x38(%rsp),%r9
   5610c:	sub    %r15,%r9
   5610f:	cmp    $0x102,%r9
   56116:	mov    $0x102,%esi
   5611b:	cmovb  %r9,%rsi
   5611f:	lea    (%r14,%r15,1),%rcx
   56123:	lea    (%r14,%r11,1),%rdx
   56127:	mov    $0x8,%ebp
   5612c:	cmp    $0x10,%r9
   56130:	jb     56161 <fastgzip_safe::enc::scan::<13, true, false>+0x531>
   56132:	mov    $0x8,%r13d
   56138:	nopl   0x0(%rax,%rax,1)
   56140:	mov    (%rcx,%r13,1),%rbp
   56144:	mov    (%rdx,%r13,1),%r9
   56148:	cmp    %r9,%rbp
   5614b:	jne    5635b <fastgzip_safe::enc::scan::<13, true, false>+0x72b>
   56151:	lea    0x8(%r13),%rbp
   56155:	add    $0x10,%r13
   56159:	cmp    %rsi,%r13
   5615c:	mov    %rbp,%r13
   5615f:	jbe    56140 <fastgzip_safe::enc::scan::<13, true, false>+0x510>
   56161:	cmp    %rsi,%rbp
   56164:	mov    %rsi,%rbp
   56167:	mov    0x10(%rsp),%rsi
   5616c:	mov    0x8(%rsp),%rdi
   56171:	jae    561c1 <fastgzip_safe::enc::scan::<13, true, false>+0x591>
   56173:	mov    %rbp,%r13
   56176:	sub    $0x8,%r13
   5617a:	mov    $0x0,%r9d
   56180:	cmovb  %r9,%r13
   56184:	mov    (%rcx,%r13,1),%rcx
   56188:	mov    (%rdx,%r13,1),%rdx
   5618c:	cmp    %rdx,%rcx
   5618f:	je     561c1 <fastgzip_safe::enc::scan::<13, true, false>+0x591>
   56191:	xor    %rcx,%rdx
   56194:	tzcnt  %rdx,%rbp
   56199:	shr    $0x3,%ebp
   5619c:	add    %r13,%rbp
   5619f:	jmp    561c1 <fastgzip_safe::enc::scan::<13, true, false>+0x591>
   561a1:	add    $0x2,%r14
   561a5:	mov    %r14,%r15
   561a8:	mov    %edx,%eax
   561aa:	mov    %r9,%r14
   561ad:	nopl   (%rax)
   561b0:	test   %rcx,%rcx
   561b3:	je     56107 <fastgzip_safe::enc::scan::<13, true, false>+0x4d7>
   561b9:	tzcnt  %rcx,%rbp
   561be:	shr    $0x3,%ebp
   561c1:	not    %r11d
   561c4:	add    %r15d,%r11d
   561c7:	mov    $0x3f,%ecx
   561cc:	bsr    %r11d,%ecx
   561d0:	xor    $0x1f,%ecx
   561d3:	mov    %r11d,%r13d
   561d6:	cmp    $0x2,%r11d
   561da:	jb     56201 <fastgzip_safe::enc::scan::<13, true, false>+0x5d1>
   561dc:	mov    $0x1e,%edx
   561e1:	sub    %ecx,%edx
   561e3:	bt     %edx,%r11d
   561e7:	mov    $0x0,%r13d
   561ed:	adc    $0x3e,%r13d
   561f1:	sub    %ecx,%r13d
   561f4:	sub    %ecx,%r13d
   561f7:	mov    0x8(%rsp),%rdi
   561fc:	mov    0x10(%rsp),%rsi
   56201:	and    $0x1f,%r13d
   56205:	lea    0x1(%r15),%edx
   56209:	mov    %dx,(%rsi,%rbx,2)
   5620d:	mov    %ebp,%edx
   5620f:	and    $0x1ff,%edx
   56215:	mov    %rbp,0x40(%rsp)
   5621a:	mov    0x400(%rdi,%rdx,4),%ebp
   56221:	mov    $0x1e,%edx
   56226:	sub    %ecx,%edx
   56228:	mov    $0x0,%ecx
   5622d:	cmovb  %ecx,%edx
   56230:	mov    $0xffffffff,%r9d
   56236:	mov    %edx,%ecx
   56238:	shl    %cl,%r9d
   5623b:	not    %r9d
   5623e:	and    %r9d,%r11d
   56241:	mov    0xc04(%rdi,%r13,4),%r9d
   56249:	shr    $0x10,%r8
   5624d:	movabs $0xb185ebca87000000,%rdi
   56257:	imul   %rdi,%r8
   5625b:	shr    $0x33,%r8
   5625f:	lea    0x2(%r15),%ecx
   56263:	mov    %cx,(%rsi,%r8,2)
   56268:	mov    %ebp,%ecx
   5626a:	shr    $0x13,%ecx
   5626d:	and    $0x1f,%ecx
   56270:	movzwl %r9w,%r8d
   56274:	mov    %r9d,%ebx
   56277:	shr    $0x10,%ebx
   5627a:	and    $0x7ffff,%ebp
   56280:	add    %ecx,%ebx
   56282:	shl    %cl,%r8
   56285:	mov    %ebx,%ecx
   56287:	shl    %cl,%r11
   5628a:	or     %rbp,%r8
   5628d:	or     %r8,%r11
   56290:	movzwl %r12w,%ecx
   56294:	mov    0x90(%rsp),%r9
   5629c:	mov    %r10,(%r9,%rcx,1)
   562a0:	mov    %eax,%r8d
   562a3:	shr    $0x3,%r8d
   562a7:	mov    %eax,%ecx
   562a9:	and    $0x38,%cl
   562ac:	shr    %cl,%r10
   562af:	and    $0x7,%r8d
   562b3:	add    %r12,%r8
   562b6:	mov    %eax,%ebp
   562b8:	and    $0x7,%al
   562ba:	mov    %eax,%ecx
   562bc:	shl    %cl,%r11
   562bf:	or     %r10,%r11
   562c2:	and    $0xffff8007,%ebp
   562c8:	add    %edx,%ebp
   562ca:	add    %ebx,%ebp
   562cc:	movzwl %r8w,%eax
   562d0:	mov    %r11,(%r9,%rax,1)
   562d4:	mov    %ebp,%r12d
   562d7:	shr    $0x3,%r12d
   562db:	and    $0x7,%r12d
   562df:	mov    %ebp,%ecx
   562e1:	and    $0x38,%cl
   562e4:	mov    %r11,%r13
   562e7:	shr    %cl,%r13
   562ea:	mov    0x40(%rsp),%rcx
   562ef:	add    %r8,%r12
   562f2:	add    %r15,%rcx
   562f5:	and    $0xffff8007,%ebp
   562fb:	mov    0x30(%rsp),%rax
   56300:	cmp    %rax,%rcx
   56303:	jae    56535 <fastgzip_safe::enc::scan::<13, true, false>+0x905>
   56309:	lea    -0x1(%rcx),%eax
   5630c:	movzwl %ax,%eax
   5630f:	mov    (%r14,%rax,1),%rbx
   56313:	mov    %rcx,%rdx
   56316:	mov    %rbx,%rcx
   56319:	imul   %rdi,%rcx
   5631d:	shr    $0x33,%rcx
   56321:	mov    %ax,(%rsi,%rcx,2)
   56325:	mov    %rdx,%rcx
   56328:	shr    $0x8,%rbx
   5632c:	mov    0x90(%rsp),%r11
   56334:	mov    %rdi,%rdx
   56337:	mov    0x8(%rsp),%rdi
   5633c:	jmp    55ebc <fastgzip_safe::enc::scan::<13, true, false>+0x28c>
   56341:	add    $0x3,%r14
   56345:	mov    %r14,%r15
   56348:	mov    0x20(%rsp),%r14
   5634d:	test   %rcx,%rcx
   56350:	jne    561b9 <fastgzip_safe::enc::scan::<13, true, false>+0x589>
   56356:	jmp    56107 <fastgzip_safe::enc::scan::<13, true, false>+0x4d7>
   5635b:	xor    %rbp,%r9
   5635e:	tzcnt  %r9,%rbp
   56363:	shr    $0x3,%ebp
   56366:	add    %r13,%rbp
   56369:	mov    0x10(%rsp),%rsi
   5636e:	mov    0x8(%rsp),%rdi
   56373:	jmp    561c1 <fastgzip_safe::enc::scan::<13, true, false>+0x591>
   56378:	mov    %r10,%r13
   5637b:	mov    %eax,%ebp
   5637d:	mov    0x28(%rsp),%rsi
   56382:	sub    %r9,%rsi
   56385:	add    %r9,%r14
   56388:	mov    %esi,%r10d
   5638b:	and    $0x3,%r10d
   5638f:	and    $0xfffc,%rsi
   56396:	je     56453 <fastgzip_safe::enc::scan::<13, true, false>+0x823>
   5639c:	xor    %ebx,%ebx
   5639e:	xchg   %ax,%ax
   563a0:	movzbl (%r14,%rbx,1),%eax
   563a5:	mov    (%rdi,%rax,4),%eax
   563a8:	movzwl %ax,%r9d
   563ac:	mov    %ebp,%ecx
   563ae:	shl    %cl,%r9
   563b1:	shr    $0x10,%eax
   563b4:	add    %ebp,%eax
   563b6:	movzbl 0x1(%r14,%rbx,1),%ecx
   563bc:	mov    0x8(%rsp),%rdx
   563c1:	mov    (%rdx,%rcx,4),%edx
   563c4:	movzwl %dx,%r8d
   563c8:	mov    %eax,%ecx
   563ca:	shl    %cl,%r8
   563cd:	or     %r9,%r13
   563d0:	or     %r13,%r8
   563d3:	shr    $0x10,%edx
   563d6:	add    %eax,%edx
   563d8:	movzbl 0x2(%r14,%rbx,1),%eax
   563de:	mov    0x8(%rsp),%rcx
   563e3:	mov    (%rcx,%rax,4),%eax
   563e6:	movzwl %ax,%r9d
   563ea:	mov    %edx,%ecx
   563ec:	shl    %cl,%r9
   563ef:	shr    $0x10,%eax
   563f2:	add    %edx,%eax
   563f4:	movzbl 0x3(%r14,%rbx,1),%ecx
   563fa:	mov    0x8(%rsp),%rdx
   563ff:	mov    (%rdx,%rcx,4),%ebp
   56402:	movzwl %bp,%r13d
   56406:	mov    %eax,%ecx
   56408:	shl    %cl,%r13
   5640b:	or     %r8,%r9
   5640e:	or     %r9,%r13
   56411:	mov    0x8(%rsp),%rdi
   56416:	shr    $0x10,%ebp
   56419:	add    %eax,%ebp
   5641b:	movzwl %r12w,%eax
   5641f:	mov    %r13,(%r11,%rax,1)
   56423:	mov    %ebp,%edx
   56425:	shr    $0x3,%edx
   56428:	and    $0x7,%edx
   5642b:	add    %r12,%rdx
   5642e:	mov    %ebp,%ecx
   56430:	and    $0x38,%cl
   56433:	shr    %cl,%r13
   56436:	and    $0xffff8007,%ebp
   5643c:	add    $0x4,%rbx
   56440:	mov    %rdx,%r12
   56443:	cmp    %rbx,%rsi
   56446:	jne    563a0 <fastgzip_safe::enc::scan::<13, true, false>+0x770>
   5644c:	test   %r10,%r10
   5644f:	jne    5645b <fastgzip_safe::enc::scan::<13, true, false>+0x82b>
   56451:	jmp    564b5 <fastgzip_safe::enc::scan::<13, true, false>+0x885>
   56453:	mov    %r12,%rdx
   56456:	test   %r10,%r10
   56459:	je     564b5 <fastgzip_safe::enc::scan::<13, true, false>+0x885>
   5645b:	movzbl (%r14,%rsi,1),%eax
   56460:	mov    (%rdi,%rax,4),%eax
   56463:	movzwl %ax,%r8d
   56467:	mov    %ebp,%ecx
   56469:	shl    %cl,%r8
   5646c:	or     %r8,%r13
   5646f:	shr    $0x10,%eax
   56472:	add    %ebp,%eax
   56474:	cmp    $0x1,%r10d
   56478:	je     564b3 <fastgzip_safe::enc::scan::<13, true, false>+0x883>
   5647a:	movzbl 0x1(%r14,%rsi,1),%ecx
   56480:	mov    (%rdi,%rcx,4),%ebp
   56483:	movzwl %bp,%r8d
   56487:	mov    %eax,%ecx
   56489:	shl    %cl,%r8
   5648c:	or     %r8,%r13
   5648f:	shr    $0x10,%ebp
   56492:	add    %eax,%ebp
   56494:	cmp    $0x2,%r10d
   56498:	je     564b5 <fastgzip_safe::enc::scan::<13, true, false>+0x885>
   5649a:	movzbl 0x2(%r14,%rsi,1),%eax
   564a0:	mov    (%rdi,%rax,4),%eax
   564a3:	movzwl %ax,%esi
   564a6:	mov    %ebp,%ecx
   564a8:	shl    %cl,%rsi
   564ab:	or     %rsi,%r13
   564ae:	shr    $0x10,%eax
   564b1:	add    %ebp,%eax
   564b3:	mov    %eax,%ebp
   564b5:	movzwl %dx,%eax
   564b8:	mov    %r13,(%r11,%rax,1)
   564bc:	mov    %ebp,%esi
   564be:	shr    $0x3,%esi
   564c1:	and    $0x7,%esi
   564c4:	add    %rdx,%rsi
   564c7:	mov    %ebp,%edx
   564c9:	and    $0xffff8007,%edx
   564cf:	testl  $0x10000,0xa0(%rsp)
   564da:	je     56517 <fastgzip_safe::enc::scan::<13, true, false>+0x8e7>
   564dc:	mov    %ebp,%ecx
   564de:	and    $0x38,%cl
   564e1:	shr    %cl,%r13
   564e4:	mov    0xc00(%rdi),%eax
   564ea:	movzwl %ax,%edi
   564ed:	and    $0x7,%bpl
   564f1:	mov    %ebp,%ecx
   564f3:	shl    %cl,%rdi
   564f6:	or     %r13,%rdi
   564f9:	shr    $0x10,%eax
   564fc:	add    %edx,%eax
   564fe:	movzwl %si,%ecx
   56501:	mov    %rdi,(%r11,%rcx,1)
   56505:	mov    %eax,%ecx
   56507:	shr    $0x3,%ecx
   5650a:	and    $0x7,%ecx
   5650d:	add    %rcx,%rsi
   56510:	and    $0xffff8007,%eax
   56515:	mov    %eax,%edx
   56517:	xor    %eax,%eax
   56519:	cmp    $0x8,%edx
   5651c:	mov    %edx,%ecx
   5651e:	lea    (%rcx,%rsi,8),%rcx
   56522:	cmovb  %rcx,%rax
   56526:	add    $0x48,%rsp
   5652a:	pop    %rbx
   5652b:	pop    %r12
   5652d:	pop    %r13
   5652f:	pop    %r14
   56531:	pop    %r15
   56533:	pop    %rbp
   56534:	ret
   56535:	mov    0x90(%rsp),%r11
   5653d:	mov    0x8(%rsp),%rdi
   56542:	jmp    55e37 <fastgzip_safe::enc::scan::<13, true, false>+0x207>
   56547:	mov    %rcx,%rdi
   5654a:	lea    0x68daf(%rip),%rcx        # bf300 <anon.8e724d7618661fec6c01ee5922cf9775.29.llvm.6304857328360807621+0x3a8>
   56551:	mov    $0x10108,%edx
   56556:	call   *0x6b74c(%rip)        # c1ca8 <_DYNAMIC+0x2a0>
   5655c:	lea    0x68dfd(%rip),%rcx        # bf360 <anon.9d8ef70180f99d61d317e85a697ff310.7.llvm.6950703405197886605+0x18>
   56563:	mov    $0x240,%edx
   56568:	xor    %edi,%edi
   5656a:	mov    %r9,%rsi
   5656d:	call   *0x6b735(%rip)        # c1ca8 <_DYNAMIC+0x2a0>
   56573:	lea    0x68dfe(%rip),%rcx        # bf378 <anon.9d8ef70180f99d61d317e85a697ff310.7.llvm.6950703405197886605+0x30>
   5657a:	mov    $0x10080,%edx
   5657f:	mov    %r12,%rdi
   56582:	call   *0x6b720(%rip)        # c1ca8 <_DYNAMIC+0x2a0>
   56588:	lea    0x68e01(%rip),%rdx        # bf390 <anon.9d8ef70180f99d61d317e85a697ff310.7.llvm.6950703405197886605+0x48>
   5658f:	mov    $0x240,%esi
   56594:	mov    %r9,%rdi
   56597:	call   *0x6b83b(%rip)        # c1dd8 <_DYNAMIC+0x3d0>
   5659d:	int3
   5659e:	int3
   5659f:	int3
