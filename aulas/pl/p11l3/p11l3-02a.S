@rotines to interact with a C program

.include	"equs.S"
.include	"macros.S"

.global		addasm, showasm, factorial			@export the labels for the C program

@.p2align 	2
.type    	addasm, %function
.type    	showasm, %function
.type    	factorial, %function
	 
@.section	.text
@code----------------------------------------------------------------------------~
addasm:		.fnstart
			stmfd sp!, {lr}			@push lr to stack
			
			add r0, r0, r1			@R0 with variable a value and R1 with b. Return value is in R0
@			bx lr					@return to C code
@			return
			ldmfd sp!, {pc}			@pop pc (lr) from stack
			.fnend

showasm:	.fnstart
@			pushfuncregs			@preserve R4-R11 and LR
@			push r7
			stmfd sp!, {r7, lr}		@push r7, lr to stack

			mov r7, #OS_WRITE
			mov r0, #OS_STDOUT
			ldr r1, =msg			@R1 with message address
			mov r2, #21				@R2 with message length
			swi 0
			
@			pop r7
@			popfuncregs				@restore R4-R11 and LR
@			bx lr					@return to C code
			ldmfd sp!, {r7, pc}		@pop r7, pc (lr) from stack
			.fnend

factorial:	.fnstart
			stmfd sp!, {lr}		@push lr to stack
			stmfd sp!, {r0}		@push r0 (actual value ) to stack

			cmp r0, #1
			beq factend
			sub r0, r0, #1
			bl factorial
factend:	mov r1, r0
			ldmfd sp!, {r0}			@restore r0 from stack
			mul r0, r0, r1
			ldmfd sp!, {pc}			@pop pc (lr) from stack
			.fnend

@data---------------------------------------------------------------------------
.section	.data
msg:		.ascii "This is the assembly\n"

.end
