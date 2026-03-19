	.file	"asgn5.c"        #File name
	.text                    #begin code
	.section	.rodata      #read only data
.LC0:
	.string	"%d "            #string format for printf
	.text                    #end code
	.globl	main             #main()
	.type	main, @function  #main is a function
main:
.LFB0:
	.cfi_startproc           
	endbr64                  #security instruction
	pushq	%rbp             #push old base pointer
	.cfi_def_cfa_offset 16   
	.cfi_offset 6, -16       
	movq	%rsp, %rbp       #new stack frame
	.cfi_def_cfa_register 6
	subq	$48, %rsp        #reserve 48 bytes of space for local variables
	
	#canary setup

	movq	%fs:40, %rax     #load canary
	movq	%rax, -8(%rbp)   #store canary
	xorl	%eax, %eax       #xor eax (sets to 0)

	#initialize arr

	movl	$1, -32(%rbp)    #writes 1 to rbp-32 (arr[0] = 1)
	movl	$2, -28(%rbp)    #arr[1] = 2
	movl	$3, -24(%rbp)    #arr[2] = 3
	movl	$4, -20(%rbp)    #arr[3] = 4
	movl	$5, -16(%rbp)    #arr[4] = 5
	movl	$5, -36(%rbp)    # 20/4 = size of arr (5)
	
	#loop index
	movl	$0, -44(%rbp)    # i=0
	jmp	.L2                  #jump to loop

	# loop 1 (squares)
.L3:
	#loads i
	movl	-44(%rbp), %eax  #copy i to eax
	cltq                     #convert long to quad
	leaq	0(,%rax,4), %rdx #byte offset rdx = i*4
	leaq	-32(%rbp), %rax  #rax = base address of arr (32bit values on the stack)
	addq	%rdx, %rax       #rax = &arr[i]
	movl	(%rax), %edx     #edx = arr[i]
	
	#loads i again for compiler
	movl	-44(%rbp), %eax  
	cltq
	leaq	0(,%rax,4), %rcx 
	leaq	-32(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax

	movl	-44(%rbp), %ecx  #ecx = i
	movslq	%ecx, %rcx       #sign extend form 32 to 64 bits
	leaq	0(,%rcx,4), %rsi #rsi = i*4
	leaq	-32(%rbp), %rcx  #rcx is base of arr
	addq	%rsi, %rcx       #rcx = &arr[i]
	imull	%edx, %eax       #imull = signed 32bit (eax = edx * eax (squares))
	movl	%eax, (%rcx)     #arr[i] = new squared value
	addl	$1, -44(%rbp)    #i++ by adding

#condition i < size
.L2:
	movl	-44(%rbp), %eax  #eax is i
	cmpl	-36(%rbp), %eax  #compare values
	jl	.L3                  #jump if less
	
	#loop 2 print each element

	movl	$0, -40(%rbp)    #j=0
	jmp	.L4                  #jump to print loop condition
.L5:
	#load j
	movl	-40(%rbp), %eax  #eax = j
	cltq                     #extend to 64
	
	#&arr[j]
	leaq	0(,%rax,4), %rdx #rdx = j*4
	leaq	-32(%rbp), %rax  #rax = base arr
	addq	%rdx, %rax       #rax = &arr[j]

	#load arr[j]
	movl	(%rax), %eax     #eax = arr[j]
	movl	%eax, %esi       #esi = arr[j] (2nd argument)
	
	#string format
	leaq	.LC0(%rip), %rax #rax = address of "%d "
	movq	%rax, %rdi       #rdi = format string (1st argument)
	movl	$0, %eax         #clear eax
	call	printf@PLT       #calls printf
	addl	$1, -40(%rbp)    #j++

#print loop
.L4:
	movl	-40(%rbp), %eax  #eax = j
	cmpl	-36(%rbp), %eax  #compare j<size
	jl	.L5                  #loop if true
	
	#print newline (\n)
	movl	$10, %edi        #edi = 10 (\n)
	call	putchar@PLT      #prints newline
	
	#return 0 and check canary
	movl	$0, %eax         #return = 0
	movq	-8(%rbp), %rdx   #load canary
	subq	%fs:40, %rdx     #compare with current canary
	je	.L7                  #jump if equal
	call	__stack_chk_fail@PLT #if not equal abort program
.L7:
	leave                    #restore rbp and rsp
	.cfi_def_cfa 7, 8        
	ret                      #return from main
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
