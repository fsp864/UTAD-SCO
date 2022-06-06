.global		vectorsize_asm				@export the labels for others modules including the C ones
.type    	vectorsize_asm, %function
	 
.equ		ITEMSIZE, 4
.section	.text
@code----------------------------------------------------------------------------~
vectorsize_asm:
			.fnstart
			mov r1, #-1				@start with -1 (because end zero)
vsloop:		ldr r2, [r0], #ITEMSIZE	@get item to R2 and go to next
			add r1, #1				@count one more
			cmp r2, #0				@check if end
			bne vsloop				@if not 0 go back
			mov r0, r1				@return value in R0
			bx lr					@return to C code
			.fnend
.end
