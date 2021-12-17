@program to interact with a C function

.include	"equs.S"
.include	"macros.S"

.global		_start					@export the label for the programa entry

.section	.text					@section .text for the code
@program entry------------------------------------------------------------------
_start:		mov r7, #OS_WRITE
			mov r0, #OS_STDOUT
			ldr r1, =msg			@R1 with message address
			mov r2, #21				@R2 with message length
			swi 0
			
@			str lr, [sp, #-1*4]!	@presere LR in stack
			push lr
			bl cfunction			@call the cfunction in C
			pop lr
@			ldr lr, [sp], #+1*4		@restore LR from stack

exit:		mov r7, #OS_EXIT
			mov r0, #NORMAL
			swi 0

@data---------------------------------------------------------------------------
.section	.data					@section .data for the data/variables
msg:		.ascii "This is the assembly\n"

.end								@end not mandatory, can be omitted, next needed ti avoid as warning			
