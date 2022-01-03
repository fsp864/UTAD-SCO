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
<<<<<<< HEAD:aulas/pl/p10i2/p10l2-02a.S
			add r0, r0, r1			@R0 with variable a value and R1 with b. Return value is in R0
=======
			add r0, r0, r1			@R0 with variable a valu and R1 with b. Returm value is in R0

>>>>>>> 7b091d214f2a08884feee7ef0405823dd324a427:aulas/pl/p10l2/p10l2-02a.S
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
