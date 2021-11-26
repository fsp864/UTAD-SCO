@this is a comment
@dot means it is a directive for the assembler

.global		_start			@export the label for the programa entry

.section	.text			@section .text for the code
@program entry------------------------------------------------------------------
_start:		mov r7, #4		@system call "write" R7=4
			mov r0, #1		@R0 wuth file descriptor, 1 for standard output
			ldr r1, =msg	@R1 with message address
			mov r2, #11		@R2 wuth message lenght
			swi 0			@call system handler to write msg via software interrupt 0 

			str lr, [sp, #-1*4]! 
			ldr r0, =0x9876fedc
			bl hex2str
			ldr lr, [sp], #+1*4
			
			mov r7, #4			@system call "write" R7=4
			mov r0, #1			@R0 with file descriptor, 1 for standard output
			ldr r1, =h2sbuffer	@R1 with message address
			mov r2, #10			@R2 wuth message lenght
			swi 0				@call system handler to write msg via software interrupt 0

exit:		mov r7, #1		@system call "exit" R7=1
			mov r0, #0		@R0	exit value, 0 is for NORMAL
			swi 0			@call system handler to exut program software interrupt 0

@data---------------------------------------------------------------------------
.section	.data			@section .data for the data/variables
msg:		.ascii "Hello ARM!\n"

.end						@end not mandatory, can be omitted, next needed ti avoid as warning			
