0000000000055ee0 <fastgzip_safe::enc::scan::<13, true, false>>:
   55ee0:	push   %rbp
   55ee1:	push   %r15
   55ee3:	push   %r14
   55ee5:	push   %r13
   55ee7:	push   %r12
   55ee9:	push   %rbx
   55eea:	sub    $0x38,%rsp
   55eee:	mov    %r8,%r15
   55ef1:	mov    %rsi,%r13
   55ef4:	mov    %rdi,%rbx
   55ef7:	movzwl 0x70(%rsp),%esi
   55efc:	mov    0x90(%rsp),%edx
   55f03:	mov    0x88(%rsp),%rcx
   55f0b:	mov    0x80(%rsp),%r10
   55f13:	xor    %eax,%eax
   55f15:	mov    %esi,%edi
   55f17:	sub    $0x9,%di
   55f1b:	cmovb  %eax,%edi
   55f1e:	mov    %rsi,0x20(%rsp)
   55f23:	mov    %esi,%r8d
   55f26:	sub    $0xc,%r8w
   55f2b:	cmovb  %eax,%r8d
   55f2f:	mov    %ecx,%eax
   55f31:	shr    $0x3,%eax
   55f34:	movzwl %ax,%r12d
   55f38:	test   $0x1,%dl
   55f3b:	je     55fc7 <fastgzip_safe::enc::scan::<13, true, false>+0xe7>
   55f41:	mov    0xe04(%rbx),%ebp
   55f47:	mov    %ebp,%r11d
   55f4a:	shr    $0x3,%r11d
   55f4e:	cmp    $0x400,%rbp
   55f55:	jae    56066 <fastgzip_safe::enc::scan::<13, true, false>+0x186>
   55f5b:	movups 0xe78(%rbx),%xmm0
   55f62:	movups %xmm0,0x70(%r10,%r12,1)
   55f68:	movups 0xe68(%rbx),%xmm0
   55f6f:	movups %xmm0,0x60(%r10,%r12,1)
   55f75:	movups 0xe58(%rbx),%xmm0
   55f7c:	movups %xmm0,0x50(%r10,%r12,1)
   55f82:	movups 0xe48(%rbx),%xmm0
   55f89:	movups %xmm0,0x40(%r10,%r12,1)
   55f8f:	movups 0xe08(%rbx),%xmm0
   55f96:	movups 0xe18(%rbx),%xmm1
   55f9d:	movups 0xe28(%rbx),%xmm2
   55fa4:	movups 0xe38(%rbx),%xmm3
   55fab:	movups %xmm3,0x30(%r10,%r12,1)
   55fb1:	movups %xmm2,0x20(%r10,%r12,1)
   55fb7:	movups %xmm1,0x10(%r10,%r12,1)
   55fbd:	movups %xmm0,(%r10,%r12,1)
   55fc2:	jmp    560cd <fastgzip_safe::enc::scan::<13, true, false>+0x1ed>
   55fc7:	mov    %ecx,%ebp
   55fc9:	and    $0x7,%cl
   55fcc:	mov    $0xffffffff,%r14d
   55fd2:	shl    %cl,%r14d
   55fd5:	and    $0x7,%ebp
   55fd8:	movzbl (%r10,%r12,1),%eax
   55fdd:	not    %r14d
   55fe0:	and    %eax,%r14d
   55fe3:	movzwl %di,%edi
   55fe6:	cmpb   $0x0,0x78(%rsp)
   55feb:	mov    %rdi,0x10(%rsp)
   55ff0:	je     56023 <fastgzip_safe::enc::scan::<13, true, false>+0x143>
   55ff2:	mov    $0x4000,%edx
   55ff7:	mov    %r13,%rdi
   55ffa:	xor    %esi,%esi
   55ffc:	mov    %r8d,0x18(%rsp)
   56001:	mov    %r9d,0x8(%rsp)
   56006:	call   *0x6c0e4(%rip)        # c20f0 <memset@GLIBC_2.2.5>
   5600c:	mov    0x8(%rsp),%r9d
   56011:	mov    0x18(%rsp),%r8d
   56016:	mov    0x10(%rsp),%rdi
   5601b:	mov    0x80(%rsp),%r10
   56023:	test   %r9w,%r9w
   56027:	je     56055 <fastgzip_safe::enc::scan::<13, true, false>+0x175>
   56029:	movzwl %r9w,%r10d
   5602d:	cmp    %di,%r9w
   56031:	jb     56150 <fastgzip_safe::enc::scan::<13, true, false>+0x270>
   56037:	mov    0x20(%rsp),%rsi
   5603c:	cmp    %rsi,%r10
   5603f:	ja     567be <fastgzip_safe::enc::scan::<13, true, false>+0x8de>
   56045:	mov    %r10,%rcx
   56048:	mov    0x80(%rsp),%r10
   56050:	jmp    565f7 <fastgzip_safe::enc::scan::<13, true, false>+0x717>
   56055:	cmp    $0x2,%di
   56059:	jae    5610e <fastgzip_safe::enc::scan::<13, true, false>+0x22e>
   5605f:	xor    %ecx,%ecx
   56061:	jmp    565f2 <fastgzip_safe::enc::scan::<13, true, false>+0x712>
   56066:	lea    (%r11,%r12,1),%rsi
   5606a:	cmp    $0x10081,%rsi
   56071:	jae    567ea <fastgzip_safe::enc::scan::<13, true, false>+0x90a>
   56077:	cmp    $0x1208,%ebp
   5607d:	jae    567d3 <fastgzip_safe::enc::scan::<13, true, false>+0x8f3>
   56083:	lea    0xe08(%rbx),%rsi
   5608a:	mov    %edi,0x10(%rsp)
   5608e:	lea    (%r10,%r12,1),%rdi
   56092:	mov    %r11,%rdx
   56095:	mov    %r8d,%r14d
   56098:	mov    %r9d,0x8(%rsp)
   5609d:	mov    %r11,0x18(%rsp)
   560a2:	call   *0x6bea0(%rip)        # c1f48 <memcpy@GLIBC_2.14>
   560a8:	mov    0x18(%rsp),%r11
   560ad:	mov    0x10(%rsp),%edi
   560b1:	mov    0x8(%rsp),%r9d
   560b6:	mov    %r14d,%r8d
   560b9:	mov    0x80(%rsp),%r10
   560c1:	cmp    $0x1200,%ebp
   560c7:	jae    567ff <fastgzip_safe::enc::scan::<13, true, false>+0x91f>
   560cd:	and    $0x7,%ebp
   560d0:	mov    $0xffffffff,%r14d
   560d6:	mov    %ebp,%ecx
   560d8:	shl    %cl,%r14d
   560db:	movzbl 0xe08(%rbx,%r11,1),%eax
   560e4:	not    %r14d
   560e7:	and    %eax,%r14d
   560ea:	testl  $0x100,0x90(%rsp)
   560f5:	jne    567a3 <fastgzip_safe::enc::scan::<13, true, false>+0x8c3>
   560fb:	test   %r11,%r11
   560fe:	je     5679f <fastgzip_safe::enc::scan::<13, true, false>+0x8bf>
   56104:	andb   $0xfe,(%r10,%r12,1)
   56109:	jmp    567a3 <fastgzip_safe::enc::scan::<13, true, false>+0x8c3>
   5610e:	movzbl (%r15),%eax
   56112:	mov    (%rbx,%rax,4),%eax
   56115:	movzwl %ax,%edx
   56118:	mov    %ebp,%ecx
   5611a:	shl    %cl,%rdx
   5611d:	or     %r14,%rdx
   56120:	shr    $0x10,%eax
   56123:	add    %ebp,%eax
   56125:	movzwl %r12w,%ecx
   56129:	mov    %rdx,(%r10,%rcx,1)
   5612d:	mov    %eax,%ecx
   5612f:	shr    $0x3,%ecx
   56132:	and    $0x7,%ecx
   56135:	add    %rcx,%r12
   56138:	mov    %eax,%ecx
   5613a:	and    $0x38,%cl
   5613d:	shr    %cl,%rdx
   56140:	and    $0x18007,%eax
   56145:	mov    $0x1,%r10d
   5614b:	mov    %eax,%ebp
   5614d:	mov    %rdx,%r14
   56150:	movzwl %r8w,%eax
   56154:	mov    %rax,0x8(%rsp)
   56159:	movabs $0xb185ebca87000000,%rdx
   56163:	mov    (%r15,%r10,1),%rsi
   56167:	lea    0x9(%rdi),%rax
   5616b:	mov    %rax,0x30(%rsp)
   56170:	imul   %rdx,%rsi
   56174:	shr    $0x33,%rsi
   56178:	mov    %r10,%rdi
   5617b:	cmp    0x8(%rsp),%r10
   56180:	jae    56300 <fastgzip_safe::enc::scan::<13, true, false>+0x420>
   56186:	cs nopw 0x0(%rax,%rax,1)
   56190:	mov    %rdi,%r10
   56193:	mov    (%r15,%rdi,1),%r8
   56197:	movzwl 0x0(%r13,%rsi,2),%r9d
   5619d:	mov    %r10w,0x0(%r13,%rsi,2)
   561a3:	mov    %r8,%rsi
   561a6:	shr    $0x8,%rsi
   561aa:	imul   %rdx,%rsi
   561ae:	shr    $0x33,%rsi
   561b2:	mov    (%r15,%r9,1),%rcx
   561b6:	xor    %r8,%rcx
   561b9:	test   %ecx,%ecx
   561bb:	je     563ae <fastgzip_safe::enc::scan::<13, true, false>+0x4ce>
   561c1:	movzbl %r8b,%eax
   561c5:	mov    (%rbx,%rax,4),%eax
   561c8:	movzwl %ax,%r11d
   561cc:	mov    %ebp,%ecx
   561ce:	shl    %cl,%r11
   561d1:	or     %r14,%r11
   561d4:	shr    $0x10,%eax
   561d7:	add    %ebp,%eax
   561d9:	mov    0x1(%r15,%r10,1),%r8
   561de:	movzwl 0x0(%r13,%rsi,2),%r9d
   561e4:	lea    0x1(%r10),%rdi
   561e8:	mov    %di,0x0(%r13,%rsi,2)
   561ee:	mov    %r8,%rsi
   561f1:	shr    $0x8,%rsi
   561f5:	imul   %rdx,%rsi
   561f9:	shr    $0x33,%rsi
   561fd:	mov    (%r15,%r9,1),%rcx
   56201:	xor    %r8,%rcx
   56204:	test   %ecx,%ecx
   56206:	je     56450 <fastgzip_safe::enc::scan::<13, true, false>+0x570>
   5620c:	movzbl %r8b,%ecx
   56210:	mov    %rdx,%r14
   56213:	mov    (%rbx,%rcx,4),%edx
   56216:	movzwl %dx,%r8d
   5621a:	mov    %eax,%ecx
   5621c:	shl    %cl,%r8
   5621f:	or     %r8,%r11
   56222:	shr    $0x10,%edx
   56225:	add    %eax,%edx
   56227:	mov    0x2(%r15,%r10,1),%r8
   5622c:	movzwl 0x0(%r13,%rsi,2),%r9d
   56232:	inc    %rdi
   56235:	mov    %di,0x0(%r13,%rsi,2)
   5623b:	mov    %r8,%rsi
   5623e:	shr    $0x8,%rsi
   56242:	imul   %r14,%rsi
   56246:	shr    $0x33,%rsi
   5624a:	mov    (%r15,%r9,1),%rcx
   5624e:	xor    %r8,%rcx
   56251:	test   %ecx,%ecx
   56253:	je     56441 <fastgzip_safe::enc::scan::<13, true, false>+0x561>
   56259:	movzbl %r8b,%eax
   5625d:	mov    (%rbx,%rax,4),%eax
   56260:	movzwl %ax,%r8d
   56264:	mov    %edx,%ecx
   56266:	shl    %cl,%r8
   56269:	or     %r8,%r11
   5626c:	shr    $0x10,%eax
   5626f:	add    %edx,%eax
   56271:	mov    0x3(%r15,%r10,1),%r8
   56276:	movzwl 0x0(%r13,%rsi,2),%r9d
   5627c:	inc    %rdi
   5627f:	mov    %di,0x0(%r13,%rsi,2)
   56285:	mov    %r8,%rsi
   56288:	shr    $0x8,%rsi
   5628c:	imul   %r14,%rsi
   56290:	shr    $0x33,%rsi
   56294:	mov    (%r15,%r9,1),%rcx
   56298:	xor    %r8,%rcx
   5629b:	test   %ecx,%ecx
   5629d:	je     56469 <fastgzip_safe::enc::scan::<13, true, false>+0x589>
   562a3:	mov    %r14,%rdx
   562a6:	movzbl %r8b,%ecx
   562aa:	mov    (%rbx,%rcx,4),%ebp
   562ad:	movzwl %bp,%r14d
   562b1:	mov    %eax,%ecx
   562b3:	shl    %cl,%r14
   562b6:	or     %r11,%r14
   562b9:	shr    $0x10,%ebp
   562bc:	add    %eax,%ebp
   562be:	movzwl %r12w,%eax
   562c2:	mov    0x80(%rsp),%rcx
   562ca:	mov    %r14,(%rcx,%rax,1)
   562ce:	mov    %ebp,%eax
   562d0:	shr    $0x3,%eax
   562d3:	and    $0x7,%eax
   562d6:	mov    %ebp,%ecx
   562d8:	and    $0x38,%cl
   562db:	shr    %cl,%r14
   562de:	add    %rax,%r12
   562e1:	and    $0xffff8007,%ebp
   562e7:	inc    %rdi
   562ea:	cmp    0x8(%rsp),%rdi
   562ef:	jb     56190 <fastgzip_safe::enc::scan::<13, true, false>+0x2b0>
   562f5:	add    $0x4,%r10
   562f9:	nopl   0x0(%rax)
   56300:	mov    %r14,%r11
   56303:	mov    %ebp,%eax
   56305:	mov    %r10,%rdi
   56308:	cmp    0x10(%rsp),%r10
   5630d:	jae    56037 <fastgzip_safe::enc::scan::<13, true, false>+0x157>
   56313:	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   56320:	mov    (%r15,%rdi,1),%r8
   56324:	movzwl 0x0(%r13,%rsi,2),%r9d
   5632a:	mov    %di,0x0(%r13,%rsi,2)
   56330:	mov    %r8,%rsi
   56333:	shr    $0x8,%rsi
   56337:	imul   %rdx,%rsi
   5633b:	shr    $0x33,%rsi
   5633f:	mov    (%r15,%r9,1),%rcx
   56343:	xor    %r8,%rcx
   56346:	test   %ecx,%ecx
   56348:	je     56450 <fastgzip_safe::enc::scan::<13, true, false>+0x570>
   5634e:	movzbl %r8b,%ecx
   56352:	mov    (%rbx,%rcx,4),%edx
   56355:	movzwl %dx,%r8d
   56359:	mov    %eax,%ecx
   5635b:	shl    %cl,%r8
   5635e:	or     %r8,%r11
   56361:	shr    $0x10,%edx
   56364:	add    %eax,%edx
   56366:	inc    %rdi
   56369:	movzwl %r12w,%eax
   5636d:	mov    0x80(%rsp),%rcx
   56375:	mov    %r11,(%rcx,%rax,1)
   56379:	mov    %edx,%ecx
   5637b:	mov    %edx,%eax
   5637d:	shr    $0x3,%edx
   56380:	and    $0x38,%cl
   56383:	shr    %cl,%r11
   56386:	and    $0x7,%edx
   56389:	add    %rdx,%r12
   5638c:	movabs $0xb185ebca87000000,%rdx
   56396:	and    $0xffff8007,%eax
   5639b:	mov    0x10(%rsp),%rcx
   563a0:	cmp    %rdi,%rcx
   563a3:	jne    56320 <fastgzip_safe::enc::scan::<13, true, false>+0x440>
   563a9:	jmp    565e5 <fastgzip_safe::enc::scan::<13, true, false>+0x705>
   563ae:	mov    %r10,%rdi
   563b1:	mov    %ebp,%eax
   563b3:	mov    %r14,%r11
   563b6:	test   %rcx,%rcx
   563b9:	jne    56459 <fastgzip_safe::enc::scan::<13, true, false>+0x579>
   563bf:	nop
   563c0:	mov    0x30(%rsp),%rcx
   563c5:	sub    %rdi,%rcx
   563c8:	cmp    $0x102,%rcx
   563cf:	mov    $0x102,%r10d
   563d5:	cmovb  %rcx,%r10
   563d9:	lea    (%r15,%r9,1),%rdx
   563dd:	mov    $0x8,%ebp
   563e2:	cmp    $0x10,%rcx
   563e6:	jb     56411 <fastgzip_safe::enc::scan::<13, true, false>+0x531>
   563e8:	mov    $0x8,%r14d
   563ee:	xchg   %ax,%ax
   563f0:	lea    (%r15,%rdi,1),%rcx
   563f4:	mov    (%rcx,%r14,1),%rbp
   563f8:	mov    (%rdx,%r14,1),%rcx
   563fc:	cmp    %rcx,%rbp
   563ff:	jne    5647a <fastgzip_safe::enc::scan::<13, true, false>+0x59a>
   56401:	lea    0x8(%r14),%rbp
   56405:	add    $0x10,%r14
   56409:	cmp    %r10,%r14
   5640c:	mov    %rbp,%r14
   5640f:	jbe    563f0 <fastgzip_safe::enc::scan::<13, true, false>+0x510>
   56411:	cmp    %r10,%rbp
   56414:	jae    56489 <fastgzip_safe::enc::scan::<13, true, false>+0x5a9>
   56416:	mov    %r10,%r14
   56419:	sub    $0x8,%r14
   5641d:	mov    $0x0,%ecx
   56422:	cmovb  %rcx,%r14
   56426:	lea    (%r15,%rdi,1),%rcx
   5642a:	mov    (%rcx,%r14,1),%rcx
   5642e:	mov    (%rdx,%r14,1),%rdx
   56432:	cmp    %rdx,%rcx
   56435:	je     56489 <fastgzip_safe::enc::scan::<13, true, false>+0x5a9>
   56437:	xor    %rcx,%rdx
   5643a:	tzcnt  %rdx,%r10
   5643f:	jmp    56482 <fastgzip_safe::enc::scan::<13, true, false>+0x5a2>
   56441:	add    $0x2,%r10
   56445:	mov    %r10,%rdi
   56448:	mov    %edx,%eax
   5644a:	nopw   0x0(%rax,%rax,1)
   56450:	test   %rcx,%rcx
   56453:	je     563c0 <fastgzip_safe::enc::scan::<13, true, false>+0x4e0>
   56459:	tzcnt  %rcx,%r10
   5645e:	shr    $0x3,%r10d
   56462:	mov    %r10,0x28(%rsp)
   56467:	jmp    56497 <fastgzip_safe::enc::scan::<13, true, false>+0x5b7>
   56469:	add    $0x3,%r10
   5646d:	mov    %r10,%rdi
   56470:	test   %rcx,%rcx
   56473:	jne    56459 <fastgzip_safe::enc::scan::<13, true, false>+0x579>
   56475:	jmp    563c0 <fastgzip_safe::enc::scan::<13, true, false>+0x4e0>
   5647a:	xor    %rbp,%rcx
   5647d:	tzcnt  %rcx,%r10
   56482:	shr    $0x3,%r10d
   56486:	add    %r14,%r10
   56489:	mov    %r10d,%ecx
   5648c:	and    $0x1ff,%ecx
   56492:	mov    %rcx,0x28(%rsp)
   56497:	not    %r9d
   5649a:	add    %edi,%r9d
   5649d:	mov    $0x3f,%edx
   564a2:	bsr    %r9d,%edx
   564a6:	xor    $0x1f,%edx
   564a9:	mov    $0x1e,%ebp
   564ae:	sub    %edx,%ebp
   564b0:	mov    $0x0,%ecx
   564b5:	cmovb  %ecx,%ebp
   564b8:	mov    %ebp,0x18(%rsp)
   564bc:	mov    $0xffffffff,%r14d
   564c2:	mov    %ebp,%ecx
   564c4:	shl    %cl,%r14d
   564c7:	not    %r14d
   564ca:	and    %r9d,%r14d
   564cd:	mov    $0x1e,%cl
   564cf:	sub    %dl,%cl
   564d1:	movzbl %cl,%ecx
   564d4:	xor    %ebp,%ebp
   564d6:	bt     %ecx,%r9d
   564da:	mov    0x28(%rsp),%rcx
   564df:	mov    0x400(%rbx,%rcx,4),%r9d
   564e7:	setb   %bpl
   564eb:	shl    $0x2,%ebp
   564ee:	lea    0x0(%rbp,%rdx,8),%ecx
   564f2:	mov    0xc04(%rbx,%rcx,1),%ebp
   564f9:	lea    0x1(%rdi),%ecx
   564fc:	mov    %cx,0x0(%r13,%rsi,2)
   56502:	mov    %r9d,%ecx
   56505:	shr    $0x13,%ecx
   56508:	and    $0x1f,%ecx
   5650b:	movzwl %bp,%edx
   5650e:	mov    %ebp,%esi
   56510:	shr    $0x10,%esi
   56513:	and    $0x7ffff,%r9d
   5651a:	add    %ecx,%esi
   5651c:	shl    %cl,%rdx
   5651f:	mov    %esi,%ecx
   56521:	shl    %cl,%r14
   56524:	or     %r9,%rdx
   56527:	or     %rdx,%r14
   5652a:	movzwl %r12w,%ecx
   5652e:	mov    0x80(%rsp),%rdx
   56536:	mov    %r11,(%rdx,%rcx,1)
   5653a:	shr    $0x10,%r8
   5653e:	movabs $0xb185ebca87000000,%r9
   56548:	imul   %r9,%r8
   5654c:	shr    $0x33,%r8
   56550:	lea    0x2(%rdi),%ecx
   56553:	mov    %cx,0x0(%r13,%r8,2)
   56559:	mov    %eax,%edx
   5655b:	mov    %eax,%ecx
   5655d:	and    $0x38,%cl
   56560:	shr    %cl,%r11
   56563:	shr    $0x3,%edx
   56566:	and    $0x7,%edx
   56569:	mov    %eax,%ebp
   5656b:	and    $0x7,%al
   5656d:	mov    %eax,%ecx
   5656f:	shl    %cl,%r14
   56572:	add    %r12,%rdx
   56575:	or     %r11,%r14
   56578:	and    $0xffff8007,%ebp
   5657e:	add    0x18(%rsp),%ebp
   56582:	add    %esi,%ebp
   56584:	movzwl %dx,%eax
   56587:	mov    0x80(%rsp),%rcx
   5658f:	mov    %r14,(%rcx,%rax,1)
   56593:	mov    %ebp,%r12d
   56596:	shr    $0x3,%r12d
   5659a:	and    $0x7,%r12d
   5659e:	mov    %ebp,%ecx
   565a0:	and    $0x38,%cl
   565a3:	shr    %cl,%r14
   565a6:	add    %rdx,%r12
   565a9:	add    %rdi,%r10
   565ac:	and    $0xffff8007,%ebp
   565b2:	cmp    0x10(%rsp),%r10
   565b7:	jae    56037 <fastgzip_safe::enc::scan::<13, true, false>+0x157>
   565bd:	lea    -0x1(%r10),%eax
   565c1:	movzwl %ax,%eax
   565c4:	mov    (%r15,%rax,1),%rsi
   565c8:	mov    %rsi,%rcx
   565cb:	imul   %r9,%rcx
   565cf:	shr    $0x33,%rcx
   565d3:	mov    %ax,0x0(%r13,%rcx,2)
   565d9:	shr    $0x8,%rsi
   565dd:	mov    %r9,%rdx
   565e0:	jmp    56170 <fastgzip_safe::enc::scan::<13, true, false>+0x290>
   565e5:	mov    %r11,%r14
   565e8:	mov    %eax,%ebp
   565ea:	mov    0x80(%rsp),%r10
   565f2:	mov    0x20(%rsp),%rsi
   565f7:	sub    %rcx,%rsi
   565fa:	add    %rcx,%r15
   565fd:	mov    %esi,%r11d
   56600:	and    $0x3,%r11d
   56604:	and    $0xfffc,%rsi
   5660b:	je     566bf <fastgzip_safe::enc::scan::<13, true, false>+0x7df>
   56611:	xor    %edi,%edi
   56613:	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   56620:	movzbl (%r15,%rdi,1),%eax
   56625:	mov    (%rbx,%rax,4),%eax
   56628:	movzwl %ax,%r9d
   5662c:	mov    %ebp,%ecx
   5662e:	shl    %cl,%r9
   56631:	shr    $0x10,%eax
   56634:	add    %ebp,%eax
   56636:	movzbl 0x1(%r15,%rdi,1),%ecx
   5663c:	mov    (%rbx,%rcx,4),%edx
   5663f:	movzwl %dx,%r8d
   56643:	mov    %eax,%ecx
   56645:	shl    %cl,%r8
   56648:	or     %r9,%r14
   5664b:	or     %r14,%r8
   5664e:	shr    $0x10,%edx
   56651:	add    %eax,%edx
   56653:	movzbl 0x2(%r15,%rdi,1),%eax
   56659:	mov    (%rbx,%rax,4),%eax
   5665c:	movzwl %ax,%r9d
   56660:	mov    %edx,%ecx
   56662:	shl    %cl,%r9
   56665:	shr    $0x10,%eax
   56668:	add    %edx,%eax
   5666a:	movzbl 0x3(%r15,%rdi,1),%ecx
   56670:	mov    (%rbx,%rcx,4),%ebp
   56673:	movzwl %bp,%r14d
   56677:	mov    %eax,%ecx
   56679:	shl    %cl,%r14
   5667c:	or     %r8,%r9
   5667f:	or     %r9,%r14
   56682:	shr    $0x10,%ebp
   56685:	add    %eax,%ebp
   56687:	movzwl %r12w,%eax
   5668b:	mov    %r14,(%r10,%rax,1)
   5668f:	mov    %ebp,%edx
   56691:	shr    $0x3,%edx
   56694:	and    $0x7,%edx
   56697:	add    %r12,%rdx
   5669a:	mov    %ebp,%ecx
   5669c:	and    $0x38,%cl
   5669f:	shr    %cl,%r14
   566a2:	and    $0xffff8007,%ebp
   566a8:	add    $0x4,%rdi
   566ac:	mov    %rdx,%r12
   566af:	cmp    %rdi,%rsi
   566b2:	jne    56620 <fastgzip_safe::enc::scan::<13, true, false>+0x740>
   566b8:	test   %r11,%r11
   566bb:	jne    566c7 <fastgzip_safe::enc::scan::<13, true, false>+0x7e7>
   566bd:	jmp    5671f <fastgzip_safe::enc::scan::<13, true, false>+0x83f>
   566bf:	mov    %r12,%rdx
   566c2:	test   %r11,%r11
   566c5:	je     5671f <fastgzip_safe::enc::scan::<13, true, false>+0x83f>
   566c7:	movzbl (%r15,%rsi,1),%eax
   566cc:	mov    (%rbx,%rax,4),%eax
   566cf:	movzwl %ax,%edi
   566d2:	mov    %ebp,%ecx
   566d4:	shl    %cl,%rdi
   566d7:	or     %rdi,%r14
   566da:	shr    $0x10,%eax
   566dd:	add    %ebp,%eax
   566df:	cmp    $0x1,%r11d
   566e3:	je     5671d <fastgzip_safe::enc::scan::<13, true, false>+0x83d>
   566e5:	movzbl 0x1(%r15,%rsi,1),%ecx
   566eb:	mov    (%rbx,%rcx,4),%ebp
   566ee:	movzwl %bp,%edi
   566f1:	mov    %eax,%ecx
   566f3:	shl    %cl,%rdi
   566f6:	or     %rdi,%r14
   566f9:	shr    $0x10,%ebp
   566fc:	add    %eax,%ebp
   566fe:	cmp    $0x2,%r11d
   56702:	je     5671f <fastgzip_safe::enc::scan::<13, true, false>+0x83f>
   56704:	movzbl 0x2(%r15,%rsi,1),%eax
   5670a:	mov    (%rbx,%rax,4),%eax
   5670d:	movzwl %ax,%esi
   56710:	mov    %ebp,%ecx
   56712:	shl    %cl,%rsi
   56715:	or     %rsi,%r14
   56718:	shr    $0x10,%eax
   5671b:	add    %ebp,%eax
   5671d:	mov    %eax,%ebp
   5671f:	movzwl %dx,%eax
   56722:	mov    %r14,(%r10,%rax,1)
   56726:	mov    %ebp,%esi
   56728:	shr    $0x3,%esi
   5672b:	and    $0x7,%esi
   5672e:	add    %rdx,%rsi
   56731:	mov    %ebp,%edx
   56733:	and    $0xffff8007,%edx
   56739:	testl  $0x10000,0x90(%rsp)
   56744:	je     56781 <fastgzip_safe::enc::scan::<13, true, false>+0x8a1>
   56746:	mov    %ebp,%ecx
   56748:	and    $0x38,%cl
   5674b:	shr    %cl,%r14
   5674e:	mov    0xc00(%rbx),%eax
   56754:	movzwl %ax,%edi
   56757:	and    $0x7,%bpl
   5675b:	mov    %ebp,%ecx
   5675d:	shl    %cl,%rdi
   56760:	or     %r14,%rdi
   56763:	shr    $0x10,%eax
   56766:	add    %edx,%eax
   56768:	movzwl %si,%ecx
   5676b:	mov    %rdi,(%r10,%rcx,1)
   5676f:	mov    %eax,%ecx
   56771:	shr    $0x3,%ecx
   56774:	and    $0x7,%ecx
   56777:	add    %rcx,%rsi
   5677a:	and    $0xffff8007,%eax
   5677f:	mov    %eax,%edx
   56781:	xor    %eax,%eax
   56783:	cmp    $0x8,%edx
   56786:	mov    %edx,%ecx
   56788:	lea    (%rcx,%rsi,8),%rcx
   5678c:	cmovb  %rcx,%rax
   56790:	add    $0x38,%rsp
   56794:	pop    %rbx
   56795:	pop    %r12
   56797:	pop    %r13
   56799:	pop    %r14
   5679b:	pop    %r15
   5679d:	pop    %rbp
   5679e:	ret
   5679f:	and    $0xfffffffe,%r14d
   567a3:	add    %r11,%r12
   567a6:	movzwl %di,%edi
   567a9:	cmpb   $0x0,0x78(%rsp)
   567ae:	mov    %rdi,0x10(%rsp)
   567b3:	je     56023 <fastgzip_safe::enc::scan::<13, true, false>+0x143>
   567b9:	jmp    55ff2 <fastgzip_safe::enc::scan::<13, true, false>+0x112>
   567be:	lea    0x68df3(%rip),%rcx        # bf5b8 <anon.8e724d7618661fec6c01ee5922cf9775.29.llvm.6304857328360807621+0x3c0>
   567c5:	mov    $0x10108,%edx
   567ca:	mov    %r10,%rdi
   567cd:	call   *0x6b78d(%rip)        # c1f60 <_DYNAMIC+0x2a0>
   567d3:	lea    0x68e3e(%rip),%rcx        # bf618 <anon.9d8ef70180f99d61d317e85a697ff310.8.llvm.1912574670506489297+0x18>
   567da:	mov    $0x240,%edx
   567df:	xor    %edi,%edi
   567e1:	mov    %r11,%rsi
   567e4:	call   *0x6b776(%rip)        # c1f60 <_DYNAMIC+0x2a0>
   567ea:	lea    0x68e3f(%rip),%rcx        # bf630 <anon.9d8ef70180f99d61d317e85a697ff310.8.llvm.1912574670506489297+0x30>
   567f1:	mov    $0x10080,%edx
   567f6:	mov    %r12,%rdi
   567f9:	call   *0x6b761(%rip)        # c1f60 <_DYNAMIC+0x2a0>
   567ff:	lea    0x68e42(%rip),%rdx        # bf648 <anon.9d8ef70180f99d61d317e85a697ff310.8.llvm.1912574670506489297+0x48>
   56806:	mov    $0x240,%esi
   5680b:	mov    %r11,%rdi
   5680e:	call   *0x6b87c(%rip)        # c2090 <_DYNAMIC+0x3d0>
   56814:	int3
   56815:	int3
   56816:	int3
   56817:	int3
   56818:	int3
   56819:	int3
   5681a:	int3
   5681b:	int3
   5681c:	int3
   5681d:	int3
   5681e:	int3
   5681f:	int3
