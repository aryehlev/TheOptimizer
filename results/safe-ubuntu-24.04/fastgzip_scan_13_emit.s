0000000000062570 <fastgzip::enc::scan::<13, true, false>>:
   62570:	push   %rbp
   62571:	push   %r15
   62573:	push   %r14
   62575:	push   %r13
   62577:	push   %r12
   62579:	push   %rbx
   6257a:	sub    $0x28,%rsp
   6257e:	mov    %r8,%r13
   62581:	mov    %rdi,%r14
   62584:	mov    0x80(%rsp),%r12
   6258c:	mov    0x70(%rsp),%rdi
   62591:	bt     $0x20,%r12
   62596:	mov    %r9,0x10(%rsp)
   6259b:	mov    %rsi,0x8(%rsp)
   625a0:	jb     625d0 <fastgzip::enc::scan::<13, true, false>+0x60>
   625a2:	movzbl (%rdi),%eax
   625a5:	mov    $0xffffffffffffffff,%rbp
   625ac:	mov    %r12d,%ecx
   625af:	shl    %cl,%rbp
   625b2:	not    %ebp
   625b4:	and    %eax,%ebp
   625b6:	xor    %ebx,%ebx
   625b8:	mov    %r12,%r15
   625bb:	mov    0x60(%rsp),%r12
   625c0:	cmpb   $0x0,0x68(%rsp)
   625c5:	jne    62690 <fastgzip::enc::scan::<13, true, false>+0x120>
   625cb:	jmp    626af <fastgzip::enc::scan::<13, true, false>+0x13f>
   625d0:	mov    0x890(%r14),%r15d
   625d7:	mov    %r15d,%ebx
   625da:	shr    $0x3,%ebx
   625dd:	lea    0x894(%r14),%rax
   625e4:	cmp    $0x3ff,%r15
   625eb:	ja     6262d <fastgzip::enc::scan::<13, true, false>+0xbd>
   625ed:	movups 0x70(%rax),%xmm0
   625f1:	movups %xmm0,0x70(%rdi)
   625f5:	movups 0x60(%rax),%xmm0
   625f9:	movups %xmm0,0x60(%rdi)
   625fd:	movups 0x50(%rax),%xmm0
   62601:	movups %xmm0,0x50(%rdi)
   62605:	movups 0x40(%rax),%xmm0
   62609:	movups %xmm0,0x40(%rdi)
   6260d:	movups (%rax),%xmm0
   62610:	movups 0x10(%rax),%xmm1
   62614:	movups 0x20(%rax),%xmm2
   62618:	movups 0x30(%rax),%xmm3
   6261c:	movups %xmm3,0x30(%rdi)
   62620:	movups %xmm2,0x20(%rdi)
   62624:	movups %xmm1,0x10(%rdi)
   62628:	movups %xmm0,(%rdi)
   6262b:	jmp    6265b <fastgzip::enc::scan::<13, true, false>+0xeb>
   6262d:	mov    %rax,%rsi
   62630:	mov    %rbx,%rdx
   62633:	mov    %rax,%rbp
   62636:	call   *0x5f654(%rip)        # c1c90 <memcpy@GLIBC_2.14>
   6263c:	mov    %rbp,%rax
   6263f:	mov    0x8(%rsp),%rsi
   62644:	mov    0x10(%rsp),%r9
   62649:	mov    0x70(%rsp),%rdi
   6264e:	cmp    $0x11ff,%r15d
   62655:	ja     62dec <fastgzip::enc::scan::<13, true, false>+0x87c>
   6265b:	and    $0x7,%r15d
   6265f:	mov    $0xffffffff,%ebp
   62664:	mov    %r15d,%ecx
   62667:	shl    %cl,%ebp
   62669:	movzbl (%rax,%rbx,1),%eax
   6266d:	not    %ebp
   6266f:	and    %eax,%ebp
   62671:	bt     $0x28,%r12
   62676:	jb     62684 <fastgzip::enc::scan::<13, true, false>+0x114>
   62678:	test   %rbx,%rbx
   6267b:	je     62dc3 <fastgzip::enc::scan::<13, true, false>+0x853>
   62681:	andb   $0xfe,(%rdi)
   62684:	mov    0x60(%rsp),%r12
   62689:	cmpb   $0x0,0x68(%rsp)
   6268e:	je     626af <fastgzip::enc::scan::<13, true, false>+0x13f>
   62690:	mov    $0x4000,%edx
   62695:	mov    %rsi,%rdi
   62698:	xor    %esi,%esi
   6269a:	call   *0x5f798(%rip)        # c1e38 <memset@GLIBC_2.2.5>
   626a0:	mov    0x8(%rsp),%rsi
   626a5:	mov    0x10(%rsp),%r9
   626aa:	mov    0x70(%rsp),%rdi
   626af:	xor    %eax,%eax
   626b1:	mov    %r9,%r8
   626b4:	sub    $0x9,%r8
   626b8:	cmovb  %rax,%r8
   626bc:	sub    $0xc,%r9
   626c0:	cmovb  %rax,%r9
   626c4:	mov    %r9,0x20(%rsp)
   626c9:	test   %r12,%r12
   626cc:	je     626d8 <fastgzip::enc::scan::<13, true, false>+0x168>
   626ce:	cmp    %r8,%r12
   626d1:	jae    626e5 <fastgzip::enc::scan::<13, true, false>+0x175>
   626d3:	jmp    6291c <fastgzip::enc::scan::<13, true, false>+0x3ac>
   626d8:	cmp    $0x2,%r8
   626dc:	jae    628d9 <fastgzip::enc::scan::<13, true, false>+0x369>
   626e2:	xor    %r12d,%r12d
   626e5:	lea    0x4(%r12),%rax
   626ea:	mov    0x10(%rsp),%r11
   626ef:	cmp    %r11,%rax
   626f2:	jbe    62701 <fastgzip::enc::scan::<13, true, false>+0x191>
   626f4:	mov    %r12,%rdi
   626f7:	mov    0x70(%rsp),%r10
   626fc:	jmp    627b6 <fastgzip::enc::scan::<13, true, false>+0x246>
   62701:	mov    0x70(%rsp),%r10
   62706:	cs nopw 0x0(%rax,%rax,1)
   62710:	movzbl 0x0(%r13,%r12,1),%eax
   62716:	mov    (%r14,%rax,4),%eax
   6271a:	movzwl %ax,%esi
   6271d:	mov    %r15d,%ecx
   62720:	shl    %cl,%rsi
   62723:	shr    $0x10,%eax
   62726:	add    %r15d,%eax
   62729:	movzbl 0x1(%r13,%r12,1),%ecx
   6272f:	mov    (%r14,%rcx,4),%edx
   62733:	movzwl %dx,%edi
   62736:	mov    %eax,%ecx
   62738:	shl    %cl,%rdi
   6273b:	shr    $0x10,%edx
   6273e:	add    %eax,%edx
   62740:	movzbl 0x2(%r13,%r12,1),%eax
   62746:	mov    (%r14,%rax,4),%eax
   6274a:	movzwl %ax,%r8d
   6274e:	mov    %edx,%ecx
   62750:	shl    %cl,%r8
   62753:	or     %rsi,%rbp
   62756:	or     %rbp,%rdi
   62759:	or     %rdi,%r8
   6275c:	shr    $0x10,%eax
   6275f:	add    %edx,%eax
   62761:	movzbl 0x3(%r13,%r12,1),%ecx
   62767:	mov    (%r14,%rcx,4),%r15d
   6276b:	movzwl %r15w,%ebp
   6276f:	mov    %eax,%ecx
   62771:	shl    %cl,%rbp
   62774:	mov    %rbx,%rcx
   62777:	or     %r8,%rbp
   6277a:	shr    $0x10,%r15d
   6277e:	add    %eax,%r15d
   62781:	mov    %rbp,(%r10,%rbx,1)
   62785:	mov    %r15d,%ebx
   62788:	shr    $0x3,%ebx
   6278b:	and    $0x7,%ebx
   6278e:	add    %rcx,%rbx
   62791:	mov    %r15d,%ecx
   62794:	and    $0x38,%cl
   62797:	shr    %cl,%rbp
   6279a:	and    $0xffff8007,%r15d
   627a1:	lea    0x4(%r12),%rdi
   627a6:	add    $0x8,%r12
   627aa:	cmp    %r11,%r12
   627ad:	mov    %rdi,%r12
   627b0:	jbe    62710 <fastgzip::enc::scan::<13, true, false>+0x1a0>
   627b6:	cmp    %rdi,%r11
   627b9:	jbe    627da <fastgzip::enc::scan::<13, true, false>+0x26a>
   627bb:	mov    %r11d,%eax
   627be:	sub    %edi,%eax
   627c0:	lea    0x1(%rdi),%rdx
   627c4:	test   $0x1,%al
   627c6:	mov    0x80(%rsp),%r9
   627ce:	jne    627ea <fastgzip::enc::scan::<13, true, false>+0x27a>
   627d0:	cmp    %rdx,%r11
   627d3:	jne    62814 <fastgzip::enc::scan::<13, true, false>+0x2a4>
   627d5:	jmp    6285f <fastgzip::enc::scan::<13, true, false>+0x2ef>
   627da:	mov    %r15d,%eax
   627dd:	mov    %rbp,%rsi
   627e0:	mov    0x80(%rsp),%r9
   627e8:	jmp    6285f <fastgzip::enc::scan::<13, true, false>+0x2ef>
   627ea:	movzbl 0x0(%r13,%rdi,1),%eax
   627f0:	mov    (%r14,%rax,4),%eax
   627f4:	movzwl %ax,%esi
   627f7:	mov    %r15d,%ecx
   627fa:	shl    %cl,%rsi
   627fd:	or     %rbp,%rsi
   62800:	shr    $0x10,%eax
   62803:	add    %r15d,%eax
   62806:	mov    %rdx,%rdi
   62809:	mov    %rsi,%rbp
   6280c:	mov    %eax,%r15d
   6280f:	cmp    %rdx,%r11
   62812:	je     6285f <fastgzip::enc::scan::<13, true, false>+0x2ef>
   62814:	mov    %rbp,%rsi
   62817:	mov    %r15d,%eax
   6281a:	nopw   0x0(%rax,%rax,1)
   62820:	movzbl 0x0(%r13,%rdi,1),%ecx
   62826:	mov    (%r14,%rcx,4),%edx
   6282a:	movzwl %dx,%r8d
   6282e:	mov    %eax,%ecx
   62830:	shl    %cl,%r8
   62833:	or     %r8,%rsi
   62836:	shr    $0x10,%edx
   62839:	add    %eax,%edx
   6283b:	movzbl 0x1(%r13,%rdi,1),%eax
   62841:	mov    (%r14,%rax,4),%eax
   62845:	movzwl %ax,%r8d
   62849:	mov    %edx,%ecx
   6284b:	shl    %cl,%r8
   6284e:	or     %r8,%rsi
   62851:	shr    $0x10,%eax
   62854:	add    %edx,%eax
   62856:	add    $0x2,%rdi
   6285a:	cmp    %rdi,%r11
   6285d:	jne    62820 <fastgzip::enc::scan::<13, true, false>+0x2b0>
   6285f:	mov    %rsi,(%r10,%rbx,1)
   62863:	mov    %eax,%edx
   62865:	shr    $0x3,%edx
   62868:	and    $0x7,%edx
   6286b:	add    %rbx,%rdx
   6286e:	mov    %eax,%edi
   62870:	and    $0xffff8007,%edi
   62876:	bt     $0x30,%r9
   6287b:	jae    628bb <fastgzip::enc::scan::<13, true, false>+0x34b>
   6287d:	mov    %eax,%ecx
   6287f:	and    $0x38,%cl
   62882:	shr    %cl,%rsi
   62885:	mov    0x80c(%r14),%r8d
   6288c:	movzwl %r8w,%r9d
   62890:	and    $0x7,%al
   62892:	mov    %eax,%ecx
   62894:	shl    %cl,%r9
   62897:	or     %rsi,%r9
   6289a:	shr    $0x10,%r8d
   6289e:	add    %edi,%r8d
   628a1:	mov    %r9,(%r10,%rdx,1)
   628a5:	mov    %r8d,%eax
   628a8:	shr    $0x3,%eax
   628ab:	and    $0x7,%eax
   628ae:	add    %rax,%rdx
   628b1:	and    $0xffff8007,%r8d
   628b8:	mov    %r8d,%edi
   628bb:	xor    %eax,%eax
   628bd:	cmp    $0x8,%edi
   628c0:	mov    %edi,%ecx
   628c2:	lea    (%rcx,%rdx,8),%rcx
   628c6:	cmovb  %rcx,%rax
   628ca:	add    $0x28,%rsp
   628ce:	pop    %rbx
   628cf:	pop    %r12
   628d1:	pop    %r13
   628d3:	pop    %r14
   628d5:	pop    %r15
   628d7:	pop    %rbp
   628d8:	ret
   628d9:	movzbl 0x0(%r13),%eax
   628de:	mov    (%r14,%rax,4),%eax
   628e2:	movzwl %ax,%edx
   628e5:	mov    %r15d,%ecx
   628e8:	shl    %cl,%rdx
   628eb:	or     %rbp,%rdx
   628ee:	shr    $0x10,%eax
   628f1:	add    %r15d,%eax
   628f4:	mov    %rdx,(%rdi,%rbx,1)
   628f8:	mov    %eax,%ecx
   628fa:	shr    $0x3,%ecx
   628fd:	and    $0x7,%ecx
   62900:	add    %rcx,%rbx
   62903:	mov    %eax,%ecx
   62905:	and    $0x38,%cl
   62908:	shr    %cl,%rdx
   6290b:	and    $0xffff8007,%eax
   62910:	mov    $0x1,%r12d
   62916:	mov    %eax,%r15d
   62919:	mov    %rdx,%rbp
   6291c:	mov    %r14,(%rsp)
   62920:	mov    %r8,0x18(%rsp)
   62925:	movabs $0xb185ebca87000000,%r14
   6292f:	mov    0x0(%r13,%r12,1),%r11
   62934:	mov    %rbx,%r10
   62937:	mov    %r12,%r8
   6293a:	imul   %r14,%r11
   6293e:	shr    $0x33,%r11
   62942:	mov    %r8,%rdi
   62945:	cmp    0x20(%rsp),%r8
   6294a:	jae    62ae0 <fastgzip::enc::scan::<13, true, false>+0x570>
   62950:	mov    %r12,%rdx
   62953:	mov    0x0(%r13,%r12,1),%rbx
   62958:	movzwl (%rsi,%r11,2),%edi
   6295d:	mov    %dx,(%rsi,%r11,2)
   62962:	mov    %rbx,%r11
   62965:	shr    $0x8,%r11
   62969:	movabs $0xb185ebca87000000,%r14
   62973:	imul   %r14,%r11
   62977:	shr    $0x33,%r11
   6297b:	mov    0x0(%r13,%rdi,1),%rcx
   62980:	xor    %rbx,%rcx
   62983:	test   %ecx,%ecx
   62985:	je     62b8f <fastgzip::enc::scan::<13, true, false>+0x61f>
   6298b:	movzbl %bl,%eax
   6298e:	mov    (%rsp),%r8
   62992:	mov    (%r8,%rax,4),%eax
   62996:	movzwl %ax,%r9d
   6299a:	mov    %r15d,%ecx
   6299d:	shl    %cl,%r9
   629a0:	or     %rbp,%r9
   629a3:	shr    $0x10,%eax
   629a6:	add    %r15d,%eax
   629a9:	mov    0x1(%r13,%rdx,1),%rbx
   629ae:	movzwl (%rsi,%r11,2),%edi
   629b3:	lea    0x1(%rdx),%r12
   629b7:	mov    %r12w,(%rsi,%r11,2)
   629bc:	mov    %rbx,%r11
   629bf:	shr    $0x8,%r11
   629c3:	imul   %r14,%r11
   629c7:	shr    $0x33,%r11
   629cb:	mov    0x0(%r13,%rdi,1),%rcx
   629d0:	xor    %rbx,%rcx
   629d3:	test   %ecx,%ecx
   629d5:	je     62bb0 <fastgzip::enc::scan::<13, true, false>+0x640>
   629db:	mov    %rdx,%r15
   629de:	movzbl %bl,%ecx
   629e1:	mov    (%r8,%rcx,4),%edx
   629e5:	movzwl %dx,%esi
   629e8:	mov    %eax,%ecx
   629ea:	shl    %cl,%rsi
   629ed:	or     %rsi,%r9
   629f0:	mov    0x8(%rsp),%rcx
   629f5:	shr    $0x10,%edx
   629f8:	add    %eax,%edx
   629fa:	mov    0x2(%r13,%r15,1),%rbx
   629ff:	movzwl (%rcx,%r11,2),%edi
   62a04:	inc    %r12
   62a07:	mov    %r12w,(%rcx,%r11,2)
   62a0c:	mov    %rbx,%r11
   62a0f:	shr    $0x8,%r11
   62a13:	imul   %r14,%r11
   62a17:	shr    $0x33,%r11
   62a1b:	mov    0x0(%r13,%rdi,1),%rcx
   62a20:	xor    %rbx,%rcx
   62a23:	test   %ecx,%ecx
   62a25:	je     62ba2 <fastgzip::enc::scan::<13, true, false>+0x632>
   62a2b:	movzbl %bl,%eax
   62a2e:	mov    (%r8,%rax,4),%eax
   62a32:	movzwl %ax,%esi
   62a35:	mov    %edx,%ecx
   62a37:	shl    %cl,%rsi
   62a3a:	or     %rsi,%r9
   62a3d:	mov    0x8(%rsp),%rsi
   62a42:	shr    $0x10,%eax
   62a45:	add    %edx,%eax
   62a47:	mov    0x3(%r13,%r15,1),%rbx
   62a4c:	movzwl (%rsi,%r11,2),%edi
   62a51:	inc    %r12
   62a54:	mov    %r12w,(%rsi,%r11,2)
   62a59:	mov    %rbx,%r11
   62a5c:	shr    $0x8,%r11
   62a60:	imul   %r14,%r11
   62a64:	shr    $0x33,%r11
   62a68:	mov    %r13,%rdx
   62a6b:	mov    0x0(%r13,%rdi,1),%rcx
   62a70:	xor    %rbx,%rcx
   62a73:	test   %ecx,%ecx
   62a75:	je     62d08 <fastgzip::enc::scan::<13, true, false>+0x798>
   62a7b:	mov    %r15,%rdi
   62a7e:	movzbl %bl,%ecx
   62a81:	mov    (%r8,%rcx,4),%r15d
   62a85:	movzwl %r15w,%ebp
   62a89:	mov    %eax,%ecx
   62a8b:	shl    %cl,%rbp
   62a8e:	or     %r9,%rbp
   62a91:	shr    $0x10,%r15d
   62a95:	add    %eax,%r15d
   62a98:	mov    0x70(%rsp),%rax
   62a9d:	mov    %rbp,(%rax,%r10,1)
   62aa1:	mov    %r15d,%eax
   62aa4:	shr    $0x3,%eax
   62aa7:	and    $0x7,%eax
   62aaa:	mov    %r15d,%ecx
   62aad:	and    $0x38,%cl
   62ab0:	shr    %cl,%rbp
   62ab3:	add    %rax,%r10
   62ab6:	and    $0xffff8007,%r15d
   62abd:	inc    %r12
   62ac0:	cmp    0x20(%rsp),%r12
   62ac5:	mov    %rdx,%r13
   62ac8:	jb     62950 <fastgzip::enc::scan::<13, true, false>+0x3e0>
   62ace:	add    $0x4,%rdi
   62ad2:	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   62ae0:	mov    %r10,%rbx
   62ae3:	mov    %rdi,%r12
   62ae6:	mov    %rbp,%r9
   62ae9:	mov    %r15d,%eax
   62aec:	mov    0x18(%rsp),%rdx
   62af1:	cmp    %rdx,%rdi
   62af4:	movabs $0xb185ebca87000000,%r8
   62afe:	mov    (%rsp),%r14
   62b02:	jae    626e5 <fastgzip::enc::scan::<13, true, false>+0x175>
   62b08:	nopl   0x0(%rax,%rax,1)
   62b10:	mov    0x0(%r13,%r12,1),%rbx
   62b15:	movzwl (%rsi,%r11,2),%edi
   62b1a:	mov    %r12w,(%rsi,%r11,2)
   62b1f:	mov    %rbx,%r11
   62b22:	shr    $0x8,%r11
   62b26:	imul   %r8,%r11
   62b2a:	shr    $0x33,%r11
   62b2e:	mov    0x0(%r13,%rdi,1),%rcx
   62b33:	xor    %rbx,%rcx
   62b36:	test   %ecx,%ecx
   62b38:	je     62bb0 <fastgzip::enc::scan::<13, true, false>+0x640>
   62b3a:	movzbl %bl,%ecx
   62b3d:	mov    (%r14,%rcx,4),%r15d
   62b41:	movzwl %r15w,%ebp
   62b45:	mov    %eax,%ecx
   62b47:	shl    %cl,%rbp
   62b4a:	or     %r9,%rbp
   62b4d:	shr    $0x10,%r15d
   62b51:	add    %eax,%r15d
   62b54:	inc    %r12
   62b57:	mov    0x70(%rsp),%rax
   62b5c:	mov    %rbp,(%rax,%r10,1)
   62b60:	mov    %r15d,%ebx
   62b63:	shr    $0x3,%ebx
   62b66:	and    $0x7,%ebx
   62b69:	add    %r10,%rbx
   62b6c:	mov    %r15d,%ecx
   62b6f:	and    $0x38,%cl
   62b72:	shr    %cl,%rbp
   62b75:	and    $0xffff8007,%r15d
   62b7c:	mov    %rbx,%r10
   62b7f:	mov    %rbp,%r9
   62b82:	mov    %r15d,%eax
   62b85:	cmp    %rdx,%r12
   62b88:	jb     62b10 <fastgzip::enc::scan::<13, true, false>+0x5a0>
   62b8a:	jmp    626e5 <fastgzip::enc::scan::<13, true, false>+0x175>
   62b8f:	mov    %r15d,%eax
   62b92:	mov    %rbp,%r9
   62b95:	mov    %rdx,%r12
   62b98:	test   %rcx,%rcx
   62b9b:	jne    62bb9 <fastgzip::enc::scan::<13, true, false>+0x649>
   62b9d:	jmp    62d20 <fastgzip::enc::scan::<13, true, false>+0x7b0>
   62ba2:	add    $0x2,%r15
   62ba6:	mov    %edx,%eax
   62ba8:	mov    %r15,%r12
   62bab:	nopl   0x0(%rax,%rax,1)
   62bb0:	test   %rcx,%rcx
   62bb3:	je     62d20 <fastgzip::enc::scan::<13, true, false>+0x7b0>
   62bb9:	tzcnt  %rcx,%r8
   62bbe:	shr    $0x3,%r8d
   62bc2:	mov    (%rsp),%r14
   62bc6:	not    %edi
   62bc8:	add    %r12d,%edi
   62bcb:	mov    $0x3f,%ecx
   62bd0:	bsr    %edi,%ecx
   62bd3:	xor    $0x1f,%ecx
   62bd6:	mov    %edi,%edx
   62bd8:	cmp    $0x2,%edi
   62bdb:	jb     62bf3 <fastgzip::enc::scan::<13, true, false>+0x683>
   62bdd:	mov    $0x1e,%edx
   62be2:	sub    %ecx,%edx
   62be4:	bt     %edx,%edi
   62be7:	mov    $0x0,%edx
   62bec:	adc    $0x3e,%edx
   62bef:	sub    %ecx,%edx
   62bf1:	sub    %ecx,%edx
   62bf3:	mov    $0x1e,%ebp
   62bf8:	sub    %ecx,%ebp
   62bfa:	mov    $0x0,%ecx
   62bff:	cmovb  %ecx,%ebp
   62c02:	mov    %edx,%edx
   62c04:	mov    $0xffffffff,%esi
   62c09:	mov    %ebp,%ecx
   62c0b:	shl    %cl,%esi
   62c0d:	not    %esi
   62c0f:	and    %esi,%edi
   62c11:	mov    0x400(%r14,%r8,4),%esi
   62c19:	mov    0x810(%r14,%rdx,4),%edx
   62c21:	mov    %esi,%ecx
   62c23:	shr    $0x13,%ecx
   62c26:	and    $0x1f,%ecx
   62c29:	and    $0x7ffff,%esi
   62c2f:	movzwl %dx,%r15d
   62c33:	shl    %cl,%r15
   62c36:	or     %rsi,%r15
   62c39:	mov    %edx,%esi
   62c3b:	shr    $0x10,%esi
   62c3e:	add    %ecx,%esi
   62c40:	mov    %esi,%ecx
   62c42:	shl    %cl,%rdi
   62c45:	or     %r15,%rdi
   62c48:	mov    0x70(%rsp),%r14
   62c4d:	mov    %r9,(%r14,%r10,1)
   62c51:	mov    %eax,%ecx
   62c53:	and    $0x38,%cl
   62c56:	shr    %cl,%r9
   62c59:	mov    %eax,%edx
   62c5b:	shr    $0x3,%edx
   62c5e:	mov    %eax,%r15d
   62c61:	and    $0x7,%al
   62c63:	mov    %eax,%ecx
   62c65:	shl    %cl,%rdi
   62c68:	and    $0x7,%edx
   62c6b:	add    %r10,%rdx
   62c6e:	or     %r9,%rdi
   62c71:	mov    %rdi,(%r14,%rdx,1)
   62c75:	lea    0x1(%r12),%eax
   62c7a:	mov    0x8(%rsp),%r9
   62c7f:	mov    %ax,(%r9,%r11,2)
   62c84:	shr    $0x10,%rbx
   62c88:	movabs $0xb185ebca87000000,%r14
   62c92:	imul   %r14,%rbx
   62c96:	shr    $0x33,%rbx
   62c9a:	lea    0x2(%r12),%eax
   62c9f:	mov    %ax,(%r9,%rbx,2)
   62ca4:	and    $0xffff8007,%r15d
   62cab:	add    %ebp,%r15d
   62cae:	add    %esi,%r15d
   62cb1:	mov    %r15d,%r10d
   62cb4:	shr    $0x3,%r10d
   62cb8:	and    $0x7,%r10d
   62cbc:	mov    %r15d,%ecx
   62cbf:	and    $0x38,%cl
   62cc2:	mov    %rdi,%rbp
   62cc5:	shr    %cl,%rbp
   62cc8:	add    %rdx,%r10
   62ccb:	add    %r12,%r8
   62cce:	and    $0xffff8007,%r15d
   62cd5:	cmp    0x18(%rsp),%r8
   62cda:	jae    62ddd <fastgzip::enc::scan::<13, true, false>+0x86d>
   62ce0:	lea    -0x1(%r8),%rax
   62ce4:	mov    -0x1(%r13,%r8,1),%r11
   62ce9:	mov    %r11,%rcx
   62cec:	imul   %r14,%rcx
   62cf0:	shr    $0x33,%rcx
   62cf4:	mov    %ax,(%r9,%rcx,2)
   62cf9:	shr    $0x8,%r11
   62cfd:	mov    %r8,%r12
   62d00:	mov    %r9,%rsi
   62d03:	jmp    6293a <fastgzip::enc::scan::<13, true, false>+0x3ca>
   62d08:	add    $0x3,%r15
   62d0c:	mov    %r15,%r12
   62d0f:	mov    %rdx,%r13
   62d12:	test   %rcx,%rcx
   62d15:	jne    62bb9 <fastgzip::enc::scan::<13, true, false>+0x649>
   62d1b:	nopl   0x0(%rax,%rax,1)
   62d20:	mov    0x10(%rsp),%r15
   62d25:	sub    %r12,%r15
   62d28:	cmp    $0x102,%r15
   62d2f:	mov    $0x102,%ecx
   62d34:	cmovb  %r15,%rcx
   62d38:	lea    (%r12,%r13,1),%rdx
   62d3c:	lea    (%rdi,%r13,1),%rsi
   62d40:	mov    $0x8,%r8d
   62d46:	cmp    $0x10,%r15
   62d4a:	mov    (%rsp),%r14
   62d4e:	jb     62d7d <fastgzip::enc::scan::<13, true, false>+0x80d>
   62d50:	mov    $0x8,%r15d
   62d56:	cs nopw 0x0(%rax,%rax,1)
   62d60:	mov    (%rdx,%r15,1),%r8
   62d64:	mov    (%rsi,%r15,1),%rbp
   62d68:	cmp    %rbp,%r8
   62d6b:	jne    62daf <fastgzip::enc::scan::<13, true, false>+0x83f>
   62d6d:	lea    0x8(%r15),%r8
   62d71:	add    $0x10,%r15
   62d75:	cmp    %rcx,%r15
   62d78:	mov    %r8,%r15
   62d7b:	jbe    62d60 <fastgzip::enc::scan::<13, true, false>+0x7f0>
   62d7d:	cmp    %rcx,%r8
   62d80:	jae    62bc6 <fastgzip::enc::scan::<13, true, false>+0x656>
   62d86:	cs nopw 0x0(%rax,%rax,1)
   62d90:	movzbl (%rdx,%r8,1),%ebp
   62d95:	cmp    (%rsi,%r8,1),%bpl
   62d99:	jne    62bc6 <fastgzip::enc::scan::<13, true, false>+0x656>
   62d9f:	inc    %r8
   62da2:	cmp    %r8,%rcx
   62da5:	jne    62d90 <fastgzip::enc::scan::<13, true, false>+0x820>
   62da7:	mov    %rcx,%r8
   62daa:	jmp    62bc6 <fastgzip::enc::scan::<13, true, false>+0x656>
   62daf:	xor    %r8,%rbp
   62db2:	tzcnt  %rbp,%r8
   62db7:	shr    $0x3,%r8d
   62dbb:	add    %r15,%r8
   62dbe:	jmp    62bc6 <fastgzip::enc::scan::<13, true, false>+0x656>
   62dc3:	and    $0xfffffffe,%ebp
   62dc6:	xor    %ebx,%ebx
   62dc8:	mov    0x60(%rsp),%r12
   62dcd:	cmpb   $0x0,0x68(%rsp)
   62dd2:	jne    62690 <fastgzip::enc::scan::<13, true, false>+0x120>
   62dd8:	jmp    626af <fastgzip::enc::scan::<13, true, false>+0x13f>
   62ddd:	mov    %r10,%rbx
   62de0:	mov    %r8,%r12
   62de3:	mov    (%rsp),%r14
   62de7:	jmp    626e5 <fastgzip::enc::scan::<13, true, false>+0x175>
   62dec:	lea    0x5ca4d(%rip),%rdx        # bf840 <anon.9d8ef70180f99d61d317e85a697ff310.21.llvm.6950703405197886605+0x480>
   62df3:	mov    $0x240,%esi
   62df8:	mov    %rbx,%rdi
   62dfb:	call   *0x5efd7(%rip)        # c1dd8 <_DYNAMIC+0x3d0>
   62e01:	int3
   62e02:	int3
   62e03:	int3
   62e04:	int3
   62e05:	int3
   62e06:	int3
   62e07:	int3
   62e08:	int3
   62e09:	int3
   62e0a:	int3
   62e0b:	int3
   62e0c:	int3
   62e0d:	int3
   62e0e:	int3
   62e0f:	int3
