.global		reverse_asm				@export the labels for others modules including the C ones

.type    	reverse_asm, %function
	 
.section	.text
@code----------------------------------------------------------------------------~
reverse_asm:
			.fnstart
			ldr r2, [r0]			@get first argument to R2
			ldr r3, [r1]			@get second argument to R3
			str r3, [r0]			@put R3 in first argument position
			str r2, [r1]			@put R2 in fsecond argument position
			bx lr					@return to C code
			.fnend
.end
