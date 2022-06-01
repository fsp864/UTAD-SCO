.include "macros.S"

.global		fill2D_asm
.type    	fill2D_asm, %function
	 
.section	.text
@code----------------------------------------------------------------------------~
fill2D_asm:	.fnstart
			mul r3, r1, r2		@total elementes
			mov r1, #0			@ser satrt values
loop:		str r1, [r0], #1*4	@stor value and next position
			add r1, r1, #1		@next value
			subs r3, r3, #1		@one less element
			bne loop	
			return				@return to C code
			.fnend
.end
