000000000003d010 <fastgzip_u2::enc::scan::<13, true, false>>:
   3d010:	push   %rbp
   3d011:	push   %r15
   3d013:	push   %r14
   3d015:	push   %r13
   3d017:	push   %r12
   3d019:	push   %rbx
   3d01a:	sub    $0x38,%rsp
   3d01e:	mov    %r8,%r13
   3d021:	mov    %rsi,0x10(%rsp)
   3d026:	mov    %rdi,%r14
   3d029:	mov    0x90(%rsp),%r12
   3d031:	mov    0x80(%rsp),%rdi
   3d039:	bt     $0x20,%r12
   3d03e:	mov    %r9,0x8(%rsp)
   3d043:	jb     3d073 <fastgzip_u2::enc::scan::<13, true, false>+0x63>
   3d045:	movzbl (%rdi),%eax
   3d048:	mov    $0xffffffffffffffff,%rbp
   3d04f:	mov    %r12d,%ecx
   3d052:	shl    %cl,%rbp
   3d055:	not    %ebp
   3d057:	and    %eax,%ebp
   3d059:	xor    %ebx,%ebx
   3d05b:	mov    %r12,%r15
   3d05e:	mov    0x70(%rsp),%r12
   3d063:	cmpb   $0x0,0x78(%rsp)
   3d068:	jne    3d131 <fastgzip_u2::enc::scan::<13, true, false>+0x121>
   3d06e:	jmp    3d150 <fastgzip_u2::enc::scan::<13, true, false>+0x140>
   3d073:	mov    0xa10(%r14),%r15d
   3d07a:	mov    %r15d,%ebx
   3d07d:	shr    $0x3,%ebx
   3d080:	lea    0xa14(%r14),%rax
   3d087:	cmp    $0x3ff,%r15
   3d08e:	ja     3d0d0 <fastgzip_u2::enc::scan::<13, true, false>+0xc0>
   3d090:	movups 0x70(%rax),%xmm0
   3d094:	movups %xmm0,0x70(%rdi)
   3d098:	movups 0x60(%rax),%xmm0
   3d09c:	movups %xmm0,0x60(%rdi)
   3d0a0:	movups 0x50(%rax),%xmm0
   3d0a4:	movups %xmm0,0x50(%rdi)
   3d0a8:	movups 0x40(%rax),%xmm0
   3d0ac:	movups %xmm0,0x40(%rdi)
   3d0b0:	movups (%rax),%xmm0
   3d0b3:	movups 0x10(%rax),%xmm1
   3d0b7:	movups 0x20(%rax),%xmm2
   3d0bb:	movups 0x30(%rax),%xmm3
   3d0bf:	movups %xmm3,0x30(%rdi)
   3d0c3:	movups %xmm2,0x20(%rdi)
   3d0c7:	movups %xmm1,0x10(%rdi)
   3d0cb:	movups %xmm0,(%rdi)
   3d0ce:	jmp    3d0fc <fastgzip_u2::enc::scan::<13, true, false>+0xec>
   3d0d0:	mov    %rax,%rbp
   3d0d3:	mov    %rax,%rsi
   3d0d6:	mov    %rbx,%rdx
   3d0d9:	call   *0x84e69(%rip)        # c1f48 <memcpy@GLIBC_2.14>
   3d0df:	mov    %rbp,%rax
   3d0e2:	mov    0x8(%rsp),%r9
   3d0e7:	mov    0x80(%rsp),%rdi
   3d0ef:	cmp    $0x11ff,%r15d
   3d0f6:	ja     3d889 <fastgzip_u2::enc::scan::<13, true, false>+0x879>
   3d0fc:	and    $0x7,%r15d
   3d100:	mov    $0xffffffff,%ebp
   3d105:	mov    %r15d,%ecx
   3d108:	shl    %cl,%ebp
   3d10a:	movzbl (%rax,%rbx,1),%eax
   3d10e:	not    %ebp
   3d110:	and    %eax,%ebp
   3d112:	bt     $0x28,%r12
   3d117:	jb     3d125 <fastgzip_u2::enc::scan::<13, true, false>+0x115>
   3d119:	test   %rbx,%rbx
   3d11c:	je     3d864 <fastgzip_u2::enc::scan::<13, true, false>+0x854>
   3d122:	andb   $0xfe,(%rdi)
   3d125:	mov    0x70(%rsp),%r12
   3d12a:	cmpb   $0x0,0x78(%rsp)
   3d12f:	je     3d150 <fastgzip_u2::enc::scan::<13, true, false>+0x140>
   3d131:	mov    $0x4000,%edx
   3d136:	mov    0x10(%rsp),%rdi
   3d13b:	xor    %esi,%esi
   3d13d:	call   *0x84fad(%rip)        # c20f0 <memset@GLIBC_2.2.5>
   3d143:	mov    0x8(%rsp),%r9
   3d148:	mov    0x80(%rsp),%rdi
   3d150:	xor    %eax,%eax
   3d152:	mov    %r9,%rsi
   3d155:	sub    $0x9,%rsi
   3d159:	cmovb  %rax,%rsi
   3d15d:	sub    $0xc,%r9
   3d161:	cmovb  %rax,%r9
   3d165:	mov    %r9,0x30(%rsp)
   3d16a:	test   %r12,%r12
   3d16d:	je     3d17e <fastgzip_u2::enc::scan::<13, true, false>+0x16e>
   3d16f:	cmp    %rsi,%r12
   3d172:	mov    0x10(%rsp),%rdx
   3d177:	jae    3d18b <fastgzip_u2::enc::scan::<13, true, false>+0x17b>
   3d179:	jmp    3d3c9 <fastgzip_u2::enc::scan::<13, true, false>+0x3b9>
   3d17e:	cmp    $0x2,%rsi
   3d182:	jae    3d381 <fastgzip_u2::enc::scan::<13, true, false>+0x371>
   3d188:	xor    %r12d,%r12d
   3d18b:	lea    0x4(%r12),%rax
   3d190:	mov    0x8(%rsp),%r10
   3d195:	cmp    %r10,%rax
   3d198:	jbe    3d1a2 <fastgzip_u2::enc::scan::<13, true, false>+0x192>
   3d19a:	mov    %r12,%rdi
   3d19d:	jmp    3d256 <fastgzip_u2::enc::scan::<13, true, false>+0x246>
   3d1a2:	mov    0x80(%rsp),%r9
   3d1aa:	nopw   0x0(%rax,%rax,1)
   3d1b0:	movzbl 0x0(%r13,%r12,1),%eax
   3d1b6:	mov    (%r14,%rax,4),%eax
   3d1ba:	movzwl %ax,%esi
   3d1bd:	mov    %r15d,%ecx
   3d1c0:	shl    %cl,%rsi
   3d1c3:	shr    $0x10,%eax
   3d1c6:	add    %r15d,%eax
   3d1c9:	movzbl 0x1(%r13,%r12,1),%ecx
   3d1cf:	mov    (%r14,%rcx,4),%edx
   3d1d3:	movzwl %dx,%edi
   3d1d6:	mov    %eax,%ecx
   3d1d8:	shl    %cl,%rdi
   3d1db:	shr    $0x10,%edx
   3d1de:	add    %eax,%edx
   3d1e0:	movzbl 0x2(%r13,%r12,1),%eax
   3d1e6:	mov    (%r14,%rax,4),%eax
   3d1ea:	movzwl %ax,%r8d
   3d1ee:	mov    %edx,%ecx
   3d1f0:	shl    %cl,%r8
   3d1f3:	or     %rsi,%rbp
   3d1f6:	or     %rbp,%rdi
   3d1f9:	or     %rdi,%r8
   3d1fc:	shr    $0x10,%eax
   3d1ff:	add    %edx,%eax
   3d201:	movzbl 0x3(%r13,%r12,1),%ecx
   3d207:	mov    (%r14,%rcx,4),%r15d
   3d20b:	movzwl %r15w,%ebp
   3d20f:	mov    %eax,%ecx
   3d211:	shl    %cl,%rbp
   3d214:	mov    %rbx,%rcx
   3d217:	or     %r8,%rbp
   3d21a:	shr    $0x10,%r15d
   3d21e:	add    %eax,%r15d
   3d221:	mov    %rbp,(%r9,%rbx,1)
   3d225:	mov    %r15d,%ebx
   3d228:	shr    $0x3,%ebx
   3d22b:	and    $0x7,%ebx
   3d22e:	add    %rcx,%rbx
   3d231:	mov    %r15d,%ecx
   3d234:	and    $0x38,%cl
   3d237:	shr    %cl,%rbp
   3d23a:	and    $0xffff8007,%r15d
   3d241:	lea    0x4(%r12),%rdi
   3d246:	add    $0x8,%r12
   3d24a:	cmp    %r10,%r12
   3d24d:	mov    %rdi,%r12
   3d250:	jbe    3d1b0 <fastgzip_u2::enc::scan::<13, true, false>+0x1a0>
   3d256:	cmp    %rdi,%r10
   3d259:	jbe    3d27a <fastgzip_u2::enc::scan::<13, true, false>+0x26a>
   3d25b:	mov    %r10d,%eax
   3d25e:	sub    %edi,%eax
   3d260:	lea    0x1(%rdi),%rdx
   3d264:	test   $0x1,%al
   3d266:	mov    0x90(%rsp),%r9
   3d26e:	jne    3d28a <fastgzip_u2::enc::scan::<13, true, false>+0x27a>
   3d270:	cmp    %rdx,%r10
   3d273:	jne    3d2b4 <fastgzip_u2::enc::scan::<13, true, false>+0x2a4>
   3d275:	jmp    3d2ff <fastgzip_u2::enc::scan::<13, true, false>+0x2ef>
   3d27a:	mov    %r15d,%eax
   3d27d:	mov    %rbp,%rsi
   3d280:	mov    0x90(%rsp),%r9
   3d288:	jmp    3d2ff <fastgzip_u2::enc::scan::<13, true, false>+0x2ef>
   3d28a:	movzbl 0x0(%r13,%rdi,1),%eax
   3d290:	mov    (%r14,%rax,4),%eax
   3d294:	movzwl %ax,%esi
   3d297:	mov    %r15d,%ecx
   3d29a:	shl    %cl,%rsi
   3d29d:	or     %rbp,%rsi
   3d2a0:	shr    $0x10,%eax
   3d2a3:	add    %r15d,%eax
   3d2a6:	mov    %rsi,%rbp
   3d2a9:	mov    %eax,%r15d
   3d2ac:	mov    %rdx,%rdi
   3d2af:	cmp    %rdx,%r10
   3d2b2:	je     3d2ff <fastgzip_u2::enc::scan::<13, true, false>+0x2ef>
   3d2b4:	mov    %rbp,%rsi
   3d2b7:	mov    %r15d,%eax
   3d2ba:	nopw   0x0(%rax,%rax,1)
   3d2c0:	movzbl 0x0(%r13,%rdi,1),%ecx
   3d2c6:	mov    (%r14,%rcx,4),%edx
   3d2ca:	movzwl %dx,%r8d
   3d2ce:	mov    %eax,%ecx
   3d2d0:	shl    %cl,%r8
   3d2d3:	or     %r8,%rsi
   3d2d6:	shr    $0x10,%edx
   3d2d9:	add    %eax,%edx
   3d2db:	movzbl 0x1(%r13,%rdi,1),%eax
   3d2e1:	mov    (%r14,%rax,4),%eax
   3d2e5:	movzwl %ax,%r8d
   3d2e9:	mov    %edx,%ecx
   3d2eb:	shl    %cl,%r8
   3d2ee:	or     %r8,%rsi
   3d2f1:	shr    $0x10,%eax
   3d2f4:	add    %edx,%eax
   3d2f6:	add    $0x2,%rdi
   3d2fa:	cmp    %rdi,%r10
   3d2fd:	jne    3d2c0 <fastgzip_u2::enc::scan::<13, true, false>+0x2b0>
   3d2ff:	mov    0x80(%rsp),%r10
   3d307:	mov    %rsi,(%r10,%rbx,1)
   3d30b:	mov    %eax,%edx
   3d30d:	shr    $0x3,%edx
   3d310:	and    $0x7,%edx
   3d313:	add    %rbx,%rdx
   3d316:	mov    %eax,%edi
   3d318:	and    $0xffff8007,%edi
   3d31e:	bt     $0x30,%r9
   3d323:	jae    3d363 <fastgzip_u2::enc::scan::<13, true, false>+0x353>
   3d325:	mov    %eax,%ecx
   3d327:	and    $0x38,%cl
   3d32a:	shr    %cl,%rsi
   3d32d:	mov    0x80c(%r14),%r8d
   3d334:	movzwl %r8w,%r9d
   3d338:	and    $0x7,%al
   3d33a:	mov    %eax,%ecx
   3d33c:	shl    %cl,%r9
   3d33f:	or     %rsi,%r9
   3d342:	shr    $0x10,%r8d
   3d346:	add    %edi,%r8d
   3d349:	mov    %r9,(%r10,%rdx,1)
   3d34d:	mov    %r8d,%eax
   3d350:	shr    $0x3,%eax
   3d353:	and    $0x7,%eax
   3d356:	add    %rax,%rdx
   3d359:	and    $0xffff8007,%r8d
   3d360:	mov    %r8d,%edi
   3d363:	xor    %eax,%eax
   3d365:	cmp    $0x8,%edi
   3d368:	mov    %edi,%ecx
   3d36a:	lea    (%rcx,%rdx,8),%rcx
   3d36e:	cmovb  %rcx,%rax
   3d372:	add    $0x38,%rsp
   3d376:	pop    %rbx
   3d377:	pop    %r12
   3d379:	pop    %r13
   3d37b:	pop    %r14
   3d37d:	pop    %r15
   3d37f:	pop    %rbp
   3d380:	ret
   3d381:	movzbl 0x0(%r13),%eax
   3d386:	mov    (%r14,%rax,4),%eax
   3d38a:	movzwl %ax,%edx
   3d38d:	mov    %r15d,%ecx
   3d390:	shl    %cl,%rdx
   3d393:	or     %rbp,%rdx
   3d396:	shr    $0x10,%eax
   3d399:	add    %r15d,%eax
   3d39c:	mov    %rdx,(%rdi,%rbx,1)
   3d3a0:	mov    %eax,%ecx
   3d3a2:	shr    $0x3,%ecx
   3d3a5:	and    $0x7,%ecx
   3d3a8:	add    %rcx,%rbx
   3d3ab:	mov    %eax,%ecx
   3d3ad:	and    $0x38,%cl
   3d3b0:	shr    %cl,%rdx
   3d3b3:	and    $0xffff8007,%eax
   3d3b8:	mov    $0x1,%r12d
   3d3be:	mov    %eax,%r15d
   3d3c1:	mov    %rdx,%rbp
   3d3c4:	mov    0x10(%rsp),%rdx
   3d3c9:	mov    %r14,0x18(%rsp)
   3d3ce:	mov    %rsi,0x28(%rsp)
   3d3d3:	movabs $0xb185ebca87000000,%r9
   3d3dd:	mov    0x0(%r13,%r12,1),%r11
   3d3e2:	mov    %r12,%r8
   3d3e5:	mov    %rbx,%r10
   3d3e8:	imul   %r9,%r11
   3d3ec:	shr    $0x33,%r11
   3d3f0:	cmp    0x30(%rsp),%r8
   3d3f5:	jae    3d576 <fastgzip_u2::enc::scan::<13, true, false>+0x566>
   3d3fb:	nopl   0x0(%rax,%rax,1)
   3d400:	mov    %r12,%r8
   3d403:	mov    0x0(%r13,%r12,1),%rbx
   3d408:	movzwl (%rdx,%r11,2),%esi
   3d40d:	mov    %r8w,(%rdx,%r11,2)
   3d412:	mov    %rbx,%r11
   3d415:	shr    $0x8,%r11
   3d419:	movabs $0xb185ebca87000000,%rdi
   3d423:	imul   %rdi,%r11
   3d427:	shr    $0x33,%r11
   3d42b:	mov    0x0(%r13,%rsi,1),%rcx
   3d430:	xor    %rbx,%rcx
   3d433:	test   %ecx,%ecx
   3d435:	je     3d624 <fastgzip_u2::enc::scan::<13, true, false>+0x614>
   3d43b:	movzbl %bl,%eax
   3d43e:	mov    0x18(%rsp),%r14
   3d443:	mov    (%r14,%rax,4),%eax
   3d447:	movzwl %ax,%r9d
   3d44b:	mov    %r15d,%ecx
   3d44e:	shl    %cl,%r9
   3d451:	or     %rbp,%r9
   3d454:	shr    $0x10,%eax
   3d457:	add    %r15d,%eax
   3d45a:	mov    0x1(%r13,%r8,1),%rbx
   3d45f:	movzwl (%rdx,%r11,2),%esi
   3d464:	lea    0x1(%r8),%r12
   3d468:	mov    %r12w,(%rdx,%r11,2)
   3d46d:	mov    %rbx,%r11
   3d470:	shr    $0x8,%r11
   3d474:	imul   %rdi,%r11
   3d478:	shr    $0x33,%r11
   3d47c:	mov    0x0(%r13,%rsi,1),%rcx
   3d481:	xor    %rbx,%rcx
   3d484:	test   %ecx,%ecx
   3d486:	je     3d650 <fastgzip_u2::enc::scan::<13, true, false>+0x640>
   3d48c:	movzbl %bl,%ecx
   3d48f:	mov    %rdx,%r15
   3d492:	mov    (%r14,%rcx,4),%edx
   3d496:	movzwl %dx,%esi
   3d499:	mov    %eax,%ecx
   3d49b:	shl    %cl,%rsi
   3d49e:	or     %rsi,%r9
   3d4a1:	shr    $0x10,%edx
   3d4a4:	add    %eax,%edx
   3d4a6:	mov    0x2(%r13,%r8,1),%rbx
   3d4ab:	movzwl (%r15,%r11,2),%esi
   3d4b0:	inc    %r12
   3d4b3:	mov    %r12w,(%r15,%r11,2)
   3d4b8:	mov    %rbx,%r11
   3d4bb:	shr    $0x8,%r11
   3d4bf:	imul   %rdi,%r11
   3d4c3:	shr    $0x33,%r11
   3d4c7:	mov    0x0(%r13,%rsi,1),%rcx
   3d4cc:	xor    %rbx,%rcx
   3d4cf:	test   %ecx,%ecx
   3d4d1:	je     3d63c <fastgzip_u2::enc::scan::<13, true, false>+0x62c>
   3d4d7:	movzbl %bl,%eax
   3d4da:	mov    (%r14,%rax,4),%eax
   3d4de:	movzwl %ax,%esi
   3d4e1:	mov    %edx,%ecx
   3d4e3:	shl    %cl,%rsi
   3d4e6:	or     %rsi,%r9
   3d4e9:	shr    $0x10,%eax
   3d4ec:	add    %edx,%eax
   3d4ee:	mov    0x3(%r13,%r8,1),%rbx
   3d4f3:	movzwl (%r15,%r11,2),%esi
   3d4f8:	inc    %r12
   3d4fb:	mov    %r12w,(%r15,%r11,2)
   3d500:	mov    %rbx,%r11
   3d503:	shr    $0x8,%r11
   3d507:	imul   %rdi,%r11
   3d50b:	shr    $0x33,%r11
   3d50f:	mov    0x0(%r13,%rsi,1),%rcx
   3d514:	xor    %rbx,%rcx
   3d517:	test   %ecx,%ecx
   3d519:	je     3d7bc <fastgzip_u2::enc::scan::<13, true, false>+0x7ac>
   3d51f:	mov    %r15,%rdx
   3d522:	movzbl %bl,%ecx
   3d525:	mov    (%r14,%rcx,4),%r15d
   3d529:	movzwl %r15w,%ebp
   3d52d:	mov    %eax,%ecx
   3d52f:	shl    %cl,%rbp
   3d532:	or     %r9,%rbp
   3d535:	shr    $0x10,%r15d
   3d539:	add    %eax,%r15d
   3d53c:	mov    0x80(%rsp),%rdi
   3d544:	mov    %rbp,(%rdi,%r10,1)
   3d548:	mov    %r15d,%eax
   3d54b:	shr    $0x3,%eax
   3d54e:	and    $0x7,%eax
   3d551:	mov    %r15d,%ecx
   3d554:	and    $0x38,%cl
   3d557:	shr    %cl,%rbp
   3d55a:	add    %rax,%r10
   3d55d:	and    $0xffff8007,%r15d
   3d564:	inc    %r12
   3d567:	cmp    0x30(%rsp),%r12
   3d56c:	jb     3d400 <fastgzip_u2::enc::scan::<13, true, false>+0x3f0>
   3d572:	add    $0x4,%r8
   3d576:	mov    %r8,%r12
   3d579:	mov    %r10,%rbx
   3d57c:	mov    %rbp,%r9
   3d57f:	mov    %r15d,%eax
   3d582:	mov    0x28(%rsp),%rcx
   3d587:	cmp    %rcx,%r8
   3d58a:	mov    %rcx,%r8
   3d58d:	mov    0x18(%rsp),%r14
   3d592:	jae    3d18b <fastgzip_u2::enc::scan::<13, true, false>+0x17b>
   3d598:	nopl   0x0(%rax,%rax,1)
   3d5a0:	mov    0x0(%r13,%r12,1),%rbx
   3d5a5:	movzwl (%rdx,%r11,2),%esi
   3d5aa:	mov    %r12w,(%rdx,%r11,2)
   3d5af:	mov    %rbx,%r11
   3d5b2:	shr    $0x8,%r11
   3d5b6:	movabs $0xb185ebca87000000,%rcx
   3d5c0:	imul   %rcx,%r11
   3d5c4:	shr    $0x33,%r11
   3d5c8:	mov    0x0(%r13,%rsi,1),%rcx
   3d5cd:	xor    %rbx,%rcx
   3d5d0:	test   %ecx,%ecx
   3d5d2:	je     3d650 <fastgzip_u2::enc::scan::<13, true, false>+0x640>
   3d5d4:	movzbl %bl,%ecx
   3d5d7:	mov    (%r14,%rcx,4),%r15d
   3d5db:	movzwl %r15w,%ebp
   3d5df:	mov    %eax,%ecx
   3d5e1:	shl    %cl,%rbp
   3d5e4:	or     %r9,%rbp
   3d5e7:	shr    $0x10,%r15d
   3d5eb:	add    %eax,%r15d
   3d5ee:	inc    %r12
   3d5f1:	mov    %rbp,(%rdi,%r10,1)
   3d5f5:	mov    %r15d,%ebx
   3d5f8:	shr    $0x3,%ebx
   3d5fb:	and    $0x7,%ebx
   3d5fe:	add    %r10,%rbx
   3d601:	mov    %r15d,%ecx
   3d604:	and    $0x38,%cl
   3d607:	shr    %cl,%rbp
   3d60a:	and    $0xffff8007,%r15d
   3d611:	mov    %rbx,%r10
   3d614:	mov    %rbp,%r9
   3d617:	mov    %r15d,%eax
   3d61a:	cmp    %r8,%r12
   3d61d:	jb     3d5a0 <fastgzip_u2::enc::scan::<13, true, false>+0x590>
   3d61f:	jmp    3d18b <fastgzip_u2::enc::scan::<13, true, false>+0x17b>
   3d624:	mov    %r8,%r12
   3d627:	mov    %r15d,%eax
   3d62a:	mov    %rbp,%r9
   3d62d:	mov    0x18(%rsp),%r14
   3d632:	test   %rcx,%rcx
   3d635:	jne    3d659 <fastgzip_u2::enc::scan::<13, true, false>+0x649>
   3d637:	jmp    3d7cc <fastgzip_u2::enc::scan::<13, true, false>+0x7bc>
   3d63c:	add    $0x2,%r8
   3d640:	mov    %r8,%r12
   3d643:	mov    %edx,%eax
   3d645:	data16 cs nopw 0x0(%rax,%rax,1)
   3d650:	test   %rcx,%rcx
   3d653:	je     3d7cc <fastgzip_u2::enc::scan::<13, true, false>+0x7bc>
   3d659:	tzcnt  %rcx,%r8
   3d65e:	shr    $0x3,%r8d
   3d662:	not    %esi
   3d664:	add    %r12d,%esi
   3d667:	mov    $0x3f,%r15d
   3d66d:	bsr    %esi,%r15d
   3d671:	xor    $0x1f,%r15d
   3d675:	mov    $0x1e,%cl
   3d677:	sub    %r15b,%cl
   3d67a:	movzbl %cl,%ecx
   3d67d:	xor    %edx,%edx
   3d67f:	bt     %ecx,%esi
   3d682:	setb   %dl
   3d685:	mov    $0x1e,%edi
   3d68a:	sub    %r15d,%edi
   3d68d:	mov    $0x0,%ecx
   3d692:	cmovb  %ecx,%edi
   3d695:	mov    %edi,0x24(%rsp)
   3d699:	mov    $0xffffffff,%ebp
   3d69e:	mov    %edi,%ecx
   3d6a0:	shl    %cl,%ebp
   3d6a2:	not    %ebp
   3d6a4:	and    %esi,%ebp
   3d6a6:	mov    0x400(%r14,%r8,4),%edi
   3d6ae:	shl    $0x2,%edx
   3d6b1:	lea    (%rdx,%r15,8),%ecx
   3d6b5:	mov    0x810(%r14,%rcx,1),%edx
   3d6bd:	mov    %edi,%ecx
   3d6bf:	shr    $0x13,%ecx
   3d6c2:	and    $0x1f,%ecx
   3d6c5:	movzwl %dx,%r15d
   3d6c9:	mov    %edx,%esi
   3d6cb:	shr    $0x10,%esi
   3d6ce:	and    $0x7ffff,%edi
   3d6d4:	add    %ecx,%esi
   3d6d6:	shl    %cl,%r15
   3d6d9:	mov    %esi,%ecx
   3d6db:	shl    %cl,%rbp
   3d6de:	or     %rdi,%r15
   3d6e1:	or     %r15,%rbp
   3d6e4:	mov    0x80(%rsp),%rdx
   3d6ec:	mov    %r9,(%rdx,%r10,1)
   3d6f0:	mov    %eax,%edi
   3d6f2:	shr    $0x3,%edi
   3d6f5:	and    $0x7,%edi
   3d6f8:	mov    %eax,%ecx
   3d6fa:	and    $0x38,%cl
   3d6fd:	shr    %cl,%r9
   3d700:	add    %r10,%rdi
   3d703:	mov    %eax,%r15d
   3d706:	and    $0x7,%al
   3d708:	mov    %eax,%ecx
   3d70a:	shl    %cl,%rbp
   3d70d:	or     %r9,%rbp
   3d710:	mov    %rbp,(%rdx,%rdi,1)
   3d714:	lea    0x1(%r12),%eax
   3d719:	mov    0x10(%rsp),%rdx
   3d71e:	mov    %ax,(%rdx,%r11,2)
   3d723:	shr    $0x10,%rbx
   3d727:	movabs $0xb185ebca87000000,%r9
   3d731:	imul   %r9,%rbx
   3d735:	shr    $0x33,%rbx
   3d739:	lea    0x2(%r12),%eax
   3d73e:	mov    %ax,(%rdx,%rbx,2)
   3d742:	and    $0xffff8007,%r15d
   3d749:	add    0x24(%rsp),%r15d
   3d74e:	add    %esi,%r15d
   3d751:	mov    %r15d,%r10d
   3d754:	shr    $0x3,%r10d
   3d758:	and    $0x7,%r10d
   3d75c:	mov    %r15d,%ecx
   3d75f:	and    $0x38,%cl
   3d762:	shr    %cl,%rbp
   3d765:	add    %rdi,%r10
   3d768:	add    %r12,%r8
   3d76b:	and    $0xffff8007,%r15d
   3d772:	cmp    0x28(%rsp),%r8
   3d777:	jae    3d87e <fastgzip_u2::enc::scan::<13, true, false>+0x86e>
   3d77d:	lea    -0x1(%r8),%rax
   3d781:	mov    -0x1(%r13,%r8,1),%r11
   3d786:	mov    %r11,%rcx
   3d789:	imul   %r9,%rcx
   3d78d:	shr    $0x33,%rcx
   3d791:	mov    %ax,(%rdx,%rcx,2)
   3d795:	shr    $0x8,%r11
   3d799:	mov    %r8,%r12
   3d79c:	mov    0x80(%rsp),%rdi
   3d7a4:	imul   %r9,%r11
   3d7a8:	shr    $0x33,%r11
   3d7ac:	cmp    0x30(%rsp),%r8
   3d7b1:	jb     3d400 <fastgzip_u2::enc::scan::<13, true, false>+0x3f0>
   3d7b7:	jmp    3d576 <fastgzip_u2::enc::scan::<13, true, false>+0x566>
   3d7bc:	add    $0x3,%r8
   3d7c0:	mov    %r8,%r12
   3d7c3:	test   %rcx,%rcx
   3d7c6:	jne    3d659 <fastgzip_u2::enc::scan::<13, true, false>+0x649>
   3d7cc:	mov    0x8(%rsp),%rdi
   3d7d1:	sub    %r12,%rdi
   3d7d4:	cmp    $0x102,%rdi
   3d7db:	mov    $0x102,%r8d
   3d7e1:	cmovb  %rdi,%r8
   3d7e5:	lea    (%r12,%r13,1),%rcx
   3d7e9:	lea    (%rsi,%r13,1),%rdx
   3d7ed:	mov    $0x8,%r15d
   3d7f3:	cmp    $0x10,%rdi
   3d7f7:	jb     3d81d <fastgzip_u2::enc::scan::<13, true, false>+0x80d>
   3d7f9:	mov    $0x8,%edi
   3d7fe:	xchg   %ax,%ax
   3d800:	mov    (%rcx,%rdi,1),%r15
   3d804:	mov    (%rdx,%rdi,1),%rbp
   3d808:	cmp    %rbp,%r15
   3d80b:	jne    3d850 <fastgzip_u2::enc::scan::<13, true, false>+0x840>
   3d80d:	lea    0x8(%rdi),%r15
   3d811:	add    $0x10,%rdi
   3d815:	cmp    %r8,%rdi
   3d818:	mov    %r15,%rdi
   3d81b:	jbe    3d800 <fastgzip_u2::enc::scan::<13, true, false>+0x7f0>
   3d81d:	cmp    %r8,%r15
   3d820:	jae    3d662 <fastgzip_u2::enc::scan::<13, true, false>+0x652>
   3d826:	mov    -0x8(%rcx,%r8,1),%rcx
   3d82b:	mov    -0x8(%rdx,%r8,1),%rdx
   3d830:	cmp    %rdx,%rcx
   3d833:	je     3d662 <fastgzip_u2::enc::scan::<13, true, false>+0x652>
   3d839:	add    $0xfffffffffffffff8,%r8
   3d83d:	xor    %rcx,%rdx
   3d840:	tzcnt  %rdx,%rcx
   3d845:	shr    $0x3,%ecx
   3d848:	add    %rcx,%r8
   3d84b:	jmp    3d662 <fastgzip_u2::enc::scan::<13, true, false>+0x652>
   3d850:	xor    %r15,%rbp
   3d853:	tzcnt  %rbp,%r8
   3d858:	shr    $0x3,%r8d
   3d85c:	add    %rdi,%r8
   3d85f:	jmp    3d662 <fastgzip_u2::enc::scan::<13, true, false>+0x652>
   3d864:	and    $0xfffffffe,%ebp
   3d867:	xor    %ebx,%ebx
   3d869:	mov    0x70(%rsp),%r12
   3d86e:	cmpb   $0x0,0x78(%rsp)
   3d873:	jne    3d131 <fastgzip_u2::enc::scan::<13, true, false>+0x121>
   3d879:	jmp    3d150 <fastgzip_u2::enc::scan::<13, true, false>+0x140>
   3d87e:	mov    %r8,%r12
   3d881:	mov    %r10,%rbx
   3d884:	jmp    3d18b <fastgzip_u2::enc::scan::<13, true, false>+0x17b>
   3d889:	lea    0x81560(%rip),%rdx        # bedf0 <anon.06d40f39725e55ac64101dd27098398e.6.llvm.8162392238835072268+0x9e8>
   3d890:	mov    $0x240,%esi
   3d895:	mov    %rbx,%rdi
   3d898:	call   *0x847f2(%rip)        # c2090 <_DYNAMIC+0x3d0>
   3d89e:	int3
   3d89f:	int3
