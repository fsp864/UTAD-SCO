.include "macros.S"

.global		cfunction_asm
.type    	cfunction_asm, %function

.section	.text
@code----------------------------------------------------------------------------~
cfunction_asm:
			.fnstart
			push lr
			stmfd sp!, {r0-r2}	@push R0-R2 to stack			
			ldr r0, =msg
			bl puts
			ldmfd sp!, {r0-r2}	@pop R0-R2 from stack

			mov lr, pc  @2 x MOV to do sort of BL R2
			mov pc, r2	@call cadd function in R2. R0 and R1 with a and b values
ret_addr:	pop lr
			return		@R0 with sum already
			.fnend

.section	.data
@code----------------------------------------------------------------------------~
msg:		.asciz	"ASM: Just calling cadd(R0, R1)"

.end
