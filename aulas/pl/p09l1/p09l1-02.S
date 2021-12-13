@program includes a section for functions

.global		_start				@export the label for the programa entry

.section	.text				@section .text for the code
@subrotines---------------------------------------------------------------------
hex2str:	add	r1, r1, #8		@go to the end
			ldr	r2, =0x0000000f
			mov	r3, #8
looph2s:	and	r4, r0, r2
			cmp	r4, #10
			blt	digit
			add	r4, r4, #7		@offset from '0' to 'A'
digit:		add	r4, r4, #'0'	@offset to '0'
			strb r4, [r1, #-1]!
			mov	r0, r0, asr #4
			subs r3, r3, #1
			bne	looph2s
			bx lr

@program entry------------------------------------------------------------------
_start:		mov r7, #4			@system call "write" R7=4
			mov r0, #1			@R0 with file descriptor, 1 for standard output
			ldr r1, =msg		@R1 with message address
			mov r2, #11			@R2 with message length
			swi 0				@call system handler to write msg via software interrupt 0
			
			str lr, [sp, #-1*4]!	@preserev LR in stack
			ldr r0, =0x9876fedc		@value
			ldr	r1, =value			@string location
			bl hex2str				@convert
			ldr lr, [sp], #+1*4		@restor LR
			
			mov r7, #4			@system call "write" R7=4
			mov r0, #1			@R0 with file descriptor, 1 for standard output
			ldr r1, =value		@R1 with message address
			mov r2, #10			@R2 with message length
			swi 0				@call system handler to write msg via software interrupt 0

exit:		mov r7, #1			@system call "exit" R7=1
			mov r0, #0			@R0	exit value, 0 is for NORMAL
			swi 0				@call system handler to exit program software interrupt 0

@data---------------------------------------------------------------------------
.section	.data				@section .data for the data/variables
msg:		.ascii "Hello ARM!\n"
value:		.ascii "--------h\n"

.end							@end not mandatory, can be omitted, next needed ti avoid as warning			
