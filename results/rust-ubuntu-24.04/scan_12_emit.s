0000000000043760 <gzhot::enc::scan::<12, true, false>>:
   43760:	push   %rbp
   43761:	push   %r15
   43763:	push   %r14
   43765:	push   %r13
   43767:	push   %r12
   43769:	push   %rbx
   4376a:	sub    $0x28,%rsp
   4376e:	mov    %r8,%r13
   43771:	mov    %rdi,%r14
   43774:	mov    0x80(%rsp),%r12
   4377c:	mov    0x70(%rsp),%rdi
   43781:	bt     $0x20,%r12
   43786:	mov    %r9,0x10(%rsp)
   4378b:	mov    %rsi,0x8(%rsp)
   43790:	jb     437c0 <gzhot::enc::scan::<12, true, false>+0x60>
   43792:	movzbl (%rdi),%eax
   43795:	mov    $0xffffffffffffffff,%rbp
   4379c:	mov    %r12d,%ecx
   4379f:	shl    %cl,%rbp
   437a2:	not    %ebp
   437a4:	and    %eax,%ebp
   437a6:	xor    %ebx,%ebx
   437a8:	mov    %r12,%r15
   437ab:	mov    0x60(%rsp),%r12
   437b0:	cmpb   $0x0,0x68(%rsp)
   437b5:	jne    43880 <gzhot::enc::scan::<12, true, false>+0x120>
   437bb:	jmp    4389f <gzhot::enc::scan::<12, true, false>+0x13f>
   437c0:	mov    0x890(%r14),%r15d
   437c7:	mov    %r15d,%ebx
   437ca:	shr    $0x3,%ebx
   437cd:	lea    0x894(%r14),%rax
   437d4:	cmp    $0x3ff,%r15
   437db:	ja     4381d <gzhot::enc::scan::<12, true, false>+0xbd>
   437dd:	movups 0x70(%rax),%xmm0
   437e1:	movups %xmm0,0x70(%rdi)
   437e5:	movups 0x60(%rax),%xmm0
   437e9:	movups %xmm0,0x60(%rdi)
   437ed:	movups 0x50(%rax),%xmm0
   437f1:	movups %xmm0,0x50(%rdi)
   437f5:	movups 0x40(%rax),%xmm0
   437f9:	movups %xmm0,0x40(%rdi)
   437fd:	movups (%rax),%xmm0
   43800:	movups 0x10(%rax),%xmm1
   43804:	movups 0x20(%rax),%xmm2
   43808:	movups 0x30(%rax),%xmm3
   4380c:	movups %xmm3,0x30(%rdi)
   43810:	movups %xmm2,0x20(%rdi)
   43814:	movups %xmm1,0x10(%rdi)
   43818:	movups %xmm0,(%rdi)
   4381b:	jmp    4384b <gzhot::enc::scan::<12, true, false>+0xeb>
   4381d:	mov    %rax,%rsi
   43820:	mov    %rbx,%rdx
   43823:	mov    %rax,%rbp
   43826:	call   *0x6bafc(%rip)        # af328 <memcpy@GLIBC_2.14>
   4382c:	mov    %rbp,%rax
   4382f:	mov    0x8(%rsp),%rsi
   43834:	mov    0x10(%rsp),%r9
   43839:	mov    0x70(%rsp),%rdi
   4383e:	cmp    $0x11ff,%r15d
   43845:	ja     43fdc <gzhot::enc::scan::<12, true, false>+0x87c>
   4384b:	and    $0x7,%r15d
   4384f:	mov    $0xffffffff,%ebp
   43854:	mov    %r15d,%ecx
   43857:	shl    %cl,%ebp
   43859:	movzbl (%rax,%rbx,1),%eax
   4385d:	not    %ebp
   4385f:	and    %eax,%ebp
   43861:	bt     $0x28,%r12
   43866:	jb     43874 <gzhot::enc::scan::<12, true, false>+0x114>
   43868:	test   %rbx,%rbx
   4386b:	je     43fb3 <gzhot::enc::scan::<12, true, false>+0x853>
   43871:	andb   $0xfe,(%rdi)
   43874:	mov    0x60(%rsp),%r12
   43879:	cmpb   $0x0,0x68(%rsp)
   4387e:	je     4389f <gzhot::enc::scan::<12, true, false>+0x13f>
   43880:	mov    $0x2000,%edx
   43885:	mov    %rsi,%rdi
   43888:	xor    %esi,%esi
   4388a:	call   *0x6bc50(%rip)        # af4e0 <memset@GLIBC_2.2.5>
   43890:	mov    0x8(%rsp),%rsi
   43895:	mov    0x10(%rsp),%r9
   4389a:	mov    0x70(%rsp),%rdi
   4389f:	xor    %eax,%eax
   438a1:	mov    %r9,%r8
   438a4:	sub    $0x9,%r8
   438a8:	cmovb  %rax,%r8
   438ac:	sub    $0xc,%r9
   438b0:	cmovb  %rax,%r9
   438b4:	mov    %r9,0x20(%rsp)
   438b9:	test   %r12,%r12
   438bc:	je     438c8 <gzhot::enc::scan::<12, true, false>+0x168>
   438be:	cmp    %r8,%r12
   438c1:	jae    438d5 <gzhot::enc::scan::<12, true, false>+0x175>
   438c3:	jmp    43b0c <gzhot::enc::scan::<12, true, false>+0x3ac>
   438c8:	cmp    $0x2,%r8
   438cc:	jae    43ac9 <gzhot::enc::scan::<12, true, false>+0x369>
   438d2:	xor    %r12d,%r12d
   438d5:	lea    0x4(%r12),%rax
   438da:	mov    0x10(%rsp),%r11
   438df:	cmp    %r11,%rax
   438e2:	jbe    438f1 <gzhot::enc::scan::<12, true, false>+0x191>
   438e4:	mov    %r12,%rdi
   438e7:	mov    0x70(%rsp),%r10
   438ec:	jmp    439a6 <gzhot::enc::scan::<12, true, false>+0x246>
   438f1:	mov    0x70(%rsp),%r10
   438f6:	cs nopw 0x0(%rax,%rax,1)
   43900:	movzbl 0x0(%r13,%r12,1),%eax
   43906:	mov    (%r14,%rax,4),%eax
   4390a:	movzwl %ax,%esi
   4390d:	mov    %r15d,%ecx
   43910:	shl    %cl,%rsi
   43913:	shr    $0x10,%eax
   43916:	add    %r15d,%eax
   43919:	movzbl 0x1(%r13,%r12,1),%ecx
   4391f:	mov    (%r14,%rcx,4),%edx
   43923:	movzwl %dx,%edi
   43926:	mov    %eax,%ecx
   43928:	shl    %cl,%rdi
   4392b:	shr    $0x10,%edx
   4392e:	add    %eax,%edx
   43930:	movzbl 0x2(%r13,%r12,1),%eax
   43936:	mov    (%r14,%rax,4),%eax
   4393a:	movzwl %ax,%r8d
   4393e:	mov    %edx,%ecx
   43940:	shl    %cl,%r8
   43943:	or     %rsi,%rbp
   43946:	or     %rbp,%rdi
   43949:	or     %rdi,%r8
   4394c:	shr    $0x10,%eax
   4394f:	add    %edx,%eax
   43951:	movzbl 0x3(%r13,%r12,1),%ecx
   43957:	mov    (%r14,%rcx,4),%r15d
   4395b:	movzwl %r15w,%ebp
   4395f:	mov    %eax,%ecx
   43961:	shl    %cl,%rbp
   43964:	mov    %rbx,%rcx
   43967:	or     %r8,%rbp
   4396a:	shr    $0x10,%r15d
   4396e:	add    %eax,%r15d
   43971:	mov    %rbp,(%r10,%rbx,1)
   43975:	mov    %r15d,%ebx
   43978:	shr    $0x3,%ebx
   4397b:	and    $0x7,%ebx
   4397e:	add    %rcx,%rbx
   43981:	mov    %r15d,%ecx
   43984:	and    $0x38,%cl
   43987:	shr    %cl,%rbp
   4398a:	and    $0xffff8007,%r15d
   43991:	lea    0x4(%r12),%rdi
   43996:	add    $0x8,%r12
   4399a:	cmp    %r11,%r12
   4399d:	mov    %rdi,%r12
   439a0:	jbe    43900 <gzhot::enc::scan::<12, true, false>+0x1a0>
   439a6:	cmp    %rdi,%r11
   439a9:	jbe    439ca <gzhot::enc::scan::<12, true, false>+0x26a>
   439ab:	mov    %r11d,%eax
   439ae:	sub    %edi,%eax
   439b0:	lea    0x1(%rdi),%rdx
   439b4:	test   $0x1,%al
   439b6:	mov    0x80(%rsp),%r9
   439be:	jne    439da <gzhot::enc::scan::<12, true, false>+0x27a>
   439c0:	cmp    %rdx,%r11
   439c3:	jne    43a04 <gzhot::enc::scan::<12, true, false>+0x2a4>
   439c5:	jmp    43a4f <gzhot::enc::scan::<12, true, false>+0x2ef>
   439ca:	mov    %r15d,%eax
   439cd:	mov    %rbp,%rsi
   439d0:	mov    0x80(%rsp),%r9
   439d8:	jmp    43a4f <gzhot::enc::scan::<12, true, false>+0x2ef>
   439da:	movzbl 0x0(%r13,%rdi,1),%eax
   439e0:	mov    (%r14,%rax,4),%eax
   439e4:	movzwl %ax,%esi
   439e7:	mov    %r15d,%ecx
   439ea:	shl    %cl,%rsi
   439ed:	or     %rbp,%rsi
   439f0:	shr    $0x10,%eax
   439f3:	add    %r15d,%eax
   439f6:	mov    %rdx,%rdi
   439f9:	mov    %rsi,%rbp
   439fc:	mov    %eax,%r15d
   439ff:	cmp    %rdx,%r11
   43a02:	je     43a4f <gzhot::enc::scan::<12, true, false>+0x2ef>
   43a04:	mov    %rbp,%rsi
   43a07:	mov    %r15d,%eax
   43a0a:	nopw   0x0(%rax,%rax,1)
   43a10:	movzbl 0x0(%r13,%rdi,1),%ecx
   43a16:	mov    (%r14,%rcx,4),%edx
   43a1a:	movzwl %dx,%r8d
   43a1e:	mov    %eax,%ecx
   43a20:	shl    %cl,%r8
   43a23:	or     %r8,%rsi
   43a26:	shr    $0x10,%edx
   43a29:	add    %eax,%edx
   43a2b:	movzbl 0x1(%r13,%rdi,1),%eax
   43a31:	mov    (%r14,%rax,4),%eax
   43a35:	movzwl %ax,%r8d
   43a39:	mov    %edx,%ecx
   43a3b:	shl    %cl,%r8
   43a3e:	or     %r8,%rsi
   43a41:	shr    $0x10,%eax
   43a44:	add    %edx,%eax
   43a46:	add    $0x2,%rdi
   43a4a:	cmp    %rdi,%r11
   43a4d:	jne    43a10 <gzhot::enc::scan::<12, true, false>+0x2b0>
   43a4f:	mov    %rsi,(%r10,%rbx,1)
   43a53:	mov    %eax,%edx
   43a55:	shr    $0x3,%edx
   43a58:	and    $0x7,%edx
   43a5b:	add    %rbx,%rdx
   43a5e:	mov    %eax,%edi
   43a60:	and    $0xffff8007,%edi
   43a66:	bt     $0x30,%r9
   43a6b:	jae    43aab <gzhot::enc::scan::<12, true, false>+0x34b>
   43a6d:	mov    %eax,%ecx
   43a6f:	and    $0x38,%cl
   43a72:	shr    %cl,%rsi
   43a75:	mov    0x80c(%r14),%r8d
   43a7c:	movzwl %r8w,%r9d
   43a80:	and    $0x7,%al
   43a82:	mov    %eax,%ecx
   43a84:	shl    %cl,%r9
   43a87:	or     %rsi,%r9
   43a8a:	shr    $0x10,%r8d
   43a8e:	add    %edi,%r8d
   43a91:	mov    %r9,(%r10,%rdx,1)
   43a95:	mov    %r8d,%eax
   43a98:	shr    $0x3,%eax
   43a9b:	and    $0x7,%eax
   43a9e:	add    %rax,%rdx
   43aa1:	and    $0xffff8007,%r8d
   43aa8:	mov    %r8d,%edi
   43aab:	xor    %eax,%eax
   43aad:	cmp    $0x8,%edi
   43ab0:	mov    %edi,%ecx
   43ab2:	lea    (%rcx,%rdx,8),%rcx
   43ab6:	cmovb  %rcx,%rax
   43aba:	add    $0x28,%rsp
   43abe:	pop    %rbx
   43abf:	pop    %r12
   43ac1:	pop    %r13
   43ac3:	pop    %r14
   43ac5:	pop    %r15
   43ac7:	pop    %rbp
   43ac8:	ret
   43ac9:	movzbl 0x0(%r13),%eax
   43ace:	mov    (%r14,%rax,4),%eax
   43ad2:	movzwl %ax,%edx
   43ad5:	mov    %r15d,%ecx
   43ad8:	shl    %cl,%rdx
   43adb:	or     %rbp,%rdx
   43ade:	shr    $0x10,%eax
   43ae1:	add    %r15d,%eax
   43ae4:	mov    %rdx,(%rdi,%rbx,1)
   43ae8:	mov    %eax,%ecx
   43aea:	shr    $0x3,%ecx
   43aed:	and    $0x7,%ecx
   43af0:	add    %rcx,%rbx
   43af3:	mov    %eax,%ecx
   43af5:	and    $0x38,%cl
   43af8:	shr    %cl,%rdx
   43afb:	and    $0xffff8007,%eax
   43b00:	mov    $0x1,%r12d
   43b06:	mov    %eax,%r15d
   43b09:	mov    %rdx,%rbp
   43b0c:	mov    %r14,(%rsp)
   43b10:	mov    %r8,0x18(%rsp)
   43b15:	movabs $0xb185ebca87000000,%r14
   43b1f:	mov    0x0(%r13,%r12,1),%r11
   43b24:	mov    %rbx,%r10
   43b27:	mov    %r12,%r8
   43b2a:	imul   %r14,%r11
   43b2e:	shr    $0x34,%r11
   43b32:	mov    %r8,%rdi
   43b35:	cmp    0x20(%rsp),%r8
   43b3a:	jae    43cd0 <gzhot::enc::scan::<12, true, false>+0x570>
   43b40:	mov    %r12,%rdx
   43b43:	mov    0x0(%r13,%r12,1),%rbx
   43b48:	movzwl (%rsi,%r11,2),%edi
   43b4d:	mov    %dx,(%rsi,%r11,2)
   43b52:	mov    %rbx,%r11
   43b55:	shr    $0x8,%r11
   43b59:	movabs $0xb185ebca87000000,%r14
   43b63:	imul   %r14,%r11
   43b67:	shr    $0x34,%r11
   43b6b:	mov    0x0(%r13,%rdi,1),%rcx
   43b70:	xor    %rbx,%rcx
   43b73:	test   %ecx,%ecx
   43b75:	je     43d7f <gzhot::enc::scan::<12, true, false>+0x61f>
   43b7b:	movzbl %bl,%eax
   43b7e:	mov    (%rsp),%r8
   43b82:	mov    (%r8,%rax,4),%eax
   43b86:	movzwl %ax,%r9d
   43b8a:	mov    %r15d,%ecx
   43b8d:	shl    %cl,%r9
   43b90:	or     %rbp,%r9
   43b93:	shr    $0x10,%eax
   43b96:	add    %r15d,%eax
   43b99:	mov    0x1(%r13,%rdx,1),%rbx
   43b9e:	movzwl (%rsi,%r11,2),%edi
   43ba3:	lea    0x1(%rdx),%r12
   43ba7:	mov    %r12w,(%rsi,%r11,2)
   43bac:	mov    %rbx,%r11
   43baf:	shr    $0x8,%r11
   43bb3:	imul   %r14,%r11
   43bb7:	shr    $0x34,%r11
   43bbb:	mov    0x0(%r13,%rdi,1),%rcx
   43bc0:	xor    %rbx,%rcx
   43bc3:	test   %ecx,%ecx
   43bc5:	je     43da0 <gzhot::enc::scan::<12, true, false>+0x640>
   43bcb:	mov    %rdx,%r15
   43bce:	movzbl %bl,%ecx
   43bd1:	mov    (%r8,%rcx,4),%edx
   43bd5:	movzwl %dx,%esi
   43bd8:	mov    %eax,%ecx
   43bda:	shl    %cl,%rsi
   43bdd:	or     %rsi,%r9
   43be0:	mov    0x8(%rsp),%rcx
   43be5:	shr    $0x10,%edx
   43be8:	add    %eax,%edx
   43bea:	mov    0x2(%r13,%r15,1),%rbx
   43bef:	movzwl (%rcx,%r11,2),%edi
   43bf4:	inc    %r12
   43bf7:	mov    %r12w,(%rcx,%r11,2)
   43bfc:	mov    %rbx,%r11
   43bff:	shr    $0x8,%r11
   43c03:	imul   %r14,%r11
   43c07:	shr    $0x34,%r11
   43c0b:	mov    0x0(%r13,%rdi,1),%rcx
   43c10:	xor    %rbx,%rcx
   43c13:	test   %ecx,%ecx
   43c15:	je     43d92 <gzhot::enc::scan::<12, true, false>+0x632>
   43c1b:	movzbl %bl,%eax
   43c1e:	mov    (%r8,%rax,4),%eax
   43c22:	movzwl %ax,%esi
   43c25:	mov    %edx,%ecx
   43c27:	shl    %cl,%rsi
   43c2a:	or     %rsi,%r9
   43c2d:	mov    0x8(%rsp),%rsi
   43c32:	shr    $0x10,%eax
   43c35:	add    %edx,%eax
   43c37:	mov    0x3(%r13,%r15,1),%rbx
   43c3c:	movzwl (%rsi,%r11,2),%edi
   43c41:	inc    %r12
   43c44:	mov    %r12w,(%rsi,%r11,2)
   43c49:	mov    %rbx,%r11
   43c4c:	shr    $0x8,%r11
   43c50:	imul   %r14,%r11
   43c54:	shr    $0x34,%r11
   43c58:	mov    %r13,%rdx
   43c5b:	mov    0x0(%r13,%rdi,1),%rcx
   43c60:	xor    %rbx,%rcx
   43c63:	test   %ecx,%ecx
   43c65:	je     43ef8 <gzhot::enc::scan::<12, true, false>+0x798>
   43c6b:	mov    %r15,%rdi
   43c6e:	movzbl %bl,%ecx
   43c71:	mov    (%r8,%rcx,4),%r15d
   43c75:	movzwl %r15w,%ebp
   43c79:	mov    %eax,%ecx
   43c7b:	shl    %cl,%rbp
   43c7e:	or     %r9,%rbp
   43c81:	shr    $0x10,%r15d
   43c85:	add    %eax,%r15d
   43c88:	mov    0x70(%rsp),%rax
   43c8d:	mov    %rbp,(%rax,%r10,1)
   43c91:	mov    %r15d,%eax
   43c94:	shr    $0x3,%eax
   43c97:	and    $0x7,%eax
   43c9a:	mov    %r15d,%ecx
   43c9d:	and    $0x38,%cl
   43ca0:	shr    %cl,%rbp
   43ca3:	add    %rax,%r10
   43ca6:	and    $0xffff8007,%r15d
   43cad:	inc    %r12
   43cb0:	cmp    0x20(%rsp),%r12
   43cb5:	mov    %rdx,%r13
   43cb8:	jb     43b40 <gzhot::enc::scan::<12, true, false>+0x3e0>
   43cbe:	add    $0x4,%rdi
   43cc2:	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   43cd0:	mov    %r10,%rbx
   43cd3:	mov    %rdi,%r12
   43cd6:	mov    %rbp,%r9
   43cd9:	mov    %r15d,%eax
   43cdc:	mov    0x18(%rsp),%rdx
   43ce1:	cmp    %rdx,%rdi
   43ce4:	movabs $0xb185ebca87000000,%r8
   43cee:	mov    (%rsp),%r14
   43cf2:	jae    438d5 <gzhot::enc::scan::<12, true, false>+0x175>
   43cf8:	nopl   0x0(%rax,%rax,1)
   43d00:	mov    0x0(%r13,%r12,1),%rbx
   43d05:	movzwl (%rsi,%r11,2),%edi
   43d0a:	mov    %r12w,(%rsi,%r11,2)
   43d0f:	mov    %rbx,%r11
   43d12:	shr    $0x8,%r11
   43d16:	imul   %r8,%r11
   43d1a:	shr    $0x34,%r11
   43d1e:	mov    0x0(%r13,%rdi,1),%rcx
   43d23:	xor    %rbx,%rcx
   43d26:	test   %ecx,%ecx
   43d28:	je     43da0 <gzhot::enc::scan::<12, true, false>+0x640>
   43d2a:	movzbl %bl,%ecx
   43d2d:	mov    (%r14,%rcx,4),%r15d
   43d31:	movzwl %r15w,%ebp
   43d35:	mov    %eax,%ecx
   43d37:	shl    %cl,%rbp
   43d3a:	or     %r9,%rbp
   43d3d:	shr    $0x10,%r15d
   43d41:	add    %eax,%r15d
   43d44:	inc    %r12
   43d47:	mov    0x70(%rsp),%rax
   43d4c:	mov    %rbp,(%rax,%r10,1)
   43d50:	mov    %r15d,%ebx
   43d53:	shr    $0x3,%ebx
   43d56:	and    $0x7,%ebx
   43d59:	add    %r10,%rbx
   43d5c:	mov    %r15d,%ecx
   43d5f:	and    $0x38,%cl
   43d62:	shr    %cl,%rbp
   43d65:	and    $0xffff8007,%r15d
   43d6c:	mov    %rbx,%r10
   43d6f:	mov    %rbp,%r9
   43d72:	mov    %r15d,%eax
   43d75:	cmp    %rdx,%r12
   43d78:	jb     43d00 <gzhot::enc::scan::<12, true, false>+0x5a0>
   43d7a:	jmp    438d5 <gzhot::enc::scan::<12, true, false>+0x175>
   43d7f:	mov    %r15d,%eax
   43d82:	mov    %rbp,%r9
   43d85:	mov    %rdx,%r12
   43d88:	test   %rcx,%rcx
   43d8b:	jne    43da9 <gzhot::enc::scan::<12, true, false>+0x649>
   43d8d:	jmp    43f10 <gzhot::enc::scan::<12, true, false>+0x7b0>
   43d92:	add    $0x2,%r15
   43d96:	mov    %edx,%eax
   43d98:	mov    %r15,%r12
   43d9b:	nopl   0x0(%rax,%rax,1)
   43da0:	test   %rcx,%rcx
   43da3:	je     43f10 <gzhot::enc::scan::<12, true, false>+0x7b0>
   43da9:	tzcnt  %rcx,%r8
   43dae:	shr    $0x3,%r8d
   43db2:	mov    (%rsp),%r14
   43db6:	not    %edi
   43db8:	add    %r12d,%edi
   43dbb:	mov    $0x3f,%ecx
   43dc0:	bsr    %edi,%ecx
   43dc3:	xor    $0x1f,%ecx
   43dc6:	mov    %edi,%edx
   43dc8:	cmp    $0x2,%edi
   43dcb:	jb     43de3 <gzhot::enc::scan::<12, true, false>+0x683>
   43dcd:	mov    $0x1e,%edx
   43dd2:	sub    %ecx,%edx
   43dd4:	bt     %edx,%edi
   43dd7:	mov    $0x0,%edx
   43ddc:	adc    $0x3e,%edx
   43ddf:	sub    %ecx,%edx
   43de1:	sub    %ecx,%edx
   43de3:	mov    $0x1e,%ebp
   43de8:	sub    %ecx,%ebp
   43dea:	mov    $0x0,%ecx
   43def:	cmovb  %ecx,%ebp
   43df2:	mov    %edx,%edx
   43df4:	mov    $0xffffffff,%esi
   43df9:	mov    %ebp,%ecx
   43dfb:	shl    %cl,%esi
   43dfd:	not    %esi
   43dff:	and    %esi,%edi
   43e01:	mov    0x400(%r14,%r8,4),%esi
   43e09:	mov    0x810(%r14,%rdx,4),%edx
   43e11:	mov    %esi,%ecx
   43e13:	shr    $0x13,%ecx
   43e16:	and    $0x1f,%ecx
   43e19:	and    $0x7ffff,%esi
   43e1f:	movzwl %dx,%r15d
   43e23:	shl    %cl,%r15
   43e26:	or     %rsi,%r15
   43e29:	mov    %edx,%esi
   43e2b:	shr    $0x10,%esi
   43e2e:	add    %ecx,%esi
   43e30:	mov    %esi,%ecx
   43e32:	shl    %cl,%rdi
   43e35:	or     %r15,%rdi
   43e38:	mov    0x70(%rsp),%r14
   43e3d:	mov    %r9,(%r14,%r10,1)
   43e41:	mov    %eax,%ecx
   43e43:	and    $0x38,%cl
   43e46:	shr    %cl,%r9
   43e49:	mov    %eax,%edx
   43e4b:	shr    $0x3,%edx
   43e4e:	mov    %eax,%r15d
   43e51:	and    $0x7,%al
   43e53:	mov    %eax,%ecx
   43e55:	shl    %cl,%rdi
   43e58:	and    $0x7,%edx
   43e5b:	add    %r10,%rdx
   43e5e:	or     %r9,%rdi
   43e61:	mov    %rdi,(%r14,%rdx,1)
   43e65:	lea    0x1(%r12),%eax
   43e6a:	mov    0x8(%rsp),%r9
   43e6f:	mov    %ax,(%r9,%r11,2)
   43e74:	shr    $0x10,%rbx
   43e78:	movabs $0xb185ebca87000000,%r14
   43e82:	imul   %r14,%rbx
   43e86:	shr    $0x34,%rbx
   43e8a:	lea    0x2(%r12),%eax
   43e8f:	mov    %ax,(%r9,%rbx,2)
   43e94:	and    $0xffff8007,%r15d
   43e9b:	add    %ebp,%r15d
   43e9e:	add    %esi,%r15d
   43ea1:	mov    %r15d,%r10d
   43ea4:	shr    $0x3,%r10d
   43ea8:	and    $0x7,%r10d
   43eac:	mov    %r15d,%ecx
   43eaf:	and    $0x38,%cl
   43eb2:	mov    %rdi,%rbp
   43eb5:	shr    %cl,%rbp
   43eb8:	add    %rdx,%r10
   43ebb:	add    %r12,%r8
   43ebe:	and    $0xffff8007,%r15d
   43ec5:	cmp    0x18(%rsp),%r8
   43eca:	jae    43fcd <gzhot::enc::scan::<12, true, false>+0x86d>
   43ed0:	lea    -0x1(%r8),%rax
   43ed4:	mov    -0x1(%r13,%r8,1),%r11
   43ed9:	mov    %r11,%rcx
   43edc:	imul   %r14,%rcx
   43ee0:	shr    $0x34,%rcx
   43ee4:	mov    %ax,(%r9,%rcx,2)
   43ee9:	shr    $0x8,%r11
   43eed:	mov    %r8,%r12
   43ef0:	mov    %r9,%rsi
   43ef3:	jmp    43b2a <gzhot::enc::scan::<12, true, false>+0x3ca>
   43ef8:	add    $0x3,%r15
   43efc:	mov    %r15,%r12
   43eff:	mov    %rdx,%r13
   43f02:	test   %rcx,%rcx
   43f05:	jne    43da9 <gzhot::enc::scan::<12, true, false>+0x649>
   43f0b:	nopl   0x0(%rax,%rax,1)
   43f10:	mov    0x10(%rsp),%r15
   43f15:	sub    %r12,%r15
   43f18:	cmp    $0x102,%r15
   43f1f:	mov    $0x102,%ecx
   43f24:	cmovb  %r15,%rcx
   43f28:	lea    (%r12,%r13,1),%rdx
   43f2c:	lea    (%rdi,%r13,1),%rsi
   43f30:	mov    $0x8,%r8d
   43f36:	cmp    $0x10,%r15
   43f3a:	mov    (%rsp),%r14
   43f3e:	jb     43f6d <gzhot::enc::scan::<12, true, false>+0x80d>
   43f40:	mov    $0x8,%r15d
   43f46:	cs nopw 0x0(%rax,%rax,1)
   43f50:	mov    (%rdx,%r15,1),%r8
   43f54:	mov    (%rsi,%r15,1),%rbp
   43f58:	cmp    %rbp,%r8
   43f5b:	jne    43f9f <gzhot::enc::scan::<12, true, false>+0x83f>
   43f5d:	lea    0x8(%r15),%r8
   43f61:	add    $0x10,%r15
   43f65:	cmp    %rcx,%r15
   43f68:	mov    %r8,%r15
   43f6b:	jbe    43f50 <gzhot::enc::scan::<12, true, false>+0x7f0>
   43f6d:	cmp    %rcx,%r8
   43f70:	jae    43db6 <gzhot::enc::scan::<12, true, false>+0x656>
   43f76:	cs nopw 0x0(%rax,%rax,1)
   43f80:	movzbl (%rdx,%r8,1),%ebp
   43f85:	cmp    (%rsi,%r8,1),%bpl
   43f89:	jne    43db6 <gzhot::enc::scan::<12, true, false>+0x656>
   43f8f:	inc    %r8
   43f92:	cmp    %r8,%rcx
   43f95:	jne    43f80 <gzhot::enc::scan::<12, true, false>+0x820>
   43f97:	mov    %rcx,%r8
   43f9a:	jmp    43db6 <gzhot::enc::scan::<12, true, false>+0x656>
   43f9f:	xor    %r8,%rbp
   43fa2:	tzcnt  %rbp,%r8
   43fa7:	shr    $0x3,%r8d
   43fab:	add    %r15,%r8
   43fae:	jmp    43db6 <gzhot::enc::scan::<12, true, false>+0x656>
   43fb3:	and    $0xfffffffe,%ebp
   43fb6:	xor    %ebx,%ebx
   43fb8:	mov    0x60(%rsp),%r12
   43fbd:	cmpb   $0x0,0x68(%rsp)
   43fc2:	jne    43880 <gzhot::enc::scan::<12, true, false>+0x120>
   43fc8:	jmp    4389f <gzhot::enc::scan::<12, true, false>+0x13f>
   43fcd:	mov    %r10,%rbx
   43fd0:	mov    %r8,%r12
   43fd3:	mov    (%rsp),%r14
   43fd7:	jmp    438d5 <gzhot::enc::scan::<12, true, false>+0x175>
   43fdc:	lea    0x67aa5(%rip),%rdx        # aba88 <anon.d91998d8fdf8c68441992754ee7655f1.20.llvm.5307011345859626740+0x350>
   43fe3:	mov    $0x240,%esi
   43fe8:	mov    %rbx,%rdi
   43feb:	call   *0x6b4f7(%rip)        # af4e8 <_DYNAMIC+0x400>
   43ff1:	int3
   43ff2:	int3
   43ff3:	int3
   43ff4:	int3
   43ff5:	int3
   43ff6:	int3
   43ff7:	int3
   43ff8:	int3
   43ff9:	int3
   43ffa:	int3
   43ffb:	int3
   43ffc:	int3
   43ffd:	int3
   43ffe:	int3
   43fff:	int3
