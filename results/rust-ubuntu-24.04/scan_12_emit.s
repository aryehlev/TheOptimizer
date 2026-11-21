0000000000040450 <gzhot::enc::scan::<12, true, false>>:
   40450:	push   %rbp
   40451:	push   %r15
   40453:	push   %r14
   40455:	push   %r13
   40457:	push   %r12
   40459:	push   %rbx
   4045a:	sub    $0x38,%rsp
   4045e:	mov    %r9,0x10(%rsp)
   40463:	mov    %r8,%r12
   40466:	mov    %rsi,0x18(%rsp)
   4046b:	mov    %rdi,%r14
   4046e:	mov    0x70(%rsp),%rdi
   40473:	mov    0x890(%r14),%ebp
   4047a:	mov    %ebp,%ebx
   4047c:	shr    $0x3,%ebx
   4047f:	lea    0x894(%r14),%r15
   40486:	cmp    $0x3ff,%rbp
   4048d:	ja     404d7 <gzhot::enc::scan::<12, true, false>+0x87>
   4048f:	movups 0x70(%r15),%xmm0
   40494:	movups %xmm0,0x70(%rdi)
   40498:	movups 0x60(%r15),%xmm0
   4049d:	movups %xmm0,0x60(%rdi)
   404a1:	movups 0x50(%r15),%xmm0
   404a6:	movups %xmm0,0x50(%rdi)
   404aa:	movups 0x40(%r15),%xmm0
   404af:	movups %xmm0,0x40(%rdi)
   404b3:	movups (%r15),%xmm0
   404b7:	movups 0x10(%r15),%xmm1
   404bc:	movups 0x20(%r15),%xmm2
   404c1:	movups 0x30(%r15),%xmm3
   404c6:	movups %xmm3,0x30(%rdi)
   404ca:	movups %xmm2,0x20(%rdi)
   404ce:	movups %xmm1,0x10(%rdi)
   404d2:	movups %xmm0,(%rdi)
   404d5:	jmp    404f4 <gzhot::enc::scan::<12, true, false>+0xa4>
   404d7:	mov    %r15,%rsi
   404da:	mov    %rbx,%rdx
   404dd:	call   *0x6d895(%rip)        # add78 <memcpy@GLIBC_2.14>
   404e3:	mov    0x70(%rsp),%rdi
   404e8:	cmp    $0x11ff,%ebp
   404ee:	ja     40c2c <gzhot::enc::scan::<12, true, false>+0x7dc>
   404f4:	movzbl (%r15,%rbx,1),%eax
   404f9:	and    $0x7,%ebp
   404fc:	mov    $0xffffffff,%r13d
   40502:	mov    %ebp,%ecx
   40504:	shl    %cl,%r13d
   40507:	not    %r13d
   4050a:	and    %eax,%r13d
   4050d:	cmpb   $0x0,0x80(%rsp)
   40515:	jne    40525 <gzhot::enc::scan::<12, true, false>+0xd5>
   40517:	test   %rbx,%rbx
   4051a:	je     40521 <gzhot::enc::scan::<12, true, false>+0xd1>
   4051c:	andb   $0xfe,(%rdi)
   4051f:	jmp    40525 <gzhot::enc::scan::<12, true, false>+0xd5>
   40521:	and    $0xfffffffe,%r13d
   40525:	xor    %r15d,%r15d
   40528:	mov    $0x2000,%edx
   4052d:	mov    0x18(%rsp),%rdi
   40532:	xor    %esi,%esi
   40534:	call   *0x6d9f6(%rip)        # adf30 <memset@GLIBC_2.2.5>
   4053a:	mov    0x10(%rsp),%rax
   4053f:	mov    %rax,%rcx
   40542:	sub    $0x9,%rcx
   40546:	cmovb  %r15,%rcx
   4054a:	sub    $0xc,%rax
   4054e:	cmovb  %r15,%rax
   40552:	mov    %rax,0x30(%rsp)
   40557:	mov    %rcx,0x20(%rsp)
   4055c:	cmp    $0x1,%rcx
   40560:	ja     40656 <gzhot::enc::scan::<12, true, false>+0x206>
   40566:	xor    %edi,%edi
   40568:	mov    0x70(%rsp),%r10
   4056d:	lea    0x4(%r15),%rax
   40571:	mov    0x10(%rsp),%r11
   40576:	cmp    %r11,%rax
   40579:	jbe    40590 <gzhot::enc::scan::<12, true, false>+0x140>
   4057b:	mov    %r15,%r8
   4057e:	jmp    4062d <gzhot::enc::scan::<12, true, false>+0x1dd>
   40583:	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   40590:	movzbl (%r12,%r15,1),%eax
   40595:	mov    (%r14,%rax,4),%edx
   40599:	movzwl %dx,%eax
   4059c:	mov    %ebp,%ecx
   4059e:	shl    %cl,%rax
   405a1:	or     %rax,%r13
   405a4:	shr    $0x10,%edx
   405a7:	add    %ebp,%edx
   405a9:	movzbl 0x1(%r12,%r15,1),%eax
   405af:	mov    (%r14,%rax,4),%eax
   405b3:	movzwl %ax,%r8d
   405b7:	mov    %edx,%ecx
   405b9:	shl    %cl,%r8
   405bc:	shr    $0x10,%eax
   405bf:	add    %edx,%eax
   405c1:	movzbl 0x2(%r12,%r15,1),%ecx
   405c7:	mov    (%r14,%rcx,4),%edx
   405cb:	movzwl %dx,%r9d
   405cf:	mov    %eax,%ecx
   405d1:	shl    %cl,%r9
   405d4:	or     %r13,%r8
   405d7:	mov    %rbx,%rsi
   405da:	or     %r8,%r9
   405dd:	shr    $0x10,%edx
   405e0:	add    %eax,%edx
   405e2:	movzbl 0x3(%r12,%r15,1),%eax
   405e8:	mov    (%r14,%rax,4),%ebp
   405ec:	movzwl %bp,%r13d
   405f0:	mov    %edx,%ecx
   405f2:	shl    %cl,%r13
   405f5:	or     %r9,%r13
   405f8:	shr    $0x10,%ebp
   405fb:	add    %edx,%ebp
   405fd:	mov    %r13,(%r10,%rbx,1)
   40601:	mov    %ebp,%ebx
   40603:	shr    $0x3,%ebx
   40606:	mov    %ebp,%ecx
   40608:	and    $0x38,%cl
   4060b:	shr    %cl,%r13
   4060e:	and    $0x7,%ebx
   40611:	add    %rsi,%rbx
   40614:	or     %ebp,%edi
   40616:	and    $0x7,%ebp
   40619:	lea    0x4(%r15),%r8
   4061d:	add    $0x8,%r15
   40621:	cmp    %r11,%r15
   40624:	mov    %r8,%r15
   40627:	jbe    40590 <gzhot::enc::scan::<12, true, false>+0x140>
   4062d:	cmp    %r8,%r11
   40630:	jbe    40b44 <gzhot::enc::scan::<12, true, false>+0x6f4>
   40636:	mov    %r11d,%eax
   40639:	sub    %r8d,%eax
   4063c:	lea    0x1(%r8),%rdx
   40640:	test   $0x1,%al
   40642:	jne    40b4b <gzhot::enc::scan::<12, true, false>+0x6fb>
   40648:	cmp    %rdx,%r11
   4064b:	jne    40b71 <gzhot::enc::scan::<12, true, false>+0x721>
   40651:	jmp    40bbe <gzhot::enc::scan::<12, true, false>+0x76e>
   40656:	movabs $0xb185ebca87000000,%r8
   40660:	movzbl (%r12),%eax
   40665:	mov    (%r14,%rax,4),%edi
   40669:	movzwl %di,%eax
   4066c:	mov    %ebp,%ecx
   4066e:	shl    %cl,%rax
   40671:	or     %r13,%rax
   40674:	shr    $0x10,%edi
   40677:	add    %ebp,%edi
   40679:	mov    0x70(%rsp),%rcx
   4067e:	mov    %rax,(%rcx,%rbx,1)
   40682:	mov    %edi,%edx
   40684:	shr    $0x3,%edx
   40687:	mov    %edi,%ecx
   40689:	and    $0x38,%cl
   4068c:	shr    %cl,%rax
   4068f:	and    $0x7,%edx
   40692:	add    %rbx,%rdx
   40695:	mov    %rdx,0x8(%rsp)
   4069a:	mov    %edi,%ebp
   4069c:	and    $0x7,%ebp
   4069f:	mov    0x1(%r12),%r9
   406a4:	mov    $0x1,%r10d
   406aa:	mov    %rax,%r13
   406ad:	mov    0x18(%rsp),%rdx
   406b2:	imul   %r8,%r9
   406b6:	shr    $0x34,%r9
   406ba:	mov    %r10,%r15
   406bd:	cmp    0x30(%rsp),%r10
   406c2:	jae    40860 <gzhot::enc::scan::<12, true, false>+0x410>
   406c8:	nopl   0x0(%rax,%rax,1)
   406d0:	mov    %r12,%r10
   406d3:	mov    %r14,%r12
   406d6:	mov    %r15,%r11
   406d9:	mov    (%r10,%r15,1),%rbx
   406dd:	movzwl (%rdx,%r9,2),%esi
   406e2:	mov    %r11w,(%rdx,%r9,2)
   406e7:	mov    %rbx,%r9
   406ea:	shr    $0x8,%r9
   406ee:	movabs $0xb185ebca87000000,%r14
   406f8:	imul   %r14,%r9
   406fc:	shr    $0x34,%r9
   40700:	mov    (%r10,%rsi,1),%rcx
   40704:	xor    %rbx,%rcx
   40707:	test   %ecx,%ecx
   40709:	je     4090f <gzhot::enc::scan::<12, true, false>+0x4bf>
   4070f:	movzbl %bl,%eax
   40712:	mov    (%r12,%rax,4),%eax
   40716:	movzwl %ax,%r8d
   4071a:	mov    %ebp,%ecx
   4071c:	shl    %cl,%r8
   4071f:	or     %r13,%r8
   40722:	shr    $0x10,%eax
   40725:	add    %ebp,%eax
   40727:	mov    0x1(%r10,%r11,1),%rbx
   4072c:	movzwl (%rdx,%r9,2),%esi
   40731:	lea    0x1(%r11),%r15
   40735:	mov    %r15w,(%rdx,%r9,2)
   4073a:	mov    %rbx,%r9
   4073d:	shr    $0x8,%r9
   40741:	imul   %r14,%r9
   40745:	shr    $0x34,%r9
   40749:	mov    (%r10,%rsi,1),%rcx
   4074d:	xor    %rbx,%rcx
   40750:	test   %ecx,%ecx
   40752:	je     40917 <gzhot::enc::scan::<12, true, false>+0x4c7>
   40758:	mov    %r14,%rbp
   4075b:	movzbl %bl,%ecx
   4075e:	mov    %rdx,%r13
   40761:	mov    (%r12,%rcx,4),%edx
   40765:	movzwl %dx,%esi
   40768:	mov    %eax,%ecx
   4076a:	shl    %cl,%rsi
   4076d:	or     %rsi,%r8
   40770:	shr    $0x10,%edx
   40773:	add    %eax,%edx
   40775:	mov    0x2(%r10,%r11,1),%rbx
   4077a:	movzwl 0x0(%r13,%r9,2),%esi
   40780:	inc    %r15
   40783:	mov    %r15w,0x0(%r13,%r9,2)
   40789:	mov    %rbx,%r9
   4078c:	shr    $0x8,%r9
   40790:	imul   %r14,%r9
   40794:	shr    $0x34,%r9
   40798:	mov    (%r10,%rsi,1),%rcx
   4079c:	xor    %rbx,%rcx
   4079f:	test   %ecx,%ecx
   407a1:	mov    %r12,%r14
   407a4:	je     40927 <gzhot::enc::scan::<12, true, false>+0x4d7>
   407aa:	movzbl %bl,%eax
   407ad:	mov    (%r14,%rax,4),%eax
   407b1:	movzwl %ax,%esi
   407b4:	mov    %edx,%ecx
   407b6:	shl    %cl,%rsi
   407b9:	or     %rsi,%r8
   407bc:	shr    $0x10,%eax
   407bf:	add    %edx,%eax
   407c1:	mov    %r11,%r12
   407c4:	mov    0x3(%r10,%r11,1),%rbx
   407c9:	movzwl 0x0(%r13,%r9,2),%esi
   407cf:	inc    %r15
   407d2:	mov    %r15w,0x0(%r13,%r9,2)
   407d8:	mov    %rbx,%r9
   407db:	shr    $0x8,%r9
   407df:	imul   %rbp,%r9
   407e3:	shr    $0x34,%r9
   407e7:	mov    (%r10,%rsi,1),%rcx
   407eb:	xor    %rbx,%rcx
   407ee:	test   %ecx,%ecx
   407f0:	mov    %r10,%r11
   407f3:	je     40a8c <gzhot::enc::scan::<12, true, false>+0x63c>
   407f9:	mov    %r13,%rdx
   407fc:	movzbl %bl,%ecx
   407ff:	mov    (%r14,%rcx,4),%ebp
   40803:	movzwl %bp,%r13d
   40807:	mov    %eax,%ecx
   40809:	shl    %cl,%r13
   4080c:	or     %r8,%r13
   4080f:	shr    $0x10,%ebp
   40812:	add    %eax,%ebp
   40814:	mov    0x70(%rsp),%rax
   40819:	mov    0x8(%rsp),%rcx
   4081e:	mov    %r13,(%rax,%rcx,1)
   40822:	mov    %ebp,%eax
   40824:	shr    $0x3,%eax
   40827:	and    $0x7,%eax
   4082a:	add    %rax,%rcx
   4082d:	mov    %rcx,0x8(%rsp)
   40832:	mov    %ebp,%ecx
   40834:	and    $0x38,%cl
   40837:	shr    %cl,%r13
   4083a:	or     %ebp,%edi
   4083c:	and    $0x7,%ebp
   4083f:	inc    %r15
   40842:	cmp    0x30(%rsp),%r15
   40847:	mov    %r12,%r10
   4084a:	mov    %r11,%r12
   4084d:	jb     406d0 <gzhot::enc::scan::<12, true, false>+0x280>
   40853:	add    $0x4,%r10
   40857:	nopw   0x0(%rax,%rax,1)
   40860:	mov    %r10,%r15
   40863:	mov    0x8(%rsp),%r11
   40868:	mov    %r11,%rbx
   4086b:	mov    %r13,%r8
   4086e:	mov    %ebp,%eax
   40870:	cmp    0x20(%rsp),%r10
   40875:	mov    0x70(%rsp),%r10
   4087a:	jae    4056d <gzhot::enc::scan::<12, true, false>+0x11d>
   40880:	mov    (%r12,%r15,1),%rbx
   40884:	movzwl (%rdx,%r9,2),%esi
   40889:	mov    %r15w,(%rdx,%r9,2)
   4088e:	mov    %rbx,%r9
   40891:	shr    $0x8,%r9
   40895:	movabs $0xb185ebca87000000,%rcx
   4089f:	imul   %rcx,%r9
   408a3:	shr    $0x34,%r9
   408a7:	mov    (%r12,%rsi,1),%rcx
   408ab:	xor    %rbx,%rcx
   408ae:	test   %ecx,%ecx
   408b0:	je     40900 <gzhot::enc::scan::<12, true, false>+0x4b0>
   408b2:	movzbl %bl,%ecx
   408b5:	mov    (%r14,%rcx,4),%ebp
   408b9:	movzwl %bp,%r13d
   408bd:	mov    %eax,%ecx
   408bf:	shl    %cl,%r13
   408c2:	or     %r8,%r13
   408c5:	shr    $0x10,%ebp
   408c8:	add    %eax,%ebp
   408ca:	inc    %r15
   408cd:	mov    %r13,(%r10,%r11,1)
   408d1:	mov    %ebp,%ebx
   408d3:	shr    $0x3,%ebx
   408d6:	mov    %ebp,%ecx
   408d8:	and    $0x38,%cl
   408db:	shr    %cl,%r13
   408de:	and    $0x7,%ebx
   408e1:	add    %r11,%rbx
   408e4:	or     %ebp,%edi
   408e6:	and    $0x7,%ebp
   408e9:	mov    %rbx,%r11
   408ec:	mov    %r13,%r8
   408ef:	mov    %ebp,%eax
   408f1:	cmp    0x20(%rsp),%r15
   408f6:	jb     40880 <gzhot::enc::scan::<12, true, false>+0x430>
   408f8:	jmp    4056d <gzhot::enc::scan::<12, true, false>+0x11d>
   408fd:	nopl   (%rax)
   40900:	mov    %r11,0x8(%rsp)
   40905:	test   %rcx,%rcx
   40908:	jne    40940 <gzhot::enc::scan::<12, true, false>+0x4f0>
   4090a:	jmp    40aa0 <gzhot::enc::scan::<12, true, false>+0x650>
   4090f:	mov    %r11,%r15
   40912:	mov    %ebp,%eax
   40914:	mov    %r13,%r8
   40917:	mov    %r12,%r14
   4091a:	mov    %r10,%r12
   4091d:	test   %rcx,%rcx
   40920:	jne    40940 <gzhot::enc::scan::<12, true, false>+0x4f0>
   40922:	jmp    40aa0 <gzhot::enc::scan::<12, true, false>+0x650>
   40927:	add    $0x2,%r11
   4092b:	mov    %r11,%r15
   4092e:	mov    %edx,%eax
   40930:	mov    %r10,%r12
   40933:	test   %rcx,%rcx
   40936:	je     40aa0 <gzhot::enc::scan::<12, true, false>+0x650>
   4093c:	nopl   0x0(%rax)
   40940:	tzcnt  %rcx,%r10
   40945:	shr    $0x3,%r10d
   40949:	not    %esi
   4094b:	add    %r15d,%esi
   4094e:	mov    $0x3f,%ecx
   40953:	bsr    %esi,%ecx
   40956:	xor    $0x1f,%ecx
   40959:	mov    $0x1e,%r13d
   4095f:	sub    %ecx,%r13d
   40962:	mov    %r13d,%r11d
   40965:	mov    $0x0,%edx
   4096a:	cmovb  %edx,%r11d
   4096e:	mov    %esi,%ebp
   40970:	cmp    $0x2,%esi
   40973:	jb     40985 <gzhot::enc::scan::<12, true, false>+0x535>
   40975:	add    %ecx,%ecx
   40977:	bt     %r13d,%esi
   4097b:	mov    $0x0,%ebp
   40980:	adc    $0x3e,%ebp
   40983:	sub    %ecx,%ebp
   40985:	mov    $0xffffffff,%r13d
   4098b:	mov    %r11d,%ecx
   4098e:	mov    %r11d,0x2c(%rsp)
   40993:	shl    %cl,%r13d
   40996:	mov    %ebp,%ecx
   40998:	not    %r13d
   4099b:	and    %r13d,%esi
   4099e:	mov    0x400(%r14,%r10,4),%r13d
   409a6:	mov    0x810(%r14,%rcx,4),%ebp
   409ae:	mov    %r13d,%ecx
   409b1:	shr    $0x13,%ecx
   409b4:	and    $0x1f,%ecx
   409b7:	and    $0x7ffff,%r13d
   409be:	movzwl %bp,%edx
   409c1:	shl    %cl,%rdx
   409c4:	or     %r13,%rdx
   409c7:	shr    $0x10,%ebp
   409ca:	add    %ecx,%ebp
   409cc:	mov    %ebp,%ecx
   409ce:	shl    %cl,%rsi
   409d1:	or     %rdx,%rsi
   409d4:	mov    0x70(%rsp),%r11
   409d9:	mov    0x8(%rsp),%rdx
   409de:	mov    %r8,(%r11,%rdx,1)
   409e2:	mov    %eax,%r13d
   409e5:	mov    %eax,%ecx
   409e7:	and    $0x38,%cl
   409ea:	shr    %cl,%r8
   409ed:	shr    $0x3,%r13d
   409f1:	and    $0x7,%r13d
   409f5:	or     %eax,%edi
   409f7:	and    $0x7,%eax
   409fa:	mov    %eax,%ecx
   409fc:	shl    %cl,%rsi
   409ff:	add    %rdx,%r13
   40a02:	or     %r8,%rsi
   40a05:	mov    %rsi,(%r11,%r13,1)
   40a09:	lea    0x1(%r15),%ecx
   40a0d:	mov    0x18(%rsp),%rdx
   40a12:	mov    %cx,(%rdx,%r9,2)
   40a17:	shr    $0x10,%rbx
   40a1b:	movabs $0xb185ebca87000000,%r8
   40a25:	imul   %r8,%rbx
   40a29:	shr    $0x34,%rbx
   40a2d:	lea    0x2(%r15),%ecx
   40a31:	mov    %cx,(%rdx,%rbx,2)
   40a35:	add    0x2c(%rsp),%eax
   40a39:	add    %ebp,%eax
   40a3b:	mov    %eax,%ebx
   40a3d:	shr    $0x3,%ebx
   40a40:	and    $0x7,%ebx
   40a43:	add    %r13,%rbx
   40a46:	add    %r15,%r10
   40a49:	mov    %eax,%ecx
   40a4b:	and    $0x38,%cl
   40a4e:	mov    %rsi,%r13
   40a51:	shr    %cl,%r13
   40a54:	or     %eax,%edi
   40a56:	mov    %eax,%ebp
   40a58:	and    $0x7,%ebp
   40a5b:	cmp    0x20(%rsp),%r10
   40a60:	jae    40c24 <gzhot::enc::scan::<12, true, false>+0x7d4>
   40a66:	mov    %rbx,0x8(%rsp)
   40a6b:	lea    -0x1(%r10),%rax
   40a6f:	mov    -0x1(%r12,%r10,1),%r9
   40a74:	mov    %r9,%rcx
   40a77:	imul   %r8,%rcx
   40a7b:	shr    $0x34,%rcx
   40a7f:	mov    %ax,(%rdx,%rcx,2)
   40a83:	shr    $0x8,%r9
   40a87:	jmp    406b2 <gzhot::enc::scan::<12, true, false>+0x262>
   40a8c:	add    $0x3,%r12
   40a90:	mov    %r12,%r15
   40a93:	mov    %r11,%r12
   40a96:	test   %rcx,%rcx
   40a99:	jne    40940 <gzhot::enc::scan::<12, true, false>+0x4f0>
   40a9f:	nop
   40aa0:	mov    0x10(%rsp),%rdx
   40aa5:	sub    %r15,%rdx
   40aa8:	cmp    $0x102,%rdx
   40aaf:	mov    $0x102,%ecx
   40ab4:	cmovb  %rdx,%rcx
   40ab8:	lea    (%r12,%r15,1),%r11
   40abc:	lea    (%r12,%rsi,1),%r13
   40ac0:	mov    $0x8,%r10d
   40ac6:	cmp    $0x10,%rdx
   40aca:	jb     40afe <gzhot::enc::scan::<12, true, false>+0x6ae>
   40acc:	mov    $0x8,%ebp
   40ad1:	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   40ae0:	mov    (%r11,%rbp,1),%r10
   40ae4:	mov    0x0(%r13,%rbp,1),%rdx
   40ae9:	cmp    %rdx,%r10
   40aec:	jne    40b30 <gzhot::enc::scan::<12, true, false>+0x6e0>
   40aee:	lea    0x8(%rbp),%r10
   40af2:	add    $0x10,%rbp
   40af6:	cmp    %rcx,%rbp
   40af9:	mov    %r10,%rbp
   40afc:	jbe    40ae0 <gzhot::enc::scan::<12, true, false>+0x690>
   40afe:	cmp    %rcx,%r10
   40b01:	jae    40949 <gzhot::enc::scan::<12, true, false>+0x4f9>
   40b07:	nopw   0x0(%rax,%rax,1)
   40b10:	movzbl (%r11,%r10,1),%edx
   40b15:	cmp    0x0(%r13,%r10,1),%dl
   40b1a:	jne    40949 <gzhot::enc::scan::<12, true, false>+0x4f9>
   40b20:	inc    %r10
   40b23:	cmp    %r10,%rcx
   40b26:	jne    40b10 <gzhot::enc::scan::<12, true, false>+0x6c0>
   40b28:	mov    %rcx,%r10
   40b2b:	jmp    40949 <gzhot::enc::scan::<12, true, false>+0x4f9>
   40b30:	xor    %r10,%rdx
   40b33:	tzcnt  %rdx,%r10
   40b38:	shr    $0x3,%r10d
   40b3c:	add    %rbp,%r10
   40b3f:	jmp    40949 <gzhot::enc::scan::<12, true, false>+0x4f9>
   40b44:	mov    %ebp,%eax
   40b46:	mov    %r13,%rsi
   40b49:	jmp    40bbe <gzhot::enc::scan::<12, true, false>+0x76e>
   40b4b:	movzbl (%r12,%r8,1),%eax
   40b50:	mov    (%r14,%rax,4),%eax
   40b54:	movzwl %ax,%esi
   40b57:	mov    %ebp,%ecx
   40b59:	shl    %cl,%rsi
   40b5c:	or     %r13,%rsi
   40b5f:	shr    $0x10,%eax
   40b62:	add    %ebp,%eax
   40b64:	mov    %rsi,%r13
   40b67:	mov    %eax,%ebp
   40b69:	mov    %rdx,%r8
   40b6c:	cmp    %rdx,%r11
   40b6f:	je     40bbe <gzhot::enc::scan::<12, true, false>+0x76e>
   40b71:	mov    %r13,%rsi
   40b74:	mov    %ebp,%eax
   40b76:	cs nopw 0x0(%rax,%rax,1)
   40b80:	movzbl (%r12,%r8,1),%ecx
   40b85:	mov    (%r14,%rcx,4),%edx
   40b89:	movzwl %dx,%r9d
   40b8d:	mov    %eax,%ecx
   40b8f:	shl    %cl,%r9
   40b92:	or     %r9,%rsi
   40b95:	shr    $0x10,%edx
   40b98:	add    %eax,%edx
   40b9a:	movzbl 0x1(%r12,%r8,1),%eax
   40ba0:	mov    (%r14,%rax,4),%eax
   40ba4:	movzwl %ax,%r9d
   40ba8:	mov    %edx,%ecx
   40baa:	shl    %cl,%r9
   40bad:	or     %r9,%rsi
   40bb0:	shr    $0x10,%eax
   40bb3:	add    %edx,%eax
   40bb5:	add    $0x2,%r8
   40bb9:	cmp    %r8,%r11
   40bbc:	jne    40b80 <gzhot::enc::scan::<12, true, false>+0x730>
   40bbe:	mov    %rsi,(%r10,%rbx,1)
   40bc2:	mov    %eax,%edx
   40bc4:	shr    $0x3,%edx
   40bc7:	mov    %eax,%ecx
   40bc9:	and    $0x38,%cl
   40bcc:	shr    %cl,%rsi
   40bcf:	or     %eax,%edi
   40bd1:	and    $0x7,%eax
   40bd4:	mov    0x80c(%r14),%r8d
   40bdb:	movzwl %r8w,%r9d
   40bdf:	mov    %eax,%ecx
   40be1:	shl    %cl,%r9
   40be4:	and    $0x7,%edx
   40be7:	add    %rbx,%rdx
   40bea:	or     %rsi,%r9
   40bed:	shr    $0x10,%r8d
   40bf1:	add    %eax,%r8d
   40bf4:	mov    %r9,(%r10,%rdx,1)
   40bf8:	or     %r8d,%edi
   40bfb:	cmp    $0x3f,%edi
   40bfe:	jbe    40c04 <gzhot::enc::scan::<12, true, false>+0x7b4>
   40c00:	xor    %eax,%eax
   40c02:	jmp    40c15 <gzhot::enc::scan::<12, true, false>+0x7c5>
   40c04:	mov    %r8d,%eax
   40c07:	and    $0x7,%eax
   40c0a:	shr    $0x3,%r8d
   40c0e:	add    %r8,%rdx
   40c11:	lea    (%rax,%rdx,8),%rax
   40c15:	add    $0x38,%rsp
   40c19:	pop    %rbx
   40c1a:	pop    %r12
   40c1c:	pop    %r13
   40c1e:	pop    %r14
   40c20:	pop    %r15
   40c22:	pop    %rbp
   40c23:	ret
   40c24:	mov    %r10,%r15
   40c27:	jmp    40568 <gzhot::enc::scan::<12, true, false>+0x118>
   40c2c:	lea    0x6967d(%rip),%rdx        # aa2b0 <anon.d91998d8fdf8c68441992754ee7655f1.20.llvm.5307011345859626740+0xc8>
   40c33:	mov    $0x240,%esi
   40c38:	mov    %rbx,%rdi
   40c3b:	call   *0x6d2f7(%rip)        # adf38 <_DYNAMIC+0x400>
   40c41:	int3
   40c42:	int3
   40c43:	int3
   40c44:	int3
   40c45:	int3
   40c46:	int3
   40c47:	int3
   40c48:	int3
   40c49:	int3
   40c4a:	int3
   40c4b:	int3
   40c4c:	int3
   40c4d:	int3
   40c4e:	int3
   40c4f:	int3
