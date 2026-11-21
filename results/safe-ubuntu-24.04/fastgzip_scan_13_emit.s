0000000000062180 <fastgzip::enc::scan::<13, true, false>>:
   62180:	push   %rbp
   62181:	push   %r15
   62183:	push   %r14
   62185:	push   %r13
   62187:	push   %r12
   62189:	push   %rbx
   6218a:	sub    $0x28,%rsp
   6218e:	mov    %r8,%r13
   62191:	mov    %rdi,%r14
   62194:	mov    0x80(%rsp),%r12
   6219c:	mov    0x70(%rsp),%rdi
   621a1:	bt     $0x20,%r12
   621a6:	mov    %r9,0x10(%rsp)
   621ab:	mov    %rsi,0x8(%rsp)
   621b0:	jb     621e0 <fastgzip::enc::scan::<13, true, false>+0x60>
   621b2:	movzbl (%rdi),%eax
   621b5:	mov    $0xffffffffffffffff,%rbp
   621bc:	mov    %r12d,%ecx
   621bf:	shl    %cl,%rbp
   621c2:	not    %ebp
   621c4:	and    %eax,%ebp
   621c6:	xor    %ebx,%ebx
   621c8:	mov    %r12,%r15
   621cb:	mov    0x60(%rsp),%r12
   621d0:	cmpb   $0x0,0x68(%rsp)
   621d5:	jne    622a0 <fastgzip::enc::scan::<13, true, false>+0x120>
   621db:	jmp    622bf <fastgzip::enc::scan::<13, true, false>+0x13f>
   621e0:	mov    0x890(%r14),%r15d
   621e7:	mov    %r15d,%ebx
   621ea:	shr    $0x3,%ebx
   621ed:	lea    0x894(%r14),%rax
   621f4:	cmp    $0x3ff,%r15
   621fb:	ja     6223d <fastgzip::enc::scan::<13, true, false>+0xbd>
   621fd:	movups 0x70(%rax),%xmm0
   62201:	movups %xmm0,0x70(%rdi)
   62205:	movups 0x60(%rax),%xmm0
   62209:	movups %xmm0,0x60(%rdi)
   6220d:	movups 0x50(%rax),%xmm0
   62211:	movups %xmm0,0x50(%rdi)
   62215:	movups 0x40(%rax),%xmm0
   62219:	movups %xmm0,0x40(%rdi)
   6221d:	movups (%rax),%xmm0
   62220:	movups 0x10(%rax),%xmm1
   62224:	movups 0x20(%rax),%xmm2
   62228:	movups 0x30(%rax),%xmm3
   6222c:	movups %xmm3,0x30(%rdi)
   62230:	movups %xmm2,0x20(%rdi)
   62234:	movups %xmm1,0x10(%rdi)
   62238:	movups %xmm0,(%rdi)
   6223b:	jmp    6226b <fastgzip::enc::scan::<13, true, false>+0xeb>
   6223d:	mov    %rax,%rsi
   62240:	mov    %rbx,%rdx
   62243:	mov    %rax,%rbp
   62246:	call   *0x5f66c(%rip)        # c18b8 <memcpy@GLIBC_2.14>
   6224c:	mov    %rbp,%rax
   6224f:	mov    0x8(%rsp),%rsi
   62254:	mov    0x10(%rsp),%r9
   62259:	mov    0x70(%rsp),%rdi
   6225e:	cmp    $0x11ff,%r15d
   62265:	ja     629fc <fastgzip::enc::scan::<13, true, false>+0x87c>
   6226b:	and    $0x7,%r15d
   6226f:	mov    $0xffffffff,%ebp
   62274:	mov    %r15d,%ecx
   62277:	shl    %cl,%ebp
   62279:	movzbl (%rax,%rbx,1),%eax
   6227d:	not    %ebp
   6227f:	and    %eax,%ebp
   62281:	bt     $0x28,%r12
   62286:	jb     62294 <fastgzip::enc::scan::<13, true, false>+0x114>
   62288:	test   %rbx,%rbx
   6228b:	je     629d3 <fastgzip::enc::scan::<13, true, false>+0x853>
   62291:	andb   $0xfe,(%rdi)
   62294:	mov    0x60(%rsp),%r12
   62299:	cmpb   $0x0,0x68(%rsp)
   6229e:	je     622bf <fastgzip::enc::scan::<13, true, false>+0x13f>
   622a0:	mov    $0x4000,%edx
   622a5:	mov    %rsi,%rdi
   622a8:	xor    %esi,%esi
   622aa:	call   *0x5f7b0(%rip)        # c1a60 <memset@GLIBC_2.2.5>
   622b0:	mov    0x8(%rsp),%rsi
   622b5:	mov    0x10(%rsp),%r9
   622ba:	mov    0x70(%rsp),%rdi
   622bf:	xor    %eax,%eax
   622c1:	mov    %r9,%r8
   622c4:	sub    $0x9,%r8
   622c8:	cmovb  %rax,%r8
   622cc:	sub    $0xc,%r9
   622d0:	cmovb  %rax,%r9
   622d4:	mov    %r9,0x20(%rsp)
   622d9:	test   %r12,%r12
   622dc:	je     622e8 <fastgzip::enc::scan::<13, true, false>+0x168>
   622de:	cmp    %r8,%r12
   622e1:	jae    622f5 <fastgzip::enc::scan::<13, true, false>+0x175>
   622e3:	jmp    6252c <fastgzip::enc::scan::<13, true, false>+0x3ac>
   622e8:	cmp    $0x2,%r8
   622ec:	jae    624e9 <fastgzip::enc::scan::<13, true, false>+0x369>
   622f2:	xor    %r12d,%r12d
   622f5:	lea    0x4(%r12),%rax
   622fa:	mov    0x10(%rsp),%r11
   622ff:	cmp    %r11,%rax
   62302:	jbe    62311 <fastgzip::enc::scan::<13, true, false>+0x191>
   62304:	mov    %r12,%rdi
   62307:	mov    0x70(%rsp),%r10
   6230c:	jmp    623c6 <fastgzip::enc::scan::<13, true, false>+0x246>
   62311:	mov    0x70(%rsp),%r10
   62316:	cs nopw 0x0(%rax,%rax,1)
   62320:	movzbl 0x0(%r13,%r12,1),%eax
   62326:	mov    (%r14,%rax,4),%eax
   6232a:	movzwl %ax,%esi
   6232d:	mov    %r15d,%ecx
   62330:	shl    %cl,%rsi
   62333:	shr    $0x10,%eax
   62336:	add    %r15d,%eax
   62339:	movzbl 0x1(%r13,%r12,1),%ecx
   6233f:	mov    (%r14,%rcx,4),%edx
   62343:	movzwl %dx,%edi
   62346:	mov    %eax,%ecx
   62348:	shl    %cl,%rdi
   6234b:	shr    $0x10,%edx
   6234e:	add    %eax,%edx
   62350:	movzbl 0x2(%r13,%r12,1),%eax
   62356:	mov    (%r14,%rax,4),%eax
   6235a:	movzwl %ax,%r8d
   6235e:	mov    %edx,%ecx
   62360:	shl    %cl,%r8
   62363:	or     %rsi,%rbp
   62366:	or     %rbp,%rdi
   62369:	or     %rdi,%r8
   6236c:	shr    $0x10,%eax
   6236f:	add    %edx,%eax
   62371:	movzbl 0x3(%r13,%r12,1),%ecx
   62377:	mov    (%r14,%rcx,4),%r15d
   6237b:	movzwl %r15w,%ebp
   6237f:	mov    %eax,%ecx
   62381:	shl    %cl,%rbp
   62384:	mov    %rbx,%rcx
   62387:	or     %r8,%rbp
   6238a:	shr    $0x10,%r15d
   6238e:	add    %eax,%r15d
   62391:	mov    %rbp,(%r10,%rbx,1)
   62395:	mov    %r15d,%ebx
   62398:	shr    $0x3,%ebx
   6239b:	and    $0x7,%ebx
   6239e:	add    %rcx,%rbx
   623a1:	mov    %r15d,%ecx
   623a4:	and    $0x38,%cl
   623a7:	shr    %cl,%rbp
   623aa:	and    $0xffff8007,%r15d
   623b1:	lea    0x4(%r12),%rdi
   623b6:	add    $0x8,%r12
   623ba:	cmp    %r11,%r12
   623bd:	mov    %rdi,%r12
   623c0:	jbe    62320 <fastgzip::enc::scan::<13, true, false>+0x1a0>
   623c6:	cmp    %rdi,%r11
   623c9:	jbe    623ea <fastgzip::enc::scan::<13, true, false>+0x26a>
   623cb:	mov    %r11d,%eax
   623ce:	sub    %edi,%eax
   623d0:	lea    0x1(%rdi),%rdx
   623d4:	test   $0x1,%al
   623d6:	mov    0x80(%rsp),%r9
   623de:	jne    623fa <fastgzip::enc::scan::<13, true, false>+0x27a>
   623e0:	cmp    %rdx,%r11
   623e3:	jne    62424 <fastgzip::enc::scan::<13, true, false>+0x2a4>
   623e5:	jmp    6246f <fastgzip::enc::scan::<13, true, false>+0x2ef>
   623ea:	mov    %r15d,%eax
   623ed:	mov    %rbp,%rsi
   623f0:	mov    0x80(%rsp),%r9
   623f8:	jmp    6246f <fastgzip::enc::scan::<13, true, false>+0x2ef>
   623fa:	movzbl 0x0(%r13,%rdi,1),%eax
   62400:	mov    (%r14,%rax,4),%eax
   62404:	movzwl %ax,%esi
   62407:	mov    %r15d,%ecx
   6240a:	shl    %cl,%rsi
   6240d:	or     %rbp,%rsi
   62410:	shr    $0x10,%eax
   62413:	add    %r15d,%eax
   62416:	mov    %rdx,%rdi
   62419:	mov    %rsi,%rbp
   6241c:	mov    %eax,%r15d
   6241f:	cmp    %rdx,%r11
   62422:	je     6246f <fastgzip::enc::scan::<13, true, false>+0x2ef>
   62424:	mov    %rbp,%rsi
   62427:	mov    %r15d,%eax
   6242a:	nopw   0x0(%rax,%rax,1)
   62430:	movzbl 0x0(%r13,%rdi,1),%ecx
   62436:	mov    (%r14,%rcx,4),%edx
   6243a:	movzwl %dx,%r8d
   6243e:	mov    %eax,%ecx
   62440:	shl    %cl,%r8
   62443:	or     %r8,%rsi
   62446:	shr    $0x10,%edx
   62449:	add    %eax,%edx
   6244b:	movzbl 0x1(%r13,%rdi,1),%eax
   62451:	mov    (%r14,%rax,4),%eax
   62455:	movzwl %ax,%r8d
   62459:	mov    %edx,%ecx
   6245b:	shl    %cl,%r8
   6245e:	or     %r8,%rsi
   62461:	shr    $0x10,%eax
   62464:	add    %edx,%eax
   62466:	add    $0x2,%rdi
   6246a:	cmp    %rdi,%r11
   6246d:	jne    62430 <fastgzip::enc::scan::<13, true, false>+0x2b0>
   6246f:	mov    %rsi,(%r10,%rbx,1)
   62473:	mov    %eax,%edx
   62475:	shr    $0x3,%edx
   62478:	and    $0x7,%edx
   6247b:	add    %rbx,%rdx
   6247e:	mov    %eax,%edi
   62480:	and    $0xffff8007,%edi
   62486:	bt     $0x30,%r9
   6248b:	jae    624cb <fastgzip::enc::scan::<13, true, false>+0x34b>
   6248d:	mov    %eax,%ecx
   6248f:	and    $0x38,%cl
   62492:	shr    %cl,%rsi
   62495:	mov    0x80c(%r14),%r8d
   6249c:	movzwl %r8w,%r9d
   624a0:	and    $0x7,%al
   624a2:	mov    %eax,%ecx
   624a4:	shl    %cl,%r9
   624a7:	or     %rsi,%r9
   624aa:	shr    $0x10,%r8d
   624ae:	add    %edi,%r8d
   624b1:	mov    %r9,(%r10,%rdx,1)
   624b5:	mov    %r8d,%eax
   624b8:	shr    $0x3,%eax
   624bb:	and    $0x7,%eax
   624be:	add    %rax,%rdx
   624c1:	and    $0xffff8007,%r8d
   624c8:	mov    %r8d,%edi
   624cb:	xor    %eax,%eax
   624cd:	cmp    $0x8,%edi
   624d0:	mov    %edi,%ecx
   624d2:	lea    (%rcx,%rdx,8),%rcx
   624d6:	cmovb  %rcx,%rax
   624da:	add    $0x28,%rsp
   624de:	pop    %rbx
   624df:	pop    %r12
   624e1:	pop    %r13
   624e3:	pop    %r14
   624e5:	pop    %r15
   624e7:	pop    %rbp
   624e8:	ret
   624e9:	movzbl 0x0(%r13),%eax
   624ee:	mov    (%r14,%rax,4),%eax
   624f2:	movzwl %ax,%edx
   624f5:	mov    %r15d,%ecx
   624f8:	shl    %cl,%rdx
   624fb:	or     %rbp,%rdx
   624fe:	shr    $0x10,%eax
   62501:	add    %r15d,%eax
   62504:	mov    %rdx,(%rdi,%rbx,1)
   62508:	mov    %eax,%ecx
   6250a:	shr    $0x3,%ecx
   6250d:	and    $0x7,%ecx
   62510:	add    %rcx,%rbx
   62513:	mov    %eax,%ecx
   62515:	and    $0x38,%cl
   62518:	shr    %cl,%rdx
   6251b:	and    $0xffff8007,%eax
   62520:	mov    $0x1,%r12d
   62526:	mov    %eax,%r15d
   62529:	mov    %rdx,%rbp
   6252c:	mov    %r14,(%rsp)
   62530:	mov    %r8,0x18(%rsp)
   62535:	movabs $0xb185ebca87000000,%r14
   6253f:	mov    0x0(%r13,%r12,1),%r11
   62544:	mov    %rbx,%r10
   62547:	mov    %r12,%r8
   6254a:	imul   %r14,%r11
   6254e:	shr    $0x33,%r11
   62552:	mov    %r8,%rdi
   62555:	cmp    0x20(%rsp),%r8
   6255a:	jae    626f0 <fastgzip::enc::scan::<13, true, false>+0x570>
   62560:	mov    %r12,%rdx
   62563:	mov    0x0(%r13,%r12,1),%rbx
   62568:	movzwl (%rsi,%r11,2),%edi
   6256d:	mov    %dx,(%rsi,%r11,2)
   62572:	mov    %rbx,%r11
   62575:	shr    $0x8,%r11
   62579:	movabs $0xb185ebca87000000,%r14
   62583:	imul   %r14,%r11
   62587:	shr    $0x33,%r11
   6258b:	mov    0x0(%r13,%rdi,1),%rcx
   62590:	xor    %rbx,%rcx
   62593:	test   %ecx,%ecx
   62595:	je     6279f <fastgzip::enc::scan::<13, true, false>+0x61f>
   6259b:	movzbl %bl,%eax
   6259e:	mov    (%rsp),%r8
   625a2:	mov    (%r8,%rax,4),%eax
   625a6:	movzwl %ax,%r9d
   625aa:	mov    %r15d,%ecx
   625ad:	shl    %cl,%r9
   625b0:	or     %rbp,%r9
   625b3:	shr    $0x10,%eax
   625b6:	add    %r15d,%eax
   625b9:	mov    0x1(%r13,%rdx,1),%rbx
   625be:	movzwl (%rsi,%r11,2),%edi
   625c3:	lea    0x1(%rdx),%r12
   625c7:	mov    %r12w,(%rsi,%r11,2)
   625cc:	mov    %rbx,%r11
   625cf:	shr    $0x8,%r11
   625d3:	imul   %r14,%r11
   625d7:	shr    $0x33,%r11
   625db:	mov    0x0(%r13,%rdi,1),%rcx
   625e0:	xor    %rbx,%rcx
   625e3:	test   %ecx,%ecx
   625e5:	je     627c0 <fastgzip::enc::scan::<13, true, false>+0x640>
   625eb:	mov    %rdx,%r15
   625ee:	movzbl %bl,%ecx
   625f1:	mov    (%r8,%rcx,4),%edx
   625f5:	movzwl %dx,%esi
   625f8:	mov    %eax,%ecx
   625fa:	shl    %cl,%rsi
   625fd:	or     %rsi,%r9
   62600:	mov    0x8(%rsp),%rcx
   62605:	shr    $0x10,%edx
   62608:	add    %eax,%edx
   6260a:	mov    0x2(%r13,%r15,1),%rbx
   6260f:	movzwl (%rcx,%r11,2),%edi
   62614:	inc    %r12
   62617:	mov    %r12w,(%rcx,%r11,2)
   6261c:	mov    %rbx,%r11
   6261f:	shr    $0x8,%r11
   62623:	imul   %r14,%r11
   62627:	shr    $0x33,%r11
   6262b:	mov    0x0(%r13,%rdi,1),%rcx
   62630:	xor    %rbx,%rcx
   62633:	test   %ecx,%ecx
   62635:	je     627b2 <fastgzip::enc::scan::<13, true, false>+0x632>
   6263b:	movzbl %bl,%eax
   6263e:	mov    (%r8,%rax,4),%eax
   62642:	movzwl %ax,%esi
   62645:	mov    %edx,%ecx
   62647:	shl    %cl,%rsi
   6264a:	or     %rsi,%r9
   6264d:	mov    0x8(%rsp),%rsi
   62652:	shr    $0x10,%eax
   62655:	add    %edx,%eax
   62657:	mov    0x3(%r13,%r15,1),%rbx
   6265c:	movzwl (%rsi,%r11,2),%edi
   62661:	inc    %r12
   62664:	mov    %r12w,(%rsi,%r11,2)
   62669:	mov    %rbx,%r11
   6266c:	shr    $0x8,%r11
   62670:	imul   %r14,%r11
   62674:	shr    $0x33,%r11
   62678:	mov    %r13,%rdx
   6267b:	mov    0x0(%r13,%rdi,1),%rcx
   62680:	xor    %rbx,%rcx
   62683:	test   %ecx,%ecx
   62685:	je     62918 <fastgzip::enc::scan::<13, true, false>+0x798>
   6268b:	mov    %r15,%rdi
   6268e:	movzbl %bl,%ecx
   62691:	mov    (%r8,%rcx,4),%r15d
   62695:	movzwl %r15w,%ebp
   62699:	mov    %eax,%ecx
   6269b:	shl    %cl,%rbp
   6269e:	or     %r9,%rbp
   626a1:	shr    $0x10,%r15d
   626a5:	add    %eax,%r15d
   626a8:	mov    0x70(%rsp),%rax
   626ad:	mov    %rbp,(%rax,%r10,1)
   626b1:	mov    %r15d,%eax
   626b4:	shr    $0x3,%eax
   626b7:	and    $0x7,%eax
   626ba:	mov    %r15d,%ecx
   626bd:	and    $0x38,%cl
   626c0:	shr    %cl,%rbp
   626c3:	add    %rax,%r10
   626c6:	and    $0xffff8007,%r15d
   626cd:	inc    %r12
   626d0:	cmp    0x20(%rsp),%r12
   626d5:	mov    %rdx,%r13
   626d8:	jb     62560 <fastgzip::enc::scan::<13, true, false>+0x3e0>
   626de:	add    $0x4,%rdi
   626e2:	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   626f0:	mov    %r10,%rbx
   626f3:	mov    %rdi,%r12
   626f6:	mov    %rbp,%r9
   626f9:	mov    %r15d,%eax
   626fc:	mov    0x18(%rsp),%rdx
   62701:	cmp    %rdx,%rdi
   62704:	movabs $0xb185ebca87000000,%r8
   6270e:	mov    (%rsp),%r14
   62712:	jae    622f5 <fastgzip::enc::scan::<13, true, false>+0x175>
   62718:	nopl   0x0(%rax,%rax,1)
   62720:	mov    0x0(%r13,%r12,1),%rbx
   62725:	movzwl (%rsi,%r11,2),%edi
   6272a:	mov    %r12w,(%rsi,%r11,2)
   6272f:	mov    %rbx,%r11
   62732:	shr    $0x8,%r11
   62736:	imul   %r8,%r11
   6273a:	shr    $0x33,%r11
   6273e:	mov    0x0(%r13,%rdi,1),%rcx
   62743:	xor    %rbx,%rcx
   62746:	test   %ecx,%ecx
   62748:	je     627c0 <fastgzip::enc::scan::<13, true, false>+0x640>
   6274a:	movzbl %bl,%ecx
   6274d:	mov    (%r14,%rcx,4),%r15d
   62751:	movzwl %r15w,%ebp
   62755:	mov    %eax,%ecx
   62757:	shl    %cl,%rbp
   6275a:	or     %r9,%rbp
   6275d:	shr    $0x10,%r15d
   62761:	add    %eax,%r15d
   62764:	inc    %r12
   62767:	mov    0x70(%rsp),%rax
   6276c:	mov    %rbp,(%rax,%r10,1)
   62770:	mov    %r15d,%ebx
   62773:	shr    $0x3,%ebx
   62776:	and    $0x7,%ebx
   62779:	add    %r10,%rbx
   6277c:	mov    %r15d,%ecx
   6277f:	and    $0x38,%cl
   62782:	shr    %cl,%rbp
   62785:	and    $0xffff8007,%r15d
   6278c:	mov    %rbx,%r10
   6278f:	mov    %rbp,%r9
   62792:	mov    %r15d,%eax
   62795:	cmp    %rdx,%r12
   62798:	jb     62720 <fastgzip::enc::scan::<13, true, false>+0x5a0>
   6279a:	jmp    622f5 <fastgzip::enc::scan::<13, true, false>+0x175>
   6279f:	mov    %r15d,%eax
   627a2:	mov    %rbp,%r9
   627a5:	mov    %rdx,%r12
   627a8:	test   %rcx,%rcx
   627ab:	jne    627c9 <fastgzip::enc::scan::<13, true, false>+0x649>
   627ad:	jmp    62930 <fastgzip::enc::scan::<13, true, false>+0x7b0>
   627b2:	add    $0x2,%r15
   627b6:	mov    %edx,%eax
   627b8:	mov    %r15,%r12
   627bb:	nopl   0x0(%rax,%rax,1)
   627c0:	test   %rcx,%rcx
   627c3:	je     62930 <fastgzip::enc::scan::<13, true, false>+0x7b0>
   627c9:	tzcnt  %rcx,%r8
   627ce:	shr    $0x3,%r8d
   627d2:	mov    (%rsp),%r14
   627d6:	not    %edi
   627d8:	add    %r12d,%edi
   627db:	mov    $0x3f,%ecx
   627e0:	bsr    %edi,%ecx
   627e3:	xor    $0x1f,%ecx
   627e6:	mov    %edi,%edx
   627e8:	cmp    $0x2,%edi
   627eb:	jb     62803 <fastgzip::enc::scan::<13, true, false>+0x683>
   627ed:	mov    $0x1e,%edx
   627f2:	sub    %ecx,%edx
   627f4:	bt     %edx,%edi
   627f7:	mov    $0x0,%edx
   627fc:	adc    $0x3e,%edx
   627ff:	sub    %ecx,%edx
   62801:	sub    %ecx,%edx
   62803:	mov    $0x1e,%ebp
   62808:	sub    %ecx,%ebp
   6280a:	mov    $0x0,%ecx
   6280f:	cmovb  %ecx,%ebp
   62812:	mov    %edx,%edx
   62814:	mov    $0xffffffff,%esi
   62819:	mov    %ebp,%ecx
   6281b:	shl    %cl,%esi
   6281d:	not    %esi
   6281f:	and    %esi,%edi
   62821:	mov    0x400(%r14,%r8,4),%esi
   62829:	mov    0x810(%r14,%rdx,4),%edx
   62831:	mov    %esi,%ecx
   62833:	shr    $0x13,%ecx
   62836:	and    $0x1f,%ecx
   62839:	and    $0x7ffff,%esi
   6283f:	movzwl %dx,%r15d
   62843:	shl    %cl,%r15
   62846:	or     %rsi,%r15
   62849:	mov    %edx,%esi
   6284b:	shr    $0x10,%esi
   6284e:	add    %ecx,%esi
   62850:	mov    %esi,%ecx
   62852:	shl    %cl,%rdi
   62855:	or     %r15,%rdi
   62858:	mov    0x70(%rsp),%r14
   6285d:	mov    %r9,(%r14,%r10,1)
   62861:	mov    %eax,%ecx
   62863:	and    $0x38,%cl
   62866:	shr    %cl,%r9
   62869:	mov    %eax,%edx
   6286b:	shr    $0x3,%edx
   6286e:	mov    %eax,%r15d
   62871:	and    $0x7,%al
   62873:	mov    %eax,%ecx
   62875:	shl    %cl,%rdi
   62878:	and    $0x7,%edx
   6287b:	add    %r10,%rdx
   6287e:	or     %r9,%rdi
   62881:	mov    %rdi,(%r14,%rdx,1)
   62885:	lea    0x1(%r12),%eax
   6288a:	mov    0x8(%rsp),%r9
   6288f:	mov    %ax,(%r9,%r11,2)
   62894:	shr    $0x10,%rbx
   62898:	movabs $0xb185ebca87000000,%r14
   628a2:	imul   %r14,%rbx
   628a6:	shr    $0x33,%rbx
   628aa:	lea    0x2(%r12),%eax
   628af:	mov    %ax,(%r9,%rbx,2)
   628b4:	and    $0xffff8007,%r15d
   628bb:	add    %ebp,%r15d
   628be:	add    %esi,%r15d
   628c1:	mov    %r15d,%r10d
   628c4:	shr    $0x3,%r10d
   628c8:	and    $0x7,%r10d
   628cc:	mov    %r15d,%ecx
   628cf:	and    $0x38,%cl
   628d2:	mov    %rdi,%rbp
   628d5:	shr    %cl,%rbp
   628d8:	add    %rdx,%r10
   628db:	add    %r12,%r8
   628de:	and    $0xffff8007,%r15d
   628e5:	cmp    0x18(%rsp),%r8
   628ea:	jae    629ed <fastgzip::enc::scan::<13, true, false>+0x86d>
   628f0:	lea    -0x1(%r8),%rax
   628f4:	mov    -0x1(%r13,%r8,1),%r11
   628f9:	mov    %r11,%rcx
   628fc:	imul   %r14,%rcx
   62900:	shr    $0x33,%rcx
   62904:	mov    %ax,(%r9,%rcx,2)
   62909:	shr    $0x8,%r11
   6290d:	mov    %r8,%r12
   62910:	mov    %r9,%rsi
   62913:	jmp    6254a <fastgzip::enc::scan::<13, true, false>+0x3ca>
   62918:	add    $0x3,%r15
   6291c:	mov    %r15,%r12
   6291f:	mov    %rdx,%r13
   62922:	test   %rcx,%rcx
   62925:	jne    627c9 <fastgzip::enc::scan::<13, true, false>+0x649>
   6292b:	nopl   0x0(%rax,%rax,1)
   62930:	mov    0x10(%rsp),%r15
   62935:	sub    %r12,%r15
   62938:	cmp    $0x102,%r15
   6293f:	mov    $0x102,%ecx
   62944:	cmovb  %r15,%rcx
   62948:	lea    (%r12,%r13,1),%rdx
   6294c:	lea    (%rdi,%r13,1),%rsi
   62950:	mov    $0x8,%r8d
   62956:	cmp    $0x10,%r15
   6295a:	mov    (%rsp),%r14
   6295e:	jb     6298d <fastgzip::enc::scan::<13, true, false>+0x80d>
   62960:	mov    $0x8,%r15d
   62966:	cs nopw 0x0(%rax,%rax,1)
   62970:	mov    (%rdx,%r15,1),%r8
   62974:	mov    (%rsi,%r15,1),%rbp
   62978:	cmp    %rbp,%r8
   6297b:	jne    629bf <fastgzip::enc::scan::<13, true, false>+0x83f>
   6297d:	lea    0x8(%r15),%r8
   62981:	add    $0x10,%r15
   62985:	cmp    %rcx,%r15
   62988:	mov    %r8,%r15
   6298b:	jbe    62970 <fastgzip::enc::scan::<13, true, false>+0x7f0>
   6298d:	cmp    %rcx,%r8
   62990:	jae    627d6 <fastgzip::enc::scan::<13, true, false>+0x656>
   62996:	cs nopw 0x0(%rax,%rax,1)
   629a0:	movzbl (%rdx,%r8,1),%ebp
   629a5:	cmp    (%rsi,%r8,1),%bpl
   629a9:	jne    627d6 <fastgzip::enc::scan::<13, true, false>+0x656>
   629af:	inc    %r8
   629b2:	cmp    %r8,%rcx
   629b5:	jne    629a0 <fastgzip::enc::scan::<13, true, false>+0x820>
   629b7:	mov    %rcx,%r8
   629ba:	jmp    627d6 <fastgzip::enc::scan::<13, true, false>+0x656>
   629bf:	xor    %r8,%rbp
   629c2:	tzcnt  %rbp,%r8
   629c7:	shr    $0x3,%r8d
   629cb:	add    %r15,%r8
   629ce:	jmp    627d6 <fastgzip::enc::scan::<13, true, false>+0x656>
   629d3:	and    $0xfffffffe,%ebp
   629d6:	xor    %ebx,%ebx
   629d8:	mov    0x60(%rsp),%r12
   629dd:	cmpb   $0x0,0x68(%rsp)
   629e2:	jne    622a0 <fastgzip::enc::scan::<13, true, false>+0x120>
   629e8:	jmp    622bf <fastgzip::enc::scan::<13, true, false>+0x13f>
   629ed:	mov    %r10,%rbx
   629f0:	mov    %r8,%r12
   629f3:	mov    (%rsp),%r14
   629f7:	jmp    622f5 <fastgzip::enc::scan::<13, true, false>+0x175>
   629fc:	lea    0x5ca65(%rip),%rdx        # bf468 <anon.9d8ef70180f99d61d317e85a697ff310.22.llvm.15343169443087543179+0x480>
   62a03:	mov    $0x240,%esi
   62a08:	mov    %rbx,%rdi
   62a0b:	call   *0x5efef(%rip)        # c1a00 <_DYNAMIC+0x3d0>
   62a11:	int3
   62a12:	int3
   62a13:	int3
   62a14:	int3
   62a15:	int3
   62a16:	int3
   62a17:	int3
   62a18:	int3
   62a19:	int3
   62a1a:	int3
   62a1b:	int3
   62a1c:	int3
   62a1d:	int3
   62a1e:	int3
   62a1f:	int3
