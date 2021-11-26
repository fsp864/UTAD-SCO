@usefull fuctions

.global		hex2str
.global		h2sbuffer

.section	.text					@section for the functions code
@subrotines---------------------------------------------------------------------
hex2str:	ldr	r4, =(h2sbuffer + 8)
			ldr	r2, =0x0000000f
			mov	r3, #8
looph2s:	and	r1, r0, r2
			cmp	r1, #10
			blt	digit
			add	r1, r1, #7			@offset from '0' to 'A'
digit:		add	r1, r1, #'0'		@offset to '0'
			strb r1, [r4, #-1]!
			mov	r0, r0, asr #4
			subs r3, r3, #1
			bne	looph2s
			bx lr

.section	.data					@section .data for the data/variables
@subrotines data----------------------------------------------------------------
h2sbuffer:	.ascii "--------h\n"
