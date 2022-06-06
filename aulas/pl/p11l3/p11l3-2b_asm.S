.global		code_decode_text_asm				@export the labels for others modules including the C ones
.type    	code_decode_text_asm, %function
	 
.equ		ITEMSIZE, 1
.section	.text
@code----------------------------------------------------------------------------~
code_decode_text_asm:
			.fnstart
cdloop:		ldrb r2, [r0]				@get item to R2 and go to next
			cmp r2, #0					@check if end of string
			beq endloop
cdthen:		add r2, r1					@add key to char
			strb r2, [r0], #ITEMSIZE	@sore and go to next item
			b cdloop					@process next item
endloop:	bx lr						@return to C code
			.fnend
.end
