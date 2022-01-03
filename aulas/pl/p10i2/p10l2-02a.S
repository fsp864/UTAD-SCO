@rotines to interact with a C program

.include	"equs.S"
.include	"macros.S"

.global		addasm, showasm			@export the labels for the C program

@.p2align 	2
.type    	showasm, %function
.type    	addasm, %function
	 
@.section	.text
@code----------------------------------------------------------------------------~
addasm:		.fnstart
			add r0, r0, r1			@R0 with variable a value and R1 with b. Return value is in R0
@			bx lr					@return to C code
			return
			.fnend

showasm:	.fnstart
@			pushfuncregs			@preserve R4-R11 and LR
			push r7

			mov r7, #OS_WRITE
			mov r0, #OS_STDOUT
			ldr r1, =msg			@R1 with message address
			mov r2, #21				@R2 with message length
			swi 0
			
			pop r7
@			popfuncregs				@restore R4-R11 and LR
@			bx lr					@return to C code
			return
			.fnend

@data---------------------------------------------------------------------------
.section	.data
msg:		.ascii "This is the assembly\n"

.end
