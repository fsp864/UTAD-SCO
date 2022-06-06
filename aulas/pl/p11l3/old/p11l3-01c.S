@program to interact with a C function and printf direct call

.include	"equs.S"
.include	"macros.S"

.equ		VALOR1, 1100
.equ		VALOR2, 1200

.global		_start

.section	.text
@program entry------------------------------------------------------------------
_start:		mov R0, #VALOR1			@ a_r0 with R0
			mov R1, #VALOR2			@ b_r1 with R1
			@push lr
			@bl cadd				@call the cadd
			@pop lr					@not needed
			call cadd

			mov r3, r0				@save return value frpm cadd in R3
			mov r1, #VALOR1
			mov r2, #VALOR2
			ldr r0, =sformat		@printf arg 0 in r0 (formatting string)
@			push lr					@not needed
@			bl  printf				@call stdlib printf
@			pop lr
@			call printf

			stmfd sp!, {lr}			@push lr to stack
			bl printf				@call stdlib printf
			ldmfd sp!, {lr}			@pop ld from stack

exit:		mov r7, #OS_EXIT
			mov r0, #NORMAL
			swi 0

@data---------------------------------------------------------------------------
.section	.data
sformat:	.asciz "Return from cadd (%d + %d) C function is %d\n"

.end
