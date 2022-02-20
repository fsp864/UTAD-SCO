@usefull fuctions

.global		hex2str

.section	.text					@section for the functions code
@subrotines---------------------------------------------------------------------
@input	: R0 = value, R1 = string address
@output	: none
@changed: R0, R1, R2, R3, R4
@purpose: convert 32bit value to hex string (8 char)
hex2str:	add	r1, r1, #8			@go to the end of string
			ldr	r2, =0x0000000f		@mask for lower 4bit
			mov	r3, #8				@number of hex chars
looph2s:	and	r4, r0, r2			@extrat lower gex digit
			cmp	r4, #10				@check if is ABCDEF
			blt	digit				@if not just add '0'
			add	r4, r4, #7			@offset from '0' to 'A'
digit:		add	r4, r4, #'0'		@offset to '0'
			strb r4, [r1, #-1]!		@save in string -1, pre decrement
			mov	r0, r0, asr #4		@shift one hex char right 
			subs r3, r3, #1			
			bne	looph2s
			bx lr
			
