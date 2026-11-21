0000000000062810 <fastgzip::enc::scan::<13, true, false>>:
   62810:	push   %rbp
   62811:	push   %r15
   62813:	push   %r14
   62815:	push   %r13
   62817:	push   %r12
   62819:	push   %rbx
   6281a:	sub    $0x28,%rsp
   6281e:	mov    %r8,%r13
   62821:	mov    %rdi,%r14
   62824:	mov    0x80(%rsp),%r12
   6282c:	mov    0x70(%rsp),%rdi
   62831:	bt     $0x20,%r12
   62836:	mov    %r9,0x10(%rsp)
   6283b:	mov    %rsi,0x8(%rsp)
   62840:	jb     62870 <fastgzip::enc::scan::<13, true, false>+0x60>
   62842:	movzbl (%rdi),%eax
   62845:	mov    $0xffffffffffffffff,%rbp
   6284c:	mov    %r12d,%ecx
   6284f:	shl    %cl,%rbp
   62852:	not    %ebp
   62854:	and    %eax,%ebp
   62856:	xor    %ebx,%ebx
   62858:	mov    %r12,%r15
   6285b:	mov    0x60(%rsp),%r12
   62860:	cmpb   $0x0,0x68(%rsp)
   62865:	jne    62930 <fastgzip::enc::scan::<13, true, false>+0x120>
   6286b:	jmp    6294f <fastgzip::enc::scan::<13, true, false>+0x13f>
   62870:	mov    0x890(%r14),%r15d
   62877:	mov    %r15d,%ebx
   6287a:	shr    $0x3,%ebx
   6287d:	lea    0x894(%r14),%rax
   62884:	cmp    $0x3ff,%r15
   6288b:	ja     628cd <fastgzip::enc::scan::<13, true, false>+0xbd>
   6288d:	movups 0x70(%rax),%xmm0
   62891:	movups %xmm0,0x70(%rdi)
   62895:	movups 0x60(%rax),%xmm0
   62899:	movups %xmm0,0x60(%rdi)
   6289d:	movups 0x50(%rax),%xmm0
   628a1:	movups %xmm0,0x50(%rdi)
   628a5:	movups 0x40(%rax),%xmm0
   628a9:	movups %xmm0,0x40(%rdi)
   628ad:	movups (%rax),%xmm0
   628b0:	movups 0x10(%rax),%xmm1
   628b4:	movups 0x20(%rax),%xmm2
   628b8:	movups 0x30(%rax),%xmm3
   628bc:	movups %xmm3,0x30(%rdi)
   628c0:	movups %xmm2,0x20(%rdi)
   628c4:	movups %xmm1,0x10(%rdi)
   628c8:	movups %xmm0,(%rdi)
   628cb:	jmp    628fb <fastgzip::enc::scan::<13, true, false>+0xeb>
   628cd:	mov    %rax,%rsi
   628d0:	mov    %rbx,%rdx
   628d3:	mov    %rax,%rbp
   628d6:	call   *0x5f66c(%rip)        # c1f48 <memcpy@GLIBC_2.14>
   628dc:	mov    %rbp,%rax
   628df:	mov    0x8(%rsp),%rsi
   628e4:	mov    0x10(%rsp),%r9
   628e9:	mov    0x70(%rsp),%rdi
   628ee:	cmp    $0x11ff,%r15d
   628f5:	ja     6308c <fastgzip::enc::scan::<13, true, false>+0x87c>
   628fb:	and    $0x7,%r15d
   628ff:	mov    $0xffffffff,%ebp
   62904:	mov    %r15d,%ecx
   62907:	shl    %cl,%ebp
   62909:	movzbl (%rax,%rbx,1),%eax
   6290d:	not    %ebp
   6290f:	and    %eax,%ebp
   62911:	bt     $0x28,%r12
   62916:	jb     62924 <fastgzip::enc::scan::<13, true, false>+0x114>
   62918:	test   %rbx,%rbx
   6291b:	je     63063 <fastgzip::enc::scan::<13, true, false>+0x853>
   62921:	andb   $0xfe,(%rdi)
   62924:	mov    0x60(%rsp),%r12
   62929:	cmpb   $0x0,0x68(%rsp)
   6292e:	je     6294f <fastgzip::enc::scan::<13, true, false>+0x13f>
   62930:	mov    $0x4000,%edx
   62935:	mov    %rsi,%rdi
   62938:	xor    %esi,%esi
   6293a:	call   *0x5f7b0(%rip)        # c20f0 <memset@GLIBC_2.2.5>
   62940:	mov    0x8(%rsp),%rsi
   62945:	mov    0x10(%rsp),%r9
   6294a:	mov    0x70(%rsp),%rdi
   6294f:	xor    %eax,%eax
   62951:	mov    %r9,%r8
   62954:	sub    $0x9,%r8
   62958:	cmovb  %rax,%r8
   6295c:	sub    $0xc,%r9
   62960:	cmovb  %rax,%r9
   62964:	mov    %r9,0x20(%rsp)
   62969:	test   %r12,%r12
   6296c:	je     62978 <fastgzip::enc::scan::<13, true, false>+0x168>
   6296e:	cmp    %r8,%r12
   62971:	jae    62985 <fastgzip::enc::scan::<13, true, false>+0x175>
   62973:	jmp    62bbc <fastgzip::enc::scan::<13, true, false>+0x3ac>
   62978:	cmp    $0x2,%r8
   6297c:	jae    62b79 <fastgzip::enc::scan::<13, true, false>+0x369>
   62982:	xor    %r12d,%r12d
   62985:	lea    0x4(%r12),%rax
   6298a:	mov    0x10(%rsp),%r11
   6298f:	cmp    %r11,%rax
   62992:	jbe    629a1 <fastgzip::enc::scan::<13, true, false>+0x191>
   62994:	mov    %r12,%rdi
   62997:	mov    0x70(%rsp),%r10
   6299c:	jmp    62a56 <fastgzip::enc::scan::<13, true, false>+0x246>
   629a1:	mov    0x70(%rsp),%r10
   629a6:	cs nopw 0x0(%rax,%rax,1)
   629b0:	movzbl 0x0(%r13,%r12,1),%eax
   629b6:	mov    (%r14,%rax,4),%eax
   629ba:	movzwl %ax,%esi
   629bd:	mov    %r15d,%ecx
   629c0:	shl    %cl,%rsi
   629c3:	shr    $0x10,%eax
   629c6:	add    %r15d,%eax
   629c9:	movzbl 0x1(%r13,%r12,1),%ecx
   629cf:	mov    (%r14,%rcx,4),%edx
   629d3:	movzwl %dx,%edi
   629d6:	mov    %eax,%ecx
   629d8:	shl    %cl,%rdi
   629db:	shr    $0x10,%edx
   629de:	add    %eax,%edx
   629e0:	movzbl 0x2(%r13,%r12,1),%eax
   629e6:	mov    (%r14,%rax,4),%eax
   629ea:	movzwl %ax,%r8d
   629ee:	mov    %edx,%ecx
   629f0:	shl    %cl,%r8
   629f3:	or     %rsi,%rbp
   629f6:	or     %rbp,%rdi
   629f9:	or     %rdi,%r8
   629fc:	shr    $0x10,%eax
   629ff:	add    %edx,%eax
   62a01:	movzbl 0x3(%r13,%r12,1),%ecx
   62a07:	mov    (%r14,%rcx,4),%r15d
   62a0b:	movzwl %r15w,%ebp
   62a0f:	mov    %eax,%ecx
   62a11:	shl    %cl,%rbp
   62a14:	mov    %rbx,%rcx
   62a17:	or     %r8,%rbp
   62a1a:	shr    $0x10,%r15d
   62a1e:	add    %eax,%r15d
   62a21:	mov    %rbp,(%r10,%rbx,1)
   62a25:	mov    %r15d,%ebx
   62a28:	shr    $0x3,%ebx
   62a2b:	and    $0x7,%ebx
   62a2e:	add    %rcx,%rbx
   62a31:	mov    %r15d,%ecx
   62a34:	and    $0x38,%cl
   62a37:	shr    %cl,%rbp
   62a3a:	and    $0xffff8007,%r15d
   62a41:	lea    0x4(%r12),%rdi
   62a46:	add    $0x8,%r12
   62a4a:	cmp    %r11,%r12
   62a4d:	mov    %rdi,%r12
   62a50:	jbe    629b0 <fastgzip::enc::scan::<13, true, false>+0x1a0>
   62a56:	cmp    %rdi,%r11
   62a59:	jbe    62a7a <fastgzip::enc::scan::<13, true, false>+0x26a>
   62a5b:	mov    %r11d,%eax
   62a5e:	sub    %edi,%eax
   62a60:	lea    0x1(%rdi),%rdx
   62a64:	test   $0x1,%al
   62a66:	mov    0x80(%rsp),%r9
   62a6e:	jne    62a8a <fastgzip::enc::scan::<13, true, false>+0x27a>
   62a70:	cmp    %rdx,%r11
   62a73:	jne    62ab4 <fastgzip::enc::scan::<13, true, false>+0x2a4>
   62a75:	jmp    62aff <fastgzip::enc::scan::<13, true, false>+0x2ef>
   62a7a:	mov    %r15d,%eax
   62a7d:	mov    %rbp,%rsi
   62a80:	mov    0x80(%rsp),%r9
   62a88:	jmp    62aff <fastgzip::enc::scan::<13, true, false>+0x2ef>
   62a8a:	movzbl 0x0(%r13,%rdi,1),%eax
   62a90:	mov    (%r14,%rax,4),%eax
   62a94:	movzwl %ax,%esi
   62a97:	mov    %r15d,%ecx
   62a9a:	shl    %cl,%rsi
   62a9d:	or     %rbp,%rsi
   62aa0:	shr    $0x10,%eax
   62aa3:	add    %r15d,%eax
   62aa6:	mov    %rdx,%rdi
   62aa9:	mov    %rsi,%rbp
   62aac:	mov    %eax,%r15d
   62aaf:	cmp    %rdx,%r11
   62ab2:	je     62aff <fastgzip::enc::scan::<13, true, false>+0x2ef>
   62ab4:	mov    %rbp,%rsi
   62ab7:	mov    %r15d,%eax
   62aba:	nopw   0x0(%rax,%rax,1)
   62ac0:	movzbl 0x0(%r13,%rdi,1),%ecx
   62ac6:	mov    (%r14,%rcx,4),%edx
   62aca:	movzwl %dx,%r8d
   62ace:	mov    %eax,%ecx
   62ad0:	shl    %cl,%r8
   62ad3:	or     %r8,%rsi
   62ad6:	shr    $0x10,%edx
   62ad9:	add    %eax,%edx
   62adb:	movzbl 0x1(%r13,%rdi,1),%eax
   62ae1:	mov    (%r14,%rax,4),%eax
   62ae5:	movzwl %ax,%r8d
   62ae9:	mov    %edx,%ecx
   62aeb:	shl    %cl,%r8
   62aee:	or     %r8,%rsi
   62af1:	shr    $0x10,%eax
   62af4:	add    %edx,%eax
   62af6:	add    $0x2,%rdi
   62afa:	cmp    %rdi,%r11
   62afd:	jne    62ac0 <fastgzip::enc::scan::<13, true, false>+0x2b0>
   62aff:	mov    %rsi,(%r10,%rbx,1)
   62b03:	mov    %eax,%edx
   62b05:	shr    $0x3,%edx
   62b08:	and    $0x7,%edx
   62b0b:	add    %rbx,%rdx
   62b0e:	mov    %eax,%edi
   62b10:	and    $0xffff8007,%edi
   62b16:	bt     $0x30,%r9
   62b1b:	jae    62b5b <fastgzip::enc::scan::<13, true, false>+0x34b>
   62b1d:	mov    %eax,%ecx
   62b1f:	and    $0x38,%cl
   62b22:	shr    %cl,%rsi
   62b25:	mov    0x80c(%r14),%r8d
   62b2c:	movzwl %r8w,%r9d
   62b30:	and    $0x7,%al
   62b32:	mov    %eax,%ecx
   62b34:	shl    %cl,%r9
   62b37:	or     %rsi,%r9
   62b3a:	shr    $0x10,%r8d
   62b3e:	add    %edi,%r8d
   62b41:	mov    %r9,(%r10,%rdx,1)
   62b45:	mov    %r8d,%eax
   62b48:	shr    $0x3,%eax
   62b4b:	and    $0x7,%eax
   62b4e:	add    %rax,%rdx
   62b51:	and    $0xffff8007,%r8d
   62b58:	mov    %r8d,%edi
   62b5b:	xor    %eax,%eax
   62b5d:	cmp    $0x8,%edi
   62b60:	mov    %edi,%ecx
   62b62:	lea    (%rcx,%rdx,8),%rcx
   62b66:	cmovb  %rcx,%rax
   62b6a:	add    $0x28,%rsp
   62b6e:	pop    %rbx
   62b6f:	pop    %r12
   62b71:	pop    %r13
   62b73:	pop    %r14
   62b75:	pop    %r15
   62b77:	pop    %rbp
   62b78:	ret
   62b79:	movzbl 0x0(%r13),%eax
   62b7e:	mov    (%r14,%rax,4),%eax
   62b82:	movzwl %ax,%edx
   62b85:	mov    %r15d,%ecx
   62b88:	shl    %cl,%rdx
   62b8b:	or     %rbp,%rdx
   62b8e:	shr    $0x10,%eax
   62b91:	add    %r15d,%eax
   62b94:	mov    %rdx,(%rdi,%rbx,1)
   62b98:	mov    %eax,%ecx
   62b9a:	shr    $0x3,%ecx
   62b9d:	and    $0x7,%ecx
   62ba0:	add    %rcx,%rbx
   62ba3:	mov    %eax,%ecx
   62ba5:	and    $0x38,%cl
   62ba8:	shr    %cl,%rdx
   62bab:	and    $0xffff8007,%eax
   62bb0:	mov    $0x1,%r12d
   62bb6:	mov    %eax,%r15d
   62bb9:	mov    %rdx,%rbp
   62bbc:	mov    %r14,(%rsp)
   62bc0:	mov    %r8,0x18(%rsp)
   62bc5:	movabs $0xb185ebca87000000,%r14
   62bcf:	mov    0x0(%r13,%r12,1),%r11
   62bd4:	mov    %rbx,%r10
   62bd7:	mov    %r12,%r8
   62bda:	imul   %r14,%r11
   62bde:	shr    $0x33,%r11
   62be2:	mov    %r8,%rdi
   62be5:	cmp    0x20(%rsp),%r8
   62bea:	jae    62d80 <fastgzip::enc::scan::<13, true, false>+0x570>
   62bf0:	mov    %r12,%rdx
   62bf3:	mov    0x0(%r13,%r12,1),%rbx
   62bf8:	movzwl (%rsi,%r11,2),%edi
   62bfd:	mov    %dx,(%rsi,%r11,2)
   62c02:	mov    %rbx,%r11
   62c05:	shr    $0x8,%r11
   62c09:	movabs $0xb185ebca87000000,%r14
   62c13:	imul   %r14,%r11
   62c17:	shr    $0x33,%r11
   62c1b:	mov    0x0(%r13,%rdi,1),%rcx
   62c20:	xor    %rbx,%rcx
   62c23:	test   %ecx,%ecx
   62c25:	je     62e2f <fastgzip::enc::scan::<13, true, false>+0x61f>
   62c2b:	movzbl %bl,%eax
   62c2e:	mov    (%rsp),%r8
   62c32:	mov    (%r8,%rax,4),%eax
   62c36:	movzwl %ax,%r9d
   62c3a:	mov    %r15d,%ecx
   62c3d:	shl    %cl,%r9
   62c40:	or     %rbp,%r9
   62c43:	shr    $0x10,%eax
   62c46:	add    %r15d,%eax
   62c49:	mov    0x1(%r13,%rdx,1),%rbx
   62c4e:	movzwl (%rsi,%r11,2),%edi
   62c53:	lea    0x1(%rdx),%r12
   62c57:	mov    %r12w,(%rsi,%r11,2)
   62c5c:	mov    %rbx,%r11
   62c5f:	shr    $0x8,%r11
   62c63:	imul   %r14,%r11
   62c67:	shr    $0x33,%r11
   62c6b:	mov    0x0(%r13,%rdi,1),%rcx
   62c70:	xor    %rbx,%rcx
   62c73:	test   %ecx,%ecx
   62c75:	je     62e50 <fastgzip::enc::scan::<13, true, false>+0x640>
   62c7b:	mov    %rdx,%r15
   62c7e:	movzbl %bl,%ecx
   62c81:	mov    (%r8,%rcx,4),%edx
   62c85:	movzwl %dx,%esi
   62c88:	mov    %eax,%ecx
   62c8a:	shl    %cl,%rsi
   62c8d:	or     %rsi,%r9
   62c90:	mov    0x8(%rsp),%rcx
   62c95:	shr    $0x10,%edx
   62c98:	add    %eax,%edx
   62c9a:	mov    0x2(%r13,%r15,1),%rbx
   62c9f:	movzwl (%rcx,%r11,2),%edi
   62ca4:	inc    %r12
   62ca7:	mov    %r12w,(%rcx,%r11,2)
   62cac:	mov    %rbx,%r11
   62caf:	shr    $0x8,%r11
   62cb3:	imul   %r14,%r11
   62cb7:	shr    $0x33,%r11
   62cbb:	mov    0x0(%r13,%rdi,1),%rcx
   62cc0:	xor    %rbx,%rcx
   62cc3:	test   %ecx,%ecx
   62cc5:	je     62e42 <fastgzip::enc::scan::<13, true, false>+0x632>
   62ccb:	movzbl %bl,%eax
   62cce:	mov    (%r8,%rax,4),%eax
   62cd2:	movzwl %ax,%esi
   62cd5:	mov    %edx,%ecx
   62cd7:	shl    %cl,%rsi
   62cda:	or     %rsi,%r9
   62cdd:	mov    0x8(%rsp),%rsi
   62ce2:	shr    $0x10,%eax
   62ce5:	add    %edx,%eax
   62ce7:	mov    0x3(%r13,%r15,1),%rbx
   62cec:	movzwl (%rsi,%r11,2),%edi
   62cf1:	inc    %r12
   62cf4:	mov    %r12w,(%rsi,%r11,2)
   62cf9:	mov    %rbx,%r11
   62cfc:	shr    $0x8,%r11
   62d00:	imul   %r14,%r11
   62d04:	shr    $0x33,%r11
   62d08:	mov    %r13,%rdx
   62d0b:	mov    0x0(%r13,%rdi,1),%rcx
   62d10:	xor    %rbx,%rcx
   62d13:	test   %ecx,%ecx
   62d15:	je     62fa8 <fastgzip::enc::scan::<13, true, false>+0x798>
   62d1b:	mov    %r15,%rdi
   62d1e:	movzbl %bl,%ecx
   62d21:	mov    (%r8,%rcx,4),%r15d
   62d25:	movzwl %r15w,%ebp
   62d29:	mov    %eax,%ecx
   62d2b:	shl    %cl,%rbp
   62d2e:	or     %r9,%rbp
   62d31:	shr    $0x10,%r15d
   62d35:	add    %eax,%r15d
   62d38:	mov    0x70(%rsp),%rax
   62d3d:	mov    %rbp,(%rax,%r10,1)
   62d41:	mov    %r15d,%eax
   62d44:	shr    $0x3,%eax
   62d47:	and    $0x7,%eax
   62d4a:	mov    %r15d,%ecx
   62d4d:	and    $0x38,%cl
   62d50:	shr    %cl,%rbp
   62d53:	add    %rax,%r10
   62d56:	and    $0xffff8007,%r15d
   62d5d:	inc    %r12
   62d60:	cmp    0x20(%rsp),%r12
   62d65:	mov    %rdx,%r13
   62d68:	jb     62bf0 <fastgzip::enc::scan::<13, true, false>+0x3e0>
   62d6e:	add    $0x4,%rdi
   62d72:	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   62d80:	mov    %r10,%rbx
   62d83:	mov    %rdi,%r12
   62d86:	mov    %rbp,%r9
   62d89:	mov    %r15d,%eax
   62d8c:	mov    0x18(%rsp),%rdx
   62d91:	cmp    %rdx,%rdi
   62d94:	movabs $0xb185ebca87000000,%r8
   62d9e:	mov    (%rsp),%r14
   62da2:	jae    62985 <fastgzip::enc::scan::<13, true, false>+0x175>
   62da8:	nopl   0x0(%rax,%rax,1)
   62db0:	mov    0x0(%r13,%r12,1),%rbx
   62db5:	movzwl (%rsi,%r11,2),%edi
   62dba:	mov    %r12w,(%rsi,%r11,2)
   62dbf:	mov    %rbx,%r11
   62dc2:	shr    $0x8,%r11
   62dc6:	imul   %r8,%r11
   62dca:	shr    $0x33,%r11
   62dce:	mov    0x0(%r13,%rdi,1),%rcx
   62dd3:	xor    %rbx,%rcx
   62dd6:	test   %ecx,%ecx
   62dd8:	je     62e50 <fastgzip::enc::scan::<13, true, false>+0x640>
   62dda:	movzbl %bl,%ecx
   62ddd:	mov    (%r14,%rcx,4),%r15d
   62de1:	movzwl %r15w,%ebp
   62de5:	mov    %eax,%ecx
   62de7:	shl    %cl,%rbp
   62dea:	or     %r9,%rbp
   62ded:	shr    $0x10,%r15d
   62df1:	add    %eax,%r15d
   62df4:	inc    %r12
   62df7:	mov    0x70(%rsp),%rax
   62dfc:	mov    %rbp,(%rax,%r10,1)
   62e00:	mov    %r15d,%ebx
   62e03:	shr    $0x3,%ebx
   62e06:	and    $0x7,%ebx
   62e09:	add    %r10,%rbx
   62e0c:	mov    %r15d,%ecx
   62e0f:	and    $0x38,%cl
   62e12:	shr    %cl,%rbp
   62e15:	and    $0xffff8007,%r15d
   62e1c:	mov    %rbx,%r10
   62e1f:	mov    %rbp,%r9
   62e22:	mov    %r15d,%eax
   62e25:	cmp    %rdx,%r12
   62e28:	jb     62db0 <fastgzip::enc::scan::<13, true, false>+0x5a0>
   62e2a:	jmp    62985 <fastgzip::enc::scan::<13, true, false>+0x175>
   62e2f:	mov    %r15d,%eax
   62e32:	mov    %rbp,%r9
   62e35:	mov    %rdx,%r12
   62e38:	test   %rcx,%rcx
   62e3b:	jne    62e59 <fastgzip::enc::scan::<13, true, false>+0x649>
   62e3d:	jmp    62fc0 <fastgzip::enc::scan::<13, true, false>+0x7b0>
   62e42:	add    $0x2,%r15
   62e46:	mov    %edx,%eax
   62e48:	mov    %r15,%r12
   62e4b:	nopl   0x0(%rax,%rax,1)
   62e50:	test   %rcx,%rcx
   62e53:	je     62fc0 <fastgzip::enc::scan::<13, true, false>+0x7b0>
   62e59:	tzcnt  %rcx,%r8
   62e5e:	shr    $0x3,%r8d
   62e62:	mov    (%rsp),%r14
   62e66:	not    %edi
   62e68:	add    %r12d,%edi
   62e6b:	mov    $0x3f,%ecx
   62e70:	bsr    %edi,%ecx
   62e73:	xor    $0x1f,%ecx
   62e76:	mov    %edi,%edx
   62e78:	cmp    $0x2,%edi
   62e7b:	jb     62e93 <fastgzip::enc::scan::<13, true, false>+0x683>
   62e7d:	mov    $0x1e,%edx
   62e82:	sub    %ecx,%edx
   62e84:	bt     %edx,%edi
   62e87:	mov    $0x0,%edx
   62e8c:	adc    $0x3e,%edx
   62e8f:	sub    %ecx,%edx
   62e91:	sub    %ecx,%edx
   62e93:	mov    $0x1e,%ebp
   62e98:	sub    %ecx,%ebp
   62e9a:	mov    $0x0,%ecx
   62e9f:	cmovb  %ecx,%ebp
   62ea2:	mov    %edx,%edx
   62ea4:	mov    $0xffffffff,%esi
   62ea9:	mov    %ebp,%ecx
   62eab:	shl    %cl,%esi
   62ead:	not    %esi
   62eaf:	and    %esi,%edi
   62eb1:	mov    0x400(%r14,%r8,4),%esi
   62eb9:	mov    0x810(%r14,%rdx,4),%edx
   62ec1:	mov    %esi,%ecx
   62ec3:	shr    $0x13,%ecx
   62ec6:	and    $0x1f,%ecx
   62ec9:	and    $0x7ffff,%esi
   62ecf:	movzwl %dx,%r15d
   62ed3:	shl    %cl,%r15
   62ed6:	or     %rsi,%r15
   62ed9:	mov    %edx,%esi
   62edb:	shr    $0x10,%esi
   62ede:	add    %ecx,%esi
   62ee0:	mov    %esi,%ecx
   62ee2:	shl    %cl,%rdi
   62ee5:	or     %r15,%rdi
   62ee8:	mov    0x70(%rsp),%r14
   62eed:	mov    %r9,(%r14,%r10,1)
   62ef1:	mov    %eax,%ecx
   62ef3:	and    $0x38,%cl
   62ef6:	shr    %cl,%r9
   62ef9:	mov    %eax,%edx
   62efb:	shr    $0x3,%edx
   62efe:	mov    %eax,%r15d
   62f01:	and    $0x7,%al
   62f03:	mov    %eax,%ecx
   62f05:	shl    %cl,%rdi
   62f08:	and    $0x7,%edx
   62f0b:	add    %r10,%rdx
   62f0e:	or     %r9,%rdi
   62f11:	mov    %rdi,(%r14,%rdx,1)
   62f15:	lea    0x1(%r12),%eax
   62f1a:	mov    0x8(%rsp),%r9
   62f1f:	mov    %ax,(%r9,%r11,2)
   62f24:	shr    $0x10,%rbx
   62f28:	movabs $0xb185ebca87000000,%r14
   62f32:	imul   %r14,%rbx
   62f36:	shr    $0x33,%rbx
   62f3a:	lea    0x2(%r12),%eax
   62f3f:	mov    %ax,(%r9,%rbx,2)
   62f44:	and    $0xffff8007,%r15d
   62f4b:	add    %ebp,%r15d
   62f4e:	add    %esi,%r15d
   62f51:	mov    %r15d,%r10d
   62f54:	shr    $0x3,%r10d
   62f58:	and    $0x7,%r10d
   62f5c:	mov    %r15d,%ecx
   62f5f:	and    $0x38,%cl
   62f62:	mov    %rdi,%rbp
   62f65:	shr    %cl,%rbp
   62f68:	add    %rdx,%r10
   62f6b:	add    %r12,%r8
   62f6e:	and    $0xffff8007,%r15d
   62f75:	cmp    0x18(%rsp),%r8
   62f7a:	jae    6307d <fastgzip::enc::scan::<13, true, false>+0x86d>
   62f80:	lea    -0x1(%r8),%rax
   62f84:	mov    -0x1(%r13,%r8,1),%r11
   62f89:	mov    %r11,%rcx
   62f8c:	imul   %r14,%rcx
   62f90:	shr    $0x33,%rcx
   62f94:	mov    %ax,(%r9,%rcx,2)
   62f99:	shr    $0x8,%r11
   62f9d:	mov    %r8,%r12
   62fa0:	mov    %r9,%rsi
   62fa3:	jmp    62bda <fastgzip::enc::scan::<13, true, false>+0x3ca>
   62fa8:	add    $0x3,%r15
   62fac:	mov    %r15,%r12
   62faf:	mov    %rdx,%r13
   62fb2:	test   %rcx,%rcx
   62fb5:	jne    62e59 <fastgzip::enc::scan::<13, true, false>+0x649>
   62fbb:	nopl   0x0(%rax,%rax,1)
   62fc0:	mov    0x10(%rsp),%r15
   62fc5:	sub    %r12,%r15
   62fc8:	cmp    $0x102,%r15
   62fcf:	mov    $0x102,%ecx
   62fd4:	cmovb  %r15,%rcx
   62fd8:	lea    (%r12,%r13,1),%rdx
   62fdc:	lea    (%rdi,%r13,1),%rsi
   62fe0:	mov    $0x8,%r8d
   62fe6:	cmp    $0x10,%r15
   62fea:	mov    (%rsp),%r14
   62fee:	jb     6301d <fastgzip::enc::scan::<13, true, false>+0x80d>
   62ff0:	mov    $0x8,%r15d
   62ff6:	cs nopw 0x0(%rax,%rax,1)
   63000:	mov    (%rdx,%r15,1),%r8
   63004:	mov    (%rsi,%r15,1),%rbp
   63008:	cmp    %rbp,%r8
   6300b:	jne    6304f <fastgzip::enc::scan::<13, true, false>+0x83f>
   6300d:	lea    0x8(%r15),%r8
   63011:	add    $0x10,%r15
   63015:	cmp    %rcx,%r15
   63018:	mov    %r8,%r15
   6301b:	jbe    63000 <fastgzip::enc::scan::<13, true, false>+0x7f0>
   6301d:	cmp    %rcx,%r8
   63020:	jae    62e66 <fastgzip::enc::scan::<13, true, false>+0x656>
   63026:	cs nopw 0x0(%rax,%rax,1)
   63030:	movzbl (%rdx,%r8,1),%ebp
   63035:	cmp    (%rsi,%r8,1),%bpl
   63039:	jne    62e66 <fastgzip::enc::scan::<13, true, false>+0x656>
   6303f:	inc    %r8
   63042:	cmp    %r8,%rcx
   63045:	jne    63030 <fastgzip::enc::scan::<13, true, false>+0x820>
   63047:	mov    %rcx,%r8
   6304a:	jmp    62e66 <fastgzip::enc::scan::<13, true, false>+0x656>
   6304f:	xor    %r8,%rbp
   63052:	tzcnt  %rbp,%r8
   63057:	shr    $0x3,%r8d
   6305b:	add    %r15,%r8
   6305e:	jmp    62e66 <fastgzip::enc::scan::<13, true, false>+0x656>
   63063:	and    $0xfffffffe,%ebp
   63066:	xor    %ebx,%ebx
   63068:	mov    0x60(%rsp),%r12
   6306d:	cmpb   $0x0,0x68(%rsp)
   63072:	jne    62930 <fastgzip::enc::scan::<13, true, false>+0x120>
   63078:	jmp    6294f <fastgzip::enc::scan::<13, true, false>+0x13f>
   6307d:	mov    %r10,%rbx
   63080:	mov    %r8,%r12
   63083:	mov    (%rsp),%r14
   63087:	jmp    62985 <fastgzip::enc::scan::<13, true, false>+0x175>
   6308c:	lea    0x5ca65(%rip),%rdx        # bfaf8 <anon.9d8ef70180f99d61d317e85a697ff310.22.llvm.1912574670506489297+0x480>
   63093:	mov    $0x240,%esi
   63098:	mov    %rbx,%rdi
   6309b:	call   *0x5efef(%rip)        # c2090 <_DYNAMIC+0x3d0>
   630a1:	int3
   630a2:	int3
   630a3:	int3
   630a4:	int3
   630a5:	int3
   630a6:	int3
   630a7:	int3
   630a8:	int3
   630a9:	int3
   630aa:	int3
   630ab:	int3
   630ac:	int3
   630ad:	int3
   630ae:	int3
   630af:	int3
