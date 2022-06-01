.include "macros.S"

.global		min_asm, max_asm
.type    	min_asm, %function
.type    	max_asm, %function
	 
.section	.text
@code----------------------------------------------------------------------------~
min_asm:	.fnstart
			ldr r2, [r0], #1*4	@get 1st value from v (R0) and go to next
			sub r1, r1, #1		@decrement NELEM (R1)
loopmin:	ldr r3, [r0], #1*4	@next element of v in R3 and go to next
			cmp r3, r2			@if lesser than actual (R2)
			movlt r2, r3		@then R2 with R3
			subs r1, r1, #1		@checked 1 more
			bne	loopmin			@if more go back
			mov r0, r2			@return maximum to C in R0
			return				@return to C code
			.fnend

max_asm:	.fnstart
			ldr r2, [r0], #1*4	@get 1st value from v (R0) and go to next
			sub r1, r1, #1		@decrement NELEM (R1)
loopmax:	ldr r3, [r0], #1*4	@next element of v in R3 and go to next
			cmp r3, r2			@if greater than actual (R2)
			movgt r2, r3		@then R2 with R3
			subs r1, r1, #1		@checked 1 more
			bne	loopmax			@if more go back
			mov r0, r2			@return maximum to C in R0
			return				@return to C code
			.fnend
.end
