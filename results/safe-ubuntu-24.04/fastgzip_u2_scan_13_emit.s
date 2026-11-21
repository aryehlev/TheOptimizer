000000000003d030 <fastgzip_u2::enc::scan::<13, true, false>>:
   3d030:	push   %rbp
   3d031:	push   %r15
   3d033:	push   %r14
   3d035:	push   %r13
   3d037:	push   %r12
   3d039:	push   %rbx
   3d03a:	sub    $0x38,%rsp
   3d03e:	mov    %r8,%r13
   3d041:	mov    %rsi,0x10(%rsp)
   3d046:	mov    %rdi,%r14
   3d049:	mov    0x90(%rsp),%r12
   3d051:	mov    0x80(%rsp),%rdi
   3d059:	bt     $0x20,%r12
   3d05e:	mov    %r9,0x8(%rsp)
   3d063:	jb     3d093 <fastgzip_u2::enc::scan::<13, true, false>+0x63>
   3d065:	movzbl (%rdi),%eax
   3d068:	mov    $0xffffffffffffffff,%rbp
   3d06f:	mov    %r12d,%ecx
   3d072:	shl    %cl,%rbp
   3d075:	not    %ebp
   3d077:	and    %eax,%ebp
   3d079:	xor    %ebx,%ebx
   3d07b:	mov    %r12,%r15
   3d07e:	mov    0x70(%rsp),%r12
   3d083:	cmpb   $0x0,0x78(%rsp)
   3d088:	jne    3d151 <fastgzip_u2::enc::scan::<13, true, false>+0x121>
   3d08e:	jmp    3d170 <fastgzip_u2::enc::scan::<13, true, false>+0x140>
   3d093:	mov    0xa10(%r14),%r15d
   3d09a:	mov    %r15d,%ebx
   3d09d:	shr    $0x3,%ebx
   3d0a0:	lea    0xa14(%r14),%rax
   3d0a7:	cmp    $0x3ff,%r15
   3d0ae:	ja     3d0f0 <fastgzip_u2::enc::scan::<13, true, false>+0xc0>
   3d0b0:	movups 0x70(%rax),%xmm0
   3d0b4:	movups %xmm0,0x70(%rdi)
   3d0b8:	movups 0x60(%rax),%xmm0
   3d0bc:	movups %xmm0,0x60(%rdi)
   3d0c0:	movups 0x50(%rax),%xmm0
   3d0c4:	movups %xmm0,0x50(%rdi)
   3d0c8:	movups 0x40(%rax),%xmm0
   3d0cc:	movups %xmm0,0x40(%rdi)
   3d0d0:	movups (%rax),%xmm0
   3d0d3:	movups 0x10(%rax),%xmm1
   3d0d7:	movups 0x20(%rax),%xmm2
   3d0db:	movups 0x30(%rax),%xmm3
   3d0df:	movups %xmm3,0x30(%rdi)
   3d0e3:	movups %xmm2,0x20(%rdi)
   3d0e7:	movups %xmm1,0x10(%rdi)
   3d0eb:	movups %xmm0,(%rdi)
   3d0ee:	jmp    3d11c <fastgzip_u2::enc::scan::<13, true, false>+0xec>
   3d0f0:	mov    %rax,%rbp
   3d0f3:	mov    %rax,%rsi
   3d0f6:	mov    %rbx,%rdx
   3d0f9:	call   *0x84e69(%rip)        # c1f68 <memcpy@GLIBC_2.14>
   3d0ff:	mov    %rbp,%rax
   3d102:	mov    0x8(%rsp),%r9
   3d107:	mov    0x80(%rsp),%rdi
   3d10f:	cmp    $0x11ff,%r15d
   3d116:	ja     3d8a9 <fastgzip_u2::enc::scan::<13, true, false>+0x879>
   3d11c:	and    $0x7,%r15d
   3d120:	mov    $0xffffffff,%ebp
   3d125:	mov    %r15d,%ecx
   3d128:	shl    %cl,%ebp
   3d12a:	movzbl (%rax,%rbx,1),%eax
   3d12e:	not    %ebp
   3d130:	and    %eax,%ebp
   3d132:	bt     $0x28,%r12
   3d137:	jb     3d145 <fastgzip_u2::enc::scan::<13, true, false>+0x115>
   3d139:	test   %rbx,%rbx
   3d13c:	je     3d884 <fastgzip_u2::enc::scan::<13, true, false>+0x854>
   3d142:	andb   $0xfe,(%rdi)
   3d145:	mov    0x70(%rsp),%r12
   3d14a:	cmpb   $0x0,0x78(%rsp)
   3d14f:	je     3d170 <fastgzip_u2::enc::scan::<13, true, false>+0x140>
   3d151:	mov    $0x4000,%edx
   3d156:	mov    0x10(%rsp),%rdi
   3d15b:	xor    %esi,%esi
   3d15d:	call   *0x84fad(%rip)        # c2110 <memset@GLIBC_2.2.5>
   3d163:	mov    0x8(%rsp),%r9
   3d168:	mov    0x80(%rsp),%rdi
   3d170:	xor    %eax,%eax
   3d172:	mov    %r9,%rsi
   3d175:	sub    $0x9,%rsi
   3d179:	cmovb  %rax,%rsi
   3d17d:	sub    $0xc,%r9
   3d181:	cmovb  %rax,%r9
   3d185:	mov    %r9,0x30(%rsp)
   3d18a:	test   %r12,%r12
   3d18d:	je     3d19e <fastgzip_u2::enc::scan::<13, true, false>+0x16e>
   3d18f:	cmp    %rsi,%r12
   3d192:	mov    0x10(%rsp),%rdx
   3d197:	jae    3d1ab <fastgzip_u2::enc::scan::<13, true, false>+0x17b>
   3d199:	jmp    3d3e9 <fastgzip_u2::enc::scan::<13, true, false>+0x3b9>
   3d19e:	cmp    $0x2,%rsi
   3d1a2:	jae    3d3a1 <fastgzip_u2::enc::scan::<13, true, false>+0x371>
   3d1a8:	xor    %r12d,%r12d
   3d1ab:	lea    0x4(%r12),%rax
   3d1b0:	mov    0x8(%rsp),%r10
   3d1b5:	cmp    %r10,%rax
   3d1b8:	jbe    3d1c2 <fastgzip_u2::enc::scan::<13, true, false>+0x192>
   3d1ba:	mov    %r12,%rdi
   3d1bd:	jmp    3d276 <fastgzip_u2::enc::scan::<13, true, false>+0x246>
   3d1c2:	mov    0x80(%rsp),%r9
   3d1ca:	nopw   0x0(%rax,%rax,1)
   3d1d0:	movzbl 0x0(%r13,%r12,1),%eax
   3d1d6:	mov    (%r14,%rax,4),%eax
   3d1da:	movzwl %ax,%esi
   3d1dd:	mov    %r15d,%ecx
   3d1e0:	shl    %cl,%rsi
   3d1e3:	shr    $0x10,%eax
   3d1e6:	add    %r15d,%eax
   3d1e9:	movzbl 0x1(%r13,%r12,1),%ecx
   3d1ef:	mov    (%r14,%rcx,4),%edx
   3d1f3:	movzwl %dx,%edi
   3d1f6:	mov    %eax,%ecx
   3d1f8:	shl    %cl,%rdi
   3d1fb:	shr    $0x10,%edx
   3d1fe:	add    %eax,%edx
   3d200:	movzbl 0x2(%r13,%r12,1),%eax
   3d206:	mov    (%r14,%rax,4),%eax
   3d20a:	movzwl %ax,%r8d
   3d20e:	mov    %edx,%ecx
   3d210:	shl    %cl,%r8
   3d213:	or     %rsi,%rbp
   3d216:	or     %rbp,%rdi
   3d219:	or     %rdi,%r8
   3d21c:	shr    $0x10,%eax
   3d21f:	add    %edx,%eax
   3d221:	movzbl 0x3(%r13,%r12,1),%ecx
   3d227:	mov    (%r14,%rcx,4),%r15d
   3d22b:	movzwl %r15w,%ebp
   3d22f:	mov    %eax,%ecx
   3d231:	shl    %cl,%rbp
   3d234:	mov    %rbx,%rcx
   3d237:	or     %r8,%rbp
   3d23a:	shr    $0x10,%r15d
   3d23e:	add    %eax,%r15d
   3d241:	mov    %rbp,(%r9,%rbx,1)
   3d245:	mov    %r15d,%ebx
   3d248:	shr    $0x3,%ebx
   3d24b:	and    $0x7,%ebx
   3d24e:	add    %rcx,%rbx
   3d251:	mov    %r15d,%ecx
   3d254:	and    $0x38,%cl
   3d257:	shr    %cl,%rbp
   3d25a:	and    $0xffff8007,%r15d
   3d261:	lea    0x4(%r12),%rdi
   3d266:	add    $0x8,%r12
   3d26a:	cmp    %r10,%r12
   3d26d:	mov    %rdi,%r12
   3d270:	jbe    3d1d0 <fastgzip_u2::enc::scan::<13, true, false>+0x1a0>
   3d276:	cmp    %rdi,%r10
   3d279:	jbe    3d29a <fastgzip_u2::enc::scan::<13, true, false>+0x26a>
   3d27b:	mov    %r10d,%eax
   3d27e:	sub    %edi,%eax
   3d280:	lea    0x1(%rdi),%rdx
   3d284:	test   $0x1,%al
   3d286:	mov    0x90(%rsp),%r9
   3d28e:	jne    3d2aa <fastgzip_u2::enc::scan::<13, true, false>+0x27a>
   3d290:	cmp    %rdx,%r10
   3d293:	jne    3d2d4 <fastgzip_u2::enc::scan::<13, true, false>+0x2a4>
   3d295:	jmp    3d31f <fastgzip_u2::enc::scan::<13, true, false>+0x2ef>
   3d29a:	mov    %r15d,%eax
   3d29d:	mov    %rbp,%rsi
   3d2a0:	mov    0x90(%rsp),%r9
   3d2a8:	jmp    3d31f <fastgzip_u2::enc::scan::<13, true, false>+0x2ef>
   3d2aa:	movzbl 0x0(%r13,%rdi,1),%eax
   3d2b0:	mov    (%r14,%rax,4),%eax
   3d2b4:	movzwl %ax,%esi
   3d2b7:	mov    %r15d,%ecx
   3d2ba:	shl    %cl,%rsi
   3d2bd:	or     %rbp,%rsi
   3d2c0:	shr    $0x10,%eax
   3d2c3:	add    %r15d,%eax
   3d2c6:	mov    %rsi,%rbp
   3d2c9:	mov    %eax,%r15d
   3d2cc:	mov    %rdx,%rdi
   3d2cf:	cmp    %rdx,%r10
   3d2d2:	je     3d31f <fastgzip_u2::enc::scan::<13, true, false>+0x2ef>
   3d2d4:	mov    %rbp,%rsi
   3d2d7:	mov    %r15d,%eax
   3d2da:	nopw   0x0(%rax,%rax,1)
   3d2e0:	movzbl 0x0(%r13,%rdi,1),%ecx
   3d2e6:	mov    (%r14,%rcx,4),%edx
   3d2ea:	movzwl %dx,%r8d
   3d2ee:	mov    %eax,%ecx
   3d2f0:	shl    %cl,%r8
   3d2f3:	or     %r8,%rsi
   3d2f6:	shr    $0x10,%edx
   3d2f9:	add    %eax,%edx
   3d2fb:	movzbl 0x1(%r13,%rdi,1),%eax
   3d301:	mov    (%r14,%rax,4),%eax
   3d305:	movzwl %ax,%r8d
   3d309:	mov    %edx,%ecx
   3d30b:	shl    %cl,%r8
   3d30e:	or     %r8,%rsi
   3d311:	shr    $0x10,%eax
   3d314:	add    %edx,%eax
   3d316:	add    $0x2,%rdi
   3d31a:	cmp    %rdi,%r10
   3d31d:	jne    3d2e0 <fastgzip_u2::enc::scan::<13, true, false>+0x2b0>
   3d31f:	mov    0x80(%rsp),%r10
   3d327:	mov    %rsi,(%r10,%rbx,1)
   3d32b:	mov    %eax,%edx
   3d32d:	shr    $0x3,%edx
   3d330:	and    $0x7,%edx
   3d333:	add    %rbx,%rdx
   3d336:	mov    %eax,%edi
   3d338:	and    $0xffff8007,%edi
   3d33e:	bt     $0x30,%r9
   3d343:	jae    3d383 <fastgzip_u2::enc::scan::<13, true, false>+0x353>
   3d345:	mov    %eax,%ecx
   3d347:	and    $0x38,%cl
   3d34a:	shr    %cl,%rsi
   3d34d:	mov    0x80c(%r14),%r8d
   3d354:	movzwl %r8w,%r9d
   3d358:	and    $0x7,%al
   3d35a:	mov    %eax,%ecx
   3d35c:	shl    %cl,%r9
   3d35f:	or     %rsi,%r9
   3d362:	shr    $0x10,%r8d
   3d366:	add    %edi,%r8d
   3d369:	mov    %r9,(%r10,%rdx,1)
   3d36d:	mov    %r8d,%eax
   3d370:	shr    $0x3,%eax
   3d373:	and    $0x7,%eax
   3d376:	add    %rax,%rdx
   3d379:	and    $0xffff8007,%r8d
   3d380:	mov    %r8d,%edi
   3d383:	xor    %eax,%eax
   3d385:	cmp    $0x8,%edi
   3d388:	mov    %edi,%ecx
   3d38a:	lea    (%rcx,%rdx,8),%rcx
   3d38e:	cmovb  %rcx,%rax
   3d392:	add    $0x38,%rsp
   3d396:	pop    %rbx
   3d397:	pop    %r12
   3d399:	pop    %r13
   3d39b:	pop    %r14
   3d39d:	pop    %r15
   3d39f:	pop    %rbp
   3d3a0:	ret
   3d3a1:	movzbl 0x0(%r13),%eax
   3d3a6:	mov    (%r14,%rax,4),%eax
   3d3aa:	movzwl %ax,%edx
   3d3ad:	mov    %r15d,%ecx
   3d3b0:	shl    %cl,%rdx
   3d3b3:	or     %rbp,%rdx
   3d3b6:	shr    $0x10,%eax
   3d3b9:	add    %r15d,%eax
   3d3bc:	mov    %rdx,(%rdi,%rbx,1)
   3d3c0:	mov    %eax,%ecx
   3d3c2:	shr    $0x3,%ecx
   3d3c5:	and    $0x7,%ecx
   3d3c8:	add    %rcx,%rbx
   3d3cb:	mov    %eax,%ecx
   3d3cd:	and    $0x38,%cl
   3d3d0:	shr    %cl,%rdx
   3d3d3:	and    $0xffff8007,%eax
   3d3d8:	mov    $0x1,%r12d
   3d3de:	mov    %eax,%r15d
   3d3e1:	mov    %rdx,%rbp
   3d3e4:	mov    0x10(%rsp),%rdx
   3d3e9:	mov    %r14,0x18(%rsp)
   3d3ee:	mov    %rsi,0x28(%rsp)
   3d3f3:	movabs $0xb185ebca87000000,%r9
   3d3fd:	mov    0x0(%r13,%r12,1),%r11
   3d402:	mov    %r12,%r8
   3d405:	mov    %rbx,%r10
   3d408:	imul   %r9,%r11
   3d40c:	shr    $0x33,%r11
   3d410:	cmp    0x30(%rsp),%r8
   3d415:	jae    3d596 <fastgzip_u2::enc::scan::<13, true, false>+0x566>
   3d41b:	nopl   0x0(%rax,%rax,1)
   3d420:	mov    %r12,%r8
   3d423:	mov    0x0(%r13,%r12,1),%rbx
   3d428:	movzwl (%rdx,%r11,2),%esi
   3d42d:	mov    %r8w,(%rdx,%r11,2)
   3d432:	mov    %rbx,%r11
   3d435:	shr    $0x8,%r11
   3d439:	movabs $0xb185ebca87000000,%rdi
   3d443:	imul   %rdi,%r11
   3d447:	shr    $0x33,%r11
   3d44b:	mov    0x0(%r13,%rsi,1),%rcx
   3d450:	xor    %rbx,%rcx
   3d453:	test   %ecx,%ecx
   3d455:	je     3d644 <fastgzip_u2::enc::scan::<13, true, false>+0x614>
   3d45b:	movzbl %bl,%eax
   3d45e:	mov    0x18(%rsp),%r14
   3d463:	mov    (%r14,%rax,4),%eax
   3d467:	movzwl %ax,%r9d
   3d46b:	mov    %r15d,%ecx
   3d46e:	shl    %cl,%r9
   3d471:	or     %rbp,%r9
   3d474:	shr    $0x10,%eax
   3d477:	add    %r15d,%eax
   3d47a:	mov    0x1(%r13,%r8,1),%rbx
   3d47f:	movzwl (%rdx,%r11,2),%esi
   3d484:	lea    0x1(%r8),%r12
   3d488:	mov    %r12w,(%rdx,%r11,2)
   3d48d:	mov    %rbx,%r11
   3d490:	shr    $0x8,%r11
   3d494:	imul   %rdi,%r11
   3d498:	shr    $0x33,%r11
   3d49c:	mov    0x0(%r13,%rsi,1),%rcx
   3d4a1:	xor    %rbx,%rcx
   3d4a4:	test   %ecx,%ecx
   3d4a6:	je     3d670 <fastgzip_u2::enc::scan::<13, true, false>+0x640>
   3d4ac:	movzbl %bl,%ecx
   3d4af:	mov    %rdx,%r15
   3d4b2:	mov    (%r14,%rcx,4),%edx
   3d4b6:	movzwl %dx,%esi
   3d4b9:	mov    %eax,%ecx
   3d4bb:	shl    %cl,%rsi
   3d4be:	or     %rsi,%r9
   3d4c1:	shr    $0x10,%edx
   3d4c4:	add    %eax,%edx
   3d4c6:	mov    0x2(%r13,%r8,1),%rbx
   3d4cb:	movzwl (%r15,%r11,2),%esi
   3d4d0:	inc    %r12
   3d4d3:	mov    %r12w,(%r15,%r11,2)
   3d4d8:	mov    %rbx,%r11
   3d4db:	shr    $0x8,%r11
   3d4df:	imul   %rdi,%r11
   3d4e3:	shr    $0x33,%r11
   3d4e7:	mov    0x0(%r13,%rsi,1),%rcx
   3d4ec:	xor    %rbx,%rcx
   3d4ef:	test   %ecx,%ecx
   3d4f1:	je     3d65c <fastgzip_u2::enc::scan::<13, true, false>+0x62c>
   3d4f7:	movzbl %bl,%eax
   3d4fa:	mov    (%r14,%rax,4),%eax
   3d4fe:	movzwl %ax,%esi
   3d501:	mov    %edx,%ecx
   3d503:	shl    %cl,%rsi
   3d506:	or     %rsi,%r9
   3d509:	shr    $0x10,%eax
   3d50c:	add    %edx,%eax
   3d50e:	mov    0x3(%r13,%r8,1),%rbx
   3d513:	movzwl (%r15,%r11,2),%esi
   3d518:	inc    %r12
   3d51b:	mov    %r12w,(%r15,%r11,2)
   3d520:	mov    %rbx,%r11
   3d523:	shr    $0x8,%r11
   3d527:	imul   %rdi,%r11
   3d52b:	shr    $0x33,%r11
   3d52f:	mov    0x0(%r13,%rsi,1),%rcx
   3d534:	xor    %rbx,%rcx
   3d537:	test   %ecx,%ecx
   3d539:	je     3d7dc <fastgzip_u2::enc::scan::<13, true, false>+0x7ac>
   3d53f:	mov    %r15,%rdx
   3d542:	movzbl %bl,%ecx
   3d545:	mov    (%r14,%rcx,4),%r15d
   3d549:	movzwl %r15w,%ebp
   3d54d:	mov    %eax,%ecx
   3d54f:	shl    %cl,%rbp
   3d552:	or     %r9,%rbp
   3d555:	shr    $0x10,%r15d
   3d559:	add    %eax,%r15d
   3d55c:	mov    0x80(%rsp),%rdi
   3d564:	mov    %rbp,(%rdi,%r10,1)
   3d568:	mov    %r15d,%eax
   3d56b:	shr    $0x3,%eax
   3d56e:	and    $0x7,%eax
   3d571:	mov    %r15d,%ecx
   3d574:	and    $0x38,%cl
   3d577:	shr    %cl,%rbp
   3d57a:	add    %rax,%r10
   3d57d:	and    $0xffff8007,%r15d
   3d584:	inc    %r12
   3d587:	cmp    0x30(%rsp),%r12
   3d58c:	jb     3d420 <fastgzip_u2::enc::scan::<13, true, false>+0x3f0>
   3d592:	add    $0x4,%r8
   3d596:	mov    %r8,%r12
   3d599:	mov    %r10,%rbx
   3d59c:	mov    %rbp,%r9
   3d59f:	mov    %r15d,%eax
   3d5a2:	mov    0x28(%rsp),%rcx
   3d5a7:	cmp    %rcx,%r8
   3d5aa:	mov    %rcx,%r8
   3d5ad:	mov    0x18(%rsp),%r14
   3d5b2:	jae    3d1ab <fastgzip_u2::enc::scan::<13, true, false>+0x17b>
   3d5b8:	nopl   0x0(%rax,%rax,1)
   3d5c0:	mov    0x0(%r13,%r12,1),%rbx
   3d5c5:	movzwl (%rdx,%r11,2),%esi
   3d5ca:	mov    %r12w,(%rdx,%r11,2)
   3d5cf:	mov    %rbx,%r11
   3d5d2:	shr    $0x8,%r11
   3d5d6:	movabs $0xb185ebca87000000,%rcx
   3d5e0:	imul   %rcx,%r11
   3d5e4:	shr    $0x33,%r11
   3d5e8:	mov    0x0(%r13,%rsi,1),%rcx
   3d5ed:	xor    %rbx,%rcx
   3d5f0:	test   %ecx,%ecx
   3d5f2:	je     3d670 <fastgzip_u2::enc::scan::<13, true, false>+0x640>
   3d5f4:	movzbl %bl,%ecx
   3d5f7:	mov    (%r14,%rcx,4),%r15d
   3d5fb:	movzwl %r15w,%ebp
   3d5ff:	mov    %eax,%ecx
   3d601:	shl    %cl,%rbp
   3d604:	or     %r9,%rbp
   3d607:	shr    $0x10,%r15d
   3d60b:	add    %eax,%r15d
   3d60e:	inc    %r12
   3d611:	mov    %rbp,(%rdi,%r10,1)
   3d615:	mov    %r15d,%ebx
   3d618:	shr    $0x3,%ebx
   3d61b:	and    $0x7,%ebx
   3d61e:	add    %r10,%rbx
   3d621:	mov    %r15d,%ecx
   3d624:	and    $0x38,%cl
   3d627:	shr    %cl,%rbp
   3d62a:	and    $0xffff8007,%r15d
   3d631:	mov    %rbx,%r10
   3d634:	mov    %rbp,%r9
   3d637:	mov    %r15d,%eax
   3d63a:	cmp    %r8,%r12
   3d63d:	jb     3d5c0 <fastgzip_u2::enc::scan::<13, true, false>+0x590>
   3d63f:	jmp    3d1ab <fastgzip_u2::enc::scan::<13, true, false>+0x17b>
   3d644:	mov    %r8,%r12
   3d647:	mov    %r15d,%eax
   3d64a:	mov    %rbp,%r9
   3d64d:	mov    0x18(%rsp),%r14
   3d652:	test   %rcx,%rcx
   3d655:	jne    3d679 <fastgzip_u2::enc::scan::<13, true, false>+0x649>
   3d657:	jmp    3d7ec <fastgzip_u2::enc::scan::<13, true, false>+0x7bc>
   3d65c:	add    $0x2,%r8
   3d660:	mov    %r8,%r12
   3d663:	mov    %edx,%eax
   3d665:	data16 cs nopw 0x0(%rax,%rax,1)
   3d670:	test   %rcx,%rcx
   3d673:	je     3d7ec <fastgzip_u2::enc::scan::<13, true, false>+0x7bc>
   3d679:	tzcnt  %rcx,%r8
   3d67e:	shr    $0x3,%r8d
   3d682:	not    %esi
   3d684:	add    %r12d,%esi
   3d687:	mov    $0x3f,%r15d
   3d68d:	bsr    %esi,%r15d
   3d691:	xor    $0x1f,%r15d
   3d695:	mov    $0x1e,%cl
   3d697:	sub    %r15b,%cl
   3d69a:	movzbl %cl,%ecx
   3d69d:	xor    %edx,%edx
   3d69f:	bt     %ecx,%esi
   3d6a2:	setb   %dl
   3d6a5:	mov    $0x1e,%edi
   3d6aa:	sub    %r15d,%edi
   3d6ad:	mov    $0x0,%ecx
   3d6b2:	cmovb  %ecx,%edi
   3d6b5:	mov    %edi,0x24(%rsp)
   3d6b9:	mov    $0xffffffff,%ebp
   3d6be:	mov    %edi,%ecx
   3d6c0:	shl    %cl,%ebp
   3d6c2:	not    %ebp
   3d6c4:	and    %esi,%ebp
   3d6c6:	mov    0x400(%r14,%r8,4),%edi
   3d6ce:	shl    $0x2,%edx
   3d6d1:	lea    (%rdx,%r15,8),%ecx
   3d6d5:	mov    0x810(%r14,%rcx,1),%edx
   3d6dd:	mov    %edi,%ecx
   3d6df:	shr    $0x13,%ecx
   3d6e2:	and    $0x1f,%ecx
   3d6e5:	movzwl %dx,%r15d
   3d6e9:	mov    %edx,%esi
   3d6eb:	shr    $0x10,%esi
   3d6ee:	and    $0x7ffff,%edi
   3d6f4:	add    %ecx,%esi
   3d6f6:	shl    %cl,%r15
   3d6f9:	mov    %esi,%ecx
   3d6fb:	shl    %cl,%rbp
   3d6fe:	or     %rdi,%r15
   3d701:	or     %r15,%rbp
   3d704:	mov    0x80(%rsp),%rdx
   3d70c:	mov    %r9,(%rdx,%r10,1)
   3d710:	mov    %eax,%edi
   3d712:	shr    $0x3,%edi
   3d715:	and    $0x7,%edi
   3d718:	mov    %eax,%ecx
   3d71a:	and    $0x38,%cl
   3d71d:	shr    %cl,%r9
   3d720:	add    %r10,%rdi
   3d723:	mov    %eax,%r15d
   3d726:	and    $0x7,%al
   3d728:	mov    %eax,%ecx
   3d72a:	shl    %cl,%rbp
   3d72d:	or     %r9,%rbp
   3d730:	mov    %rbp,(%rdx,%rdi,1)
   3d734:	lea    0x1(%r12),%eax
   3d739:	mov    0x10(%rsp),%rdx
   3d73e:	mov    %ax,(%rdx,%r11,2)
   3d743:	shr    $0x10,%rbx
   3d747:	movabs $0xb185ebca87000000,%r9
   3d751:	imul   %r9,%rbx
   3d755:	shr    $0x33,%rbx
   3d759:	lea    0x2(%r12),%eax
   3d75e:	mov    %ax,(%rdx,%rbx,2)
   3d762:	and    $0xffff8007,%r15d
   3d769:	add    0x24(%rsp),%r15d
   3d76e:	add    %esi,%r15d
   3d771:	mov    %r15d,%r10d
   3d774:	shr    $0x3,%r10d
   3d778:	and    $0x7,%r10d
   3d77c:	mov    %r15d,%ecx
   3d77f:	and    $0x38,%cl
   3d782:	shr    %cl,%rbp
   3d785:	add    %rdi,%r10
   3d788:	add    %r12,%r8
   3d78b:	and    $0xffff8007,%r15d
   3d792:	cmp    0x28(%rsp),%r8
   3d797:	jae    3d89e <fastgzip_u2::enc::scan::<13, true, false>+0x86e>
   3d79d:	lea    -0x1(%r8),%rax
   3d7a1:	mov    -0x1(%r13,%r8,1),%r11
   3d7a6:	mov    %r11,%rcx
   3d7a9:	imul   %r9,%rcx
   3d7ad:	shr    $0x33,%rcx
   3d7b1:	mov    %ax,(%rdx,%rcx,2)
   3d7b5:	shr    $0x8,%r11
   3d7b9:	mov    %r8,%r12
   3d7bc:	mov    0x80(%rsp),%rdi
   3d7c4:	imul   %r9,%r11
   3d7c8:	shr    $0x33,%r11
   3d7cc:	cmp    0x30(%rsp),%r8
   3d7d1:	jb     3d420 <fastgzip_u2::enc::scan::<13, true, false>+0x3f0>
   3d7d7:	jmp    3d596 <fastgzip_u2::enc::scan::<13, true, false>+0x566>
   3d7dc:	add    $0x3,%r8
   3d7e0:	mov    %r8,%r12
   3d7e3:	test   %rcx,%rcx
   3d7e6:	jne    3d679 <fastgzip_u2::enc::scan::<13, true, false>+0x649>
   3d7ec:	mov    0x8(%rsp),%rdi
   3d7f1:	sub    %r12,%rdi
   3d7f4:	cmp    $0x102,%rdi
   3d7fb:	mov    $0x102,%r8d
   3d801:	cmovb  %rdi,%r8
   3d805:	lea    (%r12,%r13,1),%rcx
   3d809:	lea    (%rsi,%r13,1),%rdx
   3d80d:	mov    $0x8,%r15d
   3d813:	cmp    $0x10,%rdi
   3d817:	jb     3d83d <fastgzip_u2::enc::scan::<13, true, false>+0x80d>
   3d819:	mov    $0x8,%edi
   3d81e:	xchg   %ax,%ax
   3d820:	mov    (%rcx,%rdi,1),%r15
   3d824:	mov    (%rdx,%rdi,1),%rbp
   3d828:	cmp    %rbp,%r15
   3d82b:	jne    3d870 <fastgzip_u2::enc::scan::<13, true, false>+0x840>
   3d82d:	lea    0x8(%rdi),%r15
   3d831:	add    $0x10,%rdi
   3d835:	cmp    %r8,%rdi
   3d838:	mov    %r15,%rdi
   3d83b:	jbe    3d820 <fastgzip_u2::enc::scan::<13, true, false>+0x7f0>
   3d83d:	cmp    %r8,%r15
   3d840:	jae    3d682 <fastgzip_u2::enc::scan::<13, true, false>+0x652>
   3d846:	mov    -0x8(%rcx,%r8,1),%rcx
   3d84b:	mov    -0x8(%rdx,%r8,1),%rdx
   3d850:	cmp    %rdx,%rcx
   3d853:	je     3d682 <fastgzip_u2::enc::scan::<13, true, false>+0x652>
   3d859:	add    $0xfffffffffffffff8,%r8
   3d85d:	xor    %rcx,%rdx
   3d860:	tzcnt  %rdx,%rcx
   3d865:	shr    $0x3,%ecx
   3d868:	add    %rcx,%r8
   3d86b:	jmp    3d682 <fastgzip_u2::enc::scan::<13, true, false>+0x652>
   3d870:	xor    %r15,%rbp
   3d873:	tzcnt  %rbp,%r8
   3d878:	shr    $0x3,%r8d
   3d87c:	add    %rdi,%r8
   3d87f:	jmp    3d682 <fastgzip_u2::enc::scan::<13, true, false>+0x652>
   3d884:	and    $0xfffffffe,%ebp
   3d887:	xor    %ebx,%ebx
   3d889:	mov    0x70(%rsp),%r12
   3d88e:	cmpb   $0x0,0x78(%rsp)
   3d893:	jne    3d151 <fastgzip_u2::enc::scan::<13, true, false>+0x121>
   3d899:	jmp    3d170 <fastgzip_u2::enc::scan::<13, true, false>+0x140>
   3d89e:	mov    %r8,%r12
   3d8a1:	mov    %r10,%rbx
   3d8a4:	jmp    3d1ab <fastgzip_u2::enc::scan::<13, true, false>+0x17b>
   3d8a9:	lea    0x81560(%rip),%rdx        # bee10 <anon.06d40f39725e55ac64101dd27098398e.6.llvm.8162392238835072268+0x9e8>
   3d8b0:	mov    $0x240,%esi
   3d8b5:	mov    %rbx,%rdi
   3d8b8:	call   *0x847f2(%rip)        # c20b0 <_DYNAMIC+0x3d0>
   3d8be:	int3
   3d8bf:	int3
