@program to interact with a C function
.include	"equs.S"
.global		_start
.section	.text
@program entry------------------------------------------------------------------
_start:		mov r7, #OS_WRITE
			mov r0, #OS_STDOUT
			ldr r1, =msg			@R1 with message address
			mov r2, #21				@R2 with message length
			swi 0
			
			str lr, [sp, #-1*4]!	@preserve LR in stack
			bl cfunction			@call the cfunction in C
			ldr lr, [sp], #+1*4		@restore LR from stack

exit:		mov r7, #OS_EXIT
			mov r0, #NORMAL
			swi 0
@data---------------------------------------------------------------------------
.section	.data
msg:		.ascii "This is the assembly\n"
.end

