.include "macros.S"

.global		cfunction_asm
.type    	cfunction_asm, %function

.section	.text
@code----------------------------------------------------------------------------~
cfunction_asm:
			.fnstart
			push lr
			mov lr, pc
			add lr, lr, #4 * 1	@point lr to ret_addr / over next instrution
			mov pc, r2			@call cadd function in R2. R0 and R0 with a and b values
ret_addr:	pop lr
			return				@R0 with sum already
			.fnend
.end
