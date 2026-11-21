0000000000041320 <gzhot::enc::scan::<12, true, false>>:
   41320:	push   %rbp
   41321:	push   %r15
   41323:	push   %r14
   41325:	push   %r13
   41327:	push   %r12
   41329:	push   %rbx
   4132a:	sub    $0x28,%rsp
   4132e:	mov    %r9,0x8(%rsp)
   41333:	mov    %r8,%r12
   41336:	mov    %rsi,%r13
   41339:	mov    %rdi,%r14
   4133c:	mov    0x60(%rsp),%rdi
   41341:	mov    0x890(%r14),%ebp
   41348:	mov    %ebp,%ebx
   4134a:	shr    $0x3,%ebx
   4134d:	lea    0x894(%r14),%r15
   41354:	cmp    $0x3ff,%rbp
   4135b:	ja     413a5 <gzhot::enc::scan::<12, true, false>+0x85>
   4135d:	movups 0x70(%r15),%xmm0
   41362:	movups %xmm0,0x70(%rdi)
   41366:	movups 0x60(%r15),%xmm0
   4136b:	movups %xmm0,0x60(%rdi)
   4136f:	movups 0x50(%r15),%xmm0
   41374:	movups %xmm0,0x50(%rdi)
   41378:	movups 0x40(%r15),%xmm0
   4137d:	movups %xmm0,0x40(%rdi)
   41381:	movups (%r15),%xmm0
   41385:	movups 0x10(%r15),%xmm1
   4138a:	movups 0x20(%r15),%xmm2
   4138f:	movups 0x30(%r15),%xmm3
   41394:	movups %xmm3,0x30(%rdi)
   41398:	movups %xmm2,0x20(%rdi)
   4139c:	movups %xmm1,0x10(%rdi)
   413a0:	movups %xmm0,(%rdi)
   413a3:	jmp    413c2 <gzhot::enc::scan::<12, true, false>+0xa2>
   413a5:	mov    %r15,%rsi
   413a8:	mov    %rbx,%rdx
   413ab:	call   *0x6edb7(%rip)        # b0168 <memcpy@GLIBC_2.14>
   413b1:	mov    0x60(%rsp),%rdi
   413b6:	cmp    $0x11ff,%ebp
   413bc:	ja     41e1c <gzhot::enc::scan::<12, true, false>+0xafc>
   413c2:	movzbl (%r15,%rbx,1),%eax
   413c7:	and    $0x7,%ebp
   413ca:	mov    $0xffffffff,%r15d
   413d0:	mov    %ebp,%ecx
   413d2:	shl    %cl,%r15d
   413d5:	not    %r15d
   413d8:	and    %eax,%r15d
   413db:	cmpb   $0x0,0x70(%rsp)
   413e0:	jne    413f0 <gzhot::enc::scan::<12, true, false>+0xd0>
   413e2:	test   %rbx,%rbx
   413e5:	je     413ec <gzhot::enc::scan::<12, true, false>+0xcc>
   413e7:	andb   $0xfe,(%rdi)
   413ea:	jmp    413f0 <gzhot::enc::scan::<12, true, false>+0xd0>
   413ec:	and    $0xfffffffe,%r15d
   413f0:	mov    $0x2000,%edx
   413f5:	mov    %r13,%rdi
   413f8:	xor    %esi,%esi
   413fa:	call   *0x6ef20(%rip)        # b0320 <memset@GLIBC_2.2.5>
   41400:	mov    0x8(%rsp),%rsi
   41405:	mov    %rsi,%rax
   41408:	sub    $0x9,%rax
   4140c:	mov    $0x0,%edx
   41411:	cmovb  %rdx,%rax
   41415:	mov    %rsi,%rcx
   41418:	sub    $0xc,%rcx
   4141c:	cmovb  %rdx,%rcx
   41420:	mov    %rax,0x10(%rsp)
   41425:	cmp    $0x1,%rax
   41429:	ja     41433 <gzhot::enc::scan::<12, true, false>+0x113>
   4142b:	xor    %r11d,%r11d
   4142e:	jmp    41c5e <gzhot::enc::scan::<12, true, false>+0x93e>
   41433:	mov    %rcx,0x20(%rsp)
   41438:	movzbl (%r12),%eax
   4143d:	mov    (%r14,%rax,4),%edx
   41441:	movzwl %dx,%eax
   41444:	mov    %ebp,%ecx
   41446:	shl    %cl,%rax
   41449:	or     %r15,%rax
   4144c:	shr    $0x10,%edx
   4144f:	add    %ebp,%edx
   41451:	mov    0x60(%rsp),%rcx
   41456:	mov    %rax,(%rcx,%rbx,1)
   4145a:	mov    %edx,%r10d
   4145d:	shr    $0x3,%r10d
   41461:	and    $0x7,%r10d
   41465:	mov    %edx,%ecx
   41467:	and    $0x38,%cl
   4146a:	shr    %cl,%rax
   4146d:	add    %rbx,%r10
   41470:	mov    %rsi,%rcx
   41473:	sub    $0x10,%rcx
   41477:	mov    $0x0,%esi
   4147c:	cmovae %rcx,%rsi
   41480:	mov    $0x1,%r11d
   41486:	mov    %rax,%r15
   41489:	mov    %rsi,0x18(%rsp)
   4148e:	mov    %edx,%ebp
   41490:	and    $0xffff8007,%ebp
   41496:	cmp    %rsi,%r11
   41499:	jae    41750 <gzhot::enc::scan::<12, true, false>+0x430>
   4149f:	nop
   414a0:	mov    %r11,%r9
   414a3:	mov    (%r12,%r11,1),%rbx
   414a7:	mov    %rbx,%rax
   414aa:	movabs $0xb185ebca87000000,%rsi
   414b4:	imul   %rsi,%rax
   414b8:	shr    $0x34,%rax
   414bc:	movzwl 0x0(%r13,%rax,2),%edi
   414c2:	mov    %r9w,0x0(%r13,%rax,2)
   414c8:	mov    (%r12,%rdi,1),%rcx
   414cc:	xor    %rbx,%rcx
   414cf:	test   %ecx,%ecx
   414d1:	je     41955 <gzhot::enc::scan::<12, true, false>+0x635>
   414d7:	movzbl %bl,%eax
   414da:	mov    (%r14,%rax,4),%eax
   414de:	movzwl %ax,%r8d
   414e2:	and    $0x7,%dl
   414e5:	mov    %edx,%ecx
   414e7:	shl    %cl,%r8
   414ea:	or     %r15,%r8
   414ed:	shr    $0x10,%eax
   414f0:	add    %ebp,%eax
   414f2:	mov    0x1(%r12,%r9,1),%rbx
   414f7:	mov    %rbx,%rcx
   414fa:	imul   %rsi,%rcx
   414fe:	shr    $0x34,%rcx
   41502:	movzwl 0x0(%r13,%rcx,2),%edi
   41508:	lea    0x1(%r9),%r11
   4150c:	mov    %r11w,0x0(%r13,%rcx,2)
   41512:	mov    (%r12,%rdi,1),%rcx
   41516:	xor    %rbx,%rcx
   41519:	test   %ecx,%ecx
   4151b:	je     41a80 <gzhot::enc::scan::<12, true, false>+0x760>
   41521:	mov    %rsi,%rbp
   41524:	movzbl %bl,%ecx
   41527:	mov    (%r14,%rcx,4),%edx
   4152b:	movzwl %dx,%esi
   4152e:	mov    %eax,%ecx
   41530:	shl    %cl,%rsi
   41533:	or     %rsi,%r8
   41536:	shr    $0x10,%edx
   41539:	add    %eax,%edx
   4153b:	mov    0x2(%r12,%r9,1),%rbx
   41540:	mov    %rbx,%rax
   41543:	imul   %rbp,%rax
   41547:	shr    $0x34,%rax
   4154b:	movzwl 0x0(%r13,%rax,2),%edi
   41551:	inc    %r11
   41554:	mov    %r11w,0x0(%r13,%rax,2)
   4155a:	mov    (%r12,%rdi,1),%rcx
   4155e:	xor    %rbx,%rcx
   41561:	test   %ecx,%ecx
   41563:	je     4195a <gzhot::enc::scan::<12, true, false>+0x63a>
   41569:	movzbl %bl,%eax
   4156c:	mov    (%r14,%rax,4),%eax
   41570:	movzwl %ax,%esi
   41573:	mov    %edx,%ecx
   41575:	shl    %cl,%rsi
   41578:	or     %rsi,%r8
   4157b:	shr    $0x10,%eax
   4157e:	add    %edx,%eax
   41580:	mov    0x3(%r12,%r9,1),%rbx
   41585:	mov    %rbx,%rcx
   41588:	imul   %rbp,%rcx
   4158c:	shr    $0x34,%rcx
   41590:	movzwl 0x0(%r13,%rcx,2),%edi
   41596:	inc    %r11
   41599:	mov    %r11w,0x0(%r13,%rcx,2)
   4159f:	mov    (%r12,%rdi,1),%rcx
   415a3:	xor    %rbx,%rcx
   415a6:	test   %ecx,%ecx
   415a8:	je     41975 <gzhot::enc::scan::<12, true, false>+0x655>
   415ae:	movzbl %bl,%ecx
   415b1:	mov    (%r14,%rcx,4),%edx
   415b5:	movzwl %dx,%r15d
   415b9:	mov    %eax,%ecx
   415bb:	shl    %cl,%r15
   415be:	or     %r8,%r15
   415c1:	shr    $0x10,%edx
   415c4:	add    %eax,%edx
   415c6:	mov    0x60(%rsp),%rax
   415cb:	mov    %r15,(%rax,%r10,1)
   415cf:	mov    %rbp,%rax
   415d2:	mov    %edx,%ebp
   415d4:	shr    $0x3,%ebp
   415d7:	and    $0x7,%ebp
   415da:	add    %r10,%rbp
   415dd:	mov    %rax,%r10
   415e0:	mov    %edx,%ecx
   415e2:	and    $0x38,%cl
   415e5:	shr    %cl,%r15
   415e8:	mov    %edx,%eax
   415ea:	and    $0xffff8007,%eax
   415ef:	mov    0x4(%r12,%r9,1),%rbx
   415f4:	mov    %rbx,%rcx
   415f7:	imul   %r10,%rcx
   415fb:	shr    $0x34,%rcx
   415ff:	movzwl 0x0(%r13,%rcx,2),%edi
   41605:	inc    %r11
   41608:	mov    %r11w,0x0(%r13,%rcx,2)
   4160e:	mov    (%r12,%rdi,1),%rcx
   41612:	xor    %rbx,%rcx
   41615:	test   %ecx,%ecx
   41617:	je     41981 <gzhot::enc::scan::<12, true, false>+0x661>
   4161d:	movzbl %bl,%ecx
   41620:	mov    (%r14,%rcx,4),%esi
   41624:	movzwl %si,%r8d
   41628:	and    $0x7,%dl
   4162b:	mov    %edx,%ecx
   4162d:	shl    %cl,%r8
   41630:	or     %r15,%r8
   41633:	shr    $0x10,%esi
   41636:	add    %eax,%esi
   41638:	mov    0x5(%r12,%r9,1),%rbx
   4163d:	mov    %rbx,%rax
   41640:	imul   %r10,%rax
   41644:	shr    $0x34,%rax
   41648:	movzwl 0x0(%r13,%rax,2),%edi
   4164e:	inc    %r11
   41651:	mov    %r11w,0x0(%r13,%rax,2)
   41657:	mov    (%r12,%rdi,1),%rcx
   4165b:	xor    %rbx,%rcx
   4165e:	test   %ecx,%ecx
   41660:	je     419a1 <gzhot::enc::scan::<12, true, false>+0x681>
   41666:	movzbl %bl,%eax
   41669:	mov    (%r14,%rax,4),%eax
   4166d:	movzwl %ax,%edx
   41670:	mov    %esi,%ecx
   41672:	shl    %cl,%rdx
   41675:	or     %rdx,%r8
   41678:	shr    $0x10,%eax
   4167b:	add    %esi,%eax
   4167d:	mov    0x6(%r12,%r9,1),%rbx
   41682:	mov    %rbx,%rcx
   41685:	imul   %r10,%rcx
   41689:	shr    $0x34,%rcx
   4168d:	movzwl 0x0(%r13,%rcx,2),%edi
   41693:	inc    %r11
   41696:	mov    %r11w,0x0(%r13,%rcx,2)
   4169c:	mov    (%r12,%rdi,1),%rcx
   416a0:	xor    %rbx,%rcx
   416a3:	test   %ecx,%ecx
   416a5:	je     419b3 <gzhot::enc::scan::<12, true, false>+0x693>
   416ab:	movzbl %bl,%ecx
   416ae:	mov    (%r14,%rcx,4),%esi
   416b2:	movzwl %si,%edx
   416b5:	mov    %eax,%ecx
   416b7:	shl    %cl,%rdx
   416ba:	or     %rdx,%r8
   416bd:	shr    $0x10,%esi
   416c0:	add    %eax,%esi
   416c2:	mov    0x7(%r12,%r9,1),%rbx
   416c7:	mov    %rbx,%rax
   416ca:	imul   %r10,%rax
   416ce:	shr    $0x34,%rax
   416d2:	movzwl 0x0(%r13,%rax,2),%edi
   416d8:	inc    %r11
   416db:	mov    %r11w,0x0(%r13,%rax,2)
   416e1:	mov    (%r12,%rdi,1),%rcx
   416e5:	xor    %rbx,%rcx
   416e8:	test   %ecx,%ecx
   416ea:	je     419c2 <gzhot::enc::scan::<12, true, false>+0x6a2>
   416f0:	movzbl %bl,%eax
   416f3:	mov    (%r14,%rax,4),%edx
   416f7:	movzwl %dx,%r15d
   416fb:	mov    %esi,%ecx
   416fd:	shl    %cl,%r15
   41700:	or     %r8,%r15
   41703:	shr    $0x10,%edx
   41706:	add    %esi,%edx
   41708:	mov    0x60(%rsp),%rax
   4170d:	mov    %r15,(%rax,%rbp,1)
   41711:	mov    %edx,%r10d
   41714:	shr    $0x3,%r10d
   41718:	and    $0x7,%r10d
   4171c:	add    %rbp,%r10
   4171f:	mov    %edx,%ecx
   41721:	and    $0x38,%cl
   41724:	shr    %cl,%r15
   41727:	mov    %edx,%ebp
   41729:	and    $0xffff8007,%ebp
   4172f:	inc    %r11
   41732:	cmp    0x18(%rsp),%r11
   41737:	jb     414a0 <gzhot::enc::scan::<12, true, false>+0x180>
   4173d:	add    $0x8,%r9
   41741:	mov    %r9,%r11
   41744:	data16 data16 cs nopw 0x0(%rax,%rax,1)
   41750:	mov    0x20(%rsp),%r9
   41755:	cmp    %r9,%r11
   41758:	jae    418bb <gzhot::enc::scan::<12, true, false>+0x59b>
   4175e:	xchg   %ax,%ax
   41760:	mov    %r11,%rsi
   41763:	mov    (%r12,%r11,1),%rbx
   41767:	mov    %rbx,%rax
   4176a:	movabs $0xb185ebca87000000,%rdx
   41774:	imul   %rdx,%rax
   41778:	shr    $0x34,%rax
   4177c:	movzwl 0x0(%r13,%rax,2),%edi
   41782:	mov    %si,0x0(%r13,%rax,2)
   41788:	mov    (%r12,%rdi,1),%rcx
   4178c:	xor    %rbx,%rcx
   4178f:	test   %ecx,%ecx
   41791:	je     41968 <gzhot::enc::scan::<12, true, false>+0x648>
   41797:	movzbl %bl,%eax
   4179a:	mov    (%r14,%rax,4),%eax
   4179e:	movzwl %ax,%r8d
   417a2:	mov    %ebp,%ecx
   417a4:	and    $0x7,%cl
   417a7:	shl    %cl,%r8
   417aa:	or     %r15,%r8
   417ad:	shr    $0x10,%eax
   417b0:	add    %ebp,%eax
   417b2:	mov    0x1(%r12,%rsi,1),%rbx
   417b7:	mov    %rbx,%rcx
   417ba:	imul   %rdx,%rcx
   417be:	shr    $0x34,%rcx
   417c2:	movzwl 0x0(%r13,%rcx,2),%edi
   417c8:	lea    0x1(%rsi),%r11
   417cc:	mov    %r11w,0x0(%r13,%rcx,2)
   417d2:	mov    (%r12,%rdi,1),%rcx
   417d6:	xor    %rbx,%rcx
   417d9:	test   %ecx,%ecx
   417db:	je     41a80 <gzhot::enc::scan::<12, true, false>+0x760>
   417e1:	mov    %rdx,%r15
   417e4:	movzbl %bl,%ecx
   417e7:	mov    (%r14,%rcx,4),%edx
   417eb:	movzwl %dx,%edi
   417ee:	mov    %eax,%ecx
   417f0:	shl    %cl,%rdi
   417f3:	or     %rdi,%r8
   417f6:	shr    $0x10,%edx
   417f9:	add    %eax,%edx
   417fb:	mov    0x2(%r12,%rsi,1),%rbx
   41800:	mov    %rbx,%rax
   41803:	imul   %r15,%rax
   41807:	shr    $0x34,%rax
   4180b:	movzwl 0x0(%r13,%rax,2),%edi
   41811:	inc    %r11
   41814:	mov    %r11w,0x0(%r13,%rax,2)
   4181a:	mov    (%r12,%rdi,1),%rcx
   4181e:	xor    %rbx,%rcx
   41821:	test   %ecx,%ecx
   41823:	je     41993 <gzhot::enc::scan::<12, true, false>+0x673>
   41829:	movzbl %bl,%eax
   4182c:	mov    (%r14,%rax,4),%eax
   41830:	movzwl %ax,%edi
   41833:	mov    %edx,%ecx
   41835:	shl    %cl,%rdi
   41838:	or     %rdi,%r8
   4183b:	shr    $0x10,%eax
   4183e:	add    %edx,%eax
   41840:	mov    0x3(%r12,%rsi,1),%rbx
   41845:	mov    %rbx,%rcx
   41848:	imul   %r15,%rcx
   4184c:	shr    $0x34,%rcx
   41850:	movzwl 0x0(%r13,%rcx,2),%edi
   41856:	inc    %r11
   41859:	mov    %r11w,0x0(%r13,%rcx,2)
   4185f:	mov    (%r12,%rdi,1),%rcx
   41863:	xor    %rbx,%rcx
   41866:	test   %ecx,%ecx
   41868:	je     419a7 <gzhot::enc::scan::<12, true, false>+0x687>
   4186e:	movzbl %bl,%ecx
   41871:	mov    (%r14,%rcx,4),%ebp
   41875:	movzwl %bp,%r15d
   41879:	mov    %eax,%ecx
   4187b:	shl    %cl,%r15
   4187e:	or     %r8,%r15
   41881:	shr    $0x10,%ebp
   41884:	add    %eax,%ebp
   41886:	mov    0x60(%rsp),%rax
   4188b:	mov    %r15,(%rax,%r10,1)
   4188f:	mov    %ebp,%eax
   41891:	shr    $0x3,%eax
   41894:	and    $0x7,%eax
   41897:	mov    %ebp,%ecx
   41899:	and    $0x38,%cl
   4189c:	shr    %cl,%r15
   4189f:	add    %rax,%r10
   418a2:	and    $0xffff8007,%ebp
   418a8:	inc    %r11
   418ab:	cmp    %r9,%r11
   418ae:	jb     41760 <gzhot::enc::scan::<12, true, false>+0x440>
   418b4:	add    $0x4,%rsi
   418b8:	mov    %rsi,%r11
   418bb:	mov    %r10,%rbx
   418be:	mov    %r15,%r8
   418c1:	mov    %ebp,%eax
   418c3:	cmp    0x10(%rsp),%r11
   418c8:	jae    41c5e <gzhot::enc::scan::<12, true, false>+0x93e>
   418ce:	xchg   %ax,%ax
   418d0:	mov    (%r12,%r11,1),%rbx
   418d4:	mov    %rbx,%rcx
   418d7:	movabs $0xb185ebca87000000,%rdx
   418e1:	imul   %rdx,%rcx
   418e5:	shr    $0x34,%rcx
   418e9:	movzwl 0x0(%r13,%rcx,2),%edi
   418ef:	mov    %r11w,0x0(%r13,%rcx,2)
   418f5:	mov    (%r12,%rdi,1),%rcx
   418f9:	xor    %rbx,%rcx
   418fc:	test   %ecx,%ecx
   418fe:	je     41a80 <gzhot::enc::scan::<12, true, false>+0x760>
   41904:	movzbl %bl,%ecx
   41907:	mov    (%r14,%rcx,4),%ebp
   4190b:	movzwl %bp,%r15d
   4190f:	mov    %eax,%ecx
   41911:	shl    %cl,%r15
   41914:	or     %r8,%r15
   41917:	shr    $0x10,%ebp
   4191a:	add    %eax,%ebp
   4191c:	inc    %r11
   4191f:	mov    0x60(%rsp),%rax
   41924:	mov    %r15,(%rax,%r10,1)
   41928:	mov    %ebp,%ebx
   4192a:	shr    $0x3,%ebx
   4192d:	and    $0x7,%ebx
   41930:	add    %r10,%rbx
   41933:	mov    %ebp,%ecx
   41935:	and    $0x38,%cl
   41938:	shr    %cl,%r15
   4193b:	and    $0xffff8007,%ebp
   41941:	mov    %rbx,%r10
   41944:	mov    %r15,%r8
   41947:	mov    %ebp,%eax
   41949:	cmp    0x10(%rsp),%r11
   4194e:	jb     418d0 <gzhot::enc::scan::<12, true, false>+0x5b0>
   41950:	jmp    41c5e <gzhot::enc::scan::<12, true, false>+0x93e>
   41955:	mov    %r9,%r11
   41958:	jmp    4196b <gzhot::enc::scan::<12, true, false>+0x64b>
   4195a:	add    $0x2,%r9
   4195e:	mov    %r9,%r11
   41961:	mov    %edx,%eax
   41963:	jmp    41a80 <gzhot::enc::scan::<12, true, false>+0x760>
   41968:	mov    %rsi,%r11
   4196b:	mov    %ebp,%eax
   4196d:	mov    %r15,%r8
   41970:	jmp    41a80 <gzhot::enc::scan::<12, true, false>+0x760>
   41975:	add    $0x3,%r9
   41979:	mov    %r9,%r11
   4197c:	jmp    41a80 <gzhot::enc::scan::<12, true, false>+0x760>
   41981:	add    $0x4,%r9
   41985:	mov    %r9,%r11
   41988:	mov    %r15,%r8
   4198b:	mov    %rbp,%r10
   4198e:	jmp    41a80 <gzhot::enc::scan::<12, true, false>+0x760>
   41993:	add    $0x2,%rsi
   41997:	mov    %rsi,%r11
   4199a:	mov    %edx,%eax
   4199c:	jmp    41a80 <gzhot::enc::scan::<12, true, false>+0x760>
   419a1:	add    $0x5,%r9
   419a5:	jmp    419c6 <gzhot::enc::scan::<12, true, false>+0x6a6>
   419a7:	add    $0x3,%rsi
   419ab:	mov    %rsi,%r11
   419ae:	jmp    41a80 <gzhot::enc::scan::<12, true, false>+0x760>
   419b3:	add    $0x6,%r9
   419b7:	mov    %r9,%r11
   419ba:	mov    %rbp,%r10
   419bd:	jmp    41a80 <gzhot::enc::scan::<12, true, false>+0x760>
   419c2:	add    $0x7,%r9
   419c6:	mov    %r9,%r11
   419c9:	mov    %esi,%eax
   419cb:	mov    %rbp,%r10
   419ce:	jmp    41a80 <gzhot::enc::scan::<12, true, false>+0x760>
   419d3:	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   419e0:	mov    0x8(%rsp),%r15
   419e5:	sub    %r11,%r15
   419e8:	cmp    $0x102,%r15
   419ef:	mov    $0x102,%ecx
   419f4:	cmovb  %r15,%rcx
   419f8:	lea    (%r12,%r11,1),%rdx
   419fc:	lea    (%r12,%rdi,1),%rsi
   41a00:	mov    $0x8,%r9d
   41a06:	cmp    $0x10,%r15
   41a0a:	jb     41a3d <gzhot::enc::scan::<12, true, false>+0x71d>
   41a0c:	mov    $0x8,%r15d
   41a12:	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   41a20:	mov    (%rdx,%r15,1),%r9
   41a24:	mov    (%rsi,%r15,1),%rbp
   41a28:	cmp    %rbp,%r9
   41a2b:	jne    41a68 <gzhot::enc::scan::<12, true, false>+0x748>
   41a2d:	lea    0x8(%r15),%r9
   41a31:	add    $0x10,%r15
   41a35:	cmp    %rcx,%r15
   41a38:	mov    %r9,%r15
   41a3b:	jbe    41a20 <gzhot::enc::scan::<12, true, false>+0x700>
   41a3d:	cmp    %rcx,%r9
   41a40:	jae    41a92 <gzhot::enc::scan::<12, true, false>+0x772>
   41a42:	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   41a50:	movzbl (%rdx,%r9,1),%ebp
   41a55:	cmp    (%rsi,%r9,1),%bpl
   41a59:	jne    41a92 <gzhot::enc::scan::<12, true, false>+0x772>
   41a5b:	inc    %r9
   41a5e:	cmp    %r9,%rcx
   41a61:	jne    41a50 <gzhot::enc::scan::<12, true, false>+0x730>
   41a63:	mov    %rcx,%r9
   41a66:	jmp    41a92 <gzhot::enc::scan::<12, true, false>+0x772>
   41a68:	xor    %r9,%rbp
   41a6b:	tzcnt  %rbp,%r9
   41a70:	shr    $0x3,%r9d
   41a74:	add    %r15,%r9
   41a77:	jmp    41a92 <gzhot::enc::scan::<12, true, false>+0x772>
   41a79:	nopl   0x0(%rax)
   41a80:	test   %rcx,%rcx
   41a83:	je     419e0 <gzhot::enc::scan::<12, true, false>+0x6c0>
   41a89:	tzcnt  %rcx,%r9
   41a8e:	shr    $0x3,%r9d
   41a92:	not    %edi
   41a94:	add    %r11d,%edi
   41a97:	mov    $0x3f,%ecx
   41a9c:	bsr    %edi,%ecx
   41a9f:	xor    $0x1f,%ecx
   41aa2:	mov    $0x1e,%ebp
   41aa7:	sub    %ecx,%ebp
   41aa9:	mov    %ebp,%esi
   41aab:	mov    $0x0,%edx
   41ab0:	cmovb  %edx,%esi
   41ab3:	mov    %edi,%edx
   41ab5:	cmp    $0x2,%edi
   41ab8:	jb     41ac9 <gzhot::enc::scan::<12, true, false>+0x7a9>
   41aba:	add    %ecx,%ecx
   41abc:	bt     %ebp,%edi
   41abf:	mov    $0x0,%edx
   41ac4:	adc    $0x3e,%edx
   41ac7:	sub    %ecx,%edx
   41ac9:	mov    $0xffffffff,%ebp
   41ace:	mov    %esi,%ecx
   41ad0:	shl    %cl,%ebp
   41ad2:	mov    %edx,%ecx
   41ad4:	not    %ebp
   41ad6:	and    %ebp,%edi
   41ad8:	mov    0x400(%r14,%r9,4),%r15d
   41ae0:	mov    0x810(%r14,%rcx,4),%edx
   41ae8:	mov    %r15d,%ecx
   41aeb:	shr    $0x13,%ecx
   41aee:	and    $0x1f,%ecx
   41af1:	movzwl %dx,%ebp
   41af4:	shr    $0x10,%edx
   41af7:	shl    %cl,%rbp
   41afa:	add    %ecx,%edx
   41afc:	mov    %edx,%ecx
   41afe:	shl    %cl,%rdi
   41b01:	and    $0x7ffff,%r15d
   41b08:	or     %r15,%rbp
   41b0b:	or     %rbp,%rdi
   41b0e:	add    %esi,%edx
   41b10:	mov    %eax,%ecx
   41b12:	and    $0x3f,%ecx
   41b15:	lea    (%rdx,%rcx,1),%esi
   41b18:	mov    0x60(%rsp),%rbp
   41b1d:	cmp    $0x3f,%esi
   41b20:	jbe    41b49 <gzhot::enc::scan::<12, true, false>+0x829>
   41b22:	mov    %r8,0x0(%rbp,%r10,1)
   41b27:	mov    %eax,%ecx
   41b29:	shr    $0x3,%ecx
   41b2c:	and    $0x7,%ecx
   41b2f:	add    %rcx,%r10
   41b32:	mov    %eax,%ecx
   41b34:	and    $0x38,%cl
   41b37:	shr    %cl,%r8
   41b3a:	mov    %eax,%esi
   41b3c:	and    $0xffff8007,%esi
   41b42:	and    $0x7,%eax
   41b45:	mov    %eax,%ecx
   41b47:	mov    %esi,%eax
   41b49:	mov    %r10,%r15
   41b4c:	shl    %cl,%rdi
   41b4f:	or     %rdi,%r8
   41b52:	mov    %eax,%esi
   41b54:	add    %edx,%esi
   41b56:	mov    %r8,0x0(%rbp,%r10,1)
   41b5b:	mov    %esi,%r10d
   41b5e:	shr    $0x3,%r10d
   41b62:	and    $0x7,%r10d
   41b66:	mov    %esi,%ecx
   41b68:	and    $0x38,%cl
   41b6b:	shr    %cl,%r8
   41b6e:	add    %r15,%r10
   41b71:	mov    %esi,%eax
   41b73:	and    $0xffff8007,%eax
   41b78:	mov    %rbx,%rcx
   41b7b:	shr    $0x8,%rcx
   41b7f:	movabs $0xb185ebca87000000,%rdi
   41b89:	imul   %rdi,%rcx
   41b8d:	shr    $0x34,%rcx
   41b91:	lea    0x1(%r11),%edx
   41b95:	mov    %dx,0x0(%r13,%rcx,2)
   41b9b:	shr    $0x10,%rbx
   41b9f:	imul   %rdi,%rbx
   41ba3:	shr    $0x34,%rbx
   41ba7:	lea    0x2(%r11),%ecx
   41bab:	mov    %cx,0x0(%r13,%rbx,2)
   41bb1:	add    %r9,%r11
   41bb4:	cmp    0x10(%rsp),%r11
   41bb9:	jae    41c56 <gzhot::enc::scan::<12, true, false>+0x936>
   41bbf:	lea    -0x1(%r11),%rcx
   41bc3:	mov    -0x1(%r12,%r11,1),%rdx
   41bc8:	imul   %rdi,%rdx
   41bcc:	shr    $0x34,%rdx
   41bd0:	mov    %cx,0x0(%r13,%rdx,2)
   41bd6:	mov    (%r12,%r11,1),%rbx
   41bda:	mov    %rbx,%rcx
   41bdd:	imul   %rdi,%rcx
   41be1:	shr    $0x34,%rcx
   41be5:	movzwl 0x0(%r13,%rcx,2),%edi
   41beb:	mov    %r11w,0x0(%r13,%rcx,2)
   41bf1:	mov    (%r12,%rdi,1),%rcx
   41bf5:	xor    %rbx,%rcx
   41bf8:	test   %ecx,%ecx
   41bfa:	je     41a80 <gzhot::enc::scan::<12, true, false>+0x760>
   41c00:	movzbl %bl,%ecx
   41c03:	mov    (%r14,%rcx,4),%edx
   41c07:	movzwl %dx,%r15d
   41c0b:	and    $0x7,%sil
   41c0f:	mov    %esi,%ecx
   41c11:	shl    %cl,%r15
   41c14:	or     %r8,%r15
   41c17:	shr    $0x10,%edx
   41c1a:	add    %eax,%edx
   41c1c:	inc    %r11
   41c1f:	mov    0x60(%rsp),%rax
   41c24:	mov    %r15,(%rax,%r10,1)
   41c28:	mov    %edx,%eax
   41c2a:	shr    $0x3,%eax
   41c2d:	and    $0x7,%eax
   41c30:	add    %rax,%r10
   41c33:	mov    %edx,%ecx
   41c35:	and    $0x38,%cl
   41c38:	shr    %cl,%r15
   41c3b:	mov    0x18(%rsp),%rsi
   41c40:	mov    %edx,%ebp
   41c42:	and    $0xffff8007,%ebp
   41c48:	cmp    %rsi,%r11
   41c4b:	jb     414a0 <gzhot::enc::scan::<12, true, false>+0x180>
   41c51:	jmp    41750 <gzhot::enc::scan::<12, true, false>+0x430>
   41c56:	mov    %eax,%ebp
   41c58:	mov    %r8,%r15
   41c5b:	mov    %r10,%rbx
   41c5e:	lea    0x4(%r11),%rax
   41c62:	mov    0x8(%rsp),%r9
   41c67:	cmp    %r9,%rax
   41c6a:	jbe    41c79 <gzhot::enc::scan::<12, true, false>+0x959>
   41c6c:	mov    %r11,%rdi
   41c6f:	mov    0x60(%rsp),%r10
   41c74:	jmp    41d1d <gzhot::enc::scan::<12, true, false>+0x9fd>
   41c79:	mov    0x60(%rsp),%r10
   41c7e:	xchg   %ax,%ax
   41c80:	movzbl (%r12,%r11,1),%eax
   41c85:	mov    (%r14,%rax,4),%eax
   41c89:	movzwl %ax,%esi
   41c8c:	mov    %ebp,%ecx
   41c8e:	shl    %cl,%rsi
   41c91:	shr    $0x10,%eax
   41c94:	add    %ebp,%eax
   41c96:	movzbl 0x1(%r12,%r11,1),%ecx
   41c9c:	mov    (%r14,%rcx,4),%edx
   41ca0:	movzwl %dx,%edi
   41ca3:	mov    %eax,%ecx
   41ca5:	shl    %cl,%rdi
   41ca8:	shr    $0x10,%edx
   41cab:	add    %eax,%edx
   41cad:	movzbl 0x2(%r12,%r11,1),%eax
   41cb3:	mov    (%r14,%rax,4),%eax
   41cb7:	movzwl %ax,%r8d
   41cbb:	mov    %edx,%ecx
   41cbd:	shl    %cl,%r8
   41cc0:	or     %rsi,%r15
   41cc3:	or     %r15,%rdi
   41cc6:	or     %rdi,%r8
   41cc9:	shr    $0x10,%eax
   41ccc:	add    %edx,%eax
   41cce:	movzbl 0x3(%r12,%r11,1),%ecx
   41cd4:	mov    (%r14,%rcx,4),%ebp
   41cd8:	movzwl %bp,%r15d
   41cdc:	mov    %eax,%ecx
   41cde:	shl    %cl,%r15
   41ce1:	mov    %rbx,%rcx
   41ce4:	or     %r8,%r15
   41ce7:	shr    $0x10,%ebp
   41cea:	add    %eax,%ebp
   41cec:	mov    %r15,(%r10,%rbx,1)
   41cf0:	mov    %ebp,%ebx
   41cf2:	shr    $0x3,%ebx
   41cf5:	and    $0x7,%ebx
   41cf8:	add    %rcx,%rbx
   41cfb:	mov    %ebp,%ecx
   41cfd:	and    $0x38,%cl
   41d00:	shr    %cl,%r15
   41d03:	and    $0xffff8007,%ebp
   41d09:	lea    0x4(%r11),%rdi
   41d0d:	add    $0x8,%r11
   41d11:	cmp    %r9,%r11
   41d14:	mov    %rdi,%r11
   41d17:	jbe    41c80 <gzhot::enc::scan::<12, true, false>+0x960>
   41d1d:	cmp    %rdi,%r9
   41d20:	jbe    41d36 <gzhot::enc::scan::<12, true, false>+0xa16>
   41d22:	mov    %r9d,%eax
   41d25:	sub    %edi,%eax
   41d27:	lea    0x1(%rdi),%rdx
   41d2b:	test   $0x1,%al
   41d2d:	jne    41d3d <gzhot::enc::scan::<12, true, false>+0xa1d>
   41d2f:	cmp    %rdx,%r9
   41d32:	jne    41d63 <gzhot::enc::scan::<12, true, false>+0xa43>
   41d34:	jmp    41dae <gzhot::enc::scan::<12, true, false>+0xa8e>
   41d36:	mov    %ebp,%eax
   41d38:	mov    %r15,%rsi
   41d3b:	jmp    41dae <gzhot::enc::scan::<12, true, false>+0xa8e>
   41d3d:	movzbl (%r12,%rdi,1),%eax
   41d42:	mov    (%r14,%rax,4),%eax
   41d46:	movzwl %ax,%esi
   41d49:	mov    %ebp,%ecx
   41d4b:	shl    %cl,%rsi
   41d4e:	or     %r15,%rsi
   41d51:	shr    $0x10,%eax
   41d54:	add    %ebp,%eax
   41d56:	mov    %rsi,%r15
   41d59:	mov    %eax,%ebp
   41d5b:	mov    %rdx,%rdi
   41d5e:	cmp    %rdx,%r9
   41d61:	je     41dae <gzhot::enc::scan::<12, true, false>+0xa8e>
   41d63:	mov    %r15,%rsi
   41d66:	mov    %ebp,%eax
   41d68:	nopl   0x0(%rax,%rax,1)
   41d70:	movzbl (%r12,%rdi,1),%ecx
   41d75:	mov    (%r14,%rcx,4),%edx
   41d79:	movzwl %dx,%r8d
   41d7d:	mov    %eax,%ecx
   41d7f:	shl    %cl,%r8
   41d82:	or     %r8,%rsi
   41d85:	shr    $0x10,%edx
   41d88:	add    %eax,%edx
   41d8a:	movzbl 0x1(%r12,%rdi,1),%eax
   41d90:	mov    (%r14,%rax,4),%eax
   41d94:	movzwl %ax,%r8d
   41d98:	mov    %edx,%ecx
   41d9a:	shl    %cl,%r8
   41d9d:	or     %r8,%rsi
   41da0:	shr    $0x10,%eax
   41da3:	add    %edx,%eax
   41da5:	add    $0x2,%rdi
   41da9:	cmp    %rdi,%r9
   41dac:	jne    41d70 <gzhot::enc::scan::<12, true, false>+0xa50>
   41dae:	mov    %rsi,(%r10,%rbx,1)
   41db2:	mov    %eax,%edx
   41db4:	shr    $0x3,%edx
   41db7:	and    $0x7,%edx
   41dba:	add    %rbx,%rdx
   41dbd:	mov    %eax,%ecx
   41dbf:	and    $0x38,%cl
   41dc2:	shr    %cl,%rsi
   41dc5:	mov    %eax,%r8d
   41dc8:	mov    0x80c(%r14),%edi
   41dcf:	movzwl %di,%r9d
   41dd3:	and    $0x7,%al
   41dd5:	mov    %eax,%ecx
   41dd7:	shl    %cl,%r9
   41dda:	and    $0xffff8007,%r8d
   41de1:	or     %rsi,%r9
   41de4:	shr    $0x10,%edi
   41de7:	add    %r8d,%edi
   41dea:	mov    %r9,(%r10,%rdx,1)
   41dee:	mov    %edi,%eax
   41df0:	and    $0xffff8007,%eax
   41df5:	cmp    $0x3f,%eax
   41df8:	jbe    41dfe <gzhot::enc::scan::<12, true, false>+0xade>
   41dfa:	xor    %eax,%eax
   41dfc:	jmp    41e0d <gzhot::enc::scan::<12, true, false>+0xaed>
   41dfe:	shr    $0x3,%edi
   41e01:	and    $0x7,%edi
   41e04:	add    %rdi,%rdx
   41e07:	mov    %eax,%eax
   41e09:	lea    (%rax,%rdx,8),%rax
   41e0d:	add    $0x28,%rsp
   41e11:	pop    %rbx
   41e12:	pop    %r12
   41e14:	pop    %r13
   41e16:	pop    %r14
   41e18:	pop    %r15
   41e1a:	pop    %rbp
   41e1b:	ret
   41e1c:	lea    0x6a87d(%rip),%rdx        # ac6a0 <anon.d91998d8fdf8c68441992754ee7655f1.20.llvm.5307011345859626740+0xc8>
   41e23:	mov    $0x240,%esi
   41e28:	mov    %rbx,%rdi
   41e2b:	call   *0x6e4f7(%rip)        # b0328 <_DYNAMIC+0x400>
   41e31:	int3
   41e32:	int3
   41e33:	int3
   41e34:	int3
   41e35:	int3
   41e36:	int3
   41e37:	int3
   41e38:	int3
   41e39:	int3
   41e3a:	int3
   41e3b:	int3
   41e3c:	int3
   41e3d:	int3
   41e3e:	int3
   41e3f:	int3
