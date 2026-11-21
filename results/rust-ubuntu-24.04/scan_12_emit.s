0000000000043730 <gzhot::enc::scan::<12, true, false>>:
   43730:	push   %rbp
   43731:	push   %r15
   43733:	push   %r14
   43735:	push   %r13
   43737:	push   %r12
   43739:	push   %rbx
   4373a:	sub    $0x28,%rsp
   4373e:	mov    %r8,%r13
   43741:	mov    %rdi,%r14
   43744:	mov    0x80(%rsp),%r12
   4374c:	mov    0x70(%rsp),%rdi
   43751:	bt     $0x20,%r12
   43756:	mov    %r9,0x10(%rsp)
   4375b:	mov    %rsi,0x8(%rsp)
   43760:	jb     43790 <gzhot::enc::scan::<12, true, false>+0x60>
   43762:	movzbl (%rdi),%eax
   43765:	mov    $0xffffffffffffffff,%rbp
   4376c:	mov    %r12d,%ecx
   4376f:	shl    %cl,%rbp
   43772:	not    %ebp
   43774:	and    %eax,%ebp
   43776:	xor    %ebx,%ebx
   43778:	mov    %r12,%r15
   4377b:	mov    0x60(%rsp),%r12
   43780:	cmpb   $0x0,0x68(%rsp)
   43785:	jne    43850 <gzhot::enc::scan::<12, true, false>+0x120>
   4378b:	jmp    4386f <gzhot::enc::scan::<12, true, false>+0x13f>
   43790:	mov    0x890(%r14),%r15d
   43797:	mov    %r15d,%ebx
   4379a:	shr    $0x3,%ebx
   4379d:	lea    0x894(%r14),%rax
   437a4:	cmp    $0x3ff,%r15
   437ab:	ja     437ed <gzhot::enc::scan::<12, true, false>+0xbd>
   437ad:	movups 0x70(%rax),%xmm0
   437b1:	movups %xmm0,0x70(%rdi)
   437b5:	movups 0x60(%rax),%xmm0
   437b9:	movups %xmm0,0x60(%rdi)
   437bd:	movups 0x50(%rax),%xmm0
   437c1:	movups %xmm0,0x50(%rdi)
   437c5:	movups 0x40(%rax),%xmm0
   437c9:	movups %xmm0,0x40(%rdi)
   437cd:	movups (%rax),%xmm0
   437d0:	movups 0x10(%rax),%xmm1
   437d4:	movups 0x20(%rax),%xmm2
   437d8:	movups 0x30(%rax),%xmm3
   437dc:	movups %xmm3,0x30(%rdi)
   437e0:	movups %xmm2,0x20(%rdi)
   437e4:	movups %xmm1,0x10(%rdi)
   437e8:	movups %xmm0,(%rdi)
   437eb:	jmp    4381b <gzhot::enc::scan::<12, true, false>+0xeb>
   437ed:	mov    %rax,%rsi
   437f0:	mov    %rbx,%rdx
   437f3:	mov    %rax,%rbp
   437f6:	call   *0x6bafc(%rip)        # af2f8 <memcpy@GLIBC_2.14>
   437fc:	mov    %rbp,%rax
   437ff:	mov    0x8(%rsp),%rsi
   43804:	mov    0x10(%rsp),%r9
   43809:	mov    0x70(%rsp),%rdi
   4380e:	cmp    $0x11ff,%r15d
   43815:	ja     43fac <gzhot::enc::scan::<12, true, false>+0x87c>
   4381b:	and    $0x7,%r15d
   4381f:	mov    $0xffffffff,%ebp
   43824:	mov    %r15d,%ecx
   43827:	shl    %cl,%ebp
   43829:	movzbl (%rax,%rbx,1),%eax
   4382d:	not    %ebp
   4382f:	and    %eax,%ebp
   43831:	bt     $0x28,%r12
   43836:	jb     43844 <gzhot::enc::scan::<12, true, false>+0x114>
   43838:	test   %rbx,%rbx
   4383b:	je     43f83 <gzhot::enc::scan::<12, true, false>+0x853>
   43841:	andb   $0xfe,(%rdi)
   43844:	mov    0x60(%rsp),%r12
   43849:	cmpb   $0x0,0x68(%rsp)
   4384e:	je     4386f <gzhot::enc::scan::<12, true, false>+0x13f>
   43850:	mov    $0x2000,%edx
   43855:	mov    %rsi,%rdi
   43858:	xor    %esi,%esi
   4385a:	call   *0x6bc50(%rip)        # af4b0 <memset@GLIBC_2.2.5>
   43860:	mov    0x8(%rsp),%rsi
   43865:	mov    0x10(%rsp),%r9
   4386a:	mov    0x70(%rsp),%rdi
   4386f:	xor    %eax,%eax
   43871:	mov    %r9,%r8
   43874:	sub    $0x9,%r8
   43878:	cmovb  %rax,%r8
   4387c:	sub    $0xc,%r9
   43880:	cmovb  %rax,%r9
   43884:	mov    %r9,0x20(%rsp)
   43889:	test   %r12,%r12
   4388c:	je     43898 <gzhot::enc::scan::<12, true, false>+0x168>
   4388e:	cmp    %r8,%r12
   43891:	jae    438a5 <gzhot::enc::scan::<12, true, false>+0x175>
   43893:	jmp    43adc <gzhot::enc::scan::<12, true, false>+0x3ac>
   43898:	cmp    $0x2,%r8
   4389c:	jae    43a99 <gzhot::enc::scan::<12, true, false>+0x369>
   438a2:	xor    %r12d,%r12d
   438a5:	lea    0x4(%r12),%rax
   438aa:	mov    0x10(%rsp),%r11
   438af:	cmp    %r11,%rax
   438b2:	jbe    438c1 <gzhot::enc::scan::<12, true, false>+0x191>
   438b4:	mov    %r12,%rdi
   438b7:	mov    0x70(%rsp),%r10
   438bc:	jmp    43976 <gzhot::enc::scan::<12, true, false>+0x246>
   438c1:	mov    0x70(%rsp),%r10
   438c6:	cs nopw 0x0(%rax,%rax,1)
   438d0:	movzbl 0x0(%r13,%r12,1),%eax
   438d6:	mov    (%r14,%rax,4),%eax
   438da:	movzwl %ax,%esi
   438dd:	mov    %r15d,%ecx
   438e0:	shl    %cl,%rsi
   438e3:	shr    $0x10,%eax
   438e6:	add    %r15d,%eax
   438e9:	movzbl 0x1(%r13,%r12,1),%ecx
   438ef:	mov    (%r14,%rcx,4),%edx
   438f3:	movzwl %dx,%edi
   438f6:	mov    %eax,%ecx
   438f8:	shl    %cl,%rdi
   438fb:	shr    $0x10,%edx
   438fe:	add    %eax,%edx
   43900:	movzbl 0x2(%r13,%r12,1),%eax
   43906:	mov    (%r14,%rax,4),%eax
   4390a:	movzwl %ax,%r8d
   4390e:	mov    %edx,%ecx
   43910:	shl    %cl,%r8
   43913:	or     %rsi,%rbp
   43916:	or     %rbp,%rdi
   43919:	or     %rdi,%r8
   4391c:	shr    $0x10,%eax
   4391f:	add    %edx,%eax
   43921:	movzbl 0x3(%r13,%r12,1),%ecx
   43927:	mov    (%r14,%rcx,4),%r15d
   4392b:	movzwl %r15w,%ebp
   4392f:	mov    %eax,%ecx
   43931:	shl    %cl,%rbp
   43934:	mov    %rbx,%rcx
   43937:	or     %r8,%rbp
   4393a:	shr    $0x10,%r15d
   4393e:	add    %eax,%r15d
   43941:	mov    %rbp,(%r10,%rbx,1)
   43945:	mov    %r15d,%ebx
   43948:	shr    $0x3,%ebx
   4394b:	and    $0x7,%ebx
   4394e:	add    %rcx,%rbx
   43951:	mov    %r15d,%ecx
   43954:	and    $0x38,%cl
   43957:	shr    %cl,%rbp
   4395a:	and    $0xffff8007,%r15d
   43961:	lea    0x4(%r12),%rdi
   43966:	add    $0x8,%r12
   4396a:	cmp    %r11,%r12
   4396d:	mov    %rdi,%r12
   43970:	jbe    438d0 <gzhot::enc::scan::<12, true, false>+0x1a0>
   43976:	cmp    %rdi,%r11
   43979:	jbe    4399a <gzhot::enc::scan::<12, true, false>+0x26a>
   4397b:	mov    %r11d,%eax
   4397e:	sub    %edi,%eax
   43980:	lea    0x1(%rdi),%rdx
   43984:	test   $0x1,%al
   43986:	mov    0x80(%rsp),%r9
   4398e:	jne    439aa <gzhot::enc::scan::<12, true, false>+0x27a>
   43990:	cmp    %rdx,%r11
   43993:	jne    439d4 <gzhot::enc::scan::<12, true, false>+0x2a4>
   43995:	jmp    43a1f <gzhot::enc::scan::<12, true, false>+0x2ef>
   4399a:	mov    %r15d,%eax
   4399d:	mov    %rbp,%rsi
   439a0:	mov    0x80(%rsp),%r9
   439a8:	jmp    43a1f <gzhot::enc::scan::<12, true, false>+0x2ef>
   439aa:	movzbl 0x0(%r13,%rdi,1),%eax
   439b0:	mov    (%r14,%rax,4),%eax
   439b4:	movzwl %ax,%esi
   439b7:	mov    %r15d,%ecx
   439ba:	shl    %cl,%rsi
   439bd:	or     %rbp,%rsi
   439c0:	shr    $0x10,%eax
   439c3:	add    %r15d,%eax
   439c6:	mov    %rdx,%rdi
   439c9:	mov    %rsi,%rbp
   439cc:	mov    %eax,%r15d
   439cf:	cmp    %rdx,%r11
   439d2:	je     43a1f <gzhot::enc::scan::<12, true, false>+0x2ef>
   439d4:	mov    %rbp,%rsi
   439d7:	mov    %r15d,%eax
   439da:	nopw   0x0(%rax,%rax,1)
   439e0:	movzbl 0x0(%r13,%rdi,1),%ecx
   439e6:	mov    (%r14,%rcx,4),%edx
   439ea:	movzwl %dx,%r8d
   439ee:	mov    %eax,%ecx
   439f0:	shl    %cl,%r8
   439f3:	or     %r8,%rsi
   439f6:	shr    $0x10,%edx
   439f9:	add    %eax,%edx
   439fb:	movzbl 0x1(%r13,%rdi,1),%eax
   43a01:	mov    (%r14,%rax,4),%eax
   43a05:	movzwl %ax,%r8d
   43a09:	mov    %edx,%ecx
   43a0b:	shl    %cl,%r8
   43a0e:	or     %r8,%rsi
   43a11:	shr    $0x10,%eax
   43a14:	add    %edx,%eax
   43a16:	add    $0x2,%rdi
   43a1a:	cmp    %rdi,%r11
   43a1d:	jne    439e0 <gzhot::enc::scan::<12, true, false>+0x2b0>
   43a1f:	mov    %rsi,(%r10,%rbx,1)
   43a23:	mov    %eax,%edx
   43a25:	shr    $0x3,%edx
   43a28:	and    $0x7,%edx
   43a2b:	add    %rbx,%rdx
   43a2e:	mov    %eax,%edi
   43a30:	and    $0xffff8007,%edi
   43a36:	bt     $0x30,%r9
   43a3b:	jae    43a7b <gzhot::enc::scan::<12, true, false>+0x34b>
   43a3d:	mov    %eax,%ecx
   43a3f:	and    $0x38,%cl
   43a42:	shr    %cl,%rsi
   43a45:	mov    0x80c(%r14),%r8d
   43a4c:	movzwl %r8w,%r9d
   43a50:	and    $0x7,%al
   43a52:	mov    %eax,%ecx
   43a54:	shl    %cl,%r9
   43a57:	or     %rsi,%r9
   43a5a:	shr    $0x10,%r8d
   43a5e:	add    %edi,%r8d
   43a61:	mov    %r9,(%r10,%rdx,1)
   43a65:	mov    %r8d,%eax
   43a68:	shr    $0x3,%eax
   43a6b:	and    $0x7,%eax
   43a6e:	add    %rax,%rdx
   43a71:	and    $0xffff8007,%r8d
   43a78:	mov    %r8d,%edi
   43a7b:	xor    %eax,%eax
   43a7d:	cmp    $0x8,%edi
   43a80:	mov    %edi,%ecx
   43a82:	lea    (%rcx,%rdx,8),%rcx
   43a86:	cmovb  %rcx,%rax
   43a8a:	add    $0x28,%rsp
   43a8e:	pop    %rbx
   43a8f:	pop    %r12
   43a91:	pop    %r13
   43a93:	pop    %r14
   43a95:	pop    %r15
   43a97:	pop    %rbp
   43a98:	ret
   43a99:	movzbl 0x0(%r13),%eax
   43a9e:	mov    (%r14,%rax,4),%eax
   43aa2:	movzwl %ax,%edx
   43aa5:	mov    %r15d,%ecx
   43aa8:	shl    %cl,%rdx
   43aab:	or     %rbp,%rdx
   43aae:	shr    $0x10,%eax
   43ab1:	add    %r15d,%eax
   43ab4:	mov    %rdx,(%rdi,%rbx,1)
   43ab8:	mov    %eax,%ecx
   43aba:	shr    $0x3,%ecx
   43abd:	and    $0x7,%ecx
   43ac0:	add    %rcx,%rbx
   43ac3:	mov    %eax,%ecx
   43ac5:	and    $0x38,%cl
   43ac8:	shr    %cl,%rdx
   43acb:	and    $0xffff8007,%eax
   43ad0:	mov    $0x1,%r12d
   43ad6:	mov    %eax,%r15d
   43ad9:	mov    %rdx,%rbp
   43adc:	mov    %r14,(%rsp)
   43ae0:	mov    %r8,0x18(%rsp)
   43ae5:	movabs $0xb185ebca87000000,%r14
   43aef:	mov    0x0(%r13,%r12,1),%r11
   43af4:	mov    %rbx,%r10
   43af7:	mov    %r12,%r8
   43afa:	imul   %r14,%r11
   43afe:	shr    $0x34,%r11
   43b02:	mov    %r8,%rdi
   43b05:	cmp    0x20(%rsp),%r8
   43b0a:	jae    43ca0 <gzhot::enc::scan::<12, true, false>+0x570>
   43b10:	mov    %r12,%rdx
   43b13:	mov    0x0(%r13,%r12,1),%rbx
   43b18:	movzwl (%rsi,%r11,2),%edi
   43b1d:	mov    %dx,(%rsi,%r11,2)
   43b22:	mov    %rbx,%r11
   43b25:	shr    $0x8,%r11
   43b29:	movabs $0xb185ebca87000000,%r14
   43b33:	imul   %r14,%r11
   43b37:	shr    $0x34,%r11
   43b3b:	mov    0x0(%r13,%rdi,1),%rcx
   43b40:	xor    %rbx,%rcx
   43b43:	test   %ecx,%ecx
   43b45:	je     43d4f <gzhot::enc::scan::<12, true, false>+0x61f>
   43b4b:	movzbl %bl,%eax
   43b4e:	mov    (%rsp),%r8
   43b52:	mov    (%r8,%rax,4),%eax
   43b56:	movzwl %ax,%r9d
   43b5a:	mov    %r15d,%ecx
   43b5d:	shl    %cl,%r9
   43b60:	or     %rbp,%r9
   43b63:	shr    $0x10,%eax
   43b66:	add    %r15d,%eax
   43b69:	mov    0x1(%r13,%rdx,1),%rbx
   43b6e:	movzwl (%rsi,%r11,2),%edi
   43b73:	lea    0x1(%rdx),%r12
   43b77:	mov    %r12w,(%rsi,%r11,2)
   43b7c:	mov    %rbx,%r11
   43b7f:	shr    $0x8,%r11
   43b83:	imul   %r14,%r11
   43b87:	shr    $0x34,%r11
   43b8b:	mov    0x0(%r13,%rdi,1),%rcx
   43b90:	xor    %rbx,%rcx
   43b93:	test   %ecx,%ecx
   43b95:	je     43d70 <gzhot::enc::scan::<12, true, false>+0x640>
   43b9b:	mov    %rdx,%r15
   43b9e:	movzbl %bl,%ecx
   43ba1:	mov    (%r8,%rcx,4),%edx
   43ba5:	movzwl %dx,%esi
   43ba8:	mov    %eax,%ecx
   43baa:	shl    %cl,%rsi
   43bad:	or     %rsi,%r9
   43bb0:	mov    0x8(%rsp),%rcx
   43bb5:	shr    $0x10,%edx
   43bb8:	add    %eax,%edx
   43bba:	mov    0x2(%r13,%r15,1),%rbx
   43bbf:	movzwl (%rcx,%r11,2),%edi
   43bc4:	inc    %r12
   43bc7:	mov    %r12w,(%rcx,%r11,2)
   43bcc:	mov    %rbx,%r11
   43bcf:	shr    $0x8,%r11
   43bd3:	imul   %r14,%r11
   43bd7:	shr    $0x34,%r11
   43bdb:	mov    0x0(%r13,%rdi,1),%rcx
   43be0:	xor    %rbx,%rcx
   43be3:	test   %ecx,%ecx
   43be5:	je     43d62 <gzhot::enc::scan::<12, true, false>+0x632>
   43beb:	movzbl %bl,%eax
   43bee:	mov    (%r8,%rax,4),%eax
   43bf2:	movzwl %ax,%esi
   43bf5:	mov    %edx,%ecx
   43bf7:	shl    %cl,%rsi
   43bfa:	or     %rsi,%r9
   43bfd:	mov    0x8(%rsp),%rsi
   43c02:	shr    $0x10,%eax
   43c05:	add    %edx,%eax
   43c07:	mov    0x3(%r13,%r15,1),%rbx
   43c0c:	movzwl (%rsi,%r11,2),%edi
   43c11:	inc    %r12
   43c14:	mov    %r12w,(%rsi,%r11,2)
   43c19:	mov    %rbx,%r11
   43c1c:	shr    $0x8,%r11
   43c20:	imul   %r14,%r11
   43c24:	shr    $0x34,%r11
   43c28:	mov    %r13,%rdx
   43c2b:	mov    0x0(%r13,%rdi,1),%rcx
   43c30:	xor    %rbx,%rcx
   43c33:	test   %ecx,%ecx
   43c35:	je     43ec8 <gzhot::enc::scan::<12, true, false>+0x798>
   43c3b:	mov    %r15,%rdi
   43c3e:	movzbl %bl,%ecx
   43c41:	mov    (%r8,%rcx,4),%r15d
   43c45:	movzwl %r15w,%ebp
   43c49:	mov    %eax,%ecx
   43c4b:	shl    %cl,%rbp
   43c4e:	or     %r9,%rbp
   43c51:	shr    $0x10,%r15d
   43c55:	add    %eax,%r15d
   43c58:	mov    0x70(%rsp),%rax
   43c5d:	mov    %rbp,(%rax,%r10,1)
   43c61:	mov    %r15d,%eax
   43c64:	shr    $0x3,%eax
   43c67:	and    $0x7,%eax
   43c6a:	mov    %r15d,%ecx
   43c6d:	and    $0x38,%cl
   43c70:	shr    %cl,%rbp
   43c73:	add    %rax,%r10
   43c76:	and    $0xffff8007,%r15d
   43c7d:	inc    %r12
   43c80:	cmp    0x20(%rsp),%r12
   43c85:	mov    %rdx,%r13
   43c88:	jb     43b10 <gzhot::enc::scan::<12, true, false>+0x3e0>
   43c8e:	add    $0x4,%rdi
   43c92:	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   43ca0:	mov    %r10,%rbx
   43ca3:	mov    %rdi,%r12
   43ca6:	mov    %rbp,%r9
   43ca9:	mov    %r15d,%eax
   43cac:	mov    0x18(%rsp),%rdx
   43cb1:	cmp    %rdx,%rdi
   43cb4:	movabs $0xb185ebca87000000,%r8
   43cbe:	mov    (%rsp),%r14
   43cc2:	jae    438a5 <gzhot::enc::scan::<12, true, false>+0x175>
   43cc8:	nopl   0x0(%rax,%rax,1)
   43cd0:	mov    0x0(%r13,%r12,1),%rbx
   43cd5:	movzwl (%rsi,%r11,2),%edi
   43cda:	mov    %r12w,(%rsi,%r11,2)
   43cdf:	mov    %rbx,%r11
   43ce2:	shr    $0x8,%r11
   43ce6:	imul   %r8,%r11
   43cea:	shr    $0x34,%r11
   43cee:	mov    0x0(%r13,%rdi,1),%rcx
   43cf3:	xor    %rbx,%rcx
   43cf6:	test   %ecx,%ecx
   43cf8:	je     43d70 <gzhot::enc::scan::<12, true, false>+0x640>
   43cfa:	movzbl %bl,%ecx
   43cfd:	mov    (%r14,%rcx,4),%r15d
   43d01:	movzwl %r15w,%ebp
   43d05:	mov    %eax,%ecx
   43d07:	shl    %cl,%rbp
   43d0a:	or     %r9,%rbp
   43d0d:	shr    $0x10,%r15d
   43d11:	add    %eax,%r15d
   43d14:	inc    %r12
   43d17:	mov    0x70(%rsp),%rax
   43d1c:	mov    %rbp,(%rax,%r10,1)
   43d20:	mov    %r15d,%ebx
   43d23:	shr    $0x3,%ebx
   43d26:	and    $0x7,%ebx
   43d29:	add    %r10,%rbx
   43d2c:	mov    %r15d,%ecx
   43d2f:	and    $0x38,%cl
   43d32:	shr    %cl,%rbp
   43d35:	and    $0xffff8007,%r15d
   43d3c:	mov    %rbx,%r10
   43d3f:	mov    %rbp,%r9
   43d42:	mov    %r15d,%eax
   43d45:	cmp    %rdx,%r12
   43d48:	jb     43cd0 <gzhot::enc::scan::<12, true, false>+0x5a0>
   43d4a:	jmp    438a5 <gzhot::enc::scan::<12, true, false>+0x175>
   43d4f:	mov    %r15d,%eax
   43d52:	mov    %rbp,%r9
   43d55:	mov    %rdx,%r12
   43d58:	test   %rcx,%rcx
   43d5b:	jne    43d79 <gzhot::enc::scan::<12, true, false>+0x649>
   43d5d:	jmp    43ee0 <gzhot::enc::scan::<12, true, false>+0x7b0>
   43d62:	add    $0x2,%r15
   43d66:	mov    %edx,%eax
   43d68:	mov    %r15,%r12
   43d6b:	nopl   0x0(%rax,%rax,1)
   43d70:	test   %rcx,%rcx
   43d73:	je     43ee0 <gzhot::enc::scan::<12, true, false>+0x7b0>
   43d79:	tzcnt  %rcx,%r8
   43d7e:	shr    $0x3,%r8d
   43d82:	mov    (%rsp),%r14
   43d86:	not    %edi
   43d88:	add    %r12d,%edi
   43d8b:	mov    $0x3f,%ecx
   43d90:	bsr    %edi,%ecx
   43d93:	xor    $0x1f,%ecx
   43d96:	mov    %edi,%edx
   43d98:	cmp    $0x2,%edi
   43d9b:	jb     43db3 <gzhot::enc::scan::<12, true, false>+0x683>
   43d9d:	mov    $0x1e,%edx
   43da2:	sub    %ecx,%edx
   43da4:	bt     %edx,%edi
   43da7:	mov    $0x0,%edx
   43dac:	adc    $0x3e,%edx
   43daf:	sub    %ecx,%edx
   43db1:	sub    %ecx,%edx
   43db3:	mov    $0x1e,%ebp
   43db8:	sub    %ecx,%ebp
   43dba:	mov    $0x0,%ecx
   43dbf:	cmovb  %ecx,%ebp
   43dc2:	mov    %edx,%edx
   43dc4:	mov    $0xffffffff,%esi
   43dc9:	mov    %ebp,%ecx
   43dcb:	shl    %cl,%esi
   43dcd:	not    %esi
   43dcf:	and    %esi,%edi
   43dd1:	mov    0x400(%r14,%r8,4),%esi
   43dd9:	mov    0x810(%r14,%rdx,4),%edx
   43de1:	mov    %esi,%ecx
   43de3:	shr    $0x13,%ecx
   43de6:	and    $0x1f,%ecx
   43de9:	and    $0x7ffff,%esi
   43def:	movzwl %dx,%r15d
   43df3:	shl    %cl,%r15
   43df6:	or     %rsi,%r15
   43df9:	mov    %edx,%esi
   43dfb:	shr    $0x10,%esi
   43dfe:	add    %ecx,%esi
   43e00:	mov    %esi,%ecx
   43e02:	shl    %cl,%rdi
   43e05:	or     %r15,%rdi
   43e08:	mov    0x70(%rsp),%r14
   43e0d:	mov    %r9,(%r14,%r10,1)
   43e11:	mov    %eax,%ecx
   43e13:	and    $0x38,%cl
   43e16:	shr    %cl,%r9
   43e19:	mov    %eax,%edx
   43e1b:	shr    $0x3,%edx
   43e1e:	mov    %eax,%r15d
   43e21:	and    $0x7,%al
   43e23:	mov    %eax,%ecx
   43e25:	shl    %cl,%rdi
   43e28:	and    $0x7,%edx
   43e2b:	add    %r10,%rdx
   43e2e:	or     %r9,%rdi
   43e31:	mov    %rdi,(%r14,%rdx,1)
   43e35:	lea    0x1(%r12),%eax
   43e3a:	mov    0x8(%rsp),%r9
   43e3f:	mov    %ax,(%r9,%r11,2)
   43e44:	shr    $0x10,%rbx
   43e48:	movabs $0xb185ebca87000000,%r14
   43e52:	imul   %r14,%rbx
   43e56:	shr    $0x34,%rbx
   43e5a:	lea    0x2(%r12),%eax
   43e5f:	mov    %ax,(%r9,%rbx,2)
   43e64:	and    $0xffff8007,%r15d
   43e6b:	add    %ebp,%r15d
   43e6e:	add    %esi,%r15d
   43e71:	mov    %r15d,%r10d
   43e74:	shr    $0x3,%r10d
   43e78:	and    $0x7,%r10d
   43e7c:	mov    %r15d,%ecx
   43e7f:	and    $0x38,%cl
   43e82:	mov    %rdi,%rbp
   43e85:	shr    %cl,%rbp
   43e88:	add    %rdx,%r10
   43e8b:	add    %r12,%r8
   43e8e:	and    $0xffff8007,%r15d
   43e95:	cmp    0x18(%rsp),%r8
   43e9a:	jae    43f9d <gzhot::enc::scan::<12, true, false>+0x86d>
   43ea0:	lea    -0x1(%r8),%rax
   43ea4:	mov    -0x1(%r13,%r8,1),%r11
   43ea9:	mov    %r11,%rcx
   43eac:	imul   %r14,%rcx
   43eb0:	shr    $0x34,%rcx
   43eb4:	mov    %ax,(%r9,%rcx,2)
   43eb9:	shr    $0x8,%r11
   43ebd:	mov    %r8,%r12
   43ec0:	mov    %r9,%rsi
   43ec3:	jmp    43afa <gzhot::enc::scan::<12, true, false>+0x3ca>
   43ec8:	add    $0x3,%r15
   43ecc:	mov    %r15,%r12
   43ecf:	mov    %rdx,%r13
   43ed2:	test   %rcx,%rcx
   43ed5:	jne    43d79 <gzhot::enc::scan::<12, true, false>+0x649>
   43edb:	nopl   0x0(%rax,%rax,1)
   43ee0:	mov    0x10(%rsp),%r15
   43ee5:	sub    %r12,%r15
   43ee8:	cmp    $0x102,%r15
   43eef:	mov    $0x102,%ecx
   43ef4:	cmovb  %r15,%rcx
   43ef8:	lea    (%r12,%r13,1),%rdx
   43efc:	lea    (%rdi,%r13,1),%rsi
   43f00:	mov    $0x8,%r8d
   43f06:	cmp    $0x10,%r15
   43f0a:	mov    (%rsp),%r14
   43f0e:	jb     43f3d <gzhot::enc::scan::<12, true, false>+0x80d>
   43f10:	mov    $0x8,%r15d
   43f16:	cs nopw 0x0(%rax,%rax,1)
   43f20:	mov    (%rdx,%r15,1),%r8
   43f24:	mov    (%rsi,%r15,1),%rbp
   43f28:	cmp    %rbp,%r8
   43f2b:	jne    43f6f <gzhot::enc::scan::<12, true, false>+0x83f>
   43f2d:	lea    0x8(%r15),%r8
   43f31:	add    $0x10,%r15
   43f35:	cmp    %rcx,%r15
   43f38:	mov    %r8,%r15
   43f3b:	jbe    43f20 <gzhot::enc::scan::<12, true, false>+0x7f0>
   43f3d:	cmp    %rcx,%r8
   43f40:	jae    43d86 <gzhot::enc::scan::<12, true, false>+0x656>
   43f46:	cs nopw 0x0(%rax,%rax,1)
   43f50:	movzbl (%rdx,%r8,1),%ebp
   43f55:	cmp    (%rsi,%r8,1),%bpl
   43f59:	jne    43d86 <gzhot::enc::scan::<12, true, false>+0x656>
   43f5f:	inc    %r8
   43f62:	cmp    %r8,%rcx
   43f65:	jne    43f50 <gzhot::enc::scan::<12, true, false>+0x820>
   43f67:	mov    %rcx,%r8
   43f6a:	jmp    43d86 <gzhot::enc::scan::<12, true, false>+0x656>
   43f6f:	xor    %r8,%rbp
   43f72:	tzcnt  %rbp,%r8
   43f77:	shr    $0x3,%r8d
   43f7b:	add    %r15,%r8
   43f7e:	jmp    43d86 <gzhot::enc::scan::<12, true, false>+0x656>
   43f83:	and    $0xfffffffe,%ebp
   43f86:	xor    %ebx,%ebx
   43f88:	mov    0x60(%rsp),%r12
   43f8d:	cmpb   $0x0,0x68(%rsp)
   43f92:	jne    43850 <gzhot::enc::scan::<12, true, false>+0x120>
   43f98:	jmp    4386f <gzhot::enc::scan::<12, true, false>+0x13f>
   43f9d:	mov    %r10,%rbx
   43fa0:	mov    %r8,%r12
   43fa3:	mov    (%rsp),%r14
   43fa7:	jmp    438a5 <gzhot::enc::scan::<12, true, false>+0x175>
   43fac:	lea    0x67aa5(%rip),%rdx        # aba58 <anon.d91998d8fdf8c68441992754ee7655f1.20.llvm.5307011345859626740+0x350>
   43fb3:	mov    $0x240,%esi
   43fb8:	mov    %rbx,%rdi
   43fbb:	call   *0x6b4f7(%rip)        # af4b8 <_DYNAMIC+0x400>
   43fc1:	int3
   43fc2:	int3
   43fc3:	int3
   43fc4:	int3
   43fc5:	int3
   43fc6:	int3
   43fc7:	int3
   43fc8:	int3
   43fc9:	int3
   43fca:	int3
   43fcb:	int3
   43fcc:	int3
   43fcd:	int3
   43fce:	int3
   43fcf:	int3
