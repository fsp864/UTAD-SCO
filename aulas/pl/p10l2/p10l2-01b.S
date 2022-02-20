@program to interact with a C function and printf direct call

.include	"equs.S"
.include	"macros.S"

.global		_start

.section	.text
@program entry------------------------------------------------------------------
_start:		mov r7, #OS_WRITE
			mov r0, #OS_STDOUT
			ldr r1, =msg			@R1 with message address
			mov r2, #21				@R2 with message length
			swi 0

@			push lr
@			bl cfunction			@call the cfunction in C
@			pop lr					@not needed
			call cfunction

			ldr r0, =sformat		@printf arg 0 in r0 (formatting string)
			mov r1, #1				@printf arg 1 in R1
			mov r2, #22				@printf arg 2 in R2
			ldr r3, =argstr			@printf arg 3 in R3 is a string (address)
			@ldr r3, =text
@			push lr					@not needed
@			bl  printf				@call stdlib printf   
@			pop lr
			call  printf

exit:		mov r7, #OS_EXIT
			mov r0, #NORMAL
			swi 0

@data---------------------------------------------------------------------------
.section	.data
msg:		.ascii "This is the assembly\n"
sformat:	.asciz "This is the direct call to printf:\n\tR1: %d\n\tR2: %d\n\tR3: \"%s\"\n"
argstr:		.asciz "string arg for printf"

.end
