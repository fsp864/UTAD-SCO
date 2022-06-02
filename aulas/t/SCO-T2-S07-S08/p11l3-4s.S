.global		add3Ddelta_asm
.type    	add3Ddelta_asm, %function

.equ 		XCOORD, 0*4
.equ 		YCOORD, 1*4
.equ 		ZCOORD, 2*4

.section	.text
@code----------------------------------------------------------------------------~
add3Ddelta_asm:
			.fnstart
			stmfd sp!, {r4-r6, lr}	@push R4-R6 and LR to stack

			ldr r4, [r0, #XCOORD]	@get xcoord from point
			ldr r5, [r0, #YCOORD]	@get ycoord from point
			ldr r6, [r0, #ZCOORD]	@get zcoord from point

			add r4, r1				@add dx
			add r5, r2				@add dy
			add r6, r3				@add dx

			str r4, [r0, #XCOORD]	@store xcoord in point
			str r5, [r0, #YCOORD]	@store ycoord in point
			str r6, [r0, #ZCOORD]	@store zcoord in point

			ldmfd sp!, {r4-r6, pc}	@pop R4-R6 and PC (LR) from stack
			.fnend
.end
