0000000000062830 <fastgzip::enc::scan::<13, true, false>>:
   62830:	push   %rbp
   62831:	push   %r15
   62833:	push   %r14
   62835:	push   %r13
   62837:	push   %r12
   62839:	push   %rbx
   6283a:	sub    $0x28,%rsp
   6283e:	mov    %r8,%r13
   62841:	mov    %rdi,%r14
   62844:	mov    0x80(%rsp),%r12
   6284c:	mov    0x70(%rsp),%rdi
   62851:	bt     $0x20,%r12
   62856:	mov    %r9,0x10(%rsp)
   6285b:	mov    %rsi,0x8(%rsp)
   62860:	jb     62890 <fastgzip::enc::scan::<13, true, false>+0x60>
   62862:	movzbl (%rdi),%eax
   62865:	mov    $0xffffffffffffffff,%rbp
   6286c:	mov    %r12d,%ecx
   6286f:	shl    %cl,%rbp
   62872:	not    %ebp
   62874:	and    %eax,%ebp
   62876:	xor    %ebx,%ebx
   62878:	mov    %r12,%r15
   6287b:	mov    0x60(%rsp),%r12
   62880:	cmpb   $0x0,0x68(%rsp)
   62885:	jne    62950 <fastgzip::enc::scan::<13, true, false>+0x120>
   6288b:	jmp    6296f <fastgzip::enc::scan::<13, true, false>+0x13f>
   62890:	mov    0x890(%r14),%r15d
   62897:	mov    %r15d,%ebx
   6289a:	shr    $0x3,%ebx
   6289d:	lea    0x894(%r14),%rax
   628a4:	cmp    $0x3ff,%r15
   628ab:	ja     628ed <fastgzip::enc::scan::<13, true, false>+0xbd>
   628ad:	movups 0x70(%rax),%xmm0
   628b1:	movups %xmm0,0x70(%rdi)
   628b5:	movups 0x60(%rax),%xmm0
   628b9:	movups %xmm0,0x60(%rdi)
   628bd:	movups 0x50(%rax),%xmm0
   628c1:	movups %xmm0,0x50(%rdi)
   628c5:	movups 0x40(%rax),%xmm0
   628c9:	movups %xmm0,0x40(%rdi)
   628cd:	movups (%rax),%xmm0
   628d0:	movups 0x10(%rax),%xmm1
   628d4:	movups 0x20(%rax),%xmm2
   628d8:	movups 0x30(%rax),%xmm3
   628dc:	movups %xmm3,0x30(%rdi)
   628e0:	movups %xmm2,0x20(%rdi)
   628e4:	movups %xmm1,0x10(%rdi)
   628e8:	movups %xmm0,(%rdi)
   628eb:	jmp    6291b <fastgzip::enc::scan::<13, true, false>+0xeb>
   628ed:	mov    %rax,%rsi
   628f0:	mov    %rbx,%rdx
   628f3:	mov    %rax,%rbp
   628f6:	call   *0x5f66c(%rip)        # c1f68 <memcpy@GLIBC_2.14>
   628fc:	mov    %rbp,%rax
   628ff:	mov    0x8(%rsp),%rsi
   62904:	mov    0x10(%rsp),%r9
   62909:	mov    0x70(%rsp),%rdi
   6290e:	cmp    $0x11ff,%r15d
   62915:	ja     630ac <fastgzip::enc::scan::<13, true, false>+0x87c>
   6291b:	and    $0x7,%r15d
   6291f:	mov    $0xffffffff,%ebp
   62924:	mov    %r15d,%ecx
   62927:	shl    %cl,%ebp
   62929:	movzbl (%rax,%rbx,1),%eax
   6292d:	not    %ebp
   6292f:	and    %eax,%ebp
   62931:	bt     $0x28,%r12
   62936:	jb     62944 <fastgzip::enc::scan::<13, true, false>+0x114>
   62938:	test   %rbx,%rbx
   6293b:	je     63083 <fastgzip::enc::scan::<13, true, false>+0x853>
   62941:	andb   $0xfe,(%rdi)
   62944:	mov    0x60(%rsp),%r12
   62949:	cmpb   $0x0,0x68(%rsp)
   6294e:	je     6296f <fastgzip::enc::scan::<13, true, false>+0x13f>
   62950:	mov    $0x4000,%edx
   62955:	mov    %rsi,%rdi
   62958:	xor    %esi,%esi
   6295a:	call   *0x5f7b0(%rip)        # c2110 <memset@GLIBC_2.2.5>
   62960:	mov    0x8(%rsp),%rsi
   62965:	mov    0x10(%rsp),%r9
   6296a:	mov    0x70(%rsp),%rdi
   6296f:	xor    %eax,%eax
   62971:	mov    %r9,%r8
   62974:	sub    $0x9,%r8
   62978:	cmovb  %rax,%r8
   6297c:	sub    $0xc,%r9
   62980:	cmovb  %rax,%r9
   62984:	mov    %r9,0x20(%rsp)
   62989:	test   %r12,%r12
   6298c:	je     62998 <fastgzip::enc::scan::<13, true, false>+0x168>
   6298e:	cmp    %r8,%r12
   62991:	jae    629a5 <fastgzip::enc::scan::<13, true, false>+0x175>
   62993:	jmp    62bdc <fastgzip::enc::scan::<13, true, false>+0x3ac>
   62998:	cmp    $0x2,%r8
   6299c:	jae    62b99 <fastgzip::enc::scan::<13, true, false>+0x369>
   629a2:	xor    %r12d,%r12d
   629a5:	lea    0x4(%r12),%rax
   629aa:	mov    0x10(%rsp),%r11
   629af:	cmp    %r11,%rax
   629b2:	jbe    629c1 <fastgzip::enc::scan::<13, true, false>+0x191>
   629b4:	mov    %r12,%rdi
   629b7:	mov    0x70(%rsp),%r10
   629bc:	jmp    62a76 <fastgzip::enc::scan::<13, true, false>+0x246>
   629c1:	mov    0x70(%rsp),%r10
   629c6:	cs nopw 0x0(%rax,%rax,1)
   629d0:	movzbl 0x0(%r13,%r12,1),%eax
   629d6:	mov    (%r14,%rax,4),%eax
   629da:	movzwl %ax,%esi
   629dd:	mov    %r15d,%ecx
   629e0:	shl    %cl,%rsi
   629e3:	shr    $0x10,%eax
   629e6:	add    %r15d,%eax
   629e9:	movzbl 0x1(%r13,%r12,1),%ecx
   629ef:	mov    (%r14,%rcx,4),%edx
   629f3:	movzwl %dx,%edi
   629f6:	mov    %eax,%ecx
   629f8:	shl    %cl,%rdi
   629fb:	shr    $0x10,%edx
   629fe:	add    %eax,%edx
   62a00:	movzbl 0x2(%r13,%r12,1),%eax
   62a06:	mov    (%r14,%rax,4),%eax
   62a0a:	movzwl %ax,%r8d
   62a0e:	mov    %edx,%ecx
   62a10:	shl    %cl,%r8
   62a13:	or     %rsi,%rbp
   62a16:	or     %rbp,%rdi
   62a19:	or     %rdi,%r8
   62a1c:	shr    $0x10,%eax
   62a1f:	add    %edx,%eax
   62a21:	movzbl 0x3(%r13,%r12,1),%ecx
   62a27:	mov    (%r14,%rcx,4),%r15d
   62a2b:	movzwl %r15w,%ebp
   62a2f:	mov    %eax,%ecx
   62a31:	shl    %cl,%rbp
   62a34:	mov    %rbx,%rcx
   62a37:	or     %r8,%rbp
   62a3a:	shr    $0x10,%r15d
   62a3e:	add    %eax,%r15d
   62a41:	mov    %rbp,(%r10,%rbx,1)
   62a45:	mov    %r15d,%ebx
   62a48:	shr    $0x3,%ebx
   62a4b:	and    $0x7,%ebx
   62a4e:	add    %rcx,%rbx
   62a51:	mov    %r15d,%ecx
   62a54:	and    $0x38,%cl
   62a57:	shr    %cl,%rbp
   62a5a:	and    $0xffff8007,%r15d
   62a61:	lea    0x4(%r12),%rdi
   62a66:	add    $0x8,%r12
   62a6a:	cmp    %r11,%r12
   62a6d:	mov    %rdi,%r12
   62a70:	jbe    629d0 <fastgzip::enc::scan::<13, true, false>+0x1a0>
   62a76:	cmp    %rdi,%r11
   62a79:	jbe    62a9a <fastgzip::enc::scan::<13, true, false>+0x26a>
   62a7b:	mov    %r11d,%eax
   62a7e:	sub    %edi,%eax
   62a80:	lea    0x1(%rdi),%rdx
   62a84:	test   $0x1,%al
   62a86:	mov    0x80(%rsp),%r9
   62a8e:	jne    62aaa <fastgzip::enc::scan::<13, true, false>+0x27a>
   62a90:	cmp    %rdx,%r11
   62a93:	jne    62ad4 <fastgzip::enc::scan::<13, true, false>+0x2a4>
   62a95:	jmp    62b1f <fastgzip::enc::scan::<13, true, false>+0x2ef>
   62a9a:	mov    %r15d,%eax
   62a9d:	mov    %rbp,%rsi
   62aa0:	mov    0x80(%rsp),%r9
   62aa8:	jmp    62b1f <fastgzip::enc::scan::<13, true, false>+0x2ef>
   62aaa:	movzbl 0x0(%r13,%rdi,1),%eax
   62ab0:	mov    (%r14,%rax,4),%eax
   62ab4:	movzwl %ax,%esi
   62ab7:	mov    %r15d,%ecx
   62aba:	shl    %cl,%rsi
   62abd:	or     %rbp,%rsi
   62ac0:	shr    $0x10,%eax
   62ac3:	add    %r15d,%eax
   62ac6:	mov    %rdx,%rdi
   62ac9:	mov    %rsi,%rbp
   62acc:	mov    %eax,%r15d
   62acf:	cmp    %rdx,%r11
   62ad2:	je     62b1f <fastgzip::enc::scan::<13, true, false>+0x2ef>
   62ad4:	mov    %rbp,%rsi
   62ad7:	mov    %r15d,%eax
   62ada:	nopw   0x0(%rax,%rax,1)
   62ae0:	movzbl 0x0(%r13,%rdi,1),%ecx
   62ae6:	mov    (%r14,%rcx,4),%edx
   62aea:	movzwl %dx,%r8d
   62aee:	mov    %eax,%ecx
   62af0:	shl    %cl,%r8
   62af3:	or     %r8,%rsi
   62af6:	shr    $0x10,%edx
   62af9:	add    %eax,%edx
   62afb:	movzbl 0x1(%r13,%rdi,1),%eax
   62b01:	mov    (%r14,%rax,4),%eax
   62b05:	movzwl %ax,%r8d
   62b09:	mov    %edx,%ecx
   62b0b:	shl    %cl,%r8
   62b0e:	or     %r8,%rsi
   62b11:	shr    $0x10,%eax
   62b14:	add    %edx,%eax
   62b16:	add    $0x2,%rdi
   62b1a:	cmp    %rdi,%r11
   62b1d:	jne    62ae0 <fastgzip::enc::scan::<13, true, false>+0x2b0>
   62b1f:	mov    %rsi,(%r10,%rbx,1)
   62b23:	mov    %eax,%edx
   62b25:	shr    $0x3,%edx
   62b28:	and    $0x7,%edx
   62b2b:	add    %rbx,%rdx
   62b2e:	mov    %eax,%edi
   62b30:	and    $0xffff8007,%edi
   62b36:	bt     $0x30,%r9
   62b3b:	jae    62b7b <fastgzip::enc::scan::<13, true, false>+0x34b>
   62b3d:	mov    %eax,%ecx
   62b3f:	and    $0x38,%cl
   62b42:	shr    %cl,%rsi
   62b45:	mov    0x80c(%r14),%r8d
   62b4c:	movzwl %r8w,%r9d
   62b50:	and    $0x7,%al
   62b52:	mov    %eax,%ecx
   62b54:	shl    %cl,%r9
   62b57:	or     %rsi,%r9
   62b5a:	shr    $0x10,%r8d
   62b5e:	add    %edi,%r8d
   62b61:	mov    %r9,(%r10,%rdx,1)
   62b65:	mov    %r8d,%eax
   62b68:	shr    $0x3,%eax
   62b6b:	and    $0x7,%eax
   62b6e:	add    %rax,%rdx
   62b71:	and    $0xffff8007,%r8d
   62b78:	mov    %r8d,%edi
   62b7b:	xor    %eax,%eax
   62b7d:	cmp    $0x8,%edi
   62b80:	mov    %edi,%ecx
   62b82:	lea    (%rcx,%rdx,8),%rcx
   62b86:	cmovb  %rcx,%rax
   62b8a:	add    $0x28,%rsp
   62b8e:	pop    %rbx
   62b8f:	pop    %r12
   62b91:	pop    %r13
   62b93:	pop    %r14
   62b95:	pop    %r15
   62b97:	pop    %rbp
   62b98:	ret
   62b99:	movzbl 0x0(%r13),%eax
   62b9e:	mov    (%r14,%rax,4),%eax
   62ba2:	movzwl %ax,%edx
   62ba5:	mov    %r15d,%ecx
   62ba8:	shl    %cl,%rdx
   62bab:	or     %rbp,%rdx
   62bae:	shr    $0x10,%eax
   62bb1:	add    %r15d,%eax
   62bb4:	mov    %rdx,(%rdi,%rbx,1)
   62bb8:	mov    %eax,%ecx
   62bba:	shr    $0x3,%ecx
   62bbd:	and    $0x7,%ecx
   62bc0:	add    %rcx,%rbx
   62bc3:	mov    %eax,%ecx
   62bc5:	and    $0x38,%cl
   62bc8:	shr    %cl,%rdx
   62bcb:	and    $0xffff8007,%eax
   62bd0:	mov    $0x1,%r12d
   62bd6:	mov    %eax,%r15d
   62bd9:	mov    %rdx,%rbp
   62bdc:	mov    %r14,(%rsp)
   62be0:	mov    %r8,0x18(%rsp)
   62be5:	movabs $0xb185ebca87000000,%r14
   62bef:	mov    0x0(%r13,%r12,1),%r11
   62bf4:	mov    %rbx,%r10
   62bf7:	mov    %r12,%r8
   62bfa:	imul   %r14,%r11
   62bfe:	shr    $0x33,%r11
   62c02:	mov    %r8,%rdi
   62c05:	cmp    0x20(%rsp),%r8
   62c0a:	jae    62da0 <fastgzip::enc::scan::<13, true, false>+0x570>
   62c10:	mov    %r12,%rdx
   62c13:	mov    0x0(%r13,%r12,1),%rbx
   62c18:	movzwl (%rsi,%r11,2),%edi
   62c1d:	mov    %dx,(%rsi,%r11,2)
   62c22:	mov    %rbx,%r11
   62c25:	shr    $0x8,%r11
   62c29:	movabs $0xb185ebca87000000,%r14
   62c33:	imul   %r14,%r11
   62c37:	shr    $0x33,%r11
   62c3b:	mov    0x0(%r13,%rdi,1),%rcx
   62c40:	xor    %rbx,%rcx
   62c43:	test   %ecx,%ecx
   62c45:	je     62e4f <fastgzip::enc::scan::<13, true, false>+0x61f>
   62c4b:	movzbl %bl,%eax
   62c4e:	mov    (%rsp),%r8
   62c52:	mov    (%r8,%rax,4),%eax
   62c56:	movzwl %ax,%r9d
   62c5a:	mov    %r15d,%ecx
   62c5d:	shl    %cl,%r9
   62c60:	or     %rbp,%r9
   62c63:	shr    $0x10,%eax
   62c66:	add    %r15d,%eax
   62c69:	mov    0x1(%r13,%rdx,1),%rbx
   62c6e:	movzwl (%rsi,%r11,2),%edi
   62c73:	lea    0x1(%rdx),%r12
   62c77:	mov    %r12w,(%rsi,%r11,2)
   62c7c:	mov    %rbx,%r11
   62c7f:	shr    $0x8,%r11
   62c83:	imul   %r14,%r11
   62c87:	shr    $0x33,%r11
   62c8b:	mov    0x0(%r13,%rdi,1),%rcx
   62c90:	xor    %rbx,%rcx
   62c93:	test   %ecx,%ecx
   62c95:	je     62e70 <fastgzip::enc::scan::<13, true, false>+0x640>
   62c9b:	mov    %rdx,%r15
   62c9e:	movzbl %bl,%ecx
   62ca1:	mov    (%r8,%rcx,4),%edx
   62ca5:	movzwl %dx,%esi
   62ca8:	mov    %eax,%ecx
   62caa:	shl    %cl,%rsi
   62cad:	or     %rsi,%r9
   62cb0:	mov    0x8(%rsp),%rcx
   62cb5:	shr    $0x10,%edx
   62cb8:	add    %eax,%edx
   62cba:	mov    0x2(%r13,%r15,1),%rbx
   62cbf:	movzwl (%rcx,%r11,2),%edi
   62cc4:	inc    %r12
   62cc7:	mov    %r12w,(%rcx,%r11,2)
   62ccc:	mov    %rbx,%r11
   62ccf:	shr    $0x8,%r11
   62cd3:	imul   %r14,%r11
   62cd7:	shr    $0x33,%r11
   62cdb:	mov    0x0(%r13,%rdi,1),%rcx
   62ce0:	xor    %rbx,%rcx
   62ce3:	test   %ecx,%ecx
   62ce5:	je     62e62 <fastgzip::enc::scan::<13, true, false>+0x632>
   62ceb:	movzbl %bl,%eax
   62cee:	mov    (%r8,%rax,4),%eax
   62cf2:	movzwl %ax,%esi
   62cf5:	mov    %edx,%ecx
   62cf7:	shl    %cl,%rsi
   62cfa:	or     %rsi,%r9
   62cfd:	mov    0x8(%rsp),%rsi
   62d02:	shr    $0x10,%eax
   62d05:	add    %edx,%eax
   62d07:	mov    0x3(%r13,%r15,1),%rbx
   62d0c:	movzwl (%rsi,%r11,2),%edi
   62d11:	inc    %r12
   62d14:	mov    %r12w,(%rsi,%r11,2)
   62d19:	mov    %rbx,%r11
   62d1c:	shr    $0x8,%r11
   62d20:	imul   %r14,%r11
   62d24:	shr    $0x33,%r11
   62d28:	mov    %r13,%rdx
   62d2b:	mov    0x0(%r13,%rdi,1),%rcx
   62d30:	xor    %rbx,%rcx
   62d33:	test   %ecx,%ecx
   62d35:	je     62fc8 <fastgzip::enc::scan::<13, true, false>+0x798>
   62d3b:	mov    %r15,%rdi
   62d3e:	movzbl %bl,%ecx
   62d41:	mov    (%r8,%rcx,4),%r15d
   62d45:	movzwl %r15w,%ebp
   62d49:	mov    %eax,%ecx
   62d4b:	shl    %cl,%rbp
   62d4e:	or     %r9,%rbp
   62d51:	shr    $0x10,%r15d
   62d55:	add    %eax,%r15d
   62d58:	mov    0x70(%rsp),%rax
   62d5d:	mov    %rbp,(%rax,%r10,1)
   62d61:	mov    %r15d,%eax
   62d64:	shr    $0x3,%eax
   62d67:	and    $0x7,%eax
   62d6a:	mov    %r15d,%ecx
   62d6d:	and    $0x38,%cl
   62d70:	shr    %cl,%rbp
   62d73:	add    %rax,%r10
   62d76:	and    $0xffff8007,%r15d
   62d7d:	inc    %r12
   62d80:	cmp    0x20(%rsp),%r12
   62d85:	mov    %rdx,%r13
   62d88:	jb     62c10 <fastgzip::enc::scan::<13, true, false>+0x3e0>
   62d8e:	add    $0x4,%rdi
   62d92:	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   62da0:	mov    %r10,%rbx
   62da3:	mov    %rdi,%r12
   62da6:	mov    %rbp,%r9
   62da9:	mov    %r15d,%eax
   62dac:	mov    0x18(%rsp),%rdx
   62db1:	cmp    %rdx,%rdi
   62db4:	movabs $0xb185ebca87000000,%r8
   62dbe:	mov    (%rsp),%r14
   62dc2:	jae    629a5 <fastgzip::enc::scan::<13, true, false>+0x175>
   62dc8:	nopl   0x0(%rax,%rax,1)
   62dd0:	mov    0x0(%r13,%r12,1),%rbx
   62dd5:	movzwl (%rsi,%r11,2),%edi
   62dda:	mov    %r12w,(%rsi,%r11,2)
   62ddf:	mov    %rbx,%r11
   62de2:	shr    $0x8,%r11
   62de6:	imul   %r8,%r11
   62dea:	shr    $0x33,%r11
   62dee:	mov    0x0(%r13,%rdi,1),%rcx
   62df3:	xor    %rbx,%rcx
   62df6:	test   %ecx,%ecx
   62df8:	je     62e70 <fastgzip::enc::scan::<13, true, false>+0x640>
   62dfa:	movzbl %bl,%ecx
   62dfd:	mov    (%r14,%rcx,4),%r15d
   62e01:	movzwl %r15w,%ebp
   62e05:	mov    %eax,%ecx
   62e07:	shl    %cl,%rbp
   62e0a:	or     %r9,%rbp
   62e0d:	shr    $0x10,%r15d
   62e11:	add    %eax,%r15d
   62e14:	inc    %r12
   62e17:	mov    0x70(%rsp),%rax
   62e1c:	mov    %rbp,(%rax,%r10,1)
   62e20:	mov    %r15d,%ebx
   62e23:	shr    $0x3,%ebx
   62e26:	and    $0x7,%ebx
   62e29:	add    %r10,%rbx
   62e2c:	mov    %r15d,%ecx
   62e2f:	and    $0x38,%cl
   62e32:	shr    %cl,%rbp
   62e35:	and    $0xffff8007,%r15d
   62e3c:	mov    %rbx,%r10
   62e3f:	mov    %rbp,%r9
   62e42:	mov    %r15d,%eax
   62e45:	cmp    %rdx,%r12
   62e48:	jb     62dd0 <fastgzip::enc::scan::<13, true, false>+0x5a0>
   62e4a:	jmp    629a5 <fastgzip::enc::scan::<13, true, false>+0x175>
   62e4f:	mov    %r15d,%eax
   62e52:	mov    %rbp,%r9
   62e55:	mov    %rdx,%r12
   62e58:	test   %rcx,%rcx
   62e5b:	jne    62e79 <fastgzip::enc::scan::<13, true, false>+0x649>
   62e5d:	jmp    62fe0 <fastgzip::enc::scan::<13, true, false>+0x7b0>
   62e62:	add    $0x2,%r15
   62e66:	mov    %edx,%eax
   62e68:	mov    %r15,%r12
   62e6b:	nopl   0x0(%rax,%rax,1)
   62e70:	test   %rcx,%rcx
   62e73:	je     62fe0 <fastgzip::enc::scan::<13, true, false>+0x7b0>
   62e79:	tzcnt  %rcx,%r8
   62e7e:	shr    $0x3,%r8d
   62e82:	mov    (%rsp),%r14
   62e86:	not    %edi
   62e88:	add    %r12d,%edi
   62e8b:	mov    $0x3f,%ecx
   62e90:	bsr    %edi,%ecx
   62e93:	xor    $0x1f,%ecx
   62e96:	mov    %edi,%edx
   62e98:	cmp    $0x2,%edi
   62e9b:	jb     62eb3 <fastgzip::enc::scan::<13, true, false>+0x683>
   62e9d:	mov    $0x1e,%edx
   62ea2:	sub    %ecx,%edx
   62ea4:	bt     %edx,%edi
   62ea7:	mov    $0x0,%edx
   62eac:	adc    $0x3e,%edx
   62eaf:	sub    %ecx,%edx
   62eb1:	sub    %ecx,%edx
   62eb3:	mov    $0x1e,%ebp
   62eb8:	sub    %ecx,%ebp
   62eba:	mov    $0x0,%ecx
   62ebf:	cmovb  %ecx,%ebp
   62ec2:	mov    %edx,%edx
   62ec4:	mov    $0xffffffff,%esi
   62ec9:	mov    %ebp,%ecx
   62ecb:	shl    %cl,%esi
   62ecd:	not    %esi
   62ecf:	and    %esi,%edi
   62ed1:	mov    0x400(%r14,%r8,4),%esi
   62ed9:	mov    0x810(%r14,%rdx,4),%edx
   62ee1:	mov    %esi,%ecx
   62ee3:	shr    $0x13,%ecx
   62ee6:	and    $0x1f,%ecx
   62ee9:	and    $0x7ffff,%esi
   62eef:	movzwl %dx,%r15d
   62ef3:	shl    %cl,%r15
   62ef6:	or     %rsi,%r15
   62ef9:	mov    %edx,%esi
   62efb:	shr    $0x10,%esi
   62efe:	add    %ecx,%esi
   62f00:	mov    %esi,%ecx
   62f02:	shl    %cl,%rdi
   62f05:	or     %r15,%rdi
   62f08:	mov    0x70(%rsp),%r14
   62f0d:	mov    %r9,(%r14,%r10,1)
   62f11:	mov    %eax,%ecx
   62f13:	and    $0x38,%cl
   62f16:	shr    %cl,%r9
   62f19:	mov    %eax,%edx
   62f1b:	shr    $0x3,%edx
   62f1e:	mov    %eax,%r15d
   62f21:	and    $0x7,%al
   62f23:	mov    %eax,%ecx
   62f25:	shl    %cl,%rdi
   62f28:	and    $0x7,%edx
   62f2b:	add    %r10,%rdx
   62f2e:	or     %r9,%rdi
   62f31:	mov    %rdi,(%r14,%rdx,1)
   62f35:	lea    0x1(%r12),%eax
   62f3a:	mov    0x8(%rsp),%r9
   62f3f:	mov    %ax,(%r9,%r11,2)
   62f44:	shr    $0x10,%rbx
   62f48:	movabs $0xb185ebca87000000,%r14
   62f52:	imul   %r14,%rbx
   62f56:	shr    $0x33,%rbx
   62f5a:	lea    0x2(%r12),%eax
   62f5f:	mov    %ax,(%r9,%rbx,2)
   62f64:	and    $0xffff8007,%r15d
   62f6b:	add    %ebp,%r15d
   62f6e:	add    %esi,%r15d
   62f71:	mov    %r15d,%r10d
   62f74:	shr    $0x3,%r10d
   62f78:	and    $0x7,%r10d
   62f7c:	mov    %r15d,%ecx
   62f7f:	and    $0x38,%cl
   62f82:	mov    %rdi,%rbp
   62f85:	shr    %cl,%rbp
   62f88:	add    %rdx,%r10
   62f8b:	add    %r12,%r8
   62f8e:	and    $0xffff8007,%r15d
   62f95:	cmp    0x18(%rsp),%r8
   62f9a:	jae    6309d <fastgzip::enc::scan::<13, true, false>+0x86d>
   62fa0:	lea    -0x1(%r8),%rax
   62fa4:	mov    -0x1(%r13,%r8,1),%r11
   62fa9:	mov    %r11,%rcx
   62fac:	imul   %r14,%rcx
   62fb0:	shr    $0x33,%rcx
   62fb4:	mov    %ax,(%r9,%rcx,2)
   62fb9:	shr    $0x8,%r11
   62fbd:	mov    %r8,%r12
   62fc0:	mov    %r9,%rsi
   62fc3:	jmp    62bfa <fastgzip::enc::scan::<13, true, false>+0x3ca>
   62fc8:	add    $0x3,%r15
   62fcc:	mov    %r15,%r12
   62fcf:	mov    %rdx,%r13
   62fd2:	test   %rcx,%rcx
   62fd5:	jne    62e79 <fastgzip::enc::scan::<13, true, false>+0x649>
   62fdb:	nopl   0x0(%rax,%rax,1)
   62fe0:	mov    0x10(%rsp),%r15
   62fe5:	sub    %r12,%r15
   62fe8:	cmp    $0x102,%r15
   62fef:	mov    $0x102,%ecx
   62ff4:	cmovb  %r15,%rcx
   62ff8:	lea    (%r12,%r13,1),%rdx
   62ffc:	lea    (%rdi,%r13,1),%rsi
   63000:	mov    $0x8,%r8d
   63006:	cmp    $0x10,%r15
   6300a:	mov    (%rsp),%r14
   6300e:	jb     6303d <fastgzip::enc::scan::<13, true, false>+0x80d>
   63010:	mov    $0x8,%r15d
   63016:	cs nopw 0x0(%rax,%rax,1)
   63020:	mov    (%rdx,%r15,1),%r8
   63024:	mov    (%rsi,%r15,1),%rbp
   63028:	cmp    %rbp,%r8
   6302b:	jne    6306f <fastgzip::enc::scan::<13, true, false>+0x83f>
   6302d:	lea    0x8(%r15),%r8
   63031:	add    $0x10,%r15
   63035:	cmp    %rcx,%r15
   63038:	mov    %r8,%r15
   6303b:	jbe    63020 <fastgzip::enc::scan::<13, true, false>+0x7f0>
   6303d:	cmp    %rcx,%r8
   63040:	jae    62e86 <fastgzip::enc::scan::<13, true, false>+0x656>
   63046:	cs nopw 0x0(%rax,%rax,1)
   63050:	movzbl (%rdx,%r8,1),%ebp
   63055:	cmp    (%rsi,%r8,1),%bpl
   63059:	jne    62e86 <fastgzip::enc::scan::<13, true, false>+0x656>
   6305f:	inc    %r8
   63062:	cmp    %r8,%rcx
   63065:	jne    63050 <fastgzip::enc::scan::<13, true, false>+0x820>
   63067:	mov    %rcx,%r8
   6306a:	jmp    62e86 <fastgzip::enc::scan::<13, true, false>+0x656>
   6306f:	xor    %r8,%rbp
   63072:	tzcnt  %rbp,%r8
   63077:	shr    $0x3,%r8d
   6307b:	add    %r15,%r8
   6307e:	jmp    62e86 <fastgzip::enc::scan::<13, true, false>+0x656>
   63083:	and    $0xfffffffe,%ebp
   63086:	xor    %ebx,%ebx
   63088:	mov    0x60(%rsp),%r12
   6308d:	cmpb   $0x0,0x68(%rsp)
   63092:	jne    62950 <fastgzip::enc::scan::<13, true, false>+0x120>
   63098:	jmp    6296f <fastgzip::enc::scan::<13, true, false>+0x13f>
   6309d:	mov    %r10,%rbx
   630a0:	mov    %r8,%r12
   630a3:	mov    (%rsp),%r14
   630a7:	jmp    629a5 <fastgzip::enc::scan::<13, true, false>+0x175>
   630ac:	lea    0x5ca65(%rip),%rdx        # bfb18 <anon.9d8ef70180f99d61d317e85a697ff310.22.llvm.4753765335101048590+0x480>
   630b3:	mov    $0x240,%esi
   630b8:	mov    %rbx,%rdi
   630bb:	call   *0x5efef(%rip)        # c20b0 <_DYNAMIC+0x3d0>
   630c1:	int3
   630c2:	int3
   630c3:	int3
   630c4:	int3
   630c5:	int3
   630c6:	int3
   630c7:	int3
   630c8:	int3
   630c9:	int3
   630ca:	int3
   630cb:	int3
   630cc:	int3
   630cd:	int3
   630ce:	int3
   630cf:	int3
