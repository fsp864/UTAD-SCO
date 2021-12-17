@program to interact with a C function and printf direct call

.include	"equs.S"
.include	"macros.S"

.global		_start

.section	.text
@program entry------------------------------------------------------------------
_start:		push lr
			mov R0, #15				@ a_r0 wuth R0
			mov R1, #10				@ b_r1 with R1
			bl cadd					@call the cadd
			pop lr					@not needed

			push lr					@not needed
			mov r1, r0				@save return value frpm cadd in R1
			ldr r0, =sformat		@printf arg 0 in r0 (formatting string)
			bl  printf				@call stdlib printf   
			pop lr

exit:		mov r7, #OS_EXIT
			mov r0, #NORMAL
			swi 0

@data---------------------------------------------------------------------------
.section	.data
sformat:	.asciz "Return from cadd C function is %d\n"

.end
