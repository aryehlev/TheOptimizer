00000000000558a0 <fastgzip_safe::enc::scan::<13, true, false>>:
   558a0:	push   %rbp
   558a1:	push   %r15
   558a3:	push   %r14
   558a5:	push   %r13
   558a7:	push   %r12
   558a9:	push   %rbx
   558aa:	sub    $0x28,%rsp
   558ae:	mov    %r8,%r15
   558b1:	mov    %rsi,%r13
   558b4:	mov    %rdi,%rbx
   558b7:	movzwl 0x60(%rsp),%esi
   558bc:	mov    0x80(%rsp),%edx
   558c3:	mov    0x78(%rsp),%rcx
   558c8:	mov    0x70(%rsp),%r10
   558cd:	xor    %eax,%eax
   558cf:	mov    %esi,%edi
   558d1:	sub    $0x9,%di
   558d5:	cmovb  %eax,%edi
   558d8:	mov    %rsi,0x18(%rsp)
   558dd:	mov    %esi,%r8d
   558e0:	sub    $0xc,%r8w
   558e5:	cmovb  %eax,%r8d
   558e9:	mov    %ecx,%eax
   558eb:	shr    $0x3,%eax
   558ee:	movzwl %ax,%r12d
   558f2:	test   $0x1,%dl
   558f5:	je     55981 <fastgzip_safe::enc::scan::<13, true, false>+0xe1>
   558fb:	mov    0x890(%rbx),%ebp
   55901:	mov    %ebp,%r11d
   55904:	shr    $0x3,%r11d
   55908:	cmp    $0x400,%rbp
   5590f:	jae    55a17 <fastgzip_safe::enc::scan::<13, true, false>+0x177>
   55915:	movups 0x904(%rbx),%xmm0
   5591c:	movups %xmm0,0x70(%r10,%r12,1)
   55922:	movups 0x8f4(%rbx),%xmm0
   55929:	movups %xmm0,0x60(%r10,%r12,1)
   5592f:	movups 0x8e4(%rbx),%xmm0
   55936:	movups %xmm0,0x50(%r10,%r12,1)
   5593c:	movups 0x8d4(%rbx),%xmm0
   55943:	movups %xmm0,0x40(%r10,%r12,1)
   55949:	movups 0x894(%rbx),%xmm0
   55950:	movups 0x8a4(%rbx),%xmm1
   55957:	movups 0x8b4(%rbx),%xmm2
   5595e:	movups 0x8c4(%rbx),%xmm3
   55965:	movups %xmm3,0x30(%r10,%r12,1)
   5596b:	movups %xmm2,0x20(%r10,%r12,1)
   55971:	movups %xmm1,0x10(%r10,%r12,1)
   55977:	movups %xmm0,(%r10,%r12,1)
   5597c:	jmp    55a7b <fastgzip_safe::enc::scan::<13, true, false>+0x1db>
   55981:	mov    %ecx,%ebp
   55983:	and    $0x7,%cl
   55986:	mov    $0xffffffff,%r14d
   5598c:	shl    %cl,%r14d
   5598f:	and    $0x7,%ebp
   55992:	movzbl (%r10,%r12,1),%eax
   55997:	not    %r14d
   5599a:	and    %eax,%r14d
   5599d:	movzwl %di,%eax
   559a0:	cmpb   $0x0,0x68(%rsp)
   559a5:	mov    %rax,0x10(%rsp)
   559aa:	je     559da <fastgzip_safe::enc::scan::<13, true, false>+0x13a>
   559ac:	mov    $0x4000,%edx
   559b1:	mov    %r13,%rdi
   559b4:	xor    %esi,%esi
   559b6:	mov    %r8d,0x20(%rsp)
   559bb:	mov    %r9d,0x8(%rsp)
   559c0:	call   *0x6c09a(%rip)        # c1a60 <memset@GLIBC_2.2.5>
   559c6:	mov    0x8(%rsp),%r9d
   559cb:	mov    0x20(%rsp),%r8d
   559d0:	mov    0x10(%rsp),%rax
   559d5:	mov    0x70(%rsp),%r10
   559da:	test   %r9w,%r9w
   559de:	je     55a06 <fastgzip_safe::enc::scan::<13, true, false>+0x166>
   559e0:	movzwl %r9w,%edi
   559e4:	cmp    %ax,%r9w
   559e8:	jb     55afd <fastgzip_safe::enc::scan::<13, true, false>+0x25d>
   559ee:	mov    0x18(%rsp),%rsi
   559f3:	cmp    %rsi,%rdi
   559f6:	ja     5615e <fastgzip_safe::enc::scan::<13, true, false>+0x8be>
   559fc:	mov    0x70(%rsp),%r10
   55a01:	jmp    55f9d <fastgzip_safe::enc::scan::<13, true, false>+0x6fd>
   55a06:	cmp    $0x2,%ax
   55a0a:	jae    55abc <fastgzip_safe::enc::scan::<13, true, false>+0x21c>
   55a10:	xor    %edi,%edi
   55a12:	jmp    55f98 <fastgzip_safe::enc::scan::<13, true, false>+0x6f8>
   55a17:	lea    (%r11,%r12,1),%rsi
   55a1b:	cmp    $0x10081,%rsi
   55a22:	jae    56187 <fastgzip_safe::enc::scan::<13, true, false>+0x8e7>
   55a28:	cmp    $0x1208,%ebp
   55a2e:	jae    56170 <fastgzip_safe::enc::scan::<13, true, false>+0x8d0>
   55a34:	lea    0x894(%rbx),%rsi
   55a3b:	mov    %edi,0x10(%rsp)
   55a3f:	lea    (%r10,%r12,1),%rdi
   55a43:	mov    %r11,%rdx
   55a46:	mov    %r8d,%r14d
   55a49:	mov    %r9d,0x8(%rsp)
   55a4e:	mov    %r11,0x20(%rsp)
   55a53:	call   *0x6be5f(%rip)        # c18b8 <memcpy@GLIBC_2.14>
   55a59:	mov    0x20(%rsp),%r11
   55a5e:	mov    0x10(%rsp),%edi
   55a62:	mov    0x8(%rsp),%r9d
   55a67:	mov    %r14d,%r8d
   55a6a:	mov    0x70(%rsp),%r10
   55a6f:	cmp    $0x1200,%ebp
   55a75:	jae    561ae <fastgzip_safe::enc::scan::<13, true, false>+0x90e>
   55a7b:	and    $0x7,%ebp
   55a7e:	mov    $0xffffffff,%r14d
   55a84:	mov    %ebp,%ecx
   55a86:	shl    %cl,%r14d
   55a89:	movzbl 0x894(%rbx,%r11,1),%eax
   55a92:	not    %r14d
   55a95:	and    %eax,%r14d
   55a98:	testl  $0x100,0x80(%rsp)
   55aa3:	jne    56143 <fastgzip_safe::enc::scan::<13, true, false>+0x8a3>
   55aa9:	test   %r11,%r11
   55aac:	je     5613f <fastgzip_safe::enc::scan::<13, true, false>+0x89f>
   55ab2:	andb   $0xfe,(%r10,%r12,1)
   55ab7:	jmp    56143 <fastgzip_safe::enc::scan::<13, true, false>+0x8a3>
   55abc:	movzbl (%r15),%eax
   55ac0:	mov    (%rbx,%rax,4),%eax
   55ac3:	movzwl %ax,%edx
   55ac6:	mov    %ebp,%ecx
   55ac8:	shl    %cl,%rdx
   55acb:	or     %r14,%rdx
   55ace:	shr    $0x10,%eax
   55ad1:	add    %ebp,%eax
   55ad3:	movzwl %r12w,%ecx
   55ad7:	mov    %rdx,(%r10,%rcx,1)
   55adb:	mov    %eax,%ecx
   55add:	shr    $0x3,%ecx
   55ae0:	and    $0x7,%ecx
   55ae3:	add    %rcx,%r12
   55ae6:	mov    %eax,%ecx
   55ae8:	and    $0x38,%cl
   55aeb:	shr    %cl,%rdx
   55aee:	and    $0x18007,%eax
   55af3:	mov    $0x1,%edi
   55af8:	mov    %eax,%ebp
   55afa:	mov    %rdx,%r14
   55afd:	movzwl %r8w,%eax
   55b01:	mov    %rax,0x8(%rsp)
   55b06:	movabs $0xb185ebca87000000,%rdx
   55b10:	mov    (%r15,%rdi,1),%rsi
   55b14:	imul   %rdx,%rsi
   55b18:	shr    $0x33,%rsi
   55b1c:	mov    %rdi,%r11
   55b1f:	cmp    0x8(%rsp),%rdi
   55b24:	jae    55ca0 <fastgzip_safe::enc::scan::<13, true, false>+0x400>
   55b2a:	nopw   0x0(%rax,%rax,1)
   55b30:	mov    %r11,%rdi
   55b33:	mov    (%r15,%r11,1),%r9
   55b37:	movzwl 0x0(%r13,%rsi,2),%r8d
   55b3d:	mov    %di,0x0(%r13,%rsi,2)
   55b43:	mov    %r9,%rsi
   55b46:	shr    $0x8,%rsi
   55b4a:	imul   %rdx,%rsi
   55b4e:	shr    $0x33,%rsi
   55b52:	mov    (%r15,%r8,1),%rcx
   55b56:	xor    %r9,%rcx
   55b59:	test   %ecx,%ecx
   55b5b:	je     55d4a <fastgzip_safe::enc::scan::<13, true, false>+0x4aa>
   55b61:	movzbl %r9b,%eax
   55b65:	mov    (%rbx,%rax,4),%eax
   55b68:	movzwl %ax,%r10d
   55b6c:	mov    %ebp,%ecx
   55b6e:	shl    %cl,%r10
   55b71:	or     %r14,%r10
   55b74:	shr    $0x10,%eax
   55b77:	add    %ebp,%eax
   55b79:	mov    0x1(%r15,%rdi,1),%r9
   55b7e:	movzwl 0x0(%r13,%rsi,2),%r8d
   55b84:	lea    0x1(%rdi),%r11
   55b88:	mov    %r11w,0x0(%r13,%rsi,2)
   55b8e:	mov    %r9,%rsi
   55b91:	shr    $0x8,%rsi
   55b95:	imul   %rdx,%rsi
   55b99:	shr    $0x33,%rsi
   55b9d:	mov    (%r15,%r8,1),%rcx
   55ba1:	xor    %r9,%rcx
   55ba4:	test   %ecx,%ecx
   55ba6:	je     55df0 <fastgzip_safe::enc::scan::<13, true, false>+0x550>
   55bac:	movzbl %r9b,%ecx
   55bb0:	mov    %rdx,%r14
   55bb3:	mov    (%rbx,%rcx,4),%edx
   55bb6:	movzwl %dx,%r8d
   55bba:	mov    %eax,%ecx
   55bbc:	shl    %cl,%r8
   55bbf:	or     %r8,%r10
   55bc2:	shr    $0x10,%edx
   55bc5:	add    %eax,%edx
   55bc7:	mov    0x2(%r15,%rdi,1),%r9
   55bcc:	movzwl 0x0(%r13,%rsi,2),%r8d
   55bd2:	inc    %r11
   55bd5:	mov    %r11w,0x0(%r13,%rsi,2)
   55bdb:	mov    %r9,%rsi
   55bde:	shr    $0x8,%rsi
   55be2:	imul   %r14,%rsi
   55be6:	shr    $0x33,%rsi
   55bea:	mov    (%r15,%r8,1),%rcx
   55bee:	xor    %r9,%rcx
   55bf1:	test   %ecx,%ecx
   55bf3:	je     55de1 <fastgzip_safe::enc::scan::<13, true, false>+0x541>
   55bf9:	movzbl %r9b,%eax
   55bfd:	mov    (%rbx,%rax,4),%eax
   55c00:	movzwl %ax,%r8d
   55c04:	mov    %edx,%ecx
   55c06:	shl    %cl,%r8
   55c09:	or     %r8,%r10
   55c0c:	shr    $0x10,%eax
   55c0f:	add    %edx,%eax
   55c11:	mov    0x3(%r15,%rdi,1),%r9
   55c16:	movzwl 0x0(%r13,%rsi,2),%r8d
   55c1c:	inc    %r11
   55c1f:	mov    %r11w,0x0(%r13,%rsi,2)
   55c25:	mov    %r9,%rsi
   55c28:	shr    $0x8,%rsi
   55c2c:	imul   %r14,%rsi
   55c30:	shr    $0x33,%rsi
   55c34:	mov    (%r15,%r8,1),%rcx
   55c38:	xor    %r9,%rcx
   55c3b:	test   %ecx,%ecx
   55c3d:	je     55e03 <fastgzip_safe::enc::scan::<13, true, false>+0x563>
   55c43:	mov    %r14,%rdx
   55c46:	movzbl %r9b,%ecx
   55c4a:	mov    (%rbx,%rcx,4),%ebp
   55c4d:	movzwl %bp,%r14d
   55c51:	mov    %eax,%ecx
   55c53:	shl    %cl,%r14
   55c56:	or     %r10,%r14
   55c59:	shr    $0x10,%ebp
   55c5c:	add    %eax,%ebp
   55c5e:	movzwl %r12w,%eax
   55c62:	mov    0x70(%rsp),%rcx
   55c67:	mov    %r14,(%rcx,%rax,1)
   55c6b:	mov    %ebp,%eax
   55c6d:	shr    $0x3,%eax
   55c70:	and    $0x7,%eax
   55c73:	mov    %ebp,%ecx
   55c75:	and    $0x38,%cl
   55c78:	shr    %cl,%r14
   55c7b:	add    %rax,%r12
   55c7e:	and    $0xffff8007,%ebp
   55c84:	inc    %r11
   55c87:	cmp    0x8(%rsp),%r11
   55c8c:	jb     55b30 <fastgzip_safe::enc::scan::<13, true, false>+0x290>
   55c92:	add    $0x4,%rdi
   55c96:	cs nopw 0x0(%rax,%rax,1)
   55ca0:	mov    %r14,%r10
   55ca3:	mov    %ebp,%eax
   55ca5:	mov    %rdi,%r11
   55ca8:	cmp    0x10(%rsp),%rdi
   55cad:	jae    559ee <fastgzip_safe::enc::scan::<13, true, false>+0x14e>
   55cb3:	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   55cc0:	mov    (%r15,%r11,1),%r9
   55cc4:	movzwl 0x0(%r13,%rsi,2),%r8d
   55cca:	mov    %r11w,0x0(%r13,%rsi,2)
   55cd0:	mov    %r9,%rsi
   55cd3:	shr    $0x8,%rsi
   55cd7:	imul   %rdx,%rsi
   55cdb:	shr    $0x33,%rsi
   55cdf:	mov    (%r15,%r8,1),%rcx
   55ce3:	xor    %r9,%rcx
   55ce6:	test   %ecx,%ecx
   55ce8:	je     55df0 <fastgzip_safe::enc::scan::<13, true, false>+0x550>
   55cee:	movzbl %r9b,%ecx
   55cf2:	mov    (%rbx,%rcx,4),%edx
   55cf5:	movzwl %dx,%edi
   55cf8:	mov    %eax,%ecx
   55cfa:	shl    %cl,%rdi
   55cfd:	or     %rdi,%r10
   55d00:	shr    $0x10,%edx
   55d03:	add    %eax,%edx
   55d05:	inc    %r11
   55d08:	movzwl %r12w,%eax
   55d0c:	mov    0x70(%rsp),%rcx
   55d11:	mov    %r10,(%rcx,%rax,1)
   55d15:	mov    %edx,%ecx
   55d17:	mov    %edx,%eax
   55d19:	shr    $0x3,%edx
   55d1c:	and    $0x38,%cl
   55d1f:	shr    %cl,%r10
   55d22:	and    $0x7,%edx
   55d25:	add    %rdx,%r12
   55d28:	movabs $0xb185ebca87000000,%rdx
   55d32:	and    $0xffff8007,%eax
   55d37:	mov    0x10(%rsp),%rdi
   55d3c:	cmp    %r11,%rdi
   55d3f:	jne    55cc0 <fastgzip_safe::enc::scan::<13, true, false>+0x420>
   55d45:	jmp    55f8e <fastgzip_safe::enc::scan::<13, true, false>+0x6ee>
   55d4a:	mov    %rdi,%r11
   55d4d:	mov    %ebp,%eax
   55d4f:	mov    %r14,%r10
   55d52:	test   %rcx,%rcx
   55d55:	jne    55df9 <fastgzip_safe::enc::scan::<13, true, false>+0x559>
   55d5b:	nopl   0x0(%rax,%rax,1)
   55d60:	mov    0x18(%rsp),%rcx
   55d65:	sub    %r11,%rcx
   55d68:	cmp    $0x102,%rcx
   55d6f:	mov    $0x102,%edi
   55d74:	cmovb  %rcx,%rdi
   55d78:	lea    (%r15,%r8,1),%rdx
   55d7c:	mov    $0x8,%ebp
   55d81:	cmp    $0x10,%rcx
   55d85:	jb     55db1 <fastgzip_safe::enc::scan::<13, true, false>+0x511>
   55d87:	mov    $0x8,%r14d
   55d8d:	nopl   (%rax)
   55d90:	lea    (%r15,%r11,1),%rcx
   55d94:	mov    (%rcx,%r14,1),%rbp
   55d98:	mov    (%rdx,%r14,1),%rcx
   55d9c:	cmp    %rcx,%rbp
   55d9f:	jne    55e14 <fastgzip_safe::enc::scan::<13, true, false>+0x574>
   55da1:	lea    0x8(%r14),%rbp
   55da5:	add    $0x10,%r14
   55da9:	cmp    %rdi,%r14
   55dac:	mov    %rbp,%r14
   55daf:	jbe    55d90 <fastgzip_safe::enc::scan::<13, true, false>+0x4f0>
   55db1:	cmp    %rdi,%rbp
   55db4:	jae    55e30 <fastgzip_safe::enc::scan::<13, true, false>+0x590>
   55db6:	mov    %rdi,%r14
   55db9:	sub    $0x8,%r14
   55dbd:	mov    $0x0,%ecx
   55dc2:	cmovb  %rcx,%r14
   55dc6:	lea    (%r15,%r11,1),%rcx
   55dca:	mov    (%rcx,%r14,1),%rcx
   55dce:	mov    (%rdx,%r14,1),%rdx
   55dd2:	cmp    %rdx,%rcx
   55dd5:	je     55e30 <fastgzip_safe::enc::scan::<13, true, false>+0x590>
   55dd7:	xor    %rcx,%rdx
   55dda:	tzcnt  %rdx,%rdi
   55ddf:	jmp    55e1c <fastgzip_safe::enc::scan::<13, true, false>+0x57c>
   55de1:	add    $0x2,%rdi
   55de5:	mov    %rdi,%r11
   55de8:	mov    %edx,%eax
   55dea:	nopw   0x0(%rax,%rax,1)
   55df0:	test   %rcx,%rcx
   55df3:	je     55d60 <fastgzip_safe::enc::scan::<13, true, false>+0x4c0>
   55df9:	tzcnt  %rcx,%rdi
   55dfe:	shr    $0x3,%edi
   55e01:	jmp    55e30 <fastgzip_safe::enc::scan::<13, true, false>+0x590>
   55e03:	add    $0x3,%rdi
   55e07:	mov    %rdi,%r11
   55e0a:	test   %rcx,%rcx
   55e0d:	jne    55df9 <fastgzip_safe::enc::scan::<13, true, false>+0x559>
   55e0f:	jmp    55d60 <fastgzip_safe::enc::scan::<13, true, false>+0x4c0>
   55e14:	xor    %rbp,%rcx
   55e17:	tzcnt  %rcx,%rdi
   55e1c:	shr    $0x3,%edi
   55e1f:	add    %r14,%rdi
   55e22:	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   55e30:	not    %r8d
   55e33:	add    %r11d,%r8d
   55e36:	mov    $0x3f,%ecx
   55e3b:	bsr    %r8d,%ecx
   55e3f:	xor    $0x1f,%ecx
   55e42:	mov    %r8d,%r14d
   55e45:	cmp    $0x2,%r8d
   55e49:	jb     55e66 <fastgzip_safe::enc::scan::<13, true, false>+0x5c6>
   55e4b:	mov    $0x1e,%edx
   55e50:	sub    %ecx,%edx
   55e52:	bt     %edx,%r8d
   55e56:	mov    $0x0,%r14d
   55e5c:	adc    $0x3e,%r14d
   55e60:	sub    %ecx,%r14d
   55e63:	sub    %ecx,%r14d
   55e66:	cmp    $0x103,%rdi
   55e6d:	jae    5619c <fastgzip_safe::enc::scan::<13, true, false>+0x8fc>
   55e73:	and    $0x1f,%r14d
   55e77:	lea    0x1(%r11),%edx
   55e7b:	mov    %dx,0x0(%r13,%rsi,2)
   55e81:	mov    0x400(%rbx,%rdi,4),%ebp
   55e88:	mov    $0x1e,%edx
   55e8d:	sub    %ecx,%edx
   55e8f:	mov    $0x0,%ecx
   55e94:	cmovb  %ecx,%edx
   55e97:	mov    $0xffffffff,%esi
   55e9c:	mov    %edx,%ecx
   55e9e:	shl    %cl,%esi
   55ea0:	not    %esi
   55ea2:	and    %esi,%r8d
   55ea5:	mov    0x810(%rbx,%r14,4),%esi
   55ead:	shr    $0x10,%r9
   55eb1:	movabs $0xb185ebca87000000,%rcx
   55ebb:	imul   %rcx,%r9
   55ebf:	shr    $0x33,%r9
   55ec3:	lea    0x2(%r11),%ecx
   55ec7:	mov    %cx,0x0(%r13,%r9,2)
   55ecd:	mov    %ebp,%ecx
   55ecf:	shr    $0x13,%ecx
   55ed2:	and    $0x1f,%ecx
   55ed5:	movzwl %si,%r9d
   55ed9:	shr    $0x10,%esi
   55edc:	and    $0x7ffff,%ebp
   55ee2:	add    %ecx,%esi
   55ee4:	shl    %cl,%r9
   55ee7:	mov    %esi,%ecx
   55ee9:	shl    %cl,%r8
   55eec:	or     %rbp,%r9
   55eef:	or     %r9,%r8
   55ef2:	movzwl %r12w,%ecx
   55ef6:	mov    0x70(%rsp),%r14
   55efb:	mov    %r10,(%r14,%rcx,1)
   55eff:	mov    %eax,%r9d
   55f02:	shr    $0x3,%r9d
   55f06:	mov    %eax,%ecx
   55f08:	and    $0x38,%cl
   55f0b:	shr    %cl,%r10
   55f0e:	and    $0x7,%r9d
   55f12:	add    %r12,%r9
   55f15:	mov    %eax,%ebp
   55f17:	and    $0x7,%al
   55f19:	mov    %eax,%ecx
   55f1b:	shl    %cl,%r8
   55f1e:	or     %r10,%r8
   55f21:	and    $0xffff8007,%ebp
   55f27:	add    %edx,%ebp
   55f29:	add    %esi,%ebp
   55f2b:	movzwl %r9w,%eax
   55f2f:	mov    %r8,(%r14,%rax,1)
   55f33:	mov    %ebp,%r12d
   55f36:	shr    $0x3,%r12d
   55f3a:	and    $0x7,%r12d
   55f3e:	mov    %ebp,%ecx
   55f40:	and    $0x38,%cl
   55f43:	mov    %r8,%r14
   55f46:	shr    %cl,%r14
   55f49:	add    %r9,%r12
   55f4c:	add    %r11,%rdi
   55f4f:	and    $0xffff8007,%ebp
   55f55:	cmp    0x10(%rsp),%rdi
   55f5a:	jae    559ee <fastgzip_safe::enc::scan::<13, true, false>+0x14e>
   55f60:	lea    -0x1(%rdi),%eax
   55f63:	movzwl %ax,%eax
   55f66:	mov    (%r15,%rax,1),%rsi
   55f6a:	mov    %rsi,%rcx
   55f6d:	movabs $0xb185ebca87000000,%rdx
   55f77:	imul   %rdx,%rcx
   55f7b:	shr    $0x33,%rcx
   55f7f:	mov    %ax,0x0(%r13,%rcx,2)
   55f85:	shr    $0x8,%rsi
   55f89:	jmp    55b14 <fastgzip_safe::enc::scan::<13, true, false>+0x274>
   55f8e:	mov    %r10,%r14
   55f91:	mov    %eax,%ebp
   55f93:	mov    0x70(%rsp),%r10
   55f98:	mov    0x18(%rsp),%rsi
   55f9d:	sub    %rdi,%rsi
   55fa0:	add    %rdi,%r15
   55fa3:	mov    %esi,%r11d
   55fa6:	and    $0x3,%r11d
   55faa:	and    $0xfffc,%rsi
   55fb1:	je     5605f <fastgzip_safe::enc::scan::<13, true, false>+0x7bf>
   55fb7:	xor    %edi,%edi
   55fb9:	nopl   0x0(%rax)
   55fc0:	movzbl (%r15,%rdi,1),%eax
   55fc5:	mov    (%rbx,%rax,4),%eax
   55fc8:	movzwl %ax,%r9d
   55fcc:	mov    %ebp,%ecx
   55fce:	shl    %cl,%r9
   55fd1:	shr    $0x10,%eax
   55fd4:	add    %ebp,%eax
   55fd6:	movzbl 0x1(%r15,%rdi,1),%ecx
   55fdc:	mov    (%rbx,%rcx,4),%edx
   55fdf:	movzwl %dx,%r8d
   55fe3:	mov    %eax,%ecx
   55fe5:	shl    %cl,%r8
   55fe8:	or     %r9,%r14
   55feb:	or     %r14,%r8
   55fee:	shr    $0x10,%edx
   55ff1:	add    %eax,%edx
   55ff3:	movzbl 0x2(%r15,%rdi,1),%eax
   55ff9:	mov    (%rbx,%rax,4),%eax
   55ffc:	movzwl %ax,%r9d
   56000:	mov    %edx,%ecx
   56002:	shl    %cl,%r9
   56005:	shr    $0x10,%eax
   56008:	add    %edx,%eax
   5600a:	movzbl 0x3(%r15,%rdi,1),%ecx
   56010:	mov    (%rbx,%rcx,4),%ebp
   56013:	movzwl %bp,%r14d
   56017:	mov    %eax,%ecx
   56019:	shl    %cl,%r14
   5601c:	or     %r8,%r9
   5601f:	or     %r9,%r14
   56022:	shr    $0x10,%ebp
   56025:	add    %eax,%ebp
   56027:	movzwl %r12w,%eax
   5602b:	mov    %r14,(%r10,%rax,1)
   5602f:	mov    %ebp,%edx
   56031:	shr    $0x3,%edx
   56034:	and    $0x7,%edx
   56037:	add    %r12,%rdx
   5603a:	mov    %ebp,%ecx
   5603c:	and    $0x38,%cl
   5603f:	shr    %cl,%r14
   56042:	and    $0xffff8007,%ebp
   56048:	add    $0x4,%rdi
   5604c:	mov    %rdx,%r12
   5604f:	cmp    %rdi,%rsi
   56052:	jne    55fc0 <fastgzip_safe::enc::scan::<13, true, false>+0x720>
   56058:	test   %r11,%r11
   5605b:	jne    56067 <fastgzip_safe::enc::scan::<13, true, false>+0x7c7>
   5605d:	jmp    560bf <fastgzip_safe::enc::scan::<13, true, false>+0x81f>
   5605f:	mov    %r12,%rdx
   56062:	test   %r11,%r11
   56065:	je     560bf <fastgzip_safe::enc::scan::<13, true, false>+0x81f>
   56067:	movzbl (%r15,%rsi,1),%eax
   5606c:	mov    (%rbx,%rax,4),%eax
   5606f:	movzwl %ax,%edi
   56072:	mov    %ebp,%ecx
   56074:	shl    %cl,%rdi
   56077:	or     %rdi,%r14
   5607a:	shr    $0x10,%eax
   5607d:	add    %ebp,%eax
   5607f:	cmp    $0x1,%r11d
   56083:	je     560bd <fastgzip_safe::enc::scan::<13, true, false>+0x81d>
   56085:	movzbl 0x1(%r15,%rsi,1),%ecx
   5608b:	mov    (%rbx,%rcx,4),%ebp
   5608e:	movzwl %bp,%edi
   56091:	mov    %eax,%ecx
   56093:	shl    %cl,%rdi
   56096:	or     %rdi,%r14
   56099:	shr    $0x10,%ebp
   5609c:	add    %eax,%ebp
   5609e:	cmp    $0x2,%r11d
   560a2:	je     560bf <fastgzip_safe::enc::scan::<13, true, false>+0x81f>
   560a4:	movzbl 0x2(%r15,%rsi,1),%eax
   560aa:	mov    (%rbx,%rax,4),%eax
   560ad:	movzwl %ax,%esi
   560b0:	mov    %ebp,%ecx
   560b2:	shl    %cl,%rsi
   560b5:	or     %rsi,%r14
   560b8:	shr    $0x10,%eax
   560bb:	add    %ebp,%eax
   560bd:	mov    %eax,%ebp
   560bf:	movzwl %dx,%eax
   560c2:	mov    %r14,(%r10,%rax,1)
   560c6:	mov    %ebp,%esi
   560c8:	shr    $0x3,%esi
   560cb:	and    $0x7,%esi
   560ce:	add    %rdx,%rsi
   560d1:	mov    %ebp,%edx
   560d3:	and    $0xffff8007,%edx
   560d9:	testl  $0x10000,0x80(%rsp)
   560e4:	je     56121 <fastgzip_safe::enc::scan::<13, true, false>+0x881>
   560e6:	mov    %ebp,%ecx
   560e8:	and    $0x38,%cl
   560eb:	shr    %cl,%r14
   560ee:	mov    0x80c(%rbx),%eax
   560f4:	movzwl %ax,%edi
   560f7:	and    $0x7,%bpl
   560fb:	mov    %ebp,%ecx
   560fd:	shl    %cl,%rdi
   56100:	or     %r14,%rdi
   56103:	shr    $0x10,%eax
   56106:	add    %edx,%eax
   56108:	movzwl %si,%ecx
   5610b:	mov    %rdi,(%r10,%rcx,1)
   5610f:	mov    %eax,%ecx
   56111:	shr    $0x3,%ecx
   56114:	and    $0x7,%ecx
   56117:	add    %rcx,%rsi
   5611a:	and    $0xffff8007,%eax
   5611f:	mov    %eax,%edx
   56121:	xor    %eax,%eax
   56123:	cmp    $0x8,%edx
   56126:	mov    %edx,%ecx
   56128:	lea    (%rcx,%rsi,8),%rcx
   5612c:	cmovb  %rcx,%rax
   56130:	add    $0x28,%rsp
   56134:	pop    %rbx
   56135:	pop    %r12
   56137:	pop    %r13
   56139:	pop    %r14
   5613b:	pop    %r15
   5613d:	pop    %rbp
   5613e:	ret
   5613f:	and    $0xfffffffe,%r14d
   56143:	add    %r11,%r12
   56146:	movzwl %di,%eax
   56149:	cmpb   $0x0,0x68(%rsp)
   5614e:	mov    %rax,0x10(%rsp)
   56153:	je     559da <fastgzip_safe::enc::scan::<13, true, false>+0x13a>
   56159:	jmp    559ac <fastgzip_safe::enc::scan::<13, true, false>+0x10c>
   5615e:	lea    0x68dab(%rip),%rcx        # bef10 <anon.8e724d7618661fec6c01ee5922cf9775.29.llvm.6304857328360807621+0x3a8>
   56165:	mov    $0x10108,%edx
   5616a:	call   *0x6b760(%rip)        # c18d0 <_DYNAMIC+0x2a0>
   56170:	lea    0x68e11(%rip),%rcx        # bef88 <anon.9d8ef70180f99d61d317e85a697ff310.8.llvm.15343169443087543179+0x18>
   56177:	mov    $0x240,%edx
   5617c:	xor    %edi,%edi
   5617e:	mov    %r11,%rsi
   56181:	call   *0x6b749(%rip)        # c18d0 <_DYNAMIC+0x2a0>
   56187:	lea    0x68e12(%rip),%rcx        # befa0 <anon.9d8ef70180f99d61d317e85a697ff310.8.llvm.15343169443087543179+0x30>
   5618e:	mov    $0x10080,%edx
   56193:	mov    %r12,%rdi
   56196:	call   *0x6b734(%rip)        # c18d0 <_DYNAMIC+0x2a0>
   5619c:	lea    0x68d9d(%rip),%rdx        # bef40 <anon.8e724d7618661fec6c01ee5922cf9775.29.llvm.6304857328360807621+0x3d8>
   561a3:	mov    $0x103,%esi
   561a8:	call   *0x6b852(%rip)        # c1a00 <_DYNAMIC+0x3d0>
   561ae:	lea    0x68e03(%rip),%rdx        # befb8 <anon.9d8ef70180f99d61d317e85a697ff310.8.llvm.15343169443087543179+0x48>
   561b5:	mov    $0x240,%esi
   561ba:	mov    %r11,%rdi
   561bd:	call   *0x6b83d(%rip)        # c1a00 <_DYNAMIC+0x3d0>
   561c3:	int3
   561c4:	int3
   561c5:	int3
   561c6:	int3
   561c7:	int3
   561c8:	int3
   561c9:	int3
   561ca:	int3
   561cb:	int3
   561cc:	int3
   561cd:	int3
   561ce:	int3
   561cf:	int3
