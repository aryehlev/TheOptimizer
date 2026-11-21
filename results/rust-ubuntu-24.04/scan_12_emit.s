0000000000040460 <gzhot::enc::scan::<12, true, false>>:
   40460:	push   %rbp
   40461:	push   %r15
   40463:	push   %r14
   40465:	push   %r13
   40467:	push   %r12
   40469:	push   %rbx
   4046a:	sub    $0x38,%rsp
   4046e:	mov    %r9,0x10(%rsp)
   40473:	mov    %r8,%r12
   40476:	mov    %rsi,0x18(%rsp)
   4047b:	mov    %rdi,%r14
   4047e:	mov    0x70(%rsp),%rdi
   40483:	mov    0x890(%r14),%ebp
   4048a:	mov    %ebp,%ebx
   4048c:	shr    $0x3,%ebx
   4048f:	lea    0x894(%r14),%r15
   40496:	cmp    $0x3ff,%rbp
   4049d:	ja     404e7 <gzhot::enc::scan::<12, true, false>+0x87>
   4049f:	movups 0x70(%r15),%xmm0
   404a4:	movups %xmm0,0x70(%rdi)
   404a8:	movups 0x60(%r15),%xmm0
   404ad:	movups %xmm0,0x60(%rdi)
   404b1:	movups 0x50(%r15),%xmm0
   404b6:	movups %xmm0,0x50(%rdi)
   404ba:	movups 0x40(%r15),%xmm0
   404bf:	movups %xmm0,0x40(%rdi)
   404c3:	movups (%r15),%xmm0
   404c7:	movups 0x10(%r15),%xmm1
   404cc:	movups 0x20(%r15),%xmm2
   404d1:	movups 0x30(%r15),%xmm3
   404d6:	movups %xmm3,0x30(%rdi)
   404da:	movups %xmm2,0x20(%rdi)
   404de:	movups %xmm1,0x10(%rdi)
   404e2:	movups %xmm0,(%rdi)
   404e5:	jmp    40504 <gzhot::enc::scan::<12, true, false>+0xa4>
   404e7:	mov    %r15,%rsi
   404ea:	mov    %rbx,%rdx
   404ed:	call   *0x6d8c5(%rip)        # addb8 <memcpy@GLIBC_2.14>
   404f3:	mov    0x70(%rsp),%rdi
   404f8:	cmp    $0x11ff,%ebp
   404fe:	ja     40c4c <gzhot::enc::scan::<12, true, false>+0x7ec>
   40504:	movzbl (%r15,%rbx,1),%eax
   40509:	and    $0x7,%ebp
   4050c:	mov    $0xffffffff,%r13d
   40512:	mov    %ebp,%ecx
   40514:	shl    %cl,%r13d
   40517:	not    %r13d
   4051a:	and    %eax,%r13d
   4051d:	cmpb   $0x0,0x80(%rsp)
   40525:	jne    40535 <gzhot::enc::scan::<12, true, false>+0xd5>
   40527:	test   %rbx,%rbx
   4052a:	je     40531 <gzhot::enc::scan::<12, true, false>+0xd1>
   4052c:	andb   $0xfe,(%rdi)
   4052f:	jmp    40535 <gzhot::enc::scan::<12, true, false>+0xd5>
   40531:	and    $0xfffffffe,%r13d
   40535:	xor    %r15d,%r15d
   40538:	mov    $0x2000,%edx
   4053d:	mov    0x18(%rsp),%rdi
   40542:	xor    %esi,%esi
   40544:	call   *0x6da26(%rip)        # adf70 <memset@GLIBC_2.2.5>
   4054a:	mov    0x10(%rsp),%rax
   4054f:	mov    %rax,%rcx
   40552:	sub    $0x9,%rcx
   40556:	cmovb  %r15,%rcx
   4055a:	sub    $0xc,%rax
   4055e:	cmovb  %r15,%rax
   40562:	mov    %rax,0x30(%rsp)
   40567:	mov    %rcx,0x20(%rsp)
   4056c:	cmp    $0x1,%rcx
   40570:	ja     40666 <gzhot::enc::scan::<12, true, false>+0x206>
   40576:	xor    %edi,%edi
   40578:	mov    0x70(%rsp),%r10
   4057d:	lea    0x4(%r15),%rax
   40581:	mov    0x10(%rsp),%r11
   40586:	cmp    %r11,%rax
   40589:	jbe    405a0 <gzhot::enc::scan::<12, true, false>+0x140>
   4058b:	mov    %r15,%r8
   4058e:	jmp    4063d <gzhot::enc::scan::<12, true, false>+0x1dd>
   40593:	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   405a0:	movzbl (%r12,%r15,1),%eax
   405a5:	mov    (%r14,%rax,4),%edx
   405a9:	movzwl %dx,%eax
   405ac:	mov    %ebp,%ecx
   405ae:	shl    %cl,%rax
   405b1:	or     %rax,%r13
   405b4:	shr    $0x10,%edx
   405b7:	add    %ebp,%edx
   405b9:	movzbl 0x1(%r12,%r15,1),%eax
   405bf:	mov    (%r14,%rax,4),%eax
   405c3:	movzwl %ax,%r8d
   405c7:	mov    %edx,%ecx
   405c9:	shl    %cl,%r8
   405cc:	shr    $0x10,%eax
   405cf:	add    %edx,%eax
   405d1:	movzbl 0x2(%r12,%r15,1),%ecx
   405d7:	mov    (%r14,%rcx,4),%edx
   405db:	movzwl %dx,%r9d
   405df:	mov    %eax,%ecx
   405e1:	shl    %cl,%r9
   405e4:	or     %r13,%r8
   405e7:	mov    %rbx,%rsi
   405ea:	or     %r8,%r9
   405ed:	shr    $0x10,%edx
   405f0:	add    %eax,%edx
   405f2:	movzbl 0x3(%r12,%r15,1),%eax
   405f8:	mov    (%r14,%rax,4),%ebp
   405fc:	movzwl %bp,%r13d
   40600:	mov    %edx,%ecx
   40602:	shl    %cl,%r13
   40605:	or     %r9,%r13
   40608:	shr    $0x10,%ebp
   4060b:	add    %edx,%ebp
   4060d:	mov    %r13,(%r10,%rbx,1)
   40611:	or     %ebp,%edi
   40613:	mov    %ebp,%ebx
   40615:	shr    $0x3,%ebx
   40618:	and    $0x7,%ebx
   4061b:	add    %rsi,%rbx
   4061e:	mov    %ebp,%ecx
   40620:	and    $0x38,%cl
   40623:	shr    %cl,%r13
   40626:	and    $0x7,%ebp
   40629:	lea    0x4(%r15),%r8
   4062d:	add    $0x8,%r15
   40631:	cmp    %r11,%r15
   40634:	mov    %r8,%r15
   40637:	jbe    405a0 <gzhot::enc::scan::<12, true, false>+0x140>
   4063d:	cmp    %r8,%r11
   40640:	jbe    40b64 <gzhot::enc::scan::<12, true, false>+0x704>
   40646:	mov    %r11d,%eax
   40649:	sub    %r8d,%eax
   4064c:	lea    0x1(%r8),%rdx
   40650:	test   $0x1,%al
   40652:	jne    40b6b <gzhot::enc::scan::<12, true, false>+0x70b>
   40658:	cmp    %rdx,%r11
   4065b:	jne    40b91 <gzhot::enc::scan::<12, true, false>+0x731>
   40661:	jmp    40bde <gzhot::enc::scan::<12, true, false>+0x77e>
   40666:	movabs $0xb185ebca87000000,%r8
   40670:	movzbl (%r12),%eax
   40675:	mov    (%r14,%rax,4),%edi
   40679:	movzwl %di,%eax
   4067c:	mov    %ebp,%ecx
   4067e:	shl    %cl,%rax
   40681:	or     %r13,%rax
   40684:	shr    $0x10,%edi
   40687:	add    %ebp,%edi
   40689:	mov    0x70(%rsp),%rcx
   4068e:	mov    %rax,(%rcx,%rbx,1)
   40692:	mov    %edi,%edx
   40694:	shr    $0x3,%edx
   40697:	mov    %edi,%ecx
   40699:	and    $0x38,%cl
   4069c:	shr    %cl,%rax
   4069f:	and    $0x7,%edx
   406a2:	add    %rbx,%rdx
   406a5:	mov    %rdx,0x8(%rsp)
   406aa:	mov    %edi,%ebp
   406ac:	and    $0x7,%ebp
   406af:	mov    0x1(%r12),%r9
   406b4:	mov    $0x1,%r10d
   406ba:	mov    %rax,%r13
   406bd:	mov    0x18(%rsp),%rdx
   406c2:	imul   %r8,%r9
   406c6:	shr    $0x34,%r9
   406ca:	mov    %r10,%r15
   406cd:	cmp    0x30(%rsp),%r10
   406d2:	jae    40870 <gzhot::enc::scan::<12, true, false>+0x410>
   406d8:	nopl   0x0(%rax,%rax,1)
   406e0:	mov    %r12,%r10
   406e3:	mov    %r14,%r12
   406e6:	mov    %r15,%r11
   406e9:	mov    (%r10,%r15,1),%rbx
   406ed:	movzwl (%rdx,%r9,2),%esi
   406f2:	mov    %r11w,(%rdx,%r9,2)
   406f7:	mov    %rbx,%r9
   406fa:	shr    $0x8,%r9
   406fe:	movabs $0xb185ebca87000000,%r14
   40708:	imul   %r14,%r9
   4070c:	shr    $0x34,%r9
   40710:	mov    (%r10,%rsi,1),%rcx
   40714:	xor    %rbx,%rcx
   40717:	test   %ecx,%ecx
   40719:	je     4091f <gzhot::enc::scan::<12, true, false>+0x4bf>
   4071f:	movzbl %bl,%eax
   40722:	mov    (%r12,%rax,4),%eax
   40726:	movzwl %ax,%r8d
   4072a:	mov    %ebp,%ecx
   4072c:	shl    %cl,%r8
   4072f:	or     %r13,%r8
   40732:	shr    $0x10,%eax
   40735:	add    %ebp,%eax
   40737:	mov    0x1(%r10,%r11,1),%rbx
   4073c:	movzwl (%rdx,%r9,2),%esi
   40741:	lea    0x1(%r11),%r15
   40745:	mov    %r15w,(%rdx,%r9,2)
   4074a:	mov    %rbx,%r9
   4074d:	shr    $0x8,%r9
   40751:	imul   %r14,%r9
   40755:	shr    $0x34,%r9
   40759:	mov    (%r10,%rsi,1),%rcx
   4075d:	xor    %rbx,%rcx
   40760:	test   %ecx,%ecx
   40762:	je     40927 <gzhot::enc::scan::<12, true, false>+0x4c7>
   40768:	mov    %r14,%rbp
   4076b:	movzbl %bl,%ecx
   4076e:	mov    %rdx,%r13
   40771:	mov    (%r12,%rcx,4),%edx
   40775:	movzwl %dx,%esi
   40778:	mov    %eax,%ecx
   4077a:	shl    %cl,%rsi
   4077d:	or     %rsi,%r8
   40780:	shr    $0x10,%edx
   40783:	add    %eax,%edx
   40785:	mov    0x2(%r10,%r11,1),%rbx
   4078a:	movzwl 0x0(%r13,%r9,2),%esi
   40790:	inc    %r15
   40793:	mov    %r15w,0x0(%r13,%r9,2)
   40799:	mov    %rbx,%r9
   4079c:	shr    $0x8,%r9
   407a0:	imul   %r14,%r9
   407a4:	shr    $0x34,%r9
   407a8:	mov    (%r10,%rsi,1),%rcx
   407ac:	xor    %rbx,%rcx
   407af:	test   %ecx,%ecx
   407b1:	mov    %r12,%r14
   407b4:	je     40937 <gzhot::enc::scan::<12, true, false>+0x4d7>
   407ba:	movzbl %bl,%eax
   407bd:	mov    (%r14,%rax,4),%eax
   407c1:	movzwl %ax,%esi
   407c4:	mov    %edx,%ecx
   407c6:	shl    %cl,%rsi
   407c9:	or     %rsi,%r8
   407cc:	shr    $0x10,%eax
   407cf:	add    %edx,%eax
   407d1:	mov    %r11,%r12
   407d4:	mov    0x3(%r10,%r11,1),%rbx
   407d9:	movzwl 0x0(%r13,%r9,2),%esi
   407df:	inc    %r15
   407e2:	mov    %r15w,0x0(%r13,%r9,2)
   407e8:	mov    %rbx,%r9
   407eb:	shr    $0x8,%r9
   407ef:	imul   %rbp,%r9
   407f3:	shr    $0x34,%r9
   407f7:	mov    (%r10,%rsi,1),%rcx
   407fb:	xor    %rbx,%rcx
   407fe:	test   %ecx,%ecx
   40800:	mov    %r10,%r11
   40803:	je     40aa5 <gzhot::enc::scan::<12, true, false>+0x645>
   40809:	mov    %r13,%rdx
   4080c:	movzbl %bl,%ecx
   4080f:	mov    (%r14,%rcx,4),%ebp
   40813:	movzwl %bp,%r13d
   40817:	mov    %eax,%ecx
   40819:	shl    %cl,%r13
   4081c:	or     %r8,%r13
   4081f:	shr    $0x10,%ebp
   40822:	add    %eax,%ebp
   40824:	mov    0x70(%rsp),%rax
   40829:	mov    0x8(%rsp),%rsi
   4082e:	mov    %r13,(%rax,%rsi,1)
   40832:	or     %ebp,%edi
   40834:	mov    %ebp,%eax
   40836:	shr    $0x3,%eax
   40839:	and    $0x7,%eax
   4083c:	mov    %ebp,%ecx
   4083e:	and    $0x38,%cl
   40841:	shr    %cl,%r13
   40844:	add    %rax,%rsi
   40847:	mov    %rsi,0x8(%rsp)
   4084c:	and    $0x7,%ebp
   4084f:	inc    %r15
   40852:	cmp    0x30(%rsp),%r15
   40857:	mov    %r12,%r10
   4085a:	mov    %r11,%r12
   4085d:	jb     406e0 <gzhot::enc::scan::<12, true, false>+0x280>
   40863:	add    $0x4,%r10
   40867:	nopw   0x0(%rax,%rax,1)
   40870:	mov    %r10,%r15
   40873:	mov    0x8(%rsp),%r11
   40878:	mov    %r11,%rbx
   4087b:	mov    %r13,%r8
   4087e:	mov    %ebp,%eax
   40880:	cmp    0x20(%rsp),%r10
   40885:	mov    0x70(%rsp),%r10
   4088a:	jae    4057d <gzhot::enc::scan::<12, true, false>+0x11d>
   40890:	mov    (%r12,%r15,1),%rbx
   40894:	movzwl (%rdx,%r9,2),%esi
   40899:	mov    %r15w,(%rdx,%r9,2)
   4089e:	mov    %rbx,%r9
   408a1:	shr    $0x8,%r9
   408a5:	movabs $0xb185ebca87000000,%rcx
   408af:	imul   %rcx,%r9
   408b3:	shr    $0x34,%r9
   408b7:	mov    (%r12,%rsi,1),%rcx
   408bb:	xor    %rbx,%rcx
   408be:	test   %ecx,%ecx
   408c0:	je     40910 <gzhot::enc::scan::<12, true, false>+0x4b0>
   408c2:	movzbl %bl,%ecx
   408c5:	mov    (%r14,%rcx,4),%ebp
   408c9:	movzwl %bp,%r13d
   408cd:	mov    %eax,%ecx
   408cf:	shl    %cl,%r13
   408d2:	or     %r8,%r13
   408d5:	shr    $0x10,%ebp
   408d8:	add    %eax,%ebp
   408da:	inc    %r15
   408dd:	mov    %r13,(%r10,%r11,1)
   408e1:	or     %ebp,%edi
   408e3:	mov    %ebp,%ebx
   408e5:	shr    $0x3,%ebx
   408e8:	and    $0x7,%ebx
   408eb:	add    %r11,%rbx
   408ee:	mov    %ebp,%ecx
   408f0:	and    $0x38,%cl
   408f3:	shr    %cl,%r13
   408f6:	and    $0x7,%ebp
   408f9:	mov    %rbx,%r11
   408fc:	mov    %r13,%r8
   408ff:	mov    %ebp,%eax
   40901:	cmp    0x20(%rsp),%r15
   40906:	jb     40890 <gzhot::enc::scan::<12, true, false>+0x430>
   40908:	jmp    4057d <gzhot::enc::scan::<12, true, false>+0x11d>
   4090d:	nopl   (%rax)
   40910:	mov    %r11,0x8(%rsp)
   40915:	test   %rcx,%rcx
   40918:	jne    40950 <gzhot::enc::scan::<12, true, false>+0x4f0>
   4091a:	jmp    40ac0 <gzhot::enc::scan::<12, true, false>+0x660>
   4091f:	mov    %r11,%r15
   40922:	mov    %ebp,%eax
   40924:	mov    %r13,%r8
   40927:	mov    %r12,%r14
   4092a:	mov    %r10,%r12
   4092d:	test   %rcx,%rcx
   40930:	jne    40950 <gzhot::enc::scan::<12, true, false>+0x4f0>
   40932:	jmp    40ac0 <gzhot::enc::scan::<12, true, false>+0x660>
   40937:	add    $0x2,%r11
   4093b:	mov    %r11,%r15
   4093e:	mov    %edx,%eax
   40940:	mov    %r10,%r12
   40943:	test   %rcx,%rcx
   40946:	je     40ac0 <gzhot::enc::scan::<12, true, false>+0x660>
   4094c:	nopl   0x0(%rax)
   40950:	tzcnt  %rcx,%r10
   40955:	shr    $0x3,%r10d
   40959:	not    %esi
   4095b:	add    %r15d,%esi
   4095e:	mov    $0x3f,%ecx
   40963:	bsr    %esi,%ecx
   40966:	xor    $0x1f,%ecx
   40969:	mov    $0x1e,%ebp
   4096e:	sub    %ecx,%ebp
   40970:	mov    %ebp,%r11d
   40973:	mov    $0x0,%edx
   40978:	cmovb  %edx,%r11d
   4097c:	mov    %esi,%r13d
   4097f:	cmp    $0x2,%esi
   40982:	jb     40996 <gzhot::enc::scan::<12, true, false>+0x536>
   40984:	add    %ecx,%ecx
   40986:	bt     %ebp,%esi
   40989:	mov    $0x0,%r13d
   4098f:	adc    $0x3e,%r13d
   40993:	sub    %ecx,%r13d
   40996:	mov    $0xffffffff,%ebp
   4099b:	mov    %r11d,%ecx
   4099e:	mov    %r11d,0x2c(%rsp)
   409a3:	shl    %cl,%ebp
   409a5:	mov    0x70(%rsp),%rcx
   409aa:	mov    0x8(%rsp),%rdx
   409af:	mov    %r8,(%rcx,%rdx,1)
   409b3:	mov    %eax,%ecx
   409b5:	and    $0x38,%cl
   409b8:	shr    %cl,%r8
   409bb:	mov    %r13d,%ecx
   409be:	not    %ebp
   409c0:	mov    0x400(%r14,%r10,4),%r13d
   409c8:	mov    0x810(%r14,%rcx,4),%r11d
   409d0:	mov    %r13d,%ecx
   409d3:	shr    $0x13,%ecx
   409d6:	and    $0x1f,%ecx
   409d9:	movzwl %r11w,%edx
   409dd:	shl    %cl,%rdx
   409e0:	and    %ebp,%esi
   409e2:	and    $0x7ffff,%r13d
   409e9:	or     %r13,%rdx
   409ec:	mov    %r11d,%ebp
   409ef:	shr    $0x10,%ebp
   409f2:	add    %ecx,%ebp
   409f4:	or     %eax,%edi
   409f6:	mov    %ebp,%ecx
   409f8:	shl    %cl,%rsi
   409fb:	or     %rdx,%rsi
   409fe:	mov    %eax,%r13d
   40a01:	shr    $0x3,%r13d
   40a05:	and    $0x7,%r13d
   40a09:	and    $0x7,%eax
   40a0c:	mov    %eax,%ecx
   40a0e:	shl    %cl,%rsi
   40a11:	add    0x8(%rsp),%r13
   40a16:	or     %r8,%rsi
   40a19:	mov    0x70(%rsp),%rcx
   40a1e:	mov    %rsi,(%rcx,%r13,1)
   40a22:	lea    0x1(%r15),%ecx
   40a26:	mov    0x18(%rsp),%rdx
   40a2b:	mov    %cx,(%rdx,%r9,2)
   40a30:	shr    $0x10,%rbx
   40a34:	movabs $0xb185ebca87000000,%r8
   40a3e:	imul   %r8,%rbx
   40a42:	shr    $0x34,%rbx
   40a46:	lea    0x2(%r15),%ecx
   40a4a:	mov    %cx,(%rdx,%rbx,2)
   40a4e:	add    0x2c(%rsp),%eax
   40a52:	add    %ebp,%eax
   40a54:	mov    %eax,%ebx
   40a56:	shr    $0x3,%ebx
   40a59:	and    $0x7,%ebx
   40a5c:	add    %r13,%rbx
   40a5f:	add    %r15,%r10
   40a62:	mov    %eax,%ecx
   40a64:	and    $0x38,%cl
   40a67:	mov    %rsi,%r13
   40a6a:	shr    %cl,%r13
   40a6d:	or     %eax,%edi
   40a6f:	mov    %eax,%ebp
   40a71:	and    $0x7,%ebp
   40a74:	cmp    0x20(%rsp),%r10
   40a79:	jae    40c44 <gzhot::enc::scan::<12, true, false>+0x7e4>
   40a7f:	mov    %rbx,0x8(%rsp)
   40a84:	lea    -0x1(%r10),%rax
   40a88:	mov    -0x1(%r12,%r10,1),%r9
   40a8d:	mov    %r9,%rcx
   40a90:	imul   %r8,%rcx
   40a94:	shr    $0x34,%rcx
   40a98:	mov    %ax,(%rdx,%rcx,2)
   40a9c:	shr    $0x8,%r9
   40aa0:	jmp    406c2 <gzhot::enc::scan::<12, true, false>+0x262>
   40aa5:	add    $0x3,%r12
   40aa9:	mov    %r12,%r15
   40aac:	mov    %r11,%r12
   40aaf:	test   %rcx,%rcx
   40ab2:	jne    40950 <gzhot::enc::scan::<12, true, false>+0x4f0>
   40ab8:	nopl   0x0(%rax,%rax,1)
   40ac0:	mov    0x10(%rsp),%rdx
   40ac5:	sub    %r15,%rdx
   40ac8:	cmp    $0x102,%rdx
   40acf:	mov    $0x102,%ecx
   40ad4:	cmovb  %rdx,%rcx
   40ad8:	lea    (%r12,%r15,1),%r11
   40adc:	lea    (%r12,%rsi,1),%r13
   40ae0:	mov    $0x8,%r10d
   40ae6:	cmp    $0x10,%rdx
   40aea:	jb     40b1e <gzhot::enc::scan::<12, true, false>+0x6be>
   40aec:	mov    $0x8,%ebp
   40af1:	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   40b00:	mov    (%r11,%rbp,1),%r10
   40b04:	mov    0x0(%r13,%rbp,1),%rdx
   40b09:	cmp    %rdx,%r10
   40b0c:	jne    40b50 <gzhot::enc::scan::<12, true, false>+0x6f0>
   40b0e:	lea    0x8(%rbp),%r10
   40b12:	add    $0x10,%rbp
   40b16:	cmp    %rcx,%rbp
   40b19:	mov    %r10,%rbp
   40b1c:	jbe    40b00 <gzhot::enc::scan::<12, true, false>+0x6a0>
   40b1e:	cmp    %rcx,%r10
   40b21:	jae    40959 <gzhot::enc::scan::<12, true, false>+0x4f9>
   40b27:	nopw   0x0(%rax,%rax,1)
   40b30:	movzbl (%r11,%r10,1),%edx
   40b35:	cmp    0x0(%r13,%r10,1),%dl
   40b3a:	jne    40959 <gzhot::enc::scan::<12, true, false>+0x4f9>
   40b40:	inc    %r10
   40b43:	cmp    %r10,%rcx
   40b46:	jne    40b30 <gzhot::enc::scan::<12, true, false>+0x6d0>
   40b48:	mov    %rcx,%r10
   40b4b:	jmp    40959 <gzhot::enc::scan::<12, true, false>+0x4f9>
   40b50:	xor    %r10,%rdx
   40b53:	tzcnt  %rdx,%r10
   40b58:	shr    $0x3,%r10d
   40b5c:	add    %rbp,%r10
   40b5f:	jmp    40959 <gzhot::enc::scan::<12, true, false>+0x4f9>
   40b64:	mov    %ebp,%eax
   40b66:	mov    %r13,%rsi
   40b69:	jmp    40bde <gzhot::enc::scan::<12, true, false>+0x77e>
   40b6b:	movzbl (%r12,%r8,1),%eax
   40b70:	mov    (%r14,%rax,4),%eax
   40b74:	movzwl %ax,%esi
   40b77:	mov    %ebp,%ecx
   40b79:	shl    %cl,%rsi
   40b7c:	or     %r13,%rsi
   40b7f:	shr    $0x10,%eax
   40b82:	add    %ebp,%eax
   40b84:	mov    %rsi,%r13
   40b87:	mov    %eax,%ebp
   40b89:	mov    %rdx,%r8
   40b8c:	cmp    %rdx,%r11
   40b8f:	je     40bde <gzhot::enc::scan::<12, true, false>+0x77e>
   40b91:	mov    %r13,%rsi
   40b94:	mov    %ebp,%eax
   40b96:	cs nopw 0x0(%rax,%rax,1)
   40ba0:	movzbl (%r12,%r8,1),%ecx
   40ba5:	mov    (%r14,%rcx,4),%edx
   40ba9:	movzwl %dx,%r9d
   40bad:	mov    %eax,%ecx
   40baf:	shl    %cl,%r9
   40bb2:	or     %r9,%rsi
   40bb5:	shr    $0x10,%edx
   40bb8:	add    %eax,%edx
   40bba:	movzbl 0x1(%r12,%r8,1),%eax
   40bc0:	mov    (%r14,%rax,4),%eax
   40bc4:	movzwl %ax,%r9d
   40bc8:	mov    %edx,%ecx
   40bca:	shl    %cl,%r9
   40bcd:	or     %r9,%rsi
   40bd0:	shr    $0x10,%eax
   40bd3:	add    %edx,%eax
   40bd5:	add    $0x2,%r8
   40bd9:	cmp    %r8,%r11
   40bdc:	jne    40ba0 <gzhot::enc::scan::<12, true, false>+0x740>
   40bde:	mov    %rsi,(%r10,%rbx,1)
   40be2:	or     %eax,%edi
   40be4:	mov    %eax,%edx
   40be6:	mov    %eax,%ecx
   40be8:	and    $0x38,%cl
   40beb:	shr    %cl,%rsi
   40bee:	shr    $0x3,%edx
   40bf1:	and    $0x7,%eax
   40bf4:	mov    0x80c(%r14),%r8d
   40bfb:	movzwl %r8w,%r9d
   40bff:	mov    %eax,%ecx
   40c01:	shl    %cl,%r9
   40c04:	and    $0x7,%edx
   40c07:	add    %rbx,%rdx
   40c0a:	or     %rsi,%r9
   40c0d:	shr    $0x10,%r8d
   40c11:	add    %eax,%r8d
   40c14:	mov    %r9,(%r10,%rdx,1)
   40c18:	or     %r8d,%edi
   40c1b:	cmp    $0x3f,%edi
   40c1e:	jbe    40c24 <gzhot::enc::scan::<12, true, false>+0x7c4>
   40c20:	xor    %eax,%eax
   40c22:	jmp    40c35 <gzhot::enc::scan::<12, true, false>+0x7d5>
   40c24:	mov    %r8d,%eax
   40c27:	and    $0x7,%eax
   40c2a:	shr    $0x3,%r8d
   40c2e:	add    %r8,%rdx
   40c31:	lea    (%rax,%rdx,8),%rax
   40c35:	add    $0x38,%rsp
   40c39:	pop    %rbx
   40c3a:	pop    %r12
   40c3c:	pop    %r13
   40c3e:	pop    %r14
   40c40:	pop    %r15
   40c42:	pop    %rbp
   40c43:	ret
   40c44:	mov    %r10,%r15
   40c47:	jmp    40578 <gzhot::enc::scan::<12, true, false>+0x118>
   40c4c:	lea    0x6969d(%rip),%rdx        # aa2f0 <anon.d91998d8fdf8c68441992754ee7655f1.20.llvm.5307011345859626740+0xc8>
   40c53:	mov    $0x240,%esi
   40c58:	mov    %rbx,%rdi
   40c5b:	call   *0x6d317(%rip)        # adf78 <_DYNAMIC+0x400>
   40c61:	int3
   40c62:	int3
   40c63:	int3
   40c64:	int3
   40c65:	int3
   40c66:	int3
   40c67:	int3
   40c68:	int3
   40c69:	int3
   40c6a:	int3
   40c6b:	int3
   40c6c:	int3
   40c6d:	int3
   40c6e:	int3
   40c6f:	int3
