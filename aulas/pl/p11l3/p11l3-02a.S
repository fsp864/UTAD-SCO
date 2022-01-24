@rotines to interact with a C program

.include	"equs.S"
.include	"macros.S"
									@export the labels for the C program
.global		addasm, showasm, factorial, movepoint

@.p2align 	2
.type    	addasm, %function
.type    	showasm, %function
.type    	factorial, %function
.type    	movepoint, %function
	 
@.section	.text
@code----------------------------------------------------------------------------~
addasm:		.fnstart
			stmfd sp!, {lr}			@push LR to stack
			
			add r0, r0, r1			@R0 with variable a value and R1 with b. Return value is in R0
@			bx lr					@return to C code
@			return
			ldmfd sp!, {pc}			@pop PC (LR) from stack
			.fnend

showasm:	.fnstart
@			pushfuncregs			@preserve R4-R11 and LR
@			push r7
			stmfd sp!, {r7, lr}		@push R7, LR to stack

			mov r7, #OS_WRITE
			mov r0, #OS_STDOUT
			ldr r1, =msg			@R1 with message address
			mov r2, #21				@R2 with message length
			swi 0
			
@			pop r7
@			popfuncregs				@restore R4-R11 and LR
@			bx lr					@return to C code
			ldmfd sp!, {r7, pc}		@pop R7, PC (LR) from stack
			.fnend

factorial:	.fnstart
			stmfd sp!, {lr}			@push LR to stack
			stmfd sp!, {r0}			@push R0 (actual value ) to stack

			cmp r0, #1
			beq factend
			sub r0, r0, #1
			bl factorial
factend:	mov r1, r0
			ldmfd sp!, {r0}			@restore R0 from stack
@			mul r0, r0, r1			@destination / source 1 must be diferente
			mul r0, r1, r0			@R0 = (n - 1)! * n
@			mul r2, r1, r0			@R2 = (n-1)! * n
@			mov r0, r2				@return  n! in R0
			ldmfd sp!, {pc}			@pop PC (LR) from stack
			.fnend

@R0: pointer to matriz or struct Point3D 
@R1: X offset
@R2: Y offset
@R3: Z offset
.equ		Xcoord, 0
.equ		Ycoord, 4
.equ		Zcoord, 8

movepoint:	.fnstart
			stmfd sp!, {r4-r6, lr}			@push R4-R6 and LR to stack

			ldr r4, [r0, #Xcoord]			@get X to R4
			ldr r5, [r0, #Ycoord]			@get Y to R5
			ldr r6, [r0, #Zcoord]			@get Z to R6

			add r4, r4, r1					@X = X + OffsetX (R1)
			add r5, r5, r2					@Y = Y + OffsetY (R2)
			add r6, r6, r3					@Z = Z + OffsetZ (R3)

			str r4, [r0, #Xcoord]			@save result in struct (X, Y, Z)
			str r5, [r0, #Ycoord]
			str r6, [r0, #Zcoord]
			
			ldmfd sp!, {r4-r6, pc}			@pop R4-R6 and PC (LR) from stack
			.fnend

@data---------------------------------------------------------------------------
.section	.data
msg:		.ascii "This is the assembly\n"


.end
