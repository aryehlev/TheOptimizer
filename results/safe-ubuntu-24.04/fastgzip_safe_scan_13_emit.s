0000000000055f00 <fastgzip_safe::enc::scan::<13, true, false>>:
   55f00:	push   %rbp
   55f01:	push   %r15
   55f03:	push   %r14
   55f05:	push   %r13
   55f07:	push   %r12
   55f09:	push   %rbx
   55f0a:	sub    $0x38,%rsp
   55f0e:	mov    %r8,%r15
   55f11:	mov    %rsi,%r13
   55f14:	mov    %rdi,%rbx
   55f17:	movzwl 0x70(%rsp),%esi
   55f1c:	mov    0x90(%rsp),%edx
   55f23:	mov    0x88(%rsp),%rcx
   55f2b:	mov    0x80(%rsp),%r10
   55f33:	xor    %eax,%eax
   55f35:	mov    %esi,%edi
   55f37:	sub    $0x9,%di
   55f3b:	cmovb  %eax,%edi
   55f3e:	mov    %rsi,0x20(%rsp)
   55f43:	mov    %esi,%r8d
   55f46:	sub    $0xc,%r8w
   55f4b:	cmovb  %eax,%r8d
   55f4f:	mov    %ecx,%eax
   55f51:	shr    $0x3,%eax
   55f54:	movzwl %ax,%r12d
   55f58:	test   $0x1,%dl
   55f5b:	je     55fe7 <fastgzip_safe::enc::scan::<13, true, false>+0xe7>
   55f61:	mov    0xe04(%rbx),%ebp
   55f67:	mov    %ebp,%r11d
   55f6a:	shr    $0x3,%r11d
   55f6e:	cmp    $0x400,%rbp
   55f75:	jae    56086 <fastgzip_safe::enc::scan::<13, true, false>+0x186>
   55f7b:	movups 0xe78(%rbx),%xmm0
   55f82:	movups %xmm0,0x70(%r10,%r12,1)
   55f88:	movups 0xe68(%rbx),%xmm0
   55f8f:	movups %xmm0,0x60(%r10,%r12,1)
   55f95:	movups 0xe58(%rbx),%xmm0
   55f9c:	movups %xmm0,0x50(%r10,%r12,1)
   55fa2:	movups 0xe48(%rbx),%xmm0
   55fa9:	movups %xmm0,0x40(%r10,%r12,1)
   55faf:	movups 0xe08(%rbx),%xmm0
   55fb6:	movups 0xe18(%rbx),%xmm1
   55fbd:	movups 0xe28(%rbx),%xmm2
   55fc4:	movups 0xe38(%rbx),%xmm3
   55fcb:	movups %xmm3,0x30(%r10,%r12,1)
   55fd1:	movups %xmm2,0x20(%r10,%r12,1)
   55fd7:	movups %xmm1,0x10(%r10,%r12,1)
   55fdd:	movups %xmm0,(%r10,%r12,1)
   55fe2:	jmp    560ed <fastgzip_safe::enc::scan::<13, true, false>+0x1ed>
   55fe7:	mov    %ecx,%ebp
   55fe9:	and    $0x7,%cl
   55fec:	mov    $0xffffffff,%r14d
   55ff2:	shl    %cl,%r14d
   55ff5:	and    $0x7,%ebp
   55ff8:	movzbl (%r10,%r12,1),%eax
   55ffd:	not    %r14d
   56000:	and    %eax,%r14d
   56003:	movzwl %di,%edi
   56006:	cmpb   $0x0,0x78(%rsp)
   5600b:	mov    %rdi,0x10(%rsp)
   56010:	je     56043 <fastgzip_safe::enc::scan::<13, true, false>+0x143>
   56012:	mov    $0x4000,%edx
   56017:	mov    %r13,%rdi
   5601a:	xor    %esi,%esi
   5601c:	mov    %r8d,0x18(%rsp)
   56021:	mov    %r9d,0x8(%rsp)
   56026:	call   *0x6c0e4(%rip)        # c2110 <memset@GLIBC_2.2.5>
   5602c:	mov    0x8(%rsp),%r9d
   56031:	mov    0x18(%rsp),%r8d
   56036:	mov    0x10(%rsp),%rdi
   5603b:	mov    0x80(%rsp),%r10
   56043:	test   %r9w,%r9w
   56047:	je     56075 <fastgzip_safe::enc::scan::<13, true, false>+0x175>
   56049:	movzwl %r9w,%r10d
   5604d:	cmp    %di,%r9w
   56051:	jb     56170 <fastgzip_safe::enc::scan::<13, true, false>+0x270>
   56057:	mov    0x20(%rsp),%rsi
   5605c:	cmp    %rsi,%r10
   5605f:	ja     567de <fastgzip_safe::enc::scan::<13, true, false>+0x8de>
   56065:	mov    %r10,%rcx
   56068:	mov    0x80(%rsp),%r10
   56070:	jmp    56617 <fastgzip_safe::enc::scan::<13, true, false>+0x717>
   56075:	cmp    $0x2,%di
   56079:	jae    5612e <fastgzip_safe::enc::scan::<13, true, false>+0x22e>
   5607f:	xor    %ecx,%ecx
   56081:	jmp    56612 <fastgzip_safe::enc::scan::<13, true, false>+0x712>
   56086:	lea    (%r11,%r12,1),%rsi
   5608a:	cmp    $0x10081,%rsi
   56091:	jae    5680a <fastgzip_safe::enc::scan::<13, true, false>+0x90a>
   56097:	cmp    $0x1208,%ebp
   5609d:	jae    567f3 <fastgzip_safe::enc::scan::<13, true, false>+0x8f3>
   560a3:	lea    0xe08(%rbx),%rsi
   560aa:	mov    %edi,0x10(%rsp)
   560ae:	lea    (%r10,%r12,1),%rdi
   560b2:	mov    %r11,%rdx
   560b5:	mov    %r8d,%r14d
   560b8:	mov    %r9d,0x8(%rsp)
   560bd:	mov    %r11,0x18(%rsp)
   560c2:	call   *0x6bea0(%rip)        # c1f68 <memcpy@GLIBC_2.14>
   560c8:	mov    0x18(%rsp),%r11
   560cd:	mov    0x10(%rsp),%edi
   560d1:	mov    0x8(%rsp),%r9d
   560d6:	mov    %r14d,%r8d
   560d9:	mov    0x80(%rsp),%r10
   560e1:	cmp    $0x1200,%ebp
   560e7:	jae    5681f <fastgzip_safe::enc::scan::<13, true, false>+0x91f>
   560ed:	and    $0x7,%ebp
   560f0:	mov    $0xffffffff,%r14d
   560f6:	mov    %ebp,%ecx
   560f8:	shl    %cl,%r14d
   560fb:	movzbl 0xe08(%rbx,%r11,1),%eax
   56104:	not    %r14d
   56107:	and    %eax,%r14d
   5610a:	testl  $0x100,0x90(%rsp)
   56115:	jne    567c3 <fastgzip_safe::enc::scan::<13, true, false>+0x8c3>
   5611b:	test   %r11,%r11
   5611e:	je     567bf <fastgzip_safe::enc::scan::<13, true, false>+0x8bf>
   56124:	andb   $0xfe,(%r10,%r12,1)
   56129:	jmp    567c3 <fastgzip_safe::enc::scan::<13, true, false>+0x8c3>
   5612e:	movzbl (%r15),%eax
   56132:	mov    (%rbx,%rax,4),%eax
   56135:	movzwl %ax,%edx
   56138:	mov    %ebp,%ecx
   5613a:	shl    %cl,%rdx
   5613d:	or     %r14,%rdx
   56140:	shr    $0x10,%eax
   56143:	add    %ebp,%eax
   56145:	movzwl %r12w,%ecx
   56149:	mov    %rdx,(%r10,%rcx,1)
   5614d:	mov    %eax,%ecx
   5614f:	shr    $0x3,%ecx
   56152:	and    $0x7,%ecx
   56155:	add    %rcx,%r12
   56158:	mov    %eax,%ecx
   5615a:	and    $0x38,%cl
   5615d:	shr    %cl,%rdx
   56160:	and    $0x18007,%eax
   56165:	mov    $0x1,%r10d
   5616b:	mov    %eax,%ebp
   5616d:	mov    %rdx,%r14
   56170:	movzwl %r8w,%eax
   56174:	mov    %rax,0x8(%rsp)
   56179:	movabs $0xb185ebca87000000,%rdx
   56183:	mov    (%r15,%r10,1),%rsi
   56187:	lea    0x9(%rdi),%rax
   5618b:	mov    %rax,0x30(%rsp)
   56190:	imul   %rdx,%rsi
   56194:	shr    $0x33,%rsi
   56198:	mov    %r10,%rdi
   5619b:	cmp    0x8(%rsp),%r10
   561a0:	jae    56320 <fastgzip_safe::enc::scan::<13, true, false>+0x420>
   561a6:	cs nopw 0x0(%rax,%rax,1)
   561b0:	mov    %rdi,%r10
   561b3:	mov    (%r15,%rdi,1),%r8
   561b7:	movzwl 0x0(%r13,%rsi,2),%r9d
   561bd:	mov    %r10w,0x0(%r13,%rsi,2)
   561c3:	mov    %r8,%rsi
   561c6:	shr    $0x8,%rsi
   561ca:	imul   %rdx,%rsi
   561ce:	shr    $0x33,%rsi
   561d2:	mov    (%r15,%r9,1),%rcx
   561d6:	xor    %r8,%rcx
   561d9:	test   %ecx,%ecx
   561db:	je     563ce <fastgzip_safe::enc::scan::<13, true, false>+0x4ce>
   561e1:	movzbl %r8b,%eax
   561e5:	mov    (%rbx,%rax,4),%eax
   561e8:	movzwl %ax,%r11d
   561ec:	mov    %ebp,%ecx
   561ee:	shl    %cl,%r11
   561f1:	or     %r14,%r11
   561f4:	shr    $0x10,%eax
   561f7:	add    %ebp,%eax
   561f9:	mov    0x1(%r15,%r10,1),%r8
   561fe:	movzwl 0x0(%r13,%rsi,2),%r9d
   56204:	lea    0x1(%r10),%rdi
   56208:	mov    %di,0x0(%r13,%rsi,2)
   5620e:	mov    %r8,%rsi
   56211:	shr    $0x8,%rsi
   56215:	imul   %rdx,%rsi
   56219:	shr    $0x33,%rsi
   5621d:	mov    (%r15,%r9,1),%rcx
   56221:	xor    %r8,%rcx
   56224:	test   %ecx,%ecx
   56226:	je     56470 <fastgzip_safe::enc::scan::<13, true, false>+0x570>
   5622c:	movzbl %r8b,%ecx
   56230:	mov    %rdx,%r14
   56233:	mov    (%rbx,%rcx,4),%edx
   56236:	movzwl %dx,%r8d
   5623a:	mov    %eax,%ecx
   5623c:	shl    %cl,%r8
   5623f:	or     %r8,%r11
   56242:	shr    $0x10,%edx
   56245:	add    %eax,%edx
   56247:	mov    0x2(%r15,%r10,1),%r8
   5624c:	movzwl 0x0(%r13,%rsi,2),%r9d
   56252:	inc    %rdi
   56255:	mov    %di,0x0(%r13,%rsi,2)
   5625b:	mov    %r8,%rsi
   5625e:	shr    $0x8,%rsi
   56262:	imul   %r14,%rsi
   56266:	shr    $0x33,%rsi
   5626a:	mov    (%r15,%r9,1),%rcx
   5626e:	xor    %r8,%rcx
   56271:	test   %ecx,%ecx
   56273:	je     56461 <fastgzip_safe::enc::scan::<13, true, false>+0x561>
   56279:	movzbl %r8b,%eax
   5627d:	mov    (%rbx,%rax,4),%eax
   56280:	movzwl %ax,%r8d
   56284:	mov    %edx,%ecx
   56286:	shl    %cl,%r8
   56289:	or     %r8,%r11
   5628c:	shr    $0x10,%eax
   5628f:	add    %edx,%eax
   56291:	mov    0x3(%r15,%r10,1),%r8
   56296:	movzwl 0x0(%r13,%rsi,2),%r9d
   5629c:	inc    %rdi
   5629f:	mov    %di,0x0(%r13,%rsi,2)
   562a5:	mov    %r8,%rsi
   562a8:	shr    $0x8,%rsi
   562ac:	imul   %r14,%rsi
   562b0:	shr    $0x33,%rsi
   562b4:	mov    (%r15,%r9,1),%rcx
   562b8:	xor    %r8,%rcx
   562bb:	test   %ecx,%ecx
   562bd:	je     56489 <fastgzip_safe::enc::scan::<13, true, false>+0x589>
   562c3:	mov    %r14,%rdx
   562c6:	movzbl %r8b,%ecx
   562ca:	mov    (%rbx,%rcx,4),%ebp
   562cd:	movzwl %bp,%r14d
   562d1:	mov    %eax,%ecx
   562d3:	shl    %cl,%r14
   562d6:	or     %r11,%r14
   562d9:	shr    $0x10,%ebp
   562dc:	add    %eax,%ebp
   562de:	movzwl %r12w,%eax
   562e2:	mov    0x80(%rsp),%rcx
   562ea:	mov    %r14,(%rcx,%rax,1)
   562ee:	mov    %ebp,%eax
   562f0:	shr    $0x3,%eax
   562f3:	and    $0x7,%eax
   562f6:	mov    %ebp,%ecx
   562f8:	and    $0x38,%cl
   562fb:	shr    %cl,%r14
   562fe:	add    %rax,%r12
   56301:	and    $0xffff8007,%ebp
   56307:	inc    %rdi
   5630a:	cmp    0x8(%rsp),%rdi
   5630f:	jb     561b0 <fastgzip_safe::enc::scan::<13, true, false>+0x2b0>
   56315:	add    $0x4,%r10
   56319:	nopl   0x0(%rax)
   56320:	mov    %r14,%r11
   56323:	mov    %ebp,%eax
   56325:	mov    %r10,%rdi
   56328:	cmp    0x10(%rsp),%r10
   5632d:	jae    56057 <fastgzip_safe::enc::scan::<13, true, false>+0x157>
   56333:	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   56340:	mov    (%r15,%rdi,1),%r8
   56344:	movzwl 0x0(%r13,%rsi,2),%r9d
   5634a:	mov    %di,0x0(%r13,%rsi,2)
   56350:	mov    %r8,%rsi
   56353:	shr    $0x8,%rsi
   56357:	imul   %rdx,%rsi
   5635b:	shr    $0x33,%rsi
   5635f:	mov    (%r15,%r9,1),%rcx
   56363:	xor    %r8,%rcx
   56366:	test   %ecx,%ecx
   56368:	je     56470 <fastgzip_safe::enc::scan::<13, true, false>+0x570>
   5636e:	movzbl %r8b,%ecx
   56372:	mov    (%rbx,%rcx,4),%edx
   56375:	movzwl %dx,%r8d
   56379:	mov    %eax,%ecx
   5637b:	shl    %cl,%r8
   5637e:	or     %r8,%r11
   56381:	shr    $0x10,%edx
   56384:	add    %eax,%edx
   56386:	inc    %rdi
   56389:	movzwl %r12w,%eax
   5638d:	mov    0x80(%rsp),%rcx
   56395:	mov    %r11,(%rcx,%rax,1)
   56399:	mov    %edx,%ecx
   5639b:	mov    %edx,%eax
   5639d:	shr    $0x3,%edx
   563a0:	and    $0x38,%cl
   563a3:	shr    %cl,%r11
   563a6:	and    $0x7,%edx
   563a9:	add    %rdx,%r12
   563ac:	movabs $0xb185ebca87000000,%rdx
   563b6:	and    $0xffff8007,%eax
   563bb:	mov    0x10(%rsp),%rcx
   563c0:	cmp    %rdi,%rcx
   563c3:	jne    56340 <fastgzip_safe::enc::scan::<13, true, false>+0x440>
   563c9:	jmp    56605 <fastgzip_safe::enc::scan::<13, true, false>+0x705>
   563ce:	mov    %r10,%rdi
   563d1:	mov    %ebp,%eax
   563d3:	mov    %r14,%r11
   563d6:	test   %rcx,%rcx
   563d9:	jne    56479 <fastgzip_safe::enc::scan::<13, true, false>+0x579>
   563df:	nop
   563e0:	mov    0x30(%rsp),%rcx
   563e5:	sub    %rdi,%rcx
   563e8:	cmp    $0x102,%rcx
   563ef:	mov    $0x102,%r10d
   563f5:	cmovb  %rcx,%r10
   563f9:	lea    (%r15,%r9,1),%rdx
   563fd:	mov    $0x8,%ebp
   56402:	cmp    $0x10,%rcx
   56406:	jb     56431 <fastgzip_safe::enc::scan::<13, true, false>+0x531>
   56408:	mov    $0x8,%r14d
   5640e:	xchg   %ax,%ax
   56410:	lea    (%r15,%rdi,1),%rcx
   56414:	mov    (%rcx,%r14,1),%rbp
   56418:	mov    (%rdx,%r14,1),%rcx
   5641c:	cmp    %rcx,%rbp
   5641f:	jne    5649a <fastgzip_safe::enc::scan::<13, true, false>+0x59a>
   56421:	lea    0x8(%r14),%rbp
   56425:	add    $0x10,%r14
   56429:	cmp    %r10,%r14
   5642c:	mov    %rbp,%r14
   5642f:	jbe    56410 <fastgzip_safe::enc::scan::<13, true, false>+0x510>
   56431:	cmp    %r10,%rbp
   56434:	jae    564a9 <fastgzip_safe::enc::scan::<13, true, false>+0x5a9>
   56436:	mov    %r10,%r14
   56439:	sub    $0x8,%r14
   5643d:	mov    $0x0,%ecx
   56442:	cmovb  %rcx,%r14
   56446:	lea    (%r15,%rdi,1),%rcx
   5644a:	mov    (%rcx,%r14,1),%rcx
   5644e:	mov    (%rdx,%r14,1),%rdx
   56452:	cmp    %rdx,%rcx
   56455:	je     564a9 <fastgzip_safe::enc::scan::<13, true, false>+0x5a9>
   56457:	xor    %rcx,%rdx
   5645a:	tzcnt  %rdx,%r10
   5645f:	jmp    564a2 <fastgzip_safe::enc::scan::<13, true, false>+0x5a2>
   56461:	add    $0x2,%r10
   56465:	mov    %r10,%rdi
   56468:	mov    %edx,%eax
   5646a:	nopw   0x0(%rax,%rax,1)
   56470:	test   %rcx,%rcx
   56473:	je     563e0 <fastgzip_safe::enc::scan::<13, true, false>+0x4e0>
   56479:	tzcnt  %rcx,%r10
   5647e:	shr    $0x3,%r10d
   56482:	mov    %r10,0x28(%rsp)
   56487:	jmp    564b7 <fastgzip_safe::enc::scan::<13, true, false>+0x5b7>
   56489:	add    $0x3,%r10
   5648d:	mov    %r10,%rdi
   56490:	test   %rcx,%rcx
   56493:	jne    56479 <fastgzip_safe::enc::scan::<13, true, false>+0x579>
   56495:	jmp    563e0 <fastgzip_safe::enc::scan::<13, true, false>+0x4e0>
   5649a:	xor    %rbp,%rcx
   5649d:	tzcnt  %rcx,%r10
   564a2:	shr    $0x3,%r10d
   564a6:	add    %r14,%r10
   564a9:	mov    %r10d,%ecx
   564ac:	and    $0x1ff,%ecx
   564b2:	mov    %rcx,0x28(%rsp)
   564b7:	not    %r9d
   564ba:	add    %edi,%r9d
   564bd:	mov    $0x3f,%edx
   564c2:	bsr    %r9d,%edx
   564c6:	xor    $0x1f,%edx
   564c9:	mov    $0x1e,%ebp
   564ce:	sub    %edx,%ebp
   564d0:	mov    $0x0,%ecx
   564d5:	cmovb  %ecx,%ebp
   564d8:	mov    %ebp,0x18(%rsp)
   564dc:	mov    $0xffffffff,%r14d
   564e2:	mov    %ebp,%ecx
   564e4:	shl    %cl,%r14d
   564e7:	not    %r14d
   564ea:	and    %r9d,%r14d
   564ed:	mov    $0x1e,%cl
   564ef:	sub    %dl,%cl
   564f1:	movzbl %cl,%ecx
   564f4:	xor    %ebp,%ebp
   564f6:	bt     %ecx,%r9d
   564fa:	mov    0x28(%rsp),%rcx
   564ff:	mov    0x400(%rbx,%rcx,4),%r9d
   56507:	setb   %bpl
   5650b:	shl    $0x2,%ebp
   5650e:	lea    0x0(%rbp,%rdx,8),%ecx
   56512:	mov    0xc04(%rbx,%rcx,1),%ebp
   56519:	lea    0x1(%rdi),%ecx
   5651c:	mov    %cx,0x0(%r13,%rsi,2)
   56522:	mov    %r9d,%ecx
   56525:	shr    $0x13,%ecx
   56528:	and    $0x1f,%ecx
   5652b:	movzwl %bp,%edx
   5652e:	mov    %ebp,%esi
   56530:	shr    $0x10,%esi
   56533:	and    $0x7ffff,%r9d
   5653a:	add    %ecx,%esi
   5653c:	shl    %cl,%rdx
   5653f:	mov    %esi,%ecx
   56541:	shl    %cl,%r14
   56544:	or     %r9,%rdx
   56547:	or     %rdx,%r14
   5654a:	movzwl %r12w,%ecx
   5654e:	mov    0x80(%rsp),%rdx
   56556:	mov    %r11,(%rdx,%rcx,1)
   5655a:	shr    $0x10,%r8
   5655e:	movabs $0xb185ebca87000000,%r9
   56568:	imul   %r9,%r8
   5656c:	shr    $0x33,%r8
   56570:	lea    0x2(%rdi),%ecx
   56573:	mov    %cx,0x0(%r13,%r8,2)
   56579:	mov    %eax,%edx
   5657b:	mov    %eax,%ecx
   5657d:	and    $0x38,%cl
   56580:	shr    %cl,%r11
   56583:	shr    $0x3,%edx
   56586:	and    $0x7,%edx
   56589:	mov    %eax,%ebp
   5658b:	and    $0x7,%al
   5658d:	mov    %eax,%ecx
   5658f:	shl    %cl,%r14
   56592:	add    %r12,%rdx
   56595:	or     %r11,%r14
   56598:	and    $0xffff8007,%ebp
   5659e:	add    0x18(%rsp),%ebp
   565a2:	add    %esi,%ebp
   565a4:	movzwl %dx,%eax
   565a7:	mov    0x80(%rsp),%rcx
   565af:	mov    %r14,(%rcx,%rax,1)
   565b3:	mov    %ebp,%r12d
   565b6:	shr    $0x3,%r12d
   565ba:	and    $0x7,%r12d
   565be:	mov    %ebp,%ecx
   565c0:	and    $0x38,%cl
   565c3:	shr    %cl,%r14
   565c6:	add    %rdx,%r12
   565c9:	add    %rdi,%r10
   565cc:	and    $0xffff8007,%ebp
   565d2:	cmp    0x10(%rsp),%r10
   565d7:	jae    56057 <fastgzip_safe::enc::scan::<13, true, false>+0x157>
   565dd:	lea    -0x1(%r10),%eax
   565e1:	movzwl %ax,%eax
   565e4:	mov    (%r15,%rax,1),%rsi
   565e8:	mov    %rsi,%rcx
   565eb:	imul   %r9,%rcx
   565ef:	shr    $0x33,%rcx
   565f3:	mov    %ax,0x0(%r13,%rcx,2)
   565f9:	shr    $0x8,%rsi
   565fd:	mov    %r9,%rdx
   56600:	jmp    56190 <fastgzip_safe::enc::scan::<13, true, false>+0x290>
   56605:	mov    %r11,%r14
   56608:	mov    %eax,%ebp
   5660a:	mov    0x80(%rsp),%r10
   56612:	mov    0x20(%rsp),%rsi
   56617:	sub    %rcx,%rsi
   5661a:	add    %rcx,%r15
   5661d:	mov    %esi,%r11d
   56620:	and    $0x3,%r11d
   56624:	and    $0xfffc,%rsi
   5662b:	je     566df <fastgzip_safe::enc::scan::<13, true, false>+0x7df>
   56631:	xor    %edi,%edi
   56633:	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   56640:	movzbl (%r15,%rdi,1),%eax
   56645:	mov    (%rbx,%rax,4),%eax
   56648:	movzwl %ax,%r9d
   5664c:	mov    %ebp,%ecx
   5664e:	shl    %cl,%r9
   56651:	shr    $0x10,%eax
   56654:	add    %ebp,%eax
   56656:	movzbl 0x1(%r15,%rdi,1),%ecx
   5665c:	mov    (%rbx,%rcx,4),%edx
   5665f:	movzwl %dx,%r8d
   56663:	mov    %eax,%ecx
   56665:	shl    %cl,%r8
   56668:	or     %r9,%r14
   5666b:	or     %r14,%r8
   5666e:	shr    $0x10,%edx
   56671:	add    %eax,%edx
   56673:	movzbl 0x2(%r15,%rdi,1),%eax
   56679:	mov    (%rbx,%rax,4),%eax
   5667c:	movzwl %ax,%r9d
   56680:	mov    %edx,%ecx
   56682:	shl    %cl,%r9
   56685:	shr    $0x10,%eax
   56688:	add    %edx,%eax
   5668a:	movzbl 0x3(%r15,%rdi,1),%ecx
   56690:	mov    (%rbx,%rcx,4),%ebp
   56693:	movzwl %bp,%r14d
   56697:	mov    %eax,%ecx
   56699:	shl    %cl,%r14
   5669c:	or     %r8,%r9
   5669f:	or     %r9,%r14
   566a2:	shr    $0x10,%ebp
   566a5:	add    %eax,%ebp
   566a7:	movzwl %r12w,%eax
   566ab:	mov    %r14,(%r10,%rax,1)
   566af:	mov    %ebp,%edx
   566b1:	shr    $0x3,%edx
   566b4:	and    $0x7,%edx
   566b7:	add    %r12,%rdx
   566ba:	mov    %ebp,%ecx
   566bc:	and    $0x38,%cl
   566bf:	shr    %cl,%r14
   566c2:	and    $0xffff8007,%ebp
   566c8:	add    $0x4,%rdi
   566cc:	mov    %rdx,%r12
   566cf:	cmp    %rdi,%rsi
   566d2:	jne    56640 <fastgzip_safe::enc::scan::<13, true, false>+0x740>
   566d8:	test   %r11,%r11
   566db:	jne    566e7 <fastgzip_safe::enc::scan::<13, true, false>+0x7e7>
   566dd:	jmp    5673f <fastgzip_safe::enc::scan::<13, true, false>+0x83f>
   566df:	mov    %r12,%rdx
   566e2:	test   %r11,%r11
   566e5:	je     5673f <fastgzip_safe::enc::scan::<13, true, false>+0x83f>
   566e7:	movzbl (%r15,%rsi,1),%eax
   566ec:	mov    (%rbx,%rax,4),%eax
   566ef:	movzwl %ax,%edi
   566f2:	mov    %ebp,%ecx
   566f4:	shl    %cl,%rdi
   566f7:	or     %rdi,%r14
   566fa:	shr    $0x10,%eax
   566fd:	add    %ebp,%eax
   566ff:	cmp    $0x1,%r11d
   56703:	je     5673d <fastgzip_safe::enc::scan::<13, true, false>+0x83d>
   56705:	movzbl 0x1(%r15,%rsi,1),%ecx
   5670b:	mov    (%rbx,%rcx,4),%ebp
   5670e:	movzwl %bp,%edi
   56711:	mov    %eax,%ecx
   56713:	shl    %cl,%rdi
   56716:	or     %rdi,%r14
   56719:	shr    $0x10,%ebp
   5671c:	add    %eax,%ebp
   5671e:	cmp    $0x2,%r11d
   56722:	je     5673f <fastgzip_safe::enc::scan::<13, true, false>+0x83f>
   56724:	movzbl 0x2(%r15,%rsi,1),%eax
   5672a:	mov    (%rbx,%rax,4),%eax
   5672d:	movzwl %ax,%esi
   56730:	mov    %ebp,%ecx
   56732:	shl    %cl,%rsi
   56735:	or     %rsi,%r14
   56738:	shr    $0x10,%eax
   5673b:	add    %ebp,%eax
   5673d:	mov    %eax,%ebp
   5673f:	movzwl %dx,%eax
   56742:	mov    %r14,(%r10,%rax,1)
   56746:	mov    %ebp,%esi
   56748:	shr    $0x3,%esi
   5674b:	and    $0x7,%esi
   5674e:	add    %rdx,%rsi
   56751:	mov    %ebp,%edx
   56753:	and    $0xffff8007,%edx
   56759:	testl  $0x10000,0x90(%rsp)
   56764:	je     567a1 <fastgzip_safe::enc::scan::<13, true, false>+0x8a1>
   56766:	mov    %ebp,%ecx
   56768:	and    $0x38,%cl
   5676b:	shr    %cl,%r14
   5676e:	mov    0xc00(%rbx),%eax
   56774:	movzwl %ax,%edi
   56777:	and    $0x7,%bpl
   5677b:	mov    %ebp,%ecx
   5677d:	shl    %cl,%rdi
   56780:	or     %r14,%rdi
   56783:	shr    $0x10,%eax
   56786:	add    %edx,%eax
   56788:	movzwl %si,%ecx
   5678b:	mov    %rdi,(%r10,%rcx,1)
   5678f:	mov    %eax,%ecx
   56791:	shr    $0x3,%ecx
   56794:	and    $0x7,%ecx
   56797:	add    %rcx,%rsi
   5679a:	and    $0xffff8007,%eax
   5679f:	mov    %eax,%edx
   567a1:	xor    %eax,%eax
   567a3:	cmp    $0x8,%edx
   567a6:	mov    %edx,%ecx
   567a8:	lea    (%rcx,%rsi,8),%rcx
   567ac:	cmovb  %rcx,%rax
   567b0:	add    $0x38,%rsp
   567b4:	pop    %rbx
   567b5:	pop    %r12
   567b7:	pop    %r13
   567b9:	pop    %r14
   567bb:	pop    %r15
   567bd:	pop    %rbp
   567be:	ret
   567bf:	and    $0xfffffffe,%r14d
   567c3:	add    %r11,%r12
   567c6:	movzwl %di,%edi
   567c9:	cmpb   $0x0,0x78(%rsp)
   567ce:	mov    %rdi,0x10(%rsp)
   567d3:	je     56043 <fastgzip_safe::enc::scan::<13, true, false>+0x143>
   567d9:	jmp    56012 <fastgzip_safe::enc::scan::<13, true, false>+0x112>
   567de:	lea    0x68df3(%rip),%rcx        # bf5d8 <anon.8e724d7618661fec6c01ee5922cf9775.29.llvm.6304857328360807621+0x3c0>
   567e5:	mov    $0x10108,%edx
   567ea:	mov    %r10,%rdi
   567ed:	call   *0x6b78d(%rip)        # c1f80 <_DYNAMIC+0x2a0>
   567f3:	lea    0x68e3e(%rip),%rcx        # bf638 <anon.9d8ef70180f99d61d317e85a697ff310.8.llvm.4753765335101048590+0x18>
   567fa:	mov    $0x240,%edx
   567ff:	xor    %edi,%edi
   56801:	mov    %r11,%rsi
   56804:	call   *0x6b776(%rip)        # c1f80 <_DYNAMIC+0x2a0>
   5680a:	lea    0x68e3f(%rip),%rcx        # bf650 <anon.9d8ef70180f99d61d317e85a697ff310.8.llvm.4753765335101048590+0x30>
   56811:	mov    $0x10080,%edx
   56816:	mov    %r12,%rdi
   56819:	call   *0x6b761(%rip)        # c1f80 <_DYNAMIC+0x2a0>
   5681f:	lea    0x68e42(%rip),%rdx        # bf668 <anon.9d8ef70180f99d61d317e85a697ff310.8.llvm.4753765335101048590+0x48>
   56826:	mov    $0x240,%esi
   5682b:	mov    %r11,%rdi
   5682e:	call   *0x6b87c(%rip)        # c20b0 <_DYNAMIC+0x3d0>
   56834:	int3
   56835:	int3
   56836:	int3
   56837:	int3
   56838:	int3
   56839:	int3
   5683a:	int3
   5683b:	int3
   5683c:	int3
   5683d:	int3
   5683e:	int3
   5683f:	int3
